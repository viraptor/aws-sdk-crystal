module AwsSdk
  module Omics
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request cannot be applied to the target resource in its current state.

      class ConflictException < ServiceError
      end

      # An unexpected error occurred. Try the request again.

      class InternalServerException < ServiceError
      end

      # The operation is not supported by Amazon Omics, or the API does not exist.

      class NotSupportedOperationException < ServiceError
      end

      # The ranges specified in the request are not valid.

      class RangeNotSatisfiableException < ServiceError
      end

      # The request timed out.

      class RequestTimeoutException < ServiceError
      end

      # The target resource was not found in the current Region.

      class ResourceNotFoundException < ServiceError
      end

      # The request exceeds a service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an AWS service.

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
        when "NotSupportedOperationException"
          NotSupportedOperationException.new(message)
        when "RangeNotSatisfiableException"
          RangeNotSatisfiableException.new(message)
        when "RequestTimeoutException"
          RequestTimeoutException.new(message)
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
