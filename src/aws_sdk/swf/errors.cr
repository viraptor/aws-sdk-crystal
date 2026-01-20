module AwsSdk
  module SWF
    module Errors
      class ServiceError < Exception
      end

      # The StartWorkflowExecution API action was called without the required parameters set. Some workflow
      # execution parameters, such as the decision taskList , must be set to start the execution. However,
      # these parameters might have been set as defaults when the workflow type was registered. In this
      # case, you can omit these parameters from the StartWorkflowExecution call and Amazon SWF uses the
      # values defined in the workflow type. If these parameters aren't set and no default parameters were
      # defined in the workflow type, this error is displayed.

      class DefaultUndefinedFault < ServiceError
      end

      # Returned if the domain already exists. You may get this fault if you are registering a domain that
      # is either already registered or deprecated, or if you undeprecate a domain that is currently
      # registered.

      class DomainAlreadyExistsFault < ServiceError
      end

      # Returned when the specified domain has been deprecated.

      class DomainDeprecatedFault < ServiceError
      end

      # Returned by any operation if a system imposed limitation has been reached. To address this fault you
      # should either clean up unused resources or increase the limit by contacting AWS.

      class LimitExceededFault < ServiceError
      end

      # Returned when the caller doesn't have sufficient permissions to invoke the action.

      class OperationNotPermittedFault < ServiceError
      end

      # You've exceeded the number of tags allowed for a domain.

      class TooManyTagsFault < ServiceError
      end

      # Returned if the type already exists in the specified domain. You may get this fault if you are
      # registering a type that is either already registered or deprecated, or if you undeprecate a type
      # that is currently registered.

      class TypeAlreadyExistsFault < ServiceError
      end

      # Returned when the specified activity or workflow type was already deprecated.

      class TypeDeprecatedFault < ServiceError
      end

      # Returned when the resource type has not been deprecated.

      class TypeNotDeprecatedFault < ServiceError
      end

      # Returned when the named resource cannot be found with in the scope of this operation (region or
      # domain). This could happen if the named resource was never created or is no longer available for
      # this operation.

      class UnknownResourceFault < ServiceError
      end

      # Returned by StartWorkflowExecution when an open execution with the same workflowId is already
      # running in the specified domain.

      class WorkflowExecutionAlreadyStartedFault < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "DefaultUndefinedFault"
          DefaultUndefinedFault.new(message)
        when "DomainAlreadyExistsFault"
          DomainAlreadyExistsFault.new(message)
        when "DomainDeprecatedFault"
          DomainDeprecatedFault.new(message)
        when "LimitExceededFault"
          LimitExceededFault.new(message)
        when "OperationNotPermittedFault"
          OperationNotPermittedFault.new(message)
        when "TooManyTagsFault"
          TooManyTagsFault.new(message)
        when "TypeAlreadyExistsFault"
          TypeAlreadyExistsFault.new(message)
        when "TypeDeprecatedFault"
          TypeDeprecatedFault.new(message)
        when "TypeNotDeprecatedFault"
          TypeNotDeprecatedFault.new(message)
        when "UnknownResourceFault"
          UnknownResourceFault.new(message)
        when "WorkflowExecutionAlreadyStartedFault"
          WorkflowExecutionAlreadyStartedFault.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
