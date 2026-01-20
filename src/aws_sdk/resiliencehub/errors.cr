module AwsSdk
  module Resiliencehub
    module Errors
      class ServiceError < Exception
      end

      # You don't have permissions to perform the requested operation. The user or role that is making the
      # request must have at least one IAM permissions policy attached that grants the required permissions.

      class AccessDeniedException < ServiceError
      end

      # This exception occurs when a conflict with a previous successful write is detected. This generally
      # occurs when the previous write did not have time to propagate to the host serving the current
      # request. A retry (with appropriate backoff logic) is the recommended response to this exception.

      class ConflictException < ServiceError
      end

      # This exception occurs when there is an internal failure in the Resilience Hub service.

      class InternalServerException < ServiceError
      end

      # This exception occurs when the specified resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # This exception occurs when you have exceeded your service quota. To perform the requested action,
      # remove some of the relevant resources, or use Service Quotas to request a service quota increase.

      class ServiceQuotaExceededException < ServiceError
      end

      # This exception occurs when you have exceeded the limit on the number of requests per second.

      class ThrottlingException < ServiceError
      end

      # This exception occurs when a request is not valid.

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
