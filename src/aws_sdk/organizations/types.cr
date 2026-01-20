require "json"
require "time"

module AwsSdk
  module Organizations
    module Types

      # Your account isn't a member of an organization. To make this request, you must use the credentials
      # of an account that belongs to an organization.

      struct AWSOrganizationsNotInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AcceptHandshakeRequest
        include JSON::Serializable

        # ID for the handshake that you want to accept. The regex pattern for handshake ID string requires
        # "h-" followed by from 8 to 32 lowercase letters or digits.

        @[JSON::Field(key: "HandshakeId")]
        getter handshake_id : String

        def initialize(
          @handshake_id : String
        )
        end
      end


      struct AcceptHandshakeResponse
        include JSON::Serializable

        # A Handshake object. Contains details for the handshake.

        @[JSON::Field(key: "Handshake")]
        getter handshake : Types::Handshake?

        def initialize(
          @handshake : Types::Handshake? = nil
        )
        end
      end

      # You don't have permissions to perform the requested operation. The user or role that is making the
      # request must have at least one IAM permissions policy attached that grants the required permissions.
      # For more information, see Access Management in the IAM User Guide .

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation that you attempted requires you to have the iam:CreateServiceLinkedRole for
      # organizations.amazonaws.com permission so that Organizations can create the required service-linked
      # role. You don't have that permission.

      struct AccessDeniedForDependencyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains information about an Amazon Web Services account that is a member of an organization.

      struct Account
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the account. For more information about ARNs in Organizations, see
        # ARN Formats Supported by Organizations in the Amazon Web Services Service Authorization Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The email address associated with the Amazon Web Services account. The regex pattern for this
        # parameter is a string of characters that represents a standard internet email address.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The unique identifier (ID) of the account. The regex pattern for an account ID string requires
        # exactly 12 digits.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The method by which the account joined the organization.

        @[JSON::Field(key: "JoinedMethod")]
        getter joined_method : String?

        # The date the account became a part of the organization.

        @[JSON::Field(key: "JoinedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter joined_timestamp : Time?

        # The friendly name of the account. The regex pattern that is used to validate this parameter is a
        # string of any of the characters in the ASCII character range.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Each state represents a specific phase in the account lifecycle. Use this information to manage
        # account access, automate workflows, or trigger actions based on account state changes. For more
        # information about account states and their implications, see Monitor the state of your Amazon Web
        # Services accounts in the Organizations User Guide .

        @[JSON::Field(key: "State")]
        getter state : String?

        # The status of the account in the organization. The Status parameter in the Account object will be
        # retired on September 9, 2026. Although both the account State and account Status parameters are
        # currently available in the Organizations APIs ( DescribeAccount , ListAccounts ,
        # ListAccountsForParent ), we recommend that you update your scripts or other code to use the State
        # parameter instead of Status before September 9, 2026.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @email : String? = nil,
          @id : String? = nil,
          @joined_method : String? = nil,
          @joined_timestamp : Time? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @status : String? = nil
        )
        end
      end

      # You attempted to close an account that is already closed.

      struct AccountAlreadyClosedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified account is already a delegated administrator for this Amazon Web Services service.

      struct AccountAlreadyRegisteredException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # We can't find an Amazon Web Services account with the AccountId that you specified, or the account
      # whose credentials you used to make this request isn't a member of an organization.

      struct AccountNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified account is not a delegated administrator for this Amazon Web Services service.

      struct AccountNotRegisteredException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You can't invite an existing account to your organization until you verify that you own the email
      # address associated with the management account. For more information, see Email address verification
      # in the Organizations User Guide .

      struct AccountOwnerNotVerifiedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This account is already a member of an organization. An account can belong to only one organization
      # at a time.

      struct AlreadyInOrganizationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AttachPolicyRequest
        include JSON::Serializable

        # ID for the policy that you want to attach to the target. You can get the ID for the policy by
        # calling the ListPolicies operation. The regex pattern for a policy ID string requires "p-" followed
        # by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # ID for the root, OU, or account that you want to attach the policy to. You can get the ID by calling
        # the ListRoots , ListOrganizationalUnitsForParent , or ListAccounts operations. The regex pattern for
        # a target ID string requires one of the following: Root - A string that begins with "r-" followed by
        # from 4 to 32 lowercase letters or digits. Account - A string that consists of exactly 12 digits.
        # Organizational unit (OU) - A string that begins with "ou-" followed by from 4 to 32 lowercase
        # letters or digits (the ID of the root that the OU is in). This string is followed by a second "-"
        # dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String

        def initialize(
          @policy_id : String,
          @target_id : String
        )
        end
      end


      struct CancelHandshakeRequest
        include JSON::Serializable

        # ID for the handshake that you want to cancel. You can get the ID from the
        # ListHandshakesForOrganization operation. The regex pattern for handshake ID string requires "h-"
        # followed by from 8 to 32 lowercase letters or digits.

        @[JSON::Field(key: "HandshakeId")]
        getter handshake_id : String

        def initialize(
          @handshake_id : String
        )
        end
      end


      struct CancelHandshakeResponse
        include JSON::Serializable

        # A Handshake object. Contains for the handshake that you canceled.

        @[JSON::Field(key: "Handshake")]
        getter handshake : Types::Handshake?

        def initialize(
          @handshake : Types::Handshake? = nil
        )
        end
      end

      # Contains a list of child entities, either OUs or accounts.

      struct Child
        include JSON::Serializable

        # The unique identifier (ID) of this child entity. The regex pattern for a child ID string requires
        # one of the following: Account - A string that consists of exactly 12 digits. Organizational unit
        # (OU) - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID
        # of the root that contains the OU). This string is followed by a second "-" dash and from 8 to 32
        # additional lowercase letters or digits.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The type of this child entity.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # We can't find an organizational unit (OU) or Amazon Web Services account with the ChildId that you
      # specified.

      struct ChildNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CloseAccountRequest
        include JSON::Serializable

        # Retrieves the Amazon Web Services account Id for the current CloseAccount API request.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # The target of the operation is currently being modified by a different request. Try again later.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request failed because it conflicts with the current state of the specified resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
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

      struct ConstraintViolationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct CreateAccountRequest
        include JSON::Serializable

        # The friendly name of the member account.

        @[JSON::Field(key: "AccountName")]
        getter account_name : String

        # The email address of the owner to assign to the new member account. This email address must not
        # already be associated with another Amazon Web Services account. You must use a valid email address
        # to complete account creation. The rules for a valid email address: The address must be a minimum of
        # 6 and a maximum of 64 characters long. All characters must be 7-bit ASCII characters. There must be
        # one and only one @ symbol, which separates the local name from the domain name. The local name can't
        # contain any of the following characters: whitespace, " ' ( ) &lt; &gt; [ ] : ; , \ | % &amp; The
        # local name can't begin with a dot (.) The domain name can consist of only the characters
        # [a-z],[A-Z],[0-9], hyphen (-), or dot (.) The domain name can't begin or end with a hyphen (-) or
        # dot (.) The domain name must contain at least one dot You can't access the root user of the account
        # or remove an account that was created with an invalid email address.

        @[JSON::Field(key: "Email")]
        getter email : String

        # If set to ALLOW , the new account enables IAM users to access account billing information if they
        # have the required permissions. If set to DENY , only the root user of the new account can access
        # account billing information. For more information, see About IAM access to the Billing and Cost
        # Management console in the Amazon Web Services Billing and Cost Management User Guide . If you don't
        # specify this parameter, the value defaults to ALLOW , and IAM users and roles with the required
        # permissions can access billing information for the new account.

        @[JSON::Field(key: "IamUserAccessToBilling")]
        getter iam_user_access_to_billing : String?

        # The name of an IAM role that Organizations automatically preconfigures in the new member account.
        # This role trusts the management account, allowing users in the management account to assume the
        # role, as permitted by the management account administrator. The role has administrator permissions
        # in the new member account. If you don't specify this parameter, the role name defaults to
        # OrganizationAccountAccessRole . For more information about how to use this role to access the member
        # account, see the following links: Creating the OrganizationAccountAccessRole in an invited member
        # account in the Organizations User Guide Steps 2 and 3 in IAM Tutorial: Delegate access across Amazon
        # Web Services accounts using IAM roles in the IAM User Guide The regex pattern that is used to
        # validate this parameter. The pattern can include uppercase letters, lowercase letters, digits with
        # no spaces, and any of the following characters: =,.@-

        @[JSON::Field(key: "RoleName")]
        getter role_name : String?

        # A list of tags that you want to attach to the newly created account. For each tag in the list, you
        # must specify both a tag key and a value. You can set the value to an empty string, but you can't set
        # it to null . For more information about tagging, see Tagging Organizations resources in the
        # Organizations User Guide. If any one of the tags is not valid or if you exceed the maximum allowed
        # number of tags for an account, then the entire request fails and the account is not created.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_name : String,
          @email : String,
          @iam_user_access_to_billing : String? = nil,
          @role_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAccountResponse
        include JSON::Serializable

        # A structure that contains details about the request to create an account. This response structure
        # might not be fully populated when you first receive it because account creation is an asynchronous
        # process. You can pass the returned CreateAccountStatus ID as a parameter to
        # DescribeCreateAccountStatus to get status about the progress of the request at later times. You can
        # also check the CloudTrail log for the CreateAccountResult event. For more information, see Logging
        # and monitoring in Organizations in the Organizations User Guide .

        @[JSON::Field(key: "CreateAccountStatus")]
        getter create_account_status : Types::CreateAccountStatus?

        def initialize(
          @create_account_status : Types::CreateAccountStatus? = nil
        )
        end
      end

      # Contains the status about a CreateAccount or CreateGovCloudAccount request to create an Amazon Web
      # Services account or an Amazon Web Services GovCloud (US) account in an organization.

      struct CreateAccountStatus
        include JSON::Serializable

        # If the account was created successfully, the unique identifier (ID) of the new account. The regex
        # pattern for an account ID string requires exactly 12 digits.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The account name given to the account when it was created.

        @[JSON::Field(key: "AccountName")]
        getter account_name : String?

        # The date and time that the account was created and the request completed.

        @[JSON::Field(key: "CompletedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_timestamp : Time?

        # If the request failed, a description of the reason for the failure. ACCOUNT_LIMIT_EXCEEDED: The
        # account couldn't be created because you reached the limit on the number of accounts in your
        # organization. CONCURRENT_ACCOUNT_MODIFICATION: You already submitted a request with the same
        # information. EMAIL_ALREADY_EXISTS: The account could not be created because another Amazon Web
        # Services account with that email address already exists. FAILED_BUSINESS_VALIDATION: The Amazon Web
        # Services account that owns your organization failed to receive business license validation.
        # GOVCLOUD_ACCOUNT_ALREADY_EXISTS: The account in the Amazon Web Services GovCloud (US) Region could
        # not be created because this Region already includes an account with that email address.
        # IDENTITY_INVALID_BUSINESS_VALIDATION: The Amazon Web Services account that owns your organization
        # can't complete business license validation because it doesn't have valid identity data.
        # INVALID_ADDRESS: The account could not be created because the address you provided is not valid.
        # INVALID_EMAIL: The account could not be created because the email address you provided is not valid.
        # INVALID_PAYMENT_INSTRUMENT: The Amazon Web Services account that owns your organization does not
        # have a supported payment method associated with the account. Amazon Web Services does not support
        # cards issued by financial institutions in Russia or Belarus. For more information, see Managing your
        # Amazon Web Services payments . INTERNAL_FAILURE: The account could not be created because of an
        # internal failure. Try again later. If the problem persists, contact Amazon Web Services Customer
        # Support. MISSING_BUSINESS_VALIDATION: The Amazon Web Services account that owns your organization
        # has not received Business Validation. MISSING_PAYMENT_INSTRUMENT: You must configure the management
        # account with a valid payment method, such as a credit card. PENDING_BUSINESS_VALIDATION: The Amazon
        # Web Services account that owns your organization is still in the process of completing business
        # license validation. UNKNOWN_BUSINESS_VALIDATION: The Amazon Web Services account that owns your
        # organization has an unknown issue with business license validation.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # If the account was created successfully, the ID for the new account in the Amazon Web Services
        # GovCloud (US) Region.

        @[JSON::Field(key: "GovCloudAccountId")]
        getter gov_cloud_account_id : String?

        # The unique identifier (ID) that references this request. You get this value from the response of the
        # initial CreateAccount request to create the account. The regex pattern for a create account request
        # ID string requires "car-" followed by from 8 to 32 lowercase letters or digits.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time that the request was made for the account creation.

        @[JSON::Field(key: "RequestedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter requested_timestamp : Time?

        # The status of the asynchronous request to create an Amazon Web Services account.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account_id : String? = nil,
          @account_name : String? = nil,
          @completed_timestamp : Time? = nil,
          @failure_reason : String? = nil,
          @gov_cloud_account_id : String? = nil,
          @id : String? = nil,
          @requested_timestamp : Time? = nil,
          @state : String? = nil
        )
        end
      end

      # We can't find an create account request with the CreateAccountRequestId that you specified.

      struct CreateAccountStatusNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateGovCloudAccountRequest
        include JSON::Serializable

        # The friendly name of the member account. The account name can consist of only the characters
        # [a-z],[A-Z],[0-9], hyphen (-), or dot (.) You can't separate characters with a dash (–).

        @[JSON::Field(key: "AccountName")]
        getter account_name : String

        # Specifies the email address of the owner to assign to the new member account in the commercial
        # Region. This email address must not already be associated with another Amazon Web Services account.
        # You must use a valid email address to complete account creation. The rules for a valid email
        # address: The address must be a minimum of 6 and a maximum of 64 characters long. All characters must
        # be 7-bit ASCII characters. There must be one and only one @ symbol, which separates the local name
        # from the domain name. The local name can't contain any of the following characters: whitespace, " '
        # ( ) &lt; &gt; [ ] : ; , \ | % &amp; The local name can't begin with a dot (.) The domain name can
        # consist of only the characters [a-z],[A-Z],[0-9], hyphen (-), or dot (.) The domain name can't begin
        # or end with a hyphen (-) or dot (.) The domain name must contain at least one dot You can't access
        # the root user of the account or remove an account that was created with an invalid email address.
        # Like all request parameters for CreateGovCloudAccount , the request for the email address for the
        # Amazon Web Services GovCloud (US) account originates from the commercial Region, not from the Amazon
        # Web Services GovCloud (US) Region.

        @[JSON::Field(key: "Email")]
        getter email : String

        # If set to ALLOW , the new linked account in the commercial Region enables IAM users to access
        # account billing information if they have the required permissions. If set to DENY , only the root
        # user of the new account can access account billing information. For more information, see About IAM
        # access to the Billing and Cost Management console in the Amazon Web Services Billing and Cost
        # Management User Guide . If you don't specify this parameter, the value defaults to ALLOW , and IAM
        # users and roles with the required permissions can access billing information for the new account.

        @[JSON::Field(key: "IamUserAccessToBilling")]
        getter iam_user_access_to_billing : String?

        # (Optional) The name of an IAM role that Organizations automatically preconfigures in the new member
        # accounts in both the Amazon Web Services GovCloud (US) Region and in the commercial Region. This
        # role trusts the management account, allowing users in the management account to assume the role, as
        # permitted by the management account administrator. The role has administrator permissions in the new
        # member account. If you don't specify this parameter, the role name defaults to
        # OrganizationAccountAccessRole . For more information about how to use this role to access the member
        # account, see the following links: Creating the OrganizationAccountAccessRole in an invited member
        # account in the Organizations User Guide Steps 2 and 3 in IAM Tutorial: Delegate access across Amazon
        # Web Services accounts using IAM roles in the IAM User Guide The regex pattern that is used to
        # validate this parameter. The pattern can include uppercase letters, lowercase letters, digits with
        # no spaces, and any of the following characters: =,.@-

        @[JSON::Field(key: "RoleName")]
        getter role_name : String?

        # A list of tags that you want to attach to the newly created account. These tags are attached to the
        # commercial account associated with the GovCloud account, and not to the GovCloud account itself. To
        # add tags to the actual GovCloud account, call the TagResource operation in the GovCloud region after
        # the new GovCloud account exists. For each tag in the list, you must specify both a tag key and a
        # value. You can set the value to an empty string, but you can't set it to null . For more information
        # about tagging, see Tagging Organizations resources in the Organizations User Guide. If any one of
        # the tags is not valid or if you exceed the maximum allowed number of tags for an account, then the
        # entire request fails and the account is not created.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_name : String,
          @email : String,
          @iam_user_access_to_billing : String? = nil,
          @role_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateGovCloudAccountResponse
        include JSON::Serializable


        @[JSON::Field(key: "CreateAccountStatus")]
        getter create_account_status : Types::CreateAccountStatus?

        def initialize(
          @create_account_status : Types::CreateAccountStatus? = nil
        )
        end
      end


      struct CreateOrganizationRequest
        include JSON::Serializable

        # Specifies the feature set supported by the new organization. Each feature set supports different
        # levels of functionality. CONSOLIDATED_BILLING : All member accounts have their bills consolidated to
        # and paid by the management account. For more information, see Consolidated billing in the
        # Organizations User Guide . The consolidated billing feature subset isn't available for organizations
        # in the Amazon Web Services GovCloud (US) Region. ALL : In addition to all the features supported by
        # the consolidated billing feature set, the management account can also apply any policy type to any
        # member account in the organization. For more information, see All features in the Organizations User
        # Guide .

        @[JSON::Field(key: "FeatureSet")]
        getter feature_set : String?

        def initialize(
          @feature_set : String? = nil
        )
        end
      end


      struct CreateOrganizationResponse
        include JSON::Serializable

        # A structure that contains details about the newly created organization.

        @[JSON::Field(key: "Organization")]
        getter organization : Types::Organization?

        def initialize(
          @organization : Types::Organization? = nil
        )
        end
      end


      struct CreateOrganizationalUnitRequest
        include JSON::Serializable

        # The friendly name to assign to the new OU.

        @[JSON::Field(key: "Name")]
        getter name : String

        # ID for the parent root or OU that you want to create the new OU in. The regex pattern for a parent
        # ID string requires one of the following: Root - A string that begins with "r-" followed by from 4 to
        # 32 lowercase letters or digits. Organizational unit (OU) - A string that begins with "ou-" followed
        # by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is
        # followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "ParentId")]
        getter parent_id : String

        # A list of tags that you want to attach to the newly created OU. For each tag in the list, you must
        # specify both a tag key and a value. You can set the value to an empty string, but you can't set it
        # to null . For more information about tagging, see Tagging Organizations resources in the
        # Organizations User Guide. If any one of the tags is not valid or if you exceed the allowed number of
        # tags for an OU, then the entire request fails and the OU is not created.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @parent_id : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateOrganizationalUnitResponse
        include JSON::Serializable

        # A structure that contains details about the newly created OU.

        @[JSON::Field(key: "OrganizationalUnit")]
        getter organizational_unit : Types::OrganizationalUnit?

        def initialize(
          @organizational_unit : Types::OrganizationalUnit? = nil
        )
        end
      end


      struct CreatePolicyRequest
        include JSON::Serializable

        # The policy text content to add to the new policy. The text that you supply must adhere to the rules
        # of the policy type you specify in the Type parameter. The maximum size of a policy document depends
        # on the policy's type. For more information, see Maximum and minimum values in the Organizations User
        # Guide .

        @[JSON::Field(key: "Content")]
        getter content : String

        # An optional description to assign to the policy.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The friendly name to assign to the policy. The regex pattern that is used to validate this parameter
        # is a string of any of the characters in the ASCII character range.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of policy to create. You can specify one of the following values: SERVICE_CONTROL_POLICY
        # RESOURCE_CONTROL_POLICY DECLARATIVE_POLICY_EC2 BACKUP_POLICY TAG_POLICY CHATBOT_POLICY
        # AISERVICES_OPT_OUT_POLICY SECURITYHUB_POLICY UPGRADE_ROLLOUT_POLICY INSPECTOR_POLICY BEDROCK_POLICY
        # S3_POLICY NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "Type")]
        getter type : String

        # A list of tags that you want to attach to the newly created policy. For each tag in the list, you
        # must specify both a tag key and a value. You can set the value to an empty string, but you can't set
        # it to null . For more information about tagging, see Tagging Organizations resources in the
        # Organizations User Guide. If any one of the tags is not valid or if you exceed the allowed number of
        # tags for a policy, then the entire request fails and the policy is not created.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @content : String,
          @description : String,
          @name : String,
          @type : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePolicyResponse
        include JSON::Serializable

        # A structure that contains details about the newly created policy.

        @[JSON::Field(key: "Policy")]
        getter policy : Types::Policy?

        def initialize(
          @policy : Types::Policy? = nil
        )
        end
      end


      struct DeclineHandshakeRequest
        include JSON::Serializable

        # ID for the handshake that you want to decline. You can get the ID from the ListHandshakesForAccount
        # operation. The regex pattern for handshake ID string requires "h-" followed by from 8 to 32
        # lowercase letters or digits.

        @[JSON::Field(key: "HandshakeId")]
        getter handshake_id : String

        def initialize(
          @handshake_id : String
        )
        end
      end


      struct DeclineHandshakeResponse
        include JSON::Serializable

        # A Handshake object. Contains details for the declined handshake.

        @[JSON::Field(key: "Handshake")]
        getter handshake : Types::Handshake?

        def initialize(
          @handshake : Types::Handshake? = nil
        )
        end
      end

      # Contains information about the delegated administrator.

      struct DelegatedAdministrator
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the delegated administrator's account.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date when the account was made a delegated administrator.

        @[JSON::Field(key: "DelegationEnabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delegation_enabled_date : Time?

        # The email address that is associated with the delegated administrator's Amazon Web Services account.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The unique identifier (ID) of the delegated administrator's account.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The method by which the delegated administrator's account joined the organization.

        @[JSON::Field(key: "JoinedMethod")]
        getter joined_method : String?

        # The date when the delegated administrator's account became a part of the organization.

        @[JSON::Field(key: "JoinedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter joined_timestamp : Time?

        # The friendly name of the delegated administrator's account.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Each state represents a specific phase in the account lifecycle. Use this information to manage
        # account access, automate workflows, or trigger actions based on account state changes. For more
        # information about account states and their implications, see Monitor the state of your Amazon Web
        # Services accounts in the Organizations User Guide .

        @[JSON::Field(key: "State")]
        getter state : String?

        # The status of the delegated administrator's account in the organization.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @delegation_enabled_date : Time? = nil,
          @email : String? = nil,
          @id : String? = nil,
          @joined_method : String? = nil,
          @joined_timestamp : Time? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about the Amazon Web Services service for which the account is a delegated
      # administrator.

      struct DelegatedService
        include JSON::Serializable

        # The date that the account became a delegated administrator for this service.

        @[JSON::Field(key: "DelegationEnabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delegation_enabled_date : Time?

        # The name of an Amazon Web Services service that can request an operation for the specified service.
        # This is typically in the form of a URL, such as: servicename .amazonaws.com .

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String?

        def initialize(
          @delegation_enabled_date : Time? = nil,
          @service_principal : String? = nil
        )
        end
      end


      struct DeleteOrganizationalUnitRequest
        include JSON::Serializable

        # ID for the organizational unit that you want to delete. You can get the ID from the
        # ListOrganizationalUnitsForParent operation. The regex pattern for an organizational unit ID string
        # requires "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that
        # contains the OU). This string is followed by a second "-" dash and from 8 to 32 additional lowercase
        # letters or digits.

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String

        def initialize(
          @organizational_unit_id : String
        )
        end
      end


      struct DeletePolicyRequest
        include JSON::Serializable

        # ID for the policy that you want to delete. You can get the ID from the ListPolicies or
        # ListPoliciesForTarget operations. The regex pattern for a policy ID string requires "p-" followed by
        # from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        def initialize(
          @policy_id : String
        )
        end
      end


      struct DeregisterDelegatedAdministratorRequest
        include JSON::Serializable

        # The account ID number of the member account in the organization that you want to deregister as a
        # delegated administrator.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The service principal name of an Amazon Web Services service for which the account is a delegated
        # administrator. Delegated administrator privileges are revoked for only the specified Amazon Web
        # Services service from the member account. If the specified service is the only service for which the
        # member account is a delegated administrator, the operation also revokes Organizations read action
        # permissions.

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String

        def initialize(
          @account_id : String,
          @service_principal : String
        )
        end
      end


      struct DescribeAccountRequest
        include JSON::Serializable

        # The unique identifier (ID) of the Amazon Web Services account that you want information about. You
        # can get the ID from the ListAccounts or ListAccountsForParent operations. The regex pattern for an
        # account ID string requires exactly 12 digits.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct DescribeAccountResponse
        include JSON::Serializable

        # A structure that contains information about the requested account. The Status parameter in the API
        # response will be retired on September 9, 2026. Although both the account State and account Status
        # parameters are currently available in the Organizations APIs ( DescribeAccount , ListAccounts ,
        # ListAccountsForParent ), we recommend that you update your scripts or other code to use the State
        # parameter instead of Status before September 9, 2026.

        @[JSON::Field(key: "Account")]
        getter account : Types::Account?

        def initialize(
          @account : Types::Account? = nil
        )
        end
      end


      struct DescribeCreateAccountStatusRequest
        include JSON::Serializable

        # Specifies the Id value that uniquely identifies the CreateAccount request. You can get the value
        # from the CreateAccountStatus.Id response in an earlier CreateAccount request, or from the
        # ListCreateAccountStatus operation. The regex pattern for a create account request ID string requires
        # "car-" followed by from 8 to 32 lowercase letters or digits.

        @[JSON::Field(key: "CreateAccountRequestId")]
        getter create_account_request_id : String

        def initialize(
          @create_account_request_id : String
        )
        end
      end


      struct DescribeCreateAccountStatusResponse
        include JSON::Serializable

        # A structure that contains the current status of an account creation request.

        @[JSON::Field(key: "CreateAccountStatus")]
        getter create_account_status : Types::CreateAccountStatus?

        def initialize(
          @create_account_status : Types::CreateAccountStatus? = nil
        )
        end
      end


      struct DescribeEffectivePolicyRequest
        include JSON::Serializable

        # The type of policy that you want information about. You can specify one of the following values:
        # DECLARATIVE_POLICY_EC2 BACKUP_POLICY TAG_POLICY CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY
        # SECURITYHUB_POLICY UPGRADE_ROLLOUT_POLICY INSPECTOR_POLICY BEDROCK_POLICY S3_POLICY
        # NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # When you're signed in as the management account, specify the ID of the account that you want details
        # about. Specifying an organization root or organizational unit (OU) as the target is not supported.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        def initialize(
          @policy_type : String,
          @target_id : String? = nil
        )
        end
      end


      struct DescribeEffectivePolicyResponse
        include JSON::Serializable

        # The contents of the effective policy.

        @[JSON::Field(key: "EffectivePolicy")]
        getter effective_policy : Types::EffectivePolicy?

        def initialize(
          @effective_policy : Types::EffectivePolicy? = nil
        )
        end
      end


      struct DescribeHandshakeRequest
        include JSON::Serializable

        # ID for the handshake that you want information about. The regex pattern for handshake ID string
        # requires "h-" followed by from 8 to 32 lowercase letters or digits.

        @[JSON::Field(key: "HandshakeId")]
        getter handshake_id : String

        def initialize(
          @handshake_id : String
        )
        end
      end


      struct DescribeHandshakeResponse
        include JSON::Serializable

        # A Handshake object. Contains details for the handshake.

        @[JSON::Field(key: "Handshake")]
        getter handshake : Types::Handshake?

        def initialize(
          @handshake : Types::Handshake? = nil
        )
        end
      end


      struct DescribeOrganizationResponse
        include JSON::Serializable

        # A structure that contains information about the organization. The AvailablePolicyTypes part of the
        # response is deprecated, and you shouldn't use it in your apps. It doesn't include any policy type
        # supported by Organizations other than SCPs. In the China (Ningxia) Region, no policy type is
        # included. To determine which policy types are enabled in your organization, use the ListRoots
        # operation.

        @[JSON::Field(key: "Organization")]
        getter organization : Types::Organization?

        def initialize(
          @organization : Types::Organization? = nil
        )
        end
      end


      struct DescribeOrganizationalUnitRequest
        include JSON::Serializable

        # ID for the organizational unit that you want details about. You can get the ID from the
        # ListOrganizationalUnitsForParent operation. The regex pattern for an organizational unit ID string
        # requires "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that
        # contains the OU). This string is followed by a second "-" dash and from 8 to 32 additional lowercase
        # letters or digits.

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String

        def initialize(
          @organizational_unit_id : String
        )
        end
      end


      struct DescribeOrganizationalUnitResponse
        include JSON::Serializable

        # A structure that contains details about the specified OU.

        @[JSON::Field(key: "OrganizationalUnit")]
        getter organizational_unit : Types::OrganizationalUnit?

        def initialize(
          @organizational_unit : Types::OrganizationalUnit? = nil
        )
        end
      end


      struct DescribePolicyRequest
        include JSON::Serializable

        # ID for the policy that you want details about. You can get the ID from the ListPolicies or
        # ListPoliciesForTarget operations. The regex pattern for a policy ID string requires "p-" followed by
        # from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        def initialize(
          @policy_id : String
        )
        end
      end


      struct DescribePolicyResponse
        include JSON::Serializable

        # A structure that contains details about the specified policy.

        @[JSON::Field(key: "Policy")]
        getter policy : Types::Policy?

        def initialize(
          @policy : Types::Policy? = nil
        )
        end
      end


      struct DescribeResourcePolicyResponse
        include JSON::Serializable

        # A structure that contains details about the resource policy.

        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : Types::ResourcePolicy?

        def initialize(
          @resource_policy : Types::ResourcePolicy? = nil
        )
        end
      end


      struct DescribeResponsibilityTransferRequest
        include JSON::Serializable

        # ID for the transfer.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeResponsibilityTransferResponse
        include JSON::Serializable

        # A ResponsibilityTransfer object. Contains details for a transfer.

        @[JSON::Field(key: "ResponsibilityTransfer")]
        getter responsibility_transfer : Types::ResponsibilityTransfer?

        def initialize(
          @responsibility_transfer : Types::ResponsibilityTransfer? = nil
        )
        end
      end

      # We can't find the destination container (a root or OU) with the ParentId that you specified.

      struct DestinationParentNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DetachPolicyRequest
        include JSON::Serializable

        # ID for the policy you want to detach. You can get the ID from the ListPolicies or
        # ListPoliciesForTarget operations. The regex pattern for a policy ID string requires "p-" followed by
        # from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # ID for the root, OU, or account that you want to detach the policy from. You can get the ID from the
        # ListRoots , ListOrganizationalUnitsForParent , or ListAccounts operations. The regex pattern for a
        # target ID string requires one of the following: Root - A string that begins with "r-" followed by
        # from 4 to 32 lowercase letters or digits. Account - A string that consists of exactly 12 digits.
        # Organizational unit (OU) - A string that begins with "ou-" followed by from 4 to 32 lowercase
        # letters or digits (the ID of the root that the OU is in). This string is followed by a second "-"
        # dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String

        def initialize(
          @policy_id : String,
          @target_id : String
        )
        end
      end


      struct DisableAWSServiceAccessRequest
        include JSON::Serializable

        # The service principal name of the Amazon Web Services service for which you want to disable
        # integration with your organization. This is typically in the form of a URL, such as
        # service-abbreviation .amazonaws.com .

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String

        def initialize(
          @service_principal : String
        )
        end
      end


      struct DisablePolicyTypeRequest
        include JSON::Serializable

        # The policy type that you want to disable in this root. You can specify one of the following values:
        # SERVICE_CONTROL_POLICY RESOURCE_CONTROL_POLICY DECLARATIVE_POLICY_EC2 BACKUP_POLICY TAG_POLICY
        # CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY SECURITYHUB_POLICY UPGRADE_ROLLOUT_POLICY INSPECTOR_POLICY
        # BEDROCK_POLICY S3_POLICY NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # ID for the root in which you want to disable a policy type. You can get the ID from the ListRoots
        # operation. The regex pattern for a root ID string requires "r-" followed by from 4 to 32 lowercase
        # letters or digits.

        @[JSON::Field(key: "RootId")]
        getter root_id : String

        def initialize(
          @policy_type : String,
          @root_id : String
        )
        end
      end


      struct DisablePolicyTypeResponse
        include JSON::Serializable

        # A structure that shows the root with the updated list of enabled policy types.

        @[JSON::Field(key: "Root")]
        getter root : Types::Root?

        def initialize(
          @root : Types::Root? = nil
        )
        end
      end

      # That account is already present in the specified destination.

      struct DuplicateAccountException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A handshake with the same action and target already exists. For example, if you invited an account
      # to join your organization, the invited account might already have a pending invitation from this
      # organization. If you intend to resend an invitation to an account, ensure that existing handshakes
      # that might be considered duplicates are canceled or declined.

      struct DuplicateHandshakeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An OU with the same name already exists.

      struct DuplicateOrganizationalUnitException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The selected policy is already attached to the specified target.

      struct DuplicatePolicyAttachmentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A policy with the same name already exists.

      struct DuplicatePolicyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains rules to be applied to the affected accounts. The effective policy is the aggregation of
      # any policies the account inherits, plus any policy directly attached to the account.

      struct EffectivePolicy
        include JSON::Serializable

        # The time of the last update to this policy.

        @[JSON::Field(key: "LastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The text content of the policy.

        @[JSON::Field(key: "PolicyContent")]
        getter policy_content : String?

        # The policy type.

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        # The account ID of the policy target.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        def initialize(
          @last_updated_timestamp : Time? = nil,
          @policy_content : String? = nil,
          @policy_type : String? = nil,
          @target_id : String? = nil
        )
        end
      end

      # If you ran this action on the management account, this policy type is not enabled. If you ran the
      # action on a member account, the account doesn't have an effective policy of this type. Contact the
      # administrator of your organization about attaching a policy of this type to the account.

      struct EffectivePolicyNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about the validation errors that occurred when generating or enforcing an effective
      # policy , such as which policies contributed to the error and location of the error.

      struct EffectivePolicyValidationError
        include JSON::Serializable

        # The individual policies inherited and attached to the account which contributed to the validation
        # error.

        @[JSON::Field(key: "ContributingPolicies")]
        getter contributing_policies : Array(String)?

        # The error code for the validation error. For example, ELEMENTS_TOO_MANY .

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message for the validation error.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The path within the effective policy where the validation error occurred.

        @[JSON::Field(key: "PathToError")]
        getter path_to_error : String?

        def initialize(
          @contributing_policies : Array(String)? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @path_to_error : String? = nil
        )
        end
      end


      struct EnableAWSServiceAccessRequest
        include JSON::Serializable

        # The service principal name of the Amazon Web Services service for which you want to enable
        # integration with your organization. This is typically in the form of a URL, such as
        # service-abbreviation .amazonaws.com .

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String

        def initialize(
          @service_principal : String
        )
        end
      end


      struct EnableAllFeaturesRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct EnableAllFeaturesResponse
        include JSON::Serializable

        # A structure that contains details about the handshake created to support this request to enable all
        # features in the organization.

        @[JSON::Field(key: "Handshake")]
        getter handshake : Types::Handshake?

        def initialize(
          @handshake : Types::Handshake? = nil
        )
        end
      end


      struct EnablePolicyTypeRequest
        include JSON::Serializable

        # The policy type that you want to enable. You can specify one of the following values:
        # SERVICE_CONTROL_POLICY RESOURCE_CONTROL_POLICY DECLARATIVE_POLICY_EC2 BACKUP_POLICY TAG_POLICY
        # CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY SECURITYHUB_POLICY UPGRADE_ROLLOUT_POLICY INSPECTOR_POLICY
        # BEDROCK_POLICY S3_POLICY NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # ID for the root in which you want to enable a policy type. You can get the ID from the ListRoots
        # operation. The regex pattern for a root ID string requires "r-" followed by from 4 to 32 lowercase
        # letters or digits.

        @[JSON::Field(key: "RootId")]
        getter root_id : String

        def initialize(
          @policy_type : String,
          @root_id : String
        )
        end
      end


      struct EnablePolicyTypeResponse
        include JSON::Serializable

        # A structure that shows the root with the updated list of enabled policy types.

        @[JSON::Field(key: "Root")]
        getter root : Types::Root?

        def initialize(
          @root : Types::Root? = nil
        )
        end
      end

      # A structure that contains details of a service principal that represents an Amazon Web Services
      # service that is enabled to integrate with Organizations.

      struct EnabledServicePrincipal
        include JSON::Serializable

        # The date that the service principal was enabled for integration with Organizations.

        @[JSON::Field(key: "DateEnabled", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_enabled : Time?

        # The name of the service principal. This is typically in the form of a URL, such as: servicename
        # .amazonaws.com .

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String?

        def initialize(
          @date_enabled : Time? = nil,
          @service_principal : String? = nil
        )
        end
      end

      # Organizations couldn't perform the operation because your organization hasn't finished initializing.
      # This can take up to an hour. Try again later. If after one hour you continue to receive this error,
      # contact Amazon Web Services Support .

      struct FinalizingOrganizationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details for a handshake. A handshake is the secure exchange of information between two
      # Amazon Web Services accounts: a sender and a recipient. Note: Handshakes that are CANCELED ,
      # ACCEPTED , DECLINED , or EXPIRED show up in lists for only 30 days after entering that state After
      # that they are deleted.

      struct Handshake
        include JSON::Serializable

        # The type of handshake: INVITE : Handshake sent to a standalone account requesting that it to join
        # the sender's organization. ENABLE_ALL_FEATURES : Handshake sent to invited member accounts to enable
        # all features for the organization. APPROVE_ALL_FEATURES : Handshake sent to the management account
        # when all invited member accounts have approved to enable all features. TRANSFER_RESPONSIBILITY :
        # Handshake sent to another organization's management account requesting that it designate the sender
        # with the specified responsibilities for recipient's organization.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # Amazon Resource Name (ARN) for the handshake. For more information about ARNs in Organizations, see
        # ARN Formats Supported by Organizations in the Amazon Web Services Service Authorization Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Timestamp when the handshake expires.

        @[JSON::Field(key: "ExpirationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_timestamp : Time?

        # ID for the handshake. The regex pattern for handshake ID string requires "h-" followed by from 8 to
        # 32 lowercase letters or digits.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # An array of HandshakeParty objects. Contains details for participant in a handshake.

        @[JSON::Field(key: "Parties")]
        getter parties : Array(Types::HandshakeParty)?

        # Timestamp when the handshake request was made.

        @[JSON::Field(key: "RequestedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter requested_timestamp : Time?

        # An array of HandshakeResource objects. When needed, contains additional details for a handshake. For
        # example, the email address for the sender.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::HandshakeResource)?

        # Current state for the handshake. REQUESTED : Handshake awaiting a response from the recipient. OPEN
        # : Handshake sent to multiple recipients and all recipients have responded. The sender can now
        # complete the handshake action. CANCELED : Handshake canceled by the sender. ACCEPTED : Handshake
        # accepted by the recipient. DECLINED : Handshake declined by the recipient. EXPIRED : Handshake has
        # expired.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @action : String? = nil,
          @arn : String? = nil,
          @expiration_timestamp : Time? = nil,
          @id : String? = nil,
          @parties : Array(Types::HandshakeParty)? = nil,
          @requested_timestamp : Time? = nil,
          @resources : Array(Types::HandshakeResource)? = nil,
          @state : String? = nil
        )
        end
      end

      # The specified handshake is already in the requested state. For example, you can't accept a handshake
      # that was already accepted.

      struct HandshakeAlreadyInStateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
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

      struct HandshakeConstraintViolationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains the filter used to select the handshakes for an operation.

      struct HandshakeFilter
        include JSON::Serializable

        # The type of handshake. If you specify ActionType , you cannot also specify ParentHandshakeId .

        @[JSON::Field(key: "ActionType")]
        getter action_type : String?

        # The parent handshake. Only used for handshake types that are a child of another type. If you specify
        # ParentHandshakeId , you cannot also specify ActionType . The regex pattern for handshake ID string
        # requires "h-" followed by from 8 to 32 lowercase letters or digits.

        @[JSON::Field(key: "ParentHandshakeId")]
        getter parent_handshake_id : String?

        def initialize(
          @action_type : String? = nil,
          @parent_handshake_id : String? = nil
        )
        end
      end

      # We can't find a handshake with the HandshakeId that you specified.

      struct HandshakeNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details for a participant in a handshake.

      struct HandshakeParty
        include JSON::Serializable

        # ID for the participant: Acccount ID, organization ID, or email address. The regex pattern for
        # handshake ID string requires "h-" followed by from 8 to 32 lowercase letters or digits.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The type of ID for the participant.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @id : String,
          @type : String
        )
        end
      end

      # Contains additional details for a handshake.

      struct HandshakeResource
        include JSON::Serializable

        # An array of HandshakeResource objects. When needed, contains additional details for a handshake. For
        # example, the email address for the sender.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::HandshakeResource)?

        # The type of information being passed, specifying how the value is to be interpreted by the other
        # party: ACCOUNT : ID for an Amazon Web Services account. ORGANIZATION : ID for an organization. EMAIL
        # : Email address for the recipient. OWNER_EMAIL : Email address for the sender. OWNER_NAME : Name of
        # the sender. NOTES : Additional text included by the sender for the recipient.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Additional information for the handshake. The format of the value string must match the requirements
        # of the specified type.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @resources : Array(Types::HandshakeResource)? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # You can't perform the operation on the handshake in its current state. For example, you can't cancel
      # a handshake that was already accepted or accept a handshake that was already declined.

      struct InvalidHandshakeTransitionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
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

      struct InvalidInputException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The responsibility transfer can't transition to the requested state because it's not in a valid
      # state for this operation.

      struct InvalidResponsibilityTransferTransitionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct InviteAccountToOrganizationRequest
        include JSON::Serializable

        # The identifier (ID) of the Amazon Web Services account that you want to invite to join your
        # organization. This is a JSON object that contains the following elements: { "Type": "ACCOUNT", "Id":
        # "&lt; account id number &gt;" } If you use the CLI, you can submit this as a single string, similar
        # to the following example: --target Id=123456789012,Type=ACCOUNT If you specify "Type": "ACCOUNT" ,
        # you must provide the Amazon Web Services account ID number as the Id . If you specify "Type":
        # "EMAIL" , you must specify the email address that is associated with the account. --target
        # Id=diego@example.com,Type=EMAIL

        @[JSON::Field(key: "Target")]
        getter target : Types::HandshakeParty

        # Additional information that you want to include in the generated email to the recipient account
        # owner.

        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # A list of tags that you want to attach to the account when it becomes a member of the organization.
        # For each tag in the list, you must specify both a tag key and a value. You can set the value to an
        # empty string, but you can't set it to null . For more information about tagging, see Tagging
        # Organizations resources in the Organizations User Guide. Any tags in the request are checked for
        # compliance with any applicable tag policies when the request is made. The request is rejected if the
        # tags in the request don't match the requirements of the policy at that time. Tag policy compliance
        # is not checked again when the invitation is accepted and the tags are actually attached to the
        # account. That means that if the tag policy changes between the invitation and the acceptance, then
        # that tags could potentially be non-compliant. If any one of the tags is not valid or if you exceed
        # the allowed number of tags for an account, then the entire request fails and invitations are not
        # sent.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @target : Types::HandshakeParty,
          @notes : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct InviteAccountToOrganizationResponse
        include JSON::Serializable

        # A structure that contains details about the handshake that is created to support this invitation
        # request.

        @[JSON::Field(key: "Handshake")]
        getter handshake : Types::Handshake?

        def initialize(
          @handshake : Types::Handshake? = nil
        )
        end
      end


      struct InviteOrganizationToTransferResponsibilityRequest
        include JSON::Serializable

        # Name you want to assign to the transfer.

        @[JSON::Field(key: "SourceName")]
        getter source_name : String

        # Timestamp when the recipient will begin managing the specified responsibilities.

        @[JSON::Field(key: "StartTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_timestamp : Time

        # A HandshakeParty object. Contains details for the account you want to invite. Currently, only
        # ACCOUNT and EMAIL are supported.

        @[JSON::Field(key: "Target")]
        getter target : Types::HandshakeParty

        # The type of responsibility you want to designate to your organization. Currently, only BILLING is
        # supported.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Additional information that you want to include in the invitation.

        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # A list of tags that you want to attach to the transfer. For each tag in the list, you must specify
        # both a tag key and a value. You can set the value to an empty string, but you can't set it to null .
        # For more information about tagging, see Tagging Organizations resources in the Organizations User
        # Guide. Any tags in the request are checked for compliance with any applicable tag policies when the
        # request is made. The request is rejected if the tags in the request don't match the requirements of
        # the policy at that time. Tag policy compliance is not checked again when the invitation is accepted
        # and the tags are actually attached to the transfer. That means that if the tag policy changes
        # between the invitation and the acceptance, then that tags could potentially be non-compliant. If any
        # one of the tags is not valid or if you exceed the allowed number of tags for a transfer, then the
        # entire request fails and invitations are not sent.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @source_name : String,
          @start_timestamp : Time,
          @target : Types::HandshakeParty,
          @type : String,
          @notes : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct InviteOrganizationToTransferResponsibilityResponse
        include JSON::Serializable


        @[JSON::Field(key: "Handshake")]
        getter handshake : Types::Handshake?

        def initialize(
          @handshake : Types::Handshake? = nil
        )
        end
      end


      struct ListAWSServiceAccessForOrganizationRequest
        include JSON::Serializable

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAWSServiceAccessForOrganizationResponse
        include JSON::Serializable

        # A list of the service principals for the services that are enabled to integrate with your
        # organization. Each principal is a structure that includes the name and the date that it was enabled
        # for integration with Organizations.

        @[JSON::Field(key: "EnabledServicePrincipals")]
        getter enabled_service_principals : Array(Types::EnabledServicePrincipal)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @enabled_service_principals : Array(Types::EnabledServicePrincipal)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountsForParentRequest
        include JSON::Serializable

        # The unique identifier (ID) for the parent root or organization unit (OU) whose accounts you want to
        # list.

        @[JSON::Field(key: "ParentId")]
        getter parent_id : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @parent_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountsForParentResponse
        include JSON::Serializable

        # A list of the accounts in the specified root or OU. The Status parameter in the API response will be
        # retired on September 9, 2026. Although both the account State and account Status parameters are
        # currently available in the Organizations APIs ( DescribeAccount , ListAccounts ,
        # ListAccountsForParent ), we recommend that you update your scripts or other code to use the State
        # parameter instead of Status before September 9, 2026.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(Types::Account)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accounts : Array(Types::Account)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountsRequest
        include JSON::Serializable

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountsResponse
        include JSON::Serializable

        # A list of objects in the organization. The Status parameter in the API response will be retired on
        # September 9, 2026. Although both the account State and account Status parameters are currently
        # available in the Organizations APIs ( DescribeAccount , ListAccounts , ListAccountsForParent ), we
        # recommend that you update your scripts or other code to use the State parameter instead of Status
        # before September 9, 2026.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(Types::Account)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accounts : Array(Types::Account)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountsWithInvalidEffectivePolicyRequest
        include JSON::Serializable

        # The type of policy that you want information about. You can specify one of the following values:
        # DECLARATIVE_POLICY_EC2 BACKUP_POLICY TAG_POLICY CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY
        # SECURITYHUB_POLICY UPGRADE_ROLLOUT_POLICY INSPECTOR_POLICY BEDROCK_POLICY S3_POLICY
        # NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @policy_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountsWithInvalidEffectivePolicyResponse
        include JSON::Serializable

        # The accounts in the organization which have an invalid effective policy for the specified policy
        # type.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(Types::Account)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The specified policy type. One of the following values: DECLARATIVE_POLICY_EC2 BACKUP_POLICY
        # TAG_POLICY CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY SECURITYHUB_POLICY UPGRADE_ROLLOUT_POLICY
        # INSPECTOR_POLICY BEDROCK_POLICY S3_POLICY NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        def initialize(
          @accounts : Array(Types::Account)? = nil,
          @next_token : String? = nil,
          @policy_type : String? = nil
        )
        end
      end


      struct ListChildrenRequest
        include JSON::Serializable

        # Filters the output to include only the specified child type.

        @[JSON::Field(key: "ChildType")]
        getter child_type : String

        # The unique identifier (ID) for the parent root or OU whose children you want to list. The regex
        # pattern for a parent ID string requires one of the following: Root - A string that begins with "r-"
        # followed by from 4 to 32 lowercase letters or digits. Organizational unit (OU) - A string that
        # begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the
        # OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lowercase
        # letters or digits.

        @[JSON::Field(key: "ParentId")]
        getter parent_id : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @child_type : String,
          @parent_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChildrenResponse
        include JSON::Serializable

        # The list of children of the specified parent container.

        @[JSON::Field(key: "Children")]
        getter children : Array(Types::Child)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @children : Array(Types::Child)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCreateAccountStatusRequest
        include JSON::Serializable

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of one or more states that you want included in the response. If this parameter isn't
        # present, all requests are included in the response.

        @[JSON::Field(key: "States")]
        getter states : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @states : Array(String)? = nil
        )
        end
      end


      struct ListCreateAccountStatusResponse
        include JSON::Serializable

        # A list of objects with details about the requests. Certain elements, such as the accountId number,
        # are present in the output only after the account has been successfully created.

        @[JSON::Field(key: "CreateAccountStatuses")]
        getter create_account_statuses : Array(Types::CreateAccountStatus)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @create_account_statuses : Array(Types::CreateAccountStatus)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDelegatedAdministratorsRequest
        include JSON::Serializable

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies a service principal name. If specified, then the operation lists the delegated
        # administrators only for the specified service. If you don't specify a service principal, the
        # operation lists all delegated administrators for all services in your organization.

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_principal : String? = nil
        )
        end
      end


      struct ListDelegatedAdministratorsResponse
        include JSON::Serializable

        # The list of delegated administrators in your organization.

        @[JSON::Field(key: "DelegatedAdministrators")]
        getter delegated_administrators : Array(Types::DelegatedAdministrator)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @delegated_administrators : Array(Types::DelegatedAdministrator)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDelegatedServicesForAccountRequest
        include JSON::Serializable

        # The account ID number of a delegated administrator account in the organization.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDelegatedServicesForAccountResponse
        include JSON::Serializable

        # The services for which the account is a delegated administrator.

        @[JSON::Field(key: "DelegatedServices")]
        getter delegated_services : Array(Types::DelegatedService)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @delegated_services : Array(Types::DelegatedService)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEffectivePolicyValidationErrorsRequest
        include JSON::Serializable

        # The ID of the account that you want details about. Specifying an organization root or organizational
        # unit (OU) as the target is not supported.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The type of policy that you want information about. You can specify one of the following values:
        # DECLARATIVE_POLICY_EC2 BACKUP_POLICY TAG_POLICY CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY
        # SECURITYHUB_POLICY UPGRADE_ROLLOUT_POLICY INSPECTOR_POLICY BEDROCK_POLICY S3_POLICY
        # NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @policy_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEffectivePolicyValidationErrorsResponse
        include JSON::Serializable

        # The ID of the specified account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The EffectivePolicyValidationError object contains details about the validation errors that occurred
        # when generating or enforcing an effective policy, such as which policies contributed to the error
        # and location of the error.

        @[JSON::Field(key: "EffectivePolicyValidationErrors")]
        getter effective_policy_validation_errors : Array(Types::EffectivePolicyValidationError)?

        # The time when the latest effective policy was generated for the specified account.

        @[JSON::Field(key: "EvaluationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter evaluation_timestamp : Time?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The path in the organization where the specified account exists.

        @[JSON::Field(key: "Path")]
        getter path : String?

        # The specified policy type. One of the following values: DECLARATIVE_POLICY_EC2 BACKUP_POLICY
        # TAG_POLICY CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY SECURITYHUB_POLICY UPGRADE_ROLLOUT_POLICY
        # INSPECTOR_POLICY BEDROCK_POLICY S3_POLICY NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        def initialize(
          @account_id : String? = nil,
          @effective_policy_validation_errors : Array(Types::EffectivePolicyValidationError)? = nil,
          @evaluation_timestamp : Time? = nil,
          @next_token : String? = nil,
          @path : String? = nil,
          @policy_type : String? = nil
        )
        end
      end


      struct ListHandshakesForAccountRequest
        include JSON::Serializable

        # A HandshakeFilter object. Contains the filer used to select the handshakes for an operation.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::HandshakeFilter?

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::HandshakeFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListHandshakesForAccountResponse
        include JSON::Serializable

        # An array of Handshake objects. Contains details for a handshake.

        @[JSON::Field(key: "Handshakes")]
        getter handshakes : Array(Types::Handshake)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @handshakes : Array(Types::Handshake)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListHandshakesForOrganizationRequest
        include JSON::Serializable

        # A HandshakeFilter object. Contains the filer used to select the handshakes for an operation.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::HandshakeFilter?

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::HandshakeFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListHandshakesForOrganizationResponse
        include JSON::Serializable

        # An array of Handshake objects. Contains details for a handshake.

        @[JSON::Field(key: "Handshakes")]
        getter handshakes : Array(Types::Handshake)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @handshakes : Array(Types::Handshake)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInboundResponsibilityTransfersRequest
        include JSON::Serializable

        # The type of responsibility. Currently, only BILLING is supported.

        @[JSON::Field(key: "Type")]
        getter type : String

        # ID for the transfer.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @type : String,
          @id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInboundResponsibilityTransfersResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A ResponsibilityTransfers object. Contains details for a transfer.

        @[JSON::Field(key: "ResponsibilityTransfers")]
        getter responsibility_transfers : Array(Types::ResponsibilityTransfer)?

        def initialize(
          @next_token : String? = nil,
          @responsibility_transfers : Array(Types::ResponsibilityTransfer)? = nil
        )
        end
      end


      struct ListOrganizationalUnitsForParentRequest
        include JSON::Serializable

        # ID for the root or OU whose child OUs you want to list. The regex pattern for a parent ID string
        # requires one of the following: Root - A string that begins with "r-" followed by from 4 to 32
        # lowercase letters or digits. Organizational unit (OU) - A string that begins with "ou-" followed by
        # from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is
        # followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "ParentId")]
        getter parent_id : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @parent_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOrganizationalUnitsForParentResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of the OUs in the specified root or parent OU.

        @[JSON::Field(key: "OrganizationalUnits")]
        getter organizational_units : Array(Types::OrganizationalUnit)?

        def initialize(
          @next_token : String? = nil,
          @organizational_units : Array(Types::OrganizationalUnit)? = nil
        )
        end
      end


      struct ListOutboundResponsibilityTransfersRequest
        include JSON::Serializable

        # The type of responsibility. Currently, only BILLING is supported.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOutboundResponsibilityTransfersResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ResponsibilityTransfer objects. Contains details for a transfer.

        @[JSON::Field(key: "ResponsibilityTransfers")]
        getter responsibility_transfers : Array(Types::ResponsibilityTransfer)?

        def initialize(
          @next_token : String? = nil,
          @responsibility_transfers : Array(Types::ResponsibilityTransfer)? = nil
        )
        end
      end


      struct ListParentsRequest
        include JSON::Serializable

        # ID for the OU or account whose parent containers you want to list. Don't specify a root. The regex
        # pattern for a child ID string requires one of the following: Account - A string that consists of
        # exactly 12 digits. Organizational unit (OU) - A string that begins with "ou-" followed by from 4 to
        # 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed by
        # a second "-" dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "ChildId")]
        getter child_id : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @child_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListParentsResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of parents for the specified child account or OU.

        @[JSON::Field(key: "Parents")]
        getter parents : Array(Types::Parent)?

        def initialize(
          @next_token : String? = nil,
          @parents : Array(Types::Parent)? = nil
        )
        end
      end


      struct ListPoliciesForTargetRequest
        include JSON::Serializable

        # The type of policy that you want to include in the returned list. You must specify one of the
        # following values: SERVICE_CONTROL_POLICY RESOURCE_CONTROL_POLICY DECLARATIVE_POLICY_EC2
        # BACKUP_POLICY TAG_POLICY CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY SECURITYHUB_POLICY
        # UPGRADE_ROLLOUT_POLICY INSPECTOR_POLICY BEDROCK_POLICY S3_POLICY NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "Filter")]
        getter filter : String

        # ID for the root, organizational unit, or account whose policies you want to list. The regex pattern
        # for a target ID string requires one of the following: Root - A string that begins with "r-" followed
        # by from 4 to 32 lowercase letters or digits. Account - A string that consists of exactly 12 digits.
        # Organizational unit (OU) - A string that begins with "ou-" followed by from 4 to 32 lowercase
        # letters or digits (the ID of the root that the OU is in). This string is followed by a second "-"
        # dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : String,
          @target_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPoliciesForTargetResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of policies that match the criteria in the request.

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::PolicySummary)?

        def initialize(
          @next_token : String? = nil,
          @policies : Array(Types::PolicySummary)? = nil
        )
        end
      end


      struct ListPoliciesRequest
        include JSON::Serializable

        # Specifies the type of policy that you want to include in the response. You must specify one of the
        # following values: SERVICE_CONTROL_POLICY RESOURCE_CONTROL_POLICY DECLARATIVE_POLICY_EC2
        # BACKUP_POLICY TAG_POLICY CHATBOT_POLICY AISERVICES_OPT_OUT_POLICY SECURITYHUB_POLICY
        # UPGRADE_ROLLOUT_POLICY INSPECTOR_POLICY BEDROCK_POLICY S3_POLICY NETWORK_SECURITY_DIRECTOR_POLICY

        @[JSON::Field(key: "Filter")]
        getter filter : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPoliciesResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of policies that match the filter criteria in the request. The output list doesn't include
        # the policy contents. To see the content for a policy, see DescribePolicy .

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::PolicySummary)?

        def initialize(
          @next_token : String? = nil,
          @policies : Array(Types::PolicySummary)? = nil
        )
        end
      end


      struct ListRootsRequest
        include JSON::Serializable

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRootsResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of roots that are defined in an organization.

        @[JSON::Field(key: "Roots")]
        getter roots : Array(Types::Root)?

        def initialize(
          @next_token : String? = nil,
          @roots : Array(Types::Root)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ID of the resource with the tags to list. You can specify any of the following taggable
        # resources. Amazon Web Services account – specify the account ID number. Organizational unit –
        # specify the OU ID that begins with ou- and looks similar to: ou- 1a2b-34uvwxyz Root – specify the
        # root ID that begins with r- and looks similar to: r- 1a2b Policy – specify the policy ID that begins
        # with p- andlooks similar to: p- 12abcdefg3

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_id : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The tags that are assigned to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListTargetsForPolicyRequest
        include JSON::Serializable

        # ID for the policy whose attachments you want to know. The regex pattern for a policy ID string
        # requires "p-" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore
        # character (_).

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @policy_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTargetsForPolicyResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of structures, each of which contains details about one of the entities to which the
        # specified policy is attached.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::PolicyTargetSummary)?

        def initialize(
          @next_token : String? = nil,
          @targets : Array(Types::PolicyTargetSummary)? = nil
        )
        end
      end

      # The provided policy document doesn't meet the requirements of the specified policy type. For
      # example, the syntax might be incorrect. For details about service control policy syntax, see SCP
      # syntax in the Organizations User Guide .

      struct MalformedPolicyDocumentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You can't remove a management account from an organization. If you want the management account to
      # become a member account in another organization, you must first delete the current organization of
      # the management account.

      struct MasterCannotLeaveOrganizationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct MoveAccountRequest
        include JSON::Serializable

        # ID for the account that you want to move. The regex pattern for an account ID string requires
        # exactly 12 digits.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # ID for the root or organizational unit that you want to move the account to. The regex pattern for a
        # parent ID string requires one of the following: Root - A string that begins with "r-" followed by
        # from 4 to 32 lowercase letters or digits. Organizational unit (OU) - A string that begins with "ou-"
        # followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This
        # string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "DestinationParentId")]
        getter destination_parent_id : String

        # ID for the root or organizational unit that you want to move the account from. The regex pattern for
        # a parent ID string requires one of the following: Root - A string that begins with "r-" followed by
        # from 4 to 32 lowercase letters or digits. Organizational unit (OU) - A string that begins with "ou-"
        # followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This
        # string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "SourceParentId")]
        getter source_parent_id : String

        def initialize(
          @account_id : String,
          @destination_parent_id : String,
          @source_parent_id : String
        )
        end
      end

      # Contains details about an organization. An organization is a collection of accounts that are
      # centrally managed together using consolidated billing, organized hierarchically with organizational
      # units (OUs), and controlled with policies .

      struct Organization
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an organization. For more information about ARNs in Organizations,
        # see ARN Formats Supported by Organizations in the Amazon Web Services Service Authorization
        # Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Do not use. This field is deprecated and doesn't provide complete information about the policies in
        # your organization. To determine the policies that are enabled and available for use in your
        # organization, use the ListRoots operation instead.

        @[JSON::Field(key: "AvailablePolicyTypes")]
        getter available_policy_types : Array(Types::PolicyTypeSummary)?

        # Specifies the functionality that currently is available to the organization. If set to "ALL", then
        # all features are enabled and policies can be applied to accounts in the organization. If set to
        # "CONSOLIDATED_BILLING", then only consolidated billing functionality is available. For more
        # information, see Enabling all features in your organization in the Organizations User Guide .

        @[JSON::Field(key: "FeatureSet")]
        getter feature_set : String?

        # The unique identifier (ID) of an organization. The regex pattern for an organization ID string
        # requires "o-" followed by from 10 to 32 lowercase letters or digits.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the account that is designated as the management account for the
        # organization. For more information about ARNs in Organizations, see ARN Formats Supported by
        # Organizations in the Amazon Web Services Service Authorization Reference .

        @[JSON::Field(key: "MasterAccountArn")]
        getter master_account_arn : String?

        # The email address that is associated with the Amazon Web Services account that is designated as the
        # management account for the organization.

        @[JSON::Field(key: "MasterAccountEmail")]
        getter master_account_email : String?

        # The unique identifier (ID) of the management account of an organization. The regex pattern for an
        # account ID string requires exactly 12 digits.

        @[JSON::Field(key: "MasterAccountId")]
        getter master_account_id : String?

        def initialize(
          @arn : String? = nil,
          @available_policy_types : Array(Types::PolicyTypeSummary)? = nil,
          @feature_set : String? = nil,
          @id : String? = nil,
          @master_account_arn : String? = nil,
          @master_account_email : String? = nil,
          @master_account_id : String? = nil
        )
        end
      end

      # The organization isn't empty. To delete an organization, you must first remove all accounts except
      # the management account.

      struct OrganizationNotEmptyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about an organizational unit (OU). An OU is a container of Amazon Web Services
      # accounts within a root of an organization. Policies that are attached to an OU apply to all accounts
      # contained in that OU and in any child OUs.

      struct OrganizationalUnit
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of this OU. For more information about ARNs in Organizations, see ARN
        # Formats Supported by Organizations in the Amazon Web Services Service Authorization Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier (ID) associated with this OU. The ID is unique to the organization only. The
        # regex pattern for an organizational unit ID string requires "ou-" followed by from 4 to 32 lowercase
        # letters or digits (the ID of the root that contains the OU). This string is followed by a second "-"
        # dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The friendly name of this OU. The regex pattern that is used to validate this parameter is a string
        # of any of the characters in the ASCII character range.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The specified OU is not empty. Move all accounts to another root or to other OUs, remove all child
      # OUs, and try the operation again.

      struct OrganizationalUnitNotEmptyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # We can't find an OU with the OrganizationalUnitId that you specified.

      struct OrganizationalUnitNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about either a root or an organizational unit (OU) that can contain OUs or
      # accounts in an organization.

      struct Parent
        include JSON::Serializable

        # The unique identifier (ID) of the parent entity. The regex pattern for a parent ID string requires
        # one of the following: Root - A string that begins with "r-" followed by from 4 to 32 lowercase
        # letters or digits. Organizational unit (OU) - A string that begins with "ou-" followed by from 4 to
        # 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a
        # second "-" dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The type of the parent entity.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # We can't find a root or OU with the ParentId that you specified.

      struct ParentNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains rules to be applied to the affected accounts. Policies can be attached directly to
      # accounts, or to roots and OUs to affect all accounts in those hierarchies.

      struct Policy
        include JSON::Serializable

        # The text content of the policy.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # A structure that contains additional details about the policy.

        @[JSON::Field(key: "PolicySummary")]
        getter policy_summary : Types::PolicySummary?

        def initialize(
          @content : String? = nil,
          @policy_summary : Types::PolicySummary? = nil
        )
        end
      end

      # Changes to the effective policy are in progress, and its contents can't be returned. Try the
      # operation again later.

      struct PolicyChangesInProgressException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The policy is attached to one or more entities. You must detach it from all roots, OUs, and accounts
      # before performing this operation.

      struct PolicyInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The policy isn't attached to the specified target in the specified root.

      struct PolicyNotAttachedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # We can't find a policy with the PolicyId that you specified.

      struct PolicyNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about a policy, but does not include the content. To see the content of a
      # policy, see DescribePolicy .

      struct PolicySummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the policy. For more information about ARNs in Organizations, see
        # ARN Formats Supported by Organizations in the Amazon Web Services Service Authorization Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A boolean value that indicates whether the specified policy is an Amazon Web Services managed
        # policy. If true, then you can attach the policy to roots, OUs, or accounts, but you cannot edit it.

        @[JSON::Field(key: "AwsManaged")]
        getter aws_managed : Bool?

        # The description of the policy.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier (ID) of the policy. The regex pattern for a policy ID string requires "p-"
        # followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The friendly name of the policy. The regex pattern that is used to validate this parameter is a
        # string of any of the characters in the ASCII character range.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of policy.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @aws_managed : Bool? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information about a root, OU, or account that a policy is attached to.

      struct PolicyTargetSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the policy target. For more information about ARNs in
        # Organizations, see ARN Formats Supported by Organizations in the Amazon Web Services Service
        # Authorization Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The friendly name of the policy target. The regex pattern that is used to validate this parameter is
        # a string of any of the characters in the ASCII character range.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier (ID) of the policy target. The regex pattern for a target ID string requires
        # one of the following: Root - A string that begins with "r-" followed by from 4 to 32 lowercase
        # letters or digits. Account - A string that consists of exactly 12 digits. Organizational unit (OU) -
        # A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the
        # root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional
        # lowercase letters or digits.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        # The type of the policy target.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @target_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The specified policy type is already enabled in the specified root.

      struct PolicyTypeAlreadyEnabledException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You can't use the specified policy type with the feature set currently enabled for this
      # organization. For example, you can enable SCPs only after you enable all features in the
      # organization. For more information, see Managing Organizations policies in the Organizations User
      # Guide .

      struct PolicyTypeNotAvailableForOrganizationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified policy type isn't currently enabled in this root. You can't attach policies of the
      # specified type to entities in a root until you enable that type in the root. For more information,
      # see Enabling all features in your organization in the Organizations User Guide .

      struct PolicyTypeNotEnabledException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about a policy type and its status in the associated root.

      struct PolicyTypeSummary
        include JSON::Serializable

        # The status of the policy type as it relates to the associated root. To attach a policy of the
        # specified type to a root or to an OU or account in that root, it must be available in the
        # organization and enabled for that root.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The name of the policy type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct PutResourcePolicyRequest
        include JSON::Serializable

        # If provided, the new content for the resource policy. The text must be correctly formatted JSON that
        # complies with the syntax for the resource policy's type. For more information, see SCP syntax in the
        # Organizations User Guide .

        @[JSON::Field(key: "Content")]
        getter content : String

        # A list of tags that you want to attach to the newly created resource policy. For each tag in the
        # list, you must specify both a tag key and a value. You can set the value to an empty string, but you
        # can't set it to null . For more information about tagging, see Tagging Organizations resources in
        # the Organizations User Guide. Calls with tags apply to the initial creation of the resource policy,
        # otherwise an exception is thrown. If any one of the tags is not valid or if you exceed the allowed
        # number of tags for the resource policy, then the entire request fails and the resource policy is not
        # created.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @content : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutResourcePolicyResponse
        include JSON::Serializable

        # A structure that contains details about the resource policy.

        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : Types::ResourcePolicy?

        def initialize(
          @resource_policy : Types::ResourcePolicy? = nil
        )
        end
      end


      struct RegisterDelegatedAdministratorRequest
        include JSON::Serializable

        # The account ID number of the member account in the organization to register as a delegated
        # administrator.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The service principal of the Amazon Web Services service for which you want to make the member
        # account a delegated administrator.

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String

        def initialize(
          @account_id : String,
          @service_principal : String
        )
        end
      end


      struct RemoveAccountFromOrganizationRequest
        include JSON::Serializable

        # ID for the member account that you want to remove from the organization. The regex pattern for an
        # account ID string requires exactly 12 digits.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # A structure that contains details about a resource policy.

      struct ResourcePolicy
        include JSON::Serializable

        # The policy text of the resource policy.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # A structure that contains resource policy ID and Amazon Resource Name (ARN).

        @[JSON::Field(key: "ResourcePolicySummary")]
        getter resource_policy_summary : Types::ResourcePolicySummary?

        def initialize(
          @content : String? = nil,
          @resource_policy_summary : Types::ResourcePolicySummary? = nil
        )
        end
      end

      # We can't find a resource policy request with the parameter that you specified.

      struct ResourcePolicyNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that contains resource policy ID and Amazon Resource Name (ARN).

      struct ResourcePolicySummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource policy.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier (ID) of the resource policy.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Contains details for a transfer. A transfer is the arrangement between two management accounts where
      # one account designates the other with specified responsibilities for their organization.

      struct ResponsibilityTransfer
        include JSON::Serializable

        # ID for the handshake of the transfer.

        @[JSON::Field(key: "ActiveHandshakeId")]
        getter active_handshake_id : String?

        # Amazon Resource Name (ARN) for the transfer.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Timestamp when the transfer ends.

        @[JSON::Field(key: "EndTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_timestamp : Time?

        # ID for the transfer.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Name assigned to the transfer.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Account that allows another account external to its organization to manage the specified
        # responsibilities for the organization.

        @[JSON::Field(key: "Source")]
        getter source : Types::TransferParticipant?

        # Timestamp when the transfer starts.

        @[JSON::Field(key: "StartTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_timestamp : Time?

        # Status for the transfer.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Account that manages the specified responsibilities for another organization.

        @[JSON::Field(key: "Target")]
        getter target : Types::TransferParticipant?

        # The type of transfer. Currently, only BILLING is supported.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @active_handshake_id : String? = nil,
          @arn : String? = nil,
          @end_timestamp : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @source : Types::TransferParticipant? = nil,
          @start_timestamp : Time? = nil,
          @status : String? = nil,
          @target : Types::TransferParticipant? = nil,
          @type : String? = nil
        )
        end
      end

      # The responsibility transfer is already in the status that you specified.

      struct ResponsibilityTransferAlreadyInStatusException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # We can't find a transfer that you specified.

      struct ResponsibilityTransferNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about a root. A root is a top-level parent node in the hierarchy of an organization
      # that can contain organizational units (OUs) and accounts. The root contains every Amazon Web
      # Services account in the organization.

      struct Root
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the root. For more information about ARNs in Organizations, see
        # ARN Formats Supported by Organizations in the Amazon Web Services Service Authorization Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier (ID) for the root. The ID is unique to the organization only. The regex
        # pattern for a root ID string requires "r-" followed by from 4 to 32 lowercase letters or digits.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The friendly name of the root. The regex pattern that is used to validate this parameter is a string
        # of any of the characters in the ASCII character range.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The types of policies that are currently enabled for the root and therefore can be attached to the
        # root or to its OUs or accounts. Even if a policy type is shown as available in the organization, you
        # can separately enable and disable them at the root level by using EnablePolicyType and
        # DisablePolicyType . Use DescribeOrganization to see the availability of the policy types in that
        # organization.

        @[JSON::Field(key: "PolicyTypes")]
        getter policy_types : Array(Types::PolicyTypeSummary)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @policy_types : Array(Types::PolicyTypeSummary)? = nil
        )
        end
      end

      # We can't find a root with the RootId that you specified.

      struct RootNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Organizations can't complete your request because of an internal service error. Try again later.

      struct ServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # We can't find a source root or OU with the ParentId that you specified.

      struct SourceParentNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A custom key-value pair associated with a resource within your organization. You can attach tags to
      # any of the following organization resources. Amazon Web Services account Organizational unit (OU)
      # Organization root Policy

      struct Tag
        include JSON::Serializable

        # The key identifier, or name, of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The string value that's associated with the key of the tag. You can set the value of a tag to an
        # empty string, but you can't set the value of a tag to null.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ID of the resource to add a tag to. You can specify any of the following taggable resources.
        # Amazon Web Services account – specify the account ID number. Organizational unit – specify the OU ID
        # that begins with ou- and looks similar to: ou- 1a2b-34uvwxyz Root – specify the root ID that begins
        # with r- and looks similar to: r- 1a2b Policy – specify the policy ID that begins with p- andlooks
        # similar to: p- 12abcdefg3

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # A list of tags to add to the specified resource. For each tag in the list, you must specify both a
        # tag key and a value. The value can be an empty string, but you can't set it to null . If any one of
        # the tags is not valid or if you exceed the maximum allowed number of tags for a resource, then the
        # entire request fails.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # We can't find a root, OU, account, or policy with the TargetId that you specified.

      struct TargetNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct TerminateResponsibilityTransferRequest
        include JSON::Serializable

        # ID for the transfer.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Timestamp when the responsibility transfer is to end.

        @[JSON::Field(key: "EndTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_timestamp : Time?

        def initialize(
          @id : String,
          @end_timestamp : Time? = nil
        )
        end
      end


      struct TerminateResponsibilityTransferResponse
        include JSON::Serializable

        # A ResponsibilityTransfer object. Contains details for a transfer.

        @[JSON::Field(key: "ResponsibilityTransfer")]
        getter responsibility_transfer : Types::ResponsibilityTransfer?

        def initialize(
          @responsibility_transfer : Types::ResponsibilityTransfer? = nil
        )
        end
      end

      # You have sent too many requests in too short a period of time. The quota helps protect against
      # denial-of-service attacks. Try again later. For information about quotas that affect Organizations,
      # see Quotas for Organizations in the Organizations User Guide .

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains details for a participant in a transfer. A transfer is the arrangement between two
      # management accounts where one account designates the other with specified responsibilities for their
      # organization.

      struct TransferParticipant
        include JSON::Serializable

        # Email address for the management account.

        @[JSON::Field(key: "ManagementAccountEmail")]
        getter management_account_email : String?

        # ID for the management account.

        @[JSON::Field(key: "ManagementAccountId")]
        getter management_account_id : String?

        def initialize(
          @management_account_email : String? = nil,
          @management_account_id : String? = nil
        )
        end
      end

      # This action isn't available in the current Amazon Web Services Region.

      struct UnsupportedAPIEndpointException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ID of the resource to remove a tag from. You can specify any of the following taggable
        # resources. Amazon Web Services account – specify the account ID number. Organizational unit –
        # specify the OU ID that begins with ou- and looks similar to: ou- 1a2b-34uvwxyz Root – specify the
        # root ID that begins with r- and looks similar to: r- 1a2b Policy – specify the policy ID that begins
        # with p- andlooks similar to: p- 12abcdefg3

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The list of keys for tags to remove from the specified resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_id : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateOrganizationalUnitRequest
        include JSON::Serializable

        # ID for the OU that you want to rename. You can get the ID from the ListOrganizationalUnitsForParent
        # operation. The regex pattern for an organizational unit ID string requires "ou-" followed by from 4
        # to 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed
        # by a second "-" dash and from 8 to 32 additional lowercase letters or digits.

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String

        # The new name that you want to assign to the OU. The regex pattern that is used to validate this
        # parameter is a string of any of the characters in the ASCII character range.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @organizational_unit_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateOrganizationalUnitResponse
        include JSON::Serializable

        # A structure that contains the details about the specified OU, including its new name.

        @[JSON::Field(key: "OrganizationalUnit")]
        getter organizational_unit : Types::OrganizationalUnit?

        def initialize(
          @organizational_unit : Types::OrganizationalUnit? = nil
        )
        end
      end


      struct UpdatePolicyRequest
        include JSON::Serializable

        # ID for the policy that you want to update. The regex pattern for a policy ID string requires "p-"
        # followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # If provided, the new content for the policy. The text must be correctly formatted JSON that complies
        # with the syntax for the policy's type. For more information, see SCP syntax in the Organizations
        # User Guide . The maximum size of a policy document depends on the policy's type. For more
        # information, see Maximum and minimum values in the Organizations User Guide .

        @[JSON::Field(key: "Content")]
        getter content : String?

        # If provided, the new description for the policy.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If provided, the new name for the policy. The regex pattern that is used to validate this parameter
        # is a string of any of the characters in the ASCII character range.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @policy_id : String,
          @content : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdatePolicyResponse
        include JSON::Serializable

        # A structure that contains details about the updated policy, showing the requested changes.

        @[JSON::Field(key: "Policy")]
        getter policy : Types::Policy?

        def initialize(
          @policy : Types::Policy? = nil
        )
        end
      end


      struct UpdateResponsibilityTransferRequest
        include JSON::Serializable

        # ID for the transfer.

        @[JSON::Field(key: "Id")]
        getter id : String

        # New name you want to assign to the transfer.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @id : String,
          @name : String
        )
        end
      end


      struct UpdateResponsibilityTransferResponse
        include JSON::Serializable


        @[JSON::Field(key: "ResponsibilityTransfer")]
        getter responsibility_transfer : Types::ResponsibilityTransfer?

        def initialize(
          @responsibility_transfer : Types::ResponsibilityTransfer? = nil
        )
        end
      end
    end
  end
end
