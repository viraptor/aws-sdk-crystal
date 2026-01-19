module AwsSdk
  module BackupGateway
    module Errors
      class ServiceError < Exception
      end

      # The operation cannot proceed because you have insufficient permissions.
      class AccessDeniedException < ServiceError
      end

      # The operation cannot proceed because it is not supported.
      class ConflictException < ServiceError
      end

      # The operation did not succeed because an internal error occurred. Try again later.
      class InternalServerException < ServiceError
      end

      # A resource that is required for the action wasn't found.
      class ResourceNotFoundException < ServiceError
      end

      # TPS has been limited to protect against intentional or unintentional high request volumes.
      class ThrottlingException < ServiceError
      end

      # The operation did not succeed because a validation error occurred.
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
