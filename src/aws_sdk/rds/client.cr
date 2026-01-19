module AwsSdk
  module RDS
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

      # Associates an Identity and Access Management (IAM) role with a DB cluster.
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

      # Associates an Amazon Web Services Identity and Access Management (IAM) role with a DB instance. To
      # add a role to a DB instance, the status of the DB instance must be available . This command doesn't
      # apply to RDS Custom.
      def add_role_to_db_instance(
        db_instance_identifier : String,
        feature_name : String,
        role_arn : String
      ) : Nil
        input = Types::AddRoleToDBInstanceMessage.new(db_instance_identifier: db_instance_identifier, feature_name: feature_name, role_arn: role_arn)
        add_role_to_db_instance(input)
      end
      def add_role_to_db_instance(input : Types::AddRoleToDBInstanceMessage) : Nil
        request = Protocol::Query.build_request(Model::ADD_ROLE_TO_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds a source identifier to an existing RDS event notification subscription.
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

      # Adds metadata tags to an Amazon RDS resource. These tags can also be used with cost allocation
      # reporting to track cost associated with Amazon RDS resources, or used in a Condition statement in an
      # IAM policy for Amazon RDS. For an overview on tagging your relational database resources, see
      # Tagging Amazon RDS Resources or Tagging Amazon Aurora and Amazon RDS Resources .
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

      # Enables ingress to a DBSecurityGroup using one of two forms of authorization. First, EC2 or VPC
      # security groups can be added to the DBSecurityGroup if the application using the database is running
      # on EC2 or VPC instances. Second, IP ranges are available if the application accessing your database
      # is running on the internet. Required parameters for this API are one of CIDR range,
      # EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or
      # EC2SecurityGroupId for non-VPC). You can't authorize ingress from an EC2 security group in one
      # Amazon Web Services Region to an Amazon RDS DB instance in another. You can't authorize ingress from
      # a VPC security group in one VPC to an Amazon RDS DB instance in another. For an overview of CIDR
      # ranges, go to the Wikipedia Tutorial . EC2-Classic was retired on August 15, 2022. If you haven't
      # migrated from EC2-Classic to a VPC, we recommend that you migrate as soon as possible. For more
      # information, see Migrate from EC2-Classic to a VPC in the Amazon EC2 User Guide , the blog
      # EC2-Classic Networking is Retiring – Here’s How to Prepare , and Moving a DB instance not in a VPC
      # into a VPC in the Amazon RDS User Guide .
      def authorize_db_security_group_ingress(
        db_security_group_name : String,
        cidrip : String? = nil,
        ec2_security_group_id : String? = nil,
        ec2_security_group_name : String? = nil,
        ec2_security_group_owner_id : String? = nil
      ) : Types::AuthorizeDBSecurityGroupIngressResult
        input = Types::AuthorizeDBSecurityGroupIngressMessage.new(db_security_group_name: db_security_group_name, cidrip: cidrip, ec2_security_group_id: ec2_security_group_id, ec2_security_group_name: ec2_security_group_name, ec2_security_group_owner_id: ec2_security_group_owner_id)
        authorize_db_security_group_ingress(input)
      end
      def authorize_db_security_group_ingress(input : Types::AuthorizeDBSecurityGroupIngressMessage) : Types::AuthorizeDBSecurityGroupIngressResult
        request = Protocol::Query.build_request(Model::AUTHORIZE_DB_SECURITY_GROUP_INGRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AuthorizeDBSecurityGroupIngressResult, "AuthorizeDBSecurityGroupIngress")
      end

      # Backtracks a DB cluster to a specific time, without creating a new DB cluster. For more information
      # on backtracking, see Backtracking an Aurora DB Cluster in the Amazon Aurora User Guide . This action
      # applies only to Aurora MySQL DB clusters.
      def backtrack_db_cluster(
        backtrack_to : Time,
        db_cluster_identifier : String,
        force : Bool? = nil,
        use_earliest_time_on_point_in_time_unavailable : Bool? = nil
      ) : Types::DBClusterBacktrack
        input = Types::BacktrackDBClusterMessage.new(backtrack_to: backtrack_to, db_cluster_identifier: db_cluster_identifier, force: force, use_earliest_time_on_point_in_time_unavailable: use_earliest_time_on_point_in_time_unavailable)
        backtrack_db_cluster(input)
      end
      def backtrack_db_cluster(input : Types::BacktrackDBClusterMessage) : Types::DBClusterBacktrack
        request = Protocol::Query.build_request(Model::BACKTRACK_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterBacktrack, "BacktrackDBCluster")
      end

      # Cancels an export task in progress that is exporting a snapshot or cluster to Amazon S3. Any data
      # that has already been written to the S3 bucket isn't removed.
      def cancel_export_task(
        export_task_identifier : String
      ) : Types::ExportTask
        input = Types::CancelExportTaskMessage.new(export_task_identifier: export_task_identifier)
        cancel_export_task(input)
      end
      def cancel_export_task(input : Types::CancelExportTaskMessage) : Types::ExportTask
        request = Protocol::Query.build_request(Model::CANCEL_EXPORT_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ExportTask, "CancelExportTask")
      end

      # Copies the specified DB cluster parameter group. You can't copy a default DB cluster parameter
      # group. Instead, create a new custom DB cluster parameter group, which copies the default parameters
      # and values for the specified DB cluster parameter group family.
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
      # cluster snapshot. You can copy an encrypted DB cluster snapshot from another Amazon Web Services
      # Region. In that case, the Amazon Web Services Region where you call the CopyDBClusterSnapshot
      # operation is the destination Amazon Web Services Region for the encrypted DB cluster snapshot to be
      # copied to. To copy an encrypted DB cluster snapshot from another Amazon Web Services Region, you
      # must provide the following values: KmsKeyId - The Amazon Web Services Key Management System (Amazon
      # Web Services KMS) key identifier for the key to use to encrypt the copy of the DB cluster snapshot
      # in the destination Amazon Web Services Region. TargetDBClusterSnapshotIdentifier - The identifier
      # for the new copy of the DB cluster snapshot in the destination Amazon Web Services Region.
      # SourceDBClusterSnapshotIdentifier - The DB cluster snapshot identifier for the encrypted DB cluster
      # snapshot to be copied. This identifier must be in the ARN format for the source Amazon Web Services
      # Region and is the same value as the SourceDBClusterSnapshotIdentifier in the presigned URL. To
      # cancel the copy operation once it is in progress, delete the target DB cluster snapshot identified
      # by TargetDBClusterSnapshotIdentifier while that DB cluster snapshot is in "copying" status. For more
      # information on copying encrypted Amazon Aurora DB cluster snapshots from one Amazon Web Services
      # Region to another, see Copying a Snapshot in the Amazon Aurora User Guide . For more information on
      # Amazon Aurora DB clusters, see What is Amazon Aurora? in the Amazon Aurora User Guide . For more
      # information on Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in the Amazon RDS User
      # Guide .
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

      # Copies the specified DB parameter group. You can't copy a default DB parameter group. Instead,
      # create a new custom DB parameter group, which copies the default parameters and values for the
      # specified DB parameter group family.
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

      # Copies the specified DB snapshot. The source DB snapshot must be in the available state. You can
      # copy a snapshot from one Amazon Web Services Region to another. In that case, the Amazon Web
      # Services Region where you call the CopyDBSnapshot operation is the destination Amazon Web Services
      # Region for the DB snapshot copy. This command doesn't apply to RDS Custom. For more information
      # about copying snapshots, see Copying a DB Snapshot in the Amazon RDS User Guide .
      def copy_db_snapshot(
        source_db_snapshot_identifier : String,
        target_db_snapshot_identifier : String,
        copy_option_group : Bool? = nil,
        copy_tags : Bool? = nil,
        kms_key_id : String? = nil,
        option_group_name : String? = nil,
        pre_signed_url : String? = nil,
        snapshot_availability_zone : String? = nil,
        snapshot_target : String? = nil,
        tags : Array(Types::Tag)? = nil,
        target_custom_availability_zone : String? = nil
      ) : Types::CopyDBSnapshotResult
        input = Types::CopyDBSnapshotMessage.new(source_db_snapshot_identifier: source_db_snapshot_identifier, target_db_snapshot_identifier: target_db_snapshot_identifier, copy_option_group: copy_option_group, copy_tags: copy_tags, kms_key_id: kms_key_id, option_group_name: option_group_name, pre_signed_url: pre_signed_url, snapshot_availability_zone: snapshot_availability_zone, snapshot_target: snapshot_target, tags: tags, target_custom_availability_zone: target_custom_availability_zone)
        copy_db_snapshot(input)
      end
      def copy_db_snapshot(input : Types::CopyDBSnapshotMessage) : Types::CopyDBSnapshotResult
        request = Protocol::Query.build_request(Model::COPY_DB_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CopyDBSnapshotResult, "CopyDBSnapshot")
      end

      # Copies the specified option group.
      def copy_option_group(
        source_option_group_identifier : String,
        target_option_group_description : String,
        target_option_group_identifier : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CopyOptionGroupResult
        input = Types::CopyOptionGroupMessage.new(source_option_group_identifier: source_option_group_identifier, target_option_group_description: target_option_group_description, target_option_group_identifier: target_option_group_identifier, tags: tags)
        copy_option_group(input)
      end
      def copy_option_group(input : Types::CopyOptionGroupMessage) : Types::CopyOptionGroupResult
        request = Protocol::Query.build_request(Model::COPY_OPTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CopyOptionGroupResult, "CopyOptionGroup")
      end

      # Creates a blue/green deployment. A blue/green deployment creates a staging environment that copies
      # the production environment. In a blue/green deployment, the blue environment is the current
      # production environment. The green environment is the staging environment, and it stays in sync with
      # the current production environment. You can make changes to the databases in the green environment
      # without affecting production workloads. For example, you can upgrade the major or minor DB engine
      # version, change database parameters, or make schema changes in the staging environment. You can
      # thoroughly test changes in the green environment. When ready, you can switch over the environments
      # to promote the green environment to be the new production environment. The switchover typically
      # takes under a minute. For more information, see Using Amazon RDS Blue/Green Deployments for database
      # updates in the Amazon RDS User Guide and Using Amazon RDS Blue/Green Deployments for database
      # updates in the Amazon Aurora User Guide .
      def create_blue_green_deployment(
        blue_green_deployment_name : String,
        source : String,
        tags : Array(Types::Tag)? = nil,
        target_allocated_storage : Int32? = nil,
        target_db_cluster_parameter_group_name : String? = nil,
        target_db_instance_class : String? = nil,
        target_db_parameter_group_name : String? = nil,
        target_engine_version : String? = nil,
        target_iops : Int32? = nil,
        target_storage_throughput : Int32? = nil,
        target_storage_type : String? = nil,
        upgrade_target_storage_config : Bool? = nil
      ) : Types::CreateBlueGreenDeploymentResponse
        input = Types::CreateBlueGreenDeploymentRequest.new(blue_green_deployment_name: blue_green_deployment_name, source: source, tags: tags, target_allocated_storage: target_allocated_storage, target_db_cluster_parameter_group_name: target_db_cluster_parameter_group_name, target_db_instance_class: target_db_instance_class, target_db_parameter_group_name: target_db_parameter_group_name, target_engine_version: target_engine_version, target_iops: target_iops, target_storage_throughput: target_storage_throughput, target_storage_type: target_storage_type, upgrade_target_storage_config: upgrade_target_storage_config)
        create_blue_green_deployment(input)
      end
      def create_blue_green_deployment(input : Types::CreateBlueGreenDeploymentRequest) : Types::CreateBlueGreenDeploymentResponse
        request = Protocol::Query.build_request(Model::CREATE_BLUE_GREEN_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateBlueGreenDeploymentResponse, "CreateBlueGreenDeployment")
      end

      # Creates a custom DB engine version (CEV).
      def create_custom_db_engine_version(
        engine : String,
        engine_version : String,
        database_installation_files : Array(String)? = nil,
        database_installation_files_s3_bucket_name : String? = nil,
        database_installation_files_s3_prefix : String? = nil,
        description : String? = nil,
        image_id : String? = nil,
        kms_key_id : String? = nil,
        manifest : String? = nil,
        source_custom_db_engine_version_identifier : String? = nil,
        tags : Array(Types::Tag)? = nil,
        use_aws_provided_latest_image : Bool? = nil
      ) : Types::DBEngineVersion
        input = Types::CreateCustomDBEngineVersionMessage.new(engine: engine, engine_version: engine_version, database_installation_files: database_installation_files, database_installation_files_s3_bucket_name: database_installation_files_s3_bucket_name, database_installation_files_s3_prefix: database_installation_files_s3_prefix, description: description, image_id: image_id, kms_key_id: kms_key_id, manifest: manifest, source_custom_db_engine_version_identifier: source_custom_db_engine_version_identifier, tags: tags, use_aws_provided_latest_image: use_aws_provided_latest_image)
        create_custom_db_engine_version(input)
      end
      def create_custom_db_engine_version(input : Types::CreateCustomDBEngineVersionMessage) : Types::DBEngineVersion
        request = Protocol::Query.build_request(Model::CREATE_CUSTOM_DB_ENGINE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBEngineVersion, "CreateCustomDBEngineVersion")
      end

      # Creates a new Amazon Aurora DB cluster or Multi-AZ DB cluster. If you create an Aurora DB cluster,
      # the request creates an empty cluster. You must explicitly create the writer instance for your DB
      # cluster using the CreateDBInstance operation. If you create a Multi-AZ DB cluster, the request
      # creates a writer and two reader DB instances for you, each in a different Availability Zone. You can
      # use the ReplicationSourceIdentifier parameter to create an Amazon Aurora DB cluster as a read
      # replica of another DB cluster or Amazon RDS for MySQL or PostgreSQL DB instance. For more
      # information about Amazon Aurora, see What is Amazon Aurora? in the Amazon Aurora User Guide . You
      # can also use the ReplicationSourceIdentifier parameter to create a Multi-AZ DB cluster read replica
      # with an RDS for MySQL or PostgreSQL DB instance as the source. For more information about Multi-AZ
      # DB clusters, see Multi-AZ DB cluster deployments in the Amazon RDS User Guide .
      def create_db_cluster(
        db_cluster_identifier : String,
        engine : String,
        allocated_storage : Int32? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        availability_zones : Array(String)? = nil,
        backtrack_window : Int64? = nil,
        backup_retention_period : Int32? = nil,
        ca_certificate_identifier : String? = nil,
        character_set_name : String? = nil,
        cluster_scalability_type : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_cluster_instance_class : String? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        db_system_id : String? = nil,
        database_insights_mode : String? = nil,
        database_name : String? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_iam_role_name : String? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_global_write_forwarding : Bool? = nil,
        enable_http_endpoint : Bool? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_limitless_database : Bool? = nil,
        enable_local_write_forwarding : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        engine_lifecycle_support : String? = nil,
        engine_mode : String? = nil,
        engine_version : String? = nil,
        global_cluster_identifier : String? = nil,
        iops : Int32? = nil,
        kms_key_id : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_authentication_type : String? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        master_username : String? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        network_type : String? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        performance_insights_retention_period : Int32? = nil,
        port : Int32? = nil,
        pre_signed_url : String? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        publicly_accessible : Bool? = nil,
        rds_custom_cluster_configuration : Types::RdsCustomClusterConfiguration? = nil,
        replication_source_identifier : String? = nil,
        scaling_configuration : Types::ScalingConfiguration? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_encrypted : Bool? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateDBClusterResult
        input = Types::CreateDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, engine: engine, allocated_storage: allocated_storage, auto_minor_version_upgrade: auto_minor_version_upgrade, availability_zones: availability_zones, backtrack_window: backtrack_window, backup_retention_period: backup_retention_period, ca_certificate_identifier: ca_certificate_identifier, character_set_name: character_set_name, cluster_scalability_type: cluster_scalability_type, copy_tags_to_snapshot: copy_tags_to_snapshot, db_cluster_instance_class: db_cluster_instance_class, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_subnet_group_name: db_subnet_group_name, db_system_id: db_system_id, database_insights_mode: database_insights_mode, database_name: database_name, deletion_protection: deletion_protection, domain: domain, domain_iam_role_name: domain_iam_role_name, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_global_write_forwarding: enable_global_write_forwarding, enable_http_endpoint: enable_http_endpoint, enable_iam_database_authentication: enable_iam_database_authentication, enable_limitless_database: enable_limitless_database, enable_local_write_forwarding: enable_local_write_forwarding, enable_performance_insights: enable_performance_insights, engine_lifecycle_support: engine_lifecycle_support, engine_mode: engine_mode, engine_version: engine_version, global_cluster_identifier: global_cluster_identifier, iops: iops, kms_key_id: kms_key_id, manage_master_user_password: manage_master_user_password, master_user_authentication_type: master_user_authentication_type, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, master_username: master_username, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, network_type: network_type, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, performance_insights_retention_period: performance_insights_retention_period, port: port, pre_signed_url: pre_signed_url, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, publicly_accessible: publicly_accessible, rds_custom_cluster_configuration: rds_custom_cluster_configuration, replication_source_identifier: replication_source_identifier, scaling_configuration: scaling_configuration, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_encrypted: storage_encrypted, storage_type: storage_type, tag_specifications: tag_specifications, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        create_db_cluster(input)
      end
      def create_db_cluster(input : Types::CreateDBClusterMessage) : Types::CreateDBClusterResult
        request = Protocol::Query.build_request(Model::CREATE_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBClusterResult, "CreateDBCluster")
      end

      # Creates a new custom endpoint and associates it with an Amazon Aurora DB cluster. This action
      # applies only to Aurora DB clusters.
      def create_db_cluster_endpoint(
        db_cluster_endpoint_identifier : String,
        db_cluster_identifier : String,
        endpoint_type : String,
        excluded_members : Array(String)? = nil,
        static_members : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::DBClusterEndpoint
        input = Types::CreateDBClusterEndpointMessage.new(db_cluster_endpoint_identifier: db_cluster_endpoint_identifier, db_cluster_identifier: db_cluster_identifier, endpoint_type: endpoint_type, excluded_members: excluded_members, static_members: static_members, tags: tags)
        create_db_cluster_endpoint(input)
      end
      def create_db_cluster_endpoint(input : Types::CreateDBClusterEndpointMessage) : Types::DBClusterEndpoint
        request = Protocol::Query.build_request(Model::CREATE_DB_CLUSTER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterEndpoint, "CreateDBClusterEndpoint")
      end

      # Creates a new DB cluster parameter group. Parameters in a DB cluster parameter group apply to all of
      # the instances in a DB cluster. A DB cluster parameter group is initially created with the default
      # parameters for the database engine used by instances in the DB cluster. To provide custom values for
      # any of the parameters, you must modify the group after creating it using
      # ModifyDBClusterParameterGroup . Once you've created a DB cluster parameter group, you need to
      # associate it with your DB cluster using ModifyDBCluster . When you associate a new DB cluster
      # parameter group with a running Aurora DB cluster, reboot the DB instances in the DB cluster without
      # failover for the new DB cluster parameter group and associated settings to take effect. When you
      # associate a new DB cluster parameter group with a running Multi-AZ DB cluster, reboot the DB cluster
      # without failover for the new DB cluster parameter group and associated settings to take effect.
      # After you create a DB cluster parameter group, you should wait at least 5 minutes before creating
      # your first DB cluster that uses that DB cluster parameter group as the default parameter group. This
      # allows Amazon RDS to fully complete the create action before the DB cluster parameter group is used
      # as the default for a new DB cluster. This is especially important for parameters that are critical
      # when creating the default database for a DB cluster, such as the character set for the default
      # database defined by the character_set_database parameter. You can use the Parameter Groups option of
      # the Amazon RDS console or the DescribeDBClusterParameters operation to verify that your DB cluster
      # parameter group has been created or modified. For more information on Amazon Aurora, see What is
      # Amazon Aurora? in the Amazon Aurora User Guide . For more information on Multi-AZ DB clusters, see
      # Multi-AZ DB cluster deployments in the Amazon RDS User Guide .
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

      # Creates a snapshot of a DB cluster. For more information on Amazon Aurora, see What is Amazon
      # Aurora? in the Amazon Aurora User Guide . For more information on Multi-AZ DB clusters, see Multi-AZ
      # DB cluster deployments in the Amazon RDS User Guide .
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

      # Creates a new DB instance. The new DB instance can be an RDS DB instance, or it can be a DB instance
      # in an Aurora DB cluster. For an Aurora DB cluster, you can call this operation multiple times to add
      # more than one DB instance to the cluster. For more information about creating an RDS DB instance,
      # see Creating an Amazon RDS DB instance in the Amazon RDS User Guide . For more information about
      # creating a DB instance in an Aurora DB cluster, see Creating an Amazon Aurora DB cluster in the
      # Amazon Aurora User Guide .
      def create_db_instance(
        db_instance_class : String,
        db_instance_identifier : String,
        engine : String,
        additional_storage_volumes : Array(Types::AdditionalStorageVolume)? = nil,
        allocated_storage : Int32? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        availability_zone : String? = nil,
        backup_retention_period : Int32? = nil,
        backup_target : String? = nil,
        ca_certificate_identifier : String? = nil,
        character_set_name : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        custom_iam_instance_profile : String? = nil,
        db_cluster_identifier : String? = nil,
        db_name : String? = nil,
        db_parameter_group_name : String? = nil,
        db_security_groups : Array(String)? = nil,
        db_subnet_group_name : String? = nil,
        db_system_id : String? = nil,
        database_insights_mode : String? = nil,
        dedicated_log_volume : Bool? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_auth_secret_arn : String? = nil,
        domain_dns_ips : Array(String)? = nil,
        domain_fqdn : String? = nil,
        domain_iam_role_name : String? = nil,
        domain_ou : String? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_customer_owned_ip : Bool? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        engine_lifecycle_support : String? = nil,
        engine_version : String? = nil,
        iops : Int32? = nil,
        kms_key_id : String? = nil,
        license_model : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_authentication_type : String? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        master_username : String? = nil,
        max_allocated_storage : Int32? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        multi_az : Bool? = nil,
        multi_tenant : Bool? = nil,
        nchar_character_set_name : String? = nil,
        network_type : String? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        performance_insights_retention_period : Int32? = nil,
        port : Int32? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        processor_features : Array(Types::ProcessorFeature)? = nil,
        promotion_tier : Int32? = nil,
        publicly_accessible : Bool? = nil,
        storage_encrypted : Bool? = nil,
        storage_throughput : Int32? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        tde_credential_arn : String? = nil,
        tde_credential_password : String? = nil,
        timezone : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateDBInstanceResult
        input = Types::CreateDBInstanceMessage.new(db_instance_class: db_instance_class, db_instance_identifier: db_instance_identifier, engine: engine, additional_storage_volumes: additional_storage_volumes, allocated_storage: allocated_storage, auto_minor_version_upgrade: auto_minor_version_upgrade, availability_zone: availability_zone, backup_retention_period: backup_retention_period, backup_target: backup_target, ca_certificate_identifier: ca_certificate_identifier, character_set_name: character_set_name, copy_tags_to_snapshot: copy_tags_to_snapshot, custom_iam_instance_profile: custom_iam_instance_profile, db_cluster_identifier: db_cluster_identifier, db_name: db_name, db_parameter_group_name: db_parameter_group_name, db_security_groups: db_security_groups, db_subnet_group_name: db_subnet_group_name, db_system_id: db_system_id, database_insights_mode: database_insights_mode, dedicated_log_volume: dedicated_log_volume, deletion_protection: deletion_protection, domain: domain, domain_auth_secret_arn: domain_auth_secret_arn, domain_dns_ips: domain_dns_ips, domain_fqdn: domain_fqdn, domain_iam_role_name: domain_iam_role_name, domain_ou: domain_ou, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_customer_owned_ip: enable_customer_owned_ip, enable_iam_database_authentication: enable_iam_database_authentication, enable_performance_insights: enable_performance_insights, engine_lifecycle_support: engine_lifecycle_support, engine_version: engine_version, iops: iops, kms_key_id: kms_key_id, license_model: license_model, manage_master_user_password: manage_master_user_password, master_user_authentication_type: master_user_authentication_type, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, master_username: master_username, max_allocated_storage: max_allocated_storage, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, multi_az: multi_az, multi_tenant: multi_tenant, nchar_character_set_name: nchar_character_set_name, network_type: network_type, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, performance_insights_retention_period: performance_insights_retention_period, port: port, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, processor_features: processor_features, promotion_tier: promotion_tier, publicly_accessible: publicly_accessible, storage_encrypted: storage_encrypted, storage_throughput: storage_throughput, storage_type: storage_type, tag_specifications: tag_specifications, tags: tags, tde_credential_arn: tde_credential_arn, tde_credential_password: tde_credential_password, timezone: timezone, vpc_security_group_ids: vpc_security_group_ids)
        create_db_instance(input)
      end
      def create_db_instance(input : Types::CreateDBInstanceMessage) : Types::CreateDBInstanceResult
        request = Protocol::Query.build_request(Model::CREATE_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBInstanceResult, "CreateDBInstance")
      end

      # Creates a new DB instance that acts as a read replica for an existing source DB instance or Multi-AZ
      # DB cluster. You can create a read replica for a DB instance running Db2, MariaDB, MySQL, Oracle,
      # PostgreSQL, or SQL Server. You can create a read replica for a Multi-AZ DB cluster running MySQL or
      # PostgreSQL. For more information, see Working with read replicas and Migrating from a Multi-AZ DB
      # cluster to a DB instance using a read replica in the Amazon RDS User Guide . Amazon Aurora doesn't
      # support this operation. To create a DB instance for an Aurora DB cluster, use the CreateDBInstance
      # operation. RDS creates read replicas with backups disabled. All other attributes (including DB
      # security groups and DB parameter groups) are inherited from the source DB instance or cluster,
      # except as specified. Your source DB instance or cluster must have backup retention enabled.
      def create_db_instance_read_replica(
        db_instance_identifier : String,
        additional_storage_volumes : Array(Types::AdditionalStorageVolume)? = nil,
        allocated_storage : Int32? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        availability_zone : String? = nil,
        backup_target : String? = nil,
        ca_certificate_identifier : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        custom_iam_instance_profile : String? = nil,
        db_instance_class : String? = nil,
        db_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        database_insights_mode : String? = nil,
        dedicated_log_volume : Bool? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_auth_secret_arn : String? = nil,
        domain_dns_ips : Array(String)? = nil,
        domain_fqdn : String? = nil,
        domain_iam_role_name : String? = nil,
        domain_ou : String? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_customer_owned_ip : Bool? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        iops : Int32? = nil,
        kms_key_id : String? = nil,
        max_allocated_storage : Int32? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        multi_az : Bool? = nil,
        network_type : String? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        performance_insights_retention_period : Int32? = nil,
        port : Int32? = nil,
        pre_signed_url : String? = nil,
        processor_features : Array(Types::ProcessorFeature)? = nil,
        publicly_accessible : Bool? = nil,
        replica_mode : String? = nil,
        source_db_cluster_identifier : String? = nil,
        source_db_instance_identifier : String? = nil,
        storage_throughput : Int32? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        upgrade_storage_config : Bool? = nil,
        use_default_processor_features : Bool? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateDBInstanceReadReplicaResult
        input = Types::CreateDBInstanceReadReplicaMessage.new(db_instance_identifier: db_instance_identifier, additional_storage_volumes: additional_storage_volumes, allocated_storage: allocated_storage, auto_minor_version_upgrade: auto_minor_version_upgrade, availability_zone: availability_zone, backup_target: backup_target, ca_certificate_identifier: ca_certificate_identifier, copy_tags_to_snapshot: copy_tags_to_snapshot, custom_iam_instance_profile: custom_iam_instance_profile, db_instance_class: db_instance_class, db_parameter_group_name: db_parameter_group_name, db_subnet_group_name: db_subnet_group_name, database_insights_mode: database_insights_mode, dedicated_log_volume: dedicated_log_volume, deletion_protection: deletion_protection, domain: domain, domain_auth_secret_arn: domain_auth_secret_arn, domain_dns_ips: domain_dns_ips, domain_fqdn: domain_fqdn, domain_iam_role_name: domain_iam_role_name, domain_ou: domain_ou, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_customer_owned_ip: enable_customer_owned_ip, enable_iam_database_authentication: enable_iam_database_authentication, enable_performance_insights: enable_performance_insights, iops: iops, kms_key_id: kms_key_id, max_allocated_storage: max_allocated_storage, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, multi_az: multi_az, network_type: network_type, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, performance_insights_retention_period: performance_insights_retention_period, port: port, pre_signed_url: pre_signed_url, processor_features: processor_features, publicly_accessible: publicly_accessible, replica_mode: replica_mode, source_db_cluster_identifier: source_db_cluster_identifier, source_db_instance_identifier: source_db_instance_identifier, storage_throughput: storage_throughput, storage_type: storage_type, tag_specifications: tag_specifications, tags: tags, upgrade_storage_config: upgrade_storage_config, use_default_processor_features: use_default_processor_features, vpc_security_group_ids: vpc_security_group_ids)
        create_db_instance_read_replica(input)
      end
      def create_db_instance_read_replica(input : Types::CreateDBInstanceReadReplicaMessage) : Types::CreateDBInstanceReadReplicaResult
        request = Protocol::Query.build_request(Model::CREATE_DB_INSTANCE_READ_REPLICA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBInstanceReadReplicaResult, "CreateDBInstanceReadReplica")
      end

      # Creates a new DB parameter group. A DB parameter group is initially created with the default
      # parameters for the database engine used by the DB instance. To provide custom values for any of the
      # parameters, you must modify the group after creating it using ModifyDBParameterGroup . Once you've
      # created a DB parameter group, you need to associate it with your DB instance using ModifyDBInstance
      # . When you associate a new DB parameter group with a running DB instance, you need to reboot the DB
      # instance without failover for the new DB parameter group and associated settings to take effect.
      # This command doesn't apply to RDS Custom.
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

      # Creates a new DB proxy.
      def create_db_proxy(
        db_proxy_name : String,
        engine_family : String,
        role_arn : String,
        vpc_subnet_ids : Array(String),
        auth : Array(Types::UserAuthConfig)? = nil,
        debug_logging : Bool? = nil,
        default_auth_scheme : String? = nil,
        endpoint_network_type : String? = nil,
        idle_client_timeout : Int32? = nil,
        require_tls : Bool? = nil,
        tags : Array(Types::Tag)? = nil,
        target_connection_network_type : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateDBProxyResponse
        input = Types::CreateDBProxyRequest.new(db_proxy_name: db_proxy_name, engine_family: engine_family, role_arn: role_arn, vpc_subnet_ids: vpc_subnet_ids, auth: auth, debug_logging: debug_logging, default_auth_scheme: default_auth_scheme, endpoint_network_type: endpoint_network_type, idle_client_timeout: idle_client_timeout, require_tls: require_tls, tags: tags, target_connection_network_type: target_connection_network_type, vpc_security_group_ids: vpc_security_group_ids)
        create_db_proxy(input)
      end
      def create_db_proxy(input : Types::CreateDBProxyRequest) : Types::CreateDBProxyResponse
        request = Protocol::Query.build_request(Model::CREATE_DB_PROXY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBProxyResponse, "CreateDBProxy")
      end

      # Creates a DBProxyEndpoint . Only applies to proxies that are associated with Aurora DB clusters. You
      # can use DB proxy endpoints to specify read/write or read-only access to the DB cluster. You can also
      # use DB proxy endpoints to access a DB proxy through a different VPC than the proxy's default VPC.
      def create_db_proxy_endpoint(
        db_proxy_endpoint_name : String,
        db_proxy_name : String,
        vpc_subnet_ids : Array(String),
        endpoint_network_type : String? = nil,
        tags : Array(Types::Tag)? = nil,
        target_role : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateDBProxyEndpointResponse
        input = Types::CreateDBProxyEndpointRequest.new(db_proxy_endpoint_name: db_proxy_endpoint_name, db_proxy_name: db_proxy_name, vpc_subnet_ids: vpc_subnet_ids, endpoint_network_type: endpoint_network_type, tags: tags, target_role: target_role, vpc_security_group_ids: vpc_security_group_ids)
        create_db_proxy_endpoint(input)
      end
      def create_db_proxy_endpoint(input : Types::CreateDBProxyEndpointRequest) : Types::CreateDBProxyEndpointResponse
        request = Protocol::Query.build_request(Model::CREATE_DB_PROXY_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBProxyEndpointResponse, "CreateDBProxyEndpoint")
      end

      # Creates a new DB security group. DB security groups control access to a DB instance. A DB security
      # group controls access to EC2-Classic DB instances that are not in a VPC. EC2-Classic was retired on
      # August 15, 2022. If you haven't migrated from EC2-Classic to a VPC, we recommend that you migrate as
      # soon as possible. For more information, see Migrate from EC2-Classic to a VPC in the Amazon EC2 User
      # Guide , the blog EC2-Classic Networking is Retiring – Here’s How to Prepare , and Moving a DB
      # instance not in a VPC into a VPC in the Amazon RDS User Guide .
      def create_db_security_group(
        db_security_group_description : String,
        db_security_group_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDBSecurityGroupResult
        input = Types::CreateDBSecurityGroupMessage.new(db_security_group_description: db_security_group_description, db_security_group_name: db_security_group_name, tags: tags)
        create_db_security_group(input)
      end
      def create_db_security_group(input : Types::CreateDBSecurityGroupMessage) : Types::CreateDBSecurityGroupResult
        request = Protocol::Query.build_request(Model::CREATE_DB_SECURITY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBSecurityGroupResult, "CreateDBSecurityGroup")
      end

      # Creates a new DB shard group for Aurora Limitless Database. You must enable Aurora Limitless
      # Database to create a DB shard group. Valid for: Aurora DB clusters only
      def create_db_shard_group(
        db_cluster_identifier : String,
        db_shard_group_identifier : String,
        max_acu : Float64,
        compute_redundancy : Int32? = nil,
        min_acu : Float64? = nil,
        publicly_accessible : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::DBShardGroup
        input = Types::CreateDBShardGroupMessage.new(db_cluster_identifier: db_cluster_identifier, db_shard_group_identifier: db_shard_group_identifier, max_acu: max_acu, compute_redundancy: compute_redundancy, min_acu: min_acu, publicly_accessible: publicly_accessible, tags: tags)
        create_db_shard_group(input)
      end
      def create_db_shard_group(input : Types::CreateDBShardGroupMessage) : Types::DBShardGroup
        request = Protocol::Query.build_request(Model::CREATE_DB_SHARD_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBShardGroup, "CreateDBShardGroup")
      end

      # Creates a snapshot of a DB instance. The source DB instance must be in the available or
      # storage-optimization state.
      def create_db_snapshot(
        db_instance_identifier : String,
        db_snapshot_identifier : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDBSnapshotResult
        input = Types::CreateDBSnapshotMessage.new(db_instance_identifier: db_instance_identifier, db_snapshot_identifier: db_snapshot_identifier, tags: tags)
        create_db_snapshot(input)
      end
      def create_db_snapshot(input : Types::CreateDBSnapshotMessage) : Types::CreateDBSnapshotResult
        request = Protocol::Query.build_request(Model::CREATE_DB_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDBSnapshotResult, "CreateDBSnapshot")
      end

      # Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least two AZs
      # in the Amazon Web Services Region.
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

      # Creates an RDS event notification subscription. This operation requires a topic Amazon Resource Name
      # (ARN) created by either the RDS console, the SNS console, or the SNS API. To obtain an ARN with SNS,
      # you must create a topic in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS
      # console. You can specify the type of source ( SourceType ) that you want to be notified of and
      # provide a list of RDS sources ( SourceIds ) that triggers the events. You can also provide a list of
      # event categories ( EventCategories ) for events that you want to be notified of. For example, you
      # can specify SourceType = db-instance , SourceIds = mydbinstance1 , mydbinstance2 and EventCategories
      # = Availability , Backup . If you specify both the SourceType and SourceIds , such as SourceType =
      # db-instance and SourceIds = myDBInstance1 , you are notified of all the db-instance events for the
      # specified source. If you specify a SourceType but do not specify SourceIds , you receive notice of
      # the events for that source type for all your RDS sources. If you don't specify either the SourceType
      # or the SourceIds , you are notified of events generated from all RDS sources belonging to your
      # customer account. For more information about subscribing to an event for RDS DB engines, see
      # Subscribing to Amazon RDS event notification in the Amazon RDS User Guide . For more information
      # about subscribing to an event for Aurora DB engines, see Subscribing to Amazon RDS event
      # notification in the Amazon Aurora User Guide .
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

      # Creates an Aurora global database spread across multiple Amazon Web Services Regions. The global
      # database contains a single primary cluster with read-write capability, and a read-only secondary
      # cluster that receives data from the primary cluster through high-speed replication performed by the
      # Aurora storage subsystem. You can create a global database that is initially empty, and then create
      # the primary and secondary DB clusters in the global database. Or you can specify an existing Aurora
      # cluster during the create operation, and this cluster becomes the primary cluster of the global
      # database. This operation applies only to Aurora DB clusters.
      def create_global_cluster(
        global_cluster_identifier : String,
        database_name : String? = nil,
        deletion_protection : Bool? = nil,
        engine : String? = nil,
        engine_lifecycle_support : String? = nil,
        engine_version : String? = nil,
        source_db_cluster_identifier : String? = nil,
        storage_encrypted : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateGlobalClusterResult
        input = Types::CreateGlobalClusterMessage.new(global_cluster_identifier: global_cluster_identifier, database_name: database_name, deletion_protection: deletion_protection, engine: engine, engine_lifecycle_support: engine_lifecycle_support, engine_version: engine_version, source_db_cluster_identifier: source_db_cluster_identifier, storage_encrypted: storage_encrypted, tags: tags)
        create_global_cluster(input)
      end
      def create_global_cluster(input : Types::CreateGlobalClusterMessage) : Types::CreateGlobalClusterResult
        request = Protocol::Query.build_request(Model::CREATE_GLOBAL_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateGlobalClusterResult, "CreateGlobalCluster")
      end

      # Creates a zero-ETL integration with Amazon Redshift.
      def create_integration(
        integration_name : String,
        source_arn : String,
        target_arn : String,
        additional_encryption_context : Hash(String, String)? = nil,
        data_filter : String? = nil,
        description : String? = nil,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::Integration
        input = Types::CreateIntegrationMessage.new(integration_name: integration_name, source_arn: source_arn, target_arn: target_arn, additional_encryption_context: additional_encryption_context, data_filter: data_filter, description: description, kms_key_id: kms_key_id, tags: tags)
        create_integration(input)
      end
      def create_integration(input : Types::CreateIntegrationMessage) : Types::Integration
        request = Protocol::Query.build_request(Model::CREATE_INTEGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::Integration, "CreateIntegration")
      end

      # Creates a new option group. You can create up to 20 option groups. This command doesn't apply to RDS
      # Custom.
      def create_option_group(
        engine_name : String,
        major_engine_version : String,
        option_group_description : String,
        option_group_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateOptionGroupResult
        input = Types::CreateOptionGroupMessage.new(engine_name: engine_name, major_engine_version: major_engine_version, option_group_description: option_group_description, option_group_name: option_group_name, tags: tags)
        create_option_group(input)
      end
      def create_option_group(input : Types::CreateOptionGroupMessage) : Types::CreateOptionGroupResult
        request = Protocol::Query.build_request(Model::CREATE_OPTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateOptionGroupResult, "CreateOptionGroup")
      end

      # Creates a tenant database in a DB instance that uses the multi-tenant configuration. Only RDS for
      # Oracle container database (CDB) instances are supported.
      def create_tenant_database(
        db_instance_identifier : String,
        master_username : String,
        tenant_db_name : String,
        character_set_name : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        nchar_character_set_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTenantDatabaseResult
        input = Types::CreateTenantDatabaseMessage.new(db_instance_identifier: db_instance_identifier, master_username: master_username, tenant_db_name: tenant_db_name, character_set_name: character_set_name, manage_master_user_password: manage_master_user_password, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, nchar_character_set_name: nchar_character_set_name, tags: tags)
        create_tenant_database(input)
      end
      def create_tenant_database(input : Types::CreateTenantDatabaseMessage) : Types::CreateTenantDatabaseResult
        request = Protocol::Query.build_request(Model::CREATE_TENANT_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateTenantDatabaseResult, "CreateTenantDatabase")
      end

      # Deletes a blue/green deployment. For more information, see Using Amazon RDS Blue/Green Deployments
      # for database updates in the Amazon RDS User Guide and Using Amazon RDS Blue/Green Deployments for
      # database updates in the Amazon Aurora User Guide .
      def delete_blue_green_deployment(
        blue_green_deployment_identifier : String,
        delete_target : Bool? = nil
      ) : Types::DeleteBlueGreenDeploymentResponse
        input = Types::DeleteBlueGreenDeploymentRequest.new(blue_green_deployment_identifier: blue_green_deployment_identifier, delete_target: delete_target)
        delete_blue_green_deployment(input)
      end
      def delete_blue_green_deployment(input : Types::DeleteBlueGreenDeploymentRequest) : Types::DeleteBlueGreenDeploymentResponse
        request = Protocol::Query.build_request(Model::DELETE_BLUE_GREEN_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteBlueGreenDeploymentResponse, "DeleteBlueGreenDeployment")
      end

      # Deletes a custom engine version. To run this command, make sure you meet the following
      # prerequisites: The CEV must not be the default for RDS Custom. If it is, change the default before
      # running this command. The CEV must not be associated with an RDS Custom DB instance, RDS Custom
      # instance snapshot, or automated backup of your RDS Custom instance. Typically, deletion takes a few
      # minutes. The MediaImport service that imports files from Amazon S3 to create CEVs isn't integrated
      # with Amazon Web Services CloudTrail. If you turn on data logging for Amazon RDS in CloudTrail, calls
      # to the DeleteCustomDbEngineVersion event aren't logged. However, you might see calls from the API
      # gateway that accesses your Amazon S3 bucket. These calls originate from the MediaImport service for
      # the DeleteCustomDbEngineVersion event. For more information, see Deleting a CEV in the Amazon RDS
      # User Guide .
      def delete_custom_db_engine_version(
        engine : String,
        engine_version : String
      ) : Types::DBEngineVersion
        input = Types::DeleteCustomDBEngineVersionMessage.new(engine: engine, engine_version: engine_version)
        delete_custom_db_engine_version(input)
      end
      def delete_custom_db_engine_version(input : Types::DeleteCustomDBEngineVersionMessage) : Types::DBEngineVersion
        request = Protocol::Query.build_request(Model::DELETE_CUSTOM_DB_ENGINE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBEngineVersion, "DeleteCustomDBEngineVersion")
      end

      # The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB
      # cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual DB
      # cluster snapshots of the specified DB cluster are not deleted. If you're deleting a Multi-AZ DB
      # cluster with read replicas, all cluster members are terminated and read replicas are promoted to
      # standalone instances. For more information on Amazon Aurora, see What is Amazon Aurora? in the
      # Amazon Aurora User Guide . For more information on Multi-AZ DB clusters, see Multi-AZ DB cluster
      # deployments in the Amazon RDS User Guide .
      def delete_db_cluster(
        db_cluster_identifier : String,
        delete_automated_backups : Bool? = nil,
        final_db_snapshot_identifier : String? = nil,
        skip_final_snapshot : Bool? = nil
      ) : Types::DeleteDBClusterResult
        input = Types::DeleteDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, delete_automated_backups: delete_automated_backups, final_db_snapshot_identifier: final_db_snapshot_identifier, skip_final_snapshot: skip_final_snapshot)
        delete_db_cluster(input)
      end
      def delete_db_cluster(input : Types::DeleteDBClusterMessage) : Types::DeleteDBClusterResult
        request = Protocol::Query.build_request(Model::DELETE_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBClusterResult, "DeleteDBCluster")
      end

      # Deletes automated backups using the DbClusterResourceId value of the source DB cluster or the Amazon
      # Resource Name (ARN) of the automated backups.
      def delete_db_cluster_automated_backup(
        db_cluster_resource_id : String
      ) : Types::DeleteDBClusterAutomatedBackupResult
        input = Types::DeleteDBClusterAutomatedBackupMessage.new(db_cluster_resource_id: db_cluster_resource_id)
        delete_db_cluster_automated_backup(input)
      end
      def delete_db_cluster_automated_backup(input : Types::DeleteDBClusterAutomatedBackupMessage) : Types::DeleteDBClusterAutomatedBackupResult
        request = Protocol::Query.build_request(Model::DELETE_DB_CLUSTER_AUTOMATED_BACKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBClusterAutomatedBackupResult, "DeleteDBClusterAutomatedBackup")
      end

      # Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster. This action only applies
      # to Aurora DB clusters.
      def delete_db_cluster_endpoint(
        db_cluster_endpoint_identifier : String
      ) : Types::DBClusterEndpoint
        input = Types::DeleteDBClusterEndpointMessage.new(db_cluster_endpoint_identifier: db_cluster_endpoint_identifier)
        delete_db_cluster_endpoint(input)
      end
      def delete_db_cluster_endpoint(input : Types::DeleteDBClusterEndpointMessage) : Types::DBClusterEndpoint
        request = Protocol::Query.build_request(Model::DELETE_DB_CLUSTER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterEndpoint, "DeleteDBClusterEndpoint")
      end

      # Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted can't
      # be associated with any DB clusters. For more information on Amazon Aurora, see What is Amazon
      # Aurora? in the Amazon Aurora User Guide . For more information on Multi-AZ DB clusters, see Multi-AZ
      # DB cluster deployments in the Amazon RDS User Guide .
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
      # The DB cluster snapshot must be in the available state to be deleted. For more information on Amazon
      # Aurora, see What is Amazon Aurora? in the Amazon Aurora User Guide . For more information on
      # Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in the Amazon RDS User Guide .
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

      # Deletes a previously provisioned DB instance. When you delete a DB instance, all automated backups
      # for that instance are deleted and can't be recovered. However, manual DB snapshots of the DB
      # instance aren't deleted. If you request a final DB snapshot, the status of the Amazon RDS DB
      # instance is deleting until the DB snapshot is created. This operation can't be canceled or reverted
      # after it begins. To monitor the status of this operation, use DescribeDBInstance . When a DB
      # instance is in a failure state and has a status of failed , incompatible-restore , or
      # incompatible-network , you can only delete it when you skip creation of the final snapshot with the
      # SkipFinalSnapshot parameter. If the specified DB instance is part of an Amazon Aurora DB cluster,
      # you can't delete the DB instance if both of the following conditions are true: The DB cluster is a
      # read replica of another Amazon Aurora DB cluster. The DB instance is the only instance in the DB
      # cluster. To delete a DB instance in this case, first use the PromoteReadReplicaDBCluster operation
      # to promote the DB cluster so that it's no longer a read replica. After the promotion completes, use
      # the DeleteDBInstance operation to delete the final instance in the DB cluster. For RDS Custom DB
      # instances, deleting the DB instance permanently deletes the EC2 instance and the associated EBS
      # volumes. Make sure that you don't terminate or delete these resources before you delete the DB
      # instance. Otherwise, deleting the DB instance and creation of the final snapshot might fail.
      def delete_db_instance(
        db_instance_identifier : String,
        delete_automated_backups : Bool? = nil,
        final_db_snapshot_identifier : String? = nil,
        skip_final_snapshot : Bool? = nil
      ) : Types::DeleteDBInstanceResult
        input = Types::DeleteDBInstanceMessage.new(db_instance_identifier: db_instance_identifier, delete_automated_backups: delete_automated_backups, final_db_snapshot_identifier: final_db_snapshot_identifier, skip_final_snapshot: skip_final_snapshot)
        delete_db_instance(input)
      end
      def delete_db_instance(input : Types::DeleteDBInstanceMessage) : Types::DeleteDBInstanceResult
        request = Protocol::Query.build_request(Model::DELETE_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBInstanceResult, "DeleteDBInstance")
      end

      # Deletes automated backups using the DbiResourceId value of the source DB instance or the Amazon
      # Resource Name (ARN) of the automated backups.
      def delete_db_instance_automated_backup(
        db_instance_automated_backups_arn : String? = nil,
        dbi_resource_id : String? = nil
      ) : Types::DeleteDBInstanceAutomatedBackupResult
        input = Types::DeleteDBInstanceAutomatedBackupMessage.new(db_instance_automated_backups_arn: db_instance_automated_backups_arn, dbi_resource_id: dbi_resource_id)
        delete_db_instance_automated_backup(input)
      end
      def delete_db_instance_automated_backup(input : Types::DeleteDBInstanceAutomatedBackupMessage) : Types::DeleteDBInstanceAutomatedBackupResult
        request = Protocol::Query.build_request(Model::DELETE_DB_INSTANCE_AUTOMATED_BACKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBInstanceAutomatedBackupResult, "DeleteDBInstanceAutomatedBackup")
      end

      # Deletes a specified DB parameter group. The DB parameter group to be deleted can't be associated
      # with any DB instances.
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

      # Deletes an existing DB proxy.
      def delete_db_proxy(
        db_proxy_name : String
      ) : Types::DeleteDBProxyResponse
        input = Types::DeleteDBProxyRequest.new(db_proxy_name: db_proxy_name)
        delete_db_proxy(input)
      end
      def delete_db_proxy(input : Types::DeleteDBProxyRequest) : Types::DeleteDBProxyResponse
        request = Protocol::Query.build_request(Model::DELETE_DB_PROXY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBProxyResponse, "DeleteDBProxy")
      end

      # Deletes a DBProxyEndpoint . Doing so removes the ability to access the DB proxy using the endpoint
      # that you defined. The endpoint that you delete might have provided capabilities such as read/write
      # or read-only operations, or using a different VPC than the DB proxy's default VPC.
      def delete_db_proxy_endpoint(
        db_proxy_endpoint_name : String
      ) : Types::DeleteDBProxyEndpointResponse
        input = Types::DeleteDBProxyEndpointRequest.new(db_proxy_endpoint_name: db_proxy_endpoint_name)
        delete_db_proxy_endpoint(input)
      end
      def delete_db_proxy_endpoint(input : Types::DeleteDBProxyEndpointRequest) : Types::DeleteDBProxyEndpointResponse
        request = Protocol::Query.build_request(Model::DELETE_DB_PROXY_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBProxyEndpointResponse, "DeleteDBProxyEndpoint")
      end

      # Deletes a DB security group. The specified DB security group must not be associated with any DB
      # instances. EC2-Classic was retired on August 15, 2022. If you haven't migrated from EC2-Classic to a
      # VPC, we recommend that you migrate as soon as possible. For more information, see Migrate from
      # EC2-Classic to a VPC in the Amazon EC2 User Guide , the blog EC2-Classic Networking is Retiring –
      # Here’s How to Prepare , and Moving a DB instance not in a VPC into a VPC in the Amazon RDS User
      # Guide .
      def delete_db_security_group(
        db_security_group_name : String
      ) : Nil
        input = Types::DeleteDBSecurityGroupMessage.new(db_security_group_name: db_security_group_name)
        delete_db_security_group(input)
      end
      def delete_db_security_group(input : Types::DeleteDBSecurityGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_DB_SECURITY_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Aurora Limitless Database DB shard group.
      def delete_db_shard_group(
        db_shard_group_identifier : String
      ) : Types::DBShardGroup
        input = Types::DeleteDBShardGroupMessage.new(db_shard_group_identifier: db_shard_group_identifier)
        delete_db_shard_group(input)
      end
      def delete_db_shard_group(input : Types::DeleteDBShardGroupMessage) : Types::DBShardGroup
        request = Protocol::Query.build_request(Model::DELETE_DB_SHARD_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBShardGroup, "DeleteDBShardGroup")
      end

      # Deletes a DB snapshot. If the snapshot is being copied, the copy operation is terminated. The DB
      # snapshot must be in the available state to be deleted.
      def delete_db_snapshot(
        db_snapshot_identifier : String
      ) : Types::DeleteDBSnapshotResult
        input = Types::DeleteDBSnapshotMessage.new(db_snapshot_identifier: db_snapshot_identifier)
        delete_db_snapshot(input)
      end
      def delete_db_snapshot(input : Types::DeleteDBSnapshotMessage) : Types::DeleteDBSnapshotResult
        request = Protocol::Query.build_request(Model::DELETE_DB_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDBSnapshotResult, "DeleteDBSnapshot")
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

      # Deletes an RDS event notification subscription.
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

      # Deletes a global database cluster. The primary and secondary clusters must already be detached or
      # destroyed first. This action only applies to Aurora DB clusters.
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

      # Deletes a zero-ETL integration with Amazon Redshift.
      def delete_integration(
        integration_identifier : String
      ) : Types::Integration
        input = Types::DeleteIntegrationMessage.new(integration_identifier: integration_identifier)
        delete_integration(input)
      end
      def delete_integration(input : Types::DeleteIntegrationMessage) : Types::Integration
        request = Protocol::Query.build_request(Model::DELETE_INTEGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::Integration, "DeleteIntegration")
      end

      # Deletes an existing option group.
      def delete_option_group(
        option_group_name : String
      ) : Nil
        input = Types::DeleteOptionGroupMessage.new(option_group_name: option_group_name)
        delete_option_group(input)
      end
      def delete_option_group(input : Types::DeleteOptionGroupMessage) : Nil
        request = Protocol::Query.build_request(Model::DELETE_OPTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a tenant database from your DB instance. This command only applies to RDS for Oracle
      # container database (CDB) instances. You can't delete a tenant database when it is the only tenant in
      # the DB instance.
      def delete_tenant_database(
        db_instance_identifier : String,
        tenant_db_name : String,
        final_db_snapshot_identifier : String? = nil,
        skip_final_snapshot : Bool? = nil
      ) : Types::DeleteTenantDatabaseResult
        input = Types::DeleteTenantDatabaseMessage.new(db_instance_identifier: db_instance_identifier, tenant_db_name: tenant_db_name, final_db_snapshot_identifier: final_db_snapshot_identifier, skip_final_snapshot: skip_final_snapshot)
        delete_tenant_database(input)
      end
      def delete_tenant_database(input : Types::DeleteTenantDatabaseMessage) : Types::DeleteTenantDatabaseResult
        request = Protocol::Query.build_request(Model::DELETE_TENANT_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteTenantDatabaseResult, "DeleteTenantDatabase")
      end

      # Remove the association between one or more DBProxyTarget data structures and a DBProxyTargetGroup .
      def deregister_db_proxy_targets(
        db_proxy_name : String,
        db_cluster_identifiers : Array(String)? = nil,
        db_instance_identifiers : Array(String)? = nil,
        target_group_name : String? = nil
      ) : Types::DeregisterDBProxyTargetsResponse
        input = Types::DeregisterDBProxyTargetsRequest.new(db_proxy_name: db_proxy_name, db_cluster_identifiers: db_cluster_identifiers, db_instance_identifiers: db_instance_identifiers, target_group_name: target_group_name)
        deregister_db_proxy_targets(input)
      end
      def deregister_db_proxy_targets(input : Types::DeregisterDBProxyTargetsRequest) : Types::DeregisterDBProxyTargetsResponse
        request = Protocol::Query.build_request(Model::DEREGISTER_DB_PROXY_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeregisterDBProxyTargetsResponse, "DeregisterDBProxyTargets")
      end

      # Lists all of the attributes for a customer account. The attributes include Amazon RDS quotas for the
      # account, such as the number of DB instances allowed. The description for a quota includes the quota
      # name, current usage toward that quota, and the quota's maximum value. This command doesn't take any
      # parameters.
      def describe_account_attributes : Types::AccountAttributesMessage
        input = Types::DescribeAccountAttributesMessage.new
        describe_account_attributes(input)
      end
      def describe_account_attributes(input : Types::DescribeAccountAttributesMessage) : Types::AccountAttributesMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_ACCOUNT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::AccountAttributesMessage, "DescribeAccountAttributes")
      end

      # Describes one or more blue/green deployments. For more information, see Using Amazon RDS Blue/Green
      # Deployments for database updates in the Amazon RDS User Guide and Using Amazon RDS Blue/Green
      # Deployments for database updates in the Amazon Aurora User Guide .
      def describe_blue_green_deployments(
        blue_green_deployment_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeBlueGreenDeploymentsResponse
        input = Types::DescribeBlueGreenDeploymentsRequest.new(blue_green_deployment_identifier: blue_green_deployment_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_blue_green_deployments(input)
      end
      def describe_blue_green_deployments(input : Types::DescribeBlueGreenDeploymentsRequest) : Types::DescribeBlueGreenDeploymentsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_BLUE_GREEN_DEPLOYMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeBlueGreenDeploymentsResponse, "DescribeBlueGreenDeployments")
      end

      # Lists the set of certificate authority (CA) certificates provided by Amazon RDS for this Amazon Web
      # Services account. For more information, see Using SSL/TLS to encrypt a connection to a DB instance
      # in the Amazon RDS User Guide and Using SSL/TLS to encrypt a connection to a DB cluster in the Amazon
      # Aurora User Guide .
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

      # Displays backups for both current and deleted DB clusters. For example, use this operation to find
      # details about automated backups for previously deleted clusters. Current clusters are returned for
      # both the DescribeDBClusterAutomatedBackups and DescribeDBClusters operations. All parameters are
      # optional.
      def describe_db_cluster_automated_backups(
        db_cluster_identifier : String? = nil,
        db_cluster_resource_id : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBClusterAutomatedBackupMessage
        input = Types::DescribeDBClusterAutomatedBackupsMessage.new(db_cluster_identifier: db_cluster_identifier, db_cluster_resource_id: db_cluster_resource_id, filters: filters, marker: marker, max_records: max_records)
        describe_db_cluster_automated_backups(input)
      end
      def describe_db_cluster_automated_backups(input : Types::DescribeDBClusterAutomatedBackupsMessage) : Types::DBClusterAutomatedBackupMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTER_AUTOMATED_BACKUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterAutomatedBackupMessage, "DescribeDBClusterAutomatedBackups")
      end

      # Returns information about backtracks for a DB cluster. For more information on Amazon Aurora, see
      # What is Amazon Aurora? in the Amazon Aurora User Guide . This action only applies to Aurora MySQL DB
      # clusters.
      def describe_db_cluster_backtracks(
        db_cluster_identifier : String,
        backtrack_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBClusterBacktrackMessage
        input = Types::DescribeDBClusterBacktracksMessage.new(db_cluster_identifier: db_cluster_identifier, backtrack_identifier: backtrack_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_db_cluster_backtracks(input)
      end
      def describe_db_cluster_backtracks(input : Types::DescribeDBClusterBacktracksMessage) : Types::DBClusterBacktrackMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTER_BACKTRACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterBacktrackMessage, "DescribeDBClusterBacktracks")
      end

      # Returns information about endpoints for an Amazon Aurora DB cluster. This action only applies to
      # Aurora DB clusters.
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
      # group. For more information on Amazon Aurora, see What is Amazon Aurora? in the Amazon Aurora User
      # Guide . For more information on Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in the
      # Amazon RDS User Guide .
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

      # Returns the detailed parameter list for a particular DB cluster parameter group. For more
      # information on Amazon Aurora, see What is Amazon Aurora? in the Amazon Aurora User Guide . For more
      # information on Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in the Amazon RDS User
      # Guide .
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
      # When sharing snapshots with other Amazon Web Services accounts, DescribeDBClusterSnapshotAttributes
      # returns the restore attribute and a list of IDs for the Amazon Web Services accounts that are
      # authorized to copy or restore the manual DB cluster snapshot. If all is included in the list of
      # values for the restore attribute, then the manual DB cluster snapshot is public and can be copied or
      # restored by all Amazon Web Services accounts. To add or remove access for an Amazon Web Services
      # account to copy or restore a manual DB cluster snapshot, or to make the manual DB cluster snapshot
      # public or private, use the ModifyDBClusterSnapshotAttribute API action.
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

      # Returns information about DB cluster snapshots. This API action supports pagination. For more
      # information on Amazon Aurora DB clusters, see What is Amazon Aurora? in the Amazon Aurora User Guide
      # . For more information on Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in the Amazon
      # RDS User Guide .
      def describe_db_cluster_snapshots(
        db_cluster_identifier : String? = nil,
        db_cluster_snapshot_identifier : String? = nil,
        db_cluster_resource_id : String? = nil,
        filters : Array(Types::Filter)? = nil,
        include_public : Bool? = nil,
        include_shared : Bool? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        snapshot_type : String? = nil
      ) : Types::DBClusterSnapshotMessage
        input = Types::DescribeDBClusterSnapshotsMessage.new(db_cluster_identifier: db_cluster_identifier, db_cluster_snapshot_identifier: db_cluster_snapshot_identifier, db_cluster_resource_id: db_cluster_resource_id, filters: filters, include_public: include_public, include_shared: include_shared, marker: marker, max_records: max_records, snapshot_type: snapshot_type)
        describe_db_cluster_snapshots(input)
      end
      def describe_db_cluster_snapshots(input : Types::DescribeDBClusterSnapshotsMessage) : Types::DBClusterSnapshotMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTER_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterSnapshotMessage, "DescribeDBClusterSnapshots")
      end

      # Describes existing Amazon Aurora DB clusters and Multi-AZ DB clusters. This API supports pagination.
      # For more information on Amazon Aurora DB clusters, see What is Amazon Aurora? in the Amazon Aurora
      # User Guide . For more information on Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in
      # the Amazon RDS User Guide . This operation can also return information for Amazon Neptune DB
      # instances and Amazon DocumentDB instances.
      def describe_db_clusters(
        db_cluster_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        include_shared : Bool? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBClusterMessage
        input = Types::DescribeDBClustersMessage.new(db_cluster_identifier: db_cluster_identifier, filters: filters, include_shared: include_shared, marker: marker, max_records: max_records)
        describe_db_clusters(input)
      end
      def describe_db_clusters(input : Types::DescribeDBClustersMessage) : Types::DBClusterMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterMessage, "DescribeDBClusters")
      end

      # Describes the properties of specific versions of DB engines.
      def describe_db_engine_versions(
        db_parameter_group_family : String? = nil,
        default_only : Bool? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        filters : Array(Types::Filter)? = nil,
        include_all : Bool? = nil,
        list_supported_character_sets : Bool? = nil,
        list_supported_timezones : Bool? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBEngineVersionMessage
        input = Types::DescribeDBEngineVersionsMessage.new(db_parameter_group_family: db_parameter_group_family, default_only: default_only, engine: engine, engine_version: engine_version, filters: filters, include_all: include_all, list_supported_character_sets: list_supported_character_sets, list_supported_timezones: list_supported_timezones, marker: marker, max_records: max_records)
        describe_db_engine_versions(input)
      end
      def describe_db_engine_versions(input : Types::DescribeDBEngineVersionsMessage) : Types::DBEngineVersionMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_ENGINE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBEngineVersionMessage, "DescribeDBEngineVersions")
      end

      # Displays backups for both current and deleted instances. For example, use this operation to find
      # details about automated backups for previously deleted instances. Current instances with retention
      # periods greater than zero (0) are returned for both the DescribeDBInstanceAutomatedBackups and
      # DescribeDBInstances operations. All parameters are optional.
      def describe_db_instance_automated_backups(
        db_instance_automated_backups_arn : String? = nil,
        db_instance_identifier : String? = nil,
        dbi_resource_id : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBInstanceAutomatedBackupMessage
        input = Types::DescribeDBInstanceAutomatedBackupsMessage.new(db_instance_automated_backups_arn: db_instance_automated_backups_arn, db_instance_identifier: db_instance_identifier, dbi_resource_id: dbi_resource_id, filters: filters, marker: marker, max_records: max_records)
        describe_db_instance_automated_backups(input)
      end
      def describe_db_instance_automated_backups(input : Types::DescribeDBInstanceAutomatedBackupsMessage) : Types::DBInstanceAutomatedBackupMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_INSTANCE_AUTOMATED_BACKUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBInstanceAutomatedBackupMessage, "DescribeDBInstanceAutomatedBackups")
      end

      # Describes provisioned RDS instances. This API supports pagination. This operation can also return
      # information for Amazon Neptune DB instances and Amazon DocumentDB instances.
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

      # Returns a list of DB log files for the DB instance. This command doesn't apply to RDS Custom.
      def describe_db_log_files(
        db_instance_identifier : String,
        file_last_written : Int64? = nil,
        file_size : Int64? = nil,
        filename_contains : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeDBLogFilesResponse
        input = Types::DescribeDBLogFilesMessage.new(db_instance_identifier: db_instance_identifier, file_last_written: file_last_written, file_size: file_size, filename_contains: filename_contains, filters: filters, marker: marker, max_records: max_records)
        describe_db_log_files(input)
      end
      def describe_db_log_files(input : Types::DescribeDBLogFilesMessage) : Types::DescribeDBLogFilesResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_LOG_FILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDBLogFilesResponse, "DescribeDBLogFiles")
      end

      # Describes the properties of specific major versions of DB engines.
      def describe_db_major_engine_versions(
        engine : String? = nil,
        major_engine_version : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeDBMajorEngineVersionsResponse
        input = Types::DescribeDBMajorEngineVersionsRequest.new(engine: engine, major_engine_version: major_engine_version, marker: marker, max_records: max_records)
        describe_db_major_engine_versions(input)
      end
      def describe_db_major_engine_versions(input : Types::DescribeDBMajorEngineVersionsRequest) : Types::DescribeDBMajorEngineVersionsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_MAJOR_ENGINE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDBMajorEngineVersionsResponse, "DescribeDBMajorEngineVersions")
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

      # Returns information about DB proxies.
      def describe_db_proxies(
        db_proxy_name : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeDBProxiesResponse
        input = Types::DescribeDBProxiesRequest.new(db_proxy_name: db_proxy_name, filters: filters, marker: marker, max_records: max_records)
        describe_db_proxies(input)
      end
      def describe_db_proxies(input : Types::DescribeDBProxiesRequest) : Types::DescribeDBProxiesResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_PROXIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDBProxiesResponse, "DescribeDBProxies")
      end

      # Returns information about DB proxy endpoints.
      def describe_db_proxy_endpoints(
        db_proxy_endpoint_name : String? = nil,
        db_proxy_name : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeDBProxyEndpointsResponse
        input = Types::DescribeDBProxyEndpointsRequest.new(db_proxy_endpoint_name: db_proxy_endpoint_name, db_proxy_name: db_proxy_name, filters: filters, marker: marker, max_records: max_records)
        describe_db_proxy_endpoints(input)
      end
      def describe_db_proxy_endpoints(input : Types::DescribeDBProxyEndpointsRequest) : Types::DescribeDBProxyEndpointsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_PROXY_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDBProxyEndpointsResponse, "DescribeDBProxyEndpoints")
      end

      # Returns information about DB proxy target groups, represented by DBProxyTargetGroup data structures.
      def describe_db_proxy_target_groups(
        db_proxy_name : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        target_group_name : String? = nil
      ) : Types::DescribeDBProxyTargetGroupsResponse
        input = Types::DescribeDBProxyTargetGroupsRequest.new(db_proxy_name: db_proxy_name, filters: filters, marker: marker, max_records: max_records, target_group_name: target_group_name)
        describe_db_proxy_target_groups(input)
      end
      def describe_db_proxy_target_groups(input : Types::DescribeDBProxyTargetGroupsRequest) : Types::DescribeDBProxyTargetGroupsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_PROXY_TARGET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDBProxyTargetGroupsResponse, "DescribeDBProxyTargetGroups")
      end

      # Returns information about DBProxyTarget objects. This API supports pagination.
      def describe_db_proxy_targets(
        db_proxy_name : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        target_group_name : String? = nil
      ) : Types::DescribeDBProxyTargetsResponse
        input = Types::DescribeDBProxyTargetsRequest.new(db_proxy_name: db_proxy_name, filters: filters, marker: marker, max_records: max_records, target_group_name: target_group_name)
        describe_db_proxy_targets(input)
      end
      def describe_db_proxy_targets(input : Types::DescribeDBProxyTargetsRequest) : Types::DescribeDBProxyTargetsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_PROXY_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDBProxyTargetsResponse, "DescribeDBProxyTargets")
      end

      # Describes the recommendations to resolve the issues for your DB instances, DB clusters, and DB
      # parameter groups.
      def describe_db_recommendations(
        filters : Array(Types::Filter)? = nil,
        last_updated_after : Time? = nil,
        last_updated_before : Time? = nil,
        locale : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBRecommendationsMessage
        input = Types::DescribeDBRecommendationsMessage.new(filters: filters, last_updated_after: last_updated_after, last_updated_before: last_updated_before, locale: locale, marker: marker, max_records: max_records)
        describe_db_recommendations(input)
      end
      def describe_db_recommendations(input : Types::DescribeDBRecommendationsMessage) : Types::DBRecommendationsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBRecommendationsMessage, "DescribeDBRecommendations")
      end

      # Returns a list of DBSecurityGroup descriptions. If a DBSecurityGroupName is specified, the list will
      # contain only the descriptions of the specified DB security group. EC2-Classic was retired on August
      # 15, 2022. If you haven't migrated from EC2-Classic to a VPC, we recommend that you migrate as soon
      # as possible. For more information, see Migrate from EC2-Classic to a VPC in the Amazon EC2 User
      # Guide , the blog EC2-Classic Networking is Retiring – Here’s How to Prepare , and Moving a DB
      # instance not in a VPC into a VPC in the Amazon RDS User Guide .
      def describe_db_security_groups(
        db_security_group_name : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DBSecurityGroupMessage
        input = Types::DescribeDBSecurityGroupsMessage.new(db_security_group_name: db_security_group_name, filters: filters, marker: marker, max_records: max_records)
        describe_db_security_groups(input)
      end
      def describe_db_security_groups(input : Types::DescribeDBSecurityGroupsMessage) : Types::DBSecurityGroupMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_SECURITY_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBSecurityGroupMessage, "DescribeDBSecurityGroups")
      end

      # Describes existing Aurora Limitless Database DB shard groups.
      def describe_db_shard_groups(
        db_shard_group_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeDBShardGroupsResponse
        input = Types::DescribeDBShardGroupsMessage.new(db_shard_group_identifier: db_shard_group_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_db_shard_groups(input)
      end
      def describe_db_shard_groups(input : Types::DescribeDBShardGroupsMessage) : Types::DescribeDBShardGroupsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_SHARD_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDBShardGroupsResponse, "DescribeDBShardGroups")
      end

      # Returns a list of DB snapshot attribute names and values for a manual DB snapshot. When sharing
      # snapshots with other Amazon Web Services accounts, DescribeDBSnapshotAttributes returns the restore
      # attribute and a list of IDs for the Amazon Web Services accounts that are authorized to copy or
      # restore the manual DB snapshot. If all is included in the list of values for the restore attribute,
      # then the manual DB snapshot is public and can be copied or restored by all Amazon Web Services
      # accounts. To add or remove access for an Amazon Web Services account to copy or restore a manual DB
      # snapshot, or to make the manual DB snapshot public or private, use the ModifyDBSnapshotAttribute API
      # action.
      def describe_db_snapshot_attributes(
        db_snapshot_identifier : String
      ) : Types::DescribeDBSnapshotAttributesResult
        input = Types::DescribeDBSnapshotAttributesMessage.new(db_snapshot_identifier: db_snapshot_identifier)
        describe_db_snapshot_attributes(input)
      end
      def describe_db_snapshot_attributes(input : Types::DescribeDBSnapshotAttributesMessage) : Types::DescribeDBSnapshotAttributesResult
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_SNAPSHOT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDBSnapshotAttributesResult, "DescribeDBSnapshotAttributes")
      end

      # Describes the tenant databases that exist in a DB snapshot. This command only applies to RDS for
      # Oracle DB instances in the multi-tenant configuration. You can use this command to inspect the
      # tenant databases within a snapshot before restoring it. You can't directly interact with the tenant
      # databases in a DB snapshot. If you restore a snapshot that was taken from DB instance using the
      # multi-tenant configuration, you restore all its tenant databases.
      def describe_db_snapshot_tenant_databases(
        db_instance_identifier : String? = nil,
        db_snapshot_identifier : String? = nil,
        dbi_resource_id : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        snapshot_type : String? = nil
      ) : Types::DBSnapshotTenantDatabasesMessage
        input = Types::DescribeDBSnapshotTenantDatabasesMessage.new(db_instance_identifier: db_instance_identifier, db_snapshot_identifier: db_snapshot_identifier, dbi_resource_id: dbi_resource_id, filters: filters, marker: marker, max_records: max_records, snapshot_type: snapshot_type)
        describe_db_snapshot_tenant_databases(input)
      end
      def describe_db_snapshot_tenant_databases(input : Types::DescribeDBSnapshotTenantDatabasesMessage) : Types::DBSnapshotTenantDatabasesMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_SNAPSHOT_TENANT_DATABASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBSnapshotTenantDatabasesMessage, "DescribeDBSnapshotTenantDatabases")
      end

      # Returns information about DB snapshots. This API action supports pagination.
      def describe_db_snapshots(
        db_instance_identifier : String? = nil,
        db_snapshot_identifier : String? = nil,
        dbi_resource_id : String? = nil,
        filters : Array(Types::Filter)? = nil,
        include_public : Bool? = nil,
        include_shared : Bool? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        snapshot_type : String? = nil
      ) : Types::DBSnapshotMessage
        input = Types::DescribeDBSnapshotsMessage.new(db_instance_identifier: db_instance_identifier, db_snapshot_identifier: db_snapshot_identifier, dbi_resource_id: dbi_resource_id, filters: filters, include_public: include_public, include_shared: include_shared, marker: marker, max_records: max_records, snapshot_type: snapshot_type)
        describe_db_snapshots(input)
      end
      def describe_db_snapshots(input : Types::DescribeDBSnapshotsMessage) : Types::DBSnapshotMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_DB_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBSnapshotMessage, "DescribeDBSnapshots")
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

      # Returns the default engine and system parameter information for the cluster database engine. For
      # more information on Amazon Aurora, see What is Amazon Aurora? in the Amazon Aurora User Guide .
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
      # type. You can also see this list in the "Amazon RDS event categories and event messages" section of
      # the Amazon RDS User Guide or the Amazon Aurora User Guide .
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

      # Returns events related to DB instances, DB clusters, DB parameter groups, DB security groups, DB
      # snapshots, DB cluster snapshots, and RDS Proxies for the past 14 days. Events specific to a
      # particular DB instance, DB cluster, DB parameter group, DB security group, DB snapshot, DB cluster
      # snapshot group, or RDS Proxy can be obtained by providing the name as a parameter. For more
      # information on working with events, see Monitoring Amazon RDS events in the Amazon RDS User Guide
      # and Monitoring Amazon Aurora events in the Amazon Aurora User Guide . By default, RDS returns events
      # that were generated in the past hour.
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

      # Returns information about a snapshot or cluster export to Amazon S3. This API operation supports
      # pagination.
      def describe_export_tasks(
        export_task_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        source_arn : String? = nil,
        source_type : String? = nil
      ) : Types::ExportTasksMessage
        input = Types::DescribeExportTasksMessage.new(export_task_identifier: export_task_identifier, filters: filters, marker: marker, max_records: max_records, source_arn: source_arn, source_type: source_type)
        describe_export_tasks(input)
      end
      def describe_export_tasks(input : Types::DescribeExportTasksMessage) : Types::ExportTasksMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_EXPORT_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ExportTasksMessage, "DescribeExportTasks")
      end

      # Returns information about Aurora global database clusters. This API supports pagination. For more
      # information on Amazon Aurora, see What is Amazon Aurora? in the Amazon Aurora User Guide . This
      # action only applies to Aurora DB clusters.
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

      # Describe one or more zero-ETL integrations with Amazon Redshift.
      def describe_integrations(
        filters : Array(Types::Filter)? = nil,
        integration_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeIntegrationsResponse
        input = Types::DescribeIntegrationsMessage.new(filters: filters, integration_identifier: integration_identifier, marker: marker, max_records: max_records)
        describe_integrations(input)
      end
      def describe_integrations(input : Types::DescribeIntegrationsMessage) : Types::DescribeIntegrationsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_INTEGRATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeIntegrationsResponse, "DescribeIntegrations")
      end

      # Describes all available options for the specified engine.
      def describe_option_group_options(
        engine_name : String,
        filters : Array(Types::Filter)? = nil,
        major_engine_version : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::OptionGroupOptionsMessage
        input = Types::DescribeOptionGroupOptionsMessage.new(engine_name: engine_name, filters: filters, major_engine_version: major_engine_version, marker: marker, max_records: max_records)
        describe_option_group_options(input)
      end
      def describe_option_group_options(input : Types::DescribeOptionGroupOptionsMessage) : Types::OptionGroupOptionsMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_OPTION_GROUP_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::OptionGroupOptionsMessage, "DescribeOptionGroupOptions")
      end

      # Describes the available option groups.
      def describe_option_groups(
        engine_name : String? = nil,
        filters : Array(Types::Filter)? = nil,
        major_engine_version : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        option_group_name : String? = nil
      ) : Types::OptionGroups
        input = Types::DescribeOptionGroupsMessage.new(engine_name: engine_name, filters: filters, major_engine_version: major_engine_version, marker: marker, max_records: max_records, option_group_name: option_group_name)
        describe_option_groups(input)
      end
      def describe_option_groups(input : Types::DescribeOptionGroupsMessage) : Types::OptionGroups
        request = Protocol::Query.build_request(Model::DESCRIBE_OPTION_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::OptionGroups, "DescribeOptionGroups")
      end

      # Describes the orderable DB instance options for a specified DB engine.
      def describe_orderable_db_instance_options(
        engine : String,
        availability_zone_group : String? = nil,
        db_instance_class : String? = nil,
        engine_version : String? = nil,
        filters : Array(Types::Filter)? = nil,
        license_model : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        vpc : Bool? = nil
      ) : Types::OrderableDBInstanceOptionsMessage
        input = Types::DescribeOrderableDBInstanceOptionsMessage.new(engine: engine, availability_zone_group: availability_zone_group, db_instance_class: db_instance_class, engine_version: engine_version, filters: filters, license_model: license_model, marker: marker, max_records: max_records, vpc: vpc)
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
      # action. This API follows an eventual consistency model. This means that the result of the
      # DescribePendingMaintenanceActions command might not be immediately visible to all subsequent RDS
      # commands. Keep this in mind when you use DescribePendingMaintenanceActions immediately after using a
      # previous API command such as ApplyPendingMaintenanceActions .
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

      # Returns information about reserved DB instances for this account, or about a specified reserved DB
      # instance.
      def describe_reserved_db_instances(
        db_instance_class : String? = nil,
        duration : String? = nil,
        filters : Array(Types::Filter)? = nil,
        lease_id : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        multi_az : Bool? = nil,
        offering_type : String? = nil,
        product_description : String? = nil,
        reserved_db_instance_id : String? = nil,
        reserved_db_instances_offering_id : String? = nil
      ) : Types::ReservedDBInstanceMessage
        input = Types::DescribeReservedDBInstancesMessage.new(db_instance_class: db_instance_class, duration: duration, filters: filters, lease_id: lease_id, marker: marker, max_records: max_records, multi_az: multi_az, offering_type: offering_type, product_description: product_description, reserved_db_instance_id: reserved_db_instance_id, reserved_db_instances_offering_id: reserved_db_instances_offering_id)
        describe_reserved_db_instances(input)
      end
      def describe_reserved_db_instances(input : Types::DescribeReservedDBInstancesMessage) : Types::ReservedDBInstanceMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_RESERVED_DB_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ReservedDBInstanceMessage, "DescribeReservedDBInstances")
      end

      # Lists available reserved DB instance offerings.
      def describe_reserved_db_instances_offerings(
        db_instance_class : String? = nil,
        duration : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        multi_az : Bool? = nil,
        offering_type : String? = nil,
        product_description : String? = nil,
        reserved_db_instances_offering_id : String? = nil
      ) : Types::ReservedDBInstancesOfferingMessage
        input = Types::DescribeReservedDBInstancesOfferingsMessage.new(db_instance_class: db_instance_class, duration: duration, filters: filters, marker: marker, max_records: max_records, multi_az: multi_az, offering_type: offering_type, product_description: product_description, reserved_db_instances_offering_id: reserved_db_instances_offering_id)
        describe_reserved_db_instances_offerings(input)
      end
      def describe_reserved_db_instances_offerings(input : Types::DescribeReservedDBInstancesOfferingsMessage) : Types::ReservedDBInstancesOfferingMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_RESERVED_DB_INSTANCES_OFFERINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ReservedDBInstancesOfferingMessage, "DescribeReservedDBInstancesOfferings")
      end

      # Returns a list of the source Amazon Web Services Regions where the current Amazon Web Services
      # Region can create a read replica, copy a DB snapshot from, or replicate automated backups from. Use
      # this operation to determine whether cross-Region features are supported between other Regions and
      # your current Region. This operation supports pagination. To return information about the Regions
      # that are enabled for your account, or all Regions, use the EC2 operation DescribeRegions . For more
      # information, see DescribeRegions in the Amazon EC2 API Reference .
      def describe_source_regions(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        region_name : String? = nil
      ) : Types::SourceRegionMessage
        input = Types::DescribeSourceRegionsMessage.new(filters: filters, marker: marker, max_records: max_records, region_name: region_name)
        describe_source_regions(input)
      end
      def describe_source_regions(input : Types::DescribeSourceRegionsMessage) : Types::SourceRegionMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_SOURCE_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SourceRegionMessage, "DescribeSourceRegions")
      end

      # Describes the tenant databases in a DB instance that uses the multi-tenant configuration. Only RDS
      # for Oracle CDB instances are supported.
      def describe_tenant_databases(
        db_instance_identifier : String? = nil,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        tenant_db_name : String? = nil
      ) : Types::TenantDatabasesMessage
        input = Types::DescribeTenantDatabasesMessage.new(db_instance_identifier: db_instance_identifier, filters: filters, marker: marker, max_records: max_records, tenant_db_name: tenant_db_name)
        describe_tenant_databases(input)
      end
      def describe_tenant_databases(input : Types::DescribeTenantDatabasesMessage) : Types::TenantDatabasesMessage
        request = Protocol::Query.build_request(Model::DESCRIBE_TENANT_DATABASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TenantDatabasesMessage, "DescribeTenantDatabases")
      end

      # You can call DescribeValidDBInstanceModifications to learn what modifications you can make to your
      # DB instance. You can use this information when you call ModifyDBInstance . This command doesn't
      # apply to RDS Custom.
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

      # Disables the HTTP endpoint for the specified DB cluster. Disabling this endpoint disables RDS Data
      # API. For more information, see Using RDS Data API in the Amazon Aurora User Guide . This operation
      # applies only to Aurora Serverless v2 and provisioned DB clusters. To disable the HTTP endpoint for
      # Aurora Serverless v1 DB clusters, use the EnableHttpEndpoint parameter of the ModifyDBCluster
      # operation.
      def disable_http_endpoint(
        resource_arn : String
      ) : Types::DisableHttpEndpointResponse
        input = Types::DisableHttpEndpointRequest.new(resource_arn: resource_arn)
        disable_http_endpoint(input)
      end
      def disable_http_endpoint(input : Types::DisableHttpEndpointRequest) : Types::DisableHttpEndpointResponse
        request = Protocol::Query.build_request(Model::DISABLE_HTTP_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DisableHttpEndpointResponse, "DisableHttpEndpoint")
      end

      # Downloads all or a portion of the specified log file, up to 1 MB in size. This command doesn't apply
      # to RDS Custom. This operation uses resources on database instances. Because of this, we recommend
      # publishing database logs to CloudWatch and then using the GetLogEvents operation. For more
      # information, see GetLogEvents in the Amazon CloudWatch Logs API Reference .
      def download_db_log_file_portion(
        db_instance_identifier : String,
        log_file_name : String,
        marker : String? = nil,
        number_of_lines : Int32? = nil
      ) : Types::DownloadDBLogFilePortionDetails
        input = Types::DownloadDBLogFilePortionMessage.new(db_instance_identifier: db_instance_identifier, log_file_name: log_file_name, marker: marker, number_of_lines: number_of_lines)
        download_db_log_file_portion(input)
      end
      def download_db_log_file_portion(input : Types::DownloadDBLogFilePortionMessage) : Types::DownloadDBLogFilePortionDetails
        request = Protocol::Query.build_request(Model::DOWNLOAD_DB_LOG_FILE_PORTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DownloadDBLogFilePortionDetails, "DownloadDBLogFilePortion")
      end

      # Enables the HTTP endpoint for the DB cluster. By default, the HTTP endpoint isn't enabled. When
      # enabled, this endpoint provides a connectionless web service API (RDS Data API) for running SQL
      # queries on the Aurora DB cluster. You can also query your database from inside the RDS console with
      # the RDS query editor. For more information, see Using RDS Data API in the Amazon Aurora User Guide .
      # This operation applies only to Aurora Serverless v2 and provisioned DB clusters. To enable the HTTP
      # endpoint for Aurora Serverless v1 DB clusters, use the EnableHttpEndpoint parameter of the
      # ModifyDBCluster operation.
      def enable_http_endpoint(
        resource_arn : String
      ) : Types::EnableHttpEndpointResponse
        input = Types::EnableHttpEndpointRequest.new(resource_arn: resource_arn)
        enable_http_endpoint(input)
      end
      def enable_http_endpoint(input : Types::EnableHttpEndpointRequest) : Types::EnableHttpEndpointResponse
        request = Protocol::Query.build_request(Model::ENABLE_HTTP_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::EnableHttpEndpointResponse, "EnableHttpEndpoint")
      end

      # Forces a failover for a DB cluster. For an Aurora DB cluster, failover for a DB cluster promotes one
      # of the Aurora Replicas (read-only instances) in the DB cluster to be the primary DB instance (the
      # cluster writer). For a Multi-AZ DB cluster, after RDS terminates the primary DB instance, the
      # internal monitoring system detects that the primary DB instance is unhealthy and promotes a readable
      # standby (read-only instances) in the DB cluster to be the primary DB instance (the cluster writer).
      # Failover times are typically less than 35 seconds. An Amazon Aurora DB cluster automatically fails
      # over to an Aurora Replica, if one exists, when the primary DB instance fails. A Multi-AZ DB cluster
      # automatically fails over to a readable standby DB instance when the primary DB instance fails. To
      # simulate a failure of a primary instance for testing, you can force a failover. Because each
      # instance in a DB cluster has its own endpoint address, make sure to clean up and re-establish any
      # existing connections that use those endpoint addresses when the failover is complete. For more
      # information on Amazon Aurora DB clusters, see What is Amazon Aurora? in the Amazon Aurora User Guide
      # . For more information on Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in the Amazon
      # RDS User Guide .
      def failover_db_cluster(
        db_cluster_identifier : String,
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

      # Promotes the specified secondary DB cluster to be the primary DB cluster in the global database
      # cluster to fail over or switch over a global database. Switchover operations were previously called
      # "managed planned failovers." Although this operation can be used either to fail over or to switch
      # over a global database cluster, its intended use is for global database failover. To switch over a
      # global database cluster, we recommend that you use the SwitchoverGlobalCluster operation instead.
      # How you use this operation depends on whether you are failing over or switching over your global
      # database cluster: Failing over - Specify the AllowDataLoss parameter and don't specify the
      # Switchover parameter. Switching over - Specify the Switchover parameter or omit it, but don't
      # specify the AllowDataLoss parameter. About failing over and switching over While failing over and
      # switching over a global database cluster both change the primary DB cluster, you use these
      # operations for different reasons: Failing over - Use this operation to respond to an unplanned
      # event, such as a Regional disaster in the primary Region. Failing over can result in a loss of write
      # transaction data that wasn't replicated to the chosen secondary before the failover event occurred.
      # However, the recovery process that promotes a DB instance on the chosen seconday DB cluster to be
      # the primary writer DB instance guarantees that the data is in a transactionally consistent state.
      # For more information about failing over an Amazon Aurora global database, see Performing managed
      # failovers for Aurora global databases in the Amazon Aurora User Guide . Switching over - Use this
      # operation on a healthy global database cluster for planned events, such as Regional rotation or to
      # fail back to the original primary DB cluster after a failover operation. With this operation, there
      # is no data loss. For more information about switching over an Amazon Aurora global database, see
      # Performing switchovers for Aurora global databases in the Amazon Aurora User Guide .
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

      # Lists all tags on an Amazon RDS resource. For an overview on tagging an Amazon RDS resource, see
      # Tagging Amazon RDS Resources in the Amazon RDS User Guide or Tagging Amazon Aurora and Amazon RDS
      # Resources in the Amazon Aurora User Guide .
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

      # Changes the audit policy state of a database activity stream to either locked (default) or unlocked.
      # A locked policy is read-only, whereas an unlocked policy is read/write. If your activity stream is
      # started and locked, you can unlock it, customize your audit policy, and then lock your activity
      # stream. Restarting the activity stream isn't required. For more information, see Modifying a
      # database activity stream in the Amazon RDS User Guide . This operation is supported for RDS for
      # Oracle and Microsoft SQL Server.
      def modify_activity_stream(
        audit_policy_state : String? = nil,
        resource_arn : String? = nil
      ) : Types::ModifyActivityStreamResponse
        input = Types::ModifyActivityStreamRequest.new(audit_policy_state: audit_policy_state, resource_arn: resource_arn)
        modify_activity_stream(input)
      end
      def modify_activity_stream(input : Types::ModifyActivityStreamRequest) : Types::ModifyActivityStreamResponse
        request = Protocol::Query.build_request(Model::MODIFY_ACTIVITY_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyActivityStreamResponse, "ModifyActivityStream")
      end

      # Override the system-default Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificate for
      # Amazon RDS for new DB instances, or remove the override. By using this operation, you can specify an
      # RDS-approved SSL/TLS certificate for new DB instances that is different from the default certificate
      # provided by RDS. You can also use this operation to remove the override, so that new DB instances
      # use the default certificate provided by RDS. You might need to override the default certificate in
      # the following situations: You already migrated your applications to support the latest certificate
      # authority (CA) certificate, but the new CA certificate is not yet the RDS default CA certificate for
      # the specified Amazon Web Services Region. RDS has already moved to a new default CA certificate for
      # the specified Amazon Web Services Region, but you are still in the process of supporting the new CA
      # certificate. In this case, you temporarily need additional time to finish your application changes.
      # For more information about rotating your SSL/TLS certificate for RDS DB engines, see Rotating Your
      # SSL/TLS Certificate in the Amazon RDS User Guide . For more information about rotating your SSL/TLS
      # certificate for Aurora DB engines, see Rotating Your SSL/TLS Certificate in the Amazon Aurora User
      # Guide .
      def modify_certificates(
        certificate_identifier : String? = nil,
        remove_customer_override : Bool? = nil
      ) : Types::ModifyCertificatesResult
        input = Types::ModifyCertificatesMessage.new(certificate_identifier: certificate_identifier, remove_customer_override: remove_customer_override)
        modify_certificates(input)
      end
      def modify_certificates(input : Types::ModifyCertificatesMessage) : Types::ModifyCertificatesResult
        request = Protocol::Query.build_request(Model::MODIFY_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyCertificatesResult, "ModifyCertificates")
      end

      # Set the capacity of an Aurora Serverless v1 DB cluster to a specific value. Aurora Serverless v1
      # scales seamlessly based on the workload on the DB cluster. In some cases, the capacity might not
      # scale fast enough to meet a sudden change in workload, such as a large number of new transactions.
      # Call ModifyCurrentDBClusterCapacity to set the capacity explicitly. After this call sets the DB
      # cluster capacity, Aurora Serverless v1 can automatically scale the DB cluster based on the cooldown
      # period for scaling up and the cooldown period for scaling down. For more information about Aurora
      # Serverless v1, see Using Amazon Aurora Serverless v1 in the Amazon Aurora User Guide . If you call
      # ModifyCurrentDBClusterCapacity with the default TimeoutAction , connections that prevent Aurora
      # Serverless v1 from finding a scaling point might be dropped. For more information about scaling
      # points, see Autoscaling for Aurora Serverless v1 in the Amazon Aurora User Guide . This operation
      # only applies to Aurora Serverless v1 DB clusters.
      def modify_current_db_cluster_capacity(
        db_cluster_identifier : String,
        capacity : Int32? = nil,
        seconds_before_timeout : Int32? = nil,
        timeout_action : String? = nil
      ) : Types::DBClusterCapacityInfo
        input = Types::ModifyCurrentDBClusterCapacityMessage.new(db_cluster_identifier: db_cluster_identifier, capacity: capacity, seconds_before_timeout: seconds_before_timeout, timeout_action: timeout_action)
        modify_current_db_cluster_capacity(input)
      end
      def modify_current_db_cluster_capacity(input : Types::ModifyCurrentDBClusterCapacityMessage) : Types::DBClusterCapacityInfo
        request = Protocol::Query.build_request(Model::MODIFY_CURRENT_DB_CLUSTER_CAPACITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterCapacityInfo, "ModifyCurrentDBClusterCapacity")
      end

      # Modifies the status of a custom engine version (CEV). You can find CEVs to modify by calling
      # DescribeDBEngineVersions . The MediaImport service that imports files from Amazon S3 to create CEVs
      # isn't integrated with Amazon Web Services CloudTrail. If you turn on data logging for Amazon RDS in
      # CloudTrail, calls to the ModifyCustomDbEngineVersion event aren't logged. However, you might see
      # calls from the API gateway that accesses your Amazon S3 bucket. These calls originate from the
      # MediaImport service for the ModifyCustomDbEngineVersion event. For more information, see Modifying
      # CEV status in the Amazon RDS User Guide .
      def modify_custom_db_engine_version(
        engine : String,
        engine_version : String,
        description : String? = nil,
        status : String? = nil
      ) : Types::DBEngineVersion
        input = Types::ModifyCustomDBEngineVersionMessage.new(engine: engine, engine_version: engine_version, description: description, status: status)
        modify_custom_db_engine_version(input)
      end
      def modify_custom_db_engine_version(input : Types::ModifyCustomDBEngineVersionMessage) : Types::DBEngineVersion
        request = Protocol::Query.build_request(Model::MODIFY_CUSTOM_DB_ENGINE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBEngineVersion, "ModifyCustomDBEngineVersion")
      end

      # Modifies the settings of an Amazon Aurora DB cluster or a Multi-AZ DB cluster. You can change one or
      # more settings by specifying these parameters and the new values in the request. For more information
      # on Amazon Aurora DB clusters, see What is Amazon Aurora? in the Amazon Aurora User Guide . For more
      # information on Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in the Amazon RDS User
      # Guide .
      def modify_db_cluster(
        db_cluster_identifier : String,
        allocated_storage : Int32? = nil,
        allow_engine_mode_change : Bool? = nil,
        allow_major_version_upgrade : Bool? = nil,
        apply_immediately : Bool? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        aws_backup_recovery_point_arn : String? = nil,
        backtrack_window : Int64? = nil,
        backup_retention_period : Int32? = nil,
        ca_certificate_identifier : String? = nil,
        cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_cluster_instance_class : String? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_instance_parameter_group_name : String? = nil,
        database_insights_mode : String? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_iam_role_name : String? = nil,
        enable_global_write_forwarding : Bool? = nil,
        enable_http_endpoint : Bool? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_limitless_database : Bool? = nil,
        enable_local_write_forwarding : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        engine_mode : String? = nil,
        engine_version : String? = nil,
        iops : Int32? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_authentication_type : String? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        network_type : String? = nil,
        new_db_cluster_identifier : String? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        performance_insights_retention_period : Int32? = nil,
        port : Int32? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        rotate_master_user_password : Bool? = nil,
        scaling_configuration : Types::ScalingConfiguration? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_type : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::ModifyDBClusterResult
        input = Types::ModifyDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier, allocated_storage: allocated_storage, allow_engine_mode_change: allow_engine_mode_change, allow_major_version_upgrade: allow_major_version_upgrade, apply_immediately: apply_immediately, auto_minor_version_upgrade: auto_minor_version_upgrade, aws_backup_recovery_point_arn: aws_backup_recovery_point_arn, backtrack_window: backtrack_window, backup_retention_period: backup_retention_period, ca_certificate_identifier: ca_certificate_identifier, cloudwatch_logs_export_configuration: cloudwatch_logs_export_configuration, copy_tags_to_snapshot: copy_tags_to_snapshot, db_cluster_instance_class: db_cluster_instance_class, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_instance_parameter_group_name: db_instance_parameter_group_name, database_insights_mode: database_insights_mode, deletion_protection: deletion_protection, domain: domain, domain_iam_role_name: domain_iam_role_name, enable_global_write_forwarding: enable_global_write_forwarding, enable_http_endpoint: enable_http_endpoint, enable_iam_database_authentication: enable_iam_database_authentication, enable_limitless_database: enable_limitless_database, enable_local_write_forwarding: enable_local_write_forwarding, enable_performance_insights: enable_performance_insights, engine_mode: engine_mode, engine_version: engine_version, iops: iops, manage_master_user_password: manage_master_user_password, master_user_authentication_type: master_user_authentication_type, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, network_type: network_type, new_db_cluster_identifier: new_db_cluster_identifier, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, performance_insights_retention_period: performance_insights_retention_period, port: port, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, rotate_master_user_password: rotate_master_user_password, scaling_configuration: scaling_configuration, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_type: storage_type, vpc_security_group_ids: vpc_security_group_ids)
        modify_db_cluster(input)
      end
      def modify_db_cluster(input : Types::ModifyDBClusterMessage) : Types::ModifyDBClusterResult
        request = Protocol::Query.build_request(Model::MODIFY_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBClusterResult, "ModifyDBCluster")
      end

      # Modifies the properties of an endpoint in an Amazon Aurora DB cluster. This operation only applies
      # to Aurora DB clusters.
      def modify_db_cluster_endpoint(
        db_cluster_endpoint_identifier : String,
        endpoint_type : String? = nil,
        excluded_members : Array(String)? = nil,
        static_members : Array(String)? = nil
      ) : Types::DBClusterEndpoint
        input = Types::ModifyDBClusterEndpointMessage.new(db_cluster_endpoint_identifier: db_cluster_endpoint_identifier, endpoint_type: endpoint_type, excluded_members: excluded_members, static_members: static_members)
        modify_db_cluster_endpoint(input)
      end
      def modify_db_cluster_endpoint(input : Types::ModifyDBClusterEndpointMessage) : Types::DBClusterEndpoint
        request = Protocol::Query.build_request(Model::MODIFY_DB_CLUSTER_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBClusterEndpoint, "ModifyDBClusterEndpoint")
      end

      # Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, submit a
      # list of the following: ParameterName , ParameterValue , and ApplyMethod . A maximum of 20 parameters
      # can be modified in a single request. There are two types of parameters - dynamic parameters and
      # static parameters. Changes to dynamic parameters are applied to the DB cluster immediately without a
      # reboot. Changes to static parameters are applied only after the DB cluster is rebooted, which can be
      # done using RebootDBCluster operation. You can use the Parameter Groups option of the Amazon RDS
      # console or the DescribeDBClusterParameters operation to verify that your DB cluster parameter group
      # has been created or modified. For more information on Amazon Aurora DB clusters, see What is Amazon
      # Aurora? in the Amazon Aurora User Guide . For more information on Multi-AZ DB clusters, see Multi-AZ
      # DB cluster deployments in the Amazon RDS User Guide.
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
      # snapshot. To share a manual DB cluster snapshot with other Amazon Web Services accounts, specify
      # restore as the AttributeName and use the ValuesToAdd parameter to add a list of IDs of the Amazon
      # Web Services accounts that are authorized to restore the manual DB cluster snapshot. Use the value
      # all to make the manual DB cluster snapshot public, which means that it can be copied or restored by
      # all Amazon Web Services accounts. Don't add the all value for any manual DB cluster snapshots that
      # contain private information that you don't want available to all Amazon Web Services accounts. If a
      # manual DB cluster snapshot is encrypted, it can be shared, but only by specifying a list of
      # authorized Amazon Web Services account IDs for the ValuesToAdd parameter. You can't use all as a
      # value for that parameter in this case. To view which Amazon Web Services accounts have access to
      # copy or restore a manual DB cluster snapshot, or whether a manual DB cluster snapshot is public or
      # private, use the DescribeDBClusterSnapshotAttributes API operation. The accounts are returned as
      # values for the restore attribute.
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
        additional_storage_volumes : Array(Types::ModifyAdditionalStorageVolume)? = nil,
        allocated_storage : Int32? = nil,
        allow_major_version_upgrade : Bool? = nil,
        apply_immediately : Bool? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        automation_mode : String? = nil,
        aws_backup_recovery_point_arn : String? = nil,
        backup_retention_period : Int32? = nil,
        ca_certificate_identifier : String? = nil,
        certificate_rotation_restart : Bool? = nil,
        cloudwatch_logs_export_configuration : Types::CloudwatchLogsExportConfiguration? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_instance_class : String? = nil,
        db_parameter_group_name : String? = nil,
        db_port_number : Int32? = nil,
        db_security_groups : Array(String)? = nil,
        db_subnet_group_name : String? = nil,
        database_insights_mode : String? = nil,
        dedicated_log_volume : Bool? = nil,
        deletion_protection : Bool? = nil,
        disable_domain : Bool? = nil,
        domain : String? = nil,
        domain_auth_secret_arn : String? = nil,
        domain_dns_ips : Array(String)? = nil,
        domain_fqdn : String? = nil,
        domain_iam_role_name : String? = nil,
        domain_ou : String? = nil,
        enable_customer_owned_ip : Bool? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        iops : Int32? = nil,
        license_model : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_authentication_type : String? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        max_allocated_storage : Int32? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        multi_az : Bool? = nil,
        multi_tenant : Bool? = nil,
        network_type : String? = nil,
        new_db_instance_identifier : String? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        performance_insights_retention_period : Int32? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        processor_features : Array(Types::ProcessorFeature)? = nil,
        promotion_tier : Int32? = nil,
        publicly_accessible : Bool? = nil,
        replica_mode : String? = nil,
        resume_full_automation_mode_minutes : Int32? = nil,
        rotate_master_user_password : Bool? = nil,
        storage_throughput : Int32? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tde_credential_arn : String? = nil,
        tde_credential_password : String? = nil,
        use_default_processor_features : Bool? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::ModifyDBInstanceResult
        input = Types::ModifyDBInstanceMessage.new(db_instance_identifier: db_instance_identifier, additional_storage_volumes: additional_storage_volumes, allocated_storage: allocated_storage, allow_major_version_upgrade: allow_major_version_upgrade, apply_immediately: apply_immediately, auto_minor_version_upgrade: auto_minor_version_upgrade, automation_mode: automation_mode, aws_backup_recovery_point_arn: aws_backup_recovery_point_arn, backup_retention_period: backup_retention_period, ca_certificate_identifier: ca_certificate_identifier, certificate_rotation_restart: certificate_rotation_restart, cloudwatch_logs_export_configuration: cloudwatch_logs_export_configuration, copy_tags_to_snapshot: copy_tags_to_snapshot, db_instance_class: db_instance_class, db_parameter_group_name: db_parameter_group_name, db_port_number: db_port_number, db_security_groups: db_security_groups, db_subnet_group_name: db_subnet_group_name, database_insights_mode: database_insights_mode, dedicated_log_volume: dedicated_log_volume, deletion_protection: deletion_protection, disable_domain: disable_domain, domain: domain, domain_auth_secret_arn: domain_auth_secret_arn, domain_dns_ips: domain_dns_ips, domain_fqdn: domain_fqdn, domain_iam_role_name: domain_iam_role_name, domain_ou: domain_ou, enable_customer_owned_ip: enable_customer_owned_ip, enable_iam_database_authentication: enable_iam_database_authentication, enable_performance_insights: enable_performance_insights, engine: engine, engine_version: engine_version, iops: iops, license_model: license_model, manage_master_user_password: manage_master_user_password, master_user_authentication_type: master_user_authentication_type, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, max_allocated_storage: max_allocated_storage, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, multi_az: multi_az, multi_tenant: multi_tenant, network_type: network_type, new_db_instance_identifier: new_db_instance_identifier, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, performance_insights_retention_period: performance_insights_retention_period, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, processor_features: processor_features, promotion_tier: promotion_tier, publicly_accessible: publicly_accessible, replica_mode: replica_mode, resume_full_automation_mode_minutes: resume_full_automation_mode_minutes, rotate_master_user_password: rotate_master_user_password, storage_throughput: storage_throughput, storage_type: storage_type, tag_specifications: tag_specifications, tde_credential_arn: tde_credential_arn, tde_credential_password: tde_credential_password, use_default_processor_features: use_default_processor_features, vpc_security_group_ids: vpc_security_group_ids)
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
      # modified in a single request. After you modify a DB parameter group, you should wait at least 5
      # minutes before creating your first DB instance that uses that DB parameter group as the default
      # parameter group. This allows Amazon RDS to fully complete the modify operation before the parameter
      # group is used as the default for a new DB instance. This is especially important for parameters that
      # are critical when creating the default database for a DB instance, such as the character set for the
      # default database defined by the character_set_database parameter. You can use the Parameter Groups
      # option of the Amazon RDS console or the DescribeDBParameters command to verify that your DB
      # parameter group has been created or modified.
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

      # Changes the settings for an existing DB proxy.
      def modify_db_proxy(
        db_proxy_name : String,
        auth : Array(Types::UserAuthConfig)? = nil,
        debug_logging : Bool? = nil,
        default_auth_scheme : String? = nil,
        idle_client_timeout : Int32? = nil,
        new_db_proxy_name : String? = nil,
        require_tls : Bool? = nil,
        role_arn : String? = nil,
        security_groups : Array(String)? = nil
      ) : Types::ModifyDBProxyResponse
        input = Types::ModifyDBProxyRequest.new(db_proxy_name: db_proxy_name, auth: auth, debug_logging: debug_logging, default_auth_scheme: default_auth_scheme, idle_client_timeout: idle_client_timeout, new_db_proxy_name: new_db_proxy_name, require_tls: require_tls, role_arn: role_arn, security_groups: security_groups)
        modify_db_proxy(input)
      end
      def modify_db_proxy(input : Types::ModifyDBProxyRequest) : Types::ModifyDBProxyResponse
        request = Protocol::Query.build_request(Model::MODIFY_DB_PROXY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBProxyResponse, "ModifyDBProxy")
      end

      # Changes the settings for an existing DB proxy endpoint.
      def modify_db_proxy_endpoint(
        db_proxy_endpoint_name : String,
        new_db_proxy_endpoint_name : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::ModifyDBProxyEndpointResponse
        input = Types::ModifyDBProxyEndpointRequest.new(db_proxy_endpoint_name: db_proxy_endpoint_name, new_db_proxy_endpoint_name: new_db_proxy_endpoint_name, vpc_security_group_ids: vpc_security_group_ids)
        modify_db_proxy_endpoint(input)
      end
      def modify_db_proxy_endpoint(input : Types::ModifyDBProxyEndpointRequest) : Types::ModifyDBProxyEndpointResponse
        request = Protocol::Query.build_request(Model::MODIFY_DB_PROXY_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBProxyEndpointResponse, "ModifyDBProxyEndpoint")
      end

      # Modifies the properties of a DBProxyTargetGroup .
      def modify_db_proxy_target_group(
        db_proxy_name : String,
        target_group_name : String,
        connection_pool_config : Types::ConnectionPoolConfiguration? = nil,
        new_name : String? = nil
      ) : Types::ModifyDBProxyTargetGroupResponse
        input = Types::ModifyDBProxyTargetGroupRequest.new(db_proxy_name: db_proxy_name, target_group_name: target_group_name, connection_pool_config: connection_pool_config, new_name: new_name)
        modify_db_proxy_target_group(input)
      end
      def modify_db_proxy_target_group(input : Types::ModifyDBProxyTargetGroupRequest) : Types::ModifyDBProxyTargetGroupResponse
        request = Protocol::Query.build_request(Model::MODIFY_DB_PROXY_TARGET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBProxyTargetGroupResponse, "ModifyDBProxyTargetGroup")
      end

      # Updates the recommendation status and recommended action status for the specified recommendation.
      def modify_db_recommendation(
        recommendation_id : String,
        locale : String? = nil,
        recommended_action_updates : Array(Types::RecommendedActionUpdate)? = nil,
        status : String? = nil
      ) : Types::DBRecommendationMessage
        input = Types::ModifyDBRecommendationMessage.new(recommendation_id: recommendation_id, locale: locale, recommended_action_updates: recommended_action_updates, status: status)
        modify_db_recommendation(input)
      end
      def modify_db_recommendation(input : Types::ModifyDBRecommendationMessage) : Types::DBRecommendationMessage
        request = Protocol::Query.build_request(Model::MODIFY_DB_RECOMMENDATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBRecommendationMessage, "ModifyDBRecommendation")
      end

      # Modifies the settings of an Aurora Limitless Database DB shard group. You can change one or more
      # settings by specifying these parameters and the new values in the request.
      def modify_db_shard_group(
        db_shard_group_identifier : String,
        compute_redundancy : Int32? = nil,
        max_acu : Float64? = nil,
        min_acu : Float64? = nil
      ) : Types::DBShardGroup
        input = Types::ModifyDBShardGroupMessage.new(db_shard_group_identifier: db_shard_group_identifier, compute_redundancy: compute_redundancy, max_acu: max_acu, min_acu: min_acu)
        modify_db_shard_group(input)
      end
      def modify_db_shard_group(input : Types::ModifyDBShardGroupMessage) : Types::DBShardGroup
        request = Protocol::Query.build_request(Model::MODIFY_DB_SHARD_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBShardGroup, "ModifyDBShardGroup")
      end

      # Updates a manual DB snapshot with a new engine version. The snapshot can be encrypted or
      # unencrypted, but not shared or public. Amazon RDS supports upgrading DB snapshots for MariaDB,
      # MySQL, PostgreSQL, and Oracle. This operation doesn't apply to RDS Custom or RDS for Db2.
      def modify_db_snapshot(
        db_snapshot_identifier : String,
        engine_version : String? = nil,
        option_group_name : String? = nil
      ) : Types::ModifyDBSnapshotResult
        input = Types::ModifyDBSnapshotMessage.new(db_snapshot_identifier: db_snapshot_identifier, engine_version: engine_version, option_group_name: option_group_name)
        modify_db_snapshot(input)
      end
      def modify_db_snapshot(input : Types::ModifyDBSnapshotMessage) : Types::ModifyDBSnapshotResult
        request = Protocol::Query.build_request(Model::MODIFY_DB_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBSnapshotResult, "ModifyDBSnapshot")
      end

      # Adds an attribute and values to, or removes an attribute and values from, a manual DB snapshot. To
      # share a manual DB snapshot with other Amazon Web Services accounts, specify restore as the
      # AttributeName and use the ValuesToAdd parameter to add a list of IDs of the Amazon Web Services
      # accounts that are authorized to restore the manual DB snapshot. Uses the value all to make the
      # manual DB snapshot public, which means it can be copied or restored by all Amazon Web Services
      # accounts. Don't add the all value for any manual DB snapshots that contain private information that
      # you don't want available to all Amazon Web Services accounts. If the manual DB snapshot is
      # encrypted, it can be shared, but only by specifying a list of authorized Amazon Web Services account
      # IDs for the ValuesToAdd parameter. You can't use all as a value for that parameter in this case. To
      # view which Amazon Web Services accounts have access to copy or restore a manual DB snapshot, or
      # whether a manual DB snapshot public or private, use the DescribeDBSnapshotAttributes API operation.
      # The accounts are returned as values for the restore attribute.
      def modify_db_snapshot_attribute(
        attribute_name : String,
        db_snapshot_identifier : String,
        values_to_add : Array(String)? = nil,
        values_to_remove : Array(String)? = nil
      ) : Types::ModifyDBSnapshotAttributeResult
        input = Types::ModifyDBSnapshotAttributeMessage.new(attribute_name: attribute_name, db_snapshot_identifier: db_snapshot_identifier, values_to_add: values_to_add, values_to_remove: values_to_remove)
        modify_db_snapshot_attribute(input)
      end
      def modify_db_snapshot_attribute(input : Types::ModifyDBSnapshotAttributeMessage) : Types::ModifyDBSnapshotAttributeResult
        request = Protocol::Query.build_request(Model::MODIFY_DB_SNAPSHOT_ATTRIBUTE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyDBSnapshotAttributeResult, "ModifyDBSnapshotAttribute")
      end

      # Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at least
      # two AZs in the Amazon Web Services Region.
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

      # Modifies an existing RDS event notification subscription. You can't modify the source identifiers
      # using this call. To change source identifiers for a subscription, use the
      # AddSourceIdentifierToSubscription and RemoveSourceIdentifierFromSubscription calls. You can see a
      # list of the event categories for a given source type ( SourceType ) in Events in the Amazon RDS User
      # Guide or by using the DescribeEventCategories operation.
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

      # Modifies a setting for an Amazon Aurora global database cluster. You can change one or more database
      # configuration parameters by specifying these parameters and the new values in the request. For more
      # information on Amazon Aurora, see What is Amazon Aurora? in the Amazon Aurora User Guide . This
      # operation only applies to Aurora global database clusters.
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

      # Modifies a zero-ETL integration with Amazon Redshift.
      def modify_integration(
        integration_identifier : String,
        data_filter : String? = nil,
        description : String? = nil,
        integration_name : String? = nil
      ) : Types::Integration
        input = Types::ModifyIntegrationMessage.new(integration_identifier: integration_identifier, data_filter: data_filter, description: description, integration_name: integration_name)
        modify_integration(input)
      end
      def modify_integration(input : Types::ModifyIntegrationMessage) : Types::Integration
        request = Protocol::Query.build_request(Model::MODIFY_INTEGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::Integration, "ModifyIntegration")
      end

      # Modifies an existing option group.
      def modify_option_group(
        option_group_name : String,
        apply_immediately : Bool? = nil,
        options_to_include : Array(Types::OptionConfiguration)? = nil,
        options_to_remove : Array(String)? = nil
      ) : Types::ModifyOptionGroupResult
        input = Types::ModifyOptionGroupMessage.new(option_group_name: option_group_name, apply_immediately: apply_immediately, options_to_include: options_to_include, options_to_remove: options_to_remove)
        modify_option_group(input)
      end
      def modify_option_group(input : Types::ModifyOptionGroupMessage) : Types::ModifyOptionGroupResult
        request = Protocol::Query.build_request(Model::MODIFY_OPTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyOptionGroupResult, "ModifyOptionGroup")
      end

      # Modifies an existing tenant database in a DB instance. You can change the tenant database name or
      # the master user password. This operation is supported only for RDS for Oracle CDB instances using
      # the multi-tenant configuration.
      def modify_tenant_database(
        db_instance_identifier : String,
        tenant_db_name : String,
        manage_master_user_password : Bool? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        new_tenant_db_name : String? = nil,
        rotate_master_user_password : Bool? = nil
      ) : Types::ModifyTenantDatabaseResult
        input = Types::ModifyTenantDatabaseMessage.new(db_instance_identifier: db_instance_identifier, tenant_db_name: tenant_db_name, manage_master_user_password: manage_master_user_password, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, new_tenant_db_name: new_tenant_db_name, rotate_master_user_password: rotate_master_user_password)
        modify_tenant_database(input)
      end
      def modify_tenant_database(input : Types::ModifyTenantDatabaseMessage) : Types::ModifyTenantDatabaseResult
        request = Protocol::Query.build_request(Model::MODIFY_TENANT_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ModifyTenantDatabaseResult, "ModifyTenantDatabase")
      end

      # Promotes a read replica DB instance to a standalone DB instance. Backup duration is a function of
      # the amount of changes to the database since the previous backup. If you plan to promote a read
      # replica to a standalone instance, we recommend that you enable backups and complete at least one
      # backup prior to promotion. In addition, a read replica cannot be promoted to a standalone instance
      # when it is in the backing-up status. If you have enabled backups on your read replica, configure the
      # automated backup window so that daily backups do not interfere with read replica promotion. This
      # command doesn't apply to Aurora MySQL, Aurora PostgreSQL, or RDS Custom.
      def promote_read_replica(
        db_instance_identifier : String,
        backup_retention_period : Int32? = nil,
        preferred_backup_window : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil
      ) : Types::PromoteReadReplicaResult
        input = Types::PromoteReadReplicaMessage.new(db_instance_identifier: db_instance_identifier, backup_retention_period: backup_retention_period, preferred_backup_window: preferred_backup_window, tag_specifications: tag_specifications)
        promote_read_replica(input)
      end
      def promote_read_replica(input : Types::PromoteReadReplicaMessage) : Types::PromoteReadReplicaResult
        request = Protocol::Query.build_request(Model::PROMOTE_READ_REPLICA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PromoteReadReplicaResult, "PromoteReadReplica")
      end

      # Promotes a read replica DB cluster to a standalone DB cluster.
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

      # Purchases a reserved DB instance offering.
      def purchase_reserved_db_instances_offering(
        reserved_db_instances_offering_id : String,
        db_instance_count : Int32? = nil,
        reserved_db_instance_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PurchaseReservedDBInstancesOfferingResult
        input = Types::PurchaseReservedDBInstancesOfferingMessage.new(reserved_db_instances_offering_id: reserved_db_instances_offering_id, db_instance_count: db_instance_count, reserved_db_instance_id: reserved_db_instance_id, tags: tags)
        purchase_reserved_db_instances_offering(input)
      end
      def purchase_reserved_db_instances_offering(input : Types::PurchaseReservedDBInstancesOfferingMessage) : Types::PurchaseReservedDBInstancesOfferingResult
        request = Protocol::Query.build_request(Model::PURCHASE_RESERVED_DB_INSTANCES_OFFERING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PurchaseReservedDBInstancesOfferingResult, "PurchaseReservedDBInstancesOffering")
      end

      # You might need to reboot your DB cluster, usually for maintenance reasons. For example, if you make
      # certain modifications, or if you change the DB cluster parameter group associated with the DB
      # cluster, reboot the DB cluster for the changes to take effect. Rebooting a DB cluster restarts the
      # database engine service. Rebooting a DB cluster results in a momentary outage, during which the DB
      # cluster status is set to rebooting. Use this operation only for a non-Aurora Multi-AZ DB cluster.
      # For more information on Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in the Amazon RDS
      # User Guide.
      def reboot_db_cluster(
        db_cluster_identifier : String
      ) : Types::RebootDBClusterResult
        input = Types::RebootDBClusterMessage.new(db_cluster_identifier: db_cluster_identifier)
        reboot_db_cluster(input)
      end
      def reboot_db_cluster(input : Types::RebootDBClusterMessage) : Types::RebootDBClusterResult
        request = Protocol::Query.build_request(Model::REBOOT_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RebootDBClusterResult, "RebootDBCluster")
      end

      # You might need to reboot your DB instance, usually for maintenance reasons. For example, if you make
      # certain modifications, or if you change the DB parameter group associated with the DB instance, you
      # must reboot the instance for the changes to take effect. Rebooting a DB instance restarts the
      # database engine service. Rebooting a DB instance results in a momentary outage, during which the DB
      # instance status is set to rebooting. For more information about rebooting, see Rebooting a DB
      # Instance in the Amazon RDS User Guide. This command doesn't apply to RDS Custom. If your DB instance
      # is part of a Multi-AZ DB cluster, you can reboot the DB cluster with the RebootDBCluster operation.
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

      # You might need to reboot your DB shard group, usually for maintenance reasons. For example, if you
      # make certain modifications, reboot the DB shard group for the changes to take effect. This operation
      # applies only to Aurora Limitless Database DBb shard groups.
      def reboot_db_shard_group(
        db_shard_group_identifier : String
      ) : Types::DBShardGroup
        input = Types::RebootDBShardGroupMessage.new(db_shard_group_identifier: db_shard_group_identifier)
        reboot_db_shard_group(input)
      end
      def reboot_db_shard_group(input : Types::RebootDBShardGroupMessage) : Types::DBShardGroup
        request = Protocol::Query.build_request(Model::REBOOT_DB_SHARD_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DBShardGroup, "RebootDBShardGroup")
      end

      # Associate one or more DBProxyTarget data structures with a DBProxyTargetGroup .
      def register_db_proxy_targets(
        db_proxy_name : String,
        db_cluster_identifiers : Array(String)? = nil,
        db_instance_identifiers : Array(String)? = nil,
        target_group_name : String? = nil
      ) : Types::RegisterDBProxyTargetsResponse
        input = Types::RegisterDBProxyTargetsRequest.new(db_proxy_name: db_proxy_name, db_cluster_identifiers: db_cluster_identifiers, db_instance_identifiers: db_instance_identifiers, target_group_name: target_group_name)
        register_db_proxy_targets(input)
      end
      def register_db_proxy_targets(input : Types::RegisterDBProxyTargetsRequest) : Types::RegisterDBProxyTargetsResponse
        request = Protocol::Query.build_request(Model::REGISTER_DB_PROXY_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RegisterDBProxyTargetsResponse, "RegisterDBProxyTargets")
      end

      # Detaches an Aurora secondary cluster from an Aurora global database cluster. The cluster becomes a
      # standalone cluster with read-write capability instead of being read-only and receiving data from a
      # primary cluster in a different Region. This operation only applies to Aurora DB clusters.
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

      # Removes the asssociation of an Amazon Web Services Identity and Access Management (IAM) role from a
      # DB cluster. For more information on Amazon Aurora DB clusters, see What is Amazon Aurora? in the
      # Amazon Aurora User Guide . For more information on Multi-AZ DB clusters, see Multi-AZ DB cluster
      # deployments in the Amazon RDS User Guide.
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

      # Disassociates an Amazon Web Services Identity and Access Management (IAM) role from a DB instance.
      def remove_role_from_db_instance(
        db_instance_identifier : String,
        feature_name : String,
        role_arn : String
      ) : Nil
        input = Types::RemoveRoleFromDBInstanceMessage.new(db_instance_identifier: db_instance_identifier, feature_name: feature_name, role_arn: role_arn)
        remove_role_from_db_instance(input)
      end
      def remove_role_from_db_instance(input : Types::RemoveRoleFromDBInstanceMessage) : Nil
        request = Protocol::Query.build_request(Model::REMOVE_ROLE_FROM_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes a source identifier from an existing RDS event notification subscription.
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

      # Removes metadata tags from an Amazon RDS resource. For an overview on tagging an Amazon RDS
      # resource, see Tagging Amazon RDS Resources in the Amazon RDS User Guide or Tagging Amazon Aurora and
      # Amazon RDS Resources in the Amazon Aurora User Guide .
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
      # updated static parameter to apply to. For more information on Amazon Aurora DB clusters, see What is
      # Amazon Aurora? in the Amazon Aurora User Guide . For more information on Multi-AZ DB clusters, see
      # Multi-AZ DB cluster deployments in the Amazon RDS User Guide.
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

      # Creates an Amazon Aurora DB cluster from MySQL data stored in an Amazon S3 bucket. Amazon RDS must
      # be authorized to access the Amazon S3 bucket and the data must be created using the Percona
      # XtraBackup utility as described in Migrating Data from MySQL by Using an Amazon S3 Bucket in the
      # Amazon Aurora User Guide . This operation only restores the DB cluster, not the DB instances for
      # that DB cluster. You must invoke the CreateDBInstance operation to create DB instances for the
      # restored DB cluster, specifying the identifier of the restored DB cluster in DBClusterIdentifier .
      # You can create DB instances only after the RestoreDBClusterFromS3 operation has completed and the DB
      # cluster is available. For more information on Amazon Aurora, see What is Amazon Aurora? in the
      # Amazon Aurora User Guide . This operation only applies to Aurora DB clusters. The source DB engine
      # must be MySQL.
      def restore_db_cluster_from_s3(
        db_cluster_identifier : String,
        engine : String,
        master_username : String,
        s3_bucket_name : String,
        s3_ingestion_role_arn : String,
        source_engine : String,
        source_engine_version : String,
        availability_zones : Array(String)? = nil,
        backtrack_window : Int64? = nil,
        backup_retention_period : Int32? = nil,
        character_set_name : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        database_name : String? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_iam_role_name : String? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_iam_database_authentication : Bool? = nil,
        engine_lifecycle_support : String? = nil,
        engine_version : String? = nil,
        kms_key_id : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        network_type : String? = nil,
        option_group_name : String? = nil,
        port : Int32? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        s3_prefix : String? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_encrypted : Bool? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBClusterFromS3Result
        input = Types::RestoreDBClusterFromS3Message.new(db_cluster_identifier: db_cluster_identifier, engine: engine, master_username: master_username, s3_bucket_name: s3_bucket_name, s3_ingestion_role_arn: s3_ingestion_role_arn, source_engine: source_engine, source_engine_version: source_engine_version, availability_zones: availability_zones, backtrack_window: backtrack_window, backup_retention_period: backup_retention_period, character_set_name: character_set_name, copy_tags_to_snapshot: copy_tags_to_snapshot, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_subnet_group_name: db_subnet_group_name, database_name: database_name, deletion_protection: deletion_protection, domain: domain, domain_iam_role_name: domain_iam_role_name, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_iam_database_authentication: enable_iam_database_authentication, engine_lifecycle_support: engine_lifecycle_support, engine_version: engine_version, kms_key_id: kms_key_id, manage_master_user_password: manage_master_user_password, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, network_type: network_type, option_group_name: option_group_name, port: port, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, s3_prefix: s3_prefix, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_encrypted: storage_encrypted, storage_type: storage_type, tag_specifications: tag_specifications, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        restore_db_cluster_from_s3(input)
      end
      def restore_db_cluster_from_s3(input : Types::RestoreDBClusterFromS3Message) : Types::RestoreDBClusterFromS3Result
        request = Protocol::Query.build_request(Model::RESTORE_DB_CLUSTER_FROM_S3, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreDBClusterFromS3Result, "RestoreDBClusterFromS3")
      end

      # Creates a new DB cluster from a DB snapshot or DB cluster snapshot. The target DB cluster is created
      # from the source snapshot with a default configuration. If you don't specify a security group, the
      # new DB cluster is associated with the default security group. This operation only restores the DB
      # cluster, not the DB instances for that DB cluster. You must invoke the CreateDBInstance operation to
      # create DB instances for the restored DB cluster, specifying the identifier of the restored DB
      # cluster in DBClusterIdentifier . You can create DB instances only after the
      # RestoreDBClusterFromSnapshot operation has completed and the DB cluster is available. For more
      # information on Amazon Aurora DB clusters, see What is Amazon Aurora? in the Amazon Aurora User Guide
      # . For more information on Multi-AZ DB clusters, see Multi-AZ DB cluster deployments in the Amazon
      # RDS User Guide.
      def restore_db_cluster_from_snapshot(
        db_cluster_identifier : String,
        engine : String,
        snapshot_identifier : String,
        availability_zones : Array(String)? = nil,
        backtrack_window : Int64? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_cluster_instance_class : String? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        database_name : String? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_iam_role_name : String? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        engine_lifecycle_support : String? = nil,
        engine_mode : String? = nil,
        engine_version : String? = nil,
        iops : Int32? = nil,
        kms_key_id : String? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        network_type : String? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        performance_insights_retention_period : Int32? = nil,
        port : Int32? = nil,
        publicly_accessible : Bool? = nil,
        rds_custom_cluster_configuration : Types::RdsCustomClusterConfiguration? = nil,
        scaling_configuration : Types::ScalingConfiguration? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBClusterFromSnapshotResult
        input = Types::RestoreDBClusterFromSnapshotMessage.new(db_cluster_identifier: db_cluster_identifier, engine: engine, snapshot_identifier: snapshot_identifier, availability_zones: availability_zones, backtrack_window: backtrack_window, copy_tags_to_snapshot: copy_tags_to_snapshot, db_cluster_instance_class: db_cluster_instance_class, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_subnet_group_name: db_subnet_group_name, database_name: database_name, deletion_protection: deletion_protection, domain: domain, domain_iam_role_name: domain_iam_role_name, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_iam_database_authentication: enable_iam_database_authentication, enable_performance_insights: enable_performance_insights, engine_lifecycle_support: engine_lifecycle_support, engine_mode: engine_mode, engine_version: engine_version, iops: iops, kms_key_id: kms_key_id, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, network_type: network_type, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, performance_insights_retention_period: performance_insights_retention_period, port: port, publicly_accessible: publicly_accessible, rds_custom_cluster_configuration: rds_custom_cluster_configuration, scaling_configuration: scaling_configuration, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, storage_type: storage_type, tag_specifications: tag_specifications, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
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
      # cluster is created with the default DB security group. Unless the RestoreType is set to
      # copy-on-write , the restore may occur in a different Availability Zone (AZ) from the original DB
      # cluster. The AZ where RDS restores the DB cluster depends on the AZs in the specified subnet group.
      # For Aurora, this operation only restores the DB cluster, not the DB instances for that DB cluster.
      # You must invoke the CreateDBInstance operation to create DB instances for the restored DB cluster,
      # specifying the identifier of the restored DB cluster in DBClusterIdentifier . You can create DB
      # instances only after the RestoreDBClusterToPointInTime operation has completed and the DB cluster is
      # available. For more information on Amazon Aurora DB clusters, see What is Amazon Aurora? in the
      # Amazon Aurora User Guide . For more information on Multi-AZ DB clusters, see Multi-AZ DB cluster
      # deployments in the Amazon RDS User Guide.
      def restore_db_cluster_to_point_in_time(
        db_cluster_identifier : String,
        backtrack_window : Int64? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_cluster_instance_class : String? = nil,
        db_cluster_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_iam_role_name : String? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        engine_lifecycle_support : String? = nil,
        engine_mode : String? = nil,
        iops : Int32? = nil,
        kms_key_id : String? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        network_type : String? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        performance_insights_retention_period : Int32? = nil,
        port : Int32? = nil,
        publicly_accessible : Bool? = nil,
        rds_custom_cluster_configuration : Types::RdsCustomClusterConfiguration? = nil,
        restore_to_time : Time? = nil,
        restore_type : String? = nil,
        scaling_configuration : Types::ScalingConfiguration? = nil,
        serverless_v2_scaling_configuration : Types::ServerlessV2ScalingConfiguration? = nil,
        source_db_cluster_identifier : String? = nil,
        source_db_cluster_resource_id : String? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        use_latest_restorable_time : Bool? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBClusterToPointInTimeResult
        input = Types::RestoreDBClusterToPointInTimeMessage.new(db_cluster_identifier: db_cluster_identifier, backtrack_window: backtrack_window, copy_tags_to_snapshot: copy_tags_to_snapshot, db_cluster_instance_class: db_cluster_instance_class, db_cluster_parameter_group_name: db_cluster_parameter_group_name, db_subnet_group_name: db_subnet_group_name, deletion_protection: deletion_protection, domain: domain, domain_iam_role_name: domain_iam_role_name, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_iam_database_authentication: enable_iam_database_authentication, enable_performance_insights: enable_performance_insights, engine_lifecycle_support: engine_lifecycle_support, engine_mode: engine_mode, iops: iops, kms_key_id: kms_key_id, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, network_type: network_type, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, performance_insights_retention_period: performance_insights_retention_period, port: port, publicly_accessible: publicly_accessible, rds_custom_cluster_configuration: rds_custom_cluster_configuration, restore_to_time: restore_to_time, restore_type: restore_type, scaling_configuration: scaling_configuration, serverless_v2_scaling_configuration: serverless_v2_scaling_configuration, source_db_cluster_identifier: source_db_cluster_identifier, source_db_cluster_resource_id: source_db_cluster_resource_id, storage_type: storage_type, tag_specifications: tag_specifications, tags: tags, use_latest_restorable_time: use_latest_restorable_time, vpc_security_group_ids: vpc_security_group_ids)
        restore_db_cluster_to_point_in_time(input)
      end
      def restore_db_cluster_to_point_in_time(input : Types::RestoreDBClusterToPointInTimeMessage) : Types::RestoreDBClusterToPointInTimeResult
        request = Protocol::Query.build_request(Model::RESTORE_DB_CLUSTER_TO_POINT_IN_TIME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreDBClusterToPointInTimeResult, "RestoreDBClusterToPointInTime")
      end

      # Creates a new DB instance from a DB snapshot. The target database is created from the source
      # database restore point with most of the source's original configuration, including the default
      # security group and DB parameter group. By default, the new DB instance is created as a Single-AZ
      # deployment, except when the instance is a SQL Server instance that has an option group associated
      # with mirroring. In this case, the instance becomes a Multi-AZ deployment, not a Single-AZ
      # deployment. If you want to replace your original DB instance with the new, restored DB instance,
      # then rename your original DB instance before you call the RestoreDBInstanceFromDBSnapshot operation.
      # RDS doesn't allow two DB instances with the same name. After you have renamed your original DB
      # instance with a different identifier, then you can pass the original name of the DB instance as the
      # DBInstanceIdentifier in the call to the RestoreDBInstanceFromDBSnapshot operation. The result is
      # that you replace the original DB instance with the DB instance created from the snapshot. If you are
      # restoring from a shared manual DB snapshot, the DBSnapshotIdentifier must be the ARN of the shared
      # DB snapshot. To restore from a DB snapshot with an unsupported engine version, you must first
      # upgrade the engine version of the snapshot. For more information about upgrading a RDS for MySQL DB
      # snapshot engine version, see Upgrading a MySQL DB snapshot engine version . For more information
      # about upgrading a RDS for PostgreSQL DB snapshot engine version, Upgrading a PostgreSQL DB snapshot
      # engine version . This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use
      # RestoreDBClusterFromSnapshot .
      def restore_db_instance_from_db_snapshot(
        db_instance_identifier : String,
        additional_storage_volumes : Array(Types::AdditionalStorageVolume)? = nil,
        allocated_storage : Int32? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        availability_zone : String? = nil,
        backup_target : String? = nil,
        ca_certificate_identifier : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        custom_iam_instance_profile : String? = nil,
        db_cluster_snapshot_identifier : String? = nil,
        db_instance_class : String? = nil,
        db_name : String? = nil,
        db_parameter_group_name : String? = nil,
        db_snapshot_identifier : String? = nil,
        db_subnet_group_name : String? = nil,
        dedicated_log_volume : Bool? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_auth_secret_arn : String? = nil,
        domain_dns_ips : Array(String)? = nil,
        domain_fqdn : String? = nil,
        domain_iam_role_name : String? = nil,
        domain_ou : String? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_customer_owned_ip : Bool? = nil,
        enable_iam_database_authentication : Bool? = nil,
        engine : String? = nil,
        engine_lifecycle_support : String? = nil,
        iops : Int32? = nil,
        license_model : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_secret_kms_key_id : String? = nil,
        multi_az : Bool? = nil,
        network_type : String? = nil,
        option_group_name : String? = nil,
        port : Int32? = nil,
        processor_features : Array(Types::ProcessorFeature)? = nil,
        publicly_accessible : Bool? = nil,
        storage_throughput : Int32? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        tde_credential_arn : String? = nil,
        tde_credential_password : String? = nil,
        use_default_processor_features : Bool? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBInstanceFromDBSnapshotResult
        input = Types::RestoreDBInstanceFromDBSnapshotMessage.new(db_instance_identifier: db_instance_identifier, additional_storage_volumes: additional_storage_volumes, allocated_storage: allocated_storage, auto_minor_version_upgrade: auto_minor_version_upgrade, availability_zone: availability_zone, backup_target: backup_target, ca_certificate_identifier: ca_certificate_identifier, copy_tags_to_snapshot: copy_tags_to_snapshot, custom_iam_instance_profile: custom_iam_instance_profile, db_cluster_snapshot_identifier: db_cluster_snapshot_identifier, db_instance_class: db_instance_class, db_name: db_name, db_parameter_group_name: db_parameter_group_name, db_snapshot_identifier: db_snapshot_identifier, db_subnet_group_name: db_subnet_group_name, dedicated_log_volume: dedicated_log_volume, deletion_protection: deletion_protection, domain: domain, domain_auth_secret_arn: domain_auth_secret_arn, domain_dns_ips: domain_dns_ips, domain_fqdn: domain_fqdn, domain_iam_role_name: domain_iam_role_name, domain_ou: domain_ou, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_customer_owned_ip: enable_customer_owned_ip, enable_iam_database_authentication: enable_iam_database_authentication, engine: engine, engine_lifecycle_support: engine_lifecycle_support, iops: iops, license_model: license_model, manage_master_user_password: manage_master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, multi_az: multi_az, network_type: network_type, option_group_name: option_group_name, port: port, processor_features: processor_features, publicly_accessible: publicly_accessible, storage_throughput: storage_throughput, storage_type: storage_type, tag_specifications: tag_specifications, tags: tags, tde_credential_arn: tde_credential_arn, tde_credential_password: tde_credential_password, use_default_processor_features: use_default_processor_features, vpc_security_group_ids: vpc_security_group_ids)
        restore_db_instance_from_db_snapshot(input)
      end
      def restore_db_instance_from_db_snapshot(input : Types::RestoreDBInstanceFromDBSnapshotMessage) : Types::RestoreDBInstanceFromDBSnapshotResult
        request = Protocol::Query.build_request(Model::RESTORE_DB_INSTANCE_FROM_DB_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreDBInstanceFromDBSnapshotResult, "RestoreDBInstanceFromDBSnapshot")
      end

      # Amazon Relational Database Service (Amazon RDS) supports importing MySQL databases by using backup
      # files. You can create a backup of your on-premises database, store it on Amazon Simple Storage
      # Service (Amazon S3), and then restore the backup file onto a new Amazon RDS DB instance running
      # MySQL. For more information, see Restoring a backup into an Amazon RDS for MySQL DB instance in the
      # Amazon RDS User Guide. This operation doesn't apply to RDS Custom.
      def restore_db_instance_from_s3(
        db_instance_class : String,
        db_instance_identifier : String,
        engine : String,
        s3_bucket_name : String,
        s3_ingestion_role_arn : String,
        source_engine : String,
        source_engine_version : String,
        additional_storage_volumes : Array(Types::AdditionalStorageVolume)? = nil,
        allocated_storage : Int32? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        availability_zone : String? = nil,
        backup_retention_period : Int32? = nil,
        ca_certificate_identifier : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        db_name : String? = nil,
        db_parameter_group_name : String? = nil,
        db_security_groups : Array(String)? = nil,
        db_subnet_group_name : String? = nil,
        database_insights_mode : String? = nil,
        dedicated_log_volume : Bool? = nil,
        deletion_protection : Bool? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_iam_database_authentication : Bool? = nil,
        enable_performance_insights : Bool? = nil,
        engine_lifecycle_support : String? = nil,
        engine_version : String? = nil,
        iops : Int32? = nil,
        kms_key_id : String? = nil,
        license_model : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_password : String? = nil,
        master_user_secret_kms_key_id : String? = nil,
        master_username : String? = nil,
        max_allocated_storage : Int32? = nil,
        monitoring_interval : Int32? = nil,
        monitoring_role_arn : String? = nil,
        multi_az : Bool? = nil,
        network_type : String? = nil,
        option_group_name : String? = nil,
        performance_insights_kms_key_id : String? = nil,
        performance_insights_retention_period : Int32? = nil,
        port : Int32? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        processor_features : Array(Types::ProcessorFeature)? = nil,
        publicly_accessible : Bool? = nil,
        s3_prefix : String? = nil,
        storage_encrypted : Bool? = nil,
        storage_throughput : Int32? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        use_default_processor_features : Bool? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBInstanceFromS3Result
        input = Types::RestoreDBInstanceFromS3Message.new(db_instance_class: db_instance_class, db_instance_identifier: db_instance_identifier, engine: engine, s3_bucket_name: s3_bucket_name, s3_ingestion_role_arn: s3_ingestion_role_arn, source_engine: source_engine, source_engine_version: source_engine_version, additional_storage_volumes: additional_storage_volumes, allocated_storage: allocated_storage, auto_minor_version_upgrade: auto_minor_version_upgrade, availability_zone: availability_zone, backup_retention_period: backup_retention_period, ca_certificate_identifier: ca_certificate_identifier, copy_tags_to_snapshot: copy_tags_to_snapshot, db_name: db_name, db_parameter_group_name: db_parameter_group_name, db_security_groups: db_security_groups, db_subnet_group_name: db_subnet_group_name, database_insights_mode: database_insights_mode, dedicated_log_volume: dedicated_log_volume, deletion_protection: deletion_protection, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_iam_database_authentication: enable_iam_database_authentication, enable_performance_insights: enable_performance_insights, engine_lifecycle_support: engine_lifecycle_support, engine_version: engine_version, iops: iops, kms_key_id: kms_key_id, license_model: license_model, manage_master_user_password: manage_master_user_password, master_user_password: master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, master_username: master_username, max_allocated_storage: max_allocated_storage, monitoring_interval: monitoring_interval, monitoring_role_arn: monitoring_role_arn, multi_az: multi_az, network_type: network_type, option_group_name: option_group_name, performance_insights_kms_key_id: performance_insights_kms_key_id, performance_insights_retention_period: performance_insights_retention_period, port: port, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, processor_features: processor_features, publicly_accessible: publicly_accessible, s3_prefix: s3_prefix, storage_encrypted: storage_encrypted, storage_throughput: storage_throughput, storage_type: storage_type, tag_specifications: tag_specifications, tags: tags, use_default_processor_features: use_default_processor_features, vpc_security_group_ids: vpc_security_group_ids)
        restore_db_instance_from_s3(input)
      end
      def restore_db_instance_from_s3(input : Types::RestoreDBInstanceFromS3Message) : Types::RestoreDBInstanceFromS3Result
        request = Protocol::Query.build_request(Model::RESTORE_DB_INSTANCE_FROM_S3, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreDBInstanceFromS3Result, "RestoreDBInstanceFromS3")
      end

      # Restores a DB instance to an arbitrary point in time. You can restore to any point in time before
      # the time identified by the LatestRestorableTime property. You can restore to a point up to the
      # number of days specified by the BackupRetentionPeriod property. The target database is created with
      # most of the original configuration, but in a system-selected Availability Zone, with the default
      # security group, the default subnet group, and the default DB parameter group. By default, the new DB
      # instance is created as a single-AZ deployment except when the instance is a SQL Server instance that
      # has an option group that is associated with mirroring; in this case, the instance becomes a mirrored
      # deployment and not a single-AZ deployment. This operation doesn't apply to Aurora MySQL and Aurora
      # PostgreSQL. For Aurora, use RestoreDBClusterToPointInTime .
      def restore_db_instance_to_point_in_time(
        target_db_instance_identifier : String,
        additional_storage_volumes : Array(Types::AdditionalStorageVolume)? = nil,
        allocated_storage : Int32? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        availability_zone : String? = nil,
        backup_target : String? = nil,
        ca_certificate_identifier : String? = nil,
        copy_tags_to_snapshot : Bool? = nil,
        custom_iam_instance_profile : String? = nil,
        db_instance_class : String? = nil,
        db_name : String? = nil,
        db_parameter_group_name : String? = nil,
        db_subnet_group_name : String? = nil,
        dedicated_log_volume : Bool? = nil,
        deletion_protection : Bool? = nil,
        domain : String? = nil,
        domain_auth_secret_arn : String? = nil,
        domain_dns_ips : Array(String)? = nil,
        domain_fqdn : String? = nil,
        domain_iam_role_name : String? = nil,
        domain_ou : String? = nil,
        enable_cloudwatch_logs_exports : Array(String)? = nil,
        enable_customer_owned_ip : Bool? = nil,
        enable_iam_database_authentication : Bool? = nil,
        engine : String? = nil,
        engine_lifecycle_support : String? = nil,
        iops : Int32? = nil,
        license_model : String? = nil,
        manage_master_user_password : Bool? = nil,
        master_user_secret_kms_key_id : String? = nil,
        max_allocated_storage : Int32? = nil,
        multi_az : Bool? = nil,
        network_type : String? = nil,
        option_group_name : String? = nil,
        port : Int32? = nil,
        processor_features : Array(Types::ProcessorFeature)? = nil,
        publicly_accessible : Bool? = nil,
        restore_time : Time? = nil,
        source_db_instance_automated_backups_arn : String? = nil,
        source_db_instance_identifier : String? = nil,
        source_dbi_resource_id : String? = nil,
        storage_throughput : Int32? = nil,
        storage_type : String? = nil,
        tag_specifications : Array(Types::TagSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        tde_credential_arn : String? = nil,
        tde_credential_password : String? = nil,
        use_default_processor_features : Bool? = nil,
        use_latest_restorable_time : Bool? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::RestoreDBInstanceToPointInTimeResult
        input = Types::RestoreDBInstanceToPointInTimeMessage.new(target_db_instance_identifier: target_db_instance_identifier, additional_storage_volumes: additional_storage_volumes, allocated_storage: allocated_storage, auto_minor_version_upgrade: auto_minor_version_upgrade, availability_zone: availability_zone, backup_target: backup_target, ca_certificate_identifier: ca_certificate_identifier, copy_tags_to_snapshot: copy_tags_to_snapshot, custom_iam_instance_profile: custom_iam_instance_profile, db_instance_class: db_instance_class, db_name: db_name, db_parameter_group_name: db_parameter_group_name, db_subnet_group_name: db_subnet_group_name, dedicated_log_volume: dedicated_log_volume, deletion_protection: deletion_protection, domain: domain, domain_auth_secret_arn: domain_auth_secret_arn, domain_dns_ips: domain_dns_ips, domain_fqdn: domain_fqdn, domain_iam_role_name: domain_iam_role_name, domain_ou: domain_ou, enable_cloudwatch_logs_exports: enable_cloudwatch_logs_exports, enable_customer_owned_ip: enable_customer_owned_ip, enable_iam_database_authentication: enable_iam_database_authentication, engine: engine, engine_lifecycle_support: engine_lifecycle_support, iops: iops, license_model: license_model, manage_master_user_password: manage_master_user_password, master_user_secret_kms_key_id: master_user_secret_kms_key_id, max_allocated_storage: max_allocated_storage, multi_az: multi_az, network_type: network_type, option_group_name: option_group_name, port: port, processor_features: processor_features, publicly_accessible: publicly_accessible, restore_time: restore_time, source_db_instance_automated_backups_arn: source_db_instance_automated_backups_arn, source_db_instance_identifier: source_db_instance_identifier, source_dbi_resource_id: source_dbi_resource_id, storage_throughput: storage_throughput, storage_type: storage_type, tag_specifications: tag_specifications, tags: tags, tde_credential_arn: tde_credential_arn, tde_credential_password: tde_credential_password, use_default_processor_features: use_default_processor_features, use_latest_restorable_time: use_latest_restorable_time, vpc_security_group_ids: vpc_security_group_ids)
        restore_db_instance_to_point_in_time(input)
      end
      def restore_db_instance_to_point_in_time(input : Types::RestoreDBInstanceToPointInTimeMessage) : Types::RestoreDBInstanceToPointInTimeResult
        request = Protocol::Query.build_request(Model::RESTORE_DB_INSTANCE_TO_POINT_IN_TIME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RestoreDBInstanceToPointInTimeResult, "RestoreDBInstanceToPointInTime")
      end

      # Revokes ingress from a DBSecurityGroup for previously authorized IP ranges or EC2 or VPC security
      # groups. Required parameters for this API are one of CIDRIP, EC2SecurityGroupId for VPC, or
      # (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId). EC2-Classic was
      # retired on August 15, 2022. If you haven't migrated from EC2-Classic to a VPC, we recommend that you
      # migrate as soon as possible. For more information, see Migrate from EC2-Classic to a VPC in the
      # Amazon EC2 User Guide , the blog EC2-Classic Networking is Retiring – Here’s How to Prepare , and
      # Moving a DB instance not in a VPC into a VPC in the Amazon RDS User Guide .
      def revoke_db_security_group_ingress(
        db_security_group_name : String,
        cidrip : String? = nil,
        ec2_security_group_id : String? = nil,
        ec2_security_group_name : String? = nil,
        ec2_security_group_owner_id : String? = nil
      ) : Types::RevokeDBSecurityGroupIngressResult
        input = Types::RevokeDBSecurityGroupIngressMessage.new(db_security_group_name: db_security_group_name, cidrip: cidrip, ec2_security_group_id: ec2_security_group_id, ec2_security_group_name: ec2_security_group_name, ec2_security_group_owner_id: ec2_security_group_owner_id)
        revoke_db_security_group_ingress(input)
      end
      def revoke_db_security_group_ingress(input : Types::RevokeDBSecurityGroupIngressMessage) : Types::RevokeDBSecurityGroupIngressResult
        request = Protocol::Query.build_request(Model::REVOKE_DB_SECURITY_GROUP_INGRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::RevokeDBSecurityGroupIngressResult, "RevokeDBSecurityGroupIngress")
      end

      # Starts a database activity stream to monitor activity on the database. For more information, see
      # Monitoring Amazon Aurora with Database Activity Streams in the Amazon Aurora User Guide or
      # Monitoring Amazon RDS with Database Activity Streams in the Amazon RDS User Guide .
      def start_activity_stream(
        kms_key_id : String,
        mode : String,
        resource_arn : String,
        apply_immediately : Bool? = nil,
        engine_native_audit_fields_included : Bool? = nil
      ) : Types::StartActivityStreamResponse
        input = Types::StartActivityStreamRequest.new(kms_key_id: kms_key_id, mode: mode, resource_arn: resource_arn, apply_immediately: apply_immediately, engine_native_audit_fields_included: engine_native_audit_fields_included)
        start_activity_stream(input)
      end
      def start_activity_stream(input : Types::StartActivityStreamRequest) : Types::StartActivityStreamResponse
        request = Protocol::Query.build_request(Model::START_ACTIVITY_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StartActivityStreamResponse, "StartActivityStream")
      end

      # Starts an Amazon Aurora DB cluster that was stopped using the Amazon Web Services console, the
      # stop-db-cluster CLI command, or the StopDBCluster operation. For more information, see Stopping and
      # Starting an Aurora Cluster in the Amazon Aurora User Guide . This operation only applies to Aurora
      # DB clusters.
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

      # Starts an Amazon RDS DB instance that was stopped using the Amazon Web Services console, the
      # stop-db-instance CLI command, or the StopDBInstance operation. For more information, see Starting an
      # Amazon RDS DB instance That Was Previously Stopped in the Amazon RDS User Guide. This command
      # doesn't apply to RDS Custom, Aurora MySQL, and Aurora PostgreSQL. For Aurora DB clusters, use
      # StartDBCluster instead.
      def start_db_instance(
        db_instance_identifier : String
      ) : Types::StartDBInstanceResult
        input = Types::StartDBInstanceMessage.new(db_instance_identifier: db_instance_identifier)
        start_db_instance(input)
      end
      def start_db_instance(input : Types::StartDBInstanceMessage) : Types::StartDBInstanceResult
        request = Protocol::Query.build_request(Model::START_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StartDBInstanceResult, "StartDBInstance")
      end

      # Enables replication of automated backups to a different Amazon Web Services Region. This command
      # doesn't apply to RDS Custom. For more information, see Replicating Automated Backups to Another
      # Amazon Web Services Region in the Amazon RDS User Guide.
      def start_db_instance_automated_backups_replication(
        source_db_instance_arn : String,
        backup_retention_period : Int32? = nil,
        kms_key_id : String? = nil,
        pre_signed_url : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartDBInstanceAutomatedBackupsReplicationResult
        input = Types::StartDBInstanceAutomatedBackupsReplicationMessage.new(source_db_instance_arn: source_db_instance_arn, backup_retention_period: backup_retention_period, kms_key_id: kms_key_id, pre_signed_url: pre_signed_url, tags: tags)
        start_db_instance_automated_backups_replication(input)
      end
      def start_db_instance_automated_backups_replication(input : Types::StartDBInstanceAutomatedBackupsReplicationMessage) : Types::StartDBInstanceAutomatedBackupsReplicationResult
        request = Protocol::Query.build_request(Model::START_DB_INSTANCE_AUTOMATED_BACKUPS_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StartDBInstanceAutomatedBackupsReplicationResult, "StartDBInstanceAutomatedBackupsReplication")
      end

      # Starts an export of DB snapshot or DB cluster data to Amazon S3. The provided IAM role must have
      # access to the S3 bucket. You can't export snapshot data from RDS Custom DB instances. For more
      # information, see Supported Regions and DB engines for exporting snapshots to S3 in Amazon RDS . For
      # more information on exporting DB snapshot data, see Exporting DB snapshot data to Amazon S3 in the
      # Amazon RDS User Guide or Exporting DB cluster snapshot data to Amazon S3 in the Amazon Aurora User
      # Guide . For more information on exporting DB cluster data, see Exporting DB cluster data to Amazon
      # S3 in the Amazon Aurora User Guide .
      def start_export_task(
        export_task_identifier : String,
        iam_role_arn : String,
        kms_key_id : String,
        s3_bucket_name : String,
        source_arn : String,
        export_only : Array(String)? = nil,
        s3_prefix : String? = nil
      ) : Types::ExportTask
        input = Types::StartExportTaskMessage.new(export_task_identifier: export_task_identifier, iam_role_arn: iam_role_arn, kms_key_id: kms_key_id, s3_bucket_name: s3_bucket_name, source_arn: source_arn, export_only: export_only, s3_prefix: s3_prefix)
        start_export_task(input)
      end
      def start_export_task(input : Types::StartExportTaskMessage) : Types::ExportTask
        request = Protocol::Query.build_request(Model::START_EXPORT_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ExportTask, "StartExportTask")
      end

      # Stops a database activity stream that was started using the Amazon Web Services console, the
      # start-activity-stream CLI command, or the StartActivityStream operation. For more information, see
      # Monitoring Amazon Aurora with Database Activity Streams in the Amazon Aurora User Guide or
      # Monitoring Amazon RDS with Database Activity Streams in the Amazon RDS User Guide .
      def stop_activity_stream(
        resource_arn : String,
        apply_immediately : Bool? = nil
      ) : Types::StopActivityStreamResponse
        input = Types::StopActivityStreamRequest.new(resource_arn: resource_arn, apply_immediately: apply_immediately)
        stop_activity_stream(input)
      end
      def stop_activity_stream(input : Types::StopActivityStreamRequest) : Types::StopActivityStreamResponse
        request = Protocol::Query.build_request(Model::STOP_ACTIVITY_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StopActivityStreamResponse, "StopActivityStream")
      end

      # Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora retains the DB cluster's
      # metadata, including its endpoints and DB parameter groups. Aurora also retains the transaction logs
      # so you can do a point-in-time restore if necessary. For more information, see Stopping and Starting
      # an Aurora Cluster in the Amazon Aurora User Guide . This operation only applies to Aurora DB
      # clusters.
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

      # Stops an Amazon RDS DB instance temporarily. When you stop a DB instance, Amazon RDS retains the DB
      # instance's metadata, including its endpoint, DB parameter group, and option group membership. Amazon
      # RDS also retains the transaction logs so you can do a point-in-time restore if necessary. The
      # instance restarts automatically after 7 days. For more information, see Stopping an Amazon RDS DB
      # Instance Temporarily in the Amazon RDS User Guide. This command doesn't apply to RDS Custom, Aurora
      # MySQL, and Aurora PostgreSQL. For Aurora clusters, use StopDBCluster instead.
      def stop_db_instance(
        db_instance_identifier : String,
        db_snapshot_identifier : String? = nil
      ) : Types::StopDBInstanceResult
        input = Types::StopDBInstanceMessage.new(db_instance_identifier: db_instance_identifier, db_snapshot_identifier: db_snapshot_identifier)
        stop_db_instance(input)
      end
      def stop_db_instance(input : Types::StopDBInstanceMessage) : Types::StopDBInstanceResult
        request = Protocol::Query.build_request(Model::STOP_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StopDBInstanceResult, "StopDBInstance")
      end

      # Stops automated backup replication for a DB instance. This command doesn't apply to RDS Custom,
      # Aurora MySQL, and Aurora PostgreSQL. For more information, see Replicating Automated Backups to
      # Another Amazon Web Services Region in the Amazon RDS User Guide.
      def stop_db_instance_automated_backups_replication(
        source_db_instance_arn : String
      ) : Types::StopDBInstanceAutomatedBackupsReplicationResult
        input = Types::StopDBInstanceAutomatedBackupsReplicationMessage.new(source_db_instance_arn: source_db_instance_arn)
        stop_db_instance_automated_backups_replication(input)
      end
      def stop_db_instance_automated_backups_replication(input : Types::StopDBInstanceAutomatedBackupsReplicationMessage) : Types::StopDBInstanceAutomatedBackupsReplicationResult
        request = Protocol::Query.build_request(Model::STOP_DB_INSTANCE_AUTOMATED_BACKUPS_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::StopDBInstanceAutomatedBackupsReplicationResult, "StopDBInstanceAutomatedBackupsReplication")
      end

      # Switches over a blue/green deployment. Before you switch over, production traffic is routed to the
      # databases in the blue environment. After you switch over, production traffic is routed to the
      # databases in the green environment. For more information, see Using Amazon RDS Blue/Green
      # Deployments for database updates in the Amazon RDS User Guide and Using Amazon RDS Blue/Green
      # Deployments for database updates in the Amazon Aurora User Guide .
      def switchover_blue_green_deployment(
        blue_green_deployment_identifier : String,
        switchover_timeout : Int32? = nil
      ) : Types::SwitchoverBlueGreenDeploymentResponse
        input = Types::SwitchoverBlueGreenDeploymentRequest.new(blue_green_deployment_identifier: blue_green_deployment_identifier, switchover_timeout: switchover_timeout)
        switchover_blue_green_deployment(input)
      end
      def switchover_blue_green_deployment(input : Types::SwitchoverBlueGreenDeploymentRequest) : Types::SwitchoverBlueGreenDeploymentResponse
        request = Protocol::Query.build_request(Model::SWITCHOVER_BLUE_GREEN_DEPLOYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SwitchoverBlueGreenDeploymentResponse, "SwitchoverBlueGreenDeployment")
      end

      # Switches over the specified secondary DB cluster to be the new primary DB cluster in the global
      # database cluster. Switchover operations were previously called "managed planned failovers." Aurora
      # promotes the specified secondary cluster to assume full read/write capabilities and demotes the
      # current primary cluster to a secondary (read-only) cluster, maintaining the orginal replication
      # topology. All secondary clusters are synchronized with the primary at the beginning of the process
      # so the new primary continues operations for the Aurora global database without losing any data. Your
      # database is unavailable for a short time while the primary and selected secondary clusters are
      # assuming their new roles. For more information about switching over an Aurora global database, see
      # Performing switchovers for Amazon Aurora global databases in the Amazon Aurora User Guide . This
      # operation is intended for controlled environments, for operations such as "regional rotation" or to
      # fall back to the original primary after a global database failover.
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

      # Switches over an Oracle standby database in an Oracle Data Guard environment, making it the new
      # primary database. Issue this command in the Region that hosts the current standby database.
      def switchover_read_replica(
        db_instance_identifier : String
      ) : Types::SwitchoverReadReplicaResult
        input = Types::SwitchoverReadReplicaMessage.new(db_instance_identifier: db_instance_identifier)
        switchover_read_replica(input)
      end
      def switchover_read_replica(input : Types::SwitchoverReadReplicaMessage) : Types::SwitchoverReadReplicaResult
        request = Protocol::Query.build_request(Model::SWITCHOVER_READ_REPLICA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SwitchoverReadReplicaResult, "SwitchoverReadReplica")
      end
    end
  end
end
