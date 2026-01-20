module Aws
  module BedrockAgentCoreControl
    module Errors
      class ServiceError < Exception
      end

      # This exception is thrown when a request is denied per access permissions

      class AccessDeniedException < ServiceError
      end

      # Exception thrown when a resource is modified concurrently by multiple requests.

      class ConcurrentModificationException < ServiceError
      end

      # This exception is thrown when there is a conflict performing an operation

      class ConflictException < ServiceError
      end

      # Exception thrown when decryption of a secret fails.

      class DecryptionFailure < ServiceError
      end

      # Exception thrown when encryption of a secret fails.

      class EncryptionFailure < ServiceError
      end

      # This exception is thrown if there was an unexpected error during processing of request

      class InternalServerException < ServiceError
      end

      # Exception thrown when a resource limit is exceeded.

      class ResourceLimitExceededException < ServiceError
      end

      # This exception is thrown when a resource referenced by the operation does not exist

      class ResourceNotFoundException < ServiceError
      end

      # An internal error occurred.

      class ServiceException < ServiceError
      end

      # This exception is thrown when a request is made beyond the service quota

      class ServiceQuotaExceededException < ServiceError
      end

      # API rate limit has been exceeded.

      class ThrottledException < ServiceError
      end

      # This exception is thrown when the number of requests exceeds the limit

      class ThrottlingException < ServiceError
      end

      # This exception is thrown when the JWT bearer token is invalid or not found for OAuth bearer token
      # based access

      class UnauthorizedException < ServiceError
      end

      # The input fails to satisfy the constraints specified by the service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DecryptionFailure"
          DecryptionFailure.new(message)
        when "EncryptionFailure"
          EncryptionFailure.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceLimitExceededException"
          ResourceLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceException"
          ServiceException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottledException"
          ThrottledException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
