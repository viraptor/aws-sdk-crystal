module AwsSdk
  module CloudFormation
    module Errors
      class ServiceError < Exception
      end

      # The resource with the name requested already exists.
      class AlreadyExistsException < ServiceError
      end

      # An error occurred during a CloudFormation registry operation.
      class CFNRegistryException < ServiceError
      end

      # The specified change set name or ID doesn't exit. To view valid change sets for a stack, use the
      # ListChangeSets operation.
      class ChangeSetNotFoundException < ServiceError
      end

      # No more than 5 generated templates can be in an InProgress or Pending status at one time. This error
      # is also returned if a generated template that is in an InProgress or Pending status is attempted to
      # be updated or deleted.
      class ConcurrentResourcesLimitExceededException < ServiceError
      end

      # The specified resource exists, but has been changed.
      class CreatedButModifiedException < ServiceError
      end

      # The generated template was not found.
      class GeneratedTemplateNotFoundException < ServiceError
      end

      # The specified target doesn't have any requested Hook invocations.
      class HookResultNotFoundException < ServiceError
      end

      # The template contains resources with capabilities that weren't specified in the Capabilities
      # parameter.
      class InsufficientCapabilitiesException < ServiceError
      end

      # The specified change set can't be used to update the stack. For example, the change set status might
      # be CREATE_IN_PROGRESS , or the stack status might be UPDATE_IN_PROGRESS .
      class InvalidChangeSetStatusException < ServiceError
      end

      # The specified operation isn't valid.
      class InvalidOperationException < ServiceError
      end

      # Error reserved for use by the CloudFormation CLI . CloudFormation doesn't return this error to
      # users.
      class InvalidStateTransitionException < ServiceError
      end

      # The quota for the resource has already been reached. For information about resource and stack
      # limitations, see CloudFormation quotas in the CloudFormation User Guide .
      class LimitExceededException < ServiceError
      end

      # The specified name is already in use.
      class NameAlreadyExistsException < ServiceError
      end

      # The specified operation ID already exists.
      class OperationIdAlreadyExistsException < ServiceError
      end

      # Another operation is currently in progress for this StackSet. Only one operation can be performed
      # for a stack set at a given time.
      class OperationInProgressException < ServiceError
      end

      # The specified ID refers to an operation that doesn't exist.
      class OperationNotFoundException < ServiceError
      end

      # Error reserved for use by the CloudFormation CLI . CloudFormation doesn't return this error to
      # users.
      class OperationStatusCheckFailedException < ServiceError
      end

      # A resource scan is currently in progress. Only one can be run at a time for an account in a Region.
      class ResourceScanInProgressException < ServiceError
      end

      # The limit on resource scans has been exceeded. Reasons include: Exceeded the daily quota for
      # resource scans. A resource scan recently failed. You must wait 10 minutes before starting a new
      # resource scan. The last resource scan failed after exceeding 100,000 resources. When this happens,
      # you must wait 24 hours before starting a new resource scan.
      class ResourceScanLimitExceededException < ServiceError
      end

      # The resource scan was not found.
      class ResourceScanNotFoundException < ServiceError
      end

      # The specified stack instance doesn't exist.
      class StackInstanceNotFoundException < ServiceError
      end

      # The specified stack ARN doesn't exist or stack doesn't exist corresponding to the ARN in input.
      class StackNotFoundException < ServiceError
      end

      # The specified stack refactor can't be found.
      class StackRefactorNotFoundException < ServiceError
      end

      # You can't yet delete this StackSet, because it still contains one or more stack instances. Delete
      # all stack instances from the StackSet before deleting the StackSet.
      class StackSetNotEmptyException < ServiceError
      end

      # The specified StackSet doesn't exist.
      class StackSetNotFoundException < ServiceError
      end

      # Another operation has been performed on this StackSet since the specified operation was performed.
      class StaleRequestException < ServiceError
      end

      # A client request token already exists.
      class TokenAlreadyExistsException < ServiceError
      end

      # The specified extension configuration can't be found.
      class TypeConfigurationNotFoundException < ServiceError
      end

      # The specified extension doesn't exist in the CloudFormation registry.
      class TypeNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "CFNRegistryException"
          CFNRegistryException.new(message)
        when "ChangeSetNotFoundException"
          ChangeSetNotFoundException.new(message)
        when "ConcurrentResourcesLimitExceededException"
          ConcurrentResourcesLimitExceededException.new(message)
        when "CreatedButModifiedException"
          CreatedButModifiedException.new(message)
        when "GeneratedTemplateNotFoundException"
          GeneratedTemplateNotFoundException.new(message)
        when "HookResultNotFoundException"
          HookResultNotFoundException.new(message)
        when "InsufficientCapabilitiesException"
          InsufficientCapabilitiesException.new(message)
        when "InvalidChangeSetStatusException"
          InvalidChangeSetStatusException.new(message)
        when "InvalidOperationException"
          InvalidOperationException.new(message)
        when "InvalidStateTransitionException"
          InvalidStateTransitionException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NameAlreadyExistsException"
          NameAlreadyExistsException.new(message)
        when "OperationIdAlreadyExistsException"
          OperationIdAlreadyExistsException.new(message)
        when "OperationInProgressException"
          OperationInProgressException.new(message)
        when "OperationNotFoundException"
          OperationNotFoundException.new(message)
        when "OperationStatusCheckFailedException"
          OperationStatusCheckFailedException.new(message)
        when "ResourceScanInProgressException"
          ResourceScanInProgressException.new(message)
        when "ResourceScanLimitExceededException"
          ResourceScanLimitExceededException.new(message)
        when "ResourceScanNotFoundException"
          ResourceScanNotFoundException.new(message)
        when "StackInstanceNotFoundException"
          StackInstanceNotFoundException.new(message)
        when "StackNotFoundException"
          StackNotFoundException.new(message)
        when "StackRefactorNotFoundException"
          StackRefactorNotFoundException.new(message)
        when "StackSetNotEmptyException"
          StackSetNotEmptyException.new(message)
        when "StackSetNotFoundException"
          StackSetNotFoundException.new(message)
        when "StaleRequestException"
          StaleRequestException.new(message)
        when "TokenAlreadyExistsException"
          TokenAlreadyExistsException.new(message)
        when "TypeConfigurationNotFoundException"
          TypeConfigurationNotFoundException.new(message)
        when "TypeNotFoundException"
          TypeNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
