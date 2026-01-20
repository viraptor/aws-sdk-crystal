module AwsSdk
  module DocDB
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

      # Adds metadata tags to an Amazon DocumentDB resource. You can use these tags with cost allocation
      # reporting to track costs that are associated with Amazon DocumentDB resources or in a Condition
      # statement in an Identity and Access Management (IAM) policy for Amazon DocumentDB.

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

      # Applies a pending maintenance action to a resource (for example, to an Amazon DocumentDB instance).

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

      # Copies the specified cluster parameter group.

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

      # Copies a snapshot of a cluster. To copy a cluster snapshot from a shared manual cluster snapshot,
      # SourceDBClusterSnapshotIdentifier must be the Amazon Resource Name (ARN) of the shared cluster
      # snapshot. You can only copy a shared DB cluster snapshot, whether encrypted or not, in the same
      # Amazon Web Services Region. To cancel the copy operation after it is in progress, delete the target
      # cluster snapshot identified by TargetDBClusterSnapshotIdentifier while that cluster snapshot is in
      # the copying status.

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

      # Creates a new Amazon DocumentDB cluster.

      def create_db_cluster(
        db_cluster_identifier : String,
        engine : String,
        availability_zones : Array(String)? = nil,
        backup_retention_period : Int32? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        deletion_protection : Bool? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        engine_version : String? = nil,
        global_cluster_identifier : String? = nil,
        kms_key_id : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        master_username : String? = nil,
        network_type : String? = nil,
        port : Int32? = nil,
        pre_signed_url : String? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_encrypted : Bool? = nil,
        storage_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateDBClusterResult

        input = Types::CreateDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, engine: engine, availability_zones: availability_zones, backup_retention_period: backup_retention_period, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_subnet_group_name: db_subnet_group_name, deletion_protection: deletion_protection, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, engine_version: engine_version, global_cluster_identifier: global_cluster_identifier, kms_key_id: kms_key_id, manage_master_user_password: manage_master_user_password, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, master_username: master_username, network_type: network_type, port: port, pre_signed_url: pre_signed_url, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_encrypted: storage_encrypted, storage_type: storage_type, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        create_db_cluster(input)
      end

      def create_db_cluster(input : Types::CreateDBClusterMessage) : Types::CreateDBClusterResult
        request = Protocol::Query.build_request(Model::CREATE_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBClusterResult, "CreateDBCluster")
      end

      # Creates a new cluster parameter group. Parameters in a cluster parameter group apply to all of the
      # instances in a cluster. A cluster parameter group is initially created with the default parameters
      # for the database engine used by instances in the cluster. In Amazon DocumentDB, you cannot make
      # modifications directly to the default.docdb3.6 cluster parameter group. If your Amazon DocumentDB
      # cluster is using the default cluster parameter group and you want to modify a value in it, you must
      # first create a new parameter group or copy an existing parameter group , modify it, and then apply
      # the modified parameter group to your cluster. For the new cluster parameter group and associated
      # settings to take effect, you must then reboot the instances in the cluster without failover. For
      # more information, see Modifying Amazon DocumentDB Cluster Parameter Groups .

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

      # Creates a snapshot of a cluster.

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

      # Creates a new instance.

      def create_db_instance(
        db_cluster_identifier : String,
        db_instance_class : String,
        db_instance_identifier : String,
        engine : String,
        auto_minor_version_upgrade : Bool? = nil,
        availability_zone : String? = nil,
        ca_certificate_identifier : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        performance_insights_kms_key_id : String? = nil,
        preferred_maintenance_window : String? = nil,
        promotion_tier : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDBInstanceResult

        input = Types::CreateDBInstanceMessage.new(db_cluster_identifier: db_cluster_identifier, db_instance_class: db_instance_class, db_instance_identifier: db_instance_identifier, engine: engine, auto_minor_version_upgrade: auto_minor_version_upgrade, availability_zone: availability_zone, ca_certificate_identifier: ca_certificate_identifier, copy_tags_to_snapshot: copy_tags_to_snapshot, enable_performance_insights: enable_performance_insights, performance_insights_kms_key_id: performance_insights_kms_key_id, preferred_maintenance_window: preferred_maintenance_window, promotion_tier: promotion_tier, tags: tags)
        create_db_instance(input)
      end

      def create_db_instance(input : Types::CreateDBInstanceMessage) : Types::CreateDBInstanceResult
        request = Protocol::Query.build_request(Model::CREATE_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBInstanceResult, "CreateDBInstance")
      end

      # Creates a new subnet group. subnet groups must contain at least one subnet in at least two
      # Availability Zones in the Amazon Web Services Region.

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

      # Creates an Amazon DocumentDB event notification subscription. This action requires a topic Amazon
      # Resource Name (ARN) created by using the Amazon DocumentDB console, the Amazon SNS console, or the
      # Amazon SNS API. To obtain an ARN with Amazon SNS, you must create a topic in Amazon SNS and
      # subscribe to the topic. The ARN is displayed in the Amazon SNS console. You can specify the type of
      # source ( SourceType ) that you want to be notified of. You can also provide a list of Amazon
      # DocumentDB sources ( SourceIds ) that trigger the events, and you can provide a list of event
      # categories ( EventCategories ) for events that you want to be notified of. For example, you can
      # specify SourceType = db-instance , SourceIds = mydbinstance1, mydbinstance2 and EventCategories =
      # Availability, Backup . If you specify both the SourceType and SourceIds (such as SourceType =
      # db-instance and SourceIdentifier = myDBInstance1 ), you are notified of all the db-instance events
      # for the specified source. If you specify a SourceType but do not specify a SourceIdentifier , you
      # receive notice of the events for that source type for all your Amazon DocumentDB sources. If you do
      # not specify either the SourceType or the SourceIdentifier , you are notified of events generated
      # from all Amazon DocumentDB sources belonging to your customer account.

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

      # Creates an Amazon DocumentDB global cluster that can span multiple multiple Amazon Web Services
      # Regions. The global cluster contains one primary cluster with read-write capability, and up-to 10
      # read-only secondary clusters. Global clusters uses storage-based fast replication across regions
      # with latencies less than one second, using dedicated infrastructure with no impact to your
      # workload’s performance. You can create a global cluster that is initially empty, and then add a
      # primary and a secondary to it. Or you can specify an existing cluster during the create operation,
      # and this cluster becomes the primary of the global cluster. This action only applies to Amazon
      # DocumentDB clusters.

      def create_global_cluster(
        global_cluster_identifier : String,
        database_name : String? = nil,
        deletion_protection : Bool? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        source_db_cluster_identifier : String? = nil,
        storage_encrypted : Bool? = nil
      ) : Types::CreateGlobalClusterResult

        input = Types::CreateGlobalClusterMessage.new(global_cluster_identifier: global_cluster_identifier, database_name: database_name, deletion_protection: deletion_protection, engine: engine, engine_version: engine_version, source_db_cluster_identifier: source_db_cluster_identifier, storage_encrypted: storage_encrypted)
        create_global_cluster(input)
      end

      def create_global_cluster(input : Types::CreateGlobalClusterMessage) : Types::CreateGlobalClusterResult
        request = Protocol::Query.build_request(Model::CREATE_GLOBAL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateGlobalClusterResult, "CreateGlobalCluster")
      end

      # Deletes a previously provisioned cluster. When you delete a cluster, all automated backups for that
      # cluster are deleted and can't be recovered. Manual DB cluster snapshots of the specified cluster are
      # not deleted.

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

      # Deletes a specified cluster parameter group. The cluster parameter group to be deleted can't be
      # associated with any clusters.

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

      # Deletes a cluster snapshot. If the snapshot is being copied, the copy operation is terminated. The
      # cluster snapshot must be in the available state to be deleted.

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

      # Deletes a previously provisioned instance.

      def delete_db_instance(
        db_instance_identifier : String
      ) : Types::DeleteDBInstanceResult

        input = Types::DeleteDBInstanceMessage.new(db_instance_identifier: db_instance_identifier)
        delete_db_instance(input)
      end

      def delete_db_instance(input : Types::DeleteDBInstanceMessage) : Types::DeleteDBInstanceResult
        request = Protocol::Query.build_request(Model::DELETE_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBInstanceResult, "DeleteDBInstance")
      end

      # Deletes a subnet group. The specified database subnet group must not be associated with any DB
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

      # Deletes an Amazon DocumentDB event notification subscription.

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

      # Deletes a global cluster. The primary and secondary clusters must already be detached or deleted
      # before attempting to delete a global cluster. This action only applies to Amazon DocumentDB
      # clusters.

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

      # Returns a list of certificate authority (CA) certificates provided by Amazon DocumentDB for this
      # Amazon Web Services account.

      def describe_certificates(
        certificate_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::CertificateMessage

        input = Types::DescribeCertificatesMessage.new(certificate_identifier: certificate_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_certificates(input)
      end

      def describe_certificates(input : Types::DescribeCertificatesMessage) : Types::CertificateMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CertificateMessage, "DescribeCertificates")
      end

      # Returns a list of DBClusterParameterGroup descriptions. If a DBClusterParameterGroupName parameter
      # is specified, the list contains only the description of the specified cluster parameter group.

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

      # Returns the detailed parameter list for a particular cluster parameter group.

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

      # Returns a list of cluster snapshot attribute names and values for a manual DB cluster snapshot. When
      # you share snapshots with other Amazon Web Services accounts, DescribeDBClusterSnapshotAttributes
      # returns the restore attribute and a list of IDs for the Amazon Web Services accounts that are
      # authorized to copy or restore the manual cluster snapshot. If all is included in the list of values
      # for the restore attribute, then the manual cluster snapshot is public and can be copied or restored
      # by all Amazon Web Services accounts.

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

      # Returns information about cluster snapshots. This API operation supports pagination.

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

      # Returns information about provisioned Amazon DocumentDB clusters. This API operation supports
      # pagination. For certain management features such as cluster and instance lifecycle management,
      # Amazon DocumentDB leverages operational technology that is shared with Amazon RDS and Amazon
      # Neptune. Use the filterName=engine,Values=docdb filter parameter to return only Amazon DocumentDB
      # clusters.

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

      # Returns a list of the available engines.

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

      # Returns information about provisioned Amazon DocumentDB instances. This API supports pagination.

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

      # Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list will
      # contain only the descriptions of the specified DBSubnetGroup .

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
      # includes SubscriptionName , SNSTopicARN , CustomerID , SourceType , SourceID , CreationTime , and
      # Status . If you specify a SubscriptionName , lists the description for that subscription.

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

      # Returns events related to instances, security groups, snapshots, and DB parameter groups for the
      # past 14 days. You can obtain events specific to a particular DB instance, security group, snapshot,
      # or parameter group by providing the name as a parameter. By default, the events of the past hour are
      # returned.

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

      # Returns information about Amazon DocumentDB global clusters. This API supports pagination. This
      # action only applies to Amazon DocumentDB clusters.

      def describe_global_clusters(
        filters : Array(Types::Filter)? = nil,
        global_cluster_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::GlobalClustersMessage

        input = Types::DescribeGlobalClustersMessage.new(filters: filters, global_cluster_identifier: global_cluster_identifier, marker: marker, max_records: max_records)
        describe_global_clusters(input)
      end

      def describe_global_clusters(input : Types::DescribeGlobalClustersMessage) : Types::GlobalClustersMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_GLOBAL_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GlobalClustersMessage, "DescribeGlobalClusters")
      end

      # Returns a list of orderable instance options for the specified engine.

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

      # Returns a list of resources (for example, instances) that have at least one pending maintenance
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

      # Forces a failover for a cluster. A failover for a cluster promotes one of the Amazon DocumentDB
      # replicas (read-only instances) in the cluster to be the primary instance (the cluster writer). If
      # the primary instance fails, Amazon DocumentDB automatically fails over to an Amazon DocumentDB
      # replica, if one exists. You can force a failover when you want to simulate a failure of a primary
      # instance for testing.

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

      # Promotes the specified secondary DB cluster to be the primary DB cluster in the global cluster when
      # failing over a global cluster occurs. Use this operation to respond to an unplanned event, such as a
      # regional disaster in the primary region. Failing over can result in a loss of write transaction data
      # that wasn't replicated to the chosen secondary before the failover event occurred. However, the
      # recovery process that promotes a DB instance on the chosen seconday DB cluster to be the primary
      # writer DB instance guarantees that the data is in a transactionally consistent state.

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

      # Lists all tags on an Amazon DocumentDB resource.

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

      # Modifies a setting for an Amazon DocumentDB cluster. You can change one or more database
      # configuration parameters by specifying these parameters and the new values in the request.

      def modify_db_cluster(
        db_cluster_identifier : String,
        allow_major_version_upgrade : Bool? = nil,
        apply_immediately : Bool? = nil,
        backup_retention_period : Int32? = nil,
        cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration? = nil,
        db_cluster_parameter_group_name : String? = nil,
        deletion_protection : Bool? = nil,
        engine_version : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        network_type : String? = nil,
        new_db_cluster_identifier : String? = nil,
        port : Int32? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        rotate_master_user_password : Bool? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_type : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::ModifyDBClusterResult

        input = Types::ModifyDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, allow_major_version_upgrade: allow_major_version_upgrade, apply_immediately: apply_immediately, backup_retention_period: backup_retention_period, cloudwatch_logs_export_configuration: cloudwatch_logs_export_configuration, db_cluster_parameter_group_name: db_cluster_parameter_group_name, deletion_protection: deletion_protection, engine_version: engine_version, manage_master_user_password: manage_master_user_password, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, network_type: network_type, new_db_cluster_identifier: new_db_cluster_identifier, port: port, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, rotate_master_user_password: rotate_master_user_password, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_type: storage_type, vpc_security_group_ids: vpc_security_group_ids)
        modify_db_cluster(input)
      end

      def modify_db_cluster(input : Types::ModifyDBClusterMessage) : Types::ModifyDBClusterResult
        request = Protocol::Query.build_request(Model::MODIFY_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBClusterResult, "ModifyDBCluster")
      end

      # Modifies the parameters of a cluster parameter group. To modify more than one parameter, submit a
      # list of the following: ParameterName , ParameterValue , and ApplyMethod . A maximum of 20 parameters
      # can be modified in a single request. Changes to dynamic parameters are applied immediately. Changes
      # to static parameters require a reboot or maintenance window before the change can take effect. After
      # you create a cluster parameter group, you should wait at least 5 minutes before creating your first
      # cluster that uses that cluster parameter group as the default parameter group. This allows Amazon
      # DocumentDB to fully complete the create action before the parameter group is used as the default for
      # a new cluster. This step is especially important for parameters that are critical when creating the
      # default database for a cluster, such as the character set for the default database defined by the
      # character_set_database parameter.

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

      # Adds an attribute and values to, or removes an attribute and values from, a manual cluster snapshot.
      # To share a manual cluster snapshot with other Amazon Web Services accounts, specify restore as the
      # AttributeName , and use the ValuesToAdd parameter to add a list of IDs of the Amazon Web Services
      # accounts that are authorized to restore the manual cluster snapshot. Use the value all to make the
      # manual cluster snapshot public, which means that it can be copied or restored by all Amazon Web
      # Services accounts. Do not add the all value for any manual cluster snapshots that contain private
      # information that you don't want available to all Amazon Web Services accounts. If a manual cluster
      # snapshot is encrypted, it can be shared, but only by specifying a list of authorized Amazon Web
      # Services account IDs for the ValuesToAdd parameter. You can't use all as a value for that parameter
      # in this case.

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

      # Modifies settings for an instance. You can change one or more database configuration parameters by
      # specifying these parameters and the new values in the request.

      def modify_db_instance(
        db_instance_identifier : String,
        apply_immediately : Bool? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        ca_certificate_identifier : String? = nil,
        certificate_rotation_restart : Bool? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_instance_class : String? = nil,
        enable_performance_insights : Bool? = nil,
        new_db_instance_identifier : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        preferred_maintenance_window : String? = nil,
        promotion_tier : Int32? = nil
      ) : Types::ModifyDBInstanceResult

        input = Types::ModifyDBInstanceMessage.new(db_instance_identifier: db_instance_identifier, apply_immediately: apply_immediately, auto_minor_version_upgrade: auto_minor_version_upgrade, ca_certificate_identifier: ca_certificate_identifier, certificate_rotation_restart: certificate_rotation_restart, copy_tags_to_snapshot: copy_tags_to_snapshot, db_instance_class: db_instance_class, enable_performance_insights: enable_performance_insights, new_db_instance_identifier: new_db_instance_identifier, performance_insights_kms_key_id: performance_insights_kms_key_id, preferred_maintenance_window: preferred_maintenance_window, promotion_tier: promotion_tier)
        modify_db_instance(input)
      end

      def modify_db_instance(input : Types::ModifyDBInstanceMessage) : Types::ModifyDBInstanceResult
        request = Protocol::Query.build_request(Model::MODIFY_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBInstanceResult, "ModifyDBInstance")
      end

      # Modifies an existing subnet group. subnet groups must contain at least one subnet in at least two
      # Availability Zones in the Amazon Web Services Region.

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

      # Modifies an existing Amazon DocumentDB event notification subscription.

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

      # Modify a setting for an Amazon DocumentDB global cluster. You can change one or more configuration
      # parameters (for example: deletion protection), or the global cluster identifier by specifying these
      # parameters and the new values in the request. This action only applies to Amazon DocumentDB
      # clusters.

      def modify_global_cluster(
        global_cluster_identifier : String,
        deletion_protection : Bool? = nil,
        new_global_cluster_identifier : String? = nil
      ) : Types::ModifyGlobalClusterResult

        input = Types::ModifyGlobalClusterMessage.new(global_cluster_identifier: global_cluster_identifier, deletion_protection: deletion_protection, new_global_cluster_identifier: new_global_cluster_identifier)
        modify_global_cluster(input)
      end

      def modify_global_cluster(input : Types::ModifyGlobalClusterMessage) : Types::ModifyGlobalClusterResult
        request = Protocol::Query.build_request(Model::MODIFY_GLOBAL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyGlobalClusterResult, "ModifyGlobalCluster")
      end

      # You might need to reboot your instance, usually for maintenance reasons. For example, if you make
      # certain changes, or if you change the cluster parameter group that is associated with the instance,
      # you must reboot the instance for the changes to take effect. Rebooting an instance restarts the
      # database engine service. Rebooting an instance results in a momentary outage, during which the
      # instance status is set to rebooting .

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

      # Detaches an Amazon DocumentDB secondary cluster from a global cluster. The cluster becomes a
      # standalone cluster with read-write capability instead of being read-only and receiving data from a
      # primary in a different region. This action only applies to Amazon DocumentDB clusters.

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

      # Removes a source identifier from an existing Amazon DocumentDB event notification subscription.

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

      # Removes metadata tags from an Amazon DocumentDB resource.

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

      # Modifies the parameters of a cluster parameter group to the default value. To reset specific
      # parameters, submit a list of the following: ParameterName and ApplyMethod . To reset the entire
      # cluster parameter group, specify the DBClusterParameterGroupName and ResetAllParameters parameters.
      # When you reset the entire group, dynamic parameters are updated immediately and static parameters
      # are set to pending-reboot to take effect on the next DB instance reboot.

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

      # Creates a new cluster from a snapshot or cluster snapshot. If a snapshot is specified, the target
      # cluster is created from the source DB snapshot with a default configuration and default security
      # group. If a cluster snapshot is specified, the target cluster is created from the source cluster
      # restore point with the same configuration as the original source DB cluster, except that the new
      # cluster is created with the default security group.

      def restore_db_cluster_from_snapshot(
        db_cluster_identifier : String,
        engine : String,
        snapshot_identifier : String,
        availability_zones : Array(String)? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        deletion_protection : Bool? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        engine_version : String? = nil,
        kms_key_id : String? = nil,
        network_type : String? = nil,
        port : Int32? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBClusterFromSnapshotResult

        input = Types::RestoreDBClusterFromSnapshotMessage.new(db_cluster_identifier: db_cluster_identifier, engine: engine, snapshot_identifier: snapshot_identifier, availability_zones: availability_zones, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_subnet_group_name: db_subnet_group_name, deletion_protection: deletion_protection, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, engine_version: engine_version, kms_key_id: kms_key_id, network_type: network_type, port: port, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_type: storage_type, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        restore_db_cluster_from_snapshot(input)
      end

      def restore_db_cluster_from_snapshot(input : Types::RestoreDBClusterFromSnapshotMessage) : Types::RestoreDBClusterFromSnapshotResult
        request = Protocol::Query.build_request(Model::RESTORE_DB_CLUSTER_FROM_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreDBClusterFromSnapshotResult, "RestoreDBClusterFromSnapshot")
      end

      # Restores a cluster to an arbitrary point in time. Users can restore to any point in time before
      # LatestRestorableTime for up to BackupRetentionPeriod days. The target cluster is created from the
      # source cluster with the same configuration as the original cluster, except that the new cluster is
      # created with the default security group.

      def restore_db_cluster_to_point_in_time(
        db_cluster_identifier : String,
        source_db_cluster_identifier : String,
        db_subnet_group_name : String? = nil,
        deletion_protection : Bool? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        kms_key_id : String? = nil,
        network_type : String? = nil,
        port : Int32? = nil,
        restore_to_time : Time? = nil,
        restore_type : String? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        use_latest_restorable_time : Bool? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBClusterToPointInTimeResult

        input = Types::RestoreDBClusterToPointInTimeMessage.new(db_cluster_identifier: db_cluster_identifier, source_db_cluster_identifier: source_db_cluster_identifier, db_subnet_group_name: db_subnet_group_name, deletion_protection: deletion_protection, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, kms_key_id: kms_key_id, network_type: network_type, port: port, restore_to_time: restore_to_time, restore_type: restore_type, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_type: storage_type, tags: tags, use_latest_restorable_time: use_latest_restorable_time, vpc_security_group_ids: vpc_security_group_ids)
        restore_db_cluster_to_point_in_time(input)
      end

      def restore_db_cluster_to_point_in_time(input : Types::RestoreDBClusterToPointInTimeMessage) : Types::RestoreDBClusterToPointInTimeResult
        request = Protocol::Query.build_request(Model::RESTORE_DB_CLUSTER_TO_POINT_IN_TIME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreDBClusterToPointInTimeResult, "RestoreDBClusterToPointInTime")
      end

      # Restarts the stopped cluster that is specified by DBClusterIdentifier . For more information, see
      # Stopping and Starting an Amazon DocumentDB Cluster .

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

      # Stops the running cluster that is specified by DBClusterIdentifier . The cluster must be in the
      # available state. For more information, see Stopping and Starting an Amazon DocumentDB Cluster .

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

      # Switches over the specified secondary Amazon DocumentDB cluster to be the new primary Amazon
      # DocumentDB cluster in the global database cluster.

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
