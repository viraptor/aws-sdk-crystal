module AwsSdk
  module ComprehendMedical
    module Errors
      class ServiceError < Exception
      end

      # An internal server error occurred. Retry your request.
      class InternalServerException < ServiceError
      end

      # The input text was not in valid UTF-8 character encoding. Check your text then retry your request.
      class InvalidEncodingException < ServiceError
      end

      # The request that you made is invalid. Check your request to determine why it's invalid and then
      # retry the request.
      class InvalidRequestException < ServiceError
      end

      # The resource identified by the specified Amazon Resource Name (ARN) was not found. Check the ARN and
      # try your request again.
      class ResourceNotFoundException < ServiceError
      end

      # The Amazon Comprehend Medical service is temporarily unavailable. Please wait and then retry your
      # request.
      class ServiceUnavailableException < ServiceError
      end

      # The size of the text you submitted exceeds the size limit. Reduce the size of the text or use a
      # smaller document and then retry your request.
      class TextSizeLimitExceededException < ServiceError
      end

      # You have made too many requests within a short period of time. Wait for a short time and then try
      # your request again. Contact customer support for more information about a service limit increase.
      class TooManyRequestsException < ServiceError
      end

      # The filter that you specified for the operation is invalid. Check the filter values that you entered
      # and try your request again.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidEncodingException"
          InvalidEncodingException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TextSizeLimitExceededException"
          TextSizeLimitExceededException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
