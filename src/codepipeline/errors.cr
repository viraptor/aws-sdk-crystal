module Aws
  module CodePipeline
    module Errors
      class ServiceError < Exception
      end

      # The action execution was not found.

      class ActionExecutionNotFoundException < ServiceError
      end

      # The specified action cannot be found.

      class ActionNotFoundException < ServiceError
      end

      # The specified action type already exists with a different definition.

      class ActionTypeAlreadyExistsException < ServiceError
      end

      # The specified action type cannot be found.

      class ActionTypeNotFoundException < ServiceError
      end

      # The approval action has already been approved or rejected.

      class ApprovalAlreadyCompletedException < ServiceError
      end

      # Unable to modify the tag due to a simultaneous update request.

      class ConcurrentModificationException < ServiceError
      end

      # The pipeline has reached the limit for concurrent pipeline executions.

      class ConcurrentPipelineExecutionsLimitExceededException < ServiceError
      end

      # Unable to override because the condition does not allow overrides.

      class ConditionNotOverridableException < ServiceError
      end

      # Your request cannot be handled because the pipeline is busy handling ongoing activities. Try again
      # later.

      class ConflictException < ServiceError
      end

      # The pipeline execution is already in a Stopping state. If you already chose to stop and wait, you
      # cannot make that request again. You can choose to stop and abandon now, but be aware that this
      # option can lead to failed tasks or out of sequence tasks. If you already chose to stop and abandon,
      # you cannot make that request again.

      class DuplicatedStopRequestException < ServiceError
      end

      # The action declaration was specified in an invalid format.

      class InvalidActionDeclarationException < ServiceError
      end

      # The approval request already received a response or has expired.

      class InvalidApprovalTokenException < ServiceError
      end

      # The specified resource ARN is invalid.

      class InvalidArnException < ServiceError
      end

      # Reserved for future use.

      class InvalidBlockerDeclarationException < ServiceError
      end

      # The client token was specified in an invalid format

      class InvalidClientTokenException < ServiceError
      end

      # The job was specified in an invalid format or cannot be found.

      class InvalidJobException < ServiceError
      end

      # The job state was specified in an invalid format.

      class InvalidJobStateException < ServiceError
      end

      # The next token was specified in an invalid format. Make sure that the next token you provide is the
      # token returned by a previous call.

      class InvalidNextTokenException < ServiceError
      end

      # The nonce was specified in an invalid format.

      class InvalidNonceException < ServiceError
      end

      # The stage declaration was specified in an invalid format.

      class InvalidStageDeclarationException < ServiceError
      end

      # The structure was specified in an invalid format.

      class InvalidStructureException < ServiceError
      end

      # The specified resource tags are invalid.

      class InvalidTagsException < ServiceError
      end

      # The specified authentication type is in an invalid format.

      class InvalidWebhookAuthenticationParametersException < ServiceError
      end

      # The specified event filter rule is in an invalid format.

      class InvalidWebhookFilterPatternException < ServiceError
      end

      # The job was specified in an invalid format or cannot be found.

      class JobNotFoundException < ServiceError
      end

      # The number of pipelines associated with the Amazon Web Services account has exceeded the limit
      # allowed for the account.

      class LimitExceededException < ServiceError
      end

      # The stage has failed in a later run of the pipeline and the pipelineExecutionId associated with the
      # request is out of date.

      class NotLatestPipelineExecutionException < ServiceError
      end

      # Exceeded the total size limit for all variables in the pipeline.

      class OutputVariablesSizeExceededException < ServiceError
      end

      # The pipeline execution was specified in an invalid format or cannot be found, or an execution ID
      # does not belong to the specified pipeline.

      class PipelineExecutionNotFoundException < ServiceError
      end

      # Unable to stop the pipeline execution. The execution might already be in a Stopped state, or it
      # might no longer be in progress.

      class PipelineExecutionNotStoppableException < ServiceError
      end

      # The specified pipeline execution is outdated and cannot be used as a target pipeline execution for
      # rollback.

      class PipelineExecutionOutdatedException < ServiceError
      end

      # The specified pipeline name is already in use.

      class PipelineNameInUseException < ServiceError
      end

      # The pipeline was specified in an invalid format or cannot be found.

      class PipelineNotFoundException < ServiceError
      end

      # The pipeline version was specified in an invalid format or cannot be found.

      class PipelineVersionNotFoundException < ServiceError
      end

      # The request failed because of an unknown error, exception, or failure.

      class RequestFailedException < ServiceError
      end

      # The resource was specified in an invalid format.

      class ResourceNotFoundException < ServiceError
      end

      # The stage was specified in an invalid format or cannot be found.

      class StageNotFoundException < ServiceError
      end

      # Unable to retry. The pipeline structure or stage state might have changed while actions awaited
      # retry, or the stage contains no failed actions.

      class StageNotRetryableException < ServiceError
      end

      # The tags limit for a resource has been exceeded.

      class TooManyTagsException < ServiceError
      end

      # Unable to roll back the stage. The cause might be if the pipeline version has changed since the
      # target pipeline execution was deployed, the stage is currently running, or an incorrect target
      # pipeline execution ID was provided.

      class UnableToRollbackStageException < ServiceError
      end

      # The validation was specified in an invalid format.

      class ValidationException < ServiceError
      end

      # The specified webhook was entered in an invalid format or cannot be found.

      class WebhookNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ActionExecutionNotFoundException"
          ActionExecutionNotFoundException.new(message)
        when "ActionNotFoundException"
          ActionNotFoundException.new(message)
        when "ActionTypeAlreadyExistsException"
          ActionTypeAlreadyExistsException.new(message)
        when "ActionTypeNotFoundException"
          ActionTypeNotFoundException.new(message)
        when "ApprovalAlreadyCompletedException"
          ApprovalAlreadyCompletedException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConcurrentPipelineExecutionsLimitExceededException"
          ConcurrentPipelineExecutionsLimitExceededException.new(message)
        when "ConditionNotOverridableException"
          ConditionNotOverridableException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DuplicatedStopRequestException"
          DuplicatedStopRequestException.new(message)
        when "InvalidActionDeclarationException"
          InvalidActionDeclarationException.new(message)
        when "InvalidApprovalTokenException"
          InvalidApprovalTokenException.new(message)
        when "InvalidArnException"
          InvalidArnException.new(message)
        when "InvalidBlockerDeclarationException"
          InvalidBlockerDeclarationException.new(message)
        when "InvalidClientTokenException"
          InvalidClientTokenException.new(message)
        when "InvalidJobException"
          InvalidJobException.new(message)
        when "InvalidJobStateException"
          InvalidJobStateException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidNonceException"
          InvalidNonceException.new(message)
        when "InvalidStageDeclarationException"
          InvalidStageDeclarationException.new(message)
        when "InvalidStructureException"
          InvalidStructureException.new(message)
        when "InvalidTagsException"
          InvalidTagsException.new(message)
        when "InvalidWebhookAuthenticationParametersException"
          InvalidWebhookAuthenticationParametersException.new(message)
        when "InvalidWebhookFilterPatternException"
          InvalidWebhookFilterPatternException.new(message)
        when "JobNotFoundException"
          JobNotFoundException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotLatestPipelineExecutionException"
          NotLatestPipelineExecutionException.new(message)
        when "OutputVariablesSizeExceededException"
          OutputVariablesSizeExceededException.new(message)
        when "PipelineExecutionNotFoundException"
          PipelineExecutionNotFoundException.new(message)
        when "PipelineExecutionNotStoppableException"
          PipelineExecutionNotStoppableException.new(message)
        when "PipelineExecutionOutdatedException"
          PipelineExecutionOutdatedException.new(message)
        when "PipelineNameInUseException"
          PipelineNameInUseException.new(message)
        when "PipelineNotFoundException"
          PipelineNotFoundException.new(message)
        when "PipelineVersionNotFoundException"
          PipelineVersionNotFoundException.new(message)
        when "RequestFailedException"
          RequestFailedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "StageNotFoundException"
          StageNotFoundException.new(message)
        when "StageNotRetryableException"
          StageNotRetryableException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnableToRollbackStageException"
          UnableToRollbackStageException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        when "WebhookNotFoundException"
          WebhookNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
