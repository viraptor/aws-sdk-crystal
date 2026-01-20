module Aws
  module DevOpsGuru
    module Errors
      class ServiceError < Exception
      end

      # You don't have permissions to perform the requested operation. The user or role that is making the
      # request must have at least one IAM permissions policy attached that grants the required permissions.
      # For more information, see Access Management in the IAM User Guide .

      class AccessDeniedException < ServiceError
      end

      # An exception that is thrown when a conflict occurs.

      class ConflictException < ServiceError
      end

      # An internal failure in an Amazon service occurred.

      class InternalServerException < ServiceError
      end

      # A requested resource could not be found

      class ResourceNotFoundException < ServiceError
      end

      # The request contains a value that exceeds a maximum quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to a request throttling.

      class ThrottlingException < ServiceError
      end

      # Contains information about data passed in to a field during a request that is not valid.

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
