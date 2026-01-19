module AwsSdk
  module Mgn
    module Errors
      class ServiceError < Exception
      end

      # Operating denied due to a file permission or access check error.
      class AccessDeniedException < ServiceError
      end

      # The request could not be completed due to a conflict with the current state of the target resource.
      class ConflictException < ServiceError
      end

      # The server encountered an unexpected condition that prevented it from fulfilling the request.
      class InternalServerException < ServiceError
      end

      # Resource not found exception.
      class ResourceNotFoundException < ServiceError
      end

      # The request could not be completed because its exceeded the service quota.
      class ServiceQuotaExceededException < ServiceError
      end

      # Reached throttling quota exception.
      class ThrottlingException < ServiceError
      end

      # Uninitialized account exception.
      class UninitializedAccountException < ServiceError
      end

      # Validate exception.
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
