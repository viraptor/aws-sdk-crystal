module Aws
  module RUM
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permissions to perform this action.

      class AccessDeniedException < ServiceError
      end

      # This operation attempted to create a resource that already exists.

      class ConflictException < ServiceError
      end

      # Internal service exception.

      class InternalServerException < ServiceError
      end

      # The policy revision ID that you provided doeesn't match the latest policy revision ID.

      class InvalidPolicyRevisionIdException < ServiceError
      end

      # The policy document that you specified is not formatted correctly.

      class MalformedPolicyDocumentException < ServiceError
      end

      # The resource-based policy doesn't exist on this app monitor.

      class PolicyNotFoundException < ServiceError
      end

      # The policy document is too large. The limit is 4 KB.

      class PolicySizeLimitExceededException < ServiceError
      end

      # Resource not found.

      class ResourceNotFoundException < ServiceError
      end

      # This request exceeds a service quota.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was throttled because of quota limits.

      class ThrottlingException < ServiceError
      end

      # One of the arguments for the request is not valid.

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
        when "InvalidPolicyRevisionIdException"
          InvalidPolicyRevisionIdException.new(message)
        when "MalformedPolicyDocumentException"
          MalformedPolicyDocumentException.new(message)
        when "PolicyNotFoundException"
          PolicyNotFoundException.new(message)
        when "PolicySizeLimitExceededException"
          PolicySizeLimitExceededException.new(message)
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
