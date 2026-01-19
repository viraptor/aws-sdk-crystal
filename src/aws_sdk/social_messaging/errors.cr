module AwsSdk
  module SocialMessaging
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedByMetaException < ServiceError
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # Thrown when performing an action because a dependency would be broken.
      class DependencyException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception, or failure.
      class InternalServiceException < ServiceError
      end

      # One or more parameters provided to the action are not valid.
      class InvalidParametersException < ServiceError
      end

      # The request was denied because it would exceed one or more service quotas or limits.
      class LimitExceededException < ServiceError
      end

      # The resource was not found.
      class ResourceNotFoundException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottledRequestException < ServiceError
      end

      # The request contains an invalid parameter value.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedByMetaException"
          AccessDeniedByMetaException.new(message)
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "DependencyException"
          DependencyException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidParametersException"
          InvalidParametersException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ThrottledRequestException"
          ThrottledRequestException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
