module Aws
  module Shield
    module Errors
      class ServiceError < Exception
      end

      # Exception that indicates the specified AttackId does not exist, or the requester does not have the
      # appropriate permissions to access the AttackId .

      class AccessDeniedException < ServiceError
      end

      # In order to grant the necessary access to the Shield Response Team (SRT) the user submitting the
      # request must have the iam:PassRole permission. This error indicates the user did not have the
      # appropriate permissions. For more information, see Granting a User Permissions to Pass a Role to an
      # Amazon Web Services Service .

      class AccessDeniedForDependencyException < ServiceError
      end

      # Exception that indicates that a problem occurred with the service infrastructure. You can retry the
      # request.

      class InternalErrorException < ServiceError
      end

      # Exception that indicates that the operation would not cause any change to occur.

      class InvalidOperationException < ServiceError
      end

      # Exception that indicates that the NextToken specified in the request is invalid. Submit the request
      # using the NextToken value that was returned in the prior response.

      class InvalidPaginationTokenException < ServiceError
      end

      # Exception that indicates that the parameters passed to the API are invalid. If available, this
      # exception includes details in additional properties.

      class InvalidParameterException < ServiceError
      end

      # Exception that indicates that the resource is invalid. You might not have access to the resource, or
      # the resource might not exist.

      class InvalidResourceException < ServiceError
      end

      # Exception that indicates that the operation would exceed a limit.

      class LimitsExceededException < ServiceError
      end

      # You are trying to update a subscription that has not yet completed the 1-year commitment. You can
      # change the AutoRenew parameter during the last 30 days of your subscription. This exception
      # indicates that you are attempting to change AutoRenew prior to that period.

      class LockedSubscriptionException < ServiceError
      end

      # The ARN of the role that you specified does not exist.

      class NoAssociatedRoleException < ServiceError
      end

      # Exception that indicates that the resource state has been modified by another client. Retrieve the
      # resource and then retry your request.

      class OptimisticLockException < ServiceError
      end

      # Exception indicating the specified resource already exists. If available, this exception includes
      # details in additional properties.

      class ResourceAlreadyExistsException < ServiceError
      end

      # Exception indicating the specified resource does not exist. If available, this exception includes
      # details in additional properties.

      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AccessDeniedForDependencyException"
          AccessDeniedForDependencyException.new(message)
        when "InternalErrorException"
          InternalErrorException.new(message)
        when "InvalidOperationException"
          InvalidOperationException.new(message)
        when "InvalidPaginationTokenException"
          InvalidPaginationTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidResourceException"
          InvalidResourceException.new(message)
        when "LimitsExceededException"
          LimitsExceededException.new(message)
        when "LockedSubscriptionException"
          LockedSubscriptionException.new(message)
        when "NoAssociatedRoleException"
          NoAssociatedRoleException.new(message)
        when "OptimisticLockException"
          OptimisticLockException.new(message)
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
