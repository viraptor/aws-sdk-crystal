module Aws
  module BCMRecommendedActions
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Returns a list of recommended actions that match the filter criteria.

      def list_recommended_actions(
        filter : Types::RequestFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRecommendedActionsResponse

        input = Types::ListRecommendedActionsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_recommended_actions(input)
      end

      def list_recommended_actions(input : Types::ListRecommendedActionsRequest) : Types::ListRecommendedActionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECOMMENDED_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRecommendedActionsResponse, "ListRecommendedActions")
      end
    end
  end
end
