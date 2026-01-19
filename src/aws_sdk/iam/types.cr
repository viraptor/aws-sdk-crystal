require "json"
require "time"

module AwsSdk
  module IAM
    module Types

      struct AcceptDelegationRequestRequest
        include JSON::Serializable

        # The unique identifier of the delegation request to accept.
        @[JSON::Field(key: "DelegationRequestId")]
        getter delegation_request_id : String

        def initialize(
          @delegation_request_id : String
        )
        end
      end

      # An object that contains details about when a principal in the reported Organizations entity last
      # attempted to access an Amazon Web Services service. A principal can be an IAM user, an IAM role, or
      # the Amazon Web Services account root user within the reported Organizations entity. This data type
      # is a response element in the GetOrganizationsAccessReport operation.
      struct AccessDetail
        include JSON::Serializable

        # The name of the service in which access was attempted.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The namespace of the service in which access was attempted. To learn the service namespace of a
        # service, see Actions, resources, and condition keys for Amazon Web Services services in the Service
        # Authorization Reference . Choose the name of the service to view details for that service. In the
        # first paragraph, find the service prefix. For example, (service prefix: a4b) . For more information
        # about service namespaces, see Amazon Web Services service namespaces in the Amazon Web Services
        # General Reference .
        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The path of the Organizations entity (root, organizational unit, or account) from which an
        # authenticated principal last attempted to access the service. Amazon Web Services does not report
        # unauthenticated requests. This field is null if no principals (IAM users, IAM roles, or root user)
        # in the reported Organizations entity attempted to access the service within the tracking period .
        @[JSON::Field(key: "EntityPath")]
        getter entity_path : String?

        # The date and time, in ISO 8601 date-time format , when an authenticated principal most recently
        # attempted to access the service. Amazon Web Services does not report unauthenticated requests. This
        # field is null if no principals in the reported Organizations entity attempted to access the service
        # within the tracking period .
        @[JSON::Field(key: "LastAuthenticatedTime")]
        getter last_authenticated_time : Time?

        # The Region where the last service access attempt occurred. This field is null if no principals in
        # the reported Organizations entity attempted to access the service within the tracking period .
        @[JSON::Field(key: "Region")]
        getter region : String?

        # The number of accounts with authenticated principals (root user, IAM users, and IAM roles) that
        # attempted to access the service in the tracking period.
        @[JSON::Field(key: "TotalAuthenticatedEntities")]
        getter total_authenticated_entities : Int32?

        def initialize(
          @service_name : String,
          @service_namespace : String,
          @entity_path : String? = nil,
          @last_authenticated_time : Time? = nil,
          @region : String? = nil,
          @total_authenticated_entities : Int32? = nil
        )
        end
      end

      # Contains information about an Amazon Web Services access key. This data type is used as a response
      # element in the CreateAccessKey and ListAccessKeys operations. The SecretAccessKey value is returned
      # only in response to CreateAccessKey . You can get a secret access key only when you first create an
      # access key; you cannot recover the secret access key later. If you lose a secret access key, you
      # must create a new access key.
      struct AccessKey
        include JSON::Serializable

        # The ID for this access key.
        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String

        # The secret key used to sign requests.
        @[JSON::Field(key: "SecretAccessKey")]
        getter secret_access_key : String

        # The status of the access key. Active means that the key is valid for API calls, while Inactive means
        # it is not.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the IAM user that the access key is associated with.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The date when the access key was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        def initialize(
          @access_key_id : String,
          @secret_access_key : String,
          @status : String,
          @user_name : String,
          @create_date : Time? = nil
        )
        end
      end

      # Contains information about the last time an Amazon Web Services access key was used since IAM began
      # tracking this information on April 22, 2015. This data type is used as a response element in the
      # GetAccessKeyLastUsed operation.
      struct AccessKeyLastUsed
        include JSON::Serializable

        # The Amazon Web Services Region where this access key was most recently used. The value for this
        # field is "N/A" in the following situations: The user does not have an access key. An access key
        # exists but has not been used since IAM began tracking this information. There is no sign-in data
        # associated with the user. For more information about Amazon Web Services Regions, see Regions and
        # endpoints in the Amazon Web Services General Reference.
        @[JSON::Field(key: "Region")]
        getter region : String

        # The name of the Amazon Web Services service with which this access key was most recently used. The
        # value of this field is "N/A" in the following situations: The user does not have an access key. An
        # access key exists but has not been used since IAM started tracking this information. There is no
        # sign-in data associated with the user.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The date and time, in ISO 8601 date-time format , when the access key was most recently used. This
        # field is null in the following situations: The user does not have an access key. An access key
        # exists but has not been used since IAM began tracking this information. There is no sign-in data
        # associated with the user.
        @[JSON::Field(key: "LastUsedDate")]
        getter last_used_date : Time?

        def initialize(
          @region : String,
          @service_name : String,
          @last_used_date : Time? = nil
        )
        end
      end

      # Contains information about an Amazon Web Services access key, without its secret key. This data type
      # is used as a response element in the ListAccessKeys operation.
      struct AccessKeyMetadata
        include JSON::Serializable

        # The ID for this access key.
        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String?

        # The date when the access key was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The status of the access key. Active means that the key is valid for API calls; Inactive means it is
        # not.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The name of the IAM user that the key is associated with.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @access_key_id : String? = nil,
          @create_date : Time? = nil,
          @status : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # The request was rejected because the account making the request is not the management account or
      # delegated administrator account for centralized root access .
      struct AccountNotManagementOrDelegatedAdministratorException
        include JSON::Serializable

        def initialize
        end
      end

      struct AddClientIDToOpenIDConnectProviderRequest
        include JSON::Serializable

        # The client ID (also known as audience) to add to the IAM OpenID Connect provider resource.
        @[JSON::Field(key: "ClientID")]
        getter client_id : String

        # The Amazon Resource Name (ARN) of the IAM OpenID Connect (OIDC) provider resource to add the client
        # ID to. You can get a list of OIDC provider ARNs by using the ListOpenIDConnectProviders operation.
        @[JSON::Field(key: "OpenIDConnectProviderArn")]
        getter open_id_connect_provider_arn : String

        def initialize(
          @client_id : String,
          @open_id_connect_provider_arn : String
        )
        end
      end

      struct AddRoleToInstanceProfileRequest
        include JSON::Serializable

        # The name of the instance profile to update. This parameter allows (through its regex pattern ) a
        # string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You
        # can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String

        # The name of the role to add. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @instance_profile_name : String,
          @role_name : String
        )
        end
      end

      struct AddUserToGroupRequest
        include JSON::Serializable

        # The name of the group to update. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The name of the user to add. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @group_name : String,
          @user_name : String
        )
        end
      end

      struct AssociateDelegationRequestRequest
        include JSON::Serializable

        # The unique identifier of the delegation request to associate.
        @[JSON::Field(key: "DelegationRequestId")]
        getter delegation_request_id : String

        def initialize(
          @delegation_request_id : String
        )
        end
      end

      struct AttachGroupPolicyRequest
        include JSON::Serializable

        # The name (friendly name, not ARN) of the group to attach the policy to. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The Amazon Resource Name (ARN) of the IAM policy you want to attach. For more information about
        # ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        def initialize(
          @group_name : String,
          @policy_arn : String
        )
        end
      end

      struct AttachRolePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy you want to attach. For more information about
        # ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The name (friendly name, not ARN) of the role to attach the policy to. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @policy_arn : String,
          @role_name : String
        )
        end
      end

      struct AttachUserPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy you want to attach. For more information about
        # ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The name (friendly name, not ARN) of the IAM user to attach the policy to. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @policy_arn : String,
          @user_name : String
        )
        end
      end

      # Contains information about an attached permissions boundary. An attached permissions boundary is a
      # managed policy that has been attached to a user or role to set the permissions boundary. For more
      # information about permissions boundaries, see Permissions boundaries for IAM identities in the IAM
      # User Guide .
      struct AttachedPermissionsBoundary
        include JSON::Serializable

        # The ARN of the policy used to set the permissions boundary for the user or role.
        @[JSON::Field(key: "PermissionsBoundaryArn")]
        getter permissions_boundary_arn : String?

        # The permissions boundary usage type that indicates what type of IAM resource is used as the
        # permissions boundary for an entity. This data type can only have a value of Policy .
        @[JSON::Field(key: "PermissionsBoundaryType")]
        getter permissions_boundary_type : String?

        def initialize(
          @permissions_boundary_arn : String? = nil,
          @permissions_boundary_type : String? = nil
        )
        end
      end

      # Contains information about an attached policy. An attached policy is a managed policy that has been
      # attached to a user, group, or role. This data type is used as a response element in the
      # ListAttachedGroupPolicies , ListAttachedRolePolicies , ListAttachedUserPolicies , and
      # GetAccountAuthorizationDetails operations. For more information about managed policies, refer to
      # Managed policies and inline policies in the IAM User Guide .
      struct AttachedPolicy
        include JSON::Serializable

        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String?

        # The friendly name of the attached policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        def initialize(
          @policy_arn : String? = nil,
          @policy_name : String? = nil
        )
        end
      end

      # The request was rejected because the account making the request is not the management account for
      # the organization.
      struct CallerIsNotManagementAccountException
        include JSON::Serializable

        def initialize
        end
      end

      struct ChangePasswordRequest
        include JSON::Serializable

        # The new password. The new password must conform to the Amazon Web Services account's password
        # policy, if one exists. The regex pattern that is used to validate this parameter is a string of
        # characters. That string can include almost any printable ASCII character from the space ( \u0020 )
        # through the end of the ASCII character range ( \u00FF ). You can also include the tab ( \u0009 ),
        # line feed ( \u000A ), and carriage return ( \u000D ) characters. Any of these characters are valid
        # in a password. However, many tools, such as the Amazon Web Services Management Console, might
        # restrict the ability to type certain characters because they have special meaning within that tool.
        @[JSON::Field(key: "NewPassword")]
        getter new_password : String

        # The IAM user's current password.
        @[JSON::Field(key: "OldPassword")]
        getter old_password : String

        def initialize(
          @new_password : String,
          @old_password : String
        )
        end
      end

      # The request was rejected because multiple requests to change this object were submitted
      # simultaneously. Wait a few minutes and submit your request again.
      struct ConcurrentModificationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about a condition context key. It includes the name of the key and specifies
      # the value (or values, if the context key supports multiple values) to use in the simulation. This
      # information is used when evaluating the Condition elements of the input policies. This data type is
      # used as an input parameter to SimulateCustomPolicy and SimulatePrincipalPolicy .
      struct ContextEntry
        include JSON::Serializable

        # The full name of a condition context key, including the service prefix. For example, aws:SourceIp or
        # s3:VersionId .
        @[JSON::Field(key: "ContextKeyName")]
        getter context_key_name : String?

        # The data type of the value (or values) specified in the ContextKeyValues parameter.
        @[JSON::Field(key: "ContextKeyType")]
        getter context_key_type : String?

        # The value (or values, if the condition context key supports multiple values) to provide to the
        # simulation when the key is referenced by a Condition element in an input policy.
        @[JSON::Field(key: "ContextKeyValues")]
        getter context_key_values : Array(String)?

        def initialize(
          @context_key_name : String? = nil,
          @context_key_type : String? = nil,
          @context_key_values : Array(String)? = nil
        )
        end
      end

      struct CreateAccessKeyRequest
        include JSON::Serializable

        # The name of the IAM user that the new key will belong to. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @user_name : String? = nil
        )
        end
      end

      # Contains the response to a successful CreateAccessKey request.
      struct CreateAccessKeyResponse
        include JSON::Serializable

        # A structure with details about the access key.
        @[JSON::Field(key: "AccessKey")]
        getter access_key : Types::AccessKey

        def initialize(
          @access_key : Types::AccessKey
        )
        end
      end

      struct CreateAccountAliasRequest
        include JSON::Serializable

        # The account alias to create. This parameter allows (through its regex pattern ) a string of
        # characters consisting of lowercase letters, digits, and dashes. You cannot start or finish with a
        # dash, nor can you have two dashes in a row.
        @[JSON::Field(key: "AccountAlias")]
        getter account_alias : String

        def initialize(
          @account_alias : String
        )
        end
      end

      struct CreateDelegationRequestRequest
        include JSON::Serializable

        # A description of the delegation request.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The notification channel for updates about the delegation request. At this time,only SNS topic ARNs
        # are accepted for notification. This topic ARN must have a resource policy granting SNS:Publish
        # permission to the IAM service principal ( iam.amazonaws.com ). See partner onboarding documentation
        # for more details.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : String

        # The permissions to be delegated in this delegation request.
        @[JSON::Field(key: "Permissions")]
        getter permissions : Types::DelegationPermission

        # The workflow ID associated with the requestor. This is the unique identifier on the partner side
        # that can be used to track the progress of the request. IAM maintains a uniqueness check on this
        # workflow id for each request - if a workflow id for an existing request is passed, this API call
        # will fail.
        @[JSON::Field(key: "RequestorWorkflowId")]
        getter requestor_workflow_id : String

        # The duration for which the delegated session should remain active, in seconds. The active time
        # window for the session starts when the customer calls the SendDelegationToken API.
        @[JSON::Field(key: "SessionDuration")]
        getter session_duration : Int32

        # Specifies whether the delegation token should only be sent by the owner. This flag prevents any
        # party other than the owner from calling SendDelegationToken API for this delegation request. This
        # behavior becomes useful when the delegation request owner needs to be present for subsequent partner
        # interactions, but the delegation request was sent to a more privileged user for approval due to the
        # owner lacking sufficient delegation permissions.
        @[JSON::Field(key: "OnlySendByOwner")]
        getter only_send_by_owner : Bool?

        # The Amazon Web Services account ID this delegation request is targeted to. If the account ID is not
        # known, this parameter can be omitted, resulting in a request that can be associated by any account.
        # If the account ID passed, then the created delegation request can only be associated with an
        # identity of that target account.
        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The URL to redirect to after the delegation request is processed. This URL is used by the IAM
        # console to show a link to the customer to re-load the partner workflow.
        @[JSON::Field(key: "RedirectUrl")]
        getter redirect_url : String?

        # A message explaining the reason for the delegation request. Requesters can utilize this field to add
        # a custom note to the delegation request. This field is different from the description such that this
        # is to be utilized for a custom messaging on a case-by-case basis. For example, if the current
        # delegation request is in response to a previous request being rejected, this explanation can be
        # added to the request via this field.
        @[JSON::Field(key: "RequestMessage")]
        getter request_message : String?

        def initialize(
          @description : String,
          @notification_channel : String,
          @permissions : Types::DelegationPermission,
          @requestor_workflow_id : String,
          @session_duration : Int32,
          @only_send_by_owner : Bool? = nil,
          @owner_account_id : String? = nil,
          @redirect_url : String? = nil,
          @request_message : String? = nil
        )
        end
      end

      struct CreateDelegationRequestResponse
        include JSON::Serializable

        # A deep link URL to the Amazon Web Services Management Console for managing the delegation request.
        # For a console based workflow, partners should redirect the customer to this URL. If the customer is
        # not logged in to any Amazon Web Services account, the Amazon Web Services workflow will
        # automatically direct the customer to log in and then display the delegation request approval page.
        @[JSON::Field(key: "ConsoleDeepLink")]
        getter console_deep_link : String?

        # The unique identifier for the created delegation request.
        @[JSON::Field(key: "DelegationRequestId")]
        getter delegation_request_id : String?

        def initialize(
          @console_deep_link : String? = nil,
          @delegation_request_id : String? = nil
        )
        end
      end

      struct CreateGroupRequest
        include JSON::Serializable

        # The name of the group to create. Do not include the path in this value. IAM user, group, role, and
        # policy names must be unique within the account. Names are not distinguished by case. For example,
        # you cannot create resources named both "MyResource" and "myresource".
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The path to the group. For more information about paths, see IAM identifiers in the IAM User Guide .
        # This parameter is optional. If it is not included, it defaults to a slash (/). This parameter allows
        # (through its regex pattern ) a string of characters consisting of either a forward slash (/) by
        # itself or a string that must begin and end with forward slashes. In addition, it can contain any
        # ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including most
        # punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "Path")]
        getter path : String?

        def initialize(
          @group_name : String,
          @path : String? = nil
        )
        end
      end

      # Contains the response to a successful CreateGroup request.
      struct CreateGroupResponse
        include JSON::Serializable

        # A structure containing details about the new group.
        @[JSON::Field(key: "Group")]
        getter group : Types::Group

        def initialize(
          @group : Types::Group
        )
        end
      end

      struct CreateInstanceProfileRequest
        include JSON::Serializable

        # The name of the instance profile to create. This parameter allows (through its regex pattern ) a
        # string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You
        # can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String

        # The path to the instance profile. For more information about paths, see IAM Identifiers in the IAM
        # User Guide . This parameter is optional. If it is not included, it defaults to a slash (/). This
        # parameter allows (through its regex pattern ) a string of characters consisting of either a forward
        # slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can
        # contain any ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including
        # most punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "Path")]
        getter path : String?

        # A list of tags that you want to attach to the newly created IAM instance profile. Each tag consists
        # of a key name and an associated value. For more information about tagging, see Tagging IAM resources
        # in the IAM User Guide . If any one of the tags is invalid or if you exceed the allowed maximum
        # number of tags, then the entire request fails and the resource is not created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @instance_profile_name : String,
          @path : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the response to a successful CreateInstanceProfile request.
      struct CreateInstanceProfileResponse
        include JSON::Serializable

        # A structure containing details about the new instance profile.
        @[JSON::Field(key: "InstanceProfile")]
        getter instance_profile : Types::InstanceProfile

        def initialize(
          @instance_profile : Types::InstanceProfile
        )
        end
      end

      struct CreateLoginProfileRequest
        include JSON::Serializable

        # The new password for the user. This parameter must be omitted when you make the request with an
        # AssumeRoot session. It is required in all other cases. The regex pattern that is used to validate
        # this parameter is a string of characters. That string can include almost any printable ASCII
        # character from the space ( \u0020 ) through the end of the ASCII character range ( \u00FF ). You can
        # also include the tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D ) characters.
        # Any of these characters are valid in a password. However, many tools, such as the Amazon Web
        # Services Management Console, might restrict the ability to type certain characters because they have
        # special meaning within that tool.
        @[JSON::Field(key: "Password")]
        getter password : String?

        # Specifies whether the user is required to set a new password on next sign-in.
        @[JSON::Field(key: "PasswordResetRequired")]
        getter password_reset_required : Bool?

        # The name of the IAM user to create a password for. The user must already exist. This parameter is
        # optional. If no user name is included, it defaults to the principal making the request. When you
        # make this request with root user credentials, you must use an AssumeRoot session to omit the user
        # name. This parameter allows (through its regex pattern ) a string of characters consisting of upper
        # and lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @password : String? = nil,
          @password_reset_required : Bool? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Contains the response to a successful CreateLoginProfile request.
      struct CreateLoginProfileResponse
        include JSON::Serializable

        # A structure containing the user name and password create date.
        @[JSON::Field(key: "LoginProfile")]
        getter login_profile : Types::LoginProfile

        def initialize(
          @login_profile : Types::LoginProfile
        )
        end
      end

      struct CreateOpenIDConnectProviderRequest
        include JSON::Serializable

        # The URL of the identity provider. The URL must begin with https:// and should correspond to the iss
        # claim in the provider's OpenID Connect ID tokens. Per the OIDC standard, path components are allowed
        # but query parameters are not. Typically the URL consists of only a hostname, like
        # https://server.example.org or https://example.com . The URL should not contain a port number. You
        # cannot register the same provider multiple times in a single Amazon Web Services account. If you try
        # to submit a URL that has already been used for an OpenID Connect provider in the Amazon Web Services
        # account, you will get an error.
        @[JSON::Field(key: "Url")]
        getter url : String

        # Provides a list of client IDs, also known as audiences. When a mobile or web app registers with an
        # OpenID Connect provider, they establish a value that identifies the application. This is the value
        # that's sent as the client_id parameter on OAuth requests. You can register multiple client IDs with
        # the same provider. For example, you might have multiple applications that use the same OIDC
        # provider. You cannot register more than 100 client IDs with a single IAM OIDC provider. There is no
        # defined format for a client ID. The CreateOpenIDConnectProviderRequest operation accepts client IDs
        # up to 255 characters long.
        @[JSON::Field(key: "ClientIDList")]
        getter client_id_list : Array(String)?

        # A list of tags that you want to attach to the new IAM OpenID Connect (OIDC) provider. Each tag
        # consists of a key name and an associated value. For more information about tagging, see Tagging IAM
        # resources in the IAM User Guide . If any one of the tags is invalid or if you exceed the allowed
        # maximum number of tags, then the entire request fails and the resource is not created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server
        # certificates. Typically this list includes only one entry. However, IAM lets you have up to five
        # thumbprints for an OIDC provider. This lets you maintain multiple thumbprints if the identity
        # provider is rotating certificates. This parameter is optional. If it is not included, IAM will
        # retrieve and use the top intermediate certificate authority (CA) thumbprint of the OpenID Connect
        # identity provider server certificate. The server certificate thumbprint is the hex-encoded SHA-1
        # hash value of the X.509 certificate used by the domain where the OpenID Connect provider makes its
        # keys available. It is always a 40-character string. For example, assume that the OIDC provider is
        # server.example.com and the provider stores its keys at
        # https://keys.server.example.com/openid-connect. In that case, the thumbprint string would be the
        # hex-encoded SHA-1 hash value of the certificate used by https://keys.server.example.com. For more
        # information about obtaining the OIDC provider thumbprint, see Obtaining the thumbprint for an OpenID
        # Connect provider in the IAM user Guide .
        @[JSON::Field(key: "ThumbprintList")]
        getter thumbprint_list : Array(String)?

        def initialize(
          @url : String,
          @client_id_list : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @thumbprint_list : Array(String)? = nil
        )
        end
      end

      # Contains the response to a successful CreateOpenIDConnectProvider request.
      struct CreateOpenIDConnectProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new IAM OpenID Connect provider that is created. For more
        # information, see OpenIDConnectProviderListEntry .
        @[JSON::Field(key: "OpenIDConnectProviderArn")]
        getter open_id_connect_provider_arn : String?

        # A list of tags that are attached to the new IAM OIDC provider. The returned list of tags is sorted
        # by tag key. For more information about tagging, see Tagging IAM resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @open_id_connect_provider_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePolicyRequest
        include JSON::Serializable

        # The JSON policy document that you want to use as the content for the new policy. You must provide
        # policies in JSON format in IAM. However, for CloudFormation templates formatted in YAML, you can
        # provide the policy in JSON or YAML format. CloudFormation always converts a YAML policy to JSON
        # format before submitting it to IAM. The maximum length of the policy document that you can pass in
        # this operation, including whitespace, is listed below. To view the maximum character counts of a
        # managed policy with no whitespaces, see IAM and STS character quotas . To learn more about JSON
        # policy grammar, see Grammar of the IAM JSON policy language in the IAM User Guide . The regex
        # pattern used to validate this parameter is a string of characters consisting of the following: Any
        # printable ASCII character ranging from the space character ( \u0020 ) through the end of the ASCII
        # character range The printable characters in the Basic Latin and Latin-1 Supplement character set
        # (through \u00FF ) The special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return (
        # \u000D )
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The friendly name of the policy. IAM user, group, role, and policy names must be unique within the
        # account. Names are not distinguished by case. For example, you cannot create resources named both
        # "MyResource" and "myresource".
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # A friendly description of the policy. Typically used to store information about the permissions
        # defined in the policy. For example, "Grants access to production DynamoDB tables." The policy
        # description is immutable. After a value is assigned, it cannot be changed.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The path for the policy. For more information about paths, see IAM identifiers in the IAM User Guide
        # . This parameter is optional. If it is not included, it defaults to a slash (/). This parameter
        # allows (through its regex pattern ) a string of characters consisting of either a forward slash (/)
        # by itself or a string that must begin and end with forward slashes. In addition, it can contain any
        # ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including most
        # punctuation characters, digits, and upper and lowercased letters. You cannot use an asterisk (*) in
        # the path name.
        @[JSON::Field(key: "Path")]
        getter path : String?

        # A list of tags that you want to attach to the new IAM customer managed policy. Each tag consists of
        # a key name and an associated value. For more information about tagging, see Tagging IAM resources in
        # the IAM User Guide . If any one of the tags is invalid or if you exceed the allowed maximum number
        # of tags, then the entire request fails and the resource is not created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @description : String? = nil,
          @path : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the response to a successful CreatePolicy request.
      struct CreatePolicyResponse
        include JSON::Serializable

        # A structure containing details about the new policy.
        @[JSON::Field(key: "Policy")]
        getter policy : Types::Policy?

        def initialize(
          @policy : Types::Policy? = nil
        )
        end
      end

      struct CreatePolicyVersionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy to which you want to add a new version. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The JSON policy document that you want to use as the content for this new version of the policy. You
        # must provide policies in JSON format in IAM. However, for CloudFormation templates formatted in
        # YAML, you can provide the policy in JSON or YAML format. CloudFormation always converts a YAML
        # policy to JSON format before submitting it to IAM. The maximum length of the policy document that
        # you can pass in this operation, including whitespace, is listed below. To view the maximum character
        # counts of a managed policy with no whitespaces, see IAM and STS character quotas . The regex pattern
        # used to validate this parameter is a string of characters consisting of the following: Any printable
        # ASCII character ranging from the space character ( \u0020 ) through the end of the ASCII character
        # range The printable characters in the Basic Latin and Latin-1 Supplement character set (through
        # \u00FF ) The special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # Specifies whether to set this version as the policy's default version. When this parameter is true ,
        # the new policy version becomes the operative version. That is, it becomes the version that is in
        # effect for the IAM users, groups, and roles that the policy is attached to. For more information
        # about managed policy versions, see Versioning for managed policies in the IAM User Guide .
        @[JSON::Field(key: "SetAsDefault")]
        getter set_as_default : Bool?

        def initialize(
          @policy_arn : String,
          @policy_document : String,
          @set_as_default : Bool? = nil
        )
        end
      end

      # Contains the response to a successful CreatePolicyVersion request.
      struct CreatePolicyVersionResponse
        include JSON::Serializable

        # A structure containing details about the new policy version.
        @[JSON::Field(key: "PolicyVersion")]
        getter policy_version : Types::PolicyVersion?

        def initialize(
          @policy_version : Types::PolicyVersion? = nil
        )
        end
      end

      struct CreateRoleRequest
        include JSON::Serializable

        # The trust relationship policy document that grants an entity permission to assume the role. In IAM,
        # you must provide a JSON policy that has been converted to a string. However, for CloudFormation
        # templates formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation
        # always converts a YAML policy to JSON format before submitting it to IAM. The regex pattern used to
        # validate this parameter is a string of characters consisting of the following: Any printable ASCII
        # character ranging from the space character ( \u0020 ) through the end of the ASCII character range
        # The printable characters in the Basic Latin and Latin-1 Supplement character set (through \u00FF )
        # The special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D ) Upon
        # success, the response includes the same trust policy in JSON format.
        @[JSON::Field(key: "AssumeRolePolicyDocument")]
        getter assume_role_policy_document : String

        # The name of the role to create. IAM user, group, role, and policy names must be unique within the
        # account. Names are not distinguished by case. For example, you cannot create resources named both
        # "MyResource" and "myresource". This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        # A description of the role.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The maximum session duration (in seconds) that you want to set for the specified role. If you do not
        # specify a value for this setting, the default value of one hour is applied. This setting can have a
        # value from 1 hour to 12 hours. Anyone who assumes the role from the CLI or API can use the
        # DurationSeconds API parameter or the duration-seconds CLI parameter to request a longer session. The
        # MaxSessionDuration setting determines the maximum duration that can be requested using the
        # DurationSeconds parameter. If users don't specify a value for the DurationSeconds parameter, their
        # security credentials are valid for one hour by default. This applies when you use the AssumeRole*
        # API operations or the assume-role* CLI operations but does not apply when you use those operations
        # to create a console URL. For more information, see Using IAM roles in the IAM User Guide .
        @[JSON::Field(key: "MaxSessionDuration")]
        getter max_session_duration : Int32?

        # The path to the role. For more information about paths, see IAM Identifiers in the IAM User Guide .
        # This parameter is optional. If it is not included, it defaults to a slash (/). This parameter allows
        # (through its regex pattern ) a string of characters consisting of either a forward slash (/) by
        # itself or a string that must begin and end with forward slashes. In addition, it can contain any
        # ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including most
        # punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "Path")]
        getter path : String?

        # The ARN of the managed policy that is used to set the permissions boundary for the role. A
        # permissions boundary policy defines the maximum permissions that identity-based policies can grant
        # to an entity, but does not grant permissions. Permissions boundaries do not define the maximum
        # permissions that a resource-based policy can grant to an entity. To learn more, see Permissions
        # boundaries for IAM entities in the IAM User Guide . For more information about policy types, see
        # Policy types in the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : String?

        # A list of tags that you want to attach to the new role. Each tag consists of a key name and an
        # associated value. For more information about tagging, see Tagging IAM resources in the IAM User
        # Guide . If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
        # the entire request fails and the resource is not created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @assume_role_policy_document : String,
          @role_name : String,
          @description : String? = nil,
          @max_session_duration : Int32? = nil,
          @path : String? = nil,
          @permissions_boundary : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the response to a successful CreateRole request.
      struct CreateRoleResponse
        include JSON::Serializable

        # A structure containing details about the new role.
        @[JSON::Field(key: "Role")]
        getter role : Types::Role

        def initialize(
          @role : Types::Role
        )
        end
      end

      struct CreateSAMLProviderRequest
        include JSON::Serializable

        # The name of the provider to create. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "Name")]
        getter name : String

        # An XML document generated by an identity provider (IdP) that supports SAML 2.0. The document
        # includes the issuer's name, expiration information, and keys that can be used to validate the SAML
        # authentication response (assertions) that are received from the IdP. You must generate the metadata
        # document using the identity management software that is used as your organization's IdP. For more
        # information, see About SAML 2.0-based federation in the IAM User Guide
        @[JSON::Field(key: "SAMLMetadataDocument")]
        getter saml_metadata_document : String

        # The private key generated from your external identity provider. The private key must be a .pem file
        # that uses AES-GCM or AES-CBC encryption algorithm to decrypt SAML assertions.
        @[JSON::Field(key: "AddPrivateKey")]
        getter add_private_key : String?

        # Specifies the encryption setting for the SAML provider.
        @[JSON::Field(key: "AssertionEncryptionMode")]
        getter assertion_encryption_mode : String?

        # A list of tags that you want to attach to the new IAM SAML provider. Each tag consists of a key name
        # and an associated value. For more information about tagging, see Tagging IAM resources in the IAM
        # User Guide . If any one of the tags is invalid or if you exceed the allowed maximum number of tags,
        # then the entire request fails and the resource is not created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @saml_metadata_document : String,
          @add_private_key : String? = nil,
          @assertion_encryption_mode : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the response to a successful CreateSAMLProvider request.
      struct CreateSAMLProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new SAML provider resource in IAM.
        @[JSON::Field(key: "SAMLProviderArn")]
        getter saml_provider_arn : String?

        # A list of tags that are attached to the new IAM SAML provider. The returned list of tags is sorted
        # by tag key. For more information about tagging, see Tagging IAM resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @saml_provider_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateServiceLinkedRoleRequest
        include JSON::Serializable

        # The service principal for the Amazon Web Services service to which this role is attached. You use a
        # string similar to a URL but without the http:// in front. For example:
        # elasticbeanstalk.amazonaws.com . Service principals are unique and case-sensitive. To find the exact
        # service principal for your service-linked role, see Amazon Web Services services that work with IAM
        # in the IAM User Guide . Look for the services that have Yes in the Service-Linked Role column.
        # Choose the Yes link to view the service-linked role documentation for that service.
        @[JSON::Field(key: "AWSServiceName")]
        getter aws_service_name : String

        # A string that you provide, which is combined with the service-provided prefix to form the complete
        # role name. If you make multiple requests for the same service, then you must supply a different
        # CustomSuffix for each request. Otherwise the request fails with a duplicate role name error. For
        # example, you could add -1 or -debug to the suffix. Some services do not support the CustomSuffix
        # parameter. If you provide an optional suffix and the operation fails, try the operation again
        # without the suffix.
        @[JSON::Field(key: "CustomSuffix")]
        getter custom_suffix : String?

        # The description of the role.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @aws_service_name : String,
          @custom_suffix : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateServiceLinkedRoleResponse
        include JSON::Serializable

        # A Role object that contains details about the newly created role.
        @[JSON::Field(key: "Role")]
        getter role : Types::Role?

        def initialize(
          @role : Types::Role? = nil
        )
        end
      end

      struct CreateServiceSpecificCredentialRequest
        include JSON::Serializable

        # The name of the Amazon Web Services service that is to be associated with the credentials. The
        # service you specify here is the only service that can be accessed using these credentials.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The name of the IAM user that is to be associated with the credentials. The new service-specific
        # credentials have the same permissions as the associated user except that they can be used only to
        # access the specified service. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The number of days until the service specific credential expires. This field is only valid for
        # Bedrock API keys and must be a positive integer. When not specified, the credential will not expire.
        @[JSON::Field(key: "CredentialAgeDays")]
        getter credential_age_days : Int32?

        def initialize(
          @service_name : String,
          @user_name : String,
          @credential_age_days : Int32? = nil
        )
        end
      end

      struct CreateServiceSpecificCredentialResponse
        include JSON::Serializable

        # A structure that contains information about the newly created service-specific credential. This is
        # the only time that the password for this credential set is available. It cannot be recovered later.
        # Instead, you must reset the password with ResetServiceSpecificCredential .
        @[JSON::Field(key: "ServiceSpecificCredential")]
        getter service_specific_credential : Types::ServiceSpecificCredential?

        def initialize(
          @service_specific_credential : Types::ServiceSpecificCredential? = nil
        )
        end
      end

      struct CreateUserRequest
        include JSON::Serializable

        # The name of the user to create. IAM user, group, role, and policy names must be unique within the
        # account. Names are not distinguished by case. For example, you cannot create resources named both
        # "MyResource" and "myresource".
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The path for the user name. For more information about paths, see IAM identifiers in the IAM User
        # Guide . This parameter is optional. If it is not included, it defaults to a slash (/). This
        # parameter allows (through its regex pattern ) a string of characters consisting of either a forward
        # slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can
        # contain any ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including
        # most punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "Path")]
        getter path : String?

        # The ARN of the managed policy that is used to set the permissions boundary for the user. A
        # permissions boundary policy defines the maximum permissions that identity-based policies can grant
        # to an entity, but does not grant permissions. Permissions boundaries do not define the maximum
        # permissions that a resource-based policy can grant to an entity. To learn more, see Permissions
        # boundaries for IAM entities in the IAM User Guide . For more information about policy types, see
        # Policy types in the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : String?

        # A list of tags that you want to attach to the new user. Each tag consists of a key name and an
        # associated value. For more information about tagging, see Tagging IAM resources in the IAM User
        # Guide . If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then
        # the entire request fails and the resource is not created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @user_name : String,
          @path : String? = nil,
          @permissions_boundary : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the response to a successful CreateUser request.
      struct CreateUserResponse
        include JSON::Serializable

        # A structure with details about the new IAM user.
        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end

      struct CreateVirtualMFADeviceRequest
        include JSON::Serializable

        # The name of the virtual MFA device, which must be unique. Use with path to uniquely identify a
        # virtual MFA device. This parameter allows (through its regex pattern ) a string of characters
        # consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any
        # of the following characters: _+=,.@-
        @[JSON::Field(key: "VirtualMFADeviceName")]
        getter virtual_mfa_device_name : String

        # The path for the virtual MFA device. For more information about paths, see IAM identifiers in the
        # IAM User Guide . This parameter is optional. If it is not included, it defaults to a slash (/). This
        # parameter allows (through its regex pattern ) a string of characters consisting of either a forward
        # slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can
        # contain any ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including
        # most punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "Path")]
        getter path : String?

        # A list of tags that you want to attach to the new IAM virtual MFA device. Each tag consists of a key
        # name and an associated value. For more information about tagging, see Tagging IAM resources in the
        # IAM User Guide . If any one of the tags is invalid or if you exceed the allowed maximum number of
        # tags, then the entire request fails and the resource is not created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @virtual_mfa_device_name : String,
          @path : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the response to a successful CreateVirtualMFADevice request.
      struct CreateVirtualMFADeviceResponse
        include JSON::Serializable

        # A structure containing details about the new virtual MFA device.
        @[JSON::Field(key: "VirtualMFADevice")]
        getter virtual_mfa_device : Types::VirtualMFADevice

        def initialize(
          @virtual_mfa_device : Types::VirtualMFADevice
        )
        end
      end

      # The request was rejected because the most recent credential report has expired. To generate a new
      # credential report, use GenerateCredentialReport . For more information about credential report
      # expiration, see Getting credential reports in the IAM User Guide .
      struct CredentialReportExpiredException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the credential report does not exist. To generate a credential
      # report, use GenerateCredentialReport .
      struct CredentialReportNotPresentException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the credential report is still being generated.
      struct CredentialReportNotReadyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct DeactivateMFADeviceRequest
        include JSON::Serializable

        # The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial
        # number is the device ARN. This parameter allows (through its regex pattern ) a string of characters
        # consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any
        # of the following characters: =,.@:/-
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # The name of the user whose MFA device you want to deactivate. This parameter is optional. If no user
        # name is included, it defaults to the principal making the request. When you make this request with
        # root user credentials, you must use an AssumeRoot session to omit the user name. This parameter
        # allows (through its regex pattern ) a string of characters consisting of upper and lowercase
        # alphanumeric characters with no spaces. You can also include any of the following characters:
        # _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @serial_number : String,
          @user_name : String? = nil
        )
        end
      end

      # Contains information about the permissions being delegated in a delegation request.
      struct DelegationPermission
        include JSON::Serializable

        # A list of policy parameters that define the scope and constraints of the delegated permissions.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::PolicyParameter)?

        # This ARN maps to a pre-registered policy content for this partner. See the partner onboarding
        # documentation to understand how to create a delegation template.
        @[JSON::Field(key: "PolicyTemplateArn")]
        getter policy_template_arn : String?

        def initialize(
          @parameters : Array(Types::PolicyParameter)? = nil,
          @policy_template_arn : String? = nil
        )
        end
      end

      # Contains information about a delegation request, including its status, permissions, and associated
      # metadata.
      struct DelegationRequest
        include JSON::Serializable

        @[JSON::Field(key: "ApproverId")]
        getter approver_id : String?

        # Creation date (timestamp) of this delegation request.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The unique identifier for the delegation request.
        @[JSON::Field(key: "DelegationRequestId")]
        getter delegation_request_id : String?

        # Description of the delegation request. This is a message that is provided by the Amazon Web Services
        # partner that filed the delegation request.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The expiry time of this delegation request See the Understanding the Request Lifecycle for details
        # on the life time of a delegation request at each state.
        @[JSON::Field(key: "ExpirationTime")]
        getter expiration_time : Time?

        # Notes added to this delegation request, if this request was updated via the UpdateDelegationRequest
        # API.
        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # A flag indicating whether the SendDelegationToken must be called by the owner of this delegation
        # request. This is set by the requesting partner.
        @[JSON::Field(key: "OnlySendByOwner")]
        getter only_send_by_owner : Bool?

        # Amazon Web Services account ID of the owner of the delegation request.
        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # ARN of the owner of this delegation request.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # JSON content of the associated permission policy of this delegation request.
        @[JSON::Field(key: "PermissionPolicy")]
        getter permission_policy : String?

        @[JSON::Field(key: "Permissions")]
        getter permissions : Types::DelegationPermission?

        # A URL to be redirected to once the delegation request is approved. Partners provide this URL when
        # creating the delegation request.
        @[JSON::Field(key: "RedirectUrl")]
        getter redirect_url : String?

        # Reasons for rejecting this delegation request, if this request was rejected. See also
        # RejectDelegationRequest API documentation.
        @[JSON::Field(key: "RejectionReason")]
        getter rejection_reason : String?

        # A custom message that is added to the delegation request by the partner. This element is different
        # from the Description element such that this is a request specific message injected by the partner.
        # The Description is typically a generic explanation of what the delegation request is targeted to do.
        @[JSON::Field(key: "RequestMessage")]
        getter request_message : String?

        # Identity of the requestor of this delegation request. This will be an Amazon Web Services account
        # ID.
        @[JSON::Field(key: "RequestorId")]
        getter requestor_id : String?

        # A friendly name of the requestor.
        @[JSON::Field(key: "RequestorName")]
        getter requestor_name : String?

        # If the PermissionPolicy includes role creation permissions, this element will include the list of
        # permissions boundary policies associated with the role creation. See Permissions boundaries for IAM
        # entities for more details about IAM permission boundaries.
        @[JSON::Field(key: "RolePermissionRestrictionArns")]
        getter role_permission_restriction_arns : Array(String)?

        # The life-time of the requested session credential.
        @[JSON::Field(key: "SessionDuration")]
        getter session_duration : Int32?

        # The state of this delegation request. See the Understanding the Request Lifecycle for an explanation
        # of how these states are transitioned.
        @[JSON::Field(key: "State")]
        getter state : String?

        # Last updated timestamp of the request.
        @[JSON::Field(key: "UpdatedTime")]
        getter updated_time : Time?

        def initialize(
          @approver_id : String? = nil,
          @create_date : Time? = nil,
          @delegation_request_id : String? = nil,
          @description : String? = nil,
          @expiration_time : Time? = nil,
          @notes : String? = nil,
          @only_send_by_owner : Bool? = nil,
          @owner_account_id : String? = nil,
          @owner_id : String? = nil,
          @permission_policy : String? = nil,
          @permissions : Types::DelegationPermission? = nil,
          @redirect_url : String? = nil,
          @rejection_reason : String? = nil,
          @request_message : String? = nil,
          @requestor_id : String? = nil,
          @requestor_name : String? = nil,
          @role_permission_restriction_arns : Array(String)? = nil,
          @session_duration : Int32? = nil,
          @state : String? = nil,
          @updated_time : Time? = nil
        )
        end
      end

      struct DeleteAccessKeyRequest
        include JSON::Serializable

        # The access key ID for the access key ID and secret access key you want to delete. This parameter
        # allows (through its regex pattern ) a string of characters that can consist of any upper or
        # lowercased letter or digit.
        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String

        # The name of the user whose access key pair you want to delete. This parameter allows (through its
        # regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @access_key_id : String,
          @user_name : String? = nil
        )
        end
      end

      struct DeleteAccountAliasRequest
        include JSON::Serializable

        # The name of the account alias to delete. This parameter allows (through its regex pattern ) a string
        # of characters consisting of lowercase letters, digits, and dashes. You cannot start or finish with a
        # dash, nor can you have two dashes in a row.
        @[JSON::Field(key: "AccountAlias")]
        getter account_alias : String

        def initialize(
          @account_alias : String
        )
        end
      end

      # The request was rejected because it attempted to delete a resource that has attached subordinate
      # entities. The error message describes these entities.
      struct DeleteConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct DeleteGroupPolicyRequest
        include JSON::Serializable

        # The name (friendly name, not ARN) identifying the group that the policy is embedded in. This
        # parameter allows (through its regex pattern ) a string of characters consisting of upper and
        # lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The name identifying the policy document to delete. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @group_name : String,
          @policy_name : String
        )
        end
      end

      struct DeleteGroupRequest
        include JSON::Serializable

        # The name of the IAM group to delete. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        def initialize(
          @group_name : String
        )
        end
      end

      struct DeleteInstanceProfileRequest
        include JSON::Serializable

        # The name of the instance profile to delete. This parameter allows (through its regex pattern ) a
        # string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You
        # can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String

        def initialize(
          @instance_profile_name : String
        )
        end
      end

      struct DeleteLoginProfileRequest
        include JSON::Serializable

        # The name of the user whose password you want to delete. This parameter is optional. If no user name
        # is included, it defaults to the principal making the request. When you make this request with root
        # user credentials, you must use an AssumeRoot session to omit the user name. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @user_name : String? = nil
        )
        end
      end

      struct DeleteOpenIDConnectProviderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM OpenID Connect provider resource object to delete. You can
        # get a list of OpenID Connect provider resource ARNs by using the ListOpenIDConnectProviders
        # operation.
        @[JSON::Field(key: "OpenIDConnectProviderArn")]
        getter open_id_connect_provider_arn : String

        def initialize(
          @open_id_connect_provider_arn : String
        )
        end
      end

      struct DeletePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy you want to delete. For more information about
        # ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        def initialize(
          @policy_arn : String
        )
        end
      end

      struct DeletePolicyVersionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy from which you want to delete a version. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The policy version to delete. This parameter allows (through its regex pattern ) a string of
        # characters that consists of the lowercase letter 'v' followed by one or two digits, and optionally
        # followed by a period '.' and a string of letters and digits. For more information about managed
        # policy versions, see Versioning for managed policies in the IAM User Guide .
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        def initialize(
          @policy_arn : String,
          @version_id : String
        )
        end
      end

      struct DeleteRolePermissionsBoundaryRequest
        include JSON::Serializable

        # The name (friendly name, not ARN) of the IAM role from which you want to remove the permissions
        # boundary.
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @role_name : String
        )
        end
      end

      struct DeleteRolePolicyRequest
        include JSON::Serializable

        # The name of the inline policy to delete from the specified IAM role. This parameter allows (through
        # its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The name (friendly name, not ARN) identifying the role that the policy is embedded in. This
        # parameter allows (through its regex pattern ) a string of characters consisting of upper and
        # lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @policy_name : String,
          @role_name : String
        )
        end
      end

      struct DeleteRoleRequest
        include JSON::Serializable

        # The name of the role to delete. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @role_name : String
        )
        end
      end

      struct DeleteSAMLProviderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SAML provider to delete.
        @[JSON::Field(key: "SAMLProviderArn")]
        getter saml_provider_arn : String

        def initialize(
          @saml_provider_arn : String
        )
        end
      end

      struct DeleteSSHPublicKeyRequest
        include JSON::Serializable

        # The unique identifier for the SSH public key. This parameter allows (through its regex pattern ) a
        # string of characters that can consist of any upper or lowercased letter or digit.
        @[JSON::Field(key: "SSHPublicKeyId")]
        getter ssh_public_key_id : String

        # The name of the IAM user associated with the SSH public key. This parameter allows (through its
        # regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @ssh_public_key_id : String,
          @user_name : String
        )
        end
      end

      struct DeleteServerCertificateRequest
        include JSON::Serializable

        # The name of the server certificate you want to delete. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "ServerCertificateName")]
        getter server_certificate_name : String

        def initialize(
          @server_certificate_name : String
        )
        end
      end

      struct DeleteServiceLinkedRoleRequest
        include JSON::Serializable

        # The name of the service-linked role to be deleted.
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @role_name : String
        )
        end
      end

      struct DeleteServiceLinkedRoleResponse
        include JSON::Serializable

        # The deletion task identifier that you can use to check the status of the deletion. This identifier
        # is returned in the format
        # task/aws-service-role/&lt;service-principal-name&gt;/&lt;role-name&gt;/&lt;task-uuid&gt; .
        @[JSON::Field(key: "DeletionTaskId")]
        getter deletion_task_id : String

        def initialize(
          @deletion_task_id : String
        )
        end
      end

      struct DeleteServiceSpecificCredentialRequest
        include JSON::Serializable

        # The unique identifier of the service-specific credential. You can get this value by calling
        # ListServiceSpecificCredentials . This parameter allows (through its regex pattern ) a string of
        # characters that can consist of any upper or lowercased letter or digit.
        @[JSON::Field(key: "ServiceSpecificCredentialId")]
        getter service_specific_credential_id : String

        # The name of the IAM user associated with the service-specific credential. If this value is not
        # specified, then the operation assumes the user whose credentials are used to call the operation.
        # This parameter allows (through its regex pattern ) a string of characters consisting of upper and
        # lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @service_specific_credential_id : String,
          @user_name : String? = nil
        )
        end
      end

      struct DeleteSigningCertificateRequest
        include JSON::Serializable

        # The ID of the signing certificate to delete. The format of this parameter, as described by its regex
        # pattern, is a string of characters that can be upper- or lower-cased letters or digits.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        # The name of the user the signing certificate belongs to. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @certificate_id : String,
          @user_name : String? = nil
        )
        end
      end

      struct DeleteUserPermissionsBoundaryRequest
        include JSON::Serializable

        # The name (friendly name, not ARN) of the IAM user from which you want to remove the permissions
        # boundary.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @user_name : String
        )
        end
      end

      struct DeleteUserPolicyRequest
        include JSON::Serializable

        # The name identifying the policy document to delete. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The name (friendly name, not ARN) identifying the user that the policy is embedded in. This
        # parameter allows (through its regex pattern ) a string of characters consisting of upper and
        # lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @policy_name : String,
          @user_name : String
        )
        end
      end

      struct DeleteUserRequest
        include JSON::Serializable

        # The name of the user to delete. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @user_name : String
        )
        end
      end

      struct DeleteVirtualMFADeviceRequest
        include JSON::Serializable

        # The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial
        # number is the same as the ARN. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: =,.@:/-
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        def initialize(
          @serial_number : String
        )
        end
      end

      # The reason that the service-linked role deletion failed. This data type is used as a response
      # element in the GetServiceLinkedRoleDeletionStatus operation.
      struct DeletionTaskFailureReasonType
        include JSON::Serializable

        # A short description of the reason that the service-linked role deletion failed.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # A list of objects that contains details about the service-linked role deletion failure, if that
        # information is returned by the service. If the service-linked role has active sessions or if any
        # resources that were used by the role have not been deleted from the linked service, the role can't
        # be deleted. This parameter includes a list of the resources that are associated with the role and
        # the Region in which the resources are being used.
        @[JSON::Field(key: "RoleUsageList")]
        getter role_usage_list : Array(Types::RoleUsageType)?

        def initialize(
          @reason : String? = nil,
          @role_usage_list : Array(Types::RoleUsageType)? = nil
        )
        end
      end

      struct DetachGroupPolicyRequest
        include JSON::Serializable

        # The name (friendly name, not ARN) of the IAM group to detach the policy from. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The Amazon Resource Name (ARN) of the IAM policy you want to detach. For more information about
        # ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        def initialize(
          @group_name : String,
          @policy_arn : String
        )
        end
      end

      struct DetachRolePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy you want to detach. For more information about
        # ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The name (friendly name, not ARN) of the IAM role to detach the policy from. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @policy_arn : String,
          @role_name : String
        )
        end
      end

      struct DetachUserPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy you want to detach. For more information about
        # ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The name (friendly name, not ARN) of the IAM user to detach the policy from. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @policy_arn : String,
          @user_name : String
        )
        end
      end

      struct DisableOrganizationsRootCredentialsManagementRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DisableOrganizationsRootCredentialsManagementResponse
        include JSON::Serializable

        # The features enabled for centralized root access for member accounts in your organization.
        @[JSON::Field(key: "EnabledFeatures")]
        getter enabled_features : Array(String)?

        # The unique identifier (ID) of an organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        def initialize(
          @enabled_features : Array(String)? = nil,
          @organization_id : String? = nil
        )
        end
      end

      struct DisableOrganizationsRootSessionsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DisableOrganizationsRootSessionsResponse
        include JSON::Serializable

        # The features you have enabled for centralized root access of member accounts in your organization.
        @[JSON::Field(key: "EnabledFeatures")]
        getter enabled_features : Array(String)?

        # The unique identifier (ID) of an organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        def initialize(
          @enabled_features : Array(String)? = nil,
          @organization_id : String? = nil
        )
        end
      end

      # The request was rejected because the same certificate is associated with an IAM user in the account.
      struct DuplicateCertificateException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the SSH public key is already associated with the specified IAM
      # user.
      struct DuplicateSSHPublicKeyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct EnableMFADeviceRequest
        include JSON::Serializable

        # An authentication code emitted by the device. The format for this parameter is a string of six
        # digits. Submit your request immediately after generating the authentication codes. If you generate
        # the codes and then wait too long to submit the request, the MFA device successfully associates with
        # the user but the MFA device becomes out of sync. This happens because time-based one-time passwords
        # (TOTP) expire after a short period of time. If this happens, you can resync the device .
        @[JSON::Field(key: "AuthenticationCode1")]
        getter authentication_code1 : String

        # A subsequent authentication code emitted by the device. The format for this parameter is a string of
        # six digits. Submit your request immediately after generating the authentication codes. If you
        # generate the codes and then wait too long to submit the request, the MFA device successfully
        # associates with the user but the MFA device becomes out of sync. This happens because time-based
        # one-time passwords (TOTP) expire after a short period of time. If this happens, you can resync the
        # device .
        @[JSON::Field(key: "AuthenticationCode2")]
        getter authentication_code2 : String

        # The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial
        # number is the device ARN. This parameter allows (through its regex pattern ) a string of characters
        # consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any
        # of the following characters: =,.@:/-
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # The name of the IAM user for whom you want to enable the MFA device. This parameter allows (through
        # its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @authentication_code1 : String,
          @authentication_code2 : String,
          @serial_number : String,
          @user_name : String
        )
        end
      end

      struct EnableOrganizationsRootCredentialsManagementRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct EnableOrganizationsRootCredentialsManagementResponse
        include JSON::Serializable

        # The features you have enabled for centralized root access.
        @[JSON::Field(key: "EnabledFeatures")]
        getter enabled_features : Array(String)?

        # The unique identifier (ID) of an organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        def initialize(
          @enabled_features : Array(String)? = nil,
          @organization_id : String? = nil
        )
        end
      end

      struct EnableOrganizationsRootSessionsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct EnableOrganizationsRootSessionsResponse
        include JSON::Serializable

        # The features you have enabled for centralized root access.
        @[JSON::Field(key: "EnabledFeatures")]
        getter enabled_features : Array(String)?

        # The unique identifier (ID) of an organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        def initialize(
          @enabled_features : Array(String)? = nil,
          @organization_id : String? = nil
        )
        end
      end

      struct EnableOutboundWebIdentityFederationResponse
        include JSON::Serializable

        # A unique issuer URL for your Amazon Web Services account that hosts the OpenID Connect (OIDC)
        # discovery endpoints at /.well-known/openid-configuration and /.well-known/jwks.json . The OpenID
        # Connect (OIDC) discovery endpoints contain verification keys and metadata necessary for token
        # verification.
        @[JSON::Field(key: "IssuerIdentifier")]
        getter issuer_identifier : String?

        def initialize(
          @issuer_identifier : String? = nil
        )
        end
      end

      # The request was rejected because it attempted to create a resource that already exists.
      struct EntityAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains details about when the IAM entities (users or roles) were last used in an
      # attempt to access the specified Amazon Web Services service. This data type is a response element in
      # the GetServiceLastAccessedDetailsWithEntities operation.
      struct EntityDetails
        include JSON::Serializable

        # The EntityInfo object that contains details about the entity (user or role).
        @[JSON::Field(key: "EntityInfo")]
        getter entity_info : Types::EntityInfo

        # The date and time, in ISO 8601 date-time format , when the authenticated entity last attempted to
        # access Amazon Web Services. Amazon Web Services does not report unauthenticated requests. This field
        # is null if no IAM entities attempted to access the service within the tracking period .
        @[JSON::Field(key: "LastAuthenticated")]
        getter last_authenticated : Time?

        def initialize(
          @entity_info : Types::EntityInfo,
          @last_authenticated : Time? = nil
        )
        end
      end

      # Contains details about the specified entity (user or role). This data type is an element of the
      # EntityDetails object.
      struct EntityInfo
        include JSON::Serializable

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The identifier of the entity (user or role).
        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the entity (user or role).
        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of entity (user or role).
        @[JSON::Field(key: "Type")]
        getter type : String

        # The path to the entity (user or role). For more information about paths, see IAM identifiers in the
        # IAM User Guide .
        @[JSON::Field(key: "Path")]
        getter path : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @type : String,
          @path : String? = nil
        )
        end
      end

      # The request was rejected because it referenced an entity that is temporarily unmodifiable, such as a
      # user name that was deleted and then recreated. The error indicates that the request is likely to
      # succeed if you try again after waiting several minutes. The error message describes the entity.
      struct EntityTemporarilyUnmodifiableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about the reason that the operation failed. This data type is used as a
      # response element in the GetOrganizationsAccessReport , GetServiceLastAccessedDetails , and
      # GetServiceLastAccessedDetailsWithEntities operations.
      struct ErrorDetails
        include JSON::Serializable

        # The error code associated with the operation failure.
        @[JSON::Field(key: "Code")]
        getter code : String

        # Detailed information about the reason that the operation failed.
        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end

      # Contains the results of a simulation. This data type is used by the return parameter of
      # SimulateCustomPolicy and SimulatePrincipalPolicy .
      struct EvaluationResult
        include JSON::Serializable

        # The name of the API operation tested on the indicated resource.
        @[JSON::Field(key: "EvalActionName")]
        getter eval_action_name : String

        # The result of the simulation.
        @[JSON::Field(key: "EvalDecision")]
        getter eval_decision : String

        # Additional details about the results of the cross-account evaluation decision. This parameter is
        # populated for only cross-account simulations. It contains a brief summary of how each policy type
        # contributes to the final evaluation decision. If the simulation evaluates policies within the same
        # account and includes a resource ARN, then the parameter is present but the response is empty. If the
        # simulation evaluates policies within the same account and specifies all resources ( * ), then the
        # parameter is not returned. When you make a cross-account request, Amazon Web Services evaluates the
        # request in the trusting account and the trusted account. The request is allowed only if both
        # evaluations return true . For more information about how policies are evaluated, see Evaluating
        # policies within a single account . If an Organizations SCP included in the evaluation denies access,
        # the simulation ends. In this case, policy evaluation does not proceed any further and this parameter
        # is not returned.
        @[JSON::Field(key: "EvalDecisionDetails")]
        getter eval_decision_details : Hash(String, String)?

        # The ARN of the resource that the indicated API operation was tested on.
        @[JSON::Field(key: "EvalResourceName")]
        getter eval_resource_name : String?

        # A list of the statements in the input policies that determine the result for this scenario. Remember
        # that even if multiple statements allow the operation on the resource, if only one statement denies
        # that operation, then the explicit deny overrides any allow. In addition, the deny statement is the
        # only entry included in the result.
        @[JSON::Field(key: "MatchedStatements")]
        getter matched_statements : Array(Types::Statement)?

        # A list of context keys that are required by the included input policies but that were not provided
        # by one of the input parameters. This list is used when the resource in a simulation is "*", either
        # explicitly, or when the ResourceArns parameter blank. If you include a list of resources, then any
        # missing context values are instead included under the ResourceSpecificResults section. To discover
        # the context keys used by a set of policies, you can call GetContextKeysForCustomPolicy or
        # GetContextKeysForPrincipalPolicy .
        @[JSON::Field(key: "MissingContextValues")]
        getter missing_context_values : Array(String)?

        # A structure that details how Organizations and its service control policies affect the results of
        # the simulation. Only applies if the simulated user's account is part of an organization.
        @[JSON::Field(key: "OrganizationsDecisionDetail")]
        getter organizations_decision_detail : Types::OrganizationsDecisionDetail?

        # Contains information about the effect that a permissions boundary has on a policy simulation when
        # the boundary is applied to an IAM entity.
        @[JSON::Field(key: "PermissionsBoundaryDecisionDetail")]
        getter permissions_boundary_decision_detail : Types::PermissionsBoundaryDecisionDetail?

        # The individual results of the simulation of the API operation specified in EvalActionName on each
        # resource.
        @[JSON::Field(key: "ResourceSpecificResults")]
        getter resource_specific_results : Array(Types::ResourceSpecificResult)?

        def initialize(
          @eval_action_name : String,
          @eval_decision : String,
          @eval_decision_details : Hash(String, String)? = nil,
          @eval_resource_name : String? = nil,
          @matched_statements : Array(Types::Statement)? = nil,
          @missing_context_values : Array(String)? = nil,
          @organizations_decision_detail : Types::OrganizationsDecisionDetail? = nil,
          @permissions_boundary_decision_detail : Types::PermissionsBoundaryDecisionDetail? = nil,
          @resource_specific_results : Array(Types::ResourceSpecificResult)? = nil
        )
        end
      end

      # The request failed because outbound identity federation is already disabled for your Amazon Web
      # Services account. You cannot disable the feature multiple times
      struct FeatureDisabledException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request failed because outbound identity federation is already enabled for your Amazon Web
      # Services account. You cannot enable the feature multiple times. To fetch the current configuration
      # (including the unique issuer URL), use the GetOutboundWebIdentityFederationInfo operation.
      struct FeatureEnabledException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the response to a successful GenerateCredentialReport request.
      struct GenerateCredentialReportResponse
        include JSON::Serializable

        # Information about the credential report.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about the state of the credential report.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @description : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct GenerateOrganizationsAccessReportRequest
        include JSON::Serializable

        # The path of the Organizations entity (root, OU, or account). You can build an entity path using the
        # known structure of your organization. For example, assume that your account ID is 123456789012 and
        # its parent OU ID is ou-rge0-awsabcde . The organization root ID is r-f6g7h8i9j0example and your
        # organization ID is o-a1b2c3d4e5 . Your entity path is
        # o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-rge0-awsabcde/123456789012 .
        @[JSON::Field(key: "EntityPath")]
        getter entity_path : String

        # The identifier of the Organizations service control policy (SCP). This parameter is optional. This
        # ID is used to generate information about when an account principal that is limited by the SCP
        # attempted to access an Amazon Web Services service.
        @[JSON::Field(key: "OrganizationsPolicyId")]
        getter organizations_policy_id : String?

        def initialize(
          @entity_path : String,
          @organizations_policy_id : String? = nil
        )
        end
      end

      struct GenerateOrganizationsAccessReportResponse
        include JSON::Serializable

        # The job identifier that you can use in the GetOrganizationsAccessReport operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct GenerateServiceLastAccessedDetailsRequest
        include JSON::Serializable

        # The ARN of the IAM resource (user, group, role, or managed policy) used to generate information
        # about when the resource was last used in an attempt to access an Amazon Web Services service.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The level of detail that you want to generate. You can specify whether you want to generate
        # information about the last attempt to access services or actions. If you specify service-level
        # granularity, this operation generates only service data. If you specify action-level granularity, it
        # generates service and action data. If you don't include this optional parameter, the operation
        # generates service data.
        @[JSON::Field(key: "Granularity")]
        getter granularity : String?

        def initialize(
          @arn : String,
          @granularity : String? = nil
        )
        end
      end

      struct GenerateServiceLastAccessedDetailsResponse
        include JSON::Serializable

        # The JobId that you can use in the GetServiceLastAccessedDetails or
        # GetServiceLastAccessedDetailsWithEntities operations. The JobId returned by
        # GenerateServiceLastAccessedDetail must be used by the same role within a session, or by the same
        # user when used to call GetServiceLastAccessedDetail .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct GetAccessKeyLastUsedRequest
        include JSON::Serializable

        # The identifier of an access key. This parameter allows (through its regex pattern ) a string of
        # characters that can consist of any upper or lowercased letter or digit.
        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String

        def initialize(
          @access_key_id : String
        )
        end
      end

      # Contains the response to a successful GetAccessKeyLastUsed request. It is also returned as a member
      # of the AccessKeyMetaData structure returned by the ListAccessKeys action.
      struct GetAccessKeyLastUsedResponse
        include JSON::Serializable

        # Contains information about the last time the access key was used.
        @[JSON::Field(key: "AccessKeyLastUsed")]
        getter access_key_last_used : Types::AccessKeyLastUsed?

        # The name of the IAM user that owns this access key.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @access_key_last_used : Types::AccessKeyLastUsed? = nil,
          @user_name : String? = nil
        )
        end
      end

      struct GetAccountAuthorizationDetailsRequest
        include JSON::Serializable

        # A list of entity types used to filter the results. Only the entities that match the types you
        # specify are included in the output. Use the value LocalManagedPolicy to include customer managed
        # policies. The format for this parameter is a comma-separated (if more than one) list of strings.
        # Each string value in the list must be one of the valid values listed below.
        @[JSON::Field(key: "Filter")]
        getter filter : Array(String)?

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @filter : Array(String)? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful GetAccountAuthorizationDetails request.
      struct GetAccountAuthorizationDetailsResponse
        include JSON::Serializable

        # A list containing information about IAM groups.
        @[JSON::Field(key: "GroupDetailList")]
        getter group_detail_list : Array(Types::GroupDetail)?

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list containing information about managed policies.
        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::ManagedPolicyDetail)?

        # A list containing information about IAM roles.
        @[JSON::Field(key: "RoleDetailList")]
        getter role_detail_list : Array(Types::RoleDetail)?

        # A list containing information about IAM users.
        @[JSON::Field(key: "UserDetailList")]
        getter user_detail_list : Array(Types::UserDetail)?

        def initialize(
          @group_detail_list : Array(Types::GroupDetail)? = nil,
          @is_truncated : Bool? = nil,
          @marker : String? = nil,
          @policies : Array(Types::ManagedPolicyDetail)? = nil,
          @role_detail_list : Array(Types::RoleDetail)? = nil,
          @user_detail_list : Array(Types::UserDetail)? = nil
        )
        end
      end

      # Contains the response to a successful GetAccountPasswordPolicy request.
      struct GetAccountPasswordPolicyResponse
        include JSON::Serializable

        # A structure that contains details about the account's password policy.
        @[JSON::Field(key: "PasswordPolicy")]
        getter password_policy : Types::PasswordPolicy

        def initialize(
          @password_policy : Types::PasswordPolicy
        )
        end
      end

      # Contains the response to a successful GetAccountSummary request.
      struct GetAccountSummaryResponse
        include JSON::Serializable

        # A set of key–value pairs containing information about IAM entity usage and IAM quotas.
        @[JSON::Field(key: "SummaryMap")]
        getter summary_map : Hash(String, Int32)?

        def initialize(
          @summary_map : Hash(String, Int32)? = nil
        )
        end
      end

      struct GetContextKeysForCustomPolicyRequest
        include JSON::Serializable

        # A list of policies for which you want the list of context keys referenced in those policies. Each
        # document is specified as a string containing the complete, valid JSON text of an IAM policy. The
        # regex pattern used to validate this parameter is a string of characters consisting of the following:
        # Any printable ASCII character ranging from the space character ( \u0020 ) through the end of the
        # ASCII character range The printable characters in the Basic Latin and Latin-1 Supplement character
        # set (through \u00FF ) The special characters tab ( \u0009 ), line feed ( \u000A ), and carriage
        # return ( \u000D )
        @[JSON::Field(key: "PolicyInputList")]
        getter policy_input_list : Array(String)

        def initialize(
          @policy_input_list : Array(String)
        )
        end
      end

      # Contains the response to a successful GetContextKeysForPrincipalPolicy or
      # GetContextKeysForCustomPolicy request.
      struct GetContextKeysForPolicyResponse
        include JSON::Serializable

        # The list of context keys that are referenced in the input policies.
        @[JSON::Field(key: "ContextKeyNames")]
        getter context_key_names : Array(String)?

        def initialize(
          @context_key_names : Array(String)? = nil
        )
        end
      end

      struct GetContextKeysForPrincipalPolicyRequest
        include JSON::Serializable

        # The ARN of a user, group, or role whose policies contain the context keys that you want listed. If
        # you specify a user, the list includes context keys that are found in all policies that are attached
        # to the user. The list also includes all groups that the user is a member of. If you pick a group or
        # a role, then it includes only those context keys that are found in policies attached to that entity.
        # Note that all parameters are shown in unencoded form here for clarity, but must be URL encoded to be
        # included as a part of a real HTML request. For more information about ARNs, see Amazon Resource
        # Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "PolicySourceArn")]
        getter policy_source_arn : String

        # An optional list of additional policies for which you want the list of context keys that are
        # referenced. The regex pattern used to validate this parameter is a string of characters consisting
        # of the following: Any printable ASCII character ranging from the space character ( \u0020 ) through
        # the end of the ASCII character range The printable characters in the Basic Latin and Latin-1
        # Supplement character set (through \u00FF ) The special characters tab ( \u0009 ), line feed ( \u000A
        # ), and carriage return ( \u000D )
        @[JSON::Field(key: "PolicyInputList")]
        getter policy_input_list : Array(String)?

        def initialize(
          @policy_source_arn : String,
          @policy_input_list : Array(String)? = nil
        )
        end
      end

      # Contains the response to a successful GetCredentialReport request.
      struct GetCredentialReportResponse
        include JSON::Serializable

        # Contains the credential report. The report is Base64-encoded.
        @[JSON::Field(key: "Content")]
        getter content : Bytes?

        # The date and time when the credential report was created, in ISO 8601 date-time format .
        @[JSON::Field(key: "GeneratedTime")]
        getter generated_time : Time?

        # The format (MIME type) of the credential report.
        @[JSON::Field(key: "ReportFormat")]
        getter report_format : String?

        def initialize(
          @content : Bytes? = nil,
          @generated_time : Time? = nil,
          @report_format : String? = nil
        )
        end
      end

      struct GetDelegationRequestRequest
        include JSON::Serializable

        # The unique identifier of the delegation request to retrieve.
        @[JSON::Field(key: "DelegationRequestId")]
        getter delegation_request_id : String

        # Specifies whether to perform a permission check for the delegation request. If set to true, the
        # GetDelegationRequest API call will start a permission check process. This process calculates whether
        # the caller has sufficient permissions to cover the asks from this delegation request. Setting this
        # parameter to true does not guarantee an answer in the response. See the PermissionCheckStatus and
        # the PermissionCheckResult response attributes for further details.
        @[JSON::Field(key: "DelegationPermissionCheck")]
        getter delegation_permission_check : Bool?

        def initialize(
          @delegation_request_id : String,
          @delegation_permission_check : Bool? = nil
        )
        end
      end

      struct GetDelegationRequestResponse
        include JSON::Serializable

        # The delegation request object containing all details about the request.
        @[JSON::Field(key: "DelegationRequest")]
        getter delegation_request : Types::DelegationRequest?

        # The result of the permission check, indicating whether the caller has sufficient permissions to
        # cover the requested permissions. This is an approximate result. ALLOWED : The caller has sufficient
        # permissions cover all the requested permissions. DENIED : The caller does not have sufficient
        # permissions to cover all the requested permissions. UNSURE : It is not possible to determine whether
        # the caller has all the permissions needed. This output is most likely for cases when the caller has
        # permissions with conditions.
        @[JSON::Field(key: "PermissionCheckResult")]
        getter permission_check_result : String?

        # The status of the permission check for the delegation request. This value indicates the status of
        # the process to check whether the caller has sufficient permissions to cover the requested actions in
        # the delegation request. Since this is an asynchronous process, there are three potential values:
        # IN_PROGRESS : The permission check process has started. COMPLETED : The permission check process has
        # completed. The PermissionCheckResult will include the result. FAILED : The permission check process
        # has failed.
        @[JSON::Field(key: "PermissionCheckStatus")]
        getter permission_check_status : String?

        def initialize(
          @delegation_request : Types::DelegationRequest? = nil,
          @permission_check_result : String? = nil,
          @permission_check_status : String? = nil
        )
        end
      end

      struct GetGroupPolicyRequest
        include JSON::Serializable

        # The name of the group the policy is associated with. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The name of the policy document to get. This parameter allows (through its regex pattern ) a string
        # of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @group_name : String,
          @policy_name : String
        )
        end
      end

      # Contains the response to a successful GetGroupPolicy request.
      struct GetGroupPolicyResponse
        include JSON::Serializable

        # The group the policy is associated with.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The policy document. IAM stores policies in JSON format. However, resources that were created using
        # CloudFormation templates can be formatted in YAML. CloudFormation always converts a YAML policy to
        # JSON format before submitting it to IAM.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The name of the policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @group_name : String,
          @policy_document : String,
          @policy_name : String
        )
        end
      end

      struct GetGroupRequest
        include JSON::Serializable

        # The name of the group. This parameter allows (through its regex pattern ) a string of characters
        # consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any
        # of the following characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @group_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful GetGroup request.
      struct GetGroupResponse
        include JSON::Serializable

        # A structure that contains details about the group.
        @[JSON::Field(key: "Group")]
        getter group : Types::Group

        # A list of users in the group.
        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @group : Types::Group,
          @users : Array(Types::User),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct GetHumanReadableSummaryRequest
        include JSON::Serializable

        # Arn of the entity to be summarized. At this time, the only supported entity type is
        # delegation-request
        @[JSON::Field(key: "EntityArn")]
        getter entity_arn : String

        # A string representing the locale to use for the summary generation. The supported locale strings are
        # based on the Supported languages of the Amazon Web Services Management Console .
        @[JSON::Field(key: "Locale")]
        getter locale : String?

        def initialize(
          @entity_arn : String,
          @locale : String? = nil
        )
        end
      end

      struct GetHumanReadableSummaryResponse
        include JSON::Serializable

        # The locale that this response was generated for. This maps to the input locale.
        @[JSON::Field(key: "Locale")]
        getter locale : String?

        # Summary content in the specified locale. Summary content is non-empty only if the SummaryState is
        # AVAILABLE .
        @[JSON::Field(key: "SummaryContent")]
        getter summary_content : String?

        # State of summary generation. This generation process is asynchronous and this attribute indicates
        # the state of the generation process.
        @[JSON::Field(key: "SummaryState")]
        getter summary_state : String?

        def initialize(
          @locale : String? = nil,
          @summary_content : String? = nil,
          @summary_state : String? = nil
        )
        end
      end

      struct GetInstanceProfileRequest
        include JSON::Serializable

        # The name of the instance profile to get information about. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String

        def initialize(
          @instance_profile_name : String
        )
        end
      end

      # Contains the response to a successful GetInstanceProfile request.
      struct GetInstanceProfileResponse
        include JSON::Serializable

        # A structure containing details about the instance profile.
        @[JSON::Field(key: "InstanceProfile")]
        getter instance_profile : Types::InstanceProfile

        def initialize(
          @instance_profile : Types::InstanceProfile
        )
        end
      end

      struct GetLoginProfileRequest
        include JSON::Serializable

        # The name of the user whose login profile you want to retrieve. This parameter is optional. If no
        # user name is included, it defaults to the principal making the request. When you make this request
        # with root user credentials, you must use an AssumeRoot session to omit the user name. This parameter
        # allows (through its regex pattern ) a string of characters consisting of upper and lowercase
        # alphanumeric characters with no spaces. You can also include any of the following characters:
        # _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @user_name : String? = nil
        )
        end
      end

      # Contains the response to a successful GetLoginProfile request.
      struct GetLoginProfileResponse
        include JSON::Serializable

        # A structure containing the user name and the profile creation date for the user.
        @[JSON::Field(key: "LoginProfile")]
        getter login_profile : Types::LoginProfile

        def initialize(
          @login_profile : Types::LoginProfile
        )
        end
      end

      struct GetMFADeviceRequest
        include JSON::Serializable

        # Serial number that uniquely identifies the MFA device. For this API, we only accept FIDO security
        # key ARNs .
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # The friendly name identifying the user.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @serial_number : String,
          @user_name : String? = nil
        )
        end
      end

      struct GetMFADeviceResponse
        include JSON::Serializable

        # Serial number that uniquely identifies the MFA device. For this API, we only accept FIDO security
        # key ARNs .
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # The certifications of a specified user's MFA device. We currently provide FIPS-140-2, FIPS-140-3,
        # and FIDO certification levels obtained from FIDO Alliance Metadata Service (MDS) .
        @[JSON::Field(key: "Certifications")]
        getter certifications : Hash(String, String)?

        # The date that a specified user's MFA device was first enabled.
        @[JSON::Field(key: "EnableDate")]
        getter enable_date : Time?

        # The friendly name identifying the user.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @serial_number : String,
          @certifications : Hash(String, String)? = nil,
          @enable_date : Time? = nil,
          @user_name : String? = nil
        )
        end
      end

      struct GetOpenIDConnectProviderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the OIDC provider resource object in IAM to get information for.
        # You can get a list of OIDC provider resource ARNs by using the ListOpenIDConnectProviders operation.
        # For more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "OpenIDConnectProviderArn")]
        getter open_id_connect_provider_arn : String

        def initialize(
          @open_id_connect_provider_arn : String
        )
        end
      end

      # Contains the response to a successful GetOpenIDConnectProvider request.
      struct GetOpenIDConnectProviderResponse
        include JSON::Serializable

        # A list of client IDs (also known as audiences) that are associated with the specified IAM OIDC
        # provider resource object. For more information, see CreateOpenIDConnectProvider .
        @[JSON::Field(key: "ClientIDList")]
        getter client_id_list : Array(String)?

        # The date and time when the IAM OIDC provider resource object was created in the Amazon Web Services
        # account.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # A list of tags that are attached to the specified IAM OIDC provider. The returned list of tags is
        # sorted by tag key. For more information about tagging, see Tagging IAM resources in the IAM User
        # Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A list of certificate thumbprints that are associated with the specified IAM OIDC provider resource
        # object. For more information, see CreateOpenIDConnectProvider .
        @[JSON::Field(key: "ThumbprintList")]
        getter thumbprint_list : Array(String)?

        # The URL that the IAM OIDC provider resource object is associated with. For more information, see
        # CreateOpenIDConnectProvider .
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @client_id_list : Array(String)? = nil,
          @create_date : Time? = nil,
          @tags : Array(Types::Tag)? = nil,
          @thumbprint_list : Array(String)? = nil,
          @url : String? = nil
        )
        end
      end

      struct GetOrganizationsAccessReportRequest
        include JSON::Serializable

        # The identifier of the request generated by the GenerateOrganizationsAccessReport operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The key that is used to sort the results. If you choose the namespace key, the results are returned
        # in alphabetical order. If you choose the time key, the results are sorted numerically by the date
        # and time.
        @[JSON::Field(key: "SortKey")]
        getter sort_key : String?

        def initialize(
          @job_id : String,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @sort_key : String? = nil
        )
        end
      end

      struct GetOrganizationsAccessReportResponse
        include JSON::Serializable

        # The date and time, in ISO 8601 date-time format , when the report job was created.
        @[JSON::Field(key: "JobCreationDate")]
        getter job_creation_date : Time

        # The status of the job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String

        # An object that contains details about the most recent attempt to access the service.
        @[JSON::Field(key: "AccessDetails")]
        getter access_details : Array(Types::AccessDetail)?

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::ErrorDetails?

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # The date and time, in ISO 8601 date-time format , when the generated report job was completed or
        # failed. This field is null if the job is still in progress, as indicated by a job status value of
        # IN_PROGRESS .
        @[JSON::Field(key: "JobCompletionDate")]
        getter job_completion_date : Time?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The number of services that the applicable SCPs allow account principals to access.
        @[JSON::Field(key: "NumberOfServicesAccessible")]
        getter number_of_services_accessible : Int32?

        # The number of services that account principals are allowed but did not attempt to access.
        @[JSON::Field(key: "NumberOfServicesNotAccessed")]
        getter number_of_services_not_accessed : Int32?

        def initialize(
          @job_creation_date : Time,
          @job_status : String,
          @access_details : Array(Types::AccessDetail)? = nil,
          @error_details : Types::ErrorDetails? = nil,
          @is_truncated : Bool? = nil,
          @job_completion_date : Time? = nil,
          @marker : String? = nil,
          @number_of_services_accessible : Int32? = nil,
          @number_of_services_not_accessed : Int32? = nil
        )
        end
      end

      struct GetOutboundWebIdentityFederationInfoResponse
        include JSON::Serializable

        # A unique issuer URL for your Amazon Web Services account that hosts the OpenID Connect (OIDC)
        # discovery endpoints at /.well-known/openid-configuration and /.well-known/jwks.json . The OpenID
        # Connect (OIDC) discovery endpoints contain verification keys and metadata necessary for token
        # verification.
        @[JSON::Field(key: "IssuerIdentifier")]
        getter issuer_identifier : String?

        # Indicates whether outbound identity federation is currently enabled for your Amazon Web Services
        # account. When true, IAM principals in the account can call the GetWebIdentityToken API to obtain
        # JSON Web Tokens (JWTs) for authentication with external services.
        @[JSON::Field(key: "JwtVendingEnabled")]
        getter jwt_vending_enabled : Bool?

        def initialize(
          @issuer_identifier : String? = nil,
          @jwt_vending_enabled : Bool? = nil
        )
        end
      end

      struct GetPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the managed policy that you want information about. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        def initialize(
          @policy_arn : String
        )
        end
      end

      # Contains the response to a successful GetPolicy request.
      struct GetPolicyResponse
        include JSON::Serializable

        # A structure containing details about the policy.
        @[JSON::Field(key: "Policy")]
        getter policy : Types::Policy?

        def initialize(
          @policy : Types::Policy? = nil
        )
        end
      end

      struct GetPolicyVersionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the managed policy that you want information about. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # Identifies the policy version to retrieve. This parameter allows (through its regex pattern ) a
        # string of characters that consists of the lowercase letter 'v' followed by one or two digits, and
        # optionally followed by a period '.' and a string of letters and digits.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        def initialize(
          @policy_arn : String,
          @version_id : String
        )
        end
      end

      # Contains the response to a successful GetPolicyVersion request.
      struct GetPolicyVersionResponse
        include JSON::Serializable

        # A structure containing details about the policy version.
        @[JSON::Field(key: "PolicyVersion")]
        getter policy_version : Types::PolicyVersion?

        def initialize(
          @policy_version : Types::PolicyVersion? = nil
        )
        end
      end

      struct GetRolePolicyRequest
        include JSON::Serializable

        # The name of the policy document to get. This parameter allows (through its regex pattern ) a string
        # of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The name of the role associated with the policy. This parameter allows (through its regex pattern )
        # a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You
        # can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @policy_name : String,
          @role_name : String
        )
        end
      end

      # Contains the response to a successful GetRolePolicy request.
      struct GetRolePolicyResponse
        include JSON::Serializable

        # The policy document. IAM stores policies in JSON format. However, resources that were created using
        # CloudFormation templates can be formatted in YAML. CloudFormation always converts a YAML policy to
        # JSON format before submitting it to IAM.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The name of the policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The role the policy is associated with.
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @role_name : String
        )
        end
      end

      struct GetRoleRequest
        include JSON::Serializable

        # The name of the IAM role to get information about. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @role_name : String
        )
        end
      end

      # Contains the response to a successful GetRole request.
      struct GetRoleResponse
        include JSON::Serializable

        # A structure containing details about the IAM role.
        @[JSON::Field(key: "Role")]
        getter role : Types::Role

        def initialize(
          @role : Types::Role
        )
        end
      end

      struct GetSAMLProviderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SAML provider resource object in IAM to get information about.
        # For more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "SAMLProviderArn")]
        getter saml_provider_arn : String

        def initialize(
          @saml_provider_arn : String
        )
        end
      end

      # Contains the response to a successful GetSAMLProvider request.
      struct GetSAMLProviderResponse
        include JSON::Serializable

        # Specifies the encryption setting for the SAML provider.
        @[JSON::Field(key: "AssertionEncryptionMode")]
        getter assertion_encryption_mode : String?

        # The date and time when the SAML provider was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The private key metadata for the SAML provider.
        @[JSON::Field(key: "PrivateKeyList")]
        getter private_key_list : Array(Types::SAMLPrivateKey)?

        # The XML metadata document that includes information about an identity provider.
        @[JSON::Field(key: "SAMLMetadataDocument")]
        getter saml_metadata_document : String?

        # The unique identifier assigned to the SAML provider.
        @[JSON::Field(key: "SAMLProviderUUID")]
        getter saml_provider_uuid : String?

        # A list of tags that are attached to the specified IAM SAML provider. The returned list of tags is
        # sorted by tag key. For more information about tagging, see Tagging IAM resources in the IAM User
        # Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The expiration date and time for the SAML provider.
        @[JSON::Field(key: "ValidUntil")]
        getter valid_until : Time?

        def initialize(
          @assertion_encryption_mode : String? = nil,
          @create_date : Time? = nil,
          @private_key_list : Array(Types::SAMLPrivateKey)? = nil,
          @saml_metadata_document : String? = nil,
          @saml_provider_uuid : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @valid_until : Time? = nil
        )
        end
      end

      struct GetSSHPublicKeyRequest
        include JSON::Serializable

        # Specifies the public key encoding format to use in the response. To retrieve the public key in
        # ssh-rsa format, use SSH . To retrieve the public key in PEM format, use PEM .
        @[JSON::Field(key: "Encoding")]
        getter encoding : String

        # The unique identifier for the SSH public key. This parameter allows (through its regex pattern ) a
        # string of characters that can consist of any upper or lowercased letter or digit.
        @[JSON::Field(key: "SSHPublicKeyId")]
        getter ssh_public_key_id : String

        # The name of the IAM user associated with the SSH public key. This parameter allows (through its
        # regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @encoding : String,
          @ssh_public_key_id : String,
          @user_name : String
        )
        end
      end

      # Contains the response to a successful GetSSHPublicKey request.
      struct GetSSHPublicKeyResponse
        include JSON::Serializable

        # A structure containing details about the SSH public key.
        @[JSON::Field(key: "SSHPublicKey")]
        getter ssh_public_key : Types::SSHPublicKey?

        def initialize(
          @ssh_public_key : Types::SSHPublicKey? = nil
        )
        end
      end

      struct GetServerCertificateRequest
        include JSON::Serializable

        # The name of the server certificate you want to retrieve information about. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "ServerCertificateName")]
        getter server_certificate_name : String

        def initialize(
          @server_certificate_name : String
        )
        end
      end

      # Contains the response to a successful GetServerCertificate request.
      struct GetServerCertificateResponse
        include JSON::Serializable

        # A structure containing details about the server certificate.
        @[JSON::Field(key: "ServerCertificate")]
        getter server_certificate : Types::ServerCertificate

        def initialize(
          @server_certificate : Types::ServerCertificate
        )
        end
      end

      struct GetServiceLastAccessedDetailsRequest
        include JSON::Serializable

        # The ID of the request generated by the GenerateServiceLastAccessedDetails operation. The JobId
        # returned by GenerateServiceLastAccessedDetail must be used by the same role within a session, or by
        # the same user when used to call GetServiceLastAccessedDetail .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @job_id : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct GetServiceLastAccessedDetailsResponse
        include JSON::Serializable

        # The date and time, in ISO 8601 date-time format , when the generated report job was completed or
        # failed. This field is null if the job is still in progress, as indicated by a job status value of
        # IN_PROGRESS .
        @[JSON::Field(key: "JobCompletionDate")]
        getter job_completion_date : Time

        # The date and time, in ISO 8601 date-time format , when the report job was created.
        @[JSON::Field(key: "JobCreationDate")]
        getter job_creation_date : Time

        # The status of the job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String

        # A ServiceLastAccessed object that contains details about the most recent attempt to access the
        # service.
        @[JSON::Field(key: "ServicesLastAccessed")]
        getter services_last_accessed : Array(Types::ServiceLastAccessed)

        # An object that contains details about the reason the operation failed.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorDetails?

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # The type of job. Service jobs return information about when each service was last accessed. Action
        # jobs also include information about when tracked actions within the service were last accessed.
        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @job_completion_date : Time,
          @job_creation_date : Time,
          @job_status : String,
          @services_last_accessed : Array(Types::ServiceLastAccessed),
          @error : Types::ErrorDetails? = nil,
          @is_truncated : Bool? = nil,
          @job_type : String? = nil,
          @marker : String? = nil
        )
        end
      end

      struct GetServiceLastAccessedDetailsWithEntitiesRequest
        include JSON::Serializable

        # The ID of the request generated by the GenerateServiceLastAccessedDetails operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The service namespace for an Amazon Web Services service. Provide the service namespace to learn
        # when the IAM entity last attempted to access the specified service. To learn the service namespace
        # for a service, see Actions, resources, and condition keys for Amazon Web Services services in the
        # IAM User Guide . Choose the name of the service to view details for that service. In the first
        # paragraph, find the service prefix. For example, (service prefix: a4b) . For more information about
        # service namespaces, see Amazon Web Services service namespaces in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @job_id : String,
          @service_namespace : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct GetServiceLastAccessedDetailsWithEntitiesResponse
        include JSON::Serializable

        # An EntityDetailsList object that contains details about when an IAM entity (user or role) used group
        # or policy permissions in an attempt to access the specified Amazon Web Services service.
        @[JSON::Field(key: "EntityDetailsList")]
        getter entity_details_list : Array(Types::EntityDetails)

        # The date and time, in ISO 8601 date-time format , when the generated report job was completed or
        # failed. This field is null if the job is still in progress, as indicated by a job status value of
        # IN_PROGRESS .
        @[JSON::Field(key: "JobCompletionDate")]
        getter job_completion_date : Time

        # The date and time, in ISO 8601 date-time format , when the report job was created.
        @[JSON::Field(key: "JobCreationDate")]
        getter job_creation_date : Time

        # The status of the job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String

        # An object that contains details about the reason the operation failed.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorDetails?

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @entity_details_list : Array(Types::EntityDetails),
          @job_completion_date : Time,
          @job_creation_date : Time,
          @job_status : String,
          @error : Types::ErrorDetails? = nil,
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct GetServiceLinkedRoleDeletionStatusRequest
        include JSON::Serializable

        # The deletion task identifier. This identifier is returned by the DeleteServiceLinkedRole operation
        # in the format
        # task/aws-service-role/&lt;service-principal-name&gt;/&lt;role-name&gt;/&lt;task-uuid&gt; .
        @[JSON::Field(key: "DeletionTaskId")]
        getter deletion_task_id : String

        def initialize(
          @deletion_task_id : String
        )
        end
      end

      struct GetServiceLinkedRoleDeletionStatusResponse
        include JSON::Serializable

        # The status of the deletion.
        @[JSON::Field(key: "Status")]
        getter status : String

        # An object that contains details about the reason the deletion failed.
        @[JSON::Field(key: "Reason")]
        getter reason : Types::DeletionTaskFailureReasonType?

        def initialize(
          @status : String,
          @reason : Types::DeletionTaskFailureReasonType? = nil
        )
        end
      end

      struct GetUserPolicyRequest
        include JSON::Serializable

        # The name of the policy document to get. This parameter allows (through its regex pattern ) a string
        # of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The name of the user who the policy is associated with. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @policy_name : String,
          @user_name : String
        )
        end
      end

      # Contains the response to a successful GetUserPolicy request.
      struct GetUserPolicyResponse
        include JSON::Serializable

        # The policy document. IAM stores policies in JSON format. However, resources that were created using
        # CloudFormation templates can be formatted in YAML. CloudFormation always converts a YAML policy to
        # JSON format before submitting it to IAM.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The name of the policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The user the policy is associated with.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @user_name : String
        )
        end
      end

      struct GetUserRequest
        include JSON::Serializable

        # The name of the user to get information about. This parameter is optional. If it is not included, it
        # defaults to the user making the request. This parameter allows (through its regex pattern ) a string
        # of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @user_name : String? = nil
        )
        end
      end

      # Contains the response to a successful GetUser request.
      struct GetUserResponse
        include JSON::Serializable

        # A structure containing details about the IAM user. Due to a service issue, password last used data
        # does not include password use from May 3, 2018 22:50 PDT to May 23, 2018 14:08 PDT. This affects
        # last sign-in dates shown in the IAM console and password last used dates in the IAM credential
        # report , and returned by this operation. If users signed in during the affected time, the password
        # last used date that is returned is the date the user last signed in before May 3, 2018. For users
        # that signed in after May 23, 2018 14:08 PDT, the returned password last used date is accurate. You
        # can use password last used information to identify unused credentials for deletion. For example, you
        # might delete users who did not sign in to Amazon Web Services in the last 90 days. In cases like
        # this, we recommend that you adjust your evaluation window to include dates after May 23, 2018.
        # Alternatively, if your users use access keys to access Amazon Web Services programmatically you can
        # refer to access key last used information because it is accurate for all dates.
        @[JSON::Field(key: "User")]
        getter user : Types::User

        def initialize(
          @user : Types::User
        )
        end
      end

      # Contains information about an IAM group entity. This data type is used as a response element in the
      # following operations: CreateGroup GetGroup ListGroups
      struct Group
        include JSON::Serializable

        # The Amazon Resource Name (ARN) specifying the group. For more information about ARNs and how to use
        # them in policies, see IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time, in ISO 8601 date-time format , when the group was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time

        # The stable and unique string identifying the group. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The friendly name that identifies the group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The path to the group. For more information about paths, see IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "Path")]
        getter path : String

        def initialize(
          @arn : String,
          @create_date : Time,
          @group_id : String,
          @group_name : String,
          @path : String
        )
        end
      end

      # Contains information about an IAM group, including all of the group's policies. This data type is
      # used as a response element in the GetAccountAuthorizationDetails operation.
      struct GroupDetail
        include JSON::Serializable

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A list of the managed policies attached to the group.
        @[JSON::Field(key: "AttachedManagedPolicies")]
        getter attached_managed_policies : Array(Types::AttachedPolicy)?

        # The date and time, in ISO 8601 date-time format , when the group was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The stable and unique string identifying the group. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        # The friendly name that identifies the group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # A list of the inline policies embedded in the group.
        @[JSON::Field(key: "GroupPolicyList")]
        getter group_policy_list : Array(Types::PolicyDetail)?

        # The path to the group. For more information about paths, see IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "Path")]
        getter path : String?

        def initialize(
          @arn : String? = nil,
          @attached_managed_policies : Array(Types::AttachedPolicy)? = nil,
          @create_date : Time? = nil,
          @group_id : String? = nil,
          @group_name : String? = nil,
          @group_policy_list : Array(Types::PolicyDetail)? = nil,
          @path : String? = nil
        )
        end
      end

      # Contains information about an instance profile. This data type is used as a response element in the
      # following operations: CreateInstanceProfile GetInstanceProfile ListInstanceProfiles
      # ListInstanceProfilesForRole
      struct InstanceProfile
        include JSON::Serializable

        # The Amazon Resource Name (ARN) specifying the instance profile. For more information about ARNs and
        # how to use them in policies, see IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date when the instance profile was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time

        # The stable and unique string identifying the instance profile. For more information about IDs, see
        # IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "InstanceProfileId")]
        getter instance_profile_id : String

        # The name identifying the instance profile.
        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String

        # The path to the instance profile. For more information about paths, see IAM identifiers in the IAM
        # User Guide .
        @[JSON::Field(key: "Path")]
        getter path : String

        # The role associated with the instance profile.
        @[JSON::Field(key: "Roles")]
        getter roles : Array(Types::Role)

        # A list of tags that are attached to the instance profile. For more information about tagging, see
        # Tagging IAM resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String,
          @create_date : Time,
          @instance_profile_id : String,
          @instance_profile_name : String,
          @path : String,
          @roles : Array(Types::Role),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The request was rejected because the authentication code was not recognized. The error message
      # describes the specific error.
      struct InvalidAuthenticationCodeException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the certificate is invalid.
      struct InvalidCertificateException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because an invalid or out-of-range value was supplied for an input
      # parameter.
      struct InvalidInputException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the public key is malformed or otherwise invalid.
      struct InvalidPublicKeyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the type of user for the transaction was incorrect.
      struct InvalidUserTypeException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the public key certificate and the private key do not match.
      struct KeyPairMismatchException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because it attempted to create resources beyond the current Amazon Web
      # Services account limits. The error message describes the limit exceeded.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListAccessKeysRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The name of the user. This parameter allows (through its regex pattern ) a string of characters
        # consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any
        # of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Contains the response to a successful ListAccessKeys request.
      struct ListAccessKeysResponse
        include JSON::Serializable

        # A list of objects containing metadata about the access keys.
        @[JSON::Field(key: "AccessKeyMetadata")]
        getter access_key_metadata : Array(Types::AccessKeyMetadata)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @access_key_metadata : Array(Types::AccessKeyMetadata),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListAccountAliasesRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful ListAccountAliases request.
      struct ListAccountAliasesResponse
        include JSON::Serializable

        # A list of aliases associated with the account. Amazon Web Services supports only one alias per
        # account.
        @[JSON::Field(key: "AccountAliases")]
        getter account_aliases : Array(String)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @account_aliases : Array(String),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListAttachedGroupPoliciesRequest
        include JSON::Serializable

        # The name (friendly name, not ARN) of the group to list attached policies for. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The path prefix for filtering the results. This parameter is optional. If it is not included, it
        # defaults to a slash (/), listing all policies. This parameter allows (through its regex pattern ) a
        # string of characters consisting of either a forward slash (/) by itself or a string that must begin
        # and end with forward slashes. In addition, it can contain any ASCII character from the ! ( \u0021 )
        # through the DEL character ( \u007F ), including most punctuation characters, digits, and upper and
        # lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        def initialize(
          @group_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @path_prefix : String? = nil
        )
        end
      end

      # Contains the response to a successful ListAttachedGroupPolicies request.
      struct ListAttachedGroupPoliciesResponse
        include JSON::Serializable

        # A list of the attached policies.
        @[JSON::Field(key: "AttachedPolicies")]
        getter attached_policies : Array(Types::AttachedPolicy)?

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @attached_policies : Array(Types::AttachedPolicy)? = nil,
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListAttachedRolePoliciesRequest
        include JSON::Serializable

        # The name (friendly name, not ARN) of the role to list attached policies for. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The path prefix for filtering the results. This parameter is optional. If it is not included, it
        # defaults to a slash (/), listing all policies. This parameter allows (through its regex pattern ) a
        # string of characters consisting of either a forward slash (/) by itself or a string that must begin
        # and end with forward slashes. In addition, it can contain any ASCII character from the ! ( \u0021 )
        # through the DEL character ( \u007F ), including most punctuation characters, digits, and upper and
        # lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        def initialize(
          @role_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @path_prefix : String? = nil
        )
        end
      end

      # Contains the response to a successful ListAttachedRolePolicies request.
      struct ListAttachedRolePoliciesResponse
        include JSON::Serializable

        # A list of the attached policies.
        @[JSON::Field(key: "AttachedPolicies")]
        getter attached_policies : Array(Types::AttachedPolicy)?

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @attached_policies : Array(Types::AttachedPolicy)? = nil,
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListAttachedUserPoliciesRequest
        include JSON::Serializable

        # The name (friendly name, not ARN) of the user to list attached policies for. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The path prefix for filtering the results. This parameter is optional. If it is not included, it
        # defaults to a slash (/), listing all policies. This parameter allows (through its regex pattern ) a
        # string of characters consisting of either a forward slash (/) by itself or a string that must begin
        # and end with forward slashes. In addition, it can contain any ASCII character from the ! ( \u0021 )
        # through the DEL character ( \u007F ), including most punctuation characters, digits, and upper and
        # lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        def initialize(
          @user_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @path_prefix : String? = nil
        )
        end
      end

      # Contains the response to a successful ListAttachedUserPolicies request.
      struct ListAttachedUserPoliciesResponse
        include JSON::Serializable

        # A list of the attached policies.
        @[JSON::Field(key: "AttachedPolicies")]
        getter attached_policies : Array(Types::AttachedPolicy)?

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @attached_policies : Array(Types::AttachedPolicy)? = nil,
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListDelegationRequestsRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # may return fewer results, even when there are more results available. In that case, the IsTruncated
        # response element returns true , and Marker contains a value to include in the subsequent call that
        # tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The owner ID to filter delegation requests by.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @owner_id : String? = nil
        )
        end
      end

      struct ListDelegationRequestsResponse
        include JSON::Serializable

        # A list of delegation requests that match the specified criteria.
        @[JSON::Field(key: "DelegationRequests")]
        getter delegation_requests : Array(Types::DelegationRequest)?

        # When isTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        @[JSON::Field(key: "isTruncated")]
        getter is_truncated : Bool?

        def initialize(
          @delegation_requests : Array(Types::DelegationRequest)? = nil,
          @marker : String? = nil,
          @is_truncated : Bool? = nil
        )
        end
      end

      struct ListEntitiesForPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy for which you want the versions. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The entity type to use for filtering the results. For example, when EntityFilter is Role , only the
        # roles that are attached to the specified policy are returned. This parameter is optional. If it is
        # not included, all attached entities (users, groups, and roles) are returned. The argument for this
        # parameter must be one of the valid values listed below.
        @[JSON::Field(key: "EntityFilter")]
        getter entity_filter : String?

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The path prefix for filtering the results. This parameter is optional. If it is not included, it
        # defaults to a slash (/), listing all entities. This parameter allows (through its regex pattern ) a
        # string of characters consisting of either a forward slash (/) by itself or a string that must begin
        # and end with forward slashes. In addition, it can contain any ASCII character from the ! ( \u0021 )
        # through the DEL character ( \u007F ), including most punctuation characters, digits, and upper and
        # lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        # The policy usage method to use for filtering the results. To list only permissions policies, set
        # PolicyUsageFilter to PermissionsPolicy . To list only the policies used to set permissions
        # boundaries, set the value to PermissionsBoundary . This parameter is optional. If it is not
        # included, all policies are returned.
        @[JSON::Field(key: "PolicyUsageFilter")]
        getter policy_usage_filter : String?

        def initialize(
          @policy_arn : String,
          @entity_filter : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @path_prefix : String? = nil,
          @policy_usage_filter : String? = nil
        )
        end
      end

      # Contains the response to a successful ListEntitiesForPolicy request.
      struct ListEntitiesForPolicyResponse
        include JSON::Serializable

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of IAM groups that the policy is attached to.
        @[JSON::Field(key: "PolicyGroups")]
        getter policy_groups : Array(Types::PolicyGroup)?

        # A list of IAM roles that the policy is attached to.
        @[JSON::Field(key: "PolicyRoles")]
        getter policy_roles : Array(Types::PolicyRole)?

        # A list of IAM users that the policy is attached to.
        @[JSON::Field(key: "PolicyUsers")]
        getter policy_users : Array(Types::PolicyUser)?

        def initialize(
          @is_truncated : Bool? = nil,
          @marker : String? = nil,
          @policy_groups : Array(Types::PolicyGroup)? = nil,
          @policy_roles : Array(Types::PolicyRole)? = nil,
          @policy_users : Array(Types::PolicyUser)? = nil
        )
        end
      end

      struct ListGroupPoliciesRequest
        include JSON::Serializable

        # The name of the group to list policies for. This parameter allows (through its regex pattern ) a
        # string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You
        # can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @group_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful ListGroupPolicies request.
      struct ListGroupPoliciesResponse
        include JSON::Serializable

        # A list of policy names. This parameter allows (through its regex pattern ) a string of characters
        # consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any
        # of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @policy_names : Array(String),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListGroupsForUserRequest
        include JSON::Serializable

        # The name of the user to list groups for. This parameter allows (through its regex pattern ) a string
        # of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @user_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful ListGroupsForUser request.
      struct ListGroupsForUserResponse
        include JSON::Serializable

        # A list of groups.
        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::Group)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @groups : Array(Types::Group),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListGroupsRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The path prefix for filtering the results. For example, the prefix /division_abc/subdivision_xyz/
        # gets all groups whose path starts with /division_abc/subdivision_xyz/ . This parameter is optional.
        # If it is not included, it defaults to a slash (/), listing all groups. This parameter allows
        # (through its regex pattern ) a string of characters consisting of either a forward slash (/) by
        # itself or a string that must begin and end with forward slashes. In addition, it can contain any
        # ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including most
        # punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @path_prefix : String? = nil
        )
        end
      end

      # Contains the response to a successful ListGroups request.
      struct ListGroupsResponse
        include JSON::Serializable

        # A list of groups.
        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::Group)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @groups : Array(Types::Group),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListInstanceProfileTagsRequest
        include JSON::Serializable

        # The name of the IAM instance profile whose tags you want to see. This parameter allows (through its
        # regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @instance_profile_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListInstanceProfileTagsResponse
        include JSON::Serializable

        # The list of tags that are currently attached to the IAM instance profile. Each tag consists of a key
        # name and an associated value. If no tags are attached to the specified resource, the response
        # contains an empty list.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @tags : Array(Types::Tag),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListInstanceProfilesForRoleRequest
        include JSON::Serializable

        # The name of the role to list instance profiles for. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @role_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful ListInstanceProfilesForRole request.
      struct ListInstanceProfilesForRoleResponse
        include JSON::Serializable

        # A list of instance profiles.
        @[JSON::Field(key: "InstanceProfiles")]
        getter instance_profiles : Array(Types::InstanceProfile)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @instance_profiles : Array(Types::InstanceProfile),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListInstanceProfilesRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The path prefix for filtering the results. For example, the prefix /application_abc/component_xyz/
        # gets all instance profiles whose path starts with /application_abc/component_xyz/ . This parameter
        # is optional. If it is not included, it defaults to a slash (/), listing all instance profiles. This
        # parameter allows (through its regex pattern ) a string of characters consisting of either a forward
        # slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can
        # contain any ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including
        # most punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @path_prefix : String? = nil
        )
        end
      end

      # Contains the response to a successful ListInstanceProfiles request.
      struct ListInstanceProfilesResponse
        include JSON::Serializable

        # A list of instance profiles.
        @[JSON::Field(key: "InstanceProfiles")]
        getter instance_profiles : Array(Types::InstanceProfile)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @instance_profiles : Array(Types::InstanceProfile),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListMFADeviceTagsRequest
        include JSON::Serializable

        # The unique identifier for the IAM virtual MFA device whose tags you want to see. For virtual MFA
        # devices, the serial number is the same as the ARN. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @serial_number : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListMFADeviceTagsResponse
        include JSON::Serializable

        # The list of tags that are currently attached to the virtual MFA device. Each tag consists of a key
        # name and an associated value. If no tags are attached to the specified resource, the response
        # contains an empty list.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @tags : Array(Types::Tag),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListMFADevicesRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The name of the user whose MFA devices you want to list. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Contains the response to a successful ListMFADevices request.
      struct ListMFADevicesResponse
        include JSON::Serializable

        # A list of MFA devices.
        @[JSON::Field(key: "MFADevices")]
        getter mfa_devices : Array(Types::MFADevice)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @mfa_devices : Array(Types::MFADevice),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListOpenIDConnectProviderTagsRequest
        include JSON::Serializable

        # The ARN of the OpenID Connect (OIDC) identity provider whose tags you want to see. This parameter
        # allows (through its regex pattern ) a string of characters consisting of upper and lowercase
        # alphanumeric characters with no spaces. You can also include any of the following characters:
        # _+=,.@-
        @[JSON::Field(key: "OpenIDConnectProviderArn")]
        getter open_id_connect_provider_arn : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @open_id_connect_provider_arn : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListOpenIDConnectProviderTagsResponse
        include JSON::Serializable

        # The list of tags that are currently attached to the OpenID Connect (OIDC) identity provider. Each
        # tag consists of a key name and an associated value. If no tags are attached to the specified
        # resource, the response contains an empty list.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @tags : Array(Types::Tag),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListOpenIDConnectProvidersRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the response to a successful ListOpenIDConnectProviders request.
      struct ListOpenIDConnectProvidersResponse
        include JSON::Serializable

        # The list of IAM OIDC provider resource objects defined in the Amazon Web Services account.
        @[JSON::Field(key: "OpenIDConnectProviderList")]
        getter open_id_connect_provider_list : Array(Types::OpenIDConnectProviderListEntry)?

        def initialize(
          @open_id_connect_provider_list : Array(Types::OpenIDConnectProviderListEntry)? = nil
        )
        end
      end

      struct ListOrganizationsFeaturesRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct ListOrganizationsFeaturesResponse
        include JSON::Serializable

        # Specifies the features that are currently available in your organization.
        @[JSON::Field(key: "EnabledFeatures")]
        getter enabled_features : Array(String)?

        # The unique identifier (ID) of an organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        def initialize(
          @enabled_features : Array(String)? = nil,
          @organization_id : String? = nil
        )
        end
      end

      # Contains details about the permissions policies that are attached to the specified identity (user,
      # group, or role). This data type is used as a response element in the
      # ListPoliciesGrantingServiceAccess operation.
      struct ListPoliciesGrantingServiceAccessEntry
        include JSON::Serializable

        # The PoliciesGrantingServiceAccess object that contains details about the policy.
        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::PolicyGrantingServiceAccess)?

        # The namespace of the service that was accessed. To learn the service namespace of a service, see
        # Actions, resources, and condition keys for Amazon Web Services services in the Service Authorization
        # Reference . Choose the name of the service to view details for that service. In the first paragraph,
        # find the service prefix. For example, (service prefix: a4b) . For more information about service
        # namespaces, see Amazon Web Services service namespaces in the Amazon Web Services General Reference
        # .
        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String?

        def initialize(
          @policies : Array(Types::PolicyGrantingServiceAccess)? = nil,
          @service_namespace : String? = nil
        )
        end
      end

      struct ListPoliciesGrantingServiceAccessRequest
        include JSON::Serializable

        # The ARN of the IAM identity (user, group, or role) whose policies you want to list.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The service namespace for the Amazon Web Services services whose policies you want to list. To learn
        # the service namespace for a service, see Actions, resources, and condition keys for Amazon Web
        # Services services in the IAM User Guide . Choose the name of the service to view details for that
        # service. In the first paragraph, find the service prefix. For example, (service prefix: a4b) . For
        # more information about service namespaces, see Amazon Web Services service namespaces in the Amazon
        # Web Services General Reference .
        @[JSON::Field(key: "ServiceNamespaces")]
        getter service_namespaces : Array(String)

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @arn : String,
          @service_namespaces : Array(String),
          @marker : String? = nil
        )
        end
      end

      struct ListPoliciesGrantingServiceAccessResponse
        include JSON::Serializable

        # A ListPoliciesGrantingServiceAccess object that contains details about the permissions policies
        # attached to the specified identity (user, group, or role).
        @[JSON::Field(key: "PoliciesGrantingServiceAccess")]
        getter policies_granting_service_access : Array(Types::ListPoliciesGrantingServiceAccessEntry)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # We recommend that you check IsTruncated after every call to ensure that you receive all your
        # results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @policies_granting_service_access : Array(Types::ListPoliciesGrantingServiceAccessEntry),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListPoliciesRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # A flag to filter the results to only the attached policies. When OnlyAttached is true , the returned
        # list contains only the policies that are attached to an IAM user, group, or role. When OnlyAttached
        # is false , or when the parameter is not included, all policies are returned.
        @[JSON::Field(key: "OnlyAttached")]
        getter only_attached : Bool?

        # The path prefix for filtering the results. This parameter is optional. If it is not included, it
        # defaults to a slash (/), listing all policies. This parameter allows (through its regex pattern ) a
        # string of characters consisting of either a forward slash (/) by itself or a string that must begin
        # and end with forward slashes. In addition, it can contain any ASCII character from the ! ( \u0021 )
        # through the DEL character ( \u007F ), including most punctuation characters, digits, and upper and
        # lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        # The policy usage method to use for filtering the results. To list only permissions policies, set
        # PolicyUsageFilter to PermissionsPolicy . To list only the policies used to set permissions
        # boundaries, set the value to PermissionsBoundary . This parameter is optional. If it is not
        # included, all policies are returned.
        @[JSON::Field(key: "PolicyUsageFilter")]
        getter policy_usage_filter : String?

        # The scope to use for filtering the results. To list only Amazon Web Services managed policies, set
        # Scope to AWS . To list only the customer managed policies in your Amazon Web Services account, set
        # Scope to Local . This parameter is optional. If it is not included, or if it is set to All , all
        # policies are returned.
        @[JSON::Field(key: "Scope")]
        getter scope : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @only_attached : Bool? = nil,
          @path_prefix : String? = nil,
          @policy_usage_filter : String? = nil,
          @scope : String? = nil
        )
        end
      end

      # Contains the response to a successful ListPolicies request.
      struct ListPoliciesResponse
        include JSON::Serializable

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of policies.
        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::Policy)?

        def initialize(
          @is_truncated : Bool? = nil,
          @marker : String? = nil,
          @policies : Array(Types::Policy)? = nil
        )
        end
      end

      struct ListPolicyTagsRequest
        include JSON::Serializable

        # The ARN of the IAM customer managed policy whose tags you want to see. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @policy_arn : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListPolicyTagsResponse
        include JSON::Serializable

        # The list of tags that are currently attached to the IAM customer managed policy. Each tag consists
        # of a key name and an associated value. If no tags are attached to the specified resource, the
        # response contains an empty list.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @tags : Array(Types::Tag),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListPolicyVersionsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy for which you want the versions. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @policy_arn : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful ListPolicyVersions request.
      struct ListPolicyVersionsResponse
        include JSON::Serializable

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of policy versions. For more information about managed policy versions, see Versioning for
        # managed policies in the IAM User Guide .
        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::PolicyVersion)?

        def initialize(
          @is_truncated : Bool? = nil,
          @marker : String? = nil,
          @versions : Array(Types::PolicyVersion)? = nil
        )
        end
      end

      struct ListRolePoliciesRequest
        include JSON::Serializable

        # The name of the role to list policies for. This parameter allows (through its regex pattern ) a
        # string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You
        # can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @role_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful ListRolePolicies request.
      struct ListRolePoliciesResponse
        include JSON::Serializable

        # A list of policy names.
        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @policy_names : Array(String),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListRoleTagsRequest
        include JSON::Serializable

        # The name of the IAM role for which you want to see the list of tags. This parameter accepts (through
        # its regex pattern ) a string of characters that consist of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @role_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListRoleTagsResponse
        include JSON::Serializable

        # The list of tags that are currently attached to the role. Each tag consists of a key name and an
        # associated value. If no tags are attached to the specified resource, the response contains an empty
        # list.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @tags : Array(Types::Tag),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListRolesRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The path prefix for filtering the results. For example, the prefix /application_abc/component_xyz/
        # gets all roles whose path starts with /application_abc/component_xyz/ . This parameter is optional.
        # If it is not included, it defaults to a slash (/), listing all roles. This parameter allows (through
        # its regex pattern ) a string of characters consisting of either a forward slash (/) by itself or a
        # string that must begin and end with forward slashes. In addition, it can contain any ASCII character
        # from the ! ( \u0021 ) through the DEL character ( \u007F ), including most punctuation characters,
        # digits, and upper and lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @path_prefix : String? = nil
        )
        end
      end

      # Contains the response to a successful ListRoles request.
      struct ListRolesResponse
        include JSON::Serializable

        # A list of roles.
        @[JSON::Field(key: "Roles")]
        getter roles : Array(Types::Role)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @roles : Array(Types::Role),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListSAMLProviderTagsRequest
        include JSON::Serializable

        # The ARN of the Security Assertion Markup Language (SAML) identity provider whose tags you want to
        # see. This parameter allows (through its regex pattern ) a string of characters consisting of upper
        # and lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "SAMLProviderArn")]
        getter saml_provider_arn : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @saml_provider_arn : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListSAMLProviderTagsResponse
        include JSON::Serializable

        # The list of tags that are currently attached to the Security Assertion Markup Language (SAML)
        # identity provider. Each tag consists of a key name and an associated value. If no tags are attached
        # to the specified resource, the response contains an empty list.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @tags : Array(Types::Tag),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListSAMLProvidersRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the response to a successful ListSAMLProviders request.
      struct ListSAMLProvidersResponse
        include JSON::Serializable

        # The list of SAML provider resource objects defined in IAM for this Amazon Web Services account.
        @[JSON::Field(key: "SAMLProviderList")]
        getter saml_provider_list : Array(Types::SAMLProviderListEntry)?

        def initialize(
          @saml_provider_list : Array(Types::SAMLProviderListEntry)? = nil
        )
        end
      end

      struct ListSSHPublicKeysRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The name of the IAM user to list SSH public keys for. If none is specified, the UserName field is
        # determined implicitly based on the Amazon Web Services access key used to sign the request. This
        # parameter allows (through its regex pattern ) a string of characters consisting of upper and
        # lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Contains the response to a successful ListSSHPublicKeys request.
      struct ListSSHPublicKeysResponse
        include JSON::Serializable

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of the SSH public keys assigned to IAM user.
        @[JSON::Field(key: "SSHPublicKeys")]
        getter ssh_public_keys : Array(Types::SSHPublicKeyMetadata)?

        def initialize(
          @is_truncated : Bool? = nil,
          @marker : String? = nil,
          @ssh_public_keys : Array(Types::SSHPublicKeyMetadata)? = nil
        )
        end
      end

      struct ListServerCertificateTagsRequest
        include JSON::Serializable

        # The name of the IAM server certificate whose tags you want to see. This parameter allows (through
        # its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "ServerCertificateName")]
        getter server_certificate_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @server_certificate_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListServerCertificateTagsResponse
        include JSON::Serializable

        # The list of tags that are currently attached to the IAM server certificate. Each tag consists of a
        # key name and an associated value. If no tags are attached to the specified resource, the response
        # contains an empty list.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @tags : Array(Types::Tag),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListServerCertificatesRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The path prefix for filtering the results. For example: /company/servercerts would get all server
        # certificates for which the path starts with /company/servercerts . This parameter is optional. If it
        # is not included, it defaults to a slash (/), listing all server certificates. This parameter allows
        # (through its regex pattern ) a string of characters consisting of either a forward slash (/) by
        # itself or a string that must begin and end with forward slashes. In addition, it can contain any
        # ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including most
        # punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @path_prefix : String? = nil
        )
        end
      end

      # Contains the response to a successful ListServerCertificates request.
      struct ListServerCertificatesResponse
        include JSON::Serializable

        # A list of server certificates.
        @[JSON::Field(key: "ServerCertificateMetadataList")]
        getter server_certificate_metadata_list : Array(Types::ServerCertificateMetadata)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @server_certificate_metadata_list : Array(Types::ServerCertificateMetadata),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListServiceSpecificCredentialsRequest
        include JSON::Serializable

        # A flag indicating whether to list service specific credentials for all users. This parameter cannot
        # be specified together with UserName. When true, returns all credentials associated with the
        # specified service.
        @[JSON::Field(key: "AllUsers")]
        getter all_users : Bool?

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker from the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # Filters the returned results to only those for the specified Amazon Web Services service. If not
        # specified, then Amazon Web Services returns service-specific credentials for all services.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # The name of the user whose service-specific credentials you want information about. If this value is
        # not specified, then the operation assumes the user whose credentials are used to call the operation.
        # This parameter allows (through its regex pattern ) a string of characters consisting of upper and
        # lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @all_users : Bool? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @service_name : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      struct ListServiceSpecificCredentialsResponse
        include JSON::Serializable

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true, this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of structures that each contain details about a service-specific credential.
        @[JSON::Field(key: "ServiceSpecificCredentials")]
        getter service_specific_credentials : Array(Types::ServiceSpecificCredentialMetadata)?

        def initialize(
          @is_truncated : Bool? = nil,
          @marker : String? = nil,
          @service_specific_credentials : Array(Types::ServiceSpecificCredentialMetadata)? = nil
        )
        end
      end

      struct ListSigningCertificatesRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The name of the IAM user whose signing certificates you want to examine. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Contains the response to a successful ListSigningCertificates request.
      struct ListSigningCertificatesResponse
        include JSON::Serializable

        # A list of the user's signing certificate information.
        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::SigningCertificate)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @certificates : Array(Types::SigningCertificate),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListUserPoliciesRequest
        include JSON::Serializable

        # The name of the user to list policies for. This parameter allows (through its regex pattern ) a
        # string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You
        # can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @user_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful ListUserPolicies request.
      struct ListUserPoliciesResponse
        include JSON::Serializable

        # A list of policy names.
        @[JSON::Field(key: "PolicyNames")]
        getter policy_names : Array(String)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @policy_names : Array(String),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListUserTagsRequest
        include JSON::Serializable

        # The name of the IAM user whose tags you want to see. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @user_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListUserTagsResponse
        include JSON::Serializable

        # The list of tags that are currently attached to the user. Each tag consists of a key name and an
        # associated value. If no tags are attached to the specified resource, the response contains an empty
        # list.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @tags : Array(Types::Tag),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListUsersRequest
        include JSON::Serializable

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The path prefix for filtering the results. For example: /division_abc/subdivision_xyz/ , which would
        # get all user names whose path starts with /division_abc/subdivision_xyz/ . This parameter is
        # optional. If it is not included, it defaults to a slash (/), listing all user names. This parameter
        # allows (through its regex pattern ) a string of characters consisting of either a forward slash (/)
        # by itself or a string that must begin and end with forward slashes. In addition, it can contain any
        # ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including most
        # punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "PathPrefix")]
        getter path_prefix : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @path_prefix : String? = nil
        )
        end
      end

      # Contains the response to a successful ListUsers request.
      struct ListUsersResponse
        include JSON::Serializable

        # A list of users.
        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @users : Array(Types::User),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ListVirtualMFADevicesRequest
        include JSON::Serializable

        # The status ( Unassigned or Assigned ) of the devices to list. If you do not specify an
        # AssignmentStatus , the operation defaults to Any , which lists both assigned and unassigned virtual
        # MFA devices.,
        @[JSON::Field(key: "AssignmentStatus")]
        getter assignment_status : String?

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @assignment_status : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # Contains the response to a successful ListVirtualMFADevices request.
      struct ListVirtualMFADevicesResponse
        include JSON::Serializable

        # The list of virtual MFA devices in the current account that match the AssignmentStatus value that
        # was passed in the request.
        @[JSON::Field(key: "VirtualMFADevices")]
        getter virtual_mfa_devices : Array(Types::VirtualMFADevice)

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @virtual_mfa_devices : Array(Types::VirtualMFADevice),
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      # Contains the user name and password create date for a user. This data type is used as a response
      # element in the CreateLoginProfile and GetLoginProfile operations.
      struct LoginProfile
        include JSON::Serializable

        # The date when the password for the user was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time

        # The name of the user, which can be used for signing in to the Amazon Web Services Management
        # Console.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # Specifies whether the user is required to set a new password on next sign-in.
        @[JSON::Field(key: "PasswordResetRequired")]
        getter password_reset_required : Bool?

        def initialize(
          @create_date : Time,
          @user_name : String,
          @password_reset_required : Bool? = nil
        )
        end
      end

      # Contains information about an MFA device. This data type is used as a response element in the
      # ListMFADevices operation.
      struct MFADevice
        include JSON::Serializable

        # The date when the MFA device was enabled for the user.
        @[JSON::Field(key: "EnableDate")]
        getter enable_date : Time

        # The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial
        # number is the device ARN.
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # The user with whom the MFA device is associated.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @enable_date : Time,
          @serial_number : String,
          @user_name : String
        )
        end
      end

      # The request was rejected because the certificate was malformed or expired. The error message
      # describes the specific error.
      struct MalformedCertificateException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the policy document was malformed. The error message describes the
      # specific error.
      struct MalformedPolicyDocumentException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about a managed policy, including the policy's ARN, versions, and the number of
      # principal entities (users, groups, and roles) that the policy is attached to. This data type is used
      # as a response element in the GetAccountAuthorizationDetails operation. For more information about
      # managed policies, see Managed policies and inline policies in the IAM User Guide .
      struct ManagedPolicyDetail
        include JSON::Serializable

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The number of principal entities (users, groups, and roles) that the policy is attached to.
        @[JSON::Field(key: "AttachmentCount")]
        getter attachment_count : Int32?

        # The date and time, in ISO 8601 date-time format , when the policy was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The identifier for the version of the policy that is set as the default (operative) version. For
        # more information about policy versions, see Versioning for managed policies in the IAM User Guide .
        @[JSON::Field(key: "DefaultVersionId")]
        getter default_version_id : String?

        # A friendly description of the policy.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies whether the policy can be attached to an IAM user, group, or role.
        @[JSON::Field(key: "IsAttachable")]
        getter is_attachable : Bool?

        # The path to the policy. For more information about paths, see IAM identifiers in the IAM User Guide
        # .
        @[JSON::Field(key: "Path")]
        getter path : String?

        # The number of entities (users and roles) for which the policy is used as the permissions boundary.
        # For more information about permissions boundaries, see Permissions boundaries for IAM identities in
        # the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundaryUsageCount")]
        getter permissions_boundary_usage_count : Int32?

        # The stable and unique string identifying the policy. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        # The friendly name (not ARN) identifying the policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # A list containing information about the versions of the policy.
        @[JSON::Field(key: "PolicyVersionList")]
        getter policy_version_list : Array(Types::PolicyVersion)?

        # The date and time, in ISO 8601 date-time format , when the policy was last updated. When a policy
        # has only one version, this field contains the date and time when the policy was created. When a
        # policy has more than one version, this field contains the date and time when the most recent policy
        # version was created.
        @[JSON::Field(key: "UpdateDate")]
        getter update_date : Time?

        def initialize(
          @arn : String? = nil,
          @attachment_count : Int32? = nil,
          @create_date : Time? = nil,
          @default_version_id : String? = nil,
          @description : String? = nil,
          @is_attachable : Bool? = nil,
          @path : String? = nil,
          @permissions_boundary_usage_count : Int32? = nil,
          @policy_id : String? = nil,
          @policy_name : String? = nil,
          @policy_version_list : Array(Types::PolicyVersion)? = nil,
          @update_date : Time? = nil
        )
        end
      end

      # The request was rejected because it referenced a resource entity that does not exist. The error
      # message describes the resource.
      struct NoSuchEntityException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the Amazon Resource Name (ARN) for an IAM OpenID Connect provider.
      struct OpenIDConnectProviderListEntry
        include JSON::Serializable

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # The request failed because IAM cannot connect to the OpenID Connect identity provider URL.
      struct OpenIdIdpCommunicationErrorException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because no organization is associated with your account.
      struct OrganizationNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The request was rejected because your organization does not have All features enabled. For more
      # information, see Available feature sets in the Organizations User Guide .
      struct OrganizationNotInAllFeaturesModeException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the effect that Organizations has on a policy simulation.
      struct OrganizationsDecisionDetail
        include JSON::Serializable

        # Specifies whether the simulated operation is allowed by the Organizations service control policies
        # that impact the simulated user's account.
        @[JSON::Field(key: "AllowedByOrganizations")]
        getter allowed_by_organizations : Bool?

        def initialize(
          @allowed_by_organizations : Bool? = nil
        )
        end
      end

      # Contains information about the account password policy. This data type is used as a response element
      # in the GetAccountPasswordPolicy operation.
      struct PasswordPolicy
        include JSON::Serializable

        # Specifies whether IAM users are allowed to change their own password. Gives IAM users permissions to
        # iam:ChangePassword for only their user and to the iam:GetAccountPasswordPolicy action. This option
        # does not attach a permissions policy to each user, rather the permissions are applied at the
        # account-level for all users by IAM.
        @[JSON::Field(key: "AllowUsersToChangePassword")]
        getter allow_users_to_change_password : Bool?

        # Indicates whether passwords in the account expire. Returns true if MaxPasswordAge contains a value
        # greater than 0. Returns false if MaxPasswordAge is 0 or not present.
        @[JSON::Field(key: "ExpirePasswords")]
        getter expire_passwords : Bool?

        # Specifies whether IAM users are prevented from setting a new password via the Amazon Web Services
        # Management Console after their password has expired. The IAM user cannot access the console until an
        # administrator resets the password. IAM users with iam:ChangePassword permission and active access
        # keys can reset their own expired console password using the CLI or API.
        @[JSON::Field(key: "HardExpiry")]
        getter hard_expiry : Bool?

        # The number of days that an IAM user password is valid.
        @[JSON::Field(key: "MaxPasswordAge")]
        getter max_password_age : Int32?

        # Minimum length to require for IAM user passwords.
        @[JSON::Field(key: "MinimumPasswordLength")]
        getter minimum_password_length : Int32?

        # Specifies the number of previous passwords that IAM users are prevented from reusing.
        @[JSON::Field(key: "PasswordReusePrevention")]
        getter password_reuse_prevention : Int32?

        # Specifies whether IAM user passwords must contain at least one lowercase character (a to z).
        @[JSON::Field(key: "RequireLowercaseCharacters")]
        getter require_lowercase_characters : Bool?

        # Specifies whether IAM user passwords must contain at least one numeric character (0 to 9).
        @[JSON::Field(key: "RequireNumbers")]
        getter require_numbers : Bool?

        # Specifies whether IAM user passwords must contain at least one of the following symbols: ! @ # $ % ^
        # &amp; * ( ) _ + - = [ ] { } | '
        @[JSON::Field(key: "RequireSymbols")]
        getter require_symbols : Bool?

        # Specifies whether IAM user passwords must contain at least one uppercase character (A to Z).
        @[JSON::Field(key: "RequireUppercaseCharacters")]
        getter require_uppercase_characters : Bool?

        def initialize(
          @allow_users_to_change_password : Bool? = nil,
          @expire_passwords : Bool? = nil,
          @hard_expiry : Bool? = nil,
          @max_password_age : Int32? = nil,
          @minimum_password_length : Int32? = nil,
          @password_reuse_prevention : Int32? = nil,
          @require_lowercase_characters : Bool? = nil,
          @require_numbers : Bool? = nil,
          @require_symbols : Bool? = nil,
          @require_uppercase_characters : Bool? = nil
        )
        end
      end

      # The request was rejected because the provided password did not meet the requirements imposed by the
      # account password policy.
      struct PasswordPolicyViolationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about the effect that a permissions boundary has on a policy simulation when
      # the boundary is applied to an IAM entity.
      struct PermissionsBoundaryDecisionDetail
        include JSON::Serializable

        # Specifies whether an action is allowed by a permissions boundary that is applied to an IAM entity
        # (user or role). A value of true means that the permissions boundary does not deny the action. This
        # means that the policy includes an Allow statement that matches the request. In this case, if an
        # identity-based policy also allows the action, the request is allowed. A value of false means that
        # either the requested action is not allowed (implicitly denied) or that the action is explicitly
        # denied by the permissions boundary. In both of these cases, the action is not allowed, regardless of
        # the identity-based policy.
        @[JSON::Field(key: "AllowedByPermissionsBoundary")]
        getter allowed_by_permissions_boundary : Bool?

        def initialize(
          @allowed_by_permissions_boundary : Bool? = nil
        )
        end
      end

      # Contains information about a managed policy. This data type is used as a response element in the
      # CreatePolicy , GetPolicy , and ListPolicies operations. For more information about managed policies,
      # refer to Managed policies and inline policies in the IAM User Guide .
      struct Policy
        include JSON::Serializable

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The number of entities (users, groups, and roles) that the policy is attached to.
        @[JSON::Field(key: "AttachmentCount")]
        getter attachment_count : Int32?

        # The date and time, in ISO 8601 date-time format , when the policy was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The identifier for the version of the policy that is set as the default version.
        @[JSON::Field(key: "DefaultVersionId")]
        getter default_version_id : String?

        # A friendly description of the policy. This element is included in the response to the GetPolicy
        # operation. It is not included in the response to the ListPolicies operation.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies whether the policy can be attached to an IAM user, group, or role.
        @[JSON::Field(key: "IsAttachable")]
        getter is_attachable : Bool?

        # The path to the policy. For more information about paths, see IAM identifiers in the IAM User Guide
        # .
        @[JSON::Field(key: "Path")]
        getter path : String?

        # The number of entities (users and roles) for which the policy is used to set the permissions
        # boundary. For more information about permissions boundaries, see Permissions boundaries for IAM
        # identities in the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundaryUsageCount")]
        getter permissions_boundary_usage_count : Int32?

        # The stable and unique string identifying the policy. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        # The friendly name (not ARN) identifying the policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # A list of tags that are attached to the instance profile. For more information about tagging, see
        # Tagging IAM resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The date and time, in ISO 8601 date-time format , when the policy was last updated. When a policy
        # has only one version, this field contains the date and time when the policy was created. When a
        # policy has more than one version, this field contains the date and time when the most recent policy
        # version was created.
        @[JSON::Field(key: "UpdateDate")]
        getter update_date : Time?

        def initialize(
          @arn : String? = nil,
          @attachment_count : Int32? = nil,
          @create_date : Time? = nil,
          @default_version_id : String? = nil,
          @description : String? = nil,
          @is_attachable : Bool? = nil,
          @path : String? = nil,
          @permissions_boundary_usage_count : Int32? = nil,
          @policy_id : String? = nil,
          @policy_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @update_date : Time? = nil
        )
        end
      end

      # Contains information about an IAM policy, including the policy document. This data type is used as a
      # response element in the GetAccountAuthorizationDetails operation.
      struct PolicyDetail
        include JSON::Serializable

        # The policy document.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String?

        # The name of the policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        def initialize(
          @policy_document : String? = nil,
          @policy_name : String? = nil
        )
        end
      end

      # The request failed because a provided policy could not be successfully evaluated. An additional
      # detailed message indicates the source of the failure.
      struct PolicyEvaluationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about the permissions policies that are attached to the specified identity (user,
      # group, or role). This data type is an element of the ListPoliciesGrantingServiceAccessEntry object.
      struct PolicyGrantingServiceAccess
        include JSON::Serializable

        # The policy name.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The policy type. For more information about these policy types, see Managed policies and inline
        # policies in the IAM User Guide .
        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # The name of the entity (user or role) to which the inline policy is attached. This field is null for
        # managed policies. For more information about these policy types, see Managed policies and inline
        # policies in the IAM User Guide .
        @[JSON::Field(key: "EntityName")]
        getter entity_name : String?

        # The type of entity (user or role) that used the policy to access the service to which the inline
        # policy is attached. This field is null for managed policies. For more information about these policy
        # types, see Managed policies and inline policies in the IAM User Guide .
        @[JSON::Field(key: "EntityType")]
        getter entity_type : String?

        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String?

        def initialize(
          @policy_name : String,
          @policy_type : String,
          @entity_name : String? = nil,
          @entity_type : String? = nil,
          @policy_arn : String? = nil
        )
        end
      end

      # Contains information about a group that a managed policy is attached to. This data type is used as a
      # response element in the ListEntitiesForPolicy operation. For more information about managed
      # policies, refer to Managed policies and inline policies in the IAM User Guide .
      struct PolicyGroup
        include JSON::Serializable

        # The stable and unique string identifying the group. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        # The name (friendly name, not ARN) identifying the group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @group_id : String? = nil,
          @group_name : String? = nil
        )
        end
      end

      # The request failed because Amazon Web Services service role policies can only be attached to the
      # service-linked role for that service.
      struct PolicyNotAttachableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about a policy parameter used to customize delegated permissions.
      struct PolicyParameter
        include JSON::Serializable

        # The name of the policy parameter.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The data type of the policy parameter value.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The allowed values for the policy parameter.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @type : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Contains information about a role that a managed policy is attached to. This data type is used as a
      # response element in the ListEntitiesForPolicy operation. For more information about managed
      # policies, refer to Managed policies and inline policies in the IAM User Guide .
      struct PolicyRole
        include JSON::Serializable

        # The stable and unique string identifying the role. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "RoleId")]
        getter role_id : String?

        # The name (friendly name, not ARN) identifying the role.
        @[JSON::Field(key: "RoleName")]
        getter role_name : String?

        def initialize(
          @role_id : String? = nil,
          @role_name : String? = nil
        )
        end
      end

      # Contains information about a user that a managed policy is attached to. This data type is used as a
      # response element in the ListEntitiesForPolicy operation. For more information about managed
      # policies, refer to Managed policies and inline policies in the IAM User Guide .
      struct PolicyUser
        include JSON::Serializable

        # The stable and unique string identifying the user. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        # The name (friendly name, not ARN) identifying the user.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @user_id : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Contains information about a version of a managed policy. This data type is used as a response
      # element in the CreatePolicyVersion , GetPolicyVersion , ListPolicyVersions , and
      # GetAccountAuthorizationDetails operations. For more information about managed policies, refer to
      # Managed policies and inline policies in the IAM User Guide .
      struct PolicyVersion
        include JSON::Serializable

        # The date and time, in ISO 8601 date-time format , when the policy version was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The policy document. The policy document is returned in the response to the GetPolicyVersion and
        # GetAccountAuthorizationDetails operations. It is not returned in the response to the
        # CreatePolicyVersion or ListPolicyVersions operations. The policy document returned in this structure
        # is URL-encoded compliant with RFC 3986 . You can use a URL decoding method to convert the policy
        # back to plain JSON text. For example, if you use Java, you can use the decode method of the
        # java.net.URLDecoder utility class in the Java SDK. Other languages and SDKs provide similar
        # functionality.
        @[JSON::Field(key: "Document")]
        getter document : String?

        # Specifies whether the policy version is set as the policy's default version.
        @[JSON::Field(key: "IsDefaultVersion")]
        getter is_default_version : Bool?

        # The identifier for the policy version. Policy version identifiers always begin with v (always
        # lowercase). When a policy is created, the first policy version is v1 .
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @create_date : Time? = nil,
          @document : String? = nil,
          @is_default_version : Bool? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Contains the row and column of a location of a Statement element in a policy document. This data
      # type is used as a member of the Statement type.
      struct Position
        include JSON::Serializable

        # The column in the line containing the specified position in the document.
        @[JSON::Field(key: "Column")]
        getter column : Int32?

        # The line containing the specified position in the document.
        @[JSON::Field(key: "Line")]
        getter line : Int32?

        def initialize(
          @column : Int32? = nil,
          @line : Int32? = nil
        )
        end
      end

      struct PutGroupPolicyRequest
        include JSON::Serializable

        # The name of the group to associate the policy with. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The policy document. You must provide policies in JSON format in IAM. However, for CloudFormation
        # templates formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation
        # always converts a YAML policy to JSON format before submitting it to IAM. The regex pattern used to
        # validate this parameter is a string of characters consisting of the following: Any printable ASCII
        # character ranging from the space character ( \u0020 ) through the end of the ASCII character range
        # The printable characters in the Basic Latin and Latin-1 Supplement character set (through \u00FF )
        # The special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The name of the policy document. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        def initialize(
          @group_name : String,
          @policy_document : String,
          @policy_name : String
        )
        end
      end

      struct PutRolePermissionsBoundaryRequest
        include JSON::Serializable

        # The ARN of the managed policy that is used to set the permissions boundary for the role. A
        # permissions boundary policy defines the maximum permissions that identity-based policies can grant
        # to an entity, but does not grant permissions. Permissions boundaries do not define the maximum
        # permissions that a resource-based policy can grant to an entity. To learn more, see Permissions
        # boundaries for IAM entities in the IAM User Guide . For more information about policy types, see
        # Policy types in the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : String

        # The name (friendly name, not ARN) of the IAM role for which you want to set the permissions
        # boundary.
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @permissions_boundary : String,
          @role_name : String
        )
        end
      end

      struct PutRolePolicyRequest
        include JSON::Serializable

        # The policy document. You must provide policies in JSON format in IAM. However, for CloudFormation
        # templates formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation
        # always converts a YAML policy to JSON format before submitting it to IAM. The regex pattern used to
        # validate this parameter is a string of characters consisting of the following: Any printable ASCII
        # character ranging from the space character ( \u0020 ) through the end of the ASCII character range
        # The printable characters in the Basic Latin and Latin-1 Supplement character set (through \u00FF )
        # The special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The name of the policy document. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The name of the role to associate the policy with. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @role_name : String
        )
        end
      end

      struct PutUserPermissionsBoundaryRequest
        include JSON::Serializable

        # The ARN of the managed policy that is used to set the permissions boundary for the user. A
        # permissions boundary policy defines the maximum permissions that identity-based policies can grant
        # to an entity, but does not grant permissions. Permissions boundaries do not define the maximum
        # permissions that a resource-based policy can grant to an entity. To learn more, see Permissions
        # boundaries for IAM entities in the IAM User Guide . For more information about policy types, see
        # Policy types in the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : String

        # The name (friendly name, not ARN) of the IAM user for which you want to set the permissions
        # boundary.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @permissions_boundary : String,
          @user_name : String
        )
        end
      end

      struct PutUserPolicyRequest
        include JSON::Serializable

        # The policy document. You must provide policies in JSON format in IAM. However, for CloudFormation
        # templates formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation
        # always converts a YAML policy to JSON format before submitting it to IAM. The regex pattern used to
        # validate this parameter is a string of characters consisting of the following: Any printable ASCII
        # character ranging from the space character ( \u0020 ) through the end of the ASCII character range
        # The printable characters in the Basic Latin and Latin-1 Supplement character set (through \u00FF )
        # The special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The name of the policy document. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The name of the user to associate the policy with. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @user_name : String
        )
        end
      end

      struct RejectDelegationRequestRequest
        include JSON::Serializable

        # The unique identifier of the delegation request to reject.
        @[JSON::Field(key: "DelegationRequestId")]
        getter delegation_request_id : String

        # Optional notes explaining the reason for rejecting the delegation request.
        @[JSON::Field(key: "Notes")]
        getter notes : String?

        def initialize(
          @delegation_request_id : String,
          @notes : String? = nil
        )
        end
      end

      struct RemoveClientIDFromOpenIDConnectProviderRequest
        include JSON::Serializable

        # The client ID (also known as audience) to remove from the IAM OIDC provider resource. For more
        # information about client IDs, see CreateOpenIDConnectProvider .
        @[JSON::Field(key: "ClientID")]
        getter client_id : String

        # The Amazon Resource Name (ARN) of the IAM OIDC provider resource to remove the client ID from. You
        # can get a list of OIDC provider ARNs by using the ListOpenIDConnectProviders operation. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "OpenIDConnectProviderArn")]
        getter open_id_connect_provider_arn : String

        def initialize(
          @client_id : String,
          @open_id_connect_provider_arn : String
        )
        end
      end

      struct RemoveRoleFromInstanceProfileRequest
        include JSON::Serializable

        # The name of the instance profile to update. This parameter allows (through its regex pattern ) a
        # string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You
        # can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String

        # The name of the role to remove. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @instance_profile_name : String,
          @role_name : String
        )
        end
      end

      struct RemoveUserFromGroupRequest
        include JSON::Serializable

        # The name of the group to update. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The name of the user to remove. This parameter allows (through its regex pattern ) a string of
        # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @group_name : String,
          @user_name : String
        )
        end
      end

      # The request failed because the maximum number of concurrent requests for this account are already
      # running.
      struct ReportGenerationLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ResetServiceSpecificCredentialRequest
        include JSON::Serializable

        # The unique identifier of the service-specific credential. This parameter allows (through its regex
        # pattern ) a string of characters that can consist of any upper or lowercased letter or digit.
        @[JSON::Field(key: "ServiceSpecificCredentialId")]
        getter service_specific_credential_id : String

        # The name of the IAM user associated with the service-specific credential. If this value is not
        # specified, then the operation assumes the user whose credentials are used to call the operation.
        # This parameter allows (through its regex pattern ) a string of characters consisting of upper and
        # lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @service_specific_credential_id : String,
          @user_name : String? = nil
        )
        end
      end

      struct ResetServiceSpecificCredentialResponse
        include JSON::Serializable

        # A structure with details about the updated service-specific credential, including the new password.
        # This is the only time that you can access the password. You cannot recover the password later, but
        # you can reset it again.
        @[JSON::Field(key: "ServiceSpecificCredential")]
        getter service_specific_credential : Types::ServiceSpecificCredential?

        def initialize(
          @service_specific_credential : Types::ServiceSpecificCredential? = nil
        )
        end
      end

      # Contains the result of the simulation of a single API operation call on a single resource. This data
      # type is used by a member of the EvaluationResult data type.
      struct ResourceSpecificResult
        include JSON::Serializable

        # The result of the simulation of the simulated API operation on the resource specified in
        # EvalResourceName .
        @[JSON::Field(key: "EvalResourceDecision")]
        getter eval_resource_decision : String

        # The name of the simulated resource, in Amazon Resource Name (ARN) format.
        @[JSON::Field(key: "EvalResourceName")]
        getter eval_resource_name : String

        # Additional details about the results of the evaluation decision on a single resource. This parameter
        # is returned only for cross-account simulations. This parameter explains how each policy type
        # contributes to the resource-specific evaluation decision.
        @[JSON::Field(key: "EvalDecisionDetails")]
        getter eval_decision_details : Hash(String, String)?

        # A list of the statements in the input policies that determine the result for this part of the
        # simulation. Remember that even if multiple statements allow the operation on the resource, if any
        # statement denies that operation, then the explicit deny overrides any allow. In addition, the deny
        # statement is the only entry included in the result.
        @[JSON::Field(key: "MatchedStatements")]
        getter matched_statements : Array(Types::Statement)?

        # A list of context keys that are required by the included input policies but that were not provided
        # by one of the input parameters. This list is used when a list of ARNs is included in the
        # ResourceArns parameter instead of "*". If you do not specify individual resources, by setting
        # ResourceArns to "*" or by not including the ResourceArns parameter, then any missing context values
        # are instead included under the EvaluationResults section. To discover the context keys used by a set
        # of policies, you can call GetContextKeysForCustomPolicy or GetContextKeysForPrincipalPolicy .
        @[JSON::Field(key: "MissingContextValues")]
        getter missing_context_values : Array(String)?

        # Contains information about the effect that a permissions boundary has on a policy simulation when
        # that boundary is applied to an IAM entity.
        @[JSON::Field(key: "PermissionsBoundaryDecisionDetail")]
        getter permissions_boundary_decision_detail : Types::PermissionsBoundaryDecisionDetail?

        def initialize(
          @eval_resource_decision : String,
          @eval_resource_name : String,
          @eval_decision_details : Hash(String, String)? = nil,
          @matched_statements : Array(Types::Statement)? = nil,
          @missing_context_values : Array(String)? = nil,
          @permissions_boundary_decision_detail : Types::PermissionsBoundaryDecisionDetail? = nil
        )
        end
      end

      struct ResyncMFADeviceRequest
        include JSON::Serializable

        # An authentication code emitted by the device. The format for this parameter is a sequence of six
        # digits.
        @[JSON::Field(key: "AuthenticationCode1")]
        getter authentication_code1 : String

        # A subsequent authentication code emitted by the device. The format for this parameter is a sequence
        # of six digits.
        @[JSON::Field(key: "AuthenticationCode2")]
        getter authentication_code2 : String

        # Serial number that uniquely identifies the MFA device. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # The name of the user whose MFA device you want to resynchronize. This parameter allows (through its
        # regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @authentication_code1 : String,
          @authentication_code2 : String,
          @serial_number : String,
          @user_name : String
        )
        end
      end

      # Contains information about an IAM role. This structure is returned as a response element in several
      # API operations that interact with roles.
      struct Role
        include JSON::Serializable

        # The Amazon Resource Name (ARN) specifying the role. For more information about ARNs and how to use
        # them in policies, see IAM identifiers in the IAM User Guide guide.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time, in ISO 8601 date-time format , when the role was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time

        # The path to the role. For more information about paths, see IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "Path")]
        getter path : String

        # The stable and unique string identifying the role. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "RoleId")]
        getter role_id : String

        # The friendly name that identifies the role.
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        # The policy that grants an entity permission to assume the role.
        @[JSON::Field(key: "AssumeRolePolicyDocument")]
        getter assume_role_policy_document : String?

        # A description of the role that you provide.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The maximum session duration (in seconds) for the specified role. Anyone who uses the CLI, or API to
        # assume the role can specify the duration using the optional DurationSeconds API parameter or
        # duration-seconds CLI parameter.
        @[JSON::Field(key: "MaxSessionDuration")]
        getter max_session_duration : Int32?

        # The ARN of the policy used to set the permissions boundary for the role. For more information about
        # permissions boundaries, see Permissions boundaries for IAM identities in the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : Types::AttachedPermissionsBoundary?

        # Contains information about the last time that an IAM role was used. This includes the date and time
        # and the Region in which the role was last used. Activity is only reported for the trailing 400 days.
        # This period can be shorter if your Region began supporting these features within the last year. The
        # role might have been used more than 400 days ago. For more information, see Regions where data is
        # tracked in the IAM user Guide .
        @[JSON::Field(key: "RoleLastUsed")]
        getter role_last_used : Types::RoleLastUsed?

        # A list of tags that are attached to the role. For more information about tagging, see Tagging IAM
        # resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String,
          @create_date : Time,
          @path : String,
          @role_id : String,
          @role_name : String,
          @assume_role_policy_document : String? = nil,
          @description : String? = nil,
          @max_session_duration : Int32? = nil,
          @permissions_boundary : Types::AttachedPermissionsBoundary? = nil,
          @role_last_used : Types::RoleLastUsed? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains information about an IAM role, including all of the role's policies. This data type is used
      # as a response element in the GetAccountAuthorizationDetails operation.
      struct RoleDetail
        include JSON::Serializable

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The trust policy that grants permission to assume the role.
        @[JSON::Field(key: "AssumeRolePolicyDocument")]
        getter assume_role_policy_document : String?

        # A list of managed policies attached to the role. These policies are the role's access (permissions)
        # policies.
        @[JSON::Field(key: "AttachedManagedPolicies")]
        getter attached_managed_policies : Array(Types::AttachedPolicy)?

        # The date and time, in ISO 8601 date-time format , when the role was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # A list of instance profiles that contain this role.
        @[JSON::Field(key: "InstanceProfileList")]
        getter instance_profile_list : Array(Types::InstanceProfile)?

        # The path to the role. For more information about paths, see IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "Path")]
        getter path : String?

        # The ARN of the policy used to set the permissions boundary for the role. For more information about
        # permissions boundaries, see Permissions boundaries for IAM identities in the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : Types::AttachedPermissionsBoundary?

        # The stable and unique string identifying the role. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "RoleId")]
        getter role_id : String?

        # Contains information about the last time that an IAM role was used. This includes the date and time
        # and the Region in which the role was last used. Activity is only reported for the trailing 400 days.
        # This period can be shorter if your Region began supporting these features within the last year. The
        # role might have been used more than 400 days ago. For more information, see Regions where data is
        # tracked in the IAM User Guide .
        @[JSON::Field(key: "RoleLastUsed")]
        getter role_last_used : Types::RoleLastUsed?

        # The friendly name that identifies the role.
        @[JSON::Field(key: "RoleName")]
        getter role_name : String?

        # A list of inline policies embedded in the role. These policies are the role's access (permissions)
        # policies.
        @[JSON::Field(key: "RolePolicyList")]
        getter role_policy_list : Array(Types::PolicyDetail)?

        # A list of tags that are attached to the role. For more information about tagging, see Tagging IAM
        # resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @assume_role_policy_document : String? = nil,
          @attached_managed_policies : Array(Types::AttachedPolicy)? = nil,
          @create_date : Time? = nil,
          @instance_profile_list : Array(Types::InstanceProfile)? = nil,
          @path : String? = nil,
          @permissions_boundary : Types::AttachedPermissionsBoundary? = nil,
          @role_id : String? = nil,
          @role_last_used : Types::RoleLastUsed? = nil,
          @role_name : String? = nil,
          @role_policy_list : Array(Types::PolicyDetail)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains information about the last time that an IAM role was used. This includes the date and time
      # and the Region in which the role was last used. Activity is only reported for the trailing 400 days.
      # This period can be shorter if your Region began supporting these features within the last year. The
      # role might have been used more than 400 days ago. For more information, see Regions where data is
      # tracked in the IAM user Guide . This data type is returned as a response element in the GetRole and
      # GetAccountAuthorizationDetails operations.
      struct RoleLastUsed
        include JSON::Serializable

        # The date and time, in ISO 8601 date-time format that the role was last used. This field is null if
        # the role has not been used within the IAM tracking period. For more information about the tracking
        # period, see Regions where data is tracked in the IAM User Guide .
        @[JSON::Field(key: "LastUsedDate")]
        getter last_used_date : Time?

        # The name of the Amazon Web Services Region in which the role was last used.
        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @last_used_date : Time? = nil,
          @region : String? = nil
        )
        end
      end

      # An object that contains details about how a service-linked role is used, if that information is
      # returned by the service. This data type is used as a response element in the
      # GetServiceLinkedRoleDeletionStatus operation.
      struct RoleUsageType
        include JSON::Serializable

        # The name of the Region where the service-linked role is being used.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # The name of the resource that is using the service-linked role.
        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        def initialize(
          @region : String? = nil,
          @resources : Array(String)? = nil
        )
        end
      end

      # Contains the private keys for the SAML provider. This data type is used as a response element in the
      # GetSAMLProvider operation.
      struct SAMLPrivateKey
        include JSON::Serializable

        # The unique identifier for the SAML private key.
        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        # The date and time, in ISO 8601 date-time format, when the private key was uploaded.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        def initialize(
          @key_id : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Contains the list of SAML providers for this account.
      struct SAMLProviderListEntry
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SAML provider.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time when the SAML provider was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # The expiration date and time for the SAML provider.
        @[JSON::Field(key: "ValidUntil")]
        getter valid_until : Time?

        def initialize(
          @arn : String? = nil,
          @create_date : Time? = nil,
          @valid_until : Time? = nil
        )
        end
      end

      # Contains information about an SSH public key. This data type is used as a response element in the
      # GetSSHPublicKey and UploadSSHPublicKey operations.
      struct SSHPublicKey
        include JSON::Serializable

        # The MD5 message digest of the SSH public key.
        @[JSON::Field(key: "Fingerprint")]
        getter fingerprint : String

        # The SSH public key.
        @[JSON::Field(key: "SSHPublicKeyBody")]
        getter ssh_public_key_body : String

        # The unique identifier for the SSH public key.
        @[JSON::Field(key: "SSHPublicKeyId")]
        getter ssh_public_key_id : String

        # The status of the SSH public key. Active means that the key can be used for authentication with an
        # CodeCommit repository. Inactive means that the key cannot be used.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the IAM user associated with the SSH public key.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The date and time, in ISO 8601 date-time format , when the SSH public key was uploaded.
        @[JSON::Field(key: "UploadDate")]
        getter upload_date : Time?

        def initialize(
          @fingerprint : String,
          @ssh_public_key_body : String,
          @ssh_public_key_id : String,
          @status : String,
          @user_name : String,
          @upload_date : Time? = nil
        )
        end
      end

      # Contains information about an SSH public key, without the key's body or fingerprint. This data type
      # is used as a response element in the ListSSHPublicKeys operation.
      struct SSHPublicKeyMetadata
        include JSON::Serializable

        # The unique identifier for the SSH public key.
        @[JSON::Field(key: "SSHPublicKeyId")]
        getter ssh_public_key_id : String

        # The status of the SSH public key. Active means that the key can be used for authentication with an
        # CodeCommit repository. Inactive means that the key cannot be used.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The date and time, in ISO 8601 date-time format , when the SSH public key was uploaded.
        @[JSON::Field(key: "UploadDate")]
        getter upload_date : Time

        # The name of the IAM user associated with the SSH public key.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @ssh_public_key_id : String,
          @status : String,
          @upload_date : Time,
          @user_name : String
        )
        end
      end

      struct SendDelegationTokenRequest
        include JSON::Serializable

        # The unique identifier of the delegation request for which to send the token.
        @[JSON::Field(key: "DelegationRequestId")]
        getter delegation_request_id : String

        def initialize(
          @delegation_request_id : String
        )
        end
      end

      # Contains information about a server certificate. This data type is used as a response element in the
      # GetServerCertificate operation.
      struct ServerCertificate
        include JSON::Serializable

        # The contents of the public key certificate.
        @[JSON::Field(key: "CertificateBody")]
        getter certificate_body : String

        # The meta information of the server certificate, such as its name, path, ID, and ARN.
        @[JSON::Field(key: "ServerCertificateMetadata")]
        getter server_certificate_metadata : Types::ServerCertificateMetadata

        # The contents of the public key certificate chain.
        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : String?

        # A list of tags that are attached to the server certificate. For more information about tagging, see
        # Tagging IAM resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @certificate_body : String,
          @server_certificate_metadata : Types::ServerCertificateMetadata,
          @certificate_chain : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains information about a server certificate without its certificate body, certificate chain, and
      # private key. This data type is used as a response element in the UploadServerCertificate and
      # ListServerCertificates operations.
      struct ServerCertificateMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) specifying the server certificate. For more information about ARNs
        # and how to use them in policies, see IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The path to the server certificate. For more information about paths, see IAM identifiers in the IAM
        # User Guide .
        @[JSON::Field(key: "Path")]
        getter path : String

        # The stable and unique string identifying the server certificate. For more information about IDs, see
        # IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "ServerCertificateId")]
        getter server_certificate_id : String

        # The name that identifies the server certificate.
        @[JSON::Field(key: "ServerCertificateName")]
        getter server_certificate_name : String

        # The date on which the certificate is set to expire.
        @[JSON::Field(key: "Expiration")]
        getter expiration : Time?

        # The date when the server certificate was uploaded.
        @[JSON::Field(key: "UploadDate")]
        getter upload_date : Time?

        def initialize(
          @arn : String,
          @path : String,
          @server_certificate_id : String,
          @server_certificate_name : String,
          @expiration : Time? = nil,
          @upload_date : Time? = nil
        )
        end
      end

      # The request was rejected because trusted access is not enabled for IAM in Organizations. For
      # details, see IAM and Organizations in the Organizations User Guide .
      struct ServiceAccessNotEnabledException
        include JSON::Serializable

        def initialize
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct ServiceFailureException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about the most recent attempt to access the service. This data type is used as a
      # response element in the GetServiceLastAccessedDetails operation.
      struct ServiceLastAccessed
        include JSON::Serializable

        # The name of the service in which access was attempted.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The namespace of the service in which access was attempted. To learn the service namespace of a
        # service, see Actions, resources, and condition keys for Amazon Web Services services in the Service
        # Authorization Reference . Choose the name of the service to view details for that service. In the
        # first paragraph, find the service prefix. For example, (service prefix: a4b) . For more information
        # about service namespaces, see Amazon Web Services Service Namespaces in the Amazon Web Services
        # General Reference .
        @[JSON::Field(key: "ServiceNamespace")]
        getter service_namespace : String

        # The date and time, in ISO 8601 date-time format , when an authenticated entity most recently
        # attempted to access the service. Amazon Web Services does not report unauthenticated requests. This
        # field is null if no IAM entities attempted to access the service within the tracking period .
        @[JSON::Field(key: "LastAuthenticated")]
        getter last_authenticated : Time?

        # The ARN of the authenticated entity (user or role) that last attempted to access the service. Amazon
        # Web Services does not report unauthenticated requests. This field is null if no IAM entities
        # attempted to access the service within the tracking period .
        @[JSON::Field(key: "LastAuthenticatedEntity")]
        getter last_authenticated_entity : String?

        # The Region from which the authenticated entity (user or role) last attempted to access the service.
        # Amazon Web Services does not report unauthenticated requests. This field is null if no IAM entities
        # attempted to access the service within the tracking period .
        @[JSON::Field(key: "LastAuthenticatedRegion")]
        getter last_authenticated_region : String?

        # The total number of authenticated principals (root user, IAM users, or IAM roles) that have
        # attempted to access the service. This field is null if no principals attempted to access the service
        # within the tracking period .
        @[JSON::Field(key: "TotalAuthenticatedEntities")]
        getter total_authenticated_entities : Int32?

        # An object that contains details about the most recent attempt to access a tracked action within the
        # service. This field is null if there no tracked actions or if the principal did not use the tracked
        # actions within the tracking period . This field is also null if the report was generated at the
        # service level and not the action level. For more information, see the Granularity field in
        # GenerateServiceLastAccessedDetails .
        @[JSON::Field(key: "TrackedActionsLastAccessed")]
        getter tracked_actions_last_accessed : Array(Types::TrackedActionLastAccessed)?

        def initialize(
          @service_name : String,
          @service_namespace : String,
          @last_authenticated : Time? = nil,
          @last_authenticated_entity : String? = nil,
          @last_authenticated_region : String? = nil,
          @total_authenticated_entities : Int32? = nil,
          @tracked_actions_last_accessed : Array(Types::TrackedActionLastAccessed)? = nil
        )
        end
      end

      # The specified service does not support service-specific credentials.
      struct ServiceNotSupportedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the details of a service-specific credential.
      struct ServiceSpecificCredential
        include JSON::Serializable

        # The date and time, in ISO 8601 date-time format , when the service-specific credential were created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time

        # The name of the service associated with the service-specific credential.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The unique identifier for the service-specific credential.
        @[JSON::Field(key: "ServiceSpecificCredentialId")]
        getter service_specific_credential_id : String

        # The status of the service-specific credential. Active means that the key is valid for API calls,
        # while Inactive means it is not.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the IAM user associated with the service-specific credential.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The date and time when the service specific credential expires. This field is only present for
        # Bedrock API keys that were created with an expiration period.
        @[JSON::Field(key: "ExpirationDate")]
        getter expiration_date : Time?

        # For Bedrock API keys, this is the public portion of the credential that includes the IAM user name
        # and a suffix containing version and creation information.
        @[JSON::Field(key: "ServiceCredentialAlias")]
        getter service_credential_alias : String?

        # For Bedrock API keys, this is the secret portion of the credential that should be used to
        # authenticate API calls. This value is returned only when the credential is created.
        @[JSON::Field(key: "ServiceCredentialSecret")]
        getter service_credential_secret : String?

        # The generated password for the service-specific credential.
        @[JSON::Field(key: "ServicePassword")]
        getter service_password : String?

        # The generated user name for the service-specific credential. This value is generated by combining
        # the IAM user's name combined with the ID number of the Amazon Web Services account, as in
        # jane-at-123456789012 , for example. This value cannot be configured by the user.
        @[JSON::Field(key: "ServiceUserName")]
        getter service_user_name : String?

        def initialize(
          @create_date : Time,
          @service_name : String,
          @service_specific_credential_id : String,
          @status : String,
          @user_name : String,
          @expiration_date : Time? = nil,
          @service_credential_alias : String? = nil,
          @service_credential_secret : String? = nil,
          @service_password : String? = nil,
          @service_user_name : String? = nil
        )
        end
      end

      # Contains additional details about a service-specific credential.
      struct ServiceSpecificCredentialMetadata
        include JSON::Serializable

        # The date and time, in ISO 8601 date-time format , when the service-specific credential were created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time

        # The name of the service associated with the service-specific credential.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The unique identifier for the service-specific credential.
        @[JSON::Field(key: "ServiceSpecificCredentialId")]
        getter service_specific_credential_id : String

        # The status of the service-specific credential. Active means that the key is valid for API calls,
        # while Inactive means it is not.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the IAM user associated with the service-specific credential.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The date and time when the service specific credential expires. This field is only present for
        # Bedrock API keys that were created with an expiration period.
        @[JSON::Field(key: "ExpirationDate")]
        getter expiration_date : Time?

        # For Bedrock API keys, this is the public portion of the credential that includes the IAM user name
        # and a suffix containing version and creation information.
        @[JSON::Field(key: "ServiceCredentialAlias")]
        getter service_credential_alias : String?

        # The generated user name for the service-specific credential.
        @[JSON::Field(key: "ServiceUserName")]
        getter service_user_name : String?

        def initialize(
          @create_date : Time,
          @service_name : String,
          @service_specific_credential_id : String,
          @status : String,
          @user_name : String,
          @expiration_date : Time? = nil,
          @service_credential_alias : String? = nil,
          @service_user_name : String? = nil
        )
        end
      end

      struct SetDefaultPolicyVersionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM policy whose default version you want to set. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The version of the policy to set as the default (operative) version. For more information about
        # managed policy versions, see Versioning for managed policies in the IAM User Guide .
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        def initialize(
          @policy_arn : String,
          @version_id : String
        )
        end
      end

      struct SetSecurityTokenServicePreferencesRequest
        include JSON::Serializable

        # The version of the global endpoint token. Version 1 tokens are valid only in Amazon Web Services
        # Regions that are available by default. These tokens do not work in manually enabled Regions, such as
        # Asia Pacific (Hong Kong). Version 2 tokens are valid in all Regions. However, version 2 tokens are
        # longer and might affect systems where you temporarily store tokens. For information, see Activating
        # and deactivating STS in an Amazon Web Services Region in the IAM User Guide .
        @[JSON::Field(key: "GlobalEndpointTokenVersion")]
        getter global_endpoint_token_version : String

        def initialize(
          @global_endpoint_token_version : String
        )
        end
      end

      # Contains information about an X.509 signing certificate. This data type is used as a response
      # element in the UploadSigningCertificate and ListSigningCertificates operations.
      struct SigningCertificate
        include JSON::Serializable

        # The contents of the signing certificate.
        @[JSON::Field(key: "CertificateBody")]
        getter certificate_body : String

        # The ID for the signing certificate.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        # The status of the signing certificate. Active means that the key is valid for API calls, while
        # Inactive means it is not.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the user the signing certificate is associated with.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The date when the signing certificate was uploaded.
        @[JSON::Field(key: "UploadDate")]
        getter upload_date : Time?

        def initialize(
          @certificate_body : String,
          @certificate_id : String,
          @status : String,
          @user_name : String,
          @upload_date : Time? = nil
        )
        end
      end

      struct SimulateCustomPolicyRequest
        include JSON::Serializable

        # A list of names of API operations to evaluate in the simulation. Each operation is evaluated against
        # each resource. Each operation must include the service identifier, such as iam:CreateUser . This
        # operation does not support using wildcards (*) in an action name.
        @[JSON::Field(key: "ActionNames")]
        getter action_names : Array(String)

        # A list of policy documents to include in the simulation. Each document is specified as a string
        # containing the complete, valid JSON text of an IAM policy. Do not include any resource-based
        # policies in this parameter. Any resource-based policy must be submitted with the ResourcePolicy
        # parameter. The policies cannot be "scope-down" policies, such as you could include in a call to
        # GetFederationToken or one of the AssumeRole API operations. In other words, do not use policies
        # designed to restrict what a user can do while using the temporary credentials. The maximum length of
        # the policy document that you can pass in this operation, including whitespace, is listed below. To
        # view the maximum character counts of a managed policy with no whitespaces, see IAM and STS character
        # quotas . The regex pattern used to validate this parameter is a string of characters consisting of
        # the following: Any printable ASCII character ranging from the space character ( \u0020 ) through the
        # end of the ASCII character range The printable characters in the Basic Latin and Latin-1 Supplement
        # character set (through \u00FF ) The special characters tab ( \u0009 ), line feed ( \u000A ), and
        # carriage return ( \u000D )
        @[JSON::Field(key: "PolicyInputList")]
        getter policy_input_list : Array(String)

        # The ARN of the IAM user that you want to use as the simulated caller of the API operations.
        # CallerArn is required if you include a ResourcePolicy so that the policy's Principal element has a
        # value to use in evaluating the policy. You can specify only the ARN of an IAM user. You cannot
        # specify the ARN of an assumed role, federated user, or a service principal.
        @[JSON::Field(key: "CallerArn")]
        getter caller_arn : String?

        # A list of context keys and corresponding values for the simulation to use. Whenever a context key is
        # evaluated in one of the simulated IAM permissions policies, the corresponding value is supplied.
        @[JSON::Field(key: "ContextEntries")]
        getter context_entries : Array(Types::ContextEntry)?

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The IAM permissions boundary policy to simulate. The permissions boundary sets the maximum
        # permissions that an IAM entity can have. You can input only one permissions boundary when you pass a
        # policy to this operation. For more information about permissions boundaries, see Permissions
        # boundaries for IAM entities in the IAM User Guide . The policy input is specified as a string that
        # contains the complete, valid JSON text of a permissions boundary policy. The maximum length of the
        # policy document that you can pass in this operation, including whitespace, is listed below. To view
        # the maximum character counts of a managed policy with no whitespaces, see IAM and STS character
        # quotas . The regex pattern used to validate this parameter is a string of characters consisting of
        # the following: Any printable ASCII character ranging from the space character ( \u0020 ) through the
        # end of the ASCII character range The printable characters in the Basic Latin and Latin-1 Supplement
        # character set (through \u00FF ) The special characters tab ( \u0009 ), line feed ( \u000A ), and
        # carriage return ( \u000D )
        @[JSON::Field(key: "PermissionsBoundaryPolicyInputList")]
        getter permissions_boundary_policy_input_list : Array(String)?

        # A list of ARNs of Amazon Web Services resources to include in the simulation. If this parameter is
        # not provided, then the value defaults to * (all resources). Each API in the ActionNames parameter is
        # evaluated for each resource in this list. The simulation determines the access result (allowed or
        # denied) of each combination and reports it in the response. You can simulate resources that don't
        # exist in your account. The simulation does not automatically retrieve policies for the specified
        # resources. If you want to include a resource policy in the simulation, then you must include the
        # policy as a string in the ResourcePolicy parameter. If you include a ResourcePolicy , then it must
        # be applicable to all of the resources included in the simulation or you receive an invalid input
        # error. For more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services
        # General Reference . Simulation of resource-based policies isn't supported for IAM roles.
        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)?

        # Specifies the type of simulation to run. Different API operations that support resource-based
        # policies require different combinations of resources. By specifying the type of simulation to run,
        # you enable the policy simulator to enforce the presence of the required resources to ensure reliable
        # simulation results. If your simulation does not match one of the following scenarios, then you can
        # omit this parameter. The following list shows each of the supported scenario values and the
        # resources that you must define to run the simulation. Each of the Amazon EC2 scenarios requires that
        # you specify instance, image, and security group resources. If your scenario includes an EBS volume,
        # then you must specify that volume as a resource. If the Amazon EC2 scenario includes VPC, then you
        # must supply the network interface resource. If it includes an IP subnet, then you must specify the
        # subnet resource. For more information on the Amazon EC2 scenario options, see Supported platforms in
        # the Amazon EC2 User Guide . EC2-VPC-InstanceStore instance, image, security group, network interface
        # EC2-VPC-InstanceStore-Subnet instance, image, security group, network interface, subnet EC2-VPC-EBS
        # instance, image, security group, network interface, volume EC2-VPC-EBS-Subnet instance, image,
        # security group, network interface, subnet, volume
        @[JSON::Field(key: "ResourceHandlingOption")]
        getter resource_handling_option : String?

        # An ARN representing the Amazon Web Services account ID that specifies the owner of any simulated
        # resource that does not identify its owner in the resource ARN. Examples of resource ARNs include an
        # S3 bucket or object. If ResourceOwner is specified, it is also used as the account owner of any
        # ResourcePolicy included in the simulation. If the ResourceOwner parameter is not specified, then the
        # owner of the resources and the resource policy defaults to the account of the identity provided in
        # CallerArn . This parameter is required only if you specify a resource-based policy and account that
        # owns the resource is different from the account that owns the simulated calling user CallerArn . The
        # ARN for an account uses the following syntax: arn:aws:iam:: AWS-account-ID :root . For example, to
        # represent the account with the 112233445566 ID, use the following ARN:
        # arn:aws:iam::112233445566-ID:root .
        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # A resource-based policy to include in the simulation provided as a string. Each resource in the
        # simulation is treated as if it had this policy attached. You can include only one resource-based
        # policy in a simulation. The maximum length of the policy document that you can pass in this
        # operation, including whitespace, is listed below. To view the maximum character counts of a managed
        # policy with no whitespaces, see IAM and STS character quotas . The regex pattern used to validate
        # this parameter is a string of characters consisting of the following: Any printable ASCII character
        # ranging from the space character ( \u0020 ) through the end of the ASCII character range The
        # printable characters in the Basic Latin and Latin-1 Supplement character set (through \u00FF ) The
        # special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D ) Simulation
        # of resource-based policies isn't supported for IAM roles.
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String?

        def initialize(
          @action_names : Array(String),
          @policy_input_list : Array(String),
          @caller_arn : String? = nil,
          @context_entries : Array(Types::ContextEntry)? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @permissions_boundary_policy_input_list : Array(String)? = nil,
          @resource_arns : Array(String)? = nil,
          @resource_handling_option : String? = nil,
          @resource_owner : String? = nil,
          @resource_policy : String? = nil
        )
        end
      end

      # Contains the response to a successful SimulatePrincipalPolicy or SimulateCustomPolicy request.
      struct SimulatePolicyResponse
        include JSON::Serializable

        # The results of the simulation.
        @[JSON::Field(key: "EvaluationResults")]
        getter evaluation_results : Array(Types::EvaluationResult)?

        # A flag that indicates whether there are more items to return. If your results were truncated, you
        # can make a subsequent pagination request using the Marker request parameter to retrieve more items.
        # Note that IAM might return fewer than the MaxItems number of results even when there are more
        # results available. We recommend that you check IsTruncated after every call to ensure that you
        # receive all your results.
        @[JSON::Field(key: "IsTruncated")]
        getter is_truncated : Bool?

        # When IsTruncated is true , this element is present and contains the value to use for the Marker
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @evaluation_results : Array(Types::EvaluationResult)? = nil,
          @is_truncated : Bool? = nil,
          @marker : String? = nil
        )
        end
      end

      struct SimulatePrincipalPolicyRequest
        include JSON::Serializable

        # A list of names of API operations to evaluate in the simulation. Each operation is evaluated for
        # each resource. Each operation must include the service identifier, such as iam:CreateUser .
        @[JSON::Field(key: "ActionNames")]
        getter action_names : Array(String)

        # The Amazon Resource Name (ARN) of a user, group, or role whose policies you want to include in the
        # simulation. If you specify a user, group, or role, the simulation includes all policies that are
        # associated with that entity. If you specify a user, the simulation also includes all policies that
        # are attached to any groups the user belongs to. The maximum length of the policy document that you
        # can pass in this operation, including whitespace, is listed below. To view the maximum character
        # counts of a managed policy with no whitespaces, see IAM and STS character quotas . For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "PolicySourceArn")]
        getter policy_source_arn : String

        # The ARN of the IAM user that you want to specify as the simulated caller of the API operations. If
        # you do not specify a CallerArn , it defaults to the ARN of the user that you specify in
        # PolicySourceArn , if you specified a user. If you include both a PolicySourceArn (for example,
        # arn:aws:iam::123456789012:user/David ) and a CallerArn (for example,
        # arn:aws:iam::123456789012:user/Bob ), the result is that you simulate calling the API operations as
        # Bob, as if Bob had David's policies. You can specify only the ARN of an IAM user. You cannot specify
        # the ARN of an assumed role, federated user, or a service principal. CallerArn is required if you
        # include a ResourcePolicy and the PolicySourceArn is not the ARN for an IAM user. This is required so
        # that the resource-based policy's Principal element has a value to use in evaluating the policy. For
        # more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .
        @[JSON::Field(key: "CallerArn")]
        getter caller_arn : String?

        # A list of context keys and corresponding values for the simulation to use. Whenever a context key is
        # evaluated in one of the simulated IAM permissions policies, the corresponding value is supplied.
        @[JSON::Field(key: "ContextEntries")]
        getter context_entries : Array(Types::ContextEntry)?

        # Use this parameter only when paginating results and only after you receive a response indicating
        # that the results are truncated. Set it to the value of the Marker element in the response that you
        # received to indicate where the next call should start.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Use this only when paginating results to indicate the maximum number of items you want in the
        # response. If additional items exist beyond the maximum you specify, the IsTruncated response element
        # is true . If you do not include this parameter, the number of items defaults to 100. Note that IAM
        # might return fewer results, even when there are more results available. In that case, the
        # IsTruncated response element returns true , and Marker contains a value to include in the subsequent
        # call that tells the service where to continue from.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The IAM permissions boundary policy to simulate. The permissions boundary sets the maximum
        # permissions that the entity can have. You can input only one permissions boundary when you pass a
        # policy to this operation. An IAM entity can only have one permissions boundary in effect at a time.
        # For example, if a permissions boundary is attached to an entity and you pass in a different
        # permissions boundary policy using this parameter, then the new permissions boundary policy is used
        # for the simulation. For more information about permissions boundaries, see Permissions boundaries
        # for IAM entities in the IAM User Guide . The policy input is specified as a string containing the
        # complete, valid JSON text of a permissions boundary policy. The maximum length of the policy
        # document that you can pass in this operation, including whitespace, is listed below. To view the
        # maximum character counts of a managed policy with no whitespaces, see IAM and STS character quotas .
        # The regex pattern used to validate this parameter is a string of characters consisting of the
        # following: Any printable ASCII character ranging from the space character ( \u0020 ) through the end
        # of the ASCII character range The printable characters in the Basic Latin and Latin-1 Supplement
        # character set (through \u00FF ) The special characters tab ( \u0009 ), line feed ( \u000A ), and
        # carriage return ( \u000D )
        @[JSON::Field(key: "PermissionsBoundaryPolicyInputList")]
        getter permissions_boundary_policy_input_list : Array(String)?

        # An optional list of additional policy documents to include in the simulation. Each document is
        # specified as a string containing the complete, valid JSON text of an IAM policy. The regex pattern
        # used to validate this parameter is a string of characters consisting of the following: Any printable
        # ASCII character ranging from the space character ( \u0020 ) through the end of the ASCII character
        # range The printable characters in the Basic Latin and Latin-1 Supplement character set (through
        # \u00FF ) The special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "PolicyInputList")]
        getter policy_input_list : Array(String)?

        # A list of ARNs of Amazon Web Services resources to include in the simulation. If this parameter is
        # not provided, then the value defaults to * (all resources). Each API in the ActionNames parameter is
        # evaluated for each resource in this list. The simulation determines the access result (allowed or
        # denied) of each combination and reports it in the response. You can simulate resources that don't
        # exist in your account. The simulation does not automatically retrieve policies for the specified
        # resources. If you want to include a resource policy in the simulation, then you must include the
        # policy as a string in the ResourcePolicy parameter. For more information about ARNs, see Amazon
        # Resource Names (ARNs) in the Amazon Web Services General Reference . Simulation of resource-based
        # policies isn't supported for IAM roles.
        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)?

        # Specifies the type of simulation to run. Different API operations that support resource-based
        # policies require different combinations of resources. By specifying the type of simulation to run,
        # you enable the policy simulator to enforce the presence of the required resources to ensure reliable
        # simulation results. If your simulation does not match one of the following scenarios, then you can
        # omit this parameter. The following list shows each of the supported scenario values and the
        # resources that you must define to run the simulation. Each of the Amazon EC2 scenarios requires that
        # you specify instance, image, and security group resources. If your scenario includes an EBS volume,
        # then you must specify that volume as a resource. If the Amazon EC2 scenario includes VPC, then you
        # must supply the network interface resource. If it includes an IP subnet, then you must specify the
        # subnet resource. For more information on the Amazon EC2 scenario options, see Supported platforms in
        # the Amazon EC2 User Guide . EC2-VPC-InstanceStore instance, image, security group, network interface
        # EC2-VPC-InstanceStore-Subnet instance, image, security group, network interface, subnet EC2-VPC-EBS
        # instance, image, security group, network interface, volume EC2-VPC-EBS-Subnet instance, image,
        # security group, network interface, subnet, volume
        @[JSON::Field(key: "ResourceHandlingOption")]
        getter resource_handling_option : String?

        # An Amazon Web Services account ID that specifies the owner of any simulated resource that does not
        # identify its owner in the resource ARN. Examples of resource ARNs include an S3 bucket or object. If
        # ResourceOwner is specified, it is also used as the account owner of any ResourcePolicy included in
        # the simulation. If the ResourceOwner parameter is not specified, then the owner of the resources and
        # the resource policy defaults to the account of the identity provided in CallerArn . This parameter
        # is required only if you specify a resource-based policy and account that owns the resource is
        # different from the account that owns the simulated calling user CallerArn .
        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # A resource-based policy to include in the simulation provided as a string. Each resource in the
        # simulation is treated as if it had this policy attached. You can include only one resource-based
        # policy in a simulation. The maximum length of the policy document that you can pass in this
        # operation, including whitespace, is listed below. To view the maximum character counts of a managed
        # policy with no whitespaces, see IAM and STS character quotas . The regex pattern used to validate
        # this parameter is a string of characters consisting of the following: Any printable ASCII character
        # ranging from the space character ( \u0020 ) through the end of the ASCII character range The
        # printable characters in the Basic Latin and Latin-1 Supplement character set (through \u00FF ) The
        # special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D ) Simulation
        # of resource-based policies isn't supported for IAM roles.
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String?

        def initialize(
          @action_names : Array(String),
          @policy_source_arn : String,
          @caller_arn : String? = nil,
          @context_entries : Array(Types::ContextEntry)? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @permissions_boundary_policy_input_list : Array(String)? = nil,
          @policy_input_list : Array(String)? = nil,
          @resource_arns : Array(String)? = nil,
          @resource_handling_option : String? = nil,
          @resource_owner : String? = nil,
          @resource_policy : String? = nil
        )
        end
      end

      # Contains a reference to a Statement element in a policy document that determines the result of the
      # simulation. This data type is used by the MatchedStatements member of the EvaluationResult type.
      struct Statement
        include JSON::Serializable

        # The row and column of the end of a Statement in an IAM policy.
        @[JSON::Field(key: "EndPosition")]
        getter end_position : Types::Position?

        # The identifier of the policy that was provided as an input.
        @[JSON::Field(key: "SourcePolicyId")]
        getter source_policy_id : String?

        # The type of the policy.
        @[JSON::Field(key: "SourcePolicyType")]
        getter source_policy_type : String?

        # The row and column of the beginning of the Statement in an IAM policy.
        @[JSON::Field(key: "StartPosition")]
        getter start_position : Types::Position?

        def initialize(
          @end_position : Types::Position? = nil,
          @source_policy_id : String? = nil,
          @source_policy_type : String? = nil,
          @start_position : Types::Position? = nil
        )
        end
      end

      # A structure that represents user-provided metadata that can be associated with an IAM resource. For
      # more information about tagging, see Tagging IAM resources in the IAM User Guide .
      struct Tag
        include JSON::Serializable

        # The key name that can be used to look up or retrieve the associated value. For example, Department
        # or Cost Center are common choices.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value associated with this tag. For example, tags with a key name of Department could have
        # values such as Human Resources , Accounting , and Support . Tags with a key name of Cost Center
        # might have values that consist of the number associated with the different cost centers in your
        # company. Typically, many resources have tags with the same key name but with different values.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagInstanceProfileRequest
        include JSON::Serializable

        # The name of the IAM instance profile to which you want to add tags. This parameter allows (through
        # its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String

        # The list of tags that you want to attach to the IAM instance profile. Each tag consists of a key
        # name and an associated value.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @instance_profile_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagMFADeviceRequest
        include JSON::Serializable

        # The unique identifier for the IAM virtual MFA device to which you want to add tags. For virtual MFA
        # devices, the serial number is the same as the ARN. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # The list of tags that you want to attach to the IAM virtual MFA device. Each tag consists of a key
        # name and an associated value.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @serial_number : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagOpenIDConnectProviderRequest
        include JSON::Serializable

        # The ARN of the OIDC identity provider in IAM to which you want to add tags. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "OpenIDConnectProviderArn")]
        getter open_id_connect_provider_arn : String

        # The list of tags that you want to attach to the OIDC identity provider in IAM. Each tag consists of
        # a key name and an associated value.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @open_id_connect_provider_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagPolicyRequest
        include JSON::Serializable

        # The ARN of the IAM customer managed policy to which you want to add tags. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The list of tags that you want to attach to the IAM customer managed policy. Each tag consists of a
        # key name and an associated value.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @policy_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagRoleRequest
        include JSON::Serializable

        # The name of the IAM role to which you want to add tags. This parameter accepts (through its regex
        # pattern ) a string of characters that consist of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        # The list of tags that you want to attach to the IAM role. Each tag consists of a key name and an
        # associated value.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @role_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagSAMLProviderRequest
        include JSON::Serializable

        # The ARN of the SAML identity provider in IAM to which you want to add tags. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "SAMLProviderArn")]
        getter saml_provider_arn : String

        # The list of tags that you want to attach to the SAML identity provider in IAM. Each tag consists of
        # a key name and an associated value.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @saml_provider_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagServerCertificateRequest
        include JSON::Serializable

        # The name of the IAM server certificate to which you want to add tags. This parameter allows (through
        # its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "ServerCertificateName")]
        getter server_certificate_name : String

        # The list of tags that you want to attach to the IAM server certificate. Each tag consists of a key
        # name and an associated value.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @server_certificate_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagUserRequest
        include JSON::Serializable

        # The list of tags that you want to attach to the IAM user. Each tag consists of a key name and an
        # associated value.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # The name of the IAM user to which you want to add tags. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @tags : Array(Types::Tag),
          @user_name : String
        )
        end
      end

      # Contains details about the most recent attempt to access an action within the service. This data
      # type is used as a response element in the GetServiceLastAccessedDetails operation.
      struct TrackedActionLastAccessed
        include JSON::Serializable

        # The name of the tracked action to which access was attempted. Tracked actions are actions that
        # report activity to IAM.
        @[JSON::Field(key: "ActionName")]
        getter action_name : String?

        @[JSON::Field(key: "LastAccessedEntity")]
        getter last_accessed_entity : String?

        # The Region from which the authenticated entity (user or role) last attempted to access the tracked
        # action. Amazon Web Services does not report unauthenticated requests. This field is null if no IAM
        # entities attempted to access the service within the tracking period .
        @[JSON::Field(key: "LastAccessedRegion")]
        getter last_accessed_region : String?

        # The date and time, in ISO 8601 date-time format , when an authenticated entity most recently
        # attempted to access the tracked service. Amazon Web Services does not report unauthenticated
        # requests. This field is null if no IAM entities attempted to access the service within the tracking
        # period .
        @[JSON::Field(key: "LastAccessedTime")]
        getter last_accessed_time : Time?

        def initialize(
          @action_name : String? = nil,
          @last_accessed_entity : String? = nil,
          @last_accessed_region : String? = nil,
          @last_accessed_time : Time? = nil
        )
        end
      end

      # The request was rejected because service-linked roles are protected Amazon Web Services resources.
      # Only the service that depends on the service-linked role can modify or delete the role on your
      # behalf. The error message includes the name of the service that depends on this service-linked role.
      # You must request the change through that service.
      struct UnmodifiableEntityException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the public key encoding format is unsupported or unrecognized.
      struct UnrecognizedPublicKeyEncodingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagInstanceProfileRequest
        include JSON::Serializable

        # The name of the IAM instance profile from which you want to remove tags. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "InstanceProfileName")]
        getter instance_profile_name : String

        # A list of key names as a simple array of strings. The tags with matching keys are removed from the
        # specified instance profile.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @instance_profile_name : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagMFADeviceRequest
        include JSON::Serializable

        # The unique identifier for the IAM virtual MFA device from which you want to remove tags. For virtual
        # MFA devices, the serial number is the same as the ARN. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # A list of key names as a simple array of strings. The tags with matching keys are removed from the
        # specified instance profile.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @serial_number : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagOpenIDConnectProviderRequest
        include JSON::Serializable

        # The ARN of the OIDC provider in IAM from which you want to remove tags. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "OpenIDConnectProviderArn")]
        getter open_id_connect_provider_arn : String

        # A list of key names as a simple array of strings. The tags with matching keys are removed from the
        # specified OIDC provider.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @open_id_connect_provider_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagPolicyRequest
        include JSON::Serializable

        # The ARN of the IAM customer managed policy from which you want to remove tags. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # A list of key names as a simple array of strings. The tags with matching keys are removed from the
        # specified policy.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @policy_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagRoleRequest
        include JSON::Serializable

        # The name of the IAM role from which you want to remove tags. This parameter accepts (through its
        # regex pattern ) a string of characters that consist of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        # A list of key names as a simple array of strings. The tags with matching keys are removed from the
        # specified role.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @role_name : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagSAMLProviderRequest
        include JSON::Serializable

        # The ARN of the SAML identity provider in IAM from which you want to remove tags. This parameter
        # allows (through its regex pattern ) a string of characters consisting of upper and lowercase
        # alphanumeric characters with no spaces. You can also include any of the following characters:
        # _+=,.@-
        @[JSON::Field(key: "SAMLProviderArn")]
        getter saml_provider_arn : String

        # A list of key names as a simple array of strings. The tags with matching keys are removed from the
        # specified SAML identity provider.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @saml_provider_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagServerCertificateRequest
        include JSON::Serializable

        # The name of the IAM server certificate from which you want to remove tags. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "ServerCertificateName")]
        getter server_certificate_name : String

        # A list of key names as a simple array of strings. The tags with matching keys are removed from the
        # specified IAM server certificate.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @server_certificate_name : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagUserRequest
        include JSON::Serializable

        # A list of key names as a simple array of strings. The tags with matching keys are removed from the
        # specified user.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        # The name of the IAM user from which you want to remove tags. This parameter allows (through its
        # regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @tag_keys : Array(String),
          @user_name : String
        )
        end
      end

      struct UpdateAccessKeyRequest
        include JSON::Serializable

        # The access key ID of the secret access key you want to update. This parameter allows (through its
        # regex pattern ) a string of characters that can consist of any upper or lowercased letter or digit.
        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String

        # The status you want to assign to the secret access key. Active means that the key can be used for
        # programmatic calls to Amazon Web Services, while Inactive means that the key cannot be used.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the user whose key you want to update. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @access_key_id : String,
          @status : String,
          @user_name : String? = nil
        )
        end
      end

      struct UpdateAccountPasswordPolicyRequest
        include JSON::Serializable

        # Allows all IAM users in your account to use the Amazon Web Services Management Console to change
        # their own passwords. For more information, see Permitting IAM users to change their own passwords in
        # the IAM User Guide . If you do not specify a value for this parameter, then the operation uses the
        # default value of false . The result is that IAM users in the account do not automatically have
        # permissions to change their own password.
        @[JSON::Field(key: "AllowUsersToChangePassword")]
        getter allow_users_to_change_password : Bool?

        # Prevents IAM users who are accessing the account via the Amazon Web Services Management Console from
        # setting a new console password after their password has expired. The IAM user cannot access the
        # console until an administrator resets the password. If you do not specify a value for this
        # parameter, then the operation uses the default value of false . The result is that IAM users can
        # change their passwords after they expire and continue to sign in as the user. In the Amazon Web
        # Services Management Console, the custom password policy option Allow users to change their own
        # password gives IAM users permissions to iam:ChangePassword for only their user and to the
        # iam:GetAccountPasswordPolicy action. This option does not attach a permissions policy to each user,
        # rather the permissions are applied at the account-level for all users by IAM. IAM users with
        # iam:ChangePassword permission and active access keys can reset their own expired console password
        # using the CLI or API.
        @[JSON::Field(key: "HardExpiry")]
        getter hard_expiry : Bool?

        # The number of days that an IAM user password is valid. If you do not specify a value for this
        # parameter, then the operation uses the default value of 0 . The result is that IAM user passwords
        # never expire.
        @[JSON::Field(key: "MaxPasswordAge")]
        getter max_password_age : Int32?

        # The minimum number of characters allowed in an IAM user password. If you do not specify a value for
        # this parameter, then the operation uses the default value of 6 .
        @[JSON::Field(key: "MinimumPasswordLength")]
        getter minimum_password_length : Int32?

        # Specifies the number of previous passwords that IAM users are prevented from reusing. If you do not
        # specify a value for this parameter, then the operation uses the default value of 0 . The result is
        # that IAM users are not prevented from reusing previous passwords.
        @[JSON::Field(key: "PasswordReusePrevention")]
        getter password_reuse_prevention : Int32?

        # Specifies whether IAM user passwords must contain at least one lowercase character from the ISO
        # basic Latin alphabet (a to z). If you do not specify a value for this parameter, then the operation
        # uses the default value of false . The result is that passwords do not require at least one lowercase
        # character.
        @[JSON::Field(key: "RequireLowercaseCharacters")]
        getter require_lowercase_characters : Bool?

        # Specifies whether IAM user passwords must contain at least one numeric character (0 to 9). If you do
        # not specify a value for this parameter, then the operation uses the default value of false . The
        # result is that passwords do not require at least one numeric character.
        @[JSON::Field(key: "RequireNumbers")]
        getter require_numbers : Bool?

        # Specifies whether IAM user passwords must contain at least one of the following non-alphanumeric
        # characters: ! @ # $ % ^ &amp; * ( ) _ + - = [ ] { } | ' If you do not specify a value for this
        # parameter, then the operation uses the default value of false . The result is that passwords do not
        # require at least one symbol character.
        @[JSON::Field(key: "RequireSymbols")]
        getter require_symbols : Bool?

        # Specifies whether IAM user passwords must contain at least one uppercase character from the ISO
        # basic Latin alphabet (A to Z). If you do not specify a value for this parameter, then the operation
        # uses the default value of false . The result is that passwords do not require at least one uppercase
        # character.
        @[JSON::Field(key: "RequireUppercaseCharacters")]
        getter require_uppercase_characters : Bool?

        def initialize(
          @allow_users_to_change_password : Bool? = nil,
          @hard_expiry : Bool? = nil,
          @max_password_age : Int32? = nil,
          @minimum_password_length : Int32? = nil,
          @password_reuse_prevention : Int32? = nil,
          @require_lowercase_characters : Bool? = nil,
          @require_numbers : Bool? = nil,
          @require_symbols : Bool? = nil,
          @require_uppercase_characters : Bool? = nil
        )
        end
      end

      struct UpdateAssumeRolePolicyRequest
        include JSON::Serializable

        # The policy that grants an entity permission to assume the role. You must provide policies in JSON
        # format in IAM. However, for CloudFormation templates formatted in YAML, you can provide the policy
        # in JSON or YAML format. CloudFormation always converts a YAML policy to JSON format before
        # submitting it to IAM. The regex pattern used to validate this parameter is a string of characters
        # consisting of the following: Any printable ASCII character ranging from the space character ( \u0020
        # ) through the end of the ASCII character range The printable characters in the Basic Latin and
        # Latin-1 Supplement character set (through \u00FF ) The special characters tab ( \u0009 ), line feed
        # ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The name of the role to update with the new policy. This parameter allows (through its regex pattern
        # ) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces.
        # You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @policy_document : String,
          @role_name : String
        )
        end
      end

      struct UpdateDelegationRequestRequest
        include JSON::Serializable

        # The unique identifier of the delegation request to update.
        @[JSON::Field(key: "DelegationRequestId")]
        getter delegation_request_id : String

        # Additional notes or comments to add to the delegation request.
        @[JSON::Field(key: "Notes")]
        getter notes : String?

        def initialize(
          @delegation_request_id : String,
          @notes : String? = nil
        )
        end
      end

      struct UpdateGroupRequest
        include JSON::Serializable

        # Name of the IAM group to update. If you're changing the name of the group, this is the original
        # name. This parameter allows (through its regex pattern ) a string of characters consisting of upper
        # and lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # New name for the IAM group. Only include this if changing the group's name. IAM user, group, role,
        # and policy names must be unique within the account. Names are not distinguished by case. For
        # example, you cannot create resources named both "MyResource" and "myresource".
        @[JSON::Field(key: "NewGroupName")]
        getter new_group_name : String?

        # New path for the IAM group. Only include this if changing the group's path. This parameter allows
        # (through its regex pattern ) a string of characters consisting of either a forward slash (/) by
        # itself or a string that must begin and end with forward slashes. In addition, it can contain any
        # ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including most
        # punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "NewPath")]
        getter new_path : String?

        def initialize(
          @group_name : String,
          @new_group_name : String? = nil,
          @new_path : String? = nil
        )
        end
      end

      struct UpdateLoginProfileRequest
        include JSON::Serializable

        # The name of the user whose password you want to update. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The new password for the specified IAM user. The regex pattern used to validate this parameter is a
        # string of characters consisting of the following: Any printable ASCII character ranging from the
        # space character ( \u0020 ) through the end of the ASCII character range The printable characters in
        # the Basic Latin and Latin-1 Supplement character set (through \u00FF ) The special characters tab (
        # \u0009 ), line feed ( \u000A ), and carriage return ( \u000D ) However, the format can be further
        # restricted by the account administrator by setting a password policy on the Amazon Web Services
        # account. For more information, see UpdateAccountPasswordPolicy .
        @[JSON::Field(key: "Password")]
        getter password : String?

        # Allows this new password to be used only once by requiring the specified IAM user to set a new
        # password on next sign-in.
        @[JSON::Field(key: "PasswordResetRequired")]
        getter password_reset_required : Bool?

        def initialize(
          @user_name : String,
          @password : String? = nil,
          @password_reset_required : Bool? = nil
        )
        end
      end

      struct UpdateOpenIDConnectProviderThumbprintRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM OIDC provider resource object for which you want to update
        # the thumbprint. You can get a list of OIDC provider ARNs by using the ListOpenIDConnectProviders
        # operation. For more information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web
        # Services General Reference .
        @[JSON::Field(key: "OpenIDConnectProviderArn")]
        getter open_id_connect_provider_arn : String

        # A list of certificate thumbprints that are associated with the specified IAM OpenID Connect
        # provider. For more information, see CreateOpenIDConnectProvider .
        @[JSON::Field(key: "ThumbprintList")]
        getter thumbprint_list : Array(String)

        def initialize(
          @open_id_connect_provider_arn : String,
          @thumbprint_list : Array(String)
        )
        end
      end

      struct UpdateRoleDescriptionRequest
        include JSON::Serializable

        # The new description that you want to apply to the specified role.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the role that you want to modify.
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        def initialize(
          @description : String,
          @role_name : String
        )
        end
      end

      struct UpdateRoleDescriptionResponse
        include JSON::Serializable

        # A structure that contains details about the modified role.
        @[JSON::Field(key: "Role")]
        getter role : Types::Role?

        def initialize(
          @role : Types::Role? = nil
        )
        end
      end

      struct UpdateRoleRequest
        include JSON::Serializable

        # The name of the role that you want to modify.
        @[JSON::Field(key: "RoleName")]
        getter role_name : String

        # The new description that you want to apply to the specified role.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The maximum session duration (in seconds) that you want to set for the specified role. If you do not
        # specify a value for this setting, the default value of one hour is applied. This setting can have a
        # value from 1 hour to 12 hours. Anyone who assumes the role from the CLI or API can use the
        # DurationSeconds API parameter or the duration-seconds CLI parameter to request a longer session. The
        # MaxSessionDuration setting determines the maximum duration that can be requested using the
        # DurationSeconds parameter. If users don't specify a value for the DurationSeconds parameter, their
        # security credentials are valid for one hour by default. This applies when you use the AssumeRole*
        # API operations or the assume-role* CLI operations but does not apply when you use those operations
        # to create a console URL. For more information, see Using IAM roles in the IAM User Guide . IAM role
        # credentials provided by Amazon EC2 instances assigned to the role are not subject to the specified
        # maximum session duration.
        @[JSON::Field(key: "MaxSessionDuration")]
        getter max_session_duration : Int32?

        def initialize(
          @role_name : String,
          @description : String? = nil,
          @max_session_duration : Int32? = nil
        )
        end
      end

      struct UpdateRoleResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateSAMLProviderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SAML provider to update. For more information about ARNs, see
        # Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "SAMLProviderArn")]
        getter saml_provider_arn : String

        # Specifies the new private key from your external identity provider. The private key must be a .pem
        # file that uses AES-GCM or AES-CBC encryption algorithm to decrypt SAML assertions.
        @[JSON::Field(key: "AddPrivateKey")]
        getter add_private_key : String?

        # Specifies the encryption setting for the SAML provider.
        @[JSON::Field(key: "AssertionEncryptionMode")]
        getter assertion_encryption_mode : String?

        # The Key ID of the private key to remove.
        @[JSON::Field(key: "RemovePrivateKey")]
        getter remove_private_key : String?

        # An XML document generated by an identity provider (IdP) that supports SAML 2.0. The document
        # includes the issuer's name, expiration information, and keys that can be used to validate the SAML
        # authentication response (assertions) that are received from the IdP. You must generate the metadata
        # document using the identity management software that is used as your IdP.
        @[JSON::Field(key: "SAMLMetadataDocument")]
        getter saml_metadata_document : String?

        def initialize(
          @saml_provider_arn : String,
          @add_private_key : String? = nil,
          @assertion_encryption_mode : String? = nil,
          @remove_private_key : String? = nil,
          @saml_metadata_document : String? = nil
        )
        end
      end

      # Contains the response to a successful UpdateSAMLProvider request.
      struct UpdateSAMLProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SAML provider that was updated.
        @[JSON::Field(key: "SAMLProviderArn")]
        getter saml_provider_arn : String?

        def initialize(
          @saml_provider_arn : String? = nil
        )
        end
      end

      struct UpdateSSHPublicKeyRequest
        include JSON::Serializable

        # The unique identifier for the SSH public key. This parameter allows (through its regex pattern ) a
        # string of characters that can consist of any upper or lowercased letter or digit.
        @[JSON::Field(key: "SSHPublicKeyId")]
        getter ssh_public_key_id : String

        # The status to assign to the SSH public key. Active means that the key can be used for authentication
        # with an CodeCommit repository. Inactive means that the key cannot be used.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the IAM user associated with the SSH public key. This parameter allows (through its
        # regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @ssh_public_key_id : String,
          @status : String,
          @user_name : String
        )
        end
      end

      struct UpdateServerCertificateRequest
        include JSON::Serializable

        # The name of the server certificate that you want to update. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "ServerCertificateName")]
        getter server_certificate_name : String

        # The new path for the server certificate. Include this only if you are updating the server
        # certificate's path. This parameter allows (through its regex pattern ) a string of characters
        # consisting of either a forward slash (/) by itself or a string that must begin and end with forward
        # slashes. In addition, it can contain any ASCII character from the ! ( \u0021 ) through the DEL
        # character ( \u007F ), including most punctuation characters, digits, and upper and lowercased
        # letters.
        @[JSON::Field(key: "NewPath")]
        getter new_path : String?

        # The new name for the server certificate. Include this only if you are updating the server
        # certificate's name. The name of the certificate cannot contain any spaces. This parameter allows
        # (through its regex pattern ) a string of characters consisting of upper and lowercase alphanumeric
        # characters with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "NewServerCertificateName")]
        getter new_server_certificate_name : String?

        def initialize(
          @server_certificate_name : String,
          @new_path : String? = nil,
          @new_server_certificate_name : String? = nil
        )
        end
      end

      struct UpdateServiceSpecificCredentialRequest
        include JSON::Serializable

        # The unique identifier of the service-specific credential. This parameter allows (through its regex
        # pattern ) a string of characters that can consist of any upper or lowercased letter or digit.
        @[JSON::Field(key: "ServiceSpecificCredentialId")]
        getter service_specific_credential_id : String

        # The status to be assigned to the service-specific credential.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the IAM user associated with the service-specific credential. If you do not specify this
        # value, then the operation assumes the user whose credentials are used to call the operation. This
        # parameter allows (through its regex pattern ) a string of characters consisting of upper and
        # lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @service_specific_credential_id : String,
          @status : String,
          @user_name : String? = nil
        )
        end
      end

      struct UpdateSigningCertificateRequest
        include JSON::Serializable

        # The ID of the signing certificate you want to update. This parameter allows (through its regex
        # pattern ) a string of characters that can consist of any upper or lowercased letter or digit.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        # The status you want to assign to the certificate. Active means that the certificate can be used for
        # programmatic calls to Amazon Web Services Inactive means that the certificate cannot be used.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the IAM user the signing certificate belongs to. This parameter allows (through its
        # regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @certificate_id : String,
          @status : String,
          @user_name : String? = nil
        )
        end
      end

      struct UpdateUserRequest
        include JSON::Serializable

        # Name of the user to update. If you're changing the name of the user, this is the original user name.
        # This parameter allows (through its regex pattern ) a string of characters consisting of upper and
        # lowercase alphanumeric characters with no spaces. You can also include any of the following
        # characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # New path for the IAM user. Include this parameter only if you're changing the user's path. This
        # parameter allows (through its regex pattern ) a string of characters consisting of either a forward
        # slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can
        # contain any ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including
        # most punctuation characters, digits, and upper and lowercased letters.
        @[JSON::Field(key: "NewPath")]
        getter new_path : String?

        # New name for the user. Include this parameter only if you're changing the user's name. IAM user,
        # group, role, and policy names must be unique within the account. Names are not distinguished by
        # case. For example, you cannot create resources named both "MyResource" and "myresource".
        @[JSON::Field(key: "NewUserName")]
        getter new_user_name : String?

        def initialize(
          @user_name : String,
          @new_path : String? = nil,
          @new_user_name : String? = nil
        )
        end
      end

      struct UploadSSHPublicKeyRequest
        include JSON::Serializable

        # The SSH public key. The public key must be encoded in ssh-rsa format or PEM format. The minimum
        # bit-length of the public key is 2048 bits. For example, you can generate a 2048-bit key, and the
        # resulting PEM file is 1679 bytes long. The regex pattern used to validate this parameter is a string
        # of characters consisting of the following: Any printable ASCII character ranging from the space
        # character ( \u0020 ) through the end of the ASCII character range The printable characters in the
        # Basic Latin and Latin-1 Supplement character set (through \u00FF ) The special characters tab (
        # \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "SSHPublicKeyBody")]
        getter ssh_public_key_body : String

        # The name of the IAM user to associate the SSH public key with. This parameter allows (through its
        # regex pattern ) a string of characters consisting of upper and lowercase alphanumeric characters
        # with no spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @ssh_public_key_body : String,
          @user_name : String
        )
        end
      end

      # Contains the response to a successful UploadSSHPublicKey request.
      struct UploadSSHPublicKeyResponse
        include JSON::Serializable

        # Contains information about the SSH public key.
        @[JSON::Field(key: "SSHPublicKey")]
        getter ssh_public_key : Types::SSHPublicKey?

        def initialize(
          @ssh_public_key : Types::SSHPublicKey? = nil
        )
        end
      end

      struct UploadServerCertificateRequest
        include JSON::Serializable

        # The contents of the public key certificate in PEM-encoded format. The regex pattern used to validate
        # this parameter is a string of characters consisting of the following: Any printable ASCII character
        # ranging from the space character ( \u0020 ) through the end of the ASCII character range The
        # printable characters in the Basic Latin and Latin-1 Supplement character set (through \u00FF ) The
        # special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "CertificateBody")]
        getter certificate_body : String

        # The contents of the private key in PEM-encoded format. The regex pattern used to validate this
        # parameter is a string of characters consisting of the following: Any printable ASCII character
        # ranging from the space character ( \u0020 ) through the end of the ASCII character range The
        # printable characters in the Basic Latin and Latin-1 Supplement character set (through \u00FF ) The
        # special characters tab ( \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String

        # The name for the server certificate. Do not include the path in this value. The name of the
        # certificate cannot contain any spaces. This parameter allows (through its regex pattern ) a string
        # of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also
        # include any of the following characters: _+=,.@-
        @[JSON::Field(key: "ServerCertificateName")]
        getter server_certificate_name : String

        # The contents of the certificate chain. This is typically a concatenation of the PEM-encoded public
        # key certificates of the chain. The regex pattern used to validate this parameter is a string of
        # characters consisting of the following: Any printable ASCII character ranging from the space
        # character ( \u0020 ) through the end of the ASCII character range The printable characters in the
        # Basic Latin and Latin-1 Supplement character set (through \u00FF ) The special characters tab (
        # \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : String?

        # The path for the server certificate. For more information about paths, see IAM identifiers in the
        # IAM User Guide . This parameter is optional. If it is not included, it defaults to a slash (/). This
        # parameter allows (through its regex pattern ) a string of characters consisting of either a forward
        # slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can
        # contain any ASCII character from the ! ( \u0021 ) through the DEL character ( \u007F ), including
        # most punctuation characters, digits, and upper and lowercased letters. If you are uploading a server
        # certificate specifically for use with Amazon CloudFront distributions, you must specify a path using
        # the path parameter. The path must begin with /cloudfront and must include a trailing slash (for
        # example, /cloudfront/test/ ).
        @[JSON::Field(key: "Path")]
        getter path : String?

        # A list of tags that you want to attach to the new IAM server certificate resource. Each tag consists
        # of a key name and an associated value. For more information about tagging, see Tagging IAM resources
        # in the IAM User Guide . If any one of the tags is invalid or if you exceed the allowed maximum
        # number of tags, then the entire request fails and the resource is not created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @certificate_body : String,
          @private_key : String,
          @server_certificate_name : String,
          @certificate_chain : String? = nil,
          @path : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the response to a successful UploadServerCertificate request.
      struct UploadServerCertificateResponse
        include JSON::Serializable

        # The meta information of the uploaded server certificate without its certificate body, certificate
        # chain, and private key.
        @[JSON::Field(key: "ServerCertificateMetadata")]
        getter server_certificate_metadata : Types::ServerCertificateMetadata?

        # A list of tags that are attached to the new IAM server certificate. The returned list of tags is
        # sorted by tag key. For more information about tagging, see Tagging IAM resources in the IAM User
        # Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @server_certificate_metadata : Types::ServerCertificateMetadata? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct UploadSigningCertificateRequest
        include JSON::Serializable

        # The contents of the signing certificate. The regex pattern used to validate this parameter is a
        # string of characters consisting of the following: Any printable ASCII character ranging from the
        # space character ( \u0020 ) through the end of the ASCII character range The printable characters in
        # the Basic Latin and Latin-1 Supplement character set (through \u00FF ) The special characters tab (
        # \u0009 ), line feed ( \u000A ), and carriage return ( \u000D )
        @[JSON::Field(key: "CertificateBody")]
        getter certificate_body : String

        # The name of the user the signing certificate is for. This parameter allows (through its regex
        # pattern ) a string of characters consisting of upper and lowercase alphanumeric characters with no
        # spaces. You can also include any of the following characters: _+=,.@-
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @certificate_body : String,
          @user_name : String? = nil
        )
        end
      end

      # Contains the response to a successful UploadSigningCertificate request.
      struct UploadSigningCertificateResponse
        include JSON::Serializable

        # Information about the certificate.
        @[JSON::Field(key: "Certificate")]
        getter certificate : Types::SigningCertificate

        def initialize(
          @certificate : Types::SigningCertificate
        )
        end
      end

      # Contains information about an IAM user entity. This data type is used as a response element in the
      # following operations: CreateUser GetUser ListUsers
      struct User
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the user. For more information about ARNs and how to
        # use ARNs in policies, see IAM Identifiers in the IAM User Guide .
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time, in ISO 8601 date-time format , when the user was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time

        # The path to the user. For more information about paths, see IAM identifiers in the IAM User Guide .
        # The ARN of the policy used to set the permissions boundary for the user.
        @[JSON::Field(key: "Path")]
        getter path : String

        # The stable and unique string identifying the user. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # The friendly name identifying the user.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The date and time, in ISO 8601 date-time format , when the user's password was last used to sign in
        # to an Amazon Web Services website. For a list of Amazon Web Services websites that capture a user's
        # last sign-in time, see the Credential reports topic in the IAM User Guide . If a password is used
        # more than once in a five-minute span, only the first use is returned in this field. If the field is
        # null (no value), then it indicates that they never signed in with a password. This can be because:
        # The user never had a password. A password exists but has not been used since IAM started tracking
        # this information on October 20, 2014. A null value does not mean that the user never had a password.
        # Also, if the user does not currently have a password but had one in the past, then this field
        # contains the date and time the most recent password was used. This value is returned only in the
        # GetUser and ListUsers operations.
        @[JSON::Field(key: "PasswordLastUsed")]
        getter password_last_used : Time?

        # For more information about permissions boundaries, see Permissions boundaries for IAM identities in
        # the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : Types::AttachedPermissionsBoundary?

        # A list of tags that are associated with the user. For more information about tagging, see Tagging
        # IAM resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String,
          @create_date : Time,
          @path : String,
          @user_id : String,
          @user_name : String,
          @password_last_used : Time? = nil,
          @permissions_boundary : Types::AttachedPermissionsBoundary? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains information about an IAM user, including all the user's policies and all the IAM groups the
      # user is in. This data type is used as a response element in the GetAccountAuthorizationDetails
      # operation.
      struct UserDetail
        include JSON::Serializable

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A list of the managed policies attached to the user.
        @[JSON::Field(key: "AttachedManagedPolicies")]
        getter attached_managed_policies : Array(Types::AttachedPolicy)?

        # The date and time, in ISO 8601 date-time format , when the user was created.
        @[JSON::Field(key: "CreateDate")]
        getter create_date : Time?

        # A list of IAM groups that the user is in.
        @[JSON::Field(key: "GroupList")]
        getter group_list : Array(String)?

        # The path to the user. For more information about paths, see IAM identifiers in the IAM User Guide .
        @[JSON::Field(key: "Path")]
        getter path : String?

        # The ARN of the policy used to set the permissions boundary for the user. For more information about
        # permissions boundaries, see Permissions boundaries for IAM identities in the IAM User Guide .
        @[JSON::Field(key: "PermissionsBoundary")]
        getter permissions_boundary : Types::AttachedPermissionsBoundary?

        # A list of tags that are associated with the user. For more information about tagging, see Tagging
        # IAM resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The stable and unique string identifying the user. For more information about IDs, see IAM
        # identifiers in the IAM User Guide .
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        # The friendly name identifying the user.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        # A list of the inline policies embedded in the user.
        @[JSON::Field(key: "UserPolicyList")]
        getter user_policy_list : Array(Types::PolicyDetail)?

        def initialize(
          @arn : String? = nil,
          @attached_managed_policies : Array(Types::AttachedPolicy)? = nil,
          @create_date : Time? = nil,
          @group_list : Array(String)? = nil,
          @path : String? = nil,
          @permissions_boundary : Types::AttachedPermissionsBoundary? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_id : String? = nil,
          @user_name : String? = nil,
          @user_policy_list : Array(Types::PolicyDetail)? = nil
        )
        end
      end

      # Contains information about a virtual MFA device.
      struct VirtualMFADevice
        include JSON::Serializable

        # The serial number associated with VirtualMFADevice .
        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String

        # The base32 seed defined as specified in RFC3548 . The Base32StringSeed is base32-encoded.
        @[JSON::Field(key: "Base32StringSeed")]
        getter base32_string_seed : Bytes?

        # The date and time on which the virtual MFA device was enabled.
        @[JSON::Field(key: "EnableDate")]
        getter enable_date : Time?

        # A QR code PNG image that encodes
        # otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String where $virtualMFADeviceName
        # is one of the create call arguments. AccountName is the user name if set (otherwise, the account ID
        # otherwise), and Base32String is the seed in base32 format. The Base32String value is base64-encoded.
        @[JSON::Field(key: "QRCodePNG")]
        getter qr_code_png : Bytes?

        # A list of tags that are attached to the virtual MFA device. For more information about tagging, see
        # Tagging IAM resources in the IAM User Guide .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The IAM user associated with this virtual MFA device.
        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @serial_number : String,
          @base32_string_seed : Bytes? = nil,
          @enable_date : Time? = nil,
          @qr_code_png : Bytes? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user : Types::User? = nil
        )
        end
      end
    end
  end
end
