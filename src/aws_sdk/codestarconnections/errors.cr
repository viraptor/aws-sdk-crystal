module AwsSdk
  module CodeStarConnections
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # Exception thrown as a result of concurrent modification to an application. For example, two
      # individuals attempting to edit the same application at the same time.

      class ConcurrentModificationException < ServiceError
      end

      # The conditional check failed. Try again later.

      class ConditionalCheckFailedException < ServiceError
      end

      # Two conflicting operations have been made on the same resource.

      class ConflictException < ServiceError
      end

      # Received an internal server exception. Try again later.

      class InternalServerException < ServiceError
      end

      # The input is not valid. Verify that the action is typed correctly.

      class InvalidInputException < ServiceError
      end

      # Exceeded the maximum limit for connections.

      class LimitExceededException < ServiceError
      end

      # Unable to create resource. Resource already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # Resource not found. Verify the connection resource ARN and try again.

      class ResourceNotFoundException < ServiceError
      end

      # Resource not found. Verify the ARN for the host resource and try again.

      class ResourceUnavailableException < ServiceError
      end

      # Retrying the latest commit failed. Try again later.

      class RetryLatestCommitFailedException < ServiceError
      end

      # Unable to continue. The sync blocker does not exist.

      class SyncBlockerDoesNotExistException < ServiceError
      end

      # Unable to continue. The sync blocker still exists.

      class SyncConfigurationStillExistsException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The operation is not supported. Check the connection status and try again.

      class UnsupportedOperationException < ServiceError
      end

      # The specified provider type is not supported for connections.

      class UnsupportedProviderTypeException < ServiceError
      end

      # The update is out of sync. Try syncing again.

      class UpdateOutOfSyncException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConditionalCheckFailedException"
          ConditionalCheckFailedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceUnavailableException"
          ResourceUnavailableException.new(message)
        when "RetryLatestCommitFailedException"
          RetryLatestCommitFailedException.new(message)
        when "SyncBlockerDoesNotExistException"
          SyncBlockerDoesNotExistException.new(message)
        when "SyncConfigurationStillExistsException"
          SyncConfigurationStillExistsException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        when "UnsupportedProviderTypeException"
          UnsupportedProviderTypeException.new(message)
        when "UpdateOutOfSyncException"
          UpdateOutOfSyncException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
