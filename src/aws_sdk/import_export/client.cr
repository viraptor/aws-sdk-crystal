module AwsSdk
  module ImportExport
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

      def cancel_job(input : Types::CancelJobInput) : Protocol::Request
        with_endpoint_headers(Protocol::Query.build_request(Model::CANCEL_JOB, input, endpoint))
      end

      def create_job(input : Types::CreateJobInput) : Protocol::Request
        with_endpoint_headers(Protocol::Query.build_request(Model::CREATE_JOB, input, endpoint))
      end

      def get_shipping_label(input : Types::GetShippingLabelInput) : Protocol::Request
        with_endpoint_headers(Protocol::Query.build_request(Model::GET_SHIPPING_LABEL, input, endpoint))
      end

      def get_status(input : Types::GetStatusInput) : Protocol::Request
        with_endpoint_headers(Protocol::Query.build_request(Model::GET_STATUS, input, endpoint))
      end

      def list_jobs(input : Types::ListJobsInput) : Protocol::Request
        with_endpoint_headers(Protocol::Query.build_request(Model::LIST_JOBS, input, endpoint))
      end

      def update_job(input : Types::UpdateJobInput) : Protocol::Request
        with_endpoint_headers(Protocol::Query.build_request(Model::UPDATE_JOB, input, endpoint))
      end

      private def with_endpoint_headers(request : Protocol::Request) : Protocol::Request
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
