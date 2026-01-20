module AwsSdk
  module RolesAnywhere
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # Too many tags.

      class TooManyTagsException < ServiceError
      end

      # Validation exception error.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
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
