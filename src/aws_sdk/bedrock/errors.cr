module AwsSdk
  module Bedrock
    module Errors
      class ServiceError < Exception
      end

      # The request is denied because of missing access permissions.

      class AccessDeniedException < ServiceError
      end

      # Error occurred because of a conflict while performing an operation.

      class ConflictException < ServiceError
      end

      # An internal server error occurred. Retry your request.

      class InternalServerException < ServiceError
      end

      # Thrown when attempting to delete or modify a resource that is currently being used by other
      # resources or operations. For example, trying to delete an Automated Reasoning policy that is
      # referenced by an active guardrail.

      class ResourceInUseException < ServiceError
      end

      # The specified resource Amazon Resource Name (ARN) was not found. Check the Amazon Resource Name
      # (ARN) and try your request again.

      class ResourceNotFoundException < ServiceError
      end

      # The number of requests exceeds the service quota. Resubmit your request later.

      class ServiceQuotaExceededException < ServiceError
      end

      # Returned if the service cannot complete the request.

      class ServiceUnavailableException < ServiceError
      end

      # The number of requests exceeds the limit. Resubmit your request later.

      class ThrottlingException < ServiceError
      end

      # The request contains more tags than can be associated with a resource (50 tags per resource). The
      # maximum number of tags includes both existing tags and those included in your current request.

      class TooManyTagsException < ServiceError
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
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
