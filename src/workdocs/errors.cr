module Aws
  module WorkDocs
    module Errors
      class ServiceError < Exception
      end

      # The resource hierarchy is changing.

      class ConcurrentModificationException < ServiceError
      end

      # Another operation is in progress on the resource that conflicts with the current operation.

      class ConflictingOperationException < ServiceError
      end

      # The limit has been reached on the number of custom properties for the specified resource.

      class CustomMetadataLimitExceededException < ServiceError
      end

      # The last user in the organization is being deactivated.

      class DeactivatingLastSystemUserException < ServiceError
      end

      # This exception is thrown when the document is locked for comments and user tries to create or delete
      # a comment on that document.

      class DocumentLockedForCommentsException < ServiceError
      end

      # This exception is thrown when a valid checkout ID is not presented on document version upload calls
      # for a document that has been checked out from Web client.

      class DraftUploadOutOfSyncException < ServiceError
      end

      # The resource already exists.

      class EntityAlreadyExistsException < ServiceError
      end

      # The resource does not exist.

      class EntityNotExistsException < ServiceError
      end

      # The Directory Service cannot reach an on-premises instance. Or a dependency under the control of the
      # organization is failing, such as a connected Active Directory.

      class FailedDependencyException < ServiceError
      end

      # The user is undergoing transfer of ownership.

      class IllegalUserStateException < ServiceError
      end

      # The pagination marker or limit fields are not valid.

      class InvalidArgumentException < ServiceError
      end

      # The requested operation is not allowed on the specified comment object.

      class InvalidCommentOperationException < ServiceError
      end

      # The operation is invalid.

      class InvalidOperationException < ServiceError
      end

      # The password is invalid.

      class InvalidPasswordException < ServiceError
      end

      # The maximum of 100,000 files and folders under the parent folder has been exceeded.

      class LimitExceededException < ServiceError
      end

      # The specified document version is not in the INITIALIZED state.

      class ProhibitedStateException < ServiceError
      end

      # The response is too large to return. The request must include a filter to reduce the size of the
      # response.

      class RequestedEntityTooLargeException < ServiceError
      end

      # The resource is already checked out.

      class ResourceAlreadyCheckedOutException < ServiceError
      end

      # One or more of the dependencies is unavailable.

      class ServiceUnavailableException < ServiceError
      end

      # The storage limit has been exceeded.

      class StorageLimitExceededException < ServiceError
      end

      # The storage limit will be exceeded.

      class StorageLimitWillExceedException < ServiceError
      end

      # The limit has been reached on the number of labels for the specified resource.

      class TooManyLabelsException < ServiceError
      end

      # You've reached the limit on the number of subscriptions for the WorkDocs instance.

      class TooManySubscriptionsException < ServiceError
      end

      # The operation is not permitted.

      class UnauthorizedOperationException < ServiceError
      end

      # The caller does not have access to perform the action on the resource.

      class UnauthorizedResourceAccessException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConflictingOperationException"
          ConflictingOperationException.new(message)
        when "CustomMetadataLimitExceededException"
          CustomMetadataLimitExceededException.new(message)
        when "DeactivatingLastSystemUserException"
          DeactivatingLastSystemUserException.new(message)
        when "DocumentLockedForCommentsException"
          DocumentLockedForCommentsException.new(message)
        when "DraftUploadOutOfSyncException"
          DraftUploadOutOfSyncException.new(message)
        when "EntityAlreadyExistsException"
          EntityAlreadyExistsException.new(message)
        when "EntityNotExistsException"
          EntityNotExistsException.new(message)
        when "FailedDependencyException"
          FailedDependencyException.new(message)
        when "IllegalUserStateException"
          IllegalUserStateException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "InvalidCommentOperationException"
          InvalidCommentOperationException.new(message)
        when "InvalidOperationException"
          InvalidOperationException.new(message)
        when "InvalidPasswordException"
          InvalidPasswordException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ProhibitedStateException"
          ProhibitedStateException.new(message)
        when "RequestedEntityTooLargeException"
          RequestedEntityTooLargeException.new(message)
        when "ResourceAlreadyCheckedOutException"
          ResourceAlreadyCheckedOutException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "StorageLimitExceededException"
          StorageLimitExceededException.new(message)
        when "StorageLimitWillExceedException"
          StorageLimitWillExceedException.new(message)
        when "TooManyLabelsException"
          TooManyLabelsException.new(message)
        when "TooManySubscriptionsException"
          TooManySubscriptionsException.new(message)
        when "UnauthorizedOperationException"
          UnauthorizedOperationException.new(message)
        when "UnauthorizedResourceAccessException"
          UnauthorizedResourceAccessException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
