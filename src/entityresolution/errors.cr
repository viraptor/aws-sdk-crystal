module Aws
  module EntityResolution
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request couldn't be processed because of conflict in the current state of the resource. Example:
      # Workflow already exists, Schema already exists, Workflow is currently running, etc.

      class ConflictException < ServiceError
      end

      # The request was rejected because it attempted to create resources beyond the current Entity
      # Resolution account limits. The error message describes the limit exceeded.

      class ExceedsLimitException < ServiceError
      end

      # This exception occurs when there is an internal failure in the Entity Resolution service.

      class InternalServerException < ServiceError
      end

      # The resource couldn't be found.

      class ResourceNotFoundException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by Entity Resolution.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ExceedsLimitException"
          ExceedsLimitException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
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
