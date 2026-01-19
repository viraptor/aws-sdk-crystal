module AwsSdk
  module SageMakerMetrics
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Used to retrieve training metrics from SageMaker.
      def batch_get_metrics(
        metric_queries : Array(Types::MetricQuery)
      ) : Protocol::Request
        input = Types::BatchGetMetricsRequest.new(metric_queries: metric_queries)
        batch_get_metrics(input)
      end
      def batch_get_metrics(input : Types::BatchGetMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to ingest training metrics into SageMaker. These metrics can be visualized in SageMaker Studio.
      def batch_put_metrics(
        metric_data : Array(Types::RawMetricData),
        trial_component_name : String
      ) : Protocol::Request
        input = Types::BatchPutMetricsRequest.new(metric_data: metric_data, trial_component_name: trial_component_name)
        batch_put_metrics(input)
      end
      def batch_put_metrics(input : Types::BatchPutMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
