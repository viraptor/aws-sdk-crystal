module AwsSdk
  module WorkspacesInstances
    module Errors
      class ServiceError < Exception
      end

      # Indicates insufficient permissions to perform the requested action.
      class AccessDeniedException < ServiceError
      end

      # Signals a conflict with the current state of the resource.
      class ConflictException < ServiceError
      end

      # Indicates an unexpected server-side error occurred.
      class InternalServerException < ServiceError
      end

      # Indicates the requested resource could not be found.
      class ResourceNotFoundException < ServiceError
      end

      # Indicates that a service quota has been exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # Indicates the request rate has exceeded limits.
      class ThrottlingException < ServiceError
      end

      # Indicates invalid input parameters in the request.
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
