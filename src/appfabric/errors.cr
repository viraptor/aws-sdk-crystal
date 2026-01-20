module Aws
  module AppFabric
    module Errors
      class ServiceError < Exception
      end

      # You are not authorized to perform this operation.

      class AccessDeniedException < ServiceError
      end

      # The request has created a conflict. Check the request parameters and try again.

      class ConflictException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception, or failure with an
      # internal server.

      class InternalServerException < ServiceError
      end

      # The specified resource does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request exceeds a service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request rate exceeds the limit.

      class ThrottlingException < ServiceError
      end

      # The request has invalid or missing parameters.

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
