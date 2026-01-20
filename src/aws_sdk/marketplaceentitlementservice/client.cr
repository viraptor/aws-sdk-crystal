module AwsSdk
  module MarketplaceEntitlementService
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # GetEntitlements retrieves entitlement values for a given product. The results can be filtered based
      # on customer identifier, AWS account ID, or product dimensions. The CustomerIdentifier parameter is
      # on path for deprecation. Use CustomerAWSAccountID instead. These parameters are mutually exclusive.
      # You can't specify both CustomerIdentifier and CustomerAWSAccountID in the same request.

      def get_entitlements(
        product_code : String,
        filter : Hash(String, Array(String))? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetEntitlementsResult

        input = Types::GetEntitlementsRequest.new(product_code: product_code, filter: filter, max_results: max_results, next_token: next_token)
        get_entitlements(input)
      end

      def get_entitlements(input : Types::GetEntitlementsRequest) : Types::GetEntitlementsResult
        request = Protocol::JsonRpc.build_request(Model::GET_ENTITLEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEntitlementsResult, "GetEntitlements")
      end
    end
  end
end
