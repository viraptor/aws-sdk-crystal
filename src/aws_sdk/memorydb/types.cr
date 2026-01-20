require "json"
require "time"

module AwsSdk
  module MemoryDB
    module Types

      # An Access Control List. You can authenticate users with Access Contol Lists. ACLs enable you to
      # control cluster access by grouping users. These Access control lists are designed as a way to
      # organize access to clusters.

      struct ACL
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ACL

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A list of clusters associated with the ACL.

        @[JSON::Field(key: "Clusters")]
        getter clusters : Array(String)?

        # The minimum engine version supported for the ACL

        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # The name of the Access Control List

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of updates being applied to the ACL.

        @[JSON::Field(key: "PendingChanges")]
        getter pending_changes : Types::ACLPendingChanges?

        # Indicates ACL status. Can be "creating", "active", "modifying", "deleting".

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The list of user names that belong to the ACL.

        @[JSON::Field(key: "UserNames")]
        getter user_names : Array(String)?

        def initialize(
          @arn : String? = nil,
          @clusters : Array(String)? = nil,
          @minimum_engine_version : String? = nil,
          @name : String? = nil,
          @pending_changes : Types::ACLPendingChanges? = nil,
          @status : String? = nil,
          @user_names : Array(String)? = nil
        )
        end
      end

      # An ACL with the specified name already exists.

      struct ACLAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified ACL does not exist.

      struct ACLNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Returns the updates being applied to the ACL.

      struct ACLPendingChanges
        include JSON::Serializable

        # A list of users being added to the ACL

        @[JSON::Field(key: "UserNamesToAdd")]
        getter user_names_to_add : Array(String)?

        # A list of user names being removed from the ACL

        @[JSON::Field(key: "UserNamesToRemove")]
        getter user_names_to_remove : Array(String)?

        def initialize(
          @user_names_to_add : Array(String)? = nil,
          @user_names_to_remove : Array(String)? = nil
        )
        end
      end

      # The request cannot be processed because it would exceed the maximum number of ACLs allowed.

      struct ACLQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The status of the ACL update

      struct ACLsUpdateStatus
        include JSON::Serializable

        # A list of ACLs pending to be applied.

        @[JSON::Field(key: "ACLToApply")]
        getter acl_to_apply : String?

        def initialize(
          @acl_to_apply : String? = nil
        )
        end
      end

      # The customer has exceeded the maximum number of API requests allowed per time period.

      struct APICallRateForCustomerExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Denotes the user's authentication properties, such as whether it requires a password to
      # authenticate. Used in output responses.

      struct Authentication
        include JSON::Serializable

        # The number of passwords belonging to the user. The maximum is two.

        @[JSON::Field(key: "PasswordCount")]
        getter password_count : Int32?

        # Indicates whether the user requires a password to authenticate.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @password_count : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # Denotes the user's authentication properties, such as whether it requires a password to
      # authenticate. Used in output responses.

      struct AuthenticationMode
        include JSON::Serializable

        # The password(s) used for authentication

        @[JSON::Field(key: "Passwords")]
        getter passwords : Array(String)?

        # Indicates whether the user requires a password to authenticate. All newly-created users require a
        # password.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @passwords : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Indicates if the cluster has a Multi-AZ configuration (multiaz) or not (singleaz).

      struct AvailabilityZone
        include JSON::Serializable

        # The name of the Availability Zone.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end


      struct BatchUpdateClusterRequest
        include JSON::Serializable

        # The cluster names to apply the updates.

        @[JSON::Field(key: "ClusterNames")]
        getter cluster_names : Array(String)

        # The unique ID of the service update

        @[JSON::Field(key: "ServiceUpdate")]
        getter service_update : Types::ServiceUpdateRequest?

        def initialize(
          @cluster_names : Array(String),
          @service_update : Types::ServiceUpdateRequest? = nil
        )
        end
      end


      struct BatchUpdateClusterResponse
        include JSON::Serializable

        # The list of clusters that have been updated.

        @[JSON::Field(key: "ProcessedClusters")]
        getter processed_clusters : Array(Types::Cluster)?

        # The list of clusters where updates have not been applied.

        @[JSON::Field(key: "UnprocessedClusters")]
        getter unprocessed_clusters : Array(Types::UnprocessedCluster)?

        def initialize(
          @processed_clusters : Array(Types::Cluster)? = nil,
          @unprocessed_clusters : Array(Types::UnprocessedCluster)? = nil
        )
        end
      end

      # Contains all of the attributes of a specific cluster.

      struct Cluster
        include JSON::Serializable

        # The name of the Access Control List associated with this cluster.

        @[JSON::Field(key: "ACLName")]
        getter acl_name : String?

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # When set to true, the cluster will automatically receive minor engine version upgrades after launch.

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Indicates if the cluster has a Multi-AZ configuration (multiaz) or not (singleaz).

        @[JSON::Field(key: "AvailabilityMode")]
        getter availability_mode : String?

        # The cluster's configuration endpoint

        @[JSON::Field(key: "ClusterEndpoint")]
        getter cluster_endpoint : Types::Endpoint?

        # Enables data tiering. Data tiering is only supported for clusters using the r6gd node type. This
        # parameter must be set when using r6gd nodes. For more information, see Data tiering .

        @[JSON::Field(key: "DataTiering")]
        getter data_tiering : String?

        # A description of the cluster

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the engine used by the cluster.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The Redis OSS engine patch version used by the cluster

        @[JSON::Field(key: "EnginePatchVersion")]
        getter engine_patch_version : String?

        # The Redis OSS engine version used by the cluster

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The mechanism that the cluster uses to discover IP addresses. Returns 'ipv4' when DNS endpoints
        # resolve to IPv4 addresses, or 'ipv6' when DNS endpoints resolve to IPv6 addresses.

        @[JSON::Field(key: "IpDiscovery")]
        getter ip_discovery : String?

        # The ID of the KMS key used to encrypt the cluster

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the weekly time range during which maintenance on the cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period.

        @[JSON::Field(key: "MaintenanceWindow")]
        getter maintenance_window : String?

        # The name of the multi-Region cluster that this cluster belongs to.

        @[JSON::Field(key: "MultiRegionClusterName")]
        getter multi_region_cluster_name : String?

        # The user-supplied name of the cluster. This identifier is a unique key that identifies a cluster.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The IP address type for the cluster. Returns 'ipv4' for IPv4 only, 'ipv6' for IPv6 only, or
        # 'dual-stack' if the cluster supports both IPv4 and IPv6 addressing.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The cluster's node type

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The number of shards in the cluster

        @[JSON::Field(key: "NumberOfShards")]
        getter number_of_shards : Int32?

        # The name of the parameter group used by the cluster

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        # The status of the parameter group used by the cluster, for example 'active' or 'applying'.

        @[JSON::Field(key: "ParameterGroupStatus")]
        getter parameter_group_status : String?

        # A group of settings that are currently being applied.

        @[JSON::Field(key: "PendingUpdates")]
        getter pending_updates : Types::ClusterPendingUpdates?

        # A list of security groups used by the cluster

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(Types::SecurityGroupMembership)?

        # A list of shards that are members of the cluster.

        @[JSON::Field(key: "Shards")]
        getter shards : Array(Types::Shard)?

        # The number of days for which MemoryDB retains automatic snapshots before deleting them. For example,
        # if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for 5 days
        # before being deleted.

        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The daily time range (in UTC) during which MemoryDB begins taking a daily snapshot of your shard.
        # Example: 05:00-09:00 If you do not specify this parameter, MemoryDB automatically chooses an
        # appropriate time range.

        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # The Amazon Resource Name (ARN) of the SNS notification topic

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The SNS topic must be in Active status to receive notifications

        @[JSON::Field(key: "SnsTopicStatus")]
        getter sns_topic_status : String?

        # The status of the cluster. For example, Available, Updating, Creating.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The name of the subnet group used by the cluster

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String?

        # A flag to indicate if In-transit encryption is enabled

        @[JSON::Field(key: "TLSEnabled")]
        getter tls_enabled : Bool?

        def initialize(
          @acl_name : String? = nil,
          @arn : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @availability_mode : String? = nil,
          @cluster_endpoint : Types::Endpoint? = nil,
          @data_tiering : String? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @engine_patch_version : String? = nil,
          @engine_version : String? = nil,
          @ip_discovery : String? = nil,
          @kms_key_id : String? = nil,
          @maintenance_window : String? = nil,
          @multi_region_cluster_name : String? = nil,
          @name : String? = nil,
          @network_type : String? = nil,
          @node_type : String? = nil,
          @number_of_shards : Int32? = nil,
          @parameter_group_name : String? = nil,
          @parameter_group_status : String? = nil,
          @pending_updates : Types::ClusterPendingUpdates? = nil,
          @security_groups : Array(Types::SecurityGroupMembership)? = nil,
          @shards : Array(Types::Shard)? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil,
          @sns_topic_arn : String? = nil,
          @sns_topic_status : String? = nil,
          @status : String? = nil,
          @subnet_group_name : String? = nil,
          @tls_enabled : Bool? = nil
        )
        end
      end

      # A cluster with the specified name already exists.

      struct ClusterAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # A list of cluster configuration options.

      struct ClusterConfiguration
        include JSON::Serializable

        # The description of the cluster configuration

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the engine used by the cluster configuration.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The Redis OSS engine version used by the cluster

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The specified maintenance window for the cluster

        @[JSON::Field(key: "MaintenanceWindow")]
        getter maintenance_window : String?

        # The name for the multi-Region cluster associated with the cluster configuration.

        @[JSON::Field(key: "MultiRegionClusterName")]
        getter multi_region_cluster_name : String?

        # The name of the multi-Region parameter group associated with the cluster configuration.

        @[JSON::Field(key: "MultiRegionParameterGroupName")]
        getter multi_region_parameter_group_name : String?

        # The name of the cluster

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The node type used for the cluster

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The number of shards in the cluster

        @[JSON::Field(key: "NumShards")]
        getter num_shards : Int32?

        # The name of parameter group used by the cluster

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        # The port used by the cluster

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The list of shards in the cluster

        @[JSON::Field(key: "Shards")]
        getter shards : Array(Types::ShardDetail)?

        # The snapshot retention limit set by the cluster

        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The snapshot window set by the cluster

        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # The name of the subnet group used by the cluster

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String?

        # The Amazon Resource Name (ARN) of the SNS notification topic for the cluster

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        # The ID of the VPC the cluster belongs to

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @description : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @maintenance_window : String? = nil,
          @multi_region_cluster_name : String? = nil,
          @multi_region_parameter_group_name : String? = nil,
          @name : String? = nil,
          @node_type : String? = nil,
          @num_shards : Int32? = nil,
          @parameter_group_name : String? = nil,
          @port : Int32? = nil,
          @shards : Array(Types::ShardDetail)? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil,
          @subnet_group_name : String? = nil,
          @topic_arn : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The specified cluster does not exist.

      struct ClusterNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # A list of updates being applied to the cluster

      struct ClusterPendingUpdates
        include JSON::Serializable

        # A list of ACLs associated with the cluster that are being updated

        @[JSON::Field(key: "ACLs")]
        getter ac_ls : Types::ACLsUpdateStatus?

        # The status of an online resharding operation.

        @[JSON::Field(key: "Resharding")]
        getter resharding : Types::ReshardingStatus?

        # A list of service updates being applied to the cluster

        @[JSON::Field(key: "ServiceUpdates")]
        getter service_updates : Array(Types::PendingModifiedServiceUpdate)?

        def initialize(
          @ac_ls : Types::ACLsUpdateStatus? = nil,
          @resharding : Types::ReshardingStatus? = nil,
          @service_updates : Array(Types::PendingModifiedServiceUpdate)? = nil
        )
        end
      end

      # The request cannot be processed because it would exceed the maximum number of clusters allowed for
      # this customer.

      struct ClusterQuotaForCustomerExceededFault
        include JSON::Serializable

        def initialize
        end
      end


      struct CopySnapshotRequest
        include JSON::Serializable

        # The name of an existing snapshot from which to make a copy.

        @[JSON::Field(key: "SourceSnapshotName")]
        getter source_snapshot_name : String

        # A name for the snapshot copy. MemoryDB does not permit overwriting a snapshot, therefore this name
        # must be unique within its context - MemoryDB or an Amazon S3 bucket if exporting.

        @[JSON::Field(key: "TargetSnapshotName")]
        getter target_snapshot_name : String

        # The ID of the KMS key used to encrypt the target snapshot.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon S3 bucket to which the snapshot is exported. This parameter is used only when exporting a
        # snapshot for external access. When using this parameter to export a snapshot, be sure MemoryDB has
        # the needed permissions to this S3 bucket. For more information, see Step 2: Grant MemoryDB Access to
        # Your Amazon S3 Bucket .

        @[JSON::Field(key: "TargetBucket")]
        getter target_bucket : String?

        def initialize(
          @source_snapshot_name : String,
          @target_snapshot_name : String,
          @kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @target_bucket : String? = nil
        )
        end
      end


      struct CopySnapshotResponse
        include JSON::Serializable

        # Represents a copy of an entire cluster as of the time when the snapshot was taken.

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end


      struct CreateACLRequest
        include JSON::Serializable

        # The name of the Access Control List.

        @[JSON::Field(key: "ACLName")]
        getter acl_name : String

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The list of users that belong to the Access Control List.

        @[JSON::Field(key: "UserNames")]
        getter user_names : Array(String)?

        def initialize(
          @acl_name : String,
          @tags : Array(Types::Tag)? = nil,
          @user_names : Array(String)? = nil
        )
        end
      end


      struct CreateACLResponse
        include JSON::Serializable

        # The newly-created Access Control List.

        @[JSON::Field(key: "ACL")]
        getter acl : Types::ACL?

        def initialize(
          @acl : Types::ACL? = nil
        )
        end
      end


      struct CreateClusterRequest
        include JSON::Serializable

        # The name of the Access Control List to associate with the cluster.

        @[JSON::Field(key: "ACLName")]
        getter acl_name : String

        # The name of the cluster. This value must be unique as it also serves as the cluster identifier.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # The compute and memory capacity of the nodes in the cluster.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String

        # When set to true, the cluster will automatically receive minor engine version upgrades after launch.

        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Enables data tiering. Data tiering is only supported for clusters using the r6gd node type. This
        # parameter must be set when using r6gd nodes. For more information, see Data tiering .

        @[JSON::Field(key: "DataTiering")]
        getter data_tiering : Bool?

        # An optional description of the cluster.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the engine to be used for the cluster.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version number of the Redis OSS engine to be used for the cluster.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The mechanism for discovering IP addresses for the cluster discovery protocol. Valid values are
        # 'ipv4' or 'ipv6'. When set to 'ipv4', cluster discovery functions such as cluster slots, cluster
        # shards, and cluster nodes return IPv4 addresses for cluster nodes. When set to 'ipv6', the cluster
        # discovery functions return IPv6 addresses for cluster nodes. The value must be compatible with the
        # NetworkType parameter. If not specified, the default is 'ipv4'.

        @[JSON::Field(key: "IpDiscovery")]
        getter ip_discovery : String?

        # The ID of the KMS key used to encrypt the cluster.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the weekly time range during which maintenance on the cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period. Valid values for ddd are: sun mon tue wed thu fri sat Example:
        # sun:23:00-mon:01:30

        @[JSON::Field(key: "MaintenanceWindow")]
        getter maintenance_window : String?

        # The name of the multi-Region cluster to be created.

        @[JSON::Field(key: "MultiRegionClusterName")]
        getter multi_region_cluster_name : String?

        # Specifies the IP address type for the cluster. Valid values are 'ipv4', 'ipv6', or 'dual_stack'.
        # When set to 'ipv4', the cluster will only be accessible via IPv4 addresses. When set to 'ipv6', the
        # cluster will only be accessible via IPv6 addresses. When set to 'dual_stack', the cluster will be
        # accessible via both IPv4 and IPv6 addresses. If not specified, the default is 'ipv4'.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The number of replicas to apply to each shard. The default value is 1. The maximum is 5.

        @[JSON::Field(key: "NumReplicasPerShard")]
        getter num_replicas_per_shard : Int32?

        # The number of shards the cluster will contain. The default value is 1.

        @[JSON::Field(key: "NumShards")]
        getter num_shards : Int32?

        # The name of the parameter group associated with the cluster.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        # The port number on which each of the nodes accepts connections.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # A list of security group names to associate with this cluster.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of Amazon Resource Names (ARN) that uniquely identify the RDB snapshot files stored in Amazon
        # S3. The snapshot files are used to populate the new cluster. The Amazon S3 object name in the ARN
        # cannot contain any commas.

        @[JSON::Field(key: "SnapshotArns")]
        getter snapshot_arns : Array(String)?

        # The name of a snapshot from which to restore data into the new cluster. The snapshot status changes
        # to restoring while the new cluster is being created.

        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String?

        # The number of days for which MemoryDB retains automatic snapshots before deleting them. For example,
        # if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for 5 days
        # before being deleted.

        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The daily time range (in UTC) during which MemoryDB begins taking a daily snapshot of your shard.
        # Example: 05:00-09:00 If you do not specify this parameter, MemoryDB automatically chooses an
        # appropriate time range.

        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to which
        # notifications are sent.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The name of the subnet group to be used for the cluster.

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String?

        # A flag to enable in-transit encryption on the cluster.

        @[JSON::Field(key: "TLSEnabled")]
        getter tls_enabled : Bool?

        # A list of tags to be added to this resource. Tags are comma-separated key,value pairs (e.g.
        # Key=myKey, Value=myKeyValue. You can include multiple tags as shown following: Key=myKey,
        # Value=myKeyValue Key=mySecondKey, Value=mySecondKeyValue.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @acl_name : String,
          @cluster_name : String,
          @node_type : String,
          @auto_minor_version_upgrade : Bool? = nil,
          @data_tiering : Bool? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @ip_discovery : String? = nil,
          @kms_key_id : String? = nil,
          @maintenance_window : String? = nil,
          @multi_region_cluster_name : String? = nil,
          @network_type : String? = nil,
          @num_replicas_per_shard : Int32? = nil,
          @num_shards : Int32? = nil,
          @parameter_group_name : String? = nil,
          @port : Int32? = nil,
          @security_group_ids : Array(String)? = nil,
          @snapshot_arns : Array(String)? = nil,
          @snapshot_name : String? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil,
          @sns_topic_arn : String? = nil,
          @subnet_group_name : String? = nil,
          @tls_enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateClusterResponse
        include JSON::Serializable

        # The newly-created cluster.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct CreateMultiRegionClusterRequest
        include JSON::Serializable

        # A suffix to be added to the Multi-Region cluster name. Amazon MemoryDB automatically applies a
        # prefix to the Multi-Region cluster Name when it is created. Each Amazon Region has its own prefix.
        # For instance, a Multi-Region cluster Name created in the US-West-1 region will begin with "virxk",
        # along with the suffix name you provide. The suffix guarantees uniqueness of the Multi-Region cluster
        # name across multiple regions.

        @[JSON::Field(key: "MultiRegionClusterNameSuffix")]
        getter multi_region_cluster_name_suffix : String

        # The node type to be used for the multi-Region cluster.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String

        # A description for the multi-Region cluster.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the engine to be used for the multi-Region cluster.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version of the engine to be used for the multi-Region cluster.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The name of the multi-Region parameter group to be associated with the cluster.

        @[JSON::Field(key: "MultiRegionParameterGroupName")]
        getter multi_region_parameter_group_name : String?

        # The number of shards for the multi-Region cluster.

        @[JSON::Field(key: "NumShards")]
        getter num_shards : Int32?

        # Whether to enable TLS encryption for the multi-Region cluster.

        @[JSON::Field(key: "TLSEnabled")]
        getter tls_enabled : Bool?

        # A list of tags to be applied to the multi-Region cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @multi_region_cluster_name_suffix : String,
          @node_type : String,
          @description : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @multi_region_parameter_group_name : String? = nil,
          @num_shards : Int32? = nil,
          @tls_enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateMultiRegionClusterResponse
        include JSON::Serializable

        # Details about the newly created multi-Region cluster.

        @[JSON::Field(key: "MultiRegionCluster")]
        getter multi_region_cluster : Types::MultiRegionCluster?

        def initialize(
          @multi_region_cluster : Types::MultiRegionCluster? = nil
        )
        end
      end


      struct CreateParameterGroupRequest
        include JSON::Serializable

        # The name of the parameter group family that the parameter group can be used with.

        @[JSON::Field(key: "Family")]
        getter family : String

        # The name of the parameter group.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # An optional description of the parameter group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @family : String,
          @parameter_group_name : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateParameterGroupResponse
        include JSON::Serializable

        # The newly-created parameter group.

        @[JSON::Field(key: "ParameterGroup")]
        getter parameter_group : Types::ParameterGroup?

        def initialize(
          @parameter_group : Types::ParameterGroup? = nil
        )
        end
      end


      struct CreateSnapshotRequest
        include JSON::Serializable

        # The snapshot is created from this cluster.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # A name for the snapshot being created.

        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String

        # The ID of the KMS key used to encrypt the snapshot.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cluster_name : String,
          @snapshot_name : String,
          @kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateSnapshotResponse
        include JSON::Serializable

        # The newly-created snapshot.

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end


      struct CreateSubnetGroupRequest
        include JSON::Serializable

        # The name of the subnet group.

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String

        # A list of VPC subnet IDs for the subnet group.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A description for the subnet group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @subnet_group_name : String,
          @subnet_ids : Array(String),
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateSubnetGroupResponse
        include JSON::Serializable

        # The newly-created subnet group.

        @[JSON::Field(key: "SubnetGroup")]
        getter subnet_group : Types::SubnetGroup?

        def initialize(
          @subnet_group : Types::SubnetGroup? = nil
        )
        end
      end


      struct CreateUserRequest
        include JSON::Serializable

        # Access permissions string used for this user.

        @[JSON::Field(key: "AccessString")]
        getter access_string : String

        # Denotes the user's authentication properties, such as whether it requires a password to
        # authenticate.

        @[JSON::Field(key: "AuthenticationMode")]
        getter authentication_mode : Types::AuthenticationMode

        # The name of the user. This value must be unique as it also serves as the user identifier.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @access_string : String,
          @authentication_mode : Types::AuthenticationMode,
          @user_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateUserResponse
        include JSON::Serializable

        # The newly-created user.

        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end

      # A default user is required and must be specified.

      struct DefaultUserRequired
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteACLRequest
        include JSON::Serializable

        # The name of the Access Control List to delete.

        @[JSON::Field(key: "ACLName")]
        getter acl_name : String

        def initialize(
          @acl_name : String
        )
        end
      end


      struct DeleteACLResponse
        include JSON::Serializable

        # The Access Control List object that has been deleted.

        @[JSON::Field(key: "ACL")]
        getter acl : Types::ACL?

        def initialize(
          @acl : Types::ACL? = nil
        )
        end
      end


      struct DeleteClusterRequest
        include JSON::Serializable

        # The name of the cluster to be deleted

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # The user-supplied name of a final cluster snapshot. This is the unique name that identifies the
        # snapshot. MemoryDB creates the snapshot, and then deletes the cluster immediately afterward.

        @[JSON::Field(key: "FinalSnapshotName")]
        getter final_snapshot_name : String?

        # The name of the multi-Region cluster to be deleted.

        @[JSON::Field(key: "MultiRegionClusterName")]
        getter multi_region_cluster_name : String?

        def initialize(
          @cluster_name : String,
          @final_snapshot_name : String? = nil,
          @multi_region_cluster_name : String? = nil
        )
        end
      end


      struct DeleteClusterResponse
        include JSON::Serializable

        # The cluster object that has been deleted.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct DeleteMultiRegionClusterRequest
        include JSON::Serializable

        # The name of the multi-Region cluster to be deleted.

        @[JSON::Field(key: "MultiRegionClusterName")]
        getter multi_region_cluster_name : String

        def initialize(
          @multi_region_cluster_name : String
        )
        end
      end


      struct DeleteMultiRegionClusterResponse
        include JSON::Serializable

        # Details about the deleted multi-Region cluster.

        @[JSON::Field(key: "MultiRegionCluster")]
        getter multi_region_cluster : Types::MultiRegionCluster?

        def initialize(
          @multi_region_cluster : Types::MultiRegionCluster? = nil
        )
        end
      end


      struct DeleteParameterGroupRequest
        include JSON::Serializable

        # The name of the parameter group to delete.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        def initialize(
          @parameter_group_name : String
        )
        end
      end


      struct DeleteParameterGroupResponse
        include JSON::Serializable

        # The parameter group that has been deleted.

        @[JSON::Field(key: "ParameterGroup")]
        getter parameter_group : Types::ParameterGroup?

        def initialize(
          @parameter_group : Types::ParameterGroup? = nil
        )
        end
      end


      struct DeleteSnapshotRequest
        include JSON::Serializable

        # The name of the snapshot to delete.

        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String

        def initialize(
          @snapshot_name : String
        )
        end
      end


      struct DeleteSnapshotResponse
        include JSON::Serializable

        # The snapshot object that has been deleted.

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end


      struct DeleteSubnetGroupRequest
        include JSON::Serializable

        # The name of the subnet group to delete.

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String

        def initialize(
          @subnet_group_name : String
        )
        end
      end


      struct DeleteSubnetGroupResponse
        include JSON::Serializable

        # The subnet group object that has been deleted.

        @[JSON::Field(key: "SubnetGroup")]
        getter subnet_group : Types::SubnetGroup?

        def initialize(
          @subnet_group : Types::SubnetGroup? = nil
        )
        end
      end


      struct DeleteUserRequest
        include JSON::Serializable

        # The name of the user to delete

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @user_name : String
        )
        end
      end


      struct DeleteUserResponse
        include JSON::Serializable

        # The user object that has been deleted.

        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end


      struct DescribeACLsRequest
        include JSON::Serializable

        # The name of the ACL.

        @[JSON::Field(key: "ACLName")]
        getter acl_name : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @acl_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeACLsResponse
        include JSON::Serializable

        # The list of ACLs.

        @[JSON::Field(key: "ACLs")]
        getter ac_ls : Array(Types::ACL)?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @ac_ls : Array(Types::ACL)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeClustersRequest
        include JSON::Serializable

        # The name of the cluster.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An optional flag that can be included in the request to retrieve information about the individual
        # shard(s).

        @[JSON::Field(key: "ShowShardDetails")]
        getter show_shard_details : Bool?

        def initialize(
          @cluster_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @show_shard_details : Bool? = nil
        )
        end
      end


      struct DescribeClustersResponse
        include JSON::Serializable

        # A list of clusters

        @[JSON::Field(key: "Clusters")]
        getter clusters : Array(Types::Cluster)?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(Types::Cluster)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEngineVersionsRequest
        include JSON::Serializable

        # If true, specifies that only the default version of the specified engine or engine and major version
        # combination is to be returned.

        @[JSON::Field(key: "DefaultOnly")]
        getter default_only : Bool?

        # The name of the engine for which to list available versions.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The Redis OSS engine version

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of a specific parameter group family to return details for.

        @[JSON::Field(key: "ParameterGroupFamily")]
        getter parameter_group_family : String?

        def initialize(
          @default_only : Bool? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @parameter_group_family : String? = nil
        )
        end
      end


      struct DescribeEngineVersionsResponse
        include JSON::Serializable

        # A list of engine version details. Each element in the list contains detailed information about one
        # engine version.

        @[JSON::Field(key: "EngineVersions")]
        getter engine_versions : Array(Types::EngineVersionInfo)?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @engine_versions : Array(Types::EngineVersionInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeEventsRequest
        include JSON::Serializable

        # The number of minutes worth of events to retrieve.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The end of the time interval for which to retrieve events, specified in ISO 8601 format. Example:
        # 2017-03-30T07:03:49.555Z

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the event source for which events are returned. If not specified, all sources are
        # included in the response.

        @[JSON::Field(key: "SourceName")]
        getter source_name : String?

        # The event source to retrieve events for. If no value is specified, all events are returned.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The beginning of the time interval to retrieve events for, specified in ISO 8601 format. Example:
        # 2017-03-30T07:03:49.555Z

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @duration : Int32? = nil,
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @source_name : String? = nil,
          @source_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct DescribeEventsResponse
        include JSON::Serializable

        # A list of events. Each element in the list contains detailed information about one event.

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMultiRegionClustersRequest
        include JSON::Serializable

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The name of a specific multi-Region cluster to describe.

        @[JSON::Field(key: "MultiRegionClusterName")]
        getter multi_region_cluster_name : String?

        # A token to specify where to start paginating.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Details about the multi-Region cluster.

        @[JSON::Field(key: "ShowClusterDetails")]
        getter show_cluster_details : Bool?

        def initialize(
          @max_results : Int32? = nil,
          @multi_region_cluster_name : String? = nil,
          @next_token : String? = nil,
          @show_cluster_details : Bool? = nil
        )
        end
      end


      struct DescribeMultiRegionClustersResponse
        include JSON::Serializable

        # A list of multi-Region clusters.

        @[JSON::Field(key: "MultiRegionClusters")]
        getter multi_region_clusters : Array(Types::MultiRegionCluster)?

        # A token to use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @multi_region_clusters : Array(Types::MultiRegionCluster)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMultiRegionParameterGroupsRequest
        include JSON::Serializable

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The request for information on a specific multi-region parameter group.

        @[JSON::Field(key: "MultiRegionParameterGroupName")]
        getter multi_region_parameter_group_name : String?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @multi_region_parameter_group_name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMultiRegionParameterGroupsResponse
        include JSON::Serializable

        # A list of multi-region parameter groups. Each element in the list contains detailed information
        # about one parameter group.

        @[JSON::Field(key: "MultiRegionParameterGroups")]
        getter multi_region_parameter_groups : Array(Types::MultiRegionParameterGroup)?

        # An optional token to include in the response. If this token is provided, the response includes only
        # results beyond the token, up to the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @multi_region_parameter_groups : Array(Types::MultiRegionParameterGroup)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMultiRegionParametersRequest
        include JSON::Serializable

        # The name of the multi-region parameter group to return details for.

        @[JSON::Field(key: "MultiRegionParameterGroupName")]
        getter multi_region_parameter_group_name : String

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional token returned from a prior request. Use this token for pagination of results from this
        # action. If this parameter is specified, the response includes only results beyond the token, up to
        # the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The parameter types to return. Valid values: user | system | engine-default

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @multi_region_parameter_group_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @source : String? = nil
        )
        end
      end


      struct DescribeMultiRegionParametersResponse
        include JSON::Serializable

        # A list of parameters specific to a particular multi-region parameter group. Each element in the list
        # contains detailed information about one parameter.

        @[JSON::Field(key: "MultiRegionParameters")]
        getter multi_region_parameters : Array(Types::MultiRegionParameter)?

        # An optional token to include in the response. If this token is provided, the response includes only
        # results beyond the token, up to the value specified by MaxResults.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @multi_region_parameters : Array(Types::MultiRegionParameter)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeParameterGroupsRequest
        include JSON::Serializable

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of a specific parameter group to return details for.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @parameter_group_name : String? = nil
        )
        end
      end


      struct DescribeParameterGroupsResponse
        include JSON::Serializable

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of parameter groups. Each element in the list contains detailed information about one
        # parameter group.

        @[JSON::Field(key: "ParameterGroups")]
        getter parameter_groups : Array(Types::ParameterGroup)?

        def initialize(
          @next_token : String? = nil,
          @parameter_groups : Array(Types::ParameterGroup)? = nil
        )
        end
      end


      struct DescribeParametersRequest
        include JSON::Serializable

        # he name of a specific parameter group to return details for.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @parameter_group_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeParametersResponse
        include JSON::Serializable

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of parameters specific to a particular parameter group. Each element in the list contains
        # detailed information about one parameter.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @next_token : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end


      struct DescribeReservedNodesOfferingsRequest
        include JSON::Serializable

        # Duration filter value, specified in years or seconds. Use this parameter to show only reservations
        # for a given duration.

        @[JSON::Field(key: "Duration")]
        getter duration : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The node type for the reserved nodes. For more information, see Supported node types .

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The offering type filter value. Use this parameter to show only the available offerings matching the
        # specified offering type. Valid values: "All Upfront"|"Partial Upfront"| "No Upfront"

        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The offering identifier filter value. Use this parameter to show only the available offering that
        # matches the specified reservation identifier.

        @[JSON::Field(key: "ReservedNodesOfferingId")]
        getter reserved_nodes_offering_id : String?

        def initialize(
          @duration : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @node_type : String? = nil,
          @offering_type : String? = nil,
          @reserved_nodes_offering_id : String? = nil
        )
        end
      end


      struct DescribeReservedNodesOfferingsResponse
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Lists available reserved node offerings.

        @[JSON::Field(key: "ReservedNodesOfferings")]
        getter reserved_nodes_offerings : Array(Types::ReservedNodesOffering)?

        def initialize(
          @next_token : String? = nil,
          @reserved_nodes_offerings : Array(Types::ReservedNodesOffering)? = nil
        )
        end
      end


      struct DescribeReservedNodesRequest
        include JSON::Serializable

        # The duration filter value, specified in years or seconds. Use this parameter to show only
        # reservations for this duration.

        @[JSON::Field(key: "Duration")]
        getter duration : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The node type filter value. Use this parameter to show only those reservations matching the
        # specified node type. For more information, see Supported node types .

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The offering type filter value. Use this parameter to show only the available offerings matching the
        # specified offering type. Valid values: "All Upfront"|"Partial Upfront"| "No Upfront"

        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The reserved node identifier filter value. Use this parameter to show only the reservation that
        # matches the specified reservation ID.

        @[JSON::Field(key: "ReservationId")]
        getter reservation_id : String?

        # The offering identifier filter value. Use this parameter to show only purchased reservations
        # matching the specified offering identifier.

        @[JSON::Field(key: "ReservedNodesOfferingId")]
        getter reserved_nodes_offering_id : String?

        def initialize(
          @duration : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @node_type : String? = nil,
          @offering_type : String? = nil,
          @reservation_id : String? = nil,
          @reserved_nodes_offering_id : String? = nil
        )
        end
      end


      struct DescribeReservedNodesResponse
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns information about reserved nodes for this account, or about a specified reserved node.

        @[JSON::Field(key: "ReservedNodes")]
        getter reserved_nodes : Array(Types::ReservedNode)?

        def initialize(
          @next_token : String? = nil,
          @reserved_nodes : Array(Types::ReservedNode)? = nil
        )
        end
      end


      struct DescribeServiceUpdatesRequest
        include JSON::Serializable

        # The list of cluster names to identify service updates to apply.

        @[JSON::Field(key: "ClusterNames")]
        getter cluster_names : Array(String)?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique ID of the service update to describe.

        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String?

        # The status(es) of the service updates to filter on.

        @[JSON::Field(key: "Status")]
        getter status : Array(String)?

        def initialize(
          @cluster_names : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_update_name : String? = nil,
          @status : Array(String)? = nil
        )
        end
      end


      struct DescribeServiceUpdatesResponse
        include JSON::Serializable

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of service updates

        @[JSON::Field(key: "ServiceUpdates")]
        getter service_updates : Array(Types::ServiceUpdate)?

        def initialize(
          @next_token : String? = nil,
          @service_updates : Array(Types::ServiceUpdate)? = nil
        )
        end
      end


      struct DescribeSnapshotsRequest
        include JSON::Serializable

        # A user-supplied cluster identifier. If this parameter is specified, only snapshots associated with
        # that specific cluster are described.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A Boolean value which if true, the shard configuration is included in the snapshot description.

        @[JSON::Field(key: "ShowDetail")]
        getter show_detail : Bool?

        # A user-supplied name of the snapshot. If this parameter is specified, only this named snapshot is
        # described.

        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String?

        # If set to system, the output shows snapshots that were automatically created by MemoryDB. If set to
        # user the output shows snapshots that were manually created. If omitted, the output shows both
        # automatically and manually created snapshots.

        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @cluster_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @show_detail : Bool? = nil,
          @snapshot_name : String? = nil,
          @source : String? = nil
        )
        end
      end


      struct DescribeSnapshotsResponse
        include JSON::Serializable

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of snapshots. Each item in the list contains detailed information about one snapshot.

        @[JSON::Field(key: "Snapshots")]
        getter snapshots : Array(Types::Snapshot)?

        def initialize(
          @next_token : String? = nil,
          @snapshots : Array(Types::Snapshot)? = nil
        )
        end
      end


      struct DescribeSubnetGroupsRequest
        include JSON::Serializable

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the subnet group to return details for.

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @subnet_group_name : String? = nil
        )
        end
      end


      struct DescribeSubnetGroupsResponse
        include JSON::Serializable

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of subnet groups. Each element in the list contains detailed information about one group.

        @[JSON::Field(key: "SubnetGroups")]
        getter subnet_groups : Array(Types::SubnetGroup)?

        def initialize(
          @next_token : String? = nil,
          @subnet_groups : Array(Types::SubnetGroup)? = nil
        )
        end
      end


      struct DescribeUsersRequest
        include JSON::Serializable

        # Filter to determine the list of users to return.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxResults value, a token is included in the response so that the remaining results can be
        # retrieved.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the user.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @user_name : String? = nil
        )
        end
      end


      struct DescribeUsersResponse
        include JSON::Serializable

        # An optional argument to pass in case the total number of records exceeds the value of MaxResults. If
        # nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of users.

        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # A user with the specified name already exists.

      struct DuplicateUserNameFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the information required for client programs to connect to the cluster and its nodes.

      struct Endpoint
        include JSON::Serializable

        # The DNS hostname of the node.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # The port number that the engine is listening on.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        def initialize(
          @address : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # Provides details of the Redis OSS engine version

      struct EngineVersionInfo
        include JSON::Serializable

        # The name of the engine for which version information is provided.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The patched engine version

        @[JSON::Field(key: "EnginePatchVersion")]
        getter engine_patch_version : String?

        # The engine version

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Specifies the name of the parameter group family to which the engine default parameters apply.

        @[JSON::Field(key: "ParameterGroupFamily")]
        getter parameter_group_family : String?

        def initialize(
          @engine : String? = nil,
          @engine_patch_version : String? = nil,
          @engine_version : String? = nil,
          @parameter_group_family : String? = nil
        )
        end
      end

      # Represents a single occurrence of something interesting within the system. Some examples of events
      # are creating a cluster or adding or removing a node.

      struct Event
        include JSON::Serializable

        # The date and time when the event occurred.

        @[JSON::Field(key: "Date", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date : Time?

        # The text of the event.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name for the source of the event. For example, if the event occurred at the cluster level, the
        # identifier would be the name of the cluster.

        @[JSON::Field(key: "SourceName")]
        getter source_name : String?

        # Specifies the origin of this event - a cluster, a parameter group, a security group, etc.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @date : Time? = nil,
          @message : String? = nil,
          @source_name : String? = nil,
          @source_type : String? = nil
        )
        end
      end


      struct FailoverShardRequest
        include JSON::Serializable

        # The cluster being failed over.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # The name of the shard.

        @[JSON::Field(key: "ShardName")]
        getter shard_name : String

        def initialize(
          @cluster_name : String,
          @shard_name : String
        )
        end
      end


      struct FailoverShardResponse
        include JSON::Serializable

        # The cluster being failed over.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # Used to streamline results of a search based on the property being filtered.

      struct Filter
        include JSON::Serializable

        # The property being filtered. For example, UserName.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The property values to filter on. For example, "user-123".

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The cluster does not have sufficient capacity to perform the requested operation.

      struct InsufficientClusterCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # The ACL is not in a valid state for the requested operation.

      struct InvalidACLStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified Amazon Resource Name (ARN) is not valid.

      struct InvalidARNFault
        include JSON::Serializable

        def initialize
        end
      end

      # The cluster is not in a valid state for the requested operation.

      struct InvalidClusterStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The provided credentials are not valid.

      struct InvalidCredentialsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified KMS key is not valid or accessible.

      struct InvalidKMSKeyFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation cannot be performed on the multi-Region cluster in its current state.

      struct InvalidMultiRegionClusterStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The node is not in a valid state for the requested operation.

      struct InvalidNodeStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified parameter combination is not valid.

      struct InvalidParameterCombinationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The parameter group is not in a valid state for the requested operation.

      struct InvalidParameterGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified parameter value is not valid.

      struct InvalidParameterValueException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The snapshot is not in a valid state for the requested operation.

      struct InvalidSnapshotStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified subnet is not valid.

      struct InvalidSubnet
        include JSON::Serializable

        def initialize
        end
      end

      # The user is not in a valid state for the requested operation.

      struct InvalidUserStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The VPC network is not in a valid state for the requested operation.

      struct InvalidVPCNetworkStateFault
        include JSON::Serializable

        def initialize
        end
      end


      struct ListAllowedMultiRegionClusterUpdatesRequest
        include JSON::Serializable

        # The name of the multi-Region cluster.

        @[JSON::Field(key: "MultiRegionClusterName")]
        getter multi_region_cluster_name : String

        def initialize(
          @multi_region_cluster_name : String
        )
        end
      end


      struct ListAllowedMultiRegionClusterUpdatesResponse
        include JSON::Serializable

        # The node types that the cluster can be scaled down to.

        @[JSON::Field(key: "ScaleDownNodeTypes")]
        getter scale_down_node_types : Array(String)?

        # The node types that the cluster can be scaled up to.

        @[JSON::Field(key: "ScaleUpNodeTypes")]
        getter scale_up_node_types : Array(String)?

        def initialize(
          @scale_down_node_types : Array(String)? = nil,
          @scale_up_node_types : Array(String)? = nil
        )
        end
      end


      struct ListAllowedNodeTypeUpdatesRequest
        include JSON::Serializable

        # The name of the cluster you want to scale. MemoryDB uses the cluster name to identify the current
        # node type being used by this cluster, and from that to create a list of node types you can scale up
        # to.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        def initialize(
          @cluster_name : String
        )
        end
      end


      struct ListAllowedNodeTypeUpdatesResponse
        include JSON::Serializable

        # A list node types which you can use to scale down your cluster.

        @[JSON::Field(key: "ScaleDownNodeTypes")]
        getter scale_down_node_types : Array(String)?

        # A list node types which you can use to scale up your cluster.

        @[JSON::Field(key: "ScaleUpNodeTypes")]
        getter scale_up_node_types : Array(String)?

        def initialize(
          @scale_down_node_types : Array(String)? = nil,
          @scale_up_node_types : Array(String)? = nil
        )
        end
      end


      struct ListTagsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want the list of tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsResponse
        include JSON::Serializable

        # A list of tags as key-value pairs.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents a multi-Region cluster.

      struct MultiRegionCluster
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the multi-Region cluster.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The clusters in this multi-Region cluster.

        @[JSON::Field(key: "Clusters")]
        getter clusters : Array(Types::RegionalCluster)?

        # The description of the multi-Region cluster.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the engine used by the multi-Region cluster.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version of the engine used by the multi-Region cluster.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The name of the multi-Region cluster.

        @[JSON::Field(key: "MultiRegionClusterName")]
        getter multi_region_cluster_name : String?

        # The name of the multi-Region parameter group associated with the cluster.

        @[JSON::Field(key: "MultiRegionParameterGroupName")]
        getter multi_region_parameter_group_name : String?

        # The node type used by the multi-Region cluster.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The number of shards in the multi-Region cluster.

        @[JSON::Field(key: "NumberOfShards")]
        getter number_of_shards : Int32?

        # The current status of the multi-Region cluster.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Indiciates if the multi-Region cluster is TLS enabled.

        @[JSON::Field(key: "TLSEnabled")]
        getter tls_enabled : Bool?

        def initialize(
          @arn : String? = nil,
          @clusters : Array(Types::RegionalCluster)? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @multi_region_cluster_name : String? = nil,
          @multi_region_parameter_group_name : String? = nil,
          @node_type : String? = nil,
          @number_of_shards : Int32? = nil,
          @status : String? = nil,
          @tls_enabled : Bool? = nil
        )
        end
      end

      # A multi-Region cluster with the specified name already exists.

      struct MultiRegionClusterAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified multi-Region cluster does not exist.

      struct MultiRegionClusterNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an individual setting that controls some aspect of MemoryDB behavior across multiple
      # regions.

      struct MultiRegionParameter
        include JSON::Serializable

        # The valid range of values for the parameter.

        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : String?

        # The valid data type for the parameter.

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # A description of the parameter.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The earliest engine version to which the parameter can apply.

        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # The name of the parameter.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates the source of the parameter value. Valid values: user | system | engine-default

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The value of the parameter.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @allowed_values : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @minimum_engine_version : String? = nil,
          @name : String? = nil,
          @source : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Represents the output of a CreateMultiRegionParameterGroup operation. A multi-region parameter group
      # represents a collection of parameters that can be applied to clusters across multiple regions.

      struct MultiRegionParameterGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the multi-region parameter group.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A description of the multi-region parameter group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the parameter group family that this multi-region parameter group is compatible with.

        @[JSON::Field(key: "Family")]
        getter family : String?

        # The name of the multi-region parameter group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @family : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The specified multi-Region parameter group does not exist.

      struct MultiRegionParameterGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation would result in no changes.

      struct NoOperationFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents an individual node within a cluster. Each node runs its own instance of the cluster's
      # protocol-compliant caching software.

      struct Node
        include JSON::Serializable

        # The Availability Zone in which the node resides

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The date and time when the node was created.

        @[JSON::Field(key: "CreateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The hostname for connecting to this node.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        # The node identifier. A node name is a numeric identifier (0001, 0002, etc.). The combination of
        # cluster name, shard name and node name uniquely identifies every node used in a customer's Amazon
        # account.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the service update on the node

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @availability_zone : String? = nil,
          @create_time : Time? = nil,
          @endpoint : Types::Endpoint? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The request cannot be processed because it would exceed the maximum number of nodes allowed for this
      # cluster.

      struct NodeQuotaForClusterExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of nodes allowed for this
      # customer.

      struct NodeQuotaForCustomerExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes an individual setting that controls some aspect of MemoryDB behavior.

      struct Parameter
        include JSON::Serializable

        # The valid range of values for the parameter.

        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : String?

        # The parameter's data type

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # A description of the parameter

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The earliest engine version to which the parameter can apply.

        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # The name of the parameter

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of the parameter

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @allowed_values : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @minimum_engine_version : String? = nil,
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Represents the output of a CreateParameterGroup operation. A parameter group represents a
      # combination of specific values for the parameters that are passed to the engine software during
      # startup.

      struct ParameterGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the parameter group

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A description of the parameter group

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the parameter group family that this parameter group is compatible with.

        @[JSON::Field(key: "Family")]
        getter family : String?

        # The name of the parameter group

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @family : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A parameter group with the specified name already exists.

      struct ParameterGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified parameter group does not exist.

      struct ParameterGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of parameter groups
      # allowed.

      struct ParameterGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a name-value pair that is used to update the value of a parameter.

      struct ParameterNameValue
        include JSON::Serializable

        # The name of the parameter

        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        # The value of the parameter

        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String?

        def initialize(
          @parameter_name : String? = nil,
          @parameter_value : String? = nil
        )
        end
      end

      # Update action that has yet to be processed for the corresponding apply/stop request

      struct PendingModifiedServiceUpdate
        include JSON::Serializable

        # The unique ID of the service update

        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String?

        # The status of the service update

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @service_update_name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct PurchaseReservedNodesOfferingRequest
        include JSON::Serializable

        # The ID of the reserved node offering to purchase.

        @[JSON::Field(key: "ReservedNodesOfferingId")]
        getter reserved_nodes_offering_id : String

        # The number of node instances to reserve.

        @[JSON::Field(key: "NodeCount")]
        getter node_count : Int32?

        # A customer-specified identifier to track this reservation.

        @[JSON::Field(key: "ReservationId")]
        getter reservation_id : String?

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @reserved_nodes_offering_id : String,
          @node_count : Int32? = nil,
          @reservation_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PurchaseReservedNodesOfferingResponse
        include JSON::Serializable

        # Represents the output of a PurchaseReservedNodesOffering operation.

        @[JSON::Field(key: "ReservedNode")]
        getter reserved_node : Types::ReservedNode?

        def initialize(
          @reserved_node : Types::ReservedNode? = nil
        )
        end
      end

      # The recurring charge to run this reserved node.

      struct RecurringCharge
        include JSON::Serializable

        # The amount of the recurring charge to run this reserved node.

        @[JSON::Field(key: "RecurringChargeAmount")]
        getter recurring_charge_amount : Float64?

        # The frequency of the recurring price charged to run this reserved node.

        @[JSON::Field(key: "RecurringChargeFrequency")]
        getter recurring_charge_frequency : String?

        def initialize(
          @recurring_charge_amount : Float64? = nil,
          @recurring_charge_frequency : String? = nil
        )
        end
      end

      # Represents a Regional cluster

      struct RegionalCluster
        include JSON::Serializable

        # The Amazon Resource Name (ARN) the Regional cluster

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the Regional cluster

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String?

        # The Region the current Regional cluster is assigned to.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The status of the Regional cluster.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @cluster_name : String? = nil,
          @region : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A request to configure the number of replicas in a shard

      struct ReplicaConfigurationRequest
        include JSON::Serializable

        # The number of replicas to scale up or down to

        @[JSON::Field(key: "ReplicaCount")]
        getter replica_count : Int32?

        def initialize(
          @replica_count : Int32? = nil
        )
        end
      end

      # Represents the output of a PurchaseReservedNodesOffering operation.

      struct ReservedNode
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the reserved node.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The duration of the reservation in seconds.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The fixed price charged for this reserved node.

        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # The number of nodes that have been reserved.

        @[JSON::Field(key: "NodeCount")]
        getter node_count : Int32?

        # The node type for the reserved nodes.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The offering type of this reserved node.

        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The recurring price charged to run this reserved node.

        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # A customer-specified identifier to track this reservation.

        @[JSON::Field(key: "ReservationId")]
        getter reservation_id : String?

        # The ID of the reserved node offering to purchase.

        @[JSON::Field(key: "ReservedNodesOfferingId")]
        getter reserved_nodes_offering_id : String?

        # The time the reservation started.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The state of the reserved node.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @duration : Int32? = nil,
          @fixed_price : Float64? = nil,
          @node_count : Int32? = nil,
          @node_type : String? = nil,
          @offering_type : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reservation_id : String? = nil,
          @reserved_nodes_offering_id : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil
        )
        end
      end

      # You already have a reservation with the given identifier.

      struct ReservedNodeAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested node does not exist.

      struct ReservedNodeNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the user's node quota.

      struct ReservedNodeQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The offering type of this node.

      struct ReservedNodesOffering
        include JSON::Serializable

        # The duration of the reservation in seconds.

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The fixed price charged for this reserved node.

        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # The node type for the reserved nodes. For more information, see Supported node types .

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The offering type of this reserved node.

        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The recurring price charged to run this reserved node.

        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # The offering identifier.

        @[JSON::Field(key: "ReservedNodesOfferingId")]
        getter reserved_nodes_offering_id : String?

        def initialize(
          @duration : Int32? = nil,
          @fixed_price : Float64? = nil,
          @node_type : String? = nil,
          @offering_type : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reserved_nodes_offering_id : String? = nil
        )
        end
      end

      # The requested node offering does not exist.

      struct ReservedNodesOfferingNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end


      struct ResetParameterGroupRequest
        include JSON::Serializable

        # The name of the parameter group to reset.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # If true, all parameters in the parameter group are reset to their default values. If false, only the
        # parameters listed by ParameterNames are reset to their default values.

        @[JSON::Field(key: "AllParameters")]
        getter all_parameters : Bool?

        # An array of parameter names to reset to their default values. If AllParameters is true, do not use
        # ParameterNames. If AllParameters is false, you must specify the name of at least one parameter to
        # reset.

        @[JSON::Field(key: "ParameterNames")]
        getter parameter_names : Array(String)?

        def initialize(
          @parameter_group_name : String,
          @all_parameters : Bool? = nil,
          @parameter_names : Array(String)? = nil
        )
        end
      end


      struct ResetParameterGroupResponse
        include JSON::Serializable

        # The parameter group being reset.

        @[JSON::Field(key: "ParameterGroup")]
        getter parameter_group : Types::ParameterGroup?

        def initialize(
          @parameter_group : Types::ParameterGroup? = nil
        )
        end
      end

      # The status of the online resharding

      struct ReshardingStatus
        include JSON::Serializable

        # The status of the online resharding slot migration

        @[JSON::Field(key: "SlotMigration")]
        getter slot_migration : Types::SlotMigration?

        def initialize(
          @slot_migration : Types::SlotMigration? = nil
        )
        end
      end

      # Represents a single security group and its status.

      struct SecurityGroupMembership
        include JSON::Serializable

        # The identifier of the security group.

        @[JSON::Field(key: "SecurityGroupId")]
        getter security_group_id : String?

        # The status of the security group membership. The status changes whenever a security group is
        # modified, or when the security groups assigned to a cluster are modified.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @security_group_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The required service-linked role was not found.

      struct ServiceLinkedRoleNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # An update that you can apply to your MemoryDB clusters.

      struct ServiceUpdate
        include JSON::Serializable

        # The date at which the service update will be automatically applied

        @[JSON::Field(key: "AutoUpdateStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter auto_update_start_date : Time?

        # The name of the cluster to which the service update applies

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String?

        # Provides details of the service update

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the engine for which a service update is available.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # A list of nodes updated by the service update

        @[JSON::Field(key: "NodesUpdated")]
        getter nodes_updated : String?

        # The date when the service update is initially available

        @[JSON::Field(key: "ReleaseDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter release_date : Time?

        # The unique ID of the service update

        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String?

        # The status of the service update

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Reflects the nature of the service update

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @auto_update_start_date : Time? = nil,
          @cluster_name : String? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @nodes_updated : String? = nil,
          @release_date : Time? = nil,
          @service_update_name : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The specified service update does not exist.

      struct ServiceUpdateNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # A request to apply a service update

      struct ServiceUpdateRequest
        include JSON::Serializable

        # The unique ID of the service update

        @[JSON::Field(key: "ServiceUpdateNameToApply")]
        getter service_update_name_to_apply : String?

        def initialize(
          @service_update_name_to_apply : String? = nil
        )
        end
      end

      # Represents a collection of nodes in a cluster. One node in the node group is the read/write primary
      # node. All the other nodes are read-only Replica nodes.

      struct Shard
        include JSON::Serializable

        # The name of the shard

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list containing information about individual nodes within the shard

        @[JSON::Field(key: "Nodes")]
        getter nodes : Array(Types::Node)?

        # The number of nodes in the shard

        @[JSON::Field(key: "NumberOfNodes")]
        getter number_of_nodes : Int32?

        # The keyspace for this shard.

        @[JSON::Field(key: "Slots")]
        getter slots : String?

        # The current state of this replication group - creating, available, modifying, deleting.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @nodes : Array(Types::Node)? = nil,
          @number_of_nodes : Int32? = nil,
          @slots : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Shard configuration options. Each shard configuration has the following: Slots and ReplicaCount.

      struct ShardConfiguration
        include JSON::Serializable

        # The number of read replica nodes in this shard.

        @[JSON::Field(key: "ReplicaCount")]
        getter replica_count : Int32?

        # A string that specifies the keyspace for a particular node group. Keyspaces range from 0 to 16,383.
        # The string is in the format startkey-endkey.

        @[JSON::Field(key: "Slots")]
        getter slots : String?

        def initialize(
          @replica_count : Int32? = nil,
          @slots : String? = nil
        )
        end
      end

      # A request to configure the sharding properties of a cluster

      struct ShardConfigurationRequest
        include JSON::Serializable

        # The number of shards in the cluster

        @[JSON::Field(key: "ShardCount")]
        getter shard_count : Int32?

        def initialize(
          @shard_count : Int32? = nil
        )
        end
      end

      # Provides details of a shard in a snapshot

      struct ShardDetail
        include JSON::Serializable

        # The configuration details of the shard

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ShardConfiguration?

        # The name of the shard

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The size of the shard's snapshot

        @[JSON::Field(key: "Size")]
        getter size : String?

        # The date and time that the shard's snapshot was created

        @[JSON::Field(key: "SnapshotCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter snapshot_creation_time : Time?

        def initialize(
          @configuration : Types::ShardConfiguration? = nil,
          @name : String? = nil,
          @size : String? = nil,
          @snapshot_creation_time : Time? = nil
        )
        end
      end

      # The specified shard does not exist.

      struct ShardNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of shards allowed per
      # cluster.

      struct ShardsPerClusterQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the progress of an online resharding operation.

      struct SlotMigration
        include JSON::Serializable

        # The percentage of the slot migration that is complete.

        @[JSON::Field(key: "ProgressPercentage")]
        getter progress_percentage : Float64?

        def initialize(
          @progress_percentage : Float64? = nil
        )
        end
      end

      # Represents a copy of an entire cluster as of the time when the snapshot was taken.

      struct Snapshot
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the snapshot.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The configuration of the cluster from which the snapshot was taken

        @[JSON::Field(key: "ClusterConfiguration")]
        getter cluster_configuration : Types::ClusterConfiguration?

        # Enables data tiering. Data tiering is only supported for clusters using the r6gd node type. This
        # parameter must be set when using r6gd nodes. For more information, see Data tiering .

        @[JSON::Field(key: "DataTiering")]
        getter data_tiering : String?

        # The ID of the KMS key used to encrypt the snapshot.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The name of the snapshot

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates whether the snapshot is from an automatic backup (automated) or was created manually
        # (manual).

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The status of the snapshot. Valid values: creating | available | restoring | copying | deleting.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @cluster_configuration : Types::ClusterConfiguration? = nil,
          @data_tiering : String? = nil,
          @kms_key_id : String? = nil,
          @name : String? = nil,
          @source : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A snapshot with the specified name already exists.

      struct SnapshotAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified snapshot does not exist.

      struct SnapshotNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of snapshots allowed.

      struct SnapshotQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the subnet associated with a cluster. This parameter refers to subnets defined in Amazon
      # Virtual Private Cloud (Amazon VPC) and used with MemoryDB.

      struct Subnet
        include JSON::Serializable

        # The Availability Zone where the subnet resides

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : Types::AvailabilityZone?

        # The unique identifier for the subnet.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # The network types supported by this subnet. Returns an array of strings that can include 'ipv4',
        # 'ipv6', or both, indicating whether the subnet supports IPv4 only, IPv6 only, or dual-stack
        # deployments.

        @[JSON::Field(key: "SupportedNetworkTypes")]
        getter supported_network_types : Array(String)?

        def initialize(
          @availability_zone : Types::AvailabilityZone? = nil,
          @identifier : String? = nil,
          @supported_network_types : Array(String)? = nil
        )
        end
      end

      # Represents the output of one of the following operations: CreateSubnetGroup UpdateSubnetGroup A
      # subnet group is a collection of subnets (typically private) that you can designate for your clusters
      # running in an Amazon Virtual Private Cloud (VPC) environment.

      struct SubnetGroup
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the subnet group.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A description of the subnet group

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the subnet group

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of subnets associated with the subnet group.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(Types::Subnet)?

        # The network types supported by this subnet group. Returns an array of strings that can include
        # 'ipv4', 'ipv6', or both, indicating the IP address types that can be used for clusters deployed in
        # this subnet group.

        @[JSON::Field(key: "SupportedNetworkTypes")]
        getter supported_network_types : Array(String)?

        # The Amazon Virtual Private Cloud identifier (VPC ID) of the subnet group.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @subnets : Array(Types::Subnet)? = nil,
          @supported_network_types : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # A subnet group with the specified name already exists.

      struct SubnetGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The subnet group is currently in use and cannot be deleted.

      struct SubnetGroupInUseFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified subnet group does not exist.

      struct SubnetGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of subnet groups allowed.

      struct SubnetGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The subnet is currently in use and cannot be deleted.

      struct SubnetInUse
        include JSON::Serializable

        def initialize
        end
      end

      # The specified subnet is not allowed for this operation.

      struct SubnetNotAllowedFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of subnets allowed.

      struct SubnetQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # A tag that can be added to an MemoryDB resource. Tags are composed of a Key/Value pair. You can use
      # tags to categorize and track all your MemoryDB resources. When you add or remove tags on clusters,
      # those actions will be replicated to all nodes in the cluster. A tag with a null Value is permitted.
      # For more information, see Tagging your MemoryDB resources

      struct Tag
        include JSON::Serializable

        # The key for the tag. May not be null.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The tag's value. May be null.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The specified tag does not exist.

      struct TagNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of tags allowed per
      # resource.

      struct TagQuotaPerResourceExceeded
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which the tags are to be added.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.

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

        # A list of tags as key-value pairs.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # Test failover is not available for this cluster configuration.

      struct TestFailoverNotAvailableFault
        include JSON::Serializable

        def initialize
        end
      end

      # A cluster whose updates have failed

      struct UnprocessedCluster
        include JSON::Serializable

        # The name of the cluster

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String?

        # The error message associated with the update failure

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The error type associated with the update failure

        @[JSON::Field(key: "ErrorType")]
        getter error_type : String?

        def initialize(
          @cluster_name : String? = nil,
          @error_message : String? = nil,
          @error_type : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which the tags are to be removed.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of keys of the tags that are to be removed.

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

        # The list of tags removed.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end


      struct UpdateACLRequest
        include JSON::Serializable

        # The name of the Access Control List.

        @[JSON::Field(key: "ACLName")]
        getter acl_name : String

        # The list of users to add to the Access Control List.

        @[JSON::Field(key: "UserNamesToAdd")]
        getter user_names_to_add : Array(String)?

        # The list of users to remove from the Access Control List.

        @[JSON::Field(key: "UserNamesToRemove")]
        getter user_names_to_remove : Array(String)?

        def initialize(
          @acl_name : String,
          @user_names_to_add : Array(String)? = nil,
          @user_names_to_remove : Array(String)? = nil
        )
        end
      end


      struct UpdateACLResponse
        include JSON::Serializable

        # The updated Access Control List.

        @[JSON::Field(key: "ACL")]
        getter acl : Types::ACL?

        def initialize(
          @acl : Types::ACL? = nil
        )
        end
      end


      struct UpdateClusterRequest
        include JSON::Serializable

        # The name of the cluster to update.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # The Access Control List that is associated with the cluster.

        @[JSON::Field(key: "ACLName")]
        getter acl_name : String?

        # The description of the cluster to update.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the engine to be used for the cluster.

        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The upgraded version of the engine to be run on the nodes. You can upgrade to a newer engine
        # version, but you cannot downgrade to an earlier engine version. If you want to use an earlier engine
        # version, you must delete the existing cluster and create it anew with the earlier engine version.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The mechanism for discovering IP addresses for the cluster discovery protocol. Valid values are
        # 'ipv4' or 'ipv6'. When set to 'ipv4', cluster discovery functions such as cluster slots, cluster
        # shards, and cluster nodes will return IPv4 addresses for cluster nodes. When set to 'ipv6', the
        # cluster discovery functions return IPv6 addresses for cluster nodes. The value must be compatible
        # with the NetworkType parameter. If not specified, the default is 'ipv4'.

        @[JSON::Field(key: "IpDiscovery")]
        getter ip_discovery : String?

        # Specifies the weekly time range during which maintenance on the cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period. Valid values for ddd are: sun mon tue wed thu fri sat Example:
        # sun:23:00-mon:01:30

        @[JSON::Field(key: "MaintenanceWindow")]
        getter maintenance_window : String?

        # A valid node type that you want to scale this cluster up or down to.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The name of the parameter group to update.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String?

        # The number of replicas that will reside in each shard.

        @[JSON::Field(key: "ReplicaConfiguration")]
        getter replica_configuration : Types::ReplicaConfigurationRequest?

        # The SecurityGroupIds to update.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The number of shards in the cluster.

        @[JSON::Field(key: "ShardConfiguration")]
        getter shard_configuration : Types::ShardConfigurationRequest?

        # The number of days for which MemoryDB retains automatic cluster snapshots before deleting them. For
        # example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for 5
        # days before being deleted.

        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The daily time range (in UTC) during which MemoryDB begins taking a daily snapshot of your cluster.

        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # The SNS topic ARN to update.

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The status of the Amazon SNS notification topic. Notifications are sent only if the status is
        # active.

        @[JSON::Field(key: "SnsTopicStatus")]
        getter sns_topic_status : String?

        def initialize(
          @cluster_name : String,
          @acl_name : String? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @ip_discovery : String? = nil,
          @maintenance_window : String? = nil,
          @node_type : String? = nil,
          @parameter_group_name : String? = nil,
          @replica_configuration : Types::ReplicaConfigurationRequest? = nil,
          @security_group_ids : Array(String)? = nil,
          @shard_configuration : Types::ShardConfigurationRequest? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil,
          @sns_topic_arn : String? = nil,
          @sns_topic_status : String? = nil
        )
        end
      end


      struct UpdateClusterResponse
        include JSON::Serializable

        # The updated cluster.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct UpdateMultiRegionClusterRequest
        include JSON::Serializable

        # The name of the multi-Region cluster to be updated.

        @[JSON::Field(key: "MultiRegionClusterName")]
        getter multi_region_cluster_name : String

        # A new description for the multi-Region cluster.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new engine version to be used for the multi-Region cluster.

        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The new multi-Region parameter group to be associated with the cluster.

        @[JSON::Field(key: "MultiRegionParameterGroupName")]
        getter multi_region_parameter_group_name : String?

        # The new node type to be used for the multi-Region cluster.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?


        @[JSON::Field(key: "ShardConfiguration")]
        getter shard_configuration : Types::ShardConfigurationRequest?

        # The strategy to use for the update operation. Supported values are "coordinated" or "uncoordinated".

        @[JSON::Field(key: "UpdateStrategy")]
        getter update_strategy : String?

        def initialize(
          @multi_region_cluster_name : String,
          @description : String? = nil,
          @engine_version : String? = nil,
          @multi_region_parameter_group_name : String? = nil,
          @node_type : String? = nil,
          @shard_configuration : Types::ShardConfigurationRequest? = nil,
          @update_strategy : String? = nil
        )
        end
      end


      struct UpdateMultiRegionClusterResponse
        include JSON::Serializable

        # The status of updating the multi-Region cluster.

        @[JSON::Field(key: "MultiRegionCluster")]
        getter multi_region_cluster : Types::MultiRegionCluster?

        def initialize(
          @multi_region_cluster : Types::MultiRegionCluster? = nil
        )
        end
      end


      struct UpdateParameterGroupRequest
        include JSON::Serializable

        # The name of the parameter group to update.

        @[JSON::Field(key: "ParameterGroupName")]
        getter parameter_group_name : String

        # An array of parameter names and values for the parameter update. You must supply at least one
        # parameter name and value; subsequent arguments are optional. A maximum of 20 parameters may be
        # updated per request.

        @[JSON::Field(key: "ParameterNameValues")]
        getter parameter_name_values : Array(Types::ParameterNameValue)

        def initialize(
          @parameter_group_name : String,
          @parameter_name_values : Array(Types::ParameterNameValue)
        )
        end
      end


      struct UpdateParameterGroupResponse
        include JSON::Serializable

        # The updated parameter group

        @[JSON::Field(key: "ParameterGroup")]
        getter parameter_group : Types::ParameterGroup?

        def initialize(
          @parameter_group : Types::ParameterGroup? = nil
        )
        end
      end


      struct UpdateSubnetGroupRequest
        include JSON::Serializable

        # The name of the subnet group

        @[JSON::Field(key: "SubnetGroupName")]
        getter subnet_group_name : String

        # A description of the subnet group

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The EC2 subnet IDs for the subnet group.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @subnet_group_name : String,
          @description : String? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end


      struct UpdateSubnetGroupResponse
        include JSON::Serializable

        # The updated subnet group

        @[JSON::Field(key: "SubnetGroup")]
        getter subnet_group : Types::SubnetGroup?

        def initialize(
          @subnet_group : Types::SubnetGroup? = nil
        )
        end
      end


      struct UpdateUserRequest
        include JSON::Serializable

        # The name of the user

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # Access permissions string used for this user.

        @[JSON::Field(key: "AccessString")]
        getter access_string : String?

        # Denotes the user's authentication properties, such as whether it requires a password to
        # authenticate.

        @[JSON::Field(key: "AuthenticationMode")]
        getter authentication_mode : Types::AuthenticationMode?

        def initialize(
          @user_name : String,
          @access_string : String? = nil,
          @authentication_mode : Types::AuthenticationMode? = nil
        )
        end
      end


      struct UpdateUserResponse
        include JSON::Serializable

        # The updated user

        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end

      # You create users and assign them specific permissions by using an access string. You assign the
      # users to Access Control Lists aligned with a specific role (administrators, human resources) that
      # are then deployed to one or more MemoryDB clusters.

      struct User
        include JSON::Serializable

        # The names of the Access Control Lists to which the user belongs

        @[JSON::Field(key: "ACLNames")]
        getter acl_names : Array(String)?

        # The Amazon Resource Name (ARN) of the user.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # Access permissions string used for this user.

        @[JSON::Field(key: "AccessString")]
        getter access_string : String?

        # Denotes whether the user requires a password to authenticate.

        @[JSON::Field(key: "Authentication")]
        getter authentication : Types::Authentication?

        # The minimum engine version supported for the user

        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # The name of the user

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates the user status. Can be "active", "modifying" or "deleting".

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @acl_names : Array(String)? = nil,
          @arn : String? = nil,
          @access_string : String? = nil,
          @authentication : Types::Authentication? = nil,
          @minimum_engine_version : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A user with the specified name already exists.

      struct UserAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified user does not exist.

      struct UserNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of users allowed.

      struct UserQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
