module AwsSdk
  module NetworkFlowMonitor
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permission to perform this action.
      class AccessDeniedException < ServiceError
      end

      # The requested resource is in use.
      class ConflictException < ServiceError
      end

      # An internal error occurred.
      class InternalServerException < ServiceError
      end

      # The request specifies a resource that doesn't exist.
      class ResourceNotFoundException < ServiceError
      end

      # The request exceeded a service quota.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # Invalid request.
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
