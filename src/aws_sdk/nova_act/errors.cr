module AwsSdk
  module NovaAct
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permissions to perform this action.
      class AccessDeniedException < ServiceError
      end

      # The request could not be completed due to a conflict with the current state of the resource.
      class ConflictException < ServiceError
      end

      # An internal server error occurred. Please try again later.
      class InternalServerException < ServiceError
      end

      # The requested resource was not found.
      class ResourceNotFoundException < ServiceError
      end

      # The request would exceed a service quota limit.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was throttled due to too many requests. Please try again later.
      class ThrottlingException < ServiceError
      end

      # The input parameters for the request are invalid.
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
