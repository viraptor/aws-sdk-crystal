module Aws
  module HealthLake
    module Errors
      class ServiceError < Exception
      end

      # Access is denied. Your account is not authorized to perform this operation.

      class AccessDeniedException < ServiceError
      end

      # The data store is in a transition state and the user requested action cannot be performed.

      class ConflictException < ServiceError
      end

      # An unknown internal error occurred in the service.

      class InternalServerException < ServiceError
      end

      # The requested data store was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The user has exceeded their maximum number of allowed calls to the given API.

      class ThrottlingException < ServiceError
      end

      # The user input parameter was invalid.

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
