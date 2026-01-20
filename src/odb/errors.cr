module Aws
  module Odb
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access to perform this action. Make sure you have the required permissions
      # and try again.

      class AccessDeniedException < ServiceError
      end

      # Occurs when a conflict with the current status of your resource. Fix any inconsistencies with your
      # resource and try again.

      class ConflictException < ServiceError
      end

      # Occurs when there is an internal failure in the Oracle Database@Amazon Web Services service. Wait
      # and try again.

      class InternalServerException < ServiceError
      end

      # The operation tried to access a resource that doesn't exist. Make sure you provided the correct
      # resource and try again.

      class ResourceNotFoundException < ServiceError
      end

      # You have exceeded the service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The request has failed validation because it is missing required fields or has invalid inputs.

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
