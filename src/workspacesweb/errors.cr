module Aws
  module WorkSpacesWeb
    module Errors
      class ServiceError < Exception
      end

      # Access is denied.

      class AccessDeniedException < ServiceError
      end

      # There is a conflict.

      class ConflictException < ServiceError
      end

      # There is an internal server error.

      class InternalServerException < ServiceError
      end

      # The resource cannot be found.

      class ResourceNotFoundException < ServiceError
      end

      # The service quota has been exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # There is a throttling error.

      class ThrottlingException < ServiceError
      end

      # There are too many tags.

      class TooManyTagsException < ServiceError
      end

      # There is a validation error.

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
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
