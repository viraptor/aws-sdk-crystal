module Aws
  module BedrockDataAutomation
    module Errors
      class ServiceError < Exception
      end

      # This exception is thrown when a request is denied per access permissions

      class AccessDeniedException < ServiceError
      end

      # This exception is thrown when there is a conflict performing an operation

      class ConflictException < ServiceError
      end

      # This exception is thrown if there was an unexpected error during processing of request

      class InternalServerException < ServiceError
      end

      # This exception is thrown when a resource referenced by the operation does not exist

      class ResourceNotFoundException < ServiceError
      end

      # This exception is thrown when a request is made beyond the service quota

      class ServiceQuotaExceededException < ServiceError
      end

      # This exception is thrown when the number of requests exceeds the limit

      class ThrottlingException < ServiceError
      end

      # This exception is thrown when the request's input validation fails

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
