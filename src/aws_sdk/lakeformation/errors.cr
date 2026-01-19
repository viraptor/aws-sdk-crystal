module AwsSdk
  module LakeFormation
    module Errors
      class ServiceError < Exception
      end

      # Access to a resource was denied.
      class AccessDeniedException < ServiceError
      end

      # A resource to be created or added already exists.
      class AlreadyExistsException < ServiceError
      end

      # Two processes are trying to modify a resource simultaneously.
      class ConcurrentModificationException < ServiceError
      end

      # Multiple resources exist with the same Amazon S3 location
      class ConflictException < ServiceError
      end

      # A specified entity does not exist.
      class EntityNotFoundException < ServiceError
      end

      # Contains details about an error where the query request expired.
      class ExpiredException < ServiceError
      end

      # An encryption operation failed.
      class GlueEncryptionException < ServiceError
      end

      # An internal service error occurred.
      class InternalServiceException < ServiceError
      end

      # The input provided was not valid.
      class InvalidInputException < ServiceError
      end

      # The operation timed out.
      class OperationTimeoutException < ServiceError
      end

      # The engine does not support filtering data based on the enforced permissions. For example, if you
      # call the GetTemporaryGlueTableCredentials operation with SupportedPermissionType equal to
      # ColumnPermission , but cell-level permissions exist on the table, this exception is thrown.
      class PermissionTypeMismatchException < ServiceError
      end

      # Contains details about an error related to a resource which is not ready for a transaction.
      class ResourceNotReadyException < ServiceError
      end

      # A resource numerical limit was exceeded.
      class ResourceNumberLimitExceededException < ServiceError
      end

      # Contains details about an error related to statistics not being ready.
      class StatisticsNotReadyYetException < ServiceError
      end

      # Contains details about an error where the query request was throttled.
      class ThrottledException < ServiceError
      end

      # Contains details about an error related to a transaction that was cancelled.
      class TransactionCanceledException < ServiceError
      end

      # Contains details about an error related to a transaction commit that was in progress.
      class TransactionCommitInProgressException < ServiceError
      end

      # Contains details about an error where the specified transaction has already been committed and
      # cannot be used for UpdateTableObjects .
      class TransactionCommittedException < ServiceError
      end

      # Contains details about an error related to work units not being ready.
      class WorkUnitsNotReadyYetException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "EntityNotFoundException"
          EntityNotFoundException.new(message)
        when "ExpiredException"
          ExpiredException.new(message)
        when "GlueEncryptionException"
          GlueEncryptionException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "OperationTimeoutException"
          OperationTimeoutException.new(message)
        when "PermissionTypeMismatchException"
          PermissionTypeMismatchException.new(message)
        when "ResourceNotReadyException"
          ResourceNotReadyException.new(message)
        when "ResourceNumberLimitExceededException"
          ResourceNumberLimitExceededException.new(message)
        when "StatisticsNotReadyYetException"
          StatisticsNotReadyYetException.new(message)
        when "ThrottledException"
          ThrottledException.new(message)
        when "TransactionCanceledException"
          TransactionCanceledException.new(message)
        when "TransactionCommitInProgressException"
          TransactionCommitInProgressException.new(message)
        when "TransactionCommittedException"
          TransactionCommittedException.new(message)
        when "WorkUnitsNotReadyYetException"
          WorkUnitsNotReadyYetException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
