require "json"
require "time"

module AwsSdk
  module CodeStarConnections
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception thrown as a result of concurrent modification to an application. For example, two
      # individuals attempting to edit the same application at the same time.
      struct ConcurrentModificationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The conditional check failed. Try again later.
      struct ConditionalCheckFailedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Two conflicting operations have been made on the same resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A resource that is used to connect third-party source providers with services like CodePipeline.
      # Note: A connection created through CloudFormation, the CLI, or the SDK is in `PENDING` status by
      # default. You can make its status `AVAILABLE` by updating the connection in the console.
      struct Connection
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection. The ARN is used as the connection reference when
        # the connection is shared between Amazon Web Services services. The ARN is never reused if the
        # connection is deleted.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The name of the connection. Connection names must be unique in an Amazon Web Services account.
        @[JSON::Field(key: "ConnectionName")]
        getter connection_name : String?

        # The current status of the connection.
        @[JSON::Field(key: "ConnectionStatus")]
        getter connection_status : String?

        # The Amazon Resource Name (ARN) of the host associated with the connection.
        @[JSON::Field(key: "HostArn")]
        getter host_arn : String?

        # The identifier of the external provider where your third-party code repository is configured. For
        # Bitbucket, this is the account ID of the owner of the Bitbucket repository.
        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The name of the external provider where your third-party code repository is configured.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        def initialize(
          @connection_arn : String? = nil,
          @connection_name : String? = nil,
          @connection_status : String? = nil,
          @host_arn : String? = nil,
          @owner_account_id : String? = nil,
          @provider_type : String? = nil
        )
        end
      end

      struct CreateConnectionInput
        include JSON::Serializable

        # The name of the connection to be created.
        @[JSON::Field(key: "ConnectionName")]
        getter connection_name : String

        # The Amazon Resource Name (ARN) of the host associated with the connection to be created.
        @[JSON::Field(key: "HostArn")]
        getter host_arn : String?

        # The name of the external provider where your third-party code repository is configured.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        # The key-value pair to use when tagging the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connection_name : String,
          @host_arn : String? = nil,
          @provider_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateConnectionOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection to be created. The ARN is used as the connection
        # reference when the connection is shared between Amazon Web Services services. The ARN is never
        # reused if the connection is deleted.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String

        # Specifies the tags applied to the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connection_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateHostInput
        include JSON::Serializable

        # The name of the host to be created.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The endpoint of the infrastructure to be represented by the host after it is created.
        @[JSON::Field(key: "ProviderEndpoint")]
        getter provider_endpoint : String

        # The name of the installed provider to be associated with your connection. The host resource
        # represents the infrastructure where your provider type is installed. The valid provider type is
        # GitHub Enterprise Server.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String

        # Tags for the host to be created.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The VPC configuration to be provisioned for the host. A VPC must be configured and the
        # infrastructure to be represented by the host must already be connected to the VPC.
        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @name : String,
          @provider_endpoint : String,
          @provider_type : String,
          @tags : Array(Types::Tag)? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      struct CreateHostOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the host to be created.
        @[JSON::Field(key: "HostArn")]
        getter host_arn : String?

        # Tags for the created host.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @host_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRepositoryLinkInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection to be associated with the repository link.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String

        # The owner ID for the repository associated with a specific sync configuration, such as the owner ID
        # in GitHub.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String

        # The name of the repository to be associated with the repository link.
        @[JSON::Field(key: "RepositoryName")]
        getter repository_name : String

        # The Amazon Resource Name (ARN) encryption key for the repository to be associated with the
        # repository link.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The tags for the repository to be associated with the repository link.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connection_arn : String,
          @owner_id : String,
          @repository_name : String,
          @encryption_key_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRepositoryLinkOutput
        include JSON::Serializable

        # The returned information about the created repository link.
        @[JSON::Field(key: "RepositoryLinkInfo")]
        getter repository_link_info : Types::RepositoryLinkInfo

        def initialize(
          @repository_link_info : Types::RepositoryLinkInfo
        )
        end
      end

      struct CreateSyncConfigurationInput
        include JSON::Serializable

        # The branch in the repository from which changes will be synced.
        @[JSON::Field(key: "Branch")]
        getter branch : String

        # The file name of the configuration file that manages syncing between the connection and the
        # repository. This configuration file is stored in the repository.
        @[JSON::Field(key: "ConfigFile")]
        getter config_file : String

        # The ID of the repository link created for the connection. A repository link allows Git sync to
        # monitor and sync changes to files in a specified Git repository.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String

        # The name of the Amazon Web Services resource (for example, a CloudFormation stack in the case of
        # CFN_STACK_SYNC) that will be synchronized from the linked repository.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The ARN of the IAM role that grants permission for Amazon Web Services to use Git sync to update a
        # given Amazon Web Services resource on your behalf.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The type of sync configuration.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        # Whether to enable or disable publishing of deployment status to source providers.
        @[JSON::Field(key: "PublishDeploymentStatus")]
        getter publish_deployment_status : String?

        # When to trigger Git sync to begin the stack update.
        @[JSON::Field(key: "TriggerResourceUpdateOn")]
        getter trigger_resource_update_on : String?

        def initialize(
          @branch : String,
          @config_file : String,
          @repository_link_id : String,
          @resource_name : String,
          @role_arn : String,
          @sync_type : String,
          @publish_deployment_status : String? = nil,
          @trigger_resource_update_on : String? = nil
        )
        end
      end

      struct CreateSyncConfigurationOutput
        include JSON::Serializable

        # The created sync configuration for the connection. A sync configuration allows Amazon Web Services
        # to sync content from a Git repository to update a specified Amazon Web Services resource.
        @[JSON::Field(key: "SyncConfiguration")]
        getter sync_configuration : Types::SyncConfiguration

        def initialize(
          @sync_configuration : Types::SyncConfiguration
        )
        end
      end

      struct DeleteConnectionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection to be deleted. The ARN is never reused if the
        # connection is deleted.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String

        def initialize(
          @connection_arn : String
        )
        end
      end

      struct DeleteConnectionOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteHostInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the host to be deleted.
        @[JSON::Field(key: "HostArn")]
        getter host_arn : String

        def initialize(
          @host_arn : String
        )
        end
      end

      struct DeleteHostOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteRepositoryLinkInput
        include JSON::Serializable

        # The ID of the repository link to be deleted.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String

        def initialize(
          @repository_link_id : String
        )
        end
      end

      struct DeleteRepositoryLinkOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSyncConfigurationInput
        include JSON::Serializable

        # The name of the Amazon Web Services resource associated with the sync configuration to be deleted.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The type of sync configuration to be deleted.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        def initialize(
          @resource_name : String,
          @sync_type : String
        )
        end
      end

      struct DeleteSyncConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct GetConnectionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a connection.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String

        def initialize(
          @connection_arn : String
        )
        end
      end

      struct GetConnectionOutput
        include JSON::Serializable

        # The connection details, such as status, owner, and provider type.
        @[JSON::Field(key: "Connection")]
        getter connection : Types::Connection?

        def initialize(
          @connection : Types::Connection? = nil
        )
        end
      end

      struct GetHostInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the requested host.
        @[JSON::Field(key: "HostArn")]
        getter host_arn : String

        def initialize(
          @host_arn : String
        )
        end
      end

      struct GetHostOutput
        include JSON::Serializable

        # The name of the requested host.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The endpoint of the infrastructure represented by the requested host.
        @[JSON::Field(key: "ProviderEndpoint")]
        getter provider_endpoint : String?

        # The provider type of the requested host, such as GitHub Enterprise Server.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        # The status of the requested host.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The VPC configuration of the requested host.
        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @name : String? = nil,
          @provider_endpoint : String? = nil,
          @provider_type : String? = nil,
          @status : String? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      struct GetRepositoryLinkInput
        include JSON::Serializable

        # The ID of the repository link to get.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String

        def initialize(
          @repository_link_id : String
        )
        end
      end

      struct GetRepositoryLinkOutput
        include JSON::Serializable

        # The information returned for a specified repository link.
        @[JSON::Field(key: "RepositoryLinkInfo")]
        getter repository_link_info : Types::RepositoryLinkInfo

        def initialize(
          @repository_link_info : Types::RepositoryLinkInfo
        )
        end
      end

      struct GetRepositorySyncStatusInput
        include JSON::Serializable

        # The branch of the repository link for the requested repository sync status.
        @[JSON::Field(key: "Branch")]
        getter branch : String

        # The repository link ID for the requested repository sync status.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String

        # The sync type of the requested sync status.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        def initialize(
          @branch : String,
          @repository_link_id : String,
          @sync_type : String
        )
        end
      end

      struct GetRepositorySyncStatusOutput
        include JSON::Serializable

        # The status of the latest sync returned for a specified repository and branch.
        @[JSON::Field(key: "LatestSync")]
        getter latest_sync : Types::RepositorySyncAttempt

        def initialize(
          @latest_sync : Types::RepositorySyncAttempt
        )
        end
      end

      struct GetResourceSyncStatusInput
        include JSON::Serializable

        # The name of the Amazon Web Services resource for the sync status with the Git repository.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The sync type for the sync status with the Git repository.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        def initialize(
          @resource_name : String,
          @sync_type : String
        )
        end
      end

      struct GetResourceSyncStatusOutput
        include JSON::Serializable

        # The latest sync for the sync status with the Git repository, whether successful or not.
        @[JSON::Field(key: "LatestSync")]
        getter latest_sync : Types::ResourceSyncAttempt

        # The desired state of the Amazon Web Services resource for the sync status with the Git repository.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : Types::Revision?

        # The latest successful sync for the sync status with the Git repository.
        @[JSON::Field(key: "LatestSuccessfulSync")]
        getter latest_successful_sync : Types::ResourceSyncAttempt?

        def initialize(
          @latest_sync : Types::ResourceSyncAttempt,
          @desired_state : Types::Revision? = nil,
          @latest_successful_sync : Types::ResourceSyncAttempt? = nil
        )
        end
      end

      struct GetSyncBlockerSummaryInput
        include JSON::Serializable

        # The name of the Amazon Web Services resource currently blocked from automatically being synced from
        # a Git repository.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The sync type for the sync blocker summary.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        def initialize(
          @resource_name : String,
          @sync_type : String
        )
        end
      end

      struct GetSyncBlockerSummaryOutput
        include JSON::Serializable

        # The list of sync blockers for a specified resource.
        @[JSON::Field(key: "SyncBlockerSummary")]
        getter sync_blocker_summary : Types::SyncBlockerSummary

        def initialize(
          @sync_blocker_summary : Types::SyncBlockerSummary
        )
        end
      end

      struct GetSyncConfigurationInput
        include JSON::Serializable

        # The name of the Amazon Web Services resource for the sync configuration for which you want to
        # retrieve information.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The sync type for the sync configuration for which you want to retrieve information.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        def initialize(
          @resource_name : String,
          @sync_type : String
        )
        end
      end

      struct GetSyncConfigurationOutput
        include JSON::Serializable

        # The details about the sync configuration for which you want to retrieve information.
        @[JSON::Field(key: "SyncConfiguration")]
        getter sync_configuration : Types::SyncConfiguration

        def initialize(
          @sync_configuration : Types::SyncConfiguration
        )
        end
      end

      # A resource that represents the infrastructure where a third-party provider is installed. The host is
      # used when you create connections to an installed third-party provider type, such as GitHub
      # Enterprise Server. You create one host for all connections to that provider. A host created through
      # the CLI or the SDK is in `PENDING` status by default. You can make its status `AVAILABLE` by setting
      # up the host in the console.
      struct Host
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the host.
        @[JSON::Field(key: "HostArn")]
        getter host_arn : String?

        # The name of the host.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The endpoint of the infrastructure where your provider type is installed.
        @[JSON::Field(key: "ProviderEndpoint")]
        getter provider_endpoint : String?

        # The name of the installed provider to be associated with your connection. The host resource
        # represents the infrastructure where your provider type is installed. The valid provider type is
        # GitHub Enterprise Server.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        # The status of the host, such as PENDING, AVAILABLE, VPC_CONFIG_DELETING, VPC_CONFIG_INITIALIZING,
        # and VPC_CONFIG_FAILED_INITIALIZATION.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status description for the host.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The VPC configuration provisioned for the host.
        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @host_arn : String? = nil,
          @name : String? = nil,
          @provider_endpoint : String? = nil,
          @provider_type : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      # Received an internal server exception. Try again later.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input is not valid. Verify that the action is typed correctly.
      struct InvalidInputException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exceeded the maximum limit for connections.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListConnectionsInput
        include JSON::Serializable

        # Filters the list of connections to those associated with a specified host.
        @[JSON::Field(key: "HostArnFilter")]
        getter host_arn_filter : String?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token that was returned from the previous ListConnections call, which can be used to return the
        # next set of connections in the list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the list of connections to those associated with a specified provider, such as Bitbucket.
        @[JSON::Field(key: "ProviderTypeFilter")]
        getter provider_type_filter : String?

        def initialize(
          @host_arn_filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @provider_type_filter : String? = nil
        )
        end
      end

      struct ListConnectionsOutput
        include JSON::Serializable

        # A list of connections and the details for each connection, such as status, owner, and provider type.
        @[JSON::Field(key: "Connections")]
        getter connections : Array(Types::Connection)?

        # A token that can be used in the next ListConnections call. To view all items in the list, continue
        # to call this operation with each subsequent token until no more nextToken values are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connections : Array(Types::Connection)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListHostsInput
        include JSON::Serializable

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token that was returned from the previous ListHosts call, which can be used to return the next
        # set of hosts in the list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListHostsOutput
        include JSON::Serializable

        # A list of hosts and the details for each host, such as status, endpoint, and provider type.
        @[JSON::Field(key: "Hosts")]
        getter hosts : Array(Types::Host)?

        # A token that can be used in the next ListHosts call. To view all items in the list, continue to call
        # this operation with each subsequent token until no more nextToken values are returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @hosts : Array(Types::Host)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRepositoryLinksInput
        include JSON::Serializable

        # A non-zero, non-negative integer used to limit the number of returned results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRepositoryLinksOutput
        include JSON::Serializable

        # Lists the repository links called by the list repository links operation.
        @[JSON::Field(key: "RepositoryLinks")]
        getter repository_links : Array(Types::RepositoryLinkInfo)

        # An enumeration token that allows the operation to batch the results of the operation.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @repository_links : Array(Types::RepositoryLinkInfo),
          @next_token : String? = nil
        )
        end
      end

      struct ListRepositorySyncDefinitionsInput
        include JSON::Serializable

        # The ID of the repository link for the sync definition for which you want to retrieve information.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String

        # The sync type of the repository link for the the sync definition for which you want to retrieve
        # information.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        def initialize(
          @repository_link_id : String,
          @sync_type : String
        )
        end
      end

      struct ListRepositorySyncDefinitionsOutput
        include JSON::Serializable

        # The list of repository sync definitions returned by the request. A RepositorySyncDefinition is a
        # mapping from a repository branch to all the Amazon Web Services resources that are being synced from
        # that branch.
        @[JSON::Field(key: "RepositorySyncDefinitions")]
        getter repository_sync_definitions : Array(Types::RepositorySyncDefinition)

        # An enumeration token that, when provided in a request, returns the next batch of the results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @repository_sync_definitions : Array(Types::RepositorySyncDefinition),
          @next_token : String? = nil
        )
        end
      end

      struct ListSyncConfigurationsInput
        include JSON::Serializable

        # The ID of the repository link for the requested list of sync configurations.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String

        # The sync type for the requested list of sync configurations.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        # A non-zero, non-negative integer used to limit the number of returned results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An enumeration token that allows the operation to batch the results of the operation.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @repository_link_id : String,
          @sync_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSyncConfigurationsOutput
        include JSON::Serializable

        # The list of repository sync definitions returned by the request.
        @[JSON::Field(key: "SyncConfigurations")]
        getter sync_configurations : Array(Types::SyncConfiguration)

        # An enumeration token that allows the operation to batch the next results of the operation.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @sync_configurations : Array(Types::SyncConfiguration),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to get information about tags, if
        # any.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # A list of tag key and value pairs associated with the specified resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about the repository link resource, such as the repository link ARN, the associated
      # connection ARN, encryption key ARN, and owner ID.
      struct RepositoryLinkInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection associated with the repository link.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String

        # The owner ID for the repository associated with the repository link, such as the owner ID in GitHub.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String

        # The provider type for the connection, such as GitHub, associated with the repository link.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String

        # The Amazon Resource Name (ARN) of the repository link.
        @[JSON::Field(key: "RepositoryLinkArn")]
        getter repository_link_arn : String

        # The ID of the repository link.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String

        # The name of the repository associated with the repository link.
        @[JSON::Field(key: "RepositoryName")]
        getter repository_name : String

        # The Amazon Resource Name (ARN) of the encryption key for the repository associated with the
        # repository link.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        def initialize(
          @connection_arn : String,
          @owner_id : String,
          @provider_type : String,
          @repository_link_arn : String,
          @repository_link_id : String,
          @repository_name : String,
          @encryption_key_arn : String? = nil
        )
        end
      end

      # Information about a repository sync attempt for a repository with a sync configuration.
      struct RepositorySyncAttempt
        include JSON::Serializable

        # The events associated with a specific sync attempt.
        @[JSON::Field(key: "Events")]
        getter events : Array(Types::RepositorySyncEvent)

        # The start time of a specific sync attempt.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time

        # The status of a specific sync attempt. The following are valid statuses: INITIATED - A repository
        # sync attempt has been created and will begin soon. IN_PROGRESS - A repository sync attempt has
        # started and work is being done to reconcile the branch. SUCCEEDED - The repository sync attempt has
        # completed successfully. FAILED - The repository sync attempt has failed. QUEUED - The repository
        # sync attempt didn't execute and was queued.
        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @events : Array(Types::RepositorySyncEvent),
          @started_at : Time,
          @status : String
        )
        end
      end

      # The definition for a repository with a sync configuration.
      struct RepositorySyncDefinition
        include JSON::Serializable

        # The branch specified for a repository sync definition.
        @[JSON::Field(key: "Branch")]
        getter branch : String

        # The configuration file for a repository sync definition. This value comes from creating or updating
        # the config-file field of a sync-configuration .
        @[JSON::Field(key: "Directory")]
        getter directory : String

        # The parent resource specified for a repository sync definition.
        @[JSON::Field(key: "Parent")]
        getter parent : String

        # The target resource specified for a repository sync definition. In some cases, such as
        # CFN_STACK_SYNC, the parent and target resource are the same.
        @[JSON::Field(key: "Target")]
        getter target : String

        def initialize(
          @branch : String,
          @directory : String,
          @parent : String,
          @target : String
        )
        end
      end

      # Information about a repository sync event.
      struct RepositorySyncEvent
        include JSON::Serializable

        # A description of a repository sync event.
        @[JSON::Field(key: "Event")]
        getter event : String

        # The time that a repository sync event occurred.
        @[JSON::Field(key: "Time", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter time : Time

        # The event type for a repository sync event.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The ID for a repository sync event.
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        def initialize(
          @event : String,
          @time : Time,
          @type : String,
          @external_id : String? = nil
        )
        end
      end

      # Unable to create resource. Resource already exists.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Resource not found. Verify the connection resource ARN and try again.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a resource sync attempt.
      struct ResourceSyncAttempt
        include JSON::Serializable

        # The events related to a resource sync attempt.
        @[JSON::Field(key: "Events")]
        getter events : Array(Types::ResourceSyncEvent)

        # The current state of the resource as defined in the resource's config-file in the linked repository.
        @[JSON::Field(key: "InitialRevision")]
        getter initial_revision : Types::Revision

        # The start time for a resource sync attempt.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time

        # The status for a resource sync attempt. The follow are valid statuses: SYNC-INITIATED - A resource
        # sync attempt has been created and will begin soon. SYNCING - Syncing has started and work is being
        # done to reconcile state. SYNCED - Syncing has completed successfully. SYNC_FAILED - A resource sync
        # attempt has failed.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The name of the Amazon Web Services resource that is attempted to be synchronized.
        @[JSON::Field(key: "Target")]
        getter target : String

        # The desired state of the resource as defined in the resource's config-file in the linked repository.
        # Git sync attempts to update the resource to this state.
        @[JSON::Field(key: "TargetRevision")]
        getter target_revision : Types::Revision

        def initialize(
          @events : Array(Types::ResourceSyncEvent),
          @initial_revision : Types::Revision,
          @started_at : Time,
          @status : String,
          @target : String,
          @target_revision : Types::Revision
        )
        end
      end

      # Information about a resource sync event for the resource associated with a sync configuration.
      struct ResourceSyncEvent
        include JSON::Serializable

        # The event for a resource sync event.
        @[JSON::Field(key: "Event")]
        getter event : String

        # The time that a resource sync event occurred.
        @[JSON::Field(key: "Time", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter time : Time

        # The type of resource sync event.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The ID for a resource sync event.
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        def initialize(
          @event : String,
          @time : Time,
          @type : String,
          @external_id : String? = nil
        )
        end
      end

      # Resource not found. Verify the ARN for the host resource and try again.
      struct ResourceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Retrying the latest commit failed. Try again later.
      struct RetryLatestCommitFailedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the revision for a specific sync event, such as the branch, owner ID, and name of
      # the repository.
      struct Revision
        include JSON::Serializable

        # The branch name for a specific revision.
        @[JSON::Field(key: "Branch")]
        getter branch : String

        # The directory, if any, for a specific revision.
        @[JSON::Field(key: "Directory")]
        getter directory : String

        # The owner ID for a specific revision, such as the GitHub owner ID for a GitHub repository.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String

        # The provider type for a revision, such as GitHub.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String

        # The repository name for a specific revision.
        @[JSON::Field(key: "RepositoryName")]
        getter repository_name : String

        # The SHA, such as the commit ID, for a specific revision.
        @[JSON::Field(key: "Sha")]
        getter sha : String

        def initialize(
          @branch : String,
          @directory : String,
          @owner_id : String,
          @provider_type : String,
          @repository_name : String,
          @sha : String
        )
        end
      end

      # Information about a blocker for a sync event.
      struct SyncBlocker
        include JSON::Serializable

        # The creation time for a specific sync blocker.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The provided reason for a specific sync blocker.
        @[JSON::Field(key: "CreatedReason")]
        getter created_reason : String

        # The ID for a specific sync blocker.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The status for a specific sync blocker.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The sync blocker type.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The contexts for a specific sync blocker.
        @[JSON::Field(key: "Contexts")]
        getter contexts : Array(Types::SyncBlockerContext)?

        # The time that a specific sync blocker was resolved.
        @[JSON::Field(key: "ResolvedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter resolved_at : Time?

        # The resolved reason for a specific sync blocker.
        @[JSON::Field(key: "ResolvedReason")]
        getter resolved_reason : String?

        def initialize(
          @created_at : Time,
          @created_reason : String,
          @id : String,
          @status : String,
          @type : String,
          @contexts : Array(Types::SyncBlockerContext)? = nil,
          @resolved_at : Time? = nil,
          @resolved_reason : String? = nil
        )
        end
      end

      # The context for a specific sync blocker.
      struct SyncBlockerContext
        include JSON::Serializable

        # The key provided for a context key-value pair for a specific sync blocker.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value provided for a context key-value pair for a specific sync blocker.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Unable to continue. The sync blocker does not exist.
      struct SyncBlockerDoesNotExistException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A summary for sync blockers.
      struct SyncBlockerSummary
        include JSON::Serializable

        # The resource name for sync blocker summary.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The latest events for a sync blocker summary.
        @[JSON::Field(key: "LatestBlockers")]
        getter latest_blockers : Array(Types::SyncBlocker)?

        # The parent resource name for a sync blocker summary.
        @[JSON::Field(key: "ParentResourceName")]
        getter parent_resource_name : String?

        def initialize(
          @resource_name : String,
          @latest_blockers : Array(Types::SyncBlocker)? = nil,
          @parent_resource_name : String? = nil
        )
        end
      end

      # Information, such as repository, branch, provider, and resource names for a specific sync
      # configuration.
      struct SyncConfiguration
        include JSON::Serializable

        # The branch associated with a specific sync configuration.
        @[JSON::Field(key: "Branch")]
        getter branch : String

        # The owner ID for the repository associated with a specific sync configuration, such as the owner ID
        # in GitHub.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String

        # The connection provider type associated with a specific sync configuration, such as GitHub.
        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String

        # The ID of the repository link associated with a specific sync configuration.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String

        # The name of the repository associated with a specific sync configuration.
        @[JSON::Field(key: "RepositoryName")]
        getter repository_name : String

        # The name of the connection resource associated with a specific sync configuration.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The Amazon Resource Name (ARN) of the IAM role associated with a specific sync configuration.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The type of sync for a specific sync configuration.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        # The file path to the configuration file associated with a specific sync configuration. The path
        # should point to an actual file in the sync configurations linked repository.
        @[JSON::Field(key: "ConfigFile")]
        getter config_file : String?

        # Whether to enable or disable publishing of deployment status to source providers.
        @[JSON::Field(key: "PublishDeploymentStatus")]
        getter publish_deployment_status : String?

        # When to trigger Git sync to begin the stack update.
        @[JSON::Field(key: "TriggerResourceUpdateOn")]
        getter trigger_resource_update_on : String?

        def initialize(
          @branch : String,
          @owner_id : String,
          @provider_type : String,
          @repository_link_id : String,
          @repository_name : String,
          @resource_name : String,
          @role_arn : String,
          @sync_type : String,
          @config_file : String? = nil,
          @publish_deployment_status : String? = nil,
          @trigger_resource_update_on : String? = nil
        )
        end
      end

      # Unable to continue. The sync blocker still exists.
      struct SyncConfigurationStillExistsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A tag is a key-value pair that is used to manage the resource. This tag is available for use by
      # Amazon Web Services services that support tags.
      struct Tag
        include JSON::Serializable

        # The tag's key.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The tag's value.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which you want to add or update tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags you want to modify or add to the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation is not supported. Check the connection status and try again.
      struct UnsupportedOperationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified provider type is not supported for connections.
      struct UnsupportedProviderTypeException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove tags from.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of keys for the tags to be removed from the resource.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateHostInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the host to be updated.
        @[JSON::Field(key: "HostArn")]
        getter host_arn : String

        # The URL or endpoint of the host to be updated.
        @[JSON::Field(key: "ProviderEndpoint")]
        getter provider_endpoint : String?

        # The VPC configuration of the host to be updated. A VPC must be configured and the infrastructure to
        # be represented by the host must already be connected to the VPC.
        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @host_arn : String,
          @provider_endpoint : String? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      struct UpdateHostOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The update is out of sync. Try syncing again.
      struct UpdateOutOfSyncException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UpdateRepositoryLinkInput
        include JSON::Serializable

        # The ID of the repository link to be updated.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String

        # The Amazon Resource Name (ARN) of the connection for the repository link to be updated. The updated
        # connection ARN must have the same providerType (such as GitHub) as the original connection ARN for
        # the repo link.
        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The Amazon Resource Name (ARN) of the encryption key for the repository link to be updated.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        def initialize(
          @repository_link_id : String,
          @connection_arn : String? = nil,
          @encryption_key_arn : String? = nil
        )
        end
      end

      struct UpdateRepositoryLinkOutput
        include JSON::Serializable

        # Information about the repository link to be updated.
        @[JSON::Field(key: "RepositoryLinkInfo")]
        getter repository_link_info : Types::RepositoryLinkInfo

        def initialize(
          @repository_link_info : Types::RepositoryLinkInfo
        )
        end
      end

      struct UpdateSyncBlockerInput
        include JSON::Serializable

        # The ID of the sync blocker to be updated.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The reason for resolving the sync blocker.
        @[JSON::Field(key: "ResolvedReason")]
        getter resolved_reason : String

        # The name of the resource for the sync blocker to be updated.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The sync type of the sync blocker to be updated.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        def initialize(
          @id : String,
          @resolved_reason : String,
          @resource_name : String,
          @sync_type : String
        )
        end
      end

      struct UpdateSyncBlockerOutput
        include JSON::Serializable

        # The resource name for the sync blocker.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # Information about the sync blocker to be updated.
        @[JSON::Field(key: "SyncBlocker")]
        getter sync_blocker : Types::SyncBlocker

        # The parent resource name for the sync blocker.
        @[JSON::Field(key: "ParentResourceName")]
        getter parent_resource_name : String?

        def initialize(
          @resource_name : String,
          @sync_blocker : Types::SyncBlocker,
          @parent_resource_name : String? = nil
        )
        end
      end

      struct UpdateSyncConfigurationInput
        include JSON::Serializable

        # The name of the Amazon Web Services resource for the sync configuration to be updated.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The sync type for the sync configuration to be updated.
        @[JSON::Field(key: "SyncType")]
        getter sync_type : String

        # The branch for the sync configuration to be updated.
        @[JSON::Field(key: "Branch")]
        getter branch : String?

        # The configuration file for the sync configuration to be updated.
        @[JSON::Field(key: "ConfigFile")]
        getter config_file : String?

        # Whether to enable or disable publishing of deployment status to source providers.
        @[JSON::Field(key: "PublishDeploymentStatus")]
        getter publish_deployment_status : String?

        # The ID of the repository link for the sync configuration to be updated.
        @[JSON::Field(key: "RepositoryLinkId")]
        getter repository_link_id : String?

        # The ARN of the IAM role for the sync configuration to be updated.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # When to trigger Git sync to begin the stack update.
        @[JSON::Field(key: "TriggerResourceUpdateOn")]
        getter trigger_resource_update_on : String?

        def initialize(
          @resource_name : String,
          @sync_type : String,
          @branch : String? = nil,
          @config_file : String? = nil,
          @publish_deployment_status : String? = nil,
          @repository_link_id : String? = nil,
          @role_arn : String? = nil,
          @trigger_resource_update_on : String? = nil
        )
        end
      end

      struct UpdateSyncConfigurationOutput
        include JSON::Serializable

        # The information returned for the sync configuration to be updated.
        @[JSON::Field(key: "SyncConfiguration")]
        getter sync_configuration : Types::SyncConfiguration

        def initialize(
          @sync_configuration : Types::SyncConfiguration
        )
        end
      end

      # The VPC configuration provisioned for the host.
      struct VpcConfiguration
        include JSON::Serializable

        # The ID of the security group or security groups associated with the Amazon VPC connected to the
        # infrastructure where your provider type is installed.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # The ID of the subnet or subnets associated with the Amazon VPC connected to the infrastructure where
        # your provider type is installed.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the Amazon VPC connected to the infrastructure where your provider type is installed.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        # The value of the Transport Layer Security (TLS) certificate associated with the infrastructure where
        # your provider type is installed.
        @[JSON::Field(key: "TlsCertificate")]
        getter tls_certificate : String?

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String),
          @vpc_id : String,
          @tls_certificate : String? = nil
        )
        end
      end
    end
  end
end
