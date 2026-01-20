module AwsSdk
  module SSOOIDC
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Indicates that a request to authorize a client with an access user session token is pending.

      class AuthorizationPendingException < ServiceError
      end

      # Indicates that the token issued by the service is expired and is no longer valid.

      class ExpiredTokenException < ServiceError
      end

      # Indicates that an error from the service occurred while trying to process a request.

      class InternalServerException < ServiceError
      end

      # Indicates that the clientId or clientSecret in the request is invalid. For example, this can occur
      # when a client sends an incorrect clientId or an expired clientSecret .

      class InvalidClientException < ServiceError
      end

      # Indicates that the client information sent in the request during registration is invalid.

      class InvalidClientMetadataException < ServiceError
      end

      # Indicates that a request contains an invalid grant. This can occur if a client makes a CreateToken
      # request with an invalid grant type.

      class InvalidGrantException < ServiceError
      end

      # Indicates that one or more redirect URI in the request is not supported for this operation.

      class InvalidRedirectUriException < ServiceError
      end

      # Indicates that something is wrong with the input to the request. For example, a required parameter
      # might be missing or out of range.

      class InvalidRequestException < ServiceError
      end

      # Indicates that a token provided as input to the request was issued by and is only usable by calling
      # IAM Identity Center endpoints in another region.

      class InvalidRequestRegionException < ServiceError
      end

      # Indicates that the scope provided in the request is invalid.

      class InvalidScopeException < ServiceError
      end

      # Indicates that the client is making the request too frequently and is more than the service can
      # handle.

      class SlowDownException < ServiceError
      end

      # Indicates that the client is not currently authorized to make the request. This can happen when a
      # clientId is not issued for a public client.

      class UnauthorizedClientException < ServiceError
      end

      # Indicates that the grant type in the request is not supported by the service.

      class UnsupportedGrantTypeException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AuthorizationPendingException"
          AuthorizationPendingException.new(message)
        when "ExpiredTokenException"
          ExpiredTokenException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidClientException"
          InvalidClientException.new(message)
        when "InvalidClientMetadataException"
          InvalidClientMetadataException.new(message)
        when "InvalidGrantException"
          InvalidGrantException.new(message)
        when "InvalidRedirectUriException"
          InvalidRedirectUriException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidRequestRegionException"
          InvalidRequestRegionException.new(message)
        when "InvalidScopeException"
          InvalidScopeException.new(message)
        when "SlowDownException"
          SlowDownException.new(message)
        when "UnauthorizedClientException"
          UnauthorizedClientException.new(message)
        when "UnsupportedGrantTypeException"
          UnsupportedGrantTypeException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
