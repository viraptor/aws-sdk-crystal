module AwsSdk
  module RAM
    module Errors
      class ServiceError < Exception
      end

      # The operation failed because the client token input parameter matched one that was used with a
      # previous call to the operation, but at least one of the other input parameters is different from the
      # previous call.

      class IdempotentParameterMismatchException < ServiceError
      end

      # The operation failed because the specified client token isn't valid.

      class InvalidClientTokenException < ServiceError
      end

      # The operation failed because the specified value for MaxResults isn't valid.

      class InvalidMaxResultsException < ServiceError
      end

      # The operation failed because the specified value for NextToken isn't valid. You must specify a value
      # you received in the NextToken response of a previous call to this operation.

      class InvalidNextTokenException < ServiceError
      end

      # The operation failed because a parameter you specified isn't valid.

      class InvalidParameterException < ServiceError
      end

      # The operation failed because a policy you specified isn't valid.

      class InvalidPolicyException < ServiceError
      end

      # The operation failed because the specified resource type isn't valid.

      class InvalidResourceTypeException < ServiceError
      end

      # The operation failed because the requested operation isn't valid for the resource share in its
      # current state.

      class InvalidStateTransitionException < ServiceError
      end

      # The operation failed because the specified Amazon Resource Name (ARN) has a format that isn't valid.

      class MalformedArnException < ServiceError
      end

      # The operation failed because the policy template that you provided isn't valid.

      class MalformedPolicyTemplateException < ServiceError
      end

      # The operation failed because a required input parameter is missing.

      class MissingRequiredParameterException < ServiceError
      end

      # The operation failed because the requested operation isn't permitted.

      class OperationNotPermittedException < ServiceError
      end

      # The operation failed because a permission with the specified name already exists in the requested
      # Amazon Web Services Region. Choose a different name.

      class PermissionAlreadyExistsException < ServiceError
      end

      # The operation failed because it would exceed the maximum number of permissions you can create in
      # each Amazon Web Services Region. To view the limits for your Amazon Web Services account, see the
      # RAM page in the Service Quotas console .

      class PermissionLimitExceededException < ServiceError
      end

      # The operation failed because it would exceed the limit for the number of versions you can have for a
      # permission. To view the limits for your Amazon Web Services account, see the RAM page in the Service
      # Quotas console .

      class PermissionVersionsLimitExceededException < ServiceError
      end

      # The operation failed because the specified Amazon Resource Name (ARN) was not found.

      class ResourceArnNotFoundException < ServiceError
      end

      # The operation failed because the specified invitation was already accepted.

      class ResourceShareInvitationAlreadyAcceptedException < ServiceError
      end

      # The operation failed because the specified invitation was already rejected.

      class ResourceShareInvitationAlreadyRejectedException < ServiceError
      end

      # The operation failed because the specified Amazon Resource Name (ARN) for an invitation was not
      # found.

      class ResourceShareInvitationArnNotFoundException < ServiceError
      end

      # The operation failed because the specified invitation is past its expiration date and time.

      class ResourceShareInvitationExpiredException < ServiceError
      end

      # The operation failed because it would exceed the limit for resource shares for your account. To view
      # the limits for your Amazon Web Services account, see the RAM page in the Service Quotas console .

      class ResourceShareLimitExceededException < ServiceError
      end

      # The operation failed because the service could not respond to the request due to an internal
      # problem. Try again later.

      class ServerInternalException < ServiceError
      end

      # The operation failed because the service isn't available. Try again later.

      class ServiceUnavailableException < ServiceError
      end

      # The operation failed because it would exceed the limit for tags for your Amazon Web Services
      # account.

      class TagLimitExceededException < ServiceError
      end

      # The operation failed because the specified tag key is a reserved word and can't be used.

      class TagPolicyViolationException < ServiceError
      end

      # The operation failed because it exceeded the rate at which you are allowed to perform this
      # operation. Please try again later.

      class ThrottlingException < ServiceError
      end

      # The operation failed because a specified resource couldn't be found.

      class UnknownResourceException < ServiceError
      end

      # There isn't an existing managed permission defined in RAM that has the same IAM permissions as the
      # resource-based policy attached to the resource. You should first run
      # PromotePermissionCreatedFromPolicy to create that managed permission.

      class UnmatchedPolicyPermissionException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "IdempotentParameterMismatchException"
          IdempotentParameterMismatchException.new(message)
        when "InvalidClientTokenException"
          InvalidClientTokenException.new(message)
        when "InvalidMaxResultsException"
          InvalidMaxResultsException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidPolicyException"
          InvalidPolicyException.new(message)
        when "InvalidResourceTypeException"
          InvalidResourceTypeException.new(message)
        when "InvalidStateTransitionException"
          InvalidStateTransitionException.new(message)
        when "MalformedArnException"
          MalformedArnException.new(message)
        when "MalformedPolicyTemplateException"
          MalformedPolicyTemplateException.new(message)
        when "MissingRequiredParameterException"
          MissingRequiredParameterException.new(message)
        when "OperationNotPermittedException"
          OperationNotPermittedException.new(message)
        when "PermissionAlreadyExistsException"
          PermissionAlreadyExistsException.new(message)
        when "PermissionLimitExceededException"
          PermissionLimitExceededException.new(message)
        when "PermissionVersionsLimitExceededException"
          PermissionVersionsLimitExceededException.new(message)
        when "ResourceArnNotFoundException"
          ResourceArnNotFoundException.new(message)
        when "ResourceShareInvitationAlreadyAcceptedException"
          ResourceShareInvitationAlreadyAcceptedException.new(message)
        when "ResourceShareInvitationAlreadyRejectedException"
          ResourceShareInvitationAlreadyRejectedException.new(message)
        when "ResourceShareInvitationArnNotFoundException"
          ResourceShareInvitationArnNotFoundException.new(message)
        when "ResourceShareInvitationExpiredException"
          ResourceShareInvitationExpiredException.new(message)
        when "ResourceShareLimitExceededException"
          ResourceShareLimitExceededException.new(message)
        when "ServerInternalException"
          ServerInternalException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TagLimitExceededException"
          TagLimitExceededException.new(message)
        when "TagPolicyViolationException"
          TagPolicyViolationException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnknownResourceException"
          UnknownResourceException.new(message)
        when "UnmatchedPolicyPermissionException"
          UnmatchedPolicyPermissionException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
