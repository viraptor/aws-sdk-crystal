module AwsSdk
  module BackupSearch
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # This exception occurs when a conflict with a previous successful operation is detected. This
      # generally occurs when the previous operation did not have time to propagate to the host serving the
      # current request. A retry (with appropriate backoff logic) is the recommended response to this
      # exception.

      class ConflictException < ServiceError
      end

      # An internal server error occurred. Retry your request.

      class InternalServerException < ServiceError
      end

      # The resource was not found for this request. Confirm the resource information, such as the ARN or
      # type is correct and exists, then retry the request.

      class ResourceNotFoundException < ServiceError
      end

      # The request denied due to exceeding the quota limits permitted.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by a service.

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
