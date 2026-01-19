require "json"
require "time"

module AwsSdk
  module ElastiCache
    module Types

      # The customer has exceeded the allowed rate of API calls.
      struct APICallRateForCustomerExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of an AddTagsToResource operation.
      struct AddTagsToResourceMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which the tags are to be added, for example
        # arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster or
        # arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot . ElastiCache resources are cluster and
        # snapshot . For more information about ARNs, see Amazon Resource Names (ARNs) and Amazon Service
        # Namespaces .
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Represents the allowed node types you can use to modify your cluster or replication group.
      struct AllowedNodeTypeModificationsMessage
        include JSON::Serializable

        # A string list, each element of which specifies a cache node type which you can use to scale your
        # cluster or replication group. When scaling down a Valkey or Redis OSS cluster or replication group
        # using ModifyCacheCluster or ModifyReplicationGroup, use a value from this list for the CacheNodeType
        # parameter.
        @[JSON::Field(key: "ScaleDownModifications")]
        getter scale_down_modifications : Array(String)?

        # A string list, each element of which specifies a cache node type which you can use to scale your
        # cluster or replication group. When scaling up a Valkey or Redis OSS cluster or replication group
        # using ModifyCacheCluster or ModifyReplicationGroup , use a value from this list for the
        # CacheNodeType parameter.
        @[JSON::Field(key: "ScaleUpModifications")]
        getter scale_up_modifications : Array(String)?

        def initialize(
          @scale_down_modifications : Array(String)? = nil,
          @scale_up_modifications : Array(String)? = nil
        )
        end
      end

      # Indicates whether the user requires a password to authenticate.
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

      # Specifies the authentication mode to use.
      struct AuthenticationMode
        include JSON::Serializable

        # Specifies the passwords to use for authentication if Type is set to password .
        @[JSON::Field(key: "Passwords")]
        getter passwords : Array(String)?

        # Specifies the authentication type. Possible options are IAM authentication, password and no
        # password.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @passwords : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # The specified Amazon EC2 security group is already authorized for the specified cache security
      # group.
      struct AuthorizationAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified Amazon EC2 security group is not authorized for the specified cache security group.
      struct AuthorizationNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of an AuthorizeCacheSecurityGroupIngress operation.
      struct AuthorizeCacheSecurityGroupIngressMessage
        include JSON::Serializable

        # The cache security group that allows network ingress.
        @[JSON::Field(key: "CacheSecurityGroupName")]
        getter cache_security_group_name : String

        # The Amazon EC2 security group to be authorized for ingress to the cache security group.
        @[JSON::Field(key: "EC2SecurityGroupName")]
        getter ec2_security_group_name : String

        # The Amazon account number of the Amazon EC2 security group owner. Note that this is not the same
        # thing as an Amazon access key ID - you must provide a valid Amazon account number for this
        # parameter.
        @[JSON::Field(key: "EC2SecurityGroupOwnerId")]
        getter ec2_security_group_owner_id : String

        def initialize(
          @cache_security_group_name : String,
          @ec2_security_group_name : String,
          @ec2_security_group_owner_id : String
        )
        end
      end

      struct AuthorizeCacheSecurityGroupIngressResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheSecurityGroup")]
        getter cache_security_group : Types::CacheSecurityGroup?

        def initialize(
          @cache_security_group : Types::CacheSecurityGroup? = nil
        )
        end
      end

      # Describes an Availability Zone in which the cluster is launched.
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

      struct BatchApplyUpdateActionMessage
        include JSON::Serializable

        # The unique ID of the service update
        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String

        # The cache cluster IDs
        @[JSON::Field(key: "CacheClusterIds")]
        getter cache_cluster_ids : Array(String)?

        # The replication group IDs
        @[JSON::Field(key: "ReplicationGroupIds")]
        getter replication_group_ids : Array(String)?

        def initialize(
          @service_update_name : String,
          @cache_cluster_ids : Array(String)? = nil,
          @replication_group_ids : Array(String)? = nil
        )
        end
      end

      struct BatchStopUpdateActionMessage
        include JSON::Serializable

        # The unique ID of the service update
        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String

        # The cache cluster IDs
        @[JSON::Field(key: "CacheClusterIds")]
        getter cache_cluster_ids : Array(String)?

        # The replication group IDs
        @[JSON::Field(key: "ReplicationGroupIds")]
        getter replication_group_ids : Array(String)?

        def initialize(
          @service_update_name : String,
          @cache_cluster_ids : Array(String)? = nil,
          @replication_group_ids : Array(String)? = nil
        )
        end
      end

      # Contains all of the attributes of a specific cluster.
      struct CacheCluster
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the cache cluster.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A flag that enables encryption at-rest when set to true . You cannot modify the value of
        # AtRestEncryptionEnabled after the cluster is created. To enable at-rest encryption on a cluster you
        # must set AtRestEncryptionEnabled to true when you create a cluster. Required: Only available when
        # creating a replication group in an Amazon VPC using Redis OSS version 3.2.6 , 4.x or later. Default:
        # false
        @[JSON::Field(key: "AtRestEncryptionEnabled")]
        getter at_rest_encryption_enabled : Bool?

        # A flag that enables using an AuthToken (password) when issuing Valkey or Redis OSS commands.
        # Default: false
        @[JSON::Field(key: "AuthTokenEnabled")]
        getter auth_token_enabled : Bool?

        # The date the auth token was last modified
        @[JSON::Field(key: "AuthTokenLastModifiedDate")]
        getter auth_token_last_modified_date : Time?

        # If you are running Valkey or Redis OSS engine version 6.0 or later, set this parameter to yes if you
        # want to opt-in to the next auto minor version upgrade campaign. This parameter is disabled for
        # previous versions.
        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # The date and time when the cluster was created.
        @[JSON::Field(key: "CacheClusterCreateTime")]
        getter cache_cluster_create_time : Time?

        # The user-supplied identifier of the cluster. This identifier is a unique key that identifies a
        # cluster.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The current state of this cluster, one of the following values: available , creating , deleted ,
        # deleting , incompatible-network , modifying , rebooting cluster nodes , restore-failed , or
        # snapshotting .
        @[JSON::Field(key: "CacheClusterStatus")]
        getter cache_cluster_status : String?

        # The name of the compute and memory capacity node type for the cluster. The following node types are
        # supported by ElastiCache. Generally speaking, the current generation types provide more memory and
        # computational power at lower cost when compared to their equivalent previous generation
        # counterparts. General purpose: Current generation: M7g node types : cache.m7g.large ,
        # cache.m7g.xlarge , cache.m7g.2xlarge , cache.m7g.4xlarge , cache.m7g.8xlarge , cache.m7g.12xlarge ,
        # cache.m7g.16xlarge For region availability, see Supported Node Types M6g node types (available only
        # for Redis OSS engine version 5.0.6 onward and for Memcached engine version 1.5.16 onward):
        # cache.m6g.large , cache.m6g.xlarge , cache.m6g.2xlarge , cache.m6g.4xlarge , cache.m6g.8xlarge ,
        # cache.m6g.12xlarge , cache.m6g.16xlarge M5 node types: cache.m5.large , cache.m5.xlarge ,
        # cache.m5.2xlarge , cache.m5.4xlarge , cache.m5.12xlarge , cache.m5.24xlarge M4 node types:
        # cache.m4.large , cache.m4.xlarge , cache.m4.2xlarge , cache.m4.4xlarge , cache.m4.10xlarge T4g node
        # types (available only for Redis OSS engine version 5.0.6 onward and Memcached engine version 1.5.16
        # onward): cache.t4g.micro , cache.t4g.small , cache.t4g.medium T3 node types: cache.t3.micro ,
        # cache.t3.small , cache.t3.medium T2 node types: cache.t2.micro , cache.t2.small , cache.t2.medium
        # Previous generation: (not recommended. Existing clusters are still supported but creation of new
        # clusters is not supported for these types.) T1 node types: cache.t1.micro M1 node types:
        # cache.m1.small , cache.m1.medium , cache.m1.large , cache.m1.xlarge M3 node types: cache.m3.medium ,
        # cache.m3.large , cache.m3.xlarge , cache.m3.2xlarge Compute optimized: Previous generation: (not
        # recommended. Existing clusters are still supported but creation of new clusters is not supported for
        # these types.) C1 node types: cache.c1.xlarge Memory optimized: Current generation: R7g node types :
        # cache.r7g.large , cache.r7g.xlarge , cache.r7g.2xlarge , cache.r7g.4xlarge , cache.r7g.8xlarge ,
        # cache.r7g.12xlarge , cache.r7g.16xlarge For region availability, see Supported Node Types R6g node
        # types (available only for Redis OSS engine version 5.0.6 onward and for Memcached engine version
        # 1.5.16 onward): cache.r6g.large , cache.r6g.xlarge , cache.r6g.2xlarge , cache.r6g.4xlarge ,
        # cache.r6g.8xlarge , cache.r6g.12xlarge , cache.r6g.16xlarge R5 node types: cache.r5.large ,
        # cache.r5.xlarge , cache.r5.2xlarge , cache.r5.4xlarge , cache.r5.12xlarge , cache.r5.24xlarge R4
        # node types: cache.r4.large , cache.r4.xlarge , cache.r4.2xlarge , cache.r4.4xlarge ,
        # cache.r4.8xlarge , cache.r4.16xlarge Previous generation: (not recommended. Existing clusters are
        # still supported but creation of new clusters is not supported for these types.) M2 node types:
        # cache.m2.xlarge , cache.m2.2xlarge , cache.m2.4xlarge R3 node types: cache.r3.large ,
        # cache.r3.xlarge , cache.r3.2xlarge , cache.r3.4xlarge , cache.r3.8xlarge Additional node type info
        # All current generation instance types are created in Amazon VPC by default. Valkey or Redis OSS
        # append-only files (AOF) are not supported for T1 or T2 instances. Valkey or Redis OSS Multi-AZ with
        # automatic failover is not supported on T1 instances. The configuration variables appendonly and
        # appendfsync are not supported on Valkey, or on Redis OSS version 2.8.22 and later.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # A list of cache nodes that are members of the cluster.
        @[JSON::Field(key: "CacheNodes")]
        getter cache_nodes : Array(Types::CacheNode)?

        # Status of the cache parameter group.
        @[JSON::Field(key: "CacheParameterGroup")]
        getter cache_parameter_group : Types::CacheParameterGroupStatus?

        # A list of cache security group elements, composed of name and status sub-elements.
        @[JSON::Field(key: "CacheSecurityGroups")]
        getter cache_security_groups : Array(Types::CacheSecurityGroupMembership)?

        # The name of the cache subnet group associated with the cluster.
        @[JSON::Field(key: "CacheSubnetGroupName")]
        getter cache_subnet_group_name : String?

        # The URL of the web page where you can download the latest ElastiCache client library.
        @[JSON::Field(key: "ClientDownloadLandingPage")]
        getter client_download_landing_page : String?

        # Represents a Memcached cluster endpoint which can be used by an application to connect to any node
        # in the cluster. The configuration endpoint will always have .cfg in it. Example: mem-3.9dvc4r .cfg
        # .usw2.cache.amazonaws.com:11211
        @[JSON::Field(key: "ConfigurationEndpoint")]
        getter configuration_endpoint : Types::Endpoint?

        # The name of the cache engine ( memcached or redis ) to be used for this cluster.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version of the cache engine that is used in this cluster.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The network type associated with the cluster, either ipv4 | ipv6 . IPv6 is supported for workloads
        # using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 or Memcached engine version 1.6.6
        # and above on all instances built on the Nitro system .
        @[JSON::Field(key: "IpDiscovery")]
        getter ip_discovery : String?

        # Returns the destination, format and type of the logs.
        @[JSON::Field(key: "LogDeliveryConfigurations")]
        getter log_delivery_configurations : Array(Types::LogDeliveryConfiguration)?

        # Must be either ipv4 | ipv6 | dual_stack . IPv6 is supported for workloads using Valkey 7.2 and
        # above, Redis OSS engine version 6.2 7.1 or Memcached engine version 1.6.6 and above on all instances
        # built on the Nitro system .
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # Describes a notification topic and its status. Notification topics are used for publishing
        # ElastiCache events to subscribers using Amazon Simple Notification Service (SNS).
        @[JSON::Field(key: "NotificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration?

        # The number of cache nodes in the cluster. For clusters running Valkey or Redis OSS, this value must
        # be 1. For clusters running Memcached, this value must be between 1 and 40.
        @[JSON::Field(key: "NumCacheNodes")]
        getter num_cache_nodes : Int32?

        @[JSON::Field(key: "PendingModifiedValues")]
        getter pending_modified_values : Types::PendingModifiedValues?

        # The name of the Availability Zone in which the cluster is located or "Multiple" if the cache nodes
        # are located in different Availability Zones.
        @[JSON::Field(key: "PreferredAvailabilityZone")]
        getter preferred_availability_zone : String?

        # Specifies the weekly time range during which maintenance on the cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period. Valid values for ddd are: sun mon tue wed thu fri sat Example:
        # sun:23:00-mon:01:30
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # The outpost ARN in which the cache cluster is created.
        @[JSON::Field(key: "PreferredOutpostArn")]
        getter preferred_outpost_arn : String?

        # The replication group to which this cluster belongs. If this field is empty, the cluster is not
        # associated with any replication group.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # A boolean value indicating whether log delivery is enabled for the replication group.
        @[JSON::Field(key: "ReplicationGroupLogDeliveryEnabled")]
        getter replication_group_log_delivery_enabled : Bool?

        # A list of VPC Security Groups associated with the cluster.
        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(Types::SecurityGroupMembership)?

        # The number of days for which ElastiCache retains automatic cluster snapshots before deleting them.
        # For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for
        # 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are
        # turned off.
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your
        # cluster. Example: 05:00-09:00
        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # A flag that enables in-transit encryption when set to true . Required: Only available when creating
        # a replication group in an Amazon VPC using Redis OSS version 3.2.6 , 4.x or later. Default: false
        @[JSON::Field(key: "TransitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        # A setting that allows you to migrate your clients to use in-transit encryption, with no downtime.
        @[JSON::Field(key: "TransitEncryptionMode")]
        getter transit_encryption_mode : String?

        def initialize(
          @arn : String? = nil,
          @at_rest_encryption_enabled : Bool? = nil,
          @auth_token_enabled : Bool? = nil,
          @auth_token_last_modified_date : Time? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @cache_cluster_create_time : Time? = nil,
          @cache_cluster_id : String? = nil,
          @cache_cluster_status : String? = nil,
          @cache_node_type : String? = nil,
          @cache_nodes : Array(Types::CacheNode)? = nil,
          @cache_parameter_group : Types::CacheParameterGroupStatus? = nil,
          @cache_security_groups : Array(Types::CacheSecurityGroupMembership)? = nil,
          @cache_subnet_group_name : String? = nil,
          @client_download_landing_page : String? = nil,
          @configuration_endpoint : Types::Endpoint? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @ip_discovery : String? = nil,
          @log_delivery_configurations : Array(Types::LogDeliveryConfiguration)? = nil,
          @network_type : String? = nil,
          @notification_configuration : Types::NotificationConfiguration? = nil,
          @num_cache_nodes : Int32? = nil,
          @pending_modified_values : Types::PendingModifiedValues? = nil,
          @preferred_availability_zone : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @preferred_outpost_arn : String? = nil,
          @replication_group_id : String? = nil,
          @replication_group_log_delivery_enabled : Bool? = nil,
          @security_groups : Array(Types::SecurityGroupMembership)? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil,
          @transit_encryption_enabled : Bool? = nil,
          @transit_encryption_mode : String? = nil
        )
        end
      end

      # You already have a cluster with the given identifier.
      struct CacheClusterAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of a DescribeCacheClusters operation.
      struct CacheClusterMessage
        include JSON::Serializable

        # A list of clusters. Each item in the list contains detailed information about one cluster.
        @[JSON::Field(key: "CacheClusters")]
        getter cache_clusters : Array(Types::CacheCluster)?

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cache_clusters : Array(Types::CacheCluster)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The requested cluster ID does not refer to an existing cluster.
      struct CacheClusterNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Provides all of the details about a particular cache engine version.
      struct CacheEngineVersion
        include JSON::Serializable

        # The description of the cache engine.
        @[JSON::Field(key: "CacheEngineDescription")]
        getter cache_engine_description : String?

        # The description of the cache engine version.
        @[JSON::Field(key: "CacheEngineVersionDescription")]
        getter cache_engine_version_description : String?

        # The name of the cache parameter group family associated with this cache engine. Valid values are:
        # memcached1.4 | memcached1.5 | memcached1.6 | redis2.6 | redis2.8 | redis3.2 | redis4.0 | redis5.0 |
        # redis6.x | redis7
        @[JSON::Field(key: "CacheParameterGroupFamily")]
        getter cache_parameter_group_family : String?

        # The name of the cache engine.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version number of the cache engine.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        def initialize(
          @cache_engine_description : String? = nil,
          @cache_engine_version_description : String? = nil,
          @cache_parameter_group_family : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil
        )
        end
      end

      # Represents the output of a DescribeCacheEngineVersions operation.
      struct CacheEngineVersionMessage
        include JSON::Serializable

        # A list of cache engine version details. Each element in the list contains detailed information about
        # one cache engine version.
        @[JSON::Field(key: "CacheEngineVersions")]
        getter cache_engine_versions : Array(Types::CacheEngineVersion)?

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cache_engine_versions : Array(Types::CacheEngineVersion)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Represents an individual cache node within a cluster. Each cache node runs its own instance of the
      # cluster's protocol-compliant caching software - either Memcached, Valkey or Redis OSS. The following
      # node types are supported by ElastiCache. Generally speaking, the current generation types provide
      # more memory and computational power at lower cost when compared to their equivalent previous
      # generation counterparts. General purpose: Current generation: M7g node types : cache.m7g.large ,
      # cache.m7g.xlarge , cache.m7g.2xlarge , cache.m7g.4xlarge , cache.m7g.8xlarge , cache.m7g.12xlarge ,
      # cache.m7g.16xlarge For region availability, see Supported Node Types M6g node types (available only
      # for Redis OSS engine version 5.0.6 onward and for Memcached engine version 1.5.16 onward):
      # cache.m6g.large , cache.m6g.xlarge , cache.m6g.2xlarge , cache.m6g.4xlarge , cache.m6g.8xlarge ,
      # cache.m6g.12xlarge , cache.m6g.16xlarge M5 node types: cache.m5.large , cache.m5.xlarge ,
      # cache.m5.2xlarge , cache.m5.4xlarge , cache.m5.12xlarge , cache.m5.24xlarge M4 node types:
      # cache.m4.large , cache.m4.xlarge , cache.m4.2xlarge , cache.m4.4xlarge , cache.m4.10xlarge T4g node
      # types (available only for Redis OSS engine version 5.0.6 onward and Memcached engine version 1.5.16
      # onward): cache.t4g.micro , cache.t4g.small , cache.t4g.medium T3 node types: cache.t3.micro ,
      # cache.t3.small , cache.t3.medium T2 node types: cache.t2.micro , cache.t2.small , cache.t2.medium
      # Previous generation: (not recommended. Existing clusters are still supported but creation of new
      # clusters is not supported for these types.) T1 node types: cache.t1.micro M1 node types:
      # cache.m1.small , cache.m1.medium , cache.m1.large , cache.m1.xlarge M3 node types: cache.m3.medium ,
      # cache.m3.large , cache.m3.xlarge , cache.m3.2xlarge Compute optimized: Previous generation: (not
      # recommended. Existing clusters are still supported but creation of new clusters is not supported for
      # these types.) C1 node types: cache.c1.xlarge Memory optimized: Current generation: R7g node types :
      # cache.r7g.large , cache.r7g.xlarge , cache.r7g.2xlarge , cache.r7g.4xlarge , cache.r7g.8xlarge ,
      # cache.r7g.12xlarge , cache.r7g.16xlarge For region availability, see Supported Node Types R6g node
      # types (available only for Redis OSS engine version 5.0.6 onward and for Memcached engine version
      # 1.5.16 onward): cache.r6g.large , cache.r6g.xlarge , cache.r6g.2xlarge , cache.r6g.4xlarge ,
      # cache.r6g.8xlarge , cache.r6g.12xlarge , cache.r6g.16xlarge R5 node types: cache.r5.large ,
      # cache.r5.xlarge , cache.r5.2xlarge , cache.r5.4xlarge , cache.r5.12xlarge , cache.r5.24xlarge R4
      # node types: cache.r4.large , cache.r4.xlarge , cache.r4.2xlarge , cache.r4.4xlarge ,
      # cache.r4.8xlarge , cache.r4.16xlarge Previous generation: (not recommended. Existing clusters are
      # still supported but creation of new clusters is not supported for these types.) M2 node types:
      # cache.m2.xlarge , cache.m2.2xlarge , cache.m2.4xlarge R3 node types: cache.r3.large ,
      # cache.r3.xlarge , cache.r3.2xlarge , cache.r3.4xlarge , cache.r3.8xlarge Additional node type info
      # All current generation instance types are created in Amazon VPC by default. Valkey or Redis OSS
      # append-only files (AOF) are not supported for T1 or T2 instances. Valkey or Redis OSS Multi-AZ with
      # automatic failover is not supported on T1 instances. The configuration variables appendonly and
      # appendfsync are not supported on Valkey, or on Redis OSS version 2.8.22 and later.
      struct CacheNode
        include JSON::Serializable

        # The date and time when the cache node was created.
        @[JSON::Field(key: "CacheNodeCreateTime")]
        getter cache_node_create_time : Time?

        # The cache node identifier. A node ID is a numeric identifier (0001, 0002, etc.). The combination of
        # cluster ID and node ID uniquely identifies every cache node used in a customer's Amazon account.
        @[JSON::Field(key: "CacheNodeId")]
        getter cache_node_id : String?

        # The current state of this cache node, one of the following values: available , creating , rebooting
        # , or deleting .
        @[JSON::Field(key: "CacheNodeStatus")]
        getter cache_node_status : String?

        # The Availability Zone where this node was created and now resides.
        @[JSON::Field(key: "CustomerAvailabilityZone")]
        getter customer_availability_zone : String?

        # The customer outpost ARN of the cache node.
        @[JSON::Field(key: "CustomerOutpostArn")]
        getter customer_outpost_arn : String?

        # The hostname for connecting to this cache node.
        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        # The status of the parameter group applied to this cache node.
        @[JSON::Field(key: "ParameterGroupStatus")]
        getter parameter_group_status : String?

        # The ID of the primary node to which this read replica node is synchronized. If this field is empty,
        # this node is not associated with a primary cluster.
        @[JSON::Field(key: "SourceCacheNodeId")]
        getter source_cache_node_id : String?

        def initialize(
          @cache_node_create_time : Time? = nil,
          @cache_node_id : String? = nil,
          @cache_node_status : String? = nil,
          @customer_availability_zone : String? = nil,
          @customer_outpost_arn : String? = nil,
          @endpoint : Types::Endpoint? = nil,
          @parameter_group_status : String? = nil,
          @source_cache_node_id : String? = nil
        )
        end
      end

      # A parameter that has a different value for each cache node type it is applied to. For example, in a
      # Valkey or Redis OSS cluster, a cache.m1.large cache node type would have a larger maxmemory value
      # than a cache.m1.small type.
      struct CacheNodeTypeSpecificParameter
        include JSON::Serializable

        # The valid range of values for the parameter.
        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : String?

        # A list of cache node types and their corresponding values for this parameter.
        @[JSON::Field(key: "CacheNodeTypeSpecificValues")]
        getter cache_node_type_specific_values : Array(Types::CacheNodeTypeSpecificValue)?

        # Indicates whether a change to the parameter is applied immediately or requires a reboot for the
        # change to be applied. You can force a reboot or wait until the next maintenance window's reboot. For
        # more information, see Rebooting a Cluster .
        @[JSON::Field(key: "ChangeType")]
        getter change_type : String?

        # The valid data type for the parameter.
        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # A description of the parameter.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether ( true ) or not ( false ) the parameter can be modified. Some parameters have
        # security or operational implications that prevent them from being changed.
        @[JSON::Field(key: "IsModifiable")]
        getter is_modifiable : Bool?

        # The earliest cache engine version to which the parameter can apply.
        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # The name of the parameter.
        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        # The source of the parameter value.
        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @allowed_values : String? = nil,
          @cache_node_type_specific_values : Array(Types::CacheNodeTypeSpecificValue)? = nil,
          @change_type : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @is_modifiable : Bool? = nil,
          @minimum_engine_version : String? = nil,
          @parameter_name : String? = nil,
          @source : String? = nil
        )
        end
      end

      # A value that applies only to a certain cache node type.
      struct CacheNodeTypeSpecificValue
        include JSON::Serializable

        # The cache node type for which this value applies.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The value for the cache node type.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @cache_node_type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The status of the service update on the cache node
      struct CacheNodeUpdateStatus
        include JSON::Serializable

        # The node ID of the cache cluster
        @[JSON::Field(key: "CacheNodeId")]
        getter cache_node_id : String?

        # The deletion date of the node
        @[JSON::Field(key: "NodeDeletionDate")]
        getter node_deletion_date : Time?

        # The end date of the update for a node
        @[JSON::Field(key: "NodeUpdateEndDate")]
        getter node_update_end_date : Time?

        # Reflects whether the update was initiated by the customer or automatically applied
        @[JSON::Field(key: "NodeUpdateInitiatedBy")]
        getter node_update_initiated_by : String?

        # The date when the update is triggered
        @[JSON::Field(key: "NodeUpdateInitiatedDate")]
        getter node_update_initiated_date : Time?

        # The start date of the update for a node
        @[JSON::Field(key: "NodeUpdateStartDate")]
        getter node_update_start_date : Time?

        # The update status of the node
        @[JSON::Field(key: "NodeUpdateStatus")]
        getter node_update_status : String?

        # The date when the NodeUpdateStatus was last modified&gt;
        @[JSON::Field(key: "NodeUpdateStatusModifiedDate")]
        getter node_update_status_modified_date : Time?

        def initialize(
          @cache_node_id : String? = nil,
          @node_deletion_date : Time? = nil,
          @node_update_end_date : Time? = nil,
          @node_update_initiated_by : String? = nil,
          @node_update_initiated_date : Time? = nil,
          @node_update_start_date : Time? = nil,
          @node_update_status : String? = nil,
          @node_update_status_modified_date : Time? = nil
        )
        end
      end

      # Represents the output of a CreateCacheParameterGroup operation.
      struct CacheParameterGroup
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the cache parameter group.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the cache parameter group family that this cache parameter group is compatible with.
        # Valid values are: memcached1.4 | memcached1.5 | memcached1.6 | redis2.6 | redis2.8 | redis3.2 |
        # redis4.0 | redis5.0 | redis6.x | redis7
        @[JSON::Field(key: "CacheParameterGroupFamily")]
        getter cache_parameter_group_family : String?

        # The name of the cache parameter group.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        # The description for this cache parameter group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether the parameter group is associated with a Global datastore
        @[JSON::Field(key: "IsGlobal")]
        getter is_global : Bool?

        def initialize(
          @arn : String? = nil,
          @cache_parameter_group_family : String? = nil,
          @cache_parameter_group_name : String? = nil,
          @description : String? = nil,
          @is_global : Bool? = nil
        )
        end
      end

      # A cache parameter group with the requested name already exists.
      struct CacheParameterGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of a DescribeCacheParameters operation.
      struct CacheParameterGroupDetails
        include JSON::Serializable

        # A list of parameters specific to a particular cache node type. Each element in the list contains
        # detailed information about one parameter.
        @[JSON::Field(key: "CacheNodeTypeSpecificParameters")]
        getter cache_node_type_specific_parameters : Array(Types::CacheNodeTypeSpecificParameter)?

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of Parameter instances.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @cache_node_type_specific_parameters : Array(Types::CacheNodeTypeSpecificParameter)? = nil,
          @marker : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end

      # Represents the output of one of the following operations: ModifyCacheParameterGroup
      # ResetCacheParameterGroup
      struct CacheParameterGroupNameMessage
        include JSON::Serializable

        # The name of the cache parameter group.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        def initialize(
          @cache_parameter_group_name : String? = nil
        )
        end
      end

      # The requested cache parameter group name does not refer to an existing cache parameter group.
      struct CacheParameterGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of cache security groups.
      struct CacheParameterGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Status of the cache parameter group.
      struct CacheParameterGroupStatus
        include JSON::Serializable

        # A list of the cache node IDs which need to be rebooted for parameter changes to be applied. A node
        # ID is a numeric identifier (0001, 0002, etc.).
        @[JSON::Field(key: "CacheNodeIdsToReboot")]
        getter cache_node_ids_to_reboot : Array(String)?

        # The name of the cache parameter group.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        # The status of parameter updates.
        @[JSON::Field(key: "ParameterApplyStatus")]
        getter parameter_apply_status : String?

        def initialize(
          @cache_node_ids_to_reboot : Array(String)? = nil,
          @cache_parameter_group_name : String? = nil,
          @parameter_apply_status : String? = nil
        )
        end
      end

      # Represents the output of a DescribeCacheParameterGroups operation.
      struct CacheParameterGroupsMessage
        include JSON::Serializable

        # A list of cache parameter groups. Each element in the list contains detailed information about one
        # cache parameter group.
        @[JSON::Field(key: "CacheParameterGroups")]
        getter cache_parameter_groups : Array(Types::CacheParameterGroup)?

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cache_parameter_groups : Array(Types::CacheParameterGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Represents the output of one of the following operations: AuthorizeCacheSecurityGroupIngress
      # CreateCacheSecurityGroup RevokeCacheSecurityGroupIngress
      struct CacheSecurityGroup
        include JSON::Serializable

        # The ARN of the cache security group,
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the cache security group.
        @[JSON::Field(key: "CacheSecurityGroupName")]
        getter cache_security_group_name : String?

        # The description of the cache security group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of Amazon EC2 security groups that are associated with this cache security group.
        @[JSON::Field(key: "EC2SecurityGroups")]
        getter ec2_security_groups : Array(Types::EC2SecurityGroup)?

        # The Amazon account ID of the cache security group owner.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        def initialize(
          @arn : String? = nil,
          @cache_security_group_name : String? = nil,
          @description : String? = nil,
          @ec2_security_groups : Array(Types::EC2SecurityGroup)? = nil,
          @owner_id : String? = nil
        )
        end
      end

      # A cache security group with the specified name already exists.
      struct CacheSecurityGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a cluster's status within a particular cache security group.
      struct CacheSecurityGroupMembership
        include JSON::Serializable

        # The name of the cache security group.
        @[JSON::Field(key: "CacheSecurityGroupName")]
        getter cache_security_group_name : String?

        # The membership status in the cache security group. The status changes when a cache security group is
        # modified, or when the cache security groups assigned to a cluster are modified.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @cache_security_group_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents the output of a DescribeCacheSecurityGroups operation.
      struct CacheSecurityGroupMessage
        include JSON::Serializable

        # A list of cache security groups. Each element in the list contains detailed information about one
        # group.
        @[JSON::Field(key: "CacheSecurityGroups")]
        getter cache_security_groups : Array(Types::CacheSecurityGroup)?

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cache_security_groups : Array(Types::CacheSecurityGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The requested cache security group name does not refer to an existing cache security group.
      struct CacheSecurityGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the allowed number of cache security groups.
      struct CacheSecurityGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of one of the following operations: CreateCacheSubnetGroup
      # ModifyCacheSubnetGroup
      struct CacheSubnetGroup
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the cache subnet group.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The description of the cache subnet group.
        @[JSON::Field(key: "CacheSubnetGroupDescription")]
        getter cache_subnet_group_description : String?

        # The name of the cache subnet group.
        @[JSON::Field(key: "CacheSubnetGroupName")]
        getter cache_subnet_group_name : String?

        # A list of subnets associated with the cache subnet group.
        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(Types::Subnet)?

        # Either ipv4 | ipv6 | dual_stack . IPv6 is supported for workloads using Valkey 7.2 and above, Redis
        # OSS engine version 6.2 to 7.1 or Memcached engine version 1.6.6 and above on all instances built on
        # the Nitro system .
        @[JSON::Field(key: "SupportedNetworkTypes")]
        getter supported_network_types : Array(String)?

        # The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet group.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @cache_subnet_group_description : String? = nil,
          @cache_subnet_group_name : String? = nil,
          @subnets : Array(Types::Subnet)? = nil,
          @supported_network_types : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The requested cache subnet group name is already in use by an existing cache subnet group.
      struct CacheSubnetGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested cache subnet group is currently in use.
      struct CacheSubnetGroupInUse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of a DescribeCacheSubnetGroups operation.
      struct CacheSubnetGroupMessage
        include JSON::Serializable

        # A list of cache subnet groups. Each element in the list contains detailed information about one
        # group.
        @[JSON::Field(key: "CacheSubnetGroups")]
        getter cache_subnet_groups : Array(Types::CacheSubnetGroup)?

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @cache_subnet_groups : Array(Types::CacheSubnetGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The requested cache subnet group name does not refer to an existing cache subnet group.
      struct CacheSubnetGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the allowed number of cache subnet groups.
      struct CacheSubnetGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the allowed number of subnets in a cache
      # subnet group.
      struct CacheSubnetQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The usage limits for storage and ElastiCache Processing Units for the cache.
      struct CacheUsageLimits
        include JSON::Serializable

        # The maximum data storage limit in the cache, expressed in Gigabytes.
        @[JSON::Field(key: "DataStorage")]
        getter data_storage : Types::DataStorage?

        @[JSON::Field(key: "ECPUPerSecond")]
        getter ecpu_per_second : Types::ECPUPerSecond?

        def initialize(
          @data_storage : Types::DataStorage? = nil,
          @ecpu_per_second : Types::ECPUPerSecond? = nil
        )
        end
      end

      # The configuration details of the CloudWatch Logs destination.
      struct CloudWatchLogsDestinationDetails
        include JSON::Serializable

        # The name of the CloudWatch Logs log group.
        @[JSON::Field(key: "LogGroup")]
        getter log_group : String?

        def initialize(
          @log_group : String? = nil
        )
        end
      end

      # The request cannot be processed because it would exceed the allowed number of clusters per customer.
      struct ClusterQuotaForCustomerExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      struct CompleteMigrationMessage
        include JSON::Serializable

        # The ID of the replication group to which data is being migrated.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        # Forces the migration to stop without ensuring that data is in sync. It is recommended to use this
        # option only to abort the migration and not recommended when application wants to continue migration
        # to ElastiCache.
        @[JSON::Field(key: "Force")]
        getter force : Bool?

        def initialize(
          @replication_group_id : String,
          @force : Bool? = nil
        )
        end
      end

      struct CompleteMigrationResponse
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      # Node group (shard) configuration options when adding or removing replicas. Each node group (shard)
      # configuration has the following members: NodeGroupId, NewReplicaCount, and
      # PreferredAvailabilityZones.
      struct ConfigureShard
        include JSON::Serializable

        # The number of replicas you want in this node group at the end of this operation. The maximum value
        # for NewReplicaCount is 5. The minimum value depends upon the type of Valkey or Redis OSS replication
        # group you are working with. The minimum number of replicas in a shard or replication group is:
        # Valkey or Redis OSS (cluster mode disabled) If Multi-AZ: 1 If Multi-AZ: 0 Valkey or Redis OSS
        # (cluster mode enabled): 0 (though you will not be able to failover to a replica if your primary node
        # fails)
        @[JSON::Field(key: "NewReplicaCount")]
        getter new_replica_count : Int32

        # The 4-digit id for the node group you are configuring. For Valkey or Redis OSS (cluster mode
        # disabled) replication groups, the node group id is always 0001. To find a Valkey or Redis OSS
        # (cluster mode enabled)'s node group's (shard's) id, see Finding a Shard's Id .
        @[JSON::Field(key: "NodeGroupId")]
        getter node_group_id : String

        # A list of PreferredAvailabilityZone strings that specify which availability zones the replication
        # group's nodes are to be in. The nummber of PreferredAvailabilityZone values must equal the value of
        # NewReplicaCount plus 1 to account for the primary node. If this member of ReplicaConfiguration is
        # omitted, ElastiCache selects the availability zone for each of the replicas.
        @[JSON::Field(key: "PreferredAvailabilityZones")]
        getter preferred_availability_zones : Array(String)?

        # The outpost ARNs in which the cache cluster is created.
        @[JSON::Field(key: "PreferredOutpostArns")]
        getter preferred_outpost_arns : Array(String)?

        def initialize(
          @new_replica_count : Int32,
          @node_group_id : String,
          @preferred_availability_zones : Array(String)? = nil,
          @preferred_outpost_arns : Array(String)? = nil
        )
        end
      end

      struct CopyServerlessCacheSnapshotRequest
        include JSON::Serializable

        # The identifier of the existing serverless cache’s snapshot to be copied. Available for Valkey, Redis
        # OSS and Serverless Memcached only.
        @[JSON::Field(key: "SourceServerlessCacheSnapshotName")]
        getter source_serverless_cache_snapshot_name : String

        # The identifier for the snapshot to be created. Available for Valkey, Redis OSS and Serverless
        # Memcached only.
        @[JSON::Field(key: "TargetServerlessCacheSnapshotName")]
        getter target_serverless_cache_snapshot_name : String

        # The identifier of the KMS key used to encrypt the target snapshot. Available for Valkey, Redis OSS
        # and Serverless Memcached only.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A list of tags to be added to the target snapshot resource. A tag is a key-value pair. Available for
        # Valkey, Redis OSS and Serverless Memcached only. Default: NULL
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @source_serverless_cache_snapshot_name : String,
          @target_serverless_cache_snapshot_name : String,
          @kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CopyServerlessCacheSnapshotResponse
        include JSON::Serializable

        # The response for the attempt to copy the serverless cache snapshot. Available for Valkey, Redis OSS
        # and Serverless Memcached only.
        @[JSON::Field(key: "ServerlessCacheSnapshot")]
        getter serverless_cache_snapshot : Types::ServerlessCacheSnapshot?

        def initialize(
          @serverless_cache_snapshot : Types::ServerlessCacheSnapshot? = nil
        )
        end
      end

      # Represents the input of a CopySnapshotMessage operation.
      struct CopySnapshotMessage
        include JSON::Serializable

        # The name of an existing snapshot from which to make a copy.
        @[JSON::Field(key: "SourceSnapshotName")]
        getter source_snapshot_name : String

        # A name for the snapshot copy. ElastiCache does not permit overwriting a snapshot, therefore this
        # name must be unique within its context - ElastiCache or an Amazon S3 bucket if exporting.
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
        # snapshot for external access. When using this parameter to export a snapshot, be sure Amazon
        # ElastiCache has the needed permissions to this S3 bucket. For more information, see Step 2: Grant
        # ElastiCache Access to Your Amazon S3 Bucket in the Amazon ElastiCache User Guide . For more
        # information, see Exporting a Snapshot in the Amazon ElastiCache User Guide .
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

      struct CopySnapshotResult
        include JSON::Serializable

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      # Represents the input of a CreateCacheCluster operation.
      struct CreateCacheClusterMessage
        include JSON::Serializable

        # The node group (shard) identifier. This parameter is stored as a lowercase string. Constraints: A
        # name must contain from 1 to 50 alphanumeric characters or hyphens. The first character must be a
        # letter. A name cannot end with a hyphen or contain two consecutive hyphens.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String

        # Specifies whether the nodes in this Memcached cluster are created in a single Availability Zone or
        # created across multiple Availability Zones in the cluster's region. This parameter is only supported
        # for Memcached clusters. If the AZMode and PreferredAvailabilityZones are not specified, ElastiCache
        # assumes single-az mode.
        @[JSON::Field(key: "AZMode")]
        getter az_mode : String?

        # Reserved parameter. The password used to access a password protected server. Password constraints:
        # Must be only printable ASCII characters. Must be at least 16 characters and no more than 128
        # characters in length. The only permitted printable special characters are !, &amp;, #, $, ^, &lt;,
        # &gt;, and -. Other printable special characters cannot be used in the AUTH token. For more
        # information, see AUTH password at http://redis.io/commands/AUTH.
        @[JSON::Field(key: "AuthToken")]
        getter auth_token : String?

        # If you are running Valkey 7.2 and above or Redis OSS engine version 6.0 and above, set this
        # parameter to yes to opt-in to the next auto minor version upgrade campaign. This parameter is
        # disabled for previous versions.
        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # The compute and memory capacity of the nodes in the node group (shard). The following node types are
        # supported by ElastiCache. Generally speaking, the current generation types provide more memory and
        # computational power at lower cost when compared to their equivalent previous generation
        # counterparts. General purpose: Current generation: M7g node types : cache.m7g.large ,
        # cache.m7g.xlarge , cache.m7g.2xlarge , cache.m7g.4xlarge , cache.m7g.8xlarge , cache.m7g.12xlarge ,
        # cache.m7g.16xlarge For region availability, see Supported Node Types M6g node types (available only
        # for Redis OSS engine version 5.0.6 onward and for Memcached engine version 1.5.16 onward):
        # cache.m6g.large , cache.m6g.xlarge , cache.m6g.2xlarge , cache.m6g.4xlarge , cache.m6g.8xlarge ,
        # cache.m6g.12xlarge , cache.m6g.16xlarge M5 node types: cache.m5.large , cache.m5.xlarge ,
        # cache.m5.2xlarge , cache.m5.4xlarge , cache.m5.12xlarge , cache.m5.24xlarge M4 node types:
        # cache.m4.large , cache.m4.xlarge , cache.m4.2xlarge , cache.m4.4xlarge , cache.m4.10xlarge T4g node
        # types (available only for Redis OSS engine version 5.0.6 onward and Memcached engine version 1.5.16
        # onward): cache.t4g.micro , cache.t4g.small , cache.t4g.medium T3 node types: cache.t3.micro ,
        # cache.t3.small , cache.t3.medium T2 node types: cache.t2.micro , cache.t2.small , cache.t2.medium
        # Previous generation: (not recommended. Existing clusters are still supported but creation of new
        # clusters is not supported for these types.) T1 node types: cache.t1.micro M1 node types:
        # cache.m1.small , cache.m1.medium , cache.m1.large , cache.m1.xlarge M3 node types: cache.m3.medium ,
        # cache.m3.large , cache.m3.xlarge , cache.m3.2xlarge Compute optimized: Previous generation: (not
        # recommended. Existing clusters are still supported but creation of new clusters is not supported for
        # these types.) C1 node types: cache.c1.xlarge Memory optimized: Current generation: R7g node types :
        # cache.r7g.large , cache.r7g.xlarge , cache.r7g.2xlarge , cache.r7g.4xlarge , cache.r7g.8xlarge ,
        # cache.r7g.12xlarge , cache.r7g.16xlarge For region availability, see Supported Node Types R6g node
        # types (available only for Redis OSS engine version 5.0.6 onward and for Memcached engine version
        # 1.5.16 onward): cache.r6g.large , cache.r6g.xlarge , cache.r6g.2xlarge , cache.r6g.4xlarge ,
        # cache.r6g.8xlarge , cache.r6g.12xlarge , cache.r6g.16xlarge R5 node types: cache.r5.large ,
        # cache.r5.xlarge , cache.r5.2xlarge , cache.r5.4xlarge , cache.r5.12xlarge , cache.r5.24xlarge R4
        # node types: cache.r4.large , cache.r4.xlarge , cache.r4.2xlarge , cache.r4.4xlarge ,
        # cache.r4.8xlarge , cache.r4.16xlarge Previous generation: (not recommended. Existing clusters are
        # still supported but creation of new clusters is not supported for these types.) M2 node types:
        # cache.m2.xlarge , cache.m2.2xlarge , cache.m2.4xlarge R3 node types: cache.r3.large ,
        # cache.r3.xlarge , cache.r3.2xlarge , cache.r3.4xlarge , cache.r3.8xlarge Additional node type info
        # All current generation instance types are created in Amazon VPC by default. Valkey or Redis OSS
        # append-only files (AOF) are not supported for T1 or T2 instances. Valkey or Redis OSS Multi-AZ with
        # automatic failover is not supported on T1 instances. The configuration variables appendonly and
        # appendfsync are not supported on Valkey, or on Redis OSS version 2.8.22 and later.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The name of the parameter group to associate with this cluster. If this argument is omitted, the
        # default parameter group for the specified engine is used. You cannot use any parameter group which
        # has cluster-enabled='yes' when creating a cluster.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        # A list of security group names to associate with this cluster. Use this parameter only when you are
        # creating a cluster outside of an Amazon Virtual Private Cloud (Amazon VPC).
        @[JSON::Field(key: "CacheSecurityGroupNames")]
        getter cache_security_group_names : Array(String)?

        # The name of the subnet group to be used for the cluster. Use this parameter only when you are
        # creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC). If you're going to launch your
        # cluster in an Amazon VPC, you need to create a subnet group before you start creating a cluster. For
        # more information, see Subnets and Subnet Groups .
        @[JSON::Field(key: "CacheSubnetGroupName")]
        getter cache_subnet_group_name : String?

        # The name of the cache engine to be used for this cluster. Valid values for this parameter are:
        # memcached | redis
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version number of the cache engine to be used for this cluster. To view the supported cache
        # engine versions, use the DescribeCacheEngineVersions operation. Important: You can upgrade to a
        # newer engine version (see Selecting a Cache Engine and Version ), but you cannot downgrade to an
        # earlier engine version. If you want to use an earlier engine version, you must delete the existing
        # cluster or replication group and create it anew with the earlier engine version.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The network type you choose when modifying a cluster, either ipv4 | ipv6 . IPv6 is supported for
        # workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 and Memcached engine
        # version 1.6.6 and above on all instances built on the Nitro system .
        @[JSON::Field(key: "IpDiscovery")]
        getter ip_discovery : String?

        # Specifies the destination, format and type of the logs.
        @[JSON::Field(key: "LogDeliveryConfigurations")]
        getter log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)?

        # Must be either ipv4 | ipv6 | dual_stack . IPv6 is supported for workloads using Valkey 7.2 and
        # above, Redis OSS engine version 6.2 to 7.1 and Memcached engine version 1.6.6 and above on all
        # instances built on the Nitro system .
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to which
        # notifications are sent. The Amazon SNS topic owner must be the same as the cluster owner.
        @[JSON::Field(key: "NotificationTopicArn")]
        getter notification_topic_arn : String?

        # The initial number of cache nodes that the cluster has. For clusters running Valkey or Redis OSS,
        # this value must be 1. For clusters running Memcached, this value must be between 1 and 40. If you
        # need more than 40 nodes for your Memcached cluster, please fill out the ElastiCache Limit Increase
        # Request form at http://aws.amazon.com/contact-us/elasticache-node-limit-request/ .
        @[JSON::Field(key: "NumCacheNodes")]
        getter num_cache_nodes : Int32?

        # Specifies whether the nodes in the cluster are created in a single outpost or across multiple
        # outposts.
        @[JSON::Field(key: "OutpostMode")]
        getter outpost_mode : String?

        # The port number on which each of the cache nodes accepts connections.
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The EC2 Availability Zone in which the cluster is created. All nodes belonging to this cluster are
        # placed in the preferred Availability Zone. If you want to create your nodes across multiple
        # Availability Zones, use PreferredAvailabilityZones . Default: System chosen Availability Zone.
        @[JSON::Field(key: "PreferredAvailabilityZone")]
        getter preferred_availability_zone : String?

        # A list of the Availability Zones in which cache nodes are created. The order of the zones in the
        # list is not important. This option is only supported on Memcached. If you are creating your cluster
        # in an Amazon VPC (recommended) you can only locate nodes in Availability Zones that are associated
        # with the subnets in the selected subnet group. The number of Availability Zones listed must equal
        # the value of NumCacheNodes . If you want all the nodes in the same Availability Zone, use
        # PreferredAvailabilityZone instead, or repeat the Availability Zone multiple times in the list.
        # Default: System chosen Availability Zones.
        @[JSON::Field(key: "PreferredAvailabilityZones")]
        getter preferred_availability_zones : Array(String)?

        # Specifies the weekly time range during which maintenance on the cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period.
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # The outpost ARN in which the cache cluster is created.
        @[JSON::Field(key: "PreferredOutpostArn")]
        getter preferred_outpost_arn : String?

        # The outpost ARNs in which the cache cluster is created.
        @[JSON::Field(key: "PreferredOutpostArns")]
        getter preferred_outpost_arns : Array(String)?

        # The ID of the replication group to which this cluster should belong. If this parameter is specified,
        # the cluster is added to the specified replication group as a read replica; otherwise, the cluster is
        # a standalone primary that is not part of any replication group. If the specified replication group
        # is Multi-AZ enabled and the Availability Zone is not specified, the cluster is created in
        # Availability Zones that provide the best spread of read replicas across Availability Zones. This
        # parameter is only valid if the Engine parameter is redis .
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # One or more VPC security groups associated with the cluster. Use this parameter only when you are
        # creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A single-element string list containing an Amazon Resource Name (ARN) that uniquely identifies a
        # Valkey or Redis OSS RDB snapshot file stored in Amazon S3. The snapshot file is used to populate the
        # node group (shard). The Amazon S3 object name in the ARN cannot contain any commas. This parameter
        # is only valid if the Engine parameter is redis . Example of an Amazon S3 ARN:
        # arn:aws:s3:::my_bucket/snapshot1.rdb
        @[JSON::Field(key: "SnapshotArns")]
        getter snapshot_arns : Array(String)?

        # The name of a Valkey or Redis OSS snapshot from which to restore data into the new node group
        # (shard). The snapshot status changes to restoring while the new node group (shard) is being created.
        # This parameter is only valid if the Engine parameter is redis .
        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String?

        # The number of days for which ElastiCache retains automatic snapshots before deleting them. For
        # example, if you set SnapshotRetentionLimit to 5, a snapshot taken today is retained for 5 days
        # before being deleted. This parameter is only valid if the Engine parameter is redis . Default: 0
        # (i.e., automatic backups are disabled for this cache cluster).
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node
        # group (shard). Example: 05:00-09:00 If you do not specify this parameter, ElastiCache automatically
        # chooses an appropriate time range. This parameter is only valid if the Engine parameter is redis .
        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # A list of tags to be added to this resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A flag that enables in-transit encryption when set to true.
        @[JSON::Field(key: "TransitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        def initialize(
          @cache_cluster_id : String,
          @az_mode : String? = nil,
          @auth_token : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @cache_node_type : String? = nil,
          @cache_parameter_group_name : String? = nil,
          @cache_security_group_names : Array(String)? = nil,
          @cache_subnet_group_name : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @ip_discovery : String? = nil,
          @log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)? = nil,
          @network_type : String? = nil,
          @notification_topic_arn : String? = nil,
          @num_cache_nodes : Int32? = nil,
          @outpost_mode : String? = nil,
          @port : Int32? = nil,
          @preferred_availability_zone : String? = nil,
          @preferred_availability_zones : Array(String)? = nil,
          @preferred_maintenance_window : String? = nil,
          @preferred_outpost_arn : String? = nil,
          @preferred_outpost_arns : Array(String)? = nil,
          @replication_group_id : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @snapshot_arns : Array(String)? = nil,
          @snapshot_name : String? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @transit_encryption_enabled : Bool? = nil
        )
        end
      end

      struct CreateCacheClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheCluster")]
        getter cache_cluster : Types::CacheCluster?

        def initialize(
          @cache_cluster : Types::CacheCluster? = nil
        )
        end
      end

      # Represents the input of a CreateCacheParameterGroup operation.
      struct CreateCacheParameterGroupMessage
        include JSON::Serializable

        # The name of the cache parameter group family that the cache parameter group can be used with. Valid
        # values are: valkey8 | valkey7 | memcached1.4 | memcached1.5 | memcached1.6 | redis2.6 | redis2.8 |
        # redis3.2 | redis4.0 | redis5.0 | redis6.x | redis7
        @[JSON::Field(key: "CacheParameterGroupFamily")]
        getter cache_parameter_group_family : String

        # A user-specified name for the cache parameter group.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String

        # A user-specified description for the cache parameter group.
        @[JSON::Field(key: "Description")]
        getter description : String

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cache_parameter_group_family : String,
          @cache_parameter_group_name : String,
          @description : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCacheParameterGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheParameterGroup")]
        getter cache_parameter_group : Types::CacheParameterGroup?

        def initialize(
          @cache_parameter_group : Types::CacheParameterGroup? = nil
        )
        end
      end

      # Represents the input of a CreateCacheSecurityGroup operation.
      struct CreateCacheSecurityGroupMessage
        include JSON::Serializable

        # A name for the cache security group. This value is stored as a lowercase string. Constraints: Must
        # contain no more than 255 alphanumeric characters. Cannot be the word "Default". Example:
        # mysecuritygroup
        @[JSON::Field(key: "CacheSecurityGroupName")]
        getter cache_security_group_name : String

        # A description for the cache security group.
        @[JSON::Field(key: "Description")]
        getter description : String

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cache_security_group_name : String,
          @description : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCacheSecurityGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheSecurityGroup")]
        getter cache_security_group : Types::CacheSecurityGroup?

        def initialize(
          @cache_security_group : Types::CacheSecurityGroup? = nil
        )
        end
      end

      # Represents the input of a CreateCacheSubnetGroup operation.
      struct CreateCacheSubnetGroupMessage
        include JSON::Serializable

        # A description for the cache subnet group.
        @[JSON::Field(key: "CacheSubnetGroupDescription")]
        getter cache_subnet_group_description : String

        # A name for the cache subnet group. This value is stored as a lowercase string. Constraints: Must
        # contain no more than 255 alphanumeric characters or hyphens. Example: mysubnetgroup
        @[JSON::Field(key: "CacheSubnetGroupName")]
        getter cache_subnet_group_name : String

        # A list of VPC subnet IDs for the cache subnet group.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cache_subnet_group_description : String,
          @cache_subnet_group_name : String,
          @subnet_ids : Array(String),
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCacheSubnetGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheSubnetGroup")]
        getter cache_subnet_group : Types::CacheSubnetGroup?

        def initialize(
          @cache_subnet_group : Types::CacheSubnetGroup? = nil
        )
        end
      end

      struct CreateGlobalReplicationGroupMessage
        include JSON::Serializable

        # The suffix name of a Global datastore. Amazon ElastiCache automatically applies a prefix to the
        # Global datastore ID when it is created. Each Amazon Region has its own prefix. For instance, a
        # Global datastore ID created in the US-West-1 region will begin with "dsdfu" along with the suffix
        # name you provide. The suffix, combined with the auto-generated prefix, guarantees uniqueness of the
        # Global datastore name across multiple regions. For a full list of Amazon Regions and their
        # respective Global datastore iD prefixes, see Using the Amazon CLI with Global datastores .
        @[JSON::Field(key: "GlobalReplicationGroupIdSuffix")]
        getter global_replication_group_id_suffix : String

        # The name of the primary cluster that accepts writes and will replicate updates to the secondary
        # cluster.
        @[JSON::Field(key: "PrimaryReplicationGroupId")]
        getter primary_replication_group_id : String

        # Provides details of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupDescription")]
        getter global_replication_group_description : String?

        def initialize(
          @global_replication_group_id_suffix : String,
          @primary_replication_group_id : String,
          @global_replication_group_description : String? = nil
        )
        end
      end

      struct CreateGlobalReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "GlobalReplicationGroup")]
        getter global_replication_group : Types::GlobalReplicationGroup?

        def initialize(
          @global_replication_group : Types::GlobalReplicationGroup? = nil
        )
        end
      end

      # Represents the input of a CreateReplicationGroup operation.
      struct CreateReplicationGroupMessage
        include JSON::Serializable

        # A user-created description for the replication group.
        @[JSON::Field(key: "ReplicationGroupDescription")]
        getter replication_group_description : String

        # The replication group identifier. This parameter is stored as a lowercase string. Constraints: A
        # name must contain from 1 to 40 alphanumeric characters or hyphens. The first character must be a
        # letter. A name cannot end with a hyphen or contain two consecutive hyphens.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        # A flag that enables encryption at rest when set to true . You cannot modify the value of
        # AtRestEncryptionEnabled after the replication group is created. To enable encryption at rest on a
        # replication group you must set AtRestEncryptionEnabled to true when you create the replication
        # group. Required: Only available when creating a replication group in an Amazon VPC using Valkey 7.2
        # and later, Redis OSS version 3.2.6 , or Redis OSS 4.x and later. Default: true when using Valkey,
        # false when using Redis OSS
        @[JSON::Field(key: "AtRestEncryptionEnabled")]
        getter at_rest_encryption_enabled : Bool?

        # Reserved parameter. The password used to access a password protected server. AuthToken can be
        # specified only on replication groups where TransitEncryptionEnabled is true . For HIPAA compliance,
        # you must specify TransitEncryptionEnabled as true , an AuthToken , and a CacheSubnetGroup . Password
        # constraints: Must be only printable ASCII characters. Must be at least 16 characters and no more
        # than 128 characters in length. The only permitted printable special characters are !, &amp;, #, $,
        # ^, &lt;, &gt;, and -. Other printable special characters cannot be used in the AUTH token. For more
        # information, see AUTH password at http://redis.io/commands/AUTH.
        @[JSON::Field(key: "AuthToken")]
        getter auth_token : String?

        # If you are running Valkey 7.2 and above or Redis OSS engine version 6.0 and above, set this
        # parameter to yes to opt-in to the next auto minor version upgrade campaign. This parameter is
        # disabled for previous versions.
        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Specifies whether a read-only replica is automatically promoted to read/write primary if the
        # existing primary fails. AutomaticFailoverEnabled must be enabled for Valkey or Redis OSS (cluster
        # mode enabled) replication groups. Default: false
        @[JSON::Field(key: "AutomaticFailoverEnabled")]
        getter automatic_failover_enabled : Bool?

        # The compute and memory capacity of the nodes in the node group (shard). The following node types are
        # supported by ElastiCache. Generally speaking, the current generation types provide more memory and
        # computational power at lower cost when compared to their equivalent previous generation
        # counterparts. General purpose: Current generation: M7g node types : cache.m7g.large ,
        # cache.m7g.xlarge , cache.m7g.2xlarge , cache.m7g.4xlarge , cache.m7g.8xlarge , cache.m7g.12xlarge ,
        # cache.m7g.16xlarge For region availability, see Supported Node Types M6g node types (available only
        # for Redis OSS engine version 5.0.6 onward and for Memcached engine version 1.5.16 onward):
        # cache.m6g.large , cache.m6g.xlarge , cache.m6g.2xlarge , cache.m6g.4xlarge , cache.m6g.8xlarge ,
        # cache.m6g.12xlarge , cache.m6g.16xlarge M5 node types: cache.m5.large , cache.m5.xlarge ,
        # cache.m5.2xlarge , cache.m5.4xlarge , cache.m5.12xlarge , cache.m5.24xlarge M4 node types:
        # cache.m4.large , cache.m4.xlarge , cache.m4.2xlarge , cache.m4.4xlarge , cache.m4.10xlarge T4g node
        # types (available only for Redis OSS engine version 5.0.6 onward and Memcached engine version 1.5.16
        # onward): cache.t4g.micro , cache.t4g.small , cache.t4g.medium T3 node types: cache.t3.micro ,
        # cache.t3.small , cache.t3.medium T2 node types: cache.t2.micro , cache.t2.small , cache.t2.medium
        # Previous generation: (not recommended. Existing clusters are still supported but creation of new
        # clusters is not supported for these types.) T1 node types: cache.t1.micro M1 node types:
        # cache.m1.small , cache.m1.medium , cache.m1.large , cache.m1.xlarge M3 node types: cache.m3.medium ,
        # cache.m3.large , cache.m3.xlarge , cache.m3.2xlarge Compute optimized: Previous generation: (not
        # recommended. Existing clusters are still supported but creation of new clusters is not supported for
        # these types.) C1 node types: cache.c1.xlarge Memory optimized: Current generation: R7g node types :
        # cache.r7g.large , cache.r7g.xlarge , cache.r7g.2xlarge , cache.r7g.4xlarge , cache.r7g.8xlarge ,
        # cache.r7g.12xlarge , cache.r7g.16xlarge For region availability, see Supported Node Types R6g node
        # types (available only for Redis OSS engine version 5.0.6 onward and for Memcached engine version
        # 1.5.16 onward): cache.r6g.large , cache.r6g.xlarge , cache.r6g.2xlarge , cache.r6g.4xlarge ,
        # cache.r6g.8xlarge , cache.r6g.12xlarge , cache.r6g.16xlarge R5 node types: cache.r5.large ,
        # cache.r5.xlarge , cache.r5.2xlarge , cache.r5.4xlarge , cache.r5.12xlarge , cache.r5.24xlarge R4
        # node types: cache.r4.large , cache.r4.xlarge , cache.r4.2xlarge , cache.r4.4xlarge ,
        # cache.r4.8xlarge , cache.r4.16xlarge Previous generation: (not recommended. Existing clusters are
        # still supported but creation of new clusters is not supported for these types.) M2 node types:
        # cache.m2.xlarge , cache.m2.2xlarge , cache.m2.4xlarge R3 node types: cache.r3.large ,
        # cache.r3.xlarge , cache.r3.2xlarge , cache.r3.4xlarge , cache.r3.8xlarge Additional node type info
        # All current generation instance types are created in Amazon VPC by default. Valkey or Redis OSS
        # append-only files (AOF) are not supported for T1 or T2 instances. Valkey or Redis OSS Multi-AZ with
        # automatic failover is not supported on T1 instances. The configuration variables appendonly and
        # appendfsync are not supported on Valkey, or on Redis OSS version 2.8.22 and later.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The name of the parameter group to associate with this replication group. If this argument is
        # omitted, the default cache parameter group for the specified engine is used. If you are running
        # Valkey or Redis OSS version 3.2.4 or later, only one node group (shard), and want to use a default
        # parameter group, we recommend that you specify the parameter group by name. To create a Valkey or
        # Redis OSS (cluster mode disabled) replication group, use CacheParameterGroupName=default.redis3.2 .
        # To create a Valkey or Redis OSS (cluster mode enabled) replication group, use
        # CacheParameterGroupName=default.redis3.2.cluster.on .
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        # A list of cache security group names to associate with this replication group.
        @[JSON::Field(key: "CacheSecurityGroupNames")]
        getter cache_security_group_names : Array(String)?

        # The name of the cache subnet group to be used for the replication group. If you're going to launch
        # your cluster in an Amazon VPC, you need to create a subnet group before you start creating a
        # cluster. For more information, see Subnets and Subnet Groups .
        @[JSON::Field(key: "CacheSubnetGroupName")]
        getter cache_subnet_group_name : String?

        # Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you must first set the cluster
        # mode to Compatible. Compatible mode allows your Valkey or Redis OSS clients to connect using both
        # cluster mode enabled and cluster mode disabled. After you migrate all Valkey or Redis OSS clients to
        # use cluster mode enabled, you can then complete cluster mode configuration and set the cluster mode
        # to Enabled.
        @[JSON::Field(key: "ClusterMode")]
        getter cluster_mode : String?

        # Enables data tiering. Data tiering is only supported for replication groups using the r6gd node
        # type. This parameter must be set to true when using r6gd nodes. For more information, see Data
        # tiering .
        @[JSON::Field(key: "DataTieringEnabled")]
        getter data_tiering_enabled : Bool?

        # The name of the cache engine to be used for the clusters in this replication group. The value must
        # be set to valkey or redis .
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version number of the cache engine to be used for the clusters in this replication group. To
        # view the supported cache engine versions, use the DescribeCacheEngineVersions operation. Important:
        # You can upgrade to a newer engine version (see Selecting a Cache Engine and Version ) in the
        # ElastiCache User Guide , but you cannot downgrade to an earlier engine version. If you want to use
        # an earlier engine version, you must delete the existing cluster or replication group and create it
        # anew with the earlier engine version.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String?

        # The network type you choose when creating a replication group, either ipv4 | ipv6 . IPv6 is
        # supported for workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 or Memcached
        # engine version 1.6.6 and above on all instances built on the Nitro system .
        @[JSON::Field(key: "IpDiscovery")]
        getter ip_discovery : String?

        # The ID of the KMS key used to encrypt the disk in the cluster.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Specifies the destination, format and type of the logs.
        @[JSON::Field(key: "LogDeliveryConfigurations")]
        getter log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)?

        # A flag indicating if you have Multi-AZ enabled to enhance fault tolerance. For more information, see
        # Minimizing Downtime: Multi-AZ .
        @[JSON::Field(key: "MultiAZEnabled")]
        getter multi_az_enabled : Bool?

        # Must be either ipv4 | ipv6 | dual_stack . IPv6 is supported for workloads using Valkey 7.2 and
        # above, Redis OSS engine version 6.2 to 7.1 and Memcached engine version 1.6.6 and above on all
        # instances built on the Nitro system .
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # A list of node group (shard) configuration options. Each node group (shard) configuration has the
        # following members: PrimaryAvailabilityZone , ReplicaAvailabilityZones , ReplicaCount , and Slots .
        # If you're creating a Valkey or Redis OSS (cluster mode disabled) or a Valkey or Redis OSS (cluster
        # mode enabled) replication group, you can use this parameter to individually configure each node
        # group (shard), or you can omit this parameter. However, it is required when seeding a Valkey or
        # Redis OSS (cluster mode enabled) cluster from a S3 rdb file. You must configure each node group
        # (shard) using this parameter because you must specify the slots for each node group.
        @[JSON::Field(key: "NodeGroupConfiguration")]
        getter node_group_configuration : Array(Types::NodeGroupConfiguration)?

        # The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to which
        # notifications are sent. The Amazon SNS topic owner must be the same as the cluster owner.
        @[JSON::Field(key: "NotificationTopicArn")]
        getter notification_topic_arn : String?

        # The number of clusters this replication group initially has. This parameter is not used if there is
        # more than one node group (shard). You should use ReplicasPerNodeGroup instead. If
        # AutomaticFailoverEnabled is true , the value of this parameter must be at least 2. If
        # AutomaticFailoverEnabled is false you can omit this parameter (it will default to 1), or you can
        # explicitly set it to a value between 2 and 6. The maximum permitted value for NumCacheClusters is 6
        # (1 primary plus 5 replicas).
        @[JSON::Field(key: "NumCacheClusters")]
        getter num_cache_clusters : Int32?

        # An optional parameter that specifies the number of node groups (shards) for this Valkey or Redis OSS
        # (cluster mode enabled) replication group. For Valkey or Redis OSS (cluster mode disabled) either
        # omit this parameter or set it to 1. Default: 1
        @[JSON::Field(key: "NumNodeGroups")]
        getter num_node_groups : Int32?

        # The port number on which each member of the replication group accepts connections.
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # A list of EC2 Availability Zones in which the replication group's clusters are created. The order of
        # the Availability Zones in the list is the order in which clusters are allocated. The primary cluster
        # is created in the first AZ in the list. This parameter is not used if there is more than one node
        # group (shard). You should use NodeGroupConfiguration instead. If you are creating your replication
        # group in an Amazon VPC (recommended), you can only locate clusters in Availability Zones associated
        # with the subnets in the selected subnet group. The number of Availability Zones listed must equal
        # the value of NumCacheClusters . Default: system chosen Availability Zones.
        @[JSON::Field(key: "PreferredCacheClusterAZs")]
        getter preferred_cache_cluster_a_zs : Array(String)?

        # Specifies the weekly time range during which maintenance on the cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period. Valid values for ddd are: sun mon tue wed thu fri sat Example:
        # sun:23:00-mon:01:30
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # The identifier of the cluster that serves as the primary for this replication group. This cluster
        # must already exist and have a status of available . This parameter is not required if
        # NumCacheClusters , NumNodeGroups , or ReplicasPerNodeGroup is specified.
        @[JSON::Field(key: "PrimaryClusterId")]
        getter primary_cluster_id : String?

        # An optional parameter that specifies the number of replica nodes in each node group (shard). Valid
        # values are 0 to 5.
        @[JSON::Field(key: "ReplicasPerNodeGroup")]
        getter replicas_per_node_group : Int32?

        # One or more Amazon VPC security groups associated with this replication group. Use this parameter
        # only when you are creating a replication group in an Amazon Virtual Private Cloud (Amazon VPC).
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The name of the snapshot used to create a replication group. Available for Valkey, Redis OSS only.
        @[JSON::Field(key: "ServerlessCacheSnapshotName")]
        getter serverless_cache_snapshot_name : String?

        # A list of Amazon Resource Names (ARN) that uniquely identify the Valkey or Redis OSS RDB snapshot
        # files stored in Amazon S3. The snapshot files are used to populate the new replication group. The
        # Amazon S3 object name in the ARN cannot contain any commas. The new replication group will have the
        # number of node groups (console: shards) specified by the parameter NumNodeGroups or the number of
        # node groups configured by NodeGroupConfiguration regardless of the number of ARNs specified here.
        # Example of an Amazon S3 ARN: arn:aws:s3:::my_bucket/snapshot1.rdb
        @[JSON::Field(key: "SnapshotArns")]
        getter snapshot_arns : Array(String)?

        # The name of a snapshot from which to restore data into the new replication group. The snapshot
        # status changes to restoring while the new replication group is being created.
        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String?

        # The number of days for which ElastiCache retains automatic snapshots before deleting them. For
        # example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for 5
        # days before being deleted. Default: 0 (i.e., automatic backups are disabled for this cluster).
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node
        # group (shard). Example: 05:00-09:00 If you do not specify this parameter, ElastiCache automatically
        # chooses an appropriate time range.
        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # A list of tags to be added to this resource. Tags are comma-separated key,value pairs (e.g. Key=
        # myKey , Value= myKeyValue . You can include multiple tags as shown following: Key= myKey , Value=
        # myKeyValue Key= mySecondKey , Value= mySecondKeyValue . Tags on replication groups will be
        # replicated to all nodes.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A flag that enables in-transit encryption when set to true . This parameter is valid only if the
        # Engine parameter is redis , the EngineVersion parameter is 3.2.6 , 4.x or later, and the cluster is
        # being created in an Amazon VPC. If you enable in-transit encryption, you must also specify a value
        # for CacheSubnetGroup . Required: Only available when creating a replication group in an Amazon VPC
        # using Redis OSS version 3.2.6 , 4.x or later. Default: false For HIPAA compliance, you must specify
        # TransitEncryptionEnabled as true , an AuthToken , and a CacheSubnetGroup .
        @[JSON::Field(key: "TransitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        # A setting that allows you to migrate your clients to use in-transit encryption, with no downtime.
        # When setting TransitEncryptionEnabled to true , you can set your TransitEncryptionMode to preferred
        # in the same request, to allow both encrypted and unencrypted connections at the same time. Once you
        # migrate all your Valkey or Redis OSS clients to use encrypted connections you can modify the value
        # to required to allow encrypted connections only. Setting TransitEncryptionMode to required is a
        # two-step process that requires you to first set the TransitEncryptionMode to preferred , after that
        # you can set TransitEncryptionMode to required . This process will not trigger the replacement of the
        # replication group.
        @[JSON::Field(key: "TransitEncryptionMode")]
        getter transit_encryption_mode : String?

        # The user group to associate with the replication group.
        @[JSON::Field(key: "UserGroupIds")]
        getter user_group_ids : Array(String)?

        def initialize(
          @replication_group_description : String,
          @replication_group_id : String,
          @at_rest_encryption_enabled : Bool? = nil,
          @auth_token : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @automatic_failover_enabled : Bool? = nil,
          @cache_node_type : String? = nil,
          @cache_parameter_group_name : String? = nil,
          @cache_security_group_names : Array(String)? = nil,
          @cache_subnet_group_name : String? = nil,
          @cluster_mode : String? = nil,
          @data_tiering_enabled : Bool? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @global_replication_group_id : String? = nil,
          @ip_discovery : String? = nil,
          @kms_key_id : String? = nil,
          @log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)? = nil,
          @multi_az_enabled : Bool? = nil,
          @network_type : String? = nil,
          @node_group_configuration : Array(Types::NodeGroupConfiguration)? = nil,
          @notification_topic_arn : String? = nil,
          @num_cache_clusters : Int32? = nil,
          @num_node_groups : Int32? = nil,
          @port : Int32? = nil,
          @preferred_cache_cluster_a_zs : Array(String)? = nil,
          @preferred_maintenance_window : String? = nil,
          @primary_cluster_id : String? = nil,
          @replicas_per_node_group : Int32? = nil,
          @security_group_ids : Array(String)? = nil,
          @serverless_cache_snapshot_name : String? = nil,
          @snapshot_arns : Array(String)? = nil,
          @snapshot_name : String? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @transit_encryption_enabled : Bool? = nil,
          @transit_encryption_mode : String? = nil,
          @user_group_ids : Array(String)? = nil
        )
        end
      end

      struct CreateReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      struct CreateServerlessCacheRequest
        include JSON::Serializable

        # The name of the cache engine to be used for creating the serverless cache.
        @[JSON::Field(key: "Engine")]
        getter engine : String

        # User-provided identifier for the serverless cache. This parameter is stored as a lowercase string.
        @[JSON::Field(key: "ServerlessCacheName")]
        getter serverless_cache_name : String

        # Sets the cache usage limits for storage and ElastiCache Processing Units for the cache.
        @[JSON::Field(key: "CacheUsageLimits")]
        getter cache_usage_limits : Types::CacheUsageLimits?

        # The daily time that snapshots will be created from the new serverless cache. By default this number
        # is populated with 0, i.e. no snapshots will be created on an automatic daily basis. Available for
        # Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "DailySnapshotTime")]
        getter daily_snapshot_time : String?

        # User-provided description for the serverless cache. The default is NULL, i.e. if no description is
        # provided then an empty string will be returned. The maximum length is 255 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # ARN of the customer managed key for encrypting the data at rest. If no KMS key is provided, a
        # default service key is used.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The version of the cache engine that will be used to create the serverless cache.
        @[JSON::Field(key: "MajorEngineVersion")]
        getter major_engine_version : String?

        # A list of the one or more VPC security groups to be associated with the serverless cache. The
        # security group will authorize traffic access for the VPC end-point (private-link). If no other
        # information is given this will be the VPC’s Default Security Group that is associated with the
        # cluster VPC end-point.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The ARN(s) of the snapshot that the new serverless cache will be created from. Available for Valkey,
        # Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "SnapshotArnsToRestore")]
        getter snapshot_arns_to_restore : Array(String)?

        # The number of snapshots that will be retained for the serverless cache that is being created. As new
        # snapshots beyond this limit are added, the oldest snapshots will be deleted on a rolling basis.
        # Available for Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # A list of the identifiers of the subnets where the VPC endpoint for the serverless cache will be
        # deployed. All the subnetIds must belong to the same VPC.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The list of tags (key, value) pairs to be added to the serverless cache resource. Default is NULL.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The identifier of the UserGroup to be associated with the serverless cache. Available for Valkey and
        # Redis OSS only. Default is NULL.
        @[JSON::Field(key: "UserGroupId")]
        getter user_group_id : String?

        def initialize(
          @engine : String,
          @serverless_cache_name : String,
          @cache_usage_limits : Types::CacheUsageLimits? = nil,
          @daily_snapshot_time : String? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @major_engine_version : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @snapshot_arns_to_restore : Array(String)? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_group_id : String? = nil
        )
        end
      end

      struct CreateServerlessCacheResponse
        include JSON::Serializable

        # The response for the attempt to create the serverless cache.
        @[JSON::Field(key: "ServerlessCache")]
        getter serverless_cache : Types::ServerlessCache?

        def initialize(
          @serverless_cache : Types::ServerlessCache? = nil
        )
        end
      end

      struct CreateServerlessCacheSnapshotRequest
        include JSON::Serializable

        # The name of an existing serverless cache. The snapshot is created from this cache. Available for
        # Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "ServerlessCacheName")]
        getter serverless_cache_name : String

        # The name for the snapshot being created. Must be unique for the customer account. Available for
        # Valkey, Redis OSS and Serverless Memcached only. Must be between 1 and 255 characters.
        @[JSON::Field(key: "ServerlessCacheSnapshotName")]
        getter serverless_cache_snapshot_name : String

        # The ID of the KMS key used to encrypt the snapshot. Available for Valkey, Redis OSS and Serverless
        # Memcached only. Default: NULL
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A list of tags to be added to the snapshot resource. A tag is a key-value pair. Available for
        # Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @serverless_cache_name : String,
          @serverless_cache_snapshot_name : String,
          @kms_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateServerlessCacheSnapshotResponse
        include JSON::Serializable

        # The state of a serverless cache snapshot at a specific point in time, to the millisecond. Available
        # for Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "ServerlessCacheSnapshot")]
        getter serverless_cache_snapshot : Types::ServerlessCacheSnapshot?

        def initialize(
          @serverless_cache_snapshot : Types::ServerlessCacheSnapshot? = nil
        )
        end
      end

      # Represents the input of a CreateSnapshot operation.
      struct CreateSnapshotMessage
        include JSON::Serializable

        # A name for the snapshot being created.
        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String

        # The identifier of an existing cluster. The snapshot is created from this cluster.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The ID of the KMS key used to encrypt the snapshot.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The identifier of an existing replication group. The snapshot is created from this replication
        # group.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @snapshot_name : String,
          @cache_cluster_id : String? = nil,
          @kms_key_id : String? = nil,
          @replication_group_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSnapshotResult
        include JSON::Serializable

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct CreateUserGroupMessage
        include JSON::Serializable

        # Sets the engine listed in a user group. The options are valkey or redis.
        @[JSON::Field(key: "Engine")]
        getter engine : String

        # The ID of the user group.
        @[JSON::Field(key: "UserGroupId")]
        getter user_group_id : String

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted. Available for Valkey and Redis OSS only.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The list of user IDs that belong to the user group.
        @[JSON::Field(key: "UserIds")]
        getter user_ids : Array(String)?

        def initialize(
          @engine : String,
          @user_group_id : String,
          @tags : Array(Types::Tag)? = nil,
          @user_ids : Array(String)? = nil
        )
        end
      end

      struct CreateUserMessage
        include JSON::Serializable

        # Access permissions string used for this user.
        @[JSON::Field(key: "AccessString")]
        getter access_string : String

        # The options are valkey or redis.
        @[JSON::Field(key: "Engine")]
        getter engine : String

        # The ID of the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # The username of the user.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # Specifies how to authenticate the user.
        @[JSON::Field(key: "AuthenticationMode")]
        getter authentication_mode : Types::AuthenticationMode?

        # Indicates a password is not required for this user.
        @[JSON::Field(key: "NoPasswordRequired")]
        getter no_password_required : Bool?

        # Passwords used for this user. You can create up to two passwords for each user.
        @[JSON::Field(key: "Passwords")]
        getter passwords : Array(String)?

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @access_string : String,
          @engine : String,
          @user_id : String,
          @user_name : String,
          @authentication_mode : Types::AuthenticationMode? = nil,
          @no_password_required : Bool? = nil,
          @passwords : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The endpoint from which data should be migrated.
      struct CustomerNodeEndpoint
        include JSON::Serializable

        # The address of the node endpoint
        @[JSON::Field(key: "Address")]
        getter address : String?

        # The port of the node endpoint
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        def initialize(
          @address : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # The data storage limit.
      struct DataStorage
        include JSON::Serializable

        # The unit that the storage is measured in, in GB.
        @[JSON::Field(key: "Unit")]
        getter unit : String

        # The upper limit for data storage the cache is set to use.
        @[JSON::Field(key: "Maximum")]
        getter maximum : Int32?

        # The lower limit for data storage the cache is set to use.
        @[JSON::Field(key: "Minimum")]
        getter minimum : Int32?

        def initialize(
          @unit : String,
          @maximum : Int32? = nil,
          @minimum : Int32? = nil
        )
        end
      end

      struct DecreaseNodeGroupsInGlobalReplicationGroupMessage
        include JSON::Serializable

        # Indicates that the shard reconfiguration process begins immediately. At present, the only permitted
        # value for this parameter is true.
        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String

        # The number of node groups (shards) that results from the modification of the shard configuration
        @[JSON::Field(key: "NodeGroupCount")]
        getter node_group_count : Int32

        # If the value of NodeGroupCount is less than the current number of node groups (shards), then either
        # NodeGroupsToRemove or NodeGroupsToRetain is required. GlobalNodeGroupsToRemove is a list of
        # NodeGroupIds to remove from the cluster. ElastiCache will attempt to remove all node groups listed
        # by GlobalNodeGroupsToRemove from the cluster.
        @[JSON::Field(key: "GlobalNodeGroupsToRemove")]
        getter global_node_groups_to_remove : Array(String)?

        # If the value of NodeGroupCount is less than the current number of node groups (shards), then either
        # NodeGroupsToRemove or NodeGroupsToRetain is required. GlobalNodeGroupsToRetain is a list of
        # NodeGroupIds to retain from the cluster. ElastiCache will attempt to retain all node groups listed
        # by GlobalNodeGroupsToRetain from the cluster.
        @[JSON::Field(key: "GlobalNodeGroupsToRetain")]
        getter global_node_groups_to_retain : Array(String)?

        def initialize(
          @apply_immediately : Bool,
          @global_replication_group_id : String,
          @node_group_count : Int32,
          @global_node_groups_to_remove : Array(String)? = nil,
          @global_node_groups_to_retain : Array(String)? = nil
        )
        end
      end

      struct DecreaseNodeGroupsInGlobalReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "GlobalReplicationGroup")]
        getter global_replication_group : Types::GlobalReplicationGroup?

        def initialize(
          @global_replication_group : Types::GlobalReplicationGroup? = nil
        )
        end
      end

      struct DecreaseReplicaCountMessage
        include JSON::Serializable

        # If True , the number of replica nodes is decreased immediately. ApplyImmediately=False is not
        # currently supported.
        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool

        # The id of the replication group from which you want to remove replica nodes.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        # The number of read replica nodes you want at the completion of this operation. For Valkey or Redis
        # OSS (cluster mode disabled) replication groups, this is the number of replica nodes in the
        # replication group. For Valkey or Redis OSS (cluster mode enabled) replication groups, this is the
        # number of replica nodes in each of the replication group's node groups. The minimum number of
        # replicas in a shard or replication group is: Valkey or Redis OSS (cluster mode disabled) If Multi-AZ
        # is enabled: 1 If Multi-AZ is not enabled: 0 Valkey or Redis OSS (cluster mode enabled): 0 (though
        # you will not be able to failover to a replica if your primary node fails)
        @[JSON::Field(key: "NewReplicaCount")]
        getter new_replica_count : Int32?

        # A list of ConfigureShard objects that can be used to configure each shard in a Valkey or Redis OSS
        # replication group. The ConfigureShard has three members: NewReplicaCount , NodeGroupId , and
        # PreferredAvailabilityZones .
        @[JSON::Field(key: "ReplicaConfiguration")]
        getter replica_configuration : Array(Types::ConfigureShard)?

        # A list of the node ids to remove from the replication group or node group (shard).
        @[JSON::Field(key: "ReplicasToRemove")]
        getter replicas_to_remove : Array(String)?

        def initialize(
          @apply_immediately : Bool,
          @replication_group_id : String,
          @new_replica_count : Int32? = nil,
          @replica_configuration : Array(Types::ConfigureShard)? = nil,
          @replicas_to_remove : Array(String)? = nil
        )
        end
      end

      struct DecreaseReplicaCountResult
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      # The default user assigned to the user group.
      struct DefaultUserAssociatedToUserGroupFault
        include JSON::Serializable

        def initialize
        end
      end

      # You must add default user to a user group.
      struct DefaultUserRequired
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of a DeleteCacheCluster operation.
      struct DeleteCacheClusterMessage
        include JSON::Serializable

        # The cluster identifier for the cluster to be deleted. This parameter is not case sensitive.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String

        # The user-supplied name of a final cluster snapshot. This is the unique name that identifies the
        # snapshot. ElastiCache creates the snapshot, and then deletes the cluster immediately afterward.
        @[JSON::Field(key: "FinalSnapshotIdentifier")]
        getter final_snapshot_identifier : String?

        def initialize(
          @cache_cluster_id : String,
          @final_snapshot_identifier : String? = nil
        )
        end
      end

      struct DeleteCacheClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheCluster")]
        getter cache_cluster : Types::CacheCluster?

        def initialize(
          @cache_cluster : Types::CacheCluster? = nil
        )
        end
      end

      # Represents the input of a DeleteCacheParameterGroup operation.
      struct DeleteCacheParameterGroupMessage
        include JSON::Serializable

        # The name of the cache parameter group to delete. The specified cache security group must not be
        # associated with any clusters.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String

        def initialize(
          @cache_parameter_group_name : String
        )
        end
      end

      # Represents the input of a DeleteCacheSecurityGroup operation.
      struct DeleteCacheSecurityGroupMessage
        include JSON::Serializable

        # The name of the cache security group to delete. You cannot delete the default security group.
        @[JSON::Field(key: "CacheSecurityGroupName")]
        getter cache_security_group_name : String

        def initialize(
          @cache_security_group_name : String
        )
        end
      end

      # Represents the input of a DeleteCacheSubnetGroup operation.
      struct DeleteCacheSubnetGroupMessage
        include JSON::Serializable

        # The name of the cache subnet group to delete. Constraints: Must contain no more than 255
        # alphanumeric characters or hyphens.
        @[JSON::Field(key: "CacheSubnetGroupName")]
        getter cache_subnet_group_name : String

        def initialize(
          @cache_subnet_group_name : String
        )
        end
      end

      struct DeleteGlobalReplicationGroupMessage
        include JSON::Serializable

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String

        # The primary replication group is retained as a standalone replication group.
        @[JSON::Field(key: "RetainPrimaryReplicationGroup")]
        getter retain_primary_replication_group : Bool

        def initialize(
          @global_replication_group_id : String,
          @retain_primary_replication_group : Bool
        )
        end
      end

      struct DeleteGlobalReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "GlobalReplicationGroup")]
        getter global_replication_group : Types::GlobalReplicationGroup?

        def initialize(
          @global_replication_group : Types::GlobalReplicationGroup? = nil
        )
        end
      end

      # Represents the input of a DeleteReplicationGroup operation.
      struct DeleteReplicationGroupMessage
        include JSON::Serializable

        # The identifier for the cluster to be deleted. This parameter is not case sensitive.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        # The name of a final node group (shard) snapshot. ElastiCache creates the snapshot from the primary
        # node in the cluster, rather than one of the replicas; this is to ensure that it captures the
        # freshest data. After the final snapshot is taken, the replication group is immediately deleted.
        @[JSON::Field(key: "FinalSnapshotIdentifier")]
        getter final_snapshot_identifier : String?

        # If set to true , all of the read replicas are deleted, but the primary node is retained.
        @[JSON::Field(key: "RetainPrimaryCluster")]
        getter retain_primary_cluster : Bool?

        def initialize(
          @replication_group_id : String,
          @final_snapshot_identifier : String? = nil,
          @retain_primary_cluster : Bool? = nil
        )
        end
      end

      struct DeleteReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      struct DeleteServerlessCacheRequest
        include JSON::Serializable

        # The identifier of the serverless cache to be deleted.
        @[JSON::Field(key: "ServerlessCacheName")]
        getter serverless_cache_name : String

        # Name of the final snapshot to be taken before the serverless cache is deleted. Available for Valkey,
        # Redis OSS and Serverless Memcached only. Default: NULL, i.e. a final snapshot is not taken.
        @[JSON::Field(key: "FinalSnapshotName")]
        getter final_snapshot_name : String?

        def initialize(
          @serverless_cache_name : String,
          @final_snapshot_name : String? = nil
        )
        end
      end

      struct DeleteServerlessCacheResponse
        include JSON::Serializable

        # Provides the details of the specified serverless cache that is about to be deleted.
        @[JSON::Field(key: "ServerlessCache")]
        getter serverless_cache : Types::ServerlessCache?

        def initialize(
          @serverless_cache : Types::ServerlessCache? = nil
        )
        end
      end

      struct DeleteServerlessCacheSnapshotRequest
        include JSON::Serializable

        # Idenfitier of the snapshot to be deleted. Available for Valkey, Redis OSS and Serverless Memcached
        # only.
        @[JSON::Field(key: "ServerlessCacheSnapshotName")]
        getter serverless_cache_snapshot_name : String

        def initialize(
          @serverless_cache_snapshot_name : String
        )
        end
      end

      struct DeleteServerlessCacheSnapshotResponse
        include JSON::Serializable

        # The snapshot to be deleted. Available for Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "ServerlessCacheSnapshot")]
        getter serverless_cache_snapshot : Types::ServerlessCacheSnapshot?

        def initialize(
          @serverless_cache_snapshot : Types::ServerlessCacheSnapshot? = nil
        )
        end
      end

      # Represents the input of a DeleteSnapshot operation.
      struct DeleteSnapshotMessage
        include JSON::Serializable

        # The name of the snapshot to be deleted.
        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String

        def initialize(
          @snapshot_name : String
        )
        end
      end

      struct DeleteSnapshotResult
        include JSON::Serializable

        @[JSON::Field(key: "Snapshot")]
        getter snapshot : Types::Snapshot?

        def initialize(
          @snapshot : Types::Snapshot? = nil
        )
        end
      end

      struct DeleteUserGroupMessage
        include JSON::Serializable

        # The ID of the user group.
        @[JSON::Field(key: "UserGroupId")]
        getter user_group_id : String

        def initialize(
          @user_group_id : String
        )
        end
      end

      struct DeleteUserMessage
        include JSON::Serializable

        # The ID of the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @user_id : String
        )
        end
      end

      # Represents the input of a DescribeCacheClusters operation.
      struct DescribeCacheClustersMessage
        include JSON::Serializable

        # The user-supplied cluster identifier. If this parameter is specified, only information about that
        # specific cluster is returned. This parameter isn't case sensitive.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # An optional flag that can be included in the DescribeCacheCluster request to show only nodes
        # (API/CLI: clusters) that are not members of a replication group. In practice, this means Memcached
        # and single node Valkey or Redis OSS clusters.
        @[JSON::Field(key: "ShowCacheClustersNotInReplicationGroups")]
        getter show_cache_clusters_not_in_replication_groups : Bool?

        # An optional flag that can be included in the DescribeCacheCluster request to retrieve information
        # about the individual cache nodes.
        @[JSON::Field(key: "ShowCacheNodeInfo")]
        getter show_cache_node_info : Bool?

        def initialize(
          @cache_cluster_id : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @show_cache_clusters_not_in_replication_groups : Bool? = nil,
          @show_cache_node_info : Bool? = nil
        )
        end
      end

      # Represents the input of a DescribeCacheEngineVersions operation.
      struct DescribeCacheEngineVersionsMessage
        include JSON::Serializable

        # The name of a specific cache parameter group family to return details for. Valid values are:
        # memcached1.4 | memcached1.5 | memcached1.6 | redis2.6 | redis2.8 | redis3.2 | redis4.0 | redis5.0 |
        # redis6.x | redis6.2 | redis7 | valkey7 Constraints: Must be 1 to 255 alphanumeric characters First
        # character must be a letter Cannot end with a hyphen or contain two consecutive hyphens
        @[JSON::Field(key: "CacheParameterGroupFamily")]
        getter cache_parameter_group_family : String?

        # If true , specifies that only the default version of the specified engine or engine and major
        # version combination is to be returned.
        @[JSON::Field(key: "DefaultOnly")]
        getter default_only : Bool?

        # The cache engine to return. Valid values: memcached | redis
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The cache engine version to return. Example: 1.4.14
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @cache_parameter_group_family : String? = nil,
          @default_only : Bool? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input of a DescribeCacheParameterGroups operation.
      struct DescribeCacheParameterGroupsMessage
        include JSON::Serializable

        # The name of a specific cache parameter group to return details for.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @cache_parameter_group_name : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input of a DescribeCacheParameters operation.
      struct DescribeCacheParametersMessage
        include JSON::Serializable

        # The name of a specific cache parameter group to return details for.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The parameter types to return. Valid values: user | system | engine-default
        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @cache_parameter_group_name : String,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @source : String? = nil
        )
        end
      end

      # Represents the input of a DescribeCacheSecurityGroups operation.
      struct DescribeCacheSecurityGroupsMessage
        include JSON::Serializable

        # The name of the cache security group to return details for.
        @[JSON::Field(key: "CacheSecurityGroupName")]
        getter cache_security_group_name : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @cache_security_group_name : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input of a DescribeCacheSubnetGroups operation.
      struct DescribeCacheSubnetGroupsMessage
        include JSON::Serializable

        # The name of the cache subnet group to return details for.
        @[JSON::Field(key: "CacheSubnetGroupName")]
        getter cache_subnet_group_name : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @cache_subnet_group_name : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      # Represents the input of a DescribeEngineDefaultParameters operation.
      struct DescribeEngineDefaultParametersMessage
        include JSON::Serializable

        # The name of the cache parameter group family. Valid values are: memcached1.4 | memcached1.5 |
        # memcached1.6 | redis2.6 | redis2.8 | redis3.2 | redis4.0 | redis5.0 | redis6.x | redis6.2 | redis7
        @[JSON::Field(key: "CacheParameterGroupFamily")]
        getter cache_parameter_group_family : String

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        def initialize(
          @cache_parameter_group_family : String,
          @marker : String? = nil,
          @max_records : Int32? = nil
        )
        end
      end

      struct DescribeEngineDefaultParametersResult
        include JSON::Serializable

        @[JSON::Field(key: "EngineDefaults")]
        getter engine_defaults : Types::EngineDefaults?

        def initialize(
          @engine_defaults : Types::EngineDefaults? = nil
        )
        end
      end

      # Represents the input of a DescribeEvents operation.
      struct DescribeEventsMessage
        include JSON::Serializable

        # The number of minutes worth of events to retrieve.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The end of the time interval for which to retrieve events, specified in ISO 8601 format. Example:
        # 2017-03-30T07:03:49.555Z
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The identifier of the event source for which events are returned. If not specified, all sources are
        # included in the response.
        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        # The event source to retrieve events for. If no value is specified, all events are returned.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # The beginning of the time interval to retrieve events for, specified in ISO 8601 format. Example:
        # 2017-03-30T07:03:49.555Z
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @duration : Int32? = nil,
          @end_time : Time? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @source_identifier : String? = nil,
          @source_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct DescribeGlobalReplicationGroupsMessage
        include JSON::Serializable

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # Returns the list of members that comprise the Global datastore.
        @[JSON::Field(key: "ShowMemberInfo")]
        getter show_member_info : Bool?

        def initialize(
          @global_replication_group_id : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @show_member_info : Bool? = nil
        )
        end
      end

      struct DescribeGlobalReplicationGroupsResult
        include JSON::Serializable

        # Indicates the slot configuration and global identifier for each slice group.
        @[JSON::Field(key: "GlobalReplicationGroups")]
        getter global_replication_groups : Array(Types::GlobalReplicationGroup)?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords. &gt;
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @global_replication_groups : Array(Types::GlobalReplicationGroup)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Represents the input of a DescribeReplicationGroups operation.
      struct DescribeReplicationGroupsMessage
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The identifier for the replication group to be described. This parameter is not case sensitive. If
        # you do not specify this parameter, information about all replication groups is returned.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @replication_group_id : String? = nil
        )
        end
      end

      # Represents the input of a DescribeReservedCacheNodes operation.
      struct DescribeReservedCacheNodesMessage
        include JSON::Serializable

        # The cache node type filter value. Use this parameter to show only those reservations matching the
        # specified cache node type. The following node types are supported by ElastiCache. Generally
        # speaking, the current generation types provide more memory and computational power at lower cost
        # when compared to their equivalent previous generation counterparts. General purpose: Current
        # generation: M7g node types : cache.m7g.large , cache.m7g.xlarge , cache.m7g.2xlarge ,
        # cache.m7g.4xlarge , cache.m7g.8xlarge , cache.m7g.12xlarge , cache.m7g.16xlarge For region
        # availability, see Supported Node Types M6g node types (available only for Redis OSS engine version
        # 5.0.6 onward and for Memcached engine version 1.5.16 onward): cache.m6g.large , cache.m6g.xlarge ,
        # cache.m6g.2xlarge , cache.m6g.4xlarge , cache.m6g.8xlarge , cache.m6g.12xlarge , cache.m6g.16xlarge
        # M5 node types: cache.m5.large , cache.m5.xlarge , cache.m5.2xlarge , cache.m5.4xlarge ,
        # cache.m5.12xlarge , cache.m5.24xlarge M4 node types: cache.m4.large , cache.m4.xlarge ,
        # cache.m4.2xlarge , cache.m4.4xlarge , cache.m4.10xlarge T4g node types (available only for Redis OSS
        # engine version 5.0.6 onward and Memcached engine version 1.5.16 onward): cache.t4g.micro ,
        # cache.t4g.small , cache.t4g.medium T3 node types: cache.t3.micro , cache.t3.small , cache.t3.medium
        # T2 node types: cache.t2.micro , cache.t2.small , cache.t2.medium Previous generation: (not
        # recommended. Existing clusters are still supported but creation of new clusters is not supported for
        # these types.) T1 node types: cache.t1.micro M1 node types: cache.m1.small , cache.m1.medium ,
        # cache.m1.large , cache.m1.xlarge M3 node types: cache.m3.medium , cache.m3.large , cache.m3.xlarge ,
        # cache.m3.2xlarge Compute optimized: Previous generation: (not recommended. Existing clusters are
        # still supported but creation of new clusters is not supported for these types.) C1 node types:
        # cache.c1.xlarge Memory optimized: Current generation: R7g node types : cache.r7g.large ,
        # cache.r7g.xlarge , cache.r7g.2xlarge , cache.r7g.4xlarge , cache.r7g.8xlarge , cache.r7g.12xlarge ,
        # cache.r7g.16xlarge For region availability, see Supported Node Types R6g node types (available only
        # for Redis OSS engine version 5.0.6 onward and for Memcached engine version 1.5.16 onward):
        # cache.r6g.large , cache.r6g.xlarge , cache.r6g.2xlarge , cache.r6g.4xlarge , cache.r6g.8xlarge ,
        # cache.r6g.12xlarge , cache.r6g.16xlarge R5 node types: cache.r5.large , cache.r5.xlarge ,
        # cache.r5.2xlarge , cache.r5.4xlarge , cache.r5.12xlarge , cache.r5.24xlarge R4 node types:
        # cache.r4.large , cache.r4.xlarge , cache.r4.2xlarge , cache.r4.4xlarge , cache.r4.8xlarge ,
        # cache.r4.16xlarge Previous generation: (not recommended. Existing clusters are still supported but
        # creation of new clusters is not supported for these types.) M2 node types: cache.m2.xlarge ,
        # cache.m2.2xlarge , cache.m2.4xlarge R3 node types: cache.r3.large , cache.r3.xlarge ,
        # cache.r3.2xlarge , cache.r3.4xlarge , cache.r3.8xlarge Additional node type info All current
        # generation instance types are created in Amazon VPC by default. Valkey or Redis OSS append-only
        # files (AOF) are not supported for T1 or T2 instances. Valkey or Redis OSS Multi-AZ with automatic
        # failover is not supported on T1 instances. The configuration variables appendonly and appendfsync
        # are not supported on Valkey, or on Redis OSS version 2.8.22 and later.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The duration filter value, specified in years or seconds. Use this parameter to show only
        # reservations for this duration. Valid Values: 1 | 3 | 31536000 | 94608000
        @[JSON::Field(key: "Duration")]
        getter duration : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The offering type filter value. Use this parameter to show only the available offerings matching the
        # specified offering type. Valid values: "Light Utilization"|"Medium Utilization"|"Heavy
        # Utilization"|"All Upfront"|"Partial Upfront"| "No Upfront"
        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The product description filter value. Use this parameter to show only those reservations matching
        # the specified product description.
        @[JSON::Field(key: "ProductDescription")]
        getter product_description : String?

        # The reserved cache node identifier filter value. Use this parameter to show only the reservation
        # that matches the specified reservation ID.
        @[JSON::Field(key: "ReservedCacheNodeId")]
        getter reserved_cache_node_id : String?

        # The offering identifier filter value. Use this parameter to show only purchased reservations
        # matching the specified offering identifier.
        @[JSON::Field(key: "ReservedCacheNodesOfferingId")]
        getter reserved_cache_nodes_offering_id : String?

        def initialize(
          @cache_node_type : String? = nil,
          @duration : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @offering_type : String? = nil,
          @product_description : String? = nil,
          @reserved_cache_node_id : String? = nil,
          @reserved_cache_nodes_offering_id : String? = nil
        )
        end
      end

      # Represents the input of a DescribeReservedCacheNodesOfferings operation.
      struct DescribeReservedCacheNodesOfferingsMessage
        include JSON::Serializable

        # The cache node type filter value. Use this parameter to show only the available offerings matching
        # the specified cache node type. The following node types are supported by ElastiCache. Generally
        # speaking, the current generation types provide more memory and computational power at lower cost
        # when compared to their equivalent previous generation counterparts. General purpose: Current
        # generation: M7g node types : cache.m7g.large , cache.m7g.xlarge , cache.m7g.2xlarge ,
        # cache.m7g.4xlarge , cache.m7g.8xlarge , cache.m7g.12xlarge , cache.m7g.16xlarge For region
        # availability, see Supported Node Types M6g node types (available only for Redis OSS engine version
        # 5.0.6 onward and for Memcached engine version 1.5.16 onward): cache.m6g.large , cache.m6g.xlarge ,
        # cache.m6g.2xlarge , cache.m6g.4xlarge , cache.m6g.8xlarge , cache.m6g.12xlarge , cache.m6g.16xlarge
        # M5 node types: cache.m5.large , cache.m5.xlarge , cache.m5.2xlarge , cache.m5.4xlarge ,
        # cache.m5.12xlarge , cache.m5.24xlarge M4 node types: cache.m4.large , cache.m4.xlarge ,
        # cache.m4.2xlarge , cache.m4.4xlarge , cache.m4.10xlarge T4g node types (available only for Redis OSS
        # engine version 5.0.6 onward and Memcached engine version 1.5.16 onward): cache.t4g.micro ,
        # cache.t4g.small , cache.t4g.medium T3 node types: cache.t3.micro , cache.t3.small , cache.t3.medium
        # T2 node types: cache.t2.micro , cache.t2.small , cache.t2.medium Previous generation: (not
        # recommended. Existing clusters are still supported but creation of new clusters is not supported for
        # these types.) T1 node types: cache.t1.micro M1 node types: cache.m1.small , cache.m1.medium ,
        # cache.m1.large , cache.m1.xlarge M3 node types: cache.m3.medium , cache.m3.large , cache.m3.xlarge ,
        # cache.m3.2xlarge Compute optimized: Previous generation: (not recommended. Existing clusters are
        # still supported but creation of new clusters is not supported for these types.) C1 node types:
        # cache.c1.xlarge Memory optimized: Current generation: R7g node types : cache.r7g.large ,
        # cache.r7g.xlarge , cache.r7g.2xlarge , cache.r7g.4xlarge , cache.r7g.8xlarge , cache.r7g.12xlarge ,
        # cache.r7g.16xlarge For region availability, see Supported Node Types R6g node types (available only
        # for Redis OSS engine version 5.0.6 onward and for Memcached engine version 1.5.16 onward):
        # cache.r6g.large , cache.r6g.xlarge , cache.r6g.2xlarge , cache.r6g.4xlarge , cache.r6g.8xlarge ,
        # cache.r6g.12xlarge , cache.r6g.16xlarge R5 node types: cache.r5.large , cache.r5.xlarge ,
        # cache.r5.2xlarge , cache.r5.4xlarge , cache.r5.12xlarge , cache.r5.24xlarge R4 node types:
        # cache.r4.large , cache.r4.xlarge , cache.r4.2xlarge , cache.r4.4xlarge , cache.r4.8xlarge ,
        # cache.r4.16xlarge Previous generation: (not recommended. Existing clusters are still supported but
        # creation of new clusters is not supported for these types.) M2 node types: cache.m2.xlarge ,
        # cache.m2.2xlarge , cache.m2.4xlarge R3 node types: cache.r3.large , cache.r3.xlarge ,
        # cache.r3.2xlarge , cache.r3.4xlarge , cache.r3.8xlarge Additional node type info All current
        # generation instance types are created in Amazon VPC by default. Valkey or Redis OSS append-only
        # files (AOF) are not supported for T1 or T2 instances. Valkey or Redis OSS Multi-AZ with automatic
        # failover is not supported on T1 instances. The configuration variables appendonly and appendfsync
        # are not supported on Valkey, or on Redis OSS version 2.8.22 and later.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # Duration filter value, specified in years or seconds. Use this parameter to show only reservations
        # for a given duration. Valid Values: 1 | 3 | 31536000 | 94608000
        @[JSON::Field(key: "Duration")]
        getter duration : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 100 Constraints: minimum 20; maximum 100.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The offering type filter value. Use this parameter to show only the available offerings matching the
        # specified offering type. Valid Values: "Light Utilization"|"Medium Utilization"|"Heavy Utilization"
        # |"All Upfront"|"Partial Upfront"| "No Upfront"
        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The product description filter value. Use this parameter to show only the available offerings
        # matching the specified product description.
        @[JSON::Field(key: "ProductDescription")]
        getter product_description : String?

        # The offering identifier filter value. Use this parameter to show only the available offering that
        # matches the specified reservation identifier. Example: 438012d3-4052-4cc7-b2e3-8d3372e0e706
        @[JSON::Field(key: "ReservedCacheNodesOfferingId")]
        getter reserved_cache_nodes_offering_id : String?

        def initialize(
          @cache_node_type : String? = nil,
          @duration : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @offering_type : String? = nil,
          @product_description : String? = nil,
          @reserved_cache_nodes_offering_id : String? = nil
        )
        end
      end

      struct DescribeServerlessCacheSnapshotsRequest
        include JSON::Serializable

        # The maximum number of records to include in the response. If more records exist than the specified
        # max-results value, a market is included in the response so that remaining results can be retrieved.
        # Available for Valkey, Redis OSS and Serverless Memcached only.The default is 50. The Validation
        # Constraints are a maximum of 50.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional marker returned from a prior request to support pagination of results from this
        # operation. If this parameter is specified, the response includes only records beyond the marker, up
        # to the value specified by max-results. Available for Valkey, Redis OSS and Serverless Memcached
        # only.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of serverless cache. If this parameter is specified, only snapshots associated with
        # that specific serverless cache are described. Available for Valkey, Redis OSS and Serverless
        # Memcached only.
        @[JSON::Field(key: "ServerlessCacheName")]
        getter serverless_cache_name : String?

        # The identifier of the serverless cache’s snapshot. If this parameter is specified, only this
        # snapshot is described. Available for Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "ServerlessCacheSnapshotName")]
        getter serverless_cache_snapshot_name : String?

        # The type of snapshot that is being described. Available for Valkey, Redis OSS and Serverless
        # Memcached only.
        @[JSON::Field(key: "SnapshotType")]
        getter snapshot_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @serverless_cache_name : String? = nil,
          @serverless_cache_snapshot_name : String? = nil,
          @snapshot_type : String? = nil
        )
        end
      end

      struct DescribeServerlessCacheSnapshotsResponse
        include JSON::Serializable

        # An optional marker returned from a prior request to support pagination of results from this
        # operation. If this parameter is specified, the response includes only records beyond the marker, up
        # to the value specified by max-results. Available for Valkey, Redis OSS and Serverless Memcached
        # only.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The serverless caches snapshots associated with a given description request. Available for Valkey,
        # Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "ServerlessCacheSnapshots")]
        getter serverless_cache_snapshots : Array(Types::ServerlessCacheSnapshot)?

        def initialize(
          @next_token : String? = nil,
          @serverless_cache_snapshots : Array(Types::ServerlessCacheSnapshot)? = nil
        )
        end
      end

      struct DescribeServerlessCachesRequest
        include JSON::Serializable

        # The maximum number of records in the response. If more records exist than the specified max-records
        # value, the next token is included in the response so that remaining results can be retrieved. The
        # default is 50.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional marker returned from a prior request to support pagination of results from this
        # operation. If this parameter is specified, the response includes only records beyond the marker, up
        # to the value specified by MaxResults.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier for the serverless cache. If this parameter is specified, only information about that
        # specific serverless cache is returned. Default: NULL
        @[JSON::Field(key: "ServerlessCacheName")]
        getter serverless_cache_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @serverless_cache_name : String? = nil
        )
        end
      end

      struct DescribeServerlessCachesResponse
        include JSON::Serializable

        # An optional marker returned from a prior request to support pagination of results from this
        # operation. If this parameter is specified, the response includes only records beyond the marker, up
        # to the value specified by MaxResults.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The serverless caches associated with a given description request.
        @[JSON::Field(key: "ServerlessCaches")]
        getter serverless_caches : Array(Types::ServerlessCache)?

        def initialize(
          @next_token : String? = nil,
          @serverless_caches : Array(Types::ServerlessCache)? = nil
        )
        end
      end

      struct DescribeServiceUpdatesMessage
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The unique ID of the service update
        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String?

        # The status of the service update
        @[JSON::Field(key: "ServiceUpdateStatus")]
        getter service_update_status : Array(String)?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @service_update_name : String? = nil,
          @service_update_status : Array(String)? = nil
        )
        end
      end

      # Represents the output of a DescribeSnapshots operation.
      struct DescribeSnapshotsListMessage
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of snapshots. Each item in the list contains detailed information about one snapshot.
        @[JSON::Field(key: "Snapshots")]
        getter snapshots : Array(Types::Snapshot)?

        def initialize(
          @marker : String? = nil,
          @snapshots : Array(Types::Snapshot)? = nil
        )
        end
      end

      # Represents the input of a DescribeSnapshotsMessage operation.
      struct DescribeSnapshotsMessage
        include JSON::Serializable

        # A user-supplied cluster identifier. If this parameter is specified, only snapshots associated with
        # that specific cluster are described.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved. Default: 50 Constraints: minimum 20; maximum 50.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # A user-supplied replication group identifier. If this parameter is specified, only snapshots
        # associated with that specific replication group are described.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # A Boolean value which if true, the node group (shard) configuration is included in the snapshot
        # description.
        @[JSON::Field(key: "ShowNodeGroupConfig")]
        getter show_node_group_config : Bool?

        # A user-supplied name of the snapshot. If this parameter is specified, only this snapshot are
        # described.
        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String?

        # If set to system , the output shows snapshots that were automatically created by ElastiCache. If set
        # to user the output shows snapshots that were manually created. If omitted, the output shows both
        # automatically and manually created snapshots.
        @[JSON::Field(key: "SnapshotSource")]
        getter snapshot_source : String?

        def initialize(
          @cache_cluster_id : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @replication_group_id : String? = nil,
          @show_node_group_config : Bool? = nil,
          @snapshot_name : String? = nil,
          @snapshot_source : String? = nil
        )
        end
      end

      struct DescribeUpdateActionsMessage
        include JSON::Serializable

        # The cache cluster IDs
        @[JSON::Field(key: "CacheClusterIds")]
        getter cache_cluster_ids : Array(String)?

        # The Elasticache engine to which the update applies. Either Valkey, Redis OSS or Memcached.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The replication group IDs
        @[JSON::Field(key: "ReplicationGroupIds")]
        getter replication_group_ids : Array(String)?

        # The unique ID of the service update
        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String?

        # The status of the service update
        @[JSON::Field(key: "ServiceUpdateStatus")]
        getter service_update_status : Array(String)?

        # The range of time specified to search for service updates that are in available status
        @[JSON::Field(key: "ServiceUpdateTimeRange")]
        getter service_update_time_range : Types::TimeRangeFilter?

        # Dictates whether to include node level update status in the response
        @[JSON::Field(key: "ShowNodeLevelUpdateStatus")]
        getter show_node_level_update_status : Bool?

        # The status of the update action.
        @[JSON::Field(key: "UpdateActionStatus")]
        getter update_action_status : Array(String)?

        def initialize(
          @cache_cluster_ids : Array(String)? = nil,
          @engine : String? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @replication_group_ids : Array(String)? = nil,
          @service_update_name : String? = nil,
          @service_update_status : Array(String)? = nil,
          @service_update_time_range : Types::TimeRangeFilter? = nil,
          @show_node_level_update_status : Bool? = nil,
          @update_action_status : Array(String)? = nil
        )
        end
      end

      struct DescribeUserGroupsMessage
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords. &gt;
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The ID of the user group.
        @[JSON::Field(key: "UserGroupId")]
        getter user_group_id : String?

        def initialize(
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @user_group_id : String? = nil
        )
        end
      end

      struct DescribeUserGroupsResult
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords.&gt;
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Returns a list of user groups.
        @[JSON::Field(key: "UserGroups")]
        getter user_groups : Array(Types::UserGroup)?

        def initialize(
          @marker : String? = nil,
          @user_groups : Array(Types::UserGroup)? = nil
        )
        end
      end

      struct DescribeUsersMessage
        include JSON::Serializable

        # The engine.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Filter to determine the list of User IDs to return.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords. &gt;
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of records to include in the response. If more records exist than the specified
        # MaxRecords value, a marker is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # The ID of the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @engine : String? = nil,
          @filters : Array(Types::Filter)? = nil,
          @marker : String? = nil,
          @max_records : Int32? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct DescribeUsersResult
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords. &gt;
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of users.
        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)?

        def initialize(
          @marker : String? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # Configuration details of either a CloudWatch Logs destination or Kinesis Data Firehose destination.
      struct DestinationDetails
        include JSON::Serializable

        # The configuration details of the CloudWatch Logs destination.
        @[JSON::Field(key: "CloudWatchLogsDetails")]
        getter cloud_watch_logs_details : Types::CloudWatchLogsDestinationDetails?

        # The configuration details of the Kinesis Data Firehose destination.
        @[JSON::Field(key: "KinesisFirehoseDetails")]
        getter kinesis_firehose_details : Types::KinesisFirehoseDestinationDetails?

        def initialize(
          @cloud_watch_logs_details : Types::CloudWatchLogsDestinationDetails? = nil,
          @kinesis_firehose_details : Types::KinesisFirehoseDestinationDetails? = nil
        )
        end
      end

      struct DisassociateGlobalReplicationGroupMessage
        include JSON::Serializable

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String

        # The name of the secondary cluster you wish to remove from the Global datastore
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        # The Amazon region of secondary cluster you wish to remove from the Global datastore
        @[JSON::Field(key: "ReplicationGroupRegion")]
        getter replication_group_region : String

        def initialize(
          @global_replication_group_id : String,
          @replication_group_id : String,
          @replication_group_region : String
        )
        end
      end

      struct DisassociateGlobalReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "GlobalReplicationGroup")]
        getter global_replication_group : Types::GlobalReplicationGroup?

        def initialize(
          @global_replication_group : Types::GlobalReplicationGroup? = nil
        )
        end
      end

      # A user with this username already exists.
      struct DuplicateUserNameFault
        include JSON::Serializable

        def initialize
        end
      end

      # Provides ownership and status information for an Amazon EC2 security group.
      struct EC2SecurityGroup
        include JSON::Serializable

        # The name of the Amazon EC2 security group.
        @[JSON::Field(key: "EC2SecurityGroupName")]
        getter ec2_security_group_name : String?

        # The Amazon account ID of the Amazon EC2 security group owner.
        @[JSON::Field(key: "EC2SecurityGroupOwnerId")]
        getter ec2_security_group_owner_id : String?

        # The status of the Amazon EC2 security group.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @ec2_security_group_name : String? = nil,
          @ec2_security_group_owner_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The configuration for the number of ElastiCache Processing Units (ECPU) the cache can consume per
      # second.
      struct ECPUPerSecond
        include JSON::Serializable

        # The configuration for the maximum number of ECPUs the cache can consume per second.
        @[JSON::Field(key: "Maximum")]
        getter maximum : Int32?

        # The configuration for the minimum number of ECPUs the cache should be able consume per second.
        @[JSON::Field(key: "Minimum")]
        getter minimum : Int32?

        def initialize(
          @maximum : Int32? = nil,
          @minimum : Int32? = nil
        )
        end
      end

      # Represents the information required for client programs to connect to a cache node. This value is
      # read-only.
      struct Endpoint
        include JSON::Serializable

        # The DNS hostname of the cache node.
        @[JSON::Field(key: "Address")]
        getter address : String?

        # The port number that the cache engine is listening on.
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        def initialize(
          @address : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # Represents the output of a DescribeEngineDefaultParameters operation.
      struct EngineDefaults
        include JSON::Serializable

        # A list of parameters specific to a particular cache node type. Each element in the list contains
        # detailed information about one parameter.
        @[JSON::Field(key: "CacheNodeTypeSpecificParameters")]
        getter cache_node_type_specific_parameters : Array(Types::CacheNodeTypeSpecificParameter)?

        # Specifies the name of the cache parameter group family to which the engine default parameters apply.
        # Valid values are: memcached1.4 | memcached1.5 | memcached1.6 | redis2.6 | redis2.8 | redis3.2 |
        # redis4.0 | redis5.0 | redis6.0 | redis6.x | redis7
        @[JSON::Field(key: "CacheParameterGroupFamily")]
        getter cache_parameter_group_family : String?

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Contains a list of engine default parameters.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::Parameter)?

        def initialize(
          @cache_node_type_specific_parameters : Array(Types::CacheNodeTypeSpecificParameter)? = nil,
          @cache_parameter_group_family : String? = nil,
          @marker : String? = nil,
          @parameters : Array(Types::Parameter)? = nil
        )
        end
      end

      # Represents a single occurrence of something interesting within the system. Some examples of events
      # are creating a cluster, adding or removing a cache node, or rebooting a node.
      struct Event
        include JSON::Serializable

        # The date and time when the event occurred.
        @[JSON::Field(key: "Date")]
        getter date : Time?

        # The text of the event.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The identifier for the source of the event. For example, if the event occurred at the cluster level,
        # the identifier would be the name of the cluster.
        @[JSON::Field(key: "SourceIdentifier")]
        getter source_identifier : String?

        # Specifies the origin of this event - a cluster, a parameter group, a security group, etc.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @date : Time? = nil,
          @message : String? = nil,
          @source_identifier : String? = nil,
          @source_type : String? = nil
        )
        end
      end

      # Represents the output of a DescribeEvents operation.
      struct EventsMessage
        include JSON::Serializable

        # A list of events. Each element in the list contains detailed information about one event.
        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)?

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @events : Array(Types::Event)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct ExportServerlessCacheSnapshotRequest
        include JSON::Serializable

        # Name of the Amazon S3 bucket to export the snapshot to. The Amazon S3 bucket must also be in same
        # region as the snapshot. Available for Valkey and Redis OSS only.
        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        # The identifier of the serverless cache snapshot to be exported to S3. Available for Valkey and Redis
        # OSS only.
        @[JSON::Field(key: "ServerlessCacheSnapshotName")]
        getter serverless_cache_snapshot_name : String

        def initialize(
          @s3_bucket_name : String,
          @serverless_cache_snapshot_name : String
        )
        end
      end

      struct ExportServerlessCacheSnapshotResponse
        include JSON::Serializable

        # The state of a serverless cache at a specific point in time, to the millisecond. Available for
        # Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "ServerlessCacheSnapshot")]
        getter serverless_cache_snapshot : Types::ServerlessCacheSnapshot?

        def initialize(
          @serverless_cache_snapshot : Types::ServerlessCacheSnapshot? = nil
        )
        end
      end

      struct FailoverGlobalReplicationGroupMessage
        include JSON::Serializable

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String

        # The Amazon region of the primary cluster of the Global datastore
        @[JSON::Field(key: "PrimaryRegion")]
        getter primary_region : String

        # The name of the primary replication group
        @[JSON::Field(key: "PrimaryReplicationGroupId")]
        getter primary_replication_group_id : String

        def initialize(
          @global_replication_group_id : String,
          @primary_region : String,
          @primary_replication_group_id : String
        )
        end
      end

      struct FailoverGlobalReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "GlobalReplicationGroup")]
        getter global_replication_group : Types::GlobalReplicationGroup?

        def initialize(
          @global_replication_group : Types::GlobalReplicationGroup? = nil
        )
        end
      end

      # Used to streamline results of a search based on the property being filtered.
      struct Filter
        include JSON::Serializable

        # The property being filtered. For example, UserId.
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

      # Indicates the slot configuration and global identifier for a slice group.
      struct GlobalNodeGroup
        include JSON::Serializable

        # The name of the global node group
        @[JSON::Field(key: "GlobalNodeGroupId")]
        getter global_node_group_id : String?

        # The keyspace for this node group
        @[JSON::Field(key: "Slots")]
        getter slots : String?

        def initialize(
          @global_node_group_id : String? = nil,
          @slots : String? = nil
        )
        end
      end

      # Consists of a primary cluster that accepts writes and an associated secondary cluster that resides
      # in a different Amazon region. The secondary cluster accepts only reads. The primary cluster
      # automatically replicates updates to the secondary cluster. The GlobalReplicationGroupIdSuffix
      # represents the name of the Global datastore, which is what you use to associate a secondary cluster.
      struct GlobalReplicationGroup
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the global replication group.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A flag that enables encryption at rest when set to true . You cannot modify the value of
        # AtRestEncryptionEnabled after the replication group is created. To enable encryption at rest on a
        # replication group you must set AtRestEncryptionEnabled to true when you create the replication
        # group. Required: Only available when creating a replication group in an Amazon VPC using Redis OSS
        # version 3.2.6 , 4.x or later.
        @[JSON::Field(key: "AtRestEncryptionEnabled")]
        getter at_rest_encryption_enabled : Bool?

        # A flag that enables using an AuthToken (password) when issuing Valkey or Redis OSS commands.
        # Default: false
        @[JSON::Field(key: "AuthTokenEnabled")]
        getter auth_token_enabled : Bool?

        # The cache node type of the Global datastore
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # A flag that indicates whether the Global datastore is cluster enabled.
        @[JSON::Field(key: "ClusterEnabled")]
        getter cluster_enabled : Bool?

        # The ElastiCache engine. For Valkey or Redis OSS only.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The ElastiCache engine version.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # Indicates the slot configuration and global identifier for each slice group.
        @[JSON::Field(key: "GlobalNodeGroups")]
        getter global_node_groups : Array(Types::GlobalNodeGroup)?

        # The optional description of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupDescription")]
        getter global_replication_group_description : String?

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String?

        # The replication groups that comprise the Global datastore.
        @[JSON::Field(key: "Members")]
        getter members : Array(Types::GlobalReplicationGroupMember)?

        # The status of the Global datastore
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A flag that enables in-transit encryption when set to true. Required: Only available when creating a
        # replication group in an Amazon VPC using Redis OSS version 3.2.6 , 4.x or later.
        @[JSON::Field(key: "TransitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        def initialize(
          @arn : String? = nil,
          @at_rest_encryption_enabled : Bool? = nil,
          @auth_token_enabled : Bool? = nil,
          @cache_node_type : String? = nil,
          @cluster_enabled : Bool? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @global_node_groups : Array(Types::GlobalNodeGroup)? = nil,
          @global_replication_group_description : String? = nil,
          @global_replication_group_id : String? = nil,
          @members : Array(Types::GlobalReplicationGroupMember)? = nil,
          @status : String? = nil,
          @transit_encryption_enabled : Bool? = nil
        )
        end
      end

      # The Global datastore name already exists.
      struct GlobalReplicationGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The name of the Global datastore and role of this replication group in the Global datastore.
      struct GlobalReplicationGroupInfo
        include JSON::Serializable

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String?

        # The role of the replication group in a Global datastore. Can be primary or secondary.
        @[JSON::Field(key: "GlobalReplicationGroupMemberRole")]
        getter global_replication_group_member_role : String?

        def initialize(
          @global_replication_group_id : String? = nil,
          @global_replication_group_member_role : String? = nil
        )
        end
      end

      # A member of a Global datastore. It contains the Replication Group Id, the Amazon region and the role
      # of the replication group.
      struct GlobalReplicationGroupMember
        include JSON::Serializable

        # Indicates whether automatic failover is enabled for the replication group.
        @[JSON::Field(key: "AutomaticFailover")]
        getter automatic_failover : String?

        # The replication group id of the Global datastore member.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # The Amazon region of the Global datastore member.
        @[JSON::Field(key: "ReplicationGroupRegion")]
        getter replication_group_region : String?

        # Indicates the role of the replication group, primary or secondary.
        @[JSON::Field(key: "Role")]
        getter role : String?

        # The status of the membership of the replication group.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @automatic_failover : String? = nil,
          @replication_group_id : String? = nil,
          @replication_group_region : String? = nil,
          @role : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The Global datastore does not exist
      struct GlobalReplicationGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      struct IncreaseNodeGroupsInGlobalReplicationGroupMessage
        include JSON::Serializable

        # Indicates that the process begins immediately. At present, the only permitted value for this
        # parameter is true.
        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String

        # Total number of node groups you want
        @[JSON::Field(key: "NodeGroupCount")]
        getter node_group_count : Int32

        # Describes the replication group IDs, the Amazon regions where they are stored and the shard
        # configuration for each that comprise the Global datastore
        @[JSON::Field(key: "RegionalConfigurations")]
        getter regional_configurations : Array(Types::RegionalConfiguration)?

        def initialize(
          @apply_immediately : Bool,
          @global_replication_group_id : String,
          @node_group_count : Int32,
          @regional_configurations : Array(Types::RegionalConfiguration)? = nil
        )
        end
      end

      struct IncreaseNodeGroupsInGlobalReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "GlobalReplicationGroup")]
        getter global_replication_group : Types::GlobalReplicationGroup?

        def initialize(
          @global_replication_group : Types::GlobalReplicationGroup? = nil
        )
        end
      end

      struct IncreaseReplicaCountMessage
        include JSON::Serializable

        # If True , the number of replica nodes is increased immediately. ApplyImmediately=False is not
        # currently supported.
        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool

        # The id of the replication group to which you want to add replica nodes.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        # The number of read replica nodes you want at the completion of this operation. For Valkey or Redis
        # OSS (cluster mode disabled) replication groups, this is the number of replica nodes in the
        # replication group. For Valkey or Redis OSS (cluster mode enabled) replication groups, this is the
        # number of replica nodes in each of the replication group's node groups.
        @[JSON::Field(key: "NewReplicaCount")]
        getter new_replica_count : Int32?

        # A list of ConfigureShard objects that can be used to configure each shard in a Valkey or Redis OSS
        # (cluster mode enabled) replication group. The ConfigureShard has three members: NewReplicaCount ,
        # NodeGroupId , and PreferredAvailabilityZones .
        @[JSON::Field(key: "ReplicaConfiguration")]
        getter replica_configuration : Array(Types::ConfigureShard)?

        def initialize(
          @apply_immediately : Bool,
          @replication_group_id : String,
          @new_replica_count : Int32? = nil,
          @replica_configuration : Array(Types::ConfigureShard)? = nil
        )
        end
      end

      struct IncreaseReplicaCountResult
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      # The requested cache node type is not available in the specified Availability Zone. For more
      # information, see InsufficientCacheClusterCapacity in the ElastiCache User Guide.
      struct InsufficientCacheClusterCapacityFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested Amazon Resource Name (ARN) does not refer to an existing resource.
      struct InvalidARNFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested cluster is not in the available state.
      struct InvalidCacheClusterStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The current state of the cache parameter group does not allow the requested operation to occur.
      struct InvalidCacheParameterGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The current state of the cache security group does not allow deletion.
      struct InvalidCacheSecurityGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # You must enter valid credentials.
      struct InvalidCredentialsException
        include JSON::Serializable

        def initialize
        end
      end

      # The Global datastore is not available or in primary-only state.
      struct InvalidGlobalReplicationGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The KMS key supplied is not valid.
      struct InvalidKMSKeyFault
        include JSON::Serializable

        def initialize
        end
      end

      # Two or more incompatible parameters were specified.
      struct InvalidParameterCombinationException
        include JSON::Serializable

        # Two or more parameters that must not be used together were used together.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The value for a parameter is invalid.
      struct InvalidParameterValueException
        include JSON::Serializable

        # A parameter value is invalid.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested replication group is not in the available state.
      struct InvalidReplicationGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The state of the serverless cache snapshot was not received. Available for Valkey, Redis OSS and
      # Serverless Memcached only.
      struct InvalidServerlessCacheSnapshotStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The account for these credentials is not currently active.
      struct InvalidServerlessCacheStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The current state of the snapshot does not allow the requested operation to occur.
      struct InvalidSnapshotStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # An invalid subnet identifier was specified.
      struct InvalidSubnet
        include JSON::Serializable

        def initialize
        end
      end

      # The user group is not in an active state.
      struct InvalidUserGroupStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The user is not in active state.
      struct InvalidUserStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The VPC network is in an invalid state.
      struct InvalidVPCNetworkStateFault
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration details of the Kinesis Data Firehose destination.
      struct KinesisFirehoseDestinationDetails
        include JSON::Serializable

        # The name of the Kinesis Data Firehose delivery stream.
        @[JSON::Field(key: "DeliveryStream")]
        getter delivery_stream : String?

        def initialize(
          @delivery_stream : String? = nil
        )
        end
      end

      # The input parameters for the ListAllowedNodeTypeModifications operation.
      struct ListAllowedNodeTypeModificationsMessage
        include JSON::Serializable

        # The name of the cluster you want to scale up to a larger node instanced type. ElastiCache uses the
        # cluster id to identify the current node type of this cluster and from that to create a list of node
        # types you can scale up to. You must provide a value for either the CacheClusterId or the
        # ReplicationGroupId .
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The name of the replication group want to scale up to a larger node type. ElastiCache uses the
        # replication group id to identify the current node type being used by this replication group, and
        # from that to create a list of node types you can scale up to. You must provide a value for either
        # the CacheClusterId or the ReplicationGroupId .
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        def initialize(
          @cache_cluster_id : String? = nil,
          @replication_group_id : String? = nil
        )
        end
      end

      # The input parameters for the ListTagsForResource operation.
      struct ListTagsForResourceMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want the list of tags, for example
        # arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster or
        # arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot . For more information about ARNs, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces .
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        def initialize(
          @resource_name : String
        )
        end
      end

      # Returns the destination, format and type of the logs.
      struct LogDeliveryConfiguration
        include JSON::Serializable

        # Configuration details of either a CloudWatch Logs destination or Kinesis Data Firehose destination.
        @[JSON::Field(key: "DestinationDetails")]
        getter destination_details : Types::DestinationDetails?

        # Returns the destination type, either cloudwatch-logs or kinesis-firehose .
        @[JSON::Field(key: "DestinationType")]
        getter destination_type : String?

        # Returns the log format, either JSON or TEXT.
        @[JSON::Field(key: "LogFormat")]
        getter log_format : String?

        # Refers to slow-log or engine-log.
        @[JSON::Field(key: "LogType")]
        getter log_type : String?

        # Returns an error message for the log delivery configuration.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Returns the log delivery configuration status. Values are one of enabling | disabling | modifying |
        # active | error
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @destination_details : Types::DestinationDetails? = nil,
          @destination_type : String? = nil,
          @log_format : String? = nil,
          @log_type : String? = nil,
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies the destination, format and type of the logs.
      struct LogDeliveryConfigurationRequest
        include JSON::Serializable

        # Configuration details of either a CloudWatch Logs destination or Kinesis Data Firehose destination.
        @[JSON::Field(key: "DestinationDetails")]
        getter destination_details : Types::DestinationDetails?

        # Specify either cloudwatch-logs or kinesis-firehose as the destination type.
        @[JSON::Field(key: "DestinationType")]
        getter destination_type : String?

        # Specify if log delivery is enabled. Default true .
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # Specifies either JSON or TEXT
        @[JSON::Field(key: "LogFormat")]
        getter log_format : String?

        # Refers to slow-log or engine-log..
        @[JSON::Field(key: "LogType")]
        getter log_type : String?

        def initialize(
          @destination_details : Types::DestinationDetails? = nil,
          @destination_type : String? = nil,
          @enabled : Bool? = nil,
          @log_format : String? = nil,
          @log_type : String? = nil
        )
        end
      end

      # Represents the input of a ModifyCacheCluster operation.
      struct ModifyCacheClusterMessage
        include JSON::Serializable

        # The cluster identifier. This value is stored as a lowercase string.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String

        # Specifies whether the new nodes in this Memcached cluster are all created in a single Availability
        # Zone or created across multiple Availability Zones. Valid values: single-az | cross-az . This option
        # is only supported for Memcached clusters. You cannot specify single-az if the Memcached cluster
        # already has cache nodes in different Availability Zones. If cross-az is specified, existing
        # Memcached nodes remain in their current Availability Zone. Only newly created nodes are located in
        # different Availability Zones.
        @[JSON::Field(key: "AZMode")]
        getter az_mode : String?

        # If true , this parameter causes the modifications in this request and any pending modifications to
        # be applied, asynchronously and as soon as possible, regardless of the PreferredMaintenanceWindow
        # setting for the cluster. If false , changes to the cluster are applied on the next maintenance
        # reboot, or the next failure reboot, whichever occurs first. If you perform a ModifyCacheCluster
        # before a pending modification is applied, the pending modification is replaced by the newer
        # modification. Valid values: true | false Default: false
        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool?

        # Reserved parameter. The password used to access a password protected server. This parameter must be
        # specified with the auth-token-update parameter. Password constraints: Must be only printable ASCII
        # characters Must be at least 16 characters and no more than 128 characters in length Cannot contain
        # any of the following characters: '/', '"', or '@', '%' For more information, see AUTH password at
        # AUTH .
        @[JSON::Field(key: "AuthToken")]
        getter auth_token : String?

        # Specifies the strategy to use to update the AUTH token. This parameter must be specified with the
        # auth-token parameter. Possible values: ROTATE - default, if no update strategy is provided SET -
        # allowed only after ROTATE DELETE - allowed only when transitioning to RBAC For more information, see
        # Authenticating Users with AUTH
        @[JSON::Field(key: "AuthTokenUpdateStrategy")]
        getter auth_token_update_strategy : String?

        # If you are running Valkey 7.2 or Redis OSS engine version 6.0 or later, set this parameter to yes to
        # opt-in to the next auto minor version upgrade campaign. This parameter is disabled for previous
        # versions.
        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # A list of cache node IDs to be removed. A node ID is a numeric identifier (0001, 0002, etc.). This
        # parameter is only valid when NumCacheNodes is less than the existing number of cache nodes. The
        # number of cache node IDs supplied in this parameter must match the difference between the existing
        # number of cache nodes in the cluster or pending cache nodes, whichever is greater, and the value of
        # NumCacheNodes in the request. For example: If you have 3 active cache nodes, 7 pending cache nodes,
        # and the number of cache nodes in this ModifyCacheCluster call is 5, you must list 2 (7 - 5) cache
        # node IDs to remove.
        @[JSON::Field(key: "CacheNodeIdsToRemove")]
        getter cache_node_ids_to_remove : Array(String)?

        # A valid cache node type that you want to scale this cluster up to.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The name of the cache parameter group to apply to this cluster. This change is asynchronously
        # applied as soon as possible for parameters when the ApplyImmediately parameter is specified as true
        # for this request.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        # A list of cache security group names to authorize on this cluster. This change is asynchronously
        # applied as soon as possible. You can use this parameter only with clusters that are created outside
        # of an Amazon Virtual Private Cloud (Amazon VPC). Constraints: Must contain no more than 255
        # alphanumeric characters. Must not be "Default".
        @[JSON::Field(key: "CacheSecurityGroupNames")]
        getter cache_security_group_names : Array(String)?

        # The engine type used by the cache cluster. The options are valkey, memcached or redis.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The upgraded version of the cache engine to be run on the cache nodes. Important: You can upgrade to
        # a newer engine version (see Selecting a Cache Engine and Version ), but you cannot downgrade to an
        # earlier engine version. If you want to use an earlier engine version, you must delete the existing
        # cluster and create it anew with the earlier engine version.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The network type you choose when modifying a cluster, either ipv4 | ipv6 . IPv6 is supported for
        # workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 or Memcached engine
        # version 1.6.6 and above on all instances built on the Nitro system .
        @[JSON::Field(key: "IpDiscovery")]
        getter ip_discovery : String?

        # Specifies the destination, format and type of the logs.
        @[JSON::Field(key: "LogDeliveryConfigurations")]
        getter log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)?

        # This option is only supported on Memcached clusters. The list of Availability Zones where the new
        # Memcached cache nodes are created. This parameter is only valid when NumCacheNodes in the request is
        # greater than the sum of the number of active cache nodes and the number of cache nodes pending
        # creation (which may be zero). The number of Availability Zones supplied in this list must match the
        # cache nodes being added in this request. Scenarios: Scenario 1: You have 3 active nodes and wish to
        # add 2 nodes. Specify NumCacheNodes=5 (3 + 2) and optionally specify two Availability Zones for the
        # two new nodes. Scenario 2: You have 3 active nodes and 2 nodes pending creation (from the scenario 1
        # call) and want to add 1 more node. Specify NumCacheNodes=6 ((3 + 2) + 1) and optionally specify an
        # Availability Zone for the new node. Scenario 3: You want to cancel all pending operations. Specify
        # NumCacheNodes=3 to cancel all pending operations. The Availability Zone placement of nodes pending
        # creation cannot be modified. If you wish to cancel any nodes pending creation, add 0 nodes by
        # setting NumCacheNodes to the number of current nodes. If cross-az is specified, existing Memcached
        # nodes remain in their current Availability Zone. Only newly created nodes can be located in
        # different Availability Zones. For guidance on how to move existing Memcached nodes to different
        # Availability Zones, see the Availability Zone Considerations section of Cache Node Considerations
        # for Memcached . Impact of new add/remove requests upon pending requests Scenario-1 Pending Action:
        # Delete New Request: Delete Result: The new delete, pending or immediate, replaces the pending
        # delete. Scenario-2 Pending Action: Delete New Request: Create Result: The new create, pending or
        # immediate, replaces the pending delete. Scenario-3 Pending Action: Create New Request: Delete
        # Result: The new delete, pending or immediate, replaces the pending create. Scenario-4 Pending
        # Action: Create New Request: Create Result: The new create is added to the pending create. Important:
        # If the new create request is Apply Immediately - Yes , all creates are performed immediately. If the
        # new create request is Apply Immediately - No , all creates are pending.
        @[JSON::Field(key: "NewAvailabilityZones")]
        getter new_availability_zones : Array(String)?

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent. The Amazon
        # SNS topic owner must be same as the cluster owner.
        @[JSON::Field(key: "NotificationTopicArn")]
        getter notification_topic_arn : String?

        # The status of the Amazon SNS notification topic. Notifications are sent only if the status is active
        # . Valid values: active | inactive
        @[JSON::Field(key: "NotificationTopicStatus")]
        getter notification_topic_status : String?

        # The number of cache nodes that the cluster should have. If the value for NumCacheNodes is greater
        # than the sum of the number of current cache nodes and the number of cache nodes pending creation
        # (which may be zero), more nodes are added. If the value is less than the number of existing cache
        # nodes, nodes are removed. If the value is equal to the number of current cache nodes, any pending
        # add or remove requests are canceled. If you are removing cache nodes, you must use the
        # CacheNodeIdsToRemove parameter to provide the IDs of the specific cache nodes to remove. For
        # clusters running Valkey or Redis OSS, this value must be 1. For clusters running Memcached, this
        # value must be between 1 and 40. Adding or removing Memcached cache nodes can be applied immediately
        # or as a pending operation (see ApplyImmediately ). A pending operation to modify the number of cache
        # nodes in a cluster during its maintenance window, whether by adding or removing nodes in accordance
        # with the scale out architecture, is not queued. The customer's latest request to add or remove nodes
        # to the cluster overrides any previous pending operations to modify the number of cache nodes in the
        # cluster. For example, a request to remove 2 nodes would override a previous pending operation to
        # remove 3 nodes. Similarly, a request to add 2 nodes would override a previous pending operation to
        # remove 3 nodes and vice versa. As Memcached cache nodes may now be provisioned in different
        # Availability Zones with flexible cache node placement, a request to add nodes does not automatically
        # override a previous pending operation to add nodes. The customer can modify the previous pending
        # operation to add more nodes or explicitly cancel the pending request and retry the new request. To
        # cancel pending operations to modify the number of cache nodes in a cluster, use the
        # ModifyCacheCluster request and set NumCacheNodes equal to the number of cache nodes currently in the
        # cluster.
        @[JSON::Field(key: "NumCacheNodes")]
        getter num_cache_nodes : Int32?

        # Specifies the weekly time range during which maintenance on the cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period. Valid values for ddd are: sun mon tue wed thu fri sat Example:
        # sun:23:00-mon:01:30
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Configures horizontal or vertical scaling for Memcached clusters, specifying the scaling percentage
        # and interval.
        @[JSON::Field(key: "ScaleConfig")]
        getter scale_config : Types::ScaleConfig?

        # Specifies the VPC Security Groups associated with the cluster. This parameter can be used only with
        # clusters that are created in an Amazon Virtual Private Cloud (Amazon VPC).
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The number of days for which ElastiCache retains automatic cluster snapshots before deleting them.
        # For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for
        # 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are
        # turned off.
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your
        # cluster.
        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        def initialize(
          @cache_cluster_id : String,
          @az_mode : String? = nil,
          @apply_immediately : Bool? = nil,
          @auth_token : String? = nil,
          @auth_token_update_strategy : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @cache_node_ids_to_remove : Array(String)? = nil,
          @cache_node_type : String? = nil,
          @cache_parameter_group_name : String? = nil,
          @cache_security_group_names : Array(String)? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @ip_discovery : String? = nil,
          @log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)? = nil,
          @new_availability_zones : Array(String)? = nil,
          @notification_topic_arn : String? = nil,
          @notification_topic_status : String? = nil,
          @num_cache_nodes : Int32? = nil,
          @preferred_maintenance_window : String? = nil,
          @scale_config : Types::ScaleConfig? = nil,
          @security_group_ids : Array(String)? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil
        )
        end
      end

      struct ModifyCacheClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheCluster")]
        getter cache_cluster : Types::CacheCluster?

        def initialize(
          @cache_cluster : Types::CacheCluster? = nil
        )
        end
      end

      # Represents the input of a ModifyCacheParameterGroup operation.
      struct ModifyCacheParameterGroupMessage
        include JSON::Serializable

        # The name of the cache parameter group to modify.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String

        # An array of parameter names and values for the parameter update. You must supply at least one
        # parameter name and value; subsequent arguments are optional. A maximum of 20 parameters may be
        # modified per request.
        @[JSON::Field(key: "ParameterNameValues")]
        getter parameter_name_values : Array(Types::ParameterNameValue)

        def initialize(
          @cache_parameter_group_name : String,
          @parameter_name_values : Array(Types::ParameterNameValue)
        )
        end
      end

      # Represents the input of a ModifyCacheSubnetGroup operation.
      struct ModifyCacheSubnetGroupMessage
        include JSON::Serializable

        # The name for the cache subnet group. This value is stored as a lowercase string. Constraints: Must
        # contain no more than 255 alphanumeric characters or hyphens. Example: mysubnetgroup
        @[JSON::Field(key: "CacheSubnetGroupName")]
        getter cache_subnet_group_name : String

        # A description of the cache subnet group.
        @[JSON::Field(key: "CacheSubnetGroupDescription")]
        getter cache_subnet_group_description : String?

        # The EC2 subnet IDs for the cache subnet group.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @cache_subnet_group_name : String,
          @cache_subnet_group_description : String? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      struct ModifyCacheSubnetGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheSubnetGroup")]
        getter cache_subnet_group : Types::CacheSubnetGroup?

        def initialize(
          @cache_subnet_group : Types::CacheSubnetGroup? = nil
        )
        end
      end

      struct ModifyGlobalReplicationGroupMessage
        include JSON::Serializable

        # This parameter causes the modifications in this request and any pending modifications to be applied,
        # asynchronously and as soon as possible. Modifications to Global Replication Groups cannot be
        # requested to be applied in PreferredMaintenceWindow.
        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String

        # Determines whether a read replica is automatically promoted to read/write primary if the existing
        # primary encounters a failure.
        @[JSON::Field(key: "AutomaticFailoverEnabled")]
        getter automatic_failover_enabled : Bool?

        # A valid cache node type that you want to scale this Global datastore to.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The name of the cache parameter group to use with the Global datastore. It must be compatible with
        # the major engine version used by the Global datastore.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        # Modifies the engine listed in a global replication group message. The options are redis, memcached
        # or valkey.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The upgraded version of the cache engine to be run on the clusters in the Global datastore.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # A description of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupDescription")]
        getter global_replication_group_description : String?

        def initialize(
          @apply_immediately : Bool,
          @global_replication_group_id : String,
          @automatic_failover_enabled : Bool? = nil,
          @cache_node_type : String? = nil,
          @cache_parameter_group_name : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @global_replication_group_description : String? = nil
        )
        end
      end

      struct ModifyGlobalReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "GlobalReplicationGroup")]
        getter global_replication_group : Types::GlobalReplicationGroup?

        def initialize(
          @global_replication_group : Types::GlobalReplicationGroup? = nil
        )
        end
      end

      # Represents the input of a ModifyReplicationGroups operation.
      struct ModifyReplicationGroupMessage
        include JSON::Serializable

        # The identifier of the replication group to modify.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        # If true , this parameter causes the modifications in this request and any pending modifications to
        # be applied, asynchronously and as soon as possible, regardless of the PreferredMaintenanceWindow
        # setting for the replication group. If false , changes to the nodes in the replication group are
        # applied on the next maintenance reboot, or the next failure reboot, whichever occurs first. Valid
        # values: true | false Default: false
        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool?

        # Reserved parameter. The password used to access a password protected server. This parameter must be
        # specified with the auth-token-update-strategy parameter. Password constraints: Must be only
        # printable ASCII characters Must be at least 16 characters and no more than 128 characters in length
        # Cannot contain any of the following characters: '/', '"', or '@', '%' For more information, see AUTH
        # password at AUTH .
        @[JSON::Field(key: "AuthToken")]
        getter auth_token : String?

        # Specifies the strategy to use to update the AUTH token. This parameter must be specified with the
        # auth-token parameter. Possible values: ROTATE - default, if no update strategy is provided SET -
        # allowed only after ROTATE DELETE - allowed only when transitioning to RBAC For more information, see
        # Authenticating Users with AUTH
        @[JSON::Field(key: "AuthTokenUpdateStrategy")]
        getter auth_token_update_strategy : String?

        # If you are running Valkey or Redis OSS engine version 6.0 or later, set this parameter to yes if you
        # want to opt-in to the next auto minor version upgrade campaign. This parameter is disabled for
        # previous versions.
        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Determines whether a read replica is automatically promoted to read/write primary if the existing
        # primary encounters a failure. Valid values: true | false
        @[JSON::Field(key: "AutomaticFailoverEnabled")]
        getter automatic_failover_enabled : Bool?

        # A valid cache node type that you want to scale this replication group to.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The name of the cache parameter group to apply to all of the clusters in this replication group.
        # This change is asynchronously applied as soon as possible for parameters when the ApplyImmediately
        # parameter is specified as true for this request.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        # A list of cache security group names to authorize for the clusters in this replication group. This
        # change is asynchronously applied as soon as possible. This parameter can be used only with
        # replication group containing clusters running outside of an Amazon Virtual Private Cloud (Amazon
        # VPC). Constraints: Must contain no more than 255 alphanumeric characters. Must not be Default .
        @[JSON::Field(key: "CacheSecurityGroupNames")]
        getter cache_security_group_names : Array(String)?

        # Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you must first set the cluster
        # mode to Compatible. Compatible mode allows your Valkey or Redis OSS clients to connect using both
        # cluster mode enabled and cluster mode disabled. After you migrate all Valkey or Redis OSS clients to
        # use cluster mode enabled, you can then complete cluster mode configuration and set the cluster mode
        # to Enabled.
        @[JSON::Field(key: "ClusterMode")]
        getter cluster_mode : String?

        # Modifies the engine listed in a replication group message. The options are redis, memcached or
        # valkey.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The upgraded version of the cache engine to be run on the clusters in the replication group.
        # Important: You can upgrade to a newer engine version (see Selecting a Cache Engine and Version ),
        # but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version,
        # you must delete the existing replication group and create it anew with the earlier engine version.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The network type you choose when modifying a cluster, either ipv4 | ipv6 . IPv6 is supported for
        # workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 and Memcached engine
        # version 1.6.6 and above on all instances built on the Nitro system .
        @[JSON::Field(key: "IpDiscovery")]
        getter ip_discovery : String?

        # Specifies the destination, format and type of the logs.
        @[JSON::Field(key: "LogDeliveryConfigurations")]
        getter log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)?

        # A flag to indicate MultiAZ is enabled.
        @[JSON::Field(key: "MultiAZEnabled")]
        getter multi_az_enabled : Bool?

        # Deprecated. This parameter is not used.
        @[JSON::Field(key: "NodeGroupId")]
        getter node_group_id : String?

        # The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent. The Amazon
        # SNS topic owner must be same as the replication group owner.
        @[JSON::Field(key: "NotificationTopicArn")]
        getter notification_topic_arn : String?

        # The status of the Amazon SNS notification topic for the replication group. Notifications are sent
        # only if the status is active . Valid values: active | inactive
        @[JSON::Field(key: "NotificationTopicStatus")]
        getter notification_topic_status : String?

        # Specifies the weekly time range during which maintenance on the cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period. Valid values for ddd are: sun mon tue wed thu fri sat Example:
        # sun:23:00-mon:01:30
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # For replication groups with a single primary, if this parameter is specified, ElastiCache promotes
        # the specified cluster in the specified replication group to the primary role. The nodes of all other
        # clusters in the replication group are read replicas.
        @[JSON::Field(key: "PrimaryClusterId")]
        getter primary_cluster_id : String?

        # Removes the user group associated with this replication group.
        @[JSON::Field(key: "RemoveUserGroups")]
        getter remove_user_groups : Bool?

        # A description for the replication group. Maximum length is 255 characters.
        @[JSON::Field(key: "ReplicationGroupDescription")]
        getter replication_group_description : String?

        # Specifies the VPC Security Groups associated with the clusters in the replication group. This
        # parameter can be used only with replication group containing clusters running in an Amazon Virtual
        # Private Cloud (Amazon VPC).
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The number of days for which ElastiCache retains automatic node group (shard) snapshots before
        # deleting them. For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today
        # is retained for 5 days before being deleted. Important If the value of SnapshotRetentionLimit is set
        # to zero (0), backups are turned off.
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of the node
        # group (shard) specified by SnapshottingClusterId . Example: 05:00-09:00 If you do not specify this
        # parameter, ElastiCache automatically chooses an appropriate time range.
        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # The cluster ID that is used as the daily snapshot source for the replication group. This parameter
        # cannot be set for Valkey or Redis OSS (cluster mode enabled) replication groups.
        @[JSON::Field(key: "SnapshottingClusterId")]
        getter snapshotting_cluster_id : String?

        # A flag that enables in-transit encryption when set to true. If you are enabling in-transit
        # encryption for an existing cluster, you must also set TransitEncryptionMode to preferred .
        @[JSON::Field(key: "TransitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        # A setting that allows you to migrate your clients to use in-transit encryption, with no downtime.
        # You must set TransitEncryptionEnabled to true , for your existing cluster, and set
        # TransitEncryptionMode to preferred in the same request to allow both encrypted and unencrypted
        # connections at the same time. Once you migrate all your Valkey or Redis OSS clients to use encrypted
        # connections you can set the value to required to allow encrypted connections only. Setting
        # TransitEncryptionMode to required is a two-step process that requires you to first set the
        # TransitEncryptionMode to preferred , after that you can set TransitEncryptionMode to required .
        @[JSON::Field(key: "TransitEncryptionMode")]
        getter transit_encryption_mode : String?

        # The ID of the user group you are associating with the replication group.
        @[JSON::Field(key: "UserGroupIdsToAdd")]
        getter user_group_ids_to_add : Array(String)?

        # The ID of the user group to disassociate from the replication group, meaning the users in the group
        # no longer can access the replication group.
        @[JSON::Field(key: "UserGroupIdsToRemove")]
        getter user_group_ids_to_remove : Array(String)?

        def initialize(
          @replication_group_id : String,
          @apply_immediately : Bool? = nil,
          @auth_token : String? = nil,
          @auth_token_update_strategy : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @automatic_failover_enabled : Bool? = nil,
          @cache_node_type : String? = nil,
          @cache_parameter_group_name : String? = nil,
          @cache_security_group_names : Array(String)? = nil,
          @cluster_mode : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @ip_discovery : String? = nil,
          @log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)? = nil,
          @multi_az_enabled : Bool? = nil,
          @node_group_id : String? = nil,
          @notification_topic_arn : String? = nil,
          @notification_topic_status : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @primary_cluster_id : String? = nil,
          @remove_user_groups : Bool? = nil,
          @replication_group_description : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil,
          @snapshotting_cluster_id : String? = nil,
          @transit_encryption_enabled : Bool? = nil,
          @transit_encryption_mode : String? = nil,
          @user_group_ids_to_add : Array(String)? = nil,
          @user_group_ids_to_remove : Array(String)? = nil
        )
        end
      end

      struct ModifyReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      # Represents the input for a ModifyReplicationGroupShardConfiguration operation.
      struct ModifyReplicationGroupShardConfigurationMessage
        include JSON::Serializable

        # Indicates that the shard reconfiguration process begins immediately. At present, the only permitted
        # value for this parameter is true . Value: true
        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool

        # The number of node groups (shards) that results from the modification of the shard configuration.
        @[JSON::Field(key: "NodeGroupCount")]
        getter node_group_count : Int32

        # The name of the Valkey or Redis OSS (cluster mode enabled) cluster (replication group) on which the
        # shards are to be configured.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        # If the value of NodeGroupCount is less than the current number of node groups (shards), then either
        # NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRemove is a list of NodeGroupId s
        # to remove from the cluster. ElastiCache will attempt to remove all node groups listed by
        # NodeGroupsToRemove from the cluster.
        @[JSON::Field(key: "NodeGroupsToRemove")]
        getter node_groups_to_remove : Array(String)?

        # If the value of NodeGroupCount is less than the current number of node groups (shards), then either
        # NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRetain is a list of NodeGroupId s
        # to retain in the cluster. ElastiCache will attempt to remove all node groups except those listed by
        # NodeGroupsToRetain from the cluster.
        @[JSON::Field(key: "NodeGroupsToRetain")]
        getter node_groups_to_retain : Array(String)?

        # Specifies the preferred availability zones for each node group in the cluster. If the value of
        # NodeGroupCount is greater than the current number of node groups (shards), you can use this
        # parameter to specify the preferred availability zones of the cluster's shards. If you omit this
        # parameter ElastiCache selects availability zones for you. You can specify this parameter only if the
        # value of NodeGroupCount is greater than the current number of node groups (shards).
        @[JSON::Field(key: "ReshardingConfiguration")]
        getter resharding_configuration : Array(Types::ReshardingConfiguration)?

        def initialize(
          @apply_immediately : Bool,
          @node_group_count : Int32,
          @replication_group_id : String,
          @node_groups_to_remove : Array(String)? = nil,
          @node_groups_to_retain : Array(String)? = nil,
          @resharding_configuration : Array(Types::ReshardingConfiguration)? = nil
        )
        end
      end

      struct ModifyReplicationGroupShardConfigurationResult
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      struct ModifyServerlessCacheRequest
        include JSON::Serializable

        # User-provided identifier for the serverless cache to be modified.
        @[JSON::Field(key: "ServerlessCacheName")]
        getter serverless_cache_name : String

        # Modify the cache usage limit for the serverless cache.
        @[JSON::Field(key: "CacheUsageLimits")]
        getter cache_usage_limits : Types::CacheUsageLimits?

        # The daily time during which Elasticache begins taking a daily snapshot of the serverless cache.
        # Available for Valkey, Redis OSS and Serverless Memcached only. The default is NULL, i.e. the
        # existing snapshot time configured for the cluster is not removed.
        @[JSON::Field(key: "DailySnapshotTime")]
        getter daily_snapshot_time : String?

        # User provided description for the serverless cache. Default = NULL, i.e. the existing description is
        # not removed/modified. The description has a maximum length of 255 characters.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Modifies the engine listed in a serverless cache request. The options are redis, memcached or
        # valkey.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Modifies the engine vesion listed in a serverless cache request.
        @[JSON::Field(key: "MajorEngineVersion")]
        getter major_engine_version : String?

        # The identifier of the UserGroup to be removed from association with the Valkey and Redis OSS
        # serverless cache. Available for Valkey and Redis OSS only. Default is NULL.
        @[JSON::Field(key: "RemoveUserGroup")]
        getter remove_user_group : Bool?

        # The new list of VPC security groups to be associated with the serverless cache. Populating this list
        # means the current VPC security groups will be removed. This security group is used to authorize
        # traffic access for the VPC end-point (private-link). Default = NULL - the existing list of VPC
        # security groups is not removed.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The number of days for which Elasticache retains automatic snapshots before deleting them. Available
        # for Valkey, Redis OSS and Serverless Memcached only. Default = NULL, i.e. the existing
        # snapshot-retention-limit will not be removed or modified. The maximum value allowed is 35 days.
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The identifier of the UserGroup to be associated with the serverless cache. Available for Valkey and
        # Redis OSS only. Default is NULL - the existing UserGroup is not removed.
        @[JSON::Field(key: "UserGroupId")]
        getter user_group_id : String?

        def initialize(
          @serverless_cache_name : String,
          @cache_usage_limits : Types::CacheUsageLimits? = nil,
          @daily_snapshot_time : String? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @major_engine_version : String? = nil,
          @remove_user_group : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @user_group_id : String? = nil
        )
        end
      end

      struct ModifyServerlessCacheResponse
        include JSON::Serializable

        # The response for the attempt to modify the serverless cache.
        @[JSON::Field(key: "ServerlessCache")]
        getter serverless_cache : Types::ServerlessCache?

        def initialize(
          @serverless_cache : Types::ServerlessCache? = nil
        )
        end
      end

      struct ModifyUserGroupMessage
        include JSON::Serializable

        # The ID of the user group.
        @[JSON::Field(key: "UserGroupId")]
        getter user_group_id : String

        # Modifies the engine listed in a user group. The options are valkey or redis.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The list of user IDs to add to the user group.
        @[JSON::Field(key: "UserIdsToAdd")]
        getter user_ids_to_add : Array(String)?

        # The list of user IDs to remove from the user group.
        @[JSON::Field(key: "UserIdsToRemove")]
        getter user_ids_to_remove : Array(String)?

        def initialize(
          @user_group_id : String,
          @engine : String? = nil,
          @user_ids_to_add : Array(String)? = nil,
          @user_ids_to_remove : Array(String)? = nil
        )
        end
      end

      struct ModifyUserMessage
        include JSON::Serializable

        # The ID of the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Access permissions string used for this user.
        @[JSON::Field(key: "AccessString")]
        getter access_string : String?

        # Adds additional user permissions to the access string.
        @[JSON::Field(key: "AppendAccessString")]
        getter append_access_string : String?

        # Specifies how to authenticate the user.
        @[JSON::Field(key: "AuthenticationMode")]
        getter authentication_mode : Types::AuthenticationMode?

        # Modifies the engine listed for a user. The options are valkey or redis.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # Indicates no password is required for the user.
        @[JSON::Field(key: "NoPasswordRequired")]
        getter no_password_required : Bool?

        # The passwords belonging to the user. You are allowed up to two.
        @[JSON::Field(key: "Passwords")]
        getter passwords : Array(String)?

        def initialize(
          @user_id : String,
          @access_string : String? = nil,
          @append_access_string : String? = nil,
          @authentication_mode : Types::AuthenticationMode? = nil,
          @engine : String? = nil,
          @no_password_required : Bool? = nil,
          @passwords : Array(String)? = nil
        )
        end
      end

      # The operation was not performed because no changes were required.
      struct NoOperationFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a collection of cache nodes in a replication group. One node in the node group is the
      # read/write primary node. All the other nodes are read-only Replica nodes.
      struct NodeGroup
        include JSON::Serializable

        # The identifier for the node group (shard). A Valkey or Redis OSS (cluster mode disabled) replication
        # group contains only 1 node group; therefore, the node group ID is 0001. A Valkey or Redis OSS
        # (cluster mode enabled) replication group contains 1 to 90 node groups numbered 0001 to 0090.
        # Optionally, the user can provide the id for a node group.
        @[JSON::Field(key: "NodeGroupId")]
        getter node_group_id : String?

        # A list containing information about individual nodes within the node group (shard).
        @[JSON::Field(key: "NodeGroupMembers")]
        getter node_group_members : Array(Types::NodeGroupMember)?

        # The endpoint of the primary node in this node group (shard).
        @[JSON::Field(key: "PrimaryEndpoint")]
        getter primary_endpoint : Types::Endpoint?

        # The endpoint of the replica nodes in this node group (shard). This value is read-only.
        @[JSON::Field(key: "ReaderEndpoint")]
        getter reader_endpoint : Types::Endpoint?

        # The keyspace for this node group (shard).
        @[JSON::Field(key: "Slots")]
        getter slots : String?

        # The current state of this replication group - creating , available , modifying , deleting .
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @node_group_id : String? = nil,
          @node_group_members : Array(Types::NodeGroupMember)? = nil,
          @primary_endpoint : Types::Endpoint? = nil,
          @reader_endpoint : Types::Endpoint? = nil,
          @slots : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Node group (shard) configuration options. Each node group (shard) configuration has the following:
      # Slots , PrimaryAvailabilityZone , ReplicaAvailabilityZones , ReplicaCount .
      struct NodeGroupConfiguration
        include JSON::Serializable

        # Either the ElastiCache supplied 4-digit id or a user supplied id for the node group these
        # configuration values apply to.
        @[JSON::Field(key: "NodeGroupId")]
        getter node_group_id : String?

        # The Availability Zone where the primary node of this node group (shard) is launched.
        @[JSON::Field(key: "PrimaryAvailabilityZone")]
        getter primary_availability_zone : String?

        # The outpost ARN of the primary node.
        @[JSON::Field(key: "PrimaryOutpostArn")]
        getter primary_outpost_arn : String?

        # A list of Availability Zones to be used for the read replicas. The number of Availability Zones in
        # this list must match the value of ReplicaCount or ReplicasPerNodeGroup if not specified.
        @[JSON::Field(key: "ReplicaAvailabilityZones")]
        getter replica_availability_zones : Array(String)?

        # The number of read replica nodes in this node group (shard).
        @[JSON::Field(key: "ReplicaCount")]
        getter replica_count : Int32?

        # The outpost ARN of the node replicas.
        @[JSON::Field(key: "ReplicaOutpostArns")]
        getter replica_outpost_arns : Array(String)?

        # A string that specifies the keyspace for a particular node group. Keyspaces range from 0 to 16,383.
        # The string is in the format startkey-endkey . Example: "0-3999"
        @[JSON::Field(key: "Slots")]
        getter slots : String?

        def initialize(
          @node_group_id : String? = nil,
          @primary_availability_zone : String? = nil,
          @primary_outpost_arn : String? = nil,
          @replica_availability_zones : Array(String)? = nil,
          @replica_count : Int32? = nil,
          @replica_outpost_arns : Array(String)? = nil,
          @slots : String? = nil
        )
        end
      end

      # Represents a single node within a node group (shard).
      struct NodeGroupMember
        include JSON::Serializable

        # The ID of the cluster to which the node belongs.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The ID of the node within its cluster. A node ID is a numeric identifier (0001, 0002, etc.).
        @[JSON::Field(key: "CacheNodeId")]
        getter cache_node_id : String?

        # The role that is currently assigned to the node - primary or replica . This member is only
        # applicable for Valkey or Redis OSS (cluster mode disabled) replication groups.
        @[JSON::Field(key: "CurrentRole")]
        getter current_role : String?

        # The name of the Availability Zone in which the node is located.
        @[JSON::Field(key: "PreferredAvailabilityZone")]
        getter preferred_availability_zone : String?

        # The outpost ARN of the node group member.
        @[JSON::Field(key: "PreferredOutpostArn")]
        getter preferred_outpost_arn : String?

        # The information required for client programs to connect to a node for read operations. The read
        # endpoint is only applicable on Valkey or Redis OSS (cluster mode disabled) clusters.
        @[JSON::Field(key: "ReadEndpoint")]
        getter read_endpoint : Types::Endpoint?

        def initialize(
          @cache_cluster_id : String? = nil,
          @cache_node_id : String? = nil,
          @current_role : String? = nil,
          @preferred_availability_zone : String? = nil,
          @preferred_outpost_arn : String? = nil,
          @read_endpoint : Types::Endpoint? = nil
        )
        end
      end

      # The status of the service update on the node group member
      struct NodeGroupMemberUpdateStatus
        include JSON::Serializable

        # The cache cluster ID
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The node ID of the cache cluster
        @[JSON::Field(key: "CacheNodeId")]
        getter cache_node_id : String?

        # The deletion date of the node
        @[JSON::Field(key: "NodeDeletionDate")]
        getter node_deletion_date : Time?

        # The end date of the update for a node
        @[JSON::Field(key: "NodeUpdateEndDate")]
        getter node_update_end_date : Time?

        # Reflects whether the update was initiated by the customer or automatically applied
        @[JSON::Field(key: "NodeUpdateInitiatedBy")]
        getter node_update_initiated_by : String?

        # The date when the update is triggered
        @[JSON::Field(key: "NodeUpdateInitiatedDate")]
        getter node_update_initiated_date : Time?

        # The start date of the update for a node
        @[JSON::Field(key: "NodeUpdateStartDate")]
        getter node_update_start_date : Time?

        # The update status of the node
        @[JSON::Field(key: "NodeUpdateStatus")]
        getter node_update_status : String?

        # The date when the NodeUpdateStatus was last modified
        @[JSON::Field(key: "NodeUpdateStatusModifiedDate")]
        getter node_update_status_modified_date : Time?

        def initialize(
          @cache_cluster_id : String? = nil,
          @cache_node_id : String? = nil,
          @node_deletion_date : Time? = nil,
          @node_update_end_date : Time? = nil,
          @node_update_initiated_by : String? = nil,
          @node_update_initiated_date : Time? = nil,
          @node_update_start_date : Time? = nil,
          @node_update_status : String? = nil,
          @node_update_status_modified_date : Time? = nil
        )
        end
      end

      # The node group specified by the NodeGroupId parameter could not be found. Please verify that the
      # node group exists and that you spelled the NodeGroupId value correctly.
      struct NodeGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The status of the service update on the node group
      struct NodeGroupUpdateStatus
        include JSON::Serializable

        # The ID of the node group
        @[JSON::Field(key: "NodeGroupId")]
        getter node_group_id : String?

        # The status of the service update on the node group member
        @[JSON::Field(key: "NodeGroupMemberUpdateStatus")]
        getter node_group_member_update_status : Array(Types::NodeGroupMemberUpdateStatus)?

        def initialize(
          @node_group_id : String? = nil,
          @node_group_member_update_status : Array(Types::NodeGroupMemberUpdateStatus)? = nil
        )
        end
      end

      # The request cannot be processed because it would exceed the maximum allowed number of node groups
      # (shards) in a single replication group. The default maximum is 90
      struct NodeGroupsPerReplicationGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the allowed number of cache nodes in a
      # single cluster.
      struct NodeQuotaForClusterExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the allowed number of cache nodes per
      # customer.
      struct NodeQuotaForCustomerExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents an individual cache node in a snapshot of a cluster.
      struct NodeSnapshot
        include JSON::Serializable

        # A unique identifier for the source cluster.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The date and time when the cache node was created in the source cluster.
        @[JSON::Field(key: "CacheNodeCreateTime")]
        getter cache_node_create_time : Time?

        # The cache node identifier for the node in the source cluster.
        @[JSON::Field(key: "CacheNodeId")]
        getter cache_node_id : String?

        # The size of the cache on the source cache node.
        @[JSON::Field(key: "CacheSize")]
        getter cache_size : String?

        # The configuration for the source node group (shard).
        @[JSON::Field(key: "NodeGroupConfiguration")]
        getter node_group_configuration : Types::NodeGroupConfiguration?

        # A unique identifier for the source node group (shard).
        @[JSON::Field(key: "NodeGroupId")]
        getter node_group_id : String?

        # The date and time when the source node's metadata and cache data set was obtained for the snapshot.
        @[JSON::Field(key: "SnapshotCreateTime")]
        getter snapshot_create_time : Time?

        def initialize(
          @cache_cluster_id : String? = nil,
          @cache_node_create_time : Time? = nil,
          @cache_node_id : String? = nil,
          @cache_size : String? = nil,
          @node_group_configuration : Types::NodeGroupConfiguration? = nil,
          @node_group_id : String? = nil,
          @snapshot_create_time : Time? = nil
        )
        end
      end

      # Describes a notification topic and its status. Notification topics are used for publishing
      # ElastiCache events to subscribers using Amazon Simple Notification Service (SNS).
      struct NotificationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the topic.
        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        # The current state of the topic.
        @[JSON::Field(key: "TopicStatus")]
        getter topic_status : String?

        def initialize(
          @topic_arn : String? = nil,
          @topic_status : String? = nil
        )
        end
      end

      # Describes an individual setting that controls some aspect of ElastiCache behavior.
      struct Parameter
        include JSON::Serializable

        # The valid range of values for the parameter.
        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : String?

        # Indicates whether a change to the parameter is applied immediately or requires a reboot for the
        # change to be applied. You can force a reboot or wait until the next maintenance window's reboot. For
        # more information, see Rebooting a Cluster .
        @[JSON::Field(key: "ChangeType")]
        getter change_type : String?

        # The valid data type for the parameter.
        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # A description of the parameter.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Indicates whether ( true ) or not ( false ) the parameter can be modified. Some parameters have
        # security or operational implications that prevent them from being changed.
        @[JSON::Field(key: "IsModifiable")]
        getter is_modifiable : Bool?

        # The earliest cache engine version to which the parameter can apply.
        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # The name of the parameter.
        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        # The value of the parameter.
        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String?

        # The source of the parameter.
        @[JSON::Field(key: "Source")]
        getter source : String?

        def initialize(
          @allowed_values : String? = nil,
          @change_type : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @is_modifiable : Bool? = nil,
          @minimum_engine_version : String? = nil,
          @parameter_name : String? = nil,
          @parameter_value : String? = nil,
          @source : String? = nil
        )
        end
      end

      # Describes a name-value pair that is used to update the value of a parameter.
      struct ParameterNameValue
        include JSON::Serializable

        # The name of the parameter.
        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        # The value of the parameter.
        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String?

        def initialize(
          @parameter_name : String? = nil,
          @parameter_value : String? = nil
        )
        end
      end

      # The log delivery configurations being modified
      struct PendingLogDeliveryConfiguration
        include JSON::Serializable

        # Configuration details of either a CloudWatch Logs destination or Kinesis Data Firehose destination.
        @[JSON::Field(key: "DestinationDetails")]
        getter destination_details : Types::DestinationDetails?

        # Returns the destination type, either CloudWatch Logs or Kinesis Data Firehose.
        @[JSON::Field(key: "DestinationType")]
        getter destination_type : String?

        # Returns the log format, either JSON or TEXT
        @[JSON::Field(key: "LogFormat")]
        getter log_format : String?

        # Refers to slow-log or engine-log..
        @[JSON::Field(key: "LogType")]
        getter log_type : String?

        def initialize(
          @destination_details : Types::DestinationDetails? = nil,
          @destination_type : String? = nil,
          @log_format : String? = nil,
          @log_type : String? = nil
        )
        end
      end

      # A group of settings that are applied to the cluster in the future, or that are currently being
      # applied.
      struct PendingModifiedValues
        include JSON::Serializable

        # The auth token status
        @[JSON::Field(key: "AuthTokenStatus")]
        getter auth_token_status : String?

        # A list of cache node IDs that are being removed (or will be removed) from the cluster. A node ID is
        # a 4-digit numeric identifier (0001, 0002, etc.).
        @[JSON::Field(key: "CacheNodeIdsToRemove")]
        getter cache_node_ids_to_remove : Array(String)?

        # The cache node type that this cluster or replication group is scaled to.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The new cache engine version that the cluster runs.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The log delivery configurations being modified
        @[JSON::Field(key: "LogDeliveryConfigurations")]
        getter log_delivery_configurations : Array(Types::PendingLogDeliveryConfiguration)?

        # The new number of cache nodes for the cluster. For clusters running Valkey or Redis OSS, this value
        # must be 1. For clusters running Memcached, this value must be between 1 and 40.
        @[JSON::Field(key: "NumCacheNodes")]
        getter num_cache_nodes : Int32?

        # The scaling configuration changes that are pending for the Memcached cluster.
        @[JSON::Field(key: "ScaleConfig")]
        getter scale_config : Types::ScaleConfig?

        # A flag that enables in-transit encryption when set to true.
        @[JSON::Field(key: "TransitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        # A setting that allows you to migrate your clients to use in-transit encryption, with no downtime.
        @[JSON::Field(key: "TransitEncryptionMode")]
        getter transit_encryption_mode : String?

        def initialize(
          @auth_token_status : String? = nil,
          @cache_node_ids_to_remove : Array(String)? = nil,
          @cache_node_type : String? = nil,
          @engine_version : String? = nil,
          @log_delivery_configurations : Array(Types::PendingLogDeliveryConfiguration)? = nil,
          @num_cache_nodes : Int32? = nil,
          @scale_config : Types::ScaleConfig? = nil,
          @transit_encryption_enabled : Bool? = nil,
          @transit_encryption_mode : String? = nil
        )
        end
      end

      # Update action that has been processed for the corresponding apply/stop request
      struct ProcessedUpdateAction
        include JSON::Serializable

        # The ID of the cache cluster
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The ID of the replication group
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # The unique ID of the service update
        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String?

        # The status of the update action on the Valkey or Redis OSS cluster
        @[JSON::Field(key: "UpdateActionStatus")]
        getter update_action_status : String?

        def initialize(
          @cache_cluster_id : String? = nil,
          @replication_group_id : String? = nil,
          @service_update_name : String? = nil,
          @update_action_status : String? = nil
        )
        end
      end

      # Represents the input of a PurchaseReservedCacheNodesOffering operation.
      struct PurchaseReservedCacheNodesOfferingMessage
        include JSON::Serializable

        # The ID of the reserved cache node offering to purchase. Example:
        # 438012d3-4052-4cc7-b2e3-8d3372e0e706
        @[JSON::Field(key: "ReservedCacheNodesOfferingId")]
        getter reserved_cache_nodes_offering_id : String

        # The number of cache node instances to reserve. Default: 1
        @[JSON::Field(key: "CacheNodeCount")]
        getter cache_node_count : Int32?

        # A customer-specified identifier to track this reservation. The Reserved Cache Node ID is an unique
        # customer-specified identifier to track this reservation. If this parameter is not specified,
        # ElastiCache automatically generates an identifier for the reservation. Example: myreservationID
        @[JSON::Field(key: "ReservedCacheNodeId")]
        getter reserved_cache_node_id : String?

        # A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be
        # accompanied by a tag value, although null is accepted.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @reserved_cache_nodes_offering_id : String,
          @cache_node_count : Int32? = nil,
          @reserved_cache_node_id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PurchaseReservedCacheNodesOfferingResult
        include JSON::Serializable

        @[JSON::Field(key: "ReservedCacheNode")]
        getter reserved_cache_node : Types::ReservedCacheNode?

        def initialize(
          @reserved_cache_node : Types::ReservedCacheNode? = nil
        )
        end
      end

      struct RebalanceSlotsInGlobalReplicationGroupMessage
        include JSON::Serializable

        # If True , redistribution is applied immediately.
        @[JSON::Field(key: "ApplyImmediately")]
        getter apply_immediately : Bool

        # The name of the Global datastore
        @[JSON::Field(key: "GlobalReplicationGroupId")]
        getter global_replication_group_id : String

        def initialize(
          @apply_immediately : Bool,
          @global_replication_group_id : String
        )
        end
      end

      struct RebalanceSlotsInGlobalReplicationGroupResult
        include JSON::Serializable

        @[JSON::Field(key: "GlobalReplicationGroup")]
        getter global_replication_group : Types::GlobalReplicationGroup?

        def initialize(
          @global_replication_group : Types::GlobalReplicationGroup? = nil
        )
        end
      end

      # Represents the input of a RebootCacheCluster operation.
      struct RebootCacheClusterMessage
        include JSON::Serializable

        # The cluster identifier. This parameter is stored as a lowercase string.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String

        # A list of cache node IDs to reboot. A node ID is a numeric identifier (0001, 0002, etc.). To reboot
        # an entire cluster, specify all of the cache node IDs.
        @[JSON::Field(key: "CacheNodeIdsToReboot")]
        getter cache_node_ids_to_reboot : Array(String)

        def initialize(
          @cache_cluster_id : String,
          @cache_node_ids_to_reboot : Array(String)
        )
        end
      end

      struct RebootCacheClusterResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheCluster")]
        getter cache_cluster : Types::CacheCluster?

        def initialize(
          @cache_cluster : Types::CacheCluster? = nil
        )
        end
      end

      # Contains the specific price and frequency of a recurring charges for a reserved cache node, or for a
      # reserved cache node offering.
      struct RecurringCharge
        include JSON::Serializable

        # The monetary amount of the recurring charge.
        @[JSON::Field(key: "RecurringChargeAmount")]
        getter recurring_charge_amount : Float64?

        # The frequency of the recurring charge.
        @[JSON::Field(key: "RecurringChargeFrequency")]
        getter recurring_charge_frequency : String?

        def initialize(
          @recurring_charge_amount : Float64? = nil,
          @recurring_charge_frequency : String? = nil
        )
        end
      end

      # A list of the replication groups
      struct RegionalConfiguration
        include JSON::Serializable

        # The name of the secondary cluster
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        # The Amazon region where the cluster is stored
        @[JSON::Field(key: "ReplicationGroupRegion")]
        getter replication_group_region : String

        # A list of PreferredAvailabilityZones objects that specifies the configuration of a node group in the
        # resharded cluster.
        @[JSON::Field(key: "ReshardingConfiguration")]
        getter resharding_configuration : Array(Types::ReshardingConfiguration)

        def initialize(
          @replication_group_id : String,
          @replication_group_region : String,
          @resharding_configuration : Array(Types::ReshardingConfiguration)
        )
        end
      end

      # Represents the input of a RemoveTagsFromResource operation.
      struct RemoveTagsFromResourceMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which you want the tags removed, for example
        # arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster or
        # arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot . For more information about ARNs, see
        # Amazon Resource Names (ARNs) and Amazon Service Namespaces .
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # A list of TagKeys identifying the tags you want removed from the named resource.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_name : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Contains all of the attributes of a specific Valkey or Redis OSS replication group.
      struct ReplicationGroup
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the replication group.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A flag that enables encryption at-rest when set to true . You cannot modify the value of
        # AtRestEncryptionEnabled after the cluster is created. To enable encryption at-rest on a cluster you
        # must set AtRestEncryptionEnabled to true when you create a cluster. Required: Only available when
        # creating a replication group in an Amazon VPC using Redis OSS version 3.2.6 , 4.x or later. Default:
        # false
        @[JSON::Field(key: "AtRestEncryptionEnabled")]
        getter at_rest_encryption_enabled : Bool?

        # A flag that enables using an AuthToken (password) when issuing Valkey or Redis OSS commands.
        # Default: false
        @[JSON::Field(key: "AuthTokenEnabled")]
        getter auth_token_enabled : Bool?

        # The date the auth token was last modified
        @[JSON::Field(key: "AuthTokenLastModifiedDate")]
        getter auth_token_last_modified_date : Time?

        # If you are running Valkey 7.2 and above, or Redis OSS engine version 6.0 and above, set this
        # parameter to yes if you want to opt-in to the next auto minor version upgrade campaign. This
        # parameter is disabled for previous versions.
        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Indicates the status of automatic failover for this Valkey or Redis OSS replication group.
        @[JSON::Field(key: "AutomaticFailover")]
        getter automatic_failover : String?

        # The name of the compute and memory capacity node type for each node in the replication group.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # A flag indicating whether or not this replication group is cluster enabled; i.e., whether its data
        # can be partitioned across multiple shards (API/CLI: node groups). Valid values: true | false
        @[JSON::Field(key: "ClusterEnabled")]
        getter cluster_enabled : Bool?

        # Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you must first set the cluster
        # mode to Compatible. Compatible mode allows your Valkey or Redis OSS clients to connect using both
        # cluster mode enabled and cluster mode disabled. After you migrate all Valkey or Redis OSS clients to
        # use cluster mode enabled, you can then complete cluster mode configuration and set the cluster mode
        # to Enabled.
        @[JSON::Field(key: "ClusterMode")]
        getter cluster_mode : String?

        # The configuration endpoint for this replication group. Use the configuration endpoint to connect to
        # this replication group.
        @[JSON::Field(key: "ConfigurationEndpoint")]
        getter configuration_endpoint : Types::Endpoint?

        # Enables data tiering. Data tiering is only supported for replication groups using the r6gd node
        # type. This parameter must be set to true when using r6gd nodes. For more information, see Data
        # tiering .
        @[JSON::Field(key: "DataTiering")]
        getter data_tiering : String?

        # The user supplied description of the replication group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The engine used in a replication group. The options are redis, memcached or valkey.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The name of the Global datastore and role of this replication group in the Global datastore.
        @[JSON::Field(key: "GlobalReplicationGroupInfo")]
        getter global_replication_group_info : Types::GlobalReplicationGroupInfo?

        # The network type you choose when modifying a cluster, either ipv4 | ipv6 . IPv6 is supported for
        # workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 or Memcached engine
        # version 1.6.6 and above on all instances built on the Nitro system .
        @[JSON::Field(key: "IpDiscovery")]
        getter ip_discovery : String?

        # The ID of the KMS key used to encrypt the disk in the cluster.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Returns the destination, format and type of the logs.
        @[JSON::Field(key: "LogDeliveryConfigurations")]
        getter log_delivery_configurations : Array(Types::LogDeliveryConfiguration)?

        # The names of all the cache clusters that are part of this replication group.
        @[JSON::Field(key: "MemberClusters")]
        getter member_clusters : Array(String)?

        # The outpost ARNs of the replication group's member clusters.
        @[JSON::Field(key: "MemberClustersOutpostArns")]
        getter member_clusters_outpost_arns : Array(String)?

        # A flag indicating if you have Multi-AZ enabled to enhance fault tolerance. For more information, see
        # Minimizing Downtime: Multi-AZ
        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : String?

        # Must be either ipv4 | ipv6 | dual_stack . IPv6 is supported for workloads using Valkey 7.2 and
        # above, Redis OSS engine version 6.2 to 7.1 or Memcached engine version 1.6.6 and above on all
        # instances built on the Nitro system .
        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # A list of node groups in this replication group. For Valkey or Redis OSS (cluster mode disabled)
        # replication groups, this is a single-element list. For Valkey or Redis OSS (cluster mode enabled)
        # replication groups, the list contains an entry for each node group (shard).
        @[JSON::Field(key: "NodeGroups")]
        getter node_groups : Array(Types::NodeGroup)?

        # A group of settings to be applied to the replication group, either immediately or during the next
        # maintenance window.
        @[JSON::Field(key: "PendingModifiedValues")]
        getter pending_modified_values : Types::ReplicationGroupPendingModifiedValues?

        # The date and time when the cluster was created.
        @[JSON::Field(key: "ReplicationGroupCreateTime")]
        getter replication_group_create_time : Time?

        # The identifier for the replication group.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # The number of days for which ElastiCache retains automatic cluster snapshots before deleting them.
        # For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is retained for
        # 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are
        # turned off.
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node
        # group (shard). Example: 05:00-09:00 If you do not specify this parameter, ElastiCache automatically
        # chooses an appropriate time range. This parameter is only valid if the Engine parameter is redis .
        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # The cluster ID that is used as the daily snapshot source for the replication group.
        @[JSON::Field(key: "SnapshottingClusterId")]
        getter snapshotting_cluster_id : String?

        # The current state of this replication group - creating , available , modifying , deleting ,
        # create-failed , snapshotting .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A flag that enables in-transit encryption when set to true . Required: Only available when creating
        # a replication group in an Amazon VPC using Redis OSS version 3.2.6 , 4.x or later. Default: false
        @[JSON::Field(key: "TransitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        # A setting that allows you to migrate your clients to use in-transit encryption, with no downtime.
        @[JSON::Field(key: "TransitEncryptionMode")]
        getter transit_encryption_mode : String?

        # The ID of the user group associated to the replication group.
        @[JSON::Field(key: "UserGroupIds")]
        getter user_group_ids : Array(String)?

        def initialize(
          @arn : String? = nil,
          @at_rest_encryption_enabled : Bool? = nil,
          @auth_token_enabled : Bool? = nil,
          @auth_token_last_modified_date : Time? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @automatic_failover : String? = nil,
          @cache_node_type : String? = nil,
          @cluster_enabled : Bool? = nil,
          @cluster_mode : String? = nil,
          @configuration_endpoint : Types::Endpoint? = nil,
          @data_tiering : String? = nil,
          @description : String? = nil,
          @engine : String? = nil,
          @global_replication_group_info : Types::GlobalReplicationGroupInfo? = nil,
          @ip_discovery : String? = nil,
          @kms_key_id : String? = nil,
          @log_delivery_configurations : Array(Types::LogDeliveryConfiguration)? = nil,
          @member_clusters : Array(String)? = nil,
          @member_clusters_outpost_arns : Array(String)? = nil,
          @multi_az : String? = nil,
          @network_type : String? = nil,
          @node_groups : Array(Types::NodeGroup)? = nil,
          @pending_modified_values : Types::ReplicationGroupPendingModifiedValues? = nil,
          @replication_group_create_time : Time? = nil,
          @replication_group_id : String? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_window : String? = nil,
          @snapshotting_cluster_id : String? = nil,
          @status : String? = nil,
          @transit_encryption_enabled : Bool? = nil,
          @transit_encryption_mode : String? = nil,
          @user_group_ids : Array(String)? = nil
        )
        end
      end

      # The specified replication group already exists.
      struct ReplicationGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The targeted replication group is not available.
      struct ReplicationGroupAlreadyUnderMigrationFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of a DescribeReplicationGroups operation.
      struct ReplicationGroupMessage
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of replication groups. Each item in the list contains detailed information about one
        # replication group.
        @[JSON::Field(key: "ReplicationGroups")]
        getter replication_groups : Array(Types::ReplicationGroup)?

        def initialize(
          @marker : String? = nil,
          @replication_groups : Array(Types::ReplicationGroup)? = nil
        )
        end
      end

      # The specified replication group does not exist.
      struct ReplicationGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The designated replication group is not available for data migration.
      struct ReplicationGroupNotUnderMigrationFault
        include JSON::Serializable

        def initialize
        end
      end

      # The settings to be applied to the Valkey or Redis OSS replication group, either immediately or
      # during the next maintenance window.
      struct ReplicationGroupPendingModifiedValues
        include JSON::Serializable

        # The auth token status
        @[JSON::Field(key: "AuthTokenStatus")]
        getter auth_token_status : String?

        # Indicates the status of automatic failover for this Valkey or Redis OSS replication group.
        @[JSON::Field(key: "AutomaticFailoverStatus")]
        getter automatic_failover_status : String?

        # Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you must first set the cluster
        # mode to Compatible. Compatible mode allows your Valkey or Redis OSS clients to connect using both
        # cluster mode enabled and cluster mode disabled. After you migrate all Valkey or Redis OSS clients to
        # use cluster mode enabled, you can then complete cluster mode configuration and set the cluster mode
        # to Enabled.
        @[JSON::Field(key: "ClusterMode")]
        getter cluster_mode : String?

        # The log delivery configurations being modified
        @[JSON::Field(key: "LogDeliveryConfigurations")]
        getter log_delivery_configurations : Array(Types::PendingLogDeliveryConfiguration)?

        # The primary cluster ID that is applied immediately (if --apply-immediately was specified), or during
        # the next maintenance window.
        @[JSON::Field(key: "PrimaryClusterId")]
        getter primary_cluster_id : String?

        # The status of an online resharding operation.
        @[JSON::Field(key: "Resharding")]
        getter resharding : Types::ReshardingStatus?

        # A flag that enables in-transit encryption when set to true.
        @[JSON::Field(key: "TransitEncryptionEnabled")]
        getter transit_encryption_enabled : Bool?

        # A setting that allows you to migrate your clients to use in-transit encryption, with no downtime.
        @[JSON::Field(key: "TransitEncryptionMode")]
        getter transit_encryption_mode : String?

        # The user group being modified.
        @[JSON::Field(key: "UserGroups")]
        getter user_groups : Types::UserGroupsUpdateStatus?

        def initialize(
          @auth_token_status : String? = nil,
          @automatic_failover_status : String? = nil,
          @cluster_mode : String? = nil,
          @log_delivery_configurations : Array(Types::PendingLogDeliveryConfiguration)? = nil,
          @primary_cluster_id : String? = nil,
          @resharding : Types::ReshardingStatus? = nil,
          @transit_encryption_enabled : Bool? = nil,
          @transit_encryption_mode : String? = nil,
          @user_groups : Types::UserGroupsUpdateStatus? = nil
        )
        end
      end

      # Represents the output of a PurchaseReservedCacheNodesOffering operation.
      struct ReservedCacheNode
        include JSON::Serializable

        # The number of cache nodes that have been reserved.
        @[JSON::Field(key: "CacheNodeCount")]
        getter cache_node_count : Int32?

        # The cache node type for the reserved cache nodes. The following node types are supported by
        # ElastiCache. Generally speaking, the current generation types provide more memory and computational
        # power at lower cost when compared to their equivalent previous generation counterparts. General
        # purpose: Current generation: M7g node types : cache.m7g.large , cache.m7g.xlarge , cache.m7g.2xlarge
        # , cache.m7g.4xlarge , cache.m7g.8xlarge , cache.m7g.12xlarge , cache.m7g.16xlarge For region
        # availability, see Supported Node Types M6g node types (available only for Redis OSS engine version
        # 5.0.6 onward and for Memcached engine version 1.5.16 onward): cache.m6g.large , cache.m6g.xlarge ,
        # cache.m6g.2xlarge , cache.m6g.4xlarge , cache.m6g.8xlarge , cache.m6g.12xlarge , cache.m6g.16xlarge
        # M5 node types: cache.m5.large , cache.m5.xlarge , cache.m5.2xlarge , cache.m5.4xlarge ,
        # cache.m5.12xlarge , cache.m5.24xlarge M4 node types: cache.m4.large , cache.m4.xlarge ,
        # cache.m4.2xlarge , cache.m4.4xlarge , cache.m4.10xlarge T4g node types (available only for Redis OSS
        # engine version 5.0.6 onward and Memcached engine version 1.5.16 onward): cache.t4g.micro ,
        # cache.t4g.small , cache.t4g.medium T3 node types: cache.t3.micro , cache.t3.small , cache.t3.medium
        # T2 node types: cache.t2.micro , cache.t2.small , cache.t2.medium Previous generation: (not
        # recommended. Existing clusters are still supported but creation of new clusters is not supported for
        # these types.) T1 node types: cache.t1.micro M1 node types: cache.m1.small , cache.m1.medium ,
        # cache.m1.large , cache.m1.xlarge M3 node types: cache.m3.medium , cache.m3.large , cache.m3.xlarge ,
        # cache.m3.2xlarge Compute optimized: Previous generation: (not recommended. Existing clusters are
        # still supported but creation of new clusters is not supported for these types.) C1 node types:
        # cache.c1.xlarge Memory optimized: Current generation: R7g node types : cache.r7g.large ,
        # cache.r7g.xlarge , cache.r7g.2xlarge , cache.r7g.4xlarge , cache.r7g.8xlarge , cache.r7g.12xlarge ,
        # cache.r7g.16xlarge For region availability, see Supported Node Types R6g node types (available only
        # for Redis OSS engine version 5.0.6 onward and for Memcached engine version 1.5.16 onward):
        # cache.r6g.large , cache.r6g.xlarge , cache.r6g.2xlarge , cache.r6g.4xlarge , cache.r6g.8xlarge ,
        # cache.r6g.12xlarge , cache.r6g.16xlarge R5 node types: cache.r5.large , cache.r5.xlarge ,
        # cache.r5.2xlarge , cache.r5.4xlarge , cache.r5.12xlarge , cache.r5.24xlarge R4 node types:
        # cache.r4.large , cache.r4.xlarge , cache.r4.2xlarge , cache.r4.4xlarge , cache.r4.8xlarge ,
        # cache.r4.16xlarge Previous generation: (not recommended. Existing clusters are still supported but
        # creation of new clusters is not supported for these types.) M2 node types: cache.m2.xlarge ,
        # cache.m2.2xlarge , cache.m2.4xlarge R3 node types: cache.r3.large , cache.r3.xlarge ,
        # cache.r3.2xlarge , cache.r3.4xlarge , cache.r3.8xlarge Additional node type info All current
        # generation instance types are created in Amazon VPC by default. Valkey or Redis OSS append-only
        # files (AOF) are not supported for T1 or T2 instances. Valkey or Redis OSS Multi-AZ with automatic
        # failover is not supported on T1 instances. The configuration variables appendonly and appendfsync
        # are not supported on Valkey, or on Redis OSS version 2.8.22 and later.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The duration of the reservation in seconds.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The fixed price charged for this reserved cache node.
        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # The offering type of this reserved cache node.
        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The description of the reserved cache node.
        @[JSON::Field(key: "ProductDescription")]
        getter product_description : String?

        # The recurring price charged to run this reserved cache node.
        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # The Amazon Resource Name (ARN) of the reserved cache node. Example:
        # arn:aws:elasticache:us-east-1:123456789012:reserved-instance:ri-2017-03-27-08-33-25-582
        @[JSON::Field(key: "ReservationARN")]
        getter reservation_arn : String?

        # The unique identifier for the reservation.
        @[JSON::Field(key: "ReservedCacheNodeId")]
        getter reserved_cache_node_id : String?

        # The offering identifier.
        @[JSON::Field(key: "ReservedCacheNodesOfferingId")]
        getter reserved_cache_nodes_offering_id : String?

        # The time the reservation started.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The state of the reserved cache node.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The hourly price charged for this reserved cache node.
        @[JSON::Field(key: "UsagePrice")]
        getter usage_price : Float64?

        def initialize(
          @cache_node_count : Int32? = nil,
          @cache_node_type : String? = nil,
          @duration : Int32? = nil,
          @fixed_price : Float64? = nil,
          @offering_type : String? = nil,
          @product_description : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reservation_arn : String? = nil,
          @reserved_cache_node_id : String? = nil,
          @reserved_cache_nodes_offering_id : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # You already have a reservation with the given identifier.
      struct ReservedCacheNodeAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of a DescribeReservedCacheNodes operation.
      struct ReservedCacheNodeMessage
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of reserved cache nodes. Each element in the list contains detailed information about one
        # node.
        @[JSON::Field(key: "ReservedCacheNodes")]
        getter reserved_cache_nodes : Array(Types::ReservedCacheNode)?

        def initialize(
          @marker : String? = nil,
          @reserved_cache_nodes : Array(Types::ReservedCacheNode)? = nil
        )
        end
      end

      # The requested reserved cache node was not found.
      struct ReservedCacheNodeNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the user's cache node quota.
      struct ReservedCacheNodeQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # Describes all of the attributes of a reserved cache node offering.
      struct ReservedCacheNodesOffering
        include JSON::Serializable

        # The cache node type for the reserved cache node. The following node types are supported by
        # ElastiCache. Generally speaking, the current generation types provide more memory and computational
        # power at lower cost when compared to their equivalent previous generation counterparts. General
        # purpose: Current generation: M7g node types : cache.m7g.large , cache.m7g.xlarge , cache.m7g.2xlarge
        # , cache.m7g.4xlarge , cache.m7g.8xlarge , cache.m7g.12xlarge , cache.m7g.16xlarge For region
        # availability, see Supported Node Types M6g node types (available only for Redis OSS engine version
        # 5.0.6 onward and for Memcached engine version 1.5.16 onward): cache.m6g.large , cache.m6g.xlarge ,
        # cache.m6g.2xlarge , cache.m6g.4xlarge , cache.m6g.8xlarge , cache.m6g.12xlarge , cache.m6g.16xlarge
        # M5 node types: cache.m5.large , cache.m5.xlarge , cache.m5.2xlarge , cache.m5.4xlarge ,
        # cache.m5.12xlarge , cache.m5.24xlarge M4 node types: cache.m4.large , cache.m4.xlarge ,
        # cache.m4.2xlarge , cache.m4.4xlarge , cache.m4.10xlarge T4g node types (available only for Redis OSS
        # engine version 5.0.6 onward and Memcached engine version 1.5.16 onward): cache.t4g.micro ,
        # cache.t4g.small , cache.t4g.medium T3 node types: cache.t3.micro , cache.t3.small , cache.t3.medium
        # T2 node types: cache.t2.micro , cache.t2.small , cache.t2.medium Previous generation: (not
        # recommended. Existing clusters are still supported but creation of new clusters is not supported for
        # these types.) T1 node types: cache.t1.micro M1 node types: cache.m1.small , cache.m1.medium ,
        # cache.m1.large , cache.m1.xlarge M3 node types: cache.m3.medium , cache.m3.large , cache.m3.xlarge ,
        # cache.m3.2xlarge Compute optimized: Previous generation: (not recommended. Existing clusters are
        # still supported but creation of new clusters is not supported for these types.) C1 node types:
        # cache.c1.xlarge Memory optimized: Current generation: R7g node types : cache.r7g.large ,
        # cache.r7g.xlarge , cache.r7g.2xlarge , cache.r7g.4xlarge , cache.r7g.8xlarge , cache.r7g.12xlarge ,
        # cache.r7g.16xlarge For region availability, see Supported Node Types R6g node types (available only
        # for Redis OSS engine version 5.0.6 onward and for Memcached engine version 1.5.16 onward):
        # cache.r6g.large , cache.r6g.xlarge , cache.r6g.2xlarge , cache.r6g.4xlarge , cache.r6g.8xlarge ,
        # cache.r6g.12xlarge , cache.r6g.16xlarge R5 node types: cache.r5.large , cache.r5.xlarge ,
        # cache.r5.2xlarge , cache.r5.4xlarge , cache.r5.12xlarge , cache.r5.24xlarge R4 node types:
        # cache.r4.large , cache.r4.xlarge , cache.r4.2xlarge , cache.r4.4xlarge , cache.r4.8xlarge ,
        # cache.r4.16xlarge Previous generation: (not recommended. Existing clusters are still supported but
        # creation of new clusters is not supported for these types.) M2 node types: cache.m2.xlarge ,
        # cache.m2.2xlarge , cache.m2.4xlarge R3 node types: cache.r3.large , cache.r3.xlarge ,
        # cache.r3.2xlarge , cache.r3.4xlarge , cache.r3.8xlarge Additional node type info All current
        # generation instance types are created in Amazon VPC by default. Valkey or Redis OSS append-only
        # files (AOF) are not supported for T1 or T2 instances. Valkey or Redis OSS Multi-AZ with automatic
        # failover is not supported on T1 instances. The configuration variables appendonly and appendfsync
        # are not supported on Valkey, or on Redis OSS version 2.8.22 and later.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The duration of the offering. in seconds.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The fixed price charged for this offering.
        @[JSON::Field(key: "FixedPrice")]
        getter fixed_price : Float64?

        # The offering type.
        @[JSON::Field(key: "OfferingType")]
        getter offering_type : String?

        # The cache engine used by the offering.
        @[JSON::Field(key: "ProductDescription")]
        getter product_description : String?

        # The recurring price charged to run this reserved cache node.
        @[JSON::Field(key: "RecurringCharges")]
        getter recurring_charges : Array(Types::RecurringCharge)?

        # A unique identifier for the reserved cache node offering.
        @[JSON::Field(key: "ReservedCacheNodesOfferingId")]
        getter reserved_cache_nodes_offering_id : String?

        # The hourly price charged for this offering.
        @[JSON::Field(key: "UsagePrice")]
        getter usage_price : Float64?

        def initialize(
          @cache_node_type : String? = nil,
          @duration : Int32? = nil,
          @fixed_price : Float64? = nil,
          @offering_type : String? = nil,
          @product_description : String? = nil,
          @recurring_charges : Array(Types::RecurringCharge)? = nil,
          @reserved_cache_nodes_offering_id : String? = nil,
          @usage_price : Float64? = nil
        )
        end
      end

      # Represents the output of a DescribeReservedCacheNodesOfferings operation.
      struct ReservedCacheNodesOfferingMessage
        include JSON::Serializable

        # Provides an identifier to allow retrieval of paginated results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of reserved cache node offerings. Each element in the list contains detailed information
        # about one offering.
        @[JSON::Field(key: "ReservedCacheNodesOfferings")]
        getter reserved_cache_nodes_offerings : Array(Types::ReservedCacheNodesOffering)?

        def initialize(
          @marker : String? = nil,
          @reserved_cache_nodes_offerings : Array(Types::ReservedCacheNodesOffering)? = nil
        )
        end
      end

      # The requested cache node offering does not exist.
      struct ReservedCacheNodesOfferingNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of a ResetCacheParameterGroup operation.
      struct ResetCacheParameterGroupMessage
        include JSON::Serializable

        # The name of the cache parameter group to reset.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String

        # An array of parameter names to reset to their default values. If ResetAllParameters is true , do not
        # use ParameterNameValues . If ResetAllParameters is false , you must specify the name of at least one
        # parameter to reset.
        @[JSON::Field(key: "ParameterNameValues")]
        getter parameter_name_values : Array(Types::ParameterNameValue)?

        # If true , all parameters in the cache parameter group are reset to their default values. If false ,
        # only the parameters listed by ParameterNameValues are reset to their default values. Valid values:
        # true | false
        @[JSON::Field(key: "ResetAllParameters")]
        getter reset_all_parameters : Bool?

        def initialize(
          @cache_parameter_group_name : String,
          @parameter_name_values : Array(Types::ParameterNameValue)? = nil,
          @reset_all_parameters : Bool? = nil
        )
        end
      end

      # A list of PreferredAvailabilityZones objects that specifies the configuration of a node group in the
      # resharded cluster.
      struct ReshardingConfiguration
        include JSON::Serializable

        # Either the ElastiCache supplied 4-digit id or a user supplied id for the node group these
        # configuration values apply to.
        @[JSON::Field(key: "NodeGroupId")]
        getter node_group_id : String?

        # A list of preferred availability zones for the nodes in this cluster.
        @[JSON::Field(key: "PreferredAvailabilityZones")]
        getter preferred_availability_zones : Array(String)?

        def initialize(
          @node_group_id : String? = nil,
          @preferred_availability_zones : Array(String)? = nil
        )
        end
      end

      # The status of an online resharding operation.
      struct ReshardingStatus
        include JSON::Serializable

        # Represents the progress of an online resharding operation.
        @[JSON::Field(key: "SlotMigration")]
        getter slot_migration : Types::SlotMigration?

        def initialize(
          @slot_migration : Types::SlotMigration? = nil
        )
        end
      end

      # Represents the input of a RevokeCacheSecurityGroupIngress operation.
      struct RevokeCacheSecurityGroupIngressMessage
        include JSON::Serializable

        # The name of the cache security group to revoke ingress from.
        @[JSON::Field(key: "CacheSecurityGroupName")]
        getter cache_security_group_name : String

        # The name of the Amazon EC2 security group to revoke access from.
        @[JSON::Field(key: "EC2SecurityGroupName")]
        getter ec2_security_group_name : String

        # The Amazon account number of the Amazon EC2 security group owner. Note that this is not the same
        # thing as an Amazon access key ID - you must provide a valid Amazon account number for this
        # parameter.
        @[JSON::Field(key: "EC2SecurityGroupOwnerId")]
        getter ec2_security_group_owner_id : String

        def initialize(
          @cache_security_group_name : String,
          @ec2_security_group_name : String,
          @ec2_security_group_owner_id : String
        )
        end
      end

      struct RevokeCacheSecurityGroupIngressResult
        include JSON::Serializable

        @[JSON::Field(key: "CacheSecurityGroup")]
        getter cache_security_group : Types::CacheSecurityGroup?

        def initialize(
          @cache_security_group : Types::CacheSecurityGroup? = nil
        )
        end
      end

      # Configuration settings for horizontal or vertical scaling operations on Memcached clusters.
      struct ScaleConfig
        include JSON::Serializable

        # The time interval in seconds between scaling operations when performing gradual scaling for a
        # Memcached cluster.
        @[JSON::Field(key: "ScaleIntervalMinutes")]
        getter scale_interval_minutes : Int32?

        # The percentage by which to scale the Memcached cluster, either horizontally by adding nodes or
        # vertically by increasing resources.
        @[JSON::Field(key: "ScalePercentage")]
        getter scale_percentage : Int32?

        def initialize(
          @scale_interval_minutes : Int32? = nil,
          @scale_percentage : Int32? = nil
        )
        end
      end

      # Represents a single cache security group and its status.
      struct SecurityGroupMembership
        include JSON::Serializable

        # The identifier of the cache security group.
        @[JSON::Field(key: "SecurityGroupId")]
        getter security_group_id : String?

        # The status of the cache security group membership. The status changes whenever a cache security
        # group is modified, or when the cache security groups assigned to a cluster are modified.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @security_group_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The resource representing a serverless cache.
      struct ServerlessCache
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the serverless cache.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The cache usage limit for the serverless cache.
        @[JSON::Field(key: "CacheUsageLimits")]
        getter cache_usage_limits : Types::CacheUsageLimits?

        # When the serverless cache was created.
        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time?

        # The daily time that a cache snapshot will be created. Default is NULL, i.e. snapshots will not be
        # created at a specific time on a daily basis. Available for Valkey, Redis OSS and Serverless
        # Memcached only.
        @[JSON::Field(key: "DailySnapshotTime")]
        getter daily_snapshot_time : String?

        # A description of the serverless cache.
        @[JSON::Field(key: "Description")]
        getter description : String?

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : Types::Endpoint?

        # The engine the serverless cache is compatible with.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The name and version number of the engine the serverless cache is compatible with.
        @[JSON::Field(key: "FullEngineVersion")]
        getter full_engine_version : String?

        # The ID of the Amazon Web Services Key Management Service (KMS) key that is used to encrypt data at
        # rest in the serverless cache.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The version number of the engine the serverless cache is compatible with.
        @[JSON::Field(key: "MajorEngineVersion")]
        getter major_engine_version : String?

        @[JSON::Field(key: "ReaderEndpoint")]
        getter reader_endpoint : Types::Endpoint?

        # The IDs of the EC2 security groups associated with the serverless cache.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The unique identifier of the serverless cache.
        @[JSON::Field(key: "ServerlessCacheName")]
        getter serverless_cache_name : String?

        # The current setting for the number of serverless cache snapshots the system will retain. Available
        # for Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # The current status of the serverless cache. The allowed values are CREATING, AVAILABLE, DELETING,
        # CREATE-FAILED and MODIFYING.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # If no subnet IDs are given and your VPC is in us-west-1, then ElastiCache will select 2 default
        # subnets across AZs in your VPC. For all other Regions, if no subnet IDs are given then ElastiCache
        # will select 3 default subnets across AZs in your default VPC.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The identifier of the user group associated with the serverless cache. Available for Valkey and
        # Redis OSS only. Default is NULL.
        @[JSON::Field(key: "UserGroupId")]
        getter user_group_id : String?

        def initialize(
          @arn : String? = nil,
          @cache_usage_limits : Types::CacheUsageLimits? = nil,
          @create_time : Time? = nil,
          @daily_snapshot_time : String? = nil,
          @description : String? = nil,
          @endpoint : Types::Endpoint? = nil,
          @engine : String? = nil,
          @full_engine_version : String? = nil,
          @kms_key_id : String? = nil,
          @major_engine_version : String? = nil,
          @reader_endpoint : Types::Endpoint? = nil,
          @security_group_ids : Array(String)? = nil,
          @serverless_cache_name : String? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @status : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @user_group_id : String? = nil
        )
        end
      end

      # A serverless cache with this name already exists.
      struct ServerlessCacheAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration settings for a specific serverless cache.
      struct ServerlessCacheConfiguration
        include JSON::Serializable

        # The engine that the serverless cache is configured with.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The engine version number that the serverless cache is configured with.
        @[JSON::Field(key: "MajorEngineVersion")]
        getter major_engine_version : String?

        # The identifier of a serverless cache.
        @[JSON::Field(key: "ServerlessCacheName")]
        getter serverless_cache_name : String?

        def initialize(
          @engine : String? = nil,
          @major_engine_version : String? = nil,
          @serverless_cache_name : String? = nil
        )
        end
      end

      # The serverless cache was not found or does not exist.
      struct ServerlessCacheNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The number of serverless caches exceeds the customer quota.
      struct ServerlessCacheQuotaForCustomerExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The resource representing a serverless cache snapshot. Available for Valkey, Redis OSS and
      # Serverless Memcached only.
      struct ServerlessCacheSnapshot
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a serverless cache snapshot. Available for Valkey, Redis OSS and
        # Serverless Memcached only.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The total size of a serverless cache snapshot, in bytes. Available for Valkey, Redis OSS and
        # Serverless Memcached only.
        @[JSON::Field(key: "BytesUsedForCache")]
        getter bytes_used_for_cache : String?

        # The date and time that the source serverless cache's metadata and cache data set was obtained for
        # the snapshot. Available for Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "CreateTime")]
        getter create_time : Time?

        # The time that the serverless cache snapshot will expire. Available for Valkey, Redis OSS and
        # Serverless Memcached only.
        @[JSON::Field(key: "ExpiryTime")]
        getter expiry_time : Time?

        # The ID of the Amazon Web Services Key Management Service (KMS) key of a serverless cache snapshot.
        # Available for Valkey, Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The configuration of the serverless cache, at the time the snapshot was taken. Available for Valkey,
        # Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "ServerlessCacheConfiguration")]
        getter serverless_cache_configuration : Types::ServerlessCacheConfiguration?

        # The identifier of a serverless cache snapshot. Available for Valkey, Redis OSS and Serverless
        # Memcached only.
        @[JSON::Field(key: "ServerlessCacheSnapshotName")]
        getter serverless_cache_snapshot_name : String?

        # The type of snapshot of serverless cache. Available for Valkey, Redis OSS and Serverless Memcached
        # only.
        @[JSON::Field(key: "SnapshotType")]
        getter snapshot_type : String?

        # The current status of the serverless cache. Available for Valkey, Redis OSS and Serverless Memcached
        # only.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @bytes_used_for_cache : String? = nil,
          @create_time : Time? = nil,
          @expiry_time : Time? = nil,
          @kms_key_id : String? = nil,
          @serverless_cache_configuration : Types::ServerlessCacheConfiguration? = nil,
          @serverless_cache_snapshot_name : String? = nil,
          @snapshot_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A serverless cache snapshot with this name already exists. Available for Valkey, Redis OSS and
      # Serverless Memcached only.
      struct ServerlessCacheSnapshotAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # This serverless cache snapshot could not be found or does not exist. Available for Valkey, Redis OSS
      # and Serverless Memcached only.
      struct ServerlessCacheSnapshotNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The number of serverless cache snapshots exceeds the customer snapshot quota. Available for Valkey,
      # Redis OSS and Serverless Memcached only.
      struct ServerlessCacheSnapshotQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The specified service linked role (SLR) was not found.
      struct ServiceLinkedRoleNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # An update that you can apply to your Valkey or Redis OSS clusters.
      struct ServiceUpdate
        include JSON::Serializable

        # Indicates whether the service update will be automatically applied once the recommended apply-by
        # date has expired.
        @[JSON::Field(key: "AutoUpdateAfterRecommendedApplyByDate")]
        getter auto_update_after_recommended_apply_by_date : Bool?

        # The Elasticache engine to which the update applies. Either Valkey, Redis OSS or Memcached.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The Elasticache engine version to which the update applies. Either Valkey, Redis OSS or Memcached
        # engine version.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The estimated length of time the service update will take
        @[JSON::Field(key: "EstimatedUpdateTime")]
        getter estimated_update_time : String?

        # Provides details of the service update
        @[JSON::Field(key: "ServiceUpdateDescription")]
        getter service_update_description : String?

        # The date after which the service update is no longer available
        @[JSON::Field(key: "ServiceUpdateEndDate")]
        getter service_update_end_date : Time?

        # The unique ID of the service update
        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String?

        # The recommendend date to apply the service update in order to ensure compliance. For information on
        # compliance, see Self-Service Security Updates for Compliance .
        @[JSON::Field(key: "ServiceUpdateRecommendedApplyByDate")]
        getter service_update_recommended_apply_by_date : Time?

        # The date when the service update is initially available
        @[JSON::Field(key: "ServiceUpdateReleaseDate")]
        getter service_update_release_date : Time?

        # The severity of the service update
        @[JSON::Field(key: "ServiceUpdateSeverity")]
        getter service_update_severity : String?

        # The status of the service update
        @[JSON::Field(key: "ServiceUpdateStatus")]
        getter service_update_status : String?

        # Reflects the nature of the service update
        @[JSON::Field(key: "ServiceUpdateType")]
        getter service_update_type : String?

        def initialize(
          @auto_update_after_recommended_apply_by_date : Bool? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @estimated_update_time : String? = nil,
          @service_update_description : String? = nil,
          @service_update_end_date : Time? = nil,
          @service_update_name : String? = nil,
          @service_update_recommended_apply_by_date : Time? = nil,
          @service_update_release_date : Time? = nil,
          @service_update_severity : String? = nil,
          @service_update_status : String? = nil,
          @service_update_type : String? = nil
        )
        end
      end

      # The service update doesn't exist
      struct ServiceUpdateNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      struct ServiceUpdatesMessage
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # A list of service updates
        @[JSON::Field(key: "ServiceUpdates")]
        getter service_updates : Array(Types::ServiceUpdate)?

        def initialize(
          @marker : String? = nil,
          @service_updates : Array(Types::ServiceUpdate)? = nil
        )
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

      # Represents a copy of an entire Valkey or Redis OSS cluster as of the time when the snapshot was
      # taken.
      struct Snapshot
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the snapshot.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # If you are running Valkey 7.2 and above or Redis OSS engine version 6.0 and above, set this
        # parameter to yes if you want to opt-in to the next auto minor version upgrade campaign. This
        # parameter is disabled for previous versions.
        @[JSON::Field(key: "AutoMinorVersionUpgrade")]
        getter auto_minor_version_upgrade : Bool?

        # Indicates the status of automatic failover for the source Valkey or Redis OSS replication group.
        @[JSON::Field(key: "AutomaticFailover")]
        getter automatic_failover : String?

        # The date and time when the source cluster was created.
        @[JSON::Field(key: "CacheClusterCreateTime")]
        getter cache_cluster_create_time : Time?

        # The user-supplied identifier of the source cluster.
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The name of the compute and memory capacity node type for the source cluster. The following node
        # types are supported by ElastiCache. Generally speaking, the current generation types provide more
        # memory and computational power at lower cost when compared to their equivalent previous generation
        # counterparts. General purpose: Current generation: M7g node types : cache.m7g.large ,
        # cache.m7g.xlarge , cache.m7g.2xlarge , cache.m7g.4xlarge , cache.m7g.8xlarge , cache.m7g.12xlarge ,
        # cache.m7g.16xlarge For region availability, see Supported Node Types M6g node types (available only
        # for Redis OSS engine version 5.0.6 onward and for Memcached engine version 1.5.16 onward):
        # cache.m6g.large , cache.m6g.xlarge , cache.m6g.2xlarge , cache.m6g.4xlarge , cache.m6g.8xlarge ,
        # cache.m6g.12xlarge , cache.m6g.16xlarge M5 node types: cache.m5.large , cache.m5.xlarge ,
        # cache.m5.2xlarge , cache.m5.4xlarge , cache.m5.12xlarge , cache.m5.24xlarge M4 node types:
        # cache.m4.large , cache.m4.xlarge , cache.m4.2xlarge , cache.m4.4xlarge , cache.m4.10xlarge T4g node
        # types (available only for Redis OSS engine version 5.0.6 onward and Memcached engine version 1.5.16
        # onward): cache.t4g.micro , cache.t4g.small , cache.t4g.medium T3 node types: cache.t3.micro ,
        # cache.t3.small , cache.t3.medium T2 node types: cache.t2.micro , cache.t2.small , cache.t2.medium
        # Previous generation: (not recommended. Existing clusters are still supported but creation of new
        # clusters is not supported for these types.) T1 node types: cache.t1.micro M1 node types:
        # cache.m1.small , cache.m1.medium , cache.m1.large , cache.m1.xlarge M3 node types: cache.m3.medium ,
        # cache.m3.large , cache.m3.xlarge , cache.m3.2xlarge Compute optimized: Previous generation: (not
        # recommended. Existing clusters are still supported but creation of new clusters is not supported for
        # these types.) C1 node types: cache.c1.xlarge Memory optimized: Current generation: R7g node types :
        # cache.r7g.large , cache.r7g.xlarge , cache.r7g.2xlarge , cache.r7g.4xlarge , cache.r7g.8xlarge ,
        # cache.r7g.12xlarge , cache.r7g.16xlarge For region availability, see Supported Node Types R6g node
        # types (available only for Redis OSS engine version 5.0.6 onward and for Memcached engine version
        # 1.5.16 onward): cache.r6g.large , cache.r6g.xlarge , cache.r6g.2xlarge , cache.r6g.4xlarge ,
        # cache.r6g.8xlarge , cache.r6g.12xlarge , cache.r6g.16xlarge R5 node types: cache.r5.large ,
        # cache.r5.xlarge , cache.r5.2xlarge , cache.r5.4xlarge , cache.r5.12xlarge , cache.r5.24xlarge R4
        # node types: cache.r4.large , cache.r4.xlarge , cache.r4.2xlarge , cache.r4.4xlarge ,
        # cache.r4.8xlarge , cache.r4.16xlarge Previous generation: (not recommended. Existing clusters are
        # still supported but creation of new clusters is not supported for these types.) M2 node types:
        # cache.m2.xlarge , cache.m2.2xlarge , cache.m2.4xlarge R3 node types: cache.r3.large ,
        # cache.r3.xlarge , cache.r3.2xlarge , cache.r3.4xlarge , cache.r3.8xlarge Additional node type info
        # All current generation instance types are created in Amazon VPC by default. Valkey or Redis OSS
        # append-only files (AOF) are not supported for T1 or T2 instances. Valkey or Redis OSS Multi-AZ with
        # automatic failover is not supported on T1 instances. The configuration variables appendonly and
        # appendfsync are not supported on Valkey, or on Redis OSS version 2.8.22 and later.
        @[JSON::Field(key: "CacheNodeType")]
        getter cache_node_type : String?

        # The cache parameter group that is associated with the source cluster.
        @[JSON::Field(key: "CacheParameterGroupName")]
        getter cache_parameter_group_name : String?

        # The name of the cache subnet group associated with the source cluster.
        @[JSON::Field(key: "CacheSubnetGroupName")]
        getter cache_subnet_group_name : String?

        # Enables data tiering. Data tiering is only supported for replication groups using the r6gd node
        # type. This parameter must be set to true when using r6gd nodes. For more information, see Data
        # tiering .
        @[JSON::Field(key: "DataTiering")]
        getter data_tiering : String?

        # The name of the cache engine ( memcached or redis ) used by the source cluster.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The version of the cache engine version that is used by the source cluster.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : String?

        # The ID of the KMS key used to encrypt the snapshot.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A list of the cache nodes in the source cluster.
        @[JSON::Field(key: "NodeSnapshots")]
        getter node_snapshots : Array(Types::NodeSnapshot)?

        # The number of cache nodes in the source cluster. For clusters running Valkey or Redis OSS, this
        # value must be 1. For clusters running Memcached, this value must be between 1 and 40.
        @[JSON::Field(key: "NumCacheNodes")]
        getter num_cache_nodes : Int32?

        # The number of node groups (shards) in this snapshot. When restoring from a snapshot, the number of
        # node groups (shards) in the snapshot and in the restored replication group must be the same.
        @[JSON::Field(key: "NumNodeGroups")]
        getter num_node_groups : Int32?

        # The port number used by each cache nodes in the source cluster.
        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The name of the Availability Zone in which the source cluster is located.
        @[JSON::Field(key: "PreferredAvailabilityZone")]
        getter preferred_availability_zone : String?

        # Specifies the weekly time range during which maintenance on the cluster is performed. It is
        # specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
        # window is a 60 minute period. Valid values for ddd are: sun mon tue wed thu fri sat Example:
        # sun:23:00-mon:01:30
        @[JSON::Field(key: "PreferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # The ARN (Amazon Resource Name) of the preferred outpost.
        @[JSON::Field(key: "PreferredOutpostArn")]
        getter preferred_outpost_arn : String?

        # A description of the source replication group.
        @[JSON::Field(key: "ReplicationGroupDescription")]
        getter replication_group_description : String?

        # The unique identifier of the source replication group.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # The name of a snapshot. For an automatic snapshot, the name is system-generated. For a manual
        # snapshot, this is the user-provided name.
        @[JSON::Field(key: "SnapshotName")]
        getter snapshot_name : String?

        # For an automatic snapshot, the number of days for which ElastiCache retains the snapshot before
        # deleting it. For manual snapshots, this field reflects the SnapshotRetentionLimit for the source
        # cluster when the snapshot was created. This field is otherwise ignored: Manual snapshots do not
        # expire, and can only be deleted using the DeleteSnapshot operation. Important If the value of
        # SnapshotRetentionLimit is set to zero (0), backups are turned off.
        @[JSON::Field(key: "SnapshotRetentionLimit")]
        getter snapshot_retention_limit : Int32?

        # Indicates whether the snapshot is from an automatic backup ( automated ) or was created manually (
        # manual ).
        @[JSON::Field(key: "SnapshotSource")]
        getter snapshot_source : String?

        # The status of the snapshot. Valid values: creating | available | restoring | copying | deleting .
        @[JSON::Field(key: "SnapshotStatus")]
        getter snapshot_status : String?

        # The daily time range during which ElastiCache takes daily snapshots of the source cluster.
        @[JSON::Field(key: "SnapshotWindow")]
        getter snapshot_window : String?

        # The Amazon Resource Name (ARN) for the topic used by the source cluster for publishing
        # notifications.
        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        # The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet group for the source
        # cluster.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @arn : String? = nil,
          @auto_minor_version_upgrade : Bool? = nil,
          @automatic_failover : String? = nil,
          @cache_cluster_create_time : Time? = nil,
          @cache_cluster_id : String? = nil,
          @cache_node_type : String? = nil,
          @cache_parameter_group_name : String? = nil,
          @cache_subnet_group_name : String? = nil,
          @data_tiering : String? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @kms_key_id : String? = nil,
          @node_snapshots : Array(Types::NodeSnapshot)? = nil,
          @num_cache_nodes : Int32? = nil,
          @num_node_groups : Int32? = nil,
          @port : Int32? = nil,
          @preferred_availability_zone : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @preferred_outpost_arn : String? = nil,
          @replication_group_description : String? = nil,
          @replication_group_id : String? = nil,
          @snapshot_name : String? = nil,
          @snapshot_retention_limit : Int32? = nil,
          @snapshot_source : String? = nil,
          @snapshot_status : String? = nil,
          @snapshot_window : String? = nil,
          @topic_arn : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # You already have a snapshot with the given name.
      struct SnapshotAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # You attempted one of the following operations: Creating a snapshot of a Valkey or Redis OSS cluster
      # running on a cache.t1.micro cache node. Creating a snapshot of a cluster that is running Memcached
      # rather than Valkey or Redis OSS. Neither of these are supported by ElastiCache.
      struct SnapshotFeatureNotSupportedFault
        include JSON::Serializable

        def initialize
        end
      end

      # The requested snapshot name does not refer to an existing snapshot.
      struct SnapshotNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would exceed the maximum number of snapshots.
      struct SnapshotQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      struct StartMigrationMessage
        include JSON::Serializable

        # List of endpoints from which data should be migrated. For Valkey or Redis OSS (cluster mode
        # disabled), the list should have only one element.
        @[JSON::Field(key: "CustomerNodeEndpointList")]
        getter customer_node_endpoint_list : Array(Types::CustomerNodeEndpoint)

        # The ID of the replication group to which data should be migrated.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        def initialize(
          @customer_node_endpoint_list : Array(Types::CustomerNodeEndpoint),
          @replication_group_id : String
        )
        end
      end

      struct StartMigrationResponse
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      # Represents the subnet associated with a cluster. This parameter refers to subnets defined in Amazon
      # Virtual Private Cloud (Amazon VPC) and used with ElastiCache.
      struct Subnet
        include JSON::Serializable

        # The Availability Zone associated with the subnet.
        @[JSON::Field(key: "SubnetAvailabilityZone")]
        getter subnet_availability_zone : Types::AvailabilityZone?

        # The unique identifier for the subnet.
        @[JSON::Field(key: "SubnetIdentifier")]
        getter subnet_identifier : String?

        # The outpost ARN of the subnet.
        @[JSON::Field(key: "SubnetOutpost")]
        getter subnet_outpost : Types::SubnetOutpost?

        # Either ipv4 | ipv6 | dual_stack . IPv6 is supported for workloads using Valkey 7.2 and above, Redis
        # OSS engine version 6.2 to 7.1 or Memcached engine version 1.6.6 and above on all instances built on
        # the Nitro system .
        @[JSON::Field(key: "SupportedNetworkTypes")]
        getter supported_network_types : Array(String)?

        def initialize(
          @subnet_availability_zone : Types::AvailabilityZone? = nil,
          @subnet_identifier : String? = nil,
          @subnet_outpost : Types::SubnetOutpost? = nil,
          @supported_network_types : Array(String)? = nil
        )
        end
      end

      # The requested subnet is being used by another cache subnet group.
      struct SubnetInUse
        include JSON::Serializable

        def initialize
        end
      end

      # At least one subnet ID does not match the other subnet IDs. This mismatch typically occurs when a
      # user sets one subnet ID to a regional Availability Zone and a different one to an outpost. Or when a
      # user sets the subnet ID to an Outpost when not subscribed on this service.
      struct SubnetNotAllowedFault
        include JSON::Serializable

        def initialize
        end
      end

      # The ID of the outpost subnet.
      struct SubnetOutpost
        include JSON::Serializable

        # The outpost ARN of the subnet.
        @[JSON::Field(key: "SubnetOutpostArn")]
        getter subnet_outpost_arn : String?

        def initialize(
          @subnet_outpost_arn : String? = nil
        )
        end
      end

      # A tag that can be added to an ElastiCache cluster or replication group. Tags are composed of a
      # Key/Value pair. You can use tags to categorize and track all your ElastiCache resources, with the
      # exception of global replication group. When you add or remove tags on replication groups, those
      # actions will be replicated to all nodes in the replication group. A tag with a null Value is
      # permitted.
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

      # Represents the output from the AddTagsToResource , ListTagsForResource , and RemoveTagsFromResource
      # operations.
      struct TagListMessage
        include JSON::Serializable

        # A list of tags as key-value pairs.
        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # The requested tag was not found on this resource.
      struct TagNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be processed because it would cause the resource to have more than the allowed
      # number of tags. The maximum number of tags permitted on a resource is 50.
      struct TagQuotaPerResourceExceeded
        include JSON::Serializable

        def initialize
        end
      end

      struct TestFailoverMessage
        include JSON::Serializable

        # The name of the node group (called shard in the console) in this replication group on which
        # automatic failover is to be tested. You may test automatic failover on up to 15 node groups in any
        # rolling 24-hour period.
        @[JSON::Field(key: "NodeGroupId")]
        getter node_group_id : String

        # The name of the replication group (console: cluster) whose automatic failover is being tested by
        # this operation.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        def initialize(
          @node_group_id : String,
          @replication_group_id : String
        )
        end
      end

      # The TestFailover action is not available.
      struct TestFailoverNotAvailableFault
        include JSON::Serializable

        def initialize
        end
      end

      struct TestFailoverResult
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      struct TestMigrationMessage
        include JSON::Serializable

        # List of endpoints from which data should be migrated. List should have only one element.
        @[JSON::Field(key: "CustomerNodeEndpointList")]
        getter customer_node_endpoint_list : Array(Types::CustomerNodeEndpoint)

        # The ID of the replication group to which data is to be migrated.
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String

        def initialize(
          @customer_node_endpoint_list : Array(Types::CustomerNodeEndpoint),
          @replication_group_id : String
        )
        end
      end

      struct TestMigrationResponse
        include JSON::Serializable

        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Types::ReplicationGroup?

        def initialize(
          @replication_group : Types::ReplicationGroup? = nil
        )
        end
      end

      # Filters update actions from the service updates that are in available status during the time range.
      struct TimeRangeFilter
        include JSON::Serializable

        # The end time of the time range filter
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The start time of the time range filter
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Update action that has failed to be processed for the corresponding apply/stop request
      struct UnprocessedUpdateAction
        include JSON::Serializable

        # The ID of the cache cluster
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The error message that describes the reason the request was not processed
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The error type for requests that are not processed
        @[JSON::Field(key: "ErrorType")]
        getter error_type : String?

        # The replication group ID
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # The unique ID of the service update
        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String?

        def initialize(
          @cache_cluster_id : String? = nil,
          @error_message : String? = nil,
          @error_type : String? = nil,
          @replication_group_id : String? = nil,
          @service_update_name : String? = nil
        )
        end
      end

      # The status of the service update for a specific replication group
      struct UpdateAction
        include JSON::Serializable

        # The ID of the cache cluster
        @[JSON::Field(key: "CacheClusterId")]
        getter cache_cluster_id : String?

        # The status of the service update on the cache node
        @[JSON::Field(key: "CacheNodeUpdateStatus")]
        getter cache_node_update_status : Array(Types::CacheNodeUpdateStatus)?

        # The Elasticache engine to which the update applies. Either Valkey, Redis OSS or Memcached.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The estimated length of time for the update to complete
        @[JSON::Field(key: "EstimatedUpdateTime")]
        getter estimated_update_time : String?

        # The status of the service update on the node group
        @[JSON::Field(key: "NodeGroupUpdateStatus")]
        getter node_group_update_status : Array(Types::NodeGroupUpdateStatus)?

        # The progress of the service update on the replication group
        @[JSON::Field(key: "NodesUpdated")]
        getter nodes_updated : String?

        # The ID of the replication group
        @[JSON::Field(key: "ReplicationGroupId")]
        getter replication_group_id : String?

        # The unique ID of the service update
        @[JSON::Field(key: "ServiceUpdateName")]
        getter service_update_name : String?

        # The recommended date to apply the service update to ensure compliance. For information on
        # compliance, see Self-Service Security Updates for Compliance .
        @[JSON::Field(key: "ServiceUpdateRecommendedApplyByDate")]
        getter service_update_recommended_apply_by_date : Time?

        # The date the update is first available
        @[JSON::Field(key: "ServiceUpdateReleaseDate")]
        getter service_update_release_date : Time?

        # The severity of the service update
        @[JSON::Field(key: "ServiceUpdateSeverity")]
        getter service_update_severity : String?

        # The status of the service update
        @[JSON::Field(key: "ServiceUpdateStatus")]
        getter service_update_status : String?

        # Reflects the nature of the service update
        @[JSON::Field(key: "ServiceUpdateType")]
        getter service_update_type : String?

        # If yes, all nodes in the replication group have been updated by the recommended apply-by date. If
        # no, at least one node in the replication group have not been updated by the recommended apply-by
        # date. If N/A, the replication group was created after the recommended apply-by date.
        @[JSON::Field(key: "SlaMet")]
        getter sla_met : String?

        # The date that the service update is available to a replication group
        @[JSON::Field(key: "UpdateActionAvailableDate")]
        getter update_action_available_date : Time?

        # The status of the update action
        @[JSON::Field(key: "UpdateActionStatus")]
        getter update_action_status : String?

        # The date when the UpdateActionStatus was last modified
        @[JSON::Field(key: "UpdateActionStatusModifiedDate")]
        getter update_action_status_modified_date : Time?

        def initialize(
          @cache_cluster_id : String? = nil,
          @cache_node_update_status : Array(Types::CacheNodeUpdateStatus)? = nil,
          @engine : String? = nil,
          @estimated_update_time : String? = nil,
          @node_group_update_status : Array(Types::NodeGroupUpdateStatus)? = nil,
          @nodes_updated : String? = nil,
          @replication_group_id : String? = nil,
          @service_update_name : String? = nil,
          @service_update_recommended_apply_by_date : Time? = nil,
          @service_update_release_date : Time? = nil,
          @service_update_severity : String? = nil,
          @service_update_status : String? = nil,
          @service_update_type : String? = nil,
          @sla_met : String? = nil,
          @update_action_available_date : Time? = nil,
          @update_action_status : String? = nil,
          @update_action_status_modified_date : Time? = nil
        )
        end
      end

      struct UpdateActionResultsMessage
        include JSON::Serializable

        # Update actions that have been processed successfully
        @[JSON::Field(key: "ProcessedUpdateActions")]
        getter processed_update_actions : Array(Types::ProcessedUpdateAction)?

        # Update actions that haven't been processed successfully
        @[JSON::Field(key: "UnprocessedUpdateActions")]
        getter unprocessed_update_actions : Array(Types::UnprocessedUpdateAction)?

        def initialize(
          @processed_update_actions : Array(Types::ProcessedUpdateAction)? = nil,
          @unprocessed_update_actions : Array(Types::UnprocessedUpdateAction)? = nil
        )
        end
      end

      struct UpdateActionsMessage
        include JSON::Serializable

        # An optional marker returned from a prior request. Use this marker for pagination of results from
        # this operation. If this parameter is specified, the response includes only records beyond the
        # marker, up to the value specified by MaxRecords .
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Returns a list of update actions
        @[JSON::Field(key: "UpdateActions")]
        getter update_actions : Array(Types::UpdateAction)?

        def initialize(
          @marker : String? = nil,
          @update_actions : Array(Types::UpdateAction)? = nil
        )
        end
      end

      struct User
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the user.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # Access permissions string used for this user.
        @[JSON::Field(key: "AccessString")]
        getter access_string : String?

        # Denotes whether the user requires a password to authenticate.
        @[JSON::Field(key: "Authentication")]
        getter authentication : Types::Authentication?

        # The options are valkey or redis.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The minimum engine version required, which is Redis OSS 6.0
        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # Indicates the user status. Can be "active", "modifying" or "deleting".
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Returns a list of the user group IDs the user belongs to.
        @[JSON::Field(key: "UserGroupIds")]
        getter user_group_ids : Array(String)?

        # The ID of the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        # The username of the user.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @arn : String? = nil,
          @access_string : String? = nil,
          @authentication : Types::Authentication? = nil,
          @engine : String? = nil,
          @minimum_engine_version : String? = nil,
          @status : String? = nil,
          @user_group_ids : Array(String)? = nil,
          @user_id : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # A user with this ID already exists.
      struct UserAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      struct UserGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the user group.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The options are valkey or redis.
        @[JSON::Field(key: "Engine")]
        getter engine : String?

        # The minimum engine version required, which is Redis OSS 6.0
        @[JSON::Field(key: "MinimumEngineVersion")]
        getter minimum_engine_version : String?

        # A list of updates being applied to the user group.
        @[JSON::Field(key: "PendingChanges")]
        getter pending_changes : Types::UserGroupPendingChanges?

        # A list of replication groups that the user group can access.
        @[JSON::Field(key: "ReplicationGroups")]
        getter replication_groups : Array(String)?

        # Indicates which serverless caches the specified user group is associated with. Available for Valkey,
        # Redis OSS and Serverless Memcached only.
        @[JSON::Field(key: "ServerlessCaches")]
        getter serverless_caches : Array(String)?

        # Indicates user group status. Can be "creating", "active", "modifying", "deleting".
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the user group.
        @[JSON::Field(key: "UserGroupId")]
        getter user_group_id : String?

        # The list of user IDs that belong to the user group.
        @[JSON::Field(key: "UserIds")]
        getter user_ids : Array(String)?

        def initialize(
          @arn : String? = nil,
          @engine : String? = nil,
          @minimum_engine_version : String? = nil,
          @pending_changes : Types::UserGroupPendingChanges? = nil,
          @replication_groups : Array(String)? = nil,
          @serverless_caches : Array(String)? = nil,
          @status : String? = nil,
          @user_group_id : String? = nil,
          @user_ids : Array(String)? = nil
        )
        end
      end

      # The user group with this ID already exists.
      struct UserGroupAlreadyExistsFault
        include JSON::Serializable

        def initialize
        end
      end

      # The user group was not found or does not exist
      struct UserGroupNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # Returns the updates being applied to the user group.
      struct UserGroupPendingChanges
        include JSON::Serializable

        # The list of user IDs to add.
        @[JSON::Field(key: "UserIdsToAdd")]
        getter user_ids_to_add : Array(String)?

        # The list of user IDs to remove.
        @[JSON::Field(key: "UserIdsToRemove")]
        getter user_ids_to_remove : Array(String)?

        def initialize(
          @user_ids_to_add : Array(String)? = nil,
          @user_ids_to_remove : Array(String)? = nil
        )
        end
      end

      # The number of users exceeds the user group limit.
      struct UserGroupQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end

      # The status of the user group update.
      struct UserGroupsUpdateStatus
        include JSON::Serializable

        # The ID of the user group to add.
        @[JSON::Field(key: "UserGroupIdsToAdd")]
        getter user_group_ids_to_add : Array(String)?

        # The ID of the user group to remove.
        @[JSON::Field(key: "UserGroupIdsToRemove")]
        getter user_group_ids_to_remove : Array(String)?

        def initialize(
          @user_group_ids_to_add : Array(String)? = nil,
          @user_group_ids_to_remove : Array(String)? = nil
        )
        end
      end

      # The user does not exist or could not be found.
      struct UserNotFoundFault
        include JSON::Serializable

        def initialize
        end
      end

      # The quota of users has been exceeded.
      struct UserQuotaExceededFault
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
