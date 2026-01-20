require "json"
require "time"

module AwsSdk
  module WorkMail
    module Types

      # A rule that controls access to an WorkMail organization.

      struct AccessControlRule
        include JSON::Serializable

        # Access protocol actions to include in the rule. Valid values include ActiveSync , AutoDiscover , EWS
        # , IMAP , SMTP , WindowsOutlook , and WebMail .

        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)?

        # The date that the rule was created.

        @[JSON::Field(key: "DateCreated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_created : Time?

        # The date that the rule was modified.

        @[JSON::Field(key: "DateModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_modified : Time?

        # The rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The rule effect.

        @[JSON::Field(key: "Effect")]
        getter effect : String?

        # Impersonation role IDs to include in the rule.

        @[JSON::Field(key: "ImpersonationRoleIds")]
        getter impersonation_role_ids : Array(String)?

        # IPv4 CIDR ranges to include in the rule.

        @[JSON::Field(key: "IpRanges")]
        getter ip_ranges : Array(String)?

        # The rule name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Access protocol actions to exclude from the rule. Valid values include ActiveSync , AutoDiscover ,
        # EWS , IMAP , SMTP , WindowsOutlook , and WebMail .

        @[JSON::Field(key: "NotActions")]
        getter not_actions : Array(String)?

        # Impersonation role IDs to exclude from the rule.

        @[JSON::Field(key: "NotImpersonationRoleIds")]
        getter not_impersonation_role_ids : Array(String)?

        # IPv4 CIDR ranges to exclude from the rule.

        @[JSON::Field(key: "NotIpRanges")]
        getter not_ip_ranges : Array(String)?

        # User IDs to exclude from the rule.

        @[JSON::Field(key: "NotUserIds")]
        getter not_user_ids : Array(String)?

        # User IDs to include in the rule.

        @[JSON::Field(key: "UserIds")]
        getter user_ids : Array(String)?

        def initialize(
          @actions : Array(String)? = nil,
          @date_created : Time? = nil,
          @date_modified : Time? = nil,
          @description : String? = nil,
          @effect : String? = nil,
          @impersonation_role_ids : Array(String)? = nil,
          @ip_ranges : Array(String)? = nil,
          @name : String? = nil,
          @not_actions : Array(String)? = nil,
          @not_impersonation_role_ids : Array(String)? = nil,
          @not_ip_ranges : Array(String)? = nil,
          @not_user_ids : Array(String)? = nil,
          @user_ids : Array(String)? = nil
        )
        end
      end


      struct AssociateDelegateToResourceRequest
        include JSON::Serializable

        # The member (user or group) to associate to the resource. The entity ID can accept UserId or GroupID
        # , Username or Groupname , or email . Entity: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: entity@domain.tld Entity: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The organization under which the resource exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The resource for which members (users or groups) are associated. The identifier can accept
        # ResourceId , Resourcename , or email . The following identity formats are available: Resource ID:
        # r-0123456789a0123456789b0123456789 Email address: resource@domain.tld Resource name: resource

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @entity_id : String,
          @organization_id : String,
          @resource_id : String
        )
        end
      end


      struct AssociateDelegateToResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateMemberToGroupRequest
        include JSON::Serializable

        # The group to which the member (user or group) is associated. The identifier can accept GroupId ,
        # Groupname , or email . The following identity formats are available: Group ID:
        # 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234 Email address:
        # group@domain.tld Group name: group

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The member (user or group) to associate to the group. The member ID can accept UserID or GroupId ,
        # Username or Groupname , or email . Member: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: member@domain.tld Member name: member

        @[JSON::Field(key: "MemberId")]
        getter member_id : String

        # The organization under which the group exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @group_id : String,
          @member_id : String,
          @organization_id : String
        )
        end
      end


      struct AssociateMemberToGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssumeImpersonationRoleRequest
        include JSON::Serializable

        # The impersonation role ID to assume.

        @[JSON::Field(key: "ImpersonationRoleId")]
        getter impersonation_role_id : String

        # The WorkMail organization under which the impersonation role will be assumed.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @impersonation_role_id : String,
          @organization_id : String
        )
        end
      end


      struct AssumeImpersonationRoleResponse
        include JSON::Serializable

        # The authentication token's validity, in seconds.

        @[JSON::Field(key: "ExpiresIn")]
        getter expires_in : Int64?

        # The authentication token for the impersonation role.

        @[JSON::Field(key: "Token")]
        getter token : String?

        def initialize(
          @expires_in : Int64? = nil,
          @token : String? = nil
        )
        end
      end

      # List all the AvailabilityConfiguration 's for the given WorkMail organization.

      struct AvailabilityConfiguration
        include JSON::Serializable

        # The date and time at which the availability configuration was created.

        @[JSON::Field(key: "DateCreated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_created : Time?

        # The date and time at which the availability configuration was last modified.

        @[JSON::Field(key: "DateModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_modified : Time?

        # Displays the domain to which the provider applies.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # If ProviderType is EWS , then this field contains RedactedEwsAvailabilityProvider . Otherwise, it is
        # not required.

        @[JSON::Field(key: "EwsProvider")]
        getter ews_provider : Types::RedactedEwsAvailabilityProvider?

        # If ProviderType is LAMBDA then this field contains LambdaAvailabilityProvider . Otherwise, it is not
        # required.

        @[JSON::Field(key: "LambdaProvider")]
        getter lambda_provider : Types::LambdaAvailabilityProvider?

        # Displays the provider type that applies to this domain.

        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        def initialize(
          @date_created : Time? = nil,
          @date_modified : Time? = nil,
          @domain_name : String? = nil,
          @ews_provider : Types::RedactedEwsAvailabilityProvider? = nil,
          @lambda_provider : Types::LambdaAvailabilityProvider? = nil,
          @provider_type : String? = nil
        )
        end
      end

      # At least one delegate must be associated to the resource to disable automatic replies from the
      # resource.

      struct BookingOptions
        include JSON::Serializable

        # The resource's ability to automatically reply to requests. If disabled, delegates must be associated
        # to the resource.

        @[JSON::Field(key: "AutoAcceptRequests")]
        getter auto_accept_requests : Bool?

        # The resource's ability to automatically decline any conflicting requests.

        @[JSON::Field(key: "AutoDeclineConflictingRequests")]
        getter auto_decline_conflicting_requests : Bool?

        # The resource's ability to automatically decline any recurring requests.

        @[JSON::Field(key: "AutoDeclineRecurringRequests")]
        getter auto_decline_recurring_requests : Bool?

        def initialize(
          @auto_accept_requests : Bool? = nil,
          @auto_decline_conflicting_requests : Bool? = nil,
          @auto_decline_recurring_requests : Bool? = nil
        )
        end
      end


      struct CancelMailboxExportJobRequest
        include JSON::Serializable

        # The idempotency token for the client request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @client_token : String,
          @job_id : String,
          @organization_id : String
        )
        end
      end


      struct CancelMailboxExportJobResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateAliasRequest
        include JSON::Serializable

        # The alias to add to the member set.

        @[JSON::Field(key: "Alias")]
        getter alias : String

        # The member (user or group) to which this alias is added.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The organization under which the member (user or group) exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @alias : String,
          @entity_id : String,
          @organization_id : String
        )
        end
      end


      struct CreateAliasResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateAvailabilityConfigurationRequest
        include JSON::Serializable

        # The domain to which the provider applies.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The WorkMail organization for which the AvailabilityConfiguration will be created.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # An idempotent token that ensures that an API request is executed only once.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Exchange Web Services (EWS) availability provider definition. The request must contain exactly one
        # provider definition, either EwsProvider or LambdaProvider .

        @[JSON::Field(key: "EwsProvider")]
        getter ews_provider : Types::EwsAvailabilityProvider?

        # Lambda availability provider definition. The request must contain exactly one provider definition,
        # either EwsProvider or LambdaProvider .

        @[JSON::Field(key: "LambdaProvider")]
        getter lambda_provider : Types::LambdaAvailabilityProvider?

        def initialize(
          @domain_name : String,
          @organization_id : String,
          @client_token : String? = nil,
          @ews_provider : Types::EwsAvailabilityProvider? = nil,
          @lambda_provider : Types::LambdaAvailabilityProvider? = nil
        )
        end
      end


      struct CreateAvailabilityConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateGroupRequest
        include JSON::Serializable

        # The name of the group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The organization under which the group is to be created.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # If this parameter is enabled, the group will be hidden from the address book.

        @[JSON::Field(key: "HiddenFromGlobalAddressList")]
        getter hidden_from_global_address_list : Bool?

        def initialize(
          @name : String,
          @organization_id : String,
          @hidden_from_global_address_list : Bool? = nil
        )
        end
      end


      struct CreateGroupResponse
        include JSON::Serializable

        # The identifier of the group.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        def initialize(
          @group_id : String? = nil
        )
        end
      end


      struct CreateIdentityCenterApplicationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the instance.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # The name of the IAM Identity Center application.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The idempotency token associated with the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @instance_arn : String,
          @name : String,
          @client_token : String? = nil
        )
        end
      end


      struct CreateIdentityCenterApplicationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        def initialize(
          @application_arn : String? = nil
        )
        end
      end


      struct CreateImpersonationRoleRequest
        include JSON::Serializable

        # The name of the new impersonation role.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The WorkMail organization to create the new impersonation role within.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The list of rules for the impersonation role.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ImpersonationRule)

        # The impersonation role's type. The available impersonation role types are READ_ONLY or FULL_ACCESS .

        @[JSON::Field(key: "Type")]
        getter type : String

        # The idempotency token for the client request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the new impersonation role.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @name : String,
          @organization_id : String,
          @rules : Array(Types::ImpersonationRule),
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateImpersonationRoleResponse
        include JSON::Serializable

        # The new impersonation role ID.

        @[JSON::Field(key: "ImpersonationRoleId")]
        getter impersonation_role_id : String?

        def initialize(
          @impersonation_role_id : String? = nil
        )
        end
      end


      struct CreateMobileDeviceAccessRuleRequest
        include JSON::Serializable

        # The effect of the rule when it matches. Allowed values are ALLOW or DENY .

        @[JSON::Field(key: "Effect")]
        getter effect : String

        # The rule name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The WorkMail organization under which the rule will be created.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The idempotency token for the client request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Device models that the rule will match.

        @[JSON::Field(key: "DeviceModels")]
        getter device_models : Array(String)?

        # Device operating systems that the rule will match.

        @[JSON::Field(key: "DeviceOperatingSystems")]
        getter device_operating_systems : Array(String)?

        # Device types that the rule will match.

        @[JSON::Field(key: "DeviceTypes")]
        getter device_types : Array(String)?

        # Device user agents that the rule will match.

        @[JSON::Field(key: "DeviceUserAgents")]
        getter device_user_agents : Array(String)?

        # Device models that the rule will not match. All other device models will match.

        @[JSON::Field(key: "NotDeviceModels")]
        getter not_device_models : Array(String)?

        # Device operating systems that the rule will not match. All other device operating systems will
        # match.

        @[JSON::Field(key: "NotDeviceOperatingSystems")]
        getter not_device_operating_systems : Array(String)?

        # Device types that the rule will not match. All other device types will match.

        @[JSON::Field(key: "NotDeviceTypes")]
        getter not_device_types : Array(String)?

        # Device user agents that the rule will not match. All other device user agents will match.

        @[JSON::Field(key: "NotDeviceUserAgents")]
        getter not_device_user_agents : Array(String)?

        def initialize(
          @effect : String,
          @name : String,
          @organization_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @device_models : Array(String)? = nil,
          @device_operating_systems : Array(String)? = nil,
          @device_types : Array(String)? = nil,
          @device_user_agents : Array(String)? = nil,
          @not_device_models : Array(String)? = nil,
          @not_device_operating_systems : Array(String)? = nil,
          @not_device_types : Array(String)? = nil,
          @not_device_user_agents : Array(String)? = nil
        )
        end
      end


      struct CreateMobileDeviceAccessRuleResponse
        include JSON::Serializable

        # The identifier for the newly created mobile device access rule.

        @[JSON::Field(key: "MobileDeviceAccessRuleId")]
        getter mobile_device_access_rule_id : String?

        def initialize(
          @mobile_device_access_rule_id : String? = nil
        )
        end
      end


      struct CreateOrganizationRequest
        include JSON::Serializable

        # The organization alias.

        @[JSON::Field(key: "Alias")]
        getter alias : String

        # The idempotency token associated with the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The AWS Directory Service directory ID.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The email domains to associate with the organization.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(Types::Domain)?

        # When true , allows organization interoperability between WorkMail and Microsoft Exchange. If true ,
        # you must include a AD Connector directory ID in the request.

        @[JSON::Field(key: "EnableInteroperability")]
        getter enable_interoperability : Bool?

        # The Amazon Resource Name (ARN) of a customer managed key from AWS KMS.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @alias : String,
          @client_token : String? = nil,
          @directory_id : String? = nil,
          @domains : Array(Types::Domain)? = nil,
          @enable_interoperability : Bool? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct CreateOrganizationResponse
        include JSON::Serializable

        # The organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        def initialize(
          @organization_id : String? = nil
        )
        end
      end


      struct CreateResourceRequest
        include JSON::Serializable

        # The name of the new resource.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier associated with the organization for which the resource is created.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The type of the new resource. The available types are equipment and room .

        @[JSON::Field(key: "Type")]
        getter type : String

        # Resource description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If this parameter is enabled, the resource will be hidden from the address book.

        @[JSON::Field(key: "HiddenFromGlobalAddressList")]
        getter hidden_from_global_address_list : Bool?

        def initialize(
          @name : String,
          @organization_id : String,
          @type : String,
          @description : String? = nil,
          @hidden_from_global_address_list : Bool? = nil
        )
        end
      end


      struct CreateResourceResponse
        include JSON::Serializable

        # The identifier of the new resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @resource_id : String? = nil
        )
        end
      end


      struct CreateUserRequest
        include JSON::Serializable

        # The display name for the new user.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The name for the new user. WorkMail directory user names have a maximum length of 64. All others
        # have a maximum length of 20.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier of the organization for which the user is created.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The first name of the new user.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # If this parameter is enabled, the user will be hidden from the address book.

        @[JSON::Field(key: "HiddenFromGlobalAddressList")]
        getter hidden_from_global_address_list : Bool?

        # User ID from the IAM Identity Center. If this parameter is empty it will be updated automatically
        # when the user logs in for the first time to the mailbox associated with WorkMail.

        @[JSON::Field(key: "IdentityProviderUserId")]
        getter identity_provider_user_id : String?

        # The last name of the new user.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The password for the new user.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The role of the new user. You cannot pass SYSTEM_USER or RESOURCE role in a single request. When a
        # user role is not selected, the default role of USER is selected.

        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @display_name : String,
          @name : String,
          @organization_id : String,
          @first_name : String? = nil,
          @hidden_from_global_address_list : Bool? = nil,
          @identity_provider_user_id : String? = nil,
          @last_name : String? = nil,
          @password : String? = nil,
          @role : String? = nil
        )
        end
      end


      struct CreateUserResponse
        include JSON::Serializable

        # The identifier for the new user.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @user_id : String? = nil
        )
        end
      end

      # The name of the attribute, which is one of the values defined in the UserAttribute enumeration.

      struct Delegate
        include JSON::Serializable

        # The identifier for the user or group associated as the resource's delegate.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The type of the delegate: user or group.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @id : String,
          @type : String
        )
        end
      end


      struct DeleteAccessControlRuleRequest
        include JSON::Serializable

        # The name of the access control rule.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier for the organization.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @name : String,
          @organization_id : String
        )
        end
      end


      struct DeleteAccessControlRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAliasRequest
        include JSON::Serializable

        # The aliases to be removed from the user's set of aliases. Duplicate entries in the list are
        # collapsed into single entries (the list is transformed into a set).

        @[JSON::Field(key: "Alias")]
        getter alias : String

        # The identifier for the member (user or group) from which to have the aliases removed.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The identifier for the organization under which the user exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @alias : String,
          @entity_id : String,
          @organization_id : String
        )
        end
      end


      struct DeleteAliasResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAvailabilityConfigurationRequest
        include JSON::Serializable

        # The domain for which the AvailabilityConfiguration will be deleted.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The WorkMail organization for which the AvailabilityConfiguration will be deleted.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @domain_name : String,
          @organization_id : String
        )
        end
      end


      struct DeleteAvailabilityConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEmailMonitoringConfigurationRequest
        include JSON::Serializable

        # The ID of the organization from which the email monitoring configuration is deleted.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end


      struct DeleteEmailMonitoringConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteGroupRequest
        include JSON::Serializable

        # The identifier of the group to be deleted. The identifier can be the GroupId , or Groupname . The
        # following identity formats are available: Group ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Group name: group

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The organization that contains the group.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @group_id : String,
          @organization_id : String
        )
        end
      end


      struct DeleteGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteIdentityCenterApplicationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        def initialize(
          @application_arn : String
        )
        end
      end


      struct DeleteIdentityCenterApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteIdentityProviderConfigurationRequest
        include JSON::Serializable

        # The Organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end


      struct DeleteIdentityProviderConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteImpersonationRoleRequest
        include JSON::Serializable

        # The ID of the impersonation role to delete.

        @[JSON::Field(key: "ImpersonationRoleId")]
        getter impersonation_role_id : String

        # The WorkMail organization from which to delete the impersonation role.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @impersonation_role_id : String,
          @organization_id : String
        )
        end
      end


      struct DeleteImpersonationRoleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMailboxPermissionsRequest
        include JSON::Serializable

        # The identifier of the entity that owns the mailbox. The identifier can be UserId or Group Id ,
        # Username or Groupname , or email . Entity ID: 12345678-1234-1234-1234-123456789012,
        # r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234 Email address:
        # entity@domain.tld Entity name: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The identifier of the entity for which to delete granted permissions. The identifier can be UserId,
        # ResourceID, or Group Id , Username or Groupname , or email . Grantee ID:
        # 12345678-1234-1234-1234-123456789012,r-0123456789a0123456789b0123456789, or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: grantee@domain.tld Grantee name: grantee

        @[JSON::Field(key: "GranteeId")]
        getter grantee_id : String

        # The identifier of the organization under which the member (user or group) exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @entity_id : String,
          @grantee_id : String,
          @organization_id : String
        )
        end
      end


      struct DeleteMailboxPermissionsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMobileDeviceAccessOverrideRequest
        include JSON::Serializable

        # The mobile device for which you delete the override. DeviceId is case insensitive.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The WorkMail organization for which the access override will be deleted.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The WorkMail user for which you want to delete the override. Accepts the following types of user
        # identities: User ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: user@domain.tld User name: user

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @device_id : String,
          @organization_id : String,
          @user_id : String
        )
        end
      end


      struct DeleteMobileDeviceAccessOverrideResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMobileDeviceAccessRuleRequest
        include JSON::Serializable

        # The identifier of the rule to be deleted.

        @[JSON::Field(key: "MobileDeviceAccessRuleId")]
        getter mobile_device_access_rule_id : String

        # The WorkMail organization under which the rule will be deleted.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @mobile_device_access_rule_id : String,
          @organization_id : String
        )
        end
      end


      struct DeleteMobileDeviceAccessRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteOrganizationRequest
        include JSON::Serializable

        # If true, deletes the AWS Directory Service directory associated with the organization.

        @[JSON::Field(key: "DeleteDirectory")]
        getter delete_directory : Bool

        # The organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The idempotency token associated with the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Deletes IAM Identity Center application for WorkMail. This action does not affect authentication
        # settings for any organization.

        @[JSON::Field(key: "DeleteIdentityCenterApplication")]
        getter delete_identity_center_application : Bool?

        # Deletes a WorkMail organization even if the organization has enabled users.

        @[JSON::Field(key: "ForceDelete")]
        getter force_delete : Bool?

        def initialize(
          @delete_directory : Bool,
          @organization_id : String,
          @client_token : String? = nil,
          @delete_identity_center_application : Bool? = nil,
          @force_delete : Bool? = nil
        )
        end
      end


      struct DeleteOrganizationResponse
        include JSON::Serializable

        # The organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        # The state of the organization.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @organization_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeletePersonalAccessTokenRequest
        include JSON::Serializable

        # The Organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The Personal Access Token ID.

        @[JSON::Field(key: "PersonalAccessTokenId")]
        getter personal_access_token_id : String

        def initialize(
          @organization_id : String,
          @personal_access_token_id : String
        )
        end
      end


      struct DeletePersonalAccessTokenResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteResourceRequest
        include JSON::Serializable

        # The identifier associated with the organization from which the resource is deleted.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifier of the resource to be deleted. The identifier can accept ResourceId , or Resourcename
        # . The following identity formats are available: Resource ID: r-0123456789a0123456789b0123456789
        # Resource name: resource

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @organization_id : String,
          @resource_id : String
        )
        end
      end


      struct DeleteResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRetentionPolicyRequest
        include JSON::Serializable

        # The retention policy ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @id : String,
          @organization_id : String
        )
        end
      end


      struct DeleteRetentionPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteUserRequest
        include JSON::Serializable

        # The organization that contains the user to be deleted.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifier of the user to be deleted. The identifier can be the UserId or Username . The
        # following identity formats are available: User ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 User name: user

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @organization_id : String,
          @user_id : String
        )
        end
      end


      struct DeleteUserResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterFromWorkMailRequest
        include JSON::Serializable

        # The identifier for the member to be updated. The identifier can be UserId, ResourceId, or Group Id ,
        # Username, Resourcename, or Groupname , or email . Entity ID: 12345678-1234-1234-1234-123456789012,
        # r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234 Email address:
        # entity@domain.tld Entity name: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The identifier for the organization under which the WorkMail entity exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @entity_id : String,
          @organization_id : String
        )
        end
      end


      struct DeregisterFromWorkMailResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterMailDomainRequest
        include JSON::Serializable

        # The domain to deregister in WorkMail and SES.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The WorkMail organization for which the domain will be deregistered.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @domain_name : String,
          @organization_id : String
        )
        end
      end


      struct DeregisterMailDomainResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeEmailMonitoringConfigurationRequest
        include JSON::Serializable

        # The ID of the organization for which the email monitoring configuration is described.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end


      struct DescribeEmailMonitoringConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email monitoring
        # configuration.

        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String?

        # The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring configuration.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @log_group_arn : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct DescribeEntityRequest
        include JSON::Serializable

        # The email under which the entity exists.

        @[JSON::Field(key: "Email")]
        getter email : String

        # The identifier for the organization under which the entity exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @email : String,
          @organization_id : String
        )
        end
      end


      struct DescribeEntityResponse
        include JSON::Serializable

        # The entity ID under which the entity exists.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # Username, GroupName, or ResourceName based on entity type.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Entity type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @entity_id : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct DescribeGroupRequest
        include JSON::Serializable

        # The identifier for the group to be described. The identifier can accept GroupId , Groupname , or
        # email . The following identity formats are available: Group ID: 12345678-1234-1234-1234-123456789012
        # or S-1-1-12-1234567890-123456789-123456789-1234 Email address: group@domain.tld Group name: group

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The identifier for the organization under which the group exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @group_id : String,
          @organization_id : String
        )
        end
      end


      struct DescribeGroupResponse
        include JSON::Serializable

        # The date and time when a user was deregistered from WorkMail, in UNIX epoch time format.

        @[JSON::Field(key: "DisabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter disabled_date : Time?

        # The email of the described group.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The date and time when a user was registered to WorkMail, in UNIX epoch time format.

        @[JSON::Field(key: "EnabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter enabled_date : Time?

        # The identifier of the described group.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        # If the value is set to true , the group is hidden from the address book.

        @[JSON::Field(key: "HiddenFromGlobalAddressList")]
        getter hidden_from_global_address_list : Bool?

        # The name of the described group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the user: enabled (registered to WorkMail) or disabled (deregistered or never
        # registered to WorkMail).

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @disabled_date : Time? = nil,
          @email : String? = nil,
          @enabled_date : Time? = nil,
          @group_id : String? = nil,
          @hidden_from_global_address_list : Bool? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DescribeIdentityProviderConfigurationRequest
        include JSON::Serializable

        # The Organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end


      struct DescribeIdentityProviderConfigurationResponse
        include JSON::Serializable

        # The authentication mode used in WorkMail.

        @[JSON::Field(key: "AuthenticationMode")]
        getter authentication_mode : String?

        # The details of the IAM Identity Center configuration.

        @[JSON::Field(key: "IdentityCenterConfiguration")]
        getter identity_center_configuration : Types::IdentityCenterConfiguration?

        # The details of the Personal Access Token configuration.

        @[JSON::Field(key: "PersonalAccessTokenConfiguration")]
        getter personal_access_token_configuration : Types::PersonalAccessTokenConfiguration?

        def initialize(
          @authentication_mode : String? = nil,
          @identity_center_configuration : Types::IdentityCenterConfiguration? = nil,
          @personal_access_token_configuration : Types::PersonalAccessTokenConfiguration? = nil
        )
        end
      end


      struct DescribeInboundDmarcSettingsRequest
        include JSON::Serializable

        # Lists the ID of the given organization.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end


      struct DescribeInboundDmarcSettingsResponse
        include JSON::Serializable

        # Lists the enforcement setting of the applied policy.

        @[JSON::Field(key: "Enforced")]
        getter enforced : Bool?

        def initialize(
          @enforced : Bool? = nil
        )
        end
      end


      struct DescribeMailboxExportJobRequest
        include JSON::Serializable

        # The mailbox export job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @job_id : String,
          @organization_id : String
        )
        end
      end


      struct DescribeMailboxExportJobResponse
        include JSON::Serializable

        # The mailbox export job description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The mailbox export job end timestamp.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The identifier of the user or resource associated with the mailbox.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # Error information for failed mailbox export jobs.

        @[JSON::Field(key: "ErrorInfo")]
        getter error_info : String?

        # The estimated progress of the mailbox export job, in percentage points.

        @[JSON::Field(key: "EstimatedProgress")]
        getter estimated_progress : Int32?

        # The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key that
        # encrypts the exported mailbox content.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The ARN of the AWS Identity and Access Management (IAM) role that grants write permission to the
        # Amazon Simple Storage Service (Amazon S3) bucket.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The name of the S3 bucket.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The path to the S3 bucket and file that the mailbox export job is exporting to.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The S3 bucket prefix.

        @[JSON::Field(key: "S3Prefix")]
        getter s3_prefix : String?

        # The mailbox export job start timestamp.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The state of the mailbox export job.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @description : String? = nil,
          @end_time : Time? = nil,
          @entity_id : String? = nil,
          @error_info : String? = nil,
          @estimated_progress : Int32? = nil,
          @kms_key_arn : String? = nil,
          @role_arn : String? = nil,
          @s3_bucket_name : String? = nil,
          @s3_path : String? = nil,
          @s3_prefix : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil
        )
        end
      end


      struct DescribeOrganizationRequest
        include JSON::Serializable

        # The identifier for the organization to be described.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end


      struct DescribeOrganizationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the organization.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The alias for an organization.

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The date at which the organization became usable in the WorkMail context, in UNIX epoch time format.

        @[JSON::Field(key: "CompletedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_date : Time?

        # The default mail domain associated with the organization.

        @[JSON::Field(key: "DefaultMailDomain")]
        getter default_mail_domain : String?

        # The identifier for the directory associated with an WorkMail organization.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The type of directory associated with the WorkMail organization.

        @[JSON::Field(key: "DirectoryType")]
        getter directory_type : String?

        # (Optional) The error message indicating if unexpected behavior was encountered with regards to the
        # organization.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Indicates if interoperability is enabled for this organization.

        @[JSON::Field(key: "InteroperabilityEnabled")]
        getter interoperability_enabled : Bool?

        # The user ID of the migration admin if migration is enabled for the organization.

        @[JSON::Field(key: "MigrationAdmin")]
        getter migration_admin : String?

        # The identifier of an organization.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        # The state of an organization.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @alias : String? = nil,
          @completed_date : Time? = nil,
          @default_mail_domain : String? = nil,
          @directory_id : String? = nil,
          @directory_type : String? = nil,
          @error_message : String? = nil,
          @interoperability_enabled : Bool? = nil,
          @migration_admin : String? = nil,
          @organization_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DescribeResourceRequest
        include JSON::Serializable

        # The identifier associated with the organization for which the resource is described.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifier of the resource to be described. The identifier can accept ResourceId , Resourcename
        # , or email . The following identity formats are available: Resource ID:
        # r-0123456789a0123456789b0123456789 Email address: resource@domain.tld Resource name: resource

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @organization_id : String,
          @resource_id : String
        )
        end
      end


      struct DescribeResourceResponse
        include JSON::Serializable

        # The booking options for the described resource.

        @[JSON::Field(key: "BookingOptions")]
        getter booking_options : Types::BookingOptions?

        # Description of the resource.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date and time when a resource was disabled from WorkMail, in UNIX epoch time format.

        @[JSON::Field(key: "DisabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter disabled_date : Time?

        # The email of the described resource.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The date and time when a resource was enabled for WorkMail, in UNIX epoch time format.

        @[JSON::Field(key: "EnabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter enabled_date : Time?

        # If enabled, the resource is hidden from the global address list.

        @[JSON::Field(key: "HiddenFromGlobalAddressList")]
        getter hidden_from_global_address_list : Bool?

        # The name of the described resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The identifier of the described resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The state of the resource: enabled (registered to WorkMail), disabled (deregistered or never
        # registered to WorkMail), or deleted.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The type of the described resource.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @booking_options : Types::BookingOptions? = nil,
          @description : String? = nil,
          @disabled_date : Time? = nil,
          @email : String? = nil,
          @enabled_date : Time? = nil,
          @hidden_from_global_address_list : Bool? = nil,
          @name : String? = nil,
          @resource_id : String? = nil,
          @state : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct DescribeUserRequest
        include JSON::Serializable

        # The identifier for the organization under which the user exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifier for the user to be described. The identifier can be the UserId , Username , or email
        # . The following identity formats are available: User ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: user@domain.tld User name: user

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @organization_id : String,
          @user_id : String
        )
        end
      end


      struct DescribeUserResponse
        include JSON::Serializable

        # City where the user is located.

        @[JSON::Field(key: "City")]
        getter city : String?

        # Company of the user.

        @[JSON::Field(key: "Company")]
        getter company : String?

        # Country where the user is located.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # Department of the user.

        @[JSON::Field(key: "Department")]
        getter department : String?

        # The date and time at which the user was disabled for WorkMail usage, in UNIX epoch time format.

        @[JSON::Field(key: "DisabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter disabled_date : Time?

        # The display name of the user.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The email of the user.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The date and time at which the user was enabled for WorkMailusage, in UNIX epoch time format.

        @[JSON::Field(key: "EnabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter enabled_date : Time?

        # First name of the user.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # If enabled, the user is hidden from the global address list.

        @[JSON::Field(key: "HiddenFromGlobalAddressList")]
        getter hidden_from_global_address_list : Bool?

        # Identity Store ID from the IAM Identity Center. If this parameter is empty it will be updated
        # automatically when the user logs in for the first time to the mailbox associated with WorkMail.

        @[JSON::Field(key: "IdentityProviderIdentityStoreId")]
        getter identity_provider_identity_store_id : String?

        # User ID from the IAM Identity Center. If this parameter is empty it will be updated automatically
        # when the user logs in for the first time to the mailbox associated with WorkMail.

        @[JSON::Field(key: "IdentityProviderUserId")]
        getter identity_provider_user_id : String?

        # Initials of the user.

        @[JSON::Field(key: "Initials")]
        getter initials : String?

        # Job title of the user.

        @[JSON::Field(key: "JobTitle")]
        getter job_title : String?

        # Last name of the user.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The date when the mailbox was removed for the user.

        @[JSON::Field(key: "MailboxDeprovisionedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter mailbox_deprovisioned_date : Time?

        # The date when the mailbox was created for the user.

        @[JSON::Field(key: "MailboxProvisionedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter mailbox_provisioned_date : Time?

        # The name for the user.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Office where the user is located.

        @[JSON::Field(key: "Office")]
        getter office : String?

        # The state of a user: enabled (registered to WorkMail) or disabled (deregistered or never registered
        # to WorkMail).

        @[JSON::Field(key: "State")]
        getter state : String?

        # Street where the user is located.

        @[JSON::Field(key: "Street")]
        getter street : String?

        # User's contact number.

        @[JSON::Field(key: "Telephone")]
        getter telephone : String?

        # The identifier for the described user.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        # In certain cases, other entities are modeled as users. If interoperability is enabled, resources are
        # imported into WorkMail as users. Because different WorkMail organizations rely on different
        # directory types, administrators can distinguish between an unregistered user (account is disabled
        # and has a user role) and the directory administrators. The values are USER, RESOURCE, SYSTEM_USER,
        # and REMOTE_USER.

        @[JSON::Field(key: "UserRole")]
        getter user_role : String?

        # Zip code of the user.

        @[JSON::Field(key: "ZipCode")]
        getter zip_code : String?

        def initialize(
          @city : String? = nil,
          @company : String? = nil,
          @country : String? = nil,
          @department : String? = nil,
          @disabled_date : Time? = nil,
          @display_name : String? = nil,
          @email : String? = nil,
          @enabled_date : Time? = nil,
          @first_name : String? = nil,
          @hidden_from_global_address_list : Bool? = nil,
          @identity_provider_identity_store_id : String? = nil,
          @identity_provider_user_id : String? = nil,
          @initials : String? = nil,
          @job_title : String? = nil,
          @last_name : String? = nil,
          @mailbox_deprovisioned_date : Time? = nil,
          @mailbox_provisioned_date : Time? = nil,
          @name : String? = nil,
          @office : String? = nil,
          @state : String? = nil,
          @street : String? = nil,
          @telephone : String? = nil,
          @user_id : String? = nil,
          @user_role : String? = nil,
          @zip_code : String? = nil
        )
        end
      end

      # The directory is already in use by another WorkMail organization in the same account and Region.

      struct DirectoryInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The directory service doesn't recognize the credentials supplied by WorkMail.

      struct DirectoryServiceAuthenticationFailedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The directory is unavailable. It might be located in another Region or deleted.

      struct DirectoryUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DisassociateDelegateFromResourceRequest
        include JSON::Serializable

        # The identifier for the member (user, group) to be removed from the resource's delegates. The entity
        # ID can accept UserId or GroupID , Username or Groupname , or email . Entity:
        # 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234 Email address:
        # entity@domain.tld Entity: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The identifier for the organization under which the resource exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifier of the resource from which delegates' set members are removed. The identifier can
        # accept ResourceId , Resourcename , or email . The following identity formats are available: Resource
        # ID: r-0123456789a0123456789b0123456789 Email address: resource@domain.tld Resource name: resource

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @entity_id : String,
          @organization_id : String,
          @resource_id : String
        )
        end
      end


      struct DisassociateDelegateFromResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateMemberFromGroupRequest
        include JSON::Serializable

        # The identifier for the group from which members are removed. The identifier can accept GroupId ,
        # Groupname , or email . The following identity formats are available: Group ID:
        # 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234 Email address:
        # group@domain.tld Group name: group

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The identifier for the member to be removed from the group. The member ID can accept UserID or
        # GroupId , Username or Groupname , or email . Member ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: member@domain.tld Member name: member

        @[JSON::Field(key: "MemberId")]
        getter member_id : String

        # The identifier for the organization under which the group exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @group_id : String,
          @member_id : String,
          @organization_id : String
        )
        end
      end


      struct DisassociateMemberFromGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A DNS record uploaded to your DNS provider.

      struct DnsRecord
        include JSON::Serializable

        # The DNS hostname.- For example, domain.example.com .

        @[JSON::Field(key: "Hostname")]
        getter hostname : String?

        # The RFC 1035 record type. Possible values: CNAME , A , MX .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The value returned by the DNS for a query to that hostname and record type.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @hostname : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The domain to associate with an WorkMail organization. When you configure a domain hosted in Amazon
      # Route 53 (Route 53), all recommended DNS records are added to the organization when you create it.
      # For more information, see Adding a domain in the WorkMail Administrator Guide .

      struct Domain
        include JSON::Serializable

        # The fully qualified domain name.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The hosted zone ID for a domain hosted in Route 53. Required when configuring a domain hosted in
        # Route 53.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String?

        def initialize(
          @domain_name : String,
          @hosted_zone_id : String? = nil
        )
        end
      end

      # The email address that you're trying to assign is already created for a different user, group, or
      # resource.

      struct EmailAddressInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The user, group, or resource that you're trying to register is already registered.

      struct EntityAlreadyRegisteredException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The identifier supplied for the user, group, or resource does not exist in your organization.

      struct EntityNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You are performing an operation on a user, group, or resource that isn't in the expected state, such
      # as trying to delete an active user.

      struct EntityStateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes an EWS based availability provider. This is only used as input to the service.

      struct EwsAvailabilityProvider
        include JSON::Serializable

        # The endpoint of the remote EWS server.

        @[JSON::Field(key: "EwsEndpoint")]
        getter ews_endpoint : String

        # The password used to authenticate the remote EWS server.

        @[JSON::Field(key: "EwsPassword")]
        getter ews_password : String

        # The username used to authenticate the remote EWS server.

        @[JSON::Field(key: "EwsUsername")]
        getter ews_username : String

        def initialize(
          @ews_endpoint : String,
          @ews_password : String,
          @ews_username : String
        )
        end
      end

      # The configuration applied to an organization's folders by its retention policy.

      struct FolderConfiguration
        include JSON::Serializable

        # The action to take on the folder contents at the end of the folder configuration period.

        @[JSON::Field(key: "Action")]
        getter action : String

        # The folder name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The number of days for which the folder-configuration action applies.

        @[JSON::Field(key: "Period")]
        getter period : Int32?

        def initialize(
          @action : String,
          @name : String,
          @period : Int32? = nil
        )
        end
      end


      struct GetAccessControlEffectRequest
        include JSON::Serializable

        # The access protocol action. Valid values include ActiveSync , AutoDiscover , EWS , IMAP , SMTP ,
        # WindowsOutlook , and WebMail .

        @[JSON::Field(key: "Action")]
        getter action : String

        # The IPv4 address.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String

        # The identifier for the organization.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The impersonation role ID.

        @[JSON::Field(key: "ImpersonationRoleId")]
        getter impersonation_role_id : String?

        # The user ID.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @action : String,
          @ip_address : String,
          @organization_id : String,
          @impersonation_role_id : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct GetAccessControlEffectResponse
        include JSON::Serializable

        # The rule effect.

        @[JSON::Field(key: "Effect")]
        getter effect : String?

        # The rules that match the given parameters, resulting in an effect.

        @[JSON::Field(key: "MatchedRules")]
        getter matched_rules : Array(String)?

        def initialize(
          @effect : String? = nil,
          @matched_rules : Array(String)? = nil
        )
        end
      end


      struct GetDefaultRetentionPolicyRequest
        include JSON::Serializable

        # The organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end


      struct GetDefaultRetentionPolicyResponse
        include JSON::Serializable

        # The retention policy description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The retention policy folder configurations.

        @[JSON::Field(key: "FolderConfigurations")]
        getter folder_configurations : Array(Types::FolderConfiguration)?

        # The retention policy ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The retention policy name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @description : String? = nil,
          @folder_configurations : Array(Types::FolderConfiguration)? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct GetImpersonationRoleEffectRequest
        include JSON::Serializable

        # The impersonation role ID to test.

        @[JSON::Field(key: "ImpersonationRoleId")]
        getter impersonation_role_id : String

        # The WorkMail organization where the impersonation role is defined.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The WorkMail organization user chosen to test the impersonation role. The following identity formats
        # are available: User ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: user@domain.tld User name: user

        @[JSON::Field(key: "TargetUser")]
        getter target_user : String

        def initialize(
          @impersonation_role_id : String,
          @organization_id : String,
          @target_user : String
        )
        end
      end


      struct GetImpersonationRoleEffectResponse
        include JSON::Serializable

        # Effect of the impersonation role on the target user based on its rules. Available effects are ALLOW
        # or DENY .

        @[JSON::Field(key: "Effect")]
        getter effect : String?

        # A list of the rules that match the input and produce the configured effect.

        @[JSON::Field(key: "MatchedRules")]
        getter matched_rules : Array(Types::ImpersonationMatchedRule)?

        # The impersonation role type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @effect : String? = nil,
          @matched_rules : Array(Types::ImpersonationMatchedRule)? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetImpersonationRoleRequest
        include JSON::Serializable

        # The impersonation role ID to retrieve.

        @[JSON::Field(key: "ImpersonationRoleId")]
        getter impersonation_role_id : String

        # The WorkMail organization from which to retrieve the impersonation role.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @impersonation_role_id : String,
          @organization_id : String
        )
        end
      end


      struct GetImpersonationRoleResponse
        include JSON::Serializable

        # The date when the impersonation role was created.

        @[JSON::Field(key: "DateCreated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_created : Time?

        # The date when the impersonation role was last modified.

        @[JSON::Field(key: "DateModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_modified : Time?

        # The impersonation role description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The impersonation role ID.

        @[JSON::Field(key: "ImpersonationRoleId")]
        getter impersonation_role_id : String?

        # The impersonation role name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The list of rules for the given impersonation role.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ImpersonationRule)?

        # The impersonation role type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @date_created : Time? = nil,
          @date_modified : Time? = nil,
          @description : String? = nil,
          @impersonation_role_id : String? = nil,
          @name : String? = nil,
          @rules : Array(Types::ImpersonationRule)? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetMailDomainRequest
        include JSON::Serializable

        # The domain from which you want to retrieve details.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The WorkMail organization for which the domain is retrieved.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @domain_name : String,
          @organization_id : String
        )
        end
      end


      struct GetMailDomainResponse
        include JSON::Serializable

        # Indicates the status of a DKIM verification.

        @[JSON::Field(key: "DkimVerificationStatus")]
        getter dkim_verification_status : String?

        # Specifies whether the domain is the default domain for your organization.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool?

        # Specifies whether the domain is a test domain provided by WorkMail, or a custom domain.

        @[JSON::Field(key: "IsTestDomain")]
        getter is_test_domain : Bool?

        # Indicates the status of the domain ownership verification.

        @[JSON::Field(key: "OwnershipVerificationStatus")]
        getter ownership_verification_status : String?

        # A list of the DNS records that WorkMail recommends adding in your DNS provider for the best user
        # experience. The records configure your domain with DMARC, SPF, DKIM, and direct incoming email
        # traffic to SES. See admin guide for more details.

        @[JSON::Field(key: "Records")]
        getter records : Array(Types::DnsRecord)?

        def initialize(
          @dkim_verification_status : String? = nil,
          @is_default : Bool? = nil,
          @is_test_domain : Bool? = nil,
          @ownership_verification_status : String? = nil,
          @records : Array(Types::DnsRecord)? = nil
        )
        end
      end


      struct GetMailboxDetailsRequest
        include JSON::Serializable

        # The identifier for the organization that contains the user whose mailbox details are being
        # requested.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifier for the user whose mailbox details are being requested. The identifier can be the
        # UserId , Username , or email . The following identity formats are available: User ID:
        # 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234 Email address:
        # user@domain.tld User name: user

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @organization_id : String,
          @user_id : String
        )
        end
      end


      struct GetMailboxDetailsResponse
        include JSON::Serializable

        # The maximum allowed mailbox size, in MB, for the specified user.

        @[JSON::Field(key: "MailboxQuota")]
        getter mailbox_quota : Int32?

        # The current mailbox size, in MB, for the specified user.

        @[JSON::Field(key: "MailboxSize")]
        getter mailbox_size : Float64?

        def initialize(
          @mailbox_quota : Int32? = nil,
          @mailbox_size : Float64? = nil
        )
        end
      end


      struct GetMobileDeviceAccessEffectRequest
        include JSON::Serializable

        # The WorkMail organization to simulate the access effect for.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # Device model the simulated user will report.

        @[JSON::Field(key: "DeviceModel")]
        getter device_model : String?

        # Device operating system the simulated user will report.

        @[JSON::Field(key: "DeviceOperatingSystem")]
        getter device_operating_system : String?

        # Device type the simulated user will report.

        @[JSON::Field(key: "DeviceType")]
        getter device_type : String?

        # Device user agent the simulated user will report.

        @[JSON::Field(key: "DeviceUserAgent")]
        getter device_user_agent : String?

        def initialize(
          @organization_id : String,
          @device_model : String? = nil,
          @device_operating_system : String? = nil,
          @device_type : String? = nil,
          @device_user_agent : String? = nil
        )
        end
      end


      struct GetMobileDeviceAccessEffectResponse
        include JSON::Serializable

        # The effect of the simulated access, ALLOW or DENY , after evaluating mobile device access rules in
        # the WorkMail organization for the simulated user parameters.

        @[JSON::Field(key: "Effect")]
        getter effect : String?

        # A list of the rules which matched the simulated user input and produced the effect.

        @[JSON::Field(key: "MatchedRules")]
        getter matched_rules : Array(Types::MobileDeviceAccessMatchedRule)?

        def initialize(
          @effect : String? = nil,
          @matched_rules : Array(Types::MobileDeviceAccessMatchedRule)? = nil
        )
        end
      end


      struct GetMobileDeviceAccessOverrideRequest
        include JSON::Serializable

        # The mobile device to which the override applies. DeviceId is case insensitive.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The WorkMail organization to which you want to apply the override.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # Identifies the WorkMail user for the override. Accepts the following types of user identities: User
        # ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234 Email
        # address: user@domain.tld User name: user

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @device_id : String,
          @organization_id : String,
          @user_id : String
        )
        end
      end


      struct GetMobileDeviceAccessOverrideResponse
        include JSON::Serializable

        # The date the override was first created.

        @[JSON::Field(key: "DateCreated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_created : Time?

        # The date the description was last modified.

        @[JSON::Field(key: "DateModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_modified : Time?

        # A description of the override.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The device to which the access override applies.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The effect of the override, ALLOW or DENY .

        @[JSON::Field(key: "Effect")]
        getter effect : String?

        # The WorkMail user to which the access override applies.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @date_created : Time? = nil,
          @date_modified : Time? = nil,
          @description : String? = nil,
          @device_id : String? = nil,
          @effect : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct GetPersonalAccessTokenMetadataRequest
        include JSON::Serializable

        # The Organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The Personal Access Token ID.

        @[JSON::Field(key: "PersonalAccessTokenId")]
        getter personal_access_token_id : String

        def initialize(
          @organization_id : String,
          @personal_access_token_id : String
        )
        end
      end


      struct GetPersonalAccessTokenMetadataResponse
        include JSON::Serializable

        # The date when the Personal Access Token ID was created.

        @[JSON::Field(key: "DateCreated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_created : Time?

        # The date when the Personal Access Token ID was last used.

        @[JSON::Field(key: "DateLastUsed", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_last_used : Time?

        # The time when the Personal Access Token ID will expire.

        @[JSON::Field(key: "ExpiresTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_time : Time?

        # The Personal Access Token name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Personal Access Token ID.

        @[JSON::Field(key: "PersonalAccessTokenId")]
        getter personal_access_token_id : String?

        # Lists all the Personal Access Token permissions for a mailbox.

        @[JSON::Field(key: "Scopes")]
        getter scopes : Array(String)?

        # The WorkMail User ID.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @date_created : Time? = nil,
          @date_last_used : Time? = nil,
          @expires_time : Time? = nil,
          @name : String? = nil,
          @personal_access_token_id : String? = nil,
          @scopes : Array(String)? = nil,
          @user_id : String? = nil
        )
        end
      end

      # The representation of an WorkMail group.

      struct Group
        include JSON::Serializable

        # The date indicating when the group was disabled from WorkMail use.

        @[JSON::Field(key: "DisabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter disabled_date : Time?

        # The email of the group.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The date indicating when the group was enabled for WorkMail use.

        @[JSON::Field(key: "EnabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter enabled_date : Time?

        # The identifier of the group.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the group, which can be ENABLED, DISABLED, or DELETED.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @disabled_date : Time? = nil,
          @email : String? = nil,
          @enabled_date : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The identifier that contains the Group ID and name of a group.

      struct GroupIdentifier
        include JSON::Serializable

        # Group ID that matched the group.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        # Group name that matched the group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @group_id : String? = nil,
          @group_name : String? = nil
        )
        end
      end

      # The IAM Identity Center configuration.

      struct IdentityCenterConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of IAMIdentity Center Application for WorkMail. Must be created by
        # the WorkMail API, see CreateIdentityCenterApplication.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String

        # The Amazon Resource Name (ARN) of the of IAM Identity Center instance. Must be in the same AWS
        # account and region as WorkMail organization.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        def initialize(
          @application_arn : String,
          @instance_arn : String
        )
        end
      end

      # The impersonation rule that matched the input.

      struct ImpersonationMatchedRule
        include JSON::Serializable

        # The ID of the rule that matched the input

        @[JSON::Field(key: "ImpersonationRuleId")]
        getter impersonation_rule_id : String?

        # The name of the rule that matched the input.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @impersonation_rule_id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # An impersonation role for the given WorkMail organization.

      struct ImpersonationRole
        include JSON::Serializable

        # The date when the impersonation role was created.

        @[JSON::Field(key: "DateCreated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_created : Time?

        # The date when the impersonation role was last modified.

        @[JSON::Field(key: "DateModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_modified : Time?

        # The identifier of the impersonation role.

        @[JSON::Field(key: "ImpersonationRoleId")]
        getter impersonation_role_id : String?

        # The impersonation role name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The impersonation role type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @date_created : Time? = nil,
          @date_modified : Time? = nil,
          @impersonation_role_id : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The rules for the given impersonation role.

      struct ImpersonationRule
        include JSON::Serializable

        # The effect of the rule when it matches the input. Allowed effect values are ALLOW or DENY .

        @[JSON::Field(key: "Effect")]
        getter effect : String

        # The identifier of the rule.

        @[JSON::Field(key: "ImpersonationRuleId")]
        getter impersonation_rule_id : String

        # The rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The rule name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of user IDs that don't match the rule.

        @[JSON::Field(key: "NotTargetUsers")]
        getter not_target_users : Array(String)?

        # A list of user IDs that match the rule.

        @[JSON::Field(key: "TargetUsers")]
        getter target_users : Array(String)?

        def initialize(
          @effect : String,
          @impersonation_rule_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @not_target_users : Array(String)? = nil,
          @target_users : Array(String)? = nil
        )
        end
      end

      # The configuration for a resource isn't valid. A resource must either be able to auto-respond to
      # requests or have at least one delegate associated that can do so on its behalf.

      struct InvalidConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You SES configuration has customizations that WorkMail cannot save. The error message lists the
      # invalid setting. For examples of invalid settings, refer to CreateReceiptRule .

      struct InvalidCustomSesConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more of the input parameters don't match the service's restrictions.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The supplied password doesn't match the minimum security constraints, such as length or use of
      # special characters.

      struct InvalidPasswordException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a Lambda based availability provider.

      struct LambdaAvailabilityProvider
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda that acts as the availability provider.

        @[JSON::Field(key: "LambdaArn")]
        getter lambda_arn : String

        def initialize(
          @lambda_arn : String
        )
        end
      end

      # The request exceeds the limit of the resource.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAccessControlRulesRequest
        include JSON::Serializable

        # The identifier for the organization.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end


      struct ListAccessControlRulesResponse
        include JSON::Serializable

        # The access control rules.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::AccessControlRule)?

        def initialize(
          @rules : Array(Types::AccessControlRule)? = nil
        )
        end
      end


      struct ListAliasesRequest
        include JSON::Serializable

        # The identifier for the entity for which to list the aliases.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The identifier for the organization under which the entity exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not contain any tokens.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entity_id : String,
          @organization_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAliasesResponse
        include JSON::Serializable

        # The entity's paginated aliases.

        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(String)?

        # The token to use to retrieve the next page of results. The value is "null" when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aliases : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAvailabilityConfigurationsRequest
        include JSON::Serializable

        # The WorkMail organization for which the AvailabilityConfiguration 's will be listed.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not require a token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAvailabilityConfigurationsResponse
        include JSON::Serializable

        # The list of AvailabilityConfiguration 's that exist for the specified WorkMail organization.

        @[JSON::Field(key: "AvailabilityConfigurations")]
        getter availability_configurations : Array(Types::AvailabilityConfiguration)?

        # The token to use to retrieve the next page of results. The value is null when there are no further
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @availability_configurations : Array(Types::AvailabilityConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupMembersRequest
        include JSON::Serializable

        # The identifier for the group to which the members (users or groups) are associated. The identifier
        # can accept GroupId , Groupname , or email . The following identity formats are available: Group ID:
        # 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234 Email address:
        # group@domain.tld Group name: group

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The identifier for the organization under which the group exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not contain any tokens.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @group_id : String,
          @organization_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupMembersResponse
        include JSON::Serializable

        # The members associated to the group.

        @[JSON::Field(key: "Members")]
        getter members : Array(Types::Member)?

        # The token to use to retrieve the next page of results. The first call does not contain any tokens.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::Member)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Filtering options for ListGroups operation. This is only used as input to Operation.

      struct ListGroupsFilters
        include JSON::Serializable

        # Filters only groups with the provided name prefix.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # Filters only groups with the provided primary email prefix.

        @[JSON::Field(key: "PrimaryEmailPrefix")]
        getter primary_email_prefix : String?

        # Filters only groups with the provided state.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @name_prefix : String? = nil,
          @primary_email_prefix : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Filtering options for ListGroupsForEntity operation. This is only used as input to Operation.

      struct ListGroupsForEntityFilters
        include JSON::Serializable

        # Filters only group names that start with the provided name prefix.

        @[JSON::Field(key: "GroupNamePrefix")]
        getter group_name_prefix : String?

        def initialize(
          @group_name_prefix : String? = nil
        )
        end
      end


      struct ListGroupsForEntityRequest
        include JSON::Serializable

        # The identifier for the entity. The entity ID can accept UserId or GroupID , Username or Groupname ,
        # or email . Entity ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: entity@domain.tld Entity name: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The identifier for the organization under which the entity exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # Limit the search results based on the filter criteria.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListGroupsForEntityFilters?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not contain any tokens.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entity_id : String,
          @organization_id : String,
          @filters : Types::ListGroupsForEntityFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsForEntityResponse
        include JSON::Serializable

        # The overview of groups in an organization.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupIdentifier)?

        # The token to use to retrieve the next page of results. This value is `null` when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @groups : Array(Types::GroupIdentifier)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsRequest
        include JSON::Serializable

        # The identifier for the organization under which the groups exist.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # Limit the search results based on the filter criteria. Only one filter per request is supported.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListGroupsFilters?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not contain any tokens.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_id : String,
          @filters : Types::ListGroupsFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsResponse
        include JSON::Serializable

        # The overview of groups for an organization.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::Group)?

        # The token to use to retrieve the next page of results. The value is "null" when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @groups : Array(Types::Group)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImpersonationRolesRequest
        include JSON::Serializable

        # The WorkMail organization to which the listed impersonation roles belong.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The maximum number of results returned in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token used to retrieve the next page of results. The first call doesn't require a token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImpersonationRolesResponse
        include JSON::Serializable

        # The token to retrieve the next page of results. The value is null when there are no results to
        # return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of impersonation roles under the given WorkMail organization.

        @[JSON::Field(key: "Roles")]
        getter roles : Array(Types::ImpersonationRole)?

        def initialize(
          @next_token : String? = nil,
          @roles : Array(Types::ImpersonationRole)? = nil
        )
        end
      end


      struct ListMailDomainsRequest
        include JSON::Serializable

        # The WorkMail organization for which to list domains.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not require a token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMailDomainsResponse
        include JSON::Serializable

        # The list of mail domain summaries, specifying domains that exist in the specified WorkMail
        # organization, along with the information about whether the domain is or isn't the default.

        @[JSON::Field(key: "MailDomains")]
        getter mail_domains : Array(Types::MailDomainSummary)?

        # The token to use to retrieve the next page of results. The value becomes null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @mail_domains : Array(Types::MailDomainSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMailboxExportJobsRequest
        include JSON::Serializable

        # The organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMailboxExportJobsResponse
        include JSON::Serializable

        # The mailbox export job details.

        @[JSON::Field(key: "Jobs")]
        getter jobs : Array(Types::MailboxExportJob)?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::MailboxExportJob)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMailboxPermissionsRequest
        include JSON::Serializable

        # The identifier of the user, or resource for which to list mailbox permissions. The entity ID can
        # accept UserId or ResourceId , Username or Resourcename , or email . Entity ID:
        # 12345678-1234-1234-1234-123456789012, or r-0123456789a0123456789b0123456789 Email address:
        # entity@domain.tld Entity name: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The identifier of the organization under which the user, group, or resource exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not contain any tokens.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entity_id : String,
          @organization_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMailboxPermissionsResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. The value is "null" when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # One page of the user, group, or resource mailbox permissions.

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(Types::Permission)?

        def initialize(
          @next_token : String? = nil,
          @permissions : Array(Types::Permission)? = nil
        )
        end
      end


      struct ListMobileDeviceAccessOverridesRequest
        include JSON::Serializable

        # The WorkMail organization under which to list mobile device access overrides.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The mobile device to which the access override applies.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not require a token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The WorkMail user under which you list the mobile device access overrides. Accepts the following
        # types of user identities: User ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: user@domain.tld User name: user

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @organization_id : String,
          @device_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct ListMobileDeviceAccessOverridesResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. The value is “null” when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of mobile device access overrides that exist for the specified WorkMail organization and
        # user.

        @[JSON::Field(key: "Overrides")]
        getter overrides : Array(Types::MobileDeviceAccessOverride)?

        def initialize(
          @next_token : String? = nil,
          @overrides : Array(Types::MobileDeviceAccessOverride)? = nil
        )
        end
      end


      struct ListMobileDeviceAccessRulesRequest
        include JSON::Serializable

        # The WorkMail organization for which to list the rules.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @organization_id : String
        )
        end
      end


      struct ListMobileDeviceAccessRulesResponse
        include JSON::Serializable

        # The list of mobile device access rules that exist under the specified WorkMail organization.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::MobileDeviceAccessRule)?

        def initialize(
          @rules : Array(Types::MobileDeviceAccessRule)? = nil
        )
        end
      end


      struct ListOrganizationsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not contain any tokens.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOrganizationsResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. The value is "null" when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The overview of owned organizations presented as a list of organization summaries.

        @[JSON::Field(key: "OrganizationSummaries")]
        getter organization_summaries : Array(Types::OrganizationSummary)?

        def initialize(
          @next_token : String? = nil,
          @organization_summaries : Array(Types::OrganizationSummary)? = nil
        )
        end
      end


      struct ListPersonalAccessTokensRequest
        include JSON::Serializable

        # The Organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The maximum amount of items that should be returned in a response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token from the previous response to query the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The WorkMail User ID.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @organization_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct ListPersonalAccessTokensResponse
        include JSON::Serializable

        # The token from the previous response to query the next page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists all the personal tokens in an organization or user, if user ID is provided.

        @[JSON::Field(key: "PersonalAccessTokenSummaries")]
        getter personal_access_token_summaries : Array(Types::PersonalAccessTokenSummary)?

        def initialize(
          @next_token : String? = nil,
          @personal_access_token_summaries : Array(Types::PersonalAccessTokenSummary)? = nil
        )
        end
      end


      struct ListResourceDelegatesRequest
        include JSON::Serializable

        # The identifier for the organization that contains the resource for which delegates are listed.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifier for the resource whose delegates are listed. The identifier can accept ResourceId ,
        # Resourcename , or email . The following identity formats are available: Resource ID:
        # r-0123456789a0123456789b0123456789 Email address: resource@domain.tld Resource name: resource

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The number of maximum results in a page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token used to paginate through the delegates associated with a resource.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_id : String,
          @resource_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceDelegatesResponse
        include JSON::Serializable

        # One page of the resource's delegates.

        @[JSON::Field(key: "Delegates")]
        getter delegates : Array(Types::Delegate)?

        # The token used to paginate through the delegates associated with a resource. While results are still
        # available, it has an associated value. When the last page is reached, the token is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @delegates : Array(Types::Delegate)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Filtering options for ListResources operation. This is only used as input to Operation.

      struct ListResourcesFilters
        include JSON::Serializable

        # Filters only resource that start with the entered name prefix .

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # Filters only resource with the provided primary email prefix.

        @[JSON::Field(key: "PrimaryEmailPrefix")]
        getter primary_email_prefix : String?

        # Filters only resource with the provided state.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @name_prefix : String? = nil,
          @primary_email_prefix : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct ListResourcesRequest
        include JSON::Serializable

        # The identifier for the organization under which the resources exist.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # Limit the resource search results based on the filter criteria. You can only use one filter per
        # request.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListResourcesFilters?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not contain any tokens.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_id : String,
          @filters : Types::ListResourcesFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourcesResponse
        include JSON::Serializable

        # The token used to paginate through all the organization's resources. While results are still
        # available, it has an associated value. When the last page is reached, the token is empty.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # One page of the organization's resource representation.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::Resource)?

        def initialize(
          @next_token : String? = nil,
          @resources : Array(Types::Resource)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource ARN.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tag key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Filtering options for ListUsers operation. This is only used as input to Operation.

      struct ListUsersFilters
        include JSON::Serializable

        # Filters only users with the provided display name prefix.

        @[JSON::Field(key: "DisplayNamePrefix")]
        getter display_name_prefix : String?

        # Filters only users with the ID from the IAM Identity Center.

        @[JSON::Field(key: "IdentityProviderUserIdPrefix")]
        getter identity_provider_user_id_prefix : String?

        # Filters only users with the provided email prefix.

        @[JSON::Field(key: "PrimaryEmailPrefix")]
        getter primary_email_prefix : String?

        # Filters only users with the provided state.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Filters only users with the provided username prefix.

        @[JSON::Field(key: "UsernamePrefix")]
        getter username_prefix : String?

        def initialize(
          @display_name_prefix : String? = nil,
          @identity_provider_user_id_prefix : String? = nil,
          @primary_email_prefix : String? = nil,
          @state : String? = nil,
          @username_prefix : String? = nil
        )
        end
      end


      struct ListUsersRequest
        include JSON::Serializable

        # The identifier for the organization under which the users exist.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # Limit the user search results based on the filter criteria. You can only use one filter per request.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListUsersFilters?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. The first call does not contain any tokens.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @organization_id : String,
          @filters : Types::ListUsersFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListUsersResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is `null` when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The overview of users for an organization.

        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # The domain you're trying to change is in use by another user or organization in your account. See
      # the error message for details.

      struct MailDomainInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The domain specified is not found in your organization.

      struct MailDomainNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # After a domain has been added to the organization, it must be verified. The domain is not yet
      # verified.

      struct MailDomainStateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The data for a given domain.

      struct MailDomainSummary
        include JSON::Serializable

        # Whether the domain is default or not.

        @[JSON::Field(key: "DefaultDomain")]
        getter default_domain : Bool?

        # The domain name.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        def initialize(
          @default_domain : Bool? = nil,
          @domain_name : String? = nil
        )
        end
      end

      # The details of a mailbox export job, including the user or resource ID associated with the mailbox
      # and the S3 bucket that the mailbox contents are exported to.

      struct MailboxExportJob
        include JSON::Serializable

        # The mailbox export job description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The mailbox export job end timestamp.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The identifier of the user or resource associated with the mailbox.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # The estimated progress of the mailbox export job, in percentage points.

        @[JSON::Field(key: "EstimatedProgress")]
        getter estimated_progress : Int32?

        # The identifier of the mailbox export job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name of the S3 bucket.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The path to the S3 bucket and file that the mailbox export job exports to.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : String?

        # The mailbox export job start timestamp.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The state of the mailbox export job.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @description : String? = nil,
          @end_time : Time? = nil,
          @entity_id : String? = nil,
          @estimated_progress : Int32? = nil,
          @job_id : String? = nil,
          @s3_bucket_name : String? = nil,
          @s3_path : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil
        )
        end
      end

      # The representation of a user or group.

      struct Member
        include JSON::Serializable

        # The date indicating when the member was disabled from WorkMail use.

        @[JSON::Field(key: "DisabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter disabled_date : Time?

        # The date indicating when the member was enabled for WorkMail use.

        @[JSON::Field(key: "EnabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter enabled_date : Time?

        # The identifier of the member.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the member.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the member, which can be ENABLED, DISABLED, or DELETED.

        @[JSON::Field(key: "State")]
        getter state : String?

        # A member can be a user or group.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @disabled_date : Time? = nil,
          @enabled_date : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The rule that a simulated user matches.

      struct MobileDeviceAccessMatchedRule
        include JSON::Serializable

        # Identifier of the rule that a simulated user matches.

        @[JSON::Field(key: "MobileDeviceAccessRuleId")]
        getter mobile_device_access_rule_id : String?

        # Name of a rule that a simulated user matches.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @mobile_device_access_rule_id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The override object.

      struct MobileDeviceAccessOverride
        include JSON::Serializable

        # The date the override was first created.

        @[JSON::Field(key: "DateCreated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_created : Time?

        # The date the override was last modified.

        @[JSON::Field(key: "DateModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_modified : Time?

        # A description of the override.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The device to which the override applies.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String?

        # The effect of the override, ALLOW or DENY .

        @[JSON::Field(key: "Effect")]
        getter effect : String?

        # The WorkMail user to which the access override applies.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @date_created : Time? = nil,
          @date_modified : Time? = nil,
          @description : String? = nil,
          @device_id : String? = nil,
          @effect : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # A rule that controls access to mobile devices for an WorkMail group.

      struct MobileDeviceAccessRule
        include JSON::Serializable

        # The date and time at which an access rule was created.

        @[JSON::Field(key: "DateCreated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_created : Time?

        # The date and time at which an access rule was modified.

        @[JSON::Field(key: "DateModified", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_modified : Time?

        # The description of a mobile access rule.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Device models that a rule will match.

        @[JSON::Field(key: "DeviceModels")]
        getter device_models : Array(String)?

        # Device operating systems that a rule will match.

        @[JSON::Field(key: "DeviceOperatingSystems")]
        getter device_operating_systems : Array(String)?

        # Device types that a rule will match.

        @[JSON::Field(key: "DeviceTypes")]
        getter device_types : Array(String)?

        # Device user agents that a rule will match.

        @[JSON::Field(key: "DeviceUserAgents")]
        getter device_user_agents : Array(String)?

        # The effect of the rule when it matches. Allowed values are ALLOW or DENY .

        @[JSON::Field(key: "Effect")]
        getter effect : String?

        # The ID assigned to a mobile access rule.

        @[JSON::Field(key: "MobileDeviceAccessRuleId")]
        getter mobile_device_access_rule_id : String?

        # The name of a mobile access rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Device models that a rule will not match. All other device models will match.

        @[JSON::Field(key: "NotDeviceModels")]
        getter not_device_models : Array(String)?

        # Device operating systems that a rule will not match. All other device types will match.

        @[JSON::Field(key: "NotDeviceOperatingSystems")]
        getter not_device_operating_systems : Array(String)?

        # Device types that a rule will not match. All other device types will match.

        @[JSON::Field(key: "NotDeviceTypes")]
        getter not_device_types : Array(String)?

        # Device user agents that a rule will not match. All other device user agents will match.

        @[JSON::Field(key: "NotDeviceUserAgents")]
        getter not_device_user_agents : Array(String)?

        def initialize(
          @date_created : Time? = nil,
          @date_modified : Time? = nil,
          @description : String? = nil,
          @device_models : Array(String)? = nil,
          @device_operating_systems : Array(String)? = nil,
          @device_types : Array(String)? = nil,
          @device_user_agents : Array(String)? = nil,
          @effect : String? = nil,
          @mobile_device_access_rule_id : String? = nil,
          @name : String? = nil,
          @not_device_models : Array(String)? = nil,
          @not_device_operating_systems : Array(String)? = nil,
          @not_device_types : Array(String)? = nil,
          @not_device_user_agents : Array(String)? = nil
        )
        end
      end

      # The user, group, or resource name isn't unique in WorkMail.

      struct NameAvailabilityException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An operation received a valid organization identifier that either doesn't belong or exist in the
      # system.

      struct OrganizationNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The organization must have a valid state to perform certain operations on the organization or its
      # members.

      struct OrganizationStateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The representation of an organization.

      struct OrganizationSummary
        include JSON::Serializable

        # The alias associated with the organization.

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The default email domain associated with the organization.

        @[JSON::Field(key: "DefaultMailDomain")]
        getter default_mail_domain : String?

        # The error message associated with the organization. It is only present if unexpected behavior has
        # occurred with regards to the organization. It provides insight or solutions regarding unexpected
        # behavior.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The identifier associated with the organization.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        # The state associated with the organization.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @alias : String? = nil,
          @default_mail_domain : String? = nil,
          @error_message : String? = nil,
          @organization_id : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Permission granted to a user, group, or resource to access a certain aspect of another user, group,
      # or resource mailbox.

      struct Permission
        include JSON::Serializable

        # The identifier of the user, group, or resource to which the permissions are granted.

        @[JSON::Field(key: "GranteeId")]
        getter grantee_id : String

        # The type of user, group, or resource referred to in GranteeId.

        @[JSON::Field(key: "GranteeType")]
        getter grantee_type : String

        # The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the
        # mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send
        # email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of
        # these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other
        # folder-level permissions set on the mailbox.

        @[JSON::Field(key: "PermissionValues")]
        getter permission_values : Array(String)

        def initialize(
          @grantee_id : String,
          @grantee_type : String,
          @permission_values : Array(String)
        )
        end
      end

      # Displays the Personal Access Token status.

      struct PersonalAccessTokenConfiguration
        include JSON::Serializable

        # The status of the Personal Access Token allowed for the organization. Active - Mailbox users can
        # login to the web application and choose Settings to see the new Personal Access Tokens page to
        # create and delete the Personal Access Tokens. Mailbox users can use the Personal Access Tokens to
        # set up mailbox connection from desktop or mobile email clients. Inactive - Personal Access Tokens
        # are disabled for your organization. Mailbox users can’t create, list, or delete Personal Access
        # Tokens and can’t use them to connect to their mailboxes from desktop or mobile email clients.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The validity of the Personal Access Token status in days.

        @[JSON::Field(key: "LifetimeInDays")]
        getter lifetime_in_days : Int32?

        def initialize(
          @status : String,
          @lifetime_in_days : Int32? = nil
        )
        end
      end

      # The summary of the Personal Access Token.

      struct PersonalAccessTokenSummary
        include JSON::Serializable

        # The date when the Personal Access Token was created.

        @[JSON::Field(key: "DateCreated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_created : Time?

        # The date when the Personal Access Token was last used.

        @[JSON::Field(key: "DateLastUsed", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_last_used : Time?

        # The date when the Personal Access Token will expire.

        @[JSON::Field(key: "ExpiresTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_time : Time?

        # The name of the Personal Access Token.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the Personal Access Token.

        @[JSON::Field(key: "PersonalAccessTokenId")]
        getter personal_access_token_id : String?

        # Lists all the Personal Access Token permissions for a mailbox.

        @[JSON::Field(key: "Scopes")]
        getter scopes : Array(String)?

        # The user ID of the WorkMail user associated with the Personal Access Token.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @date_created : Time? = nil,
          @date_last_used : Time? = nil,
          @expires_time : Time? = nil,
          @name : String? = nil,
          @personal_access_token_id : String? = nil,
          @scopes : Array(String)? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct PutAccessControlRuleRequest
        include JSON::Serializable

        # The rule description.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The rule effect.

        @[JSON::Field(key: "Effect")]
        getter effect : String

        # The rule name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier of the organization.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # Access protocol actions to include in the rule. Valid values include ActiveSync , AutoDiscover , EWS
        # , IMAP , SMTP , WindowsOutlook , and WebMail .

        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)?

        # Impersonation role IDs to include in the rule.

        @[JSON::Field(key: "ImpersonationRoleIds")]
        getter impersonation_role_ids : Array(String)?

        # IPv4 CIDR ranges to include in the rule.

        @[JSON::Field(key: "IpRanges")]
        getter ip_ranges : Array(String)?

        # Access protocol actions to exclude from the rule. Valid values include ActiveSync , AutoDiscover ,
        # EWS , IMAP , SMTP , WindowsOutlook , and WebMail .

        @[JSON::Field(key: "NotActions")]
        getter not_actions : Array(String)?

        # Impersonation role IDs to exclude from the rule.

        @[JSON::Field(key: "NotImpersonationRoleIds")]
        getter not_impersonation_role_ids : Array(String)?

        # IPv4 CIDR ranges to exclude from the rule.

        @[JSON::Field(key: "NotIpRanges")]
        getter not_ip_ranges : Array(String)?

        # User IDs to exclude from the rule.

        @[JSON::Field(key: "NotUserIds")]
        getter not_user_ids : Array(String)?

        # User IDs to include in the rule.

        @[JSON::Field(key: "UserIds")]
        getter user_ids : Array(String)?

        def initialize(
          @description : String,
          @effect : String,
          @name : String,
          @organization_id : String,
          @actions : Array(String)? = nil,
          @impersonation_role_ids : Array(String)? = nil,
          @ip_ranges : Array(String)? = nil,
          @not_actions : Array(String)? = nil,
          @not_impersonation_role_ids : Array(String)? = nil,
          @not_ip_ranges : Array(String)? = nil,
          @not_user_ids : Array(String)? = nil,
          @user_ids : Array(String)? = nil
        )
        end
      end


      struct PutAccessControlRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutEmailMonitoringConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email monitoring
        # configuration.

        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String

        # The ID of the organization for which the email monitoring configuration is set.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring configuration.
        # If absent, the IAM Role Arn of AWSServiceRoleForAmazonWorkMailEvents will be used.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @log_group_arn : String,
          @organization_id : String,
          @role_arn : String? = nil
        )
        end
      end


      struct PutEmailMonitoringConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutIdentityProviderConfigurationRequest
        include JSON::Serializable

        # The authentication mode used in WorkMail.

        @[JSON::Field(key: "AuthenticationMode")]
        getter authentication_mode : String

        # The details of the IAM Identity Center configuration.

        @[JSON::Field(key: "IdentityCenterConfiguration")]
        getter identity_center_configuration : Types::IdentityCenterConfiguration

        # The ID of the WorkMail Organization.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The details of the Personal Access Token configuration.

        @[JSON::Field(key: "PersonalAccessTokenConfiguration")]
        getter personal_access_token_configuration : Types::PersonalAccessTokenConfiguration

        def initialize(
          @authentication_mode : String,
          @identity_center_configuration : Types::IdentityCenterConfiguration,
          @organization_id : String,
          @personal_access_token_configuration : Types::PersonalAccessTokenConfiguration
        )
        end
      end


      struct PutIdentityProviderConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutInboundDmarcSettingsRequest
        include JSON::Serializable

        # Enforces or suspends a policy after it's applied.

        @[JSON::Field(key: "Enforced")]
        getter enforced : Bool

        # The ID of the organization that you are applying the DMARC policy to.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @enforced : Bool,
          @organization_id : String
        )
        end
      end


      struct PutInboundDmarcSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutMailboxPermissionsRequest
        include JSON::Serializable

        # The identifier of the user or resource for which to update mailbox permissions. The identifier can
        # be UserId, ResourceID, or Group Id , Username, Resourcename, or Groupname , or email . Entity ID:
        # 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: entity@domain.tld Entity name: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The identifier of the user, group, or resource to which to grant the permissions. The identifier can
        # be UserId, ResourceID, or Group Id , Username, Resourcename, or Groupname , or email . Grantee ID:
        # 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: grantee@domain.tld Grantee name: grantee

        @[JSON::Field(key: "GranteeId")]
        getter grantee_id : String

        # The identifier of the organization under which the user, group, or resource exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the
        # mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send
        # email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of
        # these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other
        # folder-level permissions set on the mailbox.

        @[JSON::Field(key: "PermissionValues")]
        getter permission_values : Array(String)

        def initialize(
          @entity_id : String,
          @grantee_id : String,
          @organization_id : String,
          @permission_values : Array(String)
        )
        end
      end


      struct PutMailboxPermissionsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutMobileDeviceAccessOverrideRequest
        include JSON::Serializable

        # The mobile device for which you create the override. DeviceId is case insensitive.

        @[JSON::Field(key: "DeviceId")]
        getter device_id : String

        # The effect of the override, ALLOW or DENY .

        @[JSON::Field(key: "Effect")]
        getter effect : String

        # Identifies the WorkMail organization for which you create the override.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The WorkMail user for which you create the override. Accepts the following types of user identities:
        # User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234 Email
        # address: user@domain.tld User name: user

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # A description of the override.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @device_id : String,
          @effect : String,
          @organization_id : String,
          @user_id : String,
          @description : String? = nil
        )
        end
      end


      struct PutMobileDeviceAccessOverrideResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutRetentionPolicyRequest
        include JSON::Serializable

        # The retention policy folder configurations.

        @[JSON::Field(key: "FolderConfigurations")]
        getter folder_configurations : Array(Types::FolderConfiguration)

        # The retention policy name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The organization ID.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The retention policy description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The retention policy ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @folder_configurations : Array(Types::FolderConfiguration),
          @name : String,
          @organization_id : String,
          @description : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct PutRetentionPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an EWS based availability provider when returned from the service. It does not contain the
      # password of the endpoint.

      struct RedactedEwsAvailabilityProvider
        include JSON::Serializable

        # The endpoint of the remote EWS server.

        @[JSON::Field(key: "EwsEndpoint")]
        getter ews_endpoint : String?

        # The username used to authenticate the remote EWS server.

        @[JSON::Field(key: "EwsUsername")]
        getter ews_username : String?

        def initialize(
          @ews_endpoint : String? = nil,
          @ews_username : String? = nil
        )
        end
      end


      struct RegisterMailDomainRequest
        include JSON::Serializable

        # The name of the mail domain to create in WorkMail and SES.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The WorkMail organization under which you're creating the domain.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # Idempotency token used when retrying requests.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @domain_name : String,
          @organization_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct RegisterMailDomainResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct RegisterToWorkMailRequest
        include JSON::Serializable

        # The email for the user, group, or resource to be updated.

        @[JSON::Field(key: "Email")]
        getter email : String

        # The identifier for the user, group, or resource to be updated. The identifier can accept UserId,
        # ResourceId, or GroupId , or Username, Resourcename, or Groupname . The following identity formats
        # are available: Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789,
        # or S-1-1-12-1234567890-123456789-123456789-1234 Entity name: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The identifier for the organization under which the user, group, or resource exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @email : String,
          @entity_id : String,
          @organization_id : String
        )
        end
      end


      struct RegisterToWorkMailResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This user, group, or resource name is not allowed in WorkMail.

      struct ReservedNameException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ResetPasswordRequest
        include JSON::Serializable

        # The identifier of the organization that contains the user for which the password is reset.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The new password for the user.

        @[JSON::Field(key: "Password")]
        getter password : String

        # The identifier of the user for whom the password is reset.

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @organization_id : String,
          @password : String,
          @user_id : String
        )
        end
      end


      struct ResetPasswordResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The representation of a resource.

      struct Resource
        include JSON::Serializable

        # Resource description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date indicating when the resource was disabled from WorkMail use.

        @[JSON::Field(key: "DisabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter disabled_date : Time?

        # The email of the resource.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The date indicating when the resource was enabled for WorkMail use.

        @[JSON::Field(key: "EnabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter enabled_date : Time?

        # The identifier of the resource.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the resource, which can be ENABLED, DISABLED, or DELETED.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The type of the resource: equipment or room.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @description : String? = nil,
          @disabled_date : Time? = nil,
          @email : String? = nil,
          @enabled_date : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The resource cannot be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartMailboxExportJobRequest
        include JSON::Serializable

        # The idempotency token for the client request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The identifier of the user or resource associated with the mailbox. The identifier can accept UserId
        # or ResourceId , Username or Resourcename , or email . The following identity formats are available:
        # Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789 , or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: entity@domain.tld Entity name: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key that
        # encrypts the exported mailbox content.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String

        # The identifier associated with the organization.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The ARN of the AWS Identity and Access Management (IAM) role that grants write permission to the S3
        # bucket.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The name of the S3 bucket.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        # The S3 bucket prefix.

        @[JSON::Field(key: "S3Prefix")]
        getter s3_prefix : String

        # The mailbox export job description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @client_token : String,
          @entity_id : String,
          @kms_key_arn : String,
          @organization_id : String,
          @role_arn : String,
          @s3_bucket_name : String,
          @s3_prefix : String,
          @description : String? = nil
        )
        end
      end


      struct StartMailboxExportJobResponse
        include JSON::Serializable

        # The job ID.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      # Describes a tag applied to a resource.

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag.

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

        # The resource ARN.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tag key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct TestAvailabilityConfigurationRequest
        include JSON::Serializable

        # The WorkMail organization where the availability provider will be tested.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The domain to which the provider applies. If this field is provided, a stored availability provider
        # associated to this domain name will be tested.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?


        @[JSON::Field(key: "EwsProvider")]
        getter ews_provider : Types::EwsAvailabilityProvider?


        @[JSON::Field(key: "LambdaProvider")]
        getter lambda_provider : Types::LambdaAvailabilityProvider?

        def initialize(
          @organization_id : String,
          @domain_name : String? = nil,
          @ews_provider : Types::EwsAvailabilityProvider? = nil,
          @lambda_provider : Types::LambdaAvailabilityProvider? = nil
        )
        end
      end


      struct TestAvailabilityConfigurationResponse
        include JSON::Serializable

        # String containing the reason for a failed test if TestPassed is false.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # Boolean indicating whether the test passed or failed.

        @[JSON::Field(key: "TestPassed")]
        getter test_passed : Bool?

        def initialize(
          @failure_reason : String? = nil,
          @test_passed : Bool? = nil
        )
        end
      end

      # The resource can have up to 50 user-applied tags.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You can't perform a write operation against a read-only directory.

      struct UnsupportedOperationException
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

        # The resource ARN.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tag keys.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAvailabilityConfigurationRequest
        include JSON::Serializable

        # The domain to which the provider applies the availability configuration.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The WorkMail organization for which the AvailabilityConfiguration will be updated.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The EWS availability provider definition. The request must contain exactly one provider definition,
        # either EwsProvider or LambdaProvider . The previously stored provider will be overridden by the one
        # provided.

        @[JSON::Field(key: "EwsProvider")]
        getter ews_provider : Types::EwsAvailabilityProvider?

        # The Lambda availability provider definition. The request must contain exactly one provider
        # definition, either EwsProvider or LambdaProvider . The previously stored provider will be overridden
        # by the one provided.

        @[JSON::Field(key: "LambdaProvider")]
        getter lambda_provider : Types::LambdaAvailabilityProvider?

        def initialize(
          @domain_name : String,
          @organization_id : String,
          @ews_provider : Types::EwsAvailabilityProvider? = nil,
          @lambda_provider : Types::LambdaAvailabilityProvider? = nil
        )
        end
      end


      struct UpdateAvailabilityConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDefaultMailDomainRequest
        include JSON::Serializable

        # The domain name that will become the default domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The WorkMail organization for which to list domains.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @domain_name : String,
          @organization_id : String
        )
        end
      end


      struct UpdateDefaultMailDomainResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateGroupRequest
        include JSON::Serializable

        # The identifier for the group to be updated. The identifier can accept GroupId , Groupname , or email
        # . The following identity formats are available: Group ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: group@domain.tld Group name: group

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The identifier for the organization under which the group exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # If enabled, the group is hidden from the global address list.

        @[JSON::Field(key: "HiddenFromGlobalAddressList")]
        getter hidden_from_global_address_list : Bool?

        def initialize(
          @group_id : String,
          @organization_id : String,
          @hidden_from_global_address_list : Bool? = nil
        )
        end
      end


      struct UpdateGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateImpersonationRoleRequest
        include JSON::Serializable

        # The ID of the impersonation role to update.

        @[JSON::Field(key: "ImpersonationRoleId")]
        getter impersonation_role_id : String

        # The updated impersonation role name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The WorkMail organization that contains the impersonation role to update.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The updated list of rules.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ImpersonationRule)

        # The updated impersonation role type.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The updated impersonation role description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @impersonation_role_id : String,
          @name : String,
          @organization_id : String,
          @rules : Array(Types::ImpersonationRule),
          @type : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateImpersonationRoleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateMailboxQuotaRequest
        include JSON::Serializable

        # The updated mailbox quota, in MB, for the specified user.

        @[JSON::Field(key: "MailboxQuota")]
        getter mailbox_quota : Int32

        # The identifier for the organization that contains the user for whom to update the mailbox quota.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifer for the user for whom to update the mailbox quota. The identifier can be the UserId ,
        # Username , or email . The following identity formats are available: User ID:
        # 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234 Email address:
        # user@domain.tld User name: user

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @mailbox_quota : Int32,
          @organization_id : String,
          @user_id : String
        )
        end
      end


      struct UpdateMailboxQuotaResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateMobileDeviceAccessRuleRequest
        include JSON::Serializable

        # The effect of the rule when it matches. Allowed values are ALLOW or DENY .

        @[JSON::Field(key: "Effect")]
        getter effect : String

        # The identifier of the rule to be updated.

        @[JSON::Field(key: "MobileDeviceAccessRuleId")]
        getter mobile_device_access_rule_id : String

        # The updated rule name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The WorkMail organization under which the rule will be updated.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The updated rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Device models that the updated rule will match.

        @[JSON::Field(key: "DeviceModels")]
        getter device_models : Array(String)?

        # Device operating systems that the updated rule will match.

        @[JSON::Field(key: "DeviceOperatingSystems")]
        getter device_operating_systems : Array(String)?

        # Device types that the updated rule will match.

        @[JSON::Field(key: "DeviceTypes")]
        getter device_types : Array(String)?

        # User agents that the updated rule will match.

        @[JSON::Field(key: "DeviceUserAgents")]
        getter device_user_agents : Array(String)?

        # Device models that the updated rule will not match. All other device models will match.

        @[JSON::Field(key: "NotDeviceModels")]
        getter not_device_models : Array(String)?

        # Device operating systems that the updated rule will not match. All other device operating systems
        # will match.

        @[JSON::Field(key: "NotDeviceOperatingSystems")]
        getter not_device_operating_systems : Array(String)?

        # Device types that the updated rule will not match. All other device types will match.

        @[JSON::Field(key: "NotDeviceTypes")]
        getter not_device_types : Array(String)?

        # User agents that the updated rule will not match. All other user agents will match.

        @[JSON::Field(key: "NotDeviceUserAgents")]
        getter not_device_user_agents : Array(String)?

        def initialize(
          @effect : String,
          @mobile_device_access_rule_id : String,
          @name : String,
          @organization_id : String,
          @description : String? = nil,
          @device_models : Array(String)? = nil,
          @device_operating_systems : Array(String)? = nil,
          @device_types : Array(String)? = nil,
          @device_user_agents : Array(String)? = nil,
          @not_device_models : Array(String)? = nil,
          @not_device_operating_systems : Array(String)? = nil,
          @not_device_types : Array(String)? = nil,
          @not_device_user_agents : Array(String)? = nil
        )
        end
      end


      struct UpdateMobileDeviceAccessRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdatePrimaryEmailAddressRequest
        include JSON::Serializable

        # The value of the email to be updated as primary.

        @[JSON::Field(key: "Email")]
        getter email : String

        # The user, group, or resource to update. The identifier can accept UseriD, ResourceId, or GroupId ,
        # Username, Resourcename, or Groupname , or email . The following identity formats are available:
        # Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: entity@domain.tld Entity name: entity

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The organization that contains the user, group, or resource to update.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        def initialize(
          @email : String,
          @entity_id : String,
          @organization_id : String
        )
        end
      end


      struct UpdatePrimaryEmailAddressResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateResourceRequest
        include JSON::Serializable

        # The identifier associated with the organization for which the resource is updated.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifier of the resource to be updated. The identifier can accept ResourceId , Resourcename ,
        # or email . The following identity formats are available: Resource ID:
        # r-0123456789a0123456789b0123456789 Email address: resource@domain.tld Resource name: resource

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource's booking options to be updated.

        @[JSON::Field(key: "BookingOptions")]
        getter booking_options : Types::BookingOptions?

        # Updates the resource description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If enabled, the resource is hidden from the global address list.

        @[JSON::Field(key: "HiddenFromGlobalAddressList")]
        getter hidden_from_global_address_list : Bool?

        # The name of the resource to be updated.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Updates the resource type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @organization_id : String,
          @resource_id : String,
          @booking_options : Types::BookingOptions? = nil,
          @description : String? = nil,
          @hidden_from_global_address_list : Bool? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct UpdateResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateUserRequest
        include JSON::Serializable

        # The identifier for the organization under which the user exists.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The identifier for the user to be updated. The identifier can be the UserId , Username , or email .
        # The following identity formats are available: User ID: 12345678-1234-1234-1234-123456789012 or
        # S-1-1-12-1234567890-123456789-123456789-1234 Email address: user@domain.tld User name: user

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Updates the user's city.

        @[JSON::Field(key: "City")]
        getter city : String?

        # Updates the user's company.

        @[JSON::Field(key: "Company")]
        getter company : String?

        # Updates the user's country.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # Updates the user's department.

        @[JSON::Field(key: "Department")]
        getter department : String?

        # Updates the display name of the user.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # Updates the user's first name.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # If enabled, the user is hidden from the global address list.

        @[JSON::Field(key: "HiddenFromGlobalAddressList")]
        getter hidden_from_global_address_list : Bool?

        # User ID from the IAM Identity Center. If this parameter is empty it will be updated automatically
        # when the user logs in for the first time to the mailbox associated with WorkMail.

        @[JSON::Field(key: "IdentityProviderUserId")]
        getter identity_provider_user_id : String?

        # Updates the user's initials.

        @[JSON::Field(key: "Initials")]
        getter initials : String?

        # Updates the user's job title.

        @[JSON::Field(key: "JobTitle")]
        getter job_title : String?

        # Updates the user's last name.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # Updates the user's office.

        @[JSON::Field(key: "Office")]
        getter office : String?

        # Updates the user role. You cannot pass SYSTEM_USER or RESOURCE .

        @[JSON::Field(key: "Role")]
        getter role : String?

        # Updates the user's street address.

        @[JSON::Field(key: "Street")]
        getter street : String?

        # Updates the user's contact details.

        @[JSON::Field(key: "Telephone")]
        getter telephone : String?

        # Updates the user's zip code.

        @[JSON::Field(key: "ZipCode")]
        getter zip_code : String?

        def initialize(
          @organization_id : String,
          @user_id : String,
          @city : String? = nil,
          @company : String? = nil,
          @country : String? = nil,
          @department : String? = nil,
          @display_name : String? = nil,
          @first_name : String? = nil,
          @hidden_from_global_address_list : Bool? = nil,
          @identity_provider_user_id : String? = nil,
          @initials : String? = nil,
          @job_title : String? = nil,
          @last_name : String? = nil,
          @office : String? = nil,
          @role : String? = nil,
          @street : String? = nil,
          @telephone : String? = nil,
          @zip_code : String? = nil
        )
        end
      end


      struct UpdateUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The representation of an WorkMail user.

      struct User
        include JSON::Serializable

        # The date indicating when the user was disabled from WorkMail use.

        @[JSON::Field(key: "DisabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter disabled_date : Time?

        # The display name of the user.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The email of the user.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The date indicating when the user was enabled for WorkMail use.

        @[JSON::Field(key: "EnabledDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter enabled_date : Time?

        # The identifier of the user.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Identity store ID from the IAM Identity Center. If this parameter is empty it will be updated
        # automatically when the user logs in for the first time to the mailbox associated with WorkMail.

        @[JSON::Field(key: "IdentityProviderIdentityStoreId")]
        getter identity_provider_identity_store_id : String?

        # User ID from the IAM Identity Center. If this parameter is empty it will be updated automatically
        # when the user logs in for the first time to the mailbox associated with WorkMail.

        @[JSON::Field(key: "IdentityProviderUserId")]
        getter identity_provider_user_id : String?

        # The name of the user.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the user, which can be ENABLED, DISABLED, or DELETED.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The role of the user.

        @[JSON::Field(key: "UserRole")]
        getter user_role : String?

        def initialize(
          @disabled_date : Time? = nil,
          @display_name : String? = nil,
          @email : String? = nil,
          @enabled_date : Time? = nil,
          @id : String? = nil,
          @identity_provider_identity_store_id : String? = nil,
          @identity_provider_user_id : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @user_role : String? = nil
        )
        end
      end
    end
  end
end
