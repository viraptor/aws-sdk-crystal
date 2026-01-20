module Aws
  module BedrockAgent
    module Errors
      class ServiceError < Exception
      end

      # The request is denied because of missing access permissions.

      class AccessDeniedException < ServiceError
      end

      # There was a conflict performing an operation.

      class ConflictException < ServiceError
      end

      # An internal server error occurred. Retry your request.

      class InternalServerException < ServiceError
      end

      # The specified resource Amazon Resource Name (ARN) was not found. Check the Amazon Resource Name
      # (ARN) and try your request again.

      class ResourceNotFoundException < ServiceError
      end

      # The number of requests exceeds the service quota. Resubmit your request later.

      class ServiceQuotaExceededException < ServiceError
      end

      # The number of requests exceeds the limit. Resubmit your request later.

      class ThrottlingException < ServiceError
      end

      # Input validation failed. Check your request parameters and retry the request.

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
