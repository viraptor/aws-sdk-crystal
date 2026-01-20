require "json"
require "time"

module Aws
  module PCS
    module Types

      # You don't have permission to perform the action. Examples The launch template instance profile
      # doesn't pass iam:PassRole verification. There is a mismatch between the account ID and cluster ID.
      # The cluster ID doesn't exist. The EC2 instance isn't present.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The accounting configuration includes configurable settings for Slurm accounting. It's a property of
      # the ClusterSlurmConfiguration object.

      struct Accounting
        include JSON::Serializable

        # The default value for mode is NONE . A value of STANDARD means Slurm accounting is enabled.

        @[JSON::Field(key: "mode")]
        getter mode : String

        # The default value for all purge settings for slurmdbd.conf . For more information, see the
        # slurmdbd.conf documentation at SchedMD . The default value for defaultPurgeTimeInDays is -1 . A
        # value of -1 means there is no purge time and records persist as long as the cluster exists. 0 isn't
        # a valid value.

        @[JSON::Field(key: "defaultPurgeTimeInDays")]
        getter default_purge_time_in_days : Int32?

        def initialize(
          @mode : String,
          @default_purge_time_in_days : Int32? = nil
        )
        end
      end

      # The accounting configuration includes configurable settings for Slurm accounting. It's a property of
      # the ClusterSlurmConfiguration object.

      struct AccountingRequest
        include JSON::Serializable

        # The default value for mode is NONE . A value of STANDARD means Slurm accounting is enabled.

        @[JSON::Field(key: "mode")]
        getter mode : String

        # The default value for all purge settings for slurmdbd.conf . For more information, see the
        # slurmdbd.conf documentation at SchedMD . The default value for defaultPurgeTimeInDays is -1 . A
        # value of -1 means there is no purge time and records persist as long as the cluster exists. 0 isn't
        # a valid value.

        @[JSON::Field(key: "defaultPurgeTimeInDays")]
        getter default_purge_time_in_days : Int32?

        def initialize(
          @mode : String,
          @default_purge_time_in_days : Int32? = nil
        )
        end
      end

      # The cluster resource and configuration.

      struct Cluster
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time the resource was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The generated unique ID of the cluster.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the resource was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time

        # The name that identifies the cluster.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "networking")]
        getter networking : Types::Networking


        @[JSON::Field(key: "scheduler")]
        getter scheduler : Types::Scheduler

        # The size of the cluster. SMALL : 32 compute nodes and 256 jobs MEDIUM : 512 compute nodes and 8192
        # jobs LARGE : 2048 compute nodes and 16,384 jobs

        @[JSON::Field(key: "size")]
        getter size : String

        # The provisioning status of the cluster. The provisioning status doesn't indicate the overall health
        # of the cluster. The resource enters the SUSPENDING and SUSPENDED states when the scheduler is beyond
        # end of life and we have suspended the cluster. When in these states, you can't use the cluster. The
        # cluster controller is down and all compute instances are terminated. The resources still count
        # toward your service quotas. You can delete a resource if its status is SUSPENDED . For more
        # information, see Frequently asked questions about Slurm versions in PCS in the PCS User Guide .

        @[JSON::Field(key: "status")]
        getter status : String

        # The list of endpoints available for interaction with the scheduler.

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(Types::Endpoint)?

        # The list of errors that occurred during cluster provisioning.

        @[JSON::Field(key: "errorInfo")]
        getter error_info : Array(Types::ErrorInfo)?

        # Additional options related to the Slurm scheduler.

        @[JSON::Field(key: "slurmConfiguration")]
        getter slurm_configuration : Types::ClusterSlurmConfiguration?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @modified_at : Time,
          @name : String,
          @networking : Types::Networking,
          @scheduler : Types::Scheduler,
          @size : String,
          @status : String,
          @endpoints : Array(Types::Endpoint)? = nil,
          @error_info : Array(Types::ErrorInfo)? = nil,
          @slurm_configuration : Types::ClusterSlurmConfiguration? = nil
        )
        end
      end

      # Additional options related to the Slurm scheduler.

      struct ClusterSlurmConfiguration
        include JSON::Serializable

        # The accounting configuration includes configurable settings for Slurm accounting.

        @[JSON::Field(key: "accounting")]
        getter accounting : Types::Accounting?

        # The shared Slurm key for authentication, also known as the cluster secret .

        @[JSON::Field(key: "authKey")]
        getter auth_key : Types::SlurmAuthKey?

        # The JWT authentication configuration for Slurm REST API access.

        @[JSON::Field(key: "jwtAuth")]
        getter jwt_auth : Types::JwtAuth?

        # The time (in seconds) before an idle node is scaled down. Default: 600

        @[JSON::Field(key: "scaleDownIdleTimeInSeconds")]
        getter scale_down_idle_time_in_seconds : Int32?

        # Additional Slurm-specific configuration that directly maps to Slurm settings.

        @[JSON::Field(key: "slurmCustomSettings")]
        getter slurm_custom_settings : Array(Types::SlurmCustomSetting)?

        # The Slurm REST API configuration for the cluster.

        @[JSON::Field(key: "slurmRest")]
        getter slurm_rest : Types::SlurmRest?

        def initialize(
          @accounting : Types::Accounting? = nil,
          @auth_key : Types::SlurmAuthKey? = nil,
          @jwt_auth : Types::JwtAuth? = nil,
          @scale_down_idle_time_in_seconds : Int32? = nil,
          @slurm_custom_settings : Array(Types::SlurmCustomSetting)? = nil,
          @slurm_rest : Types::SlurmRest? = nil
        )
        end
      end

      # Additional options related to the Slurm scheduler.

      struct ClusterSlurmConfigurationRequest
        include JSON::Serializable

        # The accounting configuration includes configurable settings for Slurm accounting.

        @[JSON::Field(key: "accounting")]
        getter accounting : Types::AccountingRequest?

        # The time (in seconds) before an idle node is scaled down. Default: 600

        @[JSON::Field(key: "scaleDownIdleTimeInSeconds")]
        getter scale_down_idle_time_in_seconds : Int32?

        # Additional Slurm-specific configuration that directly maps to Slurm settings.

        @[JSON::Field(key: "slurmCustomSettings")]
        getter slurm_custom_settings : Array(Types::SlurmCustomSetting)?

        # The Slurm REST API configuration for the cluster.

        @[JSON::Field(key: "slurmRest")]
        getter slurm_rest : Types::SlurmRestRequest?

        def initialize(
          @accounting : Types::AccountingRequest? = nil,
          @scale_down_idle_time_in_seconds : Int32? = nil,
          @slurm_custom_settings : Array(Types::SlurmCustomSetting)? = nil,
          @slurm_rest : Types::SlurmRestRequest? = nil
        )
        end
      end

      # The object returned by the ListClusters API action.

      struct ClusterSummary
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time the resource was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The generated unique ID of the cluster.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the resource was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time

        # The name that identifies the cluster.

        @[JSON::Field(key: "name")]
        getter name : String

        # The provisioning status of the cluster. The provisioning status doesn't indicate the overall health
        # of the cluster. The resource enters the SUSPENDING and SUSPENDED states when the scheduler is beyond
        # end of life and we have suspended the cluster. When in these states, you can't use the cluster. The
        # cluster controller is down and all compute instances are terminated. The resources still count
        # toward your service quotas. You can delete a resource if its status is SUSPENDED . For more
        # information, see Frequently asked questions about Slurm versions in PCS in the PCS User Guide .

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @modified_at : Time,
          @name : String,
          @status : String
        )
        end
      end

      # A compute node group associated with a cluster.

      struct ComputeNodeGroup
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the compute node group.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the cluster of the compute node group.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        # The date and time the resource was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time


        @[JSON::Field(key: "customLaunchTemplate")]
        getter custom_launch_template : Types::CustomLaunchTemplate

        # The Amazon Resource Name (ARN) of the IAM instance profile used to pass an IAM role when launching
        # EC2 instances. The role contained in your instance profile must have the
        # pcs:RegisterComputeNodeGroupInstance permission and the role name must start with AWSPCS or must
        # have the path /aws-pcs/ . For more information, see IAM instance profiles for PCS in the PCS User
        # Guide .

        @[JSON::Field(key: "iamInstanceProfileArn")]
        getter iam_instance_profile_arn : String

        # The generated unique ID of the compute node group.

        @[JSON::Field(key: "id")]
        getter id : String

        # A list of EC2 instance configurations that PCS can provision in the compute node group.

        @[JSON::Field(key: "instanceConfigs")]
        getter instance_configs : Array(Types::InstanceConfig)

        # The date and time the resource was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time

        # The name that identifies the compute node group.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "scalingConfiguration")]
        getter scaling_configuration : Types::ScalingConfiguration

        # The provisioning status of the compute node group. The provisioning status doesn't indicate the
        # overall health of the compute node group. The resource enters the SUSPENDING and SUSPENDED states
        # when the scheduler is beyond end of life and we have suspended the cluster. When in these states,
        # you can't use the cluster. The cluster controller is down and all compute instances are terminated.
        # The resources still count toward your service quotas. You can delete a resource if its status is
        # SUSPENDED . For more information, see Frequently asked questions about Slurm versions in PCS in the
        # PCS User Guide .

        @[JSON::Field(key: "status")]
        getter status : String

        # The list of subnet IDs where instances are provisioned by the compute node group. The subnets must
        # be in the same VPC as the cluster.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the Amazon Machine Image (AMI) that PCS uses to launch instances. If not provided, PCS
        # uses the AMI ID specified in the custom launch template.

        @[JSON::Field(key: "amiId")]
        getter ami_id : String?

        # The list of errors that occurred during compute node group provisioning.

        @[JSON::Field(key: "errorInfo")]
        getter error_info : Array(Types::ErrorInfo)?

        # Specifies how EC2 instances are purchased on your behalf. PCS supports On-Demand Instances, Spot
        # Instances, and Amazon EC2 Capacity Blocks for ML. For more information, see Amazon EC2 billing and
        # purchasing options in the Amazon Elastic Compute Cloud User Guide . For more information about PCS
        # support for Capacity Blocks, see Using Amazon EC2 Capacity Blocks for ML with PCS in the PCS User
        # Guide . If you don't provide this option, it defaults to On-Demand.

        @[JSON::Field(key: "purchaseOption")]
        getter purchase_option : String?


        @[JSON::Field(key: "slurmConfiguration")]
        getter slurm_configuration : Types::ComputeNodeGroupSlurmConfiguration?


        @[JSON::Field(key: "spotOptions")]
        getter spot_options : Types::SpotOptions?

        def initialize(
          @arn : String,
          @cluster_id : String,
          @created_at : Time,
          @custom_launch_template : Types::CustomLaunchTemplate,
          @iam_instance_profile_arn : String,
          @id : String,
          @instance_configs : Array(Types::InstanceConfig),
          @modified_at : Time,
          @name : String,
          @scaling_configuration : Types::ScalingConfiguration,
          @status : String,
          @subnet_ids : Array(String),
          @ami_id : String? = nil,
          @error_info : Array(Types::ErrorInfo)? = nil,
          @purchase_option : String? = nil,
          @slurm_configuration : Types::ComputeNodeGroupSlurmConfiguration? = nil,
          @spot_options : Types::SpotOptions? = nil
        )
        end
      end

      # The compute node group configuration for a queue.

      struct ComputeNodeGroupConfiguration
        include JSON::Serializable

        # The compute node group ID for the compute node group configuration.

        @[JSON::Field(key: "computeNodeGroupId")]
        getter compute_node_group_id : String?

        def initialize(
          @compute_node_group_id : String? = nil
        )
        end
      end

      # Additional options related to the Slurm scheduler.

      struct ComputeNodeGroupSlurmConfiguration
        include JSON::Serializable

        # Additional Slurm-specific configuration that directly maps to Slurm settings.

        @[JSON::Field(key: "slurmCustomSettings")]
        getter slurm_custom_settings : Array(Types::SlurmCustomSetting)?

        def initialize(
          @slurm_custom_settings : Array(Types::SlurmCustomSetting)? = nil
        )
        end
      end

      # Additional options related to the Slurm scheduler.

      struct ComputeNodeGroupSlurmConfigurationRequest
        include JSON::Serializable

        # Additional Slurm-specific configuration that directly maps to Slurm settings.

        @[JSON::Field(key: "slurmCustomSettings")]
        getter slurm_custom_settings : Array(Types::SlurmCustomSetting)?

        def initialize(
          @slurm_custom_settings : Array(Types::SlurmCustomSetting)? = nil
        )
        end
      end

      # The object returned by the ListComputeNodeGroups API action.

      struct ComputeNodeGroupSummary
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the compute node group.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the cluster of the compute node group.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        # The date and time the resource was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The generated unique ID of the compute node group.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the resource was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time

        # The name that identifies the compute node group.

        @[JSON::Field(key: "name")]
        getter name : String

        # The provisioning status of the compute node group. The provisioning status doesn't indicate the
        # overall health of the compute node group. The resource enters the SUSPENDING and SUSPENDED states
        # when the scheduler is beyond end of life and we have suspended the cluster. When in these states,
        # you can't use the cluster. The cluster controller is down and all compute instances are terminated.
        # The resources still count toward your service quotas. You can delete a resource if its status is
        # SUSPENDED . For more information, see Frequently asked questions about Slurm versions in PCS in the
        # PCS User Guide .

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @arn : String,
          @cluster_id : String,
          @created_at : Time,
          @id : String,
          @modified_at : Time,
          @name : String,
          @status : String
        )
        end
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than 1
      # operation on the same resource at the same time. Examples A cluster with the same name already
      # exists. A cluster isn't in ACTIVE status. A cluster to delete is in an unstable state. For example,
      # because it still has ACTIVE node groups or queues. A queue already exists in a cluster.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The unique identifier of the resource that caused the conflict exception.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type or category of the resource that caused the conflict exception."

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct CreateClusterRequest
        include JSON::Serializable

        # A name to identify the cluster. Example: MyCluster

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # The networking configuration used to set up the cluster's control plane.

        @[JSON::Field(key: "networking")]
        getter networking : Types::NetworkingRequest

        # The cluster management and job scheduling software associated with the cluster.

        @[JSON::Field(key: "scheduler")]
        getter scheduler : Types::SchedulerRequest

        # A value that determines the maximum number of compute nodes in the cluster and the maximum number of
        # jobs (active and queued). SMALL : 32 compute nodes and 256 jobs MEDIUM : 512 compute nodes and 8192
        # jobs LARGE : 2048 compute nodes and 16,384 jobs

        @[JSON::Field(key: "size")]
        getter size : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the CLI and SDK automatically generate 1 for you.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Additional options related to the Slurm scheduler.

        @[JSON::Field(key: "slurmConfiguration")]
        getter slurm_configuration : Types::ClusterSlurmConfigurationRequest?

        # 1 or more tags added to the resource. Each tag consists of a tag key and tag value. The tag value is
        # optional and can be an empty string.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_name : String,
          @networking : Types::NetworkingRequest,
          @scheduler : Types::SchedulerRequest,
          @size : String,
          @client_token : String? = nil,
          @slurm_configuration : Types::ClusterSlurmConfigurationRequest? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateClusterResponse
        include JSON::Serializable

        # The cluster resource.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct CreateComputeNodeGroupRequest
        include JSON::Serializable

        # The name or ID of the cluster to create a compute node group in.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # A name to identify the cluster. Example: MyCluster

        @[JSON::Field(key: "computeNodeGroupName")]
        getter compute_node_group_name : String


        @[JSON::Field(key: "customLaunchTemplate")]
        getter custom_launch_template : Types::CustomLaunchTemplate

        # The Amazon Resource Name (ARN) of the IAM instance profile used to pass an IAM role when launching
        # EC2 instances. The role contained in your instance profile must have the
        # pcs:RegisterComputeNodeGroupInstance permission and the role name must start with AWSPCS or must
        # have the path /aws-pcs/ . For more information, see IAM instance profiles for PCS in the PCS User
        # Guide .

        @[JSON::Field(key: "iamInstanceProfileArn")]
        getter iam_instance_profile_arn : String

        # A list of EC2 instance configurations that PCS can provision in the compute node group.

        @[JSON::Field(key: "instanceConfigs")]
        getter instance_configs : Array(Types::InstanceConfig)

        # Specifies the boundaries of the compute node group auto scaling.

        @[JSON::Field(key: "scalingConfiguration")]
        getter scaling_configuration : Types::ScalingConfigurationRequest

        # The list of subnet IDs where the compute node group launches instances. Subnets must be in the same
        # VPC as the cluster.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the Amazon Machine Image (AMI) that PCS uses to launch compute nodes (Amazon EC2
        # instances). If you don't provide this value, PCS uses the AMI ID specified in the custom launch
        # template.

        @[JSON::Field(key: "amiId")]
        getter ami_id : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the CLI and SDK automatically generate 1 for you.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies how EC2 instances are purchased on your behalf. PCS supports On-Demand Instances, Spot
        # Instances, and Amazon EC2 Capacity Blocks for ML. For more information, see Amazon EC2 billing and
        # purchasing options in the Amazon Elastic Compute Cloud User Guide . For more information about PCS
        # support for Capacity Blocks, see Using Amazon EC2 Capacity Blocks for ML with PCS in the PCS User
        # Guide . If you don't provide this option, it defaults to On-Demand.

        @[JSON::Field(key: "purchaseOption")]
        getter purchase_option : String?

        # Additional options related to the Slurm scheduler.

        @[JSON::Field(key: "slurmConfiguration")]
        getter slurm_configuration : Types::ComputeNodeGroupSlurmConfigurationRequest?


        @[JSON::Field(key: "spotOptions")]
        getter spot_options : Types::SpotOptions?

        # 1 or more tags added to the resource. Each tag consists of a tag key and tag value. The tag value is
        # optional and can be an empty string.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_identifier : String,
          @compute_node_group_name : String,
          @custom_launch_template : Types::CustomLaunchTemplate,
          @iam_instance_profile_arn : String,
          @instance_configs : Array(Types::InstanceConfig),
          @scaling_configuration : Types::ScalingConfigurationRequest,
          @subnet_ids : Array(String),
          @ami_id : String? = nil,
          @client_token : String? = nil,
          @purchase_option : String? = nil,
          @slurm_configuration : Types::ComputeNodeGroupSlurmConfigurationRequest? = nil,
          @spot_options : Types::SpotOptions? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateComputeNodeGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "computeNodeGroup")]
        getter compute_node_group : Types::ComputeNodeGroup?

        def initialize(
          @compute_node_group : Types::ComputeNodeGroup? = nil
        )
        end
      end


      struct CreateQueueRequest
        include JSON::Serializable

        # The name or ID of the cluster for which to create a queue.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # A name to identify the queue.

        @[JSON::Field(key: "queueName")]
        getter queue_name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the CLI and SDK automatically generate 1 for you.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The list of compute node group configurations to associate with the queue. Queues assign jobs to
        # associated compute node groups.

        @[JSON::Field(key: "computeNodeGroupConfigurations")]
        getter compute_node_group_configurations : Array(Types::ComputeNodeGroupConfiguration)?

        # Additional options related to the Slurm scheduler.

        @[JSON::Field(key: "slurmConfiguration")]
        getter slurm_configuration : Types::QueueSlurmConfigurationRequest?

        # 1 or more tags added to the resource. Each tag consists of a tag key and tag value. The tag value is
        # optional and can be an empty string.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_identifier : String,
          @queue_name : String,
          @client_token : String? = nil,
          @compute_node_group_configurations : Array(Types::ComputeNodeGroupConfiguration)? = nil,
          @slurm_configuration : Types::QueueSlurmConfigurationRequest? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateQueueResponse
        include JSON::Serializable


        @[JSON::Field(key: "queue")]
        getter queue : Types::Queue?

        def initialize(
          @queue : Types::Queue? = nil
        )
        end
      end

      # An Amazon EC2 launch template PCS uses to launch compute nodes.

      struct CustomLaunchTemplate
        include JSON::Serializable

        # The ID of the EC2 launch template to use to provision instances. Example: lt-xxxx

        @[JSON::Field(key: "id")]
        getter id : String

        # The version of the EC2 launch template to use to provision instances.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @id : String,
          @version : String
        )
        end
      end


      struct DeleteClusterRequest
        include JSON::Serializable

        # The name or ID of the cluster to delete.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the CLI and SDK automatically generate 1 for you.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @cluster_identifier : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteClusterResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteComputeNodeGroupRequest
        include JSON::Serializable

        # The name or ID of the cluster of the compute node group.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # The name or ID of the compute node group to delete.

        @[JSON::Field(key: "computeNodeGroupIdentifier")]
        getter compute_node_group_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the CLI and SDK automatically generate 1 for you.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @cluster_identifier : String,
          @compute_node_group_identifier : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteComputeNodeGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteQueueRequest
        include JSON::Serializable

        # The name or ID of the cluster of the queue.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # The name or ID of the queue to delete.

        @[JSON::Field(key: "queueIdentifier")]
        getter queue_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the CLI and SDK automatically generate 1 for you.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @cluster_identifier : String,
          @queue_identifier : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteQueueResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An endpoint available for interaction with the scheduler.

      struct Endpoint
        include JSON::Serializable

        # The endpoint's connection port number. Example: 1234

        @[JSON::Field(key: "port")]
        getter port : String

        # For clusters that use IPv4, this is the endpoint's private IP address. Example: 10.1.2.3 For
        # clusters configured to use IPv6, this is an empty string.

        @[JSON::Field(key: "privateIpAddress")]
        getter private_ip_address : String

        # Indicates the type of endpoint running at the specific IP address.

        @[JSON::Field(key: "type")]
        getter type : String

        # The endpoint's IPv6 address. Example: 2001:db8::1

        @[JSON::Field(key: "ipv6Address")]
        getter ipv6_address : String?

        # The endpoint's public IP address. Example: 192.0.2.1

        @[JSON::Field(key: "publicIpAddress")]
        getter public_ip_address : String?

        def initialize(
          @port : String,
          @private_ip_address : String,
          @type : String,
          @ipv6_address : String? = nil,
          @public_ip_address : String? = nil
        )
        end
      end

      # An error that occurred during resource creation.

      struct ErrorInfo
        include JSON::Serializable

        # The short-form error code.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The detailed error information.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct GetClusterRequest
        include JSON::Serializable

        # The name or ID of the cluster.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @cluster_identifier : String
        )
        end
      end


      struct GetClusterResponse
        include JSON::Serializable

        # The cluster resource.

        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct GetComputeNodeGroupRequest
        include JSON::Serializable

        # The name or ID of the cluster.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # The name or ID of the compute node group.

        @[JSON::Field(key: "computeNodeGroupIdentifier")]
        getter compute_node_group_identifier : String

        def initialize(
          @cluster_identifier : String,
          @compute_node_group_identifier : String
        )
        end
      end


      struct GetComputeNodeGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "computeNodeGroup")]
        getter compute_node_group : Types::ComputeNodeGroup?

        def initialize(
          @compute_node_group : Types::ComputeNodeGroup? = nil
        )
        end
      end


      struct GetQueueRequest
        include JSON::Serializable

        # The name or ID of the cluster of the queue.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # The name or ID of the queue.

        @[JSON::Field(key: "queueIdentifier")]
        getter queue_identifier : String

        def initialize(
          @cluster_identifier : String,
          @queue_identifier : String
        )
        end
      end


      struct GetQueueResponse
        include JSON::Serializable


        @[JSON::Field(key: "queue")]
        getter queue : Types::Queue?

        def initialize(
          @queue : Types::Queue? = nil
        )
        end
      end

      # An EC2 instance configuration PCS uses to launch compute nodes.

      struct InstanceConfig
        include JSON::Serializable

        # The EC2 instance type that PCS can provision in the compute node group. Example: t2.xlarge

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        def initialize(
          @instance_type : String? = nil
        )
        end
      end

      # PCS can't process your request right now. Try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The JWT authentication configuration for Slurm REST API access.

      struct JwtAuth
        include JSON::Serializable

        # The JWT key for Slurm REST API authentication.

        @[JSON::Field(key: "jwtKey")]
        getter jwt_key : Types::JwtKey?

        def initialize(
          @jwt_key : Types::JwtKey? = nil
        )
        end
      end

      # The JWT key stored in Amazon Web Services Secrets Manager for Slurm REST API authentication.

      struct JwtKey
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret containing the JWT
        # key.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        # The version of the Amazon Web Services Secrets Manager secret containing the JWT key.

        @[JSON::Field(key: "secretVersion")]
        getter secret_version : String

        def initialize(
          @secret_arn : String,
          @secret_version : String
        )
        end
      end


      struct ListClustersRequest
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 10 results, and the maximum allowed page size is 100 results. A
        # value of 0 uses the default.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The value of nextToken is a unique pagination token for each page of results returned. If nextToken
        # is returned, there are more results available. Make the call again using the returned token to
        # retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24
        # hours. Using an expired pagination token returns an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClustersResponse
        include JSON::Serializable

        # The list of clusters.

        @[JSON::Field(key: "clusters")]
        getter clusters : Array(Types::ClusterSummary)

        # The value of nextToken is a unique pagination token for each page of results returned. If nextToken
        # is returned, there are more results available. Make the call again using the returned token to
        # retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24
        # hours. Using an expired pagination token returns an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(Types::ClusterSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListComputeNodeGroupsRequest
        include JSON::Serializable

        # The name or ID of the cluster to list compute node groups for.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 10 results, and the maximum allowed page size is 100 results. A
        # value of 0 uses the default.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The value of nextToken is a unique pagination token for each page of results returned. If nextToken
        # is returned, there are more results available. Make the call again using the returned token to
        # retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24
        # hours. Using an expired pagination token returns an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListComputeNodeGroupsResponse
        include JSON::Serializable

        # The list of compute node groups for the cluster.

        @[JSON::Field(key: "computeNodeGroups")]
        getter compute_node_groups : Array(Types::ComputeNodeGroupSummary)

        # The value of nextToken is a unique pagination token for each page of results returned. If nextToken
        # is returned, there are more results available. Make the call again using the returned token to
        # retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24
        # hours. Using an expired pagination token returns an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @compute_node_groups : Array(Types::ComputeNodeGroupSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListQueuesRequest
        include JSON::Serializable

        # The name or ID of the cluster to list queues for.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 10 results, and the maximum allowed page size is 100 results. A
        # value of 0 uses the default.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The value of nextToken is a unique pagination token for each page of results returned. If nextToken
        # is returned, there are more results available. Make the call again using the returned token to
        # retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24
        # hours. Using an expired pagination token returns an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListQueuesResponse
        include JSON::Serializable

        # The list of queues associated with the cluster.

        @[JSON::Field(key: "queues")]
        getter queues : Array(Types::QueueSummary)

        # The value of nextToken is a unique pagination token for each page of results returned. If nextToken
        # is returned, there are more results available. Make the call again using the returned token to
        # retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24
        # hours. Using an expired pagination token returns an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @queues : Array(Types::QueueSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which to list tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # 1 or more tags added to the resource. Each tag consists of a tag key and tag value. The tag value is
        # optional and can be an empty string.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The networking configuration for the cluster's control plane.

      struct Networking
        include JSON::Serializable

        # The IP address version the cluster uses. The default is IPV4 .

        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # The list of security group IDs associated with the Elastic Network Interface (ENI) created in
        # subnets. The following rules are required: Inbound rule 1 Protocol: All Ports: All Source: Self
        # Outbound rule 1 Protocol: All Ports: All Destination: 0.0.0.0/0 (IPv4) or ::/0 (IPv6) Outbound rule
        # 2 Protocol: All Ports: All Destination: Self

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The ID of the subnet where PCS creates an Elastic Network Interface (ENI) to enable communication
        # between managed controllers and PCS resources. The subnet must have an available IP address, cannot
        # reside in Outposts, Wavelength, or an Amazon Web Services Local Zone. Example: subnet-abcd1234

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @network_type : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # The networking configuration for the cluster's control plane.

      struct NetworkingRequest
        include JSON::Serializable

        # The IP address version the cluster uses. The default is IPV4 .

        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # A list of security group IDs associated with the Elastic Network Interface (ENI) created in subnets.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The list of subnet IDs where PCS creates an Elastic Network Interface (ENI) to enable communication
        # between managed controllers and PCS resources. Subnet IDs have the form subnet-0123456789abcdef0 .
        # Subnets can't be in Outposts, Wavelength or an Amazon Web Services Local Zone. PCS currently
        # supports only 1 subnet in this list.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @network_type : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # A queue resource.

      struct Queue
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the queue.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the cluster of the queue.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        # The list of compute node group configurations associated with the queue. Queues assign jobs to
        # associated compute node groups.

        @[JSON::Field(key: "computeNodeGroupConfigurations")]
        getter compute_node_group_configurations : Array(Types::ComputeNodeGroupConfiguration)

        # The date and time the resource was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The generated unique ID of the queue.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the resource was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time

        # The name that identifies the queue.

        @[JSON::Field(key: "name")]
        getter name : String

        # The provisioning status of the queue. The provisioning status doesn't indicate the overall health of
        # the queue. The resource enters the SUSPENDING and SUSPENDED states when the scheduler is beyond end
        # of life and we have suspended the cluster. When in these states, you can't use the cluster. The
        # cluster controller is down and all compute instances are terminated. The resources still count
        # toward your service quotas. You can delete a resource if its status is SUSPENDED . For more
        # information, see Frequently asked questions about Slurm versions in PCS in the PCS User Guide .

        @[JSON::Field(key: "status")]
        getter status : String

        # The list of errors that occurred during queue provisioning.

        @[JSON::Field(key: "errorInfo")]
        getter error_info : Array(Types::ErrorInfo)?

        # Additional options related to the Slurm scheduler.

        @[JSON::Field(key: "slurmConfiguration")]
        getter slurm_configuration : Types::QueueSlurmConfiguration?

        def initialize(
          @arn : String,
          @cluster_id : String,
          @compute_node_group_configurations : Array(Types::ComputeNodeGroupConfiguration),
          @created_at : Time,
          @id : String,
          @modified_at : Time,
          @name : String,
          @status : String,
          @error_info : Array(Types::ErrorInfo)? = nil,
          @slurm_configuration : Types::QueueSlurmConfiguration? = nil
        )
        end
      end

      # Additional options related to the Slurm scheduler.

      struct QueueSlurmConfiguration
        include JSON::Serializable

        # Additional Slurm-specific configuration that directly maps to Slurm settings.

        @[JSON::Field(key: "slurmCustomSettings")]
        getter slurm_custom_settings : Array(Types::SlurmCustomSetting)?

        def initialize(
          @slurm_custom_settings : Array(Types::SlurmCustomSetting)? = nil
        )
        end
      end

      # Additional options related to the Slurm scheduler.

      struct QueueSlurmConfigurationRequest
        include JSON::Serializable

        # Additional Slurm-specific configuration that directly maps to Slurm settings.

        @[JSON::Field(key: "slurmCustomSettings")]
        getter slurm_custom_settings : Array(Types::SlurmCustomSetting)?

        def initialize(
          @slurm_custom_settings : Array(Types::SlurmCustomSetting)? = nil
        )
        end
      end

      # The object returned by the ListQueues API action.

      struct QueueSummary
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the queue.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the cluster of the queue.

        @[JSON::Field(key: "clusterId")]
        getter cluster_id : String

        # The date and time the resource was created.

        @[JSON::Field(key: "createdAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The generated unique ID of the queue.

        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time the resource was modified.

        @[JSON::Field(key: "modifiedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter modified_at : Time

        # The name that identifies the queue.

        @[JSON::Field(key: "name")]
        getter name : String

        # The provisioning status of the queue. The provisioning status doesn't indicate the overall health of
        # the queue. The resource enters the SUSPENDING and SUSPENDED states when the scheduler is beyond end
        # of life and we have suspended the cluster. When in these states, you can't use the cluster. The
        # cluster controller is down and all compute instances are terminated. The resources still count
        # toward your service quotas. You can delete a resource if its status is SUSPENDED . For more
        # information, see Frequently asked questions about Slurm versions in PCS in the PCS User Guide .

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @arn : String,
          @cluster_id : String,
          @created_at : Time,
          @id : String,
          @modified_at : Time,
          @name : String,
          @status : String
        )
        end
      end


      struct RegisterComputeNodeGroupInstanceRequest
        include JSON::Serializable

        # The client-generated token to allow for retries.

        @[JSON::Field(key: "bootstrapId")]
        getter bootstrap_id : String

        # The name or ID of the cluster to register the compute node group instance in.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @bootstrap_id : String,
          @cluster_identifier : String
        )
        end
      end


      struct RegisterComputeNodeGroupInstanceResponse
        include JSON::Serializable

        # The list of endpoints available for interaction with the scheduler.

        @[JSON::Field(key: "endpoints")]
        getter endpoints : Array(Types::Endpoint)

        # The scheduler node ID for this instance.

        @[JSON::Field(key: "nodeID")]
        getter node_id : String

        # For the Slurm scheduler, this is the shared Munge key the scheduler uses to authenticate compute
        # node group instances.

        @[JSON::Field(key: "sharedSecret")]
        getter shared_secret : String

        def initialize(
          @endpoints : Array(Types::Endpoint),
          @node_id : String,
          @shared_secret : String
        )
        end
      end

      # The requested resource can't be found. The cluster, node group, or queue you're attempting to get,
      # update, list, or delete doesn't exist. Examples

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The unique identifier of the resource that was not found.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type or category of the resource that was not found.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Specifies the boundaries of the compute node group auto scaling.

      struct ScalingConfiguration
        include JSON::Serializable

        # The upper bound of the number of instances allowed in the compute fleet.

        @[JSON::Field(key: "maxInstanceCount")]
        getter max_instance_count : Int32

        # The lower bound of the number of instances allowed in the compute fleet.

        @[JSON::Field(key: "minInstanceCount")]
        getter min_instance_count : Int32

        def initialize(
          @max_instance_count : Int32,
          @min_instance_count : Int32
        )
        end
      end

      # Specifies the boundaries of the compute node group auto scaling.

      struct ScalingConfigurationRequest
        include JSON::Serializable

        # The upper bound of the number of instances allowed in the compute fleet.

        @[JSON::Field(key: "maxInstanceCount")]
        getter max_instance_count : Int32

        # The lower bound of the number of instances allowed in the compute fleet.

        @[JSON::Field(key: "minInstanceCount")]
        getter min_instance_count : Int32

        def initialize(
          @max_instance_count : Int32,
          @min_instance_count : Int32
        )
        end
      end

      # The cluster management and job scheduling software associated with the cluster.

      struct Scheduler
        include JSON::Serializable

        # The software PCS uses to manage cluster scaling and job scheduling.

        @[JSON::Field(key: "type")]
        getter type : String

        # The version of the specified scheduling software that PCS uses to manage cluster scaling and job
        # scheduling. For more information, see Slurm versions in PCS in the PCS User Guide . Valid Values:
        # 23.11 | 24.05 | 24.11

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @type : String,
          @version : String
        )
        end
      end

      # The cluster management and job scheduling software associated with the cluster.

      struct SchedulerRequest
        include JSON::Serializable

        # The software PCS uses to manage cluster scaling and job scheduling.

        @[JSON::Field(key: "type")]
        getter type : String

        # The version of the specified scheduling software that PCS uses to manage cluster scaling and job
        # scheduling. For more information, see Slurm versions in PCS in the PCS User Guide . Valid Values:
        # 23.11 | 24.05 | 24.11

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @type : String,
          @version : String
        )
        end
      end

      # You exceeded your service quota. Service quotas, also referred to as limits, are the maximum number
      # of service resources or operations for your Amazon Web Services account. To learn how to increase
      # your service quota, see Requesting a quota increase in the Service Quotas User Guide Examples The
      # max number of clusters or queues has been reached for the account. The max number of compute node
      # groups has been reached for the associated cluster. The total of maxInstances across all compute
      # node groups has been reached for associated cluster.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The service code associated with the quota that was exceeded.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The quota code of the service quota that was exceeded.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The unique identifier of the resource that caused the quota to be exceeded.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type or category of the resource that caused the quota to be exceeded.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @service_code : String,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The shared Slurm key for authentication, also known as the cluster secret .

      struct SlurmAuthKey
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the shared Slurm key.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        # The version of the shared Slurm key.

        @[JSON::Field(key: "secretVersion")]
        getter secret_version : String

        def initialize(
          @secret_arn : String,
          @secret_version : String
        )
        end
      end

      # Additional settings that directly map to Slurm settings. PCS supports a subset of Slurm settings.
      # For more information, see Configuring custom Slurm settings in PCS in the PCS User Guide .

      struct SlurmCustomSetting
        include JSON::Serializable

        # PCS supports custom Slurm settings for clusters, compute node groups, and queues. For more
        # information, see Configuring custom Slurm settings in PCS in the PCS User Guide .

        @[JSON::Field(key: "parameterName")]
        getter parameter_name : String

        # The values for the configured Slurm settings.

        @[JSON::Field(key: "parameterValue")]
        getter parameter_value : String

        def initialize(
          @parameter_name : String,
          @parameter_value : String
        )
        end
      end

      # The Slurm REST API configuration includes settings for enabling and configuring the Slurm REST API.
      # It's a property of the ClusterSlurmConfiguration object.

      struct SlurmRest
        include JSON::Serializable

        # The default value for mode is NONE . A value of STANDARD means the Slurm REST API is enabled.

        @[JSON::Field(key: "mode")]
        getter mode : String

        def initialize(
          @mode : String
        )
        end
      end

      # The Slurm REST API configuration includes settings for enabling and configuring the Slurm REST API.
      # It's a property of the ClusterSlurmConfiguration object.

      struct SlurmRestRequest
        include JSON::Serializable

        # The default value for mode is NONE . A value of STANDARD means the Slurm REST API is enabled.

        @[JSON::Field(key: "mode")]
        getter mode : String

        def initialize(
          @mode : String
        )
        end
      end

      # Additional configuration when you specify SPOT as the purchaseOption for the CreateComputeNodeGroup
      # API action.

      struct SpotOptions
        include JSON::Serializable

        # The Amazon EC2 allocation strategy PCS uses to provision EC2 instances. PCS supports lowest price ,
        # capacity optimized , and price capacity optimized . For more information, see Use allocation
        # strategies to determine how EC2 Fleet or Spot Fleet fulfills Spot and On-Demand capacity in the
        # Amazon Elastic Compute Cloud User Guide . If you don't provide this option, it defaults to price
        # capacity optimized .

        @[JSON::Field(key: "allocationStrategy")]
        getter allocation_strategy : String?

        def initialize(
          @allocation_strategy : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # 1 or more tags added to the resource. Each tag consists of a tag key and tag value. The tag value is
        # optional and can be an empty string.

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

      # Your request exceeded a request rate quota. Check the resource's request rate quota and try again.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying the request.

        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # 1 or more tag keys to remove from the resource. Specify only tag keys and not tag values.

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

      # The accounting configuration includes configurable settings for Slurm accounting.

      struct UpdateAccountingRequest
        include JSON::Serializable

        # The default value for all purge settings for slurmdbd.conf . For more information, see the
        # slurmdbd.conf documentation at SchedMD . The default value for defaultPurgeTimeInDays is -1 . A
        # value of -1 means there is no purge time and records persist as long as the cluster exists. 0 isn't
        # a valid value.

        @[JSON::Field(key: "defaultPurgeTimeInDays")]
        getter default_purge_time_in_days : Int32?

        # The default value for mode is NONE . A value of STANDARD means Slurm accounting is enabled.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        def initialize(
          @default_purge_time_in_days : Int32? = nil,
          @mode : String? = nil
        )
        end
      end


      struct UpdateClusterRequest
        include JSON::Serializable

        # The name or ID of the cluster to update.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the CLI and SDK automatically generate 1 for you.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Additional options related to the Slurm scheduler.

        @[JSON::Field(key: "slurmConfiguration")]
        getter slurm_configuration : Types::UpdateClusterSlurmConfigurationRequest?

        def initialize(
          @cluster_identifier : String,
          @client_token : String? = nil,
          @slurm_configuration : Types::UpdateClusterSlurmConfigurationRequest? = nil
        )
        end
      end


      struct UpdateClusterResponse
        include JSON::Serializable


        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # Additional options related to the Slurm scheduler.

      struct UpdateClusterSlurmConfigurationRequest
        include JSON::Serializable

        # The accounting configuration includes configurable settings for Slurm accounting.

        @[JSON::Field(key: "accounting")]
        getter accounting : Types::UpdateAccountingRequest?

        # The time (in seconds) before an idle node is scaled down. Default: 600

        @[JSON::Field(key: "scaleDownIdleTimeInSeconds")]
        getter scale_down_idle_time_in_seconds : Int32?

        # Additional Slurm-specific configuration that directly maps to Slurm settings.

        @[JSON::Field(key: "slurmCustomSettings")]
        getter slurm_custom_settings : Array(Types::SlurmCustomSetting)?

        # The Slurm REST API configuration for the cluster.

        @[JSON::Field(key: "slurmRest")]
        getter slurm_rest : Types::UpdateSlurmRestRequest?

        def initialize(
          @accounting : Types::UpdateAccountingRequest? = nil,
          @scale_down_idle_time_in_seconds : Int32? = nil,
          @slurm_custom_settings : Array(Types::SlurmCustomSetting)? = nil,
          @slurm_rest : Types::UpdateSlurmRestRequest? = nil
        )
        end
      end


      struct UpdateComputeNodeGroupRequest
        include JSON::Serializable

        # The name or ID of the cluster of the compute node group.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # The name or ID of the compute node group.

        @[JSON::Field(key: "computeNodeGroupIdentifier")]
        getter compute_node_group_identifier : String

        # The ID of the Amazon Machine Image (AMI) that PCS uses to launch instances. If not provided, PCS
        # uses the AMI ID specified in the custom launch template.

        @[JSON::Field(key: "amiId")]
        getter ami_id : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the CLI and SDK automatically generate 1 for you.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "customLaunchTemplate")]
        getter custom_launch_template : Types::CustomLaunchTemplate?

        # The Amazon Resource Name (ARN) of the IAM instance profile used to pass an IAM role when launching
        # EC2 instances. The role contained in your instance profile must have the
        # pcs:RegisterComputeNodeGroupInstance permission and the role name must start with AWSPCS or must
        # have the path /aws-pcs/ . For more information, see IAM instance profiles for PCS in the PCS User
        # Guide .

        @[JSON::Field(key: "iamInstanceProfileArn")]
        getter iam_instance_profile_arn : String?

        # Specifies how EC2 instances are purchased on your behalf. PCS supports On-Demand Instances, Spot
        # Instances, and Amazon EC2 Capacity Blocks for ML. For more information, see Amazon EC2 billing and
        # purchasing options in the Amazon Elastic Compute Cloud User Guide . For more information about PCS
        # support for Capacity Blocks, see Using Amazon EC2 Capacity Blocks for ML with PCS in the PCS User
        # Guide . If you don't provide this option, it defaults to On-Demand.

        @[JSON::Field(key: "purchaseOption")]
        getter purchase_option : String?

        # Specifies the boundaries of the compute node group auto scaling.

        @[JSON::Field(key: "scalingConfiguration")]
        getter scaling_configuration : Types::ScalingConfigurationRequest?

        # Additional options related to the Slurm scheduler.

        @[JSON::Field(key: "slurmConfiguration")]
        getter slurm_configuration : Types::UpdateComputeNodeGroupSlurmConfigurationRequest?


        @[JSON::Field(key: "spotOptions")]
        getter spot_options : Types::SpotOptions?

        # The list of subnet IDs where the compute node group provisions instances. The subnets must be in the
        # same VPC as the cluster.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @cluster_identifier : String,
          @compute_node_group_identifier : String,
          @ami_id : String? = nil,
          @client_token : String? = nil,
          @custom_launch_template : Types::CustomLaunchTemplate? = nil,
          @iam_instance_profile_arn : String? = nil,
          @purchase_option : String? = nil,
          @scaling_configuration : Types::ScalingConfigurationRequest? = nil,
          @slurm_configuration : Types::UpdateComputeNodeGroupSlurmConfigurationRequest? = nil,
          @spot_options : Types::SpotOptions? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end


      struct UpdateComputeNodeGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "computeNodeGroup")]
        getter compute_node_group : Types::ComputeNodeGroup?

        def initialize(
          @compute_node_group : Types::ComputeNodeGroup? = nil
        )
        end
      end

      # Additional options related to the Slurm scheduler.

      struct UpdateComputeNodeGroupSlurmConfigurationRequest
        include JSON::Serializable

        # Additional Slurm-specific configuration that directly maps to Slurm settings.

        @[JSON::Field(key: "slurmCustomSettings")]
        getter slurm_custom_settings : Array(Types::SlurmCustomSetting)?

        def initialize(
          @slurm_custom_settings : Array(Types::SlurmCustomSetting)? = nil
        )
        end
      end


      struct UpdateQueueRequest
        include JSON::Serializable

        # The name or ID of the cluster of the queue.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        # The name or ID of the queue.

        @[JSON::Field(key: "queueIdentifier")]
        getter queue_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the CLI and SDK automatically generate 1 for you.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The list of compute node group configurations to associate with the queue. Queues assign jobs to
        # associated compute node groups.

        @[JSON::Field(key: "computeNodeGroupConfigurations")]
        getter compute_node_group_configurations : Array(Types::ComputeNodeGroupConfiguration)?

        # Additional options related to the Slurm scheduler.

        @[JSON::Field(key: "slurmConfiguration")]
        getter slurm_configuration : Types::UpdateQueueSlurmConfigurationRequest?

        def initialize(
          @cluster_identifier : String,
          @queue_identifier : String,
          @client_token : String? = nil,
          @compute_node_group_configurations : Array(Types::ComputeNodeGroupConfiguration)? = nil,
          @slurm_configuration : Types::UpdateQueueSlurmConfigurationRequest? = nil
        )
        end
      end


      struct UpdateQueueResponse
        include JSON::Serializable


        @[JSON::Field(key: "queue")]
        getter queue : Types::Queue?

        def initialize(
          @queue : Types::Queue? = nil
        )
        end
      end

      # Additional options related to the Slurm scheduler.

      struct UpdateQueueSlurmConfigurationRequest
        include JSON::Serializable

        # Additional Slurm-specific configuration that directly maps to Slurm settings.

        @[JSON::Field(key: "slurmCustomSettings")]
        getter slurm_custom_settings : Array(Types::SlurmCustomSetting)?

        def initialize(
          @slurm_custom_settings : Array(Types::SlurmCustomSetting)? = nil
        )
        end
      end

      # The Slurm REST API configuration includes settings for enabling and configuring the Slurm REST API.

      struct UpdateSlurmRestRequest
        include JSON::Serializable

        # The default value for mode is NONE . A value of STANDARD means the Slurm REST API is enabled.

        @[JSON::Field(key: "mode")]
        getter mode : String?

        def initialize(
          @mode : String? = nil
        )
        end
      end

      # The request isn't valid. Examples Your request contains malformed JSON or unsupported characters.
      # The scheduler version isn't supported. There are networking related errors, such as network
      # validation failure. AMI type is CUSTOM and the launch template doesn't define the AMI ID, or the AMI
      # type is AL2 and the launch template defines the AMI.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The specific reason or cause of the validation error.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # A list of fields or properties that failed validation.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Stores information about a field in a request that caused an exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # The message body of the exception.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the exception.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
