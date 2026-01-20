module AwsSdk
  module IotDeviceAdvisor
    module Errors
      class ServiceError < Exception
      end

      # Sends a Conflict Exception.

      class ConflictException < ServiceError
      end

      # Sends an Internal Failure exception.

      class InternalServerException < ServiceError
      end

      # Sends a Resource Not Found exception.

      class ResourceNotFoundException < ServiceError
      end

      # Sends a validation exception.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
