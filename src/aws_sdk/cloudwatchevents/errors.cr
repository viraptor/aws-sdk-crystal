module AwsSdk
  module CloudWatchEvents
    module Errors
      class ServiceError < Exception
      end

      # There is concurrent modification on a rule, target, archive, or replay.

      class ConcurrentModificationException < ServiceError
      end

      # An error occurred because a replay can be canceled only when the state is Running or Starting.

      class IllegalStatusException < ServiceError
      end

      # This exception occurs due to unexpected causes.

      class InternalException < ServiceError
      end

      # The event pattern is not valid.

      class InvalidEventPatternException < ServiceError
      end

      # The specified state is not a valid state for an event source.

      class InvalidStateException < ServiceError
      end

      # The request failed because it attempted to create resource beyond the allowed service quota.

      class LimitExceededException < ServiceError
      end

      # This rule was created by an Amazon Web Services service on behalf of your account. It is managed by
      # that service. If you see this error in response to DeleteRule or RemoveTargets , you can use the
      # Force parameter in those calls to delete the rule or remove targets from the rule. You cannot modify
      # these managed rules by using DisableRule , EnableRule , PutTargets , PutRule , TagResource , or
      # UntagResource .

      class ManagedRuleException < ServiceError
      end

      # The operation you are attempting is not available in this region.

      class OperationDisabledException < ServiceError
      end

      # The event bus policy is too long. For more information, see the limits.

      class PolicyLengthExceededException < ServiceError
      end

      # The resource you are trying to create already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # An entity that you specified does not exist.

      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "IllegalStatusException"
          IllegalStatusException.new(message)
        when "InternalException"
          InternalException.new(message)
        when "InvalidEventPatternException"
          InvalidEventPatternException.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ManagedRuleException"
          ManagedRuleException.new(message)
        when "OperationDisabledException"
          OperationDisabledException.new(message)
        when "PolicyLengthExceededException"
          PolicyLengthExceededException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
