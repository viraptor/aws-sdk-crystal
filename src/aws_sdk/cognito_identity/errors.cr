module AwsSdk
  module CognitoIdentity
    module Errors
      class ServiceError < Exception
      end

      # Thrown if there are parallel requests to modify a resource.
      class ConcurrentModificationException < ServiceError
      end

      # The provided developer user identifier is already registered with Cognito under a different identity
      # ID.
      class DeveloperUserAlreadyRegisteredException < ServiceError
      end

      # An exception thrown when a dependent service such as Facebook or Twitter is not responding
      class ExternalServiceException < ServiceError
      end

      # Thrown when the service encounters an error during processing the request.
      class InternalErrorException < ServiceError
      end

      # If you provided authentication information in the request, the identity pool has no authenticated
      # role configured, or STS returned an error response to the request to assume the authenticated role
      # from the identity pool. If you provided no authentication information in the request, the identity
      # pool has no unauthenticated role configured, or STS returned an error response to the request to
      # assume the unauthenticated role from the identity pool. Your role trust policy must grant
      # AssumeRoleWithWebIdentity permissions to cognito-identity.amazonaws.com .
      class InvalidIdentityPoolConfigurationException < ServiceError
      end

      # Thrown for missing or bad input parameter(s).
      class InvalidParameterException < ServiceError
      end

      # Thrown when the total number of user pools has exceeded a preset limit.
      class LimitExceededException < ServiceError
      end

      # Thrown when a user is not authorized to access the requested resource.
      class NotAuthorizedException < ServiceError
      end

      # Thrown when a user tries to use a login which is already linked to another account.
      class ResourceConflictException < ServiceError
      end

      # Thrown when the requested resource (for example, a dataset or record) does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # Thrown when a request is throttled.
      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "DeveloperUserAlreadyRegisteredException"
          DeveloperUserAlreadyRegisteredException.new(message)
        when "ExternalServiceException"
          ExternalServiceException.new(message)
        when "InternalErrorException"
          InternalErrorException.new(message)
        when "InvalidIdentityPoolConfigurationException"
          InvalidIdentityPoolConfigurationException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotAuthorizedException"
          NotAuthorizedException.new(message)
        when "ResourceConflictException"
          ResourceConflictException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
