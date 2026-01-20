module Aws
  module MigrationHubStrategy
    module Errors
      class ServiceError < Exception
      end

      # The user does not have permission to perform the action. Check the AWS Identity and Access
      # Management (IAM) policy associated with this user.

      class AccessDeniedException < ServiceError
      end

      # Exception to indicate that there is an ongoing task when a new task is created. Return when once the
      # existing tasks are complete.

      class ConflictException < ServiceError
      end

      # Dependency encountered an error.

      class DependencyException < ServiceError
      end

      # The server experienced an internal error. Try again.

      class InternalServerException < ServiceError
      end

      # The specified ID in the request is not found.

      class ResourceNotFoundException < ServiceError
      end

      # Exception to indicate that the service-linked role (SLR) is locked.

      class ServiceLinkedRoleLockClientException < ServiceError
      end

      # The AWS account has reached its quota of imports. Contact AWS Support to increase the quota for this
      # account.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The request body isn't valid.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DependencyException"
          DependencyException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceLinkedRoleLockClientException"
          ServiceLinkedRoleLockClientException.new(message)
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
