module AwsSdk
  module AutoScaling
    module Errors
      class ServiceError < Exception
      end

      # The request failed because an active instance refresh or rollback for the specified Auto Scaling
      # group was not found.
      class ActiveInstanceRefreshNotFoundFault < ServiceError
      end

      # You already have an Auto Scaling group or launch configuration with this name.
      class AlreadyExistsFault < ServiceError
      end

      # Indicates that the parameters in the current request do not match the parameters from a previous
      # request with the same client token within the idempotency window.
      class IdempotentParameterMismatchError < ServiceError
      end

      # The request failed because an active instance refresh already exists for the specified Auto Scaling
      # group.
      class InstanceRefreshInProgressFault < ServiceError
      end

      # The NextToken value is not valid.
      class InvalidNextToken < ServiceError
      end

      # The request failed because a desired configuration was not found or an incompatible launch template
      # (uses a Systems Manager parameter instead of an AMI ID) or launch template version ( $Latest or
      # $Default ) is present on the Auto Scaling group.
      class IrreversibleInstanceRefreshFault < ServiceError
      end

      # You have already reached a limit for your Amazon EC2 Auto Scaling resources (for example, Auto
      # Scaling groups, launch configurations, or lifecycle hooks). For more information, see
      # DescribeAccountLimits in the Amazon EC2 Auto Scaling API Reference .
      class LimitExceededFault < ServiceError
      end

      # You already have a pending update to an Amazon EC2 Auto Scaling resource (for example, an Auto
      # Scaling group, instance, or load balancer).
      class ResourceContentionFault < ServiceError
      end

      # The operation can't be performed because the resource is in use.
      class ResourceInUseFault < ServiceError
      end

      # The operation can't be performed because there are scaling activities in progress.
      class ScalingActivityInProgressFault < ServiceError
      end

      # The service-linked role is not yet ready for use.
      class ServiceLinkedRoleFailure < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ActiveInstanceRefreshNotFoundFault"
          ActiveInstanceRefreshNotFoundFault.new(message)
        when "AlreadyExistsFault"
          AlreadyExistsFault.new(message)
        when "IdempotentParameterMismatchError"
          IdempotentParameterMismatchError.new(message)
        when "InstanceRefreshInProgressFault"
          InstanceRefreshInProgressFault.new(message)
        when "InvalidNextToken"
          InvalidNextToken.new(message)
        when "IrreversibleInstanceRefreshFault"
          IrreversibleInstanceRefreshFault.new(message)
        when "LimitExceededFault"
          LimitExceededFault.new(message)
        when "ResourceContentionFault"
          ResourceContentionFault.new(message)
        when "ResourceInUseFault"
          ResourceInUseFault.new(message)
        when "ScalingActivityInProgressFault"
          ScalingActivityInProgressFault.new(message)
        when "ServiceLinkedRoleFailure"
          ServiceLinkedRoleFailure.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
