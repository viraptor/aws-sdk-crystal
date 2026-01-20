module AwsSdk
  module BedrockDataAutomationRuntime
    module Errors
      class ServiceError < Exception
      end

      # This exception will be thrown when customer does not have access to API.

      class AccessDeniedException < ServiceError
      end

      # This exception is for any internal un-expected service errors.

      class InternalServerException < ServiceError
      end

      # This exception will be thrown when resource provided from customer not found.

      class ResourceNotFoundException < ServiceError
      end

      # This exception will be thrown when service quota is exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # This exception will be thrown when service is temporarily unavailable.

      class ServiceUnavailableException < ServiceError
      end

      # This exception will be thrown when customer reached API TPS limit.

      class ThrottlingException < ServiceError
      end

      # This exception will be thrown when customer provided invalid parameters.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
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
