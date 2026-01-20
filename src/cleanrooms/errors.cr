module Aws
  module CleanRooms
    module Errors
      class ServiceError < Exception
      end

      # Caller does not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Updating or deleting a resource can cause an inconsistent state.

      class ConflictException < ServiceError
      end

      # Unexpected error during processing of request.

      class InternalServerException < ServiceError
      end

      # Request references a resource which does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # Request denied because service quota has been exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # Request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the specified constraints.

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
