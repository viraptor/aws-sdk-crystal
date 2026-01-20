module Aws
  module DocDBElastic
    module Errors
      class ServiceError < Exception
      end

      # An exception that occurs when there are not sufficient permissions to perform an action.

      class AccessDeniedException < ServiceError
      end

      # There was an access conflict.

      class ConflictException < ServiceError
      end

      # There was an internal server error.

      class InternalServerException < ServiceError
      end

      # The specified resource could not be located.

      class ResourceNotFoundException < ServiceError
      end

      # The service quota for the action was exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # ThrottlingException will be thrown when request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # A structure defining a validation exception.

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
