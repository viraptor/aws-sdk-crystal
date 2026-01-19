module AwsSdk
  module Translate
    module Errors
      class ServiceError < Exception
      end

      # Another modification is being made. That modification must complete before you can make your change.
      class ConcurrentModificationException < ServiceError
      end

      # There was a conflict processing the request. Try your request again.
      class ConflictException < ServiceError
      end

      # The confidence that Amazon Comprehend accurately detected the source language is low. If a low
      # confidence level is acceptable for your application, you can use the language in the exception to
      # call Amazon Translate again. For more information, see the DetectDominantLanguage operation in the
      # Amazon Comprehend Developer Guide .
      class DetectedLanguageLowConfidenceException < ServiceError
      end

      # An internal server error occurred. Retry your request.
      class InternalServerException < ServiceError
      end

      # The filter specified for the operation is not valid. Specify a different filter.
      class InvalidFilterException < ServiceError
      end

      # The value of the parameter is not valid. Review the value of the parameter you are using to correct
      # it, and then retry your operation.
      class InvalidParameterValueException < ServiceError
      end

      # The request that you made is not valid. Check your request to determine why it's not valid and then
      # retry the request.
      class InvalidRequestException < ServiceError
      end

      # The specified limit has been exceeded. Review your request and retry it with a quantity below the
      # stated limit.
      class LimitExceededException < ServiceError
      end

      # The resource you are looking for has not been found. Review the resource you're looking for and see
      # if a different resource will accomplish your needs before retrying the revised request.
      class ResourceNotFoundException < ServiceError
      end

      # The Amazon Translate service is temporarily unavailable. Wait a bit and then retry your request.
      class ServiceUnavailableException < ServiceError
      end

      # The size of the text you submitted exceeds the size limit. Reduce the size of the text or use a
      # smaller document and then retry your request.
      class TextSizeLimitExceededException < ServiceError
      end

      # You have made too many requests within a short period of time. Wait for a short time and then try
      # your request again.
      class TooManyRequestsException < ServiceError
      end

      # You have added too many tags to this resource. The maximum is 50 tags.
      class TooManyTagsException < ServiceError
      end

      # Requested display language code is not supported.
      class UnsupportedDisplayLanguageCodeException < ServiceError
      end

      # Amazon Translate does not support translation from the language of the source text into the
      # requested target language. For more information, see Supported languages .
      class UnsupportedLanguagePairException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DetectedLanguageLowConfidenceException"
          DetectedLanguageLowConfidenceException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidFilterException"
          InvalidFilterException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TextSizeLimitExceededException"
          TextSizeLimitExceededException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnsupportedDisplayLanguageCodeException"
          UnsupportedDisplayLanguageCodeException.new(message)
        when "UnsupportedLanguagePairException"
          UnsupportedLanguagePairException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
