module Aws
  module MailManager
    module Errors
      class ServiceError < Exception
      end

      # Occurs when a user is denied access to a specific resource or action.

      class AccessDeniedException < ServiceError
      end

      # The request configuration has conflicts. For details, see the accompanying error message.

      class ConflictException < ServiceError
      end

      # Occurs when a requested resource is not found.

      class ResourceNotFoundException < ServiceError
      end

      # Occurs when an operation exceeds a predefined service quota or limit.

      class ServiceQuotaExceededException < ServiceError
      end

      # Occurs when a service's request rate limit is exceeded, resulting in throttling of further requests.

      class ThrottlingException < ServiceError
      end

      # The request validation has failed. For details, see the accompanying error message.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
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
