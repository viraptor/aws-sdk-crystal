module Aws
  module PaymentCryptographyData
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception, or failure.

      class InternalServerException < ServiceError
      end

      # The request was denied due to an invalid resource error.

      class ResourceNotFoundException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The request was denied due to an invalid request error.

      class ValidationException < ServiceError
      end

      # This request failed verification.

      class VerificationFailedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        when "VerificationFailedException"
          VerificationFailedException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
