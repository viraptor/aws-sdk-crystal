require "json"

module Aws
  module Runtime
    class EndpointRuleError < Exception
    end

    struct EndpointValue
      alias Raw = String | Bool | Hash(String, EndpointValue) | Nil

      getter raw : Raw

      def initialize(@raw : Raw)
      end

      def self.from_json(value : JSON::Any?) : EndpointValue?
        return nil unless value
        case raw = value.raw
        when Nil
          EndpointValue.new(nil)
        when String
          EndpointValue.new(raw)
        when Bool
          EndpointValue.new(raw)
        when Hash
          h = {} of String => EndpointValue
          raw.each do |k, v|
            converted = from_json(v)
            h[k.to_s] = converted if converted
          end
          EndpointValue.new(h)
        else
          nil
        end
      end

      def as_s? : String?
        raw.as?(String)
      end

      def as_s : String
        raw.as(String)
      end

      def as_bool? : Bool?
        raw.as?(Bool)
      end

      def as_h? : Hash(String, EndpointValue)?
        raw.as?(Hash(String, EndpointValue))
      end

      def [](key : String) : EndpointValue?
        as_h?.try(&.[key]?)
      end

      def truthy? : Bool
        case r = raw
        when Nil  then false
        when Bool then r
        else true
        end
      end

      def to_template_string : String
        case r = raw
        when String then r
        when Bool   then r ? "true" : "false"
        else
          raise EndpointRuleError.new("Cannot stringify endpoint value: #{r.inspect}")
        end
      end
    end

    struct EndpointRuleSet
      getter raw : Hash(String, JSON::Any)

      def initialize(@raw : Hash(String, JSON::Any))
      end

      def version : String?
        raw["version"]?.try(&.as_s)
      end

      def parameters : Hash(String, JSON::Any)
        raw["parameters"]?.try(&.as_h) || {} of String => JSON::Any
      end

      def rules : Array(JSON::Any)
        raw["rules"]?.try(&.as_a) || [] of JSON::Any
      end
    end

    struct EndpointResult
      getter url : String
      getter headers : Hash(String, String)
      getter properties : Hash(String, String)

      def initialize(
        @url : String,
        @headers : Hash(String, String) = {} of String => String,
        @properties : Hash(String, String) = {} of String => String
      )
      end
    end

    class PartitionProvider
      def self.default : PartitionProvider
        new(PartitionsData::ALL, PartitionsData::DEFAULT_DNS_SUFFIX)
      end

      def initialize(
        @partitions : Array(PartitionsData::Partition) = PartitionsData::ALL,
        @default_dns_suffix : String = PartitionsData::DEFAULT_DNS_SUFFIX
      )
      end

      def resolve(region : String) : EndpointValue?
        @partitions.each do |partition|
          next unless partition.regions.includes?(region) || partition.region_regex.matches?(region)
          return EndpointValue.new({
            "dnsSuffix"          => EndpointValue.new(partition.dns_suffix),
            "dualStackDnsSuffix" => EndpointValue.new(partition.dualstack_dns_suffix),
            "supportsDualStack"  => EndpointValue.new(partition.supports_dualstack),
            "supportsFIPS"       => EndpointValue.new(partition.supports_fips),
          })
        end
        nil
      end

      def default_dns_suffix : String
        @default_dns_suffix
      end
    end

    class EndpointRulesEngine
      def initialize(@rule_set : EndpointRuleSet, @partitions : PartitionProvider)
        version = @rule_set.version
        unless version == "1.0"
          raise ArgumentError.new("Unsupported endpoint rule set version: #{version || "unknown"}")
        end
      end

      def resolve(params : Hash(String, JSON::Any)) : EndpointResult
        typed_params = normalize_params(params)
        context = RuleContext.new(typed_params, @partitions)
        result = resolve_rules(@rule_set.rules, context)
        return result if result

        raise EndpointRuleError.new("No endpoint could be resolved")
      end

      private def normalize_params(params : Hash(String, JSON::Any)) : Hash(String, EndpointValue)
        definitions = @rule_set.parameters

        params.each_key do |key|
          next if definitions.has_key?(key)

          raise EndpointRuleError.new("Unsupported endpoint parameter: #{key}")
        end

        normalized = {} of String => EndpointValue
        params.each do |key, value|
          converted = EndpointValue.from_json(value)
          normalized[key] = converted if converted
        end

        definitions.each do |name, param_any|
          next if normalized.has_key?(name)

          param = param_any.as_h
          if (default = param["default"]?)
            converted = EndpointValue.from_json(default)
            normalized[name] = converted if converted
          elsif param["required"]?.try(&.as_bool?)
            raise EndpointRuleError.new("Missing required endpoint parameter: #{name}")
          end
        end
        normalized
      end

      private def resolve_rules(rules : Array(JSON::Any), context : RuleContext) : EndpointResult?
        rules.each do |rule_any|
          rule = rule_any.as_h
          conditions = rule["conditions"]?.try(&.as_a) || [] of JSON::Any
          next unless conditions_met?(conditions, context)

          case rule["type"].as_s
          when "tree"
            nested = rule["rules"]?.try(&.as_a) || [] of JSON::Any
            result = resolve_rules(nested, context)
            return result if result
          when "endpoint"
            endpoint_hash = rule["endpoint"]?.try(&.as_h) || {} of String => JSON::Any
            return resolve_endpoint(endpoint_hash, context)
          when "error"
            message = resolve_string_value(rule["error"], context)
            raise EndpointRuleError.new(message)
          else
            raise ArgumentError.new("Unknown endpoint rule type: #{rule["type"]?.try(&.as_s)}")
          end
        end
        nil
      end

      private def conditions_met?(conditions : Array(JSON::Any), context : RuleContext) : Bool
        return true if conditions.empty?

        conditions.all? do |condition_any|
          condition = condition_any.as_h
          evaluate_condition(condition, context)
        end
      end

      private def evaluate_condition(condition : Hash(String, JSON::Any), context : RuleContext) : Bool
        value = evaluate_function(condition, context)
        if (assign_any = condition["assign"]?)
          context.assign(assign_any.as_s, value)
        end
        value.try(&.truthy?) || false
      end

      private def evaluate_function(function : Hash(String, JSON::Any), context : RuleContext) : EndpointValue?
        fn = function["fn"].as_s
        argv = function["argv"]?.try(&.as_a) || [] of JSON::Any

        case fn
        when "isSet"
          arg = resolve_value(argv[0]?, context)
          EndpointValue.new(!arg.nil?)
        when "booleanEquals"
          left = resolve_value(argv[0]?, context).try(&.as_bool?)
          right = resolve_value(argv[1]?, context).try(&.as_bool?)
          EndpointValue.new(!left.nil? && left == right)
        when "stringEquals"
          left = resolve_value(argv[0]?, context).try(&.as_s?)
          right = resolve_value(argv[1]?, context).try(&.as_s?)
          EndpointValue.new(!left.nil? && left == right)
        when "not"
          arg = resolve_value(argv[0]?, context)
          EndpointValue.new(!(arg.try(&.truthy?) || false))
        when "getAttr"
          source = resolve_value(argv[0]?, context)
          key = resolve_value(argv[1]?, context).try(&.as_s?)
          source && key ? source[key] : nil
        when "aws.partition"
          region = resolve_value(argv[0]?, context).try(&.as_s?)
          region ? context.partitions.resolve(region) : nil
        else
          raise ArgumentError.new("Unsupported endpoint rule function: #{fn}")
        end
      end

      private def resolve_endpoint(endpoint : Hash(String, JSON::Any), context : RuleContext) : EndpointResult
        url_value = endpoint["url"]?
        raise EndpointRuleError.new("Endpoint rule missing url") unless url_value

        url = resolve_string_value(url_value, context)
        headers = resolve_string_map(endpoint["headers"]?, context)
        properties = resolve_string_map(endpoint["properties"]?, context)
        EndpointResult.new(url, headers, properties)
      end

      private def resolve_string_map(value : JSON::Any?, context : RuleContext) : Hash(String, String)
        return {} of String => String unless value

        map = value.as_h?
        return {} of String => String unless map

        map.each_with_object({} of String => String) do |(key, item), acc|
          acc[key] = resolve_string_value(item, context)
        end
      end

      private def resolve_string_value(value : JSON::Any, context : RuleContext) : String
        if (string = value.as_s?)
          return template_string(string, context)
        end

        evaluated = resolve_value(value, context)
        raise EndpointRuleError.new("Missing value for endpoint template") unless evaluated
        evaluated.to_template_string
      end

      private def template_string(template : String, context : RuleContext) : String
        template.gsub(/\{[^}]+\}/) do |match|
          token = match[1..-2]
          resolve_template_token(token, context)
        end
      end

      private def resolve_template_token(token : String, context : RuleContext) : String
        parts = token.split("#")
        ref_name = parts.shift
        raise EndpointRuleError.new("Empty template token") unless ref_name

        value = context.resolve_ref(ref_name)
        parts.each do |attr|
          value = value.try(&.[attr])
        end
        raise EndpointRuleError.new("Missing value for endpoint template") unless value
        value.to_template_string
      end

      private def resolve_value(value : JSON::Any?, context : RuleContext) : EndpointValue?
        return nil unless value
        if (hash = value.as_h?)
          if (ref = hash["ref"]?)
            return context.resolve_ref(ref.as_s)
          end
          if hash["fn"]?
            return evaluate_function(hash, context)
          end
        end
        EndpointValue.from_json(value)
      end
    end

    class RuleContext
      getter params : Hash(String, EndpointValue)
      getter partitions : PartitionProvider

      def initialize(@params : Hash(String, EndpointValue), @partitions : PartitionProvider)
        @assigned = {} of String => EndpointValue
      end

      def assign(name : String, value : EndpointValue?) : Nil
        return unless value
        @assigned[name] = value
      end

      def resolve_ref(name : String) : EndpointValue?
        @assigned[name]? || @params[name]?
      end
    end
  end
end
