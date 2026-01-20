require "json"

module AwsSdk
  module Signin
    module Types

      # Error thrown for access denied scenarios with flexible HTTP status mapping Runtime HTTP Status Code
      # Mapping: HTTP 401 (Unauthorized): TOKEN_EXPIRED, AUTHCODE_EXPIRED HTTP 403 (Forbidden):
      # USER_CREDENTIALS_CHANGED, INSUFFICIENT_PERMISSIONS The specific HTTP status code is determined at
      # runtime based on the error enum value. Consumers should use the error field to determine the
      # specific access denial reason.

      struct AccessDeniedException
        include JSON::Serializable

        # OAuth 2.0 error code indicating the specific type of access denial Can be TOKEN_EXPIRED,
        # AUTHCODE_EXPIRED, USER_CREDENTIALS_CHANGED, or INSUFFICIENT_PERMISSIONS

        @[JSON::Field(key: "error")]
        getter error : String

        # Detailed message explaining the access denial Provides specific information about why access was
        # denied

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @error : String,
          @message : String
        )
        end
      end

      # AWS credentials structure containing temporary access credentials The scoped-down, 15 minute
      # duration AWS credentials. Scoping down will be based on CLI policy (CLI team needs to create it).
      # Similar to cloud shell implementation.

      struct AccessToken
        include JSON::Serializable

        # AWS access key ID for temporary credentials

        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String

        # AWS secret access key for temporary credentials

        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String

        # AWS session token for temporary credentials

        @[JSON::Field(key: "sessionToken")]
        getter session_token : String

        def initialize(
          @access_key_id : String,
          @secret_access_key : String,
          @session_token : String
        )
        end
      end

      # Input structure for CreateOAuth2Token operation Contains flattened token operation inputs for both
      # authorization code and refresh token flows. The operation type is determined by the grant_type
      # parameter in the request body.

      struct CreateOAuth2TokenRequest
        include JSON::Serializable

        # Flattened token operation inputs The specific operation is determined by grant_type in the request
        # body

        @[JSON::Field(key: "tokenInput")]
        getter token_input : Types::CreateOAuth2TokenRequestBody

        def initialize(
          @token_input : Types::CreateOAuth2TokenRequestBody
        )
        end
      end

      # Request body payload for CreateOAuth2Token operation The operation type is determined by the
      # grant_type parameter: grant_type=authorization_code: Requires code, redirect_uri, code_verifier
      # grant_type=refresh_token: Requires refresh_token

      struct CreateOAuth2TokenRequestBody
        include JSON::Serializable

        # The client identifier (ARN) used during Sign-In onboarding Required for both authorization code and
        # refresh token flows

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # OAuth 2.0 grant type - determines which flow is used Must be &quot;authorization_code&quot; or
        # &quot;refresh_token&quot;

        @[JSON::Field(key: "grantType")]
        getter grant_type : String

        # The authorization code received from /v1/authorize Required only when grant_type=authorization_code

        @[JSON::Field(key: "code")]
        getter code : String?

        # PKCE code verifier to prove possession of the original code challenge Required only when
        # grant_type=authorization_code

        @[JSON::Field(key: "codeVerifier")]
        getter code_verifier : String?

        # The redirect URI that must match the original authorization request Required only when
        # grant_type=authorization_code

        @[JSON::Field(key: "redirectUri")]
        getter redirect_uri : String?

        # The refresh token returned from auth_code redemption Required only when grant_type=refresh_token

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String?

        def initialize(
          @client_id : String,
          @grant_type : String,
          @code : String? = nil,
          @code_verifier : String? = nil,
          @redirect_uri : String? = nil,
          @refresh_token : String? = nil
        )
        end
      end

      # Output structure for CreateOAuth2Token operation Contains flattened token operation outputs for both
      # authorization code and refresh token flows. The response content depends on the grant_type from the
      # original request.

      struct CreateOAuth2TokenResponse
        include JSON::Serializable

        # Flattened token operation outputs The specific response fields depend on the grant_type used in the
        # request

        @[JSON::Field(key: "tokenOutput")]
        getter token_output : Types::CreateOAuth2TokenResponseBody

        def initialize(
          @token_output : Types::CreateOAuth2TokenResponseBody
        )
        end
      end

      # Response body payload for CreateOAuth2Token operation The response content depends on the grant_type
      # from the request: grant_type=authorization_code: Returns all fields including refresh_token and
      # id_token grant_type=refresh_token: Returns access_token, token_type, expires_in, refresh_token (no
      # id_token)

      struct CreateOAuth2TokenResponseBody
        include JSON::Serializable

        # Scoped-down AWS credentials (15 minute duration) Present for both authorization code redemption and
        # token refresh

        @[JSON::Field(key: "accessToken")]
        getter access_token : Types::AccessToken

        # Time to expiry in seconds (maximum 900) Present for both authorization code redemption and token
        # refresh

        @[JSON::Field(key: "expiresIn")]
        getter expires_in : Int32

        # Encrypted refresh token with cnf.jkt (SHA-256 thumbprint of presented jwk) Always present in
        # responses (required for both flows)

        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String

        # Token type indicating this is AWS SigV4 credentials Value is &quot;aws_sigv4&quot; for both flows

        @[JSON::Field(key: "tokenType")]
        getter token_type : String

        # ID token containing user identity information Present only in authorization code redemption response
        # (grant_type=authorization_code) Not included in token refresh responses

        @[JSON::Field(key: "idToken")]
        getter id_token : String?

        def initialize(
          @access_token : Types::AccessToken,
          @expires_in : Int32,
          @refresh_token : String,
          @token_type : String,
          @id_token : String? = nil
        )
        end
      end

      # Error thrown when an internal server error occurs HTTP Status Code: 500 Internal Server Error Used
      # for unexpected server-side errors that prevent request processing.

      struct InternalServerException
        include JSON::Serializable

        # OAuth 2.0 error code indicating server error Will be SERVER_ERROR for internal server errors

        @[JSON::Field(key: "error")]
        getter error : String

        # Detailed message explaining the server error May include error details for debugging purposes

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @error : String,
          @message : String
        )
        end
      end

      # Error thrown when rate limit is exceeded HTTP Status Code: 429 Too Many Requests Possible
      # OAuth2ErrorCode values: INVALID_REQUEST: Rate limiting, too many requests, abuse prevention Possible
      # causes: Too many token requests from the same client Rate limiting based on client_id or IP address
      # Abuse prevention mechanisms triggered Service protection against excessive token generation

      struct TooManyRequestsError
        include JSON::Serializable

        # OAuth 2.0 error code indicating the specific type of error Will be INVALID_REQUEST for rate limiting
        # scenarios

        @[JSON::Field(key: "error")]
        getter error : String

        # Detailed message about the rate limiting May include retry-after information or rate limit details

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @error : String,
          @message : String
        )
        end
      end

      # Error thrown when request validation fails HTTP Status Code: 400 Bad Request Used for request
      # validation errors such as malformed parameters, missing required fields, or invalid parameter
      # values.

      struct ValidationException
        include JSON::Serializable

        # OAuth 2.0 error code indicating validation failure Will be INVALID_REQUEST for validation errors

        @[JSON::Field(key: "error")]
        getter error : String

        # Detailed message explaining the validation failure Provides specific information about which
        # validation failed

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @error : String,
          @message : String
        )
        end
      end
    end
  end
end
