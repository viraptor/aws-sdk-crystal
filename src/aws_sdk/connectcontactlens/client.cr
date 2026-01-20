module AwsSdk
  module ConnectContactLens
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

      # Provides a list of analysis segments for a real-time analysis session.

      def list_realtime_contact_analysis_segments(
        contact_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRealtimeContactAnalysisSegmentsRequest.new(contact_id: contact_id, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_realtime_contact_analysis_segments(input)
      end

      def list_realtime_contact_analysis_segments(input : Types::ListRealtimeContactAnalysisSegmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REALTIME_CONTACT_ANALYSIS_SEGMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
