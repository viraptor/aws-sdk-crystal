module AwsSdk
  module Billingconductor
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # You can cause an inconsistent state by updating or deleting a resource.
      class ConflictException < ServiceError
      end

      # An unexpected error occurred while processing a request.
      class InternalServerException < ServiceError
      end

      # The request references a resource that doesn't exist.
      class ResourceNotFoundException < ServiceError
      end

      # The request would cause a service limit to exceed.
      class ServiceLimitExceededException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # The input doesn't match with the constraints specified by Amazon Web Services services.
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
        when "ServiceLimitExceededException"
          ServiceLimitExceededException.new(message)
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
