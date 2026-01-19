module AwsSdk
  module ElastiCache
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # A tag is a key-value pair where the key and value are case-sensitive. You can use tags to categorize
      # and track all your ElastiCache resources, with the exception of global replication group. When you
      # add or remove tags on replication groups, those actions will be replicated to all nodes in the
      # replication group. For more information, see Resource-level permissions . For example, you can use
      # cost-allocation tags to your ElastiCache resources, Amazon generates a cost allocation report as a
      # comma-separated value (CSV) file with your usage and costs aggregated by your tags. You can apply
      # tags that represent business categories (such as cost centers, application names, or owners) to
      # organize your costs across multiple services. For more information, see Using Cost Allocation Tags
      # in Amazon ElastiCache in the ElastiCache User Guide .
      def add_tags_to_resource(
        resource_name : String,
        tags : Array(Types::Tag)
      ) : Types::TagListMessage
        input = Types::AddTagsToResourceMessage.new(resource_name: resource_name, tags: tags)
        add_tags_to_resource(input)
      end
      def add_tags_to_resource(input : Types::AddTagsToResourceMessage) : Types::TagListMessage
        request = Protocol::Query.build_request(Model::ADD_TAGS_TO_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TagListMessage, "AddTagsToResource")
      end

      # Allows network ingress to a cache security group. Applications using ElastiCache must be running on
      # Amazon EC2, and Amazon EC2 security groups are used as the authorization mechanism. You cannot
      # authorize ingress from an Amazon EC2 security group in one region to an ElastiCache cluster in
      # another region.
      def authorize_cache_security_group_ingress(
        cache_security_group_name : String,
        ec2_security_group_name : String,
        ec2_security_group_owner_id : String
      ) : Types::AuthorizeCacheSecurityGroupIngressResult
        input = Types::AuthorizeCacheSecurityGroupIngressMessage.new(cache_security_group_name: cache_security_group_name, ec2_security_group_name: ec2_security_group_name, ec2_security_group_owner_id: ec2_security_group_owner_id)
        authorize_cache_security_group_ingress(input)
      end
      def authorize_cache_security_group_ingress(input : Types::AuthorizeCacheSecurityGroupIngressMessage) : Types::AuthorizeCacheSecurityGroupIngressResult
        request = Protocol::Query.build_request(Model::AUTHORIZE_CACHE_SECURITY_GROUP_INGRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AuthorizeCacheSecurityGroupIngressResult, "AuthorizeCacheSecurityGroupIngress")
      end

      # Apply the service update. For more information on service updates and applying them, see Applying
      # Service Updates .
      def batch_apply_update_action(
        service_update_name : String,
        cache_cluster_ids : Array(String)? = nil,
        replication_group_ids : Array(String)? = nil
      ) : Types::UpdateActionResultsMessage
        input = Types::BatchApplyUpdateActionMessage.new(service_update_name: service_update_name, cache_cluster_ids: cache_cluster_ids, replication_group_ids: replication_group_ids)
        batch_apply_update_action(input)
      end
      def batch_apply_update_action(input : Types::BatchApplyUpdateActionMessage) : Types::UpdateActionResultsMessage
        request = Protocol::Query.build_request(Model::BATCH_APPLY_UPDATE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateActionResultsMessage, "BatchApplyUpdateAction")
      end

      # Stop the service update. For more information on service updates and stopping them, see Stopping
      # Service Updates .
      def batch_stop_update_action(
        service_update_name : String,
        cache_cluster_ids : Array(String)? = nil,
        replication_group_ids : Array(String)? = nil
      ) : Types::UpdateActionResultsMessage
        input = Types::BatchStopUpdateActionMessage.new(service_update_name: service_update_name, cache_cluster_ids: cache_cluster_ids, replication_group_ids: replication_group_ids)
        batch_stop_update_action(input)
      end
      def batch_stop_update_action(input : Types::BatchStopUpdateActionMessage) : Types::UpdateActionResultsMessage
        request = Protocol::Query.build_request(Model::BATCH_STOP_UPDATE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateActionResultsMessage, "BatchStopUpdateAction")
      end

      # Complete the migration of data.
      def complete_migration(
        replication_group_id : String,
        force : Bool? = nil
      ) : Types::CompleteMigrationResponse
        input = Types::CompleteMigrationMessage.new(replication_group_id: replication_group_id, force: force)
        complete_migration(input)
      end
      def complete_migration(input : Types::CompleteMigrationMessage) : Types::CompleteMigrationResponse
        request = Protocol::Query.build_request(Model::COMPLETE_MIGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CompleteMigrationResponse, "CompleteMigration")
      end

      # Creates a copy of an existing serverless cache’s snapshot. Available for Valkey, Redis OSS and
      # Serverless Memcached only.
      def copy_serverless_cache_snapshot(
        source_serverless_cache_snapshot_name : String,
        target_serverless_cache_snapshot_name : String,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CopyServerlessCacheSnapshotResponse
        input = Types::CopyServerlessCacheSnapshotRequest.new(source_serverless_cache_snapshot_name: source_serverless_cache_snapshot_name, target_serverless_cache_snapshot_name: target_serverless_cache_snapshot_name, kms_key_id: kms_key_id, tags: tags)
        copy_serverless_cache_snapshot(input)
      end
      def copy_serverless_cache_snapshot(input : Types::CopyServerlessCacheSnapshotRequest) : Types::CopyServerlessCacheSnapshotResponse
        request = Protocol::Query.build_request(Model::COPY_SERVERLESS_CACHE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CopyServerlessCacheSnapshotResponse, "CopyServerlessCacheSnapshot")
      end

      # Makes a copy of an existing snapshot. This operation is valid for Valkey or Redis OSS only. Users or
      # groups that have permissions to use the CopySnapshot operation can create their own Amazon S3
      # buckets and copy snapshots to it. To control access to your snapshots, use an IAM policy to control
      # who has the ability to use the CopySnapshot operation. For more information about using IAM to
      # control the use of ElastiCache operations, see Exporting Snapshots and Authentication &amp; Access
      # Control . You could receive the following error messages. Error Messages Error Message: The S3
      # bucket %s is outside of the region. Solution: Create an Amazon S3 bucket in the same region as your
      # snapshot. For more information, see Step 1: Create an Amazon S3 Bucket in the ElastiCache User
      # Guide. Error Message: The S3 bucket %s does not exist. Solution: Create an Amazon S3 bucket in the
      # same region as your snapshot. For more information, see Step 1: Create an Amazon S3 Bucket in the
      # ElastiCache User Guide. Error Message: The S3 bucket %s is not owned by the authenticated user.
      # Solution: Create an Amazon S3 bucket in the same region as your snapshot. For more information, see
      # Step 1: Create an Amazon S3 Bucket in the ElastiCache User Guide. Error Message: The authenticated
      # user does not have sufficient permissions to perform the desired activity. Solution: Contact your
      # system administrator to get the needed permissions. Error Message: The S3 bucket %s already contains
      # an object with key %s. Solution: Give the TargetSnapshotName a new and unique value. If exporting a
      # snapshot, you could alternatively create a new Amazon S3 bucket and use this same value for
      # TargetSnapshotName . Error Message: ElastiCache has not been granted READ permissions %s on the S3
      # Bucket. Solution: Add List and Read permissions on the bucket. For more information, see Step 2:
      # Grant ElastiCache Access to Your Amazon S3 Bucket in the ElastiCache User Guide. Error Message:
      # ElastiCache has not been granted WRITE permissions %s on the S3 Bucket. Solution: Add Upload/Delete
      # permissions on the bucket. For more information, see Step 2: Grant ElastiCache Access to Your Amazon
      # S3 Bucket in the ElastiCache User Guide. Error Message: ElastiCache has not been granted READ_ACP
      # permissions %s on the S3 Bucket. Solution: Add View Permissions on the bucket. For more information,
      # see Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket in the ElastiCache User Guide.
      def copy_snapshot(
        source_snapshot_name : String,
        target_snapshot_name : String,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        target_bucket : String? = nil
      ) : Types::CopySnapshotResult
        input = Types::CopySnapshotMessage.new(source_snapshot_name: source_snapshot_name, target_snapshot_name: target_snapshot_name, kms_key_id: kms_key_id, tags: tags, target_bucket: target_bucket)
        copy_snapshot(input)
      end
      def copy_snapshot(input : Types::CopySnapshotMessage) : Types::CopySnapshotResult
        request = Protocol::Query.build_request(Model::COPY_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CopySnapshotResult, "CopySnapshot")
      end

      # Creates a cluster. All nodes in the cluster run the same protocol-compliant cache engine software,
      # either Memcached, Valkey or Redis OSS. This operation is not supported for Valkey or Redis OSS
      # (cluster mode enabled) clusters.
      def create_cache_cluster(
        cache_cluster_id : String,
        az_mode : String? = nil,
        auth_token : String? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        cache_node_type : String? = nil,
        cache_parameter_group_name : String? = nil,
        cache_security_group_names : Array(String)? = nil,
        cache_subnet_group_name : String? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        ip_discovery : String? = nil,
        log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)? = nil,
        network_type : String? = nil,
        notification_topic_arn : String? = nil,
        num_cache_nodes : Int32? = nil,
        outpost_mode : String? = nil,
        port : Int32? = nil,
        preferred_availability_zone : String? = nil,
        preferred_availability_zones : Array(String)? = nil,
        preferred_maintenance_window : String? = nil,
        preferred_outpost_arn : String? = nil,
        preferred_outpost_arns : Array(String)? = nil,
        replication_group_id : String? = nil,
        security_group_ids : Array(String)? = nil,
        snapshot_arns : Array(String)? = nil,
        snapshot_name : String? = nil,
        snapshot_retention_limit : Int32? = nil,
        snapshot_window : String? = nil,
        tags : Array(Types::Tag)? = nil,
        transit_encryption_enabled : Bool? = nil
      ) : Types::CreateCacheClusterResult
        input = Types::CreateCacheClusterMessage.new(cache_cluster_id: cache_cluster_id, az_mode: az_mode, auth_token: auth_token, auto_minor_version_upgrade: auto_minor_version_upgrade, cache_node_type: cache_node_type, cache_parameter_group_name: cache_parameter_group_name, cache_security_group_names: cache_security_group_names, cache_subnet_group_name: cache_subnet_group_name, engine: engine, engine_version: engine_version, ip_discovery: ip_discovery, log_delivery_configurations: log_delivery_configurations, network_type: network_type, notification_topic_arn: notification_topic_arn, num_cache_nodes: num_cache_nodes, outpost_mode: outpost_mode, port: port, preferred_availability_zone: preferred_availability_zone, preferred_availability_zones: preferred_availability_zones, preferred_maintenance_window: preferred_maintenance_window, preferred_outpost_arn: preferred_outpost_arn, preferred_outpost_arns: preferred_outpost_arns, replication_group_id: replication_group_id, security_group_ids: security_group_ids, snapshot_arns: snapshot_arns, snapshot_name: snapshot_name, snapshot_retention_limit: snapshot_retention_limit, snapshot_window: snapshot_window, tags: tags, transit_encryption_enabled: transit_encryption_enabled)
        create_cache_cluster(input)
      end
      def create_cache_cluster(input : Types::CreateCacheClusterMessage) : Types::CreateCacheClusterResult
        request = Protocol::Query.build_request(Model::CREATE_CACHE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateCacheClusterResult, "CreateCacheCluster")
      end

      # Creates a new Amazon ElastiCache cache parameter group. An ElastiCache cache parameter group is a
      # collection of parameters and their values that are applied to all of the nodes in any cluster or
      # replication group using the CacheParameterGroup. A newly created CacheParameterGroup is an exact
      # duplicate of the default parameter group for the CacheParameterGroupFamily. To customize the newly
      # created CacheParameterGroup you can change the values of specific parameters. For more information,
      # see: ModifyCacheParameterGroup in the ElastiCache API Reference. Parameters and Parameter Groups in
      # the ElastiCache User Guide.
      def create_cache_parameter_group(
        cache_parameter_group_family : String,
        cache_parameter_group_name : String,
        description : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCacheParameterGroupResult
        input = Types::CreateCacheParameterGroupMessage.new(cache_parameter_group_family: cache_parameter_group_family, cache_parameter_group_name: cache_parameter_group_name, description: description, tags: tags)
        create_cache_parameter_group(input)
      end
      def create_cache_parameter_group(input : Types::CreateCacheParameterGroupMessage) : Types::CreateCacheParameterGroupResult
        request = Protocol::Query.build_request(Model::CREATE_CACHE_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateCacheParameterGroupResult, "CreateCacheParameterGroup")
      end

      # Creates a new cache security group. Use a cache security group to control access to one or more
      # clusters. Cache security groups are only used when you are creating a cluster outside of an Amazon
      # Virtual Private Cloud (Amazon VPC). If you are creating a cluster inside of a VPC, use a cache
      # subnet group instead. For more information, see CreateCacheSubnetGroup .
      def create_cache_security_group(
        cache_security_group_name : String,
        description : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCacheSecurityGroupResult
        input = Types::CreateCacheSecurityGroupMessage.new(cache_security_group_name: cache_security_group_name, description: description, tags: tags)
        create_cache_security_group(input)
      end
      def create_cache_security_group(input : Types::CreateCacheSecurityGroupMessage) : Types::CreateCacheSecurityGroupResult
        request = Protocol::Query.build_request(Model::CREATE_CACHE_SECURITY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateCacheSecurityGroupResult, "CreateCacheSecurityGroup")
      end

      # Creates a new cache subnet group. Use this parameter only when you are creating a cluster in an
      # Amazon Virtual Private Cloud (Amazon VPC).
      def create_cache_subnet_group(
        cache_subnet_group_description : String,
        cache_subnet_group_name : String,
        subnet_ids : Array(String),
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCacheSubnetGroupResult
        input = Types::CreateCacheSubnetGroupMessage.new(cache_subnet_group_description: cache_subnet_group_description, cache_subnet_group_name: cache_subnet_group_name, subnet_ids: subnet_ids, tags: tags)
        create_cache_subnet_group(input)
      end
      def create_cache_subnet_group(input : Types::CreateCacheSubnetGroupMessage) : Types::CreateCacheSubnetGroupResult
        request = Protocol::Query.build_request(Model::CREATE_CACHE_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateCacheSubnetGroupResult, "CreateCacheSubnetGroup")
      end

      # Global Datastore offers fully managed, fast, reliable and secure cross-region replication. Using
      # Global Datastore with Valkey or Redis OSS, you can create cross-region read replica clusters for
      # ElastiCache to enable low-latency reads and disaster recovery across regions. For more information,
      # see Replication Across Regions Using Global Datastore . The GlobalReplicationGroupIdSuffix is the
      # name of the Global datastore. The PrimaryReplicationGroupId represents the name of the primary
      # cluster that accepts writes and will replicate updates to the secondary cluster.
      def create_global_replication_group(
        global_replication_group_id_suffix : String,
        primary_replication_group_id : String,
        global_replication_group_description : String? = nil
      ) : Types::CreateGlobalReplicationGroupResult
        input = Types::CreateGlobalReplicationGroupMessage.new(global_replication_group_id_suffix: global_replication_group_id_suffix, primary_replication_group_id: primary_replication_group_id, global_replication_group_description: global_replication_group_description)
        create_global_replication_group(input)
      end
      def create_global_replication_group(input : Types::CreateGlobalReplicationGroupMessage) : Types::CreateGlobalReplicationGroupResult
        request = Protocol::Query.build_request(Model::CREATE_GLOBAL_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateGlobalReplicationGroupResult, "CreateGlobalReplicationGroup")
      end

      # Creates a Valkey or Redis OSS (cluster mode disabled) or a Valkey or Redis OSS (cluster mode
      # enabled) replication group. This API can be used to create a standalone regional replication group
      # or a secondary replication group associated with a Global datastore. A Valkey or Redis OSS (cluster
      # mode disabled) replication group is a collection of nodes, where one of the nodes is a read/write
      # primary and the others are read-only replicas. Writes to the primary are asynchronously propagated
      # to the replicas. A Valkey or Redis OSS cluster-mode enabled cluster is comprised of from 1 to 90
      # shards (API/CLI: node groups). Each shard has a primary node and up to 5 read-only replica nodes.
      # The configuration can range from 90 shards and 0 replicas to 15 shards and 5 replicas, which is the
      # maximum number or replicas allowed. The node or shard limit can be increased to a maximum of 500 per
      # cluster if the Valkey or Redis OSS engine version is 5.0.6 or higher. For example, you can choose to
      # configure a 500 node cluster that ranges between 83 shards (one primary and 5 replicas per shard)
      # and 500 shards (single primary and no replicas). Make sure there are enough available IP addresses
      # to accommodate the increase. Common pitfalls include the subnets in the subnet group have too small
      # a CIDR range or the subnets are shared and heavily used by other clusters. For more information, see
      # Creating a Subnet Group . For versions below 5.0.6, the limit is 250 per cluster. To request a limit
      # increase, see Amazon Service Limits and choose the limit type Nodes per cluster per instance type .
      # When a Valkey or Redis OSS (cluster mode disabled) replication group has been successfully created,
      # you can add one or more read replicas to it, up to a total of 5 read replicas. If you need to
      # increase or decrease the number of node groups (console: shards), you can use scaling. For more
      # information, see Scaling self-designed clusters in the ElastiCache User Guide . This operation is
      # valid for Valkey and Redis OSS only.
      def create_replication_group(
        replication_group_description : String,
        replication_group_id : String,
        at_rest_encryption_enabled : Bool? = nil,
        auth_token : String? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        automatic_failover_enabled : Bool? = nil,
        cache_node_type : String? = nil,
        cache_parameter_group_name : String? = nil,
        cache_security_group_names : Array(String)? = nil,
        cache_subnet_group_name : String? = nil,
        cluster_mode : String? = nil,
        data_tiering_enabled : Bool? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        global_replication_group_id : String? = nil,
        ip_discovery : String? = nil,
        kms_key_id : String? = nil,
        log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)? = nil,
        multi_az_enabled : Bool? = nil,
        network_type : String? = nil,
        node_group_configuration : Array(Types::NodeGroupConfiguration)? = nil,
        notification_topic_arn : String? = nil,
        num_cache_clusters : Int32? = nil,
        num_node_groups : Int32? = nil,
        port : Int32? = nil,
        preferred_cache_cluster_a_zs : Array(String)? = nil,
        preferred_maintenance_window : String? = nil,
        primary_cluster_id : String? = nil,
        replicas_per_node_group : Int32? = nil,
        security_group_ids : Array(String)? = nil,
        serverless_cache_snapshot_name : String? = nil,
        snapshot_arns : Array(String)? = nil,
        snapshot_name : String? = nil,
        snapshot_retention_limit : Int32? = nil,
        snapshot_window : String? = nil,
        tags : Array(Types::Tag)? = nil,
        transit_encryption_enabled : Bool? = nil,
        transit_encryption_mode : String? = nil,
        user_group_ids : Array(String)? = nil
      ) : Types::CreateReplicationGroupResult
        input = Types::CreateReplicationGroupMessage.new(replication_group_description: replication_group_description, replication_group_id: replication_group_id, at_rest_encryption_enabled: at_rest_encryption_enabled, auth_token: auth_token, auto_minor_version_upgrade: auto_minor_version_upgrade, automatic_failover_enabled: automatic_failover_enabled, cache_node_type: cache_node_type, cache_parameter_group_name: cache_parameter_group_name, cache_security_group_names: cache_security_group_names, cache_subnet_group_name: cache_subnet_group_name, cluster_mode: cluster_mode, data_tiering_enabled: data_tiering_enabled, engine: engine, engine_version: engine_version, global_replication_group_id: global_replication_group_id, ip_discovery: ip_discovery, kms_key_id: kms_key_id, log_delivery_configurations: log_delivery_configurations, multi_az_enabled: multi_az_enabled, network_type: network_type, node_group_configuration: node_group_configuration, notification_topic_arn: notification_topic_arn, num_cache_clusters: num_cache_clusters, num_node_groups: num_node_groups, port: port, preferred_cache_cluster_a_zs: preferred_cache_cluster_a_zs, preferred_maintenance_window: preferred_maintenance_window, primary_cluster_id: primary_cluster_id, replicas_per_node_group: replicas_per_node_group, security_group_ids: security_group_ids, serverless_cache_snapshot_name: serverless_cache_snapshot_name, snapshot_arns: snapshot_arns, snapshot_name: snapshot_name, snapshot_retention_limit: snapshot_retention_limit, snapshot_window: snapshot_window, tags: tags, transit_encryption_enabled: transit_encryption_enabled, transit_encryption_mode: transit_encryption_mode, user_group_ids: user_group_ids)
        create_replication_group(input)
      end
      def create_replication_group(input : Types::CreateReplicationGroupMessage) : Types::CreateReplicationGroupResult
        request = Protocol::Query.build_request(Model::CREATE_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateReplicationGroupResult, "CreateReplicationGroup")
      end

      # Creates a serverless cache.
      def create_serverless_cache(
        engine : String,
        serverless_cache_name : String,
        cache_usage_limits : Types::CacheUsageLimits? = nil,
        daily_snapshot_time : String? = nil,
        description : String? = nil,
        kms_key_id : String? = nil,
        major_engine_version : String? = nil,
        security_group_ids : Array(String)? = nil,
        snapshot_arns_to_restore : Array(String)? = nil,
        snapshot_retention_limit : Int32? = nil,
        subnet_ids : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        user_group_id : String? = nil
      ) : Types::CreateServerlessCacheResponse
        input = Types::CreateServerlessCacheRequest.new(engine: engine, serverless_cache_name: serverless_cache_name, cache_usage_limits: cache_usage_limits, daily_snapshot_time: daily_snapshot_time, description: description, kms_key_id: kms_key_id, major_engine_version: major_engine_version, security_group_ids: security_group_ids, snapshot_arns_to_restore: snapshot_arns_to_restore, snapshot_retention_limit: snapshot_retention_limit, subnet_ids: subnet_ids, tags: tags, user_group_id: user_group_id)
        create_serverless_cache(input)
      end
      def create_serverless_cache(input : Types::CreateServerlessCacheRequest) : Types::CreateServerlessCacheResponse
        request = Protocol::Query.build_request(Model::CREATE_SERVERLESS_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateServerlessCacheResponse, "CreateServerlessCache")
      end

      # This API creates a copy of an entire ServerlessCache at a specific moment in time. Available for
      # Valkey, Redis OSS and Serverless Memcached only.
      def create_serverless_cache_snapshot(
        serverless_cache_name : String,
        serverless_cache_snapshot_name : String,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateServerlessCacheSnapshotResponse
        input = Types::CreateServerlessCacheSnapshotRequest.new(serverless_cache_name: serverless_cache_name, serverless_cache_snapshot_name: serverless_cache_snapshot_name, kms_key_id: kms_key_id, tags: tags)
        create_serverless_cache_snapshot(input)
      end
      def create_serverless_cache_snapshot(input : Types::CreateServerlessCacheSnapshotRequest) : Types::CreateServerlessCacheSnapshotResponse
        request = Protocol::Query.build_request(Model::CREATE_SERVERLESS_CACHE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateServerlessCacheSnapshotResponse, "CreateServerlessCacheSnapshot")
      end

      # Creates a copy of an entire cluster or replication group at a specific moment in time. This
      # operation is valid for Valkey or Redis OSS only.
      def create_snapshot(
        snapshot_name : String,
        cache_cluster_id : String? = nil,
        kms_key_id : String? = nil,
        replication_group_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSnapshotResult
        input = Types::CreateSnapshotMessage.new(snapshot_name: snapshot_name, cache_cluster_id: cache_cluster_id, kms_key_id: kms_key_id, replication_group_id: replication_group_id, tags: tags)
        create_snapshot(input)
      end
      def create_snapshot(input : Types::CreateSnapshotMessage) : Types::CreateSnapshotResult
        request = Protocol::Query.build_request(Model::CREATE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateSnapshotResult, "CreateSnapshot")
      end

      # For Valkey engine version 7.2 onwards and Redis OSS 6.0 to 7.1: Creates a user. For more
      # information, see Using Role Based Access Control (RBAC) .
      def create_user(
        access_string : String,
        engine : String,
        user_id : String,
        user_name : String,
        authentication_mode : Types::AuthenticationMode? = nil,
        no_password_required : Bool? = nil,
        passwords : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::User
        input = Types::CreateUserMessage.new(access_string: access_string, engine: engine, user_id: user_id, user_name: user_name, authentication_mode: authentication_mode, no_password_required: no_password_required, passwords: passwords, tags: tags)
        create_user(input)
      end
      def create_user(input : Types::CreateUserMessage) : Types::User
        request = Protocol::Query.build_request(Model::CREATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::User, "CreateUser")
      end

      # For Valkey engine version 7.2 onwards and Redis OSS 6.0 to 7.1: Creates a user group. For more
      # information, see Using Role Based Access Control (RBAC)
      def create_user_group(
        engine : String,
        user_group_id : String,
        tags : Array(Types::Tag)? = nil,
        user_ids : Array(String)? = nil
      ) : Types::UserGroup
        input = Types::CreateUserGroupMessage.new(engine: engine, user_group_id: user_group_id, tags: tags, user_ids: user_ids)
        create_user_group(input)
      end
      def create_user_group(input : Types::CreateUserGroupMessage) : Types::UserGroup
        request = Protocol::Query.build_request(Model::CREATE_USER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UserGroup, "CreateUserGroup")
      end

      # Decreases the number of node groups in a Global datastore
      def decrease_node_groups_in_global_replication_group(
        apply_immediately : Bool,
        global_replication_group_id : String,
        node_group_count : Int32,
        global_node_groups_to_remove : Array(String)? = nil,
        global_node_groups_to_retain : Array(String)? = nil
      ) : Types::DecreaseNodeGroupsInGlobalReplicationGroupResult
        input = Types::DecreaseNodeGroupsInGlobalReplicationGroupMessage.new(apply_immediately: apply_immediately, global_replication_group_id: global_replication_group_id, node_group_count: node_group_count, global_node_groups_to_remove: global_node_groups_to_remove, global_node_groups_to_retain: global_node_groups_to_retain)
        decrease_node_groups_in_global_replication_group(input)
      end
      def decrease_node_groups_in_global_replication_group(input : Types::DecreaseNodeGroupsInGlobalReplicationGroupMessage) : Types::DecreaseNodeGroupsInGlobalReplicationGroupResult
        request = Protocol::Query.build_request(Model::DECREASE_NODE_GROUPS_IN_GLOBAL_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DecreaseNodeGroupsInGlobalReplicationGroupResult, "DecreaseNodeGroupsInGlobalReplicationGroup")
      end

      # Dynamically decreases the number of replicas in a Valkey or Redis OSS (cluster mode disabled)
      # replication group or the number of replica nodes in one or more node groups (shards) of a Valkey or
      # Redis OSS (cluster mode enabled) replication group. This operation is performed with no cluster down
      # time.
      def decrease_replica_count(
        apply_immediately : Bool,
        replication_group_id : String,
        new_replica_count : Int32? = nil,
        replica_configuration : Array(Types::ConfigureShard)? = nil,
        replicas_to_remove : Array(String)? = nil
      ) : Types::DecreaseReplicaCountResult
        input = Types::DecreaseReplicaCountMessage.new(apply_immediately: apply_immediately, replication_group_id: replication_group_id, new_replica_count: new_replica_count, replica_configuration: replica_configuration, replicas_to_remove: replicas_to_remove)
        decrease_replica_count(input)
      end
      def decrease_replica_count(input : Types::DecreaseReplicaCountMessage) : Types::DecreaseReplicaCountResult
        request = Protocol::Query.build_request(Model::DECREASE_REPLICA_COUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DecreaseReplicaCountResult, "DecreaseReplicaCount")
      end

      # Deletes a previously provisioned cluster. DeleteCacheCluster deletes all associated cache nodes,
      # node endpoints and the cluster itself. When you receive a successful response from this operation,
      # Amazon ElastiCache immediately begins deleting the cluster; you cannot cancel or revert this
      # operation. This operation is not valid for: Valkey or Redis OSS (cluster mode enabled) clusters
      # Valkey or Redis OSS (cluster mode disabled) clusters A cluster that is the last read replica of a
      # replication group A cluster that is the primary node of a replication group A node group (shard)
      # that has Multi-AZ mode enabled A cluster from a Valkey or Redis OSS (cluster mode enabled)
      # replication group A cluster that is not in the available state
      def delete_cache_cluster(
        cache_cluster_id : String,
        final_snapshot_identifier : String? = nil
      ) : Types::DeleteCacheClusterResult
        input = Types::DeleteCacheClusterMessage.new(cache_cluster_id: cache_cluster_id, final_snapshot_identifier: final_snapshot_identifier)
        delete_cache_cluster(input)
      end
      def delete_cache_cluster(input : Types::DeleteCacheClusterMessage) : Types::DeleteCacheClusterResult
        request = Protocol::Query.build_request(Model::DELETE_CACHE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteCacheClusterResult, "DeleteCacheCluster")
      end

      # Deletes the specified cache parameter group. You cannot delete a cache parameter group if it is
      # associated with any cache clusters. You cannot delete the default cache parameter groups in your
      # account.
      def delete_cache_parameter_group(
        cache_parameter_group_name : String
      ) : Nil
        input = Types::DeleteCacheParameterGroupMessage.new(cache_parameter_group_name: cache_parameter_group_name)
        delete_cache_parameter_group(input)
      end
      def delete_cache_parameter_group(input : Types::DeleteCacheParameterGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_CACHE_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a cache security group. You cannot delete a cache security group if it is associated with
      # any clusters.
      def delete_cache_security_group(
        cache_security_group_name : String
      ) : Nil
        input = Types::DeleteCacheSecurityGroupMessage.new(cache_security_group_name: cache_security_group_name)
        delete_cache_security_group(input)
      end
      def delete_cache_security_group(input : Types::DeleteCacheSecurityGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_CACHE_SECURITY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a cache subnet group. You cannot delete a default cache subnet group or one that is
      # associated with any clusters.
      def delete_cache_subnet_group(
        cache_subnet_group_name : String
      ) : Nil
        input = Types::DeleteCacheSubnetGroupMessage.new(cache_subnet_group_name: cache_subnet_group_name)
        delete_cache_subnet_group(input)
      end
      def delete_cache_subnet_group(input : Types::DeleteCacheSubnetGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_CACHE_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deleting a Global datastore is a two-step process: First, you must
      # DisassociateGlobalReplicationGroup to remove the secondary clusters in the Global datastore. Once
      # the Global datastore contains only the primary cluster, you can use the DeleteGlobalReplicationGroup
      # API to delete the Global datastore while retainining the primary cluster using
      # RetainPrimaryReplicationGroup=true . Since the Global Datastore has only a primary cluster, you can
      # delete the Global Datastore while retaining the primary by setting
      # RetainPrimaryReplicationGroup=true . The primary cluster is never deleted when deleting a Global
      # Datastore. It can only be deleted when it no longer is associated with any Global Datastore. When
      # you receive a successful response from this operation, Amazon ElastiCache immediately begins
      # deleting the selected resources; you cannot cancel or revert this operation.
      def delete_global_replication_group(
        global_replication_group_id : String,
        retain_primary_replication_group : Bool
      ) : Types::DeleteGlobalReplicationGroupResult
        input = Types::DeleteGlobalReplicationGroupMessage.new(global_replication_group_id: global_replication_group_id, retain_primary_replication_group: retain_primary_replication_group)
        delete_global_replication_group(input)
      end
      def delete_global_replication_group(input : Types::DeleteGlobalReplicationGroupMessage) : Types::DeleteGlobalReplicationGroupResult
        request = Protocol::Query.build_request(Model::DELETE_GLOBAL_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteGlobalReplicationGroupResult, "DeleteGlobalReplicationGroup")
      end

      # Deletes an existing replication group. By default, this operation deletes the entire replication
      # group, including the primary/primaries and all of the read replicas. If the replication group has
      # only one primary, you can optionally delete only the read replicas, while retaining the primary by
      # setting RetainPrimaryCluster=true . When you receive a successful response from this operation,
      # Amazon ElastiCache immediately begins deleting the selected resources; you cannot cancel or revert
      # this operation. CreateSnapshot permission is required to create a final snapshot. Without this
      # permission, the API call will fail with an Access Denied exception. This operation is valid for
      # Redis OSS only.
      def delete_replication_group(
        replication_group_id : String,
        final_snapshot_identifier : String? = nil,
        retain_primary_cluster : Bool? = nil
      ) : Types::DeleteReplicationGroupResult
        input = Types::DeleteReplicationGroupMessage.new(replication_group_id: replication_group_id, final_snapshot_identifier: final_snapshot_identifier, retain_primary_cluster: retain_primary_cluster)
        delete_replication_group(input)
      end
      def delete_replication_group(input : Types::DeleteReplicationGroupMessage) : Types::DeleteReplicationGroupResult
        request = Protocol::Query.build_request(Model::DELETE_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteReplicationGroupResult, "DeleteReplicationGroup")
      end

      # Deletes a specified existing serverless cache. CreateServerlessCacheSnapshot permission is required
      # to create a final snapshot. Without this permission, the API call will fail with an Access Denied
      # exception.
      def delete_serverless_cache(
        serverless_cache_name : String,
        final_snapshot_name : String? = nil
      ) : Types::DeleteServerlessCacheResponse
        input = Types::DeleteServerlessCacheRequest.new(serverless_cache_name: serverless_cache_name, final_snapshot_name: final_snapshot_name)
        delete_serverless_cache(input)
      end
      def delete_serverless_cache(input : Types::DeleteServerlessCacheRequest) : Types::DeleteServerlessCacheResponse
        request = Protocol::Query.build_request(Model::DELETE_SERVERLESS_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteServerlessCacheResponse, "DeleteServerlessCache")
      end

      # Deletes an existing serverless cache snapshot. Available for Valkey, Redis OSS and Serverless
      # Memcached only.
      def delete_serverless_cache_snapshot(
        serverless_cache_snapshot_name : String
      ) : Types::DeleteServerlessCacheSnapshotResponse
        input = Types::DeleteServerlessCacheSnapshotRequest.new(serverless_cache_snapshot_name: serverless_cache_snapshot_name)
        delete_serverless_cache_snapshot(input)
      end
      def delete_serverless_cache_snapshot(input : Types::DeleteServerlessCacheSnapshotRequest) : Types::DeleteServerlessCacheSnapshotResponse
        request = Protocol::Query.build_request(Model::DELETE_SERVERLESS_CACHE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteServerlessCacheSnapshotResponse, "DeleteServerlessCacheSnapshot")
      end

      # Deletes an existing snapshot. When you receive a successful response from this operation,
      # ElastiCache immediately begins deleting the snapshot; you cannot cancel or revert this operation.
      # This operation is valid for Valkey or Redis OSS only.
      def delete_snapshot(
        snapshot_name : String
      ) : Types::DeleteSnapshotResult
        input = Types::DeleteSnapshotMessage.new(snapshot_name: snapshot_name)
        delete_snapshot(input)
      end
      def delete_snapshot(input : Types::DeleteSnapshotMessage) : Types::DeleteSnapshotResult
        request = Protocol::Query.build_request(Model::DELETE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteSnapshotResult, "DeleteSnapshot")
      end

      # For Valkey engine version 7.2 onwards and Redis OSS 6.0 onwards: Deletes a user. The user will be
      # removed from all user groups and in turn removed from all replication groups. For more information,
      # see Using Role Based Access Control (RBAC) .
      def delete_user(
        user_id : String
      ) : Types::User
        input = Types::DeleteUserMessage.new(user_id: user_id)
        delete_user(input)
      end
      def delete_user(input : Types::DeleteUserMessage) : Types::User
        request = Protocol::Query.build_request(Model::DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::User, "DeleteUser")
      end

      # For Valkey engine version 7.2 onwards and Redis OSS 6.0 onwards: Deletes a user group. The user
      # group must first be disassociated from the replication group before it can be deleted. For more
      # information, see Using Role Based Access Control (RBAC) .
      def delete_user_group(
        user_group_id : String
      ) : Types::UserGroup
        input = Types::DeleteUserGroupMessage.new(user_group_id: user_group_id)
        delete_user_group(input)
      end
      def delete_user_group(input : Types::DeleteUserGroupMessage) : Types::UserGroup
        request = Protocol::Query.build_request(Model::DELETE_USER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UserGroup, "DeleteUserGroup")
      end

      # Returns information about all provisioned clusters if no cluster identifier is specified, or about a
      # specific cache cluster if a cluster identifier is supplied. By default, abbreviated information
      # about the clusters is returned. You can use the optional ShowCacheNodeInfo flag to retrieve detailed
      # information about the cache nodes associated with the clusters. These details include the DNS
      # address and port for the cache node endpoint. If the cluster is in the creating state, only
      # cluster-level information is displayed until all of the nodes are successfully provisioned. If the
      # cluster is in the deleting state, only cluster-level information is displayed. If cache nodes are
      # currently being added to the cluster, node endpoint information and creation time for the additional
      # nodes are not displayed until they are completely provisioned. When the cluster state is available ,
      # the cluster is ready for use. If cache nodes are currently being removed from the cluster, no
      # endpoint information for the removed nodes is displayed.
      def describe_cache_clusters(
        cache_cluster_id : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        show_cache_clusters_not_in_replication_groups : Bool? = nil,
        show_cache_node_info : Bool? = nil
      ) : Types::CacheClusterMessage
        input = Types::DescribeCacheClustersMessage.new(cache_cluster_id: cache_cluster_id, marker: marker, max_records: max_records, show_cache_clusters_not_in_replication_groups: show_cache_clusters_not_in_replication_groups, show_cache_node_info: show_cache_node_info)
        describe_cache_clusters(input)
      end
      def describe_cache_clusters(input : Types::DescribeCacheClustersMessage) : Types::CacheClusterMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CACHE_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CacheClusterMessage, "DescribeCacheClusters")
      end

      # Returns a list of the available cache engines and their versions.
      def describe_cache_engine_versions(
        cache_parameter_group_family : String? = nil,
        default_only : Bool? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::CacheEngineVersionMessage
        input = Types::DescribeCacheEngineVersionsMessage.new(cache_parameter_group_family: cache_parameter_group_family, default_only: default_only, engine: engine, engine_version: engine_version, marker: marker, max_records: max_records)
        describe_cache_engine_versions(input)
      end
      def describe_cache_engine_versions(input : Types::DescribeCacheEngineVersionsMessage) : Types::CacheEngineVersionMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CACHE_ENGINE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CacheEngineVersionMessage, "DescribeCacheEngineVersions")
      end

      # Returns a list of cache parameter group descriptions. If a cache parameter group name is specified,
      # the list contains only the descriptions for that group.
      def describe_cache_parameter_groups(
        cache_parameter_group_name : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::CacheParameterGroupsMessage
        input = Types::DescribeCacheParameterGroupsMessage.new(cache_parameter_group_name: cache_parameter_group_name, marker: marker, max_records: max_records)
        describe_cache_parameter_groups(input)
      end
      def describe_cache_parameter_groups(input : Types::DescribeCacheParameterGroupsMessage) : Types::CacheParameterGroupsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CACHE_PARAMETER_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CacheParameterGroupsMessage, "DescribeCacheParameterGroups")
      end

      # Returns the detailed parameter list for a particular cache parameter group.
      def describe_cache_parameters(
        cache_parameter_group_name : String,
        marker : String? = nil,
        max_records : Int32? = nil,
        source : String? = nil
      ) : Types::CacheParameterGroupDetails
        input = Types::DescribeCacheParametersMessage.new(cache_parameter_group_name: cache_parameter_group_name, marker: marker, max_records: max_records, source: source)
        describe_cache_parameters(input)
      end
      def describe_cache_parameters(input : Types::DescribeCacheParametersMessage) : Types::CacheParameterGroupDetails
        request = Protocol::Query.build_request(Model::DESCRIBE_CACHE_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CacheParameterGroupDetails, "DescribeCacheParameters")
      end

      # Returns a list of cache security group descriptions. If a cache security group name is specified,
      # the list contains only the description of that group. This applicable only when you have ElastiCache
      # in Classic setup
      def describe_cache_security_groups(
        cache_security_group_name : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::CacheSecurityGroupMessage
        input = Types::DescribeCacheSecurityGroupsMessage.new(cache_security_group_name: cache_security_group_name, marker: marker, max_records: max_records)
        describe_cache_security_groups(input)
      end
      def describe_cache_security_groups(input : Types::DescribeCacheSecurityGroupsMessage) : Types::CacheSecurityGroupMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CACHE_SECURITY_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CacheSecurityGroupMessage, "DescribeCacheSecurityGroups")
      end

      # Returns a list of cache subnet group descriptions. If a subnet group name is specified, the list
      # contains only the description of that group. This is applicable only when you have ElastiCache in
      # VPC setup. All ElastiCache clusters now launch in VPC by default.
      def describe_cache_subnet_groups(
        cache_subnet_group_name : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::CacheSubnetGroupMessage
        input = Types::DescribeCacheSubnetGroupsMessage.new(cache_subnet_group_name: cache_subnet_group_name, marker: marker, max_records: max_records)
        describe_cache_subnet_groups(input)
      end
      def describe_cache_subnet_groups(input : Types::DescribeCacheSubnetGroupsMessage) : Types::CacheSubnetGroupMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CACHE_SUBNET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CacheSubnetGroupMessage, "DescribeCacheSubnetGroups")
      end

      # Returns the default engine and system parameter information for the specified cache engine.
      def describe_engine_default_parameters(
        cache_parameter_group_family : String,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeEngineDefaultParametersResult
        input = Types::DescribeEngineDefaultParametersMessage.new(cache_parameter_group_family: cache_parameter_group_family, marker: marker, max_records: max_records)
        describe_engine_default_parameters(input)
      end
      def describe_engine_default_parameters(input : Types::DescribeEngineDefaultParametersMessage) : Types::DescribeEngineDefaultParametersResult
        request = Protocol::Query.build_request(Model::DESCRIBE_ENGINE_DEFAULT_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeEngineDefaultParametersResult, "DescribeEngineDefaultParameters")
      end

      # Returns events related to clusters, cache security groups, and cache parameter groups. You can
      # obtain events specific to a particular cluster, cache security group, or cache parameter group by
      # providing the name as a parameter. By default, only the events occurring within the last hour are
      # returned; however, you can retrieve up to 14 days' worth of events if necessary.
      def describe_events(
        duration : Int32? = nil,
        end_time : Time? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        source_identifier : String? = nil,
        source_type : String? = nil,
        start_time : Time? = nil
      ) : Types::EventsMessage
        input = Types::DescribeEventsMessage.new(duration: duration, end_time: end_time, marker: marker, max_records: max_records, source_identifier: source_identifier, source_type: source_type, start_time: start_time)
        describe_events(input)
      end
      def describe_events(input : Types::DescribeEventsMessage) : Types::EventsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EventsMessage, "DescribeEvents")
      end

      # Returns information about a particular global replication group. If no identifier is specified,
      # returns information about all Global datastores.
      def describe_global_replication_groups(
        global_replication_group_id : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        show_member_info : Bool? = nil
      ) : Types::DescribeGlobalReplicationGroupsResult
        input = Types::DescribeGlobalReplicationGroupsMessage.new(global_replication_group_id: global_replication_group_id, marker: marker, max_records: max_records, show_member_info: show_member_info)
        describe_global_replication_groups(input)
      end
      def describe_global_replication_groups(input : Types::DescribeGlobalReplicationGroupsMessage) : Types::DescribeGlobalReplicationGroupsResult
        request = Protocol::Query.build_request(Model::DESCRIBE_GLOBAL_REPLICATION_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeGlobalReplicationGroupsResult, "DescribeGlobalReplicationGroups")
      end

      # Returns information about a particular replication group. If no identifier is specified,
      # DescribeReplicationGroups returns information about all replication groups. This operation is valid
      # for Valkey or Redis OSS only.
      def describe_replication_groups(
        marker : String? = nil,
        max_records : Int32? = nil,
        replication_group_id : String? = nil
      ) : Types::ReplicationGroupMessage
        input = Types::DescribeReplicationGroupsMessage.new(marker: marker, max_records: max_records, replication_group_id: replication_group_id)
        describe_replication_groups(input)
      end
      def describe_replication_groups(input : Types::DescribeReplicationGroupsMessage) : Types::ReplicationGroupMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_REPLICATION_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ReplicationGroupMessage, "DescribeReplicationGroups")
      end

      # Returns information about reserved cache nodes for this account, or about a specified reserved cache
      # node.
      def describe_reserved_cache_nodes(
        cache_node_type : String? = nil,
        duration : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        offering_type : String? = nil,
        product_description : String? = nil,
        reserved_cache_node_id : String? = nil,
        reserved_cache_nodes_offering_id : String? = nil
      ) : Types::ReservedCacheNodeMessage
        input = Types::DescribeReservedCacheNodesMessage.new(cache_node_type: cache_node_type, duration: duration, marker: marker, max_records: max_records, offering_type: offering_type, product_description: product_description, reserved_cache_node_id: reserved_cache_node_id, reserved_cache_nodes_offering_id: reserved_cache_nodes_offering_id)
        describe_reserved_cache_nodes(input)
      end
      def describe_reserved_cache_nodes(input : Types::DescribeReservedCacheNodesMessage) : Types::ReservedCacheNodeMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_RESERVED_CACHE_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ReservedCacheNodeMessage, "DescribeReservedCacheNodes")
      end

      # Lists available reserved cache node offerings.
      def describe_reserved_cache_nodes_offerings(
        cache_node_type : String? = nil,
        duration : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        offering_type : String? = nil,
        product_description : String? = nil,
        reserved_cache_nodes_offering_id : String? = nil
      ) : Types::ReservedCacheNodesOfferingMessage
        input = Types::DescribeReservedCacheNodesOfferingsMessage.new(cache_node_type: cache_node_type, duration: duration, marker: marker, max_records: max_records, offering_type: offering_type, product_description: product_description, reserved_cache_nodes_offering_id: reserved_cache_nodes_offering_id)
        describe_reserved_cache_nodes_offerings(input)
      end
      def describe_reserved_cache_nodes_offerings(input : Types::DescribeReservedCacheNodesOfferingsMessage) : Types::ReservedCacheNodesOfferingMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_RESERVED_CACHE_NODES_OFFERINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ReservedCacheNodesOfferingMessage, "DescribeReservedCacheNodesOfferings")
      end

      # Returns information about serverless cache snapshots. By default, this API lists all of the
      # customer’s serverless cache snapshots. It can also describe a single serverless cache snapshot, or
      # the snapshots associated with a particular serverless cache. Available for Valkey, Redis OSS and
      # Serverless Memcached only.
      def describe_serverless_cache_snapshots(
        max_results : Int32? = nil,
        next_token : String? = nil,
        serverless_cache_name : String? = nil,
        serverless_cache_snapshot_name : String? = nil,
        snapshot_type : String? = nil
      ) : Types::DescribeServerlessCacheSnapshotsResponse
        input = Types::DescribeServerlessCacheSnapshotsRequest.new(max_results: max_results, next_token: next_token, serverless_cache_name: serverless_cache_name, serverless_cache_snapshot_name: serverless_cache_snapshot_name, snapshot_type: snapshot_type)
        describe_serverless_cache_snapshots(input)
      end
      def describe_serverless_cache_snapshots(input : Types::DescribeServerlessCacheSnapshotsRequest) : Types::DescribeServerlessCacheSnapshotsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_SERVERLESS_CACHE_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeServerlessCacheSnapshotsResponse, "DescribeServerlessCacheSnapshots")
      end

      # Returns information about a specific serverless cache. If no identifier is specified, then the API
      # returns information on all the serverless caches belonging to this Amazon Web Services account.
      def describe_serverless_caches(
        max_results : Int32? = nil,
        next_token : String? = nil,
        serverless_cache_name : String? = nil
      ) : Types::DescribeServerlessCachesResponse
        input = Types::DescribeServerlessCachesRequest.new(max_results: max_results, next_token: next_token, serverless_cache_name: serverless_cache_name)
        describe_serverless_caches(input)
      end
      def describe_serverless_caches(input : Types::DescribeServerlessCachesRequest) : Types::DescribeServerlessCachesResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_SERVERLESS_CACHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeServerlessCachesResponse, "DescribeServerlessCaches")
      end

      # Returns details of the service updates
      def describe_service_updates(
        marker : String? = nil,
        max_records : Int32? = nil,
        service_update_name : String? = nil,
        service_update_status : Array(String)? = nil
      ) : Types::ServiceUpdatesMessage
        input = Types::DescribeServiceUpdatesMessage.new(marker: marker, max_records: max_records, service_update_name: service_update_name, service_update_status: service_update_status)
        describe_service_updates(input)
      end
      def describe_service_updates(input : Types::DescribeServiceUpdatesMessage) : Types::ServiceUpdatesMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_SERVICE_UPDATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ServiceUpdatesMessage, "DescribeServiceUpdates")
      end

      # Returns information about cluster or replication group snapshots. By default, DescribeSnapshots
      # lists all of your snapshots; it can optionally describe a single snapshot, or just the snapshots
      # associated with a particular cache cluster. This operation is valid for Valkey or Redis OSS only.
      def describe_snapshots(
        cache_cluster_id : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        replication_group_id : String? = nil,
        show_node_group_config : Bool? = nil,
        snapshot_name : String? = nil,
        snapshot_source : String? = nil
      ) : Types::DescribeSnapshotsListMessage
        input = Types::DescribeSnapshotsMessage.new(cache_cluster_id: cache_cluster_id, marker: marker, max_records: max_records, replication_group_id: replication_group_id, show_node_group_config: show_node_group_config, snapshot_name: snapshot_name, snapshot_source: snapshot_source)
        describe_snapshots(input)
      end
      def describe_snapshots(input : Types::DescribeSnapshotsMessage) : Types::DescribeSnapshotsListMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeSnapshotsListMessage, "DescribeSnapshots")
      end

      # Returns details of the update actions
      def describe_update_actions(
        cache_cluster_ids : Array(String)? = nil,
        engine : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        replication_group_ids : Array(String)? = nil,
        service_update_name : String? = nil,
        service_update_status : Array(String)? = nil,
        service_update_time_range : Types::TimeRangeFilter? = nil,
        show_node_level_update_status : Bool? = nil,
        update_action_status : Array(String)? = nil
      ) : Types::UpdateActionsMessage
        input = Types::DescribeUpdateActionsMessage.new(cache_cluster_ids: cache_cluster_ids, engine: engine, marker: marker, max_records: max_records, replication_group_ids: replication_group_ids, service_update_name: service_update_name, service_update_status: service_update_status, service_update_time_range: service_update_time_range, show_node_level_update_status: show_node_level_update_status, update_action_status: update_action_status)
        describe_update_actions(input)
      end
      def describe_update_actions(input : Types::DescribeUpdateActionsMessage) : Types::UpdateActionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_UPDATE_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateActionsMessage, "DescribeUpdateActions")
      end

      # Returns a list of user groups.
      def describe_user_groups(
        marker : String? = nil,
        max_records : Int32? = nil,
        user_group_id : String? = nil
      ) : Types::DescribeUserGroupsResult
        input = Types::DescribeUserGroupsMessage.new(marker: marker, max_records: max_records, user_group_id: user_group_id)
        describe_user_groups(input)
      end
      def describe_user_groups(input : Types::DescribeUserGroupsMessage) : Types::DescribeUserGroupsResult
        request = Protocol::Query.build_request(Model::DESCRIBE_USER_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeUserGroupsResult, "DescribeUserGroups")
      end

      # Returns a list of users.
      def describe_users(
        engine : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        user_id : String? = nil
      ) : Types::DescribeUsersResult
        input = Types::DescribeUsersMessage.new(engine: engine, filters: filters, marker: marker, max_records: max_records, user_id: user_id)
        describe_users(input)
      end
      def describe_users(input : Types::DescribeUsersMessage) : Types::DescribeUsersResult
        request = Protocol::Query.build_request(Model::DESCRIBE_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeUsersResult, "DescribeUsers")
      end

      # Remove a secondary cluster from the Global datastore using the Global datastore name. The secondary
      # cluster will no longer receive updates from the primary cluster, but will remain as a standalone
      # cluster in that Amazon region.
      def disassociate_global_replication_group(
        global_replication_group_id : String,
        replication_group_id : String,
        replication_group_region : String
      ) : Types::DisassociateGlobalReplicationGroupResult
        input = Types::DisassociateGlobalReplicationGroupMessage.new(global_replication_group_id: global_replication_group_id, replication_group_id: replication_group_id, replication_group_region: replication_group_region)
        disassociate_global_replication_group(input)
      end
      def disassociate_global_replication_group(input : Types::DisassociateGlobalReplicationGroupMessage) : Types::DisassociateGlobalReplicationGroupResult
        request = Protocol::Query.build_request(Model::DISASSOCIATE_GLOBAL_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DisassociateGlobalReplicationGroupResult, "DisassociateGlobalReplicationGroup")
      end

      # Provides the functionality to export the serverless cache snapshot data to Amazon S3. Available for
      # Valkey and Redis OSS only.
      def export_serverless_cache_snapshot(
        s3_bucket_name : String,
        serverless_cache_snapshot_name : String
      ) : Types::ExportServerlessCacheSnapshotResponse
        input = Types::ExportServerlessCacheSnapshotRequest.new(s3_bucket_name: s3_bucket_name, serverless_cache_snapshot_name: serverless_cache_snapshot_name)
        export_serverless_cache_snapshot(input)
      end
      def export_serverless_cache_snapshot(input : Types::ExportServerlessCacheSnapshotRequest) : Types::ExportServerlessCacheSnapshotResponse
        request = Protocol::Query.build_request(Model::EXPORT_SERVERLESS_CACHE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ExportServerlessCacheSnapshotResponse, "ExportServerlessCacheSnapshot")
      end

      # Used to failover the primary region to a secondary region. The secondary region will become primary,
      # and all other clusters will become secondary.
      def failover_global_replication_group(
        global_replication_group_id : String,
        primary_region : String,
        primary_replication_group_id : String
      ) : Types::FailoverGlobalReplicationGroupResult
        input = Types::FailoverGlobalReplicationGroupMessage.new(global_replication_group_id: global_replication_group_id, primary_region: primary_region, primary_replication_group_id: primary_replication_group_id)
        failover_global_replication_group(input)
      end
      def failover_global_replication_group(input : Types::FailoverGlobalReplicationGroupMessage) : Types::FailoverGlobalReplicationGroupResult
        request = Protocol::Query.build_request(Model::FAILOVER_GLOBAL_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::FailoverGlobalReplicationGroupResult, "FailoverGlobalReplicationGroup")
      end

      # Increase the number of node groups in the Global datastore
      def increase_node_groups_in_global_replication_group(
        apply_immediately : Bool,
        global_replication_group_id : String,
        node_group_count : Int32,
        regional_configurations : Array(Types::RegionalConfiguration)? = nil
      ) : Types::IncreaseNodeGroupsInGlobalReplicationGroupResult
        input = Types::IncreaseNodeGroupsInGlobalReplicationGroupMessage.new(apply_immediately: apply_immediately, global_replication_group_id: global_replication_group_id, node_group_count: node_group_count, regional_configurations: regional_configurations)
        increase_node_groups_in_global_replication_group(input)
      end
      def increase_node_groups_in_global_replication_group(input : Types::IncreaseNodeGroupsInGlobalReplicationGroupMessage) : Types::IncreaseNodeGroupsInGlobalReplicationGroupResult
        request = Protocol::Query.build_request(Model::INCREASE_NODE_GROUPS_IN_GLOBAL_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::IncreaseNodeGroupsInGlobalReplicationGroupResult, "IncreaseNodeGroupsInGlobalReplicationGroup")
      end

      # Dynamically increases the number of replicas in a Valkey or Redis OSS (cluster mode disabled)
      # replication group or the number of replica nodes in one or more node groups (shards) of a Valkey or
      # Redis OSS (cluster mode enabled) replication group. This operation is performed with no cluster down
      # time.
      def increase_replica_count(
        apply_immediately : Bool,
        replication_group_id : String,
        new_replica_count : Int32? = nil,
        replica_configuration : Array(Types::ConfigureShard)? = nil
      ) : Types::IncreaseReplicaCountResult
        input = Types::IncreaseReplicaCountMessage.new(apply_immediately: apply_immediately, replication_group_id: replication_group_id, new_replica_count: new_replica_count, replica_configuration: replica_configuration)
        increase_replica_count(input)
      end
      def increase_replica_count(input : Types::IncreaseReplicaCountMessage) : Types::IncreaseReplicaCountResult
        request = Protocol::Query.build_request(Model::INCREASE_REPLICA_COUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::IncreaseReplicaCountResult, "IncreaseReplicaCount")
      end

      # Lists all available node types that you can scale with your cluster's replication group's current
      # node type. When you use the ModifyCacheCluster or ModifyReplicationGroup operations to scale your
      # cluster or replication group, the value of the CacheNodeType parameter must be one of the node types
      # returned by this operation.
      def list_allowed_node_type_modifications(
        cache_cluster_id : String? = nil,
        replication_group_id : String? = nil
      ) : Types::AllowedNodeTypeModificationsMessage
        input = Types::ListAllowedNodeTypeModificationsMessage.new(cache_cluster_id: cache_cluster_id, replication_group_id: replication_group_id)
        list_allowed_node_type_modifications(input)
      end
      def list_allowed_node_type_modifications(input : Types::ListAllowedNodeTypeModificationsMessage) : Types::AllowedNodeTypeModificationsMessage
        request = Protocol::Query.build_request(Model::LIST_ALLOWED_NODE_TYPE_MODIFICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AllowedNodeTypeModificationsMessage, "ListAllowedNodeTypeModifications")
      end

      # Lists all tags currently on a named resource. A tag is a key-value pair where the key and value are
      # case-sensitive. You can use tags to categorize and track all your ElastiCache resources, with the
      # exception of global replication group. When you add or remove tags on replication groups, those
      # actions will be replicated to all nodes in the replication group. For more information, see
      # Resource-level permissions . If the cluster is not in the available state, ListTagsForResource
      # returns an error.
      def list_tags_for_resource(
        resource_name : String
      ) : Types::TagListMessage
        input = Types::ListTagsForResourceMessage.new(resource_name: resource_name)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceMessage) : Types::TagListMessage
        request = Protocol::Query.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TagListMessage, "ListTagsForResource")
      end

      # Modifies the settings for a cluster. You can use this operation to change one or more cluster
      # configuration parameters by specifying the parameters and the new values.
      def modify_cache_cluster(
        cache_cluster_id : String,
        az_mode : String? = nil,
        apply_immediately : Bool? = nil,
        auth_token : String? = nil,
        auth_token_update_strategy : String? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        cache_node_ids_to_remove : Array(String)? = nil,
        cache_node_type : String? = nil,
        cache_parameter_group_name : String? = nil,
        cache_security_group_names : Array(String)? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        ip_discovery : String? = nil,
        log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)? = nil,
        new_availability_zones : Array(String)? = nil,
        notification_topic_arn : String? = nil,
        notification_topic_status : String? = nil,
        num_cache_nodes : Int32? = nil,
        preferred_maintenance_window : String? = nil,
        scale_config : Types::ScaleConfig? = nil,
        security_group_ids : Array(String)? = nil,
        snapshot_retention_limit : Int32? = nil,
        snapshot_window : String? = nil
      ) : Types::ModifyCacheClusterResult
        input = Types::ModifyCacheClusterMessage.new(cache_cluster_id: cache_cluster_id, az_mode: az_mode, apply_immediately: apply_immediately, auth_token: auth_token, auth_token_update_strategy: auth_token_update_strategy, auto_minor_version_upgrade: auto_minor_version_upgrade, cache_node_ids_to_remove: cache_node_ids_to_remove, cache_node_type: cache_node_type, cache_parameter_group_name: cache_parameter_group_name, cache_security_group_names: cache_security_group_names, engine: engine, engine_version: engine_version, ip_discovery: ip_discovery, log_delivery_configurations: log_delivery_configurations, new_availability_zones: new_availability_zones, notification_topic_arn: notification_topic_arn, notification_topic_status: notification_topic_status, num_cache_nodes: num_cache_nodes, preferred_maintenance_window: preferred_maintenance_window, scale_config: scale_config, security_group_ids: security_group_ids, snapshot_retention_limit: snapshot_retention_limit, snapshot_window: snapshot_window)
        modify_cache_cluster(input)
      end
      def modify_cache_cluster(input : Types::ModifyCacheClusterMessage) : Types::ModifyCacheClusterResult
        request = Protocol::Query.build_request(Model::MODIFY_CACHE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyCacheClusterResult, "ModifyCacheCluster")
      end

      # Modifies the parameters of a cache parameter group. You can modify up to 20 parameters in a single
      # request by submitting a list parameter name and value pairs.
      def modify_cache_parameter_group(
        cache_parameter_group_name : String,
        parameter_name_values : Array(Types::ParameterNameValue)
      ) : Types::CacheParameterGroupNameMessage
        input = Types::ModifyCacheParameterGroupMessage.new(cache_parameter_group_name: cache_parameter_group_name, parameter_name_values: parameter_name_values)
        modify_cache_parameter_group(input)
      end
      def modify_cache_parameter_group(input : Types::ModifyCacheParameterGroupMessage) : Types::CacheParameterGroupNameMessage
        request = Protocol::Query.build_request(Model::MODIFY_CACHE_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CacheParameterGroupNameMessage, "ModifyCacheParameterGroup")
      end

      # Modifies an existing cache subnet group.
      def modify_cache_subnet_group(
        cache_subnet_group_name : String,
        cache_subnet_group_description : String? = nil,
        subnet_ids : Array(String)? = nil
      ) : Types::ModifyCacheSubnetGroupResult
        input = Types::ModifyCacheSubnetGroupMessage.new(cache_subnet_group_name: cache_subnet_group_name, cache_subnet_group_description: cache_subnet_group_description, subnet_ids: subnet_ids)
        modify_cache_subnet_group(input)
      end
      def modify_cache_subnet_group(input : Types::ModifyCacheSubnetGroupMessage) : Types::ModifyCacheSubnetGroupResult
        request = Protocol::Query.build_request(Model::MODIFY_CACHE_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyCacheSubnetGroupResult, "ModifyCacheSubnetGroup")
      end

      # Modifies the settings for a Global datastore.
      def modify_global_replication_group(
        apply_immediately : Bool,
        global_replication_group_id : String,
        automatic_failover_enabled : Bool? = nil,
        cache_node_type : String? = nil,
        cache_parameter_group_name : String? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        global_replication_group_description : String? = nil
      ) : Types::ModifyGlobalReplicationGroupResult
        input = Types::ModifyGlobalReplicationGroupMessage.new(apply_immediately: apply_immediately, global_replication_group_id: global_replication_group_id, automatic_failover_enabled: automatic_failover_enabled, cache_node_type: cache_node_type, cache_parameter_group_name: cache_parameter_group_name, engine: engine, engine_version: engine_version, global_replication_group_description: global_replication_group_description)
        modify_global_replication_group(input)
      end
      def modify_global_replication_group(input : Types::ModifyGlobalReplicationGroupMessage) : Types::ModifyGlobalReplicationGroupResult
        request = Protocol::Query.build_request(Model::MODIFY_GLOBAL_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyGlobalReplicationGroupResult, "ModifyGlobalReplicationGroup")
      end

      # Modifies the settings for a replication group. This is limited to Valkey and Redis OSS 7 and above.
      # Scaling for Valkey or Redis OSS (cluster mode enabled) in the ElastiCache User Guide
      # ModifyReplicationGroupShardConfiguration in the ElastiCache API Reference This operation is valid
      # for Valkey or Redis OSS only.
      def modify_replication_group(
        replication_group_id : String,
        apply_immediately : Bool? = nil,
        auth_token : String? = nil,
        auth_token_update_strategy : String? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        automatic_failover_enabled : Bool? = nil,
        cache_node_type : String? = nil,
        cache_parameter_group_name : String? = nil,
        cache_security_group_names : Array(String)? = nil,
        cluster_mode : String? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        ip_discovery : String? = nil,
        log_delivery_configurations : Array(Types::LogDeliveryConfigurationRequest)? = nil,
        multi_az_enabled : Bool? = nil,
        node_group_id : String? = nil,
        notification_topic_arn : String? = nil,
        notification_topic_status : String? = nil,
        preferred_maintenance_window : String? = nil,
        primary_cluster_id : String? = nil,
        remove_user_groups : Bool? = nil,
        replication_group_description : String? = nil,
        security_group_ids : Array(String)? = nil,
        snapshot_retention_limit : Int32? = nil,
        snapshot_window : String? = nil,
        snapshotting_cluster_id : String? = nil,
        transit_encryption_enabled : Bool? = nil,
        transit_encryption_mode : String? = nil,
        user_group_ids_to_add : Array(String)? = nil,
        user_group_ids_to_remove : Array(String)? = nil
      ) : Types::ModifyReplicationGroupResult
        input = Types::ModifyReplicationGroupMessage.new(replication_group_id: replication_group_id, apply_immediately: apply_immediately, auth_token: auth_token, auth_token_update_strategy: auth_token_update_strategy, auto_minor_version_upgrade: auto_minor_version_upgrade, automatic_failover_enabled: automatic_failover_enabled, cache_node_type: cache_node_type, cache_parameter_group_name: cache_parameter_group_name, cache_security_group_names: cache_security_group_names, cluster_mode: cluster_mode, engine: engine, engine_version: engine_version, ip_discovery: ip_discovery, log_delivery_configurations: log_delivery_configurations, multi_az_enabled: multi_az_enabled, node_group_id: node_group_id, notification_topic_arn: notification_topic_arn, notification_topic_status: notification_topic_status, preferred_maintenance_window: preferred_maintenance_window, primary_cluster_id: primary_cluster_id, remove_user_groups: remove_user_groups, replication_group_description: replication_group_description, security_group_ids: security_group_ids, snapshot_retention_limit: snapshot_retention_limit, snapshot_window: snapshot_window, snapshotting_cluster_id: snapshotting_cluster_id, transit_encryption_enabled: transit_encryption_enabled, transit_encryption_mode: transit_encryption_mode, user_group_ids_to_add: user_group_ids_to_add, user_group_ids_to_remove: user_group_ids_to_remove)
        modify_replication_group(input)
      end
      def modify_replication_group(input : Types::ModifyReplicationGroupMessage) : Types::ModifyReplicationGroupResult
        request = Protocol::Query.build_request(Model::MODIFY_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyReplicationGroupResult, "ModifyReplicationGroup")
      end

      # Modifies a replication group's shards (node groups) by allowing you to add shards, remove shards, or
      # rebalance the keyspaces among existing shards.
      def modify_replication_group_shard_configuration(
        apply_immediately : Bool,
        node_group_count : Int32,
        replication_group_id : String,
        node_groups_to_remove : Array(String)? = nil,
        node_groups_to_retain : Array(String)? = nil,
        resharding_configuration : Array(Types::ReshardingConfiguration)? = nil
      ) : Types::ModifyReplicationGroupShardConfigurationResult
        input = Types::ModifyReplicationGroupShardConfigurationMessage.new(apply_immediately: apply_immediately, node_group_count: node_group_count, replication_group_id: replication_group_id, node_groups_to_remove: node_groups_to_remove, node_groups_to_retain: node_groups_to_retain, resharding_configuration: resharding_configuration)
        modify_replication_group_shard_configuration(input)
      end
      def modify_replication_group_shard_configuration(input : Types::ModifyReplicationGroupShardConfigurationMessage) : Types::ModifyReplicationGroupShardConfigurationResult
        request = Protocol::Query.build_request(Model::MODIFY_REPLICATION_GROUP_SHARD_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyReplicationGroupShardConfigurationResult, "ModifyReplicationGroupShardConfiguration")
      end

      # This API modifies the attributes of a serverless cache.
      def modify_serverless_cache(
        serverless_cache_name : String,
        cache_usage_limits : Types::CacheUsageLimits? = nil,
        daily_snapshot_time : String? = nil,
        description : String? = nil,
        engine : String? = nil,
        major_engine_version : String? = nil,
        remove_user_group : Bool? = nil,
        security_group_ids : Array(String)? = nil,
        snapshot_retention_limit : Int32? = nil,
        user_group_id : String? = nil
      ) : Types::ModifyServerlessCacheResponse
        input = Types::ModifyServerlessCacheRequest.new(serverless_cache_name: serverless_cache_name, cache_usage_limits: cache_usage_limits, daily_snapshot_time: daily_snapshot_time, description: description, engine: engine, major_engine_version: major_engine_version, remove_user_group: remove_user_group, security_group_ids: security_group_ids, snapshot_retention_limit: snapshot_retention_limit, user_group_id: user_group_id)
        modify_serverless_cache(input)
      end
      def modify_serverless_cache(input : Types::ModifyServerlessCacheRequest) : Types::ModifyServerlessCacheResponse
        request = Protocol::Query.build_request(Model::MODIFY_SERVERLESS_CACHE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyServerlessCacheResponse, "ModifyServerlessCache")
      end

      # Changes user password(s) and/or access string.
      def modify_user(
        user_id : String,
        access_string : String? = nil,
        append_access_string : String? = nil,
        authentication_mode : Types::AuthenticationMode? = nil,
        engine : String? = nil,
        no_password_required : Bool? = nil,
        passwords : Array(String)? = nil
      ) : Types::User
        input = Types::ModifyUserMessage.new(user_id: user_id, access_string: access_string, append_access_string: append_access_string, authentication_mode: authentication_mode, engine: engine, no_password_required: no_password_required, passwords: passwords)
        modify_user(input)
      end
      def modify_user(input : Types::ModifyUserMessage) : Types::User
        request = Protocol::Query.build_request(Model::MODIFY_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::User, "ModifyUser")
      end

      # Changes the list of users that belong to the user group.
      def modify_user_group(
        user_group_id : String,
        engine : String? = nil,
        user_ids_to_add : Array(String)? = nil,
        user_ids_to_remove : Array(String)? = nil
      ) : Types::UserGroup
        input = Types::ModifyUserGroupMessage.new(user_group_id: user_group_id, engine: engine, user_ids_to_add: user_ids_to_add, user_ids_to_remove: user_ids_to_remove)
        modify_user_group(input)
      end
      def modify_user_group(input : Types::ModifyUserGroupMessage) : Types::UserGroup
        request = Protocol::Query.build_request(Model::MODIFY_USER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UserGroup, "ModifyUserGroup")
      end

      # Allows you to purchase a reserved cache node offering. Reserved nodes are not eligible for
      # cancellation and are non-refundable. For more information, see Managing Costs with Reserved Nodes .
      def purchase_reserved_cache_nodes_offering(
        reserved_cache_nodes_offering_id : String,
        cache_node_count : Int32? = nil,
        reserved_cache_node_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PurchaseReservedCacheNodesOfferingResult
        input = Types::PurchaseReservedCacheNodesOfferingMessage.new(reserved_cache_nodes_offering_id: reserved_cache_nodes_offering_id, cache_node_count: cache_node_count, reserved_cache_node_id: reserved_cache_node_id, tags: tags)
        purchase_reserved_cache_nodes_offering(input)
      end
      def purchase_reserved_cache_nodes_offering(input : Types::PurchaseReservedCacheNodesOfferingMessage) : Types::PurchaseReservedCacheNodesOfferingResult
        request = Protocol::Query.build_request(Model::PURCHASE_RESERVED_CACHE_NODES_OFFERING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PurchaseReservedCacheNodesOfferingResult, "PurchaseReservedCacheNodesOffering")
      end

      # Redistribute slots to ensure uniform distribution across existing shards in the cluster.
      def rebalance_slots_in_global_replication_group(
        apply_immediately : Bool,
        global_replication_group_id : String
      ) : Types::RebalanceSlotsInGlobalReplicationGroupResult
        input = Types::RebalanceSlotsInGlobalReplicationGroupMessage.new(apply_immediately: apply_immediately, global_replication_group_id: global_replication_group_id)
        rebalance_slots_in_global_replication_group(input)
      end
      def rebalance_slots_in_global_replication_group(input : Types::RebalanceSlotsInGlobalReplicationGroupMessage) : Types::RebalanceSlotsInGlobalReplicationGroupResult
        request = Protocol::Query.build_request(Model::REBALANCE_SLOTS_IN_GLOBAL_REPLICATION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RebalanceSlotsInGlobalReplicationGroupResult, "RebalanceSlotsInGlobalReplicationGroup")
      end

      # Reboots some, or all, of the cache nodes within a provisioned cluster. This operation applies any
      # modified cache parameter groups to the cluster. The reboot operation takes place as soon as
      # possible, and results in a momentary outage to the cluster. During the reboot, the cluster status is
      # set to REBOOTING. The reboot causes the contents of the cache (for each cache node being rebooted)
      # to be lost. When the reboot is complete, a cluster event is created. Rebooting a cluster is
      # currently supported on Memcached, Valkey and Redis OSS (cluster mode disabled) clusters. Rebooting
      # is not supported on Valkey or Redis OSS (cluster mode enabled) clusters. If you make changes to
      # parameters that require a Valkey or Redis OSS (cluster mode enabled) cluster reboot for the changes
      # to be applied, see Rebooting a Cluster for an alternate process.
      def reboot_cache_cluster(
        cache_cluster_id : String,
        cache_node_ids_to_reboot : Array(String)
      ) : Types::RebootCacheClusterResult
        input = Types::RebootCacheClusterMessage.new(cache_cluster_id: cache_cluster_id, cache_node_ids_to_reboot: cache_node_ids_to_reboot)
        reboot_cache_cluster(input)
      end
      def reboot_cache_cluster(input : Types::RebootCacheClusterMessage) : Types::RebootCacheClusterResult
        request = Protocol::Query.build_request(Model::REBOOT_CACHE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RebootCacheClusterResult, "RebootCacheCluster")
      end

      # Removes the tags identified by the TagKeys list from the named resource. A tag is a key-value pair
      # where the key and value are case-sensitive. You can use tags to categorize and track all your
      # ElastiCache resources, with the exception of global replication group. When you add or remove tags
      # on replication groups, those actions will be replicated to all nodes in the replication group. For
      # more information, see Resource-level permissions .
      def remove_tags_from_resource(
        resource_name : String,
        tag_keys : Array(String)
      ) : Types::TagListMessage
        input = Types::RemoveTagsFromResourceMessage.new(resource_name: resource_name, tag_keys: tag_keys)
        remove_tags_from_resource(input)
      end
      def remove_tags_from_resource(input : Types::RemoveTagsFromResourceMessage) : Types::TagListMessage
        request = Protocol::Query.build_request(Model::REMOVE_TAGS_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TagListMessage, "RemoveTagsFromResource")
      end

      # Modifies the parameters of a cache parameter group to the engine or system default value. You can
      # reset specific parameters by submitting a list of parameter names. To reset the entire cache
      # parameter group, specify the ResetAllParameters and CacheParameterGroupName parameters.
      def reset_cache_parameter_group(
        cache_parameter_group_name : String,
        parameter_name_values : Array(Types::ParameterNameValue)? = nil,
        reset_all_parameters : Bool? = nil
      ) : Types::CacheParameterGroupNameMessage
        input = Types::ResetCacheParameterGroupMessage.new(cache_parameter_group_name: cache_parameter_group_name, parameter_name_values: parameter_name_values, reset_all_parameters: reset_all_parameters)
        reset_cache_parameter_group(input)
      end
      def reset_cache_parameter_group(input : Types::ResetCacheParameterGroupMessage) : Types::CacheParameterGroupNameMessage
        request = Protocol::Query.build_request(Model::RESET_CACHE_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CacheParameterGroupNameMessage, "ResetCacheParameterGroup")
      end

      # Revokes ingress from a cache security group. Use this operation to disallow access from an Amazon
      # EC2 security group that had been previously authorized.
      def revoke_cache_security_group_ingress(
        cache_security_group_name : String,
        ec2_security_group_name : String,
        ec2_security_group_owner_id : String
      ) : Types::RevokeCacheSecurityGroupIngressResult
        input = Types::RevokeCacheSecurityGroupIngressMessage.new(cache_security_group_name: cache_security_group_name, ec2_security_group_name: ec2_security_group_name, ec2_security_group_owner_id: ec2_security_group_owner_id)
        revoke_cache_security_group_ingress(input)
      end
      def revoke_cache_security_group_ingress(input : Types::RevokeCacheSecurityGroupIngressMessage) : Types::RevokeCacheSecurityGroupIngressResult
        request = Protocol::Query.build_request(Model::REVOKE_CACHE_SECURITY_GROUP_INGRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RevokeCacheSecurityGroupIngressResult, "RevokeCacheSecurityGroupIngress")
      end

      # Start the migration of data.
      def start_migration(
        customer_node_endpoint_list : Array(Types::CustomerNodeEndpoint),
        replication_group_id : String
      ) : Types::StartMigrationResponse
        input = Types::StartMigrationMessage.new(customer_node_endpoint_list: customer_node_endpoint_list, replication_group_id: replication_group_id)
        start_migration(input)
      end
      def start_migration(input : Types::StartMigrationMessage) : Types::StartMigrationResponse
        request = Protocol::Query.build_request(Model::START_MIGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StartMigrationResponse, "StartMigration")
      end

      # Represents the input of a TestFailover operation which tests automatic failover on a specified node
      # group (called shard in the console) in a replication group (called cluster in the console). This API
      # is designed for testing the behavior of your application in case of ElastiCache failover. It is not
      # designed to be an operational tool for initiating a failover to overcome a problem you may have with
      # the cluster. Moreover, in certain conditions such as large-scale operational events, Amazon may
      # block this API. Note the following A customer can use this operation to test automatic failover on
      # up to 15 shards (called node groups in the ElastiCache API and Amazon CLI) in any rolling 24-hour
      # period. If calling this operation on shards in different clusters (called replication groups in the
      # API and CLI), the calls can be made concurrently. If calling this operation multiple times on
      # different shards in the same Valkey or Redis OSS (cluster mode enabled) replication group, the first
      # node replacement must complete before a subsequent call can be made. To determine whether the node
      # replacement is complete you can check Events using the Amazon ElastiCache console, the Amazon CLI,
      # or the ElastiCache API. Look for the following automatic failover related events, listed here in
      # order of occurrance: Replication group message: Test Failover API called for node group
      # &lt;node-group-id&gt; Cache cluster message: Failover from primary node &lt;primary-node-id&gt; to
      # replica node &lt;node-id&gt; completed Replication group message: Failover from primary node
      # &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed Cache cluster message: Recovering
      # cache nodes &lt;node-id&gt; Cache cluster message: Finished recovery for cache nodes &lt;node-id&gt;
      # For more information see: Viewing ElastiCache Events in the ElastiCache User Guide DescribeEvents in
      # the ElastiCache API Reference Also see, Testing Multi-AZ in the ElastiCache User Guide .
      def test_failover(
        node_group_id : String,
        replication_group_id : String
      ) : Types::TestFailoverResult
        input = Types::TestFailoverMessage.new(node_group_id: node_group_id, replication_group_id: replication_group_id)
        test_failover(input)
      end
      def test_failover(input : Types::TestFailoverMessage) : Types::TestFailoverResult
        request = Protocol::Query.build_request(Model::TEST_FAILOVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TestFailoverResult, "TestFailover")
      end

      # Async API to test connection between source and target replication group.
      def test_migration(
        customer_node_endpoint_list : Array(Types::CustomerNodeEndpoint),
        replication_group_id : String
      ) : Types::TestMigrationResponse
        input = Types::TestMigrationMessage.new(customer_node_endpoint_list: customer_node_endpoint_list, replication_group_id: replication_group_id)
        test_migration(input)
      end
      def test_migration(input : Types::TestMigrationMessage) : Types::TestMigrationResponse
        request = Protocol::Query.build_request(Model::TEST_MIGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TestMigrationResponse, "TestMigration")
      end
    end
  end
end
