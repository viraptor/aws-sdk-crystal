require "json"
require "time"

module Aws
  module Grafana
    module Types

      # You do not have sufficient permissions to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A structure that defines which attributes in the IdP assertion are to be used to define information
      # about the users authenticated by the IdP to use the workspace.

      struct AssertionAttributes
        include JSON::Serializable

        # The name of the attribute within the SAML assertion to use as the email names for SAML users.

        @[JSON::Field(key: "email")]
        getter email : String?

        # The name of the attribute within the SAML assertion to use as the user full "friendly" names for
        # user groups.

        @[JSON::Field(key: "groups")]
        getter groups : String?

        # The name of the attribute within the SAML assertion to use as the login names for SAML users.

        @[JSON::Field(key: "login")]
        getter login : String?

        # The name of the attribute within the SAML assertion to use as the user full "friendly" names for
        # SAML users.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The name of the attribute within the SAML assertion to use as the user full "friendly" names for the
        # users' organizations.

        @[JSON::Field(key: "org")]
        getter org : String?

        # The name of the attribute within the SAML assertion to use as the user roles.

        @[JSON::Field(key: "role")]
        getter role : String?

        def initialize(
          @email : String? = nil,
          @groups : String? = nil,
          @login : String? = nil,
          @name : String? = nil,
          @org : String? = nil,
          @role : String? = nil
        )
        end
      end


      struct AssociateLicenseRequest
        include JSON::Serializable

        # The type of license to associate with the workspace. Amazon Managed Grafana workspaces no longer
        # support Grafana Enterprise free trials.

        @[JSON::Field(key: "licenseType")]
        getter license_type : String

        # The ID of the workspace to associate the license with.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # A token from Grafana Labs that ties your Amazon Web Services account with a Grafana Labs account.
        # For more information, see Link your account with Grafana Labs .

        @[JSON::Field(key: "Grafana-Token")]
        getter grafana_token : String?

        def initialize(
          @license_type : String,
          @workspace_id : String,
          @grafana_token : String? = nil
        )
        end
      end


      struct AssociateLicenseResponse
        include JSON::Serializable

        # A structure containing data about the workspace.

        @[JSON::Field(key: "workspace")]
        getter workspace : Types::WorkspaceDescription

        def initialize(
          @workspace : Types::WorkspaceDescription
        )
        end
      end

      # A structure containing information about the user authentication methods used by the workspace.

      struct AuthenticationDescription
        include JSON::Serializable

        # Specifies whether this workspace uses IAM Identity Center, SAML, or both methods to authenticate
        # users to use the Grafana console in the Amazon Managed Grafana workspace.

        @[JSON::Field(key: "providers")]
        getter providers : Array(String)

        # A structure containing information about how this workspace works with IAM Identity Center.

        @[JSON::Field(key: "awsSso")]
        getter aws_sso : Types::AwsSsoAuthentication?

        # A structure containing information about how this workspace works with SAML, including what
        # attributes within the assertion are to be mapped to user information in the workspace.

        @[JSON::Field(key: "saml")]
        getter saml : Types::SamlAuthentication?

        def initialize(
          @providers : Array(String),
          @aws_sso : Types::AwsSsoAuthentication? = nil,
          @saml : Types::SamlAuthentication? = nil
        )
        end
      end

      # A structure that describes whether the workspace uses SAML, IAM Identity Center, or both methods for
      # user authentication, and whether that authentication is fully configured.

      struct AuthenticationSummary
        include JSON::Serializable

        # Specifies whether the workspace uses SAML, IAM Identity Center, or both methods for user
        # authentication.

        @[JSON::Field(key: "providers")]
        getter providers : Array(String)

        # Specifies whether the workplace's user authentication method is fully configured.

        @[JSON::Field(key: "samlConfigurationStatus")]
        getter saml_configuration_status : String?

        def initialize(
          @providers : Array(String),
          @saml_configuration_status : String? = nil
        )
        end
      end

      # A structure containing information about how this workspace works with IAM Identity Center.

      struct AwsSsoAuthentication
        include JSON::Serializable

        # The ID of the IAM Identity Center-managed application that is created by Amazon Managed Grafana.

        @[JSON::Field(key: "ssoClientId")]
        getter sso_client_id : String?

        def initialize(
          @sso_client_id : String? = nil
        )
        end
      end

      # A resource was in an inconsistent state during an update or a deletion.

      struct ConflictException
        include JSON::Serializable

        # A description of the error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource that is associated with the error.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that is associated with the error.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct CreateWorkspaceApiKeyRequest
        include JSON::Serializable

        # Specifies the name of the key. Keynames must be unique to the workspace.

        @[JSON::Field(key: "keyName")]
        getter key_name : String

        # Specifies the permission level of the key. Valid values: ADMIN | EDITOR | VIEWER

        @[JSON::Field(key: "keyRole")]
        getter key_role : String

        # Specifies the time in seconds until the key expires. Keys can be valid for up to 30 days.

        @[JSON::Field(key: "secondsToLive")]
        getter seconds_to_live : Int32

        # The ID of the workspace to create an API key.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @key_name : String,
          @key_role : String,
          @seconds_to_live : Int32,
          @workspace_id : String
        )
        end
      end


      struct CreateWorkspaceApiKeyResponse
        include JSON::Serializable

        # The key token. Use this value as a bearer token to authenticate HTTP requests to the workspace.

        @[JSON::Field(key: "key")]
        getter key : String

        # The name of the key that was created.

        @[JSON::Field(key: "keyName")]
        getter key_name : String

        # The ID of the workspace that the key is valid for.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @key : String,
          @key_name : String,
          @workspace_id : String
        )
        end
      end


      struct CreateWorkspaceRequest
        include JSON::Serializable

        # Specifies whether the workspace can access Amazon Web Services resources in this Amazon Web Services
        # account only, or whether it can also access Amazon Web Services resources in other accounts in the
        # same organization. If you specify ORGANIZATION , you must specify which organizational units the
        # workspace can access in the workspaceOrganizationalUnits parameter.

        @[JSON::Field(key: "accountAccessType")]
        getter account_access_type : String

        # Specifies whether this workspace uses SAML 2.0, IAM Identity Center, or both to authenticate users
        # for using the Grafana console within a workspace. For more information, see User authentication in
        # Amazon Managed Grafana .

        @[JSON::Field(key: "authenticationProviders")]
        getter authentication_providers : Array(String)

        # When creating a workspace through the Amazon Web Services API, CLI or Amazon Web Services
        # CloudFormation, you must manage IAM roles and provision the permissions that the workspace needs to
        # use Amazon Web Services data sources and notification channels. You must also specify a
        # workspaceRoleArn for a role that you will manage for the workspace to use when accessing those
        # datasources and notification channels. The ability for Amazon Managed Grafana to create and update
        # IAM roles on behalf of the user is supported only in the Amazon Managed Grafana console, where this
        # value may be set to SERVICE_MANAGED . Use only the CUSTOMER_MANAGED permission type when creating a
        # workspace with the API, CLI or Amazon Web Services CloudFormation. For more information, see Amazon
        # Managed Grafana permissions and policies for Amazon Web Services data sources and notification
        # channels .

        @[JSON::Field(key: "permissionType")]
        getter permission_type : String

        # A unique, case-sensitive, user-provided identifier to ensure the idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration string for the workspace that you create. For more information about the format
        # and configuration options available, see Working in your Grafana workspace .

        @[JSON::Field(key: "configuration")]
        getter configuration : String?

        # Specifies the version of Grafana to support in the new workspace. If not specified, defaults to the
        # latest version (for example, 10.4). To get a list of supported versions, use the ListVersions
        # operation.

        @[JSON::Field(key: "grafanaVersion")]
        getter grafana_version : String?

        # Configuration for network access to your workspace. When this is configured, only listed IP
        # addresses and VPC endpoints will be able to access your workspace. Standard Grafana authentication
        # and authorization will still be required. If this is not configured, or is removed, then all IP
        # addresses and VPC endpoints will be allowed. Standard Grafana authentication and authorization will
        # still be required.

        @[JSON::Field(key: "networkAccessControl")]
        getter network_access_control : Types::NetworkAccessConfiguration?

        # The name of an IAM role that already exists to use with Organizations to access Amazon Web Services
        # data sources and notification channels in other accounts in an organization.

        @[JSON::Field(key: "organizationRoleName")]
        getter organization_role_name : String?

        # The name of the CloudFormation stack set to use to generate IAM roles to be used for this workspace.

        @[JSON::Field(key: "stackSetName")]
        getter stack_set_name : String?

        # The list of tags associated with the workspace.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The configuration settings for an Amazon VPC that contains data sources for your Grafana workspace
        # to connect to. Connecting to a private VPC is not yet available in the Asia Pacific (Seoul) Region
        # (ap-northeast-2).

        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        # This parameter is for internal use only, and should not be used.

        @[JSON::Field(key: "workspaceDataSources")]
        getter workspace_data_sources : Array(String)?

        # A description for the workspace. This is used only to help you identify this workspace. Pattern:
        # ^[\\p{L}\\p{Z}\\p{N}\\p{P}]{0,2048}$

        @[JSON::Field(key: "workspaceDescription")]
        getter workspace_description : String?

        # The name for the workspace. It does not have to be unique.

        @[JSON::Field(key: "workspaceName")]
        getter workspace_name : String?

        # Specify the Amazon Web Services notification channels that you plan to use in this workspace.
        # Specifying these data sources here enables Amazon Managed Grafana to create IAM roles and
        # permissions that allow Amazon Managed Grafana to use these channels.

        @[JSON::Field(key: "workspaceNotificationDestinations")]
        getter workspace_notification_destinations : Array(String)?

        # Specifies the organizational units that this workspace is allowed to use data sources from, if this
        # workspace is in an account that is part of an organization.

        @[JSON::Field(key: "workspaceOrganizationalUnits")]
        getter workspace_organizational_units : Array(String)?

        # Specified the IAM role that grants permissions to the Amazon Web Services resources that the
        # workspace will view data from, including both data sources and notification channels. You are
        # responsible for managing the permissions for this role as new data sources or notification channels
        # are added.

        @[JSON::Field(key: "workspaceRoleArn")]
        getter workspace_role_arn : String?

        def initialize(
          @account_access_type : String,
          @authentication_providers : Array(String),
          @permission_type : String,
          @client_token : String? = nil,
          @configuration : String? = nil,
          @grafana_version : String? = nil,
          @network_access_control : Types::NetworkAccessConfiguration? = nil,
          @organization_role_name : String? = nil,
          @stack_set_name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil,
          @workspace_data_sources : Array(String)? = nil,
          @workspace_description : String? = nil,
          @workspace_name : String? = nil,
          @workspace_notification_destinations : Array(String)? = nil,
          @workspace_organizational_units : Array(String)? = nil,
          @workspace_role_arn : String? = nil
        )
        end
      end


      struct CreateWorkspaceResponse
        include JSON::Serializable

        # A structure containing data about the workspace that was created.

        @[JSON::Field(key: "workspace")]
        getter workspace : Types::WorkspaceDescription

        def initialize(
          @workspace : Types::WorkspaceDescription
        )
        end
      end


      struct CreateWorkspaceServiceAccountRequest
        include JSON::Serializable

        # The permission level to use for this service account. For more information about the roles and the
        # permissions each has, see User roles in the Amazon Managed Grafana User Guide .

        @[JSON::Field(key: "grafanaRole")]
        getter grafana_role : String

        # A name for the service account. The name must be unique within the workspace, as it determines the
        # ID associated with the service account.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the workspace within which to create the service account.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @grafana_role : String,
          @name : String,
          @workspace_id : String
        )
        end
      end


      struct CreateWorkspaceServiceAccountResponse
        include JSON::Serializable

        # The permission level given to the service account.

        @[JSON::Field(key: "grafanaRole")]
        getter grafana_role : String

        # The ID of the service account.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the service account.

        @[JSON::Field(key: "name")]
        getter name : String

        # The workspace with which the service account is associated.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @grafana_role : String,
          @id : String,
          @name : String,
          @workspace_id : String
        )
        end
      end


      struct CreateWorkspaceServiceAccountTokenRequest
        include JSON::Serializable

        # A name for the token to create.

        @[JSON::Field(key: "name")]
        getter name : String

        # Sets how long the token will be valid, in seconds. You can set the time up to 30 days in the future.

        @[JSON::Field(key: "secondsToLive")]
        getter seconds_to_live : Int32

        # The ID of the service account for which to create a token.

        @[JSON::Field(key: "serviceAccountId")]
        getter service_account_id : String

        # The ID of the workspace the service account resides within.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @name : String,
          @seconds_to_live : Int32,
          @service_account_id : String,
          @workspace_id : String
        )
        end
      end


      struct CreateWorkspaceServiceAccountTokenResponse
        include JSON::Serializable

        # The ID of the service account where the token was created.

        @[JSON::Field(key: "serviceAccountId")]
        getter service_account_id : String

        # Information about the created token, including the key. Be sure to store the key securely.

        @[JSON::Field(key: "serviceAccountToken")]
        getter service_account_token : Types::ServiceAccountTokenSummaryWithKey

        # The ID of the workspace where the token was created.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @service_account_id : String,
          @service_account_token : Types::ServiceAccountTokenSummaryWithKey,
          @workspace_id : String
        )
        end
      end


      struct DeleteWorkspaceApiKeyRequest
        include JSON::Serializable

        # The name of the API key to delete.

        @[JSON::Field(key: "keyName")]
        getter key_name : String

        # The ID of the workspace to delete.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @key_name : String,
          @workspace_id : String
        )
        end
      end


      struct DeleteWorkspaceApiKeyResponse
        include JSON::Serializable

        # The name of the key that was deleted.

        @[JSON::Field(key: "keyName")]
        getter key_name : String

        # The ID of the workspace where the key was deleted.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @key_name : String,
          @workspace_id : String
        )
        end
      end


      struct DeleteWorkspaceRequest
        include JSON::Serializable

        # The ID of the workspace to delete.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end


      struct DeleteWorkspaceResponse
        include JSON::Serializable

        # A structure containing information about the workspace that was deleted.

        @[JSON::Field(key: "workspace")]
        getter workspace : Types::WorkspaceDescription

        def initialize(
          @workspace : Types::WorkspaceDescription
        )
        end
      end


      struct DeleteWorkspaceServiceAccountRequest
        include JSON::Serializable

        # The ID of the service account to delete.

        @[JSON::Field(key: "serviceAccountId")]
        getter service_account_id : String

        # The ID of the workspace where the service account resides.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @service_account_id : String,
          @workspace_id : String
        )
        end
      end


      struct DeleteWorkspaceServiceAccountResponse
        include JSON::Serializable

        # The ID of the service account deleted.

        @[JSON::Field(key: "serviceAccountId")]
        getter service_account_id : String

        # The ID of the workspace where the service account was deleted.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @service_account_id : String,
          @workspace_id : String
        )
        end
      end


      struct DeleteWorkspaceServiceAccountTokenRequest
        include JSON::Serializable

        # The ID of the service account from which to delete the token.

        @[JSON::Field(key: "serviceAccountId")]
        getter service_account_id : String

        # The ID of the token to delete.

        @[JSON::Field(key: "tokenId")]
        getter token_id : String

        # The ID of the workspace from which to delete the token.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @service_account_id : String,
          @token_id : String,
          @workspace_id : String
        )
        end
      end


      struct DeleteWorkspaceServiceAccountTokenResponse
        include JSON::Serializable

        # The ID of the service account where the token was deleted.

        @[JSON::Field(key: "serviceAccountId")]
        getter service_account_id : String

        # The ID of the token that was deleted.

        @[JSON::Field(key: "tokenId")]
        getter token_id : String

        # The ID of the workspace where the token was deleted.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @service_account_id : String,
          @token_id : String,
          @workspace_id : String
        )
        end
      end


      struct DescribeWorkspaceAuthenticationRequest
        include JSON::Serializable

        # The ID of the workspace to return authentication information about.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end


      struct DescribeWorkspaceAuthenticationResponse
        include JSON::Serializable

        # A structure containing information about the authentication methods used in the workspace.

        @[JSON::Field(key: "authentication")]
        getter authentication : Types::AuthenticationDescription

        def initialize(
          @authentication : Types::AuthenticationDescription
        )
        end
      end


      struct DescribeWorkspaceConfigurationRequest
        include JSON::Serializable

        # The ID of the workspace to get configuration information for.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end


      struct DescribeWorkspaceConfigurationResponse
        include JSON::Serializable

        # The configuration string for the workspace that you requested. For more information about the format
        # and configuration options available, see Working in your Grafana workspace .

        @[JSON::Field(key: "configuration")]
        getter configuration : String

        # The supported Grafana version for the workspace.

        @[JSON::Field(key: "grafanaVersion")]
        getter grafana_version : String?

        def initialize(
          @configuration : String,
          @grafana_version : String? = nil
        )
        end
      end


      struct DescribeWorkspaceRequest
        include JSON::Serializable

        # The ID of the workspace to display information about.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end


      struct DescribeWorkspaceResponse
        include JSON::Serializable

        # A structure containing information about the workspace.

        @[JSON::Field(key: "workspace")]
        getter workspace : Types::WorkspaceDescription

        def initialize(
          @workspace : Types::WorkspaceDescription
        )
        end
      end


      struct DisassociateLicenseRequest
        include JSON::Serializable

        # The type of license to remove from the workspace.

        @[JSON::Field(key: "licenseType")]
        getter license_type : String

        # The ID of the workspace to remove the Grafana Enterprise license from.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @license_type : String,
          @workspace_id : String
        )
        end
      end


      struct DisassociateLicenseResponse
        include JSON::Serializable

        # A structure containing information about the workspace.

        @[JSON::Field(key: "workspace")]
        getter workspace : Types::WorkspaceDescription

        def initialize(
          @workspace : Types::WorkspaceDescription
        )
        end
      end

      # A structure containing the identity provider (IdP) metadata used to integrate the identity provider
      # with this workspace. You can specify the metadata either by providing a URL to its location in the
      # url parameter, or by specifying the full metadata in XML format in the xml parameter. Specifying
      # both will cause an error.

      struct IdpMetadata
        include JSON::Serializable

        # The URL of the location containing the IdP metadata.

        @[JSON::Field(key: "url")]
        getter url : String?

        # The full IdP metadata, in XML format.

        @[JSON::Field(key: "xml")]
        getter xml : String?

        def initialize(
          @url : String? = nil,
          @xml : String? = nil
        )
        end
      end

      # Unexpected error while processing the request. Retry the request.

      struct InternalServerException
        include JSON::Serializable

        # A description of the error.

        @[JSON::Field(key: "message")]
        getter message : String

        # How long to wait before you retry this operation.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct ListPermissionsRequest
        include JSON::Serializable

        # The ID of the workspace to list permissions for. This parameter is required.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # (Optional) Limits the results to only the group that matches this ID.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # The maximum number of results to include in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use when requesting the next set of results. You received this token from a previous
        # ListPermissions operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # (Optional) Limits the results to only the user that matches this ID.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        # (Optional) If you specify SSO_USER , then only the permissions of IAM Identity Center users are
        # returned. If you specify SSO_GROUP , only the permissions of IAM Identity Center groups are
        # returned.

        @[JSON::Field(key: "userType")]
        getter user_type : String?

        def initialize(
          @workspace_id : String,
          @group_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @user_id : String? = nil,
          @user_type : String? = nil
        )
        end
      end


      struct ListPermissionsResponse
        include JSON::Serializable

        # The permissions returned by the operation.

        @[JSON::Field(key: "permissions")]
        getter permissions : Array(Types::PermissionEntry)

        # The token to use in a subsequent ListPermissions operation to return the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @permissions : Array(Types::PermissionEntry),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource the list of tags are associated with.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags that are associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListVersionsRequest
        include JSON::Serializable

        # The maximum number of results to include in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use when requesting the next set of results. You receive this token from a previous
        # ListVersions operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the workspace to list the available upgrade versions. If not included, lists all versions
        # of Grafana that are supported for CreateWorkspace .

        @[JSON::Field(key: "workspace-id")]
        getter workspace_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @workspace_id : String? = nil
        )
        end
      end


      struct ListVersionsResponse
        include JSON::Serializable

        # The Grafana versions available to create. If a workspace ID is included in the request, the Grafana
        # versions to which this workspace can be upgraded.

        @[JSON::Field(key: "grafanaVersions")]
        getter grafana_versions : Array(String)?

        # The token to use in a subsequent ListVersions operation to return the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @grafana_versions : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkspaceServiceAccountTokensRequest
        include JSON::Serializable

        # The ID of the service account for which to return tokens.

        @[JSON::Field(key: "serviceAccountId")]
        getter service_account_id : String

        # The ID of the workspace for which to return tokens.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The maximum number of tokens to include in the results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of service accounts to return. (You receive this token from a previous
        # ListWorkspaceServiceAccountTokens operation.)

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_account_id : String,
          @workspace_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkspaceServiceAccountTokensResponse
        include JSON::Serializable

        # The ID of the service account where the tokens reside.

        @[JSON::Field(key: "serviceAccountId")]
        getter service_account_id : String

        # An array of structures containing information about the tokens.

        @[JSON::Field(key: "serviceAccountTokens")]
        getter service_account_tokens : Array(Types::ServiceAccountTokenSummary)

        # The ID of the workspace where the tokens reside.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The token to use when requesting the next set of service accounts.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_account_id : String,
          @service_account_tokens : Array(Types::ServiceAccountTokenSummary),
          @workspace_id : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkspaceServiceAccountsRequest
        include JSON::Serializable

        # The workspace for which to list service accounts.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The maximum number of service accounts to include in the results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of service accounts to return. (You receive this token from a previous
        # ListWorkspaceServiceAccounts operation.)

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workspace_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkspaceServiceAccountsResponse
        include JSON::Serializable

        # An array of structures containing information about the service accounts.

        @[JSON::Field(key: "serviceAccounts")]
        getter service_accounts : Array(Types::ServiceAccountSummary)

        # The workspace to which the service accounts are associated.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # The token to use when requesting the next set of service accounts.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @service_accounts : Array(Types::ServiceAccountSummary),
          @workspace_id : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkspacesRequest
        include JSON::Serializable

        # The maximum number of workspaces to include in the results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of workspaces to return. (You receive this token from a previous
        # ListWorkspaces operation.)

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkspacesResponse
        include JSON::Serializable

        # An array of structures that contain some information about the workspaces in the account.

        @[JSON::Field(key: "workspaces")]
        getter workspaces : Array(Types::WorkspaceSummary)

        # The token to use when requesting the next set of workspaces.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workspaces : Array(Types::WorkspaceSummary),
          @next_token : String? = nil
        )
        end
      end

      # The configuration settings for in-bound network access to your workspace. When this is configured,
      # only listed IP addresses and VPC endpoints will be able to access your workspace. Standard Grafana
      # authentication and authorization are still required. Access is granted to a caller that is in either
      # the IP address list or the VPC endpoint list - they do not need to be in both. If this is not
      # configured, or is removed, then all IP addresses and VPC endpoints are allowed. Standard Grafana
      # authentication and authorization are still required. While both prefixListIds and vpceIds are
      # required, you can pass in an empty array of strings for either parameter if you do not want to allow
      # any of that type. If both are passed as empty arrays, no traffic is allowed to the workspace,
      # because only explicitly allowed connections are accepted.

      struct NetworkAccessConfiguration
        include JSON::Serializable

        # An array of prefix list IDs. A prefix list is a list of CIDR ranges of IP addresses. The IP
        # addresses specified are allowed to access your workspace. If the list is not included in the
        # configuration (passed an empty array) then no IP addresses are allowed to access the workspace. You
        # create a prefix list using the Amazon VPC console. Prefix list IDs have the format pl- 1a2b3c4d .
        # For more information about prefix lists, see Group CIDR blocks using managed prefix lists in the
        # Amazon Virtual Private Cloud User Guide .

        @[JSON::Field(key: "prefixListIds")]
        getter prefix_list_ids : Array(String)

        # An array of Amazon VPC endpoint IDs for the workspace. You can create VPC endpoints to your Amazon
        # Managed Grafana workspace for access from within a VPC. If a NetworkAccessConfiguration is specified
        # then only VPC endpoints specified here are allowed to access the workspace. If you pass in an empty
        # array of strings, then no VPCs are allowed to access the workspace. VPC endpoint IDs have the format
        # vpce- 1a2b3c4d . For more information about creating an interface VPC endpoint, see Interface VPC
        # endpoints in the Amazon Managed Grafana User Guide . The only VPC endpoints that can be specified
        # here are interface VPC endpoints for Grafana workspaces (using the
        # com.amazonaws.[region].grafana-workspace service endpoint). Other VPC endpoints are ignored.

        @[JSON::Field(key: "vpceIds")]
        getter vpce_ids : Array(String)

        def initialize(
          @prefix_list_ids : Array(String),
          @vpce_ids : Array(String)
        )
        end
      end

      # A structure containing the identity of one user or group and the Admin , Editor , or Viewer role
      # that they have.

      struct PermissionEntry
        include JSON::Serializable

        # Specifies whether the user or group has the Admin , Editor , or Viewer role.

        @[JSON::Field(key: "role")]
        getter role : String

        # A structure with the ID of the user or group with this role.

        @[JSON::Field(key: "user")]
        getter user : Types::User

        def initialize(
          @role : String,
          @user : Types::User
        )
        end
      end

      # The request references a resource that does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The value of a parameter in the request caused an error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource that is associated with the error.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that is associated with the error.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # This structure defines which groups defined in the SAML assertion attribute are to be mapped to the
      # Grafana Admin and Editor roles in the workspace. SAML authenticated users not part of Admin or
      # Editor role groups have Viewer permission over the workspace.

      struct RoleValues
        include JSON::Serializable

        # A list of groups from the SAML assertion attribute to grant the Grafana Admin role to.

        @[JSON::Field(key: "admin")]
        getter admin : Array(String)?

        # A list of groups from the SAML assertion attribute to grant the Grafana Editor role to.

        @[JSON::Field(key: "editor")]
        getter editor : Array(String)?

        def initialize(
          @admin : Array(String)? = nil,
          @editor : Array(String)? = nil
        )
        end
      end

      # A structure containing information about how this workspace works with SAML.

      struct SamlAuthentication
        include JSON::Serializable

        # Specifies whether the workspace's SAML configuration is complete.

        @[JSON::Field(key: "status")]
        getter status : String

        # A structure containing details about how this workspace works with SAML.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::SamlConfiguration?

        def initialize(
          @status : String,
          @configuration : Types::SamlConfiguration? = nil
        )
        end
      end

      # A structure containing information about how this workspace works with SAML.

      struct SamlConfiguration
        include JSON::Serializable

        # A structure containing the identity provider (IdP) metadata used to integrate the identity provider
        # with this workspace.

        @[JSON::Field(key: "idpMetadata")]
        getter idp_metadata : Types::IdpMetadata

        # Lists which organizations defined in the SAML assertion are allowed to use the Amazon Managed
        # Grafana workspace. If this is empty, all organizations in the assertion attribute have access.

        @[JSON::Field(key: "allowedOrganizations")]
        getter allowed_organizations : Array(String)?

        # A structure that defines which attributes in the SAML assertion are to be used to define information
        # about the users authenticated by that IdP to use the workspace.

        @[JSON::Field(key: "assertionAttributes")]
        getter assertion_attributes : Types::AssertionAttributes?

        # How long a sign-on session by a SAML user is valid, before the user has to sign on again.

        @[JSON::Field(key: "loginValidityDuration")]
        getter login_validity_duration : Int32?

        # A structure containing arrays that map group names in the SAML assertion to the Grafana Admin and
        # Editor roles in the workspace.

        @[JSON::Field(key: "roleValues")]
        getter role_values : Types::RoleValues?

        def initialize(
          @idp_metadata : Types::IdpMetadata,
          @allowed_organizations : Array(String)? = nil,
          @assertion_attributes : Types::AssertionAttributes? = nil,
          @login_validity_duration : Int32? = nil,
          @role_values : Types::RoleValues? = nil
        )
        end
      end

      # A structure that contains the information about one service account.

      struct ServiceAccountSummary
        include JSON::Serializable

        # The role of the service account, which sets the permission level used when calling Grafana APIs.

        @[JSON::Field(key: "grafanaRole")]
        getter grafana_role : String

        # The unique ID of the service account.

        @[JSON::Field(key: "id")]
        getter id : String

        # Returns true if the service account is disabled. Service accounts can be disabled and enabled in the
        # Amazon Managed Grafana console.

        @[JSON::Field(key: "isDisabled")]
        getter is_disabled : String

        # The name of the service account.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @grafana_role : String,
          @id : String,
          @is_disabled : String,
          @name : String
        )
        end
      end

      # A structure that contains the information about a service account token.

      struct ServiceAccountTokenSummary
        include JSON::Serializable

        # When the service account token was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # When the service account token will expire.

        @[JSON::Field(key: "expiresAt")]
        getter expires_at : Time

        # The unique ID of the service account token.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the service account token.

        @[JSON::Field(key: "name")]
        getter name : String

        # The last time the token was used to authorize a Grafana HTTP API.

        @[JSON::Field(key: "lastUsedAt")]
        getter last_used_at : Time?

        def initialize(
          @created_at : Time,
          @expires_at : Time,
          @id : String,
          @name : String,
          @last_used_at : Time? = nil
        )
        end
      end

      # A structure that contains the information about a service account token. This structure is returned
      # when creating the token. It is important to store the key that is returned, as it is not retrievable
      # at a later time. If you lose the key, you can delete and recreate the token, which will create a new
      # key.

      struct ServiceAccountTokenSummaryWithKey
        include JSON::Serializable

        # The unique ID of the service account token.

        @[JSON::Field(key: "id")]
        getter id : String

        # The key for the service account token. Used when making calls to the Grafana HTTP APIs to
        # authenticate and authorize the requests.

        @[JSON::Field(key: "key")]
        getter key : String

        # The name of the service account token.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @id : String,
          @key : String,
          @name : String
        )
        end
      end

      # The request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # A description of the error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the service quota that was exceeded.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The ID of the resource that is associated with the error.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that is associated with the error.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The value of a parameter in the request caused an error.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource the tag is associated with.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys and values to associate with the resource. You can associate tag keys only,
        # tags (key and values) only or a combination of tag keys and tags.

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

      # The request was denied because of request throttling. Retry the request.

      struct ThrottlingException
        include JSON::Serializable

        # A description of the error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the service quota that was exceeded.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The value of a parameter in the request caused an error.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The ID of the service that is associated with the error.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource the tag association is removed from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The key values of the tag to be removed from the resource.

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

      # A structure containing information about one error encountered while performing an UpdatePermissions
      # operation.

      struct UpdateError
        include JSON::Serializable

        # Specifies which permission update caused the error.

        @[JSON::Field(key: "causedBy")]
        getter caused_by : Types::UpdateInstruction

        # The error code.

        @[JSON::Field(key: "code")]
        getter code : Int32

        # The message for this error.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @caused_by : Types::UpdateInstruction,
          @code : Int32,
          @message : String
        )
        end
      end

      # Contains the instructions for one Grafana role permission update in a UpdatePermissions operation.

      struct UpdateInstruction
        include JSON::Serializable

        # Specifies whether this update is to add or revoke role permissions.

        @[JSON::Field(key: "action")]
        getter action : String

        # The role to add or revoke for the user or the group specified in users .

        @[JSON::Field(key: "role")]
        getter role : String

        # A structure that specifies the user or group to add or revoke the role for.

        @[JSON::Field(key: "users")]
        getter users : Array(Types::User)

        def initialize(
          @action : String,
          @role : String,
          @users : Array(Types::User)
        )
        end
      end


      struct UpdatePermissionsRequest
        include JSON::Serializable

        # An array of structures that contain the permission updates to make.

        @[JSON::Field(key: "updateInstructionBatch")]
        getter update_instruction_batch : Array(Types::UpdateInstruction)

        # The ID of the workspace to update.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        def initialize(
          @update_instruction_batch : Array(Types::UpdateInstruction),
          @workspace_id : String
        )
        end
      end


      struct UpdatePermissionsResponse
        include JSON::Serializable

        # An array of structures that contain the errors from the operation, if any.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::UpdateError)

        def initialize(
          @errors : Array(Types::UpdateError)
        )
        end
      end


      struct UpdateWorkspaceAuthenticationRequest
        include JSON::Serializable

        # Specifies whether this workspace uses SAML 2.0, IAM Identity Center, or both to authenticate users
        # for using the Grafana console within a workspace. For more information, see User authentication in
        # Amazon Managed Grafana .

        @[JSON::Field(key: "authenticationProviders")]
        getter authentication_providers : Array(String)

        # The ID of the workspace to update the authentication for.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # If the workspace uses SAML, use this structure to map SAML assertion attributes to workspace user
        # information and define which groups in the assertion attribute are to have the Admin and Editor
        # roles in the workspace.

        @[JSON::Field(key: "samlConfiguration")]
        getter saml_configuration : Types::SamlConfiguration?

        def initialize(
          @authentication_providers : Array(String),
          @workspace_id : String,
          @saml_configuration : Types::SamlConfiguration? = nil
        )
        end
      end


      struct UpdateWorkspaceAuthenticationResponse
        include JSON::Serializable

        # A structure that describes the user authentication for this workspace after the update is made.

        @[JSON::Field(key: "authentication")]
        getter authentication : Types::AuthenticationDescription

        def initialize(
          @authentication : Types::AuthenticationDescription
        )
        end
      end


      struct UpdateWorkspaceConfigurationRequest
        include JSON::Serializable

        # The new configuration string for the workspace. For more information about the format and
        # configuration options available, see Working in your Grafana workspace .

        @[JSON::Field(key: "configuration")]
        getter configuration : String

        # The ID of the workspace to update.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # Specifies the version of Grafana to support in the workspace. If not specified, keeps the current
        # version of the workspace. Can only be used to upgrade (for example, from 8.4 to 9.4), not downgrade
        # (for example, from 9.4 to 8.4). To know what versions are available to upgrade to for a specific
        # workspace, see the ListVersions operation.

        @[JSON::Field(key: "grafanaVersion")]
        getter grafana_version : String?

        def initialize(
          @configuration : String,
          @workspace_id : String,
          @grafana_version : String? = nil
        )
        end
      end


      struct UpdateWorkspaceConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateWorkspaceRequest
        include JSON::Serializable

        # The ID of the workspace to update.

        @[JSON::Field(key: "workspaceId")]
        getter workspace_id : String

        # Specifies whether the workspace can access Amazon Web Services resources in this Amazon Web Services
        # account only, or whether it can also access Amazon Web Services resources in other accounts in the
        # same organization. If you specify ORGANIZATION , you must specify which organizational units the
        # workspace can access in the workspaceOrganizationalUnits parameter.

        @[JSON::Field(key: "accountAccessType")]
        getter account_access_type : String?

        # The configuration settings for network access to your workspace. When this is configured, only
        # listed IP addresses and VPC endpoints will be able to access your workspace. Standard Grafana
        # authentication and authorization will still be required. If this is not configured, or is removed,
        # then all IP addresses and VPC endpoints will be allowed. Standard Grafana authentication and
        # authorization will still be required.

        @[JSON::Field(key: "networkAccessControl")]
        getter network_access_control : Types::NetworkAccessConfiguration?

        # The name of an IAM role that already exists to use to access resources through Organizations. This
        # can only be used with a workspace that has the permissionType set to CUSTOMER_MANAGED .

        @[JSON::Field(key: "organizationRoleName")]
        getter organization_role_name : String?

        # Use this parameter if you want to change a workspace from SERVICE_MANAGED to CUSTOMER_MANAGED . This
        # allows you to manage the permissions that the workspace uses to access datasources and notification
        # channels. If the workspace is in a member Amazon Web Services account of an organization, and that
        # account is not a delegated administrator account, and you want the workspace to access data sources
        # in other Amazon Web Services accounts in the organization, you must choose CUSTOMER_MANAGED . If you
        # specify this as CUSTOMER_MANAGED , you must also specify a workspaceRoleArn that the workspace will
        # use for accessing Amazon Web Services resources. For more information on the role and permissions
        # needed, see Amazon Managed Grafana permissions and policies for Amazon Web Services data sources and
        # notification channels Do not use this to convert a CUSTOMER_MANAGED workspace to SERVICE_MANAGED .
        # Do not include this parameter if you want to leave the workspace as SERVICE_MANAGED . You can
        # convert a CUSTOMER_MANAGED workspace to SERVICE_MANAGED using the Amazon Managed Grafana console.
        # For more information, see Managing permissions for data sources and notification channels .

        @[JSON::Field(key: "permissionType")]
        getter permission_type : String?

        # Whether to remove the network access configuration from the workspace. Setting this to true and
        # providing a networkAccessControl to set will return an error. If you remove this configuration by
        # setting this to true , then all IP addresses and VPC endpoints will be allowed. Standard Grafana
        # authentication and authorization will still be required.

        @[JSON::Field(key: "removeNetworkAccessConfiguration")]
        getter remove_network_access_configuration : Bool?

        # Whether to remove the VPC configuration from the workspace. Setting this to true and providing a
        # vpcConfiguration to set will return an error.

        @[JSON::Field(key: "removeVpcConfiguration")]
        getter remove_vpc_configuration : Bool?

        # The name of the CloudFormation stack set to use to generate IAM roles to be used for this workspace.

        @[JSON::Field(key: "stackSetName")]
        getter stack_set_name : String?

        # The configuration settings for an Amazon VPC that contains data sources for your Grafana workspace
        # to connect to.

        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        # This parameter is for internal use only, and should not be used.

        @[JSON::Field(key: "workspaceDataSources")]
        getter workspace_data_sources : Array(String)?

        # A description for the workspace. This is used only to help you identify this workspace.

        @[JSON::Field(key: "workspaceDescription")]
        getter workspace_description : String?

        # A new name for the workspace to update.

        @[JSON::Field(key: "workspaceName")]
        getter workspace_name : String?

        # Specify the Amazon Web Services notification channels that you plan to use in this workspace.
        # Specifying these data sources here enables Amazon Managed Grafana to create IAM roles and
        # permissions that allow Amazon Managed Grafana to use these channels.

        @[JSON::Field(key: "workspaceNotificationDestinations")]
        getter workspace_notification_destinations : Array(String)?

        # Specifies the organizational units that this workspace is allowed to use data sources from, if this
        # workspace is in an account that is part of an organization.

        @[JSON::Field(key: "workspaceOrganizationalUnits")]
        getter workspace_organizational_units : Array(String)?

        # Specifies an IAM role that grants permissions to Amazon Web Services resources that the workspace
        # accesses, such as data sources and notification channels. If this workspace has permissionType
        # CUSTOMER_MANAGED , then this role is required.

        @[JSON::Field(key: "workspaceRoleArn")]
        getter workspace_role_arn : String?

        def initialize(
          @workspace_id : String,
          @account_access_type : String? = nil,
          @network_access_control : Types::NetworkAccessConfiguration? = nil,
          @organization_role_name : String? = nil,
          @permission_type : String? = nil,
          @remove_network_access_configuration : Bool? = nil,
          @remove_vpc_configuration : Bool? = nil,
          @stack_set_name : String? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil,
          @workspace_data_sources : Array(String)? = nil,
          @workspace_description : String? = nil,
          @workspace_name : String? = nil,
          @workspace_notification_destinations : Array(String)? = nil,
          @workspace_organizational_units : Array(String)? = nil,
          @workspace_role_arn : String? = nil
        )
        end
      end


      struct UpdateWorkspaceResponse
        include JSON::Serializable

        # A structure containing data about the workspace that was created.

        @[JSON::Field(key: "workspace")]
        getter workspace : Types::WorkspaceDescription

        def initialize(
          @workspace : Types::WorkspaceDescription
        )
        end
      end

      # A structure that specifies one user or group in the workspace.

      struct User
        include JSON::Serializable

        # The ID of the user or group. Pattern:
        # ^([0-9a-fA-F]{10}-|)[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}$

        @[JSON::Field(key: "id")]
        getter id : String

        # Specifies whether this is a single user or a group.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @id : String,
          @type : String
        )
        end
      end

      # The value of a parameter in the request caused an error.

      struct ValidationException
        include JSON::Serializable

        # A description of the error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason that the operation failed.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # A list of fields that might be associated with the error.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # A structure that contains information about a request parameter that caused an error.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message describing why this field couldn't be validated.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field that caused the validation error.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The configuration settings for an Amazon VPC that contains data sources for your Grafana workspace
      # to connect to. Provided securityGroupIds and subnetIds must be part of the same VPC. Connecting to a
      # private VPC is not yet available in the Asia Pacific (Seoul) Region (ap-northeast-2).

      struct VpcConfiguration
        include JSON::Serializable

        # The list of Amazon EC2 security group IDs attached to the Amazon VPC for your Grafana workspace to
        # connect. Duplicates not allowed.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The list of Amazon EC2 subnet IDs created in the Amazon VPC for your Grafana workspace to connect.
        # Duplicates not allowed.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String)
        )
        end
      end

      # A structure containing information about an Amazon Managed Grafana workspace in your account.

      struct WorkspaceDescription
        include JSON::Serializable

        # A structure that describes whether the workspace uses SAML, IAM Identity Center, or both methods for
        # user authentication.

        @[JSON::Field(key: "authentication")]
        getter authentication : Types::AuthenticationSummary

        # The date that the workspace was created.

        @[JSON::Field(key: "created")]
        getter created : Time

        # Specifies the Amazon Web Services data sources that have been configured to have IAM roles and
        # permissions created to allow Amazon Managed Grafana to read data from these sources. This list is
        # only used when the workspace was created through the Amazon Web Services console, and the
        # permissionType is SERVICE_MANAGED .

        @[JSON::Field(key: "dataSources")]
        getter data_sources : Array(String)

        # The URL that users can use to access the Grafana console in the workspace.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # The version of Grafana supported in this workspace.

        @[JSON::Field(key: "grafanaVersion")]
        getter grafana_version : String

        # The unique ID of this workspace.

        @[JSON::Field(key: "id")]
        getter id : String

        # The most recent date that the workspace was modified.

        @[JSON::Field(key: "modified")]
        getter modified : Time

        # The current status of the workspace.

        @[JSON::Field(key: "status")]
        getter status : String

        # Specifies whether the workspace can access Amazon Web Services resources in this Amazon Web Services
        # account only, or whether it can also access Amazon Web Services resources in other accounts in the
        # same organization. If this is ORGANIZATION , the workspaceOrganizationalUnits parameter specifies
        # which organizational units the workspace can access.

        @[JSON::Field(key: "accountAccessType")]
        getter account_access_type : String?

        # The user-defined description of the workspace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether this workspace has already fully used its free trial for Grafana Enterprise.
        # Amazon Managed Grafana workspaces no longer support Grafana Enterprise free trials.

        @[JSON::Field(key: "freeTrialConsumed")]
        getter free_trial_consumed : Bool?

        # If this workspace is currently in the free trial period for Grafana Enterprise, this value specifies
        # when that free trial ends. Amazon Managed Grafana workspaces no longer support Grafana Enterprise
        # free trials.

        @[JSON::Field(key: "freeTrialExpiration")]
        getter free_trial_expiration : Time?

        # The token that ties this workspace to a Grafana Labs account. For more information, see Link your
        # account with Grafana Labs .

        @[JSON::Field(key: "grafanaToken")]
        getter grafana_token : String?

        # If this workspace has a full Grafana Enterprise license purchased through Amazon Web Services
        # Marketplace, this specifies when the license ends and will need to be renewed. Purchasing the
        # Enterprise plugins option through Amazon Managed Grafana does not have an expiration. It is valid
        # until the license is removed.

        @[JSON::Field(key: "licenseExpiration")]
        getter license_expiration : Time?

        # Specifies whether this workspace has a full Grafana Enterprise license. Amazon Managed Grafana
        # workspaces no longer support Grafana Enterprise free trials.

        @[JSON::Field(key: "licenseType")]
        getter license_type : String?

        # The name of the workspace.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The configuration settings for network access to your workspace.

        @[JSON::Field(key: "networkAccessControl")]
        getter network_access_control : Types::NetworkAccessConfiguration?

        # The Amazon Web Services notification channels that Amazon Managed Grafana can automatically create
        # IAM roles and permissions for, to allow Amazon Managed Grafana to use these channels.

        @[JSON::Field(key: "notificationDestinations")]
        getter notification_destinations : Array(String)?

        # The name of the IAM role that is used to access resources through Organizations.

        @[JSON::Field(key: "organizationRoleName")]
        getter organization_role_name : String?

        # Specifies the organizational units that this workspace is allowed to use data sources from, if this
        # workspace is in an account that is part of an organization.

        @[JSON::Field(key: "organizationalUnits")]
        getter organizational_units : Array(String)?

        # If this is SERVICE_MANAGED , and the workplace was created through the Amazon Managed Grafana
        # console, then Amazon Managed Grafana automatically creates the IAM roles and provisions the
        # permissions that the workspace needs to use Amazon Web Services data sources and notification
        # channels. If this is CUSTOMER_MANAGED , you must manage those roles and permissions yourself. If you
        # are working with a workspace in a member account of an organization and that account is not a
        # delegated administrator account, and you want the workspace to access data sources in other Amazon
        # Web Services accounts in the organization, this parameter must be set to CUSTOMER_MANAGED . For more
        # information about converting between customer and service managed, see Managing permissions for data
        # sources and notification channels . For more information about the roles and permissions that must
        # be managed for customer managed workspaces, see Amazon Managed Grafana permissions and policies for
        # Amazon Web Services data sources and notification channels

        @[JSON::Field(key: "permissionType")]
        getter permission_type : String?

        # The name of the CloudFormation stack set that is used to generate IAM roles to be used for this
        # workspace.

        @[JSON::Field(key: "stackSetName")]
        getter stack_set_name : String?

        # The list of tags associated with the workspace.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The configuration for connecting to data sources in a private VPC (Amazon Virtual Private Cloud).

        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        # The IAM role that grants permissions to the Amazon Web Services resources that the workspace will
        # view data from. This role must already exist.

        @[JSON::Field(key: "workspaceRoleArn")]
        getter workspace_role_arn : String?

        def initialize(
          @authentication : Types::AuthenticationSummary,
          @created : Time,
          @data_sources : Array(String),
          @endpoint : String,
          @grafana_version : String,
          @id : String,
          @modified : Time,
          @status : String,
          @account_access_type : String? = nil,
          @description : String? = nil,
          @free_trial_consumed : Bool? = nil,
          @free_trial_expiration : Time? = nil,
          @grafana_token : String? = nil,
          @license_expiration : Time? = nil,
          @license_type : String? = nil,
          @name : String? = nil,
          @network_access_control : Types::NetworkAccessConfiguration? = nil,
          @notification_destinations : Array(String)? = nil,
          @organization_role_name : String? = nil,
          @organizational_units : Array(String)? = nil,
          @permission_type : String? = nil,
          @stack_set_name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil,
          @workspace_role_arn : String? = nil
        )
        end
      end

      # A structure that contains some information about one workspace in the account.

      struct WorkspaceSummary
        include JSON::Serializable

        # A structure containing information about the authentication methods used in the workspace.

        @[JSON::Field(key: "authentication")]
        getter authentication : Types::AuthenticationSummary

        # The date that the workspace was created.

        @[JSON::Field(key: "created")]
        getter created : Time

        # The URL endpoint to use to access the Grafana console in the workspace.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # The Grafana version that the workspace is running.

        @[JSON::Field(key: "grafanaVersion")]
        getter grafana_version : String

        # The unique ID of the workspace.

        @[JSON::Field(key: "id")]
        getter id : String

        # The most recent date that the workspace was modified.

        @[JSON::Field(key: "modified")]
        getter modified : Time

        # The current status of the workspace.

        @[JSON::Field(key: "status")]
        getter status : String

        # The customer-entered description of the workspace.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The token that ties this workspace to a Grafana Labs account. For more information, see Link your
        # account with Grafana Labs .

        @[JSON::Field(key: "grafanaToken")]
        getter grafana_token : String?

        # Specifies whether this workspace has a full Grafana Enterprise license. Amazon Managed Grafana
        # workspaces no longer support Grafana Enterprise free trials.

        @[JSON::Field(key: "licenseType")]
        getter license_type : String?

        # The name of the workspace.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Web Services notification channels that Amazon Managed Grafana can automatically create
        # IAM roles and permissions for, which allows Amazon Managed Grafana to use these channels.

        @[JSON::Field(key: "notificationDestinations")]
        getter notification_destinations : Array(String)?

        # The list of tags associated with the workspace.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authentication : Types::AuthenticationSummary,
          @created : Time,
          @endpoint : String,
          @grafana_version : String,
          @id : String,
          @modified : Time,
          @status : String,
          @description : String? = nil,
          @grafana_token : String? = nil,
          @license_type : String? = nil,
          @name : String? = nil,
          @notification_destinations : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end
    end
  end
end
