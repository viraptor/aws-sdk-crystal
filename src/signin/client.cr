module Aws
  module Signin
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # CreateOAuth2Token API Path: /v1/token Request Method: POST Content-Type: application/json or
      # application/x-www-form-urlencoded This API implements OAuth 2.0 flows for AWS Sign-In CLI clients,
      # supporting both: Authorization code redemption (grant_type=authorization_code) - NOT idempotent
      # Token refresh (grant_type=refresh_token) - Idempotent within token validity window The operation
      # behavior is determined by the grant_type parameter in the request body: Authorization Code Flow (NOT
      # Idempotent): JSON or form-encoded body with client_id, grant_type=authorization_code, code,
      # redirect_uri, code_verifier Returns access_token, token_type, expires_in, refresh_token, and
      # id_token Each authorization code can only be used ONCE for security (prevents replay attacks) Token
      # Refresh Flow (Idempotent): JSON or form-encoded body with client_id, grant_type=refresh_token,
      # refresh_token Returns access_token, token_type, expires_in, and refresh_token (no id_token) Multiple
      # calls with same refresh_token return consistent results within validity window Authentication and
      # authorization: Confidential clients: sigv4 signing required with signin:ExchangeToken permissions
      # CLI clients (public): authn/authz skipped based on client_id &amp; grant_type Note: This operation
      # cannot be marked as @idempotent because it handles both idempotent (token refresh) and
      # non-idempotent (auth code redemption) flows in a single endpoint.

      def create_o_auth2_token(
        token_input : Types::CreateOAuth2TokenRequestBody
      ) : Protocol::Request
        input = Types::CreateOAuth2TokenRequest.new(token_input: token_input)
        create_o_auth2_token(input)
      end

      def create_o_auth2_token(input : Types::CreateOAuth2TokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_O_AUTH2_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
