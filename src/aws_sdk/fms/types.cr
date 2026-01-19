require "json"
require "time"

module AwsSdk
  module FMS
    module Types

      # Configures the accounts within the administrator's Organizations organization that the specified
      # Firewall Manager administrator can apply policies to.
      struct AccountScope
        include JSON::Serializable

        # The list of accounts within the organization that the specified Firewall Manager administrator
        # either can or cannot apply policies to, based on the value of ExcludeSpecifiedAccounts . If
        # ExcludeSpecifiedAccounts is set to true , then the Firewall Manager administrator can apply policies
        # to all members of the organization except for the accounts in this list. If ExcludeSpecifiedAccounts
        # is set to false , then the Firewall Manager administrator can only apply policies to the accounts in
        # this list.
        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # A boolean value that indicates if the administrator can apply policies to all accounts within an
        # organization. If true, the administrator can apply policies to all accounts within the organization.
        # You can either enable management of all accounts through this operation, or you can specify a list
        # of accounts to manage in AccountScope$Accounts . You cannot specify both.
        @[JSON::Field(key: "AllAccountsEnabled")]
        getter all_accounts_enabled : Bool?

        # A boolean value that excludes the accounts in AccountScope$Accounts from the administrator's scope.
        # If true, the Firewall Manager administrator can apply policies to all members of the organization
        # except for the accounts listed in AccountScope$Accounts . You can either specify a list of accounts
        # to exclude by AccountScope$Accounts , or you can enable management of all accounts by
        # AccountScope$AllAccountsEnabled . You cannot specify both.
        @[JSON::Field(key: "ExcludeSpecifiedAccounts")]
        getter exclude_specified_accounts : Bool?

        def initialize(
          @accounts : Array(String)? = nil,
          @all_accounts_enabled : Bool? = nil,
          @exclude_specified_accounts : Bool? = nil
        )
        end
      end

      # Describes a remediation action target.
      struct ActionTarget
        include JSON::Serializable

        # A description of the remediation action target.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the remediation target.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @description : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # Contains high level information about the Firewall Manager administrator account.
      struct AdminAccountSummary
        include JSON::Serializable

        # The Amazon Web Services account ID of the Firewall Manager administrator's account.
        @[JSON::Field(key: "AdminAccount")]
        getter admin_account : String?

        # A boolean value that indicates if the administrator is the default administrator. If true, then this
        # is the default administrator account. The default administrator can manage third-party firewalls and
        # has full administrative scope. There is only one default administrator account per organization. For
        # information about Firewall Manager default administrator accounts, see Managing Firewall Manager
        # administrators in the Firewall Manager Developer Guide .
        @[JSON::Field(key: "DefaultAdmin")]
        getter default_admin : Bool?

        # The current status of the request to onboard a member account as an Firewall Manager administrator.
        # ONBOARDING - The account is onboarding to Firewall Manager as an administrator. ONBOARDING_COMPLETE
        # - Firewall Manager The account is onboarded to Firewall Manager as an administrator, and can perform
        # actions on the resources defined in their AdminScope . OFFBOARDING - The account is being removed as
        # an Firewall Manager administrator. OFFBOARDING_COMPLETE - The account has been removed as an
        # Firewall Manager administrator.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @admin_account : String? = nil,
          @default_admin : Bool? = nil,
          @status : String? = nil
        )
        end
      end

      # Defines the resources that the Firewall Manager administrator can manage. For more information about
      # administrative scope, see Managing Firewall Manager administrators in the Firewall Manager Developer
      # Guide .
      struct AdminScope
        include JSON::Serializable

        # Defines the accounts that the specified Firewall Manager administrator can apply policies to.
        @[JSON::Field(key: "AccountScope")]
        getter account_scope : Types::AccountScope?

        # Defines the Organizations organizational units that the specified Firewall Manager administrator can
        # apply policies to. For more information about OUs in Organizations, see Managing organizational
        # units (OUs) in the Organizations User Guide .
        @[JSON::Field(key: "OrganizationalUnitScope")]
        getter organizational_unit_scope : Types::OrganizationalUnitScope?

        # Defines the Firewall Manager policy types that the specified Firewall Manager administrator can
        # create and manage.
        @[JSON::Field(key: "PolicyTypeScope")]
        getter policy_type_scope : Types::PolicyTypeScope?

        # Defines the Amazon Web Services Regions that the specified Firewall Manager administrator can
        # perform actions in.
        @[JSON::Field(key: "RegionScope")]
        getter region_scope : Types::RegionScope?

        def initialize(
          @account_scope : Types::AccountScope? = nil,
          @organizational_unit_scope : Types::OrganizationalUnitScope? = nil,
          @policy_type_scope : Types::PolicyTypeScope? = nil,
          @region_scope : Types::RegionScope? = nil
        )
        end
      end

      # An individual Firewall Manager application.
      struct App
        include JSON::Serializable

        # The application's name.
        @[JSON::Field(key: "AppName")]
        getter app_name : String

        # The application's port number, for example 80 .
        @[JSON::Field(key: "Port")]
        getter port : Int64

        # The IP protocol name or number. The name can be one of tcp , udp , or icmp . For information on
        # possible numbers, see Protocol Numbers .
        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        def initialize(
          @app_name : String,
          @port : Int64,
          @protocol : String
        )
        end
      end

      # An Firewall Manager applications list.
      struct AppsListData
        include JSON::Serializable

        # An array of applications in the Firewall Manager applications list.
        @[JSON::Field(key: "AppsList")]
        getter apps_list : Array(Types::App)

        # The name of the Firewall Manager applications list.
        @[JSON::Field(key: "ListName")]
        getter list_name : String

        # The time that the Firewall Manager applications list was created.
        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The time that the Firewall Manager applications list was last updated.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # The ID of the Firewall Manager applications list.
        @[JSON::Field(key: "ListId")]
        getter list_id : String?

        # A unique identifier for each update to the list. When you update the list, the update token must
        # match the token of the current version of the application list. You can retrieve the update token by
        # getting the list.
        @[JSON::Field(key: "ListUpdateToken")]
        getter list_update_token : String?

        # A map of previous version numbers to their corresponding App object arrays.
        @[JSON::Field(key: "PreviousAppsList")]
        getter previous_apps_list : Hash(String, Array(Types::App))?

        def initialize(
          @apps_list : Array(Types::App),
          @list_name : String,
          @create_time : Time? = nil,
          @last_update_time : Time? = nil,
          @list_id : String? = nil,
          @list_update_token : String? = nil,
          @previous_apps_list : Hash(String, Array(Types::App))? = nil
        )
        end
      end

      # Details of the Firewall Manager applications list.
      struct AppsListDataSummary
        include JSON::Serializable

        # An array of App objects in the Firewall Manager applications list.
        @[JSON::Field(key: "AppsList")]
        getter apps_list : Array(Types::App)?

        # The Amazon Resource Name (ARN) of the applications list.
        @[JSON::Field(key: "ListArn")]
        getter list_arn : String?

        # The ID of the applications list.
        @[JSON::Field(key: "ListId")]
        getter list_id : String?

        # The name of the applications list.
        @[JSON::Field(key: "ListName")]
        getter list_name : String?

        def initialize(
          @apps_list : Array(Types::App)? = nil,
          @list_arn : String? = nil,
          @list_id : String? = nil,
          @list_name : String? = nil
        )
        end
      end

      struct AssociateAdminAccountRequest
        include JSON::Serializable

        # The Amazon Web Services account ID to associate with Firewall Manager as the Firewall Manager
        # default administrator account. This account must be a member account of the organization in
        # Organizations whose resources you want to protect. For more information about Organizations, see
        # Managing the Amazon Web Services Accounts in Your Organization .
        @[JSON::Field(key: "AdminAccount")]
        getter admin_account : String

        def initialize(
          @admin_account : String
        )
        end
      end

      struct AssociateThirdPartyFirewallRequest
        include JSON::Serializable

        # The name of the third-party firewall vendor.
        @[JSON::Field(key: "ThirdPartyFirewall")]
        getter third_party_firewall : String

        def initialize(
          @third_party_firewall : String
        )
        end
      end

      struct AssociateThirdPartyFirewallResponse
        include JSON::Serializable

        # The current status for setting a Firewall Manager policy administrator's account as an administrator
        # of the third-party firewall tenant. ONBOARDING - The Firewall Manager policy administrator is being
        # designated as a tenant administrator. ONBOARD_COMPLETE - The Firewall Manager policy administrator
        # is designated as a tenant administrator. OFFBOARDING - The Firewall Manager policy administrator is
        # being removed as a tenant administrator. OFFBOARD_COMPLETE - The Firewall Manager policy
        # administrator has been removed as a tenant administrator. NOT_EXIST - The Firewall Manager policy
        # administrator doesn't exist as a tenant administrator.
        @[JSON::Field(key: "ThirdPartyFirewallStatus")]
        getter third_party_firewall_status : String?

        def initialize(
          @third_party_firewall_status : String? = nil
        )
        end
      end

      # Violation detail for an EC2 instance resource.
      struct AwsEc2InstanceViolation
        include JSON::Serializable

        # Violation detail for network interfaces associated with the EC2 instance.
        @[JSON::Field(key: "AwsEc2NetworkInterfaceViolations")]
        getter aws_ec2_network_interface_violations : Array(Types::AwsEc2NetworkInterfaceViolation)?

        # The resource ID of the EC2 instance.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        def initialize(
          @aws_ec2_network_interface_violations : Array(Types::AwsEc2NetworkInterfaceViolation)? = nil,
          @violation_target : String? = nil
        )
        end
      end

      # Violation detail for network interfaces associated with an EC2 instance.
      struct AwsEc2NetworkInterfaceViolation
        include JSON::Serializable

        # List of security groups that violate the rules specified in the primary security group of the
        # Firewall Manager policy.
        @[JSON::Field(key: "ViolatingSecurityGroups")]
        getter violating_security_groups : Array(String)?

        # The resource ID of the network interface.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        def initialize(
          @violating_security_groups : Array(String)? = nil,
          @violation_target : String? = nil
        )
        end
      end

      # Violation detail for the rule violation in a security group when compared to the primary security
      # group of the Firewall Manager policy.
      struct AwsVPCSecurityGroupViolation
        include JSON::Serializable

        # List of rules specified in the security group of the Firewall Manager policy that partially match
        # the ViolationTarget rule.
        @[JSON::Field(key: "PartialMatches")]
        getter partial_matches : Array(Types::PartialMatch)?

        # Remediation options for the rule specified in the ViolationTarget .
        @[JSON::Field(key: "PossibleSecurityGroupRemediationActions")]
        getter possible_security_group_remediation_actions : Array(Types::SecurityGroupRemediationAction)?

        # The security group rule that is being evaluated.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        # A description of the security group that violates the policy.
        @[JSON::Field(key: "ViolationTargetDescription")]
        getter violation_target_description : String?

        def initialize(
          @partial_matches : Array(Types::PartialMatch)? = nil,
          @possible_security_group_remediation_actions : Array(Types::SecurityGroupRemediationAction)? = nil,
          @violation_target : String? = nil,
          @violation_target_description : String? = nil
        )
        end
      end

      struct BatchAssociateResourceRequest
        include JSON::Serializable

        # The uniform resource identifiers (URIs) of resources that should be associated to the resource set.
        # The URIs must be Amazon Resource Names (ARNs).
        @[JSON::Field(key: "Items")]
        getter items : Array(String)

        # A unique identifier for the resource set, used in a request to refer to the resource set.
        @[JSON::Field(key: "ResourceSetIdentifier")]
        getter resource_set_identifier : String

        def initialize(
          @items : Array(String),
          @resource_set_identifier : String
        )
        end
      end

      struct BatchAssociateResourceResponse
        include JSON::Serializable

        # The resources that failed to associate to the resource set.
        @[JSON::Field(key: "FailedItems")]
        getter failed_items : Array(Types::FailedItem)

        # A unique identifier for the resource set, used in a request to refer to the resource set.
        @[JSON::Field(key: "ResourceSetIdentifier")]
        getter resource_set_identifier : String

        def initialize(
          @failed_items : Array(Types::FailedItem),
          @resource_set_identifier : String
        )
        end
      end

      struct BatchDisassociateResourceRequest
        include JSON::Serializable

        # The uniform resource identifiers (URI) of resources that should be disassociated from the resource
        # set. The URIs must be Amazon Resource Names (ARNs).
        @[JSON::Field(key: "Items")]
        getter items : Array(String)

        # A unique identifier for the resource set, used in a request to refer to the resource set.
        @[JSON::Field(key: "ResourceSetIdentifier")]
        getter resource_set_identifier : String

        def initialize(
          @items : Array(String),
          @resource_set_identifier : String
        )
        end
      end

      struct BatchDisassociateResourceResponse
        include JSON::Serializable

        # The resources that failed to disassociate from the resource set.
        @[JSON::Field(key: "FailedItems")]
        getter failed_items : Array(Types::FailedItem)

        # A unique identifier for the resource set, used in a request to refer to the resource set.
        @[JSON::Field(key: "ResourceSetIdentifier")]
        getter resource_set_identifier : String

        def initialize(
          @failed_items : Array(Types::FailedItem),
          @resource_set_identifier : String
        )
        end
      end

      # Details of the resource that is not protected by the policy.
      struct ComplianceViolator
        include JSON::Serializable

        # Metadata about the resource that doesn't comply with the policy scope.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, String)?

        # The resource ID.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource type. This is in the format shown in the Amazon Web Services Resource Types Reference .
        # For example: AWS::ElasticLoadBalancingV2::LoadBalancer , AWS::CloudFront::Distribution , or
        # AWS::NetworkFirewall::FirewallPolicy .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The reason that the resource is not protected by the policy.
        @[JSON::Field(key: "ViolationReason")]
        getter violation_reason : String?

        def initialize(
          @metadata : Hash(String, String)? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @violation_reason : String? = nil
        )
        end
      end

      # Information about the CreateNetworkAcl action in Amazon EC2. This is a remediation option in
      # RemediationAction .
      struct CreateNetworkAclAction
        include JSON::Serializable

        # Brief description of this remediation action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether it is possible for Firewall Manager to perform this remediation action. A false
        # value indicates that auto remediation is disabled or Firewall Manager is unable to perform the
        # action due to a conflict of some kind.
        @[JSON::Field(key: "FMSCanRemediate")]
        getter fms_can_remediate : Bool?

        # The VPC that's associated with the remediation action.
        @[JSON::Field(key: "Vpc")]
        getter vpc : Types::ActionTarget?

        def initialize(
          @description : String? = nil,
          @fms_can_remediate : Bool? = nil,
          @vpc : Types::ActionTarget? = nil
        )
        end
      end

      # Information about the CreateNetworkAclEntries action in Amazon EC2. This is a remediation option in
      # RemediationAction .
      struct CreateNetworkAclEntriesAction
        include JSON::Serializable

        # Brief description of this remediation action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether it is possible for Firewall Manager to perform this remediation action. A false
        # value indicates that auto remediation is disabled or Firewall Manager is unable to perform the
        # action due to a conflict of some kind.
        @[JSON::Field(key: "FMSCanRemediate")]
        getter fms_can_remediate : Bool?

        # Lists the entries that the remediation action would create.
        @[JSON::Field(key: "NetworkAclEntriesToBeCreated")]
        getter network_acl_entries_to_be_created : Array(Types::EntryDescription)?

        # The network ACL that's associated with the remediation action.
        @[JSON::Field(key: "NetworkAclId")]
        getter network_acl_id : Types::ActionTarget?

        def initialize(
          @description : String? = nil,
          @fms_can_remediate : Bool? = nil,
          @network_acl_entries_to_be_created : Array(Types::EntryDescription)? = nil,
          @network_acl_id : Types::ActionTarget? = nil
        )
        end
      end

      struct DeleteAppsListRequest
        include JSON::Serializable

        # The ID of the applications list that you want to delete. You can retrieve this ID from PutAppsList ,
        # ListAppsLists , and GetAppsList .
        @[JSON::Field(key: "ListId")]
        getter list_id : String

        def initialize(
          @list_id : String
        )
        end
      end

      # Information about the DeleteNetworkAclEntries action in Amazon EC2. This is a remediation option in
      # RemediationAction .
      struct DeleteNetworkAclEntriesAction
        include JSON::Serializable

        # Brief description of this remediation action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether it is possible for Firewall Manager to perform this remediation action. A false
        # value indicates that auto remediation is disabled or Firewall Manager is unable to perform the
        # action due to a conflict of some kind.
        @[JSON::Field(key: "FMSCanRemediate")]
        getter fms_can_remediate : Bool?

        # Lists the entries that the remediation action would delete.
        @[JSON::Field(key: "NetworkAclEntriesToBeDeleted")]
        getter network_acl_entries_to_be_deleted : Array(Types::EntryDescription)?

        # The network ACL that's associated with the remediation action.
        @[JSON::Field(key: "NetworkAclId")]
        getter network_acl_id : Types::ActionTarget?

        def initialize(
          @description : String? = nil,
          @fms_can_remediate : Bool? = nil,
          @network_acl_entries_to_be_deleted : Array(Types::EntryDescription)? = nil,
          @network_acl_id : Types::ActionTarget? = nil
        )
        end
      end

      struct DeleteNotificationChannelRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePolicyRequest
        include JSON::Serializable

        # The ID of the policy that you want to delete. You can retrieve this ID from PutPolicy and
        # ListPolicies .
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # If True , the request performs cleanup according to the policy type. For WAF and Shield Advanced
        # policies, the cleanup does the following: Deletes rule groups created by Firewall Manager Removes
        # web ACLs from in-scope resources Deletes web ACLs that contain no rules or rule groups For security
        # group policies, the cleanup does the following for each security group in the policy: Disassociates
        # the security group from in-scope resources Deletes the security group if it was created through
        # Firewall Manager and if it's no longer associated with any resources through another policy For
        # security group common policies, even if set to False , Firewall Manager deletes all security groups
        # created by Firewall Manager that aren't associated with any other resources through another policy.
        # After the cleanup, in-scope resources are no longer protected by web ACLs in this policy. Protection
        # of out-of-scope resources remains unchanged. Scope is determined by tags that you create and
        # accounts that you associate with the policy. When creating the policy, if you specify that only
        # resources in specific accounts or with specific tags are in scope of the policy, those accounts and
        # resources are handled by the policy. All others are out of scope. If you don't specify tags or
        # accounts, all resources are in scope.
        @[JSON::Field(key: "DeleteAllPolicyResources")]
        getter delete_all_policy_resources : Bool?

        def initialize(
          @policy_id : String,
          @delete_all_policy_resources : Bool? = nil
        )
        end
      end

      struct DeleteProtocolsListRequest
        include JSON::Serializable

        # The ID of the protocols list that you want to delete. You can retrieve this ID from PutProtocolsList
        # , ListProtocolsLists , and GetProtocolsLost .
        @[JSON::Field(key: "ListId")]
        getter list_id : String

        def initialize(
          @list_id : String
        )
        end
      end

      struct DeleteResourceSetRequest
        include JSON::Serializable

        # A unique identifier for the resource set, used in a request to refer to the resource set.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct DisassociateAdminAccountRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateThirdPartyFirewallRequest
        include JSON::Serializable

        # The name of the third-party firewall vendor.
        @[JSON::Field(key: "ThirdPartyFirewall")]
        getter third_party_firewall : String

        def initialize(
          @third_party_firewall : String
        )
        end
      end

      struct DisassociateThirdPartyFirewallResponse
        include JSON::Serializable

        # The current status for the disassociation of a Firewall Manager administrators account with a
        # third-party firewall.
        @[JSON::Field(key: "ThirdPartyFirewallStatus")]
        getter third_party_firewall_status : String?

        def initialize(
          @third_party_firewall_status : String? = nil
        )
        end
      end

      # A resource in the organization that's available to be associated with a Firewall Manager resource
      # set.
      struct DiscoveredResource
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the discovered resource.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The name of the discovered resource.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of the discovered resource.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The universal resource identifier (URI) of the discovered resource.
        @[JSON::Field(key: "URI")]
        getter uri : String?

        def initialize(
          @account_id : String? = nil,
          @name : String? = nil,
          @type : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # A DNS Firewall rule group that Firewall Manager tried to associate with a VPC is already associated
      # with the VPC and can't be associated again.
      struct DnsDuplicateRuleGroupViolation
        include JSON::Serializable

        # Information about the VPC ID.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        # A description of the violation that specifies the rule group and VPC.
        @[JSON::Field(key: "ViolationTargetDescription")]
        getter violation_target_description : String?

        def initialize(
          @violation_target : String? = nil,
          @violation_target_description : String? = nil
        )
        end
      end

      # The VPC that Firewall Manager was applying a DNS Fireall policy to reached the limit for associated
      # DNS Firewall rule groups. Firewall Manager tried to associate another rule group with the VPC and
      # failed due to the limit.
      struct DnsRuleGroupLimitExceededViolation
        include JSON::Serializable

        # The number of rule groups currently associated with the VPC.
        @[JSON::Field(key: "NumberOfRuleGroupsAlreadyAssociated")]
        getter number_of_rule_groups_already_associated : Int32?

        # Information about the VPC ID.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        # A description of the violation that specifies the rule group and VPC.
        @[JSON::Field(key: "ViolationTargetDescription")]
        getter violation_target_description : String?

        def initialize(
          @number_of_rule_groups_already_associated : Int32? = nil,
          @violation_target : String? = nil,
          @violation_target_description : String? = nil
        )
        end
      end

      # A rule group that Firewall Manager tried to associate with a VPC has the same priority as a rule
      # group that's already associated.
      struct DnsRuleGroupPriorityConflictViolation
        include JSON::Serializable

        # The ID of the Firewall Manager DNS Firewall policy that was already applied to the VPC. This policy
        # contains the rule group that's already associated with the VPC.
        @[JSON::Field(key: "ConflictingPolicyId")]
        getter conflicting_policy_id : String?

        # The priority setting of the two conflicting rule groups.
        @[JSON::Field(key: "ConflictingPriority")]
        getter conflicting_priority : Int32?

        # The priorities of rule groups that are already associated with the VPC. To retry your operation,
        # choose priority settings that aren't in this list for the rule groups in your new DNS Firewall
        # policy.
        @[JSON::Field(key: "UnavailablePriorities")]
        getter unavailable_priorities : Array(Int32)?

        # Information about the VPC ID.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        # A description of the violation that specifies the VPC and the rule group that's already associated
        # with it.
        @[JSON::Field(key: "ViolationTargetDescription")]
        getter violation_target_description : String?

        def initialize(
          @conflicting_policy_id : String? = nil,
          @conflicting_priority : Int32? = nil,
          @unavailable_priorities : Array(Int32)? = nil,
          @violation_target : String? = nil,
          @violation_target_description : String? = nil
        )
        end
      end

      # The action of associating an EC2 resource, such as a subnet or internet gateway, with a route table.
      struct EC2AssociateRouteTableAction
        include JSON::Serializable

        # The ID of the EC2 route table that is associated with the remediation action.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : Types::ActionTarget

        # A description of the EC2 route table that is associated with the remediation action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the gateway to be used with the EC2 route table that is associated with the remediation
        # action.
        @[JSON::Field(key: "GatewayId")]
        getter gateway_id : Types::ActionTarget?

        # The ID of the subnet for the EC2 route table that is associated with the remediation action.
        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : Types::ActionTarget?

        def initialize(
          @route_table_id : Types::ActionTarget,
          @description : String? = nil,
          @gateway_id : Types::ActionTarget? = nil,
          @subnet_id : Types::ActionTarget? = nil
        )
        end
      end

      # An action that copies the EC2 route table for use in remediation.
      struct EC2CopyRouteTableAction
        include JSON::Serializable

        # The ID of the copied EC2 route table that is associated with the remediation action.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : Types::ActionTarget

        # The VPC ID of the copied EC2 route table that is associated with the remediation action.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : Types::ActionTarget

        # A description of the copied EC2 route table that is associated with the remediation action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @route_table_id : Types::ActionTarget,
          @vpc_id : Types::ActionTarget,
          @description : String? = nil
        )
        end
      end

      # Information about the CreateRoute action in Amazon EC2.
      struct EC2CreateRouteAction
        include JSON::Serializable

        # Information about the ID of the route table for the route.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : Types::ActionTarget

        # A description of CreateRoute action in Amazon EC2.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about the IPv4 CIDR address block used for the destination match.
        @[JSON::Field(key: "DestinationCidrBlock")]
        getter destination_cidr_block : String?

        # Information about the IPv6 CIDR block destination.
        @[JSON::Field(key: "DestinationIpv6CidrBlock")]
        getter destination_ipv6_cidr_block : String?

        # Information about the ID of a prefix list used for the destination match.
        @[JSON::Field(key: "DestinationPrefixListId")]
        getter destination_prefix_list_id : String?

        # Information about the ID of an internet gateway or virtual private gateway attached to your VPC.
        @[JSON::Field(key: "GatewayId")]
        getter gateway_id : Types::ActionTarget?

        # Information about the ID of a VPC endpoint. Supported for Gateway Load Balancer endpoints only.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : Types::ActionTarget?

        def initialize(
          @route_table_id : Types::ActionTarget,
          @description : String? = nil,
          @destination_cidr_block : String? = nil,
          @destination_ipv6_cidr_block : String? = nil,
          @destination_prefix_list_id : String? = nil,
          @gateway_id : Types::ActionTarget? = nil,
          @vpc_endpoint_id : Types::ActionTarget? = nil
        )
        end
      end

      # Information about the CreateRouteTable action in Amazon EC2.
      struct EC2CreateRouteTableAction
        include JSON::Serializable

        # Information about the ID of a VPC.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : Types::ActionTarget

        # A description of the CreateRouteTable action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @vpc_id : Types::ActionTarget,
          @description : String? = nil
        )
        end
      end

      # Information about the DeleteRoute action in Amazon EC2.
      struct EC2DeleteRouteAction
        include JSON::Serializable

        # Information about the ID of the route table.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : Types::ActionTarget

        # A description of the DeleteRoute action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about the IPv4 CIDR range for the route. The value you specify must match the CIDR for
        # the route exactly.
        @[JSON::Field(key: "DestinationCidrBlock")]
        getter destination_cidr_block : String?

        # Information about the IPv6 CIDR range for the route. The value you specify must match the CIDR for
        # the route exactly.
        @[JSON::Field(key: "DestinationIpv6CidrBlock")]
        getter destination_ipv6_cidr_block : String?

        # Information about the ID of the prefix list for the route.
        @[JSON::Field(key: "DestinationPrefixListId")]
        getter destination_prefix_list_id : String?

        def initialize(
          @route_table_id : Types::ActionTarget,
          @description : String? = nil,
          @destination_cidr_block : String? = nil,
          @destination_ipv6_cidr_block : String? = nil,
          @destination_prefix_list_id : String? = nil
        )
        end
      end

      # Information about the ReplaceRoute action in Amazon EC2.
      struct EC2ReplaceRouteAction
        include JSON::Serializable

        # Information about the ID of the route table.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : Types::ActionTarget

        # A description of the ReplaceRoute action in Amazon EC2.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about the IPv4 CIDR address block used for the destination match. The value that you
        # provide must match the CIDR of an existing route in the table.
        @[JSON::Field(key: "DestinationCidrBlock")]
        getter destination_cidr_block : String?

        # Information about the IPv6 CIDR address block used for the destination match. The value that you
        # provide must match the CIDR of an existing route in the table.
        @[JSON::Field(key: "DestinationIpv6CidrBlock")]
        getter destination_ipv6_cidr_block : String?

        # Information about the ID of the prefix list for the route.
        @[JSON::Field(key: "DestinationPrefixListId")]
        getter destination_prefix_list_id : String?

        # Information about the ID of an internet gateway or virtual private gateway.
        @[JSON::Field(key: "GatewayId")]
        getter gateway_id : Types::ActionTarget?

        def initialize(
          @route_table_id : Types::ActionTarget,
          @description : String? = nil,
          @destination_cidr_block : String? = nil,
          @destination_ipv6_cidr_block : String? = nil,
          @destination_prefix_list_id : String? = nil,
          @gateway_id : Types::ActionTarget? = nil
        )
        end
      end

      # Information about the ReplaceRouteTableAssociation action in Amazon EC2.
      struct EC2ReplaceRouteTableAssociationAction
        include JSON::Serializable

        # Information about the association ID.
        @[JSON::Field(key: "AssociationId")]
        getter association_id : Types::ActionTarget

        # Information about the ID of the new route table to associate with the subnet.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : Types::ActionTarget

        # A description of the ReplaceRouteTableAssociation action in Amazon EC2.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @association_id : Types::ActionTarget,
          @route_table_id : Types::ActionTarget,
          @description : String? = nil
        )
        end
      end

      # Describes a single rule in a network ACL.
      struct EntryDescription
        include JSON::Serializable

        # Describes a rule in a network ACL. Each network ACL has a set of numbered ingress rules and a
        # separate set of numbered egress rules. When determining whether a packet should be allowed in or out
        # of a subnet associated with the network ACL, Amazon Web Services processes the entries in the
        # network ACL according to the rule numbers, in ascending order. When you manage an individual network
        # ACL, you explicitly specify the rule numbers. When you specify the network ACL rules in a Firewall
        # Manager policy, you provide the rules to run first, in the order that you want them to run, and the
        # rules to run last, in the order that you want them to run. Firewall Manager assigns the rule numbers
        # for you when you save the network ACL policy specification.
        @[JSON::Field(key: "EntryDetail")]
        getter entry_detail : Types::NetworkAclEntry?

        # The rule number for the entry. ACL entries are processed in ascending order by rule number. In a
        # Firewall Manager network ACL policy, Firewall Manager assigns rule numbers.
        @[JSON::Field(key: "EntryRuleNumber")]
        getter entry_rule_number : Int32?

        # Specifies whether the entry is managed by Firewall Manager or by a user, and, for Firewall
        # Manager-managed entries, specifies whether the entry is among those that run first in the network
        # ACL or those that run last.
        @[JSON::Field(key: "EntryType")]
        getter entry_type : String?

        def initialize(
          @entry_detail : Types::NetworkAclEntry? = nil,
          @entry_rule_number : Int32? = nil,
          @entry_type : String? = nil
        )
        end
      end

      # Detailed information about an entry violation in a network ACL. The violation is against the network
      # ACL specification inside the Firewall Manager network ACL policy. This data object is part of
      # InvalidNetworkAclEntriesViolation .
      struct EntryViolation
        include JSON::Serializable

        # The evaluation location within the ordered list of entries where the ExpectedEntry is currently
        # located.
        @[JSON::Field(key: "ActualEvaluationOrder")]
        getter actual_evaluation_order : String?

        # The list of entries that are in conflict with ExpectedEntry .
        @[JSON::Field(key: "EntriesWithConflicts")]
        getter entries_with_conflicts : Array(Types::EntryDescription)?

        # The entry that's currently in the ExpectedEvaluationOrder location, in place of the expected entry.
        @[JSON::Field(key: "EntryAtExpectedEvaluationOrder")]
        getter entry_at_expected_evaluation_order : Types::EntryDescription?

        # Descriptions of the violations that Firewall Manager found for these entries.
        @[JSON::Field(key: "EntryViolationReasons")]
        getter entry_violation_reasons : Array(String)?

        # The Firewall Manager-managed network ACL entry that is involved in the entry violation.
        @[JSON::Field(key: "ExpectedEntry")]
        getter expected_entry : Types::EntryDescription?

        # The evaluation location within the ordered list of entries where the ExpectedEntry should be,
        # according to the network ACL policy specifications.
        @[JSON::Field(key: "ExpectedEvaluationOrder")]
        getter expected_evaluation_order : String?

        def initialize(
          @actual_evaluation_order : String? = nil,
          @entries_with_conflicts : Array(Types::EntryDescription)? = nil,
          @entry_at_expected_evaluation_order : Types::EntryDescription? = nil,
          @entry_violation_reasons : Array(String)? = nil,
          @expected_entry : Types::EntryDescription? = nil,
          @expected_evaluation_order : String? = nil
        )
        end
      end

      # Describes the compliance status for the account. An account is considered noncompliant if it
      # includes resources that are not protected by the specified policy or that don't comply with the
      # policy.
      struct EvaluationResult
        include JSON::Serializable

        # Describes an Amazon Web Services account's compliance with the Firewall Manager policy.
        @[JSON::Field(key: "ComplianceStatus")]
        getter compliance_status : String?

        # Indicates that over 100 resources are noncompliant with the Firewall Manager policy.
        @[JSON::Field(key: "EvaluationLimitExceeded")]
        getter evaluation_limit_exceeded : Bool?

        # The number of resources that are noncompliant with the specified policy. For WAF and Shield Advanced
        # policies, a resource is considered noncompliant if it is not associated with the policy. For
        # security group policies, a resource is considered noncompliant if it doesn't comply with the rules
        # of the policy and remediation is disabled or not possible.
        @[JSON::Field(key: "ViolatorCount")]
        getter violator_count : Int64?

        def initialize(
          @compliance_status : String? = nil,
          @evaluation_limit_exceeded : Bool? = nil,
          @violator_count : Int64? = nil
        )
        end
      end

      # Information about the expected route in the route table.
      struct ExpectedRoute
        include JSON::Serializable

        # Information about the allowed targets.
        @[JSON::Field(key: "AllowedTargets")]
        getter allowed_targets : Array(String)?

        # Information about the contributing subnets.
        @[JSON::Field(key: "ContributingSubnets")]
        getter contributing_subnets : Array(String)?

        # Information about the IPv4 CIDR block.
        @[JSON::Field(key: "IpV4Cidr")]
        getter ip_v4_cidr : String?

        # Information about the IPv6 CIDR block.
        @[JSON::Field(key: "IpV6Cidr")]
        getter ip_v6_cidr : String?

        # Information about the ID of the prefix list for the route.
        @[JSON::Field(key: "PrefixListId")]
        getter prefix_list_id : String?

        # Information about the route table ID.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : String?

        def initialize(
          @allowed_targets : Array(String)? = nil,
          @contributing_subnets : Array(String)? = nil,
          @ip_v4_cidr : String? = nil,
          @ip_v6_cidr : String? = nil,
          @prefix_list_id : String? = nil,
          @route_table_id : String? = nil
        )
        end
      end

      # Contains information about the actions that you can take to remediate scope violations caused by
      # your policy's FirewallCreationConfig . FirewallCreationConfig is an optional configuration that you
      # can use to choose which Availability Zones Firewall Manager creates Network Firewall endpoints in.
      struct FMSPolicyUpdateFirewallCreationConfigAction
        include JSON::Serializable

        # Describes the remedial action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A FirewallCreationConfig that you can copy into your current policy's SecurityServiceData in order
        # to remedy scope violations.
        @[JSON::Field(key: "FirewallCreationConfig")]
        getter firewall_creation_config : String?

        def initialize(
          @description : String? = nil,
          @firewall_creation_config : String? = nil
        )
        end
      end

      # Details of a resource that failed when trying to update it's association to a resource set.
      struct FailedItem
        include JSON::Serializable

        # The reason the resource's association could not be updated.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The univeral resource indicator (URI) of the resource that failed.
        @[JSON::Field(key: "URI")]
        getter uri : String?

        def initialize(
          @reason : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # Contains details about the firewall subnet that violates the policy scope.
      struct FirewallSubnetIsOutOfScopeViolation
        include JSON::Serializable

        # The ID of the firewall subnet that violates the policy scope.
        @[JSON::Field(key: "FirewallSubnetId")]
        getter firewall_subnet_id : String?

        # The Availability Zone of the firewall subnet that violates the policy scope.
        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : String?

        # The Availability Zone ID of the firewall subnet that violates the policy scope.
        @[JSON::Field(key: "SubnetAvailabilityZoneId")]
        getter subnet_availability_zone_id : String?

        # The VPC endpoint ID of the firewall subnet that violates the policy scope.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The VPC ID of the firewall subnet that violates the policy scope.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @firewall_subnet_id : String? = nil,
          @subnet_availability_zone : String? = nil,
          @subnet_availability_zone_id : String? = nil,
          @vpc_endpoint_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The violation details for a firewall subnet's VPC endpoint that's deleted or missing.
      struct FirewallSubnetMissingVPCEndpointViolation
        include JSON::Serializable

        # The ID of the firewall that this VPC endpoint is associated with.
        @[JSON::Field(key: "FirewallSubnetId")]
        getter firewall_subnet_id : String?

        # The name of the Availability Zone of the deleted VPC subnet.
        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : String?

        # The ID of the Availability Zone of the deleted VPC subnet.
        @[JSON::Field(key: "SubnetAvailabilityZoneId")]
        getter subnet_availability_zone_id : String?

        # The resource ID of the VPC associated with the deleted VPC subnet.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @firewall_subnet_id : String? = nil,
          @subnet_availability_zone : String? = nil,
          @subnet_availability_zone_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct GetAdminAccountRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetAdminAccountResponse
        include JSON::Serializable

        # The account that is set as the Firewall Manager default administrator.
        @[JSON::Field(key: "AdminAccount")]
        getter admin_account : String?

        # The status of the account that you set as the Firewall Manager default administrator.
        @[JSON::Field(key: "RoleStatus")]
        getter role_status : String?

        def initialize(
          @admin_account : String? = nil,
          @role_status : String? = nil
        )
        end
      end

      struct GetAdminScopeRequest
        include JSON::Serializable

        # The administrator account that you want to get the details for.
        @[JSON::Field(key: "AdminAccount")]
        getter admin_account : String

        def initialize(
          @admin_account : String
        )
        end
      end

      struct GetAdminScopeResponse
        include JSON::Serializable

        # Contains details about the administrative scope of the requested account.
        @[JSON::Field(key: "AdminScope")]
        getter admin_scope : Types::AdminScope?

        # The current status of the request to onboard a member account as an Firewall Manager administrator.
        # ONBOARDING - The account is onboarding to Firewall Manager as an administrator. ONBOARDING_COMPLETE
        # - Firewall Manager The account is onboarded to Firewall Manager as an administrator, and can perform
        # actions on the resources defined in their AdminScope . OFFBOARDING - The account is being removed as
        # an Firewall Manager administrator. OFFBOARDING_COMPLETE - The account has been removed as an
        # Firewall Manager administrator.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @admin_scope : Types::AdminScope? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetAppsListRequest
        include JSON::Serializable

        # The ID of the Firewall Manager applications list that you want the details for.
        @[JSON::Field(key: "ListId")]
        getter list_id : String

        # Specifies whether the list to retrieve is a default list owned by Firewall Manager.
        @[JSON::Field(key: "DefaultList")]
        getter default_list : Bool?

        def initialize(
          @list_id : String,
          @default_list : Bool? = nil
        )
        end
      end

      struct GetAppsListResponse
        include JSON::Serializable

        # Information about the specified Firewall Manager applications list.
        @[JSON::Field(key: "AppsList")]
        getter apps_list : Types::AppsListData?

        # The Amazon Resource Name (ARN) of the applications list.
        @[JSON::Field(key: "AppsListArn")]
        getter apps_list_arn : String?

        def initialize(
          @apps_list : Types::AppsListData? = nil,
          @apps_list_arn : String? = nil
        )
        end
      end

      struct GetComplianceDetailRequest
        include JSON::Serializable

        # The Amazon Web Services account that owns the resources that you want to get the details for.
        @[JSON::Field(key: "MemberAccount")]
        getter member_account : String

        # The ID of the policy that you want to get the details for. PolicyId is returned by PutPolicy and by
        # ListPolicies .
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        def initialize(
          @member_account : String,
          @policy_id : String
        )
        end
      end

      struct GetComplianceDetailResponse
        include JSON::Serializable

        # Information about the resources and the policy that you specified in the GetComplianceDetail
        # request.
        @[JSON::Field(key: "PolicyComplianceDetail")]
        getter policy_compliance_detail : Types::PolicyComplianceDetail?

        def initialize(
          @policy_compliance_detail : Types::PolicyComplianceDetail? = nil
        )
        end
      end

      struct GetNotificationChannelRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetNotificationChannelResponse
        include JSON::Serializable

        # The IAM role that is used by Firewall Manager to record activity to SNS.
        @[JSON::Field(key: "SnsRoleName")]
        getter sns_role_name : String?

        # The SNS topic that records Firewall Manager activity.
        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        def initialize(
          @sns_role_name : String? = nil,
          @sns_topic_arn : String? = nil
        )
        end
      end

      struct GetPolicyRequest
        include JSON::Serializable

        # The ID of the Firewall Manager policy that you want the details for.
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        def initialize(
          @policy_id : String
        )
        end
      end

      struct GetPolicyResponse
        include JSON::Serializable

        # Information about the specified Firewall Manager policy.
        @[JSON::Field(key: "Policy")]
        getter policy : Types::Policy?

        # The Amazon Resource Name (ARN) of the specified policy.
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String?

        def initialize(
          @policy : Types::Policy? = nil,
          @policy_arn : String? = nil
        )
        end
      end

      struct GetProtectionStatusRequest
        include JSON::Serializable

        # The ID of the policy for which you want to get the attack information.
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # The end of the time period to query for the attacks. This is a timestamp type. The request syntax
        # listing indicates a number type because the default used by Firewall Manager is Unix time in
        # seconds. However, any valid timestamp format is allowed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Specifies the number of objects that you want Firewall Manager to return for this request. If you
        # have more objects than the number that you specify for MaxResults , the response includes a
        # NextToken value that you can use to get another batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The Amazon Web Services account that is in scope of the policy that you want to get the details for.
        @[JSON::Field(key: "MemberAccountId")]
        getter member_account_id : String?

        # If you specify a value for MaxResults and you have more objects than the number that you specify for
        # MaxResults , Firewall Manager returns a NextToken value in the response, which you can use to
        # retrieve another group of objects. For the second and subsequent GetProtectionStatus requests,
        # specify the value of NextToken from the previous response to get information about another batch of
        # objects.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The start of the time period to query for the attacks. This is a timestamp type. The request syntax
        # listing indicates a number type because the default used by Firewall Manager is Unix time in
        # seconds. However, any valid timestamp format is allowed.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @policy_id : String,
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @member_account_id : String? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct GetProtectionStatusResponse
        include JSON::Serializable

        # The ID of the Firewall Manager administrator account for this policy.
        @[JSON::Field(key: "AdminAccountId")]
        getter admin_account_id : String?

        # Details about the attack, including the following: Attack type Account ID ARN of the resource
        # attacked Start time of the attack End time of the attack (ongoing attacks will not have an end time)
        # The details are in JSON format.
        @[JSON::Field(key: "Data")]
        getter data : String?

        # If you have more objects than the number that you specified for MaxResults in the request, the
        # response includes a NextToken value. To list more objects, submit another GetProtectionStatus
        # request, and specify the NextToken value from the response in the NextToken value in the next
        # request. Amazon Web Services SDKs provide auto-pagination that identify NextToken in a response and
        # make subsequent request calls automatically on your behalf. However, this feature is not supported
        # by GetProtectionStatus . You must submit subsequent requests with NextToken using your own
        # processes.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The service type that is protected by the policy. Currently, this is always SHIELD_ADVANCED .
        @[JSON::Field(key: "ServiceType")]
        getter service_type : String?

        def initialize(
          @admin_account_id : String? = nil,
          @data : String? = nil,
          @next_token : String? = nil,
          @service_type : String? = nil
        )
        end
      end

      struct GetProtocolsListRequest
        include JSON::Serializable

        # The ID of the Firewall Manager protocols list that you want the details for.
        @[JSON::Field(key: "ListId")]
        getter list_id : String

        # Specifies whether the list to retrieve is a default list owned by Firewall Manager.
        @[JSON::Field(key: "DefaultList")]
        getter default_list : Bool?

        def initialize(
          @list_id : String,
          @default_list : Bool? = nil
        )
        end
      end

      struct GetProtocolsListResponse
        include JSON::Serializable

        # Information about the specified Firewall Manager protocols list.
        @[JSON::Field(key: "ProtocolsList")]
        getter protocols_list : Types::ProtocolsListData?

        # The Amazon Resource Name (ARN) of the specified protocols list.
        @[JSON::Field(key: "ProtocolsListArn")]
        getter protocols_list_arn : String?

        def initialize(
          @protocols_list : Types::ProtocolsListData? = nil,
          @protocols_list_arn : String? = nil
        )
        end
      end

      struct GetResourceSetRequest
        include JSON::Serializable

        # A unique identifier for the resource set, used in a request to refer to the resource set.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct GetResourceSetResponse
        include JSON::Serializable

        # Information about the specified resource set.
        @[JSON::Field(key: "ResourceSet")]
        getter resource_set : Types::ResourceSet

        # The Amazon Resource Name (ARN) of the resource set.
        @[JSON::Field(key: "ResourceSetArn")]
        getter resource_set_arn : String

        def initialize(
          @resource_set : Types::ResourceSet,
          @resource_set_arn : String
        )
        end
      end

      struct GetThirdPartyFirewallAssociationStatusRequest
        include JSON::Serializable

        # The name of the third-party firewall vendor.
        @[JSON::Field(key: "ThirdPartyFirewall")]
        getter third_party_firewall : String

        def initialize(
          @third_party_firewall : String
        )
        end
      end

      struct GetThirdPartyFirewallAssociationStatusResponse
        include JSON::Serializable

        # The status for subscribing to the third-party firewall vendor in the Amazon Web Services
        # Marketplace. NO_SUBSCRIPTION - The Firewall Manager policy administrator isn't subscribed to the
        # third-party firewall service in the Amazon Web Services Marketplace. NOT_COMPLETE - The Firewall
        # Manager policy administrator is in the process of subscribing to the third-party firewall service in
        # the Amazon Web Services Marketplace, but doesn't yet have an active subscription. COMPLETE - The
        # Firewall Manager policy administrator has an active subscription to the third-party firewall service
        # in the Amazon Web Services Marketplace.
        @[JSON::Field(key: "MarketplaceOnboardingStatus")]
        getter marketplace_onboarding_status : String?

        # The current status for setting a Firewall Manager policy administrators account as an administrator
        # of the third-party firewall tenant. ONBOARDING - The Firewall Manager policy administrator is being
        # designated as a tenant administrator. ONBOARD_COMPLETE - The Firewall Manager policy administrator
        # is designated as a tenant administrator. OFFBOARDING - The Firewall Manager policy administrator is
        # being removed as a tenant administrator. OFFBOARD_COMPLETE - The Firewall Manager policy
        # administrator has been removed as a tenant administrator. NOT_EXIST - The Firewall Manager policy
        # administrator doesn't exist as a tenant administrator.
        @[JSON::Field(key: "ThirdPartyFirewallStatus")]
        getter third_party_firewall_status : String?

        def initialize(
          @marketplace_onboarding_status : String? = nil,
          @third_party_firewall_status : String? = nil
        )
        end
      end

      struct GetViolationDetailsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that you want the details for.
        @[JSON::Field(key: "MemberAccount")]
        getter member_account : String

        # The ID of the Firewall Manager policy that you want the details for. You can get violation details
        # for the following policy types: WAF DNS Firewall Imported Network Firewall Network Firewall Security
        # group content audit Network ACL Third-party firewall
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # The ID of the resource that has violations.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type. This is in the format shown in the Amazon Web Services Resource Types Reference .
        # Supported resource types are: AWS::WAFv2::WebACL , AWS::EC2::Instance , AWS::EC2::NetworkInterface ,
        # AWS::EC2::SecurityGroup , AWS::NetworkFirewall::FirewallPolicy , and AWS::EC2::Subnet .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @member_account : String,
          @policy_id : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct GetViolationDetailsResponse
        include JSON::Serializable

        # Violation detail for a resource.
        @[JSON::Field(key: "ViolationDetail")]
        getter violation_detail : Types::ViolationDetail?

        def initialize(
          @violation_detail : Types::ViolationDetail? = nil
        )
        end
      end

      # The operation failed because of a system problem, even though the request was valid. Retry your
      # request.
      struct InternalErrorException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The parameters of the request were invalid.
      struct InvalidInputException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Violation detail for the entries in a network ACL resource.
      struct InvalidNetworkAclEntriesViolation
        include JSON::Serializable

        # The network ACL containing the entry violations.
        @[JSON::Field(key: "CurrentAssociatedNetworkAcl")]
        getter current_associated_network_acl : String?

        # Detailed information about the entry violations in the network ACL.
        @[JSON::Field(key: "EntryViolations")]
        getter entry_violations : Array(Types::EntryViolation)?

        # The subnet that's associated with the network ACL.
        @[JSON::Field(key: "Subnet")]
        getter subnet : String?

        # The Availability Zone where the network ACL is in use.
        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : String?

        # The VPC where the violation was found.
        @[JSON::Field(key: "Vpc")]
        getter vpc : String?

        def initialize(
          @current_associated_network_acl : String? = nil,
          @entry_violations : Array(Types::EntryViolation)? = nil,
          @subnet : String? = nil,
          @subnet_availability_zone : String? = nil,
          @vpc : String? = nil
        )
        end
      end

      # The operation failed because there was nothing to do or the operation wasn't possible. For example,
      # you might have submitted an AssociateAdminAccount request for an account ID that was already set as
      # the Firewall Manager administrator. Or you might have tried to access a Region that's disabled by
      # default, and that you need to enable for the Firewall Manager administrator account and for
      # Organizations before you can access it.
      struct InvalidOperationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The value of the Type parameter is invalid.
      struct InvalidTypeException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation exceeds a resource limit, for example, the maximum number of policy objects that you
      # can create for an Amazon Web Services account. For more information, see Firewall Manager Limits in
      # the WAF Developer Guide .
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListAdminAccountsForOrganizationRequest
        include JSON::Serializable

        # The maximum number of objects that you want Firewall Manager to return for this request. If more
        # objects are available, in the response, Firewall Manager provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAdminAccountsForOrganizationResponse
        include JSON::Serializable

        # A list of Firewall Manager administrator accounts within the organization that were onboarded as
        # administrators by AssociateAdminAccount or PutAdminAccount .
        @[JSON::Field(key: "AdminAccounts")]
        getter admin_accounts : Array(Types::AdminAccountSummary)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @admin_accounts : Array(Types::AdminAccountSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAdminsManagingAccountRequest
        include JSON::Serializable

        # The maximum number of objects that you want Firewall Manager to return for this request. If more
        # objects are available, in the response, Firewall Manager provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAdminsManagingAccountResponse
        include JSON::Serializable

        # The list of accounts who manage member accounts within their AdminScope .
        @[JSON::Field(key: "AdminAccounts")]
        getter admin_accounts : Array(String)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @admin_accounts : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppsListsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Firewall Manager to return for this request. If more
        # objects are available, in the response, Firewall Manager provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects. If you don't specify this, Firewall Manager
        # returns all available objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32

        # Specifies whether the lists to retrieve are default lists owned by Firewall Manager.
        @[JSON::Field(key: "DefaultLists")]
        getter default_lists : Bool?

        # If you specify a value for MaxResults in your list request, and you have more objects than the
        # maximum, Firewall Manager returns this token in the response. For all but the first request, you
        # provide the token returned by the prior request in the request parameters, to retrieve the next
        # batch of objects.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @default_lists : Bool? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppsListsResponse
        include JSON::Serializable

        # An array of AppsListDataSummary objects.
        @[JSON::Field(key: "AppsLists")]
        getter apps_lists : Array(Types::AppsListDataSummary)?

        # If you specify a value for MaxResults in your list request, and you have more objects than the
        # maximum, Firewall Manager returns this token in the response. You can use this token in subsequent
        # requests to retrieve the next batch of objects.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @apps_lists : Array(Types::AppsListDataSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListComplianceStatusRequest
        include JSON::Serializable

        # The ID of the Firewall Manager policy that you want the details for.
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # Specifies the number of PolicyComplianceStatus objects that you want Firewall Manager to return for
        # this request. If you have more PolicyComplianceStatus objects than the number that you specify for
        # MaxResults , the response includes a NextToken value that you can use to get another batch of
        # PolicyComplianceStatus objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you specify a value for MaxResults and you have more PolicyComplianceStatus objects than the
        # number that you specify for MaxResults , Firewall Manager returns a NextToken value in the response
        # that allows you to list another group of PolicyComplianceStatus objects. For the second and
        # subsequent ListComplianceStatus requests, specify the value of NextToken from the previous response
        # to get information about another batch of PolicyComplianceStatus objects.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @policy_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListComplianceStatusResponse
        include JSON::Serializable

        # If you have more PolicyComplianceStatus objects than the number that you specified for MaxResults in
        # the request, the response includes a NextToken value. To list more PolicyComplianceStatus objects,
        # submit another ListComplianceStatus request, and specify the NextToken value from the response in
        # the NextToken value in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of PolicyComplianceStatus objects.
        @[JSON::Field(key: "PolicyComplianceStatusList")]
        getter policy_compliance_status_list : Array(Types::PolicyComplianceStatus)?

        def initialize(
          @next_token : String? = nil,
          @policy_compliance_status_list : Array(Types::PolicyComplianceStatus)? = nil
        )
        end
      end

      struct ListDiscoveredResourcesRequest
        include JSON::Serializable

        # The Amazon Web Services account IDs to discover resources in. Only one account is supported per
        # request. The account must be a member of your organization.
        @[JSON::Field(key: "MemberAccountIds")]
        getter member_account_ids : Array(String)

        # The type of resources to discover.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The maximum number of objects that you want Firewall Manager to return for this request. If more
        # objects are available, in the response, Firewall Manager provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @member_account_ids : Array(String),
          @resource_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDiscoveredResourcesResponse
        include JSON::Serializable

        # Details of the resources that were discovered.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::DiscoveredResource)?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DiscoveredResource)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMemberAccountsRequest
        include JSON::Serializable

        # Specifies the number of member account IDs that you want Firewall Manager to return for this
        # request. If you have more IDs than the number that you specify for MaxResults , the response
        # includes a NextToken value that you can use to get another batch of member account IDs.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you specify a value for MaxResults and you have more account IDs than the number that you specify
        # for MaxResults , Firewall Manager returns a NextToken value in the response that allows you to list
        # another group of IDs. For the second and subsequent ListMemberAccountsRequest requests, specify the
        # value of NextToken from the previous response to get information about another batch of member
        # account IDs.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMemberAccountsResponse
        include JSON::Serializable

        # An array of account IDs.
        @[JSON::Field(key: "MemberAccounts")]
        getter member_accounts : Array(String)?

        # If you have more member account IDs than the number that you specified for MaxResults in the
        # request, the response includes a NextToken value. To list more IDs, submit another
        # ListMemberAccounts request, and specify the NextToken value from the response in the NextToken value
        # in the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @member_accounts : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPoliciesRequest
        include JSON::Serializable

        # Specifies the number of PolicySummary objects that you want Firewall Manager to return for this
        # request. If you have more PolicySummary objects than the number that you specify for MaxResults ,
        # the response includes a NextToken value that you can use to get another batch of PolicySummary
        # objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you specify a value for MaxResults and you have more PolicySummary objects than the number that
        # you specify for MaxResults , Firewall Manager returns a NextToken value in the response that allows
        # you to list another group of PolicySummary objects. For the second and subsequent ListPolicies
        # requests, specify the value of NextToken from the previous response to get information about another
        # batch of PolicySummary objects.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPoliciesResponse
        include JSON::Serializable

        # If you have more PolicySummary objects than the number that you specified for MaxResults in the
        # request, the response includes a NextToken value. To list more PolicySummary objects, submit another
        # ListPolicies request, and specify the NextToken value from the response in the NextToken value in
        # the next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of PolicySummary objects.
        @[JSON::Field(key: "PolicyList")]
        getter policy_list : Array(Types::PolicySummary)?

        def initialize(
          @next_token : String? = nil,
          @policy_list : Array(Types::PolicySummary)? = nil
        )
        end
      end

      struct ListProtocolsListsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Firewall Manager to return for this request. If more
        # objects are available, in the response, Firewall Manager provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects. If you don't specify this, Firewall Manager
        # returns all available objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32

        # Specifies whether the lists to retrieve are default lists owned by Firewall Manager.
        @[JSON::Field(key: "DefaultLists")]
        getter default_lists : Bool?

        # If you specify a value for MaxResults in your list request, and you have more objects than the
        # maximum, Firewall Manager returns this token in the response. For all but the first request, you
        # provide the token returned by the prior request in the request parameters, to retrieve the next
        # batch of objects.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @default_lists : Bool? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProtocolsListsResponse
        include JSON::Serializable

        # If you specify a value for MaxResults in your list request, and you have more objects than the
        # maximum, Firewall Manager returns this token in the response. You can use this token in subsequent
        # requests to retrieve the next batch of objects.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ProtocolsListDataSummary objects.
        @[JSON::Field(key: "ProtocolsLists")]
        getter protocols_lists : Array(Types::ProtocolsListDataSummary)?

        def initialize(
          @next_token : String? = nil,
          @protocols_lists : Array(Types::ProtocolsListDataSummary)? = nil
        )
        end
      end

      struct ListResourceSetResourcesRequest
        include JSON::Serializable

        # A unique identifier for the resource set, used in a request to refer to the resource set.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The maximum number of objects that you want Firewall Manager to return for this request. If more
        # objects are available, in the response, Firewall Manager provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceSetResourcesResponse
        include JSON::Serializable

        # An array of the associated resources' uniform resource identifiers (URI).
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Resource)

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Resource),
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceSetsRequest
        include JSON::Serializable

        # The maximum number of objects that you want Firewall Manager to return for this request. If more
        # objects are available, in the response, Firewall Manager provides a NextToken value that you can use
        # in a subsequent call to get the next batch of objects.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListResourceSetsResponse
        include JSON::Serializable

        # When you request a list of objects with a MaxResults setting, if the number of objects that are
        # still available for retrieval exceeds the maximum you requested, Firewall Manager returns a
        # NextToken value in the response. To retrieve the next batch of objects, use the token returned from
        # the prior request in your next request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ResourceSetSummary objects.
        @[JSON::Field(key: "ResourceSets")]
        getter resource_sets : Array(Types::ResourceSetSummary)?

        def initialize(
          @next_token : String? = nil,
          @resource_sets : Array(Types::ResourceSetSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to return tags for. The Firewall Manager resources
        # that support tagging are policies, applications lists, and protocols lists.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with the resource.
        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListThirdPartyFirewallFirewallPoliciesRequest
        include JSON::Serializable

        # The maximum number of third-party firewall policies that you want Firewall Manager to return. If the
        # specified third-party firewall vendor is associated with more than MaxResults firewall policies, the
        # response includes a NextToken element. NextToken contains an encrypted token that identifies the
        # first third-party firewall policies that Firewall Manager will return if you submit another request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32

        # The name of the third-party firewall vendor.
        @[JSON::Field(key: "ThirdPartyFirewall")]
        getter third_party_firewall : String

        # If the previous response included a NextToken element, the specified third-party firewall vendor is
        # associated with more third-party firewall policies. To get more third-party firewall policies,
        # submit another ListThirdPartyFirewallFirewallPoliciesRequest request. For the value of NextToken ,
        # specify the value of NextToken from the previous response. If the previous response didn't include a
        # NextToken element, there are no more third-party firewall policies to get.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @third_party_firewall : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListThirdPartyFirewallFirewallPoliciesResponse
        include JSON::Serializable

        # The value that you will use for NextToken in the next ListThirdPartyFirewallFirewallPolicies
        # request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list that contains one ThirdPartyFirewallFirewallPolicies element for each third-party firewall
        # policies that the specified third-party firewall vendor is associated with. Each
        # ThirdPartyFirewallFirewallPolicies element contains the firewall policy name and ID.
        @[JSON::Field(key: "ThirdPartyFirewallFirewallPolicies")]
        getter third_party_firewall_firewall_policies : Array(Types::ThirdPartyFirewallFirewallPolicy)?

        def initialize(
          @next_token : String? = nil,
          @third_party_firewall_firewall_policies : Array(Types::ThirdPartyFirewallFirewallPolicy)? = nil
        )
        end
      end

      # Defines a Firewall Manager network ACL policy. This is used in the PolicyOption of a
      # SecurityServicePolicyData for a Policy , when the SecurityServicePolicyData type is set to
      # NETWORK_ACL_COMMON . For information about network ACLs, see Control traffic to subnets using
      # network ACLs in the Amazon Virtual Private Cloud User Guide .
      struct NetworkAclCommonPolicy
        include JSON::Serializable

        # The definition of the first and last rules for the network ACL policy.
        @[JSON::Field(key: "NetworkAclEntrySet")]
        getter network_acl_entry_set : Types::NetworkAclEntrySet

        def initialize(
          @network_acl_entry_set : Types::NetworkAclEntrySet
        )
        end
      end

      # Describes a rule in a network ACL. Each network ACL has a set of numbered ingress rules and a
      # separate set of numbered egress rules. When determining whether a packet should be allowed in or out
      # of a subnet associated with the network ACL, Amazon Web Services processes the entries in the
      # network ACL according to the rule numbers, in ascending order. When you manage an individual network
      # ACL, you explicitly specify the rule numbers. When you specify the network ACL rules in a Firewall
      # Manager policy, you provide the rules to run first, in the order that you want them to run, and the
      # rules to run last, in the order that you want them to run. Firewall Manager assigns the rule numbers
      # for you when you save the network ACL policy specification.
      struct NetworkAclEntry
        include JSON::Serializable

        # Indicates whether the rule is an egress, or outbound, rule (applied to traffic leaving the subnet).
        # If it's not an egress rule, then it's an ingress, or inbound, rule.
        @[JSON::Field(key: "Egress")]
        getter egress : Bool

        # The protocol number. A value of "-1" means all protocols.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # Indicates whether to allow or deny the traffic that matches the rule.
        @[JSON::Field(key: "RuleAction")]
        getter rule_action : String

        # The IPv4 network range to allow or deny, in CIDR notation.
        @[JSON::Field(key: "CidrBlock")]
        getter cidr_block : String?

        # ICMP protocol: The ICMP type and code.
        @[JSON::Field(key: "IcmpTypeCode")]
        getter icmp_type_code : Types::NetworkAclIcmpTypeCode?

        # The IPv6 network range to allow or deny, in CIDR notation.
        @[JSON::Field(key: "Ipv6CidrBlock")]
        getter ipv6_cidr_block : String?

        # TCP or UDP protocols: The range of ports the rule applies to.
        @[JSON::Field(key: "PortRange")]
        getter port_range : Types::NetworkAclPortRange?

        def initialize(
          @egress : Bool,
          @protocol : String,
          @rule_action : String,
          @cidr_block : String? = nil,
          @icmp_type_code : Types::NetworkAclIcmpTypeCode? = nil,
          @ipv6_cidr_block : String? = nil,
          @port_range : Types::NetworkAclPortRange? = nil
        )
        end
      end

      # The configuration of the first and last rules for the network ACL policy, and the remediation
      # settings for each.
      struct NetworkAclEntrySet
        include JSON::Serializable

        # Applies only when remediation is enabled for the policy as a whole. Firewall Manager uses this
        # setting when it finds policy violations that involve conflicts between the custom entries and the
        # policy entries. If forced remediation is disabled, Firewall Manager marks the network ACL as
        # noncompliant and does not try to remediate. For more information about the remediation behavior, see
        # Remediation for managed network ACLs in the Firewall Manager Developer Guide .
        @[JSON::Field(key: "ForceRemediateForFirstEntries")]
        getter force_remediate_for_first_entries : Bool

        # Applies only when remediation is enabled for the policy as a whole. Firewall Manager uses this
        # setting when it finds policy violations that involve conflicts between the custom entries and the
        # policy entries. If forced remediation is disabled, Firewall Manager marks the network ACL as
        # noncompliant and does not try to remediate. For more information about the remediation behavior, see
        # Remediation for managed network ACLs in the Firewall Manager Developer Guide .
        @[JSON::Field(key: "ForceRemediateForLastEntries")]
        getter force_remediate_for_last_entries : Bool

        # The rules that you want to run first in the Firewall Manager managed network ACLs. Provide these in
        # the order in which you want them to run. Firewall Manager will assign the specific rule numbers for
        # you, in the network ACLs that it creates. You must specify at least one first entry or one last
        # entry in any network ACL policy.
        @[JSON::Field(key: "FirstEntries")]
        getter first_entries : Array(Types::NetworkAclEntry)?

        # The rules that you want to run last in the Firewall Manager managed network ACLs. Provide these in
        # the order in which you want them to run. Firewall Manager will assign the specific rule numbers for
        # you, in the network ACLs that it creates. You must specify at least one first entry or one last
        # entry in any network ACL policy.
        @[JSON::Field(key: "LastEntries")]
        getter last_entries : Array(Types::NetworkAclEntry)?

        def initialize(
          @force_remediate_for_first_entries : Bool,
          @force_remediate_for_last_entries : Bool,
          @first_entries : Array(Types::NetworkAclEntry)? = nil,
          @last_entries : Array(Types::NetworkAclEntry)? = nil
        )
        end
      end

      # ICMP protocol: The ICMP type and code.
      struct NetworkAclIcmpTypeCode
        include JSON::Serializable

        # ICMP code.
        @[JSON::Field(key: "Code")]
        getter code : Int32?

        # ICMP type.
        @[JSON::Field(key: "Type")]
        getter type : Int32?

        def initialize(
          @code : Int32? = nil,
          @type : Int32? = nil
        )
        end
      end

      # TCP or UDP protocols: The range of ports the rule applies to.
      struct NetworkAclPortRange
        include JSON::Serializable

        # The beginning port number of the range.
        @[JSON::Field(key: "From")]
        getter from : Int32?

        # The ending port number of the range.
        @[JSON::Field(key: "To")]
        getter to : Int32?

        def initialize(
          @from : Int32? = nil,
          @to : Int32? = nil
        )
        end
      end

      # Violation detail for an internet gateway route with an inactive state in the customer subnet route
      # table or Network Firewall subnet route table.
      struct NetworkFirewallBlackHoleRouteDetectedViolation
        include JSON::Serializable

        # Information about the route table ID.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : String?

        # Information about the route or routes that are in violation.
        @[JSON::Field(key: "ViolatingRoutes")]
        getter violating_routes : Array(Types::Route)?

        # The subnet that has an inactive state.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        # Information about the VPC ID.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @route_table_id : String? = nil,
          @violating_routes : Array(Types::Route)? = nil,
          @violation_target : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Violation detail for the subnet for which internet traffic that hasn't been inspected.
      struct NetworkFirewallInternetTrafficNotInspectedViolation
        include JSON::Serializable

        # The actual firewall subnet routes.
        @[JSON::Field(key: "ActualFirewallSubnetRoutes")]
        getter actual_firewall_subnet_routes : Array(Types::Route)?

        # The actual internet gateway routes.
        @[JSON::Field(key: "ActualInternetGatewayRoutes")]
        getter actual_internet_gateway_routes : Array(Types::Route)?

        # Information about the subnet route table for the current firewall.
        @[JSON::Field(key: "CurrentFirewallSubnetRouteTable")]
        getter current_firewall_subnet_route_table : String?

        # The current route table for the internet gateway.
        @[JSON::Field(key: "CurrentInternetGatewayRouteTable")]
        getter current_internet_gateway_route_table : String?

        # The expected endpoint for the current firewall.
        @[JSON::Field(key: "ExpectedFirewallEndpoint")]
        getter expected_firewall_endpoint : String?

        # The firewall subnet routes that are expected.
        @[JSON::Field(key: "ExpectedFirewallSubnetRoutes")]
        getter expected_firewall_subnet_routes : Array(Types::ExpectedRoute)?

        # The internet gateway routes that are expected.
        @[JSON::Field(key: "ExpectedInternetGatewayRoutes")]
        getter expected_internet_gateway_routes : Array(Types::ExpectedRoute)?

        # The firewall subnet ID.
        @[JSON::Field(key: "FirewallSubnetId")]
        getter firewall_subnet_id : String?

        # The internet gateway ID.
        @[JSON::Field(key: "InternetGatewayId")]
        getter internet_gateway_id : String?

        # Information about whether the route table is used in another Availability Zone.
        @[JSON::Field(key: "IsRouteTableUsedInDifferentAZ")]
        getter is_route_table_used_in_different_az : Bool?

        # Information about the route table ID.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : String?

        # The subnet Availability Zone.
        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : String?

        # The subnet ID.
        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        # The route or routes that are in violation.
        @[JSON::Field(key: "ViolatingRoutes")]
        getter violating_routes : Array(Types::Route)?

        # Information about the VPC ID.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @actual_firewall_subnet_routes : Array(Types::Route)? = nil,
          @actual_internet_gateway_routes : Array(Types::Route)? = nil,
          @current_firewall_subnet_route_table : String? = nil,
          @current_internet_gateway_route_table : String? = nil,
          @expected_firewall_endpoint : String? = nil,
          @expected_firewall_subnet_routes : Array(Types::ExpectedRoute)? = nil,
          @expected_internet_gateway_routes : Array(Types::ExpectedRoute)? = nil,
          @firewall_subnet_id : String? = nil,
          @internet_gateway_id : String? = nil,
          @is_route_table_used_in_different_az : Bool? = nil,
          @route_table_id : String? = nil,
          @subnet_availability_zone : String? = nil,
          @subnet_id : String? = nil,
          @violating_routes : Array(Types::Route)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Violation detail for the improperly configured subnet route. It's possible there is a missing route
      # table route, or a configuration that causes traffic to cross an Availability Zone boundary.
      struct NetworkFirewallInvalidRouteConfigurationViolation
        include JSON::Serializable

        # The actual firewall endpoint.
        @[JSON::Field(key: "ActualFirewallEndpoint")]
        getter actual_firewall_endpoint : String?

        # The actual subnet ID for the firewall.
        @[JSON::Field(key: "ActualFirewallSubnetId")]
        getter actual_firewall_subnet_id : String?

        # The actual firewall subnet routes that are expected.
        @[JSON::Field(key: "ActualFirewallSubnetRoutes")]
        getter actual_firewall_subnet_routes : Array(Types::Route)?

        # The actual internet gateway routes.
        @[JSON::Field(key: "ActualInternetGatewayRoutes")]
        getter actual_internet_gateway_routes : Array(Types::Route)?

        # The subnets that are affected.
        @[JSON::Field(key: "AffectedSubnets")]
        getter affected_subnets : Array(String)?

        # The subnet route table for the current firewall.
        @[JSON::Field(key: "CurrentFirewallSubnetRouteTable")]
        getter current_firewall_subnet_route_table : String?

        # The route table for the current internet gateway.
        @[JSON::Field(key: "CurrentInternetGatewayRouteTable")]
        getter current_internet_gateway_route_table : String?

        # The firewall endpoint that's expected.
        @[JSON::Field(key: "ExpectedFirewallEndpoint")]
        getter expected_firewall_endpoint : String?

        # The expected subnet ID for the firewall.
        @[JSON::Field(key: "ExpectedFirewallSubnetId")]
        getter expected_firewall_subnet_id : String?

        # The firewall subnet routes that are expected.
        @[JSON::Field(key: "ExpectedFirewallSubnetRoutes")]
        getter expected_firewall_subnet_routes : Array(Types::ExpectedRoute)?

        # The expected routes for the internet gateway.
        @[JSON::Field(key: "ExpectedInternetGatewayRoutes")]
        getter expected_internet_gateway_routes : Array(Types::ExpectedRoute)?

        # The internet gateway ID.
        @[JSON::Field(key: "InternetGatewayId")]
        getter internet_gateway_id : String?

        # Information about whether the route table is used in another Availability Zone.
        @[JSON::Field(key: "IsRouteTableUsedInDifferentAZ")]
        getter is_route_table_used_in_different_az : Bool?

        # The route table ID.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : String?

        # The route that's in violation.
        @[JSON::Field(key: "ViolatingRoute")]
        getter violating_route : Types::Route?

        # Information about the VPC ID.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @actual_firewall_endpoint : String? = nil,
          @actual_firewall_subnet_id : String? = nil,
          @actual_firewall_subnet_routes : Array(Types::Route)? = nil,
          @actual_internet_gateway_routes : Array(Types::Route)? = nil,
          @affected_subnets : Array(String)? = nil,
          @current_firewall_subnet_route_table : String? = nil,
          @current_internet_gateway_route_table : String? = nil,
          @expected_firewall_endpoint : String? = nil,
          @expected_firewall_subnet_id : String? = nil,
          @expected_firewall_subnet_routes : Array(Types::ExpectedRoute)? = nil,
          @expected_internet_gateway_routes : Array(Types::ExpectedRoute)? = nil,
          @internet_gateway_id : String? = nil,
          @is_route_table_used_in_different_az : Bool? = nil,
          @route_table_id : String? = nil,
          @violating_route : Types::Route? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Violation detail for Network Firewall for a subnet that's not associated to the expected Firewall
      # Manager managed route table.
      struct NetworkFirewallMissingExpectedRTViolation
        include JSON::Serializable

        # The Availability Zone of a violating subnet.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The resource ID of the current route table that's associated with the subnet, if one is available.
        @[JSON::Field(key: "CurrentRouteTable")]
        getter current_route_table : String?

        # The resource ID of the route table that should be associated with the subnet.
        @[JSON::Field(key: "ExpectedRouteTable")]
        getter expected_route_table : String?

        # The resource ID of the VPC associated with a violating subnet.
        @[JSON::Field(key: "VPC")]
        getter vpc : String?

        # The ID of the Network Firewall or VPC resource that's in violation.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        def initialize(
          @availability_zone : String? = nil,
          @current_route_table : String? = nil,
          @expected_route_table : String? = nil,
          @vpc : String? = nil,
          @violation_target : String? = nil
        )
        end
      end

      # Violation detail for an expected route missing in Network Firewall.
      struct NetworkFirewallMissingExpectedRoutesViolation
        include JSON::Serializable

        # The expected routes.
        @[JSON::Field(key: "ExpectedRoutes")]
        getter expected_routes : Array(Types::ExpectedRoute)?

        # The target of the violation.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        # Information about the VPC ID.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @expected_routes : Array(Types::ExpectedRoute)? = nil,
          @violation_target : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Violation detail for Network Firewall for a subnet that doesn't have a Firewall Manager managed
      # firewall in its VPC.
      struct NetworkFirewallMissingFirewallViolation
        include JSON::Serializable

        # The Availability Zone of a violating subnet.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The reason the resource has this violation, if one is available.
        @[JSON::Field(key: "TargetViolationReason")]
        getter target_violation_reason : String?

        # The resource ID of the VPC associated with a violating subnet.
        @[JSON::Field(key: "VPC")]
        getter vpc : String?

        # The ID of the Network Firewall or VPC resource that's in violation.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        def initialize(
          @availability_zone : String? = nil,
          @target_violation_reason : String? = nil,
          @vpc : String? = nil,
          @violation_target : String? = nil
        )
        end
      end

      # Violation detail for Network Firewall for an Availability Zone that's missing the expected Firewall
      # Manager managed subnet.
      struct NetworkFirewallMissingSubnetViolation
        include JSON::Serializable

        # The Availability Zone of a violating subnet.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The reason the resource has this violation, if one is available.
        @[JSON::Field(key: "TargetViolationReason")]
        getter target_violation_reason : String?

        # The resource ID of the VPC associated with a violating subnet.
        @[JSON::Field(key: "VPC")]
        getter vpc : String?

        # The ID of the Network Firewall or VPC resource that's in violation.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        def initialize(
          @availability_zone : String? = nil,
          @target_violation_reason : String? = nil,
          @vpc : String? = nil,
          @violation_target : String? = nil
        )
        end
      end

      # Configures the firewall policy deployment model of Network Firewall. For information about Network
      # Firewall deployment models, see Network Firewall example architectures with routing in the Network
      # Firewall Developer Guide .
      struct NetworkFirewallPolicy
        include JSON::Serializable

        # Defines the deployment model to use for the firewall policy. To use a distributed model, set
        # PolicyOption to NULL .
        @[JSON::Field(key: "FirewallDeploymentModel")]
        getter firewall_deployment_model : String?

        def initialize(
          @firewall_deployment_model : String? = nil
        )
        end
      end

      # The definition of the Network Firewall firewall policy.
      struct NetworkFirewallPolicyDescription
        include JSON::Serializable

        # The default actions to take on a packet that doesn't match any stateful rules. The stateful default
        # action is optional, and is only valid when using the strict rule order. Valid values of the stateful
        # default action: aws:drop_strict aws:drop_established aws:alert_strict aws:alert_established
        @[JSON::Field(key: "StatefulDefaultActions")]
        getter stateful_default_actions : Array(String)?

        # Additional options governing how Network Firewall handles stateful rules. The stateful rule groups
        # that you use in your policy must have stateful rule options settings that are compatible with these
        # settings.
        @[JSON::Field(key: "StatefulEngineOptions")]
        getter stateful_engine_options : Types::StatefulEngineOptions?

        # The stateful rule groups that are used in the Network Firewall firewall policy.
        @[JSON::Field(key: "StatefulRuleGroups")]
        getter stateful_rule_groups : Array(Types::StatefulRuleGroup)?

        # Names of custom actions that are available for use in the stateless default actions settings.
        @[JSON::Field(key: "StatelessCustomActions")]
        getter stateless_custom_actions : Array(String)?

        # The actions to take on packets that don't match any of the stateless rule groups.
        @[JSON::Field(key: "StatelessDefaultActions")]
        getter stateless_default_actions : Array(String)?

        # The actions to take on packet fragments that don't match any of the stateless rule groups.
        @[JSON::Field(key: "StatelessFragmentDefaultActions")]
        getter stateless_fragment_default_actions : Array(String)?

        # The stateless rule groups that are used in the Network Firewall firewall policy.
        @[JSON::Field(key: "StatelessRuleGroups")]
        getter stateless_rule_groups : Array(Types::StatelessRuleGroup)?

        def initialize(
          @stateful_default_actions : Array(String)? = nil,
          @stateful_engine_options : Types::StatefulEngineOptions? = nil,
          @stateful_rule_groups : Array(Types::StatefulRuleGroup)? = nil,
          @stateless_custom_actions : Array(String)? = nil,
          @stateless_default_actions : Array(String)? = nil,
          @stateless_fragment_default_actions : Array(String)? = nil,
          @stateless_rule_groups : Array(Types::StatelessRuleGroup)? = nil
        )
        end
      end

      # Violation detail for Network Firewall for a firewall policy that has a different
      # NetworkFirewallPolicyDescription than is required by the Firewall Manager policy.
      struct NetworkFirewallPolicyModifiedViolation
        include JSON::Serializable

        # The policy that's currently in use in the individual account.
        @[JSON::Field(key: "CurrentPolicyDescription")]
        getter current_policy_description : Types::NetworkFirewallPolicyDescription?

        # The policy that should be in use in the individual account in order to be compliant.
        @[JSON::Field(key: "ExpectedPolicyDescription")]
        getter expected_policy_description : Types::NetworkFirewallPolicyDescription?

        # The ID of the Network Firewall or VPC resource that's in violation.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        def initialize(
          @current_policy_description : Types::NetworkFirewallPolicyDescription? = nil,
          @expected_policy_description : Types::NetworkFirewallPolicyDescription? = nil,
          @violation_target : String? = nil
        )
        end
      end

      # The setting that allows the policy owner to change the behavior of the rule group within a policy.
      struct NetworkFirewallStatefulRuleGroupOverride
        include JSON::Serializable

        # The action that changes the rule group from DROP to ALERT . This only applies to managed rule
        # groups.
        @[JSON::Field(key: "Action")]
        getter action : String?

        def initialize(
          @action : String? = nil
        )
        end
      end

      # Violation detail for an unexpected route that's present in a route table.
      struct NetworkFirewallUnexpectedFirewallRoutesViolation
        include JSON::Serializable

        # The endpoint of the firewall.
        @[JSON::Field(key: "FirewallEndpoint")]
        getter firewall_endpoint : String?

        # The subnet ID for the firewall.
        @[JSON::Field(key: "FirewallSubnetId")]
        getter firewall_subnet_id : String?

        # The ID of the route table.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : String?

        # The routes that are in violation.
        @[JSON::Field(key: "ViolatingRoutes")]
        getter violating_routes : Array(Types::Route)?

        # Information about the VPC ID.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @firewall_endpoint : String? = nil,
          @firewall_subnet_id : String? = nil,
          @route_table_id : String? = nil,
          @violating_routes : Array(Types::Route)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Violation detail for an unexpected gateway route that’s present in a route table.
      struct NetworkFirewallUnexpectedGatewayRoutesViolation
        include JSON::Serializable

        # Information about the gateway ID.
        @[JSON::Field(key: "GatewayId")]
        getter gateway_id : String?

        # Information about the route table.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : String?

        # The routes that are in violation.
        @[JSON::Field(key: "ViolatingRoutes")]
        getter violating_routes : Array(Types::Route)?

        # Information about the VPC ID.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @gateway_id : String? = nil,
          @route_table_id : String? = nil,
          @violating_routes : Array(Types::Route)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Defines the Organizations organizational units (OUs) that the specified Firewall Manager
      # administrator can apply policies to. For more information about OUs in Organizations, see Managing
      # organizational units (OUs) in the Organizations User Guide .
      struct OrganizationalUnitScope
        include JSON::Serializable

        # A boolean value that indicates if the administrator can apply policies to all OUs within an
        # organization. If true, the administrator can manage all OUs within the organization. You can either
        # enable management of all OUs through this operation, or you can specify OUs to manage in
        # OrganizationalUnitScope$OrganizationalUnits . You cannot specify both.
        @[JSON::Field(key: "AllOrganizationalUnitsEnabled")]
        getter all_organizational_units_enabled : Bool?

        # A boolean value that excludes the OUs in OrganizationalUnitScope$OrganizationalUnits from the
        # administrator's scope. If true, the Firewall Manager administrator can apply policies to all OUs in
        # the organization except for the OUs listed in OrganizationalUnitScope$OrganizationalUnits . You can
        # either specify a list of OUs to exclude by OrganizationalUnitScope$OrganizationalUnits , or you can
        # enable management of all OUs by OrganizationalUnitScope$AllOrganizationalUnitsEnabled . You cannot
        # specify both.
        @[JSON::Field(key: "ExcludeSpecifiedOrganizationalUnits")]
        getter exclude_specified_organizational_units : Bool?

        # The list of OUs within the organization that the specified Firewall Manager administrator either can
        # or cannot apply policies to, based on the value of
        # OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits . If
        # OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits is set to true , then the Firewall
        # Manager administrator can apply policies to all OUs in the organization except for the OUs in this
        # list. If OrganizationalUnitScope$ExcludeSpecifiedOrganizationalUnits is set to false , then the
        # Firewall Manager administrator can only apply policies to the OUs in this list.
        @[JSON::Field(key: "OrganizationalUnits")]
        getter organizational_units : Array(String)?

        def initialize(
          @all_organizational_units_enabled : Bool? = nil,
          @exclude_specified_organizational_units : Bool? = nil,
          @organizational_units : Array(String)? = nil
        )
        end
      end

      # The reference rule that partially matches the ViolationTarget rule and violation reason.
      struct PartialMatch
        include JSON::Serializable

        # The reference rule from the primary security group of the Firewall Manager policy.
        @[JSON::Field(key: "Reference")]
        getter reference : String?

        # The violation reason.
        @[JSON::Field(key: "TargetViolationReasons")]
        getter target_violation_reasons : Array(String)?

        def initialize(
          @reference : String? = nil,
          @target_violation_reasons : Array(String)? = nil
        )
        end
      end

      # An Firewall Manager policy.
      struct Policy
        include JSON::Serializable

        # If set to True , resources with the tags that are specified in the ResourceTag array are not in
        # scope of the policy. If set to False , and the ResourceTag array is not null, only resources with
        # the specified tags are in scope of the policy.
        @[JSON::Field(key: "ExcludeResourceTags")]
        getter exclude_resource_tags : Bool

        # The name of the Firewall Manager policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # Indicates if the policy should be automatically applied to new resources.
        @[JSON::Field(key: "RemediationEnabled")]
        getter remediation_enabled : Bool

        # The type of resource protected by or in scope of the policy. This is in the format shown in the
        # Amazon Web Services Resource Types Reference . To apply this policy to multiple resource types,
        # specify a resource type of ResourceTypeList and then specify the resource types in a
        # ResourceTypeList . The following are valid resource types for each Firewall Manager policy type:
        # Amazon Web Services WAF Classic - AWS::ApiGateway::Stage , AWS::CloudFront::Distribution , and
        # AWS::ElasticLoadBalancingV2::LoadBalancer . WAF - AWS::ApiGateway::Stage ,
        # AWS::ElasticLoadBalancingV2::LoadBalancer , and AWS::CloudFront::Distribution . Shield Advanced -
        # AWS::ElasticLoadBalancingV2::LoadBalancer , AWS::ElasticLoadBalancing::LoadBalancer , AWS::EC2::EIP
        # , and AWS::CloudFront::Distribution . Network ACL - AWS::EC2::Subnet . Security group usage audit -
        # AWS::EC2::SecurityGroup . Security group content audit - AWS::EC2::SecurityGroup ,
        # AWS::EC2::NetworkInterface , and AWS::EC2::Instance . DNS Firewall, Network Firewall, and
        # third-party firewall - AWS::EC2::VPC .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Details about the security service that is being used to protect the resources.
        @[JSON::Field(key: "SecurityServicePolicyData")]
        getter security_service_policy_data : Types::SecurityServicePolicyData

        # Indicates whether Firewall Manager should automatically remove protections from resources that leave
        # the policy scope and clean up resources that Firewall Manager is managing for accounts when those
        # accounts leave policy scope. For example, Firewall Manager will disassociate a Firewall Manager
        # managed web ACL from a protected customer resource when the customer resource leaves policy scope.
        # By default, Firewall Manager doesn't remove protections or delete Firewall Manager managed
        # resources. This option is not available for Shield Advanced or WAF Classic policies.
        @[JSON::Field(key: "DeleteUnusedFMManagedResources")]
        getter delete_unused_fm_managed_resources : Bool?

        # Specifies the Amazon Web Services account IDs and Organizations organizational units (OUs) to
        # exclude from the policy. Specifying an OU is the equivalent of specifying all accounts in the OU and
        # in any of its child OUs, including any child OUs and accounts that are added at a later time. You
        # can specify inclusions or exclusions, but not both. If you specify an IncludeMap , Firewall Manager
        # applies the policy to all accounts specified by the IncludeMap , and does not evaluate any
        # ExcludeMap specifications. If you do not specify an IncludeMap , then Firewall Manager applies the
        # policy to all accounts except for those specified by the ExcludeMap . You can specify account IDs,
        # OUs, or a combination: Specify account IDs by setting the key to ACCOUNT . For example, the
        # following is a valid map: {“ACCOUNT” : [“accountID1”, “accountID2”]} . Specify OUs by setting the
        # key to ORG_UNIT . For example, the following is a valid map: {“ORG_UNIT” : [“ouid111”, “ouid112”]} .
        # Specify accounts and OUs together in a single map, separated with a comma. For example, the
        # following is a valid map: {“ACCOUNT” : [“accountID1”, “accountID2”], “ORG_UNIT” : [“ouid111”,
        # “ouid112”]} .
        @[JSON::Field(key: "ExcludeMap")]
        getter exclude_map : Hash(String, Array(String))?

        # Specifies the Amazon Web Services account IDs and Organizations organizational units (OUs) to
        # include in the policy. Specifying an OU is the equivalent of specifying all accounts in the OU and
        # in any of its child OUs, including any child OUs and accounts that are added at a later time. You
        # can specify inclusions or exclusions, but not both. If you specify an IncludeMap , Firewall Manager
        # applies the policy to all accounts specified by the IncludeMap , and does not evaluate any
        # ExcludeMap specifications. If you do not specify an IncludeMap , then Firewall Manager applies the
        # policy to all accounts except for those specified by the ExcludeMap . You can specify account IDs,
        # OUs, or a combination: Specify account IDs by setting the key to ACCOUNT . For example, the
        # following is a valid map: {“ACCOUNT” : [“accountID1”, “accountID2”]} . Specify OUs by setting the
        # key to ORG_UNIT . For example, the following is a valid map: {“ORG_UNIT” : [“ouid111”, “ouid112”]} .
        # Specify accounts and OUs together in a single map, separated with a comma. For example, the
        # following is a valid map: {“ACCOUNT” : [“accountID1”, “accountID2”], “ORG_UNIT” : [“ouid111”,
        # “ouid112”]} .
        @[JSON::Field(key: "IncludeMap")]
        getter include_map : Hash(String, Array(String))?

        # Your description of the Firewall Manager policy.
        @[JSON::Field(key: "PolicyDescription")]
        getter policy_description : String?

        # The ID of the Firewall Manager policy.
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        # Indicates whether the policy is in or out of an admin's policy or Region scope. ACTIVE - The
        # administrator can manage and delete the policy. OUT_OF_ADMIN_SCOPE - The administrator can view the
        # policy, but they can't edit or delete the policy. Existing policy protections stay in place. Any new
        # resources that come into scope of the policy won't be protected.
        @[JSON::Field(key: "PolicyStatus")]
        getter policy_status : String?

        # A unique identifier for each update to the policy. When issuing a PutPolicy request, the
        # PolicyUpdateToken in the request must match the PolicyUpdateToken of the current policy version. To
        # get the PolicyUpdateToken of the current policy version, use a GetPolicy request.
        @[JSON::Field(key: "PolicyUpdateToken")]
        getter policy_update_token : String?

        # The unique identifiers of the resource sets used by the policy.
        @[JSON::Field(key: "ResourceSetIds")]
        getter resource_set_ids : Array(String)?

        # Specifies whether to combine multiple resource tags with AND, so that a resource must have all tags
        # to be included or excluded, or OR, so that a resource must have at least one tag. Default: AND
        @[JSON::Field(key: "ResourceTagLogicalOperator")]
        getter resource_tag_logical_operator : String?

        # An array of ResourceTag objects.
        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # An array of ResourceType objects. Use this only to specify multiple resource types. To specify a
        # single resource type, use ResourceType .
        @[JSON::Field(key: "ResourceTypeList")]
        getter resource_type_list : Array(String)?

        def initialize(
          @exclude_resource_tags : Bool,
          @policy_name : String,
          @remediation_enabled : Bool,
          @resource_type : String,
          @security_service_policy_data : Types::SecurityServicePolicyData,
          @delete_unused_fm_managed_resources : Bool? = nil,
          @exclude_map : Hash(String, Array(String))? = nil,
          @include_map : Hash(String, Array(String))? = nil,
          @policy_description : String? = nil,
          @policy_id : String? = nil,
          @policy_status : String? = nil,
          @policy_update_token : String? = nil,
          @resource_set_ids : Array(String)? = nil,
          @resource_tag_logical_operator : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @resource_type_list : Array(String)? = nil
        )
        end
      end

      # Describes the noncompliant resources in a member account for a specific Firewall Manager policy. A
      # maximum of 100 entries are displayed. If more than 100 resources are noncompliant,
      # EvaluationLimitExceeded is set to True .
      struct PolicyComplianceDetail
        include JSON::Serializable

        # Indicates if over 100 resources are noncompliant with the Firewall Manager policy.
        @[JSON::Field(key: "EvaluationLimitExceeded")]
        getter evaluation_limit_exceeded : Bool?

        # A timestamp that indicates when the returned information should be considered out of date.
        @[JSON::Field(key: "ExpiredAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expired_at : Time?

        # Details about problems with dependent services, such as WAF or Config, and the error message
        # received that indicates the problem with the service.
        @[JSON::Field(key: "IssueInfoMap")]
        getter issue_info_map : Hash(String, String)?

        # The Amazon Web Services account ID.
        @[JSON::Field(key: "MemberAccount")]
        getter member_account : String?

        # The ID of the Firewall Manager policy.
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        # The Amazon Web Services account that created the Firewall Manager policy.
        @[JSON::Field(key: "PolicyOwner")]
        getter policy_owner : String?

        # An array of resources that aren't protected by the WAF or Shield Advanced policy or that aren't in
        # compliance with the security group policy.
        @[JSON::Field(key: "Violators")]
        getter violators : Array(Types::ComplianceViolator)?

        def initialize(
          @evaluation_limit_exceeded : Bool? = nil,
          @expired_at : Time? = nil,
          @issue_info_map : Hash(String, String)? = nil,
          @member_account : String? = nil,
          @policy_id : String? = nil,
          @policy_owner : String? = nil,
          @violators : Array(Types::ComplianceViolator)? = nil
        )
        end
      end

      # Indicates whether the account is compliant with the specified policy. An account is considered
      # noncompliant if it includes resources that are not protected by the policy, for WAF and Shield
      # Advanced policies, or that are noncompliant with the policy, for security group policies.
      struct PolicyComplianceStatus
        include JSON::Serializable

        # An array of EvaluationResult objects.
        @[JSON::Field(key: "EvaluationResults")]
        getter evaluation_results : Array(Types::EvaluationResult)?

        # Details about problems with dependent services, such as WAF or Config, and the error message
        # received that indicates the problem with the service.
        @[JSON::Field(key: "IssueInfoMap")]
        getter issue_info_map : Hash(String, String)?

        # Timestamp of the last update to the EvaluationResult objects.
        @[JSON::Field(key: "LastUpdated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated : Time?

        # The member account ID.
        @[JSON::Field(key: "MemberAccount")]
        getter member_account : String?

        # The ID of the Firewall Manager policy.
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        # The name of the Firewall Manager policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # The Amazon Web Services account that created the Firewall Manager policy.
        @[JSON::Field(key: "PolicyOwner")]
        getter policy_owner : String?

        def initialize(
          @evaluation_results : Array(Types::EvaluationResult)? = nil,
          @issue_info_map : Hash(String, String)? = nil,
          @last_updated : Time? = nil,
          @member_account : String? = nil,
          @policy_id : String? = nil,
          @policy_name : String? = nil,
          @policy_owner : String? = nil
        )
        end
      end

      # Contains the settings to configure a network ACL policy, a Network Firewall firewall policy
      # deployment model, or a third-party firewall policy.
      struct PolicyOption
        include JSON::Serializable

        # Defines a Firewall Manager network ACL policy.
        @[JSON::Field(key: "NetworkAclCommonPolicy")]
        getter network_acl_common_policy : Types::NetworkAclCommonPolicy?

        # Defines the deployment model to use for the firewall policy.
        @[JSON::Field(key: "NetworkFirewallPolicy")]
        getter network_firewall_policy : Types::NetworkFirewallPolicy?

        # Defines the policy options for a third-party firewall policy.
        @[JSON::Field(key: "ThirdPartyFirewallPolicy")]
        getter third_party_firewall_policy : Types::ThirdPartyFirewallPolicy?

        def initialize(
          @network_acl_common_policy : Types::NetworkAclCommonPolicy? = nil,
          @network_firewall_policy : Types::NetworkFirewallPolicy? = nil,
          @third_party_firewall_policy : Types::ThirdPartyFirewallPolicy? = nil
        )
        end
      end

      # Details of the Firewall Manager policy.
      struct PolicySummary
        include JSON::Serializable

        # Indicates whether Firewall Manager should automatically remove protections from resources that leave
        # the policy scope and clean up resources that Firewall Manager is managing for accounts when those
        # accounts leave policy scope. For example, Firewall Manager will disassociate a Firewall Manager
        # managed web ACL from a protected customer resource when the customer resource leaves policy scope.
        # By default, Firewall Manager doesn't remove protections or delete Firewall Manager managed
        # resources. This option is not available for Shield Advanced or WAF Classic policies.
        @[JSON::Field(key: "DeleteUnusedFMManagedResources")]
        getter delete_unused_fm_managed_resources : Bool?

        # The Amazon Resource Name (ARN) of the specified policy.
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String?

        # The ID of the specified policy.
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        # The name of the specified policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # Indicates whether the policy is in or out of an admin's policy or Region scope. ACTIVE - The
        # administrator can manage and delete the policy. OUT_OF_ADMIN_SCOPE - The administrator can view the
        # policy, but they can't edit or delete the policy. Existing policy protections stay in place. Any new
        # resources that come into scope of the policy won't be protected.
        @[JSON::Field(key: "PolicyStatus")]
        getter policy_status : String?

        # Indicates if the policy should be automatically applied to new resources.
        @[JSON::Field(key: "RemediationEnabled")]
        getter remediation_enabled : Bool?

        # The type of resource protected by or in scope of the policy. This is in the format shown in the
        # Amazon Web Services Resource Types Reference .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The service that the policy is using to protect the resources. This specifies the type of policy
        # that is created, either an WAF policy, a Shield Advanced policy, or a security group policy.
        @[JSON::Field(key: "SecurityServiceType")]
        getter security_service_type : String?

        def initialize(
          @delete_unused_fm_managed_resources : Bool? = nil,
          @policy_arn : String? = nil,
          @policy_id : String? = nil,
          @policy_name : String? = nil,
          @policy_status : String? = nil,
          @remediation_enabled : Bool? = nil,
          @resource_type : String? = nil,
          @security_service_type : String? = nil
        )
        end
      end

      # Defines the policy types that the specified Firewall Manager administrator can manage.
      struct PolicyTypeScope
        include JSON::Serializable

        # Allows the specified Firewall Manager administrator to manage all Firewall Manager policy types,
        # except for third-party policy types. Third-party policy types can only be managed by the Firewall
        # Manager default administrator.
        @[JSON::Field(key: "AllPolicyTypesEnabled")]
        getter all_policy_types_enabled : Bool?

        # The list of policy types that the specified Firewall Manager administrator can manage.
        @[JSON::Field(key: "PolicyTypes")]
        getter policy_types : Array(String)?

        def initialize(
          @all_policy_types_enabled : Bool? = nil,
          @policy_types : Array(String)? = nil
        )
        end
      end

      # A list of remediation actions.
      struct PossibleRemediationAction
        include JSON::Serializable

        # The ordered list of remediation actions.
        @[JSON::Field(key: "OrderedRemediationActions")]
        getter ordered_remediation_actions : Array(Types::RemediationActionWithOrder)

        # A description of the list of remediation actions.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about whether an action is taken by default.
        @[JSON::Field(key: "IsDefaultAction")]
        getter is_default_action : Bool?

        def initialize(
          @ordered_remediation_actions : Array(Types::RemediationActionWithOrder),
          @description : String? = nil,
          @is_default_action : Bool? = nil
        )
        end
      end

      # A list of possible remediation action lists. Each individual possible remediation action is a list
      # of individual remediation actions.
      struct PossibleRemediationActions
        include JSON::Serializable

        # Information about the actions.
        @[JSON::Field(key: "Actions")]
        getter actions : Array(Types::PossibleRemediationAction)?

        # A description of the possible remediation actions list.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @actions : Array(Types::PossibleRemediationAction)? = nil,
          @description : String? = nil
        )
        end
      end

      # An Firewall Manager protocols list.
      struct ProtocolsListData
        include JSON::Serializable

        # The name of the Firewall Manager protocols list.
        @[JSON::Field(key: "ListName")]
        getter list_name : String

        # An array of protocols in the Firewall Manager protocols list.
        @[JSON::Field(key: "ProtocolsList")]
        getter protocols_list : Array(String)

        # The time that the Firewall Manager protocols list was created.
        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The time that the Firewall Manager protocols list was last updated.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # The ID of the Firewall Manager protocols list.
        @[JSON::Field(key: "ListId")]
        getter list_id : String?

        # A unique identifier for each update to the list. When you update the list, the update token must
        # match the token of the current version of the application list. You can retrieve the update token by
        # getting the list.
        @[JSON::Field(key: "ListUpdateToken")]
        getter list_update_token : String?

        # A map of previous version numbers to their corresponding protocol arrays.
        @[JSON::Field(key: "PreviousProtocolsList")]
        getter previous_protocols_list : Hash(String, Array(String))?

        def initialize(
          @list_name : String,
          @protocols_list : Array(String),
          @create_time : Time? = nil,
          @last_update_time : Time? = nil,
          @list_id : String? = nil,
          @list_update_token : String? = nil,
          @previous_protocols_list : Hash(String, Array(String))? = nil
        )
        end
      end

      # Details of the Firewall Manager protocols list.
      struct ProtocolsListDataSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified protocols list.
        @[JSON::Field(key: "ListArn")]
        getter list_arn : String?

        # The ID of the specified protocols list.
        @[JSON::Field(key: "ListId")]
        getter list_id : String?

        # The name of the specified protocols list.
        @[JSON::Field(key: "ListName")]
        getter list_name : String?

        # An array of protocols in the Firewall Manager protocols list.
        @[JSON::Field(key: "ProtocolsList")]
        getter protocols_list : Array(String)?

        def initialize(
          @list_arn : String? = nil,
          @list_id : String? = nil,
          @list_name : String? = nil,
          @protocols_list : Array(String)? = nil
        )
        end
      end

      struct PutAdminAccountRequest
        include JSON::Serializable

        # The Amazon Web Services account ID to add as an Firewall Manager administrator account. The account
        # must be a member of the organization that was onboarded to Firewall Manager by AssociateAdminAccount
        # . For more information about Organizations, see Managing the Amazon Web Services Accounts in Your
        # Organization .
        @[JSON::Field(key: "AdminAccount")]
        getter admin_account : String

        # Configures the resources that the specified Firewall Manager administrator can manage. As a best
        # practice, set the administrative scope according to the principles of least privilege. Only grant
        # the administrator the specific resources or permissions that they need to perform the duties of
        # their role.
        @[JSON::Field(key: "AdminScope")]
        getter admin_scope : Types::AdminScope?

        def initialize(
          @admin_account : String,
          @admin_scope : Types::AdminScope? = nil
        )
        end
      end

      struct PutAppsListRequest
        include JSON::Serializable

        # The details of the Firewall Manager applications list to be created.
        @[JSON::Field(key: "AppsList")]
        getter apps_list : Types::AppsListData

        # The tags associated with the resource.
        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @apps_list : Types::AppsListData,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutAppsListResponse
        include JSON::Serializable

        # The details of the Firewall Manager applications list.
        @[JSON::Field(key: "AppsList")]
        getter apps_list : Types::AppsListData?

        # The Amazon Resource Name (ARN) of the applications list.
        @[JSON::Field(key: "AppsListArn")]
        getter apps_list_arn : String?

        def initialize(
          @apps_list : Types::AppsListData? = nil,
          @apps_list_arn : String? = nil
        )
        end
      end

      struct PutNotificationChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that allows Amazon SNS to record Firewall Manager
        # activity.
        @[JSON::Field(key: "SnsRoleName")]
        getter sns_role_name : String

        # The Amazon Resource Name (ARN) of the SNS topic that collects notifications from Firewall Manager.
        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String

        def initialize(
          @sns_role_name : String,
          @sns_topic_arn : String
        )
        end
      end

      struct PutPolicyRequest
        include JSON::Serializable

        # The details of the Firewall Manager policy to be created.
        @[JSON::Field(key: "Policy")]
        getter policy : Types::Policy

        # The tags to add to the Amazon Web Services resource.
        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @policy : Types::Policy,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutPolicyResponse
        include JSON::Serializable

        # The details of the Firewall Manager policy.
        @[JSON::Field(key: "Policy")]
        getter policy : Types::Policy?

        # The Amazon Resource Name (ARN) of the policy.
        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String?

        def initialize(
          @policy : Types::Policy? = nil,
          @policy_arn : String? = nil
        )
        end
      end

      struct PutProtocolsListRequest
        include JSON::Serializable

        # The details of the Firewall Manager protocols list to be created.
        @[JSON::Field(key: "ProtocolsList")]
        getter protocols_list : Types::ProtocolsListData

        # The tags associated with the resource.
        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @protocols_list : Types::ProtocolsListData,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutProtocolsListResponse
        include JSON::Serializable

        # The details of the Firewall Manager protocols list.
        @[JSON::Field(key: "ProtocolsList")]
        getter protocols_list : Types::ProtocolsListData?

        # The Amazon Resource Name (ARN) of the protocols list.
        @[JSON::Field(key: "ProtocolsListArn")]
        getter protocols_list_arn : String?

        def initialize(
          @protocols_list : Types::ProtocolsListData? = nil,
          @protocols_list_arn : String? = nil
        )
        end
      end

      struct PutResourceSetRequest
        include JSON::Serializable

        # Details about the resource set to be created or updated.&gt;
        @[JSON::Field(key: "ResourceSet")]
        getter resource_set : Types::ResourceSet

        # Retrieves the tags associated with the specified resource set. Tags are key:value pairs that you can
        # use to categorize and manage your resources, for purposes like billing. For example, you might set
        # the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags
        # to add to each Amazon Web Services resource, up to 50 tags for a resource.
        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @resource_set : Types::ResourceSet,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutResourceSetResponse
        include JSON::Serializable

        # Details about the resource set.
        @[JSON::Field(key: "ResourceSet")]
        getter resource_set : Types::ResourceSet

        # The Amazon Resource Name (ARN) of the resource set.
        @[JSON::Field(key: "ResourceSetArn")]
        getter resource_set_arn : String

        def initialize(
          @resource_set : Types::ResourceSet,
          @resource_set_arn : String
        )
        end
      end

      # Defines the Amazon Web Services Regions that the specified Firewall Manager administrator can
      # manage.
      struct RegionScope
        include JSON::Serializable

        # Allows the specified Firewall Manager administrator to manage all Amazon Web Services Regions.
        @[JSON::Field(key: "AllRegionsEnabled")]
        getter all_regions_enabled : Bool?

        # The Amazon Web Services Regions that the specified Firewall Manager administrator can perform
        # actions in.
        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        def initialize(
          @all_regions_enabled : Bool? = nil,
          @regions : Array(String)? = nil
        )
        end
      end

      # Information about an individual action you can take to remediate a violation.
      struct RemediationAction
        include JSON::Serializable

        # Information about the CreateNetworkAcl action in Amazon EC2.
        @[JSON::Field(key: "CreateNetworkAclAction")]
        getter create_network_acl_action : Types::CreateNetworkAclAction?

        # Information about the CreateNetworkAclEntries action in Amazon EC2.
        @[JSON::Field(key: "CreateNetworkAclEntriesAction")]
        getter create_network_acl_entries_action : Types::CreateNetworkAclEntriesAction?

        # Information about the DeleteNetworkAclEntries action in Amazon EC2.
        @[JSON::Field(key: "DeleteNetworkAclEntriesAction")]
        getter delete_network_acl_entries_action : Types::DeleteNetworkAclEntriesAction?

        # A description of a remediation action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about the AssociateRouteTable action in the Amazon EC2 API.
        @[JSON::Field(key: "EC2AssociateRouteTableAction")]
        getter ec2_associate_route_table_action : Types::EC2AssociateRouteTableAction?

        # Information about the CopyRouteTable action in the Amazon EC2 API.
        @[JSON::Field(key: "EC2CopyRouteTableAction")]
        getter ec2_copy_route_table_action : Types::EC2CopyRouteTableAction?

        # Information about the CreateRoute action in the Amazon EC2 API.
        @[JSON::Field(key: "EC2CreateRouteAction")]
        getter ec2_create_route_action : Types::EC2CreateRouteAction?

        # Information about the CreateRouteTable action in the Amazon EC2 API.
        @[JSON::Field(key: "EC2CreateRouteTableAction")]
        getter ec2_create_route_table_action : Types::EC2CreateRouteTableAction?

        # Information about the DeleteRoute action in the Amazon EC2 API.
        @[JSON::Field(key: "EC2DeleteRouteAction")]
        getter ec2_delete_route_action : Types::EC2DeleteRouteAction?

        # Information about the ReplaceRoute action in the Amazon EC2 API.
        @[JSON::Field(key: "EC2ReplaceRouteAction")]
        getter ec2_replace_route_action : Types::EC2ReplaceRouteAction?

        # Information about the ReplaceRouteTableAssociation action in the Amazon EC2 API.
        @[JSON::Field(key: "EC2ReplaceRouteTableAssociationAction")]
        getter ec2_replace_route_table_association_action : Types::EC2ReplaceRouteTableAssociationAction?

        # The remedial action to take when updating a firewall configuration.
        @[JSON::Field(key: "FMSPolicyUpdateFirewallCreationConfigAction")]
        getter fms_policy_update_firewall_creation_config_action : Types::FMSPolicyUpdateFirewallCreationConfigAction?

        # Information about the ReplaceNetworkAclAssociation action in Amazon EC2.
        @[JSON::Field(key: "ReplaceNetworkAclAssociationAction")]
        getter replace_network_acl_association_action : Types::ReplaceNetworkAclAssociationAction?

        def initialize(
          @create_network_acl_action : Types::CreateNetworkAclAction? = nil,
          @create_network_acl_entries_action : Types::CreateNetworkAclEntriesAction? = nil,
          @delete_network_acl_entries_action : Types::DeleteNetworkAclEntriesAction? = nil,
          @description : String? = nil,
          @ec2_associate_route_table_action : Types::EC2AssociateRouteTableAction? = nil,
          @ec2_copy_route_table_action : Types::EC2CopyRouteTableAction? = nil,
          @ec2_create_route_action : Types::EC2CreateRouteAction? = nil,
          @ec2_create_route_table_action : Types::EC2CreateRouteTableAction? = nil,
          @ec2_delete_route_action : Types::EC2DeleteRouteAction? = nil,
          @ec2_replace_route_action : Types::EC2ReplaceRouteAction? = nil,
          @ec2_replace_route_table_association_action : Types::EC2ReplaceRouteTableAssociationAction? = nil,
          @fms_policy_update_firewall_creation_config_action : Types::FMSPolicyUpdateFirewallCreationConfigAction? = nil,
          @replace_network_acl_association_action : Types::ReplaceNetworkAclAssociationAction? = nil
        )
        end
      end

      # An ordered list of actions you can take to remediate a violation.
      struct RemediationActionWithOrder
        include JSON::Serializable

        # The order of the remediation actions in the list.
        @[JSON::Field(key: "Order")]
        getter order : Int32?

        # Information about an action you can take to remediate a violation.
        @[JSON::Field(key: "RemediationAction")]
        getter remediation_action : Types::RemediationAction?

        def initialize(
          @order : Int32? = nil,
          @remediation_action : Types::RemediationAction? = nil
        )
        end
      end

      # Information about the ReplaceNetworkAclAssociation action in Amazon EC2. This is a remediation
      # option in RemediationAction .
      struct ReplaceNetworkAclAssociationAction
        include JSON::Serializable

        @[JSON::Field(key: "AssociationId")]
        getter association_id : Types::ActionTarget?

        # Brief description of this remediation action.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether it is possible for Firewall Manager to perform this remediation action. A false
        # value indicates that auto remediation is disabled or Firewall Manager is unable to perform the
        # action due to a conflict of some kind.
        @[JSON::Field(key: "FMSCanRemediate")]
        getter fms_can_remediate : Bool?

        # The network ACL that's associated with the remediation action.
        @[JSON::Field(key: "NetworkAclId")]
        getter network_acl_id : Types::ActionTarget?

        def initialize(
          @association_id : Types::ActionTarget? = nil,
          @description : String? = nil,
          @fms_can_remediate : Bool? = nil,
          @network_acl_id : Types::ActionTarget? = nil
        )
        end
      end

      # Details of a resource that is associated to an Firewall Manager resource set.
      struct Resource
        include JSON::Serializable

        # The resource's universal resource indicator (URI).
        @[JSON::Field(key: "URI")]
        getter uri : String

        # The Amazon Web Services account ID that the associated resource belongs to.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @uri : String,
          @account_id : String? = nil
        )
        end
      end

      # The specified resource was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A set of resources to include in a policy.
      struct ResourceSet
        include JSON::Serializable

        # The descriptive name of the resource set. You can't change the name of a resource set after you
        # create it.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Determines the resources that can be associated to the resource set. Depending on your setting for
        # max results and the number of resource sets, a single call might not return the full list.
        @[JSON::Field(key: "ResourceTypeList")]
        getter resource_type_list : Array(String)

        # A description of the resource set.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the resource set. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The last time that the resource set was changed.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # Indicates whether the resource set is in or out of an admin's Region scope. ACTIVE - The
        # administrator can manage and delete the resource set. OUT_OF_ADMIN_SCOPE - The administrator can
        # view the resource set, but they can't edit or delete the resource set. Existing protections stay in
        # place. Any new resource that come into scope of the resource set won't be protected.
        @[JSON::Field(key: "ResourceSetStatus")]
        getter resource_set_status : String?

        # An optional token that you can use for optimistic locking. Firewall Manager returns a token to your
        # requests that access the resource set. The token marks the state of the resource set resource at the
        # time of the request. Update tokens are not allowed when creating a resource set. After creation,
        # each subsequent update call to the resource set requires the update token. To make an unconditional
        # change to the resource set, omit the token in your update request. Without the token, Firewall
        # Manager performs your updates regardless of whether the resource set has changed since you last
        # retrieved it. To make a conditional change to the resource set, provide the token in your update
        # request. Firewall Manager uses the token to ensure that the resource set hasn't changed since you
        # last retrieved it. If it has changed, the operation fails with an InvalidTokenException . If this
        # happens, retrieve the resource set again to get a current copy of it with a new token. Reapply your
        # changes as needed, then try the operation again using the new token.
        @[JSON::Field(key: "UpdateToken")]
        getter update_token : String?

        def initialize(
          @name : String,
          @resource_type_list : Array(String),
          @description : String? = nil,
          @id : String? = nil,
          @last_update_time : Time? = nil,
          @resource_set_status : String? = nil,
          @update_token : String? = nil
        )
        end
      end

      # Summarizes the resource sets used in a policy.
      struct ResourceSetSummary
        include JSON::Serializable

        # A description of the resource set.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the resource set. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The last time that the resource set was changed.
        @[JSON::Field(key: "LastUpdateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # The descriptive name of the resource set. You can't change the name of a resource set after you
        # create it.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates whether the resource set is in or out of an admin's Region scope. ACTIVE - The
        # administrator can manage and delete the resource set. OUT_OF_ADMIN_SCOPE - The administrator can
        # view the resource set, but they can't edit or delete the resource set. Existing protections stay in
        # place. Any new resource that come into scope of the resource set won't be protected.
        @[JSON::Field(key: "ResourceSetStatus")]
        getter resource_set_status : String?

        def initialize(
          @description : String? = nil,
          @id : String? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil,
          @resource_set_status : String? = nil
        )
        end
      end

      # The resource tags that Firewall Manager uses to determine if a particular resource should be
      # included or excluded from the Firewall Manager policy. Tags enable you to categorize your Amazon Web
      # Services resources in different ways, for example, by purpose, owner, or environment. Each tag
      # consists of a key and an optional value. If you add more than one tag to a policy, you can specify
      # whether to combine them using the logical AND operator or the logical OR operator. For more
      # information, see Working with Tag Editor . Every resource tag must have a string value, either a
      # non-empty string or an empty string. If you don't provide a value for a resource tag, Firewall
      # Manager saves the value as an empty string: "". When Firewall Manager compares tags, it only matches
      # two tags if they have the same key and the same value. A tag with an empty string value only matches
      # with tags that also have an empty string value.
      struct ResourceTag
        include JSON::Serializable

        # The resource tag key.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The resource tag value. To specify an empty string value, either don't provide this or specify it as
        # "".
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # Violation detail based on resource type.
      struct ResourceViolation
        include JSON::Serializable

        # Violation detail for an EC2 instance.
        @[JSON::Field(key: "AwsEc2InstanceViolation")]
        getter aws_ec2_instance_violation : Types::AwsEc2InstanceViolation?

        # Violation detail for a network interface.
        @[JSON::Field(key: "AwsEc2NetworkInterfaceViolation")]
        getter aws_ec2_network_interface_violation : Types::AwsEc2NetworkInterfaceViolation?

        # Violation detail for security groups.
        @[JSON::Field(key: "AwsVPCSecurityGroupViolation")]
        getter aws_vpc_security_group_violation : Types::AwsVPCSecurityGroupViolation?

        # Violation detail for a DNS Firewall policy that indicates that a rule group that Firewall Manager
        # tried to associate with a VPC is already associated with the VPC and can't be associated again.
        @[JSON::Field(key: "DnsDuplicateRuleGroupViolation")]
        getter dns_duplicate_rule_group_violation : Types::DnsDuplicateRuleGroupViolation?

        # Violation detail for a DNS Firewall policy that indicates that the VPC reached the limit for
        # associated DNS Firewall rule groups. Firewall Manager tried to associate another rule group with the
        # VPC and failed.
        @[JSON::Field(key: "DnsRuleGroupLimitExceededViolation")]
        getter dns_rule_group_limit_exceeded_violation : Types::DnsRuleGroupLimitExceededViolation?

        # Violation detail for a DNS Firewall policy that indicates that a rule group that Firewall Manager
        # tried to associate with a VPC has the same priority as a rule group that's already associated.
        @[JSON::Field(key: "DnsRuleGroupPriorityConflictViolation")]
        getter dns_rule_group_priority_conflict_violation : Types::DnsRuleGroupPriorityConflictViolation?

        # Contains details about the firewall subnet that violates the policy scope.
        @[JSON::Field(key: "FirewallSubnetIsOutOfScopeViolation")]
        getter firewall_subnet_is_out_of_scope_violation : Types::FirewallSubnetIsOutOfScopeViolation?

        # The violation details for a third-party firewall's VPC endpoint subnet that was deleted.
        @[JSON::Field(key: "FirewallSubnetMissingVPCEndpointViolation")]
        getter firewall_subnet_missing_vpc_endpoint_violation : Types::FirewallSubnetMissingVPCEndpointViolation?

        # Violation detail for the entries in a network ACL resource.
        @[JSON::Field(key: "InvalidNetworkAclEntriesViolation")]
        getter invalid_network_acl_entries_violation : Types::InvalidNetworkAclEntriesViolation?

        @[JSON::Field(key: "NetworkFirewallBlackHoleRouteDetectedViolation")]
        getter network_firewall_black_hole_route_detected_violation : Types::NetworkFirewallBlackHoleRouteDetectedViolation?

        # Violation detail for the subnet for which internet traffic hasn't been inspected.
        @[JSON::Field(key: "NetworkFirewallInternetTrafficNotInspectedViolation")]
        getter network_firewall_internet_traffic_not_inspected_violation : Types::NetworkFirewallInternetTrafficNotInspectedViolation?

        # The route configuration is invalid.
        @[JSON::Field(key: "NetworkFirewallInvalidRouteConfigurationViolation")]
        getter network_firewall_invalid_route_configuration_violation : Types::NetworkFirewallInvalidRouteConfigurationViolation?

        # Violation detail for an Network Firewall policy that indicates that a subnet is not associated with
        # the expected Firewall Manager managed route table.
        @[JSON::Field(key: "NetworkFirewallMissingExpectedRTViolation")]
        getter network_firewall_missing_expected_rt_violation : Types::NetworkFirewallMissingExpectedRTViolation?

        # Expected routes are missing from Network Firewall.
        @[JSON::Field(key: "NetworkFirewallMissingExpectedRoutesViolation")]
        getter network_firewall_missing_expected_routes_violation : Types::NetworkFirewallMissingExpectedRoutesViolation?

        # Violation detail for an Network Firewall policy that indicates that a subnet has no Firewall Manager
        # managed firewall in its VPC.
        @[JSON::Field(key: "NetworkFirewallMissingFirewallViolation")]
        getter network_firewall_missing_firewall_violation : Types::NetworkFirewallMissingFirewallViolation?

        # Violation detail for an Network Firewall policy that indicates that an Availability Zone is missing
        # the expected Firewall Manager managed subnet.
        @[JSON::Field(key: "NetworkFirewallMissingSubnetViolation")]
        getter network_firewall_missing_subnet_violation : Types::NetworkFirewallMissingSubnetViolation?

        # Violation detail for an Network Firewall policy that indicates that a firewall policy in an
        # individual account has been modified in a way that makes it noncompliant. For example, the
        # individual account owner might have deleted a rule group, changed the priority of a stateless rule
        # group, or changed a policy default action.
        @[JSON::Field(key: "NetworkFirewallPolicyModifiedViolation")]
        getter network_firewall_policy_modified_violation : Types::NetworkFirewallPolicyModifiedViolation?

        # There's an unexpected firewall route.
        @[JSON::Field(key: "NetworkFirewallUnexpectedFirewallRoutesViolation")]
        getter network_firewall_unexpected_firewall_routes_violation : Types::NetworkFirewallUnexpectedFirewallRoutesViolation?

        # There's an unexpected gateway route.
        @[JSON::Field(key: "NetworkFirewallUnexpectedGatewayRoutesViolation")]
        getter network_firewall_unexpected_gateway_routes_violation : Types::NetworkFirewallUnexpectedGatewayRoutesViolation?

        # A list of possible remediation action lists. Each individual possible remediation action is a list
        # of individual remediation actions.
        @[JSON::Field(key: "PossibleRemediationActions")]
        getter possible_remediation_actions : Types::PossibleRemediationActions?

        # Contains details about the route endpoint that violates the policy scope.
        @[JSON::Field(key: "RouteHasOutOfScopeEndpointViolation")]
        getter route_has_out_of_scope_endpoint_violation : Types::RouteHasOutOfScopeEndpointViolation?

        # The violation details for a third-party firewall that has the Firewall Manager managed route table
        # that was associated with the third-party firewall has been deleted.
        @[JSON::Field(key: "ThirdPartyFirewallMissingExpectedRouteTableViolation")]
        getter third_party_firewall_missing_expected_route_table_violation : Types::ThirdPartyFirewallMissingExpectedRouteTableViolation?

        # The violation details for a third-party firewall that's been deleted.
        @[JSON::Field(key: "ThirdPartyFirewallMissingFirewallViolation")]
        getter third_party_firewall_missing_firewall_violation : Types::ThirdPartyFirewallMissingFirewallViolation?

        # The violation details for a third-party firewall's subnet that's been deleted.
        @[JSON::Field(key: "ThirdPartyFirewallMissingSubnetViolation")]
        getter third_party_firewall_missing_subnet_violation : Types::ThirdPartyFirewallMissingSubnetViolation?

        # The violation details for a web ACL whose configuration is incompatible with the Firewall Manager
        # policy.
        @[JSON::Field(key: "WebACLHasIncompatibleConfigurationViolation")]
        getter web_acl_has_incompatible_configuration_violation : Types::WebACLHasIncompatibleConfigurationViolation?

        # The violation details for a web ACL that's associated with at least one resource that's out of scope
        # of the Firewall Manager policy.
        @[JSON::Field(key: "WebACLHasOutOfScopeResourcesViolation")]
        getter web_acl_has_out_of_scope_resources_violation : Types::WebACLHasOutOfScopeResourcesViolation?

        def initialize(
          @aws_ec2_instance_violation : Types::AwsEc2InstanceViolation? = nil,
          @aws_ec2_network_interface_violation : Types::AwsEc2NetworkInterfaceViolation? = nil,
          @aws_vpc_security_group_violation : Types::AwsVPCSecurityGroupViolation? = nil,
          @dns_duplicate_rule_group_violation : Types::DnsDuplicateRuleGroupViolation? = nil,
          @dns_rule_group_limit_exceeded_violation : Types::DnsRuleGroupLimitExceededViolation? = nil,
          @dns_rule_group_priority_conflict_violation : Types::DnsRuleGroupPriorityConflictViolation? = nil,
          @firewall_subnet_is_out_of_scope_violation : Types::FirewallSubnetIsOutOfScopeViolation? = nil,
          @firewall_subnet_missing_vpc_endpoint_violation : Types::FirewallSubnetMissingVPCEndpointViolation? = nil,
          @invalid_network_acl_entries_violation : Types::InvalidNetworkAclEntriesViolation? = nil,
          @network_firewall_black_hole_route_detected_violation : Types::NetworkFirewallBlackHoleRouteDetectedViolation? = nil,
          @network_firewall_internet_traffic_not_inspected_violation : Types::NetworkFirewallInternetTrafficNotInspectedViolation? = nil,
          @network_firewall_invalid_route_configuration_violation : Types::NetworkFirewallInvalidRouteConfigurationViolation? = nil,
          @network_firewall_missing_expected_rt_violation : Types::NetworkFirewallMissingExpectedRTViolation? = nil,
          @network_firewall_missing_expected_routes_violation : Types::NetworkFirewallMissingExpectedRoutesViolation? = nil,
          @network_firewall_missing_firewall_violation : Types::NetworkFirewallMissingFirewallViolation? = nil,
          @network_firewall_missing_subnet_violation : Types::NetworkFirewallMissingSubnetViolation? = nil,
          @network_firewall_policy_modified_violation : Types::NetworkFirewallPolicyModifiedViolation? = nil,
          @network_firewall_unexpected_firewall_routes_violation : Types::NetworkFirewallUnexpectedFirewallRoutesViolation? = nil,
          @network_firewall_unexpected_gateway_routes_violation : Types::NetworkFirewallUnexpectedGatewayRoutesViolation? = nil,
          @possible_remediation_actions : Types::PossibleRemediationActions? = nil,
          @route_has_out_of_scope_endpoint_violation : Types::RouteHasOutOfScopeEndpointViolation? = nil,
          @third_party_firewall_missing_expected_route_table_violation : Types::ThirdPartyFirewallMissingExpectedRouteTableViolation? = nil,
          @third_party_firewall_missing_firewall_violation : Types::ThirdPartyFirewallMissingFirewallViolation? = nil,
          @third_party_firewall_missing_subnet_violation : Types::ThirdPartyFirewallMissingSubnetViolation? = nil,
          @web_acl_has_incompatible_configuration_violation : Types::WebACLHasIncompatibleConfigurationViolation? = nil,
          @web_acl_has_out_of_scope_resources_violation : Types::WebACLHasOutOfScopeResourcesViolation? = nil
        )
        end
      end

      # Describes a route in a route table.
      struct Route
        include JSON::Serializable

        # The destination of the route.
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # The type of destination for the route.
        @[JSON::Field(key: "DestinationType")]
        getter destination_type : String?

        # The route's target.
        @[JSON::Field(key: "Target")]
        getter target : String?

        # The type of target for the route.
        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        def initialize(
          @destination : String? = nil,
          @destination_type : String? = nil,
          @target : String? = nil,
          @target_type : String? = nil
        )
        end
      end

      # Contains details about the route endpoint that violates the policy scope.
      struct RouteHasOutOfScopeEndpointViolation
        include JSON::Serializable

        # The route table associated with the current firewall subnet.
        @[JSON::Field(key: "CurrentFirewallSubnetRouteTable")]
        getter current_firewall_subnet_route_table : String?

        # The current route table associated with the Internet Gateway.
        @[JSON::Field(key: "CurrentInternetGatewayRouteTable")]
        getter current_internet_gateway_route_table : String?

        # The ID of the firewall subnet.
        @[JSON::Field(key: "FirewallSubnetId")]
        getter firewall_subnet_id : String?

        # The list of firewall subnet routes.
        @[JSON::Field(key: "FirewallSubnetRoutes")]
        getter firewall_subnet_routes : Array(Types::Route)?

        # The ID of the Internet Gateway.
        @[JSON::Field(key: "InternetGatewayId")]
        getter internet_gateway_id : String?

        # The routes in the route table associated with the Internet Gateway.
        @[JSON::Field(key: "InternetGatewayRoutes")]
        getter internet_gateway_routes : Array(Types::Route)?

        # The ID of the route table.
        @[JSON::Field(key: "RouteTableId")]
        getter route_table_id : String?

        # The subnet's Availability Zone.
        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : String?

        # The ID of the subnet's Availability Zone.
        @[JSON::Field(key: "SubnetAvailabilityZoneId")]
        getter subnet_availability_zone_id : String?

        # The ID of the subnet associated with the route that violates the policy scope.
        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        # The list of routes that violate the route table.
        @[JSON::Field(key: "ViolatingRoutes")]
        getter violating_routes : Array(Types::Route)?

        # The VPC ID of the route that violates the policy scope.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @current_firewall_subnet_route_table : String? = nil,
          @current_internet_gateway_route_table : String? = nil,
          @firewall_subnet_id : String? = nil,
          @firewall_subnet_routes : Array(Types::Route)? = nil,
          @internet_gateway_id : String? = nil,
          @internet_gateway_routes : Array(Types::Route)? = nil,
          @route_table_id : String? = nil,
          @subnet_availability_zone : String? = nil,
          @subnet_availability_zone_id : String? = nil,
          @subnet_id : String? = nil,
          @violating_routes : Array(Types::Route)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Remediation option for the rule specified in the ViolationTarget .
      struct SecurityGroupRemediationAction
        include JSON::Serializable

        # Brief description of the action that will be performed.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates if the current action is the default action.
        @[JSON::Field(key: "IsDefaultAction")]
        getter is_default_action : Bool?

        # The remediation action that will be performed.
        @[JSON::Field(key: "RemediationActionType")]
        getter remediation_action_type : String?

        # The final state of the rule specified in the ViolationTarget after it is remediated.
        @[JSON::Field(key: "RemediationResult")]
        getter remediation_result : Types::SecurityGroupRuleDescription?

        def initialize(
          @description : String? = nil,
          @is_default_action : Bool? = nil,
          @remediation_action_type : String? = nil,
          @remediation_result : Types::SecurityGroupRuleDescription? = nil
        )
        end
      end

      # Describes a set of permissions for a security group rule.
      struct SecurityGroupRuleDescription
        include JSON::Serializable

        # The start of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6 type number. A value of
        # -1 indicates all ICMP/ICMPv6 types.
        @[JSON::Field(key: "FromPort")]
        getter from_port : Int64?

        # The IPv4 ranges for the security group rule.
        @[JSON::Field(key: "IPV4Range")]
        getter ipv4_range : String?

        # The IPv6 ranges for the security group rule.
        @[JSON::Field(key: "IPV6Range")]
        getter ipv6_range : String?

        # The ID of the prefix list for the security group rule.
        @[JSON::Field(key: "PrefixListId")]
        getter prefix_list_id : String?

        # The IP protocol name ( tcp , udp , icmp , icmpv6 ) or number.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The end of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6 code. A value of -1
        # indicates all ICMP/ICMPv6 codes.
        @[JSON::Field(key: "ToPort")]
        getter to_port : Int64?

        def initialize(
          @from_port : Int64? = nil,
          @ipv4_range : String? = nil,
          @ipv6_range : String? = nil,
          @prefix_list_id : String? = nil,
          @protocol : String? = nil,
          @to_port : Int64? = nil
        )
        end
      end

      # Details about the security service that is being used to protect the resources.
      struct SecurityServicePolicyData
        include JSON::Serializable

        # The service that the policy is using to protect the resources. This specifies the type of policy
        # that is created, either an WAF policy, a Shield Advanced policy, or a security group policy. For
        # security group policies, Firewall Manager supports one security group for each common policy and for
        # each content audit policy. This is an adjustable limit that you can increase by contacting Amazon
        # Web Services Support.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Details about the service that are specific to the service type, in JSON format. Example:
        # DNS_FIREWALL
        # "{\"type\":\"DNS_FIREWALL\",\"preProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-1\",\"priority\":10}],\"postProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-2\",\"priority\":9911}]}"
        # Valid values for preProcessRuleGroups are between 1 and 99. Valid values for postProcessRuleGroups
        # are between 9901 and 10000. Example: IMPORT_NETWORK_FIREWALL
        # "{\"type\":\"IMPORT_NETWORK_FIREWALL\",\"awsNetworkFirewallConfig\":{\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-west-2:000000000000:stateless-rulegroup\/rg1\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:drop\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:pass\"],\"networkFirewallStatelessCustomActions\":[],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-west-2:aws-managed:stateful-rulegroup\/ThreatSignaturesEmergingEventsStrictOrder\",\"priority\":8}],\"networkFirewallStatefulEngineOptions\":{\"ruleOrder\":\"STRICT_ORDER\"},\"networkFirewallStatefulDefaultActions\":[\"aws:drop_strict\"]}}"
        # "{\"type\":\"DNS_FIREWALL\",\"preProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-1\",\"priority\":10}],\"postProcessRuleGroups\":[{\"ruleGroupId\":\"rslvr-frg-2\",\"priority\":9911}]}"
        # Valid values for preProcessRuleGroups are between 1 and 99. Valid values for postProcessRuleGroups
        # are between 9901 and 10000. Example: NETWORK_FIREWALL - Centralized deployment model
        # "{\"type\":\"NETWORK_FIREWALL\",\"awsNetworkFirewallConfig\":{\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":true}},\"firewallDeploymentModel\":{\"centralizedFirewallDeploymentModel\":{\"centralizedFirewallOrchestrationConfig\":{\"inspectionVpcIds\":[{\"resourceId\":\"vpc-1234\",\"accountId\":\"123456789011\"}],\"firewallCreationConfig\":{\"endpointLocation\":{\"availabilityZoneConfigList\":[{\"availabilityZoneId\":null,\"availabilityZoneName\":\"us-east-1a\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]}]}},\"allowedIPV4CidrList\":[]}}}}"
        # To use the centralized deployment model, you must set PolicyOption to CENTRALIZED . Example:
        # NETWORK_FIREWALL - Distributed deployment model with automatic Availability Zone configuration
        # "{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":[\"10.0.0.0/28\",\"192.168.0.0/28\"],\"routeManagementAction\":\"OFF\"},\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":true}}"
        # With automatic Availbility Zone configuration, Firewall Manager chooses which Availability Zones to
        # create the endpoints in. To use the distributed deployment model, you must set PolicyOption to NULL
        # . Example: NETWORK_FIREWALL - Distributed deployment model with automatic Availability Zone
        # configuration and route management
        # "{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":[\"10.0.0.0/28\",\"192.168.0.0/28\"],\"routeManagementAction\":\"MONITOR\",\"routeManagementTargetTypes\":[\"InternetGateway\"]},\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":
        # \"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":true}}"
        # To use the distributed deployment model, you must set PolicyOption to NULL . Example:
        # NETWORK_FIREWALL - Distributed deployment model with custom Availability Zone configuration
        # "{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"fragmentcustomactionname\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",
        # \"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}},{\"actionName\":\"fragmentcustomactionname\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"fragmentmetricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"firewallCreationConfig\":{
        # \"endpointLocation\":{\"availabilityZoneConfigList\":[{\"availabilityZoneName\":\"us-east-1a\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]},{\"availabilityZoneName\":\"us-east-1b\",\"allowedIPV4CidrList\":[
        # \"10.0.0.0/28\"]}]}
        # },\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":null,\"routeManagementAction\":\"OFF\",\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":boolean}}"
        # With custom Availability Zone configuration, you define which specific Availability Zones to create
        # endpoints in by configuring firewallCreationConfig . To configure the Availability Zones in
        # firewallCreationConfig , specify either the availabilityZoneName or availabilityZoneId parameter,
        # not both parameters. To use the distributed deployment model, you must set PolicyOption to NULL .
        # Example: NETWORK_FIREWALL - Distributed deployment model with custom Availability Zone configuration
        # and route management
        # "{\"type\":\"NETWORK_FIREWALL\",\"networkFirewallStatelessRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateless-rulegroup/test\",\"priority\":1}],\"networkFirewallStatelessDefaultActions\":[\"aws:forward_to_sfe\",\"customActionName\"],\"networkFirewallStatelessFragmentDefaultActions\":[\"aws:forward_to_sfe\",\"fragmentcustomactionname\"],\"networkFirewallStatelessCustomActions\":[{\"actionName\":\"customActionName\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"metricdimensionvalue\"}]}}},{\"actionName\":\"fragmentcustomactionname\",\"actionDefinition\":{\"publishMetricAction\":{\"dimensions\":[{\"value\":\"fragmentmetricdimensionvalue\"}]}}}],\"networkFirewallStatefulRuleGroupReferences\":[{\"resourceARN\":\"arn:aws:network-firewall:us-east-1:123456789011:stateful-rulegroup/test\"}],\"networkFirewallOrchestrationConfig\":{\"firewallCreationConfig\":{\"endpointLocation\":{\"availabilityZoneConfigList\":[{\"availabilityZoneName\":\"us-east-1a\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]},{\"availabilityZoneName\":\"us-east-1b\",\"allowedIPV4CidrList\":[\"10.0.0.0/28\"]}]}},\"singleFirewallEndpointPerVPC\":false,\"allowedIPV4CidrList\":null,\"routeManagementAction\":\"MONITOR\",\"routeManagementTargetTypes\":[\"InternetGateway\"],\"routeManagementConfig\":{\"allowCrossAZTrafficIfNoEndpoint\":true}},\"networkFirewallLoggingConfiguration\":{\"logDestinationConfigs\":[{\"logDestinationType\":\"S3\",\"logType\":\"ALERT\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}},{\"logDestinationType\":\"S3\",\"logType\":\"FLOW\",\"logDestination\":{\"bucketName\":\"s3-bucket-name\"}}],\"overrideExistingConfig\":boolean}}"
        # To use the distributed deployment model, you must set PolicyOption to NULL . Example:
        # SECURITY_GROUPS_COMMON
        # "{\"type\":\"SECURITY_GROUPS_COMMON\",\"securityGroups\":[{\"id\":\"sg-03b1f67d69ed00197\"}],\"revertManualSecurityGroupChanges\":true,\"exclusiveResourceSecurityGroupManagement\":true,\"applyToAllEC2InstanceENIs\":false,\"includeSharedVPC\":true,\"enableSecurityGroupReferencesDistribution\":true}"
        # Example: SECURITY_GROUPS_COMMON - Security group tag distribution
        # ""{\"type\":\"SECURITY_GROUPS_COMMON\",\"securityGroups\":[{\"id\":\"sg-000e55995d61a06bd\"}],\"revertManualSecurityGroupChanges\":true,\"exclusiveResourceSecurityGroupManagement\":false,\"applyToAllEC2InstanceENIs\":false,\"includeSharedVPC\":false,\"enableTagDistribution\":true}""
        # Firewall Manager automatically distributes tags from the primary group to the security groups
        # created by this policy. To use security group tag distribution, you must also set
        # revertManualSecurityGroupChanges to true , otherwise Firewall Manager won't be able to create the
        # policy. When you enable revertManualSecurityGroupChanges , Firewall Manager identifies and reports
        # when the security groups created by this policy become non-compliant. Firewall Manager won't
        # distribute system tags added by Amazon Web Services services into the replica security groups.
        # System tags begin with the aws: prefix. Example: Shared VPCs. Apply the preceding policy to
        # resources in shared VPCs as well as to those in VPCs that the account owns
        # "{\"type\":\"SECURITY_GROUPS_COMMON\",\"revertManualSecurityGroupChanges\":false,\"exclusiveResourceSecurityGroupManagement\":false,
        # \"applyToAllEC2InstanceENIs\":false,\"includeSharedVPC\":true,\"securityGroups\":[{\"id\":\"
        # sg-000e55995d61a06bd\"}]}" Example: SECURITY_GROUPS_CONTENT_AUDIT
        # "{\"type\":\"SECURITY_GROUPS_CONTENT_AUDIT\",\"preManagedOptions\":[{\"denyProtocolAllValue\":true},{\"auditSgDirection\":{\"type\":\"ALL\"}}],\"securityGroups\":[{\"id\":\"sg-049b2393a25468971\"}],\"securityGroupAction\":{\"type\":\"ALLOW\"}}"
        # The security group action for content audit can be ALLOW or DENY . For ALLOW , all in-scope security
        # group rules must be within the allowed range of the policy's security group rules. For DENY , all
        # in-scope security group rules must not contain a value or a range that matches a rule value or range
        # in the policy security group. Example: SECURITY_GROUPS_USAGE_AUDIT
        # "{\"type\":\"SECURITY_GROUPS_USAGE_AUDIT\",\"deleteUnusedSecurityGroups\":true,\"coalesceRedundantSecurityGroups\":true,\"optionalDelayForUnusedInMinutes\":60}"
        # Example: SHIELD_ADVANCED with web ACL management
        # "{\"type\":\"SHIELD_ADVANCED\",\"optimizeUnassociatedWebACL\":true}" If you set
        # optimizeUnassociatedWebACL to true , Firewall Manager creates web ACLs in accounts within the policy
        # scope if the web ACLs will be used by at least one resource. Firewall Manager creates web ACLs in
        # the accounts within policy scope only if the web ACLs will be used by at least one resource. If at
        # any time an account comes into policy scope, Firewall Manager automatically creates a web ACL in the
        # account if at least one resource will use the web ACL. Upon enablement, Firewall Manager performs a
        # one-time cleanup of unused web ACLs in your account. The cleanup process can take several hours. If
        # a resource leaves policy scope after Firewall Manager creates a web ACL, Firewall Manager doesn't
        # disassociate the resource from the web ACL. If you want Firewall Manager to clean up the web ACL,
        # you must first manually disassociate the resources from the web ACL, and then enable the manage
        # unused web ACLs option in your policy. If you set optimizeUnassociatedWebACL to false , and Firewall
        # Manager automatically creates an empty web ACL in each account that's within policy scope.
        # Specification for SHIELD_ADVANCED for Amazon CloudFront distributions
        # "{\"type\":\"SHIELD_ADVANCED\",\"automaticResponseConfiguration\":
        # {\"automaticResponseStatus\":\"ENABLED|IGNORED|DISABLED\",
        # \"automaticResponseAction\":\"BLOCK|COUNT\"}, \"overrideCustomerWebaclClassic\":true|false,
        # \"optimizeUnassociatedWebACL\":true|false}" For example:
        # "{\"type\":\"SHIELD_ADVANCED\",\"automaticResponseConfiguration\":
        # {\"automaticResponseStatus\":\"ENABLED\", \"automaticResponseAction\":\"COUNT\"}}" The default value
        # for automaticResponseStatus is IGNORED . The value for automaticResponseAction is only required when
        # automaticResponseStatus is set to ENABLED . The default value for overrideCustomerWebaclClassic is
        # false . For other resource types that you can protect with a Shield Advanced policy, this
        # ManagedServiceData configuration is an empty string. Example: THIRD_PARTY_FIREWALL Replace
        # THIRD_PARTY_FIREWALL_NAME with the name of the third-party firewall. "{
        # "type":"THIRD_PARTY_FIREWALL", "thirdPartyFirewall":"THIRD_PARTY_FIREWALL_NAME",
        # "thirdPartyFirewallConfig":{ "thirdPartyFirewallPolicyList":["global-1"] },
        # "firewallDeploymentModel":{ "distributedFirewallDeploymentModel":{
        # "distributedFirewallOrchestrationConfig":{ "firewallCreationConfig":{ "endpointLocation":{
        # "availabilityZoneConfigList":[ { "availabilityZoneName":"${AvailabilityZone}" } ] } },
        # "allowedIPV4CidrList":[ ] } } } }" Example: WAFV2 - Account takeover prevention, Bot Control managed
        # rule groups, optimize unassociated web ACL, and rule action override
        # "{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesATPRuleSet\",\"managedRuleGroupConfigs\":[{\"awsmanagedRulesATPRuleSet\":{\"loginPath\":\"/loginpath\",\"requestInspection\":{\"payloadType\":\"FORM_ENCODED|JSON\",\"usernameField\":{\"identifier\":\"/form/username\"},\"passwordField\":{\"identifier\":\"/form/password\"}}}}]},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true},{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesBotControlRuleSet\",\"managedRuleGroupConfigs\":[{\"awsmanagedRulesBotControlRuleSet\":{\"inspectionLevel\":\"TARGETED|COMMON\"}}]},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true,\"ruleActionOverrides\":[{\"name\":\"Rule1\",\"actionToUse\":{\"allow|block|count|captcha|challenge\":{}}},{\"name\":\"Rule2\",\"actionToUse\":{\"allow|block|count|captcha|challenge\":{}}}]}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\":null,\"customResponse\":null,\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":null,\"sampledRequestsEnabledForDefaultActions\":true,\"optimizeUnassociatedWebACL\":true}"
        # Bot Control - For information about AWSManagedRulesBotControlRuleSet managed rule groups, see
        # AWSManagedRulesBotControlRuleSet in the WAF API Reference . Fraud Control account takeover
        # prevention (ATP) - For information about the properties available for AWSManagedRulesATPRuleSet
        # managed rule groups, see AWSManagedRulesATPRuleSet in the WAF API Reference . Optimize unassociated
        # web ACL - If you set optimizeUnassociatedWebACL to true , Firewall Manager creates web ACLs in
        # accounts within the policy scope if the web ACLs will be used by at least one resource. Firewall
        # Manager creates web ACLs in the accounts within policy scope only if the web ACLs will be used by at
        # least one resource. If at any time an account comes into policy scope, Firewall Manager
        # automatically creates a web ACL in the account if at least one resource will use the web ACL. Upon
        # enablement, Firewall Manager performs a one-time cleanup of unused web ACLs in your account. The
        # cleanup process can take several hours. If a resource leaves policy scope after Firewall Manager
        # creates a web ACL, Firewall Manager disassociates the resource from the web ACL, but won't clean up
        # the unused web ACL. Firewall Manager only cleans up unused web ACLs when you first enable management
        # of unused web ACLs in a policy. If you set optimizeUnassociatedWebACL to false Firewall Manager
        # doesn't manage unused web ACLs, and Firewall Manager automatically creates an empty web ACL in each
        # account that's within policy scope. Rule action overrides - Firewall Manager supports rule action
        # overrides only for managed rule groups. To configure a RuleActionOverrides add the Name of the rule
        # to override, and ActionToUse , which is the new action to use for the rule. For information about
        # using rule action override, see RuleActionOverride in the WAF API Reference . Example: WAFV2 -
        # CAPTCHA and Challenge configs
        # "{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesAdminProtectionRuleSet\"},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\":null,\"customResponse\":null,\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":null,\"sampledRequestsEnabledForDefaultActions\":true,\"captchaConfig\":{\"immunityTimeProperty\":{\"immunityTime\":500}},\"challengeConfig\":{\"immunityTimeProperty\":{\"immunityTime\":800}},\"tokenDomains\":[\"google.com\",\"amazon.com\"],\"associationConfig\":{\"requestBody\":{\"CLOUDFRONT\":{\"defaultSizeInspectionLimit\":\"KB_16\"}}}}"
        # CAPTCHA and Challenge configs - If you update the policy's values for associationConfig ,
        # captchaConfig , challengeConfig , or tokenDomains , Firewall Manager will overwrite your local web
        # ACLs to contain the new value(s). However, if you don't update the policy's associationConfig ,
        # captchaConfig , challengeConfig , or tokenDomains values, the values in your local web ACLs will
        # remain unchanged. For information about association configs, see AssociationConfig . For information
        # about CAPTCHA and Challenge configs, see CaptchaConfig and ChallengeConfig in the WAF API Reference
        # . defaultSizeInspectionLimit - Specifies the maximum size of the web request body component that an
        # associated Amazon CloudFront distribution should send to WAF for inspection. For more information,
        # see DefaultSizeInspectionLimit in the WAF API Reference . Example: WAFV2 - Firewall Manager support
        # for WAF managed rule group versioning
        # "{\"preProcessRuleGroups\":[{\"ruleGroupType\":\"ManagedRuleGroup\",\"overrideAction\":{\"type\":\"NONE\"},\"sampledRequestsEnabled\":true,\"managedRuleGroupIdentifier\":{\"managedRuleGroupName\":\"AWSManagedRulesAdminProtectionRuleSet\",\"vendorName\":\"AWS\",\"managedRuleGroupConfigs\":null}}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\":null,\"tokenDomains\":null,\"customResponse\":null,\"type\":\"WAFV2\",\"overrideCustomerWebACLAssociation\":false,\"sampledRequestsEnabledForDefaultActions\":true,\"optimizeUnassociatedWebACL\":true,\"webACLSource\":\"RETROFIT_EXISTING\"}"
        # To use a specific version of a WAF managed rule group in your Firewall Manager policy, you must set
        # versionEnabled to true , and set version to the version you'd like to use. If you don't set
        # versionEnabled to true , or if you omit versionEnabled , then Firewall Manager uses the default
        # version of the WAF managed rule group. Example: WAFV2 - Logging configurations
        # "{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,
        # \"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":
        # {\"versionEnabled\":null,\"version\":null,\"vendorName\":\"AWS\",
        # \"managedRuleGroupName\":\"AWSManagedRulesAdminProtectionRuleSet\"}
        # ,\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],
        # \"sampledRequestsEnabled\":true}],\"postProcessRuleGroups\":[],
        # \"defaultAction\":{\"type\":\"ALLOW\"},\"customRequestHandling\"
        # :null,\"customResponse\":null,\"overrideCustomerWebACLAssociation\"
        # :false,\"loggingConfiguration\":{\"logDestinationConfigs\":
        # [\"arn:aws:s3:::aws-waf-logs-example-bucket\"]
        # ,\"redactedFields\":[],\"loggingFilterConfigs\":{\"defaultBehavior\":\"KEEP\",
        # \"filters\":[{\"behavior\":\"KEEP\",\"requirement\":\"MEETS_ALL\",
        # \"conditions\":[{\"actionCondition\":\"CAPTCHA\"},{\"actionCondition\": \"CHALLENGE\"},
        # {\"actionCondition\":\"EXCLUDED_AS_COUNT\"}]}]}},\"sampledRequestsEnabledForDefaultActions\":true}"
        # Firewall Manager supports Amazon Kinesis Data Firehose and Amazon S3 as the logDestinationConfigs in
        # your loggingConfiguration . For information about WAF logging configurations, see
        # LoggingConfiguration in the WAF API Reference In the loggingConfiguration , you can specify one
        # logDestinationConfigs . Optionally provide as many as 20 redactedFields . The RedactedFieldType must
        # be one of URI , QUERY_STRING , HEADER , or METHOD . Example: WAF Classic
        # "{\"ruleGroups\":[{\"id\":\"78cb36c0-1b5e-4d7d-82b2-cf48d3ad9659\",\"overrideAction\":{\"type\":\"NONE\"}}],\"overrideCustomerWebACLAssociation\":true,\"defaultAction\":{\"type\":\"ALLOW\"},\"type\":\"WAF\"}"
        @[JSON::Field(key: "ManagedServiceData")]
        getter managed_service_data : String?

        # Contains the settings to configure a network ACL policy, a Network Firewall firewall policy
        # deployment model, or a third-party firewall policy.
        @[JSON::Field(key: "PolicyOption")]
        getter policy_option : Types::PolicyOption?

        def initialize(
          @type : String,
          @managed_service_data : String? = nil,
          @policy_option : Types::PolicyOption? = nil
        )
        end
      end

      # Configuration settings for the handling of the stateful rule groups in a Network Firewall firewall
      # policy.
      struct StatefulEngineOptions
        include JSON::Serializable

        # Indicates how to manage the order of stateful rule evaluation for the policy. Stateful rules are
        # provided to the rule engine as Suricata compatible strings, and Suricata evaluates them based on
        # certain settings. For more information, see Evaluation order for stateful rules in the Network
        # Firewall Developer Guide . Default: DEFAULT_ACTION_ORDER
        @[JSON::Field(key: "RuleOrder")]
        getter rule_order : String?

        # Indicates how Network Firewall should handle traffic when a network connection breaks midstream.
        # DROP - Fail closed and drop all subsequent traffic going to the firewall. CONTINUE - Continue to
        # apply rules to subsequent traffic without context from traffic before the break. This impacts the
        # behavior of rules that depend on context. For example, with a stateful rule that drops HTTP traffic,
        # Network Firewall won't match subsequent traffic because the it won't have the context from session
        # initialization, which defines the application layer protocol as HTTP. However, a TCP-layer rule
        # using a flow:stateless rule would still match, and so would the aws:drop_strict default action.
        # REJECT - Fail closed and drop all subsequent traffic going to the firewall. With this option,
        # Network Firewall also sends a TCP reject packet back to the client so the client can immediately
        # establish a new session. With the new session, Network Firewall will have context and will apply
        # rules appropriately. For applications that are reliant on long-lived TCP connections that trigger
        # Gateway Load Balancer idle timeouts, this is the recommended setting. FMS_IGNORE - Firewall Manager
        # doesn't monitor or modify the Network Firewall stream exception policy settings. For more
        # information, see Stream exception policy in your firewall policy in the Network Firewall Developer
        # Guide . Default: FMS_IGNORE
        @[JSON::Field(key: "StreamExceptionPolicy")]
        getter stream_exception_policy : String?

        def initialize(
          @rule_order : String? = nil,
          @stream_exception_policy : String? = nil
        )
        end
      end

      # Network Firewall stateful rule group, used in a NetworkFirewallPolicyDescription .
      struct StatefulRuleGroup
        include JSON::Serializable

        # The action that allows the policy owner to override the behavior of the rule group within a policy.
        @[JSON::Field(key: "Override")]
        getter override : Types::NetworkFirewallStatefulRuleGroupOverride?

        # An integer setting that indicates the order in which to run the stateful rule groups in a single
        # Network Firewall firewall policy. This setting only applies to firewall policies that specify the
        # STRICT_ORDER rule order in the stateful engine options settings. Network Firewall evalutes each
        # stateful rule group against a packet starting with the group that has the lowest priority setting.
        # You must ensure that the priority settings are unique within each policy. For information about You
        # can change the priority settings of your rule groups at any time. To make it easier to insert rule
        # groups later, number them so there's a wide range in between, for example use 100, 200, and so on.
        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The resource ID of the rule group.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The name of the rule group.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String?

        def initialize(
          @override : Types::NetworkFirewallStatefulRuleGroupOverride? = nil,
          @priority : Int32? = nil,
          @resource_id : String? = nil,
          @rule_group_name : String? = nil
        )
        end
      end

      # Network Firewall stateless rule group, used in a NetworkFirewallPolicyDescription .
      struct StatelessRuleGroup
        include JSON::Serializable

        # The priority of the rule group. Network Firewall evaluates the stateless rule groups in a firewall
        # policy starting from the lowest priority setting.
        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The resource ID of the rule group.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The name of the rule group.
        @[JSON::Field(key: "RuleGroupName")]
        getter rule_group_name : String?

        def initialize(
          @priority : Int32? = nil,
          @resource_id : String? = nil,
          @rule_group_name : String? = nil
        )
        end
      end

      # A collection of key:value pairs associated with an Amazon Web Services resource. The key:value pair
      # can be anything you define. Typically, the tag key represents a category (such as "environment") and
      # the tag value represents a specific value within that category (such as "test," "development," or
      # "production"). You can add up to 50 tags to each Amazon Web Services resource.
      struct Tag
        include JSON::Serializable

        # Part of the key:value pair that defines a tag. You can use a tag key to describe a category of
        # information, such as "customer." Tag keys are case-sensitive.
        @[JSON::Field(key: "Key")]
        getter key : String

        # Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value
        # within a category, such as "companyA" or "companyB." Tag values are case-sensitive.
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

        # The Amazon Resource Name (ARN) of the resource to return tags for. The Firewall Manager resources
        # that support tagging are policies, applications lists, and protocols lists.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to add to the resource.
        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tag_list : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Configures the third-party firewall's firewall policy.
      struct ThirdPartyFirewallFirewallPolicy
        include JSON::Serializable

        # The ID of the specified firewall policy.
        @[JSON::Field(key: "FirewallPolicyId")]
        getter firewall_policy_id : String?

        # The name of the specified firewall policy.
        @[JSON::Field(key: "FirewallPolicyName")]
        getter firewall_policy_name : String?

        def initialize(
          @firewall_policy_id : String? = nil,
          @firewall_policy_name : String? = nil
        )
        end
      end

      # The violation details for a third-party firewall that's not associated with an Firewall Manager
      # managed route table.
      struct ThirdPartyFirewallMissingExpectedRouteTableViolation
        include JSON::Serializable

        # The Availability Zone of the firewall subnet that's causing the violation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The resource ID of the current route table that's associated with the subnet, if one is available.
        @[JSON::Field(key: "CurrentRouteTable")]
        getter current_route_table : String?

        # The resource ID of the route table that should be associated with the subnet.
        @[JSON::Field(key: "ExpectedRouteTable")]
        getter expected_route_table : String?

        # The resource ID of the VPC associated with a fireawll subnet that's causing the violation.
        @[JSON::Field(key: "VPC")]
        getter vpc : String?

        # The ID of the third-party firewall or VPC resource that's causing the violation.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        def initialize(
          @availability_zone : String? = nil,
          @current_route_table : String? = nil,
          @expected_route_table : String? = nil,
          @vpc : String? = nil,
          @violation_target : String? = nil
        )
        end
      end

      # The violation details about a third-party firewall's subnet that doesn't have a Firewall Manager
      # managed firewall in its VPC.
      struct ThirdPartyFirewallMissingFirewallViolation
        include JSON::Serializable

        # The Availability Zone of the third-party firewall that's causing the violation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The reason the resource is causing this violation, if a reason is available.
        @[JSON::Field(key: "TargetViolationReason")]
        getter target_violation_reason : String?

        # The resource ID of the VPC associated with a third-party firewall.
        @[JSON::Field(key: "VPC")]
        getter vpc : String?

        # The ID of the third-party firewall that's causing the violation.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        def initialize(
          @availability_zone : String? = nil,
          @target_violation_reason : String? = nil,
          @vpc : String? = nil,
          @violation_target : String? = nil
        )
        end
      end

      # The violation details for a third-party firewall for an Availability Zone that's missing the
      # Firewall Manager managed subnet.
      struct ThirdPartyFirewallMissingSubnetViolation
        include JSON::Serializable

        # The Availability Zone of a subnet that's causing the violation.
        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The reason the resource is causing the violation, if a reason is available.
        @[JSON::Field(key: "TargetViolationReason")]
        getter target_violation_reason : String?

        # The resource ID of the VPC associated with a subnet that's causing the violation.
        @[JSON::Field(key: "VPC")]
        getter vpc : String?

        # The ID of the third-party firewall or VPC resource that's causing the violation.
        @[JSON::Field(key: "ViolationTarget")]
        getter violation_target : String?

        def initialize(
          @availability_zone : String? = nil,
          @target_violation_reason : String? = nil,
          @vpc : String? = nil,
          @violation_target : String? = nil
        )
        end
      end

      # Configures the deployment model for the third-party firewall.
      struct ThirdPartyFirewallPolicy
        include JSON::Serializable

        # Defines the deployment model to use for the third-party firewall policy.
        @[JSON::Field(key: "FirewallDeploymentModel")]
        getter firewall_deployment_model : String?

        def initialize(
          @firewall_deployment_model : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to return tags for. The Firewall Manager resources
        # that support tagging are policies, applications lists, and protocols lists.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The keys of the tags to remove from the resource.
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

      # Violations for a resource based on the specified Firewall Manager policy and Amazon Web Services
      # account.
      struct ViolationDetail
        include JSON::Serializable

        # The Amazon Web Services account that the violation details were requested for.
        @[JSON::Field(key: "MemberAccount")]
        getter member_account : String

        # The ID of the Firewall Manager policy that the violation details were requested for.
        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String

        # The resource ID that the violation details were requested for.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type that the violation details were requested for.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # List of violations for the requested resource.
        @[JSON::Field(key: "ResourceViolations")]
        getter resource_violations : Array(Types::ResourceViolation)

        # Brief description for the requested resource.
        @[JSON::Field(key: "ResourceDescription")]
        getter resource_description : String?

        # The ResourceTag objects associated with the resource.
        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::Tag)?

        def initialize(
          @member_account : String,
          @policy_id : String,
          @resource_id : String,
          @resource_type : String,
          @resource_violations : Array(Types::ResourceViolation),
          @resource_description : String? = nil,
          @resource_tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The violation details for a web ACL whose configuration is incompatible with the Firewall Manager
      # policy.
      struct WebACLHasIncompatibleConfigurationViolation
        include JSON::Serializable

        # Information about the problems that Firewall Manager encountered with the web ACL configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the web ACL.
        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String?

        def initialize(
          @description : String? = nil,
          @web_acl_arn : String? = nil
        )
        end
      end

      # The violation details for a web ACL that's associated with at least one resource that's out of scope
      # of the Firewall Manager policy.
      struct WebACLHasOutOfScopeResourcesViolation
        include JSON::Serializable

        # An array of Amazon Resource Name (ARN) for the resources that are out of scope of the policy and are
        # associated with the web ACL.
        @[JSON::Field(key: "OutOfScopeResourceList")]
        getter out_of_scope_resource_list : Array(String)?

        # The Amazon Resource Name (ARN) of the web ACL.
        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String?

        def initialize(
          @out_of_scope_resource_list : Array(String)? = nil,
          @web_acl_arn : String? = nil
        )
        end
      end
    end
  end
end
