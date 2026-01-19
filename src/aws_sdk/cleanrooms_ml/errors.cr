module AwsSdk
  module CleanRoomsML
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # You can't complete this action because another resource depends on this resource.
      class ConflictException < ServiceError
      end

      # An internal service error occurred. Retry your request. If the problem persists, contact AWS
      # Support.
      class InternalServiceException < ServiceError
      end

      # The resource you are requesting does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # You have exceeded your service quota.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # The request parameters for this request are incorrect.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
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
