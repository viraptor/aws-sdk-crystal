module AwsSdk
  module Identitystore
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # This request cannot be completed for one of the following reasons: Performing the requested
      # operation would violate an existing uniqueness claim in the identity store. Resolve the conflict
      # before retrying this request. The requested resource was being concurrently modified by another
      # request.
      class ConflictException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure with an internal
      # server.
      class InternalServerException < ServiceError
      end

      # Indicates that a requested resource is not found.
      class ResourceNotFoundException < ServiceError
      end

      # The request would cause the number of users or groups in the identity store to exceed the maximum
      # allowed.
      class ServiceQuotaExceededException < ServiceError
      end

      # Indicates that the principal has crossed the throttling limits of the API operations.
      class ThrottlingException < ServiceError
      end

      # The request failed because it contains a syntax error.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
