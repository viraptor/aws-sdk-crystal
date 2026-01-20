require "json"
require "time"

module Aws
  module EKS
    module Types

      # The access configuration for the cluster.

      struct AccessConfigResponse
        include JSON::Serializable

        # The current authentication mode of the cluster.

        @[JSON::Field(key: "authenticationMode")]
        getter authentication_mode : String?

        # Specifies whether or not the cluster creator IAM principal was set as a cluster admin access entry
        # during cluster creation time.

        @[JSON::Field(key: "bootstrapClusterCreatorAdminPermissions")]
        getter bootstrap_cluster_creator_admin_permissions : Bool?

        def initialize(
          @authentication_mode : String? = nil,
          @bootstrap_cluster_creator_admin_permissions : Bool? = nil
        )
        end
      end

      # You don't have permissions to perform the requested operation. The IAM principal making the request
      # must have at least one IAM permissions policy attached that grants the required permissions. For
      # more information, see Access management in the IAM User Guide .

      struct AccessDeniedException
        include JSON::Serializable

        # You do not have sufficient access to perform this action.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An access entry allows an IAM principal (user or role) to access your cluster. Access entries can
      # replace the need to maintain the aws-auth ConfigMap for authentication. For more information about
      # access entries, see Access entries in the Amazon EKS User Guide .

      struct AccessEntry
        include JSON::Serializable

        # The ARN of the access entry.

        @[JSON::Field(key: "accessEntryArn")]
        getter access_entry_arn : String?

        # The name of your cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The Unix epoch timestamp at object creation.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A name that you've specified in a Kubernetes RoleBinding or ClusterRoleBinding object so that
        # Kubernetes authorizes the principalARN access to cluster objects.

        @[JSON::Field(key: "kubernetesGroups")]
        getter kubernetes_groups : Array(String)?

        # The Unix epoch timestamp for the last modification to the object.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The ARN of the IAM principal for the access entry. If you ever delete the IAM principal with this
        # ARN, the access entry isn't automatically deleted. We recommend that you delete the access entry
        # with an ARN for an IAM principal that you delete. If you don't delete the access entry and ever
        # recreate the IAM principal, even if it has the same ARN, the access entry won't work. This is
        # because even though the ARN is the same for the recreated IAM principal, the roleID or userID (you
        # can see this with the Security Token Service GetCallerIdentity API) is different for the recreated
        # IAM principal than it was for the original IAM principal. Even though you don't see the IAM
        # principal's roleID or userID for an access entry, Amazon EKS stores it with the access entry.

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of the access entry.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The name of a user that can authenticate to your cluster.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @access_entry_arn : String? = nil,
          @cluster_name : String? = nil,
          @created_at : Time? = nil,
          @kubernetes_groups : Array(String)? = nil,
          @modified_at : Time? = nil,
          @principal_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @username : String? = nil
        )
        end
      end

      # An access policy includes permissions that allow Amazon EKS to authorize an IAM principal to work
      # with Kubernetes objects on your cluster. The policies are managed by Amazon EKS, but they're not IAM
      # policies. You can't view the permissions in the policies using the API. The permissions for many of
      # the policies are similar to the Kubernetes cluster-admin , admin , edit , and view cluster roles.
      # For more information about these cluster roles, see User-facing roles in the Kubernetes
      # documentation. To view the contents of the policies, see Access policy permissions in the Amazon EKS
      # User Guide .

      struct AccessPolicy
        include JSON::Serializable

        # The ARN of the access policy.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the access policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The scope of an AccessPolicy that's associated to an AccessEntry .

      struct AccessScope
        include JSON::Serializable

        # A Kubernetes namespace that an access policy is scoped to. A value is required if you specified
        # namespace for Type .

        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        # The scope type of an access policy.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @namespaces : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # An Amazon EKS add-on. For more information, see Amazon EKS add-ons in the Amazon EKS User Guide .

      struct Addon
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the add-on.

        @[JSON::Field(key: "addonArn")]
        getter addon_arn : String?

        # The name of the add-on.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The version of the add-on.

        @[JSON::Field(key: "addonVersion")]
        getter addon_version : String?

        # The name of your cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The configuration values that you provided.

        @[JSON::Field(key: "configurationValues")]
        getter configuration_values : String?

        # The Unix epoch timestamp at object creation.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # An object that represents the health of the add-on.

        @[JSON::Field(key: "health")]
        getter health : Types::AddonHealth?

        # Information about an Amazon EKS add-on from the Amazon Web Services Marketplace.

        @[JSON::Field(key: "marketplaceInformation")]
        getter marketplace_information : Types::MarketplaceInformation?

        # The Unix epoch timestamp for the last modification to the object.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The namespace configuration for the addon. This specifies the Kubernetes namespace where the addon
        # is installed.

        @[JSON::Field(key: "namespaceConfig")]
        getter namespace_config : Types::AddonNamespaceConfigResponse?

        # The owner of the add-on.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # An array of EKS Pod Identity associations owned by the add-on. Each association maps a role to a
        # service account in a namespace in the cluster. For more information, see Attach an IAM Role to an
        # Amazon EKS add-on using EKS Pod Identity in the Amazon EKS User Guide .

        @[JSON::Field(key: "podIdentityAssociations")]
        getter pod_identity_associations : Array(String)?

        # The publisher of the add-on.

        @[JSON::Field(key: "publisher")]
        getter publisher : String?

        # The Amazon Resource Name (ARN) of the IAM role that's bound to the Kubernetes ServiceAccount object
        # that the add-on uses.

        @[JSON::Field(key: "serviceAccountRoleArn")]
        getter service_account_role_arn : String?

        # The status of the add-on.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @addon_arn : String? = nil,
          @addon_name : String? = nil,
          @addon_version : String? = nil,
          @cluster_name : String? = nil,
          @configuration_values : String? = nil,
          @created_at : Time? = nil,
          @health : Types::AddonHealth? = nil,
          @marketplace_information : Types::MarketplaceInformation? = nil,
          @modified_at : Time? = nil,
          @namespace_config : Types::AddonNamespaceConfigResponse? = nil,
          @owner : String? = nil,
          @pod_identity_associations : Array(String)? = nil,
          @publisher : String? = nil,
          @service_account_role_arn : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The summary information about the Amazon EKS add-on compatibility for the next Kubernetes version
      # for an insight check in the UPGRADE_READINESS category.

      struct AddonCompatibilityDetail
        include JSON::Serializable

        # The list of compatible Amazon EKS add-on versions for the next Kubernetes version.

        @[JSON::Field(key: "compatibleVersions")]
        getter compatible_versions : Array(String)?

        # The name of the Amazon EKS add-on.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @compatible_versions : Array(String)? = nil,
          @name : String? = nil
        )
        end
      end

      # The health of the add-on.

      struct AddonHealth
        include JSON::Serializable

        # An object representing the health issues for an add-on.

        @[JSON::Field(key: "issues")]
        getter issues : Array(Types::AddonIssue)?

        def initialize(
          @issues : Array(Types::AddonIssue)? = nil
        )
        end
      end

      # Information about an add-on.

      struct AddonInfo
        include JSON::Serializable

        # The name of the add-on.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # An object representing information about available add-on versions and compatible Kubernetes
        # versions.

        @[JSON::Field(key: "addonVersions")]
        getter addon_versions : Array(Types::AddonVersionInfo)?

        # The default Kubernetes namespace where this addon is typically installed if no custom namespace is
        # specified.

        @[JSON::Field(key: "defaultNamespace")]
        getter default_namespace : String?

        # Information about the add-on from the Amazon Web Services Marketplace.

        @[JSON::Field(key: "marketplaceInformation")]
        getter marketplace_information : Types::MarketplaceInformation?

        # The owner of the add-on.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # The publisher of the add-on.

        @[JSON::Field(key: "publisher")]
        getter publisher : String?

        # The type of the add-on.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @addon_name : String? = nil,
          @addon_versions : Array(Types::AddonVersionInfo)? = nil,
          @default_namespace : String? = nil,
          @marketplace_information : Types::MarketplaceInformation? = nil,
          @owner : String? = nil,
          @publisher : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An issue related to an add-on.

      struct AddonIssue
        include JSON::Serializable

        # A code that describes the type of issue.

        @[JSON::Field(key: "code")]
        getter code : String?

        # A message that provides details about the issue and what might cause it.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The resource IDs of the issue.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(String)?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @resource_ids : Array(String)? = nil
        )
        end
      end

      # The namespace configuration request object for specifying a custom namespace when creating an addon.

      struct AddonNamespaceConfigRequest
        include JSON::Serializable

        # The name of the Kubernetes namespace to install the addon in. Must be a valid RFC 1123 DNS label.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @namespace : String? = nil
        )
        end
      end

      # The namespace configuration response object containing information about the namespace where an
      # addon is installed.

      struct AddonNamespaceConfigResponse
        include JSON::Serializable

        # The name of the Kubernetes namespace where the addon is installed.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @namespace : String? = nil
        )
        end
      end

      # A type of EKS Pod Identity association owned by an Amazon EKS add-on. Each association maps a role
      # to a service account in a namespace in the cluster. For more information, see Attach an IAM Role to
      # an Amazon EKS add-on using EKS Pod Identity in the Amazon EKS User Guide .

      struct AddonPodIdentityAssociations
        include JSON::Serializable

        # The ARN of an IAM Role.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of a Kubernetes Service Account.

        @[JSON::Field(key: "serviceAccount")]
        getter service_account : String

        def initialize(
          @role_arn : String,
          @service_account : String
        )
        end
      end

      # Information about how to configure IAM for an add-on.

      struct AddonPodIdentityConfiguration
        include JSON::Serializable

        # A suggested IAM Policy for the add-on.

        @[JSON::Field(key: "recommendedManagedPolicies")]
        getter recommended_managed_policies : Array(String)?

        # The Kubernetes Service Account name used by the add-on.

        @[JSON::Field(key: "serviceAccount")]
        getter service_account : String?

        def initialize(
          @recommended_managed_policies : Array(String)? = nil,
          @service_account : String? = nil
        )
        end
      end

      # Information about an add-on version.

      struct AddonVersionInfo
        include JSON::Serializable

        # The version of the add-on.

        @[JSON::Field(key: "addonVersion")]
        getter addon_version : String?

        # The architectures that the version supports.

        @[JSON::Field(key: "architecture")]
        getter architecture : Array(String)?

        # An object representing the compatibilities of a version.

        @[JSON::Field(key: "compatibilities")]
        getter compatibilities : Array(Types::Compatibility)?

        # Indicates the compute type of the add-on version.

        @[JSON::Field(key: "computeTypes")]
        getter compute_types : Array(String)?

        # Whether the add-on requires configuration.

        @[JSON::Field(key: "requiresConfiguration")]
        getter requires_configuration : Bool?

        # Indicates if the add-on requires IAM Permissions to operate, such as networking permissions.

        @[JSON::Field(key: "requiresIamPermissions")]
        getter requires_iam_permissions : Bool?

        def initialize(
          @addon_version : String? = nil,
          @architecture : Array(String)? = nil,
          @compatibilities : Array(Types::Compatibility)? = nil,
          @compute_types : Array(String)? = nil,
          @requires_configuration : Bool? = nil,
          @requires_iam_permissions : Bool? = nil
        )
        end
      end

      # Configuration for integrating Argo CD with IAM Identity CenterIAM; Identity Center. This allows you
      # to use your organization's identity provider for authentication to Argo CD.

      struct ArgoCdAwsIdcConfigRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM Identity CenterIAM; Identity Center instance to use for
        # authentication.

        @[JSON::Field(key: "idcInstanceArn")]
        getter idc_instance_arn : String

        # The Region where your IAM Identity CenterIAM; Identity Center instance is located.

        @[JSON::Field(key: "idcRegion")]
        getter idc_region : String?

        def initialize(
          @idc_instance_arn : String,
          @idc_region : String? = nil
        )
        end
      end

      # The response object containing IAM Identity CenterIAM; Identity Center configuration details for an
      # Argo CD capability.

      struct ArgoCdAwsIdcConfigResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM Identity CenterIAM; Identity Center instance used for
        # authentication.

        @[JSON::Field(key: "idcInstanceArn")]
        getter idc_instance_arn : String?

        # The Amazon Resource Name (ARN) of the managed application created in IAM Identity CenterIAM;
        # Identity Center for this Argo CD capability. This application is automatically created and managed
        # by Amazon EKS.

        @[JSON::Field(key: "idcManagedApplicationArn")]
        getter idc_managed_application_arn : String?

        # The Region where the IAM Identity CenterIAM; Identity Center instance is located.

        @[JSON::Field(key: "idcRegion")]
        getter idc_region : String?

        def initialize(
          @idc_instance_arn : String? = nil,
          @idc_managed_application_arn : String? = nil,
          @idc_region : String? = nil
        )
        end
      end

      # Configuration settings for an Argo CD capability. This includes the Kubernetes namespace, IAM
      # Identity CenterIAM; Identity Center integration, RBAC role mappings, and network access
      # configuration.

      struct ArgoCdConfigRequest
        include JSON::Serializable

        # Configuration for IAM Identity CenterIAM; Identity Center integration. When configured, users can
        # authenticate to Argo CD using their IAM Identity CenterIAM; Identity Center credentials.

        @[JSON::Field(key: "awsIdc")]
        getter aws_idc : Types::ArgoCdAwsIdcConfigRequest

        # The Kubernetes namespace where Argo CD resources will be created. If not specified, the default
        # namespace is used.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # Configuration for network access to the Argo CD capability's managed API server endpoint. By
        # default, the Argo CD server is accessible via a public endpoint. You can optionally specify one or
        # more VPC endpoint IDs to enable private connectivity from your VPCs. When VPC endpoints are
        # configured, public access is blocked and the Argo CD server is only accessible through the specified
        # VPC endpoints.

        @[JSON::Field(key: "networkAccess")]
        getter network_access : Types::ArgoCdNetworkAccessConfigRequest?

        # A list of role mappings that define which IAM Identity CenterIAM; Identity Center users or groups
        # have which Argo CD roles. Each mapping associates an Argo CD role ( ADMIN , EDITOR , or VIEWER )
        # with one or more IAM Identity CenterIAM; Identity Center identities.

        @[JSON::Field(key: "rbacRoleMappings")]
        getter rbac_role_mappings : Array(Types::ArgoCdRoleMapping)?

        def initialize(
          @aws_idc : Types::ArgoCdAwsIdcConfigRequest,
          @namespace : String? = nil,
          @network_access : Types::ArgoCdNetworkAccessConfigRequest? = nil,
          @rbac_role_mappings : Array(Types::ArgoCdRoleMapping)? = nil
        )
        end
      end

      # The response object containing Argo CD configuration details, including the server URL that you use
      # to access the Argo CD web interface and API.

      struct ArgoCdConfigResponse
        include JSON::Serializable

        # The IAM Identity CenterIAM; Identity Center integration configuration.

        @[JSON::Field(key: "awsIdc")]
        getter aws_idc : Types::ArgoCdAwsIdcConfigResponse?

        # The Kubernetes namespace where Argo CD resources are monitored by your Argo CD Capability.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The network access configuration for the Argo CD capability's managed API server endpoint. If VPC
        # endpoint IDs are specified, public access is blocked and the Argo CD server is only accessible
        # through the specified VPC endpoints.

        @[JSON::Field(key: "networkAccess")]
        getter network_access : Types::ArgoCdNetworkAccessConfigResponse?

        # The list of role mappings that define which IAM Identity CenterIAM; Identity Center users or groups
        # have which Argo CD roles.

        @[JSON::Field(key: "rbacRoleMappings")]
        getter rbac_role_mappings : Array(Types::ArgoCdRoleMapping)?

        # The URL of the Argo CD server. Use this URL to access the Argo CD web interface and API.

        @[JSON::Field(key: "serverUrl")]
        getter server_url : String?

        def initialize(
          @aws_idc : Types::ArgoCdAwsIdcConfigResponse? = nil,
          @namespace : String? = nil,
          @network_access : Types::ArgoCdNetworkAccessConfigResponse? = nil,
          @rbac_role_mappings : Array(Types::ArgoCdRoleMapping)? = nil,
          @server_url : String? = nil
        )
        end
      end

      # Configuration for network access to the Argo CD capability's managed API server endpoint. When VPC
      # endpoint IDs are specified, public access is blocked and the Argo CD server is only accessible
      # through the specified VPC endpoints.

      struct ArgoCdNetworkAccessConfigRequest
        include JSON::Serializable

        # A list of VPC endpoint IDs to associate with the managed Argo CD API server endpoint. Each VPC
        # endpoint provides private connectivity from a specific VPC to the Argo CD server. You can specify
        # multiple VPC endpoint IDs to enable access from multiple VPCs.

        @[JSON::Field(key: "vpceIds")]
        getter vpce_ids : Array(String)?

        def initialize(
          @vpce_ids : Array(String)? = nil
        )
        end
      end

      # The response object containing network access configuration for the Argo CD capability's managed API
      # server endpoint. If VPC endpoint IDs are present, public access is blocked and the Argo CD server is
      # only accessible through the specified VPC endpoints.

      struct ArgoCdNetworkAccessConfigResponse
        include JSON::Serializable

        # The list of VPC endpoint IDs associated with the managed Argo CD API server endpoint. Each VPC
        # endpoint provides private connectivity from a specific VPC to the Argo CD server.

        @[JSON::Field(key: "vpceIds")]
        getter vpce_ids : Array(String)?

        def initialize(
          @vpce_ids : Array(String)? = nil
        )
        end
      end

      # A mapping between an Argo CD role and IAM Identity CenterIAM; Identity Center identities. This
      # defines which users or groups have specific permissions in Argo CD.

      struct ArgoCdRoleMapping
        include JSON::Serializable

        # A list of IAM Identity CenterIAM; Identity Center identities (users or groups) that should be
        # assigned this Argo CD role.

        @[JSON::Field(key: "identities")]
        getter identities : Array(Types::SsoIdentity)

        # The Argo CD role to assign. Valid values are: ADMIN – Full administrative access to Argo CD. EDITOR
        # – Edit access to Argo CD resources. VIEWER – Read-only access to Argo CD resources.

        @[JSON::Field(key: "role")]
        getter role : String

        def initialize(
          @identities : Array(Types::SsoIdentity),
          @role : String
        )
        end
      end


      struct AssociateAccessPolicyRequest
        include JSON::Serializable

        # The scope for the AccessPolicy . You can scope access policies to an entire cluster or to specific
        # Kubernetes namespaces.

        @[JSON::Field(key: "accessScope")]
        getter access_scope : Types::AccessScope

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The ARN of the AccessPolicy that you're associating. For a list of ARNs, use ListAccessPolicies .

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The Amazon Resource Name (ARN) of the IAM user or role for the AccessEntry that you're associating
        # the access policy to.

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String

        def initialize(
          @access_scope : Types::AccessScope,
          @cluster_name : String,
          @policy_arn : String,
          @principal_arn : String
        )
        end
      end


      struct AssociateAccessPolicyResponse
        include JSON::Serializable

        # The AccessPolicy and scope associated to the AccessEntry .

        @[JSON::Field(key: "associatedAccessPolicy")]
        getter associated_access_policy : Types::AssociatedAccessPolicy?

        # The name of your cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The ARN of the IAM principal for the AccessEntry .

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        def initialize(
          @associated_access_policy : Types::AssociatedAccessPolicy? = nil,
          @cluster_name : String? = nil,
          @principal_arn : String? = nil
        )
        end
      end


      struct AssociateEncryptionConfigRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The configuration you are using for encryption.

        @[JSON::Field(key: "encryptionConfig")]
        getter encryption_config : Array(Types::EncryptionConfig)

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @cluster_name : String,
          @encryption_config : Array(Types::EncryptionConfig),
          @client_request_token : String? = nil
        )
        end
      end


      struct AssociateEncryptionConfigResponse
        include JSON::Serializable


        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @update : Types::Update? = nil
        )
        end
      end


      struct AssociateIdentityProviderConfigRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # An object representing an OpenID Connect (OIDC) identity provider configuration.

        @[JSON::Field(key: "oidc")]
        getter oidc : Types::OidcIdentityProviderConfigRequest

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_name : String,
          @oidc : Types::OidcIdentityProviderConfigRequest,
          @client_request_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct AssociateIdentityProviderConfigResponse
        include JSON::Serializable

        # The tags for the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @tags : Hash(String, String)? = nil,
          @update : Types::Update? = nil
        )
        end
      end

      # An access policy association.

      struct AssociatedAccessPolicy
        include JSON::Serializable

        # The scope of the access policy.

        @[JSON::Field(key: "accessScope")]
        getter access_scope : Types::AccessScope?

        # The date and time the AccessPolicy was associated with an AccessEntry .

        @[JSON::Field(key: "associatedAt")]
        getter associated_at : Time?

        # The Unix epoch timestamp for the last modification to the object.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The ARN of the AccessPolicy .

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        def initialize(
          @access_scope : Types::AccessScope? = nil,
          @associated_at : Time? = nil,
          @modified_at : Time? = nil,
          @policy_arn : String? = nil
        )
        end
      end

      # An Auto Scaling group that is associated with an Amazon EKS managed node group.

      struct AutoScalingGroup
        include JSON::Serializable

        # The name of the Auto Scaling group associated with an Amazon EKS managed node group.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # This exception is thrown if the request contains a semantic error. The precise meaning will depend
      # on the API, and will be documented in the error message.

      struct BadRequestException
        include JSON::Serializable

        # This exception is thrown if the request contains a semantic error. The precise meaning will depend
        # on the API, and will be documented in the error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates the current configuration of the block storage capability on your EKS Auto Mode cluster.
      # For example, if the capability is enabled or disabled. If the block storage capability is enabled,
      # EKS Auto Mode will create and delete EBS volumes in your Amazon Web Services account. For more
      # information, see EKS Auto Mode block storage capability in the Amazon EKS User Guide .

      struct BlockStorage
        include JSON::Serializable

        # Indicates if the block storage capability is enabled on your EKS Auto Mode cluster. If the block
        # storage capability is enabled, EKS Auto Mode will create and delete EBS volumes in your Amazon Web
        # Services account.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # An object representing a managed capability in an Amazon EKS cluster. This includes all
      # configuration, status, and health information for the capability.

      struct Capability
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the capability.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique name of the capability within the cluster.

        @[JSON::Field(key: "capabilityName")]
        getter capability_name : String?

        # The name of the Amazon EKS cluster that contains this capability.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The configuration settings for the capability. The structure varies depending on the capability
        # type.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CapabilityConfigurationResponse?

        # The Unix epoch timestamp in seconds for when the capability was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The delete propagation policy for the capability. Currently, the only supported value is RETAIN ,
        # which keeps all resources managed by the capability when the capability is deleted.

        @[JSON::Field(key: "deletePropagationPolicy")]
        getter delete_propagation_policy : String?

        # Health information for the capability, including any issues that may be affecting its operation.

        @[JSON::Field(key: "health")]
        getter health : Types::CapabilityHealth?

        # The Unix epoch timestamp in seconds for when the capability was last modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The Amazon Resource Name (ARN) of the IAM role that the capability uses to interact with Amazon Web
        # Services services.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The current status of the capability. Valid values include: CREATING – The capability is being
        # created. ACTIVE – The capability is running and available. UPDATING – The capability is being
        # updated. DELETING – The capability is being deleted. CREATE_FAILED – The capability creation failed.
        # UPDATE_FAILED – The capability update failed. DELETE_FAILED – The capability deletion failed.

        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of capability. Valid values are ACK , ARGOCD , or KRO .

        @[JSON::Field(key: "type")]
        getter type : String?

        # The version of the capability software that is currently running.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @capability_name : String? = nil,
          @cluster_name : String? = nil,
          @configuration : Types::CapabilityConfigurationResponse? = nil,
          @created_at : Time? = nil,
          @delete_propagation_policy : String? = nil,
          @health : Types::CapabilityHealth? = nil,
          @modified_at : Time? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Configuration settings for a capability. The structure of this object varies depending on the
      # capability type.

      struct CapabilityConfigurationRequest
        include JSON::Serializable

        # Configuration settings specific to Argo CD capabilities. This field is only used when creating or
        # updating an Argo CD capability.

        @[JSON::Field(key: "argoCd")]
        getter argo_cd : Types::ArgoCdConfigRequest?

        def initialize(
          @argo_cd : Types::ArgoCdConfigRequest? = nil
        )
        end
      end

      # The response object containing capability configuration details.

      struct CapabilityConfigurationResponse
        include JSON::Serializable

        # Configuration settings for an Argo CD capability, including the server URL and other Argo
        # CD-specific settings.

        @[JSON::Field(key: "argoCd")]
        getter argo_cd : Types::ArgoCdConfigResponse?

        def initialize(
          @argo_cd : Types::ArgoCdConfigResponse? = nil
        )
        end
      end

      # Health information for a capability, including any issues that may be affecting its operation.

      struct CapabilityHealth
        include JSON::Serializable

        # A list of issues affecting the capability. If this list is empty, the capability is healthy.

        @[JSON::Field(key: "issues")]
        getter issues : Array(Types::CapabilityIssue)?

        def initialize(
          @issues : Array(Types::CapabilityIssue)? = nil
        )
        end
      end

      # An issue affecting a capability's health or operation.

      struct CapabilityIssue
        include JSON::Serializable

        # A code identifying the type of issue. This can be used to programmatically handle specific issue
        # types.

        @[JSON::Field(key: "code")]
        getter code : String?

        # A human-readable message describing the issue and potential remediation steps.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A summary of a capability, containing basic information without the full configuration details. This
      # is returned by the ListCapabilities operation.

      struct CapabilitySummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the capability.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique name of the capability within the cluster.

        @[JSON::Field(key: "capabilityName")]
        getter capability_name : String?

        # The Unix epoch timestamp in seconds for when the capability was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Unix epoch timestamp in seconds for when the capability was last modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The current status of the capability.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of capability. Valid values are ACK , ARGOCD , or KRO .

        @[JSON::Field(key: "type")]
        getter type : String?

        # The version of the capability software that is currently running.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @arn : String? = nil,
          @capability_name : String? = nil,
          @created_at : Time? = nil,
          @modified_at : Time? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # An object representing the certificate-authority-data for your cluster.

      struct Certificate
        include JSON::Serializable

        # The Base64-encoded certificate data required to communicate with your cluster. Add this to the
        # certificate-authority-data section of the kubeconfig file for your cluster.

        @[JSON::Field(key: "data")]
        getter data : String?

        def initialize(
          @data : String? = nil
        )
        end
      end

      # These errors are usually caused by a client action. Actions can include using an action or resource
      # on behalf of an IAM principal that doesn't have permissions to use the action or resource or
      # specifying an identifier that is not valid.

      struct ClientException
        include JSON::Serializable

        # The Amazon EKS add-on name associated with the exception.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # These errors are usually caused by a client action. Actions can include using an action or resource
        # on behalf of an IAM principal that doesn't have permissions to use the action or resource or
        # specifying an identifier that is not valid.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon EKS managed node group associated with the exception.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        # The Amazon EKS subscription ID with the exception.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        def initialize(
          @addon_name : String? = nil,
          @cluster_name : String? = nil,
          @message : String? = nil,
          @nodegroup_name : String? = nil,
          @subscription_id : String? = nil
        )
        end
      end

      # Details about clients using the deprecated resources.

      struct ClientStat
        include JSON::Serializable

        # The timestamp of the last request seen from the Kubernetes client.

        @[JSON::Field(key: "lastRequestTime")]
        getter last_request_time : Time?

        # The number of requests from the Kubernetes client seen over the last 30 days.

        @[JSON::Field(key: "numberOfRequestsLast30Days")]
        getter number_of_requests_last30_days : Int32?

        # The user agent of the Kubernetes client using the deprecated resource.

        @[JSON::Field(key: "userAgent")]
        getter user_agent : String?

        def initialize(
          @last_request_time : Time? = nil,
          @number_of_requests_last30_days : Int32? = nil,
          @user_agent : String? = nil
        )
        end
      end

      # An object representing an Amazon EKS cluster.

      struct Cluster
        include JSON::Serializable

        # The access configuration for the cluster.

        @[JSON::Field(key: "accessConfig")]
        getter access_config : Types::AccessConfigResponse?

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The certificate-authority-data for your cluster.

        @[JSON::Field(key: "certificateAuthority")]
        getter certificate_authority : Types::Certificate?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Indicates the current configuration of the compute capability on your EKS Auto Mode cluster. For
        # example, if the capability is enabled or disabled. If the compute capability is enabled, EKS Auto
        # Mode will create and delete EC2 Managed Instances in your Amazon Web Services account. For more
        # information, see EKS Auto Mode compute capability in the Amazon EKS User Guide .

        @[JSON::Field(key: "computeConfig")]
        getter compute_config : Types::ComputeConfigResponse?

        # The configuration used to connect to a cluster for registration.

        @[JSON::Field(key: "connectorConfig")]
        getter connector_config : Types::ConnectorConfigResponse?

        # The control plane scaling tier configuration. For more information, see EKS Provisioned Control
        # Plane in the Amazon EKS User Guide.

        @[JSON::Field(key: "controlPlaneScalingConfig")]
        getter control_plane_scaling_config : Types::ControlPlaneScalingConfig?

        # The Unix epoch timestamp at object creation.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The current deletion protection setting for the cluster. When true , deletion protection is enabled
        # and the cluster cannot be deleted until protection is disabled. When false , the cluster can be
        # deleted normally. This setting only applies to clusters in an active state.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The encryption configuration for the cluster.

        @[JSON::Field(key: "encryptionConfig")]
        getter encryption_config : Array(Types::EncryptionConfig)?

        # The endpoint for your Kubernetes API server.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # An object representing the health of your Amazon EKS cluster.

        @[JSON::Field(key: "health")]
        getter health : Types::ClusterHealth?

        # The ID of your local Amazon EKS cluster on an Amazon Web Services Outpost. This property isn't
        # available for an Amazon EKS cluster on the Amazon Web Services cloud.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The identity provider information for the cluster.

        @[JSON::Field(key: "identity")]
        getter identity : Types::Identity?

        # The Kubernetes network configuration for the cluster.

        @[JSON::Field(key: "kubernetesNetworkConfig")]
        getter kubernetes_network_config : Types::KubernetesNetworkConfigResponse?

        # The logging configuration for your cluster.

        @[JSON::Field(key: "logging")]
        getter logging : Types::Logging?

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An object representing the configuration of your local Amazon EKS cluster on an Amazon Web Services
        # Outpost. This object isn't available for clusters on the Amazon Web Services cloud.

        @[JSON::Field(key: "outpostConfig")]
        getter outpost_config : Types::OutpostConfigResponse?

        # The platform version of your Amazon EKS cluster. For more information about clusters deployed on the
        # Amazon Web Services Cloud, see Platform versions in the Amazon EKS User Guide . For more information
        # about local clusters deployed on an Outpost, see Amazon EKS local cluster platform versions in the
        # Amazon EKS User Guide .

        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # The configuration in the cluster for EKS Hybrid Nodes. You can add, change, or remove this
        # configuration after the cluster is created.

        @[JSON::Field(key: "remoteNetworkConfig")]
        getter remote_network_config : Types::RemoteNetworkConfigResponse?

        # The VPC configuration used by the cluster control plane. Amazon EKS VPC resources have specific
        # requirements to work properly with Kubernetes. For more information, see Cluster VPC considerations
        # and Cluster security group considerations in the Amazon EKS User Guide .

        @[JSON::Field(key: "resourcesVpcConfig")]
        getter resources_vpc_config : Types::VpcConfigResponse?

        # The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control
        # plane to make calls to Amazon Web Services API operations on your behalf.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The current status of the cluster.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Indicates the current configuration of the block storage capability on your EKS Auto Mode cluster.
        # For example, if the capability is enabled or disabled. If the block storage capability is enabled,
        # EKS Auto Mode will create and delete EBS volumes in your Amazon Web Services account. For more
        # information, see EKS Auto Mode block storage capability in the Amazon EKS User Guide .

        @[JSON::Field(key: "storageConfig")]
        getter storage_config : Types::StorageConfigResponse?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # This value indicates if extended support is enabled or disabled for the cluster. Learn more about
        # EKS Extended Support in the Amazon EKS User Guide .

        @[JSON::Field(key: "upgradePolicy")]
        getter upgrade_policy : Types::UpgradePolicyResponse?

        # The Kubernetes server version for the cluster.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The configuration for zonal shift for the cluster.

        @[JSON::Field(key: "zonalShiftConfig")]
        getter zonal_shift_config : Types::ZonalShiftConfigResponse?

        def initialize(
          @access_config : Types::AccessConfigResponse? = nil,
          @arn : String? = nil,
          @certificate_authority : Types::Certificate? = nil,
          @client_request_token : String? = nil,
          @compute_config : Types::ComputeConfigResponse? = nil,
          @connector_config : Types::ConnectorConfigResponse? = nil,
          @control_plane_scaling_config : Types::ControlPlaneScalingConfig? = nil,
          @created_at : Time? = nil,
          @deletion_protection : Bool? = nil,
          @encryption_config : Array(Types::EncryptionConfig)? = nil,
          @endpoint : String? = nil,
          @health : Types::ClusterHealth? = nil,
          @id : String? = nil,
          @identity : Types::Identity? = nil,
          @kubernetes_network_config : Types::KubernetesNetworkConfigResponse? = nil,
          @logging : Types::Logging? = nil,
          @name : String? = nil,
          @outpost_config : Types::OutpostConfigResponse? = nil,
          @platform_version : String? = nil,
          @remote_network_config : Types::RemoteNetworkConfigResponse? = nil,
          @resources_vpc_config : Types::VpcConfigResponse? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @storage_config : Types::StorageConfigResponse? = nil,
          @tags : Hash(String, String)? = nil,
          @upgrade_policy : Types::UpgradePolicyResponse? = nil,
          @version : String? = nil,
          @zonal_shift_config : Types::ZonalShiftConfigResponse? = nil
        )
        end
      end

      # An object representing the health of your Amazon EKS cluster.

      struct ClusterHealth
        include JSON::Serializable

        # An object representing the health issues of your Amazon EKS cluster.

        @[JSON::Field(key: "issues")]
        getter issues : Array(Types::ClusterIssue)?

        def initialize(
          @issues : Array(Types::ClusterIssue)? = nil
        )
        end
      end

      # An issue with your Amazon EKS cluster.

      struct ClusterIssue
        include JSON::Serializable

        # The error code of the issue.

        @[JSON::Field(key: "code")]
        getter code : String?

        # A description of the issue.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The resource IDs that the issue relates to.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(String)?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @resource_ids : Array(String)? = nil
        )
        end
      end

      # Contains details about a specific EKS cluster version.

      struct ClusterVersionInformation
        include JSON::Serializable

        # The type of cluster this version is for.

        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # The Kubernetes version for the cluster.

        @[JSON::Field(key: "clusterVersion")]
        getter cluster_version : String?

        # Default platform version for this Kubernetes version.

        @[JSON::Field(key: "defaultPlatformVersion")]
        getter default_platform_version : String?

        # Indicates if this is a default version.

        @[JSON::Field(key: "defaultVersion")]
        getter default_version : Bool?

        # Date when extended support ends for this version.

        @[JSON::Field(key: "endOfExtendedSupportDate")]
        getter end_of_extended_support_date : Time?

        # Date when standard support ends for this version.

        @[JSON::Field(key: "endOfStandardSupportDate")]
        getter end_of_standard_support_date : Time?

        # The patch version of Kubernetes for this cluster version.

        @[JSON::Field(key: "kubernetesPatchVersion")]
        getter kubernetes_patch_version : String?

        # The release date of this cluster version.

        @[JSON::Field(key: "releaseDate")]
        getter release_date : Time?

        # This field is deprecated. Use versionStatus instead, as that field matches for input and output of
        # this action. Current status of this cluster version.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Current status of this cluster version.

        @[JSON::Field(key: "versionStatus")]
        getter version_status : String?

        def initialize(
          @cluster_type : String? = nil,
          @cluster_version : String? = nil,
          @default_platform_version : String? = nil,
          @default_version : Bool? = nil,
          @end_of_extended_support_date : Time? = nil,
          @end_of_standard_support_date : Time? = nil,
          @kubernetes_patch_version : String? = nil,
          @release_date : Time? = nil,
          @status : String? = nil,
          @version_status : String? = nil
        )
        end
      end

      # Compatibility information.

      struct Compatibility
        include JSON::Serializable

        # The supported Kubernetes version of the cluster.

        @[JSON::Field(key: "clusterVersion")]
        getter cluster_version : String?

        # The supported default version.

        @[JSON::Field(key: "defaultVersion")]
        getter default_version : Bool?

        # The supported compute platform.

        @[JSON::Field(key: "platformVersions")]
        getter platform_versions : Array(String)?

        def initialize(
          @cluster_version : String? = nil,
          @default_version : Bool? = nil,
          @platform_versions : Array(String)? = nil
        )
        end
      end

      # Request to update the configuration of the compute capability of your EKS Auto Mode cluster. For
      # example, enable the capability. For more information, see EKS Auto Mode compute capability in the
      # Amazon EKS User Guide .

      struct ComputeConfigRequest
        include JSON::Serializable

        # Request to enable or disable the compute capability on your EKS Auto Mode cluster. If the compute
        # capability is enabled, EKS Auto Mode will create and delete EC2 Managed Instances in your Amazon Web
        # Services account.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Configuration for node pools that defines the compute resources for your EKS Auto Mode cluster. For
        # more information, see EKS Auto Mode Node Pools in the Amazon EKS User Guide .

        @[JSON::Field(key: "nodePools")]
        getter node_pools : Array(String)?

        # The ARN of the IAM Role EKS will assign to EC2 Managed Instances in your EKS Auto Mode cluster. This
        # value cannot be changed after the compute capability of EKS Auto Mode is enabled. For more
        # information, see the IAM Reference in the Amazon EKS User Guide .

        @[JSON::Field(key: "nodeRoleArn")]
        getter node_role_arn : String?

        def initialize(
          @enabled : Bool? = nil,
          @node_pools : Array(String)? = nil,
          @node_role_arn : String? = nil
        )
        end
      end

      # Indicates the status of the request to update the compute capability of your EKS Auto Mode cluster.

      struct ComputeConfigResponse
        include JSON::Serializable

        # Indicates if the compute capability is enabled on your EKS Auto Mode cluster. If the compute
        # capability is enabled, EKS Auto Mode will create and delete EC2 Managed Instances in your Amazon Web
        # Services account.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Indicates the current configuration of node pools in your EKS Auto Mode cluster. For more
        # information, see EKS Auto Mode Node Pools in the Amazon EKS User Guide .

        @[JSON::Field(key: "nodePools")]
        getter node_pools : Array(String)?

        # The ARN of the IAM Role EKS will assign to EC2 Managed Instances in your EKS Auto Mode cluster.

        @[JSON::Field(key: "nodeRoleArn")]
        getter node_role_arn : String?

        def initialize(
          @enabled : Bool? = nil,
          @node_pools : Array(String)? = nil,
          @node_role_arn : String? = nil
        )
        end
      end

      # The configuration sent to a cluster for configuration.

      struct ConnectorConfigRequest
        include JSON::Serializable

        # The cloud provider for the target cluster to connect.

        @[JSON::Field(key: "provider")]
        getter provider : String

        # The Amazon Resource Name (ARN) of the role that is authorized to request the connector
        # configuration.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @provider : String,
          @role_arn : String
        )
        end
      end

      # The full description of your connected cluster.

      struct ConnectorConfigResponse
        include JSON::Serializable

        # A unique code associated with the cluster for registration purposes.

        @[JSON::Field(key: "activationCode")]
        getter activation_code : String?

        # The expiration time of the connected cluster. The cluster's YAML file must be applied through the
        # native provider.

        @[JSON::Field(key: "activationExpiry")]
        getter activation_expiry : Time?

        # A unique ID associated with the cluster for registration purposes.

        @[JSON::Field(key: "activationId")]
        getter activation_id : String?

        # The cluster's cloud service provider.

        @[JSON::Field(key: "provider")]
        getter provider : String?

        # The Amazon Resource Name (ARN) of the role to communicate with services from the connected
        # Kubernetes cluster.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @activation_code : String? = nil,
          @activation_expiry : Time? = nil,
          @activation_id : String? = nil,
          @provider : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # The placement configuration for all the control plane instances of your local Amazon EKS cluster on
      # an Amazon Web Services Outpost. For more information, see Capacity considerations in the Amazon EKS
      # User Guide .

      struct ControlPlanePlacementRequest
        include JSON::Serializable

        # The name of the placement group for the Kubernetes control plane instances. This setting can't be
        # changed after cluster creation.

        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        def initialize(
          @group_name : String? = nil
        )
        end
      end

      # The placement configuration for all the control plane instances of your local Amazon EKS cluster on
      # an Amazon Web Services Outpost. For more information, see Capacity considerations in the Amazon EKS
      # User Guide .

      struct ControlPlanePlacementResponse
        include JSON::Serializable

        # The name of the placement group for the Kubernetes control plane instances.

        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        def initialize(
          @group_name : String? = nil
        )
        end
      end

      # The control plane scaling tier configuration. For more information, see EKS Provisioned Control
      # Plane in the Amazon EKS User Guide.

      struct ControlPlaneScalingConfig
        include JSON::Serializable

        # The control plane scaling tier configuration. Available options are standard , tier-xl , tier-2xl ,
        # or tier-4xl . For more information, see EKS Provisioned Control Plane in the Amazon EKS User Guide.

        @[JSON::Field(key: "tier")]
        getter tier : String?

        def initialize(
          @tier : String? = nil
        )
        end
      end

      # The access configuration information for the cluster.

      struct CreateAccessConfigRequest
        include JSON::Serializable

        # The desired authentication mode for the cluster. If you create a cluster by using the EKS API,
        # Amazon Web Services SDKs, or CloudFormation, the default is CONFIG_MAP . If you create the cluster
        # by using the Amazon Web Services Management Console, the default value is API_AND_CONFIG_MAP .

        @[JSON::Field(key: "authenticationMode")]
        getter authentication_mode : String?

        # Specifies whether or not the cluster creator IAM principal was set as a cluster admin access entry
        # during cluster creation time. The default value is true .

        @[JSON::Field(key: "bootstrapClusterCreatorAdminPermissions")]
        getter bootstrap_cluster_creator_admin_permissions : Bool?

        def initialize(
          @authentication_mode : String? = nil,
          @bootstrap_cluster_creator_admin_permissions : Bool? = nil
        )
        end
      end


      struct CreateAccessEntryRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The ARN of the IAM principal for the AccessEntry . You can specify one ARN for each access entry.
        # You can't specify the same ARN in more than one access entry. This value can't be changed after
        # access entry creation. The valid principals differ depending on the type of the access entry in the
        # type field. For STANDARD access entries, you can use every IAM principal type. For nodes ( EC2 (for
        # EKS Auto Mode), EC2_LINUX , EC2_WINDOWS , FARGATE_LINUX , and HYBRID_LINUX ), the only valid ARN is
        # IAM roles. You can't use the STS session principal type with access entries because this is a
        # temporary principal for each session and not a permanent identity that can be assigned permissions.
        # IAM best practices recommend using IAM roles with temporary credentials, rather than IAM users with
        # long-term credentials.

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The value for name that you've specified for kind: Group as a subject in a Kubernetes RoleBinding or
        # ClusterRoleBinding object. Amazon EKS doesn't confirm that the value for name exists in any bindings
        # on your cluster. You can specify one or more names. Kubernetes authorizes the principalArn of the
        # access entry to access any cluster objects that you've specified in a Kubernetes Role or ClusterRole
        # object that is also specified in a binding's roleRef . For more information about creating
        # Kubernetes RoleBinding , ClusterRoleBinding , Role , or ClusterRole objects, see Using RBAC
        # Authorization in the Kubernetes documentation . If you want Amazon EKS to authorize the principalArn
        # (instead of, or in addition to Kubernetes authorizing the principalArn ), you can associate one or
        # more access policies to the access entry using AssociateAccessPolicy . If you associate any access
        # policies, the principalARN has all permissions assigned in the associated access policies and all
        # permissions in any Kubernetes Role or ClusterRole objects that the group names are bound to.

        @[JSON::Field(key: "kubernetesGroups")]
        getter kubernetes_groups : Array(String)?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of the new access entry. Valid values are STANDARD , FARGATE_LINUX , EC2_LINUX ,
        # EC2_WINDOWS , EC2 (for EKS Auto Mode), HYBRID_LINUX , and HYPERPOD_LINUX . If the principalArn is
        # for an IAM role that's used for self-managed Amazon EC2 nodes, specify EC2_LINUX or EC2_WINDOWS .
        # Amazon EKS grants the necessary permissions to the node for you. If the principalArn is for any
        # other purpose, specify STANDARD . If you don't specify a value, Amazon EKS sets the value to
        # STANDARD . If you have the access mode of the cluster set to API_AND_CONFIG_MAP , it's unnecessary
        # to create access entries for IAM roles used with Fargate profiles or managed Amazon EC2 nodes,
        # because Amazon EKS creates entries in the aws-auth ConfigMap for the roles. You can't change this
        # value once you've created the access entry. If you set the value to EC2_LINUX or EC2_WINDOWS , you
        # can't specify values for kubernetesGroups , or associate an AccessPolicy to the access entry.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The username to authenticate to Kubernetes with. We recommend not specifying a username and letting
        # Amazon EKS specify it for you. For more information about the value Amazon EKS specifies for you, or
        # constraints before specifying your own username, see Creating access entries in the Amazon EKS User
        # Guide .

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @cluster_name : String,
          @principal_arn : String,
          @client_request_token : String? = nil,
          @kubernetes_groups : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct CreateAccessEntryResponse
        include JSON::Serializable


        @[JSON::Field(key: "accessEntry")]
        getter access_entry : Types::AccessEntry?

        def initialize(
          @access_entry : Types::AccessEntry? = nil
        )
        end
      end


      struct CreateAddonRequest
        include JSON::Serializable

        # The name of the add-on. The name must match one of the names returned by DescribeAddonVersions .

        @[JSON::Field(key: "addonName")]
        getter addon_name : String

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The version of the add-on. The version must match one of the versions returned by
        # DescribeAddonVersions .

        @[JSON::Field(key: "addonVersion")]
        getter addon_version : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The set of configuration values for the add-on that's created. The values that you provide are
        # validated against the schema returned by DescribeAddonConfiguration .

        @[JSON::Field(key: "configurationValues")]
        getter configuration_values : String?

        # The namespace configuration for the addon. If specified, this will override the default namespace
        # for the addon.

        @[JSON::Field(key: "namespaceConfig")]
        getter namespace_config : Types::AddonNamespaceConfigRequest?

        # An array of EKS Pod Identity associations to be created. Each association maps a Kubernetes service
        # account to an IAM role. For more information, see Attach an IAM Role to an Amazon EKS add-on using
        # EKS Pod Identity in the Amazon EKS User Guide .

        @[JSON::Field(key: "podIdentityAssociations")]
        getter pod_identity_associations : Array(Types::AddonPodIdentityAssociations)?

        # How to resolve field value conflicts for an Amazon EKS add-on. Conflicts are handled based on the
        # value you choose: None – If the self-managed version of the add-on is installed on your cluster,
        # Amazon EKS doesn't change the value. Creation of the add-on might fail. Overwrite – If the
        # self-managed version of the add-on is installed on your cluster and the Amazon EKS default value is
        # different than the existing value, Amazon EKS changes the value to the Amazon EKS default value.
        # Preserve – This is similar to the NONE option. If the self-managed version of the add-on is
        # installed on your cluster Amazon EKS doesn't change the add-on resource properties. Creation of the
        # add-on might fail if conflicts are detected. This option works differently during the update
        # operation. For more information, see UpdateAddon . If you don't currently have the self-managed
        # version of the add-on installed on your cluster, the Amazon EKS add-on is installed. Amazon EKS sets
        # all values to default values, regardless of the option that you specify.

        @[JSON::Field(key: "resolveConflicts")]
        getter resolve_conflicts : String?

        # The Amazon Resource Name (ARN) of an existing IAM role to bind to the add-on's service account. The
        # role must be assigned the IAM permissions required by the add-on. If you don't specify an existing
        # IAM role, then the add-on uses the permissions assigned to the node IAM role. For more information,
        # see Amazon EKS node IAM role in the Amazon EKS User Guide . To specify an existing IAM role, you
        # must have an IAM OpenID Connect (OIDC) provider created for your cluster. For more information, see
        # Enabling IAM roles for service accounts on your cluster in the Amazon EKS User Guide .

        @[JSON::Field(key: "serviceAccountRoleArn")]
        getter service_account_role_arn : String?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @addon_name : String,
          @cluster_name : String,
          @addon_version : String? = nil,
          @client_request_token : String? = nil,
          @configuration_values : String? = nil,
          @namespace_config : Types::AddonNamespaceConfigRequest? = nil,
          @pod_identity_associations : Array(Types::AddonPodIdentityAssociations)? = nil,
          @resolve_conflicts : String? = nil,
          @service_account_role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAddonResponse
        include JSON::Serializable


        @[JSON::Field(key: "addon")]
        getter addon : Types::Addon?

        def initialize(
          @addon : Types::Addon? = nil
        )
        end
      end


      struct CreateCapabilityRequest
        include JSON::Serializable

        # A unique name for the capability. The name must be unique within your cluster and can contain
        # alphanumeric characters, hyphens, and underscores.

        @[JSON::Field(key: "capabilityName")]
        getter capability_name : String

        # The name of the Amazon EKS cluster where you want to create the capability.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # Specifies how Kubernetes resources managed by the capability should be handled when the capability
        # is deleted. Currently, the only supported value is RETAIN which retains all Kubernetes resources
        # managed by the capability when the capability is deleted. Because resources are retained, all
        # Kubernetes resources created by the capability should be deleted from the cluster before deleting
        # the capability itself. After the capability is deleted, these resources become difficult to manage
        # because the controller is no longer available.

        @[JSON::Field(key: "deletePropagationPolicy")]
        getter delete_propagation_policy : String

        # The Amazon Resource Name (ARN) of the IAM role that the capability uses to interact with Amazon Web
        # Services services. This role must have a trust policy that allows the EKS service principal to
        # assume it, and it must have the necessary permissions for the capability type you're creating. For
        # ACK capabilities, the role needs permissions to manage the resources you want to control through
        # Kubernetes. For Argo CD capabilities, the role needs permissions to access Git repositories and
        # Secrets Manager. For KRO capabilities, the role needs permissions based on the resources you'll be
        # orchestrating.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The type of capability to create. Valid values are: ACK – Amazon Web Services Controllers for
        # Kubernetes (ACK), which lets you manage resources directly from Kubernetes. ARGOCD – Argo CD for
        # GitOps-based continuous delivery. KRO – Kube Resource Orchestrator (KRO) for composing and managing
        # custom Kubernetes resources.

        @[JSON::Field(key: "type")]
        getter type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. This
        # token is valid for 24 hours after creation. If you retry a request with the same client request
        # token and the same parameters after the original request has completed successfully, the result of
        # the original request is returned.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The configuration settings for the capability. The structure of this object varies depending on the
        # capability type. For Argo CD capabilities, you can configure IAM Identity CenterIAM; Identity Center
        # integration, RBAC role mappings, and network access settings.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CapabilityConfigurationRequest?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @capability_name : String,
          @cluster_name : String,
          @delete_propagation_policy : String,
          @role_arn : String,
          @type : String,
          @client_request_token : String? = nil,
          @configuration : Types::CapabilityConfigurationRequest? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCapabilityResponse
        include JSON::Serializable

        # An object containing information about the newly created capability, including its name, ARN,
        # status, and configuration.

        @[JSON::Field(key: "capability")]
        getter capability : Types::Capability?

        def initialize(
          @capability : Types::Capability? = nil
        )
        end
      end


      struct CreateClusterRequest
        include JSON::Serializable

        # The unique name to give to your cluster. The name can contain only alphanumeric characters
        # (case-sensitive), hyphens, and underscores. It must start with an alphanumeric character and can't
        # be longer than 100 characters. The name must be unique within the Amazon Web Services Region and
        # Amazon Web Services account that you're creating the cluster in.

        @[JSON::Field(key: "name")]
        getter name : String

        # The VPC configuration that's used by the cluster control plane. Amazon EKS VPC resources have
        # specific requirements to work properly with Kubernetes. For more information, see Cluster VPC
        # Considerations and Cluster Security Group Considerations in the Amazon EKS User Guide . You must
        # specify at least two subnets. You can specify up to five security groups. However, we recommend that
        # you use a dedicated security group for your cluster control plane.

        @[JSON::Field(key: "resourcesVpcConfig")]
        getter resources_vpc_config : Types::VpcConfigRequest

        # The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control
        # plane to make calls to Amazon Web Services API operations on your behalf. For more information, see
        # Amazon EKS Service IAM Role in the Amazon EKS User Guide .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The access configuration for the cluster.

        @[JSON::Field(key: "accessConfig")]
        getter access_config : Types::CreateAccessConfigRequest?

        # If you set this value to False when creating a cluster, the default networking add-ons will not be
        # installed. The default networking add-ons include vpc-cni , coredns , and kube-proxy . Use this
        # option when you plan to install third-party alternative add-ons or self-manage the default
        # networking add-ons.

        @[JSON::Field(key: "bootstrapSelfManagedAddons")]
        getter bootstrap_self_managed_addons : Bool?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Enable or disable the compute capability of EKS Auto Mode when creating your EKS Auto Mode cluster.
        # If the compute capability is enabled, EKS Auto Mode will create and delete EC2 Managed Instances in
        # your Amazon Web Services account

        @[JSON::Field(key: "computeConfig")]
        getter compute_config : Types::ComputeConfigRequest?

        # The control plane scaling tier configuration. For more information, see EKS Provisioned Control
        # Plane in the Amazon EKS User Guide.

        @[JSON::Field(key: "controlPlaneScalingConfig")]
        getter control_plane_scaling_config : Types::ControlPlaneScalingConfig?

        # Indicates whether to enable deletion protection for the cluster. When enabled, the cluster cannot be
        # deleted unless deletion protection is first disabled. This helps prevent accidental cluster
        # deletion. Default value is false .

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?

        # The encryption configuration for the cluster.

        @[JSON::Field(key: "encryptionConfig")]
        getter encryption_config : Array(Types::EncryptionConfig)?

        # The Kubernetes network configuration for the cluster.

        @[JSON::Field(key: "kubernetesNetworkConfig")]
        getter kubernetes_network_config : Types::KubernetesNetworkConfigRequest?

        # Enable or disable exporting the Kubernetes control plane logs for your cluster to CloudWatch Logs .
        # By default, cluster control plane logs aren't exported to CloudWatch Logs . For more information,
        # see Amazon EKS Cluster control plane logs in the Amazon EKS User Guide . CloudWatch Logs ingestion,
        # archive storage, and data scanning rates apply to exported control plane logs. For more information,
        # see CloudWatch Pricing .

        @[JSON::Field(key: "logging")]
        getter logging : Types::Logging?

        # An object representing the configuration of your local Amazon EKS cluster on an Amazon Web Services
        # Outpost. Before creating a local cluster on an Outpost, review Local clusters for Amazon EKS on
        # Amazon Web Services Outposts in the Amazon EKS User Guide . This object isn't available for creating
        # Amazon EKS clusters on the Amazon Web Services cloud.

        @[JSON::Field(key: "outpostConfig")]
        getter outpost_config : Types::OutpostConfigRequest?

        # The configuration in the cluster for EKS Hybrid Nodes. You can add, change, or remove this
        # configuration after the cluster is created.

        @[JSON::Field(key: "remoteNetworkConfig")]
        getter remote_network_config : Types::RemoteNetworkConfigRequest?

        # Enable or disable the block storage capability of EKS Auto Mode when creating your EKS Auto Mode
        # cluster. If the block storage capability is enabled, EKS Auto Mode will create and delete EBS
        # volumes in your Amazon Web Services account.

        @[JSON::Field(key: "storageConfig")]
        getter storage_config : Types::StorageConfigRequest?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # New clusters, by default, have extended support enabled. You can disable extended support when
        # creating a cluster by setting this value to STANDARD .

        @[JSON::Field(key: "upgradePolicy")]
        getter upgrade_policy : Types::UpgradePolicyRequest?

        # The desired Kubernetes version for your cluster. If you don't specify a value here, the default
        # version available in Amazon EKS is used. The default version might not be the latest version
        # available.

        @[JSON::Field(key: "version")]
        getter version : String?

        # Enable or disable ARC zonal shift for the cluster. If zonal shift is enabled, Amazon Web Services
        # configures zonal autoshift for the cluster. Zonal shift is a feature of Amazon Application Recovery
        # Controller (ARC). ARC zonal shift is designed to be a temporary measure that allows you to move
        # traffic for a resource away from an impaired AZ until the zonal shift expires or you cancel it. You
        # can extend the zonal shift if necessary. You can start a zonal shift for an Amazon EKS cluster, or
        # you can allow Amazon Web Services to do it for you by enabling zonal autoshift . This shift updates
        # the flow of east-to-west network traffic in your cluster to only consider network endpoints for Pods
        # running on worker nodes in healthy AZs. Additionally, any ALB or NLB handling ingress traffic for
        # applications in your Amazon EKS cluster will automatically route traffic to targets in the healthy
        # AZs. For more information about zonal shift in EKS, see Learn about Amazon Application Recovery
        # Controller (ARC) Zonal Shift in Amazon EKS in the Amazon EKS User Guide .

        @[JSON::Field(key: "zonalShiftConfig")]
        getter zonal_shift_config : Types::ZonalShiftConfigRequest?

        def initialize(
          @name : String,
          @resources_vpc_config : Types::VpcConfigRequest,
          @role_arn : String,
          @access_config : Types::CreateAccessConfigRequest? = nil,
          @bootstrap_self_managed_addons : Bool? = nil,
          @client_request_token : String? = nil,
          @compute_config : Types::ComputeConfigRequest? = nil,
          @control_plane_scaling_config : Types::ControlPlaneScalingConfig? = nil,
          @deletion_protection : Bool? = nil,
          @encryption_config : Array(Types::EncryptionConfig)? = nil,
          @kubernetes_network_config : Types::KubernetesNetworkConfigRequest? = nil,
          @logging : Types::Logging? = nil,
          @outpost_config : Types::OutpostConfigRequest? = nil,
          @remote_network_config : Types::RemoteNetworkConfigRequest? = nil,
          @storage_config : Types::StorageConfigRequest? = nil,
          @tags : Hash(String, String)? = nil,
          @upgrade_policy : Types::UpgradePolicyRequest? = nil,
          @version : String? = nil,
          @zonal_shift_config : Types::ZonalShiftConfigRequest? = nil
        )
        end
      end


      struct CreateClusterResponse
        include JSON::Serializable

        # The full description of your new cluster.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct CreateEksAnywhereSubscriptionRequest
        include JSON::Serializable

        # The unique name for your subscription. It must be unique in your Amazon Web Services account in the
        # Amazon Web Services Region you're creating the subscription in. The name can contain only
        # alphanumeric characters (case-sensitive), hyphens, and underscores. It must start with an alphabetic
        # character and can't be longer than 100 characters.

        @[JSON::Field(key: "name")]
        getter name : String

        # An object representing the term duration and term unit type of your subscription. This determines
        # the term length of your subscription. Valid values are MONTHS for term unit and 12 or 36 for term
        # duration, indicating a 12 month or 36 month subscription. This value cannot be changed after
        # creating the subscription.

        @[JSON::Field(key: "term")]
        getter term : Types::EksAnywhereSubscriptionTerm

        # A boolean indicating whether the subscription auto renews at the end of the term.

        @[JSON::Field(key: "autoRenew")]
        getter auto_renew : Bool?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The number of licenses to purchase with the subscription. Valid values are between 1 and 100. This
        # value can't be changed after creating the subscription.

        @[JSON::Field(key: "licenseQuantity")]
        getter license_quantity : Int32?

        # The license type for all licenses in the subscription. Valid value is CLUSTER. With the CLUSTER
        # license type, each license covers support for a single EKS Anywhere cluster.

        @[JSON::Field(key: "licenseType")]
        getter license_type : String?

        # The metadata for a subscription to assist with categorization and organization. Each tag consists of
        # a key and an optional value. Subscription tags don't propagate to any other resources associated
        # with the subscription.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @term : Types::EksAnywhereSubscriptionTerm,
          @auto_renew : Bool? = nil,
          @client_request_token : String? = nil,
          @license_quantity : Int32? = nil,
          @license_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEksAnywhereSubscriptionResponse
        include JSON::Serializable

        # The full description of the subscription.

        @[JSON::Field(key: "subscription")]
        getter subscription : Types::EksAnywhereSubscription?

        def initialize(
          @subscription : Types::EksAnywhereSubscription? = nil
        )
        end
      end


      struct CreateFargateProfileRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The name of the Fargate profile.

        @[JSON::Field(key: "fargateProfileName")]
        getter fargate_profile_name : String

        # The Amazon Resource Name (ARN) of the Pod execution role to use for a Pod that matches the selectors
        # in the Fargate profile. The Pod execution role allows Fargate infrastructure to register with your
        # cluster as a node, and it provides read access to Amazon ECR image repositories. For more
        # information, see Pod execution role in the Amazon EKS User Guide .

        @[JSON::Field(key: "podExecutionRoleArn")]
        getter pod_execution_role_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The selectors to match for a Pod to use this Fargate profile. Each selector must have an associated
        # Kubernetes namespace . Optionally, you can also specify labels for a namespace . You may specify up
        # to five selectors in a Fargate profile.

        @[JSON::Field(key: "selectors")]
        getter selectors : Array(Types::FargateProfileSelector)?

        # The IDs of subnets to launch a Pod into. A Pod running on Fargate isn't assigned a public IP
        # address, so only private subnets (with no direct route to an Internet Gateway) are accepted for this
        # parameter.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_name : String,
          @fargate_profile_name : String,
          @pod_execution_role_arn : String,
          @client_request_token : String? = nil,
          @selectors : Array(Types::FargateProfileSelector)? = nil,
          @subnets : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateFargateProfileResponse
        include JSON::Serializable

        # The full description of your new Fargate profile.

        @[JSON::Field(key: "fargateProfile")]
        getter fargate_profile : Types::FargateProfile?

        def initialize(
          @fargate_profile : Types::FargateProfile? = nil
        )
        end
      end


      struct CreateNodegroupRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The Amazon Resource Name (ARN) of the IAM role to associate with your node group. The Amazon EKS
        # worker node kubelet daemon makes calls to Amazon Web Services APIs on your behalf. Nodes receive
        # permissions for these API calls through an IAM instance profile and associated policies. Before you
        # can launch nodes and register them into a cluster, you must create an IAM role for those nodes to
        # use when they are launched. For more information, see Amazon EKS node IAM role in the Amazon EKS
        # User Guide . If you specify launchTemplate , then don't specify IamInstanceProfile in your launch
        # template, or the node group deployment will fail. For more information about using launch templates
        # with Amazon EKS, see Customizing managed nodes with launch templates in the Amazon EKS User Guide .

        @[JSON::Field(key: "nodeRole")]
        getter node_role : String

        # The unique name to give your node group.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String

        # The subnets to use for the Auto Scaling group that is created for your node group. If you specify
        # launchTemplate , then don't specify SubnetId in your launch template, or the node group deployment
        # will fail. For more information about using launch templates with Amazon EKS, see Customizing
        # managed nodes with launch templates in the Amazon EKS User Guide .

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)

        # The AMI type for your node group. If you specify launchTemplate , and your launch template uses a
        # custom AMI, then don't specify amiType , or the node group deployment will fail. If your launch
        # template uses a Windows custom AMI, then add eks:kube-proxy-windows to your Windows nodes rolearn in
        # the aws-auth ConfigMap . For more information about using launch templates with Amazon EKS, see
        # Customizing managed nodes with launch templates in the Amazon EKS User Guide .

        @[JSON::Field(key: "amiType")]
        getter ami_type : String?

        # The capacity type for your node group.

        @[JSON::Field(key: "capacityType")]
        getter capacity_type : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The root device disk size (in GiB) for your node group instances. The default disk size is 20 GiB
        # for Linux and Bottlerocket. The default disk size is 50 GiB for Windows. If you specify
        # launchTemplate , then don't specify diskSize , or the node group deployment will fail. For more
        # information about using launch templates with Amazon EKS, see Customizing managed nodes with launch
        # templates in the Amazon EKS User Guide .

        @[JSON::Field(key: "diskSize")]
        getter disk_size : Int32?

        # Specify the instance types for a node group. If you specify a GPU instance type, make sure to also
        # specify an applicable GPU AMI type with the amiType parameter. If you specify launchTemplate , then
        # you can specify zero or one instance type in your launch template or you can specify 0-20 instance
        # types for instanceTypes . If however, you specify an instance type in your launch template and
        # specify any instanceTypes , the node group deployment will fail. If you don't specify an instance
        # type in a launch template or for instanceTypes , then t3.medium is used, by default. If you specify
        # Spot for capacityType , then we recommend specifying multiple values for instanceTypes . For more
        # information, see Managed node group capacity types and Customizing managed nodes with launch
        # templates in the Amazon EKS User Guide .

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        # The Kubernetes labels to apply to the nodes in the node group when they are created.

        @[JSON::Field(key: "labels")]
        getter labels : Hash(String, String)?

        # An object representing a node group's launch template specification. When using this object, don't
        # directly specify instanceTypes , diskSize , or remoteAccess . You cannot later specify a different
        # launch template ID or name than what was used to create the node group. Make sure that the launch
        # template meets the requirements in launchTemplateSpecification . Also refer to Customizing managed
        # nodes with launch templates in the Amazon EKS User Guide .

        @[JSON::Field(key: "launchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # The node auto repair configuration for the node group.

        @[JSON::Field(key: "nodeRepairConfig")]
        getter node_repair_config : Types::NodeRepairConfig?

        # The AMI version of the Amazon EKS optimized AMI to use with your node group. By default, the latest
        # available AMI version for the node group's current Kubernetes version is used. For information about
        # Linux versions, see Amazon EKS optimized Amazon Linux AMI versions in the Amazon EKS User Guide .
        # Amazon EKS managed node groups support the November 2022 and later releases of the Windows AMIs. For
        # information about Windows versions, see Amazon EKS optimized Windows AMI versions in the Amazon EKS
        # User Guide . If you specify launchTemplate , and your launch template uses a custom AMI, then don't
        # specify releaseVersion , or the node group deployment will fail. For more information about using
        # launch templates with Amazon EKS, see Customizing managed nodes with launch templates in the Amazon
        # EKS User Guide .

        @[JSON::Field(key: "releaseVersion")]
        getter release_version : String?

        # The remote access configuration to use with your node group. For Linux, the protocol is SSH. For
        # Windows, the protocol is RDP. If you specify launchTemplate , then don't specify remoteAccess , or
        # the node group deployment will fail. For more information about using launch templates with Amazon
        # EKS, see Customizing managed nodes with launch templates in the Amazon EKS User Guide .

        @[JSON::Field(key: "remoteAccess")]
        getter remote_access : Types::RemoteAccessConfig?

        # The scaling configuration details for the Auto Scaling group that is created for your node group.

        @[JSON::Field(key: "scalingConfig")]
        getter scaling_config : Types::NodegroupScalingConfig?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Kubernetes taints to be applied to the nodes in the node group. For more information, see Node
        # taints on managed node groups .

        @[JSON::Field(key: "taints")]
        getter taints : Array(Types::Taint)?

        # The node group update configuration.

        @[JSON::Field(key: "updateConfig")]
        getter update_config : Types::NodegroupUpdateConfig?

        # The Kubernetes version to use for your managed nodes. By default, the Kubernetes version of the
        # cluster is used, and this is the only accepted specified value. If you specify launchTemplate , and
        # your launch template uses a custom AMI, then don't specify version , or the node group deployment
        # will fail. For more information about using launch templates with Amazon EKS, see Customizing
        # managed nodes with launch templates in the Amazon EKS User Guide .

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @cluster_name : String,
          @node_role : String,
          @nodegroup_name : String,
          @subnets : Array(String),
          @ami_type : String? = nil,
          @capacity_type : String? = nil,
          @client_request_token : String? = nil,
          @disk_size : Int32? = nil,
          @instance_types : Array(String)? = nil,
          @labels : Hash(String, String)? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @node_repair_config : Types::NodeRepairConfig? = nil,
          @release_version : String? = nil,
          @remote_access : Types::RemoteAccessConfig? = nil,
          @scaling_config : Types::NodegroupScalingConfig? = nil,
          @tags : Hash(String, String)? = nil,
          @taints : Array(Types::Taint)? = nil,
          @update_config : Types::NodegroupUpdateConfig? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateNodegroupResponse
        include JSON::Serializable

        # The full description of your new node group.

        @[JSON::Field(key: "nodegroup")]
        getter nodegroup : Types::Nodegroup?

        def initialize(
          @nodegroup : Types::Nodegroup? = nil
        )
        end
      end


      struct CreatePodIdentityAssociationRequest
        include JSON::Serializable

        # The name of the cluster to create the EKS Pod Identity association in.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The name of the Kubernetes namespace inside the cluster to create the EKS Pod Identity association
        # in. The service account and the Pods that use the service account must be in this namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the IAM role to associate with the service account. The EKS Pod
        # Identity agent manages credentials to assume this role for applications in the containers in the
        # Pods that use this service account.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The name of the Kubernetes service account inside the cluster to associate the IAM credentials with.

        @[JSON::Field(key: "serviceAccount")]
        getter service_account : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Disable the automatic sessions tags that are appended by EKS Pod Identity. EKS Pod Identity adds a
        # pre-defined set of session tags when it assumes the role. You can use these tags to author a single
        # role that can work across resources by allowing access to Amazon Web Services resources based on
        # matching tags. By default, EKS Pod Identity attaches six tags, including tags for cluster name,
        # namespace, and service account name. For the list of tags added by EKS Pod Identity, see List of
        # session tags added by EKS Pod Identity in the Amazon EKS User Guide . Amazon Web Services compresses
        # inline session policies, managed policy ARNs, and session tags into a packed binary format that has
        # a separate limit. If you receive a PackedPolicyTooLarge error indicating the packed binary format
        # has exceeded the size limit, you can attempt to reduce the size by disabling the session tags added
        # by EKS Pod Identity.

        @[JSON::Field(key: "disableSessionTags")]
        getter disable_session_tags : Bool?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources. The following basic restrictions apply to tags: Maximum number of tags per resource – 50
        # For each resource, each tag key must be unique, and each tag key can have only one value. Maximum
        # key length – 128 Unicode characters in UTF-8 Maximum value length – 256 Unicode characters in UTF-8
        # If your tagging schema is used across multiple services and resources, remember that other services
        # may have restrictions on allowed characters. Generally allowed characters are: letters, numbers, and
        # spaces representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values
        # are case-sensitive. Do not use aws: , AWS: , or any upper or lowercase combination of such as a
        # prefix for either keys or values as it is reserved for Amazon Web Services use. You cannot edit or
        # delete tag keys or values with this prefix. Tags with this prefix do not count against your tags per
        # resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the target IAM role to associate with the service account. This
        # role is assumed by using the EKS Pod Identity association role, then the credentials for this role
        # are injected into the Pod. When you run applications on Amazon EKS, your application might need to
        # access Amazon Web Services resources from a different role that exists in the same or different
        # Amazon Web Services account. For example, your application running in “Account A” might need to
        # access resources, such as Amazon S3 buckets in “Account B” or within “Account A” itself. You can
        # create a association to access Amazon Web Services resources in “Account B” by creating two IAM
        # roles: a role in “Account A” and a role in “Account B” (which can be the same or different account),
        # each with the necessary trust and permission policies. After you provide these roles in the IAM role
        # and Target IAM role fields, EKS will perform role chaining to ensure your application gets the
        # required permissions. This means Role A will assume Role B, allowing your Pods to securely access
        # resources like S3 buckets in the target account.

        @[JSON::Field(key: "targetRoleArn")]
        getter target_role_arn : String?

        def initialize(
          @cluster_name : String,
          @namespace : String,
          @role_arn : String,
          @service_account : String,
          @client_request_token : String? = nil,
          @disable_session_tags : Bool? = nil,
          @tags : Hash(String, String)? = nil,
          @target_role_arn : String? = nil
        )
        end
      end


      struct CreatePodIdentityAssociationResponse
        include JSON::Serializable

        # The full description of your new association. The description includes an ID for the association.
        # Use the ID of the association in further actions to manage the association.

        @[JSON::Field(key: "association")]
        getter association : Types::PodIdentityAssociation?

        def initialize(
          @association : Types::PodIdentityAssociation? = nil
        )
        end
      end


      struct DeleteAccessEntryRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The ARN of the IAM principal for the AccessEntry .

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String

        def initialize(
          @cluster_name : String,
          @principal_arn : String
        )
        end
      end


      struct DeleteAccessEntryResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAddonRequest
        include JSON::Serializable

        # The name of the add-on. The name must match one of the names returned by ListAddons .

        @[JSON::Field(key: "addonName")]
        getter addon_name : String

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # Specifying this option preserves the add-on software on your cluster but Amazon EKS stops managing
        # any settings for the add-on. If an IAM account is associated with the add-on, it isn't removed.

        @[JSON::Field(key: "preserve")]
        getter preserve : Bool?

        def initialize(
          @addon_name : String,
          @cluster_name : String,
          @preserve : Bool? = nil
        )
        end
      end


      struct DeleteAddonResponse
        include JSON::Serializable


        @[JSON::Field(key: "addon")]
        getter addon : Types::Addon?

        def initialize(
          @addon : Types::Addon? = nil
        )
        end
      end


      struct DeleteCapabilityRequest
        include JSON::Serializable

        # The name of the capability to delete.

        @[JSON::Field(key: "capabilityName")]
        getter capability_name : String

        # The name of the Amazon EKS cluster that contains the capability you want to delete.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        def initialize(
          @capability_name : String,
          @cluster_name : String
        )
        end
      end


      struct DeleteCapabilityResponse
        include JSON::Serializable

        # An object containing information about the deleted capability, including its final status and
        # configuration.

        @[JSON::Field(key: "capability")]
        getter capability : Types::Capability?

        def initialize(
          @capability : Types::Capability? = nil
        )
        end
      end


      struct DeleteClusterRequest
        include JSON::Serializable

        # The name of the cluster to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteClusterResponse
        include JSON::Serializable

        # The full description of the cluster to delete.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct DeleteEksAnywhereSubscriptionRequest
        include JSON::Serializable

        # The ID of the subscription.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteEksAnywhereSubscriptionResponse
        include JSON::Serializable

        # The full description of the subscription to be deleted.

        @[JSON::Field(key: "subscription")]
        getter subscription : Types::EksAnywhereSubscription?

        def initialize(
          @subscription : Types::EksAnywhereSubscription? = nil
        )
        end
      end


      struct DeleteFargateProfileRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The name of the Fargate profile to delete.

        @[JSON::Field(key: "fargateProfileName")]
        getter fargate_profile_name : String

        def initialize(
          @cluster_name : String,
          @fargate_profile_name : String
        )
        end
      end


      struct DeleteFargateProfileResponse
        include JSON::Serializable

        # The deleted Fargate profile.

        @[JSON::Field(key: "fargateProfile")]
        getter fargate_profile : Types::FargateProfile?

        def initialize(
          @fargate_profile : Types::FargateProfile? = nil
        )
        end
      end


      struct DeleteNodegroupRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The name of the node group to delete.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String

        def initialize(
          @cluster_name : String,
          @nodegroup_name : String
        )
        end
      end


      struct DeleteNodegroupResponse
        include JSON::Serializable

        # The full description of your deleted node group.

        @[JSON::Field(key: "nodegroup")]
        getter nodegroup : Types::Nodegroup?

        def initialize(
          @nodegroup : Types::Nodegroup? = nil
        )
        end
      end


      struct DeletePodIdentityAssociationRequest
        include JSON::Serializable

        # The ID of the association to be deleted.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The cluster name that

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        def initialize(
          @association_id : String,
          @cluster_name : String
        )
        end
      end


      struct DeletePodIdentityAssociationResponse
        include JSON::Serializable

        # The full description of the EKS Pod Identity association that was deleted.

        @[JSON::Field(key: "association")]
        getter association : Types::PodIdentityAssociation?

        def initialize(
          @association : Types::PodIdentityAssociation? = nil
        )
        end
      end

      # The summary information about deprecated resource usage for an insight check in the
      # UPGRADE_READINESS category.

      struct DeprecationDetail
        include JSON::Serializable

        # Details about Kubernetes clients using the deprecated resources.

        @[JSON::Field(key: "clientStats")]
        getter client_stats : Array(Types::ClientStat)?

        # The newer version of the resource to migrate to if applicable.

        @[JSON::Field(key: "replacedWith")]
        getter replaced_with : String?

        # The version of the software where the newer resource version became available to migrate to if
        # applicable.

        @[JSON::Field(key: "startServingReplacementVersion")]
        getter start_serving_replacement_version : String?

        # The version of the software where the deprecated resource version will stop being served.

        @[JSON::Field(key: "stopServingVersion")]
        getter stop_serving_version : String?

        # The deprecated version of the resource.

        @[JSON::Field(key: "usage")]
        getter usage : String?

        def initialize(
          @client_stats : Array(Types::ClientStat)? = nil,
          @replaced_with : String? = nil,
          @start_serving_replacement_version : String? = nil,
          @stop_serving_version : String? = nil,
          @usage : String? = nil
        )
        end
      end


      struct DeregisterClusterRequest
        include JSON::Serializable

        # The name of the connected cluster to deregister.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeregisterClusterResponse
        include JSON::Serializable


        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct DescribeAccessEntryRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The ARN of the IAM principal for the AccessEntry .

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String

        def initialize(
          @cluster_name : String,
          @principal_arn : String
        )
        end
      end


      struct DescribeAccessEntryResponse
        include JSON::Serializable

        # Information about the access entry.

        @[JSON::Field(key: "accessEntry")]
        getter access_entry : Types::AccessEntry?

        def initialize(
          @access_entry : Types::AccessEntry? = nil
        )
        end
      end


      struct DescribeAddonConfigurationRequest
        include JSON::Serializable

        # The name of the add-on. The name must match one of the names returned by DescribeAddonVersions .

        @[JSON::Field(key: "addonName")]
        getter addon_name : String

        # The version of the add-on. The version must match one of the versions returned by
        # DescribeAddonVersions .

        @[JSON::Field(key: "addonVersion")]
        getter addon_version : String

        def initialize(
          @addon_name : String,
          @addon_version : String
        )
        end
      end


      struct DescribeAddonConfigurationResponse
        include JSON::Serializable

        # The name of the add-on.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The version of the add-on. The version must match one of the versions returned by
        # DescribeAddonVersions .

        @[JSON::Field(key: "addonVersion")]
        getter addon_version : String?

        # A JSON schema that's used to validate the configuration values you provide when an add-on is created
        # or updated.

        @[JSON::Field(key: "configurationSchema")]
        getter configuration_schema : String?

        # The Kubernetes service account name used by the add-on, and any suggested IAM policies. Use this
        # information to create an IAM Role for the add-on.

        @[JSON::Field(key: "podIdentityConfiguration")]
        getter pod_identity_configuration : Array(Types::AddonPodIdentityConfiguration)?

        def initialize(
          @addon_name : String? = nil,
          @addon_version : String? = nil,
          @configuration_schema : String? = nil,
          @pod_identity_configuration : Array(Types::AddonPodIdentityConfiguration)? = nil
        )
        end
      end


      struct DescribeAddonRequest
        include JSON::Serializable

        # The name of the add-on. The name must match one of the names returned by ListAddons .

        @[JSON::Field(key: "addonName")]
        getter addon_name : String

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        def initialize(
          @addon_name : String,
          @cluster_name : String
        )
        end
      end


      struct DescribeAddonResponse
        include JSON::Serializable


        @[JSON::Field(key: "addon")]
        getter addon : Types::Addon?

        def initialize(
          @addon : Types::Addon? = nil
        )
        end
      end


      struct DescribeAddonVersionsRequest
        include JSON::Serializable

        # The name of the add-on. The name must match one of the names returned by ListAddons .

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The Kubernetes versions that you can use the add-on with.

        @[JSON::Field(key: "kubernetesVersion")]
        getter kubernetes_version : String?

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The owner of the add-on. For valid owners , don't specify a value for this property.

        @[JSON::Field(key: "owners")]
        getter owners : Array(String)?

        # The publisher of the add-on. For valid publishers , don't specify a value for this property.

        @[JSON::Field(key: "publishers")]
        getter publishers : Array(String)?

        # The type of the add-on. For valid types , don't specify a value for this property.

        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @addon_name : String? = nil,
          @kubernetes_version : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owners : Array(String)? = nil,
          @publishers : Array(String)? = nil,
          @types : Array(String)? = nil
        )
        end
      end


      struct DescribeAddonVersionsResponse
        include JSON::Serializable

        # The list of available versions with Kubernetes version compatibility and other properties.

        @[JSON::Field(key: "addons")]
        getter addons : Array(Types::AddonInfo)?

        # The nextToken value to include in a future DescribeAddonVersions request. When the results of a
        # DescribeAddonVersions request exceed maxResults , you can use this value to retrieve the next page
        # of results. This value is null when there are no more results to return. This token should be
        # treated as an opaque identifier that is used only to retrieve the next items in a list and not for
        # other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @addons : Array(Types::AddonInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeCapabilityRequest
        include JSON::Serializable

        # The name of the capability to describe.

        @[JSON::Field(key: "capabilityName")]
        getter capability_name : String

        # The name of the Amazon EKS cluster that contains the capability you want to describe.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        def initialize(
          @capability_name : String,
          @cluster_name : String
        )
        end
      end


      struct DescribeCapabilityResponse
        include JSON::Serializable

        # An object containing detailed information about the capability, including its name, ARN, type,
        # status, version, configuration, health status, and timestamps for when it was created and last
        # modified.

        @[JSON::Field(key: "capability")]
        getter capability : Types::Capability?

        def initialize(
          @capability : Types::Capability? = nil
        )
        end
      end


      struct DescribeClusterRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DescribeClusterResponse
        include JSON::Serializable

        # The full description of your specified cluster.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct DescribeClusterVersionsRequest
        include JSON::Serializable

        # The type of cluster to filter versions by.

        @[JSON::Field(key: "clusterType")]
        getter cluster_type : String?

        # List of specific cluster versions to describe.

        @[JSON::Field(key: "clusterVersions")]
        getter cluster_versions : Array(String)?

        # Filter to show only default versions.

        @[JSON::Field(key: "defaultOnly")]
        getter default_only : Bool?

        # Include all available versions in the response.

        @[JSON::Field(key: "includeAll")]
        getter include_all : Bool?

        # Maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # This field is deprecated. Use versionStatus instead, as that field matches for input and output of
        # this action. Filter versions by their current status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Filter versions by their current status.

        @[JSON::Field(key: "versionStatus")]
        getter version_status : String?

        def initialize(
          @cluster_type : String? = nil,
          @cluster_versions : Array(String)? = nil,
          @default_only : Bool? = nil,
          @include_all : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil,
          @version_status : String? = nil
        )
        end
      end


      struct DescribeClusterVersionsResponse
        include JSON::Serializable

        # List of cluster version information objects.

        @[JSON::Field(key: "clusterVersions")]
        getter cluster_versions : Array(Types::ClusterVersionInformation)?

        # Pagination token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_versions : Array(Types::ClusterVersionInformation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEksAnywhereSubscriptionRequest
        include JSON::Serializable

        # The ID of the subscription.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeEksAnywhereSubscriptionResponse
        include JSON::Serializable

        # The full description of the subscription.

        @[JSON::Field(key: "subscription")]
        getter subscription : Types::EksAnywhereSubscription?

        def initialize(
          @subscription : Types::EksAnywhereSubscription? = nil
        )
        end
      end


      struct DescribeFargateProfileRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The name of the Fargate profile to describe.

        @[JSON::Field(key: "fargateProfileName")]
        getter fargate_profile_name : String

        def initialize(
          @cluster_name : String,
          @fargate_profile_name : String
        )
        end
      end


      struct DescribeFargateProfileResponse
        include JSON::Serializable

        # The full description of your Fargate profile.

        @[JSON::Field(key: "fargateProfile")]
        getter fargate_profile : Types::FargateProfile?

        def initialize(
          @fargate_profile : Types::FargateProfile? = nil
        )
        end
      end


      struct DescribeIdentityProviderConfigRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # An object representing an identity provider configuration.

        @[JSON::Field(key: "identityProviderConfig")]
        getter identity_provider_config : Types::IdentityProviderConfig

        def initialize(
          @cluster_name : String,
          @identity_provider_config : Types::IdentityProviderConfig
        )
        end
      end


      struct DescribeIdentityProviderConfigResponse
        include JSON::Serializable

        # The object that represents an OpenID Connect (OIDC) identity provider configuration.

        @[JSON::Field(key: "identityProviderConfig")]
        getter identity_provider_config : Types::IdentityProviderConfigResponse?

        def initialize(
          @identity_provider_config : Types::IdentityProviderConfigResponse? = nil
        )
        end
      end


      struct DescribeInsightRequest
        include JSON::Serializable

        # The name of the cluster to describe the insight for.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The identity of the insight to describe.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @cluster_name : String,
          @id : String
        )
        end
      end


      struct DescribeInsightResponse
        include JSON::Serializable

        # The full description of the insight.

        @[JSON::Field(key: "insight")]
        getter insight : Types::Insight?

        def initialize(
          @insight : Types::Insight? = nil
        )
        end
      end


      struct DescribeInsightsRefreshRequest
        include JSON::Serializable

        # The name of the cluster associated with the insights refresh operation.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        def initialize(
          @cluster_name : String
        )
        end
      end


      struct DescribeInsightsRefreshResponse
        include JSON::Serializable

        # The date and time when the insights refresh operation ended.

        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The message associated with the insights refresh operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The date and time when the insights refresh operation started.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The current status of the insights refresh operation.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @ended_at : Time? = nil,
          @message : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil
        )
        end
      end


      struct DescribeNodegroupRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The name of the node group to describe.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String

        def initialize(
          @cluster_name : String,
          @nodegroup_name : String
        )
        end
      end


      struct DescribeNodegroupResponse
        include JSON::Serializable

        # The full description of your node group.

        @[JSON::Field(key: "nodegroup")]
        getter nodegroup : Types::Nodegroup?

        def initialize(
          @nodegroup : Types::Nodegroup? = nil
        )
        end
      end


      struct DescribePodIdentityAssociationRequest
        include JSON::Serializable

        # The ID of the association that you want the description of.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The name of the cluster that the association is in.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        def initialize(
          @association_id : String,
          @cluster_name : String
        )
        end
      end


      struct DescribePodIdentityAssociationResponse
        include JSON::Serializable

        # The full description of the EKS Pod Identity association.

        @[JSON::Field(key: "association")]
        getter association : Types::PodIdentityAssociation?

        def initialize(
          @association : Types::PodIdentityAssociation? = nil
        )
        end
      end

      # Describes an update request.

      struct DescribeUpdateRequest
        include JSON::Serializable

        # The name of the Amazon EKS cluster associated with the update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the update to describe.

        @[JSON::Field(key: "updateId")]
        getter update_id : String

        # The name of the add-on. The name must match one of the names returned by ListAddons . This parameter
        # is required if the update is an add-on update.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The name of the capability for which you want to describe updates.

        @[JSON::Field(key: "capabilityName")]
        getter capability_name : String?

        # The name of the Amazon EKS node group associated with the update. This parameter is required if the
        # update is a node group update.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        def initialize(
          @name : String,
          @update_id : String,
          @addon_name : String? = nil,
          @capability_name : String? = nil,
          @nodegroup_name : String? = nil
        )
        end
      end


      struct DescribeUpdateResponse
        include JSON::Serializable

        # The full description of the specified update.

        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @update : Types::Update? = nil
        )
        end
      end


      struct DisassociateAccessPolicyRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The ARN of the policy to disassociate from the access entry. For a list of associated policies ARNs,
        # use ListAssociatedAccessPolicies .

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The ARN of the IAM principal for the AccessEntry .

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String

        def initialize(
          @cluster_name : String,
          @policy_arn : String,
          @principal_arn : String
        )
        end
      end


      struct DisassociateAccessPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateIdentityProviderConfigRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # An object representing an identity provider configuration.

        @[JSON::Field(key: "identityProviderConfig")]
        getter identity_provider_config : Types::IdentityProviderConfig

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @cluster_name : String,
          @identity_provider_config : Types::IdentityProviderConfig,
          @client_request_token : String? = nil
        )
        end
      end


      struct DisassociateIdentityProviderConfigResponse
        include JSON::Serializable


        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @update : Types::Update? = nil
        )
        end
      end

      # An EKS Anywhere subscription authorizing the customer to support for licensed clusters and access to
      # EKS Anywhere Curated Packages.

      struct EksAnywhereSubscription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the subscription.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A boolean indicating whether or not a subscription will auto renew when it expires.

        @[JSON::Field(key: "autoRenew")]
        getter auto_renew : Bool?

        # The Unix timestamp in seconds for when the subscription was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Unix timestamp in seconds for when the subscription is effective.

        @[JSON::Field(key: "effectiveDate")]
        getter effective_date : Time?

        # The Unix timestamp in seconds for when the subscription will expire or auto renew, depending on the
        # auto renew configuration of the subscription object.

        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        # UUID identifying a subscription.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Amazon Web Services License Manager ARN associated with the subscription.

        @[JSON::Field(key: "licenseArns")]
        getter license_arns : Array(String)?

        # The number of licenses included in a subscription. Valid values are between 1 and 100.

        @[JSON::Field(key: "licenseQuantity")]
        getter license_quantity : Int32?

        # The type of licenses included in the subscription. Valid value is CLUSTER. With the CLUSTER license
        # type, each license covers support for a single EKS Anywhere cluster.

        @[JSON::Field(key: "licenseType")]
        getter license_type : String?

        # Includes all of the claims in the license token necessary to validate the license for extended
        # support.

        @[JSON::Field(key: "licenses")]
        getter licenses : Array(Types::License)?

        # The status of a subscription.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The metadata for a subscription to assist with categorization and organization. Each tag consists of
        # a key and an optional value. Subscription tags do not propagate to any other resources associated
        # with the subscription.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # An EksAnywhereSubscriptionTerm object.

        @[JSON::Field(key: "term")]
        getter term : Types::EksAnywhereSubscriptionTerm?

        def initialize(
          @arn : String? = nil,
          @auto_renew : Bool? = nil,
          @created_at : Time? = nil,
          @effective_date : Time? = nil,
          @expiration_date : Time? = nil,
          @id : String? = nil,
          @license_arns : Array(String)? = nil,
          @license_quantity : Int32? = nil,
          @license_type : String? = nil,
          @licenses : Array(Types::License)? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @term : Types::EksAnywhereSubscriptionTerm? = nil
        )
        end
      end

      # An object representing the term duration and term unit type of your subscription. This determines
      # the term length of your subscription. Valid values are MONTHS for term unit and 12 or 36 for term
      # duration, indicating a 12 month or 36 month subscription.

      struct EksAnywhereSubscriptionTerm
        include JSON::Serializable

        # The duration of the subscription term. Valid values are 12 and 36, indicating a 12 month or 36 month
        # subscription.

        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # The term unit of the subscription. Valid value is MONTHS .

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @duration : Int32? = nil,
          @unit : String? = nil
        )
        end
      end

      # Indicates the current configuration of the load balancing capability on your EKS Auto Mode cluster.
      # For example, if the capability is enabled or disabled. For more information, see EKS Auto Mode load
      # balancing capability in the Amazon EKS User Guide .

      struct ElasticLoadBalancing
        include JSON::Serializable

        # Indicates if the load balancing capability is enabled on your EKS Auto Mode cluster. If the load
        # balancing capability is enabled, EKS Auto Mode will create and delete load balancers in your Amazon
        # Web Services account.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # The encryption configuration for the cluster.

      struct EncryptionConfig
        include JSON::Serializable

        # Key Management Service (KMS) key. Either the ARN or the alias can be used.

        @[JSON::Field(key: "provider")]
        getter provider : Types::Provider?

        # Specifies the resources to be encrypted. The only supported value is secrets .

        @[JSON::Field(key: "resources")]
        getter resources : Array(String)?

        def initialize(
          @provider : Types::Provider? = nil,
          @resources : Array(String)? = nil
        )
        end
      end

      # An object representing an error when an asynchronous operation fails.

      struct ErrorDetail
        include JSON::Serializable

        # A brief description of the error. SubnetNotFound : We couldn't find one of the subnets associated
        # with the cluster. SecurityGroupNotFound : We couldn't find one of the security groups associated
        # with the cluster. EniLimitReached : You have reached the elastic network interface limit for your
        # account. IpNotAvailable : A subnet associated with the cluster doesn't have any available IP
        # addresses. AccessDenied : You don't have permissions to perform the specified operation.
        # OperationNotPermitted : The service role associated with the cluster doesn't have the required
        # access permissions for Amazon EKS. VpcIdNotFound : We couldn't find the VPC associated with the
        # cluster.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A more complete description of the error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # An optional field that contains the resource IDs associated with the error.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(String)?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @resource_ids : Array(String)? = nil
        )
        end
      end

      # An object representing an Fargate profile.

      struct FargateProfile
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The Unix epoch timestamp at object creation.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The full Amazon Resource Name (ARN) of the Fargate profile.

        @[JSON::Field(key: "fargateProfileArn")]
        getter fargate_profile_arn : String?

        # The name of the Fargate profile.

        @[JSON::Field(key: "fargateProfileName")]
        getter fargate_profile_name : String?

        # The health status of the Fargate profile. If there are issues with your Fargate profile's health,
        # they are listed here.

        @[JSON::Field(key: "health")]
        getter health : Types::FargateProfileHealth?

        # The Amazon Resource Name (ARN) of the Pod execution role to use for any Pod that matches the
        # selectors in the Fargate profile. For more information, see Pod execution role in the Amazon EKS
        # User Guide .

        @[JSON::Field(key: "podExecutionRoleArn")]
        getter pod_execution_role_arn : String?

        # The selectors to match for a Pod to use this Fargate profile.

        @[JSON::Field(key: "selectors")]
        getter selectors : Array(Types::FargateProfileSelector)?

        # The current status of the Fargate profile.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The IDs of subnets to launch a Pod into.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_name : String? = nil,
          @created_at : Time? = nil,
          @fargate_profile_arn : String? = nil,
          @fargate_profile_name : String? = nil,
          @health : Types::FargateProfileHealth? = nil,
          @pod_execution_role_arn : String? = nil,
          @selectors : Array(Types::FargateProfileSelector)? = nil,
          @status : String? = nil,
          @subnets : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The health status of the Fargate profile. If there are issues with your Fargate profile's health,
      # they are listed here.

      struct FargateProfileHealth
        include JSON::Serializable

        # Any issues that are associated with the Fargate profile.

        @[JSON::Field(key: "issues")]
        getter issues : Array(Types::FargateProfileIssue)?

        def initialize(
          @issues : Array(Types::FargateProfileIssue)? = nil
        )
        end
      end

      # An issue that is associated with the Fargate profile.

      struct FargateProfileIssue
        include JSON::Serializable

        # A brief description of the error.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The error message associated with the issue.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon Web Services resources that are affected by this issue.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(String)?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @resource_ids : Array(String)? = nil
        )
        end
      end

      # An object representing an Fargate profile selector.

      struct FargateProfileSelector
        include JSON::Serializable

        # The Kubernetes labels that the selector should match. A pod must contain all of the labels that are
        # specified in the selector for it to be considered a match.

        @[JSON::Field(key: "labels")]
        getter labels : Hash(String, String)?

        # The Kubernetes namespace that the selector should match.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @labels : Hash(String, String)? = nil,
          @namespace : String? = nil
        )
        end
      end

      # An object representing an identity provider.

      struct Identity
        include JSON::Serializable

        # An object representing the OpenID Connect identity provider information.

        @[JSON::Field(key: "oidc")]
        getter oidc : Types::OIDC?

        def initialize(
          @oidc : Types::OIDC? = nil
        )
        end
      end

      # An object representing an identity provider configuration.

      struct IdentityProviderConfig
        include JSON::Serializable

        # The name of the identity provider configuration.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the identity provider configuration. The only type available is oidc .

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # The full description of your identity configuration.

      struct IdentityProviderConfigResponse
        include JSON::Serializable

        # An object representing an OpenID Connect (OIDC) identity provider configuration.

        @[JSON::Field(key: "oidc")]
        getter oidc : Types::OidcIdentityProviderConfig?

        def initialize(
          @oidc : Types::OidcIdentityProviderConfig? = nil
        )
        end
      end

      # A check that provides recommendations to remedy potential upgrade-impacting issues.

      struct Insight
        include JSON::Serializable

        # Links to sources that provide additional context on the insight.

        @[JSON::Field(key: "additionalInfo")]
        getter additional_info : Hash(String, String)?

        # The category of the insight.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Summary information that relates to the category of the insight. Currently only returned with
        # certain insights having category UPGRADE_READINESS .

        @[JSON::Field(key: "categorySpecificSummary")]
        getter category_specific_summary : Types::InsightCategorySpecificSummary?

        # The description of the insight which includes alert criteria, remediation recommendation, and
        # additional resources (contains Markdown).

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the insight.

        @[JSON::Field(key: "id")]
        getter id : String?

        # An object containing more detail on the status of the insight resource.

        @[JSON::Field(key: "insightStatus")]
        getter insight_status : Types::InsightStatus?

        # The Kubernetes minor version associated with an insight if applicable.

        @[JSON::Field(key: "kubernetesVersion")]
        getter kubernetes_version : String?

        # The time Amazon EKS last successfully completed a refresh of this insight check on the cluster.

        @[JSON::Field(key: "lastRefreshTime")]
        getter last_refresh_time : Time?

        # The time the status of the insight last changed.

        @[JSON::Field(key: "lastTransitionTime")]
        getter last_transition_time : Time?

        # The name of the insight.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A summary of how to remediate the finding of this insight if applicable.

        @[JSON::Field(key: "recommendation")]
        getter recommendation : String?

        # The details about each resource listed in the insight check result.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::InsightResourceDetail)?

        def initialize(
          @additional_info : Hash(String, String)? = nil,
          @category : String? = nil,
          @category_specific_summary : Types::InsightCategorySpecificSummary? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @insight_status : Types::InsightStatus? = nil,
          @kubernetes_version : String? = nil,
          @last_refresh_time : Time? = nil,
          @last_transition_time : Time? = nil,
          @name : String? = nil,
          @recommendation : String? = nil,
          @resources : Array(Types::InsightResourceDetail)? = nil
        )
        end
      end

      # Summary information that relates to the category of the insight. Currently only returned with
      # certain insights having category UPGRADE_READINESS .

      struct InsightCategorySpecificSummary
        include JSON::Serializable

        # A list of AddonCompatibilityDetail objects for Amazon EKS add-ons.

        @[JSON::Field(key: "addonCompatibilityDetails")]
        getter addon_compatibility_details : Array(Types::AddonCompatibilityDetail)?

        # The summary information about deprecated resource usage for an insight check in the
        # UPGRADE_READINESS category.

        @[JSON::Field(key: "deprecationDetails")]
        getter deprecation_details : Array(Types::DeprecationDetail)?

        def initialize(
          @addon_compatibility_details : Array(Types::AddonCompatibilityDetail)? = nil,
          @deprecation_details : Array(Types::DeprecationDetail)? = nil
        )
        end
      end

      # Returns information about the resource being evaluated.

      struct InsightResourceDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) if applicable.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # An object containing more detail on the status of the insight resource.

        @[JSON::Field(key: "insightStatus")]
        getter insight_status : Types::InsightStatus?

        # The Kubernetes resource URI if applicable.

        @[JSON::Field(key: "kubernetesResourceUri")]
        getter kubernetes_resource_uri : String?

        def initialize(
          @arn : String? = nil,
          @insight_status : Types::InsightStatus? = nil,
          @kubernetes_resource_uri : String? = nil
        )
        end
      end

      # The status of the insight.

      struct InsightStatus
        include JSON::Serializable

        # Explanation on the reasoning for the status of the resource.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The status of the resource.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The summarized description of the insight.

      struct InsightSummary
        include JSON::Serializable

        # The category of the insight.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The description of the insight which includes alert criteria, remediation recommendation, and
        # additional resources (contains Markdown).

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the insight.

        @[JSON::Field(key: "id")]
        getter id : String?

        # An object containing more detail on the status of the insight.

        @[JSON::Field(key: "insightStatus")]
        getter insight_status : Types::InsightStatus?

        # The Kubernetes minor version associated with an insight if applicable.

        @[JSON::Field(key: "kubernetesVersion")]
        getter kubernetes_version : String?

        # The time Amazon EKS last successfully completed a refresh of this insight check on the cluster.

        @[JSON::Field(key: "lastRefreshTime")]
        getter last_refresh_time : Time?

        # The time the status of the insight last changed.

        @[JSON::Field(key: "lastTransitionTime")]
        getter last_transition_time : Time?

        # The name of the insight.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @category : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @insight_status : Types::InsightStatus? = nil,
          @kubernetes_version : String? = nil,
          @last_refresh_time : Time? = nil,
          @last_transition_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # The criteria to use for the insights.

      struct InsightsFilter
        include JSON::Serializable

        # The categories to use to filter insights. The following lists the available categories:
        # UPGRADE_READINESS : Amazon EKS identifies issues that could impact your ability to upgrade to new
        # versions of Kubernetes. These are called upgrade insights. MISCONFIGURATION : Amazon EKS identifies
        # misconfiguration in your EKS Hybrid Nodes setup that could impair functionality of your cluster or
        # workloads. These are called configuration insights.

        @[JSON::Field(key: "categories")]
        getter categories : Array(String)?

        # The Kubernetes versions to use to filter the insights.

        @[JSON::Field(key: "kubernetesVersions")]
        getter kubernetes_versions : Array(String)?

        # The statuses to use to filter the insights.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        def initialize(
          @categories : Array(String)? = nil,
          @kubernetes_versions : Array(String)? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end

      # The specified parameter is invalid. Review the available parameters for the API request.

      struct InvalidParameterException
        include JSON::Serializable

        # The specified parameter for the add-on name is invalid. Review the available parameters for the API
        # request

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The Fargate profile associated with the exception.

        @[JSON::Field(key: "fargateProfileName")]
        getter fargate_profile_name : String?

        # The specified parameter is invalid. Review the available parameters for the API request.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon EKS managed node group associated with the exception.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        # The Amazon EKS subscription ID with the exception.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        def initialize(
          @addon_name : String? = nil,
          @cluster_name : String? = nil,
          @fargate_profile_name : String? = nil,
          @message : String? = nil,
          @nodegroup_name : String? = nil,
          @subscription_id : String? = nil
        )
        end
      end

      # The request is invalid given the state of the cluster. Check the state of the cluster and the
      # associated operations.

      struct InvalidRequestException
        include JSON::Serializable

        # The request is invalid given the state of the add-on name. Check the state of the cluster and the
        # associated operations.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The Amazon EKS add-on name associated with the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon EKS managed node group associated with the exception.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        # The Amazon EKS subscription ID with the exception.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        def initialize(
          @addon_name : String? = nil,
          @cluster_name : String? = nil,
          @message : String? = nil,
          @nodegroup_name : String? = nil,
          @subscription_id : String? = nil
        )
        end
      end

      # Amazon EKS detected upgrade readiness issues. Call the ListInsights API to view detected upgrade
      # blocking issues. Pass the force flag when updating to override upgrade readiness errors.

      struct InvalidStateException
        include JSON::Serializable

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @cluster_name : String? = nil,
          @message : String? = nil
        )
        end
      end

      # An object representing an issue with an Amazon EKS resource.

      struct Issue
        include JSON::Serializable

        # A brief description of the error. AccessDenied : Amazon EKS or one or more of your managed nodes is
        # failing to authenticate or authorize with your Kubernetes cluster API server.
        # AsgInstanceLaunchFailures : Your Auto Scaling group is experiencing failures while attempting to
        # launch instances. AutoScalingGroupNotFound : We couldn't find the Auto Scaling group associated with
        # the managed node group. You may be able to recreate an Auto Scaling group with the same settings to
        # recover. ClusterUnreachable : Amazon EKS or one or more of your managed nodes is unable to to
        # communicate with your Kubernetes cluster API server. This can happen if there are network
        # disruptions or if API servers are timing out processing requests. Ec2InstanceTypeDoesNotExist : One
        # or more of the supplied Amazon EC2 instance types do not exist. Amazon EKS checked for the instance
        # types that you provided in this Amazon Web Services Region, and one or more aren't available.
        # Ec2LaunchTemplateNotFound : We couldn't find the Amazon EC2 launch template for your managed node
        # group. You may be able to recreate a launch template with the same settings to recover.
        # Ec2LaunchTemplateVersionMismatch : The Amazon EC2 launch template version for your managed node
        # group does not match the version that Amazon EKS created. You may be able to revert to the version
        # that Amazon EKS created to recover. Ec2SecurityGroupDeletionFailure : We could not delete the remote
        # access security group for your managed node group. Remove any dependencies from the security group.
        # Ec2SecurityGroupNotFound : We couldn't find the cluster security group for the cluster. You must
        # recreate your cluster. Ec2SubnetInvalidConfiguration : One or more Amazon EC2 subnets specified for
        # a node group do not automatically assign public IP addresses to instances launched into it. If you
        # want your instances to be assigned a public IP address, then you need to enable the auto-assign
        # public IP address setting for the subnet. See Modifying the public IPv4 addressing attribute for
        # your subnet in the Amazon VPC User Guide . IamInstanceProfileNotFound : We couldn't find the IAM
        # instance profile for your managed node group. You may be able to recreate an instance profile with
        # the same settings to recover. IamNodeRoleNotFound : We couldn't find the IAM role for your managed
        # node group. You may be able to recreate an IAM role with the same settings to recover.
        # InstanceLimitExceeded : Your Amazon Web Services account is unable to launch any more instances of
        # the specified instance type. You may be able to request an Amazon EC2 instance limit increase to
        # recover. InsufficientFreeAddresses : One or more of the subnets associated with your managed node
        # group does not have enough available IP addresses for new nodes. InternalFailure : These errors are
        # usually caused by an Amazon EKS server-side issue. NodeCreationFailure : Your launched instances are
        # unable to register with your Amazon EKS cluster. Common causes of this failure are insufficient node
        # IAM role permissions or lack of outbound internet access for the nodes.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The error message associated with the issue.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon Web Services resources that are afflicted by this issue.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(String)?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @resource_ids : Array(String)? = nil
        )
        end
      end

      # The Kubernetes network configuration for the cluster.

      struct KubernetesNetworkConfigRequest
        include JSON::Serializable

        # Request to enable or disable the load balancing capability on your EKS Auto Mode cluster. For more
        # information, see EKS Auto Mode load balancing capability in the Amazon EKS User Guide .

        @[JSON::Field(key: "elasticLoadBalancing")]
        getter elastic_load_balancing : Types::ElasticLoadBalancing?

        # Specify which IP family is used to assign Kubernetes pod and service IP addresses. If you don't
        # specify a value, ipv4 is used by default. You can only specify an IP family when you create a
        # cluster and can't change this value once the cluster is created. If you specify ipv6 , the VPC and
        # subnets that you specify for cluster creation must have both IPv4 and IPv6 CIDR blocks assigned to
        # them. You can't specify ipv6 for clusters in China Regions. You can only specify ipv6 for 1.21 and
        # later clusters that use version 1.10.1 or later of the Amazon VPC CNI add-on. If you specify ipv6 ,
        # then ensure that your VPC meets the requirements listed in the considerations listed in Assigning
        # IPv6 addresses to pods and services in the Amazon EKS User Guide . Kubernetes assigns services IPv6
        # addresses from the unique local address range (fc00::/7) . You can't specify a custom IPv6 CIDR
        # block. Pod addresses are assigned from the subnet's IPv6 CIDR.

        @[JSON::Field(key: "ipFamily")]
        getter ip_family : String?

        # Don't specify a value if you select ipv6 for ipFamily . The CIDR block to assign Kubernetes service
        # IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the
        # 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks. We recommend that you specify a block that does not
        # overlap with resources in other networks that are peered or connected to your VPC. The block must
        # meet the following requirements: Within one of the following private IP address blocks: 10.0.0.0/8 ,
        # 172.16.0.0/12 , or 192.168.0.0/16 . Doesn't overlap with any CIDR block assigned to the VPC that you
        # selected for VPC. Between /24 and /12 . You can only specify a custom CIDR block when you create a
        # cluster. You can't change this value after the cluster is created.

        @[JSON::Field(key: "serviceIpv4Cidr")]
        getter service_ipv4_cidr : String?

        def initialize(
          @elastic_load_balancing : Types::ElasticLoadBalancing? = nil,
          @ip_family : String? = nil,
          @service_ipv4_cidr : String? = nil
        )
        end
      end

      # The Kubernetes network configuration for the cluster. The response contains a value for
      # serviceIpv6Cidr or serviceIpv4Cidr , but not both.

      struct KubernetesNetworkConfigResponse
        include JSON::Serializable

        # Indicates the current configuration of the load balancing capability on your EKS Auto Mode cluster.
        # For example, if the capability is enabled or disabled.

        @[JSON::Field(key: "elasticLoadBalancing")]
        getter elastic_load_balancing : Types::ElasticLoadBalancing?

        # The IP family used to assign Kubernetes Pod and Service objects IP addresses. The IP family is
        # always ipv4 , unless you have a 1.21 or later cluster running version 1.10.1 or later of the Amazon
        # VPC CNI plugin for Kubernetes and specified ipv6 when you created the cluster.

        @[JSON::Field(key: "ipFamily")]
        getter ip_family : String?

        # The CIDR block that Kubernetes Pod and Service object IP addresses are assigned from. Kubernetes
        # assigns addresses from an IPv4 CIDR block assigned to a subnet that the node is in. If you didn't
        # specify a CIDR block when you created the cluster, then Kubernetes assigns addresses from either the
        # 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks. If this was specified, then it was specified when the
        # cluster was created and it can't be changed.

        @[JSON::Field(key: "serviceIpv4Cidr")]
        getter service_ipv4_cidr : String?

        # The CIDR block that Kubernetes pod and service IP addresses are assigned from if you created a 1.21
        # or later cluster with version 1.10.1 or later of the Amazon VPC CNI add-on and specified ipv6 for
        # ipFamily when you created the cluster. Kubernetes assigns service addresses from the unique local
        # address range ( fc00::/7 ) because you can't specify a custom IPv6 CIDR block when you create the
        # cluster.

        @[JSON::Field(key: "serviceIpv6Cidr")]
        getter service_ipv6_cidr : String?

        def initialize(
          @elastic_load_balancing : Types::ElasticLoadBalancing? = nil,
          @ip_family : String? = nil,
          @service_ipv4_cidr : String? = nil,
          @service_ipv6_cidr : String? = nil
        )
        end
      end

      # An object representing a node group launch template specification. The launch template can't include
      # SubnetId , IamInstanceProfile , RequestSpotInstances , HibernationOptions , or TerminateInstances ,
      # or the node group deployment or update will fail. For more information about launch templates, see
      # CreateLaunchTemplate in the Amazon EC2 API Reference. For more information about using launch
      # templates with Amazon EKS, see Customizing managed nodes with launch templates in the Amazon EKS
      # User Guide . You must specify either the launch template ID or the launch template name in the
      # request, but not both.

      struct LaunchTemplateSpecification
        include JSON::Serializable

        # The ID of the launch template. You must specify either the launch template ID or the launch template
        # name in the request, but not both. After node group creation, you cannot use a different ID.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the launch template. You must specify either the launch template name or the launch
        # template ID in the request, but not both. After node group creation, you cannot use a different
        # name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The version number of the launch template to use. If no version is specified, then the template's
        # default version is used. You can use a different version for node group updates.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # An EKS Anywhere license associated with a subscription.

      struct License
        include JSON::Serializable

        # An id associated with an EKS Anywhere subscription license.

        @[JSON::Field(key: "id")]
        getter id : String?

        # An optional license token that can be used for extended support verification.

        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @id : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct ListAccessEntriesRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The ARN of an AccessPolicy . When you specify an access policy ARN, only the access entries
        # associated to that access policy are returned. For a list of available policy ARNs, use
        # ListAccessPolicies .

        @[JSON::Field(key: "associatedPolicyArn")]
        getter associated_policy_arn : String?

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name : String,
          @associated_policy_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessEntriesResponse
        include JSON::Serializable

        # The list of access entries that exist for the cluster.

        @[JSON::Field(key: "accessEntries")]
        getter access_entries : Array(String)?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @access_entries : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessPoliciesRequest
        include JSON::Serializable

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessPoliciesResponse
        include JSON::Serializable

        # The list of available access policies. You can't view the contents of an access policy using the
        # API. To view the contents, see Access policy permissions in the Amazon EKS User Guide .

        @[JSON::Field(key: "accessPolicies")]
        getter access_policies : Array(Types::AccessPolicy)?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @access_policies : Array(Types::AccessPolicy)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAddonsRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAddonsResponse
        include JSON::Serializable

        # A list of installed add-ons.

        @[JSON::Field(key: "addons")]
        getter addons : Array(String)?

        # The nextToken value to include in a future ListAddons request. When the results of a ListAddons
        # request exceed maxResults , you can use this value to retrieve the next page of results. This value
        # is null when there are no more results to return. This token should be treated as an opaque
        # identifier that is used only to retrieve the next items in a list and not for other programmatic
        # purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @addons : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedAccessPoliciesRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The ARN of the IAM principal for the AccessEntry .

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name : String,
          @principal_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedAccessPoliciesResponse
        include JSON::Serializable

        # The list of access policies associated with the access entry.

        @[JSON::Field(key: "associatedAccessPolicies")]
        getter associated_access_policies : Array(Types::AssociatedAccessPolicy)?

        # The name of your cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN of the IAM principal for the AccessEntry .

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        def initialize(
          @associated_access_policies : Array(Types::AssociatedAccessPolicy)? = nil,
          @cluster_name : String? = nil,
          @next_token : String? = nil,
          @principal_arn : String? = nil
        )
        end
      end


      struct ListCapabilitiesRequest
        include JSON::Serializable

        # The name of the Amazon EKS cluster for which you want to list capabilities.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If you don't specify a value, the default is 100
        # results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCapabilitiesResponse
        include JSON::Serializable

        # A list of capability summary objects, each containing basic information about a capability including
        # its name, ARN, type, status, version, and timestamps.

        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(Types::CapabilitySummary)?

        # The nextToken value to include in a future ListCapabilities request. When the results of a
        # ListCapabilities request exceed maxResults , you can use this value to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @capabilities : Array(Types::CapabilitySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClustersRequest
        include JSON::Serializable

        # Indicates whether external clusters are included in the returned list. Use ' all ' to return
        # https://docs.aws.amazon.com/eks/latest/userguide/eks-connector.html connected clusters, or blank to
        # return only Amazon EKS clusters. ' all ' must be in lowercase otherwise an error occurs.

        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @include : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClustersResponse
        include JSON::Serializable

        # A list of all of the clusters for your account in the specified Amazon Web Services Region .

        @[JSON::Field(key: "clusters")]
        getter clusters : Array(String)?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEksAnywhereSubscriptionsRequest
        include JSON::Serializable

        # An array of subscription statuses to filter on.

        @[JSON::Field(key: "includeStatus")]
        getter include_status : Array(String)?

        # The maximum number of cluster results returned by ListEksAnywhereSubscriptions in paginated output.
        # When you use this parameter, ListEksAnywhereSubscriptions returns only maxResults results in a
        # single page along with a nextToken response element. You can see the remaining results of the
        # initial request by sending another ListEksAnywhereSubscriptions request with the returned nextToken
        # value. This value can be between 1 and 100. If you don't use this parameter,
        # ListEksAnywhereSubscriptions returns up to 10 results and a nextToken value if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListEksAnywhereSubscriptions request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @include_status : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEksAnywhereSubscriptionsResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListEksAnywhereSubscriptions request. When the results of
        # a ListEksAnywhereSubscriptions request exceed maxResults, you can use this value to retrieve the
        # next page of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of all subscription objects in the region, filtered by includeStatus and paginated by
        # nextToken and maxResults.

        @[JSON::Field(key: "subscriptions")]
        getter subscriptions : Array(Types::EksAnywhereSubscription)?

        def initialize(
          @next_token : String? = nil,
          @subscriptions : Array(Types::EksAnywhereSubscription)? = nil
        )
        end
      end


      struct ListFargateProfilesRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFargateProfilesResponse
        include JSON::Serializable

        # A list of all of the Fargate profiles associated with the specified cluster.

        @[JSON::Field(key: "fargateProfileNames")]
        getter fargate_profile_names : Array(String)?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @fargate_profile_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdentityProviderConfigsRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdentityProviderConfigsResponse
        include JSON::Serializable

        # The identity provider configurations for the cluster.

        @[JSON::Field(key: "identityProviderConfigs")]
        getter identity_provider_configs : Array(Types::IdentityProviderConfig)?

        # The nextToken value to include in a future ListIdentityProviderConfigsResponse request. When the
        # results of a ListIdentityProviderConfigsResponse request exceed maxResults , you can use this value
        # to retrieve the next page of results. This value is null when there are no more results to return.
        # This token should be treated as an opaque identifier that is used only to retrieve the next items in
        # a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @identity_provider_configs : Array(Types::IdentityProviderConfig)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInsightsRequest
        include JSON::Serializable

        # The name of the Amazon EKS cluster associated with the insights.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The criteria to filter your list of insights for your cluster. You can filter which insights are
        # returned by category, associated Kubernetes version, and status.

        @[JSON::Field(key: "filter")]
        getter filter : Types::InsightsFilter?

        # The maximum number of identity provider configurations returned by ListInsights in paginated output.
        # When you use this parameter, ListInsights returns only maxResults results in a single page along
        # with a nextToken response element. You can see the remaining results of the initial request by
        # sending another ListInsights request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, ListInsights returns up to 100 results and a nextToken
        # value, if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListInsights request. When the results of a
        # ListInsights request exceed maxResults , you can use this value to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name : String,
          @filter : Types::InsightsFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInsightsResponse
        include JSON::Serializable

        # The returned list of insights.

        @[JSON::Field(key: "insights")]
        getter insights : Array(Types::InsightSummary)?

        # The nextToken value to include in a future ListInsights request. When the results of a ListInsights
        # request exceed maxResults , you can use this value to retrieve the next page of results. This value
        # is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @insights : Array(Types::InsightSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNodegroupsRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNodegroupsResponse
        include JSON::Serializable

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of all of the node groups associated with the specified cluster.

        @[JSON::Field(key: "nodegroups")]
        getter nodegroups : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @nodegroups : Array(String)? = nil
        )
        end
      end


      struct ListPodIdentityAssociationsRequest
        include JSON::Serializable

        # The name of the cluster that the associations are in.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The maximum number of EKS Pod Identity association results returned by ListPodIdentityAssociations
        # in paginated output. When you use this parameter, ListPodIdentityAssociations returns only
        # maxResults results in a single page along with a nextToken response element. You can see the
        # remaining results of the initial request by sending another ListPodIdentityAssociations request with
        # the returned nextToken value. This value can be between 1 and 100. If you don't use this parameter,
        # ListPodIdentityAssociations returns up to 100 results and a nextToken value if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the Kubernetes namespace inside the cluster that the associations are in.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The nextToken value returned from a previous paginated ListUpdates request where maxResults was used
        # and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value. This token should be treated as an opaque
        # identifier that is used only to retrieve the next items in a list and not for other programmatic
        # purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the Kubernetes service account that the associations use.

        @[JSON::Field(key: "serviceAccount")]
        getter service_account : String?

        def initialize(
          @cluster_name : String,
          @max_results : Int32? = nil,
          @namespace : String? = nil,
          @next_token : String? = nil,
          @service_account : String? = nil
        )
        end
      end


      struct ListPodIdentityAssociationsResponse
        include JSON::Serializable

        # The list of summarized descriptions of the associations that are in the cluster and match any
        # filters that you provided. Each summary is simplified by removing these fields compared to the full
        # PodIdentityAssociation : The IAM role: roleArn The timestamp that the association was created at:
        # createdAt The most recent timestamp that the association was modified at:. modifiedAt The tags on
        # the association: tags

        @[JSON::Field(key: "associations")]
        getter associations : Array(Types::PodIdentityAssociationSummary)?

        # The nextToken value to include in a future ListPodIdentityAssociations request. When the results of
        # a ListPodIdentityAssociations request exceed maxResults , you can use this value to retrieve the
        # next page of results. This value is null when there are no more results to return. This token should
        # be treated as an opaque identifier that is used only to retrieve the next items in a list and not
        # for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @associations : Array(Types::PodIdentityAssociationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to list tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags for the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListUpdatesRequest
        include JSON::Serializable

        # The name of the Amazon EKS cluster to list updates for.

        @[JSON::Field(key: "name")]
        getter name : String

        # The names of the installed add-ons that have available updates.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The name of the capability for which you want to list updates.

        @[JSON::Field(key: "capabilityName")]
        getter capability_name : String?

        # The maximum number of results, returned in paginated output. You receive maxResults in a single
        # page, along with a nextToken response element. You can see the remaining results of the initial
        # request by sending another request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, 100 results and a nextToken value, if applicable, are
        # returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the Amazon EKS managed node group to list updates for.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        def initialize(
          @name : String,
          @addon_name : String? = nil,
          @capability_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @nodegroup_name : String? = nil
        )
        end
      end


      struct ListUpdatesResponse
        include JSON::Serializable

        # The nextToken value returned from a previous paginated request, where maxResults was used and the
        # results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This value is null when there are no more results to
        # return. This token should be treated as an opaque identifier that is used only to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of all the updates for the specified cluster and Region.

        @[JSON::Field(key: "updateIds")]
        getter update_ids : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @update_ids : Array(String)? = nil
        )
        end
      end

      # An object representing the enabled or disabled Kubernetes control plane logs for your cluster.

      struct LogSetup
        include JSON::Serializable

        # If a log type is enabled, that log type exports its control plane logs to CloudWatch Logs . If a log
        # type isn't enabled, that log type doesn't export its control plane logs. Each individual log type
        # can be enabled or disabled independently.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The available cluster control plane log types.

        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @enabled : Bool? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      # An object representing the logging configuration for resources in your cluster.

      struct Logging
        include JSON::Serializable

        # The cluster control plane logging configuration for your cluster.

        @[JSON::Field(key: "clusterLogging")]
        getter cluster_logging : Array(Types::LogSetup)?

        def initialize(
          @cluster_logging : Array(Types::LogSetup)? = nil
        )
        end
      end

      # Information about an Amazon EKS add-on from the Amazon Web Services Marketplace.

      struct MarketplaceInformation
        include JSON::Serializable

        # The product ID from the Amazon Web Services Marketplace.

        @[JSON::Field(key: "productId")]
        getter product_id : String?

        # The product URL from the Amazon Web Services Marketplace.

        @[JSON::Field(key: "productUrl")]
        getter product_url : String?

        def initialize(
          @product_id : String? = nil,
          @product_url : String? = nil
        )
        end
      end

      # The node auto repair configuration for the node group.

      struct NodeRepairConfig
        include JSON::Serializable

        # Specifies whether to enable node auto repair for the node group. Node auto repair is disabled by
        # default.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Specify the maximum number of nodes that can be repaired concurrently or in parallel, expressed as a
        # count of unhealthy nodes. This gives you finer-grained control over the pace of node replacements.
        # When using this, you cannot also set maxParallelNodesRepairedPercentage at the same time.

        @[JSON::Field(key: "maxParallelNodesRepairedCount")]
        getter max_parallel_nodes_repaired_count : Int32?

        # Specify the maximum number of nodes that can be repaired concurrently or in parallel, expressed as a
        # percentage of unhealthy nodes. This gives you finer-grained control over the pace of node
        # replacements. When using this, you cannot also set maxParallelNodesRepairedCount at the same time.

        @[JSON::Field(key: "maxParallelNodesRepairedPercentage")]
        getter max_parallel_nodes_repaired_percentage : Int32?

        # Specify a count threshold of unhealthy nodes, above which node auto repair actions will stop. When
        # using this, you cannot also set maxUnhealthyNodeThresholdPercentage at the same time.

        @[JSON::Field(key: "maxUnhealthyNodeThresholdCount")]
        getter max_unhealthy_node_threshold_count : Int32?

        # Specify a percentage threshold of unhealthy nodes, above which node auto repair actions will stop.
        # When using this, you cannot also set maxUnhealthyNodeThresholdCount at the same time.

        @[JSON::Field(key: "maxUnhealthyNodeThresholdPercentage")]
        getter max_unhealthy_node_threshold_percentage : Int32?

        # Specify granular overrides for specific repair actions. These overrides control the repair action
        # and the repair delay time before a node is considered eligible for repair. If you use this, you must
        # specify all the values.

        @[JSON::Field(key: "nodeRepairConfigOverrides")]
        getter node_repair_config_overrides : Array(Types::NodeRepairConfigOverrides)?

        def initialize(
          @enabled : Bool? = nil,
          @max_parallel_nodes_repaired_count : Int32? = nil,
          @max_parallel_nodes_repaired_percentage : Int32? = nil,
          @max_unhealthy_node_threshold_count : Int32? = nil,
          @max_unhealthy_node_threshold_percentage : Int32? = nil,
          @node_repair_config_overrides : Array(Types::NodeRepairConfigOverrides)? = nil
        )
        end
      end

      # Specify granular overrides for specific repair actions. These overrides control the repair action
      # and the repair delay time before a node is considered eligible for repair. If you use this, you must
      # specify all the values.

      struct NodeRepairConfigOverrides
        include JSON::Serializable

        # Specify the minimum time in minutes to wait before attempting to repair a node with this specific
        # nodeMonitoringCondition and nodeUnhealthyReason .

        @[JSON::Field(key: "minRepairWaitTimeMins")]
        getter min_repair_wait_time_mins : Int32?

        # Specify an unhealthy condition reported by the node monitoring agent that this override would apply
        # to.

        @[JSON::Field(key: "nodeMonitoringCondition")]
        getter node_monitoring_condition : String?

        # Specify a reason reported by the node monitoring agent that this override would apply to.

        @[JSON::Field(key: "nodeUnhealthyReason")]
        getter node_unhealthy_reason : String?

        # Specify the repair action to take for nodes when all of the specified conditions are met.

        @[JSON::Field(key: "repairAction")]
        getter repair_action : String?

        def initialize(
          @min_repair_wait_time_mins : Int32? = nil,
          @node_monitoring_condition : String? = nil,
          @node_unhealthy_reason : String? = nil,
          @repair_action : String? = nil
        )
        end
      end

      # An object representing an Amazon EKS managed node group.

      struct Nodegroup
        include JSON::Serializable

        # If the node group was deployed using a launch template with a custom AMI, then this is CUSTOM . For
        # node groups that weren't deployed using a launch template, this is the AMI type that was specified
        # in the node group configuration.

        @[JSON::Field(key: "amiType")]
        getter ami_type : String?

        # The capacity type of your managed node group.

        @[JSON::Field(key: "capacityType")]
        getter capacity_type : String?

        # The name of your cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The Unix epoch timestamp at object creation.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # If the node group wasn't deployed with a launch template, then this is the disk size in the node
        # group configuration. If the node group was deployed with a launch template, then this is null .

        @[JSON::Field(key: "diskSize")]
        getter disk_size : Int32?

        # The health status of the node group. If there are issues with your node group's health, they are
        # listed here.

        @[JSON::Field(key: "health")]
        getter health : Types::NodegroupHealth?

        # If the node group wasn't deployed with a launch template, then this is the instance type that is
        # associated with the node group. If the node group was deployed with a launch template, then this is
        # null .

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        # The Kubernetes labels applied to the nodes in the node group. Only labels that are applied with the
        # Amazon EKS API are shown here. There may be other Kubernetes labels applied to the nodes in this
        # group.

        @[JSON::Field(key: "labels")]
        getter labels : Hash(String, String)?

        # If a launch template was used to create the node group, then this is the launch template that was
        # used.

        @[JSON::Field(key: "launchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # The Unix epoch timestamp for the last modification to the object.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The node auto repair configuration for the node group.

        @[JSON::Field(key: "nodeRepairConfig")]
        getter node_repair_config : Types::NodeRepairConfig?

        # The IAM role associated with your node group. The Amazon EKS node kubelet daemon makes calls to
        # Amazon Web Services APIs on your behalf. Nodes receive permissions for these API calls through an
        # IAM instance profile and associated policies.

        @[JSON::Field(key: "nodeRole")]
        getter node_role : String?

        # The Amazon Resource Name (ARN) associated with the managed node group.

        @[JSON::Field(key: "nodegroupArn")]
        getter nodegroup_arn : String?

        # The name associated with an Amazon EKS managed node group.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        # If the node group was deployed using a launch template with a custom AMI, then this is the AMI ID
        # that was specified in the launch template. For node groups that weren't deployed using a launch
        # template, this is the version of the Amazon EKS optimized AMI that the node group was deployed with.

        @[JSON::Field(key: "releaseVersion")]
        getter release_version : String?

        # If the node group wasn't deployed with a launch template, then this is the remote access
        # configuration that is associated with the node group. If the node group was deployed with a launch
        # template, then this is null .

        @[JSON::Field(key: "remoteAccess")]
        getter remote_access : Types::RemoteAccessConfig?

        # The resources associated with the node group, such as Auto Scaling groups and security groups for
        # remote access.

        @[JSON::Field(key: "resources")]
        getter resources : Types::NodegroupResources?

        # The scaling configuration details for the Auto Scaling group that is associated with your node
        # group.

        @[JSON::Field(key: "scalingConfig")]
        getter scaling_config : Types::NodegroupScalingConfig?

        # The current status of the managed node group.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The subnets that were specified for the Auto Scaling group that is associated with your node group.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Kubernetes taints to be applied to the nodes in the node group when they are created. Effect is
        # one of No_Schedule , Prefer_No_Schedule , or No_Execute . Kubernetes taints can be used together
        # with tolerations to control how workloads are scheduled to your nodes. For more information, see
        # Node taints on managed node groups .

        @[JSON::Field(key: "taints")]
        getter taints : Array(Types::Taint)?

        # The node group update configuration.

        @[JSON::Field(key: "updateConfig")]
        getter update_config : Types::NodegroupUpdateConfig?

        # The Kubernetes version of the managed node group.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @ami_type : String? = nil,
          @capacity_type : String? = nil,
          @cluster_name : String? = nil,
          @created_at : Time? = nil,
          @disk_size : Int32? = nil,
          @health : Types::NodegroupHealth? = nil,
          @instance_types : Array(String)? = nil,
          @labels : Hash(String, String)? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @modified_at : Time? = nil,
          @node_repair_config : Types::NodeRepairConfig? = nil,
          @node_role : String? = nil,
          @nodegroup_arn : String? = nil,
          @nodegroup_name : String? = nil,
          @release_version : String? = nil,
          @remote_access : Types::RemoteAccessConfig? = nil,
          @resources : Types::NodegroupResources? = nil,
          @scaling_config : Types::NodegroupScalingConfig? = nil,
          @status : String? = nil,
          @subnets : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @taints : Array(Types::Taint)? = nil,
          @update_config : Types::NodegroupUpdateConfig? = nil,
          @version : String? = nil
        )
        end
      end

      # An object representing the health status of the node group.

      struct NodegroupHealth
        include JSON::Serializable

        # Any issues that are associated with the node group.

        @[JSON::Field(key: "issues")]
        getter issues : Array(Types::Issue)?

        def initialize(
          @issues : Array(Types::Issue)? = nil
        )
        end
      end

      # An object representing the resources associated with the node group, such as Auto Scaling groups and
      # security groups for remote access.

      struct NodegroupResources
        include JSON::Serializable

        # The Auto Scaling groups associated with the node group.

        @[JSON::Field(key: "autoScalingGroups")]
        getter auto_scaling_groups : Array(Types::AutoScalingGroup)?

        # The remote access security group associated with the node group. This security group controls SSH
        # access to the nodes.

        @[JSON::Field(key: "remoteAccessSecurityGroup")]
        getter remote_access_security_group : String?

        def initialize(
          @auto_scaling_groups : Array(Types::AutoScalingGroup)? = nil,
          @remote_access_security_group : String? = nil
        )
        end
      end

      # An object representing the scaling configuration details for the Auto Scaling group that is
      # associated with your node group. When creating a node group, you must specify all or none of the
      # properties. When updating a node group, you can specify any or none of the properties.

      struct NodegroupScalingConfig
        include JSON::Serializable

        # The current number of nodes that the managed node group should maintain. If you use the Kubernetes
        # Cluster Autoscaler , you shouldn't change the desiredSize value directly, as this can cause the
        # Cluster Autoscaler to suddenly scale up or scale down. Whenever this parameter changes, the number
        # of worker nodes in the node group is updated to the specified size. If this parameter is given a
        # value that is smaller than the current number of running worker nodes, the necessary number of
        # worker nodes are terminated to match the given value. When using CloudFormation, no action occurs if
        # you remove this parameter from your CFN template. This parameter can be different from minSize in
        # some cases, such as when starting with extra hosts for testing. This parameter can also be different
        # when you want to start with an estimated number of needed hosts, but let the Cluster Autoscaler
        # reduce the number if there are too many. When the Cluster Autoscaler is used, the desiredSize
        # parameter is altered by the Cluster Autoscaler (but can be out-of-date for short periods of time).
        # the Cluster Autoscaler doesn't scale a managed node group lower than minSize or higher than maxSize
        # .

        @[JSON::Field(key: "desiredSize")]
        getter desired_size : Int32?

        # The maximum number of nodes that the managed node group can scale out to. For information about the
        # maximum number that you can specify, see Amazon EKS service quotas in the Amazon EKS User Guide .

        @[JSON::Field(key: "maxSize")]
        getter max_size : Int32?

        # The minimum number of nodes that the managed node group can scale in to.

        @[JSON::Field(key: "minSize")]
        getter min_size : Int32?

        def initialize(
          @desired_size : Int32? = nil,
          @max_size : Int32? = nil,
          @min_size : Int32? = nil
        )
        end
      end

      # The node group update configuration. An Amazon EKS managed node group updates by replacing nodes
      # with new nodes of newer AMI versions in parallel. You choose the maximum unavailable and the update
      # strategy .

      struct NodegroupUpdateConfig
        include JSON::Serializable

        # The maximum number of nodes unavailable at once during a version update. Nodes are updated in
        # parallel. This value or maxUnavailablePercentage is required to have a value.The maximum number is
        # 100.

        @[JSON::Field(key: "maxUnavailable")]
        getter max_unavailable : Int32?

        # The maximum percentage of nodes unavailable during a version update. This percentage of nodes are
        # updated in parallel, up to 100 nodes at once. This value or maxUnavailable is required to have a
        # value.

        @[JSON::Field(key: "maxUnavailablePercentage")]
        getter max_unavailable_percentage : Int32?

        # The configuration for the behavior to follow during a node group version update of this managed node
        # group. You choose between two possible strategies for replacing nodes during an
        # UpdateNodegroupVersion action. An Amazon EKS managed node group updates by replacing nodes with new
        # nodes of newer AMI versions in parallel. The update strategy changes the managed node update
        # behavior of the managed node group for each quantity. The default strategy has guardrails to protect
        # you from misconfiguration and launches the new instances first, before terminating the old
        # instances. The minimal strategy removes the guardrails and terminates the old instances before
        # launching the new instances. This minimal strategy is useful in scenarios where you are constrained
        # to resources or costs (for example, with hardware accelerators such as GPUs).

        @[JSON::Field(key: "updateStrategy")]
        getter update_strategy : String?

        def initialize(
          @max_unavailable : Int32? = nil,
          @max_unavailable_percentage : Int32? = nil,
          @update_strategy : String? = nil
        )
        end
      end

      # A service resource associated with the request could not be found. Clients should not retry such
      # requests.

      struct NotFoundException
        include JSON::Serializable

        # A service resource associated with the request could not be found. Clients should not retry such
        # requests.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object representing the OpenID Connect (OIDC) identity provider information for the cluster.

      struct OIDC
        include JSON::Serializable

        # The issuer URL for the OIDC identity provider.

        @[JSON::Field(key: "issuer")]
        getter issuer : String?

        def initialize(
          @issuer : String? = nil
        )
        end
      end

      # An object representing the configuration for an OpenID Connect (OIDC) identity provider.

      struct OidcIdentityProviderConfig
        include JSON::Serializable

        # This is also known as audience . The ID of the client application that makes authentication requests
        # to the OIDC identity provider.

        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The name of your cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The JSON web token (JWT) claim that the provider uses to return your groups.

        @[JSON::Field(key: "groupsClaim")]
        getter groups_claim : String?

        # The prefix that is prepended to group claims to prevent clashes with existing names (such as system:
        # groups). For example, the value oidc: creates group names like oidc:engineering and oidc:infra . The
        # prefix can't contain system:

        @[JSON::Field(key: "groupsPrefix")]
        getter groups_prefix : String?

        # The ARN of the configuration.

        @[JSON::Field(key: "identityProviderConfigArn")]
        getter identity_provider_config_arn : String?

        # The name of the configuration.

        @[JSON::Field(key: "identityProviderConfigName")]
        getter identity_provider_config_name : String?

        # The URL of the OIDC identity provider that allows the API server to discover public signing keys for
        # verifying tokens.

        @[JSON::Field(key: "issuerUrl")]
        getter issuer_url : String?

        # The key-value pairs that describe required claims in the identity token. If set, each claim is
        # verified to be present in the token with a matching value.

        @[JSON::Field(key: "requiredClaims")]
        getter required_claims : Hash(String, String)?

        # The status of the OIDC identity provider.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The JSON Web token (JWT) claim that is used as the username.

        @[JSON::Field(key: "usernameClaim")]
        getter username_claim : String?

        # The prefix that is prepended to username claims to prevent clashes with existing names. The prefix
        # can't contain system:

        @[JSON::Field(key: "usernamePrefix")]
        getter username_prefix : String?

        def initialize(
          @client_id : String? = nil,
          @cluster_name : String? = nil,
          @groups_claim : String? = nil,
          @groups_prefix : String? = nil,
          @identity_provider_config_arn : String? = nil,
          @identity_provider_config_name : String? = nil,
          @issuer_url : String? = nil,
          @required_claims : Hash(String, String)? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @username_claim : String? = nil,
          @username_prefix : String? = nil
        )
        end
      end

      # An object representing an OpenID Connect (OIDC) configuration. Before associating an OIDC identity
      # provider to your cluster, review the considerations in Authenticating users for your cluster from an
      # OIDC identity provider in the Amazon EKS User Guide .

      struct OidcIdentityProviderConfigRequest
        include JSON::Serializable

        # This is also known as audience . The ID for the client application that makes authentication
        # requests to the OIDC identity provider.

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The name of the OIDC provider configuration.

        @[JSON::Field(key: "identityProviderConfigName")]
        getter identity_provider_config_name : String

        # The URL of the OIDC identity provider that allows the API server to discover public signing keys for
        # verifying tokens. The URL must begin with https:// and should correspond to the iss claim in the
        # provider's OIDC ID tokens. Based on the OIDC standard, path components are allowed but query
        # parameters are not. Typically the URL consists of only a hostname, like https://server.example.org
        # or https://example.com . This URL should point to the level below .well-known/openid-configuration
        # and must be publicly accessible over the internet.

        @[JSON::Field(key: "issuerUrl")]
        getter issuer_url : String

        # The JWT claim that the provider uses to return your groups.

        @[JSON::Field(key: "groupsClaim")]
        getter groups_claim : String?

        # The prefix that is prepended to group claims to prevent clashes with existing names (such as system:
        # groups). For example, the value oidc: will create group names like oidc:engineering and oidc:infra .

        @[JSON::Field(key: "groupsPrefix")]
        getter groups_prefix : String?

        # The key value pairs that describe required claims in the identity token. If set, each claim is
        # verified to be present in the token with a matching value. For the maximum number of claims that you
        # can require, see Amazon EKS service quotas in the Amazon EKS User Guide .

        @[JSON::Field(key: "requiredClaims")]
        getter required_claims : Hash(String, String)?

        # The JSON Web Token (JWT) claim to use as the username. The default is sub , which is expected to be
        # a unique identifier of the end user. You can choose other claims, such as email or name , depending
        # on the OIDC identity provider. Claims other than email are prefixed with the issuer URL to prevent
        # naming clashes with other plug-ins.

        @[JSON::Field(key: "usernameClaim")]
        getter username_claim : String?

        # The prefix that is prepended to username claims to prevent clashes with existing names. If you do
        # not provide this field, and username is a value other than email , the prefix defaults to issuerurl#
        # . You can use the value - to disable all prefixing.

        @[JSON::Field(key: "usernamePrefix")]
        getter username_prefix : String?

        def initialize(
          @client_id : String,
          @identity_provider_config_name : String,
          @issuer_url : String,
          @groups_claim : String? = nil,
          @groups_prefix : String? = nil,
          @required_claims : Hash(String, String)? = nil,
          @username_claim : String? = nil,
          @username_prefix : String? = nil
        )
        end
      end

      # The configuration of your local Amazon EKS cluster on an Amazon Web Services Outpost. Before
      # creating a cluster on an Outpost, review Creating a local cluster on an Outpost in the Amazon EKS
      # User Guide . This API isn't available for Amazon EKS clusters on the Amazon Web Services cloud.

      struct OutpostConfigRequest
        include JSON::Serializable

        # The Amazon EC2 instance type that you want to use for your local Amazon EKS cluster on Outposts.
        # Choose an instance type based on the number of nodes that your cluster will have. For more
        # information, see Capacity considerations in the Amazon EKS User Guide . The instance type that you
        # specify is used for all Kubernetes control plane instances. The instance type can't be changed after
        # cluster creation. The control plane is not automatically scaled by Amazon EKS.

        @[JSON::Field(key: "controlPlaneInstanceType")]
        getter control_plane_instance_type : String

        # The ARN of the Outpost that you want to use for your local Amazon EKS cluster on Outposts. Only a
        # single Outpost ARN is supported.

        @[JSON::Field(key: "outpostArns")]
        getter outpost_arns : Array(String)

        # An object representing the placement configuration for all the control plane instances of your local
        # Amazon EKS cluster on an Amazon Web Services Outpost. For more information, see Capacity
        # considerations in the Amazon EKS User Guide .

        @[JSON::Field(key: "controlPlanePlacement")]
        getter control_plane_placement : Types::ControlPlanePlacementRequest?

        def initialize(
          @control_plane_instance_type : String,
          @outpost_arns : Array(String),
          @control_plane_placement : Types::ControlPlanePlacementRequest? = nil
        )
        end
      end

      # An object representing the configuration of your local Amazon EKS cluster on an Amazon Web Services
      # Outpost. This API isn't available for Amazon EKS clusters on the Amazon Web Services cloud.

      struct OutpostConfigResponse
        include JSON::Serializable

        # The Amazon EC2 instance type used for the control plane. The instance type is the same for all
        # control plane instances.

        @[JSON::Field(key: "controlPlaneInstanceType")]
        getter control_plane_instance_type : String

        # The ARN of the Outpost that you specified for use with your local Amazon EKS cluster on Outposts.

        @[JSON::Field(key: "outpostArns")]
        getter outpost_arns : Array(String)

        # An object representing the placement configuration for all the control plane instances of your local
        # Amazon EKS cluster on an Amazon Web Services Outpost. For more information, see Capacity
        # considerations in the Amazon EKS User Guide .

        @[JSON::Field(key: "controlPlanePlacement")]
        getter control_plane_placement : Types::ControlPlanePlacementResponse?

        def initialize(
          @control_plane_instance_type : String,
          @outpost_arns : Array(String),
          @control_plane_placement : Types::ControlPlanePlacementResponse? = nil
        )
        end
      end

      # Amazon EKS Pod Identity associations provide the ability to manage credentials for your
      # applications, similar to the way that Amazon EC2 instance profiles provide credentials to Amazon EC2
      # instances.

      struct PodIdentityAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.

        @[JSON::Field(key: "associationArn")]
        getter association_arn : String?

        # The ID of the association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The name of the cluster that the association is in.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The timestamp that the association was created at.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The state of the automatic sessions tags. The value of true disables these tags. EKS Pod Identity
        # adds a pre-defined set of session tags when it assumes the role. You can use these tags to author a
        # single role that can work across resources by allowing access to Amazon Web Services resources based
        # on matching tags. By default, EKS Pod Identity attaches six tags, including tags for cluster name,
        # namespace, and service account name. For the list of tags added by EKS Pod Identity, see List of
        # session tags added by EKS Pod Identity in the Amazon EKS User Guide .

        @[JSON::Field(key: "disableSessionTags")]
        getter disable_session_tags : Bool?

        # The unique identifier for this EKS Pod Identity association for a target IAM role. You put this
        # value in the trust policy of the target role, in a Condition to match the sts.ExternalId . This
        # ensures that the target role can only be assumed by this association. This prevents the confused
        # deputy problem . For more information about the confused deputy problem, see The confused deputy
        # problem in the IAM User Guide . If you want to use the same target role with multiple associations
        # or other roles, use independent statements in the trust policy to allow sts:AssumeRole access from
        # each role.

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The most recent timestamp that the association was modified at.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The name of the Kubernetes namespace inside the cluster to create the association in. The service
        # account and the Pods that use the service account must be in this namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # If defined, the EKS Pod Identity association is owned by an Amazon EKS add-on.

        @[JSON::Field(key: "ownerArn")]
        getter owner_arn : String?

        # The Amazon Resource Name (ARN) of the IAM role to associate with the service account. The EKS Pod
        # Identity agent manages credentials to assume this role for applications in the containers in the
        # Pods that use this service account.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The name of the Kubernetes service account inside the cluster to associate the IAM credentials with.

        @[JSON::Field(key: "serviceAccount")]
        getter service_account : String?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources. The following basic restrictions apply to tags: Maximum number of tags per resource – 50
        # For each resource, each tag key must be unique, and each tag key can have only one value. Maximum
        # key length – 128 Unicode characters in UTF-8 Maximum value length – 256 Unicode characters in UTF-8
        # If your tagging schema is used across multiple services and resources, remember that other services
        # may have restrictions on allowed characters. Generally allowed characters are: letters, numbers, and
        # spaces representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values
        # are case-sensitive. Do not use aws: , AWS: , or any upper or lowercase combination of such as a
        # prefix for either keys or values as it is reserved for Amazon Web Services use. You cannot edit or
        # delete tag keys or values with this prefix. Tags with this prefix do not count against your tags per
        # resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the target IAM role to associate with the service account. This
        # role is assumed by using the EKS Pod Identity association role, then the credentials for this role
        # are injected into the Pod.

        @[JSON::Field(key: "targetRoleArn")]
        getter target_role_arn : String?

        def initialize(
          @association_arn : String? = nil,
          @association_id : String? = nil,
          @cluster_name : String? = nil,
          @created_at : Time? = nil,
          @disable_session_tags : Bool? = nil,
          @external_id : String? = nil,
          @modified_at : Time? = nil,
          @namespace : String? = nil,
          @owner_arn : String? = nil,
          @role_arn : String? = nil,
          @service_account : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target_role_arn : String? = nil
        )
        end
      end

      # The summarized description of the association. Each summary is simplified by removing these fields
      # compared to the full PodIdentityAssociation : The IAM role: roleArn The timestamp that the
      # association was created at: createdAt The most recent timestamp that the association was modified
      # at:. modifiedAt The tags on the association: tags

      struct PodIdentityAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the association.

        @[JSON::Field(key: "associationArn")]
        getter association_arn : String?

        # The ID of the association.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The name of the cluster that the association is in.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The name of the Kubernetes namespace inside the cluster to create the association in. The service
        # account and the Pods that use the service account must be in this namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # If defined, the association is owned by an Amazon EKS add-on.

        @[JSON::Field(key: "ownerArn")]
        getter owner_arn : String?

        # The name of the Kubernetes service account inside the cluster to associate the IAM credentials with.

        @[JSON::Field(key: "serviceAccount")]
        getter service_account : String?

        def initialize(
          @association_arn : String? = nil,
          @association_id : String? = nil,
          @cluster_name : String? = nil,
          @namespace : String? = nil,
          @owner_arn : String? = nil,
          @service_account : String? = nil
        )
        end
      end

      # Identifies the Key Management Service (KMS) key used to encrypt the secrets.

      struct Provider
        include JSON::Serializable

        # Amazon Resource Name (ARN) or alias of the KMS key. The KMS key must be symmetric and created in the
        # same Amazon Web Services Region as the cluster. If the KMS key was created in a different account,
        # the IAM principal must have access to the KMS key. For more information, see Allowing users in other
        # accounts to use a KMS key in the Key Management Service Developer Guide .

        @[JSON::Field(key: "keyArn")]
        getter key_arn : String?

        def initialize(
          @key_arn : String? = nil
        )
        end
      end


      struct RegisterClusterRequest
        include JSON::Serializable

        # The configuration settings required to connect the Kubernetes cluster to the Amazon EKS control
        # plane.

        @[JSON::Field(key: "connectorConfig")]
        getter connector_config : Types::ConnectorConfigRequest

        # A unique name for this cluster in your Amazon Web Services Region.

        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @connector_config : Types::ConnectorConfigRequest,
          @name : String,
          @client_request_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegisterClusterResponse
        include JSON::Serializable


        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # An object representing the remote access configuration for the managed node group.

      struct RemoteAccessConfig
        include JSON::Serializable

        # The Amazon EC2 SSH key name that provides access for SSH communication with the nodes in the managed
        # node group. For more information, see Amazon EC2 key pairs and Linux instances in the Amazon Elastic
        # Compute Cloud User Guide for Linux Instances . For Windows, an Amazon EC2 SSH key is used to obtain
        # the RDP password. For more information, see Amazon EC2 key pairs and Windows instances in the Amazon
        # Elastic Compute Cloud User Guide for Windows Instances .

        @[JSON::Field(key: "ec2SshKey")]
        getter ec2_ssh_key : String?

        # The security group IDs that are allowed SSH access (port 22) to the nodes. For Windows, the port is
        # 3389. If you specify an Amazon EC2 SSH key but don't specify a source security group when you create
        # a managed node group, then the port on the nodes is opened to the internet ( 0.0.0.0/0 ). For more
        # information, see Security Groups for Your VPC in the Amazon Virtual Private Cloud User Guide .

        @[JSON::Field(key: "sourceSecurityGroups")]
        getter source_security_groups : Array(String)?

        def initialize(
          @ec2_ssh_key : String? = nil,
          @source_security_groups : Array(String)? = nil
        )
        end
      end

      # The configuration in the cluster for EKS Hybrid Nodes. You can add, change, or remove this
      # configuration after the cluster is created.

      struct RemoteNetworkConfigRequest
        include JSON::Serializable

        # The list of network CIDRs that can contain hybrid nodes. These CIDR blocks define the expected IP
        # address range of the hybrid nodes that join the cluster. These blocks are typically determined by
        # your network administrator. Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation (for
        # example, 10.2.0.0/16 ). It must satisfy the following requirements: Each block must be within an
        # IPv4 RFC-1918 network range. Minimum allowed size is /32, maximum allowed size is /8.
        # Publicly-routable addresses aren't supported. Each block cannot overlap with the range of the VPC
        # CIDR blocks for your EKS resources, or the block of the Kubernetes service IP range. Each block must
        # have a route to the VPC that uses the VPC CIDR blocks, not public IPs or Elastic IPs. There are many
        # options including Transit Gateway, Site-to-Site VPN, or Direct Connect. Each host must allow
        # outbound connection to the EKS cluster control plane on TCP ports 443 and 10250 . Each host must
        # allow inbound connection from the EKS cluster control plane on TCP port 10250 for logs, exec and
        # port-forward operations. Each host must allow TCP and UDP network connectivity to and from other
        # hosts that are running CoreDNS on UDP port 53 for service and pod DNS names.

        @[JSON::Field(key: "remoteNodeNetworks")]
        getter remote_node_networks : Array(Types::RemoteNodeNetwork)?

        # The list of network CIDRs that can contain pods that run Kubernetes webhooks on hybrid nodes. These
        # CIDR blocks are determined by configuring your Container Network Interface (CNI) plugin. We
        # recommend the Calico CNI or Cilium CNI. Note that the Amazon VPC CNI plugin for Kubernetes isn't
        # available for on-premises and edge locations. Enter one or more IPv4 CIDR blocks in decimal
        # dotted-quad notation (for example, 10.2.0.0/16 ). It must satisfy the following requirements: Each
        # block must be within an IPv4 RFC-1918 network range. Minimum allowed size is /32, maximum allowed
        # size is /8. Publicly-routable addresses aren't supported. Each block cannot overlap with the range
        # of the VPC CIDR blocks for your EKS resources, or the block of the Kubernetes service IP range.

        @[JSON::Field(key: "remotePodNetworks")]
        getter remote_pod_networks : Array(Types::RemotePodNetwork)?

        def initialize(
          @remote_node_networks : Array(Types::RemoteNodeNetwork)? = nil,
          @remote_pod_networks : Array(Types::RemotePodNetwork)? = nil
        )
        end
      end

      # The configuration in the cluster for EKS Hybrid Nodes. You can add, change, or remove this
      # configuration after the cluster is created.

      struct RemoteNetworkConfigResponse
        include JSON::Serializable

        # The list of network CIDRs that can contain hybrid nodes.

        @[JSON::Field(key: "remoteNodeNetworks")]
        getter remote_node_networks : Array(Types::RemoteNodeNetwork)?

        # The list of network CIDRs that can contain pods that run Kubernetes webhooks on hybrid nodes.

        @[JSON::Field(key: "remotePodNetworks")]
        getter remote_pod_networks : Array(Types::RemotePodNetwork)?

        def initialize(
          @remote_node_networks : Array(Types::RemoteNodeNetwork)? = nil,
          @remote_pod_networks : Array(Types::RemotePodNetwork)? = nil
        )
        end
      end

      # A network CIDR that can contain hybrid nodes. These CIDR blocks define the expected IP address range
      # of the hybrid nodes that join the cluster. These blocks are typically determined by your network
      # administrator. Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation (for example,
      # 10.2.0.0/16 ). It must satisfy the following requirements: Each block must be within an IPv4
      # RFC-1918 network range. Minimum allowed size is /32, maximum allowed size is /8. Publicly-routable
      # addresses aren't supported. Each block cannot overlap with the range of the VPC CIDR blocks for your
      # EKS resources, or the block of the Kubernetes service IP range. Each block must have a route to the
      # VPC that uses the VPC CIDR blocks, not public IPs or Elastic IPs. There are many options including
      # Transit Gateway, Site-to-Site VPN, or Direct Connect. Each host must allow outbound connection to
      # the EKS cluster control plane on TCP ports 443 and 10250 . Each host must allow inbound connection
      # from the EKS cluster control plane on TCP port 10250 for logs, exec and port-forward operations.
      # Each host must allow TCP and UDP network connectivity to and from other hosts that are running
      # CoreDNS on UDP port 53 for service and pod DNS names.

      struct RemoteNodeNetwork
        include JSON::Serializable

        # A network CIDR that can contain hybrid nodes. These CIDR blocks define the expected IP address range
        # of the hybrid nodes that join the cluster. These blocks are typically determined by your network
        # administrator. Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation (for example,
        # 10.2.0.0/16 ). It must satisfy the following requirements: Each block must be within an IPv4
        # RFC-1918 network range. Minimum allowed size is /32, maximum allowed size is /8. Publicly-routable
        # addresses aren't supported. Each block cannot overlap with the range of the VPC CIDR blocks for your
        # EKS resources, or the block of the Kubernetes service IP range. Each block must have a route to the
        # VPC that uses the VPC CIDR blocks, not public IPs or Elastic IPs. There are many options including
        # Transit Gateway, Site-to-Site VPN, or Direct Connect. Each host must allow outbound connection to
        # the EKS cluster control plane on TCP ports 443 and 10250 . Each host must allow inbound connection
        # from the EKS cluster control plane on TCP port 10250 for logs, exec and port-forward operations.
        # Each host must allow TCP and UDP network connectivity to and from other hosts that are running
        # CoreDNS on UDP port 53 for service and pod DNS names.

        @[JSON::Field(key: "cidrs")]
        getter cidrs : Array(String)?

        def initialize(
          @cidrs : Array(String)? = nil
        )
        end
      end

      # A network CIDR that can contain pods that run Kubernetes webhooks on hybrid nodes. These CIDR blocks
      # are determined by configuring your Container Network Interface (CNI) plugin. We recommend the Calico
      # CNI or Cilium CNI. Note that the Amazon VPC CNI plugin for Kubernetes isn't available for
      # on-premises and edge locations. Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation
      # (for example, 10.2.0.0/16 ). It must satisfy the following requirements: Each block must be within
      # an IPv4 RFC-1918 network range. Minimum allowed size is /32, maximum allowed size is /8.
      # Publicly-routable addresses aren't supported. Each block cannot overlap with the range of the VPC
      # CIDR blocks for your EKS resources, or the block of the Kubernetes service IP range.

      struct RemotePodNetwork
        include JSON::Serializable

        # A network CIDR that can contain pods that run Kubernetes webhooks on hybrid nodes. These CIDR blocks
        # are determined by configuring your Container Network Interface (CNI) plugin. We recommend the Calico
        # CNI or Cilium CNI. Note that the Amazon VPC CNI plugin for Kubernetes isn't available for
        # on-premises and edge locations. Enter one or more IPv4 CIDR blocks in decimal dotted-quad notation
        # (for example, 10.2.0.0/16 ). It must satisfy the following requirements: Each block must be within
        # an IPv4 RFC-1918 network range. Minimum allowed size is /32, maximum allowed size is /8.
        # Publicly-routable addresses aren't supported. Each block cannot overlap with the range of the VPC
        # CIDR blocks for your EKS resources, or the block of the Kubernetes service IP range.

        @[JSON::Field(key: "cidrs")]
        getter cidrs : Array(String)?

        def initialize(
          @cidrs : Array(String)? = nil
        )
        end
      end

      # The specified resource is in use.

      struct ResourceInUseException
        include JSON::Serializable

        # The specified add-on name is in use.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The Amazon EKS message associated with the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon EKS managed node group associated with the exception.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        def initialize(
          @addon_name : String? = nil,
          @cluster_name : String? = nil,
          @message : String? = nil,
          @nodegroup_name : String? = nil
        )
        end
      end

      # You have encountered a service limit on the specified resource.

      struct ResourceLimitExceededException
        include JSON::Serializable

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The Amazon EKS message associated with the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon EKS managed node group associated with the exception.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        # The Amazon EKS subscription ID with the exception.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        def initialize(
          @cluster_name : String? = nil,
          @message : String? = nil,
          @nodegroup_name : String? = nil,
          @subscription_id : String? = nil
        )
        end
      end

      # The specified resource could not be found. You can view your available clusters with ListClusters .
      # You can view your available managed node groups with ListNodegroups . Amazon EKS clusters and node
      # groups are Amazon Web Services Region specific.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The Amazon EKS add-on name associated with the exception.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The Fargate profile associated with the exception.

        @[JSON::Field(key: "fargateProfileName")]
        getter fargate_profile_name : String?

        # The Amazon EKS message associated with the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon EKS managed node group associated with the exception.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        # The Amazon EKS subscription ID with the exception.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        def initialize(
          @addon_name : String? = nil,
          @cluster_name : String? = nil,
          @fargate_profile_name : String? = nil,
          @message : String? = nil,
          @nodegroup_name : String? = nil,
          @subscription_id : String? = nil
        )
        end
      end

      # Required resources (such as service-linked roles) were created and are still propagating. Retry
      # later.

      struct ResourcePropagationDelayException
        include JSON::Serializable

        # Required resources (such as service-linked roles) were created and are still propagating. Retry
        # later.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # These errors are usually caused by a server-side issue.

      struct ServerException
        include JSON::Serializable

        # The Amazon EKS add-on name associated with the exception.

        @[JSON::Field(key: "addonName")]
        getter addon_name : String?

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # These errors are usually caused by a server-side issue.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon EKS managed node group associated with the exception.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        # The Amazon EKS subscription ID with the exception.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        def initialize(
          @addon_name : String? = nil,
          @cluster_name : String? = nil,
          @message : String? = nil,
          @nodegroup_name : String? = nil,
          @subscription_id : String? = nil
        )
        end
      end

      # The service is unavailable. Back off and retry the operation.

      struct ServiceUnavailableException
        include JSON::Serializable

        # The request has failed due to a temporary failure of the server.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An IAM Identity CenterIAM; Identity Center identity (user or group) that can be assigned permissions
      # in a capability.

      struct SsoIdentity
        include JSON::Serializable

        # The unique identifier of the IAM Identity CenterIAM; Identity Center user or group.

        @[JSON::Field(key: "id")]
        getter id : String

        # The type of identity. Valid values are SSO_USER or SSO_GROUP .

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @id : String,
          @type : String
        )
        end
      end


      struct StartInsightsRefreshRequest
        include JSON::Serializable

        # The name of the cluster for the refresh insights operation.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        def initialize(
          @cluster_name : String
        )
        end
      end


      struct StartInsightsRefreshResponse
        include JSON::Serializable

        # The message associated with the insights refresh operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The current status of the insights refresh operation.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Request to update the configuration of the storage capability of your EKS Auto Mode cluster. For
      # example, enable the capability. For more information, see EKS Auto Mode block storage capability in
      # the Amazon EKS User Guide .

      struct StorageConfigRequest
        include JSON::Serializable

        # Request to configure EBS Block Storage settings for your EKS Auto Mode cluster.

        @[JSON::Field(key: "blockStorage")]
        getter block_storage : Types::BlockStorage?

        def initialize(
          @block_storage : Types::BlockStorage? = nil
        )
        end
      end

      # Indicates the status of the request to update the block storage capability of your EKS Auto Mode
      # cluster.

      struct StorageConfigResponse
        include JSON::Serializable

        # Indicates the current configuration of the block storage capability on your EKS Auto Mode cluster.
        # For example, if the capability is enabled or disabled.

        @[JSON::Field(key: "blockStorage")]
        getter block_storage : Types::BlockStorage?

        def initialize(
          @block_storage : Types::BlockStorage? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to add tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Metadata that assists with categorization and organization. Each tag consists of a key and an
        # optional value. You define both. Tags don't propagate to any other cluster or Amazon Web Services
        # resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A property that allows a node to repel a Pod . For more information, see Node taints on managed node
      # groups in the Amazon EKS User Guide .

      struct Taint
        include JSON::Serializable

        # The effect of the taint.

        @[JSON::Field(key: "effect")]
        getter effect : String?

        # The key of the taint.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The value of the taint.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @effect : String? = nil,
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The request or operation couldn't be performed because a service is throttling requests.

      struct ThrottlingException
        include JSON::Serializable

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @cluster_name : String? = nil,
          @message : String? = nil
        )
        end
      end

      # At least one of your specified cluster subnets is in an Availability Zone that does not support
      # Amazon EKS. The exception output specifies the supported Availability Zones for your account, from
      # which you can choose subnets for your cluster.

      struct UnsupportedAvailabilityZoneException
        include JSON::Serializable

        # The Amazon EKS cluster associated with the exception.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # At least one of your specified cluster subnets is in an Availability Zone that does not support
        # Amazon EKS. The exception output specifies the supported Availability Zones for your account, from
        # which you can choose subnets for your cluster.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The Amazon EKS managed node group associated with the exception.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String?

        # The supported Availability Zones for your account. Choose subnets in these Availability Zones for
        # your cluster.

        @[JSON::Field(key: "validZones")]
        getter valid_zones : Array(String)?

        def initialize(
          @cluster_name : String? = nil,
          @message : String? = nil,
          @nodegroup_name : String? = nil,
          @valid_zones : Array(String)? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to delete tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to remove.

        @[JSON::Field(key: "tagKeys")]
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

      # An object representing an asynchronous update.

      struct Update
        include JSON::Serializable

        # The Unix epoch timestamp at object creation.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Any errors associated with a Failed update.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::ErrorDetail)?

        # A UUID that is used to track the update.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A key-value map that contains the parameters associated with the update.

        @[JSON::Field(key: "params")]
        getter params : Array(Types::UpdateParam)?

        # The current status of the update.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the update.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @created_at : Time? = nil,
          @errors : Array(Types::ErrorDetail)? = nil,
          @id : String? = nil,
          @params : Array(Types::UpdateParam)? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The access configuration information for the cluster.

      struct UpdateAccessConfigRequest
        include JSON::Serializable

        # The desired authentication mode for the cluster.

        @[JSON::Field(key: "authenticationMode")]
        getter authentication_mode : String?

        def initialize(
          @authentication_mode : String? = nil
        )
        end
      end


      struct UpdateAccessEntryRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The ARN of the IAM principal for the AccessEntry .

        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The value for name that you've specified for kind: Group as a subject in a Kubernetes RoleBinding or
        # ClusterRoleBinding object. Amazon EKS doesn't confirm that the value for name exists in any bindings
        # on your cluster. You can specify one or more names. Kubernetes authorizes the principalArn of the
        # access entry to access any cluster objects that you've specified in a Kubernetes Role or ClusterRole
        # object that is also specified in a binding's roleRef . For more information about creating
        # Kubernetes RoleBinding , ClusterRoleBinding , Role , or ClusterRole objects, see Using RBAC
        # Authorization in the Kubernetes documentation . If you want Amazon EKS to authorize the principalArn
        # (instead of, or in addition to Kubernetes authorizing the principalArn ), you can associate one or
        # more access policies to the access entry using AssociateAccessPolicy . If you associate any access
        # policies, the principalARN has all permissions assigned in the associated access policies and all
        # permissions in any Kubernetes Role or ClusterRole objects that the group names are bound to.

        @[JSON::Field(key: "kubernetesGroups")]
        getter kubernetes_groups : Array(String)?

        # The username to authenticate to Kubernetes with. We recommend not specifying a username and letting
        # Amazon EKS specify it for you. For more information about the value Amazon EKS specifies for you, or
        # constraints before specifying your own username, see Creating access entries in the Amazon EKS User
        # Guide .

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @cluster_name : String,
          @principal_arn : String,
          @client_request_token : String? = nil,
          @kubernetes_groups : Array(String)? = nil,
          @username : String? = nil
        )
        end
      end


      struct UpdateAccessEntryResponse
        include JSON::Serializable

        # The ARN of the IAM principal for the AccessEntry .

        @[JSON::Field(key: "accessEntry")]
        getter access_entry : Types::AccessEntry?

        def initialize(
          @access_entry : Types::AccessEntry? = nil
        )
        end
      end


      struct UpdateAddonRequest
        include JSON::Serializable

        # The name of the add-on. The name must match one of the names returned by ListAddons .

        @[JSON::Field(key: "addonName")]
        getter addon_name : String

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The version of the add-on. The version must match one of the versions returned by
        # DescribeAddonVersions .

        @[JSON::Field(key: "addonVersion")]
        getter addon_version : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The set of configuration values for the add-on that's created. The values that you provide are
        # validated against the schema returned by DescribeAddonConfiguration .

        @[JSON::Field(key: "configurationValues")]
        getter configuration_values : String?

        # An array of EKS Pod Identity associations to be updated. Each association maps a Kubernetes service
        # account to an IAM role. If this value is left blank, no change. If an empty array is provided,
        # existing associations owned by the add-on are deleted. For more information, see Attach an IAM Role
        # to an Amazon EKS add-on using EKS Pod Identity in the Amazon EKS User Guide .

        @[JSON::Field(key: "podIdentityAssociations")]
        getter pod_identity_associations : Array(Types::AddonPodIdentityAssociations)?

        # How to resolve field value conflicts for an Amazon EKS add-on if you've changed a value from the
        # Amazon EKS default value. Conflicts are handled based on the option you choose: None – Amazon EKS
        # doesn't change the value. The update might fail. Overwrite – Amazon EKS overwrites the changed value
        # back to the Amazon EKS default value. Preserve – Amazon EKS preserves the value. If you choose this
        # option, we recommend that you test any field and value changes on a non-production cluster before
        # updating the add-on on your production cluster.

        @[JSON::Field(key: "resolveConflicts")]
        getter resolve_conflicts : String?

        # The Amazon Resource Name (ARN) of an existing IAM role to bind to the add-on's service account. The
        # role must be assigned the IAM permissions required by the add-on. If you don't specify an existing
        # IAM role, then the add-on uses the permissions assigned to the node IAM role. For more information,
        # see Amazon EKS node IAM role in the Amazon EKS User Guide . To specify an existing IAM role, you
        # must have an IAM OpenID Connect (OIDC) provider created for your cluster. For more information, see
        # Enabling IAM roles for service accounts on your cluster in the Amazon EKS User Guide .

        @[JSON::Field(key: "serviceAccountRoleArn")]
        getter service_account_role_arn : String?

        def initialize(
          @addon_name : String,
          @cluster_name : String,
          @addon_version : String? = nil,
          @client_request_token : String? = nil,
          @configuration_values : String? = nil,
          @pod_identity_associations : Array(Types::AddonPodIdentityAssociations)? = nil,
          @resolve_conflicts : String? = nil,
          @service_account_role_arn : String? = nil
        )
        end
      end


      struct UpdateAddonResponse
        include JSON::Serializable


        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @update : Types::Update? = nil
        )
        end
      end

      # Configuration updates for an Argo CD capability. You only need to specify the fields you want to
      # update.

      struct UpdateArgoCdConfig
        include JSON::Serializable

        # Updated network access configuration for the Argo CD capability's managed API server endpoint. You
        # can add or remove VPC endpoint associations to control which VPCs have private access to the Argo CD
        # server.

        @[JSON::Field(key: "networkAccess")]
        getter network_access : Types::ArgoCdNetworkAccessConfigRequest?

        # Updated RBAC role mappings for the Argo CD capability. You can add, update, or remove role mappings.

        @[JSON::Field(key: "rbacRoleMappings")]
        getter rbac_role_mappings : Types::UpdateRoleMappings?

        def initialize(
          @network_access : Types::ArgoCdNetworkAccessConfigRequest? = nil,
          @rbac_role_mappings : Types::UpdateRoleMappings? = nil
        )
        end
      end

      # Configuration updates for a capability. The structure varies depending on the capability type.

      struct UpdateCapabilityConfiguration
        include JSON::Serializable

        # Configuration updates specific to Argo CD capabilities.

        @[JSON::Field(key: "argoCd")]
        getter argo_cd : Types::UpdateArgoCdConfig?

        def initialize(
          @argo_cd : Types::UpdateArgoCdConfig? = nil
        )
        end
      end


      struct UpdateCapabilityRequest
        include JSON::Serializable

        # The name of the capability to update configuration for.

        @[JSON::Field(key: "capabilityName")]
        getter capability_name : String

        # The name of the Amazon EKS cluster that contains the capability you want to update configuration
        # for.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. This
        # token is valid for 24 hours after creation.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The updated configuration settings for the capability. You only need to specify the configuration
        # parameters you want to change. For Argo CD capabilities, you can update RBAC role mappings and
        # network access settings.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::UpdateCapabilityConfiguration?

        # The updated delete propagation policy for the capability. Currently, the only supported value is
        # RETAIN .

        @[JSON::Field(key: "deletePropagationPolicy")]
        getter delete_propagation_policy : String?

        # The Amazon Resource Name (ARN) of the IAM role that the capability uses to interact with Amazon Web
        # Services services. If you specify a new role ARN, the capability will start using the new role for
        # all subsequent operations.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @capability_name : String,
          @cluster_name : String,
          @client_request_token : String? = nil,
          @configuration : Types::UpdateCapabilityConfiguration? = nil,
          @delete_propagation_policy : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateCapabilityResponse
        include JSON::Serializable


        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @update : Types::Update? = nil
        )
        end
      end


      struct UpdateClusterConfigRequest
        include JSON::Serializable

        # The name of the Amazon EKS cluster to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The access configuration for the cluster.

        @[JSON::Field(key: "accessConfig")]
        getter access_config : Types::UpdateAccessConfigRequest?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Update the configuration of the compute capability of your EKS Auto Mode cluster. For example,
        # enable the capability.

        @[JSON::Field(key: "computeConfig")]
        getter compute_config : Types::ComputeConfigRequest?

        # The control plane scaling tier configuration. For more information, see EKS Provisioned Control
        # Plane in the Amazon EKS User Guide.

        @[JSON::Field(key: "controlPlaneScalingConfig")]
        getter control_plane_scaling_config : Types::ControlPlaneScalingConfig?

        # Specifies whether to enable or disable deletion protection for the cluster. When enabled ( true ),
        # the cluster cannot be deleted until deletion protection is explicitly disabled. When disabled (
        # false ), the cluster can be deleted normally.

        @[JSON::Field(key: "deletionProtection")]
        getter deletion_protection : Bool?


        @[JSON::Field(key: "kubernetesNetworkConfig")]
        getter kubernetes_network_config : Types::KubernetesNetworkConfigRequest?

        # Enable or disable exporting the Kubernetes control plane logs for your cluster to CloudWatch Logs .
        # By default, cluster control plane logs aren't exported to CloudWatch Logs . For more information,
        # see Amazon EKS cluster control plane logs in the Amazon EKS User Guide . CloudWatch Logs ingestion,
        # archive storage, and data scanning rates apply to exported control plane logs. For more information,
        # see CloudWatch Pricing .

        @[JSON::Field(key: "logging")]
        getter logging : Types::Logging?


        @[JSON::Field(key: "remoteNetworkConfig")]
        getter remote_network_config : Types::RemoteNetworkConfigRequest?


        @[JSON::Field(key: "resourcesVpcConfig")]
        getter resources_vpc_config : Types::VpcConfigRequest?

        # Update the configuration of the block storage capability of your EKS Auto Mode cluster. For example,
        # enable the capability.

        @[JSON::Field(key: "storageConfig")]
        getter storage_config : Types::StorageConfigRequest?

        # You can enable or disable extended support for clusters currently on standard support. You cannot
        # disable extended support once it starts. You must enable extended support before your cluster exits
        # standard support.

        @[JSON::Field(key: "upgradePolicy")]
        getter upgrade_policy : Types::UpgradePolicyRequest?

        # Enable or disable ARC zonal shift for the cluster. If zonal shift is enabled, Amazon Web Services
        # configures zonal autoshift for the cluster. Zonal shift is a feature of Amazon Application Recovery
        # Controller (ARC). ARC zonal shift is designed to be a temporary measure that allows you to move
        # traffic for a resource away from an impaired AZ until the zonal shift expires or you cancel it. You
        # can extend the zonal shift if necessary. You can start a zonal shift for an EKS cluster, or you can
        # allow Amazon Web Services to do it for you by enabling zonal autoshift . This shift updates the flow
        # of east-to-west network traffic in your cluster to only consider network endpoints for Pods running
        # on worker nodes in healthy AZs. Additionally, any ALB or NLB handling ingress traffic for
        # applications in your EKS cluster will automatically route traffic to targets in the healthy AZs. For
        # more information about zonal shift in EKS, see Learn about Amazon Application Recovery Controller
        # (ARC) Zonal Shift in Amazon EKS in the Amazon EKS User Guide .

        @[JSON::Field(key: "zonalShiftConfig")]
        getter zonal_shift_config : Types::ZonalShiftConfigRequest?

        def initialize(
          @name : String,
          @access_config : Types::UpdateAccessConfigRequest? = nil,
          @client_request_token : String? = nil,
          @compute_config : Types::ComputeConfigRequest? = nil,
          @control_plane_scaling_config : Types::ControlPlaneScalingConfig? = nil,
          @deletion_protection : Bool? = nil,
          @kubernetes_network_config : Types::KubernetesNetworkConfigRequest? = nil,
          @logging : Types::Logging? = nil,
          @remote_network_config : Types::RemoteNetworkConfigRequest? = nil,
          @resources_vpc_config : Types::VpcConfigRequest? = nil,
          @storage_config : Types::StorageConfigRequest? = nil,
          @upgrade_policy : Types::UpgradePolicyRequest? = nil,
          @zonal_shift_config : Types::ZonalShiftConfigRequest? = nil
        )
        end
      end


      struct UpdateClusterConfigResponse
        include JSON::Serializable


        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @update : Types::Update? = nil
        )
        end
      end


      struct UpdateClusterVersionRequest
        include JSON::Serializable

        # The name of the Amazon EKS cluster to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The desired Kubernetes version following a successful update.

        @[JSON::Field(key: "version")]
        getter version : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Set this value to true to override upgrade-blocking readiness checks when updating a cluster.

        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @name : String,
          @version : String,
          @client_request_token : String? = nil,
          @force : Bool? = nil
        )
        end
      end


      struct UpdateClusterVersionResponse
        include JSON::Serializable

        # The full description of the specified update

        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @update : Types::Update? = nil
        )
        end
      end


      struct UpdateEksAnywhereSubscriptionRequest
        include JSON::Serializable

        # A boolean indicating whether or not to automatically renew the subscription.

        @[JSON::Field(key: "autoRenew")]
        getter auto_renew : Bool

        # The ID of the subscription.

        @[JSON::Field(key: "id")]
        getter id : String

        # Unique, case-sensitive identifier to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @auto_renew : Bool,
          @id : String,
          @client_request_token : String? = nil
        )
        end
      end


      struct UpdateEksAnywhereSubscriptionResponse
        include JSON::Serializable

        # The full description of the updated subscription.

        @[JSON::Field(key: "subscription")]
        getter subscription : Types::EksAnywhereSubscription?

        def initialize(
          @subscription : Types::EksAnywhereSubscription? = nil
        )
        end
      end

      # An object representing a Kubernetes label change for a managed node group.

      struct UpdateLabelsPayload
        include JSON::Serializable

        # The Kubernetes labels to add or update.

        @[JSON::Field(key: "addOrUpdateLabels")]
        getter add_or_update_labels : Hash(String, String)?

        # The Kubernetes labels to remove.

        @[JSON::Field(key: "removeLabels")]
        getter remove_labels : Array(String)?

        def initialize(
          @add_or_update_labels : Hash(String, String)? = nil,
          @remove_labels : Array(String)? = nil
        )
        end
      end


      struct UpdateNodegroupConfigRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The name of the managed node group to update.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The Kubernetes labels to apply to the nodes in the node group after the update.

        @[JSON::Field(key: "labels")]
        getter labels : Types::UpdateLabelsPayload?

        # The node auto repair configuration for the node group.

        @[JSON::Field(key: "nodeRepairConfig")]
        getter node_repair_config : Types::NodeRepairConfig?

        # The scaling configuration details for the Auto Scaling group after the update.

        @[JSON::Field(key: "scalingConfig")]
        getter scaling_config : Types::NodegroupScalingConfig?

        # The Kubernetes taints to be applied to the nodes in the node group after the update. For more
        # information, see Node taints on managed node groups .

        @[JSON::Field(key: "taints")]
        getter taints : Types::UpdateTaintsPayload?

        # The node group update configuration.

        @[JSON::Field(key: "updateConfig")]
        getter update_config : Types::NodegroupUpdateConfig?

        def initialize(
          @cluster_name : String,
          @nodegroup_name : String,
          @client_request_token : String? = nil,
          @labels : Types::UpdateLabelsPayload? = nil,
          @node_repair_config : Types::NodeRepairConfig? = nil,
          @scaling_config : Types::NodegroupScalingConfig? = nil,
          @taints : Types::UpdateTaintsPayload? = nil,
          @update_config : Types::NodegroupUpdateConfig? = nil
        )
        end
      end


      struct UpdateNodegroupConfigResponse
        include JSON::Serializable


        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @update : Types::Update? = nil
        )
        end
      end


      struct UpdateNodegroupVersionRequest
        include JSON::Serializable

        # The name of your cluster.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # The name of the managed node group to update.

        @[JSON::Field(key: "nodegroupName")]
        getter nodegroup_name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Force the update if any Pod on the existing node group can't be drained due to a Pod disruption
        # budget issue. If an update fails because all Pods can't be drained, you can force the update after
        # it fails to terminate the old node whether or not any Pod is running on the node.

        @[JSON::Field(key: "force")]
        getter force : Bool?

        # An object representing a node group's launch template specification. You can only update a node
        # group using a launch template if the node group was originally deployed with a launch template. When
        # updating, you must specify the same launch template ID or name that was used to create the node
        # group.

        @[JSON::Field(key: "launchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # The AMI version of the Amazon EKS optimized AMI to use for the update. By default, the latest
        # available AMI version for the node group's Kubernetes version is used. For information about Linux
        # versions, see Amazon EKS optimized Amazon Linux AMI versions in the Amazon EKS User Guide . Amazon
        # EKS managed node groups support the November 2022 and later releases of the Windows AMIs. For
        # information about Windows versions, see Amazon EKS optimized Windows AMI versions in the Amazon EKS
        # User Guide . If you specify launchTemplate , and your launch template uses a custom AMI, then don't
        # specify releaseVersion , or the node group update will fail. For more information about using launch
        # templates with Amazon EKS, see Customizing managed nodes with launch templates in the Amazon EKS
        # User Guide .

        @[JSON::Field(key: "releaseVersion")]
        getter release_version : String?

        # The Kubernetes version to update to. If no version is specified, then the node group will be updated
        # to match the cluster's current Kubernetes version, and the latest available AMI for that version
        # will be used. You can also specify the Kubernetes version of the cluster to update the node group to
        # the latest AMI version of the cluster's Kubernetes version. If you specify launchTemplate , and your
        # launch template uses a custom AMI, then don't specify version , or the node group update will fail.
        # For more information about using launch templates with Amazon EKS, see Customizing managed nodes
        # with launch templates in the Amazon EKS User Guide .

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @cluster_name : String,
          @nodegroup_name : String,
          @client_request_token : String? = nil,
          @force : Bool? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @release_version : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdateNodegroupVersionResponse
        include JSON::Serializable


        @[JSON::Field(key: "update")]
        getter update : Types::Update?

        def initialize(
          @update : Types::Update? = nil
        )
        end
      end

      # An object representing the details of an update request.

      struct UpdateParam
        include JSON::Serializable

        # The keys associated with an update request.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The value of the keys submitted as part of an update request.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct UpdatePodIdentityAssociationRequest
        include JSON::Serializable

        # The ID of the association to be updated.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The name of the cluster that you want to update the association in.

        @[JSON::Field(key: "name")]
        getter cluster_name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Disable the automatic sessions tags that are appended by EKS Pod Identity. EKS Pod Identity adds a
        # pre-defined set of session tags when it assumes the role. You can use these tags to author a single
        # role that can work across resources by allowing access to Amazon Web Services resources based on
        # matching tags. By default, EKS Pod Identity attaches six tags, including tags for cluster name,
        # namespace, and service account name. For the list of tags added by EKS Pod Identity, see List of
        # session tags added by EKS Pod Identity in the Amazon EKS User Guide . Amazon Web Services compresses
        # inline session policies, managed policy ARNs, and session tags into a packed binary format that has
        # a separate limit. If you receive a PackedPolicyTooLarge error indicating the packed binary format
        # has exceeded the size limit, you can attempt to reduce the size by disabling the session tags added
        # by EKS Pod Identity.

        @[JSON::Field(key: "disableSessionTags")]
        getter disable_session_tags : Bool?

        # The new IAM role to change in the association.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The Amazon Resource Name (ARN) of the target IAM role to associate with the service account. This
        # role is assumed by using the EKS Pod Identity association role, then the credentials for this role
        # are injected into the Pod. When you run applications on Amazon EKS, your application might need to
        # access Amazon Web Services resources from a different role that exists in the same or different
        # Amazon Web Services account. For example, your application running in “Account A” might need to
        # access resources, such as buckets in “Account B” or within “Account A” itself. You can create a
        # association to access Amazon Web Services resources in “Account B” by creating two IAM roles: a role
        # in “Account A” and a role in “Account B” (which can be the same or different account), each with the
        # necessary trust and permission policies. After you provide these roles in the IAM role and Target
        # IAM role fields, EKS will perform role chaining to ensure your application gets the required
        # permissions. This means Role A will assume Role B, allowing your Pods to securely access resources
        # like S3 buckets in the target account.

        @[JSON::Field(key: "targetRoleArn")]
        getter target_role_arn : String?

        def initialize(
          @association_id : String,
          @cluster_name : String,
          @client_request_token : String? = nil,
          @disable_session_tags : Bool? = nil,
          @role_arn : String? = nil,
          @target_role_arn : String? = nil
        )
        end
      end


      struct UpdatePodIdentityAssociationResponse
        include JSON::Serializable

        # The full description of the association that was updated.

        @[JSON::Field(key: "association")]
        getter association : Types::PodIdentityAssociation?

        def initialize(
          @association : Types::PodIdentityAssociation? = nil
        )
        end
      end

      # Updates to RBAC role mappings for an Argo CD capability. You can add, update, or remove role
      # mappings in a single operation.

      struct UpdateRoleMappings
        include JSON::Serializable

        # A list of role mappings to add or update. If a mapping for the specified role already exists, it
        # will be updated with the new identities. If it doesn't exist, a new mapping will be created.

        @[JSON::Field(key: "addOrUpdateRoleMappings")]
        getter add_or_update_role_mappings : Array(Types::ArgoCdRoleMapping)?

        # A list of role mappings to remove from the RBAC configuration. Each mapping specifies an Argo CD
        # role ( ADMIN , EDITOR , or VIEWER ) and the identities to remove from that role.

        @[JSON::Field(key: "removeRoleMappings")]
        getter remove_role_mappings : Array(Types::ArgoCdRoleMapping)?

        def initialize(
          @add_or_update_role_mappings : Array(Types::ArgoCdRoleMapping)? = nil,
          @remove_role_mappings : Array(Types::ArgoCdRoleMapping)? = nil
        )
        end
      end

      # An object representing the details of an update to a taints payload. For more information, see Node
      # taints on managed node groups in the Amazon EKS User Guide .

      struct UpdateTaintsPayload
        include JSON::Serializable

        # Kubernetes taints to be added or updated.

        @[JSON::Field(key: "addOrUpdateTaints")]
        getter add_or_update_taints : Array(Types::Taint)?

        # Kubernetes taints to remove.

        @[JSON::Field(key: "removeTaints")]
        getter remove_taints : Array(Types::Taint)?

        def initialize(
          @add_or_update_taints : Array(Types::Taint)? = nil,
          @remove_taints : Array(Types::Taint)? = nil
        )
        end
      end

      # The support policy to use for the cluster. Extended support allows you to remain on specific
      # Kubernetes versions for longer. Clusters in extended support have higher costs. The default value is
      # EXTENDED . Use STANDARD to disable extended support. Learn more about EKS Extended Support in the
      # Amazon EKS User Guide .

      struct UpgradePolicyRequest
        include JSON::Serializable

        # If the cluster is set to EXTENDED , it will enter extended support at the end of standard support.
        # If the cluster is set to STANDARD , it will be automatically upgraded at the end of standard
        # support. Learn more about EKS Extended Support in the Amazon EKS User Guide .

        @[JSON::Field(key: "supportType")]
        getter support_type : String?

        def initialize(
          @support_type : String? = nil
        )
        end
      end

      # This value indicates if extended support is enabled or disabled for the cluster. Learn more about
      # EKS Extended Support in the Amazon EKS User Guide .

      struct UpgradePolicyResponse
        include JSON::Serializable

        # If the cluster is set to EXTENDED , it will enter extended support at the end of standard support.
        # If the cluster is set to STANDARD , it will be automatically upgraded at the end of standard
        # support. Learn more about EKS Extended Support in the Amazon EKS User Guide .

        @[JSON::Field(key: "supportType")]
        getter support_type : String?

        def initialize(
          @support_type : String? = nil
        )
        end
      end

      # An object representing the VPC configuration to use for an Amazon EKS cluster.

      struct VpcConfigRequest
        include JSON::Serializable

        # Set this value to true to enable private access for your cluster's Kubernetes API server endpoint.
        # If you enable private access, Kubernetes API requests from within your cluster's VPC use the private
        # VPC endpoint. The default value for this parameter is false , which disables private access for your
        # Kubernetes API server. If you disable private access and you have nodes or Fargate pods in the
        # cluster, then ensure that publicAccessCidrs includes the necessary CIDR blocks for communication
        # with the nodes or Fargate pods. For more information, see Cluster API server endpoint in the Amazon
        # EKS User Guide .

        @[JSON::Field(key: "endpointPrivateAccess")]
        getter endpoint_private_access : Bool?

        # Set this value to false to disable public access to your cluster's Kubernetes API server endpoint.
        # If you disable public access, your cluster's Kubernetes API server can only receive requests from
        # within the cluster VPC. The default value for this parameter is true , which enables public access
        # for your Kubernetes API server. The endpoint domain name and IP address family depends on the value
        # of the ipFamily for the cluster. For more information, see Cluster API server endpoint in the Amazon
        # EKS User Guide .

        @[JSON::Field(key: "endpointPublicAccess")]
        getter endpoint_public_access : Bool?

        # The CIDR blocks that are allowed access to your cluster's public Kubernetes API server endpoint.
        # Communication to the endpoint from addresses outside of the CIDR blocks that you specify is denied.
        # The default value is 0.0.0.0/0 and additionally ::/0 for dual-stack `IPv6` clusters. If you've
        # disabled private endpoint access, make sure that you specify the necessary CIDR blocks for every
        # node and Fargate Pod in the cluster. For more information, see Cluster API server endpoint in the
        # Amazon EKS User Guide . Note that the public endpoints are dual-stack for only IPv6 clusters that
        # are made after October 2024. You can't add IPv6 CIDR blocks to IPv4 clusters or IPv6 clusters that
        # were made before October 2024.

        @[JSON::Field(key: "publicAccessCidrs")]
        getter public_access_cidrs : Array(String)?

        # Specify one or more security groups for the cross-account elastic network interfaces that Amazon EKS
        # creates to use that allow communication between your nodes and the Kubernetes control plane. If you
        # don't specify any security groups, then familiarize yourself with the difference between Amazon EKS
        # defaults for clusters deployed with Kubernetes. For more information, see Amazon EKS security group
        # considerations in the Amazon EKS User Guide .

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # Specify subnets for your Amazon EKS nodes. Amazon EKS creates cross-account elastic network
        # interfaces in these subnets to allow communication between your nodes and the Kubernetes control
        # plane.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @endpoint_private_access : Bool? = nil,
          @endpoint_public_access : Bool? = nil,
          @public_access_cidrs : Array(String)? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # An object representing an Amazon EKS cluster VPC configuration response.

      struct VpcConfigResponse
        include JSON::Serializable

        # The cluster security group that was created by Amazon EKS for the cluster. Managed node groups use
        # this security group for control-plane-to-data-plane communication.

        @[JSON::Field(key: "clusterSecurityGroupId")]
        getter cluster_security_group_id : String?

        # This parameter indicates whether the Amazon EKS private API server endpoint is enabled. If the
        # Amazon EKS private API server endpoint is enabled, Kubernetes API requests that originate from
        # within your cluster's VPC use the private VPC endpoint instead of traversing the internet. If this
        # value is disabled and you have nodes or Fargate pods in the cluster, then ensure that
        # publicAccessCidrs includes the necessary CIDR blocks for communication with the nodes or Fargate
        # pods. For more information, see Cluster API server endpoint in the Amazon EKS User Guide .

        @[JSON::Field(key: "endpointPrivateAccess")]
        getter endpoint_private_access : Bool?

        # Whether the public API server endpoint is enabled.

        @[JSON::Field(key: "endpointPublicAccess")]
        getter endpoint_public_access : Bool?

        # The CIDR blocks that are allowed access to your cluster's public Kubernetes API server endpoint.
        # Communication to the endpoint from addresses outside of the CIDR blocks that you specify is denied.
        # The default value is 0.0.0.0/0 and additionally ::/0 for dual-stack `IPv6` clusters. If you've
        # disabled private endpoint access, make sure that you specify the necessary CIDR blocks for every
        # node and Fargate Pod in the cluster. For more information, see Cluster API server endpoint in the
        # Amazon EKS User Guide . Note that the public endpoints are dual-stack for only IPv6 clusters that
        # are made after October 2024. You can't add IPv6 CIDR blocks to IPv4 clusters or IPv6 clusters that
        # were made before October 2024.

        @[JSON::Field(key: "publicAccessCidrs")]
        getter public_access_cidrs : Array(String)?

        # The security groups associated with the cross-account elastic network interfaces that are used to
        # allow communication between your nodes and the Kubernetes control plane.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The subnets associated with your cluster.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The VPC associated with your cluster.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @cluster_security_group_id : String? = nil,
          @endpoint_private_access : Bool? = nil,
          @endpoint_public_access : Bool? = nil,
          @public_access_cidrs : Array(String)? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The configuration for zonal shift for the cluster.

      struct ZonalShiftConfigRequest
        include JSON::Serializable

        # If zonal shift is enabled, Amazon Web Services configures zonal autoshift for the cluster.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # The status of zonal shift configuration for the cluster

      struct ZonalShiftConfigResponse
        include JSON::Serializable

        # Whether the zonal shift is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end
    end
  end
end
