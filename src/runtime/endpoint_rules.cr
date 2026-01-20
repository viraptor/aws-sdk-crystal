require "json"

module AwsSdk
  module Runtime
    class EndpointRuleError < Exception
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
      def self.load(path : String) : PartitionProvider
        data = JSON.parse(File.read(path)).as_h
        new(data)
      end

      def initialize(@data : Hash(String, JSON::Any))
      end

      def resolve(region : String) : JSON::Any?
        partitions = @data["partitions"]?.try(&.as_a) || [] of JSON::Any
        partitions.each do |partition_any|
          partition = partition_any.as_h
          regions = partition["regions"]?.try(&.as_h)
          regex = partition["regionRegex"]?.try(&.as_s)
          if (regions && regions.has_key?(region)) || (regex && Regex.new(regex).matches?(region))
            return JSON::Any.new(build_partition_result(partition))
          end
        end
        nil
      end

      def default_dns_suffix : String
        partitions = @data["partitions"]?.try(&.as_a) || [] of JSON::Any
        partition = partitions.first?.try(&.as_h)
        defaults = partition.try(&.["defaults"]?.try(&.as_h))
        partition.try(&.["dnsSuffix"]?.try(&.as_s)) ||
          defaults.try(&.["dnsSuffix"]?.try(&.as_s)) ||
          "amazonaws.com"
      end

      private def build_partition_result(partition : Hash(String, JSON::Any)) : Hash(String, JSON::Any)
        defaults = partition["defaults"]?.try(&.as_h)
        variants = defaults.try(&.["variants"]?.try(&.as_a)) || [] of JSON::Any

        dns_suffix = partition["dnsSuffix"]?.try(&.as_s) ||
          defaults.try(&.["dnsSuffix"]?.try(&.as_s)) || ""

        dualstack_variant = variants.find do |variant_any|
          tags = variant_any.as_h["tags"]?.try(&.as_a.map(&.as_s)) || [] of String
          tags.includes?("dualstack") && !tags.includes?("fips")
        end

        dualstack_dns_suffix = dualstack_variant.try(&.as_h["dnsSuffix"]?.try(&.as_s)) || dns_suffix
        supports_dualstack = variants.any? do |variant_any|
          tags = variant_any.as_h["tags"]?.try(&.as_a.map(&.as_s)) || [] of String
          tags.includes?("dualstack")
        end
        supports_fips = variants.any? do |variant_any|
          tags = variant_any.as_h["tags"]?.try(&.as_a.map(&.as_s)) || [] of String
          tags.includes?("fips")
        end

        {
          "dnsSuffix" => JSON::Any.new(dns_suffix),
          "dualStackDnsSuffix" => JSON::Any.new(dualstack_dns_suffix),
          "supportsDualStack" => JSON::Any.new(supports_dualstack),
          "supportsFIPS" => JSON::Any.new(supports_fips),
        }
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
        context = RuleContext.new(normalize_params(params), @partitions)
        result = resolve_rules(@rule_set.rules, context)
        return result if result

        raise EndpointRuleError.new("No endpoint could be resolved")
      end

      private def normalize_params(params : Hash(String, JSON::Any)) : Hash(String, JSON::Any)
        normalized = params.dup
        definitions = @rule_set.parameters

        params.each_key do |key|
          next if definitions.has_key?(key)

          raise EndpointRuleError.new("Unsupported endpoint parameter: #{key}")
        end

        definitions.each do |name, param_any|
          next if normalized.has_key?(name)

          param = param_any.as_h
          if (default = param["default"]?)
            normalized[name] = default
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
        truthy?(value)
      end

      private def evaluate_function(function : Hash(String, JSON::Any), context : RuleContext) : JSON::Any?
        fn = function["fn"].as_s
        argv = function["argv"]?.try(&.as_a) || [] of JSON::Any

        case fn
        when "isSet"
          arg = resolve_value(argv[0]?, context)
          JSON::Any.new(!arg.nil?)
        when "booleanEquals"
          left = value_as_bool(resolve_value(argv[0]?, context))
          right = value_as_bool(resolve_value(argv[1]?, context))
          JSON::Any.new(!left.nil? && left == right)
        when "stringEquals"
          left = value_as_string(resolve_value(argv[0]?, context))
          right = value_as_string(resolve_value(argv[1]?, context))
          JSON::Any.new(!left.nil? && left == right)
        when "not"
          arg = resolve_value(argv[0]?, context)
          JSON::Any.new(!truthy?(arg))
        when "getAttr"
          source = resolve_value(argv[0]?, context)
          key = value_as_string(resolve_value(argv[1]?, context))
          get_attr(source, key)
        when "aws.partition"
          region = value_as_string(resolve_value(argv[0]?, context))
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

        if (hash = value.as_h?)
          if hash["ref"]?
            ref_value = context.resolve_ref(hash["ref"].as_s)
            return value_to_string(ref_value)
          end

          if hash["fn"]?
            evaluated = evaluate_function(hash, context)
            return value_to_string(evaluated)
          end
        end

        value_to_string(value)
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
          value = get_attr(value, attr)
        end
        value_to_string(value)
      end

      private def resolve_value(value : JSON::Any?, context : RuleContext) : JSON::Any?
        return nil unless value
        if (hash = value.as_h?)
          if (ref = hash["ref"]?)
            return context.resolve_ref(ref.as_s)
          end
          if hash["fn"]?
            return evaluate_function(hash, context)
          end
        end
        value
      end

      private def get_attr(source : JSON::Any?, key : String?) : JSON::Any?
        return nil unless source && key
        return nil unless (hash = source.as_h?)

        hash[key]?
      end

      private def truthy?(value : JSON::Any?) : Bool
        return false unless value
        case value.raw
        when Nil
          false
        when Bool
          value.as_bool
        else
          true
        end
      end

      private def value_as_bool(value : JSON::Any?) : Bool?
        value.try(&.as_bool?)
      end

      private def value_as_string(value : JSON::Any?) : String?
        return nil unless value
        value.as_s?
      end

      private def value_to_string(value : JSON::Any?) : String
        raise EndpointRuleError.new("Missing value for endpoint template") unless value
        case value.raw
        when Nil
          raise EndpointRuleError.new("Missing value for endpoint template")
        when String
          value.as_s
        when Bool
          value.as_bool ? "true" : "false"
        when Int64, Float64
          value.raw.to_s
        else
          value.to_json
        end
      end
    end

    class RuleContext
      getter params : Hash(String, JSON::Any)
      getter partitions : PartitionProvider

      def initialize(@params : Hash(String, JSON::Any), @partitions : PartitionProvider)
        @assigned = {} of String => JSON::Any
      end

      def assign(name : String, value : JSON::Any?) : Nil
        return unless value
        @assigned[name] = value
      end

      def resolve_ref(name : String) : JSON::Any?
        @assigned[name]? || @params[name]?
      end
    end
  end
end
