module AwsSdk
  module DynamoDBStreams
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

      def describe_stream(input : Types::DescribeStreamInput) : Protocol::Request
        with_endpoint_headers(Protocol::JsonRpc.build_request(Model::DESCRIBE_STREAM, input, endpoint))
      end

      def get_records(input : Types::GetRecordsInput) : Protocol::Request
        with_endpoint_headers(Protocol::JsonRpc.build_request(Model::GET_RECORDS, input, endpoint))
      end

      def get_shard_iterator(input : Types::GetShardIteratorInput) : Protocol::Request
        with_endpoint_headers(Protocol::JsonRpc.build_request(Model::GET_SHARD_ITERATOR, input, endpoint))
      end

      def list_streams(input : Types::ListStreamsInput) : Protocol::Request
        with_endpoint_headers(Protocol::JsonRpc.build_request(Model::LIST_STREAMS, input, endpoint))
      end

      private def with_endpoint_headers(request : Protocol::Request) : Protocol::Request
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
