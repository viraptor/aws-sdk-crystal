require "json"
require "time"

module Aws
  module Drs
    module Types

      # You do not have sufficient access to perform this action.

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

      # AWS account.

      struct Account
        include JSON::Serializable

        # Account ID of AWS account.

        @[JSON::Field(key: "accountID")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end


      struct AssociateSourceNetworkStackRequest
        include JSON::Serializable

        # CloudFormation template to associate with a Source Network.

        @[JSON::Field(key: "cfnStackName")]
        getter cfn_stack_name : String

        # The Source Network ID to associate with CloudFormation template.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String

        def initialize(
          @cfn_stack_name : String,
          @source_network_id : String
        )
        end
      end


      struct AssociateSourceNetworkStackResponse
        include JSON::Serializable

        # The Source Network association Job.

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end

      # Information about a server's CPU.

      struct CPU
        include JSON::Serializable

        # The number of CPU cores.

        @[JSON::Field(key: "cores")]
        getter cores : Int64?

        # The model name of the CPU.

        @[JSON::Field(key: "modelName")]
        getter model_name : String?

        def initialize(
          @cores : Int64? = nil,
          @model_name : String? = nil
        )
        end
      end

      # The request could not be completed due to a conflict with the current state of the target resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource.

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

      # Properties of a conversion job

      struct ConversionProperties
        include JSON::Serializable

        # The timestamp of when the snapshot being converted was taken

        @[JSON::Field(key: "dataTimestamp")]
        getter data_timestamp : String?

        # Whether the volume being converted uses UEFI or not

        @[JSON::Field(key: "forceUefi")]
        getter force_uefi : Bool?

        # The root volume name of a conversion job

        @[JSON::Field(key: "rootVolumeName")]
        getter root_volume_name : String?

        # A mapping between the volumes being converted and the converted snapshot ids

        @[JSON::Field(key: "volumeToConversionMap")]
        getter volume_to_conversion_map : Hash(String, Hash(String, String))?

        # A mapping between the volumes being converted and the product codes associated with them

        @[JSON::Field(key: "volumeToProductCodes")]
        getter volume_to_product_codes : Hash(String, Array(Types::ProductCode))?

        # A mapping between the volumes and their sizes

        @[JSON::Field(key: "volumeToVolumeSize")]
        getter volume_to_volume_size : Hash(String, Int64)?

        def initialize(
          @data_timestamp : String? = nil,
          @force_uefi : Bool? = nil,
          @root_volume_name : String? = nil,
          @volume_to_conversion_map : Hash(String, Hash(String, String))? = nil,
          @volume_to_product_codes : Hash(String, Array(Types::ProductCode))? = nil,
          @volume_to_volume_size : Hash(String, Int64)? = nil
        )
        end
      end


      struct CreateExtendedSourceServerRequest
        include JSON::Serializable

        # This defines the ARN of the source server in staging Account based on which you want to create an
        # extended source server.

        @[JSON::Field(key: "sourceServerArn")]
        getter source_server_arn : String

        # A list of tags associated with the extended source server.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @source_server_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateExtendedSourceServerResponse
        include JSON::Serializable

        # Created extended source server.

        @[JSON::Field(key: "sourceServer")]
        getter source_server : Types::SourceServer?

        def initialize(
          @source_server : Types::SourceServer? = nil
        )
        end
      end


      struct CreateLaunchConfigurationTemplateRequest
        include JSON::Serializable

        # Copy private IP.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Copy tags.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # S3 bucket ARN to export Source Network templates.

        @[JSON::Field(key: "exportBucketArn")]
        getter export_bucket_arn : String?

        # Launch disposition.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?

        # DRS will set the 'launch into instance ID' of any source server when performing a drill, recovery or
        # failback to the previous region or availability zone, using the instance ID of the source instance.

        @[JSON::Field(key: "launchIntoSourceInstance")]
        getter launch_into_source_instance : Bool?

        # Licensing.

        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # Whether we want to activate post-launch actions.

        @[JSON::Field(key: "postLaunchEnabled")]
        getter post_launch_enabled : Bool?

        # Request to associate tags during creation of a Launch Configuration Template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Target instance type right-sizing method.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @export_bucket_arn : String? = nil,
          @launch_disposition : String? = nil,
          @launch_into_source_instance : Bool? = nil,
          @licensing : Types::Licensing? = nil,
          @post_launch_enabled : Bool? = nil,
          @tags : Hash(String, String)? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end


      struct CreateLaunchConfigurationTemplateResponse
        include JSON::Serializable

        # Created Launch Configuration Template.

        @[JSON::Field(key: "launchConfigurationTemplate")]
        getter launch_configuration_template : Types::LaunchConfigurationTemplate?

        def initialize(
          @launch_configuration_template : Types::LaunchConfigurationTemplate? = nil
        )
        end
      end


      struct CreateReplicationConfigurationTemplateRequest
        include JSON::Serializable

        # Whether to associate the default Elastic Disaster Recovery Security group with the Replication
        # Configuration Template.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool

        # Configure bandwidth throttling for the outbound data transfer rate of the Source Server in Mbps.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64

        # Whether to create a Public IP for the Recovery Instance by default.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool

        # The data plane routing mechanism that will be used for replication.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String

        # The Staging Disk EBS volume type to be used during replication.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String

        # The type of EBS encryption to be used during replication.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String

        # The Point in time (PIT) policy to manage snapshots taken during replication.

        @[JSON::Field(key: "pitPolicy")]
        getter pit_policy : Array(Types::PITPolicyRule)

        # The instance type to be used for the replication server.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String

        # The security group IDs that will be used by the replication server.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)

        # The subnet to be used by the replication staging area.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String

        # A set of tags to be associated with all resources created in the replication staging area: EC2
        # replication server, EBS volumes, EBS snapshots, etc.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)

        # Whether to use a dedicated Replication Server in the replication staging area.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool

        # Whether to allow the AWS replication agent to automatically replicate newly added disks.

        @[JSON::Field(key: "autoReplicateNewDisks")]
        getter auto_replicate_new_disks : Bool?

        # The ARN of the EBS encryption key to be used during replication.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # A set of tags to be associated with the Replication Configuration Template resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @associate_default_security_group : Bool,
          @bandwidth_throttling : Int64,
          @create_public_ip : Bool,
          @data_plane_routing : String,
          @default_large_staging_disk_type : String,
          @ebs_encryption : String,
          @pit_policy : Array(Types::PITPolicyRule),
          @replication_server_instance_type : String,
          @replication_servers_security_groups_i_ds : Array(String),
          @staging_area_subnet_id : String,
          @staging_area_tags : Hash(String, String),
          @use_dedicated_replication_server : Bool,
          @auto_replicate_new_disks : Bool? = nil,
          @ebs_encryption_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSourceNetworkRequest
        include JSON::Serializable

        # Account containing the VPC to protect.

        @[JSON::Field(key: "originAccountID")]
        getter origin_account_id : String

        # Region containing the VPC to protect.

        @[JSON::Field(key: "originRegion")]
        getter origin_region : String

        # Which VPC ID to protect.

        @[JSON::Field(key: "vpcID")]
        getter vpc_id : String

        # A set of tags to be associated with the Source Network resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @origin_account_id : String,
          @origin_region : String,
          @vpc_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSourceNetworkResponse
        include JSON::Serializable

        # ID of the created Source Network.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String?

        def initialize(
          @source_network_id : String? = nil
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

      # Information about Data Replication

      struct DataReplicationInfo
        include JSON::Serializable

        # Error in data replication.

        @[JSON::Field(key: "dataReplicationError")]
        getter data_replication_error : Types::DataReplicationError?

        # Information about whether the data replication has been initiated.

        @[JSON::Field(key: "dataReplicationInitiation")]
        getter data_replication_initiation : Types::DataReplicationInitiation?

        # The state of the data replication.

        @[JSON::Field(key: "dataReplicationState")]
        getter data_replication_state : String?

        # An estimate of when the data replication will be completed.

        @[JSON::Field(key: "etaDateTime")]
        getter eta_date_time : String?

        # Data replication lag duration.

        @[JSON::Field(key: "lagDuration")]
        getter lag_duration : String?

        # The disks that should be replicated.

        @[JSON::Field(key: "replicatedDisks")]
        getter replicated_disks : Array(Types::DataReplicationInfoReplicatedDisk)?

        # AWS Availability zone into which data is being replicated.

        @[JSON::Field(key: "stagingAvailabilityZone")]
        getter staging_availability_zone : String?

        # The ARN of the staging Outpost

        @[JSON::Field(key: "stagingOutpostArn")]
        getter staging_outpost_arn : String?

        def initialize(
          @data_replication_error : Types::DataReplicationError? = nil,
          @data_replication_initiation : Types::DataReplicationInitiation? = nil,
          @data_replication_state : String? = nil,
          @eta_date_time : String? = nil,
          @lag_duration : String? = nil,
          @replicated_disks : Array(Types::DataReplicationInfoReplicatedDisk)? = nil,
          @staging_availability_zone : String? = nil,
          @staging_outpost_arn : String? = nil
        )
        end
      end

      # A disk that should be replicated.

      struct DataReplicationInfoReplicatedDisk
        include JSON::Serializable

        # The size of the replication backlog in bytes.

        @[JSON::Field(key: "backloggedStorageBytes")]
        getter backlogged_storage_bytes : Int64?

        # The name of the device.

        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # The amount of data replicated so far in bytes.

        @[JSON::Field(key: "replicatedStorageBytes")]
        getter replicated_storage_bytes : Int64?

        # The amount of data to be rescanned in bytes.

        @[JSON::Field(key: "rescannedStorageBytes")]
        getter rescanned_storage_bytes : Int64?

        # The total amount of data to be replicated in bytes.

        @[JSON::Field(key: "totalStorageBytes")]
        getter total_storage_bytes : Int64?

        # The status of the volume.

        @[JSON::Field(key: "volumeStatus")]
        getter volume_status : String?

        def initialize(
          @backlogged_storage_bytes : Int64? = nil,
          @device_name : String? = nil,
          @replicated_storage_bytes : Int64? = nil,
          @rescanned_storage_bytes : Int64? = nil,
          @total_storage_bytes : Int64? = nil,
          @volume_status : String? = nil
        )
        end
      end

      # Data replication initiation.

      struct DataReplicationInitiation
        include JSON::Serializable

        # The date and time of the next attempt to initiate data replication.

        @[JSON::Field(key: "nextAttemptDateTime")]
        getter next_attempt_date_time : String?

        # The date and time of the current attempt to initiate data replication.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : String?

        # The steps of the current attempt to initiate data replication.

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

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the step.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteJobRequest
        include JSON::Serializable

        # The ID of the Job to be deleted.

        @[JSON::Field(key: "jobID")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DeleteJobResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLaunchActionRequest
        include JSON::Serializable


        @[JSON::Field(key: "actionId")]
        getter action_id : String


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @action_id : String,
          @resource_id : String
        )
        end
      end


      struct DeleteLaunchActionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLaunchConfigurationTemplateRequest
        include JSON::Serializable

        # The ID of the Launch Configuration Template to be deleted.

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


      struct DeleteRecoveryInstanceRequest
        include JSON::Serializable

        # The ID of the Recovery Instance to be deleted.

        @[JSON::Field(key: "recoveryInstanceID")]
        getter recovery_instance_id : String

        def initialize(
          @recovery_instance_id : String
        )
        end
      end


      struct DeleteReplicationConfigurationTemplateRequest
        include JSON::Serializable

        # The ID of the Replication Configuration Template to be deleted.

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


      struct DeleteSourceNetworkRequest
        include JSON::Serializable

        # ID of the Source Network to delete.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String

        def initialize(
          @source_network_id : String
        )
        end
      end


      struct DeleteSourceNetworkResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSourceServerRequest
        include JSON::Serializable

        # The ID of the Source Server to be deleted.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        def initialize(
          @source_server_id : String
        )
        end
      end


      struct DeleteSourceServerResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeJobLogItemsRequest
        include JSON::Serializable

        # The ID of the Job for which Job log items will be retrieved.

        @[JSON::Field(key: "jobID")]
        getter job_id : String

        # Maximum number of Job log items to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token of the next Job log items to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeJobLogItemsResponse
        include JSON::Serializable

        # An array of Job log items.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::JobLog)?

        # The token of the next Job log items to retrieve.

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

        # A set of filters by which to return Jobs.

        @[JSON::Field(key: "filters")]
        getter filters : Types::DescribeJobsRequestFilters?

        # Maximum number of Jobs to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token of the next Job to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::DescribeJobsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A set of filters by which to return Jobs.

      struct DescribeJobsRequestFilters
        include JSON::Serializable

        # The start date in a date range query.

        @[JSON::Field(key: "fromDate")]
        getter from_date : String?

        # An array of Job IDs that should be returned. An empty array means all jobs.

        @[JSON::Field(key: "jobIDs")]
        getter job_i_ds : Array(String)?

        # The end date in a date range query.

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

        # An array of Jobs.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Job)?

        # The token of the next Job to retrieve.

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

        # The token of the next Launch Configuration Template to retrieve.

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

        # The token of the next Launch Configuration Template to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::LaunchConfigurationTemplate)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeRecoveryInstancesRequest
        include JSON::Serializable

        # A set of filters by which to return Recovery Instances.

        @[JSON::Field(key: "filters")]
        getter filters : Types::DescribeRecoveryInstancesRequestFilters?

        # Maximum number of Recovery Instances to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token of the next Recovery Instance to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::DescribeRecoveryInstancesRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A set of filters by which to return Recovery Instances.

      struct DescribeRecoveryInstancesRequestFilters
        include JSON::Serializable

        # An array of Recovery Instance IDs that should be returned. An empty array means all Recovery
        # Instances.

        @[JSON::Field(key: "recoveryInstanceIDs")]
        getter recovery_instance_i_ds : Array(String)?

        # An array of Source Server IDs for which associated Recovery Instances should be returned.

        @[JSON::Field(key: "sourceServerIDs")]
        getter source_server_i_ds : Array(String)?

        def initialize(
          @recovery_instance_i_ds : Array(String)? = nil,
          @source_server_i_ds : Array(String)? = nil
        )
        end
      end


      struct DescribeRecoveryInstancesResponse
        include JSON::Serializable

        # An array of Recovery Instances.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::RecoveryInstance)?

        # The token of the next Recovery Instance to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RecoveryInstance)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeRecoverySnapshotsRequest
        include JSON::Serializable

        # Filter Recovery Snapshots by Source Server ID.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # A set of filters by which to return Recovery Snapshots.

        @[JSON::Field(key: "filters")]
        getter filters : Types::DescribeRecoverySnapshotsRequestFilters?

        # Maximum number of Recovery Snapshots to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token of the next Recovery Snapshot to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sorted ordering by which to return Recovery Snapshots.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @source_server_id : String,
          @filters : Types::DescribeRecoverySnapshotsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order : String? = nil
        )
        end
      end

      # A set of filters by which to return Recovery Snapshots.

      struct DescribeRecoverySnapshotsRequestFilters
        include JSON::Serializable

        # The start date in a date range query.

        @[JSON::Field(key: "fromDateTime")]
        getter from_date_time : String?

        # The end date in a date range query.

        @[JSON::Field(key: "toDateTime")]
        getter to_date_time : String?

        def initialize(
          @from_date_time : String? = nil,
          @to_date_time : String? = nil
        )
        end
      end


      struct DescribeRecoverySnapshotsResponse
        include JSON::Serializable

        # An array of Recovery Snapshots.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::RecoverySnapshot)?

        # The token of the next Recovery Snapshot to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RecoverySnapshot)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeReplicationConfigurationTemplatesRequest
        include JSON::Serializable

        # Maximum number of Replication Configuration Templates to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token of the next Replication Configuration Template to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The IDs of the Replication Configuration Templates to retrieve. An empty list means all Replication
        # Configuration Templates.

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

        # An array of Replication Configuration Templates.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ReplicationConfigurationTemplate)?

        # The token of the next Replication Configuration Template to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ReplicationConfigurationTemplate)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSourceNetworksRequest
        include JSON::Serializable

        # A set of filters by which to return Source Networks.

        @[JSON::Field(key: "filters")]
        getter filters : Types::DescribeSourceNetworksRequestFilters?

        # Maximum number of Source Networks to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token of the next Source Networks to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::DescribeSourceNetworksRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A set of filters by which to return Source Networks.

      struct DescribeSourceNetworksRequestFilters
        include JSON::Serializable

        # Filter Source Networks by account ID containing the protected VPCs.

        @[JSON::Field(key: "originAccountID")]
        getter origin_account_id : String?

        # Filter Source Networks by the region containing the protected VPCs.

        @[JSON::Field(key: "originRegion")]
        getter origin_region : String?

        # An array of Source Network IDs that should be returned. An empty array means all Source Networks.

        @[JSON::Field(key: "sourceNetworkIDs")]
        getter source_network_i_ds : Array(String)?

        def initialize(
          @origin_account_id : String? = nil,
          @origin_region : String? = nil,
          @source_network_i_ds : Array(String)? = nil
        )
        end
      end


      struct DescribeSourceNetworksResponse
        include JSON::Serializable

        # An array of Source Networks.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::SourceNetwork)?

        # The token of the next Source Networks to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SourceNetwork)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeSourceServersRequest
        include JSON::Serializable

        # A set of filters by which to return Source Servers.

        @[JSON::Field(key: "filters")]
        getter filters : Types::DescribeSourceServersRequestFilters?

        # Maximum number of Source Servers to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token of the next Source Server to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::DescribeSourceServersRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A set of filters by which to return Source Servers.

      struct DescribeSourceServersRequestFilters
        include JSON::Serializable

        # An ID that describes the hardware of the Source Server. This is either an EC2 instance id, a VMware
        # uuid or a mac address.

        @[JSON::Field(key: "hardwareId")]
        getter hardware_id : String?

        # An array of Source Servers IDs that should be returned. An empty array means all Source Servers.

        @[JSON::Field(key: "sourceServerIDs")]
        getter source_server_i_ds : Array(String)?

        # An array of staging account IDs that extended source servers belong to. An empty array means all
        # source servers will be shown.

        @[JSON::Field(key: "stagingAccountIDs")]
        getter staging_account_i_ds : Array(String)?

        def initialize(
          @hardware_id : String? = nil,
          @source_server_i_ds : Array(String)? = nil,
          @staging_account_i_ds : Array(String)? = nil
        )
        end
      end


      struct DescribeSourceServersResponse
        include JSON::Serializable

        # An array of Source Servers.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::SourceServer)?

        # The token of the next Source Server to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SourceServer)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DisconnectRecoveryInstanceRequest
        include JSON::Serializable

        # The ID of the Recovery Instance to disconnect.

        @[JSON::Field(key: "recoveryInstanceID")]
        getter recovery_instance_id : String

        def initialize(
          @recovery_instance_id : String
        )
        end
      end


      struct DisconnectSourceServerRequest
        include JSON::Serializable

        # The ID of the Source Server to disconnect.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        def initialize(
          @source_server_id : String
        )
        end
      end

      # An object representing a data storage device on a server.

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

      # Properties of resource related to a job event.

      struct EventResourceData
        include JSON::Serializable

        # Source Network properties.

        @[JSON::Field(key: "sourceNetworkData")]
        getter source_network_data : Types::SourceNetworkData?

        def initialize(
          @source_network_data : Types::SourceNetworkData? = nil
        )
        end
      end


      struct ExportSourceNetworkCfnTemplateRequest
        include JSON::Serializable

        # The Source Network ID to export its CloudFormation template to an S3 bucket.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String

        def initialize(
          @source_network_id : String
        )
        end
      end


      struct ExportSourceNetworkCfnTemplateResponse
        include JSON::Serializable

        # S3 bucket URL where the Source Network CloudFormation template was exported to.

        @[JSON::Field(key: "s3DestinationUrl")]
        getter s3_destination_url : String?

        def initialize(
          @s3_destination_url : String? = nil
        )
        end
      end


      struct GetFailbackReplicationConfigurationRequest
        include JSON::Serializable

        # The ID of the Recovery Instance whose failback replication configuration should be returned.

        @[JSON::Field(key: "recoveryInstanceID")]
        getter recovery_instance_id : String

        def initialize(
          @recovery_instance_id : String
        )
        end
      end


      struct GetFailbackReplicationConfigurationResponse
        include JSON::Serializable

        # The ID of the Recovery Instance.

        @[JSON::Field(key: "recoveryInstanceID")]
        getter recovery_instance_id : String

        # Configure bandwidth throttling for the outbound data transfer rate of the Recovery Instance in Mbps.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # The name of the Failback Replication Configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Whether to use Private IP for the failback replication of the Recovery Instance.

        @[JSON::Field(key: "usePrivateIP")]
        getter use_private_ip : Bool?

        def initialize(
          @recovery_instance_id : String,
          @bandwidth_throttling : Int64? = nil,
          @name : String? = nil,
          @use_private_ip : Bool? = nil
        )
        end
      end


      struct GetLaunchConfigurationRequest
        include JSON::Serializable

        # The ID of the Source Server that we want to retrieve a Launch Configuration for.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        def initialize(
          @source_server_id : String
        )
        end
      end


      struct GetReplicationConfigurationRequest
        include JSON::Serializable

        # The ID of the Source Serve for this Replication Configuration.r

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        def initialize(
          @source_server_id : String
        )
        end
      end

      # Hints used to uniquely identify a machine.

      struct IdentificationHints
        include JSON::Serializable

        # AWS Instance ID identification hint.

        @[JSON::Field(key: "awsInstanceID")]
        getter aws_instance_id : String?

        # Fully Qualified Domain Name identification hint.

        @[JSON::Field(key: "fqdn")]
        getter fqdn : String?

        # Hostname identification hint.

        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # vCenter VM path identification hint.

        @[JSON::Field(key: "vmWareUuid")]
        getter vm_ware_uuid : String?

        def initialize(
          @aws_instance_id : String? = nil,
          @fqdn : String? = nil,
          @hostname : String? = nil,
          @vm_ware_uuid : String? = nil
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

      # The request processing has failed because of an unknown error, exception or failure.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds after which the request should be safe to retry.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int64?

        def initialize(
          @message : String,
          @retry_after_seconds : Int64? = nil
        )
        end
      end

      # A job is an asynchronous workflow.

      struct Job
        include JSON::Serializable

        # The ID of the Job.

        @[JSON::Field(key: "jobID")]
        getter job_id : String

        # The ARN of a Job.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time of when the Job was created.

        @[JSON::Field(key: "creationDateTime")]
        getter creation_date_time : String?

        # The date and time of when the Job ended.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : String?

        # A string representing who initiated the Job.

        @[JSON::Field(key: "initiatedBy")]
        getter initiated_by : String?

        # A list of resources that the Job is acting upon.

        @[JSON::Field(key: "participatingResources")]
        getter participating_resources : Array(Types::ParticipatingResource)?

        # A list of servers that the Job is acting upon.

        @[JSON::Field(key: "participatingServers")]
        getter participating_servers : Array(Types::ParticipatingServer)?

        # The status of the Job.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of tags associated with the Job.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of the Job.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @job_id : String,
          @arn : String? = nil,
          @creation_date_time : String? = nil,
          @end_date_time : String? = nil,
          @initiated_by : String? = nil,
          @participating_resources : Array(Types::ParticipatingResource)? = nil,
          @participating_servers : Array(Types::ParticipatingServer)? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # A log outputted by a Job.

      struct JobLog
        include JSON::Serializable

        # The event represents the type of a log.

        @[JSON::Field(key: "event")]
        getter event : String?

        # Metadata associated with a Job log.

        @[JSON::Field(key: "eventData")]
        getter event_data : Types::JobLogEventData?

        # The date and time the log was taken.

        @[JSON::Field(key: "logDateTime")]
        getter log_date_time : String?

        def initialize(
          @event : String? = nil,
          @event_data : Types::JobLogEventData? = nil,
          @log_date_time : String? = nil
        )
        end
      end

      # Metadata associated with a Job log.

      struct JobLogEventData
        include JSON::Serializable

        # Properties of a conversion job

        @[JSON::Field(key: "conversionProperties")]
        getter conversion_properties : Types::ConversionProperties?

        # The ID of a conversion server.

        @[JSON::Field(key: "conversionServerID")]
        getter conversion_server_id : String?

        # Properties of resource related to a job event.

        @[JSON::Field(key: "eventResourceData")]
        getter event_resource_data : Types::EventResourceData?

        # A string representing a job error.

        @[JSON::Field(key: "rawError")]
        getter raw_error : String?

        # The ID of a Source Server.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # The ID of a Recovery Instance.

        @[JSON::Field(key: "targetInstanceID")]
        getter target_instance_id : String?

        def initialize(
          @conversion_properties : Types::ConversionProperties? = nil,
          @conversion_server_id : String? = nil,
          @event_resource_data : Types::EventResourceData? = nil,
          @raw_error : String? = nil,
          @source_server_id : String? = nil,
          @target_instance_id : String? = nil
        )
        end
      end

      # Launch action.

      struct LaunchAction
        include JSON::Serializable

        # Launch action code.

        @[JSON::Field(key: "actionCode")]
        getter action_code : String?


        @[JSON::Field(key: "actionId")]
        getter action_id : String?


        @[JSON::Field(key: "actionVersion")]
        getter action_version : String?

        # Whether the launch action is active.

        @[JSON::Field(key: "active")]
        getter active : Bool?


        @[JSON::Field(key: "category")]
        getter category : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "name")]
        getter name : String?

        # Whether the launch will not be marked as failed if this action fails.

        @[JSON::Field(key: "optional")]
        getter optional : Bool?


        @[JSON::Field(key: "order")]
        getter order : Int32?


        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::LaunchActionParameter)?

        # Launch action type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @action_code : String? = nil,
          @action_id : String? = nil,
          @action_version : String? = nil,
          @active : Bool? = nil,
          @category : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @optional : Bool? = nil,
          @order : Int32? = nil,
          @parameters : Hash(String, Types::LaunchActionParameter)? = nil,
          @type : String? = nil
        )
        end
      end

      # Launch action parameter.

      struct LaunchActionParameter
        include JSON::Serializable

        # Type.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Launch action run.

      struct LaunchActionRun
        include JSON::Serializable

        # Action.

        @[JSON::Field(key: "action")]
        getter action : Types::LaunchAction?

        # Failure reason.

        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # Run Id.

        @[JSON::Field(key: "runId")]
        getter run_id : String?

        # Run status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @action : Types::LaunchAction? = nil,
          @failure_reason : String? = nil,
          @run_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Resource launch actions filter.

      struct LaunchActionsRequestFilters
        include JSON::Serializable

        # Launch actions Ids.

        @[JSON::Field(key: "actionIds")]
        getter action_ids : Array(String)?

        def initialize(
          @action_ids : Array(String)? = nil
        )
        end
      end

      # Launch actions status.

      struct LaunchActionsStatus
        include JSON::Serializable

        # List of post launch action status.

        @[JSON::Field(key: "runs")]
        getter runs : Array(Types::LaunchActionRun)?

        # Time where the AWS Systems Manager was detected as running on the launched instance.

        @[JSON::Field(key: "ssmAgentDiscoveryDatetime")]
        getter ssm_agent_discovery_datetime : String?

        def initialize(
          @runs : Array(Types::LaunchActionRun)? = nil,
          @ssm_agent_discovery_datetime : String? = nil
        )
        end
      end


      struct LaunchConfiguration
        include JSON::Serializable

        # Whether we should copy the Private IP of the Source Server to the Recovery Instance.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Whether we want to copy the tags of the Source Server to the EC2 machine of the Recovery Instance.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # The EC2 launch template ID of this launch configuration.

        @[JSON::Field(key: "ec2LaunchTemplateID")]
        getter ec2_launch_template_id : String?

        # The state of the Recovery Instance in EC2 after the recovery operation.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?

        # Launch into existing instance properties.

        @[JSON::Field(key: "launchIntoInstanceProperties")]
        getter launch_into_instance_properties : Types::LaunchIntoInstanceProperties?

        # The licensing configuration to be used for this launch configuration.

        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # The name of the launch configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Whether we want to activate post-launch actions for the Source Server.

        @[JSON::Field(key: "postLaunchEnabled")]
        getter post_launch_enabled : Bool?

        # The ID of the Source Server for this launch configuration.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # Whether Elastic Disaster Recovery should try to automatically choose the instance type that best
        # matches the OS, CPU, and RAM of your Source Server.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @ec2_launch_template_id : String? = nil,
          @launch_disposition : String? = nil,
          @launch_into_instance_properties : Types::LaunchIntoInstanceProperties? = nil,
          @licensing : Types::Licensing? = nil,
          @name : String? = nil,
          @post_launch_enabled : Bool? = nil,
          @source_server_id : String? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end

      # Account level Launch Configuration Template.

      struct LaunchConfigurationTemplate
        include JSON::Serializable

        # ARN of the Launch Configuration Template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Copy private IP.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Copy tags.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # S3 bucket ARN to export Source Network templates.

        @[JSON::Field(key: "exportBucketArn")]
        getter export_bucket_arn : String?

        # ID of the Launch Configuration Template.

        @[JSON::Field(key: "launchConfigurationTemplateID")]
        getter launch_configuration_template_id : String?

        # Launch disposition.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?

        # DRS will set the 'launch into instance ID' of any source server when performing a drill, recovery or
        # failback to the previous region or availability zone, using the instance ID of the source instance.

        @[JSON::Field(key: "launchIntoSourceInstance")]
        getter launch_into_source_instance : Bool?

        # Licensing.

        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # Post-launch actions activated.

        @[JSON::Field(key: "postLaunchEnabled")]
        getter post_launch_enabled : Bool?

        # Tags of the Launch Configuration Template.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Target instance type right-sizing method.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @arn : String? = nil,
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @export_bucket_arn : String? = nil,
          @launch_configuration_template_id : String? = nil,
          @launch_disposition : String? = nil,
          @launch_into_source_instance : Bool? = nil,
          @licensing : Types::Licensing? = nil,
          @post_launch_enabled : Bool? = nil,
          @tags : Hash(String, String)? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end

      # Launch into existing instance.

      struct LaunchIntoInstanceProperties
        include JSON::Serializable

        # Optionally holds EC2 instance ID of an instance to launch into, instead of launching a new instance
        # during drill, recovery or failback.

        @[JSON::Field(key: "launchIntoEC2InstanceID")]
        getter launch_into_ec2_instance_id : String?

        def initialize(
          @launch_into_ec2_instance_id : String? = nil
        )
        end
      end

      # Configuration of a machine's license.

      struct Licensing
        include JSON::Serializable

        # Whether to enable "Bring your own license" or not.

        @[JSON::Field(key: "osByol")]
        getter os_byol : Bool?

        def initialize(
          @os_byol : Bool? = nil
        )
        end
      end

      # An object representing the Source Server Lifecycle.

      struct LifeCycle
        include JSON::Serializable

        # The date and time of when the Source Server was added to the service.

        @[JSON::Field(key: "addedToServiceDateTime")]
        getter added_to_service_date_time : String?

        # The amount of time that the Source Server has been replicating for.

        @[JSON::Field(key: "elapsedReplicationDuration")]
        getter elapsed_replication_duration : String?

        # The date and time of the first byte that was replicated from the Source Server.

        @[JSON::Field(key: "firstByteDateTime")]
        getter first_byte_date_time : String?

        # An object containing information regarding the last launch of the Source Server.

        @[JSON::Field(key: "lastLaunch")]
        getter last_launch : Types::LifeCycleLastLaunch?

        # The date and time this Source Server was last seen by the service.

        @[JSON::Field(key: "lastSeenByServiceDateTime")]
        getter last_seen_by_service_date_time : String?

        def initialize(
          @added_to_service_date_time : String? = nil,
          @elapsed_replication_duration : String? = nil,
          @first_byte_date_time : String? = nil,
          @last_launch : Types::LifeCycleLastLaunch? = nil,
          @last_seen_by_service_date_time : String? = nil
        )
        end
      end

      # An object containing information regarding the last launch of a Source Server.

      struct LifeCycleLastLaunch
        include JSON::Serializable

        # An object containing information regarding the initiation of the last launch of a Source Server.

        @[JSON::Field(key: "initiated")]
        getter initiated : Types::LifeCycleLastLaunchInitiated?

        # Status of Source Server's last launch.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @initiated : Types::LifeCycleLastLaunchInitiated? = nil,
          @status : String? = nil
        )
        end
      end

      # An object containing information regarding the initiation of the last launch of a Source Server.

      struct LifeCycleLastLaunchInitiated
        include JSON::Serializable

        # The date and time the last Source Server launch was initiated.

        @[JSON::Field(key: "apiCallDateTime")]
        getter api_call_date_time : String?

        # The ID of the Job that was used to last launch the Source Server.

        @[JSON::Field(key: "jobID")]
        getter job_id : String?

        # The Job type that was used to last launch the Source Server.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @api_call_date_time : String? = nil,
          @job_id : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListExtensibleSourceServersRequest
        include JSON::Serializable

        # The Id of the staging Account to retrieve extensible source servers from.

        @[JSON::Field(key: "stagingAccountID")]
        getter staging_account_id : String

        # The maximum number of extensible source servers to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token of the next extensible source server to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @staging_account_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExtensibleSourceServersResponse
        include JSON::Serializable

        # A list of source servers on a staging Account that are extensible.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::StagingSourceServer)?

        # The token of the next extensible source server to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::StagingSourceServer)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLaunchActionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Filters to apply when listing resource launch actions.

        @[JSON::Field(key: "filters")]
        getter filters : Types::LaunchActionsRequestFilters?

        # Maximum amount of items to return when listing resource launch actions.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Next token to use when listing resource launch actions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_id : String,
          @filters : Types::LaunchActionsRequestFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLaunchActionsResponse
        include JSON::Serializable

        # List of resource launch actions.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::LaunchAction)?

        # Next token returned when listing resource launch actions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::LaunchAction)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStagingAccountsRequest
        include JSON::Serializable

        # The maximum number of staging Accounts to retrieve.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token of the next staging Account to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStagingAccountsResponse
        include JSON::Serializable

        # An array of staging AWS Accounts.

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::Account)?

        # The token of the next staging Account to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @accounts : Array(Types::Account)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource whose tags should be returned.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags of the requested resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Network interface.

      struct NetworkInterface
        include JSON::Serializable

        # Network interface IPs.

        @[JSON::Field(key: "ips")]
        getter ips : Array(String)?

        # Whether this is the primary network interface.

        @[JSON::Field(key: "isPrimary")]
        getter is_primary : Bool?

        # The MAC address of the network interface.

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

        # The long name of the Operating System.

        @[JSON::Field(key: "fullString")]
        getter full_string : String?

        def initialize(
          @full_string : String? = nil
        )
        end
      end

      # A rule in the Point in Time (PIT) policy representing when to take snapshots and how long to retain
      # them for.

      struct PITPolicyRule
        include JSON::Serializable

        # How often, in the chosen units, a snapshot should be taken.

        @[JSON::Field(key: "interval")]
        getter interval : Int32

        # The duration to retain a snapshot for, in the chosen units.

        @[JSON::Field(key: "retentionDuration")]
        getter retention_duration : Int32

        # The units used to measure the interval and retentionDuration.

        @[JSON::Field(key: "units")]
        getter units : String

        # Whether this rule is enabled or not.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The ID of the rule.

        @[JSON::Field(key: "ruleID")]
        getter rule_id : Int64?

        def initialize(
          @interval : Int32,
          @retention_duration : Int32,
          @units : String,
          @enabled : Bool? = nil,
          @rule_id : Int64? = nil
        )
        end
      end

      # Represents a resource participating in an asynchronous Job.

      struct ParticipatingResource
        include JSON::Serializable

        # The launch status of a participating resource.

        @[JSON::Field(key: "launchStatus")]
        getter launch_status : String?

        # The ID of a participating resource.

        @[JSON::Field(key: "participatingResourceID")]
        getter participating_resource_id : Types::ParticipatingResourceID?

        def initialize(
          @launch_status : String? = nil,
          @participating_resource_id : Types::ParticipatingResourceID? = nil
        )
        end
      end

      # ID of a resource participating in an asynchronous Job.

      struct ParticipatingResourceID
        include JSON::Serializable

        # Source Network ID.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String?

        def initialize(
          @source_network_id : String? = nil
        )
        end
      end

      # Represents a server participating in an asynchronous Job.

      struct ParticipatingServer
        include JSON::Serializable

        # The post-launch action runs of a participating server.

        @[JSON::Field(key: "launchActionsStatus")]
        getter launch_actions_status : Types::LaunchActionsStatus?

        # The launch status of a participating server.

        @[JSON::Field(key: "launchStatus")]
        getter launch_status : String?

        # The Recovery Instance ID of a participating server.

        @[JSON::Field(key: "recoveryInstanceID")]
        getter recovery_instance_id : String?

        # The Source Server ID of a participating server.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        def initialize(
          @launch_actions_status : Types::LaunchActionsStatus? = nil,
          @launch_status : String? = nil,
          @recovery_instance_id : String? = nil,
          @source_server_id : String? = nil
        )
        end
      end

      # Properties of a product code associated with a volume.

      struct ProductCode
        include JSON::Serializable

        # Id of a product code associated with a volume.

        @[JSON::Field(key: "productCodeId")]
        getter product_code_id : String?

        # Mode of a product code associated with a volume.

        @[JSON::Field(key: "productCodeMode")]
        getter product_code_mode : String?

        def initialize(
          @product_code_id : String? = nil,
          @product_code_mode : String? = nil
        )
        end
      end


      struct PutLaunchActionRequest
        include JSON::Serializable

        # Launch action code.

        @[JSON::Field(key: "actionCode")]
        getter action_code : String


        @[JSON::Field(key: "actionId")]
        getter action_id : String


        @[JSON::Field(key: "actionVersion")]
        getter action_version : String

        # Whether the launch action is active.

        @[JSON::Field(key: "active")]
        getter active : Bool


        @[JSON::Field(key: "category")]
        getter category : String


        @[JSON::Field(key: "description")]
        getter description : String


        @[JSON::Field(key: "name")]
        getter name : String

        # Whether the launch will not be marked as failed if this action fails.

        @[JSON::Field(key: "optional")]
        getter optional : Bool


        @[JSON::Field(key: "order")]
        getter order : Int32


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String


        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::LaunchActionParameter)?

        def initialize(
          @action_code : String,
          @action_id : String,
          @action_version : String,
          @active : Bool,
          @category : String,
          @description : String,
          @name : String,
          @optional : Bool,
          @order : Int32,
          @resource_id : String,
          @parameters : Hash(String, Types::LaunchActionParameter)? = nil
        )
        end
      end


      struct PutLaunchActionResponse
        include JSON::Serializable

        # Launch action code.

        @[JSON::Field(key: "actionCode")]
        getter action_code : String?


        @[JSON::Field(key: "actionId")]
        getter action_id : String?


        @[JSON::Field(key: "actionVersion")]
        getter action_version : String?

        # Whether the launch action is active.

        @[JSON::Field(key: "active")]
        getter active : Bool?


        @[JSON::Field(key: "category")]
        getter category : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "name")]
        getter name : String?

        # Whether the launch will not be marked as failed if this action fails.

        @[JSON::Field(key: "optional")]
        getter optional : Bool?


        @[JSON::Field(key: "order")]
        getter order : Int32?


        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::LaunchActionParameter)?


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Launch action type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @action_code : String? = nil,
          @action_id : String? = nil,
          @action_version : String? = nil,
          @active : Bool? = nil,
          @category : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @optional : Bool? = nil,
          @order : Int32? = nil,
          @parameters : Hash(String, Types::LaunchActionParameter)? = nil,
          @resource_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A Recovery Instance is a replica of a Source Server running on EC2.

      struct RecoveryInstance
        include JSON::Serializable

        # The version of the DRS agent installed on the recovery instance

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String?

        # The ARN of the Recovery Instance.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The Data Replication Info of the Recovery Instance.

        @[JSON::Field(key: "dataReplicationInfo")]
        getter data_replication_info : Types::RecoveryInstanceDataReplicationInfo?

        # The EC2 instance ID of the Recovery Instance.

        @[JSON::Field(key: "ec2InstanceID")]
        getter ec2_instance_id : String?

        # The state of the EC2 instance for this Recovery Instance.

        @[JSON::Field(key: "ec2InstanceState")]
        getter ec2_instance_state : String?

        # An object representing failback related information of the Recovery Instance.

        @[JSON::Field(key: "failback")]
        getter failback : Types::RecoveryInstanceFailback?

        # Whether this Recovery Instance was created for a drill or for an actual Recovery event.

        @[JSON::Field(key: "isDrill")]
        getter is_drill : Bool?

        # The ID of the Job that created the Recovery Instance.

        @[JSON::Field(key: "jobID")]
        getter job_id : String?

        # AWS availability zone associated with the recovery instance.

        @[JSON::Field(key: "originAvailabilityZone")]
        getter origin_availability_zone : String?

        # Environment (On Premises / AWS) of the instance that the recovery instance originated from.

        @[JSON::Field(key: "originEnvironment")]
        getter origin_environment : String?

        # The date and time of the Point in Time (PIT) snapshot that this Recovery Instance was launched from.

        @[JSON::Field(key: "pointInTimeSnapshotDateTime")]
        getter point_in_time_snapshot_date_time : String?

        # The ID of the Recovery Instance.

        @[JSON::Field(key: "recoveryInstanceID")]
        getter recovery_instance_id : String?

        # Properties of the Recovery Instance machine.

        @[JSON::Field(key: "recoveryInstanceProperties")]
        getter recovery_instance_properties : Types::RecoveryInstanceProperties?

        # The ARN of the source Outpost

        @[JSON::Field(key: "sourceOutpostArn")]
        getter source_outpost_arn : String?

        # The Source Server ID that this Recovery Instance is associated with.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # An array of tags that are associated with the Recovery Instance.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @agent_version : String? = nil,
          @arn : String? = nil,
          @data_replication_info : Types::RecoveryInstanceDataReplicationInfo? = nil,
          @ec2_instance_id : String? = nil,
          @ec2_instance_state : String? = nil,
          @failback : Types::RecoveryInstanceFailback? = nil,
          @is_drill : Bool? = nil,
          @job_id : String? = nil,
          @origin_availability_zone : String? = nil,
          @origin_environment : String? = nil,
          @point_in_time_snapshot_date_time : String? = nil,
          @recovery_instance_id : String? = nil,
          @recovery_instance_properties : Types::RecoveryInstanceProperties? = nil,
          @source_outpost_arn : String? = nil,
          @source_server_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Error in data replication.

      struct RecoveryInstanceDataReplicationError
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

      # Information about Data Replication

      struct RecoveryInstanceDataReplicationInfo
        include JSON::Serializable

        # Information about Data Replication

        @[JSON::Field(key: "dataReplicationError")]
        getter data_replication_error : Types::RecoveryInstanceDataReplicationError?

        # Information about whether the data replication has been initiated.

        @[JSON::Field(key: "dataReplicationInitiation")]
        getter data_replication_initiation : Types::RecoveryInstanceDataReplicationInitiation?

        # The state of the data replication.

        @[JSON::Field(key: "dataReplicationState")]
        getter data_replication_state : String?

        # An estimate of when the data replication will be completed.

        @[JSON::Field(key: "etaDateTime")]
        getter eta_date_time : String?

        # Data replication lag duration.

        @[JSON::Field(key: "lagDuration")]
        getter lag_duration : String?

        # The disks that should be replicated.

        @[JSON::Field(key: "replicatedDisks")]
        getter replicated_disks : Array(Types::RecoveryInstanceDataReplicationInfoReplicatedDisk)?

        # AWS Availability zone into which data is being replicated.

        @[JSON::Field(key: "stagingAvailabilityZone")]
        getter staging_availability_zone : String?

        # The ARN of the staging Outpost

        @[JSON::Field(key: "stagingOutpostArn")]
        getter staging_outpost_arn : String?

        def initialize(
          @data_replication_error : Types::RecoveryInstanceDataReplicationError? = nil,
          @data_replication_initiation : Types::RecoveryInstanceDataReplicationInitiation? = nil,
          @data_replication_state : String? = nil,
          @eta_date_time : String? = nil,
          @lag_duration : String? = nil,
          @replicated_disks : Array(Types::RecoveryInstanceDataReplicationInfoReplicatedDisk)? = nil,
          @staging_availability_zone : String? = nil,
          @staging_outpost_arn : String? = nil
        )
        end
      end

      # A disk that should be replicated.

      struct RecoveryInstanceDataReplicationInfoReplicatedDisk
        include JSON::Serializable

        # The size of the replication backlog in bytes.

        @[JSON::Field(key: "backloggedStorageBytes")]
        getter backlogged_storage_bytes : Int64?

        # The name of the device.

        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # The amount of data replicated so far in bytes.

        @[JSON::Field(key: "replicatedStorageBytes")]
        getter replicated_storage_bytes : Int64?

        # The amount of data to be rescanned in bytes.

        @[JSON::Field(key: "rescannedStorageBytes")]
        getter rescanned_storage_bytes : Int64?

        # The total amount of data to be replicated in bytes.

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

      struct RecoveryInstanceDataReplicationInitiation
        include JSON::Serializable

        # The date and time of the current attempt to initiate data replication.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : String?

        # The steps of the current attempt to initiate data replication.

        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::RecoveryInstanceDataReplicationInitiationStep)?

        def initialize(
          @start_date_time : String? = nil,
          @steps : Array(Types::RecoveryInstanceDataReplicationInitiationStep)? = nil
        )
        end
      end

      # Data replication initiation step.

      struct RecoveryInstanceDataReplicationInitiationStep
        include JSON::Serializable

        # The name of the step.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the step.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # An object representing a block storage device on the Recovery Instance.

      struct RecoveryInstanceDisk
        include JSON::Serializable

        # The amount of storage on the disk in bytes.

        @[JSON::Field(key: "bytes")]
        getter bytes : Int64?

        # The EBS Volume ID of this disk.

        @[JSON::Field(key: "ebsVolumeID")]
        getter ebs_volume_id : String?

        # The internal device name of this disk. This is the name that is visible on the machine itself and
        # not from the EC2 console.

        @[JSON::Field(key: "internalDeviceName")]
        getter internal_device_name : String?

        def initialize(
          @bytes : Int64? = nil,
          @ebs_volume_id : String? = nil,
          @internal_device_name : String? = nil
        )
        end
      end

      # An object representing failback related information of the Recovery Instance.

      struct RecoveryInstanceFailback
        include JSON::Serializable

        # The date and time the agent on the Recovery Instance was last seen by the service.

        @[JSON::Field(key: "agentLastSeenByServiceDateTime")]
        getter agent_last_seen_by_service_date_time : String?

        # The amount of time that the Recovery Instance has been replicating for.

        @[JSON::Field(key: "elapsedReplicationDuration")]
        getter elapsed_replication_duration : String?

        # The ID of the failback client that this Recovery Instance is associated with.

        @[JSON::Field(key: "failbackClientID")]
        getter failback_client_id : String?

        # The date and time that the failback client was last seen by the service.

        @[JSON::Field(key: "failbackClientLastSeenByServiceDateTime")]
        getter failback_client_last_seen_by_service_date_time : String?

        # The date and time that the failback initiation started.

        @[JSON::Field(key: "failbackInitiationTime")]
        getter failback_initiation_time : String?

        # The Job ID of the last failback log for this Recovery Instance.

        @[JSON::Field(key: "failbackJobID")]
        getter failback_job_id : String?

        # The launch type (Recovery / Drill) of the last launch for the failback replication of this recovery
        # instance.

        @[JSON::Field(key: "failbackLaunchType")]
        getter failback_launch_type : String?

        # Whether we are failing back to the original Source Server for this Recovery Instance.

        @[JSON::Field(key: "failbackToOriginalServer")]
        getter failback_to_original_server : Bool?

        # The date and time of the first byte that was replicated from the Recovery Instance.

        @[JSON::Field(key: "firstByteDateTime")]
        getter first_byte_date_time : String?

        # The state of the failback process that this Recovery Instance is in.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @agent_last_seen_by_service_date_time : String? = nil,
          @elapsed_replication_duration : String? = nil,
          @failback_client_id : String? = nil,
          @failback_client_last_seen_by_service_date_time : String? = nil,
          @failback_initiation_time : String? = nil,
          @failback_job_id : String? = nil,
          @failback_launch_type : String? = nil,
          @failback_to_original_server : Bool? = nil,
          @first_byte_date_time : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Properties of the Recovery Instance machine.

      struct RecoveryInstanceProperties
        include JSON::Serializable

        # An array of CPUs.

        @[JSON::Field(key: "cpus")]
        getter cpus : Array(Types::CPU)?

        # An array of disks.

        @[JSON::Field(key: "disks")]
        getter disks : Array(Types::RecoveryInstanceDisk)?

        # Hints used to uniquely identify a machine.

        @[JSON::Field(key: "identificationHints")]
        getter identification_hints : Types::IdentificationHints?

        # The date and time the Recovery Instance properties were last updated on.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : String?

        # An array of network interfaces.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # Operating system.

        @[JSON::Field(key: "os")]
        getter os : Types::OS?

        # The amount of RAM in bytes.

        @[JSON::Field(key: "ramBytes")]
        getter ram_bytes : Int64?

        def initialize(
          @cpus : Array(Types::CPU)? = nil,
          @disks : Array(Types::RecoveryInstanceDisk)? = nil,
          @identification_hints : Types::IdentificationHints? = nil,
          @last_updated_date_time : String? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @os : Types::OS? = nil,
          @ram_bytes : Int64? = nil
        )
        end
      end

      # An object representing the Source Network recovery Lifecycle.

      struct RecoveryLifeCycle
        include JSON::Serializable

        # The date and time the last Source Network recovery was initiated.

        @[JSON::Field(key: "apiCallDateTime")]
        getter api_call_date_time : Time?

        # The ID of the Job that was used to last recover the Source Network.

        @[JSON::Field(key: "jobID")]
        getter job_id : String?

        # The status of the last recovery status of this Source Network.

        @[JSON::Field(key: "lastRecoveryResult")]
        getter last_recovery_result : String?

        def initialize(
          @api_call_date_time : Time? = nil,
          @job_id : String? = nil,
          @last_recovery_result : String? = nil
        )
        end
      end

      # A snapshot of a Source Server used during recovery.

      struct RecoverySnapshot
        include JSON::Serializable

        # The timestamp of when we expect the snapshot to be taken.

        @[JSON::Field(key: "expectedTimestamp")]
        getter expected_timestamp : String

        # The ID of the Recovery Snapshot.

        @[JSON::Field(key: "snapshotID")]
        getter snapshot_id : String

        # The ID of the Source Server that the snapshot was taken for.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # A list of EBS snapshots.

        @[JSON::Field(key: "ebsSnapshots")]
        getter ebs_snapshots : Array(String)?

        # The actual timestamp that the snapshot was taken.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : String?

        def initialize(
          @expected_timestamp : String,
          @snapshot_id : String,
          @source_server_id : String,
          @ebs_snapshots : Array(String)? = nil,
          @timestamp : String? = nil
        )
        end
      end


      struct ReplicationConfiguration
        include JSON::Serializable

        # Whether to associate the default Elastic Disaster Recovery Security group with the Replication
        # Configuration.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool?

        # Whether to allow the AWS replication agent to automatically replicate newly added disks.

        @[JSON::Field(key: "autoReplicateNewDisks")]
        getter auto_replicate_new_disks : Bool?

        # Configure bandwidth throttling for the outbound data transfer rate of the Source Server in Mbps.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # Whether to create a Public IP for the Recovery Instance by default.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool?

        # The data plane routing mechanism that will be used for replication.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String?

        # The Staging Disk EBS volume type to be used during replication.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String?

        # The type of EBS encryption to be used during replication.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String?

        # The ARN of the EBS encryption key to be used during replication.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # The name of the Replication Configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Point in time (PIT) policy to manage snapshots taken during replication.

        @[JSON::Field(key: "pitPolicy")]
        getter pit_policy : Array(Types::PITPolicyRule)?

        # The configuration of the disks of the Source Server to be replicated.

        @[JSON::Field(key: "replicatedDisks")]
        getter replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)?

        # The instance type to be used for the replication server.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String?

        # The security group IDs that will be used by the replication server.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)?

        # The ID of the Source Server for this Replication Configuration.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # The subnet to be used by the replication staging area.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String?

        # A set of tags to be associated with all resources created in the replication staging area: EC2
        # replication server, EBS volumes, EBS snapshots, etc.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)?

        # Whether to use a dedicated Replication Server in the replication staging area.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool?

        def initialize(
          @associate_default_security_group : Bool? = nil,
          @auto_replicate_new_disks : Bool? = nil,
          @bandwidth_throttling : Int64? = nil,
          @create_public_ip : Bool? = nil,
          @data_plane_routing : String? = nil,
          @default_large_staging_disk_type : String? = nil,
          @ebs_encryption : String? = nil,
          @ebs_encryption_key_arn : String? = nil,
          @name : String? = nil,
          @pit_policy : Array(Types::PITPolicyRule)? = nil,
          @replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)? = nil,
          @replication_server_instance_type : String? = nil,
          @replication_servers_security_groups_i_ds : Array(String)? = nil,
          @source_server_id : String? = nil,
          @staging_area_subnet_id : String? = nil,
          @staging_area_tags : Hash(String, String)? = nil,
          @use_dedicated_replication_server : Bool? = nil
        )
        end
      end

      # The configuration of a disk of the Source Server to be replicated.

      struct ReplicationConfigurationReplicatedDisk
        include JSON::Serializable

        # The name of the device.

        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # The requested number of I/O operations per second (IOPS).

        @[JSON::Field(key: "iops")]
        getter iops : Int64?

        # Whether to boot from this disk or not.

        @[JSON::Field(key: "isBootDisk")]
        getter is_boot_disk : Bool?

        # The Staging Disk EBS volume type to be used during replication when stagingDiskType is set to Auto.
        # This is a read-only field.

        @[JSON::Field(key: "optimizedStagingDiskType")]
        getter optimized_staging_disk_type : String?

        # The Staging Disk EBS volume type to be used during replication.

        @[JSON::Field(key: "stagingDiskType")]
        getter staging_disk_type : String?

        # The throughput to use for the EBS volume in MiB/s. This parameter is valid only for gp3 volumes.

        @[JSON::Field(key: "throughput")]
        getter throughput : Int64?

        def initialize(
          @device_name : String? = nil,
          @iops : Int64? = nil,
          @is_boot_disk : Bool? = nil,
          @optimized_staging_disk_type : String? = nil,
          @staging_disk_type : String? = nil,
          @throughput : Int64? = nil
        )
        end
      end


      struct ReplicationConfigurationTemplate
        include JSON::Serializable

        # The Replication Configuration Template ID.

        @[JSON::Field(key: "replicationConfigurationTemplateID")]
        getter replication_configuration_template_id : String

        # The Replication Configuration Template ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Whether to associate the default Elastic Disaster Recovery Security group with the Replication
        # Configuration Template.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool?

        # Whether to allow the AWS replication agent to automatically replicate newly added disks.

        @[JSON::Field(key: "autoReplicateNewDisks")]
        getter auto_replicate_new_disks : Bool?

        # Configure bandwidth throttling for the outbound data transfer rate of the Source Server in Mbps.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # Whether to create a Public IP for the Recovery Instance by default.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool?

        # The data plane routing mechanism that will be used for replication.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String?

        # The Staging Disk EBS volume type to be used during replication.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String?

        # The type of EBS encryption to be used during replication.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String?

        # The ARN of the EBS encryption key to be used during replication.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # The Point in time (PIT) policy to manage snapshots taken during replication.

        @[JSON::Field(key: "pitPolicy")]
        getter pit_policy : Array(Types::PITPolicyRule)?

        # The instance type to be used for the replication server.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String?

        # The security group IDs that will be used by the replication server.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)?

        # The subnet to be used by the replication staging area.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String?

        # A set of tags to be associated with all resources created in the replication staging area: EC2
        # replication server, EBS volumes, EBS snapshots, etc.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)?

        # A set of tags to be associated with the Replication Configuration Template resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Whether to use a dedicated Replication Server in the replication staging area.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool?

        def initialize(
          @replication_configuration_template_id : String,
          @arn : String? = nil,
          @associate_default_security_group : Bool? = nil,
          @auto_replicate_new_disks : Bool? = nil,
          @bandwidth_throttling : Int64? = nil,
          @create_public_ip : Bool? = nil,
          @data_plane_routing : String? = nil,
          @default_large_staging_disk_type : String? = nil,
          @ebs_encryption : String? = nil,
          @ebs_encryption_key_arn : String? = nil,
          @pit_policy : Array(Types::PITPolicyRule)? = nil,
          @replication_server_instance_type : String? = nil,
          @replication_servers_security_groups_i_ds : Array(String)? = nil,
          @staging_area_subnet_id : String? = nil,
          @staging_area_tags : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil,
          @use_dedicated_replication_server : Bool? = nil
        )
        end
      end

      # The resource for this operation was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource.

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


      struct RetryDataReplicationRequest
        include JSON::Serializable

        # The ID of the Source Server whose data replication should be retried.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        def initialize(
          @source_server_id : String
        )
        end
      end


      struct ReverseReplicationRequest
        include JSON::Serializable

        # The ID of the Recovery Instance that we want to reverse the replication for.

        @[JSON::Field(key: "recoveryInstanceID")]
        getter recovery_instance_id : String

        def initialize(
          @recovery_instance_id : String
        )
        end
      end


      struct ReverseReplicationResponse
        include JSON::Serializable

        # ARN of created SourceServer.

        @[JSON::Field(key: "reversedDirectionSourceServerArn")]
        getter reversed_direction_source_server_arn : String?

        def initialize(
          @reversed_direction_source_server_arn : String? = nil
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

        # Quota code.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The ID of the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Service code.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Properties of the cloud environment where this Source Server originated from.

      struct SourceCloudProperties
        include JSON::Serializable

        # AWS Account ID for an EC2-originated Source Server.

        @[JSON::Field(key: "originAccountID")]
        getter origin_account_id : String?

        # AWS Availability Zone for an EC2-originated Source Server.

        @[JSON::Field(key: "originAvailabilityZone")]
        getter origin_availability_zone : String?

        # AWS Region for an EC2-originated Source Server.

        @[JSON::Field(key: "originRegion")]
        getter origin_region : String?

        # The ARN of the source Outpost

        @[JSON::Field(key: "sourceOutpostArn")]
        getter source_outpost_arn : String?

        def initialize(
          @origin_account_id : String? = nil,
          @origin_availability_zone : String? = nil,
          @origin_region : String? = nil,
          @source_outpost_arn : String? = nil
        )
        end
      end

      # The ARN of the Source Network.

      struct SourceNetwork
        include JSON::Serializable

        # The ARN of the Source Network.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # CloudFormation stack name that was deployed for recovering the Source Network.

        @[JSON::Field(key: "cfnStackName")]
        getter cfn_stack_name : String?

        # An object containing information regarding the last recovery of the Source Network.

        @[JSON::Field(key: "lastRecovery")]
        getter last_recovery : Types::RecoveryLifeCycle?

        # ID of the recovered VPC following Source Network recovery.

        @[JSON::Field(key: "launchedVpcID")]
        getter launched_vpc_id : String?

        # Status of Source Network Replication. Possible values: (a) STOPPED - Source Network is not
        # replicating. (b) IN_PROGRESS - Source Network is being replicated. (c) PROTECTED - Source Network
        # was replicated successfully and is being synchronized for changes. (d) ERROR - Source Network
        # replication has failed

        @[JSON::Field(key: "replicationStatus")]
        getter replication_status : String?

        # Error details in case Source Network replication status is ERROR.

        @[JSON::Field(key: "replicationStatusDetails")]
        getter replication_status_details : String?

        # Account ID containing the VPC protected by the Source Network.

        @[JSON::Field(key: "sourceAccountID")]
        getter source_account_id : String?

        # Source Network ID.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String?

        # Region containing the VPC protected by the Source Network.

        @[JSON::Field(key: "sourceRegion")]
        getter source_region : String?

        # VPC ID protected by the Source Network.

        @[JSON::Field(key: "sourceVpcID")]
        getter source_vpc_id : String?

        # A list of tags associated with the Source Network.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cfn_stack_name : String? = nil,
          @last_recovery : Types::RecoveryLifeCycle? = nil,
          @launched_vpc_id : String? = nil,
          @replication_status : String? = nil,
          @replication_status_details : String? = nil,
          @source_account_id : String? = nil,
          @source_network_id : String? = nil,
          @source_region : String? = nil,
          @source_vpc_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Properties of Source Network related to a job event.

      struct SourceNetworkData
        include JSON::Serializable

        # Source Network ID.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String?

        # VPC ID protected by the Source Network.

        @[JSON::Field(key: "sourceVpc")]
        getter source_vpc : String?

        # CloudFormation stack name that was deployed for recovering the Source Network.

        @[JSON::Field(key: "stackName")]
        getter stack_name : String?

        # ID of the recovered VPC following Source Network recovery.

        @[JSON::Field(key: "targetVpc")]
        getter target_vpc : String?

        def initialize(
          @source_network_id : String? = nil,
          @source_vpc : String? = nil,
          @stack_name : String? = nil,
          @target_vpc : String? = nil
        )
        end
      end

      # Properties of the Source Server machine.

      struct SourceProperties
        include JSON::Serializable

        # An array of CPUs.

        @[JSON::Field(key: "cpus")]
        getter cpus : Array(Types::CPU)?

        # An array of disks.

        @[JSON::Field(key: "disks")]
        getter disks : Array(Types::Disk)?

        # Hints used to uniquely identify a machine.

        @[JSON::Field(key: "identificationHints")]
        getter identification_hints : Types::IdentificationHints?

        # The date and time the Source Properties were last updated on.

        @[JSON::Field(key: "lastUpdatedDateTime")]
        getter last_updated_date_time : String?

        # An array of network interfaces.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # Operating system.

        @[JSON::Field(key: "os")]
        getter os : Types::OS?

        # The amount of RAM in bytes.

        @[JSON::Field(key: "ramBytes")]
        getter ram_bytes : Int64?

        # The recommended EC2 instance type that will be used when recovering the Source Server.

        @[JSON::Field(key: "recommendedInstanceType")]
        getter recommended_instance_type : String?

        # Are EC2 nitro instance types supported when recovering the Source Server.

        @[JSON::Field(key: "supportsNitroInstances")]
        getter supports_nitro_instances : Bool?

        def initialize(
          @cpus : Array(Types::CPU)? = nil,
          @disks : Array(Types::Disk)? = nil,
          @identification_hints : Types::IdentificationHints? = nil,
          @last_updated_date_time : String? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @os : Types::OS? = nil,
          @ram_bytes : Int64? = nil,
          @recommended_instance_type : String? = nil,
          @supports_nitro_instances : Bool? = nil
        )
        end
      end


      struct SourceServer
        include JSON::Serializable

        # The version of the DRS agent installed on the source server

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String?

        # The ARN of the Source Server.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The Data Replication Info of the Source Server.

        @[JSON::Field(key: "dataReplicationInfo")]
        getter data_replication_info : Types::DataReplicationInfo?

        # The status of the last recovery launch of this Source Server.

        @[JSON::Field(key: "lastLaunchResult")]
        getter last_launch_result : String?

        # The lifecycle information of this Source Server.

        @[JSON::Field(key: "lifeCycle")]
        getter life_cycle : Types::LifeCycle?

        # The ID of the Recovery Instance associated with this Source Server.

        @[JSON::Field(key: "recoveryInstanceId")]
        getter recovery_instance_id : String?

        # Replication direction of the Source Server.

        @[JSON::Field(key: "replicationDirection")]
        getter replication_direction : String?

        # For EC2-originated Source Servers which have been failed over and then failed back, this value will
        # mean the ARN of the Source Server on the opposite replication direction.

        @[JSON::Field(key: "reversedDirectionSourceServerArn")]
        getter reversed_direction_source_server_arn : String?

        # Source cloud properties of the Source Server.

        @[JSON::Field(key: "sourceCloudProperties")]
        getter source_cloud_properties : Types::SourceCloudProperties?

        # ID of the Source Network which is protecting this Source Server's network.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String?

        # The source properties of the Source Server.

        @[JSON::Field(key: "sourceProperties")]
        getter source_properties : Types::SourceProperties?

        # The ID of the Source Server.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String?

        # The staging area of the source server.

        @[JSON::Field(key: "stagingArea")]
        getter staging_area : Types::StagingArea?

        # The tags associated with the Source Server.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @agent_version : String? = nil,
          @arn : String? = nil,
          @data_replication_info : Types::DataReplicationInfo? = nil,
          @last_launch_result : String? = nil,
          @life_cycle : Types::LifeCycle? = nil,
          @recovery_instance_id : String? = nil,
          @replication_direction : String? = nil,
          @reversed_direction_source_server_arn : String? = nil,
          @source_cloud_properties : Types::SourceCloudProperties? = nil,
          @source_network_id : String? = nil,
          @source_properties : Types::SourceProperties? = nil,
          @source_server_id : String? = nil,
          @staging_area : Types::StagingArea? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Staging information related to source server.

      struct StagingArea
        include JSON::Serializable

        # Shows an error message that occurred when DRS tried to access the staging source server. In this
        # case StagingArea$status will have value EXTENSION_ERROR

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Account ID of the account to which source server belongs. If this source server is extended - shows
        # Account ID of staging source server.

        @[JSON::Field(key: "stagingAccountID")]
        getter staging_account_id : String?

        # Arn of the staging source server if this source server is extended

        @[JSON::Field(key: "stagingSourceServerArn")]
        getter staging_source_server_arn : String?

        # Status of Source server extension. Possible values: (a) NOT_EXTENDED - This is a source server that
        # is replicating in the current account. (b) EXTENDED - Source server is extended from a staging
        # source server. In this case, the value of stagingSourceServerArn is pointing to the Arn of the
        # source server in the staging account. (c) EXTENSION_ERROR - Some issue occurred when accessing
        # staging source server. In this case, errorMessage field will contain an error message that explains
        # what happened.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_message : String? = nil,
          @staging_account_id : String? = nil,
          @staging_source_server_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Source server in staging account that extended source server connected to.

      struct StagingSourceServer
        include JSON::Serializable

        # The ARN of the source server.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Hostname of staging source server.

        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # A list of tags associated with the staging source server.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @hostname : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartFailbackLaunchRequest
        include JSON::Serializable

        # The IDs of the Recovery Instance whose failback launch we want to request.

        @[JSON::Field(key: "recoveryInstanceIDs")]
        getter recovery_instance_i_ds : Array(String)

        # The tags to be associated with the failback launch Job.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @recovery_instance_i_ds : Array(String),
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartFailbackLaunchResponse
        include JSON::Serializable

        # The failback launch Job.

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end


      struct StartRecoveryRequest
        include JSON::Serializable

        # The Source Servers that we want to start a Recovery Job for.

        @[JSON::Field(key: "sourceServers")]
        getter source_servers : Array(Types::StartRecoveryRequestSourceServer)

        # Whether this Source Server Recovery operation is a drill or not.

        @[JSON::Field(key: "isDrill")]
        getter is_drill : Bool?

        # The tags to be associated with the Recovery Job.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @source_servers : Array(Types::StartRecoveryRequestSourceServer),
          @is_drill : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An object representing the Source Server to recover.

      struct StartRecoveryRequestSourceServer
        include JSON::Serializable

        # The ID of the Source Server you want to recover.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # The ID of a Recovery Snapshot we want to recover from. Omit this field to launch from the latest
        # data by taking an on-demand snapshot.

        @[JSON::Field(key: "recoverySnapshotID")]
        getter recovery_snapshot_id : String?

        def initialize(
          @source_server_id : String,
          @recovery_snapshot_id : String? = nil
        )
        end
      end


      struct StartRecoveryResponse
        include JSON::Serializable

        # The Recovery Job.

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end


      struct StartReplicationRequest
        include JSON::Serializable

        # The ID of the Source Server to start replication for.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        def initialize(
          @source_server_id : String
        )
        end
      end


      struct StartReplicationResponse
        include JSON::Serializable

        # The Source Server that this action was targeted on.

        @[JSON::Field(key: "sourceServer")]
        getter source_server : Types::SourceServer?

        def initialize(
          @source_server : Types::SourceServer? = nil
        )
        end
      end


      struct StartSourceNetworkRecoveryRequest
        include JSON::Serializable

        # The Source Networks that we want to start a Recovery Job for.

        @[JSON::Field(key: "sourceNetworks")]
        getter source_networks : Array(Types::StartSourceNetworkRecoveryRequestNetworkEntry)

        # Don't update existing CloudFormation Stack, recover the network using a new stack.

        @[JSON::Field(key: "deployAsNew")]
        getter deploy_as_new : Bool?

        # The tags to be associated with the Source Network recovery Job.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @source_networks : Array(Types::StartSourceNetworkRecoveryRequestNetworkEntry),
          @deploy_as_new : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An object representing the Source Network to recover.

      struct StartSourceNetworkRecoveryRequestNetworkEntry
        include JSON::Serializable

        # The ID of the Source Network you want to recover.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String

        # CloudFormation stack name to be used for recovering the network.

        @[JSON::Field(key: "cfnStackName")]
        getter cfn_stack_name : String?

        def initialize(
          @source_network_id : String,
          @cfn_stack_name : String? = nil
        )
        end
      end


      struct StartSourceNetworkRecoveryResponse
        include JSON::Serializable

        # The Source Network recovery Job.

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end


      struct StartSourceNetworkReplicationRequest
        include JSON::Serializable

        # ID of the Source Network to replicate.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String

        def initialize(
          @source_network_id : String
        )
        end
      end


      struct StartSourceNetworkReplicationResponse
        include JSON::Serializable

        # Source Network which was requested for replication.

        @[JSON::Field(key: "sourceNetwork")]
        getter source_network : Types::SourceNetwork?

        def initialize(
          @source_network : Types::SourceNetwork? = nil
        )
        end
      end


      struct StopFailbackRequest
        include JSON::Serializable

        # The ID of the Recovery Instance we want to stop failback for.

        @[JSON::Field(key: "recoveryInstanceID")]
        getter recovery_instance_id : String

        def initialize(
          @recovery_instance_id : String
        )
        end
      end


      struct StopReplicationRequest
        include JSON::Serializable

        # The ID of the Source Server to stop replication for.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        def initialize(
          @source_server_id : String
        )
        end
      end


      struct StopReplicationResponse
        include JSON::Serializable

        # The Source Server that this action was targeted on.

        @[JSON::Field(key: "sourceServer")]
        getter source_server : Types::SourceServer?

        def initialize(
          @source_server : Types::SourceServer? = nil
        )
        end
      end


      struct StopSourceNetworkReplicationRequest
        include JSON::Serializable

        # ID of the Source Network to stop replication.

        @[JSON::Field(key: "sourceNetworkID")]
        getter source_network_id : String

        def initialize(
          @source_network_id : String
        )
        end
      end


      struct StopSourceNetworkReplicationResponse
        include JSON::Serializable

        # Source Network which was requested to stop replication.

        @[JSON::Field(key: "sourceNetwork")]
        getter source_network : Types::SourceNetwork?

        def initialize(
          @source_network : Types::SourceNetwork? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # ARN of the resource for which tags are to be added or updated.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Array of tags to be added or updated.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TerminateRecoveryInstancesRequest
        include JSON::Serializable

        # The IDs of the Recovery Instances that should be terminated.

        @[JSON::Field(key: "recoveryInstanceIDs")]
        getter recovery_instance_i_ds : Array(String)

        def initialize(
          @recovery_instance_i_ds : Array(String)
        )
        end
      end


      struct TerminateRecoveryInstancesResponse
        include JSON::Serializable

        # The Job for terminating the Recovery Instances.

        @[JSON::Field(key: "job")]
        getter job : Types::Job?

        def initialize(
          @job : Types::Job? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Quota code.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds after which the request should be safe to retry.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : String?

        # Service code.

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

      # The account performing the request has not been initialized.

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

        # ARN of the resource for which tags are to be removed.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Array of tags to be removed.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateFailbackReplicationConfigurationRequest
        include JSON::Serializable

        # The ID of the Recovery Instance.

        @[JSON::Field(key: "recoveryInstanceID")]
        getter recovery_instance_id : String

        # Configure bandwidth throttling for the outbound data transfer rate of the Recovery Instance in Mbps.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # The name of the Failback Replication Configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Whether to use Private IP for the failback replication of the Recovery Instance.

        @[JSON::Field(key: "usePrivateIP")]
        getter use_private_ip : Bool?

        def initialize(
          @recovery_instance_id : String,
          @bandwidth_throttling : Int64? = nil,
          @name : String? = nil,
          @use_private_ip : Bool? = nil
        )
        end
      end


      struct UpdateLaunchConfigurationRequest
        include JSON::Serializable

        # The ID of the Source Server that we want to retrieve a Launch Configuration for.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Whether we should copy the Private IP of the Source Server to the Recovery Instance.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Whether we want to copy the tags of the Source Server to the EC2 machine of the Recovery Instance.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # The state of the Recovery Instance in EC2 after the recovery operation.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?

        # Launch into existing instance properties.

        @[JSON::Field(key: "launchIntoInstanceProperties")]
        getter launch_into_instance_properties : Types::LaunchIntoInstanceProperties?

        # The licensing configuration to be used for this launch configuration.

        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # The name of the launch configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Whether we want to enable post-launch actions for the Source Server.

        @[JSON::Field(key: "postLaunchEnabled")]
        getter post_launch_enabled : Bool?

        # Whether Elastic Disaster Recovery should try to automatically choose the instance type that best
        # matches the OS, CPU, and RAM of your Source Server.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @source_server_id : String,
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @launch_disposition : String? = nil,
          @launch_into_instance_properties : Types::LaunchIntoInstanceProperties? = nil,
          @licensing : Types::Licensing? = nil,
          @name : String? = nil,
          @post_launch_enabled : Bool? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end


      struct UpdateLaunchConfigurationTemplateRequest
        include JSON::Serializable

        # Launch Configuration Template ID.

        @[JSON::Field(key: "launchConfigurationTemplateID")]
        getter launch_configuration_template_id : String

        # Copy private IP.

        @[JSON::Field(key: "copyPrivateIp")]
        getter copy_private_ip : Bool?

        # Copy tags.

        @[JSON::Field(key: "copyTags")]
        getter copy_tags : Bool?

        # S3 bucket ARN to export Source Network templates.

        @[JSON::Field(key: "exportBucketArn")]
        getter export_bucket_arn : String?

        # Launch disposition.

        @[JSON::Field(key: "launchDisposition")]
        getter launch_disposition : String?

        # DRS will set the 'launch into instance ID' of any source server when performing a drill, recovery or
        # failback to the previous region or availability zone, using the instance ID of the source instance.

        @[JSON::Field(key: "launchIntoSourceInstance")]
        getter launch_into_source_instance : Bool?

        # Licensing.

        @[JSON::Field(key: "licensing")]
        getter licensing : Types::Licensing?

        # Whether we want to activate post-launch actions.

        @[JSON::Field(key: "postLaunchEnabled")]
        getter post_launch_enabled : Bool?

        # Target instance type right-sizing method.

        @[JSON::Field(key: "targetInstanceTypeRightSizingMethod")]
        getter target_instance_type_right_sizing_method : String?

        def initialize(
          @launch_configuration_template_id : String,
          @copy_private_ip : Bool? = nil,
          @copy_tags : Bool? = nil,
          @export_bucket_arn : String? = nil,
          @launch_disposition : String? = nil,
          @launch_into_source_instance : Bool? = nil,
          @licensing : Types::Licensing? = nil,
          @post_launch_enabled : Bool? = nil,
          @target_instance_type_right_sizing_method : String? = nil
        )
        end
      end


      struct UpdateLaunchConfigurationTemplateResponse
        include JSON::Serializable

        # Updated Launch Configuration Template.

        @[JSON::Field(key: "launchConfigurationTemplate")]
        getter launch_configuration_template : Types::LaunchConfigurationTemplate?

        def initialize(
          @launch_configuration_template : Types::LaunchConfigurationTemplate? = nil
        )
        end
      end


      struct UpdateReplicationConfigurationRequest
        include JSON::Serializable

        # The ID of the Source Server for this Replication Configuration.

        @[JSON::Field(key: "sourceServerID")]
        getter source_server_id : String

        # Whether to associate the default Elastic Disaster Recovery Security group with the Replication
        # Configuration.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool?

        # Whether to allow the AWS replication agent to automatically replicate newly added disks.

        @[JSON::Field(key: "autoReplicateNewDisks")]
        getter auto_replicate_new_disks : Bool?

        # Configure bandwidth throttling for the outbound data transfer rate of the Source Server in Mbps.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # Whether to create a Public IP for the Recovery Instance by default.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool?

        # The data plane routing mechanism that will be used for replication.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String?

        # The Staging Disk EBS volume type to be used during replication.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String?

        # The type of EBS encryption to be used during replication.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String?

        # The ARN of the EBS encryption key to be used during replication.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # The name of the Replication Configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Point in time (PIT) policy to manage snapshots taken during replication.

        @[JSON::Field(key: "pitPolicy")]
        getter pit_policy : Array(Types::PITPolicyRule)?

        # The configuration of the disks of the Source Server to be replicated.

        @[JSON::Field(key: "replicatedDisks")]
        getter replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)?

        # The instance type to be used for the replication server.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String?

        # The security group IDs that will be used by the replication server.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)?

        # The subnet to be used by the replication staging area.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String?

        # A set of tags to be associated with all resources created in the replication staging area: EC2
        # replication server, EBS volumes, EBS snapshots, etc.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)?

        # Whether to use a dedicated Replication Server in the replication staging area.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool?

        def initialize(
          @source_server_id : String,
          @associate_default_security_group : Bool? = nil,
          @auto_replicate_new_disks : Bool? = nil,
          @bandwidth_throttling : Int64? = nil,
          @create_public_ip : Bool? = nil,
          @data_plane_routing : String? = nil,
          @default_large_staging_disk_type : String? = nil,
          @ebs_encryption : String? = nil,
          @ebs_encryption_key_arn : String? = nil,
          @name : String? = nil,
          @pit_policy : Array(Types::PITPolicyRule)? = nil,
          @replicated_disks : Array(Types::ReplicationConfigurationReplicatedDisk)? = nil,
          @replication_server_instance_type : String? = nil,
          @replication_servers_security_groups_i_ds : Array(String)? = nil,
          @staging_area_subnet_id : String? = nil,
          @staging_area_tags : Hash(String, String)? = nil,
          @use_dedicated_replication_server : Bool? = nil
        )
        end
      end


      struct UpdateReplicationConfigurationTemplateRequest
        include JSON::Serializable

        # The Replication Configuration Template ID.

        @[JSON::Field(key: "replicationConfigurationTemplateID")]
        getter replication_configuration_template_id : String

        # The Replication Configuration Template ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Whether to associate the default Elastic Disaster Recovery Security group with the Replication
        # Configuration Template.

        @[JSON::Field(key: "associateDefaultSecurityGroup")]
        getter associate_default_security_group : Bool?

        # Whether to allow the AWS replication agent to automatically replicate newly added disks.

        @[JSON::Field(key: "autoReplicateNewDisks")]
        getter auto_replicate_new_disks : Bool?

        # Configure bandwidth throttling for the outbound data transfer rate of the Source Server in Mbps.

        @[JSON::Field(key: "bandwidthThrottling")]
        getter bandwidth_throttling : Int64?

        # Whether to create a Public IP for the Recovery Instance by default.

        @[JSON::Field(key: "createPublicIP")]
        getter create_public_ip : Bool?

        # The data plane routing mechanism that will be used for replication.

        @[JSON::Field(key: "dataPlaneRouting")]
        getter data_plane_routing : String?

        # The Staging Disk EBS volume type to be used during replication.

        @[JSON::Field(key: "defaultLargeStagingDiskType")]
        getter default_large_staging_disk_type : String?

        # The type of EBS encryption to be used during replication.

        @[JSON::Field(key: "ebsEncryption")]
        getter ebs_encryption : String?

        # The ARN of the EBS encryption key to be used during replication.

        @[JSON::Field(key: "ebsEncryptionKeyArn")]
        getter ebs_encryption_key_arn : String?

        # The Point in time (PIT) policy to manage snapshots taken during replication.

        @[JSON::Field(key: "pitPolicy")]
        getter pit_policy : Array(Types::PITPolicyRule)?

        # The instance type to be used for the replication server.

        @[JSON::Field(key: "replicationServerInstanceType")]
        getter replication_server_instance_type : String?

        # The security group IDs that will be used by the replication server.

        @[JSON::Field(key: "replicationServersSecurityGroupsIDs")]
        getter replication_servers_security_groups_i_ds : Array(String)?

        # The subnet to be used by the replication staging area.

        @[JSON::Field(key: "stagingAreaSubnetId")]
        getter staging_area_subnet_id : String?

        # A set of tags to be associated with all resources created in the replication staging area: EC2
        # replication server, EBS volumes, EBS snapshots, etc.

        @[JSON::Field(key: "stagingAreaTags")]
        getter staging_area_tags : Hash(String, String)?

        # Whether to use a dedicated Replication Server in the replication staging area.

        @[JSON::Field(key: "useDedicatedReplicationServer")]
        getter use_dedicated_replication_server : Bool?

        def initialize(
          @replication_configuration_template_id : String,
          @arn : String? = nil,
          @associate_default_security_group : Bool? = nil,
          @auto_replicate_new_disks : Bool? = nil,
          @bandwidth_throttling : Int64? = nil,
          @create_public_ip : Bool? = nil,
          @data_plane_routing : String? = nil,
          @default_large_staging_disk_type : String? = nil,
          @ebs_encryption : String? = nil,
          @ebs_encryption_key_arn : String? = nil,
          @pit_policy : Array(Types::PITPolicyRule)? = nil,
          @replication_server_instance_type : String? = nil,
          @replication_servers_security_groups_i_ds : Array(String)? = nil,
          @staging_area_subnet_id : String? = nil,
          @staging_area_tags : Hash(String, String)? = nil,
          @use_dedicated_replication_server : Bool? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by the AWS service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?

        # A list of fields that failed validation.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?


        @[JSON::Field(key: "message")]
        getter message : String?

        # Validation exception reason.

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
    end
  end
end
