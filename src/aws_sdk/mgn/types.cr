require "json"

module AwsSdk
  module Mgn
    module Types

      # Operating denied due to a file permission or access check error.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct Application
        include JSON::Serializable

        # Application aggregated status.

        @[JSON::Field(key: "applicationAggregatedStatus")]
        getter application_aggregated_status : Types::ApplicationAggregatedStatus?

        # Application ID.

        @[JSON::Field(key: "applicationID")]
        getter application_id : String?

        # Application ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Application creation dateTime.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : String?

        # Application description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Application archival status.

        @[JSON::Field(key: "isArchived")]
        getter is_archived : Bool?

        # Application last modified dateTime.

        @[JSON::Field(key: "lastModifiedDateTime")]
        getter last_modified_date_time : String?

        # Application name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Application tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Application wave ID.

        @[JSON::Field(key: "waveID")]
        getter wave_id : String?

        def initialize(
          @application_aggregated_status : Types::ApplicationAggregatedStatus? = nil,
          @application_id : String? = nil,
          @arn : String? = nil,
          @creation_date_time : String? = nil,
          @description : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_date_time : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @wave_id : String? = nil
        )
        end
      end

      # Application aggregated status.

      struct ApplicationAggregatedStatus
        include JSON::Serializable

        # Application aggregated status health status.

        @[JSON::Field(key: "healthStatus")]
        getter health_status : String?

        # Application aggregated status last update dateTime.

        @[JSON::Field(key: "lastUpdateDateTime")]
        getter last_update_date_time : String?

        # Application aggregated status progress status.

        @[JSON::Field(key: "progressStatus")]
        getter progress_status : String?

        # Application aggregated status total source servers amount.

        @[JSON::Field(key: "totalSourceServers")]
        getter total_source_servers : Int64?

        def initialize(
          @health_status : String? = nil,
          @last_update_date_time : String? = nil,
          @progress_status : String? = nil,
          @total_source_servers : Int64? = nil
        )
        end
      end


      struct ArchiveApplicationRequest
        include JSON::Serializable

        # Application ID.

        @[JSON::Field(key: "applicationID")]
        getter application_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @application_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct ArchiveWaveRequest
        include JSON::Serializable

        # Wave ID.

        @[JSON::Field(key: "waveID")]
        getter wave_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @wave_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct AssociateApplicationsRequest
        include JSON::Serializable

        # Application IDs list.

        @[JSON::Field(key: "applicationIDs")]
        getter application_i_ds : Array(String)

        # Wave ID.

        @[JSON::Field(key: "waveID")]
        getter wave_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @application_i_ds : Array(String),
          @wave_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct AssociateApplicationsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateSourceServersRequest
        include JSON::Serializable

        # Application ID.

        @[JSON::Field(key: "applicationID")]
        getter application_id : String

        # Source server IDs list.

        @[JSON::Field(key: "sourceServerIDs")]
        getter source_server_i_ds : Array(String)

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @application_id : String,
          @source_server_i_ds : Array(String),
          @account_id : String? = nil
        )
        end
      end


      struct AssociateSourceServersResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Source server CPU information.

      struct CPU
        include JSON::Serializable

        # The number of CPU cores on the source server.

        @[JSON::Field(key: "cores")]
        getter cores : Int64?

        # The source server's CPU model name.

        @[JSON::Field(key: "modelName")]
        getter model_name : String?

        def initialize(
          @cores : Int64? = nil,
          @model_name : String? = nil
        )
        end
      end


      struct ChangeServerLifeCycleStateRequest
        include JSON::Serializable

        # The request to change the source server migration lifecycle state.

        @[JSON::Field(key: "lifeCycle")]
        getter life_cycle : Types::ChangeServerLifeCycleStateSourceServerLifecycle

        # The request to change the source server migration lifecycle state by source server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # The request to change the source server migration account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @life_cycle : Types::ChangeServerLifeCycleStateSourceServerLifecycle,
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end

      # The request to change the source server migration lifecycle state.

      struct ChangeServerLifeCycleStateSourceServerLifecycle
        include JSON::Serializable

        # The request to change the source server migration lifecycle state.

        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # The request could not be completed due to a conflict with the current state of the target resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?

        # Conflict Exception specific errors.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::ErrorDetails)?


        @[JSON::Field(key: "message")]
        getter message : String?

        # A conflict occurred when prompting for the Resource ID.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # A conflict occurred when prompting for resource type.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @code : String? = nil,
          @errors : Array(Types::ErrorDetails)? = nil,
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct Connector
        include JSON::Serializable

        # Connector arn.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Connector ID.

        @[JSON::Field(key: "connectorID")]
        getter connector_id : String?

        # Connector name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Connector SSM command config.

        @[JSON::Field(key: "ssmCommandConfig")]
        getter ssm_command_config : Types::ConnectorSsmCommandConfig?

        # Connector SSM instance ID.

        @[JSON::Field(key: "ssmInstanceID")]
        getter ssm_instance_id : String?

        # Connector tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @connector_id : String? = nil,
          @name : String? = nil,
          @ssm_command_config : Types::ConnectorSsmCommandConfig? = nil,
          @ssm_instance_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Connector SSM command config.

      struct ConnectorSsmCommandConfig
        include JSON::Serializable

        # Connector SSM command config CloudWatch output enabled.

        @[JSON::Field(key: "cloudWatchOutputEnabled")]
        getter cloud_watch_output_enabled : Bool

        # Connector SSM command config S3 output enabled.

        @[JSON::Field(key: "s3OutputEnabled")]
        getter s3_output_enabled : Bool

        # Connector SSM command config CloudWatch log group name.

        @[JSON::Field(key: "cloudWatchLogGroupName")]
        getter cloud_watch_log_group_name : String?

        # Connector SSM command config output S3 bucket name.

        @[JSON::Field(key: "outputS3BucketName")]
        getter output_s3_bucket_name : String?

        def initialize(
          @cloud_watch_output_enabled : Bool,
          @s3_output_enabled : Bool,
          @cloud_watch_log_group_name : String? = nil,
          @output_s3_bucket_name : String? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # Application name.

        @[JSON::Field(key: "name")]
        getter name : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Application description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Application tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @account_id : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateConnectorRequest
        include JSON::Serializable

        # Create Connector request name.

        @[JSON::Field(key: "name")]
        getter name : String

        # Create Connector request SSM instance ID.

        @[JSON::Field(key: "ssmInstanceID")]
        getter ssm_instance_id : String

        # Create Connector request SSM command config.

        @[JSON::Field(key: "ssmCommandConfig")]
        getter ssm_command_config : Types::ConnectorSsmCommandConfig?

        # Create Connector request tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @ssm_instance_id : String,
          @ssm_command_config : Types::ConnectorSsmCommandConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLaunchConfigurationTemplateRequest
        include JSON::Serializable

        # Associate public Ip address.

        @[JSON::Field(key: "associatePublicIpAddress")]
        getter associate_public_ip_address : Bool?

        # Launch configuration template boot mode.

        @[JSON::Field(key: "bootMode")]
        getter boot_mode : String?

        # Copy private Ip.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Copy tags.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # Enable map auto tagging.

        @[JSON::Field(key: "enableMapAutoTagging")]
        getter enable_map_auto_tagging : Bool?

        # Enable parameters encryption.

        @[JSON::Field(key: "enableParametersEncryption")]
        getter enable_parameters_encryption : Bool?

        # Large volume config.

        @[JSON::Field(key: "largeVolumeConf")]
        getter large_volume_conf : Types::LaunchTemplateDiskConf?

        # Launch disposition.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?


        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # Launch configuration template map auto tagging MPE ID.

        @[JSON::Field(key: "mapAutoTaggingMpeID")]
        getter map_auto_tagging_mpe_id : String?

        # Parameters encryption key.

        @[JSON::Field(key: "parametersEncryptionKey")]
        getter parameters_encryption_key : String?

        # Launch configuration template post launch actions.

        @[JSON::Field(key: "postLaunchActions")]
        getter post_launch_actions : Types::PostLaunchActions?

        # Small volume config.

        @[JSON::Field(key: "smallVolumeConf")]
        getter small_volume_conf : Types::LaunchTemplateDiskConf?

        # Small volume maximum size.

        @[JSON::Field(key: "smallVolumeMaxSize")]
        getter small_volume_max_size : Int64?

        # Request to associate tags during creation of a Launch Configuration Template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Target instance type right-sizing method.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @associate_public_ip_address : Bool? = nil,
          @boot_mode : String? = nil,
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @enable_map_auto_tagging : Bool? = nil,
          @enable_parameters_encryption : Bool? = nil,
          @large_volume_conf : Types::LaunchTemplateDiskConf? = nil,
          @launch_disposition : String? = nil,
          @licensing : Types::Licensing? = nil,
          @map_auto_tagging_mpe_id : String? = nil,
          @parameters_encryption_key : String? = nil,
          @post_launch_actions : Types::PostLaunchActions? = nil,
          @small_volume_conf : Types::LaunchTemplateDiskConf? = nil,
          @small_volume_max_size : Int64? = nil,
          @tags : Hash(String, String)? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end


      struct CreateReplicationConfigurationTemplateRequest
        include JSON::Serializable

        # Request to associate the default Application Migration Service Security group with the Replication
        # Settings template.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool

        # Request to configure bandwidth throttling during Replication Settings template creation.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64

        # Request to create Public IP during Replication Settings template creation.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool

        # Request to configure data plane routing during Replication Settings template creation.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String

        # Request to configure the default large staging disk EBS volume type during Replication Settings
        # template creation.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String

        # Request to configure EBS encryption during Replication Settings template creation.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String

        # Request to configure the Replication Server instance type during Replication Settings template
        # creation.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String

        # Request to configure the Replication Server Security group ID during Replication Settings template
        # creation.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)

        # Request to configure the Staging Area subnet ID during Replication Settings template creation.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String

        # Request to configure Staging Area tags during Replication Settings template creation.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)

        # Request to use Dedicated Replication Servers during Replication Settings template creation.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool

        # Request to configure an EBS encryption key during Replication Settings template creation.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # Request to configure the internet protocol to IPv4 or IPv6.

        @[JSON::Field(key: "internetProtocol")]
        getter internet_protocol : String?

        # Request to configure tags during Replication Settings template creation.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Request to use Fips Endpoint during Replication Settings template creation.

        @[JSON::Field(key: "useFipsEndpoint")]
        getter use_fips_endpoint : Bool?

        def initialize(
          @associate_default_security_group : Bool,
          @bandwidth_throttling : Int64,
          @create_public_ip : Bool,
          @data_plane_routing : String,
          @default_large_staging_disk_type : String,
          @ebs_encryption : String,
          @replication_server_instance_type : String,
          @replication_servers_security_groups_i_ds : Array(String),
          @staging_area_subnet_id : String,
          @staging_area_tags : Hash(String, String),
          @use_dedicated_replication_server : Bool,
          @ebs_encryption_key_arn : String? = nil,
          @internet_protocol : String? = nil,
          @tags : Hash(String, String)? = nil,
          @use_fips_endpoint : Bool? = nil
        )
        end
      end


      struct CreateWaveRequest
        include JSON::Serializable

        # Wave name.

        @[JSON::Field(key: "name")]
        getter name : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Wave description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Wave tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @account_id : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Error in data replication.

      struct DataReplicationError
        include JSON::Serializable

        # Error in data replication.

        @[JSON::Field(key: "error")]
        getter error : String?

        # Error in data replication.

        @[JSON::Field(key: "rawError")]
        getter raw_error : String?

        def initialize(
          @error : String? = nil,
          @raw_error : String? = nil
        )
        end
      end

      # Request data replication info.

      struct DataReplicationInfo
        include JSON::Serializable

        # Error in obtaining data replication info.

        @[JSON::Field(key: "dataReplicationError")]
        getter data_replication_error : Types::DataReplicationError?

        # Request to query whether data replication has been initiated.

        @[JSON::Field(key: "dataReplicationInitiation")]
        getter data_replication_initiation : Types::DataReplicationInitiation?

        # Request to query the data replication state.

        @[JSON::Field(key: "dataReplicationState")]
        getter data_replication_state : String?

        # Request to query the time when data replication will be complete.

        @[JSON::Field(key: "etaDateTime")]
        getter eta_date_time : String?

        # Request to query data replication lag duration.

        @[JSON::Field(key: "lagDuration")]
        getter lag_duration : String?

        # Request to query data replication last snapshot time.

        @[JSON::Field(key: "lastSnapshotDateTime")]
        getter last_snapshot_date_time : String?

        # Request to query disks replicated.

        @[JSON::Field(key: "replicatedDisks")]
        getter replicated_disks : Array(Types::DataReplicationInfoReplicatedDisk)?

        # Replication server instance ID.

        @[JSON::Field(key: "replicatorId")]
        getter replicator_id : String?

        def initialize(
          @data_replication_error : Types::DataReplicationError? = nil,
          @data_replication_initiation : Types::DataReplicationInitiation? = nil,
          @data_replication_state : String? = nil,
          @eta_date_time : String? = nil,
          @lag_duration : String? = nil,
          @last_snapshot_date_time : String? = nil,
          @replicated_disks : Array(Types::DataReplicationInfoReplicatedDisk)? = nil,
          @replicator_id : String? = nil
        )
        end
      end

      # Request to query disks replicated.

      struct DataReplicationInfoReplicatedDisk
        include JSON::Serializable

        # Request to query data replication backlog size in bytes.

        @[JSON::Field(key: "backloggedStorageBytes")]
        getter backlogged_storage_bytes : Int64?

        # Request to query device name.

        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # Request to query amount of data replicated in bytes.

        @[JSON::Field(key: "replicatedStorageBytes")]
        getter replicated_storage_bytes : Int64?

        # Request to query amount of data rescanned in bytes.

        @[JSON::Field(key: "rescannedStorageBytes")]
        getter rescanned_storage_bytes : Int64?

        # Request to query total amount of data replicated in bytes.

        @[JSON::Field(key: "totalStorageBytes")]
        getter total_storage_bytes : Int64?

        def initialize(
          @backlogged_storage_bytes : Int64? = nil,
          @device_name : String? = nil,
          @replicated_storage_bytes : Int64? = nil,
          @rescanned_storage_bytes : Int64? = nil,
          @total_storage_bytes : Int64? = nil
        )
        end
      end

      # Data replication initiation.

      struct DataReplicationInitiation
        include JSON::Serializable

        # Request to query next data initiation date and time.

        @[JSON::Field(key: "nextAttemptDateTime")]
        getter next_attempt_date_time : String?

        # Request to query data initiation start date and time.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : String?

        # Request to query data initiation steps.

        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::DataReplicationInitiationStep)?

        def initialize(
          @next_attempt_date_time : String? = nil,
          @start_date_time : String? = nil,
          @steps : Array(Types::DataReplicationInitiationStep)? = nil
        )
        end
      end

      # Data replication initiation step.

      struct DataReplicationInitiationStep
        include JSON::Serializable

        # Request to query data initiation step name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Request to query data initiation status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # Application ID.

        @[JSON::Field(key: "applicationID")]
        getter application_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @application_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DeleteApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConnectorRequest
        include JSON::Serializable

        # Delete Connector request connector ID.

        @[JSON::Field(key: "connectorID")]
        getter connector_id : String

        def initialize(
          @connector_id : String
        )
        end
      end


      struct DeleteJobRequest
        include JSON::Serializable

        # Request to delete Job from service by Job ID.

        @[JSON::Field(key: "jobID")]
        getter job_id : String

        # Request to delete Job from service by Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @job_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DeleteJobResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLaunchConfigurationTemplateRequest
        include JSON::Serializable

        # ID of resource to be deleted.

        @[JSON::Field(key: "launchConfigurationTemplateID")]
        getter launch_configuration_template_id : String

        def initialize(
          @launch_configuration_template_id : String
        )
        end
      end


      struct DeleteLaunchConfigurationTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteReplicationConfigurationTemplateRequest
        include JSON::Serializable

        # Request to delete Replication Configuration Template from service by Replication Configuration
        # Template ID.

        @[JSON::Field(key: "replicationConfigurationTemplateID")]
        getter replication_configuration_template_id : String

        def initialize(
          @replication_configuration_template_id : String
        )
        end
      end


      struct DeleteReplicationConfigurationTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSourceServerRequest
        include JSON::Serializable

        # Request to delete Source Server from service by Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Request to delete Source Server from service by Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DeleteSourceServerResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteVcenterClientRequest
        include JSON::Serializable

        # ID of resource to be deleted.

        @[JSON::Field(key: "vcenterClientID")]
        getter vcenter_client_id : String

        def initialize(
          @vcenter_client_id : String
        )
        end
      end


      struct DeleteWaveRequest
        include JSON::Serializable

        # Wave ID.

        @[JSON::Field(key: "waveID")]
        getter wave_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @wave_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DeleteWaveResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeJobLogItemsRequest
        include JSON::Serializable

        # Request to describe Job log job ID.

        @[JSON::Field(key: "jobID")]
        getter job_id : String

        # Request to describe Job log Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Request to describe Job log item maximum results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Request to describe Job log next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String,
          @account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeJobLogItemsResponse
        include JSON::Serializable

        # Request to describe Job log response items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::JobLog)?

        # Request to describe Job log response next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::JobLog)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeJobsRequest
        include JSON::Serializable

        # Request to describe job log items by Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Request to describe Job log filters.

        @[JSON::Field(key: "filters")]
        getter filters : Types::DescribeJobsRequestFilters?

        # Request to describe job log items by max results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Request to describe job log items by next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String? = nil,
          @filters : Types::DescribeJobsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Request to describe Job log filters.

      struct DescribeJobsRequestFilters
        include JSON::Serializable

        # Request to describe Job log filters by date.

        @[JSON::Field(key: "fromDate")]
        getter from_date : String?

        # Request to describe Job log filters by job ID.

        @[JSON::Field(key: "jobIDs")]
        getter job_i_ds : Array(String)?

        # Request to describe job log items by last date.

        @[JSON::Field(key: "toDate")]
        getter to_date : String?

        def initialize(
          @from_date : String? = nil,
          @job_i_ds : Array(String)? = nil,
          @to_date : String? = nil
        )
        end
      end


      struct DescribeJobsResponse
        include JSON::Serializable

        # Request to describe Job log items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Job)?

        # Request to describe Job response by next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Job)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeLaunchConfigurationTemplatesRequest
        include JSON::Serializable

        # Request to filter Launch Configuration Templates list by Launch Configuration Template ID.

        @[JSON::Field(key: "launchConfigurationTemplateIDs")]
        getter launch_configuration_template_i_ds : Array(String)?

        # Maximum results to be returned in DescribeLaunchConfigurationTemplates.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next pagination token returned from DescribeLaunchConfigurationTemplates.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @launch_configuration_template_i_ds : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeLaunchConfigurationTemplatesResponse
        include JSON::Serializable

        # List of items returned by DescribeLaunchConfigurationTemplates.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::LaunchConfigurationTemplate)?

        # Next pagination token returned from DescribeLaunchConfigurationTemplates.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::LaunchConfigurationTemplate)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeReplicationConfigurationTemplatesRequest
        include JSON::Serializable

        # Request to describe Replication Configuration template by max results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Request to describe Replication Configuration template by next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Request to describe Replication Configuration template by template IDs.

        @[JSON::Field(key: "replicationConfigurationTemplateIDs")]
        getter replication_configuration_template_i_ds : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @replication_configuration_template_i_ds : Array(String)? = nil
        )
        end
      end


      struct DescribeReplicationConfigurationTemplatesResponse
        include JSON::Serializable

        # Request to describe Replication Configuration template by items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ReplicationConfigurationTemplate)?

        # Request to describe Replication Configuration template by next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ReplicationConfigurationTemplate)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSourceServersRequest
        include JSON::Serializable

        # Request to filter Source Servers list by Accoun ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Request to filter Source Servers list.

        @[JSON::Field(key: "filters")]
        getter filters : Types::DescribeSourceServersRequestFilters?

        # Request to filter Source Servers list by maximum results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Request to filter Source Servers list by next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String? = nil,
          @filters : Types::DescribeSourceServersRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Request to filter Source Servers list.

      struct DescribeSourceServersRequestFilters
        include JSON::Serializable

        # Request to filter Source Servers list by application IDs.

        @[JSON::Field(key: "applicationIDs")]
        getter application_i_ds : Array(String)?

        # Request to filter Source Servers list by archived.

        @[JSON::Field(key: "isArchived")]
        getter is_archived : Bool?

        # Request to filter Source Servers list by life cycle states.

        @[JSON::Field(key: "lifeCycleStates")]
        getter life_cycle_states : Array(String)?

        # Request to filter Source Servers list by replication type.

        @[JSON::Field(key: "replicationTypes")]
        getter replication_types : Array(String)?

        # Request to filter Source Servers list by Source Server ID.

        @[JSON::Field(key: "sourceServerIDs")]
        getter source_server_i_ds : Array(String)?

        def initialize(
          @application_i_ds : Array(String)? = nil,
          @is_archived : Bool? = nil,
          @life_cycle_states : Array(String)? = nil,
          @replication_types : Array(String)? = nil,
          @source_server_i_ds : Array(String)? = nil
        )
        end
      end


      struct DescribeSourceServersResponse
        include JSON::Serializable

        # Request to filter Source Servers list by item.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::SourceServer)?

        # Request to filter Source Servers next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SourceServer)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeVcenterClientsRequest
        include JSON::Serializable

        # Maximum results to be returned in DescribeVcenterClients.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next pagination token to be provided for DescribeVcenterClients.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeVcenterClientsResponse
        include JSON::Serializable

        # List of items returned by DescribeVcenterClients.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::VcenterClient)?

        # Next pagination token returned from DescribeVcenterClients.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::VcenterClient)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DisassociateApplicationsRequest
        include JSON::Serializable

        # Application IDs list.

        @[JSON::Field(key: "applicationIDs")]
        getter application_i_ds : Array(String)

        # Wave ID.

        @[JSON::Field(key: "waveID")]
        getter wave_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @application_i_ds : Array(String),
          @wave_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DisassociateApplicationsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateSourceServersRequest
        include JSON::Serializable

        # Application ID.

        @[JSON::Field(key: "applicationID")]
        getter application_id : String

        # Source server IDs list.

        @[JSON::Field(key: "sourceServerIDs")]
        getter source_server_i_ds : Array(String)

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @application_id : String,
          @source_server_i_ds : Array(String),
          @account_id : String? = nil
        )
        end
      end


      struct DisassociateSourceServersResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisconnectFromServiceRequest
        include JSON::Serializable

        # Request to disconnect Source Server from service by Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Request to disconnect Source Server from service by Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end

      # The disk identifier.

      struct Disk
        include JSON::Serializable

        # The amount of storage on the disk in bytes.

        @[JSON::Field(key: "bytes")]
        getter bytes : Int64?

        # The disk or device name.

        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        def initialize(
          @bytes : Int64? = nil,
          @device_name : String? = nil
        )
        end
      end

      # Error details.

      struct ErrorDetails
        include JSON::Serializable

        # Error details code.

        @[JSON::Field(key: "code")]
        getter code : String?

        # Error details message.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Error details resourceId.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Error details resourceType.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Export errors data.

      struct ExportErrorData
        include JSON::Serializable

        # Export errors data raw error.

        @[JSON::Field(key: "rawError")]
        getter raw_error : String?

        def initialize(
          @raw_error : String? = nil
        )
        end
      end

      # Export task.

      struct ExportTask
        include JSON::Serializable

        # ExportTask arn.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Export task creation datetime.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : String?

        # Export task end datetime.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : String?

        # Export task id.

        @[JSON::Field(key: "exportID")]
        getter export_id : String?

        # Export task progress percentage.

        @[JSON::Field(key: "progressPercentage")]
        getter progress_percentage : Float64?

        # Export task s3 bucket.

        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String?

        # Export task s3 bucket owner.

        @[JSON::Field(key: "s3BucketOwner")]
        getter s3_bucket_owner : String?

        # Export task s3 key.

        @[JSON::Field(key: "s3Key")]
        getter s3_key : String?

        # Export task status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Export task summary.

        @[JSON::Field(key: "summary")]
        getter summary : Types::ExportTaskSummary?

        # Export task tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_date_time : String? = nil,
          @end_date_time : String? = nil,
          @export_id : String? = nil,
          @progress_percentage : Float64? = nil,
          @s3_bucket : String? = nil,
          @s3_bucket_owner : String? = nil,
          @s3_key : String? = nil,
          @status : String? = nil,
          @summary : Types::ExportTaskSummary? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Export task error.

      struct ExportTaskError
        include JSON::Serializable

        # Export task error data.

        @[JSON::Field(key: "errorData")]
        getter error_data : Types::ExportErrorData?

        # Export task error datetime.

        @[JSON::Field(key: "errorDateTime")]
        getter error_date_time : String?

        def initialize(
          @error_data : Types::ExportErrorData? = nil,
          @error_date_time : String? = nil
        )
        end
      end

      # Export task summary.

      struct ExportTaskSummary
        include JSON::Serializable

        # Export task summary applications count.

        @[JSON::Field(key: "applicationsCount")]
        getter applications_count : Int64?

        # Export task summary servers count.

        @[JSON::Field(key: "serversCount")]
        getter servers_count : Int64?

        # Export task summary waves count.

        @[JSON::Field(key: "wavesCount")]
        getter waves_count : Int64?

        def initialize(
          @applications_count : Int64? = nil,
          @servers_count : Int64? = nil,
          @waves_count : Int64? = nil
        )
        end
      end


      struct FinalizeCutoverRequest
        include JSON::Serializable

        # Request to finalize Cutover by Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Request to finalize Cutover by Source Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct GetLaunchConfigurationRequest
        include JSON::Serializable

        # Request to get Launch Configuration information by Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Request to get Launch Configuration information by Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct GetReplicationConfigurationRequest
        include JSON::Serializable

        # Request to get Replication Configuration by Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Request to get Replication Configuration by Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end

      # Identification hints.

      struct IdentificationHints
        include JSON::Serializable

        # AWS Instance ID identification hint.

        @[JSON::Field(key: "awsInstanceID")]
        getter aws_instance_id : String?

        # FQDN address identification hint.

        @[JSON::Field(key: "fqdn")]
        getter fqdn : String?

        # Hostname identification hint.

        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # vCenter VM path identification hint.

        @[JSON::Field(key: "vmPath")]
        getter vm_path : String?

        # vmWare UUID identification hint.

        @[JSON::Field(key: "vmWareUuid")]
        getter vm_ware_uuid : String?

        def initialize(
          @aws_instance_id : String? = nil,
          @fqdn : String? = nil,
          @hostname : String? = nil,
          @vm_path : String? = nil,
          @vm_ware_uuid : String? = nil
        )
        end
      end

      # Import error data.

      struct ImportErrorData
        include JSON::Serializable

        # Import error data source account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Import error data application ID.

        @[JSON::Field(key: "applicationID")]
        getter application_id : String?

        # Import error data ec2 LaunchTemplate ID.

        @[JSON::Field(key: "ec2LaunchTemplateID")]
        getter ec2_launch_template_id : String?

        # Import error data raw error.

        @[JSON::Field(key: "rawError")]
        getter raw_error : String?

        # Import error data row number.

        @[JSON::Field(key: "rowNumber")]
        getter row_number : Int64?

        # Import error data source server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # Import error data wave id.

        @[JSON::Field(key: "waveID")]
        getter wave_id : String?

        def initialize(
          @account_id : String? = nil,
          @application_id : String? = nil,
          @ec2_launch_template_id : String? = nil,
          @raw_error : String? = nil,
          @row_number : Int64? = nil,
          @source_server_id : String? = nil,
          @wave_id : String? = nil
        )
        end
      end

      # Import task.

      struct ImportTask
        include JSON::Serializable

        # ImportTask arn.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Import task creation datetime.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : String?

        # Import task end datetime.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : String?

        # Import task id.

        @[JSON::Field(key: "importID")]
        getter import_id : String?

        # Import task progress percentage.

        @[JSON::Field(key: "progressPercentage")]
        getter progress_percentage : Float64?

        # Import task s3 bucket source.

        @[JSON::Field(key: "s3BucketSource")]
        getter s3_bucket_source : Types::S3BucketSource?

        # Import task status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Import task summary.

        @[JSON::Field(key: "summary")]
        getter summary : Types::ImportTaskSummary?

        # Import task tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_date_time : String? = nil,
          @end_date_time : String? = nil,
          @import_id : String? = nil,
          @progress_percentage : Float64? = nil,
          @s3_bucket_source : Types::S3BucketSource? = nil,
          @status : String? = nil,
          @summary : Types::ImportTaskSummary? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Import task error.

      struct ImportTaskError
        include JSON::Serializable

        # Import task error data.

        @[JSON::Field(key: "errorData")]
        getter error_data : Types::ImportErrorData?

        # Import task error datetime.

        @[JSON::Field(key: "errorDateTime")]
        getter error_date_time : String?

        # Import task error type.

        @[JSON::Field(key: "errorType")]
        getter error_type : String?

        def initialize(
          @error_data : Types::ImportErrorData? = nil,
          @error_date_time : String? = nil,
          @error_type : String? = nil
        )
        end
      end

      # Import task summary.

      struct ImportTaskSummary
        include JSON::Serializable

        # Import task summary applications.

        @[JSON::Field(key: "applications")]
        getter applications : Types::ImportTaskSummaryApplications?

        # Import task summary servers.

        @[JSON::Field(key: "servers")]
        getter servers : Types::ImportTaskSummaryServers?

        # Import task summary waves.

        @[JSON::Field(key: "waves")]
        getter waves : Types::ImportTaskSummaryWaves?

        def initialize(
          @applications : Types::ImportTaskSummaryApplications? = nil,
          @servers : Types::ImportTaskSummaryServers? = nil,
          @waves : Types::ImportTaskSummaryWaves? = nil
        )
        end
      end

      # Import task summary applications.

      struct ImportTaskSummaryApplications
        include JSON::Serializable

        # Import task summary applications created count.

        @[JSON::Field(key: "createdCount")]
        getter created_count : Int64?

        # Import task summary applications modified count.

        @[JSON::Field(key: "modifiedCount")]
        getter modified_count : Int64?

        def initialize(
          @created_count : Int64? = nil,
          @modified_count : Int64? = nil
        )
        end
      end

      # Import task summary servers.

      struct ImportTaskSummaryServers
        include JSON::Serializable

        # Import task summary servers created count.

        @[JSON::Field(key: "createdCount")]
        getter created_count : Int64?

        # Import task summary servers modified count.

        @[JSON::Field(key: "modifiedCount")]
        getter modified_count : Int64?

        def initialize(
          @created_count : Int64? = nil,
          @modified_count : Int64? = nil
        )
        end
      end

      # Import task summery waves.

      struct ImportTaskSummaryWaves
        include JSON::Serializable

        # Import task summery waves created count.

        @[JSON::Field(key: "createdCount")]
        getter created_count : Int64?

        # Import task summery waves modified count.

        @[JSON::Field(key: "modifiedCount")]
        getter modified_count : Int64?

        def initialize(
          @created_count : Int64? = nil,
          @modified_count : Int64? = nil
        )
        end
      end


      struct InitializeServiceRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct InitializeServiceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The server encountered an unexpected condition that prevented it from fulfilling the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The server encountered an unexpected condition that prevented it from fulfilling the request. The
        # request will be retried again after x seconds.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int64?

        def initialize(
          @message : String,
          @retry_after_seconds : Int64? = nil
        )
        end
      end

      # Job.

      struct Job
        include JSON::Serializable

        # Job ID.

        @[JSON::Field(key: "jobID")]
        getter job_id : String

        # the ARN of the specific Job.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Job creation time.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : String?

        # Job end time.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : String?

        # Job initiated by field.

        @[JSON::Field(key: "initiatedBy")]
        getter initiated_by : String?

        # Servers participating in a specific Job.

        @[JSON::Field(key: "participatingServers")]
        getter participating_servers : Array(Types::ParticipatingServer)?

        # Job status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Tags associated with specific Job.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Job type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @job_id : String,
          @arn : String? = nil,
          @creation_date_time : String? = nil,
          @end_date_time : String? = nil,
          @initiated_by : String? = nil,
          @participating_servers : Array(Types::ParticipatingServer)? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Job log.

      struct JobLog
        include JSON::Serializable

        # Job log event.

        @[JSON::Field(key: "event")]
        getter event : String?

        # Job event data

        @[JSON::Field(key: "eventData")]
        getter event_data : Types::JobLogEventData?

        # Job log event date and time.

        @[JSON::Field(key: "logDateTime")]
        getter log_date_time : String?

        def initialize(
          @event : String? = nil,
          @event_data : Types::JobLogEventData? = nil,
          @log_date_time : String? = nil
        )
        end
      end

      # Job log data

      struct JobLogEventData
        include JSON::Serializable

        # Retries for this operation.

        @[JSON::Field(key: "attemptCount")]
        getter attempt_count : Int32?

        # Job Event conversion Server ID.

        @[JSON::Field(key: "conversionServerID")]
        getter conversion_server_id : String?

        # The maximum number of retries that will be attempted if this operation failed.

        @[JSON::Field(key: "maxAttemptsCount")]
        getter max_attempts_count : Int32?

        # Job error.

        @[JSON::Field(key: "rawError")]
        getter raw_error : String?

        # Job Event Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # Job Event Target instance ID.

        @[JSON::Field(key: "targetInstanceID")]
        getter target_instance_id : String?

        def initialize(
          @attempt_count : Int32? = nil,
          @conversion_server_id : String? = nil,
          @max_attempts_count : Int32? = nil,
          @raw_error : String? = nil,
          @source_server_id : String? = nil,
          @target_instance_id : String? = nil
        )
        end
      end

      # Launch Status of the Job Post Launch Actions.

      struct JobPostLaunchActionsLaunchStatus
        include JSON::Serializable

        # AWS Systems Manager Document's execution ID of the of the Job Post Launch Actions.

        @[JSON::Field(key: "executionID")]
        getter execution_id : String?

        # AWS Systems Manager Document's execution status.

        @[JSON::Field(key: "executionStatus")]
        getter execution_status : String?

        # AWS Systems Manager Document's failure reason.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # AWS Systems Manager's Document of the of the Job Post Launch Actions.

        @[JSON::Field(key: "ssmDocument")]
        getter ssm_document : Types::SsmDocument?

        # AWS Systems Manager Document type.

        @[JSON::Field(key: "ssmDocumentType")]
        getter ssm_document_type : String?

        def initialize(
          @execution_id : String? = nil,
          @execution_status : String? = nil,
          @failure_reason : String? = nil,
          @ssm_document : Types::SsmDocument? = nil,
          @ssm_document_type : String? = nil
        )
        end
      end


      struct LaunchConfiguration
        include JSON::Serializable

        # Launch configuration boot mode.

        @[JSON::Field(key: "bootMode")]
        getter boot_mode : String?

        # Copy Private IP during Launch Configuration.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Copy Tags during Launch Configuration.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # Launch configuration EC2 Launch template ID.

        @[JSON::Field(key: "ec2LaunchTemplateID")]
        getter ec2_launch_template_id : String?

        # Enable map auto tagging.

        @[JSON::Field(key: "enableMapAutoTagging")]
        getter enable_map_auto_tagging : Bool?

        # Launch disposition for launch configuration.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?

        # Launch configuration OS licensing.

        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # Map auto tagging MPE ID.

        @[JSON::Field(key: "mapAutoTaggingMpeID")]
        getter map_auto_tagging_mpe_id : String?

        # Launch configuration name.

        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "postLaunchActions")]
        getter post_launch_actions : Types::PostLaunchActions?

        # Launch configuration Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # Launch configuration Target instance type right sizing method.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @boot_mode : String? = nil,
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @ec2_launch_template_id : String? = nil,
          @enable_map_auto_tagging : Bool? = nil,
          @launch_disposition : String? = nil,
          @licensing : Types::Licensing? = nil,
          @map_auto_tagging_mpe_id : String? = nil,
          @name : String? = nil,
          @post_launch_actions : Types::PostLaunchActions? = nil,
          @source_server_id : String? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end


      struct LaunchConfigurationTemplate
        include JSON::Serializable

        # ID of the Launch Configuration Template.

        @[JSON::Field(key: "launchConfigurationTemplateID")]
        getter launch_configuration_template_id : String

        # ARN of the Launch Configuration Template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Associate public Ip address.

        @[JSON::Field(key: "associatePublicIpAddress")]
        getter associate_public_ip_address : Bool?

        # Launch configuration template boot mode.

        @[JSON::Field(key: "bootMode")]
        getter boot_mode : String?

        # Copy private Ip.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Copy tags.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # EC2 launch template ID.

        @[JSON::Field(key: "ec2LaunchTemplateID")]
        getter ec2_launch_template_id : String?

        # Enable map auto tagging.

        @[JSON::Field(key: "enableMapAutoTagging")]
        getter enable_map_auto_tagging : Bool?

        # Enable parameters encryption.

        @[JSON::Field(key: "enableParametersEncryption")]
        getter enable_parameters_encryption : Bool?

        # Large volume config.

        @[JSON::Field(key: "largeVolumeConf")]
        getter large_volume_conf : Types::LaunchTemplateDiskConf?

        # Launch disposition.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?


        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # Launch configuration template map auto tagging MPE ID.

        @[JSON::Field(key: "mapAutoTaggingMpeID")]
        getter map_auto_tagging_mpe_id : String?

        # Parameters encryption key.

        @[JSON::Field(key: "parametersEncryptionKey")]
        getter parameters_encryption_key : String?

        # Post Launch Actions of the Launch Configuration Template.

        @[JSON::Field(key: "postLaunchActions")]
        getter post_launch_actions : Types::PostLaunchActions?

        # Small volume config.

        @[JSON::Field(key: "smallVolumeConf")]
        getter small_volume_conf : Types::LaunchTemplateDiskConf?

        # Small volume maximum size.

        @[JSON::Field(key: "smallVolumeMaxSize")]
        getter small_volume_max_size : Int64?

        # Tags of the Launch Configuration Template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Target instance type right-sizing method.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @launch_configuration_template_id : String,
          @arn : String? = nil,
          @associate_public_ip_address : Bool? = nil,
          @boot_mode : String? = nil,
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @ec2_launch_template_id : String? = nil,
          @enable_map_auto_tagging : Bool? = nil,
          @enable_parameters_encryption : Bool? = nil,
          @large_volume_conf : Types::LaunchTemplateDiskConf? = nil,
          @launch_disposition : String? = nil,
          @licensing : Types::Licensing? = nil,
          @map_auto_tagging_mpe_id : String? = nil,
          @parameters_encryption_key : String? = nil,
          @post_launch_actions : Types::PostLaunchActions? = nil,
          @small_volume_conf : Types::LaunchTemplateDiskConf? = nil,
          @small_volume_max_size : Int64? = nil,
          @tags : Hash(String, String)? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end

      # Launch template disk configuration.

      struct LaunchTemplateDiskConf
        include JSON::Serializable

        # Launch template disk iops configuration.

        @[JSON::Field(key: "iops")]
        getter iops : Int64?

        # Launch template disk throughput configuration.

        @[JSON::Field(key: "throughput")]
        getter throughput : Int64?

        # Launch template disk volume type configuration.

        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @iops : Int64? = nil,
          @throughput : Int64? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # Launched instance.

      struct LaunchedInstance
        include JSON::Serializable

        # Launched instance EC2 ID.

        @[JSON::Field(key: "ec2InstanceID")]
        getter ec2_instance_id : String?

        # Launched instance first boot.

        @[JSON::Field(key: "firstBoot")]
        getter first_boot : String?

        # Launched instance Job ID.

        @[JSON::Field(key: "jobID")]
        getter job_id : String?

        def initialize(
          @ec2_instance_id : String? = nil,
          @first_boot : String? = nil,
          @job_id : String? = nil
        )
        end
      end

      # Configure Licensing.

      struct Licensing
        include JSON::Serializable

        # Configure BYOL OS licensing.

        @[JSON::Field(key: "osByol")]
        getter os_byol : Bool?

        def initialize(
          @os_byol : Bool? = nil
        )
        end
      end

      # Lifecycle.

      struct LifeCycle
        include JSON::Serializable

        # Lifecycle added to service data and time.

        @[JSON::Field(key: "addedToServiceDateTime")]
        getter added_to_service_date_time : String?

        # Lifecycle elapsed time and duration.

        @[JSON::Field(key: "elapsedReplicationDuration")]
        getter elapsed_replication_duration : String?

        # Lifecycle replication initiation date and time.

        @[JSON::Field(key: "firstByteDateTime")]
        getter first_byte_date_time : String?

        # Lifecycle last Cutover.

        @[JSON::Field(key: "lastCutover")]
        getter last_cutover : Types::LifeCycleLastCutover?

        # Lifecycle last seen date and time.

        @[JSON::Field(key: "lastSeenByServiceDateTime")]
        getter last_seen_by_service_date_time : String?

        # Lifecycle last Test.

        @[JSON::Field(key: "lastTest")]
        getter last_test : Types::LifeCycleLastTest?

        # Lifecycle state.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @added_to_service_date_time : String? = nil,
          @elapsed_replication_duration : String? = nil,
          @first_byte_date_time : String? = nil,
          @last_cutover : Types::LifeCycleLastCutover? = nil,
          @last_seen_by_service_date_time : String? = nil,
          @last_test : Types::LifeCycleLastTest? = nil,
          @state : String? = nil
        )
        end
      end

      # Lifecycle last Cutover .

      struct LifeCycleLastCutover
        include JSON::Serializable

        # Lifecycle Cutover finalized date and time.

        @[JSON::Field(key: "finalized")]
        getter finalized : Types::LifeCycleLastCutoverFinalized?

        # Lifecycle last Cutover initiated.

        @[JSON::Field(key: "initiated")]
        getter initiated : Types::LifeCycleLastCutoverInitiated?

        # Lifecycle last Cutover reverted.

        @[JSON::Field(key: "reverted")]
        getter reverted : Types::LifeCycleLastCutoverReverted?

        def initialize(
          @finalized : Types::LifeCycleLastCutoverFinalized? = nil,
          @initiated : Types::LifeCycleLastCutoverInitiated? = nil,
          @reverted : Types::LifeCycleLastCutoverReverted? = nil
        )
        end
      end

      # Lifecycle Cutover finalized

      struct LifeCycleLastCutoverFinalized
        include JSON::Serializable

        # Lifecycle Cutover finalized date and time.

        @[JSON::Field(key: "apiCallDateTime")]
        getter api_call_date_time : String?

        def initialize(
          @api_call_date_time : String? = nil
        )
        end
      end

      # Lifecycle last Cutover initiated.

      struct LifeCycleLastCutoverInitiated
        include JSON::Serializable


        @[JSON::Field(key: "apiCallDateTime")]
        getter api_call_date_time : String?

        # Lifecycle last Cutover initiated by Job ID.

        @[JSON::Field(key: "jobID")]
        getter job_id : String?

        def initialize(
          @api_call_date_time : String? = nil,
          @job_id : String? = nil
        )
        end
      end

      # Lifecycle last Cutover reverted.

      struct LifeCycleLastCutoverReverted
        include JSON::Serializable

        # Lifecycle last Cutover reverted API call date time.

        @[JSON::Field(key: "apiCallDateTime")]
        getter api_call_date_time : String?

        def initialize(
          @api_call_date_time : String? = nil
        )
        end
      end

      # Lifecycle last Test.

      struct LifeCycleLastTest
        include JSON::Serializable

        # Lifecycle last Test finalized.

        @[JSON::Field(key: "finalized")]
        getter finalized : Types::LifeCycleLastTestFinalized?

        # Lifecycle last Test initiated.

        @[JSON::Field(key: "initiated")]
        getter initiated : Types::LifeCycleLastTestInitiated?

        # Lifecycle last Test reverted.

        @[JSON::Field(key: "reverted")]
        getter reverted : Types::LifeCycleLastTestReverted?

        def initialize(
          @finalized : Types::LifeCycleLastTestFinalized? = nil,
          @initiated : Types::LifeCycleLastTestInitiated? = nil,
          @reverted : Types::LifeCycleLastTestReverted? = nil
        )
        end
      end

      # Lifecycle last Test finalized.

      struct LifeCycleLastTestFinalized
        include JSON::Serializable

        # Lifecycle Test failed API call date and time.

        @[JSON::Field(key: "apiCallDateTime")]
        getter api_call_date_time : String?

        def initialize(
          @api_call_date_time : String? = nil
        )
        end
      end

      # Lifecycle last Test initiated.

      struct LifeCycleLastTestInitiated
        include JSON::Serializable

        # Lifecycle last Test initiated API call date and time.

        @[JSON::Field(key: "apiCallDateTime")]
        getter api_call_date_time : String?

        # Lifecycle last Test initiated Job ID.

        @[JSON::Field(key: "jobID")]
        getter job_id : String?

        def initialize(
          @api_call_date_time : String? = nil,
          @job_id : String? = nil
        )
        end
      end

      # Lifecycle last Test reverted.

      struct LifeCycleLastTestReverted
        include JSON::Serializable

        # Lifecycle last Test reverted API call date and time.

        @[JSON::Field(key: "apiCallDateTime")]
        getter api_call_date_time : String?

        def initialize(
          @api_call_date_time : String? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # Applications list Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Applications list filters.

        @[JSON::Field(key: "filters")]
        getter filters : Types::ListApplicationsRequestFilters?

        # Maximum results to return when listing applications.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Request next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String? = nil,
          @filters : Types::ListApplicationsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Applications list filters.

      struct ListApplicationsRequestFilters
        include JSON::Serializable

        # Filter applications list by application ID.

        @[JSON::Field(key: "applicationIDs")]
        getter application_i_ds : Array(String)?

        # Filter applications list by archival status.

        @[JSON::Field(key: "isArchived")]
        getter is_archived : Bool?

        # Filter applications list by wave ID.

        @[JSON::Field(key: "waveIDs")]
        getter wave_i_ds : Array(String)?

        def initialize(
          @application_i_ds : Array(String)? = nil,
          @is_archived : Bool? = nil,
          @wave_i_ds : Array(String)? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # Applications list.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Application)?

        # Response next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Application)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectorsRequest
        include JSON::Serializable

        # List Connectors Request filters.

        @[JSON::Field(key: "filters")]
        getter filters : Types::ListConnectorsRequestFilters?

        # List Connectors Request max results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # List Connectors Request next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::ListConnectorsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List Connectors Request Filters.

      struct ListConnectorsRequestFilters
        include JSON::Serializable

        # List Connectors Request Filters connector IDs.

        @[JSON::Field(key: "connectorIDs")]
        getter connector_i_ds : Array(String)?

        def initialize(
          @connector_i_ds : Array(String)? = nil
        )
        end
      end


      struct ListConnectorsResponse
        include JSON::Serializable

        # List connectors response items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Connector)?

        # List connectors response next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Connector)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List export errors request.

      struct ListExportErrorsRequest
        include JSON::Serializable

        # List export errors request export id.

        @[JSON::Field(key: "exportID")]
        getter export_id : String

        # List export errors request max results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # List export errors request next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @export_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List export errors response.

      struct ListExportErrorsResponse
        include JSON::Serializable

        # List export errors response items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ExportTaskError)?

        # List export errors response next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ExportTaskError)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List export request.

      struct ListExportsRequest
        include JSON::Serializable


        @[JSON::Field(key: "filters")]
        getter filters : Types::ListExportsRequestFilters?

        # List export request max results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # List export request next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::ListExportsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List exports request filters.

      struct ListExportsRequestFilters
        include JSON::Serializable

        # List exports request filters export ids.

        @[JSON::Field(key: "exportIDs")]
        getter export_i_ds : Array(String)?

        def initialize(
          @export_i_ds : Array(String)? = nil
        )
        end
      end

      # List export response.

      struct ListExportsResponse
        include JSON::Serializable

        # List export response items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ExportTask)?

        # List export response next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ExportTask)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List import errors request.

      struct ListImportErrorsRequest
        include JSON::Serializable

        # List import errors request import id.

        @[JSON::Field(key: "importID")]
        getter import_id : String

        # List import errors request max results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # List import errors request next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @import_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List imports errors response.

      struct ListImportErrorsResponse
        include JSON::Serializable

        # List imports errors response items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ImportTaskError)?

        # List imports errors response next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ImportTaskError)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List imports request.

      struct ListImportsRequest
        include JSON::Serializable

        # List imports request filters.

        @[JSON::Field(key: "filters")]
        getter filters : Types::ListImportsRequestFilters?

        # List imports request max results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # List imports request next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::ListImportsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List imports request filters.

      struct ListImportsRequestFilters
        include JSON::Serializable

        # List imports request filters import IDs.

        @[JSON::Field(key: "importIDs")]
        getter import_i_ds : Array(String)?

        def initialize(
          @import_i_ds : Array(String)? = nil
        )
        end
      end

      # List import response.

      struct ListImportsResponse
        include JSON::Serializable

        # List import response items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ImportTask)?

        # List import response next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ImportTask)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List managed accounts request.

      struct ListManagedAccountsRequest
        include JSON::Serializable

        # List managed accounts request max results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # List managed accounts request next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List managed accounts response.

      struct ListManagedAccountsResponse
        include JSON::Serializable

        # List managed accounts response items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ManagedAccount)

        # List managed accounts response next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ManagedAccount),
          @next_token : String? = nil
        )
        end
      end


      struct ListSourceServerActionsRequest
        include JSON::Serializable

        # Source server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Account ID to return when listing source server post migration custom actions.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Filters to apply when listing source server post migration custom actions.

        @[JSON::Field(key: "filters")]
        getter filters : Types::SourceServerActionsRequestFilters?

        # Maximum amount of items to return when listing source server post migration custom actions.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token to use when listing source server post migration custom actions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil,
          @filters : Types::SourceServerActionsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSourceServerActionsResponse
        include JSON::Serializable

        # List of source server post migration custom actions.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::SourceServerActionDocument)?

        # Next token returned when listing source server post migration custom actions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SourceServerActionDocument)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # List tags for resource request by ARN.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # List tags for resource response.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTemplateActionsRequest
        include JSON::Serializable

        # Launch configuration template ID.

        @[JSON::Field(key: "launchConfigurationTemplateID")]
        getter launch_configuration_template_id : String

        # Filters to apply when listing template post migration custom actions.

        @[JSON::Field(key: "filters")]
        getter filters : Types::TemplateActionsRequestFilters?

        # Maximum amount of items to return when listing template post migration custom actions.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token to use when listing template post migration custom actions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @launch_configuration_template_id : String,
          @filters : Types::TemplateActionsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTemplateActionsResponse
        include JSON::Serializable

        # List of template post migration custom actions.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::TemplateActionDocument)?

        # Next token returned when listing template post migration custom actions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::TemplateActionDocument)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWavesRequest
        include JSON::Serializable

        # Request account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Waves list filters.

        @[JSON::Field(key: "filters")]
        getter filters : Types::ListWavesRequestFilters?

        # Maximum results to return when listing waves.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Request next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String? = nil,
          @filters : Types::ListWavesRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Waves list filters.

      struct ListWavesRequestFilters
        include JSON::Serializable

        # Filter waves list by archival status.

        @[JSON::Field(key: "isArchived")]
        getter is_archived : Bool?

        # Filter waves list by wave ID.

        @[JSON::Field(key: "waveIDs")]
        getter wave_i_ds : Array(String)?

        def initialize(
          @is_archived : Bool? = nil,
          @wave_i_ds : Array(String)? = nil
        )
        end
      end


      struct ListWavesResponse
        include JSON::Serializable

        # Waves list.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Wave)?

        # Response next token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Wave)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Managed account.

      struct ManagedAccount
        include JSON::Serializable

        # Managed account, account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end


      struct MarkAsArchivedRequest
        include JSON::Serializable

        # Mark as archived by Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Mark as archived by Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end

      # Network interface.

      struct NetworkInterface
        include JSON::Serializable

        # Network interface IPs.

        @[JSON::Field(key: "ips")]
        getter ips : Array(String)?

        # Network interface primary IP.

        @[JSON::Field(key: "isPrimary")]
        getter is_primary : Bool?

        # Network interface Mac address.

        @[JSON::Field(key: "macAddress")]
        getter mac_address : String?

        def initialize(
          @ips : Array(String)? = nil,
          @is_primary : Bool? = nil,
          @mac_address : String? = nil
        )
        end
      end

      # Operating System.

      struct OS
        include JSON::Serializable

        # OS full string.

        @[JSON::Field(key: "fullString")]
        getter full_string : String?

        def initialize(
          @full_string : String? = nil
        )
        end
      end

      # Server participating in Job.

      struct ParticipatingServer
        include JSON::Serializable

        # Participating server Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Participating server launch status.

        @[JSON::Field(key: "launchStatus")]
        getter launch_status : String?

        # Participating server's launched ec2 instance ID.

        @[JSON::Field(key: "launchedEc2InstanceID")]
        getter launched_ec2_instance_id : String?

        # Participating server's Post Launch Actions Status.

        @[JSON::Field(key: "postLaunchActionsStatus")]
        getter post_launch_actions_status : Types::PostLaunchActionsStatus?

        def initialize(
          @source_server_id : String,
          @launch_status : String? = nil,
          @launched_ec2_instance_id : String? = nil,
          @post_launch_actions_status : Types::PostLaunchActionsStatus? = nil
        )
        end
      end


      struct PauseReplicationRequest
        include JSON::Serializable

        # Pause Replication Request source server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Pause Replication Request account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end

      # Post Launch Actions to executed on the Test or Cutover instance.

      struct PostLaunchActions
        include JSON::Serializable

        # AWS Systems Manager Command's CloudWatch log group name.

        @[JSON::Field(key: "cloudWatchLogGroupName")]
        getter cloud_watch_log_group_name : String?

        # Deployment type in which AWS Systems Manager Documents will be executed.

        @[JSON::Field(key: "deployment")]
        getter deployment : String?

        # AWS Systems Manager Command's logs S3 log bucket.

        @[JSON::Field(key: "s3LogBucket")]
        getter s3_log_bucket : String?

        # AWS Systems Manager Command's logs S3 output key prefix.

        @[JSON::Field(key: "s3OutputKeyPrefix")]
        getter s3_output_key_prefix : String?

        # AWS Systems Manager Documents.

        @[JSON::Field(key: "ssmDocuments")]
        getter ssm_documents : Array(Types::SsmDocument)?

        def initialize(
          @cloud_watch_log_group_name : String? = nil,
          @deployment : String? = nil,
          @s3_log_bucket : String? = nil,
          @s3_output_key_prefix : String? = nil,
          @ssm_documents : Array(Types::SsmDocument)? = nil
        )
        end
      end

      # Status of the Post Launch Actions running on the Test or Cutover instance.

      struct PostLaunchActionsStatus
        include JSON::Serializable

        # List of Post Launch Action status.

        @[JSON::Field(key: "postLaunchActionsLaunchStatusList")]
        getter post_launch_actions_launch_status_list : Array(Types::JobPostLaunchActionsLaunchStatus)?

        # Time where the AWS Systems Manager was detected as running on the Test or Cutover instance.

        @[JSON::Field(key: "ssmAgentDiscoveryDatetime")]
        getter ssm_agent_discovery_datetime : String?

        def initialize(
          @post_launch_actions_launch_status_list : Array(Types::JobPostLaunchActionsLaunchStatus)? = nil,
          @ssm_agent_discovery_datetime : String? = nil
        )
        end
      end


      struct PutSourceServerActionRequest
        include JSON::Serializable

        # Source server post migration custom action ID.

        @[JSON::Field(key: "actionID")]
        getter action_id : String

        # Source server post migration custom action name.

        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # Source server post migration custom action document identifier.

        @[JSON::Field(key: "documentIdentifier")]
        getter document_identifier : String

        # Source server post migration custom action order.

        @[JSON::Field(key: "order")]
        getter order : Int32

        # Source server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Source server post migration custom account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Source server post migration custom action active status.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # Source server post migration custom action category.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Source server post migration custom action description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Source server post migration custom action document version.

        @[JSON::Field(key: "documentVersion")]
        getter document_version : String?

        # Source server post migration custom action external parameters.

        @[JSON::Field(key: "externalParameters")]
        getter external_parameters : Hash(String, Types::SsmExternalParameter)?

        # Source server post migration custom action must succeed for cutover.

        @[JSON::Field(key: "mustSucceedForCutover")]
        getter must_succeed_for_cutover : Bool?

        # Source server post migration custom action parameters.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Array(Types::SsmParameterStoreParameter))?

        # Source server post migration custom action timeout in seconds.

        @[JSON::Field(key: "timeoutSeconds")]
        getter timeout_seconds : Int32?

        def initialize(
          @action_id : String,
          @action_name : String,
          @document_identifier : String,
          @order : Int32,
          @source_server_id : String,
          @account_id : String? = nil,
          @active : Bool? = nil,
          @category : String? = nil,
          @description : String? = nil,
          @document_version : String? = nil,
          @external_parameters : Hash(String, Types::SsmExternalParameter)? = nil,
          @must_succeed_for_cutover : Bool? = nil,
          @parameters : Hash(String, Array(Types::SsmParameterStoreParameter))? = nil,
          @timeout_seconds : Int32? = nil
        )
        end
      end


      struct PutTemplateActionRequest
        include JSON::Serializable

        # Template post migration custom action ID.

        @[JSON::Field(key: "actionID")]
        getter action_id : String

        # Template post migration custom action name.

        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # Template post migration custom action document identifier.

        @[JSON::Field(key: "documentIdentifier")]
        getter document_identifier : String

        # Launch configuration template ID.

        @[JSON::Field(key: "launchConfigurationTemplateID")]
        getter launch_configuration_template_id : String

        # Template post migration custom action order.

        @[JSON::Field(key: "order")]
        getter order : Int32

        # Template post migration custom action active status.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # Template post migration custom action category.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Template post migration custom action description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Template post migration custom action document version.

        @[JSON::Field(key: "documentVersion")]
        getter document_version : String?

        # Template post migration custom action external parameters.

        @[JSON::Field(key: "externalParameters")]
        getter external_parameters : Hash(String, Types::SsmExternalParameter)?

        # Template post migration custom action must succeed for cutover.

        @[JSON::Field(key: "mustSucceedForCutover")]
        getter must_succeed_for_cutover : Bool?

        # Operating system eligible for this template post migration custom action.

        @[JSON::Field(key: "operatingSystem")]
        getter operating_system : String?

        # Template post migration custom action parameters.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Array(Types::SsmParameterStoreParameter))?

        # Template post migration custom action timeout in seconds.

        @[JSON::Field(key: "timeoutSeconds")]
        getter timeout_seconds : Int32?

        def initialize(
          @action_id : String,
          @action_name : String,
          @document_identifier : String,
          @launch_configuration_template_id : String,
          @order : Int32,
          @active : Bool? = nil,
          @category : String? = nil,
          @description : String? = nil,
          @document_version : String? = nil,
          @external_parameters : Hash(String, Types::SsmExternalParameter)? = nil,
          @must_succeed_for_cutover : Bool? = nil,
          @operating_system : String? = nil,
          @parameters : Hash(String, Array(Types::SsmParameterStoreParameter))? = nil,
          @timeout_seconds : Int32? = nil
        )
        end
      end


      struct RemoveSourceServerActionRequest
        include JSON::Serializable

        # Source server post migration custom action ID to remove.

        @[JSON::Field(key: "actionID")]
        getter action_id : String

        # Source server ID of the post migration custom action to remove.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Source server post migration account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @action_id : String,
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct RemoveSourceServerActionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveTemplateActionRequest
        include JSON::Serializable

        # Template post migration custom action ID to remove.

        @[JSON::Field(key: "actionID")]
        getter action_id : String

        # Launch configuration template ID of the post migration custom action to remove.

        @[JSON::Field(key: "launchConfigurationTemplateID")]
        getter launch_configuration_template_id : String

        def initialize(
          @action_id : String,
          @launch_configuration_template_id : String
        )
        end
      end


      struct RemoveTemplateActionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct ReplicationConfiguration
        include JSON::Serializable

        # Replication Configuration associate default Application Migration Service Security Group.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool?

        # Replication Configuration set bandwidth throttling.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # Replication Configuration create Public IP.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool?

        # Replication Configuration data plane routing.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String?

        # Replication Configuration use default large Staging Disks.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String?

        # Replication Configuration EBS encryption.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String?

        # Replication Configuration EBS encryption key ARN.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # Replication Configuration internet protocol.

        @[JSON::Field(key: "internetProtocol")]
        getter internet_protocol : String?

        # Replication Configuration name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Replication Configuration replicated disks.

        @[JSON::Field(key: "replicatedDisks")]
        getter replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)?

        # Replication Configuration Replication Server instance type.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String?

        # Replication Configuration Replication Server Security Group IDs.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)?

        # Replication Configuration Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # Replication Configuration Staging Area subnet ID.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String?

        # Replication Configuration Staging Area tags.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)?

        # Replication Configuration use Dedicated Replication Server.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool?

        # Replication Configuration use Fips Endpoint.

        @[JSON::Field(key: "useFipsEndpoint")]
        getter use_fips_endpoint : Bool?

        def initialize(
          @associate_default_security_group : Bool? = nil,
          @bandwidth_throttling : Int64? = nil,
          @create_public_ip : Bool? = nil,
          @data_plane_routing : String? = nil,
          @default_large_staging_disk_type : String? = nil,
          @ebs_encryption : String? = nil,
          @ebs_encryption_key_arn : String? = nil,
          @internet_protocol : String? = nil,
          @name : String? = nil,
          @replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)? = nil,
          @replication_server_instance_type : String? = nil,
          @replication_servers_security_groups_i_ds : Array(String)? = nil,
          @source_server_id : String? = nil,
          @staging_area_subnet_id : String? = nil,
          @staging_area_tags : Hash(String, String)? = nil,
          @use_dedicated_replication_server : Bool? = nil,
          @use_fips_endpoint : Bool? = nil
        )
        end
      end

      # Replication Configuration replicated disk.

      struct ReplicationConfigurationReplicatedDisk
        include JSON::Serializable

        # Replication Configuration replicated disk device name.

        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # Replication Configuration replicated disk IOPs.

        @[JSON::Field(key: "iops")]
        getter iops : Int64?

        # Replication Configuration replicated disk boot disk.

        @[JSON::Field(key: "isBootDisk")]
        getter is_boot_disk : Bool?

        # Replication Configuration replicated disk staging disk type.

        @[JSON::Field(key: "stagingDiskType")]
        getter staging_disk_type : String?

        # Replication Configuration replicated disk throughput.

        @[JSON::Field(key: "throughput")]
        getter throughput : Int64?

        def initialize(
          @device_name : String? = nil,
          @iops : Int64? = nil,
          @is_boot_disk : Bool? = nil,
          @staging_disk_type : String? = nil,
          @throughput : Int64? = nil
        )
        end
      end


      struct ReplicationConfigurationTemplate
        include JSON::Serializable

        # Replication Configuration template ID.

        @[JSON::Field(key: "replicationConfigurationTemplateID")]
        getter replication_configuration_template_id : String

        # Replication Configuration template ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Replication Configuration template associate default Application Migration Service Security group.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool?

        # Replication Configuration template bandwidth throttling.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # Replication Configuration template create Public IP.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool?

        # Replication Configuration template data plane routing.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String?

        # Replication Configuration template use default large Staging Disk type.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String?

        # Replication Configuration template EBS encryption.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String?

        # Replication Configuration template EBS encryption key ARN.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # Replication Configuration template internet protocol.

        @[JSON::Field(key: "internetProtocol")]
        getter internet_protocol : String?

        # Replication Configuration template server instance type.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String?

        # Replication Configuration template server Security Groups IDs.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)?

        # Replication Configuration template Staging Area subnet ID.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String?

        # Replication Configuration template Staging Area Tags.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)?

        # Replication Configuration template Tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Replication Configuration template use Dedicated Replication Server.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool?

        # Replication Configuration template use Fips Endpoint.

        @[JSON::Field(key: "useFipsEndpoint")]
        getter use_fips_endpoint : Bool?

        def initialize(
          @replication_configuration_template_id : String,
          @arn : String? = nil,
          @associate_default_security_group : Bool? = nil,
          @bandwidth_throttling : Int64? = nil,
          @create_public_ip : Bool? = nil,
          @data_plane_routing : String? = nil,
          @default_large_staging_disk_type : String? = nil,
          @ebs_encryption : String? = nil,
          @ebs_encryption_key_arn : String? = nil,
          @internet_protocol : String? = nil,
          @replication_server_instance_type : String? = nil,
          @replication_servers_security_groups_i_ds : Array(String)? = nil,
          @staging_area_subnet_id : String? = nil,
          @staging_area_tags : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil,
          @use_dedicated_replication_server : Bool? = nil,
          @use_fips_endpoint : Bool? = nil
        )
        end
      end

      # Resource not found exception.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        # Resource ID not found error.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Resource type not found error.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct ResumeReplicationRequest
        include JSON::Serializable

        # Resume Replication Request source server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Resume Replication Request account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct RetryDataReplicationRequest
        include JSON::Serializable

        # Retry data replication for Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Retry data replication for Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end

      # S3 bucket source.

      struct S3BucketSource
        include JSON::Serializable

        # S3 bucket source s3 bucket.

        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String

        # S3 bucket source s3 key.

        @[JSON::Field(key: "s3Key")]
        getter s3_key : String

        # S3 bucket source s3 bucket owner.

        @[JSON::Field(key: "s3BucketOwner")]
        getter s3_bucket_owner : String?

        def initialize(
          @s3_bucket : String,
          @s3_key : String,
          @s3_bucket_owner : String? = nil
        )
        end
      end

      # The request could not be completed because its exceeded the service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        # Exceeded the service quota code.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Exceeded the service quota value.

        @[JSON::Field(key: "quotaValue")]
        getter quota_value : Int32?

        # Exceeded the service quota resource ID.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Exceeded the service quota resource type.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Exceeded the service quota service code.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @quota_code : String? = nil,
          @quota_value : Int32? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Source server properties.

      struct SourceProperties
        include JSON::Serializable

        # Source Server CPUs.

        @[JSON::Field(key: "cpus")]
        getter cpus : Array(Types::CPU)?

        # Source Server disks.

        @[JSON::Field(key: "disks")]
        getter disks : Array(Types::Disk)?

        # Source server identification hints.

        @[JSON::Field(key: "identificationHints")]
        getter identification_hints : Types::IdentificationHints?

        # Source server last update date and time.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : String?

        # Source server network interfaces.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # Source server OS.

        @[JSON::Field(key: "os")]
        getter os : Types::OS?

        # Source server RAM in bytes.

        @[JSON::Field(key: "ramBytes")]
        getter ram_bytes : Int64?

        # Source server recommended instance type.

        @[JSON::Field(key: "recommendedInstanceType")]
        getter recommended_instance_type : String?

        def initialize(
          @cpus : Array(Types::CPU)? = nil,
          @disks : Array(Types::Disk)? = nil,
          @identification_hints : Types::IdentificationHints? = nil,
          @last_updated_date_time : String? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @os : Types::OS? = nil,
          @ram_bytes : Int64? = nil,
          @recommended_instance_type : String? = nil
        )
        end
      end


      struct SourceServer
        include JSON::Serializable

        # Source server application ID.

        @[JSON::Field(key: "applicationID")]
        getter application_id : String?

        # Source server ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Source Server connector action.

        @[JSON::Field(key: "connectorAction")]
        getter connector_action : Types::SourceServerConnectorAction?

        # Source server data replication info.

        @[JSON::Field(key: "dataReplicationInfo")]
        getter data_replication_info : Types::DataReplicationInfo?

        # Source server fqdn for action framework.

        @[JSON::Field(key: "fqdnForActionFramework")]
        getter fqdn_for_action_framework : String?

        # Source server archived status.

        @[JSON::Field(key: "isArchived")]
        getter is_archived : Bool?

        # Source server launched instance.

        @[JSON::Field(key: "launchedInstance")]
        getter launched_instance : Types::LaunchedInstance?

        # Source server lifecycle state.

        @[JSON::Field(key: "lifeCycle")]
        getter life_cycle : Types::LifeCycle?

        # Source server replication type.

        @[JSON::Field(key: "replicationType")]
        getter replication_type : String?

        # Source server properties.

        @[JSON::Field(key: "sourceProperties")]
        getter source_properties : Types::SourceProperties?

        # Source server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # Source server Tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Source server user provided ID.

        @[JSON::Field(key: "userProvidedID")]
        getter user_provided_id : String?

        # Source server vCenter client id.

        @[JSON::Field(key: "vcenterClientID")]
        getter vcenter_client_id : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @connector_action : Types::SourceServerConnectorAction? = nil,
          @data_replication_info : Types::DataReplicationInfo? = nil,
          @fqdn_for_action_framework : String? = nil,
          @is_archived : Bool? = nil,
          @launched_instance : Types::LaunchedInstance? = nil,
          @life_cycle : Types::LifeCycle? = nil,
          @replication_type : String? = nil,
          @source_properties : Types::SourceProperties? = nil,
          @source_server_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @user_provided_id : String? = nil,
          @vcenter_client_id : String? = nil
        )
        end
      end


      struct SourceServerActionDocument
        include JSON::Serializable

        # Source server post migration custom action ID.

        @[JSON::Field(key: "actionID")]
        getter action_id : String?

        # Source server post migration custom action name.

        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # Source server post migration custom action active status.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # Source server post migration custom action category.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Source server post migration custom action description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Source server post migration custom action document identifier.

        @[JSON::Field(key: "documentIdentifier")]
        getter document_identifier : String?

        # Source server post migration custom action document version.

        @[JSON::Field(key: "documentVersion")]
        getter document_version : String?

        # Source server post migration custom action external parameters.

        @[JSON::Field(key: "externalParameters")]
        getter external_parameters : Hash(String, Types::SsmExternalParameter)?

        # Source server post migration custom action must succeed for cutover.

        @[JSON::Field(key: "mustSucceedForCutover")]
        getter must_succeed_for_cutover : Bool?

        # Source server post migration custom action order.

        @[JSON::Field(key: "order")]
        getter order : Int32?

        # Source server post migration custom action parameters.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Array(Types::SsmParameterStoreParameter))?

        # Source server post migration custom action timeout in seconds.

        @[JSON::Field(key: "timeoutSeconds")]
        getter timeout_seconds : Int32?

        def initialize(
          @action_id : String? = nil,
          @action_name : String? = nil,
          @active : Bool? = nil,
          @category : String? = nil,
          @description : String? = nil,
          @document_identifier : String? = nil,
          @document_version : String? = nil,
          @external_parameters : Hash(String, Types::SsmExternalParameter)? = nil,
          @must_succeed_for_cutover : Bool? = nil,
          @order : Int32? = nil,
          @parameters : Hash(String, Array(Types::SsmParameterStoreParameter))? = nil,
          @timeout_seconds : Int32? = nil
        )
        end
      end

      # Source server post migration custom action filters.

      struct SourceServerActionsRequestFilters
        include JSON::Serializable

        # Action IDs to filter source server post migration custom actions by.

        @[JSON::Field(key: "actionIDs")]
        getter action_i_ds : Array(String)?

        def initialize(
          @action_i_ds : Array(String)? = nil
        )
        end
      end

      # Source Server connector action.

      struct SourceServerConnectorAction
        include JSON::Serializable

        # Source Server connector action connector arn.

        @[JSON::Field(key: "connectorArn")]
        getter connector_arn : String?

        # Source Server connector action credentials secret arn.

        @[JSON::Field(key: "credentialsSecretArn")]
        getter credentials_secret_arn : String?

        def initialize(
          @connector_arn : String? = nil,
          @credentials_secret_arn : String? = nil
        )
        end
      end

      # AWS Systems Manager Document.

      struct SsmDocument
        include JSON::Serializable

        # User-friendly name for the AWS Systems Manager Document.

        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # AWS Systems Manager Document name or full ARN.

        @[JSON::Field(key: "ssmDocumentName")]
        getter ssm_document_name : String

        # AWS Systems Manager Document external parameters.

        @[JSON::Field(key: "externalParameters")]
        getter external_parameters : Hash(String, Types::SsmExternalParameter)?

        # If true, Cutover will not be enabled if the document has failed.

        @[JSON::Field(key: "mustSucceedForCutover")]
        getter must_succeed_for_cutover : Bool?

        # AWS Systems Manager Document parameters.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Array(Types::SsmParameterStoreParameter))?

        # AWS Systems Manager Document timeout seconds.

        @[JSON::Field(key: "timeoutSeconds")]
        getter timeout_seconds : Int32?

        def initialize(
          @action_name : String,
          @ssm_document_name : String,
          @external_parameters : Hash(String, Types::SsmExternalParameter)? = nil,
          @must_succeed_for_cutover : Bool? = nil,
          @parameters : Hash(String, Array(Types::SsmParameterStoreParameter))? = nil,
          @timeout_seconds : Int32? = nil
        )
        end
      end

      # AWS Systems Manager Document external parameter.

      struct SsmExternalParameter
        include JSON::Serializable

        # AWS Systems Manager Document external parameters dynamic path.

        @[JSON::Field(key: "dynamicPath")]
        getter dynamic_path : String?

        def initialize(
          @dynamic_path : String? = nil
        )
        end
      end

      # AWS Systems Manager Parameter Store parameter.

      struct SsmParameterStoreParameter
        include JSON::Serializable

        # AWS Systems Manager Parameter Store parameter name.

        @[JSON::Field(key: "parameterName")]
        getter parameter_name : String

        # AWS Systems Manager Parameter Store parameter type.

        @[JSON::Field(key: "parameterType")]
        getter parameter_type : String

        def initialize(
          @parameter_name : String,
          @parameter_type : String
        )
        end
      end


      struct StartCutoverRequest
        include JSON::Serializable

        # Start Cutover by Source Server IDs.

        @[JSON::Field(key: "sourceServerIDs")]
        getter source_server_i_ds : Array(String)

        # Start Cutover by Account IDs

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Start Cutover by Tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @source_server_i_ds : Array(String),
          @account_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartCutoverResponse
        include JSON::Serializable

        # Start Cutover Job response.

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end

      # Start export request.

      struct StartExportRequest
        include JSON::Serializable

        # Start export request s3 bucket.

        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String

        # Start export request s3key.

        @[JSON::Field(key: "s3Key")]
        getter s3_key : String

        # Start export request s3 bucket owner.

        @[JSON::Field(key: "s3BucketOwner")]
        getter s3_bucket_owner : String?

        # Start import request tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @s3_bucket : String,
          @s3_key : String,
          @s3_bucket_owner : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Start export response.

      struct StartExportResponse
        include JSON::Serializable

        # Start export response export task.

        @[JSON::Field(key: "exportTask")]
        getter export_task : Types::ExportTask?

        def initialize(
          @export_task : Types::ExportTask? = nil
        )
        end
      end

      # Start import request.

      struct StartImportRequest
        include JSON::Serializable

        # Start import request s3 bucket source.

        @[JSON::Field(key: "s3BucketSource")]
        getter s3_bucket_source : Types::S3BucketSource

        # Start import request client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Start import request tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @s3_bucket_source : Types::S3BucketSource,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Start import response.

      struct StartImportResponse
        include JSON::Serializable

        # Start import response import task.

        @[JSON::Field(key: "importTask")]
        getter import_task : Types::ImportTask?

        def initialize(
          @import_task : Types::ImportTask? = nil
        )
        end
      end


      struct StartReplicationRequest
        include JSON::Serializable

        # ID of source server on which to start replication.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Account ID on which to start replication.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct StartTestRequest
        include JSON::Serializable

        # Start Test for Source Server IDs.

        @[JSON::Field(key: "sourceServerIDs")]
        getter source_server_i_ds : Array(String)

        # Start Test for Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Start Test by Tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @source_server_i_ds : Array(String),
          @account_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartTestResponse
        include JSON::Serializable

        # Start Test Job response.

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end


      struct StopReplicationRequest
        include JSON::Serializable

        # Stop Replication Request source server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Stop Replication Request account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # Tag resource by ARN.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Tag resource by Tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TemplateActionDocument
        include JSON::Serializable

        # Template post migration custom action ID.

        @[JSON::Field(key: "actionID")]
        getter action_id : String?

        # Template post migration custom action name.

        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # Template post migration custom action active status.

        @[JSON::Field(key: "active")]
        getter active : Bool?

        # Template post migration custom action category.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Template post migration custom action description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Template post migration custom action document identifier.

        @[JSON::Field(key: "documentIdentifier")]
        getter document_identifier : String?

        # Template post migration custom action document version.

        @[JSON::Field(key: "documentVersion")]
        getter document_version : String?

        # Template post migration custom action external parameters.

        @[JSON::Field(key: "externalParameters")]
        getter external_parameters : Hash(String, Types::SsmExternalParameter)?

        # Template post migration custom action must succeed for cutover.

        @[JSON::Field(key: "mustSucceedForCutover")]
        getter must_succeed_for_cutover : Bool?

        # Operating system eligible for this template post migration custom action.

        @[JSON::Field(key: "operatingSystem")]
        getter operating_system : String?

        # Template post migration custom action order.

        @[JSON::Field(key: "order")]
        getter order : Int32?

        # Template post migration custom action parameters.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Array(Types::SsmParameterStoreParameter))?

        # Template post migration custom action timeout in seconds.

        @[JSON::Field(key: "timeoutSeconds")]
        getter timeout_seconds : Int32?

        def initialize(
          @action_id : String? = nil,
          @action_name : String? = nil,
          @active : Bool? = nil,
          @category : String? = nil,
          @description : String? = nil,
          @document_identifier : String? = nil,
          @document_version : String? = nil,
          @external_parameters : Hash(String, Types::SsmExternalParameter)? = nil,
          @must_succeed_for_cutover : Bool? = nil,
          @operating_system : String? = nil,
          @order : Int32? = nil,
          @parameters : Hash(String, Array(Types::SsmParameterStoreParameter))? = nil,
          @timeout_seconds : Int32? = nil
        )
        end
      end

      # Template post migration custom action filters.

      struct TemplateActionsRequestFilters
        include JSON::Serializable

        # Action IDs to filter template post migration custom actions by.

        @[JSON::Field(key: "actionIDs")]
        getter action_i_ds : Array(String)?

        def initialize(
          @action_i_ds : Array(String)? = nil
        )
        end
      end


      struct TerminateTargetInstancesRequest
        include JSON::Serializable

        # Terminate Target instance by Source Server IDs.

        @[JSON::Field(key: "sourceServerIDs")]
        getter source_server_i_ds : Array(String)

        # Terminate Target instance by Account ID

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Terminate Target instance by Tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @source_server_i_ds : Array(String),
          @account_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct TerminateTargetInstancesResponse
        include JSON::Serializable

        # Terminate Target instance Job response.

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end

      # Reached throttling quota exception.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Reached throttling quota exception.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Reached throttling quota exception will retry after x seconds.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : String?

        # Reached throttling quota exception service code.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : String? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct UnarchiveApplicationRequest
        include JSON::Serializable

        # Application ID.

        @[JSON::Field(key: "applicationID")]
        getter application_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @application_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct UnarchiveWaveRequest
        include JSON::Serializable

        # Wave ID.

        @[JSON::Field(key: "waveID")]
        getter wave_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @wave_id : String,
          @account_id : String? = nil
        )
        end
      end

      # Uninitialized account exception.

      struct UninitializedAccountException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # Untag resource by ARN.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Untag resource by Keys.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateApplicationRequest
        include JSON::Serializable

        # Application ID.

        @[JSON::Field(key: "applicationID")]
        getter application_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Application description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Application name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @application_id : String,
          @account_id : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateConnectorRequest
        include JSON::Serializable

        # Update Connector request connector ID.

        @[JSON::Field(key: "connectorID")]
        getter connector_id : String

        # Update Connector request name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Update Connector request SSM command config.

        @[JSON::Field(key: "ssmCommandConfig")]
        getter ssm_command_config : Types::ConnectorSsmCommandConfig?

        def initialize(
          @connector_id : String,
          @name : String? = nil,
          @ssm_command_config : Types::ConnectorSsmCommandConfig? = nil
        )
        end
      end


      struct UpdateLaunchConfigurationRequest
        include JSON::Serializable

        # Update Launch configuration by Source Server ID request.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Update Launch configuration Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Update Launch configuration boot mode request.

        @[JSON::Field(key: "bootMode")]
        getter boot_mode : String?

        # Update Launch configuration copy Private IP request.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Update Launch configuration copy Tags request.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # Enable map auto tagging.

        @[JSON::Field(key: "enableMapAutoTagging")]
        getter enable_map_auto_tagging : Bool?

        # Update Launch configuration launch disposition request.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?

        # Update Launch configuration licensing request.

        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # Launch configuration map auto tagging MPE ID.

        @[JSON::Field(key: "mapAutoTaggingMpeID")]
        getter map_auto_tagging_mpe_id : String?

        # Update Launch configuration name request.

        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "postLaunchActions")]
        getter post_launch_actions : Types::PostLaunchActions?

        # Update Launch configuration Target instance right sizing request.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil,
          @boot_mode : String? = nil,
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @enable_map_auto_tagging : Bool? = nil,
          @launch_disposition : String? = nil,
          @licensing : Types::Licensing? = nil,
          @map_auto_tagging_mpe_id : String? = nil,
          @name : String? = nil,
          @post_launch_actions : Types::PostLaunchActions? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end


      struct UpdateLaunchConfigurationTemplateRequest
        include JSON::Serializable

        # Launch Configuration Template ID.

        @[JSON::Field(key: "launchConfigurationTemplateID")]
        getter launch_configuration_template_id : String

        # Associate public Ip address.

        @[JSON::Field(key: "associatePublicIpAddress")]
        getter associate_public_ip_address : Bool?

        # Launch configuration template boot mode.

        @[JSON::Field(key: "bootMode")]
        getter boot_mode : String?

        # Copy private Ip.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Copy tags.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # Enable map auto tagging.

        @[JSON::Field(key: "enableMapAutoTagging")]
        getter enable_map_auto_tagging : Bool?

        # Enable parameters encryption.

        @[JSON::Field(key: "enableParametersEncryption")]
        getter enable_parameters_encryption : Bool?

        # Large volume config.

        @[JSON::Field(key: "largeVolumeConf")]
        getter large_volume_conf : Types::LaunchTemplateDiskConf?

        # Launch disposition.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?


        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # Launch configuration template map auto tagging MPE ID.

        @[JSON::Field(key: "mapAutoTaggingMpeID")]
        getter map_auto_tagging_mpe_id : String?

        # Parameters encryption key.

        @[JSON::Field(key: "parametersEncryptionKey")]
        getter parameters_encryption_key : String?

        # Post Launch Action to execute on the Test or Cutover instance.

        @[JSON::Field(key: "postLaunchActions")]
        getter post_launch_actions : Types::PostLaunchActions?

        # Small volume config.

        @[JSON::Field(key: "smallVolumeConf")]
        getter small_volume_conf : Types::LaunchTemplateDiskConf?

        # Small volume maximum size.

        @[JSON::Field(key: "smallVolumeMaxSize")]
        getter small_volume_max_size : Int64?

        # Target instance type right-sizing method.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @launch_configuration_template_id : String,
          @associate_public_ip_address : Bool? = nil,
          @boot_mode : String? = nil,
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @enable_map_auto_tagging : Bool? = nil,
          @enable_parameters_encryption : Bool? = nil,
          @large_volume_conf : Types::LaunchTemplateDiskConf? = nil,
          @launch_disposition : String? = nil,
          @licensing : Types::Licensing? = nil,
          @map_auto_tagging_mpe_id : String? = nil,
          @parameters_encryption_key : String? = nil,
          @post_launch_actions : Types::PostLaunchActions? = nil,
          @small_volume_conf : Types::LaunchTemplateDiskConf? = nil,
          @small_volume_max_size : Int64? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end


      struct UpdateReplicationConfigurationRequest
        include JSON::Serializable

        # Update replication configuration Source Server ID request.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Update replication configuration Account ID request.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Update replication configuration associate default Application Migration Service Security group
        # request.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool?

        # Update replication configuration bandwidth throttling request.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # Update replication configuration create Public IP request.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool?

        # Update replication configuration data plane routing request.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String?

        # Update replication configuration use default large Staging Disk type request.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String?

        # Update replication configuration EBS encryption request.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String?

        # Update replication configuration EBS encryption key ARN request.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # Update replication configuration internet protocol.

        @[JSON::Field(key: "internetProtocol")]
        getter internet_protocol : String?

        # Update replication configuration name request.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Update replication configuration replicated disks request.

        @[JSON::Field(key: "replicatedDisks")]
        getter replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)?

        # Update replication configuration Replication Server instance type request.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String?

        # Update replication configuration Replication Server Security Groups IDs request.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)?

        # Update replication configuration Staging Area subnet request.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String?

        # Update replication configuration Staging Area Tags request.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)?

        # Update replication configuration use dedicated Replication Server request.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool?

        # Update replication configuration use Fips Endpoint.

        @[JSON::Field(key: "useFipsEndpoint")]
        getter use_fips_endpoint : Bool?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil,
          @associate_default_security_group : Bool? = nil,
          @bandwidth_throttling : Int64? = nil,
          @create_public_ip : Bool? = nil,
          @data_plane_routing : String? = nil,
          @default_large_staging_disk_type : String? = nil,
          @ebs_encryption : String? = nil,
          @ebs_encryption_key_arn : String? = nil,
          @internet_protocol : String? = nil,
          @name : String? = nil,
          @replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)? = nil,
          @replication_server_instance_type : String? = nil,
          @replication_servers_security_groups_i_ds : Array(String)? = nil,
          @staging_area_subnet_id : String? = nil,
          @staging_area_tags : Hash(String, String)? = nil,
          @use_dedicated_replication_server : Bool? = nil,
          @use_fips_endpoint : Bool? = nil
        )
        end
      end


      struct UpdateReplicationConfigurationTemplateRequest
        include JSON::Serializable

        # Update replication configuration template template ID request.

        @[JSON::Field(key: "replicationConfigurationTemplateID")]
        getter replication_configuration_template_id : String

        # Update replication configuration template ARN request.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Update replication configuration template associate default Application Migration Service Security
        # group request.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool?

        # Update replication configuration template bandwidth throttling request.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # Update replication configuration template create Public IP request.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool?

        # Update replication configuration template data plane routing request.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String?

        # Update replication configuration template use default large Staging Disk type request.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String?

        # Update replication configuration template EBS encryption request.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String?

        # Update replication configuration template EBS encryption key ARN request.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # Update replication configuration template internet protocol request.

        @[JSON::Field(key: "internetProtocol")]
        getter internet_protocol : String?

        # Update replication configuration template Replication Server instance type request.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String?

        # Update replication configuration template Replication Server Security groups IDs request.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)?

        # Update replication configuration template Staging Area subnet ID request.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String?

        # Update replication configuration template Staging Area Tags request.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)?

        # Update replication configuration template use dedicated Replication Server request.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool?

        # Update replication configuration template use Fips Endpoint request.

        @[JSON::Field(key: "useFipsEndpoint")]
        getter use_fips_endpoint : Bool?

        def initialize(
          @replication_configuration_template_id : String,
          @arn : String? = nil,
          @associate_default_security_group : Bool? = nil,
          @bandwidth_throttling : Int64? = nil,
          @create_public_ip : Bool? = nil,
          @data_plane_routing : String? = nil,
          @default_large_staging_disk_type : String? = nil,
          @ebs_encryption : String? = nil,
          @ebs_encryption_key_arn : String? = nil,
          @internet_protocol : String? = nil,
          @replication_server_instance_type : String? = nil,
          @replication_servers_security_groups_i_ds : Array(String)? = nil,
          @staging_area_subnet_id : String? = nil,
          @staging_area_tags : Hash(String, String)? = nil,
          @use_dedicated_replication_server : Bool? = nil,
          @use_fips_endpoint : Bool? = nil
        )
        end
      end


      struct UpdateSourceServerReplicationTypeRequest
        include JSON::Serializable

        # Replication type to which to update source server.

        @[JSON::Field(key: "replicationType")]
        getter replication_type : String

        # ID of source server on which to update replication type.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Account ID on which to update replication type.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @replication_type : String,
          @source_server_id : String,
          @account_id : String? = nil
        )
        end
      end


      struct UpdateSourceServerRequest
        include JSON::Serializable

        # Update Source Server request source server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Update Source Server request account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Update Source Server request connector action.

        @[JSON::Field(key: "connectorAction")]
        getter connector_action : Types::SourceServerConnectorAction?

        def initialize(
          @source_server_id : String,
          @account_id : String? = nil,
          @connector_action : Types::SourceServerConnectorAction? = nil
        )
        end
      end


      struct UpdateWaveRequest
        include JSON::Serializable

        # Wave ID.

        @[JSON::Field(key: "waveID")]
        getter wave_id : String

        # Account ID.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        # Wave description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Wave name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @wave_id : String,
          @account_id : String? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Validate exception.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?

        # Validate exception field list.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?


        @[JSON::Field(key: "message")]
        getter message : String?

        # Validate exception reason.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @code : String? = nil,
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Validate exception field.

      struct ValidationExceptionField
        include JSON::Serializable

        # Validate exception field message.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Validate exception field name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @message : String? = nil,
          @name : String? = nil
        )
        end
      end

      # vCenter client.

      struct VcenterClient
        include JSON::Serializable

        # Arn of vCenter client.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Datacenter name of vCenter client.

        @[JSON::Field(key: "datacenterName")]
        getter datacenter_name : String?

        # Hostname of vCenter client .

        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # Last seen time of vCenter client.

        @[JSON::Field(key: "lastSeenDatetime")]
        getter last_seen_datetime : String?

        # Tags for Source Server of vCenter client.

        @[JSON::Field(key: "sourceServerTags")]
        getter source_server_tags : Hash(String, String)?

        # Tags for vCenter client.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # ID of vCenter client.

        @[JSON::Field(key: "vcenterClientID")]
        getter vcenter_client_id : String?

        # Vcenter UUID of vCenter client.

        @[JSON::Field(key: "vcenterUUID")]
        getter vcenter_uuid : String?

        def initialize(
          @arn : String? = nil,
          @datacenter_name : String? = nil,
          @hostname : String? = nil,
          @last_seen_datetime : String? = nil,
          @source_server_tags : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil,
          @vcenter_client_id : String? = nil,
          @vcenter_uuid : String? = nil
        )
        end
      end


      struct Wave
        include JSON::Serializable

        # Wave ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Wave creation dateTime.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : String?

        # Wave description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Wave archival status.

        @[JSON::Field(key: "isArchived")]
        getter is_archived : Bool?

        # Wave last modified dateTime.

        @[JSON::Field(key: "lastModifiedDateTime")]
        getter last_modified_date_time : String?

        # Wave name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Wave tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Wave aggregated status.

        @[JSON::Field(key: "waveAggregatedStatus")]
        getter wave_aggregated_status : Types::WaveAggregatedStatus?

        # Wave ID.

        @[JSON::Field(key: "waveID")]
        getter wave_id : String?

        def initialize(
          @arn : String? = nil,
          @creation_date_time : String? = nil,
          @description : String? = nil,
          @is_archived : Bool? = nil,
          @last_modified_date_time : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @wave_aggregated_status : Types::WaveAggregatedStatus? = nil,
          @wave_id : String? = nil
        )
        end
      end

      # Wave aggregated status.

      struct WaveAggregatedStatus
        include JSON::Serializable

        # Wave aggregated status health status.

        @[JSON::Field(key: "healthStatus")]
        getter health_status : String?

        # Wave aggregated status last update dateTime.

        @[JSON::Field(key: "lastUpdateDateTime")]
        getter last_update_date_time : String?

        # Wave aggregated status progress status.

        @[JSON::Field(key: "progressStatus")]
        getter progress_status : String?

        # DateTime marking when the first source server in the wave started replication.

        @[JSON::Field(key: "replicationStartedDateTime")]
        getter replication_started_date_time : String?

        # Wave aggregated status total applications amount.

        @[JSON::Field(key: "totalApplications")]
        getter total_applications : Int64?

        def initialize(
          @health_status : String? = nil,
          @last_update_date_time : String? = nil,
          @progress_status : String? = nil,
          @replication_started_date_time : String? = nil,
          @total_applications : Int64? = nil
        )
        end
      end
    end
  end
end
