module Aws
  module SFN
    module Errors
      class ServiceError < Exception
      end

      # Activity already exists. EncryptionConfiguration may not be updated.

      class ActivityAlreadyExists < ServiceError
      end

      # The specified activity does not exist.

      class ActivityDoesNotExist < ServiceError
      end

      # The maximum number of activities has been reached. Existing activities must be deleted before a new
      # activity can be created.

      class ActivityLimitExceeded < ServiceError
      end

      # The maximum number of workers concurrently polling for activity tasks has been reached.

      class ActivityWorkerLimitExceeded < ServiceError
      end

      # Updating or deleting a resource can cause an inconsistent state. This error occurs when there're
      # concurrent requests for DeleteStateMachineVersion , PublishStateMachineVersion , or
      # UpdateStateMachine with the publish parameter set to true . HTTP Status Code: 409

      class ConflictException < ServiceError
      end

      # The execution has the same name as another execution (but a different input ). Executions with the
      # same name and input are considered idempotent.

      class ExecutionAlreadyExists < ServiceError
      end

      # The specified execution does not exist.

      class ExecutionDoesNotExist < ServiceError
      end

      # The maximum number of running executions has been reached. Running executions must end or be stopped
      # before a new execution can be started.

      class ExecutionLimitExceeded < ServiceError
      end

      # The execution Amazon Resource Name (ARN) that you specified for executionArn cannot be redriven.

      class ExecutionNotRedrivable < ServiceError
      end

      # The provided Amazon Resource Name (ARN) is not valid.

      class InvalidArn < ServiceError
      end

      # The provided Amazon States Language definition is not valid.

      class InvalidDefinition < ServiceError
      end

      # Received when encryptionConfiguration is specified but various conditions exist which make the
      # configuration invalid. For example, if type is set to CUSTOMER_MANAGED_KMS_KEY , but kmsKeyId is
      # null, or kmsDataKeyReusePeriodSeconds is not between 60 and 900, or the KMS key is not symmetric or
      # inactive.

      class InvalidEncryptionConfiguration < ServiceError
      end

      # The provided JSON input data is not valid.

      class InvalidExecutionInput < ServiceError
      end

      # Configuration is not valid.

      class InvalidLoggingConfiguration < ServiceError
      end

      # The provided name is not valid.

      class InvalidName < ServiceError
      end

      # The provided JSON output data is not valid.

      class InvalidOutput < ServiceError
      end

      # The provided token is not valid.

      class InvalidToken < ServiceError
      end

      # Your tracingConfiguration key does not match, or enabled has not been set to true or false .

      class InvalidTracingConfiguration < ServiceError
      end

      # Either your KMS key policy or API caller does not have the required permissions.

      class KmsAccessDeniedException < ServiceError
      end

      # The KMS key is not in valid state, for example: Disabled or Deleted.

      class KmsInvalidStateException < ServiceError
      end

      # Received when KMS returns ThrottlingException for a KMS call that Step Functions makes on behalf of
      # the caller.

      class KmsThrottlingException < ServiceError
      end

      # Request is missing a required parameter. This error occurs if both definition and roleArn are not
      # specified.

      class MissingRequiredParameter < ServiceError
      end

      # Could not find the referenced resource.

      class ResourceNotFound < ServiceError
      end

      # The request would cause a service quota to be exceeded. HTTP Status Code: 402

      class ServiceQuotaExceededException < ServiceError
      end

      # A state machine with the same name but a different definition or role ARN already exists.

      class StateMachineAlreadyExists < ServiceError
      end

      # The specified state machine is being deleted.

      class StateMachineDeleting < ServiceError
      end

      # The specified state machine does not exist.

      class StateMachineDoesNotExist < ServiceError
      end

      # The maximum number of state machines has been reached. Existing state machines must be deleted
      # before a new state machine can be created.

      class StateMachineLimitExceeded < ServiceError
      end

      # State machine type is not supported.

      class StateMachineTypeNotSupported < ServiceError
      end

      # The activity does not exist.

      class TaskDoesNotExist < ServiceError
      end

      # The task token has either expired or the task associated with the token has already been closed.

      class TaskTimedOut < ServiceError
      end

      # You've exceeded the number of tags allowed for a resource. See the Limits Topic in the Step
      # Functions Developer Guide.

      class TooManyTags < ServiceError
      end

      # The input does not satisfy the constraints specified by an Amazon Web Services service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ActivityAlreadyExists"
          ActivityAlreadyExists.new(message)
        when "ActivityDoesNotExist"
          ActivityDoesNotExist.new(message)
        when "ActivityLimitExceeded"
          ActivityLimitExceeded.new(message)
        when "ActivityWorkerLimitExceeded"
          ActivityWorkerLimitExceeded.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ExecutionAlreadyExists"
          ExecutionAlreadyExists.new(message)
        when "ExecutionDoesNotExist"
          ExecutionDoesNotExist.new(message)
        when "ExecutionLimitExceeded"
          ExecutionLimitExceeded.new(message)
        when "ExecutionNotRedrivable"
          ExecutionNotRedrivable.new(message)
        when "InvalidArn"
          InvalidArn.new(message)
        when "InvalidDefinition"
          InvalidDefinition.new(message)
        when "InvalidEncryptionConfiguration"
          InvalidEncryptionConfiguration.new(message)
        when "InvalidExecutionInput"
          InvalidExecutionInput.new(message)
        when "InvalidLoggingConfiguration"
          InvalidLoggingConfiguration.new(message)
        when "InvalidName"
          InvalidName.new(message)
        when "InvalidOutput"
          InvalidOutput.new(message)
        when "InvalidToken"
          InvalidToken.new(message)
        when "InvalidTracingConfiguration"
          InvalidTracingConfiguration.new(message)
        when "KmsAccessDeniedException"
          KmsAccessDeniedException.new(message)
        when "KmsInvalidStateException"
          KmsInvalidStateException.new(message)
        when "KmsThrottlingException"
          KmsThrottlingException.new(message)
        when "MissingRequiredParameter"
          MissingRequiredParameter.new(message)
        when "ResourceNotFound"
          ResourceNotFound.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "StateMachineAlreadyExists"
          StateMachineAlreadyExists.new(message)
        when "StateMachineDeleting"
          StateMachineDeleting.new(message)
        when "StateMachineDoesNotExist"
          StateMachineDoesNotExist.new(message)
        when "StateMachineLimitExceeded"
          StateMachineLimitExceeded.new(message)
        when "StateMachineTypeNotSupported"
          StateMachineTypeNotSupported.new(message)
        when "TaskDoesNotExist"
          TaskDoesNotExist.new(message)
        when "TaskTimedOut"
          TaskTimedOut.new(message)
        when "TooManyTags"
          TooManyTags.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
