module AwsSdk
  module Neptune
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

      # Associates an Identity and Access Management (IAM) role with an Neptune DB cluster.

      def add_role_to_db_cluster(
        db_cluster_identifier : String,
        role_arn : String,
        feature_name : String? = nil
      ) : Nil

        input = Types::AddRoleToDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, role_arn: role_arn, feature_name: feature_name)
        add_role_to_db_cluster(input)
      end

      def add_role_to_db_cluster(input : Types::AddRoleToDBClusterMessage) : Nil
        request = Protocol::Query.build_request(Model::ADD_ROLE_TO_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds a source identifier to an existing event notification subscription.

      def add_source_identifier_to_subscription(
        source_identifier : String,
        subscription_name : String
      ) : Types::AddSourceIdentifierToSubscriptionResult

        input = Types::AddSourceIdentifierToSubscriptionMessage.new(source_identifier: source_identifier, subscription_name: subscription_name)
        add_source_identifier_to_subscription(input)
      end

      def add_source_identifier_to_subscription(input : Types::AddSourceIdentifierToSubscriptionMessage) : Types::AddSourceIdentifierToSubscriptionResult
        request = Protocol::Query.build_request(Model::ADD_SOURCE_IDENTIFIER_TO_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AddSourceIdentifierToSubscriptionResult, "AddSourceIdentifierToSubscription")
      end

      # Adds metadata tags to an Amazon Neptune resource. These tags can also be used with cost allocation
      # reporting to track cost associated with Amazon Neptune resources, or used in a Condition statement
      # in an IAM policy for Amazon Neptune.

      def add_tags_to_resource(
        resource_name : String,
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::AddTagsToResourceMessage.new(resource_name: resource_name, tags: tags)
        add_tags_to_resource(input)
      end

      def add_tags_to_resource(input : Types::AddTagsToResourceMessage) : Nil
        request = Protocol::Query.build_request(Model::ADD_TAGS_TO_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Applies a pending maintenance action to a resource (for example, to a DB instance).

      def apply_pending_maintenance_action(
        apply_action : String,
        opt_in_type : String,
        resource_identifier : String
      ) : Types::ApplyPendingMaintenanceActionResult

        input = Types::ApplyPendingMaintenanceActionMessage.new(apply_action: apply_action, opt_in_type: opt_in_type, resource_identifier: resource_identifier)
        apply_pending_maintenance_action(input)
      end

      def apply_pending_maintenance_action(input : Types::ApplyPendingMaintenanceActionMessage) : Types::ApplyPendingMaintenanceActionResult
        request = Protocol::Query.build_request(Model::APPLY_PENDING_MAINTENANCE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ApplyPendingMaintenanceActionResult, "ApplyPendingMaintenanceAction")
      end

      # Copies the specified DB cluster parameter group.

      def copy_db_cluster_parameter_group(
        source_db_cluster_parameter_group_identifier : String,
        target_db_cluster_parameter_group_description : String,
        target_db_cluster_parameter_group_identifier : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CopyDBClusterParameterGroupResult

        input = Types::CopyDBClusterParameterGroupMessage.new(source_db_cluster_parameter_group_identifier: source_db_cluster_parameter_group_identifier, target_db_cluster_parameter_group_description: target_db_cluster_parameter_group_description, target_db_cluster_parameter_group_identifier: target_db_cluster_parameter_group_identifier, tags: tags)
        copy_db_cluster_parameter_group(input)
      end

      def copy_db_cluster_parameter_group(input : Types::CopyDBClusterParameterGroupMessage) : Types::CopyDBClusterParameterGroupResult
        request = Protocol::Query.build_request(Model::COPY_DB_CLUSTER_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CopyDBClusterParameterGroupResult, "CopyDBClusterParameterGroup")
      end

      # Copies a snapshot of a DB cluster. To copy a DB cluster snapshot from a shared manual DB cluster
      # snapshot, SourceDBClusterSnapshotIdentifier must be the Amazon Resource Name (ARN) of the shared DB
      # cluster snapshot.

      def copy_db_cluster_snapshot(
        source_db_cluster_snapshot_identifier : String,
        target_db_cluster_snapshot_identifier : String,
        copy_tags : Bool? = nil,
        kms_key_id : String? = nil,
        pre_signed_url : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CopyDBClusterSnapshotResult

        input = Types::CopyDBClusterSnapshotMessage.new(source_db_cluster_snapshot_identifier: source_db_cluster_snapshot_identifier, target_db_cluster_snapshot_identifier: target_db_cluster_snapshot_identifier, copy_tags: copy_tags, kms_key_id: kms_key_id, pre_signed_url: pre_signed_url, tags: tags)
        copy_db_cluster_snapshot(input)
      end

      def copy_db_cluster_snapshot(input : Types::CopyDBClusterSnapshotMessage) : Types::CopyDBClusterSnapshotResult
        request = Protocol::Query.build_request(Model::COPY_DB_CLUSTER_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CopyDBClusterSnapshotResult, "CopyDBClusterSnapshot")
      end

      # Copies the specified DB parameter group.

      def copy_db_parameter_group(
        source_db_parameter_group_identifier : String,
        target_db_parameter_group_description : String,
        target_db_parameter_group_identifier : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CopyDBParameterGroupResult

        input = Types::CopyDBParameterGroupMessage.new(source_db_parameter_group_identifier: source_db_parameter_group_identifier, target_db_parameter_group_description: target_db_parameter_group_description, target_db_parameter_group_identifier: target_db_parameter_group_identifier, tags: tags)
        copy_db_parameter_group(input)
      end

      def copy_db_parameter_group(input : Types::CopyDBParameterGroupMessage) : Types::CopyDBParameterGroupResult
        request = Protocol::Query.build_request(Model::COPY_DB_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CopyDBParameterGroupResult, "CopyDBParameterGroup")
      end

      # Creates a new Amazon Neptune DB cluster. You can use the ReplicationSourceIdentifier parameter to
      # create the DB cluster as a Read Replica of another DB cluster or Amazon Neptune DB instance. Note
      # that when you create a new cluster using CreateDBCluster directly, deletion protection is disabled
      # by default (when you create a new production cluster in the console, deletion protection is enabled
      # by default). You can only delete a DB cluster if its DeletionProtection field is set to false .

      def create_db_cluster(
        db_cluster_identifier : String,
        engine : String,
        availability_zones : Array(String)? = nil,
        backup_retention_period : Int32? = nil,
        character_set_name : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        database_name : String? = nil,
        deletion_protection : Bool? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_iam_database_authentication : Bool? = nil,
        engine_version : String? = nil,
        global_cluster_identifier : String? = nil,
        kms_key_id : String? = nil,
        master_user_password : String? = nil,
        master_username : String? = nil,
        option_group_name : String? = nil,
        port : Int32? = nil,
        pre_signed_url : String? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        replication_source_identifier : String? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_encrypted : Bool? = nil,
        storage_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateDBClusterResult

        input = Types::CreateDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, engine: engine, availability_zones: availability_zones, backup_retention_period: backup_retention_period, character_set_name: character_set_name, copy_tags_to_snapshot: copy_tags_to_snapshot, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_subnet_group_name: db_subnet_group_name, database_name: database_name, deletion_protection: deletion_protection, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_iam_database_authentication: enable_iam_database_authentication, engine_version: engine_version, global_cluster_identifier: global_cluster_identifier, kms_key_id: kms_key_id, master_user_password: master_user_password, master_username: master_username, option_group_name: option_group_name, port: port, pre_signed_url: pre_signed_url, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, replication_source_identifier: replication_source_identifier, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_encrypted: storage_encrypted, storage_type: storage_type, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        create_db_cluster(input)
      end

      def create_db_cluster(input : Types::CreateDBClusterMessage) : Types::CreateDBClusterResult
        request = Protocol::Query.build_request(Model::CREATE_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBClusterResult, "CreateDBCluster")
      end

      # Creates a new custom endpoint and associates it with an Amazon Neptune DB cluster.

      def create_db_cluster_endpoint(
        db_cluster_endpoint_identifier : String,
        db_cluster_identifier : String,
        endpoint_type : String,
        excluded_members : Array(String)? = nil,
        static_members : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDBClusterEndpointOutput

        input = Types::CreateDBClusterEndpointMessage.new(db_cluster_endpoint_identifier: db_cluster_endpoint_identifier, db_cluster_identifier: db_cluster_identifier, endpoint_type: endpoint_type, excluded_members: excluded_members, static_members: static_members, tags: tags)
        create_db_cluster_endpoint(input)
      end

      def create_db_cluster_endpoint(input : Types::CreateDBClusterEndpointMessage) : Types::CreateDBClusterEndpointOutput
        request = Protocol::Query.build_request(Model::CREATE_DB_CLUSTER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBClusterEndpointOutput, "CreateDBClusterEndpoint")
      end

      # Creates a new DB cluster parameter group. Parameters in a DB cluster parameter group apply to all of
      # the instances in a DB cluster. A DB cluster parameter group is initially created with the default
      # parameters for the database engine used by instances in the DB cluster. To provide custom values for
      # any of the parameters, you must modify the group after creating it using
      # ModifyDBClusterParameterGroup . Once you've created a DB cluster parameter group, you need to
      # associate it with your DB cluster using ModifyDBCluster . When you associate a new DB cluster
      # parameter group with a running DB cluster, you need to reboot the DB instances in the DB cluster
      # without failover for the new DB cluster parameter group and associated settings to take effect.
      # After you create a DB cluster parameter group, you should wait at least 5 minutes before creating
      # your first DB cluster that uses that DB cluster parameter group as the default parameter group. This
      # allows Amazon Neptune to fully complete the create action before the DB cluster parameter group is
      # used as the default for a new DB cluster. This is especially important for parameters that are
      # critical when creating the default database for a DB cluster, such as the character set for the
      # default database defined by the character_set_database parameter. You can use the Parameter Groups
      # option of the Amazon Neptune console or the DescribeDBClusterParameters command to verify that your
      # DB cluster parameter group has been created or modified.

      def create_db_cluster_parameter_group(
        db_cluster_parameter_group_name : String,
        db_parameter_group_family : String,
        description : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDBClusterParameterGroupResult

        input = Types::CreateDBClusterParameterGroupMessage.new(db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_parameter_group_family: db_parameter_group_family, description: description, tags: tags)
        create_db_cluster_parameter_group(input)
      end

      def create_db_cluster_parameter_group(input : Types::CreateDBClusterParameterGroupMessage) : Types::CreateDBClusterParameterGroupResult
        request = Protocol::Query.build_request(Model::CREATE_DB_CLUSTER_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBClusterParameterGroupResult, "CreateDBClusterParameterGroup")
      end

      # Creates a snapshot of a DB cluster.

      def create_db_cluster_snapshot(
        db_cluster_identifier : String,
        db_cluster_snapshot_identifier : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDBClusterSnapshotResult

        input = Types::CreateDBClusterSnapshotMessage.new(db_cluster_identifier: db_cluster_identifier, db_cluster_snapshot_identifier: db_cluster_snapshot_identifier, tags: tags)
        create_db_cluster_snapshot(input)
      end

      def create_db_cluster_snapshot(input : Types::CreateDBClusterSnapshotMessage) : Types::CreateDBClusterSnapshotResult
        request = Protocol::Query.build_request(Model::CREATE_DB_CLUSTER_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBClusterSnapshotResult, "CreateDBClusterSnapshot")
      end

      # Creates a new DB instance.

      def create_db_instance(
        db_cluster_identifier : String,
        db_instance_class : String,
        db_instance_identifier : String,
        engine : String,
        allocated_storage : Int32? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        availability_zone : String? = nil,
        backup_retention_period : Int32? = nil,
        character_set_name : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_name : String? = nil,
        db_parameter_group_name : String? = nil,
        db_security_groups : Array(String)? = nil,
        db_subnet_group_name : String? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_iam_role_name : String? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        engine_version : String? = nil,
        iops : Int32? = nil,
        kms_key_id : String? = nil,
        license_model : String? = nil,
        master_user_password : String? = nil,
        master_username : String? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        multi_az : Bool? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        port : Int32? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        promotion_tier : Int32? = nil,
        publicly_accessible : Bool? = nil,
        storage_encrypted : Bool? = nil,
        storage_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        tde_credential_arn : String? = nil,
        tde_credential_password : String? = nil,
        timezone : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateDBInstanceResult

        input = Types::CreateDBInstanceMessage.new(db_cluster_identifier: db_cluster_identifier, db_instance_class: db_instance_class, db_instance_identifier: db_instance_identifier, engine: engine, allocated_storage: allocated_storage, auto_minor_version_upgrade: auto_minor_version_upgrade, availability_zone: availability_zone, backup_retention_period: backup_retention_period, character_set_name: character_set_name, copy_tags_to_snapshot: copy_tags_to_snapshot, db_name: db_name, db_parameter_group_name: db_parameter_group_name, db_security_groups: db_security_groups, db_subnet_group_name: db_subnet_group_name, deletion_protection: deletion_protection, domain: domain, domain_iam_role_name: domain_iam_role_name, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_iam_database_authentication: enable_iam_database_authentication, enable_performance_insights: enable_performance_insights, engine_version: engine_version, iops: iops, kms_key_id: kms_key_id, license_model: license_model, master_user_password: master_user_password, master_username: master_username, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, multi_az: multi_az, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, port: port, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, promotion_tier: promotion_tier, publicly_accessible: publicly_accessible, storage_encrypted: storage_encrypted, storage_type: storage_type, tags: tags, tde_credential_arn: tde_credential_arn, tde_credential_password: tde_credential_password, timezone: timezone, vpc_security_group_ids: vpc_security_group_ids)
        create_db_instance(input)
      end

      def create_db_instance(input : Types::CreateDBInstanceMessage) : Types::CreateDBInstanceResult
        request = Protocol::Query.build_request(Model::CREATE_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBInstanceResult, "CreateDBInstance")
      end

      # Creates a new DB parameter group. A DB parameter group is initially created with the default
      # parameters for the database engine used by the DB instance. To provide custom values for any of the
      # parameters, you must modify the group after creating it using ModifyDBParameterGroup . Once you've
      # created a DB parameter group, you need to associate it with your DB instance using ModifyDBInstance
      # . When you associate a new DB parameter group with a running DB instance, you need to reboot the DB
      # instance without failover for the new DB parameter group and associated settings to take effect.
      # After you create a DB parameter group, you should wait at least 5 minutes before creating your first
      # DB instance that uses that DB parameter group as the default parameter group. This allows Amazon
      # Neptune to fully complete the create action before the parameter group is used as the default for a
      # new DB instance. This is especially important for parameters that are critical when creating the
      # default database for a DB instance, such as the character set for the default database defined by
      # the character_set_database parameter. You can use the Parameter Groups option of the Amazon Neptune
      # console or the DescribeDBParameters command to verify that your DB parameter group has been created
      # or modified.

      def create_db_parameter_group(
        db_parameter_group_family : String,
        db_parameter_group_name : String,
        description : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDBParameterGroupResult

        input = Types::CreateDBParameterGroupMessage.new(db_parameter_group_family: db_parameter_group_family, db_parameter_group_name: db_parameter_group_name, description: description, tags: tags)
        create_db_parameter_group(input)
      end

      def create_db_parameter_group(input : Types::CreateDBParameterGroupMessage) : Types::CreateDBParameterGroupResult
        request = Protocol::Query.build_request(Model::CREATE_DB_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBParameterGroupResult, "CreateDBParameterGroup")
      end

      # Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs
      # in the Amazon Region.

      def create_db_subnet_group(
        db_subnet_group_description : String,
        db_subnet_group_name : String,
        subnet_ids : Array(String),
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDBSubnetGroupResult

        input = Types::CreateDBSubnetGroupMessage.new(db_subnet_group_description: db_subnet_group_description, db_subnet_group_name: db_subnet_group_name, subnet_ids: subnet_ids, tags: tags)
        create_db_subnet_group(input)
      end

      def create_db_subnet_group(input : Types::CreateDBSubnetGroupMessage) : Types::CreateDBSubnetGroupResult
        request = Protocol::Query.build_request(Model::CREATE_DB_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBSubnetGroupResult, "CreateDBSubnetGroup")
      end

      # Creates an event notification subscription. This action requires a topic ARN (Amazon Resource Name)
      # created by either the Neptune console, the SNS console, or the SNS API. To obtain an ARN with SNS,
      # you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS
      # console. You can specify the type of source (SourceType) you want to be notified of, provide a list
      # of Neptune sources (SourceIds) that triggers the events, and provide a list of event categories
      # (EventCategories) for events you want to be notified of. For example, you can specify SourceType =
      # db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories = Availability, Backup. If
      # you specify both the SourceType and SourceIds, such as SourceType = db-instance and SourceIdentifier
      # = myDBInstance1, you are notified of all the db-instance events for the specified source. If you
      # specify a SourceType but do not specify a SourceIdentifier, you receive notice of the events for
      # that source type for all your Neptune sources. If you do not specify either the SourceType nor the
      # SourceIdentifier, you are notified of events generated from all Neptune sources belonging to your
      # customer account.

      def create_event_subscription(
        sns_topic_arn : String,
        subscription_name : String,
        enabled : Bool? = nil,
        event_categories : Array(String)? = nil,
        source_ids : Array(String)? = nil,
        source_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEventSubscriptionResult

        input = Types::CreateEventSubscriptionMessage.new(sns_topic_arn: sns_topic_arn, subscription_name: subscription_name, enabled: enabled, event_categories: event_categories, source_ids: source_ids, source_type: source_type, tags: tags)
        create_event_subscription(input)
      end

      def create_event_subscription(input : Types::CreateEventSubscriptionMessage) : Types::CreateEventSubscriptionResult
        request = Protocol::Query.build_request(Model::CREATE_EVENT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateEventSubscriptionResult, "CreateEventSubscription")
      end

      # Creates a Neptune global database spread across multiple Amazon Regions. The global database
      # contains a single primary cluster with read-write capability, and read-only secondary clusters that
      # receive data from the primary cluster through high-speed replication performed by the Neptune
      # storage subsystem. You can create a global database that is initially empty, and then add a primary
      # cluster and secondary clusters to it, or you can specify an existing Neptune cluster during the
      # create operation to become the primary cluster of the global database.

      def create_global_cluster(
        global_cluster_identifier : String,
        deletion_protection : Bool? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        source_db_cluster_identifier : String? = nil,
        storage_encrypted : Bool? = nil
      ) : Types::CreateGlobalClusterResult

        input = Types::CreateGlobalClusterMessage.new(global_cluster_identifier: global_cluster_identifier, deletion_protection: deletion_protection, engine: engine, engine_version: engine_version, source_db_cluster_identifier: source_db_cluster_identifier, storage_encrypted: storage_encrypted)
        create_global_cluster(input)
      end

      def create_global_cluster(input : Types::CreateGlobalClusterMessage) : Types::CreateGlobalClusterResult
        request = Protocol::Query.build_request(Model::CREATE_GLOBAL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateGlobalClusterResult, "CreateGlobalCluster")
      end

      # The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB
      # cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual DB
      # cluster snapshots of the specified DB cluster are not deleted. Note that the DB Cluster cannot be
      # deleted if deletion protection is enabled. To delete it, you must first set its DeletionProtection
      # field to False .

      def delete_db_cluster(
        db_cluster_identifier : String,
        final_db_snapshot_identifier : String? = nil,
        skip_final_snapshot : Bool? = nil
      ) : Types::DeleteDBClusterResult

        input = Types::DeleteDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, final_db_snapshot_identifier: final_db_snapshot_identifier, skip_final_snapshot: skip_final_snapshot)
        delete_db_cluster(input)
      end

      def delete_db_cluster(input : Types::DeleteDBClusterMessage) : Types::DeleteDBClusterResult
        request = Protocol::Query.build_request(Model::DELETE_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBClusterResult, "DeleteDBCluster")
      end

      # Deletes a custom endpoint and removes it from an Amazon Neptune DB cluster.

      def delete_db_cluster_endpoint(
        db_cluster_endpoint_identifier : String
      ) : Types::DeleteDBClusterEndpointOutput

        input = Types::DeleteDBClusterEndpointMessage.new(db_cluster_endpoint_identifier: db_cluster_endpoint_identifier)
        delete_db_cluster_endpoint(input)
      end

      def delete_db_cluster_endpoint(input : Types::DeleteDBClusterEndpointMessage) : Types::DeleteDBClusterEndpointOutput
        request = Protocol::Query.build_request(Model::DELETE_DB_CLUSTER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBClusterEndpointOutput, "DeleteDBClusterEndpoint")
      end

      # Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted can't
      # be associated with any DB clusters.

      def delete_db_cluster_parameter_group(
        db_cluster_parameter_group_name : String
      ) : Nil

        input = Types::DeleteDBClusterParameterGroupMessage.new(db_cluster_parameter_group_name: db_cluster_parameter_group_name)
        delete_db_cluster_parameter_group(input)
      end

      def delete_db_cluster_parameter_group(input : Types::DeleteDBClusterParameterGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_DB_CLUSTER_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a DB cluster snapshot. If the snapshot is being copied, the copy operation is terminated.
      # The DB cluster snapshot must be in the available state to be deleted.

      def delete_db_cluster_snapshot(
        db_cluster_snapshot_identifier : String
      ) : Types::DeleteDBClusterSnapshotResult

        input = Types::DeleteDBClusterSnapshotMessage.new(db_cluster_snapshot_identifier: db_cluster_snapshot_identifier)
        delete_db_cluster_snapshot(input)
      end

      def delete_db_cluster_snapshot(input : Types::DeleteDBClusterSnapshotMessage) : Types::DeleteDBClusterSnapshotResult
        request = Protocol::Query.build_request(Model::DELETE_DB_CLUSTER_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBClusterSnapshotResult, "DeleteDBClusterSnapshot")
      end

      # The DeleteDBInstance action deletes a previously provisioned DB instance. When you delete a DB
      # instance, all automated backups for that instance are deleted and can't be recovered. Manual DB
      # snapshots of the DB instance to be deleted by DeleteDBInstance are not deleted. If you request a
      # final DB snapshot the status of the Amazon Neptune DB instance is deleting until the DB snapshot is
      # created. The API action DescribeDBInstance is used to monitor the status of this operation. The
      # action can't be canceled or reverted once submitted. Note that when a DB instance is in a failure
      # state and has a status of failed , incompatible-restore , or incompatible-network , you can only
      # delete it when the SkipFinalSnapshot parameter is set to true . You can't delete a DB instance if it
      # is the only instance in the DB cluster, or if it has deletion protection enabled.

      def delete_db_instance(
        db_instance_identifier : String,
        final_db_snapshot_identifier : String? = nil,
        skip_final_snapshot : Bool? = nil
      ) : Types::DeleteDBInstanceResult

        input = Types::DeleteDBInstanceMessage.new(db_instance_identifier: db_instance_identifier, final_db_snapshot_identifier: final_db_snapshot_identifier, skip_final_snapshot: skip_final_snapshot)
        delete_db_instance(input)
      end

      def delete_db_instance(input : Types::DeleteDBInstanceMessage) : Types::DeleteDBInstanceResult
        request = Protocol::Query.build_request(Model::DELETE_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBInstanceResult, "DeleteDBInstance")
      end

      # Deletes a specified DBParameterGroup. The DBParameterGroup to be deleted can't be associated with
      # any DB instances.

      def delete_db_parameter_group(
        db_parameter_group_name : String
      ) : Nil

        input = Types::DeleteDBParameterGroupMessage.new(db_parameter_group_name: db_parameter_group_name)
        delete_db_parameter_group(input)
      end

      def delete_db_parameter_group(input : Types::DeleteDBParameterGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_DB_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a DB subnet group. The specified database subnet group must not be associated with any DB
      # instances.

      def delete_db_subnet_group(
        db_subnet_group_name : String
      ) : Nil

        input = Types::DeleteDBSubnetGroupMessage.new(db_subnet_group_name: db_subnet_group_name)
        delete_db_subnet_group(input)
      end

      def delete_db_subnet_group(input : Types::DeleteDBSubnetGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_DB_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an event notification subscription.

      def delete_event_subscription(
        subscription_name : String
      ) : Types::DeleteEventSubscriptionResult

        input = Types::DeleteEventSubscriptionMessage.new(subscription_name: subscription_name)
        delete_event_subscription(input)
      end

      def delete_event_subscription(input : Types::DeleteEventSubscriptionMessage) : Types::DeleteEventSubscriptionResult
        request = Protocol::Query.build_request(Model::DELETE_EVENT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteEventSubscriptionResult, "DeleteEventSubscription")
      end

      # Deletes a global database. The primary and all secondary clusters must already be detached or
      # deleted first.

      def delete_global_cluster(
        global_cluster_identifier : String
      ) : Types::DeleteGlobalClusterResult

        input = Types::DeleteGlobalClusterMessage.new(global_cluster_identifier: global_cluster_identifier)
        delete_global_cluster(input)
      end

      def delete_global_cluster(input : Types::DeleteGlobalClusterMessage) : Types::DeleteGlobalClusterResult
        request = Protocol::Query.build_request(Model::DELETE_GLOBAL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteGlobalClusterResult, "DeleteGlobalCluster")
      end

      # Returns information about endpoints for an Amazon Neptune DB cluster. This operation can also return
      # information for Amazon RDS clusters and Amazon DocDB clusters.

      def describe_db_cluster_endpoints(
        db_cluster_endpoint_identifier : String? = nil,
        db_cluster_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBClusterEndpointMessage

        input = Types::DescribeDBClusterEndpointsMessage.new(db_cluster_endpoint_identifier: db_cluster_endpoint_identifier, db_cluster_identifier: db_cluster_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_db_cluster_endpoints(input)
      end

      def describe_db_cluster_endpoints(input : Types::DescribeDBClusterEndpointsMessage) : Types::DBClusterEndpointMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTER_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterEndpointMessage, "DescribeDBClusterEndpoints")
      end

      # Returns a list of DBClusterParameterGroup descriptions. If a DBClusterParameterGroupName parameter
      # is specified, the list will contain only the description of the specified DB cluster parameter
      # group.

      def describe_db_cluster_parameter_groups(
        db_cluster_parameter_group_name : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBClusterParameterGroupsMessage

        input = Types::DescribeDBClusterParameterGroupsMessage.new(db_cluster_parameter_group_name: db_cluster_parameter_group_name, filters: filters, marker: marker, max_records: max_records)
        describe_db_cluster_parameter_groups(input)
      end

      def describe_db_cluster_parameter_groups(input : Types::DescribeDBClusterParameterGroupsMessage) : Types::DBClusterParameterGroupsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTER_PARAMETER_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterParameterGroupsMessage, "DescribeDBClusterParameterGroups")
      end

      # Returns the detailed parameter list for a particular DB cluster parameter group.

      def describe_db_cluster_parameters(
        db_cluster_parameter_group_name : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        source : String? = nil
      ) : Types::DBClusterParameterGroupDetails

        input = Types::DescribeDBClusterParametersMessage.new(db_cluster_parameter_group_name: db_cluster_parameter_group_name, filters: filters, marker: marker, max_records: max_records, source: source)
        describe_db_cluster_parameters(input)
      end

      def describe_db_cluster_parameters(input : Types::DescribeDBClusterParametersMessage) : Types::DBClusterParameterGroupDetails
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTER_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterParameterGroupDetails, "DescribeDBClusterParameters")
      end

      # Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster snapshot.
      # When sharing snapshots with other Amazon accounts, DescribeDBClusterSnapshotAttributes returns the
      # restore attribute and a list of IDs for the Amazon accounts that are authorized to copy or restore
      # the manual DB cluster snapshot. If all is included in the list of values for the restore attribute,
      # then the manual DB cluster snapshot is public and can be copied or restored by all Amazon accounts.
      # To add or remove access for an Amazon account to copy or restore a manual DB cluster snapshot, or to
      # make the manual DB cluster snapshot public or private, use the ModifyDBClusterSnapshotAttribute API
      # action.

      def describe_db_cluster_snapshot_attributes(
        db_cluster_snapshot_identifier : String
      ) : Types::DescribeDBClusterSnapshotAttributesResult

        input = Types::DescribeDBClusterSnapshotAttributesMessage.new(db_cluster_snapshot_identifier: db_cluster_snapshot_identifier)
        describe_db_cluster_snapshot_attributes(input)
      end

      def describe_db_cluster_snapshot_attributes(input : Types::DescribeDBClusterSnapshotAttributesMessage) : Types::DescribeDBClusterSnapshotAttributesResult
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTER_SNAPSHOT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDBClusterSnapshotAttributesResult, "DescribeDBClusterSnapshotAttributes")
      end

      # Returns information about DB cluster snapshots. This API action supports pagination.

      def describe_db_cluster_snapshots(
        db_cluster_identifier : String? = nil,
        db_cluster_snapshot_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        include_public : Bool? = nil,
        include_shared : Bool? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        snapshot_type : String? = nil
      ) : Types::DBClusterSnapshotMessage

        input = Types::DescribeDBClusterSnapshotsMessage.new(db_cluster_identifier: db_cluster_identifier, db_cluster_snapshot_identifier: db_cluster_snapshot_identifier, filters: filters, include_public: include_public, include_shared: include_shared, marker: marker, max_records: max_records, snapshot_type: snapshot_type)
        describe_db_cluster_snapshots(input)
      end

      def describe_db_cluster_snapshots(input : Types::DescribeDBClusterSnapshotsMessage) : Types::DBClusterSnapshotMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTER_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterSnapshotMessage, "DescribeDBClusterSnapshots")
      end

      # Returns information about provisioned DB clusters, and supports pagination. This operation can also
      # return information for Amazon RDS clusters and Amazon DocDB clusters.

      def describe_db_clusters(
        db_cluster_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBClusterMessage

        input = Types::DescribeDBClustersMessage.new(db_cluster_identifier: db_cluster_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_db_clusters(input)
      end

      def describe_db_clusters(input : Types::DescribeDBClustersMessage) : Types::DBClusterMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterMessage, "DescribeDBClusters")
      end

      # Returns a list of the available DB engines.

      def describe_db_engine_versions(
        db_parameter_group_family : String? = nil,
        default_only : Bool? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        filters : Array(Types::Filter)? = nil,
        list_supported_character_sets : Bool? = nil,
        list_supported_timezones : Bool? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBEngineVersionMessage

        input = Types::DescribeDBEngineVersionsMessage.new(db_parameter_group_family: db_parameter_group_family, default_only: default_only, engine: engine, engine_version: engine_version, filters: filters, list_supported_character_sets: list_supported_character_sets, list_supported_timezones: list_supported_timezones, marker: marker, max_records: max_records)
        describe_db_engine_versions(input)
      end

      def describe_db_engine_versions(input : Types::DescribeDBEngineVersionsMessage) : Types::DBEngineVersionMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_ENGINE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBEngineVersionMessage, "DescribeDBEngineVersions")
      end

      # Returns information about provisioned instances, and supports pagination. This operation can also
      # return information for Amazon RDS instances and Amazon DocDB instances.

      def describe_db_instances(
        db_instance_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBInstanceMessage

        input = Types::DescribeDBInstancesMessage.new(db_instance_identifier: db_instance_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_db_instances(input)
      end

      def describe_db_instances(input : Types::DescribeDBInstancesMessage) : Types::DBInstanceMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBInstanceMessage, "DescribeDBInstances")
      end

      # Returns a list of DBParameterGroup descriptions. If a DBParameterGroupName is specified, the list
      # will contain only the description of the specified DB parameter group.

      def describe_db_parameter_groups(
        db_parameter_group_name : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBParameterGroupsMessage

        input = Types::DescribeDBParameterGroupsMessage.new(db_parameter_group_name: db_parameter_group_name, filters: filters, marker: marker, max_records: max_records)
        describe_db_parameter_groups(input)
      end

      def describe_db_parameter_groups(input : Types::DescribeDBParameterGroupsMessage) : Types::DBParameterGroupsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_PARAMETER_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBParameterGroupsMessage, "DescribeDBParameterGroups")
      end

      # Returns the detailed parameter list for a particular DB parameter group.

      def describe_db_parameters(
        db_parameter_group_name : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        source : String? = nil
      ) : Types::DBParameterGroupDetails

        input = Types::DescribeDBParametersMessage.new(db_parameter_group_name: db_parameter_group_name, filters: filters, marker: marker, max_records: max_records, source: source)
        describe_db_parameters(input)
      end

      def describe_db_parameters(input : Types::DescribeDBParametersMessage) : Types::DBParameterGroupDetails
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBParameterGroupDetails, "DescribeDBParameters")
      end

      # Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will
      # contain only the descriptions of the specified DBSubnetGroup. For an overview of CIDR ranges, go to
      # the Wikipedia Tutorial .

      def describe_db_subnet_groups(
        db_subnet_group_name : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBSubnetGroupMessage

        input = Types::DescribeDBSubnetGroupsMessage.new(db_subnet_group_name: db_subnet_group_name, filters: filters, marker: marker, max_records: max_records)
        describe_db_subnet_groups(input)
      end

      def describe_db_subnet_groups(input : Types::DescribeDBSubnetGroupsMessage) : Types::DBSubnetGroupMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_SUBNET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBSubnetGroupMessage, "DescribeDBSubnetGroups")
      end

      # Returns the default engine and system parameter information for the cluster database engine.

      def describe_engine_default_cluster_parameters(
        db_parameter_group_family : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeEngineDefaultClusterParametersResult

        input = Types::DescribeEngineDefaultClusterParametersMessage.new(db_parameter_group_family: db_parameter_group_family, filters: filters, marker: marker, max_records: max_records)
        describe_engine_default_cluster_parameters(input)
      end

      def describe_engine_default_cluster_parameters(input : Types::DescribeEngineDefaultClusterParametersMessage) : Types::DescribeEngineDefaultClusterParametersResult
        request = Protocol::Query.build_request(Model::DESCRIBE_ENGINE_DEFAULT_CLUSTER_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeEngineDefaultClusterParametersResult, "DescribeEngineDefaultClusterParameters")
      end

      # Returns the default engine and system parameter information for the specified database engine.

      def describe_engine_default_parameters(
        db_parameter_group_family : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeEngineDefaultParametersResult

        input = Types::DescribeEngineDefaultParametersMessage.new(db_parameter_group_family: db_parameter_group_family, filters: filters, marker: marker, max_records: max_records)
        describe_engine_default_parameters(input)
      end

      def describe_engine_default_parameters(input : Types::DescribeEngineDefaultParametersMessage) : Types::DescribeEngineDefaultParametersResult
        request = Protocol::Query.build_request(Model::DESCRIBE_ENGINE_DEFAULT_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeEngineDefaultParametersResult, "DescribeEngineDefaultParameters")
      end

      # Displays a list of categories for all event source types, or, if specified, for a specified source
      # type.

      def describe_event_categories(
        filters : Array(Types::Filter)? = nil,
        source_type : String? = nil
      ) : Types::EventCategoriesMessage

        input = Types::DescribeEventCategoriesMessage.new(filters: filters, source_type: source_type)
        describe_event_categories(input)
      end

      def describe_event_categories(input : Types::DescribeEventCategoriesMessage) : Types::EventCategoriesMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_EVENT_CATEGORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EventCategoriesMessage, "DescribeEventCategories")
      end

      # Lists all the subscription descriptions for a customer account. The description for a subscription
      # includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, CreationTime, and Status.
      # If you specify a SubscriptionName, lists the description for that subscription.

      def describe_event_subscriptions(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        subscription_name : String? = nil
      ) : Types::EventSubscriptionsMessage

        input = Types::DescribeEventSubscriptionsMessage.new(filters: filters, marker: marker, max_records: max_records, subscription_name: subscription_name)
        describe_event_subscriptions(input)
      end

      def describe_event_subscriptions(input : Types::DescribeEventSubscriptionsMessage) : Types::EventSubscriptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_EVENT_SUBSCRIPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EventSubscriptionsMessage, "DescribeEventSubscriptions")
      end

      # Returns events related to DB instances, DB security groups, DB snapshots, and DB parameter groups
      # for the past 14 days. Events specific to a particular DB instance, DB security group, database
      # snapshot, or DB parameter group can be obtained by providing the name as a parameter. By default,
      # the past hour of events are returned.

      def describe_events(
        duration : Int32? = nil,
        end_time : Time? = nil,
        event_categories : Array(String)? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        source_identifier : String? = nil,
        source_type : String? = nil,
        start_time : Time? = nil
      ) : Types::EventsMessage

        input = Types::DescribeEventsMessage.new(duration: duration, end_time: end_time, event_categories: event_categories, filters: filters, marker: marker, max_records: max_records, source_identifier: source_identifier, source_type: source_type, start_time: start_time)
        describe_events(input)
      end

      def describe_events(input : Types::DescribeEventsMessage) : Types::EventsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EventsMessage, "DescribeEvents")
      end

      # Returns information about Neptune global database clusters. This API supports pagination.

      def describe_global_clusters(
        global_cluster_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::GlobalClustersMessage

        input = Types::DescribeGlobalClustersMessage.new(global_cluster_identifier: global_cluster_identifier, marker: marker, max_records: max_records)
        describe_global_clusters(input)
      end

      def describe_global_clusters(input : Types::DescribeGlobalClustersMessage) : Types::GlobalClustersMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_GLOBAL_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GlobalClustersMessage, "DescribeGlobalClusters")
      end

      # Returns a list of orderable DB instance options for the specified engine.

      def describe_orderable_db_instance_options(
        engine : String,
        db_instance_class : String? = nil,
        engine_version : String? = nil,
        filters : Array(Types::Filter)? = nil,
        license_model : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        vpc : Bool? = nil
      ) : Types::OrderableDBInstanceOptionsMessage

        input = Types::DescribeOrderableDBInstanceOptionsMessage.new(engine: engine, db_instance_class: db_instance_class, engine_version: engine_version, filters: filters, license_model: license_model, marker: marker, max_records: max_records, vpc: vpc)
        describe_orderable_db_instance_options(input)
      end

      def describe_orderable_db_instance_options(input : Types::DescribeOrderableDBInstanceOptionsMessage) : Types::OrderableDBInstanceOptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_ORDERABLE_DB_INSTANCE_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::OrderableDBInstanceOptionsMessage, "DescribeOrderableDBInstanceOptions")
      end

      # Returns a list of resources (for example, DB instances) that have at least one pending maintenance
      # action.

      def describe_pending_maintenance_actions(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        resource_identifier : String? = nil
      ) : Types::PendingMaintenanceActionsMessage

        input = Types::DescribePendingMaintenanceActionsMessage.new(filters: filters, marker: marker, max_records: max_records, resource_identifier: resource_identifier)
        describe_pending_maintenance_actions(input)
      end

      def describe_pending_maintenance_actions(input : Types::DescribePendingMaintenanceActionsMessage) : Types::PendingMaintenanceActionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_PENDING_MAINTENANCE_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PendingMaintenanceActionsMessage, "DescribePendingMaintenanceActions")
      end

      # You can call DescribeValidDBInstanceModifications to learn what modifications you can make to your
      # DB instance. You can use this information when you call ModifyDBInstance .

      def describe_valid_db_instance_modifications(
        db_instance_identifier : String
      ) : Types::DescribeValidDBInstanceModificationsResult

        input = Types::DescribeValidDBInstanceModificationsMessage.new(db_instance_identifier: db_instance_identifier)
        describe_valid_db_instance_modifications(input)
      end

      def describe_valid_db_instance_modifications(input : Types::DescribeValidDBInstanceModificationsMessage) : Types::DescribeValidDBInstanceModificationsResult
        request = Protocol::Query.build_request(Model::DESCRIBE_VALID_DB_INSTANCE_MODIFICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeValidDBInstanceModificationsResult, "DescribeValidDBInstanceModifications")
      end

      # Forces a failover for a DB cluster. A failover for a DB cluster promotes one of the Read Replicas
      # (read-only instances) in the DB cluster to be the primary instance (the cluster writer). Amazon
      # Neptune will automatically fail over to a Read Replica, if one exists, when the primary instance
      # fails. You can force a failover when you want to simulate a failure of a primary instance for
      # testing. Because each instance in a DB cluster has its own endpoint address, you will need to clean
      # up and re-establish any existing connections that use those endpoint addresses when the failover is
      # complete.

      def failover_db_cluster(
        db_cluster_identifier : String? = nil,
        target_db_instance_identifier : String? = nil
      ) : Types::FailoverDBClusterResult

        input = Types::FailoverDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, target_db_instance_identifier: target_db_instance_identifier)
        failover_db_cluster(input)
      end

      def failover_db_cluster(input : Types::FailoverDBClusterMessage) : Types::FailoverDBClusterResult
        request = Protocol::Query.build_request(Model::FAILOVER_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::FailoverDBClusterResult, "FailoverDBCluster")
      end

      # Initiates the failover process for a Neptune global database. A failover for a Neptune global
      # database promotes one of secondary read-only DB clusters to be the primary DB cluster and demotes
      # the primary DB cluster to being a secondary (read-only) DB cluster. In other words, the role of the
      # current primary DB cluster and the selected target secondary DB cluster are switched. The selected
      # secondary DB cluster assumes full read/write capabilities for the Neptune global database. This
      # action applies only to Neptune global databases. This action is only intended for use on healthy
      # Neptune global databases with healthy Neptune DB clusters and no region-wide outages, to test
      # disaster recovery scenarios or to reconfigure the global database topology.

      def failover_global_cluster(
        global_cluster_identifier : String,
        target_db_cluster_identifier : String,
        allow_data_loss : Bool? = nil,
        switchover : Bool? = nil
      ) : Types::FailoverGlobalClusterResult

        input = Types::FailoverGlobalClusterMessage.new(global_cluster_identifier: global_cluster_identifier, target_db_cluster_identifier: target_db_cluster_identifier, allow_data_loss: allow_data_loss, switchover: switchover)
        failover_global_cluster(input)
      end

      def failover_global_cluster(input : Types::FailoverGlobalClusterMessage) : Types::FailoverGlobalClusterResult
        request = Protocol::Query.build_request(Model::FAILOVER_GLOBAL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::FailoverGlobalClusterResult, "FailoverGlobalCluster")
      end

      # Lists all tags on an Amazon Neptune resource.

      def list_tags_for_resource(
        resource_name : String,
        filters : Array(Types::Filter)? = nil
      ) : Types::TagListMessage

        input = Types::ListTagsForResourceMessage.new(resource_name: resource_name, filters: filters)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceMessage) : Types::TagListMessage
        request = Protocol::Query.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TagListMessage, "ListTagsForResource")
      end

      # Modify a setting for a DB cluster. You can change one or more database configuration parameters by
      # specifying these parameters and the new values in the request.

      def modify_db_cluster(
        db_cluster_identifier : String,
        allow_major_version_upgrade : Bool? = nil,
        apply_immediately : Bool? = nil,
        backup_retention_period : Int32? = nil,
        cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_instance_parameter_group_name : String? = nil,
        deletion_protection : Bool? = nil,
        enable_iam_database_authentication : Bool? = nil,
        engine_version : String? = nil,
        master_user_password : String? = nil,
        new_db_cluster_identifier : String? = nil,
        option_group_name : String? = nil,
        port : Int32? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_type : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::ModifyDBClusterResult

        input = Types::ModifyDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, allow_major_version_upgrade: allow_major_version_upgrade, apply_immediately: apply_immediately, backup_retention_period: backup_retention_period, cloudwatch_logs_export_configuration: cloudwatch_logs_export_configuration, copy_tags_to_snapshot: copy_tags_to_snapshot, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_instance_parameter_group_name: db_instance_parameter_group_name, deletion_protection: deletion_protection, enable_iam_database_authentication: enable_iam_database_authentication, engine_version: engine_version, master_user_password: master_user_password, new_db_cluster_identifier: new_db_cluster_identifier, option_group_name: option_group_name, port: port, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_type: storage_type, vpc_security_group_ids: vpc_security_group_ids)
        modify_db_cluster(input)
      end

      def modify_db_cluster(input : Types::ModifyDBClusterMessage) : Types::ModifyDBClusterResult
        request = Protocol::Query.build_request(Model::MODIFY_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBClusterResult, "ModifyDBCluster")
      end

      # Modifies the properties of an endpoint in an Amazon Neptune DB cluster.

      def modify_db_cluster_endpoint(
        db_cluster_endpoint_identifier : String,
        endpoint_type : String? = nil,
        excluded_members : Array(String)? = nil,
        static_members : Array(String)? = nil
      ) : Types::ModifyDBClusterEndpointOutput

        input = Types::ModifyDBClusterEndpointMessage.new(db_cluster_endpoint_identifier: db_cluster_endpoint_identifier, endpoint_type: endpoint_type, excluded_members: excluded_members, static_members: static_members)
        modify_db_cluster_endpoint(input)
      end

      def modify_db_cluster_endpoint(input : Types::ModifyDBClusterEndpointMessage) : Types::ModifyDBClusterEndpointOutput
        request = Protocol::Query.build_request(Model::MODIFY_DB_CLUSTER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBClusterEndpointOutput, "ModifyDBClusterEndpoint")
      end

      # Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, submit a
      # list of the following: ParameterName , ParameterValue , and ApplyMethod . A maximum of 20 parameters
      # can be modified in a single request. Changes to dynamic parameters are applied immediately. Changes
      # to static parameters require a reboot without failover to the DB cluster associated with the
      # parameter group before the change can take effect. After you create a DB cluster parameter group,
      # you should wait at least 5 minutes before creating your first DB cluster that uses that DB cluster
      # parameter group as the default parameter group. This allows Amazon Neptune to fully complete the
      # create action before the parameter group is used as the default for a new DB cluster. This is
      # especially important for parameters that are critical when creating the default database for a DB
      # cluster, such as the character set for the default database defined by the character_set_database
      # parameter. You can use the Parameter Groups option of the Amazon Neptune console or the
      # DescribeDBClusterParameters command to verify that your DB cluster parameter group has been created
      # or modified.

      def modify_db_cluster_parameter_group(
        db_cluster_parameter_group_name : String,
        parameters : Array(Types::Parameter)
      ) : Types::DBClusterParameterGroupNameMessage

        input = Types::ModifyDBClusterParameterGroupMessage.new(db_cluster_parameter_group_name: db_cluster_parameter_group_name, parameters: parameters)
        modify_db_cluster_parameter_group(input)
      end

      def modify_db_cluster_parameter_group(input : Types::ModifyDBClusterParameterGroupMessage) : Types::DBClusterParameterGroupNameMessage
        request = Protocol::Query.build_request(Model::MODIFY_DB_CLUSTER_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterParameterGroupNameMessage, "ModifyDBClusterParameterGroup")
      end

      # Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster
      # snapshot. To share a manual DB cluster snapshot with other Amazon accounts, specify restore as the
      # AttributeName and use the ValuesToAdd parameter to add a list of IDs of the Amazon accounts that are
      # authorized to restore the manual DB cluster snapshot. Use the value all to make the manual DB
      # cluster snapshot public, which means that it can be copied or restored by all Amazon accounts. Do
      # not add the all value for any manual DB cluster snapshots that contain private information that you
      # don't want available to all Amazon accounts. If a manual DB cluster snapshot is encrypted, it can be
      # shared, but only by specifying a list of authorized Amazon account IDs for the ValuesToAdd
      # parameter. You can't use all as a value for that parameter in this case. To view which Amazon
      # accounts have access to copy or restore a manual DB cluster snapshot, or whether a manual DB cluster
      # snapshot public or private, use the DescribeDBClusterSnapshotAttributes API action.

      def modify_db_cluster_snapshot_attribute(
        attribute_name : String,
        db_cluster_snapshot_identifier : String,
        values_to_add : Array(String)? = nil,
        values_to_remove : Array(String)? = nil
      ) : Types::ModifyDBClusterSnapshotAttributeResult

        input = Types::ModifyDBClusterSnapshotAttributeMessage.new(attribute_name: attribute_name, db_cluster_snapshot_identifier: db_cluster_snapshot_identifier, values_to_add: values_to_add, values_to_remove: values_to_remove)
        modify_db_cluster_snapshot_attribute(input)
      end

      def modify_db_cluster_snapshot_attribute(input : Types::ModifyDBClusterSnapshotAttributeMessage) : Types::ModifyDBClusterSnapshotAttributeResult
        request = Protocol::Query.build_request(Model::MODIFY_DB_CLUSTER_SNAPSHOT_ATTRIBUTE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBClusterSnapshotAttributeResult, "ModifyDBClusterSnapshotAttribute")
      end

      # Modifies settings for a DB instance. You can change one or more database configuration parameters by
      # specifying these parameters and the new values in the request. To learn what modifications you can
      # make to your DB instance, call DescribeValidDBInstanceModifications before you call ModifyDBInstance
      # .

      def modify_db_instance(
        db_instance_identifier : String,
        allocated_storage : Int32? = nil,
        allow_major_version_upgrade : Bool? = nil,
        apply_immediately : Bool? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        backup_retention_period : Int32? = nil,
        ca_certificate_identifier : String? = nil,
        cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_instance_class : String? = nil,
        db_parameter_group_name : String? = nil,
        db_port_number : Int32? = nil,
        db_security_groups : Array(String)? = nil,
        db_subnet_group_name : String? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_iam_role_name : String? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        engine_version : String? = nil,
        iops : Int32? = nil,
        license_model : String? = nil,
        master_user_password : String? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        multi_az : Bool? = nil,
        new_db_instance_identifier : String? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        promotion_tier : Int32? = nil,
        publicly_accessible : Bool? = nil,
        storage_type : String? = nil,
        tde_credential_arn : String? = nil,
        tde_credential_password : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::ModifyDBInstanceResult

        input = Types::ModifyDBInstanceMessage.new(db_instance_identifier: db_instance_identifier, allocated_storage: allocated_storage, allow_major_version_upgrade: allow_major_version_upgrade, apply_immediately: apply_immediately, auto_minor_version_upgrade: auto_minor_version_upgrade, backup_retention_period: backup_retention_period, ca_certificate_identifier: ca_certificate_identifier, cloudwatch_logs_export_configuration: cloudwatch_logs_export_configuration, copy_tags_to_snapshot: copy_tags_to_snapshot, db_instance_class: db_instance_class, db_parameter_group_name: db_parameter_group_name, db_port_number: db_port_number, db_security_groups: db_security_groups, db_subnet_group_name: db_subnet_group_name, deletion_protection: deletion_protection, domain: domain, domain_iam_role_name: domain_iam_role_name, enable_iam_database_authentication: enable_iam_database_authentication, enable_performance_insights: enable_performance_insights, engine_version: engine_version, iops: iops, license_model: license_model, master_user_password: master_user_password, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, multi_az: multi_az, new_db_instance_identifier: new_db_instance_identifier, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, promotion_tier: promotion_tier, publicly_accessible: publicly_accessible, storage_type: storage_type, tde_credential_arn: tde_credential_arn, tde_credential_password: tde_credential_password, vpc_security_group_ids: vpc_security_group_ids)
        modify_db_instance(input)
      end

      def modify_db_instance(input : Types::ModifyDBInstanceMessage) : Types::ModifyDBInstanceResult
        request = Protocol::Query.build_request(Model::MODIFY_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBInstanceResult, "ModifyDBInstance")
      end

      # Modifies the parameters of a DB parameter group. To modify more than one parameter, submit a list of
      # the following: ParameterName , ParameterValue , and ApplyMethod . A maximum of 20 parameters can be
      # modified in a single request. Changes to dynamic parameters are applied immediately. Changes to
      # static parameters require a reboot without failover to the DB instance associated with the parameter
      # group before the change can take effect. After you modify a DB parameter group, you should wait at
      # least 5 minutes before creating your first DB instance that uses that DB parameter group as the
      # default parameter group. This allows Amazon Neptune to fully complete the modify action before the
      # parameter group is used as the default for a new DB instance. This is especially important for
      # parameters that are critical when creating the default database for a DB instance, such as the
      # character set for the default database defined by the character_set_database parameter. You can use
      # the Parameter Groups option of the Amazon Neptune console or the DescribeDBParameters command to
      # verify that your DB parameter group has been created or modified.

      def modify_db_parameter_group(
        db_parameter_group_name : String,
        parameters : Array(Types::Parameter)
      ) : Types::DBParameterGroupNameMessage

        input = Types::ModifyDBParameterGroupMessage.new(db_parameter_group_name: db_parameter_group_name, parameters: parameters)
        modify_db_parameter_group(input)
      end

      def modify_db_parameter_group(input : Types::ModifyDBParameterGroupMessage) : Types::DBParameterGroupNameMessage
        request = Protocol::Query.build_request(Model::MODIFY_DB_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBParameterGroupNameMessage, "ModifyDBParameterGroup")
      end

      # Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at least
      # two AZs in the Amazon Region.

      def modify_db_subnet_group(
        db_subnet_group_name : String,
        subnet_ids : Array(String),
        db_subnet_group_description : String? = nil
      ) : Types::ModifyDBSubnetGroupResult

        input = Types::ModifyDBSubnetGroupMessage.new(db_subnet_group_name: db_subnet_group_name, subnet_ids: subnet_ids, db_subnet_group_description: db_subnet_group_description)
        modify_db_subnet_group(input)
      end

      def modify_db_subnet_group(input : Types::ModifyDBSubnetGroupMessage) : Types::ModifyDBSubnetGroupResult
        request = Protocol::Query.build_request(Model::MODIFY_DB_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBSubnetGroupResult, "ModifyDBSubnetGroup")
      end

      # Modifies an existing event notification subscription. Note that you can't modify the source
      # identifiers using this call; to change source identifiers for a subscription, use the
      # AddSourceIdentifierToSubscription and RemoveSourceIdentifierFromSubscription calls. You can see a
      # list of the event categories for a given SourceType by using the DescribeEventCategories action.

      def modify_event_subscription(
        subscription_name : String,
        enabled : Bool? = nil,
        event_categories : Array(String)? = nil,
        sns_topic_arn : String? = nil,
        source_type : String? = nil
      ) : Types::ModifyEventSubscriptionResult

        input = Types::ModifyEventSubscriptionMessage.new(subscription_name: subscription_name, enabled: enabled, event_categories: event_categories, sns_topic_arn: sns_topic_arn, source_type: source_type)
        modify_event_subscription(input)
      end

      def modify_event_subscription(input : Types::ModifyEventSubscriptionMessage) : Types::ModifyEventSubscriptionResult
        request = Protocol::Query.build_request(Model::MODIFY_EVENT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyEventSubscriptionResult, "ModifyEventSubscription")
      end

      # Modify a setting for an Amazon Neptune global cluster. You can change one or more database
      # configuration parameters by specifying these parameters and their new values in the request.

      def modify_global_cluster(
        global_cluster_identifier : String,
        allow_major_version_upgrade : Bool? = nil,
        deletion_protection : Bool? = nil,
        engine_version : String? = nil,
        new_global_cluster_identifier : String? = nil
      ) : Types::ModifyGlobalClusterResult

        input = Types::ModifyGlobalClusterMessage.new(global_cluster_identifier: global_cluster_identifier, allow_major_version_upgrade: allow_major_version_upgrade, deletion_protection: deletion_protection, engine_version: engine_version, new_global_cluster_identifier: new_global_cluster_identifier)
        modify_global_cluster(input)
      end

      def modify_global_cluster(input : Types::ModifyGlobalClusterMessage) : Types::ModifyGlobalClusterResult
        request = Protocol::Query.build_request(Model::MODIFY_GLOBAL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyGlobalClusterResult, "ModifyGlobalCluster")
      end

      # Not supported.

      def promote_read_replica_db_cluster(
        db_cluster_identifier : String
      ) : Types::PromoteReadReplicaDBClusterResult

        input = Types::PromoteReadReplicaDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier)
        promote_read_replica_db_cluster(input)
      end

      def promote_read_replica_db_cluster(input : Types::PromoteReadReplicaDBClusterMessage) : Types::PromoteReadReplicaDBClusterResult
        request = Protocol::Query.build_request(Model::PROMOTE_READ_REPLICA_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PromoteReadReplicaDBClusterResult, "PromoteReadReplicaDBCluster")
      end

      # You might need to reboot your DB instance, usually for maintenance reasons. For example, if you make
      # certain modifications, or if you change the DB parameter group associated with the DB instance, you
      # must reboot the instance for the changes to take effect. Rebooting a DB instance restarts the
      # database engine service. Rebooting a DB instance results in a momentary outage, during which the DB
      # instance status is set to rebooting.

      def reboot_db_instance(
        db_instance_identifier : String,
        force_failover : Bool? = nil
      ) : Types::RebootDBInstanceResult

        input = Types::RebootDBInstanceMessage.new(db_instance_identifier: db_instance_identifier, force_failover: force_failover)
        reboot_db_instance(input)
      end

      def reboot_db_instance(input : Types::RebootDBInstanceMessage) : Types::RebootDBInstanceResult
        request = Protocol::Query.build_request(Model::REBOOT_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RebootDBInstanceResult, "RebootDBInstance")
      end

      # Detaches a Neptune DB cluster from a Neptune global database. A secondary cluster becomes a normal
      # standalone cluster with read-write capability instead of being read-only, and no longer receives
      # data from a the primary cluster.

      def remove_from_global_cluster(
        db_cluster_identifier : String,
        global_cluster_identifier : String
      ) : Types::RemoveFromGlobalClusterResult

        input = Types::RemoveFromGlobalClusterMessage.new(db_cluster_identifier: db_cluster_identifier, global_cluster_identifier: global_cluster_identifier)
        remove_from_global_cluster(input)
      end

      def remove_from_global_cluster(input : Types::RemoveFromGlobalClusterMessage) : Types::RemoveFromGlobalClusterResult
        request = Protocol::Query.build_request(Model::REMOVE_FROM_GLOBAL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RemoveFromGlobalClusterResult, "RemoveFromGlobalCluster")
      end

      # Disassociates an Identity and Access Management (IAM) role from a DB cluster.

      def remove_role_from_db_cluster(
        db_cluster_identifier : String,
        role_arn : String,
        feature_name : String? = nil
      ) : Nil

        input = Types::RemoveRoleFromDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, role_arn: role_arn, feature_name: feature_name)
        remove_role_from_db_cluster(input)
      end

      def remove_role_from_db_cluster(input : Types::RemoveRoleFromDBClusterMessage) : Nil
        request = Protocol::Query.build_request(Model::REMOVE_ROLE_FROM_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes a source identifier from an existing event notification subscription.

      def remove_source_identifier_from_subscription(
        source_identifier : String,
        subscription_name : String
      ) : Types::RemoveSourceIdentifierFromSubscriptionResult

        input = Types::RemoveSourceIdentifierFromSubscriptionMessage.new(source_identifier: source_identifier, subscription_name: subscription_name)
        remove_source_identifier_from_subscription(input)
      end

      def remove_source_identifier_from_subscription(input : Types::RemoveSourceIdentifierFromSubscriptionMessage) : Types::RemoveSourceIdentifierFromSubscriptionResult
        request = Protocol::Query.build_request(Model::REMOVE_SOURCE_IDENTIFIER_FROM_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RemoveSourceIdentifierFromSubscriptionResult, "RemoveSourceIdentifierFromSubscription")
      end

      # Removes metadata tags from an Amazon Neptune resource.

      def remove_tags_from_resource(
        resource_name : String,
        tag_keys : Array(String)
      ) : Nil

        input = Types::RemoveTagsFromResourceMessage.new(resource_name: resource_name, tag_keys: tag_keys)
        remove_tags_from_resource(input)
      end

      def remove_tags_from_resource(input : Types::RemoveTagsFromResourceMessage) : Nil
        request = Protocol::Query.build_request(Model::REMOVE_TAGS_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Modifies the parameters of a DB cluster parameter group to the default value. To reset specific
      # parameters submit a list of the following: ParameterName and ApplyMethod . To reset the entire DB
      # cluster parameter group, specify the DBClusterParameterGroupName and ResetAllParameters parameters.
      # When resetting the entire group, dynamic parameters are updated immediately and static parameters
      # are set to pending-reboot to take effect on the next DB instance restart or RebootDBInstance
      # request. You must call RebootDBInstance for every DB instance in your DB cluster that you want the
      # updated static parameter to apply to.

      def reset_db_cluster_parameter_group(
        db_cluster_parameter_group_name : String,
        parameters : Array(Types::Parameter)? = nil,
        reset_all_parameters : Bool? = nil
      ) : Types::DBClusterParameterGroupNameMessage

        input = Types::ResetDBClusterParameterGroupMessage.new(db_cluster_parameter_group_name: db_cluster_parameter_group_name, parameters: parameters, reset_all_parameters: reset_all_parameters)
        reset_db_cluster_parameter_group(input)
      end

      def reset_db_cluster_parameter_group(input : Types::ResetDBClusterParameterGroupMessage) : Types::DBClusterParameterGroupNameMessage
        request = Protocol::Query.build_request(Model::RESET_DB_CLUSTER_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterParameterGroupNameMessage, "ResetDBClusterParameterGroup")
      end

      # Modifies the parameters of a DB parameter group to the engine/system default value. To reset
      # specific parameters, provide a list of the following: ParameterName and ApplyMethod . To reset the
      # entire DB parameter group, specify the DBParameterGroup name and ResetAllParameters parameters. When
      # resetting the entire group, dynamic parameters are updated immediately and static parameters are set
      # to pending-reboot to take effect on the next DB instance restart or RebootDBInstance request.

      def reset_db_parameter_group(
        db_parameter_group_name : String,
        parameters : Array(Types::Parameter)? = nil,
        reset_all_parameters : Bool? = nil
      ) : Types::DBParameterGroupNameMessage

        input = Types::ResetDBParameterGroupMessage.new(db_parameter_group_name: db_parameter_group_name, parameters: parameters, reset_all_parameters: reset_all_parameters)
        reset_db_parameter_group(input)
      end

      def reset_db_parameter_group(input : Types::ResetDBParameterGroupMessage) : Types::DBParameterGroupNameMessage
        request = Protocol::Query.build_request(Model::RESET_DB_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBParameterGroupNameMessage, "ResetDBParameterGroup")
      end

      # Creates a new DB cluster from a DB snapshot or DB cluster snapshot. If a DB snapshot is specified,
      # the target DB cluster is created from the source DB snapshot with a default configuration and
      # default security group. If a DB cluster snapshot is specified, the target DB cluster is created from
      # the source DB cluster restore point with the same configuration as the original source DB cluster,
      # except that the new DB cluster is created with the default security group.

      def restore_db_cluster_from_snapshot(
        db_cluster_identifier : String,
        engine : String,
        snapshot_identifier : String,
        availability_zones : Array(String)? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        database_name : String? = nil,
        deletion_protection : Bool? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_iam_database_authentication : Bool? = nil,
        engine_version : String? = nil,
        kms_key_id : String? = nil,
        option_group_name : String? = nil,
        port : Int32? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBClusterFromSnapshotResult

        input = Types::RestoreDBClusterFromSnapshotMessage.new(db_cluster_identifier: db_cluster_identifier, engine: engine, snapshot_identifier: snapshot_identifier, availability_zones: availability_zones, copy_tags_to_snapshot: copy_tags_to_snapshot, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_subnet_group_name: db_subnet_group_name, database_name: database_name, deletion_protection: deletion_protection, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_iam_database_authentication: enable_iam_database_authentication, engine_version: engine_version, kms_key_id: kms_key_id, option_group_name: option_group_name, port: port, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_type: storage_type, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        restore_db_cluster_from_snapshot(input)
      end

      def restore_db_cluster_from_snapshot(input : Types::RestoreDBClusterFromSnapshotMessage) : Types::RestoreDBClusterFromSnapshotResult
        request = Protocol::Query.build_request(Model::RESTORE_DB_CLUSTER_FROM_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreDBClusterFromSnapshotResult, "RestoreDBClusterFromSnapshot")
      end

      # Restores a DB cluster to an arbitrary point in time. Users can restore to any point in time before
      # LatestRestorableTime for up to BackupRetentionPeriod days. The target DB cluster is created from the
      # source DB cluster with the same configuration as the original DB cluster, except that the new DB
      # cluster is created with the default DB security group. This action only restores the DB cluster, not
      # the DB instances for that DB cluster. You must invoke the CreateDBInstance action to create DB
      # instances for the restored DB cluster, specifying the identifier of the restored DB cluster in
      # DBClusterIdentifier . You can create DB instances only after the RestoreDBClusterToPointInTime
      # action has completed and the DB cluster is available.

      def restore_db_cluster_to_point_in_time(
        db_cluster_identifier : String,
        source_db_cluster_identifier : String,
        db_cluster_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        deletion_protection : Bool? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_iam_database_authentication : Bool? = nil,
        kms_key_id : String? = nil,
        option_group_name : String? = nil,
        port : Int32? = nil,
        restore_to_time : Time? = nil,
        restore_type : String? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        use_latest_restorable_time : Bool? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBClusterToPointInTimeResult

        input = Types::RestoreDBClusterToPointInTimeMessage.new(db_cluster_identifier: db_cluster_identifier, source_db_cluster_identifier: source_db_cluster_identifier, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_subnet_group_name: db_subnet_group_name, deletion_protection: deletion_protection, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_iam_database_authentication: enable_iam_database_authentication, kms_key_id: kms_key_id, option_group_name: option_group_name, port: port, restore_to_time: restore_to_time, restore_type: restore_type, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_type: storage_type, tags: tags, use_latest_restorable_time: use_latest_restorable_time, vpc_security_group_ids: vpc_security_group_ids)
        restore_db_cluster_to_point_in_time(input)
      end

      def restore_db_cluster_to_point_in_time(input : Types::RestoreDBClusterToPointInTimeMessage) : Types::RestoreDBClusterToPointInTimeResult
        request = Protocol::Query.build_request(Model::RESTORE_DB_CLUSTER_TO_POINT_IN_TIME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreDBClusterToPointInTimeResult, "RestoreDBClusterToPointInTime")
      end

      # Starts an Amazon Neptune DB cluster that was stopped using the Amazon console, the Amazon CLI
      # stop-db-cluster command, or the StopDBCluster API.

      def start_db_cluster(
        db_cluster_identifier : String
      ) : Types::StartDBClusterResult

        input = Types::StartDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier)
        start_db_cluster(input)
      end

      def start_db_cluster(input : Types::StartDBClusterMessage) : Types::StartDBClusterResult
        request = Protocol::Query.build_request(Model::START_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StartDBClusterResult, "StartDBCluster")
      end

      # Stops an Amazon Neptune DB cluster. When you stop a DB cluster, Neptune retains the DB cluster's
      # metadata, including its endpoints and DB parameter groups. Neptune also retains the transaction logs
      # so you can do a point-in-time restore if necessary.

      def stop_db_cluster(
        db_cluster_identifier : String
      ) : Types::StopDBClusterResult

        input = Types::StopDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier)
        stop_db_cluster(input)
      end

      def stop_db_cluster(input : Types::StopDBClusterMessage) : Types::StopDBClusterResult
        request = Protocol::Query.build_request(Model::STOP_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StopDBClusterResult, "StopDBCluster")
      end

      # Switches over the specified secondary DB cluster to be the new primary DB cluster in the global
      # database cluster. Switchover operations were previously called "managed planned failovers." Promotes
      # the specified secondary cluster to assume full read/write capabilities and demotes the current
      # primary cluster to a secondary (read-only) cluster, maintaining the original replication topology.
      # All secondary clusters are synchronized with the primary at the beginning of the process so the new
      # primary continues operations for the global database without losing any data. Your database is
      # unavailable for a short time while the primary and selected secondary clusters are assuming their
      # new roles. This operation is intended for controlled environments, for operations such as "regional
      # rotation" or to fall back to the original primary after a global database failover.

      def switchover_global_cluster(
        global_cluster_identifier : String,
        target_db_cluster_identifier : String
      ) : Types::SwitchoverGlobalClusterResult

        input = Types::SwitchoverGlobalClusterMessage.new(global_cluster_identifier: global_cluster_identifier, target_db_cluster_identifier: target_db_cluster_identifier)
        switchover_global_cluster(input)
      end

      def switchover_global_cluster(input : Types::SwitchoverGlobalClusterMessage) : Types::SwitchoverGlobalClusterResult
        request = Protocol::Query.build_request(Model::SWITCHOVER_GLOBAL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SwitchoverGlobalClusterResult, "SwitchoverGlobalCluster")
      end
    end
  end
end
