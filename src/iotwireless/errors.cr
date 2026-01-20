module Aws
  module IoTWireless
    module Errors
      class ServiceError < Exception
      end

      # User does not have permission to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Adding, updating, or deleting the resource can cause an inconsistent state.

      class ConflictException < ServiceError
      end

      # An unexpected error occurred while processing a request.

      class InternalServerException < ServiceError
      end

      # Resource does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request was denied because it exceeded the allowed API request rate.

      class ThrottlingException < ServiceError
      end

      # The request was denied because the resource can't have any more tags.

      class TooManyTagsException < ServiceError
      end

      # The input did not meet the specified constraints.

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
