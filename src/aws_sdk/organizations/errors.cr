module AwsSdk
  module Organizations
    module Errors
      class ServiceError < Exception
      end

      # Your account isn't a member of an organization. To make this request, you must use the credentials
      # of an account that belongs to an organization.

      class AWSOrganizationsNotInUseException < ServiceError
      end

      # You don't have permissions to perform the requested operation. The user or role that is making the
      # request must have at least one IAM permissions policy attached that grants the required permissions.
      # For more information, see Access Management in the IAM User Guide .

      class AccessDeniedException < ServiceError
      end

      # The operation that you attempted requires you to have the iam:CreateServiceLinkedRole for
      # organizations.amazonaws.com permission so that Organizations can create the required service-linked
      # role. You don't have that permission.

      class AccessDeniedForDependencyException < ServiceError
      end

      # You attempted to close an account that is already closed.

      class AccountAlreadyClosedException < ServiceError
      end

      # The specified account is already a delegated administrator for this Amazon Web Services service.

      class AccountAlreadyRegisteredException < ServiceError
      end

      # We can't find an Amazon Web Services account with the AccountId that you specified, or the account
      # whose credentials you used to make this request isn't a member of an organization.

      class AccountNotFoundException < ServiceError
      end

      # The specified account is not a delegated administrator for this Amazon Web Services service.

      class AccountNotRegisteredException < ServiceError
      end

      # You can't invite an existing account to your organization until you verify that you own the email
      # address associated with the management account. For more information, see Email address verification
      # in the Organizations User Guide .

      class AccountOwnerNotVerifiedException < ServiceError
      end

      # This account is already a member of an organization. An account can belong to only one organization
      # at a time.

      class AlreadyInOrganizationException < ServiceError
      end

      # We can't find an organizational unit (OU) or Amazon Web Services account with the ChildId that you
      # specified.

      class ChildNotFoundException < ServiceError
      end

      # The target of the operation is currently being modified by a different request. Try again later.

      class ConcurrentModificationException < ServiceError
      end

      # The request failed because it conflicts with the current state of the specified resource.

      class ConflictException < ServiceError
      end

      # Performing this operation violates a minimum or maximum value limit. For example, attempting to
      # remove the last service control policy (SCP) from an OU or root, inviting or creating too many
      # accounts to the organization, or attaching too many policies to an account, OU, or root. This
      # exception includes a reason that contains additional information about the violated limit: Some of
      # the reasons in the following list might not be applicable to this specific API or operation.
      # ACCOUNT_CANNOT_LEAVE_ORGANIZATION: You attempted to remove the management account from the
      # organization. You can't remove the management account. Instead, after you remove all member
      # accounts, delete the organization itself. ACCOUNT_CANNOT_LEAVE_WITHOUT_PHONE_VERIFICATION: You
      # attempted to remove an account from the organization that doesn't yet have enough information to
      # exist as a standalone account. This account requires you to first complete phone verification.
      # Follow the steps at Removing a member account from your organization in the Organizations User Guide
      # . ACCOUNT_CREATION_RATE_LIMIT_EXCEEDED: You attempted to exceed the number of accounts that you can
      # create in one day. ACCOUNT_CREATION_NOT_COMPLETE: Your account setup isn't complete or your account
      # isn't fully active. You must complete the account setup before you create an organization.
      # ACTIVE_RESPONSIBILITY_TRANSFER_PROCESS: You cannot delete organization due to an ongoing
      # responsibility transfer process. For example, a pending invitation or an in-progress transfer. To
      # delete the organization, you must resolve the current transfer process.
      # ACCOUNT_NUMBER_LIMIT_EXCEEDED: You attempted to exceed the limit on the number of accounts in an
      # organization. If you need more accounts, contact Amazon Web Services Support to request an increase
      # in your limit. Or the number of invitations that you tried to send would cause you to exceed the
      # limit of accounts in your organization. Send fewer invitations or contact Amazon Web Services
      # Support to request an increase in the number of accounts. Deleted and closed accounts still count
      # toward your limit. If you get this exception when running a command immediately after creating the
      # organization, wait one hour and try again. After an hour, if the command continues to fail with this
      # error, contact Amazon Web Services Support .
      # ALL_FEATURES_MIGRATION_ORGANIZATION_SIZE_LIMIT_EXCEEDED: Your organization has more than 5000
      # accounts, and you can only use the standard migration process for organizations with less than 5000
      # accounts. Use the assisted migration process to enable all features mode, or create a support case
      # for assistance if you are unable to use assisted migration.
      # CANNOT_REGISTER_SUSPENDED_ACCOUNT_AS_DELEGATED_ADMINISTRATOR: You cannot register a suspended
      # account as a delegated administrator. CANNOT_REGISTER_MASTER_AS_DELEGATED_ADMINISTRATOR: You
      # attempted to register the management account of the organization as a delegated administrator for an
      # Amazon Web Services service integrated with Organizations. You can designate only a member account
      # as a delegated administrator. CANNOT_CLOSE_MANAGEMENT_ACCOUNT: You attempted to close the management
      # account. To close the management account for the organization, you must first either remove or close
      # all member accounts in the organization. Follow standard account closure process using root
      # credentials.​ CANNOT_REMOVE_DELEGATED_ADMINISTRATOR_FROM_ORG: You attempted to remove an account
      # that is registered as a delegated administrator for a service integrated with your organization. To
      # complete this operation, you must first deregister this account as a delegated administrator.
      # CLOSE_ACCOUNT_QUOTA_EXCEEDED: You have exceeded close account quota for the past 30 days.
      # CLOSE_ACCOUNT_REQUESTS_LIMIT_EXCEEDED: You attempted to exceed the number of accounts that you can
      # close at a time. ​ CREATE_ORGANIZATION_IN_BILLING_MODE_UNSUPPORTED_REGION: To create an organization
      # in the specified region, you must enable all features mode.
      # DELEGATED_ADMINISTRATOR_EXISTS_FOR_THIS_SERVICE: You attempted to register an Amazon Web Services
      # account as a delegated administrator for an Amazon Web Services service that already has a delegated
      # administrator. To complete this operation, you must first deregister any existing delegated
      # administrators for this service. EMAIL_VERIFICATION_CODE_EXPIRED: The email verification code is
      # only valid for a limited period of time. You must resubmit the request and generate a new
      # verification code. HANDSHAKE_RATE_LIMIT_EXCEEDED: You attempted to exceed the number of handshakes
      # that you can send in one day. INVALID_PAYMENT_INSTRUMENT: You cannot remove an account because no
      # supported payment method is associated with the account. Amazon Web Services does not support cards
      # issued by financial institutions in Russia or Belarus. For more information, see Managing your
      # Amazon Web Services payments . MASTER_ACCOUNT_ADDRESS_DOES_NOT_MATCH_MARKETPLACE: To create an
      # account in this organization, you first must migrate the organization's management account to the
      # marketplace that corresponds to the management account's address. All accounts in an organization
      # must be associated with the same marketplace. MASTER_ACCOUNT_MISSING_BUSINESS_LICENSE: Applies only
      # to the Amazon Web Services Regions in China. To create an organization, the master must have a valid
      # business license. For more information, contact customer support.
      # MASTER_ACCOUNT_MISSING_CONTACT_INFO: To complete this operation, you must first provide a valid
      # contact address and phone number for the management account. Then try the operation again.
      # MASTER_ACCOUNT_NOT_GOVCLOUD_ENABLED: To complete this operation, the management account must have an
      # associated account in the Amazon Web Services GovCloud (US-West) Region. For more information, see
      # Organizations in the Amazon Web Services GovCloud User Guide .
      # MASTER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED: To create an organization with this management account,
      # you first must associate a valid payment instrument, such as a credit card, with the account. For
      # more information, see Considerations before removing an account from an organization in the
      # Organizations User Guide . MAX_DELEGATED_ADMINISTRATORS_FOR_SERVICE_LIMIT_EXCEEDED: You attempted to
      # register more delegated administrators than allowed for the service principal.
      # MAX_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED: You attempted to exceed the number of policies of a
      # certain type that can be attached to an entity at one time. MAX_TAG_LIMIT_EXCEEDED: You have
      # exceeded the number of tags allowed on this resource. MEMBER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED: To
      # complete this operation with this member account, you first must associate a valid payment
      # instrument, such as a credit card, with the account. For more information, see Considerations before
      # removing an account from an organization in the Organizations User Guide .
      # MIN_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED: You attempted to detach a policy from an entity that
      # would cause the entity to have fewer than the minimum number of policies of a certain type required.
      # ORGANIZATION_NOT_IN_ALL_FEATURES_MODE: You attempted to perform an operation that requires the
      # organization to be configured to support all features. An organization that supports only
      # consolidated billing features can't perform this operation. OU_DEPTH_LIMIT_EXCEEDED: You attempted
      # to create an OU tree that is too many levels deep. OU_NUMBER_LIMIT_EXCEEDED: You attempted to exceed
      # the number of OUs that you can have in an organization. POLICY_CONTENT_LIMIT_EXCEEDED: You attempted
      # to create a policy that is larger than the maximum size. POLICY_NUMBER_LIMIT_EXCEEDED: You attempted
      # to exceed the number of policies that you can have in an organization.
      # POLICY_TYPE_ENABLED_FOR_THIS_SERVICE: You attempted to disable service access before you disabled
      # the policy type (for example, SECURITYHUB_POLICY). To complete this operation, you must first
      # disable the policy type. RESPONSIBILITY_TRANSFER_MAX_INBOUND_QUOTA_VIOLATION: You have exceeded your
      # inbound transfers limit. RESPONSIBILITY_TRANSFER_MAX_LEVEL_VIOLATION: You have exceeded the maximum
      # length of your transfer chain. RESPONSIBILITY_TRANSFER_MAX_OUTBOUND_QUOTA_VIOLATION: You have
      # exceeded your outbound transfers limit. RESPONSIBILITY_TRANSFER_MAX_TRANSFERS_QUOTA_VIOLATION: You
      # have exceeded the maximum number of inbound transfers allowed in a transfer chain.
      # SERVICE_ACCESS_NOT_ENABLED: You attempted to register a delegated administrator before you enabled
      # service access. Call the EnableAWSServiceAccess API first. You attempted to enable a policy type
      # before you enabled service access. Call the EnableAWSServiceAccess API first. TAG_POLICY_VIOLATION:
      # You attempted to create or update a resource with tags that are not compliant with the tag policy
      # requirements for this account. TRANSFER_RESPONSIBILITY_SOURCE_DELETION_IN_PROGRESS: The source
      # organization cannot accept this transfer invitation because it is marked for deletion.
      # TRANSFER_RESPONSIBILITY_TARGET_DELETION_IN_PROGRESS: The source organization cannot accept this
      # transfer invitation because target organization is marked for deletion. UNSUPPORTED_PRICING: Your
      # organization has a pricing contract that is unsupported. WAIT_PERIOD_ACTIVE: After you create an
      # Amazon Web Services account, you must wait until at least four days after the account was created.
      # Invited accounts aren't subject to this waiting period.

      class ConstraintViolationException < ServiceError
      end

      # We can't find an create account request with the CreateAccountRequestId that you specified.

      class CreateAccountStatusNotFoundException < ServiceError
      end

      # We can't find the destination container (a root or OU) with the ParentId that you specified.

      class DestinationParentNotFoundException < ServiceError
      end

      # That account is already present in the specified destination.

      class DuplicateAccountException < ServiceError
      end

      # A handshake with the same action and target already exists. For example, if you invited an account
      # to join your organization, the invited account might already have a pending invitation from this
      # organization. If you intend to resend an invitation to an account, ensure that existing handshakes
      # that might be considered duplicates are canceled or declined.

      class DuplicateHandshakeException < ServiceError
      end

      # An OU with the same name already exists.

      class DuplicateOrganizationalUnitException < ServiceError
      end

      # The selected policy is already attached to the specified target.

      class DuplicatePolicyAttachmentException < ServiceError
      end

      # A policy with the same name already exists.

      class DuplicatePolicyException < ServiceError
      end

      # If you ran this action on the management account, this policy type is not enabled. If you ran the
      # action on a member account, the account doesn't have an effective policy of this type. Contact the
      # administrator of your organization about attaching a policy of this type to the account.

      class EffectivePolicyNotFoundException < ServiceError
      end

      # Organizations couldn't perform the operation because your organization hasn't finished initializing.
      # This can take up to an hour. Try again later. If after one hour you continue to receive this error,
      # contact Amazon Web Services Support .

      class FinalizingOrganizationException < ServiceError
      end

      # The specified handshake is already in the requested state. For example, you can't accept a handshake
      # that was already accepted.

      class HandshakeAlreadyInStateException < ServiceError
      end

      # The requested operation would violate the constraint identified in the reason code. Some of the
      # reasons in the following list might not be applicable to this specific API or operation:
      # ACCOUNT_NUMBER_LIMIT_EXCEEDED: You attempted to exceed the limit on the number of accounts in an
      # organization. Note that deleted and closed accounts still count toward your limit. If you get this
      # exception immediately after creating the organization, wait one hour and try again. If after an hour
      # it continues to fail with this error, contact Amazon Web Services Support .
      # ALREADY_IN_AN_ORGANIZATION: The handshake request is invalid because the invited account is already
      # a member of an organization. HANDSHAKE_RATE_LIMIT_EXCEEDED: You attempted to exceed the number of
      # handshakes that you can send in one day. INVITE_DISABLED_DURING_ENABLE_ALL_FEATURES: You can't issue
      # new invitations to join an organization while it's in the process of enabling all features. You can
      # resume inviting accounts after you finalize the process when all accounts have agreed to the change.
      # LEGACY_PERMISSIONS_STILL_IN_USE: Your organization must migrate to use the new IAM fine-grained
      # actions for billing, cost management, and accounts. ORGANIZATION_ALREADY_HAS_ALL_FEATURES: The
      # handshake request is invalid because the organization has already enabled all features.
      # ORGANIZATION_FROM_DIFFERENT_SELLER_OF_RECORD: The request failed because the account is from a
      # different marketplace than the accounts in the organization.
      # ORGANIZATION_IS_ALREADY_PENDING_ALL_FEATURES_MIGRATION: The handshake request is invalid because the
      # organization has already started the process to enable all features.
      # ORGANIZATION_MEMBERSHIP_CHANGE_RATE_LIMIT_EXCEEDED: You attempted to change the membership of an
      # account too quickly after its previous change. PAYMENT_INSTRUMENT_REQUIRED: You can't complete the
      # operation with an account that doesn't have a payment instrument, such as a credit card, associated
      # with it. RESPONSIBILITY_TRANSFER_ALREADY_EXISTS: You cannot perform this operation with the current
      # transfer. SOURCE_AND_TARGET_CANNOT_MATCH: An account can't accept a transfer invitation if it is
      # both the sender and recipient of the invitation. UNUSED_PREPAYMENT_BALANCE: Your organization has an
      # outstanding pre-payment balance.

      class HandshakeConstraintViolationException < ServiceError
      end

      # We can't find a handshake with the HandshakeId that you specified.

      class HandshakeNotFoundException < ServiceError
      end

      # You can't perform the operation on the handshake in its current state. For example, you can't cancel
      # a handshake that was already accepted or accept a handshake that was already declined.

      class InvalidHandshakeTransitionException < ServiceError
      end

      # The requested operation failed because you provided invalid values for one or more of the request
      # parameters. This exception includes a reason that contains additional information about the violated
      # limit: Some of the reasons in the following list might not be applicable to this specific API or
      # operation. CALLER_REQUIRED_FIELD_MISSING: At least one of the required field is missing: Caller
      # Account Id, Management Account Id or Organization Id. DUPLICATE_TAG_KEY: Tag keys must be unique
      # among the tags attached to the same entity. END_DATE_NOT_END_OF_MONTH: You provided an invalid end
      # date. The end date must be the end of the last day of the month (23.59.59.999). END_DATE_TOO_EARLY:
      # You provided an invalid end date. It is too early for the transfer to end. IMMUTABLE_POLICY: You
      # specified a policy that is managed by Amazon Web Services and can't be modified. INPUT_REQUIRED: You
      # must include a value for all required parameters. INVALID_EMAIL_ADDRESS_TARGET: You specified an
      # invalid email address for the invited account owner. INVALID_END_DATE: The selected withdrawal date
      # doesn't meet the terms of your partner agreement. Visit Amazon Web Services Partner Central to view
      # your partner agreements or contact your Amazon Web Services Partner for help. INVALID_ENUM: You
      # specified an invalid value. INVALID_ENUM_POLICY_TYPE: You specified an invalid policy type string.
      # INVALID_FULL_NAME_TARGET: You specified a full name that contains invalid characters.
      # INVALID_LIST_MEMBER: You provided a list to a parameter that contains at least one invalid value.
      # INVALID_PAGINATION_TOKEN: Get the value for the NextToken parameter from the response to a previous
      # call of the operation. INVALID_PARTY_TYPE_TARGET: You specified the wrong type of entity (account,
      # organization, or email) as a party. INVALID_PATTERN: You provided a value that doesn't match the
      # required pattern. INVALID_PATTERN_TARGET_ID: You specified a policy target ID that doesn't match the
      # required pattern. INVALID_PRINCIPAL: You specified an invalid principal element in the policy.
      # INVALID_ROLE_NAME: You provided a role name that isn't valid. A role name can't begin with the
      # reserved prefix AWSServiceRoleFor . INVALID_START_DATE: The start date doesn't meet the minimum
      # requirements. INVALID_SYNTAX_ORGANIZATION_ARN: You specified an invalid Amazon Resource Name (ARN)
      # for the organization. INVALID_SYNTAX_POLICY_ID: You specified an invalid policy ID.
      # INVALID_SYSTEM_TAGS_PARAMETER: You specified a tag key that is a system tag. You can’t add, edit, or
      # delete system tag keys because they're reserved for Amazon Web Services use. System tags don’t count
      # against your tags per resource limit. MAX_FILTER_LIMIT_EXCEEDED: You can specify only one filter
      # parameter for the operation. MAX_LENGTH_EXCEEDED: You provided a string parameter that is longer
      # than allowed. MAX_VALUE_EXCEEDED: You provided a numeric parameter that has a larger value than
      # allowed. MIN_LENGTH_EXCEEDED: You provided a string parameter that is shorter than allowed.
      # MIN_VALUE_EXCEEDED: You provided a numeric parameter that has a smaller value than allowed.
      # MOVING_ACCOUNT_BETWEEN_DIFFERENT_ROOTS: You can move an account only between entities in the same
      # root. NON_DETACHABLE_POLICY: You can't detach this Amazon Web Services Managed Policy.
      # START_DATE_NOT_BEGINNING_OF_DAY: You provided an invalid start date. The start date must be the
      # beginning of the day (00:00:00.000). START_DATE_NOT_BEGINNING_OF_MONTH: You provided an invalid
      # start date. The start date must be the first day of the month. START_DATE_TOO_EARLY: You provided an
      # invalid start date. The start date is too early. START_DATE_TOO_LATE: You provided an invalid start
      # date. The start date is too late. TARGET_NOT_SUPPORTED: You can't perform the specified operation on
      # that target entity. UNRECOGNIZED_SERVICE_PRINCIPAL: You specified a service principal that isn't
      # recognized. UNSUPPORTED_ACTION_IN_RESPONSIBILITY_TRANSFER: You provided a value that is not
      # supported by this operation.

      class InvalidInputException < ServiceError
      end

      # The responsibility transfer can't transition to the requested state because it's not in a valid
      # state for this operation.

      class InvalidResponsibilityTransferTransitionException < ServiceError
      end

      # The provided policy document doesn't meet the requirements of the specified policy type. For
      # example, the syntax might be incorrect. For details about service control policy syntax, see SCP
      # syntax in the Organizations User Guide .

      class MalformedPolicyDocumentException < ServiceError
      end

      # You can't remove a management account from an organization. If you want the management account to
      # become a member account in another organization, you must first delete the current organization of
      # the management account.

      class MasterCannotLeaveOrganizationException < ServiceError
      end

      # The organization isn't empty. To delete an organization, you must first remove all accounts except
      # the management account.

      class OrganizationNotEmptyException < ServiceError
      end

      # The specified OU is not empty. Move all accounts to another root or to other OUs, remove all child
      # OUs, and try the operation again.

      class OrganizationalUnitNotEmptyException < ServiceError
      end

      # We can't find an OU with the OrganizationalUnitId that you specified.

      class OrganizationalUnitNotFoundException < ServiceError
      end

      # We can't find a root or OU with the ParentId that you specified.

      class ParentNotFoundException < ServiceError
      end

      # Changes to the effective policy are in progress, and its contents can't be returned. Try the
      # operation again later.

      class PolicyChangesInProgressException < ServiceError
      end

      # The policy is attached to one or more entities. You must detach it from all roots, OUs, and accounts
      # before performing this operation.

      class PolicyInUseException < ServiceError
      end

      # The policy isn't attached to the specified target in the specified root.

      class PolicyNotAttachedException < ServiceError
      end

      # We can't find a policy with the PolicyId that you specified.

      class PolicyNotFoundException < ServiceError
      end

      # The specified policy type is already enabled in the specified root.

      class PolicyTypeAlreadyEnabledException < ServiceError
      end

      # You can't use the specified policy type with the feature set currently enabled for this
      # organization. For example, you can enable SCPs only after you enable all features in the
      # organization. For more information, see Managing Organizations policies in the Organizations User
      # Guide .

      class PolicyTypeNotAvailableForOrganizationException < ServiceError
      end

      # The specified policy type isn't currently enabled in this root. You can't attach policies of the
      # specified type to entities in a root until you enable that type in the root. For more information,
      # see Enabling all features in your organization in the Organizations User Guide .

      class PolicyTypeNotEnabledException < ServiceError
      end

      # We can't find a resource policy request with the parameter that you specified.

      class ResourcePolicyNotFoundException < ServiceError
      end

      # The responsibility transfer is already in the status that you specified.

      class ResponsibilityTransferAlreadyInStatusException < ServiceError
      end

      # We can't find a transfer that you specified.

      class ResponsibilityTransferNotFoundException < ServiceError
      end

      # We can't find a root with the RootId that you specified.

      class RootNotFoundException < ServiceError
      end

      # Organizations can't complete your request because of an internal service error. Try again later.

      class ServiceException < ServiceError
      end

      # We can't find a source root or OU with the ParentId that you specified.

      class SourceParentNotFoundException < ServiceError
      end

      # We can't find a root, OU, account, or policy with the TargetId that you specified.

      class TargetNotFoundException < ServiceError
      end

      # You have sent too many requests in too short a period of time. The quota helps protect against
      # denial-of-service attacks. Try again later. For information about quotas that affect Organizations,
      # see Quotas for Organizations in the Organizations User Guide .

      class TooManyRequestsException < ServiceError
      end

      # This action isn't available in the current Amazon Web Services Region.

      class UnsupportedAPIEndpointException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AWSOrganizationsNotInUseException"
          AWSOrganizationsNotInUseException.new(message)
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AccessDeniedForDependencyException"
          AccessDeniedForDependencyException.new(message)
        when "AccountAlreadyClosedException"
          AccountAlreadyClosedException.new(message)
        when "AccountAlreadyRegisteredException"
          AccountAlreadyRegisteredException.new(message)
        when "AccountNotFoundException"
          AccountNotFoundException.new(message)
        when "AccountNotRegisteredException"
          AccountNotRegisteredException.new(message)
        when "AccountOwnerNotVerifiedException"
          AccountOwnerNotVerifiedException.new(message)
        when "AlreadyInOrganizationException"
          AlreadyInOrganizationException.new(message)
        when "ChildNotFoundException"
          ChildNotFoundException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ConstraintViolationException"
          ConstraintViolationException.new(message)
        when "CreateAccountStatusNotFoundException"
          CreateAccountStatusNotFoundException.new(message)
        when "DestinationParentNotFoundException"
          DestinationParentNotFoundException.new(message)
        when "DuplicateAccountException"
          DuplicateAccountException.new(message)
        when "DuplicateHandshakeException"
          DuplicateHandshakeException.new(message)
        when "DuplicateOrganizationalUnitException"
          DuplicateOrganizationalUnitException.new(message)
        when "DuplicatePolicyAttachmentException"
          DuplicatePolicyAttachmentException.new(message)
        when "DuplicatePolicyException"
          DuplicatePolicyException.new(message)
        when "EffectivePolicyNotFoundException"
          EffectivePolicyNotFoundException.new(message)
        when "FinalizingOrganizationException"
          FinalizingOrganizationException.new(message)
        when "HandshakeAlreadyInStateException"
          HandshakeAlreadyInStateException.new(message)
        when "HandshakeConstraintViolationException"
          HandshakeConstraintViolationException.new(message)
        when "HandshakeNotFoundException"
          HandshakeNotFoundException.new(message)
        when "InvalidHandshakeTransitionException"
          InvalidHandshakeTransitionException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "InvalidResponsibilityTransferTransitionException"
          InvalidResponsibilityTransferTransitionException.new(message)
        when "MalformedPolicyDocumentException"
          MalformedPolicyDocumentException.new(message)
        when "MasterCannotLeaveOrganizationException"
          MasterCannotLeaveOrganizationException.new(message)
        when "OrganizationNotEmptyException"
          OrganizationNotEmptyException.new(message)
        when "OrganizationalUnitNotEmptyException"
          OrganizationalUnitNotEmptyException.new(message)
        when "OrganizationalUnitNotFoundException"
          OrganizationalUnitNotFoundException.new(message)
        when "ParentNotFoundException"
          ParentNotFoundException.new(message)
        when "PolicyChangesInProgressException"
          PolicyChangesInProgressException.new(message)
        when "PolicyInUseException"
          PolicyInUseException.new(message)
        when "PolicyNotAttachedException"
          PolicyNotAttachedException.new(message)
        when "PolicyNotFoundException"
          PolicyNotFoundException.new(message)
        when "PolicyTypeAlreadyEnabledException"
          PolicyTypeAlreadyEnabledException.new(message)
        when "PolicyTypeNotAvailableForOrganizationException"
          PolicyTypeNotAvailableForOrganizationException.new(message)
        when "PolicyTypeNotEnabledException"
          PolicyTypeNotEnabledException.new(message)
        when "ResourcePolicyNotFoundException"
          ResourcePolicyNotFoundException.new(message)
        when "ResponsibilityTransferAlreadyInStatusException"
          ResponsibilityTransferAlreadyInStatusException.new(message)
        when "ResponsibilityTransferNotFoundException"
          ResponsibilityTransferNotFoundException.new(message)
        when "RootNotFoundException"
          RootNotFoundException.new(message)
        when "ServiceException"
          ServiceException.new(message)
        when "SourceParentNotFoundException"
          SourceParentNotFoundException.new(message)
        when "TargetNotFoundException"
          TargetNotFoundException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "UnsupportedAPIEndpointException"
          UnsupportedAPIEndpointException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
