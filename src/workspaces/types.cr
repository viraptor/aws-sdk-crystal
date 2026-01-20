require "json"
require "time"

module Aws
  module WorkSpaces
    module Types


      struct AcceptAccountLinkInvitationRequest
        include JSON::Serializable

        # The identifier of the account link.

        @[JSON::Field(key: "LinkId")]
        getter link_id : String

        # A string of up to 64 ASCII characters that Amazon WorkSpaces uses to ensure idempotent creation.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @link_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct AcceptAccountLinkInvitationResult
        include JSON::Serializable

        # Information about the account link.

        @[JSON::Field(key: "AccountLink")]
        getter account_link : Types::AccountLink?

        def initialize(
          @account_link : Types::AccountLink? = nil
        )
        end
      end

      # The user is not authorized to access a resource.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the access type and endpoint for a WorkSpace.

      struct AccessEndpoint
        include JSON::Serializable

        # Indicates the type of access endpoint.

        @[JSON::Field(key: "AccessEndpointType")]
        getter access_endpoint_type : String?

        # Indicates the VPC endpoint to use for access.

        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        def initialize(
          @access_endpoint_type : String? = nil,
          @vpc_endpoint_id : String? = nil
        )
        end
      end

      # Describes the access endpoint configuration for a WorkSpace.

      struct AccessEndpointConfig
        include JSON::Serializable

        # Indicates a list of access endpoints associated with this directory.

        @[JSON::Field(key: "AccessEndpoints")]
        getter access_endpoints : Array(Types::AccessEndpoint)

        # Indicates a list of protocols that fallback to using the public Internet when streaming over a VPC
        # endpoint is not available.

        @[JSON::Field(key: "InternetFallbackProtocols")]
        getter internet_fallback_protocols : Array(String)?

        def initialize(
          @access_endpoints : Array(Types::AccessEndpoint),
          @internet_fallback_protocols : Array(String)? = nil
        )
        end
      end

      # Information about about the account link.

      struct AccountLink
        include JSON::Serializable

        # The identifier of the account link.

        @[JSON::Field(key: "AccountLinkId")]
        getter account_link_id : String?

        # The status of the account link.

        @[JSON::Field(key: "AccountLinkStatus")]
        getter account_link_status : String?

        # The identifier of the source account.

        @[JSON::Field(key: "SourceAccountId")]
        getter source_account_id : String?

        # The identifier of the target account.

        @[JSON::Field(key: "TargetAccountId")]
        getter target_account_id : String?

        def initialize(
          @account_link_id : String? = nil,
          @account_link_status : String? = nil,
          @source_account_id : String? = nil,
          @target_account_id : String? = nil
        )
        end
      end

      # Describes a modification to the configuration of Bring Your Own License (BYOL) for the specified
      # account.

      struct AccountModification
        include JSON::Serializable

        # The IP address range, specified as an IPv4 CIDR block, for the management network interface used for
        # the account.

        @[JSON::Field(key: "DedicatedTenancyManagementCidrRange")]
        getter dedicated_tenancy_management_cidr_range : String?

        # The status of BYOL (whether BYOL is being enabled or disabled).

        @[JSON::Field(key: "DedicatedTenancySupport")]
        getter dedicated_tenancy_support : String?

        # The error code that is returned if the configuration of BYOL cannot be modified.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The text of the error message that is returned if the configuration of BYOL cannot be modified.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The state of the modification to the configuration of BYOL.

        @[JSON::Field(key: "ModificationState")]
        getter modification_state : String?

        # The timestamp when the modification of the BYOL configuration was started.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @dedicated_tenancy_management_cidr_range : String? = nil,
          @dedicated_tenancy_support : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @modification_state : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Information about the Active Directory config.

      struct ActiveDirectoryConfig
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Indicates the secret ARN on the service account.

        @[JSON::Field(key: "ServiceAccountSecretArn")]
        getter service_account_secret_arn : String

        def initialize(
          @domain_name : String,
          @service_account_secret_arn : String
        )
        end
      end

      # The specified application is not supported.

      struct ApplicationNotSupportedException
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the association between an application and an application resource.

      struct ApplicationResourceAssociation
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The identifier of the associated resource.

        @[JSON::Field(key: "AssociatedResourceId")]
        getter associated_resource_id : String?

        # The resource type of the associated resource.

        @[JSON::Field(key: "AssociatedResourceType")]
        getter associated_resource_type : String?

        # The time the association was created.

        @[JSON::Field(key: "Created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The time the association status was last updated.

        @[JSON::Field(key: "LastUpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The status of the application resource association.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason the association deployment failed.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : Types::AssociationStateReason?

        def initialize(
          @application_id : String? = nil,
          @associated_resource_id : String? = nil,
          @associated_resource_type : String? = nil,
          @created : Time? = nil,
          @last_updated_time : Time? = nil,
          @state : String? = nil,
          @state_reason : Types::AssociationStateReason? = nil
        )
        end
      end

      # The persistent application settings for WorkSpaces Pools users.

      struct ApplicationSettingsRequest
        include JSON::Serializable

        # Enables or disables persistent application settings for users during their pool sessions.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The path prefix for the S3 bucket where users’ persistent application settings are stored. You can
        # allow the same persistent application settings to be used across multiple pools by specifying the
        # same settings group for each pool.

        @[JSON::Field(key: "SettingsGroup")]
        getter settings_group : String?

        def initialize(
          @status : String,
          @settings_group : String? = nil
        )
        end
      end

      # Describes the persistent application settings for WorkSpaces Pools users.

      struct ApplicationSettingsResponse
        include JSON::Serializable

        # Specifies whether persistent application settings are enabled for users during their pool sessions.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The S3 bucket where users’ persistent application settings are stored. When persistent application
        # settings are enabled for the first time for an account in an Amazon Web Services Region, an S3
        # bucket is created. The bucket is unique to the Amazon Web Services account and the Region.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The path prefix for the S3 bucket where users’ persistent application settings are stored.

        @[JSON::Field(key: "SettingsGroup")]
        getter settings_group : String?

        def initialize(
          @status : String,
          @s3_bucket_name : String? = nil,
          @settings_group : String? = nil
        )
        end
      end


      struct AssociateConnectionAliasRequest
        include JSON::Serializable

        # The identifier of the connection alias.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String

        # The identifier of the directory to associate the connection alias with.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @alias_id : String,
          @resource_id : String
        )
        end
      end


      struct AssociateConnectionAliasResult
        include JSON::Serializable

        # The identifier of the connection alias association. You use the connection identifier in the DNS TXT
        # record when you're configuring your DNS routing policies.

        @[JSON::Field(key: "ConnectionIdentifier")]
        getter connection_identifier : String?

        def initialize(
          @connection_identifier : String? = nil
        )
        end
      end


      struct AssociateIpGroupsRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The identifiers of one or more IP access control groups.

        @[JSON::Field(key: "GroupIds")]
        getter group_ids : Array(String)

        def initialize(
          @directory_id : String,
          @group_ids : Array(String)
        )
        end
      end


      struct AssociateIpGroupsResult
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateWorkspaceApplicationRequest
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        def initialize(
          @application_id : String,
          @workspace_id : String
        )
        end
      end


      struct AssociateWorkspaceApplicationResult
        include JSON::Serializable

        # Information about the association between the specified WorkSpace and the specified application.

        @[JSON::Field(key: "Association")]
        getter association : Types::WorkspaceResourceAssociation?

        def initialize(
          @association : Types::WorkspaceResourceAssociation? = nil
        )
        end
      end

      # Indicates the reason that the association deployment failed, including the error code and error
      # message.

      struct AssociationStateReason
        include JSON::Serializable

        # The error code of the association deployment failure.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message of the association deployment failure.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct AuthorizeIpRulesRequest
        include JSON::Serializable

        # The identifier of the group.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The rules to add to the group.

        @[JSON::Field(key: "UserRules")]
        getter user_rules : Array(Types::IpRuleItem)

        def initialize(
          @group_id : String,
          @user_rules : Array(Types::IpRuleItem)
        )
        end
      end


      struct AuthorizeIpRulesResult
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the association between an application and a bundle resource.

      struct BundleResourceAssociation
        include JSON::Serializable

        # The identifier of the associated resource.

        @[JSON::Field(key: "AssociatedResourceId")]
        getter associated_resource_id : String?

        # The resource type of the associated resources.

        @[JSON::Field(key: "AssociatedResourceType")]
        getter associated_resource_type : String?

        # The identifier of the bundle.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The time the association is created.

        @[JSON::Field(key: "Created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The time the association status was last updated.

        @[JSON::Field(key: "LastUpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The status of the bundle resource association.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason the association deployment failed.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : Types::AssociationStateReason?

        def initialize(
          @associated_resource_id : String? = nil,
          @associated_resource_type : String? = nil,
          @bundle_id : String? = nil,
          @created : Time? = nil,
          @last_updated_time : Time? = nil,
          @state : String? = nil,
          @state_reason : Types::AssociationStateReason? = nil
        )
        end
      end

      # Describes the user capacity for a pool of WorkSpaces.

      struct Capacity
        include JSON::Serializable

        # The desired number of user sessions for the WorkSpaces in the pool.

        @[JSON::Field(key: "DesiredUserSessions")]
        getter desired_user_sessions : Int32

        def initialize(
          @desired_user_sessions : Int32
        )
        end
      end

      # Describes the capacity status for a pool of WorkSpaces.

      struct CapacityStatus
        include JSON::Serializable

        # The number of user sessions currently being used for your pool.

        @[JSON::Field(key: "ActiveUserSessions")]
        getter active_user_sessions : Int32

        # The total number of user sessions that are available for streaming or are currently streaming in
        # your pool. ActualUserSessions = AvailableUserSessions + ActiveUserSessions

        @[JSON::Field(key: "ActualUserSessions")]
        getter actual_user_sessions : Int32

        # The number of user sessions currently available for streaming from your pool. AvailableUserSessions
        # = ActualUserSessions - ActiveUserSessions

        @[JSON::Field(key: "AvailableUserSessions")]
        getter available_user_sessions : Int32

        # The total number of sessions slots that are either running or pending. This represents the total
        # number of concurrent streaming sessions your pool can support in a steady state.

        @[JSON::Field(key: "DesiredUserSessions")]
        getter desired_user_sessions : Int32

        def initialize(
          @active_user_sessions : Int32,
          @actual_user_sessions : Int32,
          @available_user_sessions : Int32,
          @desired_user_sessions : Int32
        )
        end
      end

      # Describes the properties of the certificate-based authentication you want to use with your
      # WorkSpaces.

      struct CertificateBasedAuthProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services Certificate Manager Private CA resource.

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # The status of the certificate-based authentication properties.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @certificate_authority_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes an Amazon WorkSpaces client.

      struct ClientProperties
        include JSON::Serializable

        # Specifies whether users can upload diagnostic log files of Amazon WorkSpaces client directly to
        # WorkSpaces to troubleshoot issues when using the WorkSpaces client. When enabled, the log files will
        # be sent to WorkSpaces automatically and will be applied to all users in the specified directory.

        @[JSON::Field(key: "LogUploadEnabled")]
        getter log_upload_enabled : String?

        # Specifies whether users can cache their credentials on the Amazon WorkSpaces client. When enabled,
        # users can choose to reconnect to their WorkSpaces without re-entering their credentials.

        @[JSON::Field(key: "ReconnectEnabled")]
        getter reconnect_enabled : String?

        def initialize(
          @log_upload_enabled : String? = nil,
          @reconnect_enabled : String? = nil
        )
        end
      end

      # Information about the Amazon WorkSpaces client.

      struct ClientPropertiesResult
        include JSON::Serializable

        # Information about the Amazon WorkSpaces client.

        @[JSON::Field(key: "ClientProperties")]
        getter client_properties : Types::ClientProperties?

        # The resource identifier, in the form of a directory ID.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @client_properties : Types::ClientProperties? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # The compute type of the WorkSpace is not compatible with the application.

      struct ComputeNotCompatibleException
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the compute type of the bundle.

      struct ComputeType
        include JSON::Serializable

        # The compute type.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # The TargetAccountId is already linked or invited.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes an Amazon Connect client add-in.

      struct ConnectClientAddIn
        include JSON::Serializable

        # The client add-in identifier.

        @[JSON::Field(key: "AddInId")]
        getter add_in_id : String?

        # The name of the client add in.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The directory identifier for which the client add-in is configured.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The endpoint URL of the client add-in.

        @[JSON::Field(key: "URL")]
        getter url : String?

        def initialize(
          @add_in_id : String? = nil,
          @name : String? = nil,
          @resource_id : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Describes a connection alias. Connection aliases are used for cross-Region redirection. For more
      # information, see Cross-Region Redirection for Amazon WorkSpaces .

      struct ConnectionAlias
        include JSON::Serializable

        # The identifier of the connection alias.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String?

        # The association status of the connection alias.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::ConnectionAliasAssociation)?

        # The connection string specified for the connection alias. The connection string must be in the form
        # of a fully qualified domain name (FQDN), such as www.example.com .

        @[JSON::Field(key: "ConnectionString")]
        getter connection_string : String?

        # The identifier of the Amazon Web Services account that owns the connection alias.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The current state of the connection alias.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @alias_id : String? = nil,
          @associations : Array(Types::ConnectionAliasAssociation)? = nil,
          @connection_string : String? = nil,
          @owner_account_id : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Describes a connection alias association that is used for cross-Region redirection. For more
      # information, see Cross-Region Redirection for Amazon WorkSpaces .

      struct ConnectionAliasAssociation
        include JSON::Serializable

        # The identifier of the Amazon Web Services account that associated the connection alias with a
        # directory.

        @[JSON::Field(key: "AssociatedAccountId")]
        getter associated_account_id : String?

        # The association status of the connection alias.

        @[JSON::Field(key: "AssociationStatus")]
        getter association_status : String?

        # The identifier of the connection alias association. You use the connection identifier in the DNS TXT
        # record when you're configuring your DNS routing policies.

        @[JSON::Field(key: "ConnectionIdentifier")]
        getter connection_identifier : String?

        # The identifier of the directory associated with a connection alias.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @associated_account_id : String? = nil,
          @association_status : String? = nil,
          @connection_identifier : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # Describes the permissions for a connection alias. Connection aliases are used for cross-Region
      # redirection. For more information, see Cross-Region Redirection for Amazon WorkSpaces .

      struct ConnectionAliasPermission
        include JSON::Serializable

        # Indicates whether the specified Amazon Web Services account is allowed to associate the connection
        # alias with a directory.

        @[JSON::Field(key: "AllowAssociation")]
        getter allow_association : Bool

        # The identifier of the Amazon Web Services account that the connection alias is shared with.

        @[JSON::Field(key: "SharedAccountId")]
        getter shared_account_id : String

        def initialize(
          @allow_association : Bool,
          @shared_account_id : String
        )
        end
      end


      struct CopyWorkspaceImageRequest
        include JSON::Serializable

        # The name of the image.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier of the source image.

        @[JSON::Field(key: "SourceImageId")]
        getter source_image_id : String

        # The identifier of the source Region.

        @[JSON::Field(key: "SourceRegion")]
        getter source_region : String

        # A description of the image.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The tags for the image.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @source_image_id : String,
          @source_region : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CopyWorkspaceImageResult
        include JSON::Serializable

        # The identifier of the image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        def initialize(
          @image_id : String? = nil
        )
        end
      end


      struct CreateAccountLinkInvitationRequest
        include JSON::Serializable

        # The identifier of the target account.

        @[JSON::Field(key: "TargetAccountId")]
        getter target_account_id : String

        # A string of up to 64 ASCII characters that Amazon WorkSpaces uses to ensure idempotent creation.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @target_account_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct CreateAccountLinkInvitationResult
        include JSON::Serializable

        # Information about the account link.

        @[JSON::Field(key: "AccountLink")]
        getter account_link : Types::AccountLink?

        def initialize(
          @account_link : Types::AccountLink? = nil
        )
        end
      end


      struct CreateConnectClientAddInRequest
        include JSON::Serializable

        # The name of the client add-in.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The directory identifier for which to configure the client add-in.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The endpoint URL of the Amazon Connect client add-in.

        @[JSON::Field(key: "URL")]
        getter url : String

        def initialize(
          @name : String,
          @resource_id : String,
          @url : String
        )
        end
      end


      struct CreateConnectClientAddInResult
        include JSON::Serializable

        # The client add-in identifier.

        @[JSON::Field(key: "AddInId")]
        getter add_in_id : String?

        def initialize(
          @add_in_id : String? = nil
        )
        end
      end


      struct CreateConnectionAliasRequest
        include JSON::Serializable

        # A connection string in the form of a fully qualified domain name (FQDN), such as www.example.com .
        # After you create a connection string, it is always associated to your Amazon Web Services account.
        # You cannot recreate the same connection string with a different account, even if you delete all
        # instances of it from the original account. The connection string is globally reserved for your
        # account.

        @[JSON::Field(key: "ConnectionString")]
        getter connection_string : String

        # The tags to associate with the connection alias.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connection_string : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateConnectionAliasResult
        include JSON::Serializable

        # The identifier of the connection alias.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String?

        def initialize(
          @alias_id : String? = nil
        )
        end
      end


      struct CreateIpGroupRequest
        include JSON::Serializable

        # The name of the group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The description of the group.

        @[JSON::Field(key: "GroupDesc")]
        getter group_desc : String?

        # The tags. Each WorkSpaces resource can have a maximum of 50 tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The rules to add to the group.

        @[JSON::Field(key: "UserRules")]
        getter user_rules : Array(Types::IpRuleItem)?

        def initialize(
          @group_name : String,
          @group_desc : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_rules : Array(Types::IpRuleItem)? = nil
        )
        end
      end


      struct CreateIpGroupResult
        include JSON::Serializable

        # The identifier of the group.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        def initialize(
          @group_id : String? = nil
        )
        end
      end


      struct CreateStandbyWorkspacesRequest
        include JSON::Serializable

        # The Region of the primary WorkSpace.

        @[JSON::Field(key: "PrimaryRegion")]
        getter primary_region : String

        # Information about the standby WorkSpace to be created.

        @[JSON::Field(key: "StandbyWorkspaces")]
        getter standby_workspaces : Array(Types::StandbyWorkspace)

        def initialize(
          @primary_region : String,
          @standby_workspaces : Array(Types::StandbyWorkspace)
        )
        end
      end


      struct CreateStandbyWorkspacesResult
        include JSON::Serializable

        # Information about the standby WorkSpace that could not be created.

        @[JSON::Field(key: "FailedStandbyRequests")]
        getter failed_standby_requests : Array(Types::FailedCreateStandbyWorkspacesRequest)?

        # Information about the standby WorkSpace that was created.

        @[JSON::Field(key: "PendingStandbyRequests")]
        getter pending_standby_requests : Array(Types::PendingCreateStandbyWorkspacesRequest)?

        def initialize(
          @failed_standby_requests : Array(Types::FailedCreateStandbyWorkspacesRequest)? = nil,
          @pending_standby_requests : Array(Types::PendingCreateStandbyWorkspacesRequest)? = nil
        )
        end
      end


      struct CreateTagsRequest
        include JSON::Serializable

        # The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, registered
        # directories, images, custom bundles, IP access control groups, and connection aliases.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The tags. Each WorkSpaces resource can have a maximum of 50 tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct CreateTagsResult
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateUpdatedWorkspaceImageRequest
        include JSON::Serializable

        # A description of whether updates for the WorkSpace image are available.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the new updated WorkSpace image.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier of the source WorkSpace image.

        @[JSON::Field(key: "SourceImageId")]
        getter source_image_id : String

        # The tags that you want to add to the new updated WorkSpace image. To add tags at the same time when
        # you're creating the updated image, you must create an IAM policy that grants your IAM user
        # permissions to use workspaces:CreateTags .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @description : String,
          @name : String,
          @source_image_id : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateUpdatedWorkspaceImageResult
        include JSON::Serializable

        # The identifier of the new updated WorkSpace image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        def initialize(
          @image_id : String? = nil
        )
        end
      end


      struct CreateWorkspaceBundleRequest
        include JSON::Serializable

        # The description of the bundle.

        @[JSON::Field(key: "BundleDescription")]
        getter bundle_description : String

        # The name of the bundle.

        @[JSON::Field(key: "BundleName")]
        getter bundle_name : String


        @[JSON::Field(key: "ComputeType")]
        getter compute_type : Types::ComputeType

        # The identifier of the image that is used to create the bundle.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String


        @[JSON::Field(key: "UserStorage")]
        getter user_storage : Types::UserStorage


        @[JSON::Field(key: "RootStorage")]
        getter root_storage : Types::RootStorage?

        # The tags associated with the bundle. To add tags at the same time when you're creating the bundle,
        # you must create an IAM policy that grants your IAM user permissions to use workspaces:CreateTags .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @bundle_description : String,
          @bundle_name : String,
          @compute_type : Types::ComputeType,
          @image_id : String,
          @user_storage : Types::UserStorage,
          @root_storage : Types::RootStorage? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateWorkspaceBundleResult
        include JSON::Serializable


        @[JSON::Field(key: "WorkspaceBundle")]
        getter workspace_bundle : Types::WorkspaceBundle?

        def initialize(
          @workspace_bundle : Types::WorkspaceBundle? = nil
        )
        end
      end


      struct CreateWorkspaceImageRequest
        include JSON::Serializable

        # The description of the new WorkSpace image.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the new WorkSpace image.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier of the source WorkSpace

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        # The tags that you want to add to the new WorkSpace image. To add tags when you're creating the
        # image, you must create an IAM policy that grants your IAM user permission to use
        # workspaces:CreateTags .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @description : String,
          @name : String,
          @workspace_id : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateWorkspaceImageResult
        include JSON::Serializable

        # The date when the image was created.

        @[JSON::Field(key: "Created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The description of the image.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the new WorkSpace image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The name of the image.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The operating system that the image is running.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : Types::OperatingSystem?

        # The identifier of the Amazon Web Services account that owns the image.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # Specifies whether the image is running on dedicated hardware. When Bring Your Own License (BYOL) is
        # enabled, this value is set to DEDICATED. For more information, see Bring Your Own Windows Desktop
        # Images. .

        @[JSON::Field(key: "RequiredTenancy")]
        getter required_tenancy : String?

        # The availability status of the image.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @created : Time? = nil,
          @description : String? = nil,
          @image_id : String? = nil,
          @name : String? = nil,
          @operating_system : Types::OperatingSystem? = nil,
          @owner_account_id : String? = nil,
          @required_tenancy : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct CreateWorkspacesPoolRequest
        include JSON::Serializable

        # The identifier of the bundle for the pool.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String

        # The user capacity of the pool.

        @[JSON::Field(key: "Capacity")]
        getter capacity : Types::Capacity

        # The pool description.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The identifier of the directory for the pool.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the pool.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        # Indicates the application settings of the pool.

        @[JSON::Field(key: "ApplicationSettings")]
        getter application_settings : Types::ApplicationSettingsRequest?

        # The running mode for the pool.

        @[JSON::Field(key: "RunningMode")]
        getter running_mode : String?

        # The tags for the pool.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Indicates the timeout settings of the pool.

        @[JSON::Field(key: "TimeoutSettings")]
        getter timeout_settings : Types::TimeoutSettings?

        def initialize(
          @bundle_id : String,
          @capacity : Types::Capacity,
          @description : String,
          @directory_id : String,
          @pool_name : String,
          @application_settings : Types::ApplicationSettingsRequest? = nil,
          @running_mode : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_settings : Types::TimeoutSettings? = nil
        )
        end
      end


      struct CreateWorkspacesPoolResult
        include JSON::Serializable

        # Indicates the pool to create.

        @[JSON::Field(key: "WorkspacesPool")]
        getter workspaces_pool : Types::WorkspacesPool?

        def initialize(
          @workspaces_pool : Types::WorkspacesPool? = nil
        )
        end
      end


      struct CreateWorkspacesRequest
        include JSON::Serializable

        # The WorkSpaces to create. You can specify up to 25 WorkSpaces.

        @[JSON::Field(key: "Workspaces")]
        getter workspaces : Array(Types::WorkspaceRequest)

        def initialize(
          @workspaces : Array(Types::WorkspaceRequest)
        )
        end
      end


      struct CreateWorkspacesResult
        include JSON::Serializable

        # Information about the WorkSpaces that could not be created.

        @[JSON::Field(key: "FailedRequests")]
        getter failed_requests : Array(Types::FailedCreateWorkspaceRequest)?

        # Information about the WorkSpaces that were created. Because this operation is asynchronous, the
        # identifier returned is not immediately available for use with other operations. For example, if you
        # call DescribeWorkspaces before the WorkSpace is created, the information returned can be incomplete.

        @[JSON::Field(key: "PendingRequests")]
        getter pending_requests : Array(Types::Workspace)?

        def initialize(
          @failed_requests : Array(Types::FailedCreateWorkspaceRequest)? = nil,
          @pending_requests : Array(Types::Workspace)? = nil
        )
        end
      end

      # Describes in-depth details about the error. These details include the possible causes of the error
      # and troubleshooting information.

      struct CustomWorkspaceImageImportErrorDetails
        include JSON::Serializable

        # The error code that is returned for the image import.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The text of the error message that is returned for the image import.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Describes the data replication settings.

      struct DataReplicationSettings
        include JSON::Serializable

        # Indicates whether data replication is enabled, and if enabled, the type of data replication.

        @[JSON::Field(key: "DataReplication")]
        getter data_replication : String?

        # The date and time at which the last successful snapshot was taken of the primary WorkSpace used for
        # replicating data.

        @[JSON::Field(key: "RecoverySnapshotTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter recovery_snapshot_time : Time?

        def initialize(
          @data_replication : String? = nil,
          @recovery_snapshot_time : Time? = nil
        )
        end
      end

      # Returns default client branding attributes that were imported. These attributes display on the
      # client login screen. Client branding attributes are public facing. Ensure that you don't include
      # sensitive information.

      struct DefaultClientBrandingAttributes
        include JSON::Serializable

        # The forgotten password link. This is the web address that users can go to if they forget the
        # password for their WorkSpace.

        @[JSON::Field(key: "ForgotPasswordLink")]
        getter forgot_password_link : String?

        # The login message. Specified as a key value pair, in which the key is a locale and the value is the
        # localized message for that locale. The only key supported is en_US . The HTML tags supported include
        # the following: a, b, blockquote, br, cite, code, dd, dl, dt, div, em, i, li, ol, p, pre, q, small,
        # span, strike, strong, sub, sup, u, ul .

        @[JSON::Field(key: "LoginMessage")]
        getter login_message : Hash(String, String)?

        # The logo. The only image format accepted is a binary data object that is converted from a .png file.

        @[JSON::Field(key: "LogoUrl")]
        getter logo_url : String?

        # The support email. The company's customer support email address. In each platform type, the
        # SupportEmail and SupportLink parameters are mutually exclusive. You can specify one parameter for
        # each platform type, but not both. The default email is workspaces-feedback@amazon.com .

        @[JSON::Field(key: "SupportEmail")]
        getter support_email : String?

        # The support link. The link for the company's customer support page for their WorkSpace. In each
        # platform type, the SupportEmail and SupportLink parameters are mutually exclusive.You can specify
        # one parameter for each platform type, but not both. The default support link is
        # workspaces-feedback@amazon.com .

        @[JSON::Field(key: "SupportLink")]
        getter support_link : String?

        def initialize(
          @forgot_password_link : String? = nil,
          @login_message : Hash(String, String)? = nil,
          @logo_url : String? = nil,
          @support_email : String? = nil,
          @support_link : String? = nil
        )
        end
      end

      # The default client branding attributes to be imported. These attributes display on the client login
      # screen. Client branding attributes are public facing. Ensure that you do not include sensitive
      # information.

      struct DefaultImportClientBrandingAttributes
        include JSON::Serializable

        # The forgotten password link. This is the web address that users can go to if they forget the
        # password for their WorkSpace.

        @[JSON::Field(key: "ForgotPasswordLink")]
        getter forgot_password_link : String?

        # The login message. Specified as a key value pair, in which the key is a locale and the value is the
        # localized message for that locale. The only key supported is en_US . The HTML tags supported include
        # the following: a, b, blockquote, br, cite, code, dd, dl, dt, div, em, i, li, ol, p, pre, q, small,
        # span, strike, strong, sub, sup, u, ul .

        @[JSON::Field(key: "LoginMessage")]
        getter login_message : Hash(String, String)?

        # The logo. The only image format accepted is a binary data object that is converted from a .png file.

        @[JSON::Field(key: "Logo")]
        getter logo : Bytes?

        # The support email. The company's customer support email address. In each platform type, the
        # SupportEmail and SupportLink parameters are mutually exclusive. You can specify one parameter for
        # each platform type, but not both. The default email is workspaces-feedback@amazon.com .

        @[JSON::Field(key: "SupportEmail")]
        getter support_email : String?

        # The support link. The link for the company's customer support page for their WorkSpace. In each
        # platform type, the SupportEmail and SupportLink parameters are mutually exclusive. You can specify
        # one parameter for each platform type, but not both. The default support link is
        # workspaces-feedback@amazon.com .

        @[JSON::Field(key: "SupportLink")]
        getter support_link : String?

        def initialize(
          @forgot_password_link : String? = nil,
          @login_message : Hash(String, String)? = nil,
          @logo : Bytes? = nil,
          @support_email : String? = nil,
          @support_link : String? = nil
        )
        end
      end

      # Describes the default values that are used to create WorkSpaces. For more information, see Update
      # Directory Details for Your WorkSpaces .

      struct DefaultWorkspaceCreationProperties
        include JSON::Serializable

        # The identifier of the default security group to apply to WorkSpaces when they are created. For more
        # information, see Security Groups for Your WorkSpaces .

        @[JSON::Field(key: "CustomSecurityGroupId")]
        getter custom_security_group_id : String?

        # The organizational unit (OU) in the directory for the WorkSpace machine accounts.

        @[JSON::Field(key: "DefaultOu")]
        getter default_ou : String?

        # Specifies whether to automatically assign an Elastic public IP address to WorkSpaces in this
        # directory by default. If enabled, the Elastic public IP address allows outbound internet access from
        # your WorkSpaces when you’re using an internet gateway in the Amazon VPC in which your WorkSpaces are
        # located. If you're using a Network Address Translation (NAT) gateway for outbound internet access
        # from your VPC, or if your WorkSpaces are in public subnets and you manually assign them Elastic IP
        # addresses, you should disable this setting. This setting applies to new WorkSpaces that you launch
        # or to existing WorkSpaces that you rebuild. For more information, see Configure a VPC for Amazon
        # WorkSpaces .

        @[JSON::Field(key: "EnableInternetAccess")]
        getter enable_internet_access : Bool?

        # Specifies whether maintenance mode is enabled for WorkSpaces. For more information, see WorkSpace
        # Maintenance .

        @[JSON::Field(key: "EnableMaintenanceMode")]
        getter enable_maintenance_mode : Bool?

        # Indicates the IAM role ARN of the instance.

        @[JSON::Field(key: "InstanceIamRoleArn")]
        getter instance_iam_role_arn : String?

        # Specifies whether WorkSpace users are local administrators on their WorkSpaces.

        @[JSON::Field(key: "UserEnabledAsLocalAdministrator")]
        getter user_enabled_as_local_administrator : Bool?

        def initialize(
          @custom_security_group_id : String? = nil,
          @default_ou : String? = nil,
          @enable_internet_access : Bool? = nil,
          @enable_maintenance_mode : Bool? = nil,
          @instance_iam_role_arn : String? = nil,
          @user_enabled_as_local_administrator : Bool? = nil
        )
        end
      end


      struct DeleteAccountLinkInvitationRequest
        include JSON::Serializable

        # The identifier of the account link.

        @[JSON::Field(key: "LinkId")]
        getter link_id : String

        # A string of up to 64 ASCII characters that Amazon WorkSpaces uses to ensure idempotent creation.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @link_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteAccountLinkInvitationResult
        include JSON::Serializable

        # Information about the account link.

        @[JSON::Field(key: "AccountLink")]
        getter account_link : Types::AccountLink?

        def initialize(
          @account_link : Types::AccountLink? = nil
        )
        end
      end


      struct DeleteClientBrandingRequest
        include JSON::Serializable

        # The device type for which you want to delete client branding.

        @[JSON::Field(key: "Platforms")]
        getter platforms : Array(String)

        # The directory identifier of the WorkSpace for which you want to delete client branding.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @platforms : Array(String),
          @resource_id : String
        )
        end
      end


      struct DeleteClientBrandingResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConnectClientAddInRequest
        include JSON::Serializable

        # The identifier of the client add-in to delete.

        @[JSON::Field(key: "AddInId")]
        getter add_in_id : String

        # The directory identifier for which the client add-in is configured.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @add_in_id : String,
          @resource_id : String
        )
        end
      end


      struct DeleteConnectClientAddInResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConnectionAliasRequest
        include JSON::Serializable

        # The identifier of the connection alias to delete.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String

        def initialize(
          @alias_id : String
        )
        end
      end


      struct DeleteConnectionAliasResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteIpGroupRequest
        include JSON::Serializable

        # The identifier of the IP access control group.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @group_id : String
        )
        end
      end


      struct DeleteIpGroupResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTagsRequest
        include JSON::Serializable

        # The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, registered
        # directories, images, custom bundles, IP access control groups, and connection aliases.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The tag keys.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_id : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct DeleteTagsResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWorkspaceBundleRequest
        include JSON::Serializable

        # The identifier of the bundle.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        def initialize(
          @bundle_id : String? = nil
        )
        end
      end


      struct DeleteWorkspaceBundleResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWorkspaceImageRequest
        include JSON::Serializable

        # The identifier of the image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String

        def initialize(
          @image_id : String
        )
        end
      end


      struct DeleteWorkspaceImageResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeployWorkspaceApplicationsRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        # Indicates whether the force flag is applied for the specified WorkSpace. When the force flag is
        # enabled, it allows previously failed deployments to be retried.

        @[JSON::Field(key: "Force")]
        getter force : Bool?

        def initialize(
          @workspace_id : String,
          @force : Bool? = nil
        )
        end
      end


      struct DeployWorkspaceApplicationsResult
        include JSON::Serializable

        # The list of deployed associations and information about them.

        @[JSON::Field(key: "Deployment")]
        getter deployment : Types::WorkSpaceApplicationDeployment?

        def initialize(
          @deployment : Types::WorkSpaceApplicationDeployment? = nil
        )
        end
      end


      struct DeregisterWorkspaceDirectoryRequest
        include JSON::Serializable

        # The identifier of the directory. If any WorkSpaces are registered to this directory, you must remove
        # them before you deregister the directory, or you will receive an OperationNotSupportedException
        # error.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end


      struct DeregisterWorkspaceDirectoryResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountModificationsRequest
        include JSON::Serializable

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAccountModificationsResult
        include JSON::Serializable

        # The list of modifications to the configuration of BYOL.

        @[JSON::Field(key: "AccountModifications")]
        getter account_modifications : Array(Types::AccountModification)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_modifications : Array(Types::AccountModification)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeAccountRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountResult
        include JSON::Serializable

        # The type of linked account.

        @[JSON::Field(key: "DedicatedTenancyAccountType")]
        getter dedicated_tenancy_account_type : String?

        # The IP address range, specified as an IPv4 CIDR block, used for the management network interface.
        # The management network interface is connected to a secure Amazon WorkSpaces management network. It
        # is used for interactive streaming of the WorkSpace desktop to Amazon WorkSpaces clients, and to
        # allow Amazon WorkSpaces to manage the WorkSpace.

        @[JSON::Field(key: "DedicatedTenancyManagementCidrRange")]
        getter dedicated_tenancy_management_cidr_range : String?

        # The status of BYOL (whether BYOL is enabled or disabled).

        @[JSON::Field(key: "DedicatedTenancySupport")]
        getter dedicated_tenancy_support : String?

        # The text message to describe the status of BYOL.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @dedicated_tenancy_account_type : String? = nil,
          @dedicated_tenancy_management_cidr_range : String? = nil,
          @dedicated_tenancy_support : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct DescribeApplicationAssociationsRequest
        include JSON::Serializable

        # The identifier of the specified application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The resource type of the associated resources.

        @[JSON::Field(key: "AssociatedResourceTypes")]
        getter associated_resource_types : Array(String)

        # The maximum number of associations to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @associated_resource_types : Array(String),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeApplicationAssociationsResult
        include JSON::Serializable

        # List of associations and information about them.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::ApplicationResourceAssociation)?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @associations : Array(Types::ApplicationResourceAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeApplicationsRequest
        include JSON::Serializable

        # The identifiers of one or more applications.

        @[JSON::Field(key: "ApplicationIds")]
        getter application_ids : Array(String)?

        # The compute types supported by the applications.

        @[JSON::Field(key: "ComputeTypeNames")]
        getter compute_type_names : Array(String)?

        # The license availability for the applications.

        @[JSON::Field(key: "LicenseType")]
        getter license_type : String?

        # The maximum number of applications to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The operating systems supported by the applications.

        @[JSON::Field(key: "OperatingSystemNames")]
        getter operating_system_names : Array(String)?

        # The owner of the applications.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        def initialize(
          @application_ids : Array(String)? = nil,
          @compute_type_names : Array(String)? = nil,
          @license_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @operating_system_names : Array(String)? = nil,
          @owner : String? = nil
        )
        end
      end


      struct DescribeApplicationsResult
        include JSON::Serializable

        # List of information about the specified applications.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::WorkSpaceApplication)?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::WorkSpaceApplication)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeBundleAssociationsRequest
        include JSON::Serializable

        # The resource types of the associated resource.

        @[JSON::Field(key: "AssociatedResourceTypes")]
        getter associated_resource_types : Array(String)

        # The identifier of the bundle.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String

        def initialize(
          @associated_resource_types : Array(String),
          @bundle_id : String
        )
        end
      end


      struct DescribeBundleAssociationsResult
        include JSON::Serializable

        # List of information about the specified associations.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::BundleResourceAssociation)?

        def initialize(
          @associations : Array(Types::BundleResourceAssociation)? = nil
        )
        end
      end


      struct DescribeClientBrandingRequest
        include JSON::Serializable

        # The directory identifier of the WorkSpace for which you want to view client branding information.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @resource_id : String
        )
        end
      end


      struct DescribeClientBrandingResult
        include JSON::Serializable

        # The branding information for Android devices.

        @[JSON::Field(key: "DeviceTypeAndroid")]
        getter device_type_android : Types::DefaultClientBrandingAttributes?

        # The branding information for iOS devices.

        @[JSON::Field(key: "DeviceTypeIos")]
        getter device_type_ios : Types::IosClientBrandingAttributes?

        # The branding information for Linux devices.

        @[JSON::Field(key: "DeviceTypeLinux")]
        getter device_type_linux : Types::DefaultClientBrandingAttributes?

        # The branding information for macOS devices.

        @[JSON::Field(key: "DeviceTypeOsx")]
        getter device_type_osx : Types::DefaultClientBrandingAttributes?

        # The branding information for Web access.

        @[JSON::Field(key: "DeviceTypeWeb")]
        getter device_type_web : Types::DefaultClientBrandingAttributes?

        # The branding information for Windows devices.

        @[JSON::Field(key: "DeviceTypeWindows")]
        getter device_type_windows : Types::DefaultClientBrandingAttributes?

        def initialize(
          @device_type_android : Types::DefaultClientBrandingAttributes? = nil,
          @device_type_ios : Types::IosClientBrandingAttributes? = nil,
          @device_type_linux : Types::DefaultClientBrandingAttributes? = nil,
          @device_type_osx : Types::DefaultClientBrandingAttributes? = nil,
          @device_type_web : Types::DefaultClientBrandingAttributes? = nil,
          @device_type_windows : Types::DefaultClientBrandingAttributes? = nil
        )
        end
      end


      struct DescribeClientPropertiesRequest
        include JSON::Serializable

        # The resource identifier, in the form of directory IDs.

        @[JSON::Field(key: "ResourceIds")]
        getter resource_ids : Array(String)

        def initialize(
          @resource_ids : Array(String)
        )
        end
      end


      struct DescribeClientPropertiesResult
        include JSON::Serializable

        # Information about the specified Amazon WorkSpaces clients.

        @[JSON::Field(key: "ClientPropertiesList")]
        getter client_properties_list : Array(Types::ClientPropertiesResult)?

        def initialize(
          @client_properties_list : Array(Types::ClientPropertiesResult)? = nil
        )
        end
      end


      struct DescribeConnectClientAddInsRequest
        include JSON::Serializable

        # The directory identifier for which the client add-in is configured.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The maximum number of items to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeConnectClientAddInsResult
        include JSON::Serializable

        # Information about client add-ins.

        @[JSON::Field(key: "AddIns")]
        getter add_ins : Array(Types::ConnectClientAddIn)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @add_ins : Array(Types::ConnectClientAddIn)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeConnectionAliasPermissionsRequest
        include JSON::Serializable

        # The identifier of the connection alias.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @alias_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeConnectionAliasPermissionsResult
        include JSON::Serializable

        # The identifier of the connection alias.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String?

        # The permissions associated with a connection alias.

        @[JSON::Field(key: "ConnectionAliasPermissions")]
        getter connection_alias_permissions : Array(Types::ConnectionAliasPermission)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @alias_id : String? = nil,
          @connection_alias_permissions : Array(Types::ConnectionAliasPermission)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeConnectionAliasesRequest
        include JSON::Serializable

        # The identifiers of the connection aliases to describe.

        @[JSON::Field(key: "AliasIds")]
        getter alias_ids : Array(String)?

        # The maximum number of connection aliases to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the directory associated with the connection alias.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @alias_ids : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @resource_id : String? = nil
        )
        end
      end


      struct DescribeConnectionAliasesResult
        include JSON::Serializable

        # Information about the specified connection aliases.

        @[JSON::Field(key: "ConnectionAliases")]
        getter connection_aliases : Array(Types::ConnectionAlias)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connection_aliases : Array(Types::ConnectionAlias)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeCustomWorkspaceImageImportRequest
        include JSON::Serializable

        # The identifier of the WorkSpace image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String

        def initialize(
          @image_id : String
        )
        end
      end


      struct DescribeCustomWorkspaceImageImportResult
        include JSON::Serializable

        # The timestamp when the WorkSpace image import was created.

        @[JSON::Field(key: "Created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # Describes in-depth details about the error. These details include the possible causes of the error
        # and troubleshooting information.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::CustomWorkspaceImageImportErrorDetails)?

        # The image builder instance ID of the WorkSpace image.

        @[JSON::Field(key: "ImageBuilderInstanceId")]
        getter image_builder_instance_id : String?

        # The identifier of the WorkSpace image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # Describes the image import source.

        @[JSON::Field(key: "ImageSource")]
        getter image_source : Types::ImageSourceIdentifier?

        # The infrastructure configuration ARN that specifies how the WorkSpace image is built.

        @[JSON::Field(key: "InfrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String?

        # The timestamp when the WorkSpace image import was last updated.

        @[JSON::Field(key: "LastUpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The estimated progress percentage of the WorkSpace image import workflow.

        @[JSON::Field(key: "ProgressPercentage")]
        getter progress_percentage : Int32?

        # The state of the WorkSpace image.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The state message of the WorkSpace image import workflow.

        @[JSON::Field(key: "StateMessage")]
        getter state_message : String?

        def initialize(
          @created : Time? = nil,
          @error_details : Array(Types::CustomWorkspaceImageImportErrorDetails)? = nil,
          @image_builder_instance_id : String? = nil,
          @image_id : String? = nil,
          @image_source : Types::ImageSourceIdentifier? = nil,
          @infrastructure_configuration_arn : String? = nil,
          @last_updated_time : Time? = nil,
          @progress_percentage : Int32? = nil,
          @state : String? = nil,
          @state_message : String? = nil
        )
        end
      end


      struct DescribeImageAssociationsRequest
        include JSON::Serializable

        # The resource types of the associated resource.

        @[JSON::Field(key: "AssociatedResourceTypes")]
        getter associated_resource_types : Array(String)

        # The identifier of the image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String

        def initialize(
          @associated_resource_types : Array(String),
          @image_id : String
        )
        end
      end


      struct DescribeImageAssociationsResult
        include JSON::Serializable

        # List of information about the specified associations.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::ImageResourceAssociation)?

        def initialize(
          @associations : Array(Types::ImageResourceAssociation)? = nil
        )
        end
      end


      struct DescribeIpGroupsRequest
        include JSON::Serializable

        # The identifiers of one or more IP access control groups.

        @[JSON::Field(key: "GroupIds")]
        getter group_ids : Array(String)?

        # The maximum number of items to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @group_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeIpGroupsResult
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the IP access control groups.

        @[JSON::Field(key: "Result")]
        getter result : Array(Types::WorkspacesIpGroup)?

        def initialize(
          @next_token : String? = nil,
          @result : Array(Types::WorkspacesIpGroup)? = nil
        )
        end
      end


      struct DescribeTagsRequest
        include JSON::Serializable

        # The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, registered
        # directories, images, custom bundles, IP access control groups, and connection aliases.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @resource_id : String
        )
        end
      end


      struct DescribeTagsResult
        include JSON::Serializable

        # The tags.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end


      struct DescribeWorkspaceAssociationsRequest
        include JSON::Serializable

        # The resource types of the associated resources.

        @[JSON::Field(key: "AssociatedResourceTypes")]
        getter associated_resource_types : Array(String)

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        def initialize(
          @associated_resource_types : Array(String),
          @workspace_id : String
        )
        end
      end


      struct DescribeWorkspaceAssociationsResult
        include JSON::Serializable

        # List of information about the specified associations.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::WorkspaceResourceAssociation)?

        def initialize(
          @associations : Array(Types::WorkspaceResourceAssociation)? = nil
        )
        end
      end


      struct DescribeWorkspaceBundlesRequest
        include JSON::Serializable

        # The identifiers of the bundles. You cannot combine this parameter with any other filter.

        @[JSON::Field(key: "BundleIds")]
        getter bundle_ids : Array(String)?

        # The token for the next set of results. (You received this token from a previous call.)

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The owner of the bundles. You cannot combine this parameter with any other filter. To describe the
        # bundles provided by Amazon Web Services, specify AMAZON . To describe the bundles that belong to
        # your account, don't specify a value.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        def initialize(
          @bundle_ids : Array(String)? = nil,
          @next_token : String? = nil,
          @owner : String? = nil
        )
        end
      end


      struct DescribeWorkspaceBundlesResult
        include JSON::Serializable

        # Information about the bundles.

        @[JSON::Field(key: "Bundles")]
        getter bundles : Array(Types::WorkspaceBundle)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return. This token is valid for one day and must be used within that time frame.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @bundles : Array(Types::WorkspaceBundle)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Describes the filter conditions for the WorkSpaces to return.

      struct DescribeWorkspaceDirectoriesFilter
        include JSON::Serializable

        # The name of the WorkSpaces to filter.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The values for filtering WorkSpaces

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end


      struct DescribeWorkspaceDirectoriesRequest
        include JSON::Serializable

        # The identifiers of the directories. If the value is null, all directories are retrieved.

        @[JSON::Field(key: "DirectoryIds")]
        getter directory_ids : Array(String)?

        # The filter condition for the WorkSpaces.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::DescribeWorkspaceDirectoriesFilter)?

        # The maximum number of directories to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of the WorkSpace directories.

        @[JSON::Field(key: "WorkspaceDirectoryNames")]
        getter workspace_directory_names : Array(String)?

        def initialize(
          @directory_ids : Array(String)? = nil,
          @filters : Array(Types::DescribeWorkspaceDirectoriesFilter)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @workspace_directory_names : Array(String)? = nil
        )
        end
      end


      struct DescribeWorkspaceDirectoriesResult
        include JSON::Serializable

        # Information about the directories.

        @[JSON::Field(key: "Directories")]
        getter directories : Array(Types::WorkspaceDirectory)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directories : Array(Types::WorkspaceDirectory)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeWorkspaceImagePermissionsRequest
        include JSON::Serializable

        # The identifier of the image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String

        # The maximum number of items to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @image_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeWorkspaceImagePermissionsResult
        include JSON::Serializable

        # The identifier of the image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The identifiers of the Amazon Web Services accounts that the image has been shared with.

        @[JSON::Field(key: "ImagePermissions")]
        getter image_permissions : Array(Types::ImagePermission)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @image_id : String? = nil,
          @image_permissions : Array(Types::ImagePermission)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeWorkspaceImagesRequest
        include JSON::Serializable

        # The identifier of the image.

        @[JSON::Field(key: "ImageIds")]
        getter image_ids : Array(String)?

        # The type (owned or shared) of the image.

        @[JSON::Field(key: "ImageType")]
        getter image_type : String?

        # The maximum number of items to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @image_ids : Array(String)? = nil,
          @image_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeWorkspaceImagesResult
        include JSON::Serializable

        # Information about the images.

        @[JSON::Field(key: "Images")]
        getter images : Array(Types::WorkspaceImage)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @images : Array(Types::WorkspaceImage)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeWorkspaceSnapshotsRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end


      struct DescribeWorkspaceSnapshotsResult
        include JSON::Serializable

        # Information about the snapshots that can be used to rebuild a WorkSpace. These snapshots include the
        # user volume.

        @[JSON::Field(key: "RebuildSnapshots")]
        getter rebuild_snapshots : Array(Types::Snapshot)?

        # Information about the snapshots that can be used to restore a WorkSpace. These snapshots include
        # both the root volume and the user volume.

        @[JSON::Field(key: "RestoreSnapshots")]
        getter restore_snapshots : Array(Types::Snapshot)?

        def initialize(
          @rebuild_snapshots : Array(Types::Snapshot)? = nil,
          @restore_snapshots : Array(Types::Snapshot)? = nil
        )
        end
      end


      struct DescribeWorkspacesConnectionStatusRequest
        include JSON::Serializable

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifiers of the WorkSpaces. You can specify up to 25 WorkSpaces.

        @[JSON::Field(key: "WorkspaceIds")]
        getter workspace_ids : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @workspace_ids : Array(String)? = nil
        )
        end
      end


      struct DescribeWorkspacesConnectionStatusResult
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the connection status of the WorkSpace.

        @[JSON::Field(key: "WorkspacesConnectionStatus")]
        getter workspaces_connection_status : Array(Types::WorkspaceConnectionStatus)?

        def initialize(
          @next_token : String? = nil,
          @workspaces_connection_status : Array(Types::WorkspaceConnectionStatus)? = nil
        )
        end
      end


      struct DescribeWorkspacesPoolSessionsRequest
        include JSON::Serializable

        # The identifier of the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # The maximum size of each page of results. The default value is 20 and the maximum value is 50.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the user.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @pool_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct DescribeWorkspacesPoolSessionsResult
        include JSON::Serializable

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Describes the pool sessions.

        @[JSON::Field(key: "Sessions")]
        getter sessions : Array(Types::WorkspacesPoolSession)?

        def initialize(
          @next_token : String? = nil,
          @sessions : Array(Types::WorkspacesPoolSession)? = nil
        )
        end
      end

      # Describes the filter conditions for WorkSpaces Pools to return.

      struct DescribeWorkspacesPoolsFilter
        include JSON::Serializable

        # The name of the pool to filter.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The operator values for filtering WorkSpaces Pools.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The values for filtering WorkSpaces Pools.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end


      struct DescribeWorkspacesPoolsRequest
        include JSON::Serializable

        # The filter conditions for the WorkSpaces Pool to return.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::DescribeWorkspacesPoolsFilter)?

        # The maximum number of items to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the WorkSpaces Pools.

        @[JSON::Field(key: "PoolIds")]
        getter pool_ids : Array(String)?

        def initialize(
          @filters : Array(Types::DescribeWorkspacesPoolsFilter)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @pool_ids : Array(String)? = nil
        )
        end
      end


      struct DescribeWorkspacesPoolsResult
        include JSON::Serializable

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the WorkSpaces Pools.

        @[JSON::Field(key: "WorkspacesPools")]
        getter workspaces_pools : Array(Types::WorkspacesPool)?

        def initialize(
          @next_token : String? = nil,
          @workspaces_pools : Array(Types::WorkspacesPool)? = nil
        )
        end
      end


      struct DescribeWorkspacesRequest
        include JSON::Serializable

        # The identifier of the bundle. All WorkSpaces that are created from this bundle are retrieved. You
        # cannot combine this parameter with any other filter.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The identifier of the directory. In addition, you can optionally specify a specific directory user
        # (see UserName ). You cannot combine this parameter with any other filter.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The maximum number of items to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the directory user. You must specify this parameter with DirectoryId .

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        # The identifiers of the WorkSpaces. You cannot combine this parameter with any other filter. Because
        # the CreateWorkspaces operation is asynchronous, the identifier it returns is not immediately
        # available. If you immediately call DescribeWorkspaces with this identifier, no information is
        # returned.

        @[JSON::Field(key: "WorkspaceIds")]
        getter workspace_ids : Array(String)?

        # The name of the user-decoupled WorkSpace.

        @[JSON::Field(key: "WorkspaceName")]
        getter workspace_name : String?

        def initialize(
          @bundle_id : String? = nil,
          @directory_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @user_name : String? = nil,
          @workspace_ids : Array(String)? = nil,
          @workspace_name : String? = nil
        )
        end
      end


      struct DescribeWorkspacesResult
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the WorkSpaces. Because CreateWorkspaces is an asynchronous operation, some of the
        # returned information could be incomplete.

        @[JSON::Field(key: "Workspaces")]
        getter workspaces : Array(Types::Workspace)?

        def initialize(
          @next_token : String? = nil,
          @workspaces : Array(Types::Workspace)? = nil
        )
        end
      end


      struct DisassociateConnectionAliasRequest
        include JSON::Serializable

        # The identifier of the connection alias to disassociate.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String

        def initialize(
          @alias_id : String
        )
        end
      end


      struct DisassociateConnectionAliasResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateIpGroupsRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The identifiers of one or more IP access control groups.

        @[JSON::Field(key: "GroupIds")]
        getter group_ids : Array(String)

        def initialize(
          @directory_id : String,
          @group_ids : Array(String)
        )
        end
      end


      struct DisassociateIpGroupsResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateWorkspaceApplicationRequest
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        def initialize(
          @application_id : String,
          @workspace_id : String
        )
        end
      end


      struct DisassociateWorkspaceApplicationResult
        include JSON::Serializable

        # Information about the targeted association.

        @[JSON::Field(key: "Association")]
        getter association : Types::WorkspaceResourceAssociation?

        def initialize(
          @association : Types::WorkspaceResourceAssociation? = nil
        )
        end
      end

      # Describes in-depth details about the error. These details include the possible causes of the error
      # and troubleshooting information.

      struct ErrorDetails
        include JSON::Serializable

        # Indicates the error code returned.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The text of the error message related the error code.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Describes the standby WorkSpace that could not be created.

      struct FailedCreateStandbyWorkspacesRequest
        include JSON::Serializable

        # The error code that is returned if the standby WorkSpace could not be created.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The text of the error message that is returned if the standby WorkSpace could not be created.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Information about the standby WorkSpace that could not be created.

        @[JSON::Field(key: "StandbyWorkspaceRequest")]
        getter standby_workspace_request : Types::StandbyWorkspace?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @standby_workspace_request : Types::StandbyWorkspace? = nil
        )
        end
      end

      # Describes a WorkSpace that cannot be created.

      struct FailedCreateWorkspaceRequest
        include JSON::Serializable

        # The error code that is returned if the WorkSpace cannot be created.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The text of the error message that is returned if the WorkSpace cannot be created.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Information about the WorkSpace.

        @[JSON::Field(key: "WorkspaceRequest")]
        getter workspace_request : Types::WorkspaceRequest?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @workspace_request : Types::WorkspaceRequest? = nil
        )
        end
      end

      # Describes a WorkSpace that could not be rebooted. ( RebootWorkspaces ), rebuilt ( RebuildWorkspaces
      # ), restored ( RestoreWorkspace ), terminated ( TerminateWorkspaces ), started ( StartWorkspaces ),
      # or stopped ( StopWorkspaces ).

      struct FailedWorkspaceChangeRequest
        include JSON::Serializable

        # The error code that is returned if the WorkSpace cannot be rebooted.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The text of the error message that is returned if the WorkSpace cannot be rebooted.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @workspace_id : String? = nil
        )
        end
      end


      struct GetAccountLinkRequest
        include JSON::Serializable

        # The identifier of the account to link.

        @[JSON::Field(key: "LinkId")]
        getter link_id : String?

        # The identifier of the account link

        @[JSON::Field(key: "LinkedAccountId")]
        getter linked_account_id : String?

        def initialize(
          @link_id : String? = nil,
          @linked_account_id : String? = nil
        )
        end
      end


      struct GetAccountLinkResult
        include JSON::Serializable

        # The account link of the account link to retrieve.

        @[JSON::Field(key: "AccountLink")]
        getter account_link : Types::AccountLink?

        def initialize(
          @account_link : Types::AccountLink? = nil
        )
        end
      end

      # Describes the Global Accelerator for directory

      struct GlobalAcceleratorForDirectory
        include JSON::Serializable

        # Indicates if Global Accelerator for directory is enabled or disabled.

        @[JSON::Field(key: "Mode")]
        getter mode : String

        # Indicates the preferred protocol for Global Accelerator.

        @[JSON::Field(key: "PreferredProtocol")]
        getter preferred_protocol : String?

        def initialize(
          @mode : String,
          @preferred_protocol : String? = nil
        )
        end
      end

      # Describes the Global Accelerator for WorkSpaces.

      struct GlobalAcceleratorForWorkSpace
        include JSON::Serializable

        # Indicates if Global Accelerator for WorkSpaces is enabled, disabled, or the same mode as the
        # associated directory.

        @[JSON::Field(key: "Mode")]
        getter mode : String

        # Indicates the preferred protocol for Global Accelerator.

        @[JSON::Field(key: "PreferredProtocol")]
        getter preferred_protocol : String?

        def initialize(
          @mode : String,
          @preferred_protocol : String? = nil
        )
        end
      end

      # Specifies the configurations of the identity center.

      struct IDCConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The Amazon Resource Name (ARN) of the identity center instance.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        def initialize(
          @application_arn : String? = nil,
          @instance_arn : String? = nil
        )
        end
      end

      # Describes the Amazon Web Services accounts that have been granted permission to use a shared image.
      # For more information about sharing images, see Share or Unshare a Custom WorkSpaces Image .

      struct ImagePermission
        include JSON::Serializable

        # The identifier of the Amazon Web Services account that an image has been shared with.

        @[JSON::Field(key: "SharedAccountId")]
        getter shared_account_id : String?

        def initialize(
          @shared_account_id : String? = nil
        )
        end
      end

      # Describes the association between an application and an image resource.

      struct ImageResourceAssociation
        include JSON::Serializable

        # The identifier of the associated resource.

        @[JSON::Field(key: "AssociatedResourceId")]
        getter associated_resource_id : String?

        # The resource type of the associated resources.

        @[JSON::Field(key: "AssociatedResourceType")]
        getter associated_resource_type : String?

        # The time the association is created.

        @[JSON::Field(key: "Created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The identifier of the image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The time the association status was last updated.

        @[JSON::Field(key: "LastUpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The status of the image resource association.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason the association deployment failed.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : Types::AssociationStateReason?

        def initialize(
          @associated_resource_id : String? = nil,
          @associated_resource_type : String? = nil,
          @created : Time? = nil,
          @image_id : String? = nil,
          @last_updated_time : Time? = nil,
          @state : String? = nil,
          @state_reason : Types::AssociationStateReason? = nil
        )
        end
      end

      # Describes the image import source.

      struct ImageSourceIdentifier
        include JSON::Serializable

        # The identifier of the EC2 image.

        @[JSON::Field(key: "Ec2ImageId")]
        getter ec2_image_id : String?

        # The EC2 import task ID to import the image from the Amazon EC2 VM import process.

        @[JSON::Field(key: "Ec2ImportTaskId")]
        getter ec2_import_task_id : String?

        # The ARN of the EC2 Image Builder image.

        @[JSON::Field(key: "ImageBuildVersionArn")]
        getter image_build_version_arn : String?

        def initialize(
          @ec2_image_id : String? = nil,
          @ec2_import_task_id : String? = nil,
          @image_build_version_arn : String? = nil
        )
        end
      end


      struct ImportClientBrandingRequest
        include JSON::Serializable

        # The directory identifier of the WorkSpace for which you want to import client branding.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The branding information to import for Android devices.

        @[JSON::Field(key: "DeviceTypeAndroid")]
        getter device_type_android : Types::DefaultImportClientBrandingAttributes?

        # The branding information to import for iOS devices.

        @[JSON::Field(key: "DeviceTypeIos")]
        getter device_type_ios : Types::IosImportClientBrandingAttributes?

        # The branding information to import for Linux devices.

        @[JSON::Field(key: "DeviceTypeLinux")]
        getter device_type_linux : Types::DefaultImportClientBrandingAttributes?

        # The branding information to import for macOS devices.

        @[JSON::Field(key: "DeviceTypeOsx")]
        getter device_type_osx : Types::DefaultImportClientBrandingAttributes?

        # The branding information to import for web access.

        @[JSON::Field(key: "DeviceTypeWeb")]
        getter device_type_web : Types::DefaultImportClientBrandingAttributes?

        # The branding information to import for Windows devices.

        @[JSON::Field(key: "DeviceTypeWindows")]
        getter device_type_windows : Types::DefaultImportClientBrandingAttributes?

        def initialize(
          @resource_id : String,
          @device_type_android : Types::DefaultImportClientBrandingAttributes? = nil,
          @device_type_ios : Types::IosImportClientBrandingAttributes? = nil,
          @device_type_linux : Types::DefaultImportClientBrandingAttributes? = nil,
          @device_type_osx : Types::DefaultImportClientBrandingAttributes? = nil,
          @device_type_web : Types::DefaultImportClientBrandingAttributes? = nil,
          @device_type_windows : Types::DefaultImportClientBrandingAttributes? = nil
        )
        end
      end


      struct ImportClientBrandingResult
        include JSON::Serializable

        # The branding information configured for Android devices.

        @[JSON::Field(key: "DeviceTypeAndroid")]
        getter device_type_android : Types::DefaultClientBrandingAttributes?

        # The branding information configured for iOS devices.

        @[JSON::Field(key: "DeviceTypeIos")]
        getter device_type_ios : Types::IosClientBrandingAttributes?

        # The branding information configured for Linux devices.

        @[JSON::Field(key: "DeviceTypeLinux")]
        getter device_type_linux : Types::DefaultClientBrandingAttributes?

        # The branding information configured for macOS devices.

        @[JSON::Field(key: "DeviceTypeOsx")]
        getter device_type_osx : Types::DefaultClientBrandingAttributes?

        # The branding information configured for web access.

        @[JSON::Field(key: "DeviceTypeWeb")]
        getter device_type_web : Types::DefaultClientBrandingAttributes?

        # The branding information configured for Windows devices.

        @[JSON::Field(key: "DeviceTypeWindows")]
        getter device_type_windows : Types::DefaultClientBrandingAttributes?

        def initialize(
          @device_type_android : Types::DefaultClientBrandingAttributes? = nil,
          @device_type_ios : Types::IosClientBrandingAttributes? = nil,
          @device_type_linux : Types::DefaultClientBrandingAttributes? = nil,
          @device_type_osx : Types::DefaultClientBrandingAttributes? = nil,
          @device_type_web : Types::DefaultClientBrandingAttributes? = nil,
          @device_type_windows : Types::DefaultClientBrandingAttributes? = nil
        )
        end
      end


      struct ImportCustomWorkspaceImageRequest
        include JSON::Serializable

        # The supported compute type for the WorkSpace image.

        @[JSON::Field(key: "ComputeType")]
        getter compute_type : String

        # The description of the WorkSpace image.

        @[JSON::Field(key: "ImageDescription")]
        getter image_description : String

        # The name of the WorkSpace image.

        @[JSON::Field(key: "ImageName")]
        getter image_name : String

        # The options for image import source.

        @[JSON::Field(key: "ImageSource")]
        getter image_source : Types::ImageSourceIdentifier

        # The infrastructure configuration ARN that specifies how the WorkSpace image is built.

        @[JSON::Field(key: "InfrastructureConfigurationArn")]
        getter infrastructure_configuration_arn : String

        # The OS version for the WorkSpace image source.

        @[JSON::Field(key: "OsVersion")]
        getter os_version : String

        # The platform for the WorkSpace image source.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The supported protocol for the WorkSpace image. Windows 11 does not support PCOIP protocol.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # The resource tags. Each WorkSpaces resource can have a maximum of 50 tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @compute_type : String,
          @image_description : String,
          @image_name : String,
          @image_source : Types::ImageSourceIdentifier,
          @infrastructure_configuration_arn : String,
          @os_version : String,
          @platform : String,
          @protocol : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ImportCustomWorkspaceImageResult
        include JSON::Serializable

        # The identifier of the WorkSpace image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The state of the WorkSpace image.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @image_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct ImportWorkspaceImageRequest
        include JSON::Serializable

        # The identifier of the EC2 image.

        @[JSON::Field(key: "Ec2ImageId")]
        getter ec2_image_id : String

        # The description of the WorkSpace image.

        @[JSON::Field(key: "ImageDescription")]
        getter image_description : String

        # The name of the WorkSpace image.

        @[JSON::Field(key: "ImageName")]
        getter image_name : String

        # The ingestion process to be used when importing the image, depending on which protocol you want to
        # use for your BYOL Workspace image, either PCoIP, WSP, or bring your own protocol (BYOP). To use DCV,
        # specify a value that ends in _WSP . To use PCoIP, specify a value that does not end in _WSP . To use
        # BYOP, specify a value that ends in _BYOP . For non-GPU-enabled bundles (bundles other than Graphics
        # or GraphicsPro), specify BYOL_REGULAR , BYOL_REGULAR_WSP , or BYOL_REGULAR_BYOP , depending on the
        # protocol. The BYOL_REGULAR_BYOP and BYOL_GRAPHICS_G4DN_BYOP values are only supported by Amazon
        # WorkSpaces Core. Contact your account team to be allow-listed to use these values. For more
        # information, see Amazon WorkSpaces Core .

        @[JSON::Field(key: "IngestionProcess")]
        getter ingestion_process : String

        # If specified, the version of Microsoft Office to subscribe to. Valid only for Windows 10 and 11 BYOL
        # images. For more information about subscribing to Office for BYOL images, see Bring Your Own Windows
        # Desktop Licenses . Although this parameter is an array, only one item is allowed at this time.
        # During the image import process, non-GPU DCV (formerly WSP) WorkSpaces with Windows 11 support only
        # Microsoft_Office_2019 . GPU DCV (formerly WSP) WorkSpaces with Windows 11 do not support Office
        # installation.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(String)?

        # The tags. Each WorkSpaces resource can have a maximum of 50 tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @ec2_image_id : String,
          @image_description : String,
          @image_name : String,
          @ingestion_process : String,
          @applications : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ImportWorkspaceImageResult
        include JSON::Serializable

        # The identifier of the WorkSpace image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        def initialize(
          @image_id : String? = nil
        )
        end
      end

      # The specified application is not compatible with the resource.

      struct IncompatibleApplicationsException
        include JSON::Serializable

        def initialize
        end
      end

      # Unexpected server error occured.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Two or more of the selected parameter values cannot be used together.

      struct InvalidParameterCombinationException
        include JSON::Serializable

        # The exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameter values are not valid.

      struct InvalidParameterValuesException
        include JSON::Serializable

        # The exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The state of the resource is not valid for this operation.

      struct InvalidResourceStateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The client branding attributes for iOS device types. These attributes are displayed on the iOS
      # client login screen only. Client branding attributes are public facing. Ensure you do not include
      # sensitive information.

      struct IosClientBrandingAttributes
        include JSON::Serializable

        # The forgotten password link. This is the web address that users can go to if they forget the
        # password for their WorkSpace.

        @[JSON::Field(key: "ForgotPasswordLink")]
        getter forgot_password_link : String?

        # The login message. Specified as a key value pair, in which the key is a locale and the value is the
        # localized message for that locale. The only key supported is en_US . The HTML tags supported include
        # the following: a, b, blockquote, br, cite, code, dd, dl, dt, div, em, i, li, ol, p, pre, q, small,
        # span, strike, strong, sub, sup, u, ul .

        @[JSON::Field(key: "LoginMessage")]
        getter login_message : Hash(String, String)?

        # The @2x version of the logo. This is the higher resolution display that offers a scale factor of 2.0
        # (or @2x). The only image format accepted is a binary data object that is converted from a .png file.
        # For more information about iOS image size and resolution, see Image Size and Resolution in the Apple
        # Human Interface Guidelines .

        @[JSON::Field(key: "Logo2xUrl")]
        getter logo2x_url : String?

        # The @3x version of the logo. This is the higher resolution display that offers a scale factor of 3.0
        # (or @3x).The only image format accepted is a binary data object that is converted from a .png file.
        # For more information about iOS image size and resolution, see Image Size and Resolution in the Apple
        # Human Interface Guidelines .

        @[JSON::Field(key: "Logo3xUrl")]
        getter logo3x_url : String?

        # The logo. This is the standard-resolution display that has a 1:1 pixel density (or @1x), where one
        # pixel is equal to one point. The only image format accepted is a binary data object that is
        # converted from a .png file.

        @[JSON::Field(key: "LogoUrl")]
        getter logo_url : String?

        # The support email. The company's customer support email address. In each platform type, the
        # SupportEmail and SupportLink parameters are mutually exclusive. You can specify one parameter for
        # each platform type, but not both. The default email is workspaces-feedback@amazon.com .

        @[JSON::Field(key: "SupportEmail")]
        getter support_email : String?

        # The support link. The link for the company's customer support page for their WorkSpace. In each
        # platform type, the SupportEmail and SupportLink parameters are mutually exclusive. You can specify
        # one parameter for each platform type, but not both. The default support link is
        # workspaces-feedback@amazon.com .

        @[JSON::Field(key: "SupportLink")]
        getter support_link : String?

        def initialize(
          @forgot_password_link : String? = nil,
          @login_message : Hash(String, String)? = nil,
          @logo2x_url : String? = nil,
          @logo3x_url : String? = nil,
          @logo_url : String? = nil,
          @support_email : String? = nil,
          @support_link : String? = nil
        )
        end
      end

      # The client branding attributes to import for iOS device types. These attributes are displayed on the
      # iOS client login screen. Client branding attributes are public facing. Ensure you do not include
      # sensitive information.

      struct IosImportClientBrandingAttributes
        include JSON::Serializable

        # The forgotten password link. This is the web address that users can go to if they forget the
        # password for their WorkSpace.

        @[JSON::Field(key: "ForgotPasswordLink")]
        getter forgot_password_link : String?

        # The login message. Specified as a key value pair, in which the key is a locale and the value is the
        # localized message for that locale. The only key supported is en_US . The HTML tags supported include
        # the following: a, b, blockquote, br, cite, code, dd, dl, dt, div, em, i, li, ol, p, pre, q, small,
        # span, strike, strong, sub, sup, u, ul .

        @[JSON::Field(key: "LoginMessage")]
        getter login_message : Hash(String, String)?

        # The logo. This is the standard-resolution display that has a 1:1 pixel density (or @1x), where one
        # pixel is equal to one point. The only image format accepted is a binary data object that is
        # converted from a .png file.

        @[JSON::Field(key: "Logo")]
        getter logo : Bytes?

        # The @2x version of the logo. This is the higher resolution display that offers a scale factor of 2.0
        # (or @2x). The only image format accepted is a binary data object that is converted from a .png file.
        # For more information about iOS image size and resolution, see Image Size and Resolution in the Apple
        # Human Interface Guidelines .

        @[JSON::Field(key: "Logo2x")]
        getter logo2x : Bytes?

        # The @3x version of the logo. This is the higher resolution display that offers a scale factor of 3.0
        # (or @3x). The only image format accepted is a binary data object that is converted from a .png file.
        # For more information about iOS image size and resolution, see Image Size and Resolution in the Apple
        # Human Interface Guidelines .

        @[JSON::Field(key: "Logo3x")]
        getter logo3x : Bytes?

        # The support email. The company's customer support email address. In each platform type, the
        # SupportEmail and SupportLink parameters are mutually exclusive. You can specify one parameter for
        # each platform type, but not both. The default email is workspaces-feedback@amazon.com .

        @[JSON::Field(key: "SupportEmail")]
        getter support_email : String?

        # The support link. The link for the company's customer support page for their WorkSpace. In each
        # platform type, the SupportEmail and SupportLink parameters are mutually exclusive. You can specify
        # one parameter for each platform type, but not both. The default support link is
        # workspaces-feedback@amazon.com .

        @[JSON::Field(key: "SupportLink")]
        getter support_link : String?

        def initialize(
          @forgot_password_link : String? = nil,
          @login_message : Hash(String, String)? = nil,
          @logo : Bytes? = nil,
          @logo2x : Bytes? = nil,
          @logo3x : Bytes? = nil,
          @support_email : String? = nil,
          @support_link : String? = nil
        )
        end
      end

      # Describes a rule for an IP access control group.

      struct IpRuleItem
        include JSON::Serializable

        # The IP address range, in CIDR notation.

        @[JSON::Field(key: "ipRule")]
        getter ip_rule : String?

        # The description.

        @[JSON::Field(key: "ruleDesc")]
        getter rule_desc : String?

        def initialize(
          @ip_rule : String? = nil,
          @rule_desc : String? = nil
        )
        end
      end


      struct ListAccountLinksRequest
        include JSON::Serializable

        # Filters the account based on their link status.

        @[JSON::Field(key: "LinkStatusFilter")]
        getter link_status_filter : Array(String)?

        # The maximum number of accounts to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @link_status_filter : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountLinksResult
        include JSON::Serializable

        # Information about the account links.

        @[JSON::Field(key: "AccountLinks")]
        getter account_links : Array(Types::AccountLink)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_links : Array(Types::AccountLink)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAvailableManagementCidrRangesRequest
        include JSON::Serializable

        # The IP address range to search. Specify an IP address range that is compatible with your network and
        # in CIDR notation (that is, specify the range as an IPv4 CIDR block).

        @[JSON::Field(key: "ManagementCidrRangeConstraint")]
        getter management_cidr_range_constraint : String

        # The maximum number of items to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If you received a NextToken from a previous call that was paginated, provide this token to receive
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @management_cidr_range_constraint : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAvailableManagementCidrRangesResult
        include JSON::Serializable

        # The list of available IP address ranges, specified as IPv4 CIDR blocks.

        @[JSON::Field(key: "ManagementCidrRanges")]
        getter management_cidr_ranges : Array(String)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @management_cidr_ranges : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Specifies the configurations of the Microsoft Entra.

      struct MicrosoftEntraConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application config.

        @[JSON::Field(key: "ApplicationConfigSecretArn")]
        getter application_config_secret_arn : String?

        # The identifier of the tenant.

        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String?

        def initialize(
          @application_config_secret_arn : String? = nil,
          @tenant_id : String? = nil
        )
        end
      end


      struct MigrateWorkspaceRequest
        include JSON::Serializable

        # The identifier of the target bundle type to migrate the WorkSpace to.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String

        # The identifier of the WorkSpace to migrate from.

        @[JSON::Field(key: "SourceWorkspaceId")]
        getter source_workspace_id : String

        def initialize(
          @bundle_id : String,
          @source_workspace_id : String
        )
        end
      end


      struct MigrateWorkspaceResult
        include JSON::Serializable

        # The original identifier of the WorkSpace that is being migrated.

        @[JSON::Field(key: "SourceWorkspaceId")]
        getter source_workspace_id : String?

        # The new identifier of the WorkSpace that is being migrated. If the migration does not succeed, the
        # target WorkSpace ID will not be used, and the WorkSpace will still have the original WorkSpace ID.

        @[JSON::Field(key: "TargetWorkspaceId")]
        getter target_workspace_id : String?

        def initialize(
          @source_workspace_id : String? = nil,
          @target_workspace_id : String? = nil
        )
        end
      end

      # Describes a WorkSpace modification.

      struct ModificationState
        include JSON::Serializable

        # The resource.

        @[JSON::Field(key: "Resource")]
        getter resource : String?

        # The modification state.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @resource : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct ModifyAccountRequest
        include JSON::Serializable

        # The IP address range, specified as an IPv4 CIDR block, for the management network interface. Specify
        # an IP address range that is compatible with your network and in CIDR notation (that is, specify the
        # range as an IPv4 CIDR block). The CIDR block size must be /16 (for example, 203.0.113.25/16). It
        # must also be specified as available by the ListAvailableManagementCidrRanges operation.

        @[JSON::Field(key: "DedicatedTenancyManagementCidrRange")]
        getter dedicated_tenancy_management_cidr_range : String?

        # The status of BYOL.

        @[JSON::Field(key: "DedicatedTenancySupport")]
        getter dedicated_tenancy_support : String?

        def initialize(
          @dedicated_tenancy_management_cidr_range : String? = nil,
          @dedicated_tenancy_support : String? = nil
        )
        end
      end


      struct ModifyAccountResult
        include JSON::Serializable

        # The text message to describe the status of BYOL modification.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ModifyCertificateBasedAuthPropertiesRequest
        include JSON::Serializable

        # The resource identifiers, in the form of directory IDs.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The properties of the certificate-based authentication.

        @[JSON::Field(key: "CertificateBasedAuthProperties")]
        getter certificate_based_auth_properties : Types::CertificateBasedAuthProperties?

        # The properties of the certificate-based authentication you want to delete.

        @[JSON::Field(key: "PropertiesToDelete")]
        getter properties_to_delete : Array(String)?

        def initialize(
          @resource_id : String,
          @certificate_based_auth_properties : Types::CertificateBasedAuthProperties? = nil,
          @properties_to_delete : Array(String)? = nil
        )
        end
      end


      struct ModifyCertificateBasedAuthPropertiesResult
        include JSON::Serializable

        def initialize
        end
      end


      struct ModifyClientPropertiesRequest
        include JSON::Serializable

        # Information about the Amazon WorkSpaces client.

        @[JSON::Field(key: "ClientProperties")]
        getter client_properties : Types::ClientProperties

        # The resource identifiers, in the form of directory IDs.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @client_properties : Types::ClientProperties,
          @resource_id : String
        )
        end
      end


      struct ModifyClientPropertiesResult
        include JSON::Serializable

        def initialize
        end
      end


      struct ModifyEndpointEncryptionModeRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The encryption mode used for endpoint connections when streaming to WorkSpaces Personal or WorkSpace
        # Pools.

        @[JSON::Field(key: "EndpointEncryptionMode")]
        getter endpoint_encryption_mode : String

        def initialize(
          @directory_id : String,
          @endpoint_encryption_mode : String
        )
        end
      end


      struct ModifyEndpointEncryptionModeResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct ModifySamlPropertiesRequest
        include JSON::Serializable

        # The directory identifier for which you want to configure SAML properties.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The SAML properties to delete as part of your request. Specify one of the following options:
        # SAML_PROPERTIES_USER_ACCESS_URL to delete the user access URL.
        # SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME to delete the relay state parameter name.

        @[JSON::Field(key: "PropertiesToDelete")]
        getter properties_to_delete : Array(String)?

        # The properties for configuring SAML 2.0 authentication.

        @[JSON::Field(key: "SamlProperties")]
        getter saml_properties : Types::SamlProperties?

        def initialize(
          @resource_id : String,
          @properties_to_delete : Array(String)? = nil,
          @saml_properties : Types::SamlProperties? = nil
        )
        end
      end


      struct ModifySamlPropertiesResult
        include JSON::Serializable

        def initialize
        end
      end


      struct ModifySelfservicePermissionsRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The permissions to enable or disable self-service capabilities.

        @[JSON::Field(key: "SelfservicePermissions")]
        getter selfservice_permissions : Types::SelfservicePermissions

        def initialize(
          @resource_id : String,
          @selfservice_permissions : Types::SelfservicePermissions
        )
        end
      end


      struct ModifySelfservicePermissionsResult
        include JSON::Serializable

        def initialize
        end
      end


      struct ModifyStreamingPropertiesRequest
        include JSON::Serializable

        # The identifier of the resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The streaming properties to configure.

        @[JSON::Field(key: "StreamingProperties")]
        getter streaming_properties : Types::StreamingProperties?

        def initialize(
          @resource_id : String,
          @streaming_properties : Types::StreamingProperties? = nil
        )
        end
      end


      struct ModifyStreamingPropertiesResult
        include JSON::Serializable

        def initialize
        end
      end


      struct ModifyWorkspaceAccessPropertiesRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The device types and operating systems to enable or disable for access.

        @[JSON::Field(key: "WorkspaceAccessProperties")]
        getter workspace_access_properties : Types::WorkspaceAccessProperties

        def initialize(
          @resource_id : String,
          @workspace_access_properties : Types::WorkspaceAccessProperties
        )
        end
      end


      struct ModifyWorkspaceAccessPropertiesResult
        include JSON::Serializable

        def initialize
        end
      end


      struct ModifyWorkspaceCreationPropertiesRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The default properties for creating WorkSpaces.

        @[JSON::Field(key: "WorkspaceCreationProperties")]
        getter workspace_creation_properties : Types::WorkspaceCreationProperties

        def initialize(
          @resource_id : String,
          @workspace_creation_properties : Types::WorkspaceCreationProperties
        )
        end
      end


      struct ModifyWorkspaceCreationPropertiesResult
        include JSON::Serializable

        def initialize
        end
      end


      struct ModifyWorkspacePropertiesRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        # Indicates the data replication status.

        @[JSON::Field(key: "DataReplication")]
        getter data_replication : String?

        # The properties of the WorkSpace.

        @[JSON::Field(key: "WorkspaceProperties")]
        getter workspace_properties : Types::WorkspaceProperties?

        def initialize(
          @workspace_id : String,
          @data_replication : String? = nil,
          @workspace_properties : Types::WorkspaceProperties? = nil
        )
        end
      end


      struct ModifyWorkspacePropertiesResult
        include JSON::Serializable

        def initialize
        end
      end


      struct ModifyWorkspaceStateRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        # The WorkSpace state.

        @[JSON::Field(key: "WorkspaceState")]
        getter workspace_state : String

        def initialize(
          @workspace_id : String,
          @workspace_state : String
        )
        end
      end


      struct ModifyWorkspaceStateResult
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the network details of a WorkSpaces Pool.

      struct NetworkAccessConfiguration
        include JSON::Serializable

        # The resource identifier of the elastic network interface that is attached to instances in your VPC.
        # All network interfaces have the eni-xxxxxxxx resource identifier.

        @[JSON::Field(key: "EniId")]
        getter eni_id : String?

        # The private IP address of the elastic network interface that is attached to instances in your VPC.

        @[JSON::Field(key: "EniPrivateIpAddress")]
        getter eni_private_ip_address : String?

        def initialize(
          @eni_id : String? = nil,
          @eni_private_ip_address : String? = nil
        )
        end
      end

      # The operating system that the image is running.

      struct OperatingSystem
        include JSON::Serializable

        # The operating system.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # The operating system of the WorkSpace is not compatible with the application.

      struct OperatingSystemNotCompatibleException
        include JSON::Serializable

        def initialize
        end
      end

      # The properties of this WorkSpace are currently being modified. Try again in a moment.

      struct OperationInProgressException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This operation is not supported.

      struct OperationNotSupportedException
        include JSON::Serializable

        # The exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The exception error reason.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Information about the standby WorkSpace.

      struct PendingCreateStandbyWorkspacesRequest
        include JSON::Serializable

        # The identifier of the directory for the standby WorkSpace.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The operational state of the standby WorkSpace.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Describes the standby WorkSpace that was created. Because this operation is asynchronous, the
        # identifier returned is not immediately available for use with other operations. For example, if you
        # call DescribeWorkspaces before the WorkSpace is created, the information returned can be incomplete.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        # The identifier of the standby WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String?

        def initialize(
          @directory_id : String? = nil,
          @state : String? = nil,
          @user_name : String? = nil,
          @workspace_id : String? = nil
        )
        end
      end

      # Describes the information used to reboot a WorkSpace.

      struct RebootRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end


      struct RebootWorkspacesRequest
        include JSON::Serializable

        # The WorkSpaces to reboot. You can specify up to 25 WorkSpaces.

        @[JSON::Field(key: "RebootWorkspaceRequests")]
        getter reboot_workspace_requests : Array(Types::RebootRequest)

        def initialize(
          @reboot_workspace_requests : Array(Types::RebootRequest)
        )
        end
      end


      struct RebootWorkspacesResult
        include JSON::Serializable

        # Information about the WorkSpaces that could not be rebooted.

        @[JSON::Field(key: "FailedRequests")]
        getter failed_requests : Array(Types::FailedWorkspaceChangeRequest)?

        def initialize(
          @failed_requests : Array(Types::FailedWorkspaceChangeRequest)? = nil
        )
        end
      end

      # Describes the information used to rebuild a WorkSpace.

      struct RebuildRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end


      struct RebuildWorkspacesRequest
        include JSON::Serializable

        # The WorkSpace to rebuild. You can specify a single WorkSpace.

        @[JSON::Field(key: "RebuildWorkspaceRequests")]
        getter rebuild_workspace_requests : Array(Types::RebuildRequest)

        def initialize(
          @rebuild_workspace_requests : Array(Types::RebuildRequest)
        )
        end
      end


      struct RebuildWorkspacesResult
        include JSON::Serializable

        # Information about the WorkSpace that could not be rebuilt.

        @[JSON::Field(key: "FailedRequests")]
        getter failed_requests : Array(Types::FailedWorkspaceChangeRequest)?

        def initialize(
          @failed_requests : Array(Types::FailedWorkspaceChangeRequest)? = nil
        )
        end
      end


      struct RegisterWorkspaceDirectoryRequest
        include JSON::Serializable

        # The active directory config of the directory.

        @[JSON::Field(key: "ActiveDirectoryConfig")]
        getter active_directory_config : Types::ActiveDirectoryConfig?

        # The identifier of the directory. You cannot register a directory if it does not have a status of
        # Active. If the directory does not have a status of Active, you will receive an
        # InvalidResourceStateException error. If you have already registered the maximum number of
        # directories that you can register with Amazon WorkSpaces, you will receive a
        # ResourceLimitExceededException error. Deregister directories that you are not using for WorkSpaces,
        # and try again.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # Indicates whether self-service capabilities are enabled or disabled.

        @[JSON::Field(key: "EnableSelfService")]
        getter enable_self_service : Bool?

        # The Amazon Resource Name (ARN) of the identity center instance.

        @[JSON::Field(key: "IdcInstanceArn")]
        getter idc_instance_arn : String?

        # The details about Microsoft Entra config.

        @[JSON::Field(key: "MicrosoftEntraConfig")]
        getter microsoft_entra_config : Types::MicrosoftEntraConfig?

        # The identifiers of the subnets for your virtual private cloud (VPC). Make sure that the subnets are
        # in supported Availability Zones. The subnets must also be in separate Availability Zones. If these
        # conditions are not met, you will receive an OperationNotSupportedException error.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The tags associated with the directory.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Indicates whether your WorkSpace directory is dedicated or shared. To use Bring Your Own License
        # (BYOL) images, this value must be set to DEDICATED and your Amazon Web Services account must be
        # enabled for BYOL. If your account has not been enabled for BYOL, you will receive an
        # InvalidParameterValuesException error. For more information about BYOL images, see Bring Your Own
        # Windows Desktop Images .

        @[JSON::Field(key: "Tenancy")]
        getter tenancy : String?

        # The type of identity management the user is using.

        @[JSON::Field(key: "UserIdentityType")]
        getter user_identity_type : String?

        # Description of the directory to register.

        @[JSON::Field(key: "WorkspaceDirectoryDescription")]
        getter workspace_directory_description : String?

        # The name of the directory to register.

        @[JSON::Field(key: "WorkspaceDirectoryName")]
        getter workspace_directory_name : String?

        # Indicates whether the directory's WorkSpace type is personal or pools.

        @[JSON::Field(key: "WorkspaceType")]
        getter workspace_type : String?

        def initialize(
          @active_directory_config : Types::ActiveDirectoryConfig? = nil,
          @directory_id : String? = nil,
          @enable_self_service : Bool? = nil,
          @idc_instance_arn : String? = nil,
          @microsoft_entra_config : Types::MicrosoftEntraConfig? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tenancy : String? = nil,
          @user_identity_type : String? = nil,
          @workspace_directory_description : String? = nil,
          @workspace_directory_name : String? = nil,
          @workspace_type : String? = nil
        )
        end
      end


      struct RegisterWorkspaceDirectoryResult
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The registration status of the WorkSpace directory.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @directory_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct RejectAccountLinkInvitationRequest
        include JSON::Serializable

        # The identifier of the account link

        @[JSON::Field(key: "LinkId")]
        getter link_id : String

        # The client token of the account link invitation to reject.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @link_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct RejectAccountLinkInvitationResult
        include JSON::Serializable

        # Information about the account link.

        @[JSON::Field(key: "AccountLink")]
        getter account_link : Types::AccountLink?

        def initialize(
          @account_link : Types::AccountLink? = nil
        )
        end
      end

      # Describes the related WorkSpace. The related WorkSpace could be a standby WorkSpace or primary
      # WorkSpace related to the specified WorkSpace.

      struct RelatedWorkspaceProperties
        include JSON::Serializable

        # The Region of the related WorkSpace.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Indicates the state of the WorkSpace.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Indicates the type of WorkSpace.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The identifier of the related WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String?

        def initialize(
          @region : String? = nil,
          @state : String? = nil,
          @type : String? = nil,
          @workspace_id : String? = nil
        )
        end
      end

      # The specified resource already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource is associated with a directory.

      struct ResourceAssociatedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource could not be created.

      struct ResourceCreationFailedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource is currently in use.

      struct ResourceInUseException
        include JSON::Serializable

        # The ID of the resource that is in use.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @resource_id : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Your resource limits have been exceeded.

      struct ResourceLimitExceededException
        include JSON::Serializable

        # The exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The ID of the resource that could not be found.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The resource could not be found.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @resource_id : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The specified resource is not available.

      struct ResourceUnavailableException
        include JSON::Serializable

        # The identifier of the resource that is not available.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @resource_id : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct RestoreWorkspaceRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end


      struct RestoreWorkspaceResult
        include JSON::Serializable

        def initialize
        end
      end


      struct RevokeIpRulesRequest
        include JSON::Serializable

        # The identifier of the group.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The rules to remove from the group.

        @[JSON::Field(key: "UserRules")]
        getter user_rules : Array(String)

        def initialize(
          @group_id : String,
          @user_rules : Array(String)
        )
        end
      end


      struct RevokeIpRulesResult
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the root volume for a WorkSpace bundle.

      struct RootStorage
        include JSON::Serializable

        # The size of the root volume.

        @[JSON::Field(key: "Capacity")]
        getter capacity : String

        def initialize(
          @capacity : String
        )
        end
      end

      # Describes the enablement status, user access URL, and relay state parameter name that are used for
      # configuring federation with an SAML 2.0 identity provider.

      struct SamlProperties
        include JSON::Serializable

        # The relay state parameter name supported by the SAML 2.0 identity provider (IdP). When the end user
        # is redirected to the user access URL from the WorkSpaces client application, this relay state
        # parameter name is appended as a query parameter to the URL along with the relay state endpoint to
        # return the user to the client application session. To use SAML 2.0 authentication with WorkSpaces,
        # the IdP must support IdP-initiated deep linking for the relay state URL. Consult your IdP
        # documentation for more information.

        @[JSON::Field(key: "RelayStateParameterName")]
        getter relay_state_parameter_name : String?

        # Indicates the status of SAML 2.0 authentication. These statuses include the following. If the
        # setting is DISABLED , end users will be directed to login with their directory credentials. If the
        # setting is ENABLED , end users will be directed to login via the user access URL. Users attempting
        # to connect to WorkSpaces from a client application that does not support SAML 2.0 authentication
        # will not be able to connect. If the setting is ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK , end users
        # will be directed to login via the user access URL on supported client applications, but will not
        # prevent clients that do not support SAML 2.0 authentication from connecting as if SAML 2.0
        # authentication was disabled.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The SAML 2.0 identity provider (IdP) user access URL is the URL a user would navigate to in their
        # web browser in order to federate from the IdP and directly access the application, without any SAML
        # 2.0 service provider (SP) bindings.

        @[JSON::Field(key: "UserAccessUrl")]
        getter user_access_url : String?

        def initialize(
          @relay_state_parameter_name : String? = nil,
          @status : String? = nil,
          @user_access_url : String? = nil
        )
        end
      end

      # Describes the self-service permissions for a directory. For more information, see Enable
      # Self-Service WorkSpace Management Capabilities for Your Users .

      struct SelfservicePermissions
        include JSON::Serializable

        # Specifies whether users can change the compute type (bundle) for their WorkSpace.

        @[JSON::Field(key: "ChangeComputeType")]
        getter change_compute_type : String?

        # Specifies whether users can increase the volume size of the drives on their WorkSpace.

        @[JSON::Field(key: "IncreaseVolumeSize")]
        getter increase_volume_size : String?

        # Specifies whether users can rebuild the operating system of a WorkSpace to its original state.

        @[JSON::Field(key: "RebuildWorkspace")]
        getter rebuild_workspace : String?

        # Specifies whether users can restart their WorkSpace.

        @[JSON::Field(key: "RestartWorkspace")]
        getter restart_workspace : String?

        # Specifies whether users can switch the running mode of their WorkSpace.

        @[JSON::Field(key: "SwitchRunningMode")]
        getter switch_running_mode : String?

        def initialize(
          @change_compute_type : String? = nil,
          @increase_volume_size : String? = nil,
          @rebuild_workspace : String? = nil,
          @restart_workspace : String? = nil,
          @switch_running_mode : String? = nil
        )
        end
      end

      # Describes a snapshot.

      struct Snapshot
        include JSON::Serializable

        # The time when the snapshot was created.

        @[JSON::Field(key: "SnapshotTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter snapshot_time : Time?

        def initialize(
          @snapshot_time : Time? = nil
        )
        end
      end

      # Describes a standby WorkSpace.

      struct StandbyWorkspace
        include JSON::Serializable

        # The identifier of the directory for the standby WorkSpace.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The identifier of the standby WorkSpace.

        @[JSON::Field(key: "PrimaryWorkspaceId")]
        getter primary_workspace_id : String

        # Indicates whether data replication is enabled, and if enabled, the type of data replication.

        @[JSON::Field(key: "DataReplication")]
        getter data_replication : String?

        # The tags associated with the standby WorkSpace.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The volume encryption key of the standby WorkSpace.

        @[JSON::Field(key: "VolumeEncryptionKey")]
        getter volume_encryption_key : String?

        def initialize(
          @directory_id : String,
          @primary_workspace_id : String,
          @data_replication : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_encryption_key : String? = nil
        )
        end
      end

      # Describes the properties of the related standby WorkSpaces.

      struct StandbyWorkspacesProperties
        include JSON::Serializable

        # Indicates whether data replication is enabled, and if enabled, the type of data replication.

        @[JSON::Field(key: "DataReplication")]
        getter data_replication : String?

        # The date and time at which the last successful snapshot was taken of the primary WorkSpace used for
        # replicating data.

        @[JSON::Field(key: "RecoverySnapshotTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter recovery_snapshot_time : Time?

        # The identifier of the standby WorkSpace

        @[JSON::Field(key: "StandbyWorkspaceId")]
        getter standby_workspace_id : String?

        def initialize(
          @data_replication : String? = nil,
          @recovery_snapshot_time : Time? = nil,
          @standby_workspace_id : String? = nil
        )
        end
      end

      # Information used to start a WorkSpace.

      struct StartRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String?

        def initialize(
          @workspace_id : String? = nil
        )
        end
      end


      struct StartWorkspacesPoolRequest
        include JSON::Serializable

        # The identifier of the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        def initialize(
          @pool_id : String
        )
        end
      end


      struct StartWorkspacesPoolResult
        include JSON::Serializable

        def initialize
        end
      end


      struct StartWorkspacesRequest
        include JSON::Serializable

        # The WorkSpaces to start. You can specify up to 25 WorkSpaces.

        @[JSON::Field(key: "StartWorkspaceRequests")]
        getter start_workspace_requests : Array(Types::StartRequest)

        def initialize(
          @start_workspace_requests : Array(Types::StartRequest)
        )
        end
      end


      struct StartWorkspacesResult
        include JSON::Serializable

        # Information about the WorkSpaces that could not be started.

        @[JSON::Field(key: "FailedRequests")]
        getter failed_requests : Array(Types::FailedWorkspaceChangeRequest)?

        def initialize(
          @failed_requests : Array(Types::FailedWorkspaceChangeRequest)? = nil
        )
        end
      end

      # Describes the information used to stop a WorkSpace.

      struct StopRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String?

        def initialize(
          @workspace_id : String? = nil
        )
        end
      end


      struct StopWorkspacesPoolRequest
        include JSON::Serializable

        # The identifier of the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        def initialize(
          @pool_id : String
        )
        end
      end


      struct StopWorkspacesPoolResult
        include JSON::Serializable

        def initialize
        end
      end


      struct StopWorkspacesRequest
        include JSON::Serializable

        # The WorkSpaces to stop. You can specify up to 25 WorkSpaces.

        @[JSON::Field(key: "StopWorkspaceRequests")]
        getter stop_workspace_requests : Array(Types::StopRequest)

        def initialize(
          @stop_workspace_requests : Array(Types::StopRequest)
        )
        end
      end


      struct StopWorkspacesResult
        include JSON::Serializable

        # Information about the WorkSpaces that could not be stopped.

        @[JSON::Field(key: "FailedRequests")]
        getter failed_requests : Array(Types::FailedWorkspaceChangeRequest)?

        def initialize(
          @failed_requests : Array(Types::FailedWorkspaceChangeRequest)? = nil
        )
        end
      end

      # Describes the storage connector.

      struct StorageConnector
        include JSON::Serializable

        # The type of connector used to save user files.

        @[JSON::Field(key: "ConnectorType")]
        getter connector_type : String

        # Indicates if the storage connetor is enabled or disabled.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @connector_type : String,
          @status : String
        )
        end
      end

      # Describes the streaming properties.

      struct StreamingProperties
        include JSON::Serializable

        # Indicates the Global Accelerator properties.

        @[JSON::Field(key: "GlobalAccelerator")]
        getter global_accelerator : Types::GlobalAcceleratorForDirectory?

        # Indicates the storage connector used

        @[JSON::Field(key: "StorageConnectors")]
        getter storage_connectors : Array(Types::StorageConnector)?

        # Indicates the type of preferred protocol for the streaming experience.

        @[JSON::Field(key: "StreamingExperiencePreferredProtocol")]
        getter streaming_experience_preferred_protocol : String?

        # Indicates the permission settings asscoiated with the user.

        @[JSON::Field(key: "UserSettings")]
        getter user_settings : Array(Types::UserSetting)?

        def initialize(
          @global_accelerator : Types::GlobalAcceleratorForDirectory? = nil,
          @storage_connectors : Array(Types::StorageConnector)? = nil,
          @streaming_experience_preferred_protocol : String? = nil,
          @user_settings : Array(Types::UserSetting)? = nil
        )
        end
      end

      # Describes a tag.

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # Describes the information used to terminate a WorkSpace.

      struct TerminateRequest
        include JSON::Serializable

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String

        def initialize(
          @workspace_id : String
        )
        end
      end


      struct TerminateWorkspacesPoolRequest
        include JSON::Serializable

        # The identifier of the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        def initialize(
          @pool_id : String
        )
        end
      end


      struct TerminateWorkspacesPoolResult
        include JSON::Serializable

        def initialize
        end
      end


      struct TerminateWorkspacesPoolSessionRequest
        include JSON::Serializable

        # The identifier of the pool session.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end


      struct TerminateWorkspacesPoolSessionResult
        include JSON::Serializable

        def initialize
        end
      end


      struct TerminateWorkspacesRequest
        include JSON::Serializable

        # The WorkSpaces to terminate. You can specify up to 25 WorkSpaces.

        @[JSON::Field(key: "TerminateWorkspaceRequests")]
        getter terminate_workspace_requests : Array(Types::TerminateRequest)

        def initialize(
          @terminate_workspace_requests : Array(Types::TerminateRequest)
        )
        end
      end


      struct TerminateWorkspacesResult
        include JSON::Serializable

        # Information about the WorkSpaces that could not be terminated.

        @[JSON::Field(key: "FailedRequests")]
        getter failed_requests : Array(Types::FailedWorkspaceChangeRequest)?

        def initialize(
          @failed_requests : Array(Types::FailedWorkspaceChangeRequest)? = nil
        )
        end
      end

      # Describes the timeout settings for a pool of WorkSpaces.

      struct TimeoutSettings
        include JSON::Serializable

        # Specifies the amount of time, in seconds, that a streaming session remains active after users
        # disconnect. If users try to reconnect to the streaming session after a disconnection or network
        # interruption within the time set, they are connected to their previous session. Otherwise, they are
        # connected to a new session with a new streaming instance.

        @[JSON::Field(key: "DisconnectTimeoutInSeconds")]
        getter disconnect_timeout_in_seconds : Int32?

        # The amount of time in seconds a connection will stay active while idle.

        @[JSON::Field(key: "IdleDisconnectTimeoutInSeconds")]
        getter idle_disconnect_timeout_in_seconds : Int32?

        # Specifies the maximum amount of time, in seconds, that a streaming session can remain active. If
        # users are still connected to a streaming instance five minutes before this limit is reached, they
        # are prompted to save any open documents before being disconnected. After this time elapses, the
        # instance is terminated and replaced by a new instance.

        @[JSON::Field(key: "MaxUserDurationInSeconds")]
        getter max_user_duration_in_seconds : Int32?

        def initialize(
          @disconnect_timeout_in_seconds : Int32? = nil,
          @idle_disconnect_timeout_in_seconds : Int32? = nil,
          @max_user_duration_in_seconds : Int32? = nil
        )
        end
      end

      # The configuration of this network is not supported for this operation, or your network configuration
      # conflicts with the Amazon WorkSpaces management network IP range. For more information, see
      # Configure a VPC for Amazon WorkSpaces .

      struct UnsupportedNetworkConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration of this WorkSpace is not supported for this operation. For more information, see
      # Required Configuration and Service Components for WorkSpaces .

      struct UnsupportedWorkspaceConfigurationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateConnectClientAddInRequest
        include JSON::Serializable

        # The identifier of the client add-in to update.

        @[JSON::Field(key: "AddInId")]
        getter add_in_id : String

        # The directory identifier for which the client add-in is configured.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The name of the client add-in.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The endpoint URL of the Amazon Connect client add-in.

        @[JSON::Field(key: "URL")]
        getter url : String?

        def initialize(
          @add_in_id : String,
          @resource_id : String,
          @name : String? = nil,
          @url : String? = nil
        )
        end
      end


      struct UpdateConnectClientAddInResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateConnectionAliasPermissionRequest
        include JSON::Serializable

        # The identifier of the connection alias that you want to update permissions for.

        @[JSON::Field(key: "AliasId")]
        getter alias_id : String

        # Indicates whether to share or unshare the connection alias with the specified Amazon Web Services
        # account.

        @[JSON::Field(key: "ConnectionAliasPermission")]
        getter connection_alias_permission : Types::ConnectionAliasPermission

        def initialize(
          @alias_id : String,
          @connection_alias_permission : Types::ConnectionAliasPermission
        )
        end
      end


      struct UpdateConnectionAliasPermissionResult
        include JSON::Serializable

        def initialize
        end
      end

      # Describes whether a WorkSpace image needs to be updated with the latest drivers and other components
      # required by Amazon WorkSpaces. Only Windows 10 WorkSpace images can be programmatically updated at
      # this time.

      struct UpdateResult
        include JSON::Serializable

        # A description of whether updates for the WorkSpace image are pending or available.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether updated drivers or other components are available for the specified WorkSpace
        # image.

        @[JSON::Field(key: "UpdateAvailable")]
        getter update_available : Bool?

        def initialize(
          @description : String? = nil,
          @update_available : Bool? = nil
        )
        end
      end


      struct UpdateRulesOfIpGroupRequest
        include JSON::Serializable

        # The identifier of the group.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # One or more rules.

        @[JSON::Field(key: "UserRules")]
        getter user_rules : Array(Types::IpRuleItem)

        def initialize(
          @group_id : String,
          @user_rules : Array(Types::IpRuleItem)
        )
        end
      end


      struct UpdateRulesOfIpGroupResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateWorkspaceBundleRequest
        include JSON::Serializable

        # The identifier of the bundle.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The identifier of the image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        def initialize(
          @bundle_id : String? = nil,
          @image_id : String? = nil
        )
        end
      end


      struct UpdateWorkspaceBundleResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateWorkspaceImagePermissionRequest
        include JSON::Serializable

        # The permission to copy the image. This permission can be revoked only after an image has been
        # shared.

        @[JSON::Field(key: "AllowCopyImage")]
        getter allow_copy_image : Bool

        # The identifier of the image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String

        # The identifier of the Amazon Web Services account to share or unshare the image with. Before sharing
        # the image, confirm that you are sharing to the correct Amazon Web Services account ID.

        @[JSON::Field(key: "SharedAccountId")]
        getter shared_account_id : String

        def initialize(
          @allow_copy_image : Bool,
          @image_id : String,
          @shared_account_id : String
        )
        end
      end


      struct UpdateWorkspaceImagePermissionResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateWorkspacesPoolRequest
        include JSON::Serializable

        # The identifier of the specified pool to update.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # The persistent application settings for users in the pool.

        @[JSON::Field(key: "ApplicationSettings")]
        getter application_settings : Types::ApplicationSettingsRequest?

        # The identifier of the bundle.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The desired capacity for the pool.

        @[JSON::Field(key: "Capacity")]
        getter capacity : Types::Capacity?

        # Describes the specified pool to update.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The desired running mode for the pool. The running mode can only be updated when the pool is in a
        # stopped state.

        @[JSON::Field(key: "RunningMode")]
        getter running_mode : String?

        # Indicates the timeout settings of the specified pool.

        @[JSON::Field(key: "TimeoutSettings")]
        getter timeout_settings : Types::TimeoutSettings?

        def initialize(
          @pool_id : String,
          @application_settings : Types::ApplicationSettingsRequest? = nil,
          @bundle_id : String? = nil,
          @capacity : Types::Capacity? = nil,
          @description : String? = nil,
          @directory_id : String? = nil,
          @running_mode : String? = nil,
          @timeout_settings : Types::TimeoutSettings? = nil
        )
        end
      end


      struct UpdateWorkspacesPoolResult
        include JSON::Serializable

        # Describes the specified pool.

        @[JSON::Field(key: "WorkspacesPool")]
        getter workspaces_pool : Types::WorkspacesPool?

        def initialize(
          @workspaces_pool : Types::WorkspacesPool? = nil
        )
        end
      end

      # Information about the user's permission settings.

      struct UserSetting
        include JSON::Serializable

        # Indicates the type of action.

        @[JSON::Field(key: "Action")]
        getter action : String

        # Indicates if the setting is enabled or disabled.

        @[JSON::Field(key: "Permission")]
        getter permission : String

        # Indicates the maximum character length for the specified user setting.

        @[JSON::Field(key: "MaximumLength")]
        getter maximum_length : Int32?

        def initialize(
          @action : String,
          @permission : String,
          @maximum_length : Int32? = nil
        )
        end
      end

      # Describes the user volume for a WorkSpace bundle.

      struct UserStorage
        include JSON::Serializable

        # The size of the user volume.

        @[JSON::Field(key: "Capacity")]
        getter capacity : String

        def initialize(
          @capacity : String
        )
        end
      end

      # You either haven't provided a TargetAccountId or are using the same value for TargetAccountId and
      # SourceAccountId .

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the WorkSpace application.

      struct WorkSpaceApplication
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The time the application is created.

        @[JSON::Field(key: "Created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The description of the WorkSpace application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The license availability for the applications.

        @[JSON::Field(key: "LicenseType")]
        getter license_type : String?

        # The name of the WorkSpace application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The owner of the WorkSpace application.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The status of WorkSpace application.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The supported compute types of the WorkSpace application.

        @[JSON::Field(key: "SupportedComputeTypeNames")]
        getter supported_compute_type_names : Array(String)?

        # The supported operating systems of the WorkSpace application.

        @[JSON::Field(key: "SupportedOperatingSystemNames")]
        getter supported_operating_system_names : Array(String)?

        def initialize(
          @application_id : String? = nil,
          @created : Time? = nil,
          @description : String? = nil,
          @license_type : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @state : String? = nil,
          @supported_compute_type_names : Array(String)? = nil,
          @supported_operating_system_names : Array(String)? = nil
        )
        end
      end

      # Describes the WorkSpace application deployment.

      struct WorkSpaceApplicationDeployment
        include JSON::Serializable

        # The associations between the applications and the associated resources.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::WorkspaceResourceAssociation)?

        def initialize(
          @associations : Array(Types::WorkspaceResourceAssociation)? = nil
        )
        end
      end

      # Describes a WorkSpace.

      struct Workspace
        include JSON::Serializable

        # The identifier of the bundle used to create the WorkSpace.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The name of the WorkSpace, as seen by the operating system. The format of this name varies. For more
        # information, see Launch a WorkSpace .

        @[JSON::Field(key: "ComputerName")]
        getter computer_name : String?

        # Indicates the settings of the data replication.

        @[JSON::Field(key: "DataReplicationSettings")]
        getter data_replication_settings : Types::DataReplicationSettings?

        # The identifier of the Directory Service directory for the WorkSpace.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The error code that is returned if the WorkSpace cannot be created.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The text of the error message that is returned if the WorkSpace cannot be created.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The IP address of the WorkSpace.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The IPv6 address of the WorkSpace.

        @[JSON::Field(key: "Ipv6Address")]
        getter ipv6_address : String?

        # The modification states of the WorkSpace.

        @[JSON::Field(key: "ModificationStates")]
        getter modification_states : Array(Types::ModificationState)?

        # The standby WorkSpace or primary WorkSpace related to the specified WorkSpace.

        @[JSON::Field(key: "RelatedWorkspaces")]
        getter related_workspaces : Array(Types::RelatedWorkspaceProperties)?

        # Indicates whether the data stored on the root volume is encrypted.

        @[JSON::Field(key: "RootVolumeEncryptionEnabled")]
        getter root_volume_encryption_enabled : Bool?

        # The properties of the standby WorkSpace

        @[JSON::Field(key: "StandbyWorkspacesProperties")]
        getter standby_workspaces_properties : Array(Types::StandbyWorkspacesProperties)?

        # The operational state of the WorkSpace. PENDING – The WorkSpace is in a waiting state (for example,
        # the WorkSpace is being created). AVAILABLE – The WorkSpace is running and has passed the health
        # checks. IMPAIRED – Refer to UNHEALTHY state. UNHEALTHY – The WorkSpace is not responding to health
        # checks. REBOOTING – The WorkSpace is being rebooted (restarted). STARTING – The WorkSpace is
        # starting up and health checks are being run. REBUILDING – The WorkSpace is being rebuilt. RESTORING
        # – The WorkSpace is being restored. MAINTENANCE – The WorkSpace is undergoing scheduled maintenance
        # by Amazon Web Services. ADMIN_MAINTENANCE – The WorkSpace is undergoing maintenance by the
        # WorkSpaces administrator. TERMINATING – The WorkSpace is being deleted. TERMINATED – The WorkSpace
        # has been deleted. SUSPENDED – The WorkSpace has been suspended for image creation. UPDATING – The
        # WorkSpace is undergoing an update. STOPPING – The WorkSpace is being stopped. STOPPED – The
        # WorkSpace has been stopped. ERROR – The WorkSpace is an error state (for example, an error occurred
        # during startup). After a WorkSpace is terminated, the TERMINATED state is returned only briefly
        # before the WorkSpace directory metadata is cleaned up, so this state is rarely returned. To confirm
        # that a WorkSpace is terminated, check for the WorkSpace ID by using DescribeWorkSpaces . If the
        # WorkSpace ID isn't returned, then the WorkSpace has been successfully terminated.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The identifier of the subnet for the WorkSpace.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        # The user for the WorkSpace.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        # Indicates whether the data stored on the user volume is encrypted.

        @[JSON::Field(key: "UserVolumeEncryptionEnabled")]
        getter user_volume_encryption_enabled : Bool?

        # The ARN of the symmetric KMS key used to encrypt data stored on your WorkSpace. Amazon WorkSpaces
        # does not support asymmetric KMS keys.

        @[JSON::Field(key: "VolumeEncryptionKey")]
        getter volume_encryption_key : String?

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String?

        # The name of the user-decoupled WorkSpace.

        @[JSON::Field(key: "WorkspaceName")]
        getter workspace_name : String?

        # The properties of the WorkSpace.

        @[JSON::Field(key: "WorkspaceProperties")]
        getter workspace_properties : Types::WorkspaceProperties?

        def initialize(
          @bundle_id : String? = nil,
          @computer_name : String? = nil,
          @data_replication_settings : Types::DataReplicationSettings? = nil,
          @directory_id : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @ip_address : String? = nil,
          @ipv6_address : String? = nil,
          @modification_states : Array(Types::ModificationState)? = nil,
          @related_workspaces : Array(Types::RelatedWorkspaceProperties)? = nil,
          @root_volume_encryption_enabled : Bool? = nil,
          @standby_workspaces_properties : Array(Types::StandbyWorkspacesProperties)? = nil,
          @state : String? = nil,
          @subnet_id : String? = nil,
          @user_name : String? = nil,
          @user_volume_encryption_enabled : Bool? = nil,
          @volume_encryption_key : String? = nil,
          @workspace_id : String? = nil,
          @workspace_name : String? = nil,
          @workspace_properties : Types::WorkspaceProperties? = nil
        )
        end
      end

      # The device types and operating systems that can be used to access a WorkSpace. For more information,
      # see Amazon WorkSpaces Client Network Requirements .

      struct WorkspaceAccessProperties
        include JSON::Serializable

        # Specifies the configuration for accessing the WorkSpace.

        @[JSON::Field(key: "AccessEndpointConfig")]
        getter access_endpoint_config : Types::AccessEndpointConfig?

        # Indicates whether users can use Android and Android-compatible Chrome OS devices to access their
        # WorkSpaces.

        @[JSON::Field(key: "DeviceTypeAndroid")]
        getter device_type_android : String?

        # Indicates whether users can use Chromebooks to access their WorkSpaces.

        @[JSON::Field(key: "DeviceTypeChromeOs")]
        getter device_type_chrome_os : String?

        # Indicates whether users can use iOS devices to access their WorkSpaces.

        @[JSON::Field(key: "DeviceTypeIos")]
        getter device_type_ios : String?

        # Indicates whether users can use Linux clients to access their WorkSpaces.

        @[JSON::Field(key: "DeviceTypeLinux")]
        getter device_type_linux : String?

        # Indicates whether users can use macOS clients to access their WorkSpaces.

        @[JSON::Field(key: "DeviceTypeOsx")]
        getter device_type_osx : String?

        # Indicates whether users can access their WorkSpaces through a web browser.

        @[JSON::Field(key: "DeviceTypeWeb")]
        getter device_type_web : String?

        # Indicates whether users can use Windows clients to access their WorkSpaces.

        @[JSON::Field(key: "DeviceTypeWindows")]
        getter device_type_windows : String?

        # Indicates whether users can access their WorkSpaces through a WorkSpaces Thin Client.

        @[JSON::Field(key: "DeviceTypeWorkSpacesThinClient")]
        getter device_type_work_spaces_thin_client : String?

        # Indicates whether users can use zero client devices to access their WorkSpaces.

        @[JSON::Field(key: "DeviceTypeZeroClient")]
        getter device_type_zero_client : String?

        def initialize(
          @access_endpoint_config : Types::AccessEndpointConfig? = nil,
          @device_type_android : String? = nil,
          @device_type_chrome_os : String? = nil,
          @device_type_ios : String? = nil,
          @device_type_linux : String? = nil,
          @device_type_osx : String? = nil,
          @device_type_web : String? = nil,
          @device_type_windows : String? = nil,
          @device_type_work_spaces_thin_client : String? = nil,
          @device_type_zero_client : String? = nil
        )
        end
      end

      # Describes a WorkSpace bundle.

      struct WorkspaceBundle
        include JSON::Serializable

        # The identifier of the bundle.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String?

        # The type of WorkSpace bundle.

        @[JSON::Field(key: "BundleType")]
        getter bundle_type : String?

        # The compute type of the bundle. For more information, see Amazon WorkSpaces Bundles .

        @[JSON::Field(key: "ComputeType")]
        getter compute_type : Types::ComputeType?

        # The time when the bundle was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The description of the bundle.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the image that was used to create the bundle.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The last time that the bundle was updated.

        @[JSON::Field(key: "LastUpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The name of the bundle.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The owner of the bundle. This is the account identifier of the owner, or AMAZON if the bundle is
        # provided by Amazon Web Services.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The size of the root volume.

        @[JSON::Field(key: "RootStorage")]
        getter root_storage : Types::RootStorage?

        # The state of the WorkSpace bundle.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The size of the user volume.

        @[JSON::Field(key: "UserStorage")]
        getter user_storage : Types::UserStorage?

        def initialize(
          @bundle_id : String? = nil,
          @bundle_type : String? = nil,
          @compute_type : Types::ComputeType? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @image_id : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @root_storage : Types::RootStorage? = nil,
          @state : String? = nil,
          @user_storage : Types::UserStorage? = nil
        )
        end
      end

      # Describes the connection status of a WorkSpace.

      struct WorkspaceConnectionStatus
        include JSON::Serializable

        # The connection state of the WorkSpace. The connection state is unknown if the WorkSpace is stopped.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # The timestamp of the connection status check.

        @[JSON::Field(key: "ConnectionStateCheckTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter connection_state_check_timestamp : Time?

        # The timestamp of the last known user connection.

        @[JSON::Field(key: "LastKnownUserConnectionTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_known_user_connection_timestamp : Time?

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String?

        def initialize(
          @connection_state : String? = nil,
          @connection_state_check_timestamp : Time? = nil,
          @last_known_user_connection_timestamp : Time? = nil,
          @workspace_id : String? = nil
        )
        end
      end

      # Describes the default properties that are used for creating WorkSpaces. For more information, see
      # Update Directory Details for Your WorkSpaces .

      struct WorkspaceCreationProperties
        include JSON::Serializable

        # The identifier of your custom security group.

        @[JSON::Field(key: "CustomSecurityGroupId")]
        getter custom_security_group_id : String?

        # The default organizational unit (OU) for your WorkSpaces directories. This string must be the full
        # Lightweight Directory Access Protocol (LDAP) distinguished name for the target domain and OU. It
        # must be in the form "OU= value ,DC= value ,DC= value " , where value is any string of characters,
        # and the number of domain components (DCs) is two or more. For example,
        # OU=WorkSpaces_machines,DC=machines,DC=example,DC=com . To avoid errors, certain characters in the
        # distinguished name must be escaped. For more information, see Distinguished Names in the Microsoft
        # documentation. The API doesn't validate whether the OU exists.

        @[JSON::Field(key: "DefaultOu")]
        getter default_ou : String?

        # Indicates whether internet access is enabled for your WorkSpaces.

        @[JSON::Field(key: "EnableInternetAccess")]
        getter enable_internet_access : Bool?

        # Indicates whether maintenance mode is enabled for your WorkSpaces. For more information, see
        # WorkSpace Maintenance .

        @[JSON::Field(key: "EnableMaintenanceMode")]
        getter enable_maintenance_mode : Bool?

        # Indicates the IAM role ARN of the instance.

        @[JSON::Field(key: "InstanceIamRoleArn")]
        getter instance_iam_role_arn : String?

        # Indicates whether users are local administrators of their WorkSpaces.

        @[JSON::Field(key: "UserEnabledAsLocalAdministrator")]
        getter user_enabled_as_local_administrator : Bool?

        def initialize(
          @custom_security_group_id : String? = nil,
          @default_ou : String? = nil,
          @enable_internet_access : Bool? = nil,
          @enable_maintenance_mode : Bool? = nil,
          @instance_iam_role_arn : String? = nil,
          @user_enabled_as_local_administrator : Bool? = nil
        )
        end
      end

      # Describes a directory that is used with Amazon WorkSpaces.

      struct WorkspaceDirectory
        include JSON::Serializable

        # Information about the Active Directory config.

        @[JSON::Field(key: "ActiveDirectoryConfig")]
        getter active_directory_config : Types::ActiveDirectoryConfig?

        # The directory alias.

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The certificate-based authentication properties used to authenticate SAML 2.0 Identity Provider
        # (IdP) user identities to Active Directory for WorkSpaces login.

        @[JSON::Field(key: "CertificateBasedAuthProperties")]
        getter certificate_based_auth_properties : Types::CertificateBasedAuthProperties?

        # The user name for the service account.

        @[JSON::Field(key: "CustomerUserName")]
        getter customer_user_name : String?

        # The directory identifier.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The name of the directory.

        @[JSON::Field(key: "DirectoryName")]
        getter directory_name : String?

        # The directory type.

        @[JSON::Field(key: "DirectoryType")]
        getter directory_type : String?

        # The IP addresses of the DNS servers for the directory.

        @[JSON::Field(key: "DnsIpAddresses")]
        getter dns_ip_addresses : Array(String)?

        # The IPv6 addresses of the DNS servers for the directory.

        @[JSON::Field(key: "DnsIpv6Addresses")]
        getter dns_ipv6_addresses : Array(String)?

        # Endpoint encryption mode that allows you to configure the specified directory between Standard TLS
        # and FIPS 140-2 validated mode.

        @[JSON::Field(key: "EndpointEncryptionMode")]
        getter endpoint_encryption_mode : String?

        # The error message returned.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Specifies details about identity center configurations.

        @[JSON::Field(key: "IDCConfig")]
        getter idc_config : Types::IDCConfig?

        # The identifier of the IAM role. This is the role that allows Amazon WorkSpaces to make calls to
        # other services, such as Amazon EC2, on your behalf.

        @[JSON::Field(key: "IamRoleId")]
        getter iam_role_id : String?

        # Specifies details about Microsoft Entra configurations.

        @[JSON::Field(key: "MicrosoftEntraConfig")]
        getter microsoft_entra_config : Types::MicrosoftEntraConfig?

        # The registration code for the directory. This is the code that users enter in their Amazon
        # WorkSpaces client application to connect to the directory.

        @[JSON::Field(key: "RegistrationCode")]
        getter registration_code : String?

        # Describes the enablement status, user access URL, and relay state parameter name that are used for
        # configuring federation with an SAML 2.0 identity provider.

        @[JSON::Field(key: "SamlProperties")]
        getter saml_properties : Types::SamlProperties?

        # The default self-service permissions for WorkSpaces in the directory.

        @[JSON::Field(key: "SelfservicePermissions")]
        getter selfservice_permissions : Types::SelfservicePermissions?

        # The state of the directory's registration with Amazon WorkSpaces. After a directory is deregistered,
        # the DEREGISTERED state is returned very briefly before the directory metadata is cleaned up, so this
        # state is rarely returned. To confirm that a directory is deregistered, check for the directory ID by
        # using DescribeWorkspaceDirectories . If the directory ID isn't returned, then the directory has been
        # successfully deregistered.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The streaming properties to configure.

        @[JSON::Field(key: "StreamingProperties")]
        getter streaming_properties : Types::StreamingProperties?

        # The identifiers of the subnets used with the directory.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # Specifies whether the directory is dedicated or shared. To use Bring Your Own License (BYOL), this
        # value must be set to DEDICATED . For more information, see Bring Your Own Windows Desktop Images .

        @[JSON::Field(key: "Tenancy")]
        getter tenancy : String?

        # Indicates the identity type of the specifired user.

        @[JSON::Field(key: "UserIdentityType")]
        getter user_identity_type : String?

        # The devices and operating systems that users can use to access WorkSpaces.

        @[JSON::Field(key: "WorkspaceAccessProperties")]
        getter workspace_access_properties : Types::WorkspaceAccessProperties?

        # The default creation properties for all WorkSpaces in the directory.

        @[JSON::Field(key: "WorkspaceCreationProperties")]
        getter workspace_creation_properties : Types::DefaultWorkspaceCreationProperties?

        # The description of the WorkSpace directory

        @[JSON::Field(key: "WorkspaceDirectoryDescription")]
        getter workspace_directory_description : String?

        # The name fo the WorkSpace directory.

        @[JSON::Field(key: "WorkspaceDirectoryName")]
        getter workspace_directory_name : String?

        # The identifier of the security group that is assigned to new WorkSpaces.

        @[JSON::Field(key: "WorkspaceSecurityGroupId")]
        getter workspace_security_group_id : String?

        # Indicates whether the directory's WorkSpace type is personal or pools.

        @[JSON::Field(key: "WorkspaceType")]
        getter workspace_type : String?

        # The identifiers of the IP access control groups associated with the directory.

        @[JSON::Field(key: "ipGroupIds")]
        getter ip_group_ids : Array(String)?

        def initialize(
          @active_directory_config : Types::ActiveDirectoryConfig? = nil,
          @alias : String? = nil,
          @certificate_based_auth_properties : Types::CertificateBasedAuthProperties? = nil,
          @customer_user_name : String? = nil,
          @directory_id : String? = nil,
          @directory_name : String? = nil,
          @directory_type : String? = nil,
          @dns_ip_addresses : Array(String)? = nil,
          @dns_ipv6_addresses : Array(String)? = nil,
          @endpoint_encryption_mode : String? = nil,
          @error_message : String? = nil,
          @idc_config : Types::IDCConfig? = nil,
          @iam_role_id : String? = nil,
          @microsoft_entra_config : Types::MicrosoftEntraConfig? = nil,
          @registration_code : String? = nil,
          @saml_properties : Types::SamlProperties? = nil,
          @selfservice_permissions : Types::SelfservicePermissions? = nil,
          @state : String? = nil,
          @streaming_properties : Types::StreamingProperties? = nil,
          @subnet_ids : Array(String)? = nil,
          @tenancy : String? = nil,
          @user_identity_type : String? = nil,
          @workspace_access_properties : Types::WorkspaceAccessProperties? = nil,
          @workspace_creation_properties : Types::DefaultWorkspaceCreationProperties? = nil,
          @workspace_directory_description : String? = nil,
          @workspace_directory_name : String? = nil,
          @workspace_security_group_id : String? = nil,
          @workspace_type : String? = nil,
          @ip_group_ids : Array(String)? = nil
        )
        end
      end

      # Describes a WorkSpace image.

      struct WorkspaceImage
        include JSON::Serializable

        # The date when the image was created. If the image has been shared, the Amazon Web Services account
        # that the image has been shared with sees the original creation date of the image.

        @[JSON::Field(key: "Created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The description of the image.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The error code that is returned for the image.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Additional details of the error returned for the image, including the possible causes of the errors
        # and troubleshooting information.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ErrorDetails)?

        # The text of the error message that is returned for the image.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The identifier of the image.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The name of the image.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The operating system that the image is running.

        @[JSON::Field(key: "OperatingSystem")]
        getter operating_system : Types::OperatingSystem?

        # The identifier of the Amazon Web Services account that owns the image.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # Specifies whether the image is running on dedicated hardware. When Bring Your Own License (BYOL) is
        # enabled, this value is set to DEDICATED . For more information, see Bring Your Own Windows Desktop
        # Images .

        @[JSON::Field(key: "RequiredTenancy")]
        getter required_tenancy : String?

        # The status of the image.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The updates (if any) that are available for the specified image.

        @[JSON::Field(key: "Updates")]
        getter updates : Types::UpdateResult?

        def initialize(
          @created : Time? = nil,
          @description : String? = nil,
          @error_code : String? = nil,
          @error_details : Array(Types::ErrorDetails)? = nil,
          @error_message : String? = nil,
          @image_id : String? = nil,
          @name : String? = nil,
          @operating_system : Types::OperatingSystem? = nil,
          @owner_account_id : String? = nil,
          @required_tenancy : String? = nil,
          @state : String? = nil,
          @updates : Types::UpdateResult? = nil
        )
        end
      end

      # Describes a WorkSpace.

      struct WorkspaceProperties
        include JSON::Serializable

        # The compute type. For more information, see Amazon WorkSpaces Bundles .

        @[JSON::Field(key: "ComputeTypeName")]
        getter compute_type_name : String?

        # Indicates the Global Accelerator properties.

        @[JSON::Field(key: "GlobalAccelerator")]
        getter global_accelerator : Types::GlobalAcceleratorForWorkSpace?

        # The name of the operating system.

        @[JSON::Field(key: "OperatingSystemName")]
        getter operating_system_name : String?

        # The protocol. For more information, see Protocols for Amazon WorkSpaces . Only available for
        # WorkSpaces created with PCoIP bundles. The Protocols property is case sensitive. Ensure you use
        # PCOIP or DCV (formerly WSP). Unavailable for Windows 7 WorkSpaces and WorkSpaces using GPU-based
        # bundles (Graphics, GraphicsPro, Graphics.g4dn, and GraphicsPro.g4dn).

        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # The size of the root volume. For important information about how to modify the size of the root and
        # user volumes, see Modify a WorkSpace .

        @[JSON::Field(key: "RootVolumeSizeGib")]
        getter root_volume_size_gib : Int32?

        # The running mode. For more information, see Manage the WorkSpace Running Mode . The MANUAL value is
        # only supported by Amazon WorkSpaces Core. Contact your account team to be allow-listed to use this
        # value. For more information, see Amazon WorkSpaces Core . Review your running mode to ensure you are
        # using one that is optimal for your needs and budget. For more information on switching running
        # modes, see Can I switch between hourly and monthly billing?

        @[JSON::Field(key: "RunningMode")]
        getter running_mode : String?

        # The time after a user logs off when WorkSpaces are automatically stopped. Configured in 60-minute
        # intervals.

        @[JSON::Field(key: "RunningModeAutoStopTimeoutInMinutes")]
        getter running_mode_auto_stop_timeout_in_minutes : Int32?

        # The size of the user storage. For important information about how to modify the size of the root and
        # user volumes, see Modify a WorkSpace .

        @[JSON::Field(key: "UserVolumeSizeGib")]
        getter user_volume_size_gib : Int32?

        def initialize(
          @compute_type_name : String? = nil,
          @global_accelerator : Types::GlobalAcceleratorForWorkSpace? = nil,
          @operating_system_name : String? = nil,
          @protocols : Array(String)? = nil,
          @root_volume_size_gib : Int32? = nil,
          @running_mode : String? = nil,
          @running_mode_auto_stop_timeout_in_minutes : Int32? = nil,
          @user_volume_size_gib : Int32? = nil
        )
        end
      end

      # Describes the information used to create a WorkSpace.

      struct WorkspaceRequest
        include JSON::Serializable

        # The identifier of the bundle for the WorkSpace. You can use DescribeWorkspaceBundles to list the
        # available bundles.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String

        # The identifier of the Directory Service directory for the WorkSpace. You can use
        # DescribeWorkspaceDirectories to list the available directories.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The user name of the user for the WorkSpace. This user name must exist in the Directory Service
        # directory for the WorkSpace. The username is not case-sensitive, but we recommend matching the case
        # in the Directory Service directory to avoid potential incompatibilities. The reserved keyword,
        # [UNDEFINED] , is used when creating user-decoupled WorkSpaces.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The IPv6 address for the WorkSpace.

        @[JSON::Field(key: "Ipv6Address")]
        getter ipv6_address : String?

        # Indicates whether the data stored on the root volume is encrypted.

        @[JSON::Field(key: "RootVolumeEncryptionEnabled")]
        getter root_volume_encryption_enabled : Bool?

        # The tags for the WorkSpace.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Indicates whether the data stored on the user volume is encrypted.

        @[JSON::Field(key: "UserVolumeEncryptionEnabled")]
        getter user_volume_encryption_enabled : Bool?

        # The ARN of the symmetric KMS key used to encrypt data stored on your WorkSpace. Amazon WorkSpaces
        # does not support asymmetric KMS keys.

        @[JSON::Field(key: "VolumeEncryptionKey")]
        getter volume_encryption_key : String?

        # The name of the user-decoupled WorkSpace. WorkspaceName is required if UserName is [UNDEFINED] for
        # user-decoupled WorkSpaces. WorkspaceName is not applicable if UserName is specified for
        # user-assigned WorkSpaces.

        @[JSON::Field(key: "WorkspaceName")]
        getter workspace_name : String?

        # The WorkSpace properties.

        @[JSON::Field(key: "WorkspaceProperties")]
        getter workspace_properties : Types::WorkspaceProperties?

        def initialize(
          @bundle_id : String,
          @directory_id : String,
          @user_name : String,
          @ipv6_address : String? = nil,
          @root_volume_encryption_enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_volume_encryption_enabled : Bool? = nil,
          @volume_encryption_key : String? = nil,
          @workspace_name : String? = nil,
          @workspace_properties : Types::WorkspaceProperties? = nil
        )
        end
      end

      # Describes the association between an application and a WorkSpace resource.

      struct WorkspaceResourceAssociation
        include JSON::Serializable

        # The identifier of the associated resource.

        @[JSON::Field(key: "AssociatedResourceId")]
        getter associated_resource_id : String?

        # The resource types of the associated resource.

        @[JSON::Field(key: "AssociatedResourceType")]
        getter associated_resource_type : String?

        # The time the association is created.

        @[JSON::Field(key: "Created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The time the association status was last updated.

        @[JSON::Field(key: "LastUpdatedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_time : Time?

        # The status of the WorkSpace resource association.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason the association deployment failed.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : Types::AssociationStateReason?

        # The identifier of the WorkSpace.

        @[JSON::Field(key: "WorkspaceId")]
        getter workspace_id : String?

        def initialize(
          @associated_resource_id : String? = nil,
          @associated_resource_type : String? = nil,
          @created : Time? = nil,
          @last_updated_time : Time? = nil,
          @state : String? = nil,
          @state_reason : Types::AssociationStateReason? = nil,
          @workspace_id : String? = nil
        )
        end
      end

      # The workspaces_DefaultRole role could not be found. If this is the first time you are registering a
      # directory, you will need to create the workspaces_DefaultRole role before you can register a
      # directory. For more information, see Creating the workspaces_DefaultRole Role .

      struct WorkspacesDefaultRoleNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes an IP access control group.

      struct WorkspacesIpGroup
        include JSON::Serializable

        # The description of the group.

        @[JSON::Field(key: "groupDesc")]
        getter group_desc : String?

        # The identifier of the group.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # The name of the group.

        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        # The rules.

        @[JSON::Field(key: "userRules")]
        getter user_rules : Array(Types::IpRuleItem)?

        def initialize(
          @group_desc : String? = nil,
          @group_id : String? = nil,
          @group_name : String? = nil,
          @user_rules : Array(Types::IpRuleItem)? = nil
        )
        end
      end

      # Describes a pool of WorkSpaces.

      struct WorkspacesPool
        include JSON::Serializable

        # The identifier of the bundle used by the pool.

        @[JSON::Field(key: "BundleId")]
        getter bundle_id : String

        # The capacity status for the pool

        @[JSON::Field(key: "CapacityStatus")]
        getter capacity_status : Types::CapacityStatus

        # The time the pool was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The identifier of the directory used by the pool.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The Amazon Resource Name (ARN) for the pool.

        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String

        # The identifier of a pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # The name of the pool.

        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        # The running mode of the pool.

        @[JSON::Field(key: "RunningMode")]
        getter running_mode : String

        # The current state of the pool.

        @[JSON::Field(key: "State")]
        getter state : String

        # The persistent application settings for users of the pool.

        @[JSON::Field(key: "ApplicationSettings")]
        getter application_settings : Types::ApplicationSettingsResponse?

        # The description of the pool.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The pool errors.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::WorkspacesPoolError)?

        # The amount of time that a pool session remains active after users disconnect. If they try to
        # reconnect to the pool session after a disconnection or network interruption within this time
        # interval, they are connected to their previous session. Otherwise, they are connected to a new
        # session with a new pool instance.

        @[JSON::Field(key: "TimeoutSettings")]
        getter timeout_settings : Types::TimeoutSettings?

        def initialize(
          @bundle_id : String,
          @capacity_status : Types::CapacityStatus,
          @created_at : Time,
          @directory_id : String,
          @pool_arn : String,
          @pool_id : String,
          @pool_name : String,
          @running_mode : String,
          @state : String,
          @application_settings : Types::ApplicationSettingsResponse? = nil,
          @description : String? = nil,
          @errors : Array(Types::WorkspacesPoolError)? = nil,
          @timeout_settings : Types::TimeoutSettings? = nil
        )
        end
      end

      # Describes a pool error.

      struct WorkspacesPoolError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Describes a pool session.

      struct WorkspacesPoolSession
        include JSON::Serializable

        # The identifier of the pool.

        @[JSON::Field(key: "PoolId")]
        getter pool_id : String

        # The identifier of the session.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        # The identifier of the user.

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # The authentication method. The user is authenticated using a WorkSpaces Pools URL (API) or SAML 2.0
        # federation (SAML).

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String?

        # Specifies whether a user is connected to the pool session.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # The time that the pool session ended.

        @[JSON::Field(key: "ExpirationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time?

        # The identifier for the instance hosting the session.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # Describes the network details of the pool.

        @[JSON::Field(key: "NetworkAccessConfiguration")]
        getter network_access_configuration : Types::NetworkAccessConfiguration?

        # The time that the pool sission started.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @pool_id : String,
          @session_id : String,
          @user_id : String,
          @authentication_type : String? = nil,
          @connection_state : String? = nil,
          @expiration_time : Time? = nil,
          @instance_id : String? = nil,
          @network_access_configuration : Types::NetworkAccessConfiguration? = nil,
          @start_time : Time? = nil
        )
        end
      end
    end
  end
end
