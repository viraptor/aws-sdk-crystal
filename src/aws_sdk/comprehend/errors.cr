module AwsSdk
  module Comprehend
    module Errors
      class ServiceError < Exception
      end

      # The number of documents in the request exceeds the limit of 25. Try your request again with fewer
      # documents.
      class BatchSizeLimitExceededException < ServiceError
      end

      # Concurrent modification of the tags associated with an Amazon Comprehend resource is not supported.
      class ConcurrentModificationException < ServiceError
      end

      # An internal server error occurred. Retry your request.
      class InternalServerException < ServiceError
      end

      # The filter specified for the operation is invalid. Specify a different filter.
      class InvalidFilterException < ServiceError
      end

      # The request is invalid.
      class InvalidRequestException < ServiceError
      end

      # The specified job was not found. Check the job ID and try again.
      class JobNotFoundException < ServiceError
      end

      # The KMS customer managed key (CMK) entered cannot be validated. Verify the key and re-enter it.
      class KmsKeyValidationException < ServiceError
      end

      # The specified resource name is already in use. Use a different name and try your request again.
      class ResourceInUseException < ServiceError
      end

      # The maximum number of resources per account has been exceeded. Review the resources, and then try
      # your request again.
      class ResourceLimitExceededException < ServiceError
      end

      # The specified resource ARN was not found. Check the ARN and try your request again.
      class ResourceNotFoundException < ServiceError
      end

      # The specified resource is not available. Check the resource and try your request again.
      class ResourceUnavailableException < ServiceError
      end

      # The size of the input text exceeds the limit. Use a smaller document.
      class TextSizeLimitExceededException < ServiceError
      end

      # The number of requests exceeds the limit. Resubmit your request later.
      class TooManyRequestsException < ServiceError
      end

      # The request contains more tag keys than can be associated with a resource (50 tag keys per
      # resource).
      class TooManyTagKeysException < ServiceError
      end

      # The request contains more tags than can be associated with a resource (50 tags per resource). The
      # maximum number of tags includes both existing tags and those included in your current request.
      class TooManyTagsException < ServiceError
      end

      # Amazon Comprehend can't process the language of the input text. For a list of supported languages,
      # Supported languages in the Comprehend Developer Guide.
      class UnsupportedLanguageException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BatchSizeLimitExceededException"
          BatchSizeLimitExceededException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidFilterException"
          InvalidFilterException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "JobNotFoundException"
          JobNotFoundException.new(message)
        when "KmsKeyValidationException"
          KmsKeyValidationException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceLimitExceededException"
          ResourceLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceUnavailableException"
          ResourceUnavailableException.new(message)
        when "TextSizeLimitExceededException"
          TextSizeLimitExceededException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "TooManyTagKeysException"
          TooManyTagKeysException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnsupportedLanguageException"
          UnsupportedLanguageException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
