module AwsSdk
  module Glue
    module Errors
      class ServiceError < Exception
      end

      # Access to a resource was denied.

      class AccessDeniedException < ServiceError
      end

      # A resource to be created or added already exists.

      class AlreadyExistsException < ServiceError
      end

      # An exception thrown when you try to stop a task run when there is no task running.

      class ColumnStatisticsTaskNotRunningException < ServiceError
      end

      # An exception thrown when you try to start another job while running a column stats generation job.

      class ColumnStatisticsTaskRunningException < ServiceError
      end

      # An exception thrown when you try to stop a task run.

      class ColumnStatisticsTaskStoppingException < ServiceError
      end

      # Two processes are trying to modify a resource simultaneously.

      class ConcurrentModificationException < ServiceError
      end

      # Too many jobs are being run concurrently.

      class ConcurrentRunsExceededException < ServiceError
      end

      # A specified condition was not satisfied.

      class ConditionCheckFailureException < ServiceError
      end

      # The CreatePartitions API was called on a table that has indexes enabled.

      class ConflictException < ServiceError
      end

      # The specified crawler is not running.

      class CrawlerNotRunningException < ServiceError
      end

      # The operation cannot be performed because the crawler is already running.

      class CrawlerRunningException < ServiceError
      end

      # The specified crawler is stopping.

      class CrawlerStoppingException < ServiceError
      end

      # A specified entity does not exist

      class EntityNotFoundException < ServiceError
      end

      # A federated resource already exists.

      class FederatedResourceAlreadyExistsException < ServiceError
      end

      # A federation source failed.

      class FederationSourceException < ServiceError
      end

      # A federation source failed, but the operation may be retried.

      class FederationSourceRetryableException < ServiceError
      end

      # An encryption operation failed.

      class GlueEncryptionException < ServiceError
      end

      # The same unique identifier was associated with two different records.

      class IdempotentParameterMismatchException < ServiceError
      end

      # The blueprint is in an invalid state to perform a requested operation.

      class IllegalBlueprintStateException < ServiceError
      end

      # The session is in an invalid state to perform a requested operation.

      class IllegalSessionStateException < ServiceError
      end

      # The workflow is in an invalid state to perform a requested operation.

      class IllegalWorkflowStateException < ServiceError
      end

      # The requested operation conflicts with another operation.

      class IntegrationConflictOperationFault < ServiceError
      end

      # The specified integration could not be found.

      class IntegrationNotFoundFault < ServiceError
      end

      # The data processed through your integration exceeded your quota.

      class IntegrationQuotaExceededFault < ServiceError
      end

      # An internal server error occurred.

      class InternalServerException < ServiceError
      end

      # An internal service error occurred.

      class InternalServiceException < ServiceError
      end

      # The input provided was not valid.

      class InvalidInputException < ServiceError
      end

      # The integration is in an invalid state.

      class InvalidIntegrationStateFault < ServiceError
      end

      # An error that indicates your data is in an invalid state.

      class InvalidStateException < ServiceError
      end

      # The KMS key specified is not accessible.

      class KMSKeyNotAccessibleFault < ServiceError
      end

      # The machine learning transform is not ready to run.

      class MLTransformNotReadyException < ServiceError
      end

      # Exception thrown when stopping a task that is not in running state.

      class MaterializedViewRefreshTaskNotRunningException < ServiceError
      end

      # Exception thrown when a task is already in running state.

      class MaterializedViewRefreshTaskRunningException < ServiceError
      end

      # Exception thrown when a task is already in stopping state.

      class MaterializedViewRefreshTaskStoppingException < ServiceError
      end

      # There is no applicable schedule.

      class NoScheduleException < ServiceError
      end

      # The operation is not available in the region.

      class OperationNotSupportedException < ServiceError
      end

      # The operation timed out.

      class OperationTimeoutException < ServiceError
      end

      # The operation timed out.

      class PermissionTypeMismatchException < ServiceError
      end

      # The resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # A resource was not ready for a transaction.

      class ResourceNotReadyException < ServiceError
      end

      # A resource numerical limit was exceeded.

      class ResourceNumberLimitExceededException < ServiceError
      end

      # The specified scheduler is not running.

      class SchedulerNotRunningException < ServiceError
      end

      # The specified scheduler is already running.

      class SchedulerRunningException < ServiceError
      end

      # The specified scheduler is transitioning.

      class SchedulerTransitioningException < ServiceError
      end

      # The target resource could not be found.

      class TargetResourceNotFound < ServiceError
      end

      # The throttling threshhold was exceeded.

      class ThrottlingException < ServiceError
      end

      # A value could not be validated.

      class ValidationException < ServiceError
      end

      # There was a version conflict.

      class VersionMismatchException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "ColumnStatisticsTaskNotRunningException"
          ColumnStatisticsTaskNotRunningException.new(message)
        when "ColumnStatisticsTaskRunningException"
          ColumnStatisticsTaskRunningException.new(message)
        when "ColumnStatisticsTaskStoppingException"
          ColumnStatisticsTaskStoppingException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConcurrentRunsExceededException"
          ConcurrentRunsExceededException.new(message)
        when "ConditionCheckFailureException"
          ConditionCheckFailureException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "CrawlerNotRunningException"
          CrawlerNotRunningException.new(message)
        when "CrawlerRunningException"
          CrawlerRunningException.new(message)
        when "CrawlerStoppingException"
          CrawlerStoppingException.new(message)
        when "EntityNotFoundException"
          EntityNotFoundException.new(message)
        when "FederatedResourceAlreadyExistsException"
          FederatedResourceAlreadyExistsException.new(message)
        when "FederationSourceException"
          FederationSourceException.new(message)
        when "FederationSourceRetryableException"
          FederationSourceRetryableException.new(message)
        when "GlueEncryptionException"
          GlueEncryptionException.new(message)
        when "IdempotentParameterMismatchException"
          IdempotentParameterMismatchException.new(message)
        when "IllegalBlueprintStateException"
          IllegalBlueprintStateException.new(message)
        when "IllegalSessionStateException"
          IllegalSessionStateException.new(message)
        when "IllegalWorkflowStateException"
          IllegalWorkflowStateException.new(message)
        when "IntegrationConflictOperationFault"
          IntegrationConflictOperationFault.new(message)
        when "IntegrationNotFoundFault"
          IntegrationNotFoundFault.new(message)
        when "IntegrationQuotaExceededFault"
          IntegrationQuotaExceededFault.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "InvalidIntegrationStateFault"
          InvalidIntegrationStateFault.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "KMSKeyNotAccessibleFault"
          KMSKeyNotAccessibleFault.new(message)
        when "MLTransformNotReadyException"
          MLTransformNotReadyException.new(message)
        when "MaterializedViewRefreshTaskNotRunningException"
          MaterializedViewRefreshTaskNotRunningException.new(message)
        when "MaterializedViewRefreshTaskRunningException"
          MaterializedViewRefreshTaskRunningException.new(message)
        when "MaterializedViewRefreshTaskStoppingException"
          MaterializedViewRefreshTaskStoppingException.new(message)
        when "NoScheduleException"
          NoScheduleException.new(message)
        when "OperationNotSupportedException"
          OperationNotSupportedException.new(message)
        when "OperationTimeoutException"
          OperationTimeoutException.new(message)
        when "PermissionTypeMismatchException"
          PermissionTypeMismatchException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceNotReadyException"
          ResourceNotReadyException.new(message)
        when "ResourceNumberLimitExceededException"
          ResourceNumberLimitExceededException.new(message)
        when "SchedulerNotRunningException"
          SchedulerNotRunningException.new(message)
        when "SchedulerRunningException"
          SchedulerRunningException.new(message)
        when "SchedulerTransitioningException"
          SchedulerTransitioningException.new(message)
        when "TargetResourceNotFound"
          TargetResourceNotFound.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        when "VersionMismatchException"
          VersionMismatchException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
