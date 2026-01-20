module AwsSdk
  module SSOOIDC
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

      # Creates and returns access and refresh tokens for clients that are authenticated using client
      # secrets. The access token can be used to fetch short-lived credentials for the assigned AWS accounts
      # or to access application APIs using bearer authentication.

      def create_token(
        client_id : String,
        client_secret : String,
        grant_type : String,
        code : String? = nil,
        code_verifier : String? = nil,
        device_code : String? = nil,
        redirect_uri : String? = nil,
        refresh_token : String? = nil,
        scope : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateTokenRequest.new(client_id: client_id, client_secret: client_secret, grant_type: grant_type, code: code, code_verifier: code_verifier, device_code: device_code, redirect_uri: redirect_uri, refresh_token: refresh_token, scope: scope)
        create_token(input)
      end

      def create_token(input : Types::CreateTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and returns access and refresh tokens for authorized client applications that are
      # authenticated using any IAM entity, such as a service role or user. These tokens might contain
      # defined scopes that specify permissions such as read:profile or write:data . Through downscoping,
      # you can use the scopes parameter to request tokens with reduced permissions compared to the original
      # client application's permissions or, if applicable, the refresh token's scopes. The access token can
      # be used to fetch short-lived credentials for the assigned Amazon Web Services accounts or to access
      # application APIs using bearer authentication. This API is used with Signature Version 4. For more
      # information, see Amazon Web Services Signature Version 4 for API Requests .

      def create_token_with_iam(
        client_id : String,
        grant_type : String,
        assertion : String? = nil,
        code : String? = nil,
        code_verifier : String? = nil,
        redirect_uri : String? = nil,
        refresh_token : String? = nil,
        requested_token_type : String? = nil,
        scope : Array(String)? = nil,
        subject_token : String? = nil,
        subject_token_type : String? = nil
      ) : Protocol::Request
        input = Types::CreateTokenWithIAMRequest.new(client_id: client_id, grant_type: grant_type, assertion: assertion, code: code, code_verifier: code_verifier, redirect_uri: redirect_uri, refresh_token: refresh_token, requested_token_type: requested_token_type, scope: scope, subject_token: subject_token, subject_token_type: subject_token_type)
        create_token_with_iam(input)
      end

      def create_token_with_iam(input : Types::CreateTokenWithIAMRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TOKEN_WITH_IAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers a public client with IAM Identity Center. This allows clients to perform authorization
      # using the authorization code grant with Proof Key for Code Exchange (PKCE) or the device code grant.

      def register_client(
        client_name : String,
        client_type : String,
        entitled_application_arn : String? = nil,
        grant_types : Array(String)? = nil,
        issuer_url : String? = nil,
        redirect_uris : Array(String)? = nil,
        scopes : Array(String)? = nil
      ) : Protocol::Request
        input = Types::RegisterClientRequest.new(client_name: client_name, client_type: client_type, entitled_application_arn: entitled_application_arn, grant_types: grant_types, issuer_url: issuer_url, redirect_uris: redirect_uris, scopes: scopes)
        register_client(input)
      end

      def register_client(input : Types::RegisterClientRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_CLIENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates device authorization by requesting a pair of verification codes from the authorization
      # service.

      def start_device_authorization(
        client_id : String,
        client_secret : String,
        start_url : String
      ) : Protocol::Request
        input = Types::StartDeviceAuthorizationRequest.new(client_id: client_id, client_secret: client_secret, start_url: start_url)
        start_device_authorization(input)
      end

      def start_device_authorization(input : Types::StartDeviceAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DEVICE_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
