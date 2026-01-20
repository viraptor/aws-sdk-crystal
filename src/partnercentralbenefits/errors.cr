module Aws
  module PartnerCentralBenefits
    module Errors
      class ServiceError < Exception
      end

      # Thrown when the caller does not have sufficient permissions to perform the requested operation.

      class AccessDeniedException < ServiceError
      end

      # Thrown when the request conflicts with the current state of the resource, such as attempting to
      # modify a resource that has been changed by another process.

      class ConflictException < ServiceError
      end

      # Thrown when an unexpected error occurs on the server side during request processing.

      class InternalServerException < ServiceError
      end

      # Thrown when the requested resource cannot be found or does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # Thrown when the request would exceed the service quotas or limits for the account.

      class ServiceQuotaExceededException < ServiceError
      end

      # Thrown when the request rate exceeds the allowed limits and the request is being throttled.

      class ThrottlingException < ServiceError
      end

      # Thrown when the request contains invalid parameters or fails input validation requirements.

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
