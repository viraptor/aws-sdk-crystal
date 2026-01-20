module AwsSdk
  module Signin
    module Errors
      class ServiceError < Exception
      end

      # Error thrown for access denied scenarios with flexible HTTP status mapping Runtime HTTP Status Code
      # Mapping: HTTP 401 (Unauthorized): TOKEN_EXPIRED, AUTHCODE_EXPIRED HTTP 403 (Forbidden):
      # USER_CREDENTIALS_CHANGED, INSUFFICIENT_PERMISSIONS The specific HTTP status code is determined at
      # runtime based on the error enum value. Consumers should use the error field to determine the
      # specific access denial reason.

      class AccessDeniedException < ServiceError
      end

      # Error thrown when an internal server error occurs HTTP Status Code: 500 Internal Server Error Used
      # for unexpected server-side errors that prevent request processing.

      class InternalServerException < ServiceError
      end

      # Error thrown when rate limit is exceeded HTTP Status Code: 429 Too Many Requests Possible
      # OAuth2ErrorCode values: INVALID_REQUEST: Rate limiting, too many requests, abuse prevention Possible
      # causes: Too many token requests from the same client Rate limiting based on client_id or IP address
      # Abuse prevention mechanisms triggered Service protection against excessive token generation

      class TooManyRequestsError < ServiceError
      end

      # Error thrown when request validation fails HTTP Status Code: 400 Bad Request Used for request
      # validation errors such as malformed parameters, missing required fields, or invalid parameter
      # values.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "TooManyRequestsError"
          TooManyRequestsError.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
