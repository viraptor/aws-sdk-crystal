module AwsSdk
  module MarketplaceReporting
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

      # Generates an embedding URL for an Amazon QuickSight dashboard for an anonymous user. This API is
      # available only to Amazon Web Services Organization management accounts or delegated administrators
      # registered for the procurement insights ( procurement-insights.marketplace.amazonaws.com ) feature.
      # The following rules apply to a generated URL: It contains a temporary bearer token, valid for 5
      # minutes after it is generated. Once redeemed within that period, it cannot be re-used again. It has
      # a session lifetime of one hour. The 5-minute validity period runs separately from the session
      # lifetime.
      def get_buyer_dashboard(
        dashboard_identifier : String,
        embedding_domains : Array(String)
      ) : Protocol::Request
        input = Types::GetBuyerDashboardInput.new(dashboard_identifier: dashboard_identifier, embedding_domains: embedding_domains)
        get_buyer_dashboard(input)
      end
      def get_buyer_dashboard(input : Types::GetBuyerDashboardInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BUYER_DASHBOARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
