module Aws
  module ObservabilityAdmin
    module Errors
      class ServiceError < Exception
      end

      # Indicates you don't have permissions to perform the requested operation. The user or role that is
      # making the request must have at least one IAM permissions policy attached that grants the required
      # permissions. For more information, see Access management for Amazon Web Services resources in the
      # IAM user guide.

      class AccessDeniedException < ServiceError
      end

      # The requested operation conflicts with the current state of the specified resource or with another
      # request.

      class ConflictException < ServiceError
      end

      # Indicates the request has failed to process because of an unknown server error, exception, or
      # failure.

      class InternalServerException < ServiceError
      end

      # The requested operation cannot be completed on the specified resource in the current state.

      class InvalidStateException < ServiceError
      end

      # The specified resource (such as a telemetry rule) could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The requested operation would exceed the allowed quota for the specified resource type.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request throughput limit was exceeded.

      class TooManyRequestsException < ServiceError
      end

      # Indicates input validation failed. Check your request parameters and retry the request.

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
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
