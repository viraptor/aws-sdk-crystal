module Aws
  module GreengrassV2
    module Errors
      class ServiceError < Exception
      end

      # You don't have permission to perform the action.

      class AccessDeniedException < ServiceError
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time.

      class ConflictException < ServiceError
      end

      # IoT Greengrass can't process your request right now. Try again later.

      class InternalServerException < ServiceError
      end

      # The request is already in progress. This exception occurs when you use a client token for multiple
      # requests while IoT Greengrass is still processing an earlier request that uses the same client
      # token.

      class RequestAlreadyInProgressException < ServiceError
      end

      # The requested resource can't be found.

      class ResourceNotFoundException < ServiceError
      end

      # Your request exceeds a service quota. For example, you might have the maximum number of components
      # that you can create.

      class ServiceQuotaExceededException < ServiceError
      end

      # Your request exceeded a request rate quota. For example, you might have exceeded the amount of times
      # that you can retrieve device or deployment status per second.

      class ThrottlingException < ServiceError
      end

      # The request isn't valid. This can occur if your request contains malformed JSON or unsupported
      # characters.

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
        when "RequestAlreadyInProgressException"
          RequestAlreadyInProgressException.new(message)
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
