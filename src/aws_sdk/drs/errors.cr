module AwsSdk
  module Drs
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # The request could not be completed due to a conflict with the current state of the target resource.
      class ConflictException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure.
      class InternalServerException < ServiceError
      end

      # The resource for this operation was not found.
      class ResourceNotFoundException < ServiceError
      end

      # The request could not be completed because its exceeded the service quota.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.
      class ThrottlingException < ServiceError
      end

      # The account performing the request has not been initialized.
      class UninitializedAccountException < ServiceError
      end

      # The input fails to satisfy the constraints specified by the AWS service.
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
        when "UninitializedAccountException"
          UninitializedAccountException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
