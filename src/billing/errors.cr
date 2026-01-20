module Aws
  module Billing
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Exception thrown when a billing view's health status prevents an operation from being performed.
      # This may occur if the billing view is in a state other than HEALTHY .

      class BillingViewHealthStatusException < ServiceError
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.

      class ConflictException < ServiceError
      end

      # The request processing failed because of an unknown error, exception, or failure.

      class InternalServerException < ServiceError
      end

      # The specified ARN in the request doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # You've reached the limit of resources you can create, or exceeded the size of an individual
      # resource.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BillingViewHealthStatusException"
          BillingViewHealthStatusException.new(message)
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
