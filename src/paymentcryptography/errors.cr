module Aws
  module PaymentCryptography
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action. This exception is thrown when the caller
      # lacks the necessary IAM permissions to perform the requested operation. Verify that your IAM policy
      # includes the required permissions for the specific Amazon Web Services Payment Cryptography action
      # you're attempting.

      class AccessDeniedException < ServiceError
      end

      # This request can cause an inconsistent state for the resource. The requested operation conflicts
      # with the current state of the resource. For example, attempting to delete a key that is currently
      # being used, or trying to create a resource that already exists.

      class ConflictException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception, or failure. This indicates
      # a server-side error within the Amazon Web Services Payment Cryptography service. If this error
      # persists, contact support for assistance.

      class InternalServerException < ServiceError
      end

      # The request was denied due to resource not found. The specified key, alias, or other resource does
      # not exist in your account or region. Verify that the resource identifier is correct and that the
      # resource exists in the expected region.

      class ResourceNotFoundException < ServiceError
      end

      # This request would cause a service quota to be exceeded. You have reached the maximum number of
      # keys, aliases, or other resources allowed in your account. Review your current usage and consider
      # deleting unused resources or requesting a quota increase.

      class ServiceQuotaExceededException < ServiceError
      end

      # The service cannot complete the request. The Amazon Web Services Payment Cryptography service is
      # temporarily unavailable. This is typically a temporary condition - retry your request after a brief
      # delay.

      class ServiceUnavailableException < ServiceError
      end

      # The request was denied due to request throttling. You have exceeded the rate limits for Amazon Web
      # Services Payment Cryptography API calls. Implement exponential backoff and retry logic in your
      # application to handle throttling gracefully.

      class ThrottlingException < ServiceError
      end

      # The request was denied due to an invalid request error. One or more parameters in your request are
      # invalid. Check the parameter values, formats, and constraints specified in the API documentation.

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
