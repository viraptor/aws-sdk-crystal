module Aws
  module AIOps
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permissions to perform this action.

      class AccessDeniedException < ServiceError
      end

      # This operation couldn't be completed because of a conflict in resource states.

      class ConflictException < ServiceError
      end

      # Access id denied for this operation, or this operation is not valid for the specified resource.

      class ForbiddenException < ServiceError
      end

      # An internal server error occurred. You can try again later.

      class InternalServerException < ServiceError
      end

      # The specified resource doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # This request exceeds a service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was throttled because of quota limits. You can try again later.

      class ThrottlingException < ServiceError
      end

      # This operation or its parameters aren't formatted correctly.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
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
