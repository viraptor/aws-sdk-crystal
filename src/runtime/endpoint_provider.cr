require "json"

module Aws
  module Runtime
    class EndpointProvider
      def initialize(
        @endpoint_prefix : String,
        @rule_set_json : String?,
        @partitions : PartitionProvider = Partitions.provider
      )
      end

      def resolve(
        region : String,
        endpoint : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      ) : EndpointResult
        if endpoint
          raise ArgumentError.new("endpoint must not be empty") if endpoint.empty?
          return EndpointResult.new(endpoint)
        end

        if (rule_set_json = @rule_set_json)
          rule_set = EndpointRuleSet.new(JSON.parse(rule_set_json).as_h)
          engine = EndpointRulesEngine.new(rule_set, @partitions)
          params = {
            "Region"       => JSON::Any.new(region),
            "UseFIPS"      => JSON::Any.new(use_fips || false),
            "UseDualStack" => JSON::Any.new(use_dualstack || false),
          }
          return engine.resolve(params)
        end

        EndpointResult.new(fallback_endpoint(region))
      end

      private def fallback_endpoint(region : String) : String
        prefix = @endpoint_prefix
        raise ArgumentError.new("endpoint prefix must not be empty") if prefix.empty?

        partition = @partitions.resolve(region)
        dns_suffix = partition.try(&.as_h["dnsSuffix"]?.try(&.as_s)) || @partitions.default_dns_suffix
        "https://#{prefix}.#{region}.#{dns_suffix}"
      end
    end
  end
end
