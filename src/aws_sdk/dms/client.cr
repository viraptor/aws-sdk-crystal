module AwsSdk
  module DatabaseMigrationService
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

      # Adds metadata tags to an DMS resource, including replication instance, endpoint, subnet group, and
      # migration task. These tags can also be used with cost allocation reporting to track cost associated
      # with DMS resources, or used in a Condition statement in an IAM policy for DMS. For more information,
      # see Tag data type description.
      def add_tags_to_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::AddTagsToResourceResponse
        input = Types::AddTagsToResourceMessage.new(resource_arn: resource_arn, tags: tags)
        add_tags_to_resource(input)
      end
      def add_tags_to_resource(input : Types::AddTagsToResourceMessage) : Types::AddTagsToResourceResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS_TO_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsToResourceResponse, "AddTagsToResource")
      end

      # Applies a pending maintenance action to a resource (for example, to a replication instance).
      def apply_pending_maintenance_action(
        apply_action : String,
        opt_in_type : String,
        replication_instance_arn : String
      ) : Types::ApplyPendingMaintenanceActionResponse
        input = Types::ApplyPendingMaintenanceActionMessage.new(apply_action: apply_action, opt_in_type: opt_in_type, replication_instance_arn: replication_instance_arn)
        apply_pending_maintenance_action(input)
      end
      def apply_pending_maintenance_action(input : Types::ApplyPendingMaintenanceActionMessage) : Types::ApplyPendingMaintenanceActionResponse
        request = Protocol::JsonRpc.build_request(Model::APPLY_PENDING_MAINTENANCE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ApplyPendingMaintenanceActionResponse, "ApplyPendingMaintenanceAction")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Starts the analysis of up to
      # 20 source databases to recommend target engines for each source database. This is a batch version of
      # StartRecommendations . The result of analysis of each source database is reported individually in
      # the response. Because the batch request can result in a combination of successful and unsuccessful
      # actions, you should check for batch errors even when the call returns an HTTP status code of 200 .
      def batch_start_recommendations(
        data : Array(Types::StartRecommendationsRequestEntry)? = nil
      ) : Types::BatchStartRecommendationsResponse
        input = Types::BatchStartRecommendationsRequest.new(data: data)
        batch_start_recommendations(input)
      end
      def batch_start_recommendations(input : Types::BatchStartRecommendationsRequest) : Types::BatchStartRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_START_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchStartRecommendationsResponse, "BatchStartRecommendations")
      end

      # Cancels a single metadata model conversion operation that was started with
      # StartMetadataModelConversion .
      def cancel_metadata_model_conversion(
        migration_project_identifier : String,
        request_identifier : String
      ) : Types::CancelMetadataModelConversionResponse
        input = Types::CancelMetadataModelConversionMessage.new(migration_project_identifier: migration_project_identifier, request_identifier: request_identifier)
        cancel_metadata_model_conversion(input)
      end
      def cancel_metadata_model_conversion(input : Types::CancelMetadataModelConversionMessage) : Types::CancelMetadataModelConversionResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_METADATA_MODEL_CONVERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelMetadataModelConversionResponse, "CancelMetadataModelConversion")
      end

      # Cancels a single metadata model creation operation that was started with StartMetadataModelCreation
      # .
      def cancel_metadata_model_creation(
        migration_project_identifier : String,
        request_identifier : String
      ) : Types::CancelMetadataModelCreationResponse
        input = Types::CancelMetadataModelCreationMessage.new(migration_project_identifier: migration_project_identifier, request_identifier: request_identifier)
        cancel_metadata_model_creation(input)
      end
      def cancel_metadata_model_creation(input : Types::CancelMetadataModelCreationMessage) : Types::CancelMetadataModelCreationResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_METADATA_MODEL_CREATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelMetadataModelCreationResponse, "CancelMetadataModelCreation")
      end

      # Cancels a single premigration assessment run. This operation prevents any individual assessments
      # from running if they haven't started running. It also attempts to cancel any individual assessments
      # that are currently running.
      def cancel_replication_task_assessment_run(
        replication_task_assessment_run_arn : String
      ) : Types::CancelReplicationTaskAssessmentRunResponse
        input = Types::CancelReplicationTaskAssessmentRunMessage.new(replication_task_assessment_run_arn: replication_task_assessment_run_arn)
        cancel_replication_task_assessment_run(input)
      end
      def cancel_replication_task_assessment_run(input : Types::CancelReplicationTaskAssessmentRunMessage) : Types::CancelReplicationTaskAssessmentRunResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_REPLICATION_TASK_ASSESSMENT_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelReplicationTaskAssessmentRunResponse, "CancelReplicationTaskAssessmentRun")
      end

      # Creates a data migration using the provided settings.
      def create_data_migration(
        data_migration_type : String,
        migration_project_identifier : String,
        service_access_role_arn : String,
        data_migration_name : String? = nil,
        enable_cloudwatch_logs : Bool? = nil,
        number_of_jobs : Int32? = nil,
        selection_rules : String? = nil,
        source_data_settings : Array(Types::SourceDataSetting)? = nil,
        tags : Array(Types::Tag)? = nil,
        target_data_settings : Array(Types::TargetDataSetting)? = nil
      ) : Types::CreateDataMigrationResponse
        input = Types::CreateDataMigrationMessage.new(data_migration_type: data_migration_type, migration_project_identifier: migration_project_identifier, service_access_role_arn: service_access_role_arn, data_migration_name: data_migration_name, enable_cloudwatch_logs: enable_cloudwatch_logs, number_of_jobs: number_of_jobs, selection_rules: selection_rules, source_data_settings: source_data_settings, tags: tags, target_data_settings: target_data_settings)
        create_data_migration(input)
      end
      def create_data_migration(input : Types::CreateDataMigrationMessage) : Types::CreateDataMigrationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_MIGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataMigrationResponse, "CreateDataMigration")
      end

      # Creates a data provider using the provided settings. A data provider stores a data store type and
      # location information about your database.
      def create_data_provider(
        engine : String,
        settings : Types::DataProviderSettings,
        data_provider_name : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil,
        virtual : Bool? = nil
      ) : Types::CreateDataProviderResponse
        input = Types::CreateDataProviderMessage.new(engine: engine, settings: settings, data_provider_name: data_provider_name, description: description, tags: tags, virtual: virtual)
        create_data_provider(input)
      end
      def create_data_provider(input : Types::CreateDataProviderMessage) : Types::CreateDataProviderResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataProviderResponse, "CreateDataProvider")
      end

      # Creates an endpoint using the provided settings. For a MySQL source or target endpoint, don't
      # explicitly specify the database using the DatabaseName request parameter on the CreateEndpoint API
      # call. Specifying DatabaseName when you create a MySQL endpoint replicates all the task tables to
      # this single database. For MySQL endpoints, you specify the database only when you specify the schema
      # in the table-mapping rules of the DMS task.
      def create_endpoint(
        endpoint_identifier : String,
        endpoint_type : String,
        engine_name : String,
        certificate_arn : String? = nil,
        database_name : String? = nil,
        dms_transfer_settings : Types::DmsTransferSettings? = nil,
        doc_db_settings : Types::DocDbSettings? = nil,
        dynamo_db_settings : Types::DynamoDbSettings? = nil,
        elasticsearch_settings : Types::ElasticsearchSettings? = nil,
        external_table_definition : String? = nil,
        extra_connection_attributes : String? = nil,
        gcp_my_sql_settings : Types::GcpMySQLSettings? = nil,
        ibm_db2_settings : Types::IBMDb2Settings? = nil,
        kafka_settings : Types::KafkaSettings? = nil,
        kinesis_settings : Types::KinesisSettings? = nil,
        kms_key_id : String? = nil,
        microsoft_sql_server_settings : Types::MicrosoftSQLServerSettings? = nil,
        mongo_db_settings : Types::MongoDbSettings? = nil,
        my_sql_settings : Types::MySQLSettings? = nil,
        neptune_settings : Types::NeptuneSettings? = nil,
        oracle_settings : Types::OracleSettings? = nil,
        password : String? = nil,
        port : Int32? = nil,
        postgre_sql_settings : Types::PostgreSQLSettings? = nil,
        redis_settings : Types::RedisSettings? = nil,
        redshift_settings : Types::RedshiftSettings? = nil,
        resource_identifier : String? = nil,
        s3_settings : Types::S3Settings? = nil,
        server_name : String? = nil,
        service_access_role_arn : String? = nil,
        ssl_mode : String? = nil,
        sybase_settings : Types::SybaseSettings? = nil,
        tags : Array(Types::Tag)? = nil,
        timestream_settings : Types::TimestreamSettings? = nil,
        username : String? = nil
      ) : Types::CreateEndpointResponse
        input = Types::CreateEndpointMessage.new(endpoint_identifier: endpoint_identifier, endpoint_type: endpoint_type, engine_name: engine_name, certificate_arn: certificate_arn, database_name: database_name, dms_transfer_settings: dms_transfer_settings, doc_db_settings: doc_db_settings, dynamo_db_settings: dynamo_db_settings, elasticsearch_settings: elasticsearch_settings, external_table_definition: external_table_definition, extra_connection_attributes: extra_connection_attributes, gcp_my_sql_settings: gcp_my_sql_settings, ibm_db2_settings: ibm_db2_settings, kafka_settings: kafka_settings, kinesis_settings: kinesis_settings, kms_key_id: kms_key_id, microsoft_sql_server_settings: microsoft_sql_server_settings, mongo_db_settings: mongo_db_settings, my_sql_settings: my_sql_settings, neptune_settings: neptune_settings, oracle_settings: oracle_settings, password: password, port: port, postgre_sql_settings: postgre_sql_settings, redis_settings: redis_settings, redshift_settings: redshift_settings, resource_identifier: resource_identifier, s3_settings: s3_settings, server_name: server_name, service_access_role_arn: service_access_role_arn, ssl_mode: ssl_mode, sybase_settings: sybase_settings, tags: tags, timestream_settings: timestream_settings, username: username)
        create_endpoint(input)
      end
      def create_endpoint(input : Types::CreateEndpointMessage) : Types::CreateEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEndpointResponse, "CreateEndpoint")
      end

      # Creates an DMS event notification subscription. You can specify the type of source ( SourceType )
      # you want to be notified of, provide a list of DMS source IDs ( SourceIds ) that triggers the events,
      # and provide a list of event categories ( EventCategories ) for events you want to be notified of. If
      # you specify both the SourceType and SourceIds , such as SourceType = replication-instance and
      # SourceIdentifier = my-replinstance , you will be notified of all the replication instance events for
      # the specified source. If you specify a SourceType but don't specify a SourceIdentifier , you receive
      # notice of the events for that source type for all your DMS sources. If you don't specify either
      # SourceType nor SourceIdentifier , you will be notified of events generated from all DMS sources
      # belonging to your customer account. For more information about DMS events, see Working with Events
      # and Notifications in the Database Migration Service User Guide.
      def create_event_subscription(
        sns_topic_arn : String,
        subscription_name : String,
        enabled : Bool? = nil,
        event_categories : Array(String)? = nil,
        source_ids : Array(String)? = nil,
        source_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEventSubscriptionResponse
        input = Types::CreateEventSubscriptionMessage.new(sns_topic_arn: sns_topic_arn, subscription_name: subscription_name, enabled: enabled, event_categories: event_categories, source_ids: source_ids, source_type: source_type, tags: tags)
        create_event_subscription(input)
      end
      def create_event_subscription(input : Types::CreateEventSubscriptionMessage) : Types::CreateEventSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EVENT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEventSubscriptionResponse, "CreateEventSubscription")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Creates a Fleet Advisor
      # collector using the specified parameters.
      def create_fleet_advisor_collector(
        collector_name : String,
        s3_bucket_name : String,
        service_access_role_arn : String,
        description : String? = nil
      ) : Types::CreateFleetAdvisorCollectorResponse
        input = Types::CreateFleetAdvisorCollectorRequest.new(collector_name: collector_name, s3_bucket_name: s3_bucket_name, service_access_role_arn: service_access_role_arn, description: description)
        create_fleet_advisor_collector(input)
      end
      def create_fleet_advisor_collector(input : Types::CreateFleetAdvisorCollectorRequest) : Types::CreateFleetAdvisorCollectorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FLEET_ADVISOR_COLLECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFleetAdvisorCollectorResponse, "CreateFleetAdvisorCollector")
      end

      # Creates the instance profile using the specified parameters.
      def create_instance_profile(
        availability_zone : String? = nil,
        description : String? = nil,
        instance_profile_name : String? = nil,
        kms_key_arn : String? = nil,
        network_type : String? = nil,
        publicly_accessible : Bool? = nil,
        subnet_group_identifier : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_groups : Array(String)? = nil
      ) : Types::CreateInstanceProfileResponse
        input = Types::CreateInstanceProfileMessage.new(availability_zone: availability_zone, description: description, instance_profile_name: instance_profile_name, kms_key_arn: kms_key_arn, network_type: network_type, publicly_accessible: publicly_accessible, subnet_group_identifier: subnet_group_identifier, tags: tags, vpc_security_groups: vpc_security_groups)
        create_instance_profile(input)
      end
      def create_instance_profile(input : Types::CreateInstanceProfileMessage) : Types::CreateInstanceProfileResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInstanceProfileResponse, "CreateInstanceProfile")
      end

      # Creates the migration project using the specified parameters. You can run this action only after you
      # create an instance profile and data providers using CreateInstanceProfile and CreateDataProvider .
      def create_migration_project(
        instance_profile_identifier : String,
        source_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition),
        target_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition),
        description : String? = nil,
        migration_project_name : String? = nil,
        schema_conversion_application_attributes : Types::SCApplicationAttributes? = nil,
        tags : Array(Types::Tag)? = nil,
        transformation_rules : String? = nil
      ) : Types::CreateMigrationProjectResponse
        input = Types::CreateMigrationProjectMessage.new(instance_profile_identifier: instance_profile_identifier, source_data_provider_descriptors: source_data_provider_descriptors, target_data_provider_descriptors: target_data_provider_descriptors, description: description, migration_project_name: migration_project_name, schema_conversion_application_attributes: schema_conversion_application_attributes, tags: tags, transformation_rules: transformation_rules)
        create_migration_project(input)
      end
      def create_migration_project(input : Types::CreateMigrationProjectMessage) : Types::CreateMigrationProjectResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MIGRATION_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMigrationProjectResponse, "CreateMigrationProject")
      end

      # Creates a configuration that you can later provide to configure and start an DMS Serverless
      # replication. You can also provide options to validate the configuration inputs before you start the
      # replication.
      def create_replication_config(
        compute_config : Types::ComputeConfig,
        replication_config_identifier : String,
        replication_type : String,
        source_endpoint_arn : String,
        table_mappings : String,
        target_endpoint_arn : String,
        replication_settings : String? = nil,
        resource_identifier : String? = nil,
        supplemental_settings : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateReplicationConfigResponse
        input = Types::CreateReplicationConfigMessage.new(compute_config: compute_config, replication_config_identifier: replication_config_identifier, replication_type: replication_type, source_endpoint_arn: source_endpoint_arn, table_mappings: table_mappings, target_endpoint_arn: target_endpoint_arn, replication_settings: replication_settings, resource_identifier: resource_identifier, supplemental_settings: supplemental_settings, tags: tags)
        create_replication_config(input)
      end
      def create_replication_config(input : Types::CreateReplicationConfigMessage) : Types::CreateReplicationConfigResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPLICATION_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateReplicationConfigResponse, "CreateReplicationConfig")
      end

      # Creates the replication instance using the specified parameters. DMS requires that your account have
      # certain roles with appropriate permissions before you can create a replication instance. For
      # information on the required roles, see Creating the IAM Roles to Use With the CLI and DMS API . For
      # information on the required permissions, see IAM Permissions Needed to Use DMS . If you don't
      # specify a version when creating a replication instance, DMS will create the instance using the
      # default engine version. For information about the default engine version, see Release Notes .
      def create_replication_instance(
        replication_instance_class : String,
        replication_instance_identifier : String,
        allocated_storage : Int32? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        availability_zone : String? = nil,
        dns_name_servers : String? = nil,
        engine_version : String? = nil,
        kerberos_authentication_settings : Types::KerberosAuthenticationSettings? = nil,
        kms_key_id : String? = nil,
        multi_az : Bool? = nil,
        network_type : String? = nil,
        preferred_maintenance_window : String? = nil,
        publicly_accessible : Bool? = nil,
        replication_subnet_group_identifier : String? = nil,
        resource_identifier : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::CreateReplicationInstanceResponse
        input = Types::CreateReplicationInstanceMessage.new(replication_instance_class: replication_instance_class, replication_instance_identifier: replication_instance_identifier, allocated_storage: allocated_storage, auto_minor_version_upgrade: auto_minor_version_upgrade, availability_zone: availability_zone, dns_name_servers: dns_name_servers, engine_version: engine_version, kerberos_authentication_settings: kerberos_authentication_settings, kms_key_id: kms_key_id, multi_az: multi_az, network_type: network_type, preferred_maintenance_window: preferred_maintenance_window, publicly_accessible: publicly_accessible, replication_subnet_group_identifier: replication_subnet_group_identifier, resource_identifier: resource_identifier, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        create_replication_instance(input)
      end
      def create_replication_instance(input : Types::CreateReplicationInstanceMessage) : Types::CreateReplicationInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPLICATION_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateReplicationInstanceResponse, "CreateReplicationInstance")
      end

      # Creates a replication subnet group given a list of the subnet IDs in a VPC. The VPC needs to have at
      # least one subnet in at least two availability zones in the Amazon Web Services Region, otherwise the
      # service will throw a ReplicationSubnetGroupDoesNotCoverEnoughAZs exception. If a replication subnet
      # group exists in your Amazon Web Services account, the CreateReplicationSubnetGroup action returns
      # the following error message: The Replication Subnet Group already exists. In this case, delete the
      # existing replication subnet group. To do so, use the DeleteReplicationSubnetGroup action.
      # Optionally, choose Subnet groups in the DMS console, then choose your subnet group. Next, choose
      # Delete from Actions.
      def create_replication_subnet_group(
        replication_subnet_group_description : String,
        replication_subnet_group_identifier : String,
        subnet_ids : Array(String),
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateReplicationSubnetGroupResponse
        input = Types::CreateReplicationSubnetGroupMessage.new(replication_subnet_group_description: replication_subnet_group_description, replication_subnet_group_identifier: replication_subnet_group_identifier, subnet_ids: subnet_ids, tags: tags)
        create_replication_subnet_group(input)
      end
      def create_replication_subnet_group(input : Types::CreateReplicationSubnetGroupMessage) : Types::CreateReplicationSubnetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPLICATION_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateReplicationSubnetGroupResponse, "CreateReplicationSubnetGroup")
      end

      # Creates a replication task using the specified parameters.
      def create_replication_task(
        migration_type : String,
        replication_instance_arn : String,
        replication_task_identifier : String,
        source_endpoint_arn : String,
        table_mappings : String,
        target_endpoint_arn : String,
        cdc_start_position : String? = nil,
        cdc_start_time : Time? = nil,
        cdc_stop_position : String? = nil,
        replication_task_settings : String? = nil,
        resource_identifier : String? = nil,
        tags : Array(Types::Tag)? = nil,
        task_data : String? = nil
      ) : Types::CreateReplicationTaskResponse
        input = Types::CreateReplicationTaskMessage.new(migration_type: migration_type, replication_instance_arn: replication_instance_arn, replication_task_identifier: replication_task_identifier, source_endpoint_arn: source_endpoint_arn, table_mappings: table_mappings, target_endpoint_arn: target_endpoint_arn, cdc_start_position: cdc_start_position, cdc_start_time: cdc_start_time, cdc_stop_position: cdc_stop_position, replication_task_settings: replication_task_settings, resource_identifier: resource_identifier, tags: tags, task_data: task_data)
        create_replication_task(input)
      end
      def create_replication_task(input : Types::CreateReplicationTaskMessage) : Types::CreateReplicationTaskResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPLICATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateReplicationTaskResponse, "CreateReplicationTask")
      end

      # Deletes the specified certificate.
      def delete_certificate(
        certificate_arn : String
      ) : Types::DeleteCertificateResponse
        input = Types::DeleteCertificateMessage.new(certificate_arn: certificate_arn)
        delete_certificate(input)
      end
      def delete_certificate(input : Types::DeleteCertificateMessage) : Types::DeleteCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCertificateResponse, "DeleteCertificate")
      end

      # Deletes the connection between a replication instance and an endpoint.
      def delete_connection(
        endpoint_arn : String,
        replication_instance_arn : String
      ) : Types::DeleteConnectionResponse
        input = Types::DeleteConnectionMessage.new(endpoint_arn: endpoint_arn, replication_instance_arn: replication_instance_arn)
        delete_connection(input)
      end
      def delete_connection(input : Types::DeleteConnectionMessage) : Types::DeleteConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConnectionResponse, "DeleteConnection")
      end

      # Deletes the specified data migration.
      def delete_data_migration(
        data_migration_identifier : String
      ) : Types::DeleteDataMigrationResponse
        input = Types::DeleteDataMigrationMessage.new(data_migration_identifier: data_migration_identifier)
        delete_data_migration(input)
      end
      def delete_data_migration(input : Types::DeleteDataMigrationMessage) : Types::DeleteDataMigrationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATA_MIGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDataMigrationResponse, "DeleteDataMigration")
      end

      # Deletes the specified data provider. All migration projects associated with the data provider must
      # be deleted or modified before you can delete the data provider.
      def delete_data_provider(
        data_provider_identifier : String
      ) : Types::DeleteDataProviderResponse
        input = Types::DeleteDataProviderMessage.new(data_provider_identifier: data_provider_identifier)
        delete_data_provider(input)
      end
      def delete_data_provider(input : Types::DeleteDataProviderMessage) : Types::DeleteDataProviderResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATA_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDataProviderResponse, "DeleteDataProvider")
      end

      # Deletes the specified endpoint. All tasks associated with the endpoint must be deleted before you
      # can delete the endpoint.
      def delete_endpoint(
        endpoint_arn : String
      ) : Types::DeleteEndpointResponse
        input = Types::DeleteEndpointMessage.new(endpoint_arn: endpoint_arn)
        delete_endpoint(input)
      end
      def delete_endpoint(input : Types::DeleteEndpointMessage) : Types::DeleteEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEndpointResponse, "DeleteEndpoint")
      end

      # Deletes an DMS event subscription.
      def delete_event_subscription(
        subscription_name : String
      ) : Types::DeleteEventSubscriptionResponse
        input = Types::DeleteEventSubscriptionMessage.new(subscription_name: subscription_name)
        delete_event_subscription(input)
      end
      def delete_event_subscription(input : Types::DeleteEventSubscriptionMessage) : Types::DeleteEventSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVENT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEventSubscriptionResponse, "DeleteEventSubscription")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Deletes the specified Fleet
      # Advisor collector.
      def delete_fleet_advisor_collector(
        collector_referenced_id : String
      ) : Nil
        input = Types::DeleteCollectorRequest.new(collector_referenced_id: collector_referenced_id)
        delete_fleet_advisor_collector(input)
      end
      def delete_fleet_advisor_collector(input : Types::DeleteCollectorRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLEET_ADVISOR_COLLECTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Deletes the specified Fleet
      # Advisor collector databases.
      def delete_fleet_advisor_databases(
        database_ids : Array(String)
      ) : Types::DeleteFleetAdvisorDatabasesResponse
        input = Types::DeleteFleetAdvisorDatabasesRequest.new(database_ids: database_ids)
        delete_fleet_advisor_databases(input)
      end
      def delete_fleet_advisor_databases(input : Types::DeleteFleetAdvisorDatabasesRequest) : Types::DeleteFleetAdvisorDatabasesResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLEET_ADVISOR_DATABASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFleetAdvisorDatabasesResponse, "DeleteFleetAdvisorDatabases")
      end

      # Deletes the specified instance profile. All migration projects associated with the instance profile
      # must be deleted or modified before you can delete the instance profile.
      def delete_instance_profile(
        instance_profile_identifier : String
      ) : Types::DeleteInstanceProfileResponse
        input = Types::DeleteInstanceProfileMessage.new(instance_profile_identifier: instance_profile_identifier)
        delete_instance_profile(input)
      end
      def delete_instance_profile(input : Types::DeleteInstanceProfileMessage) : Types::DeleteInstanceProfileResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInstanceProfileResponse, "DeleteInstanceProfile")
      end

      # Deletes the specified migration project. The migration project must be closed before you can delete
      # it.
      def delete_migration_project(
        migration_project_identifier : String
      ) : Types::DeleteMigrationProjectResponse
        input = Types::DeleteMigrationProjectMessage.new(migration_project_identifier: migration_project_identifier)
        delete_migration_project(input)
      end
      def delete_migration_project(input : Types::DeleteMigrationProjectMessage) : Types::DeleteMigrationProjectResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_MIGRATION_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMigrationProjectResponse, "DeleteMigrationProject")
      end

      # Deletes an DMS Serverless replication configuration. This effectively deprovisions any and all
      # replications that use this configuration. You can't delete the configuration for an DMS Serverless
      # replication that is ongoing. You can delete the configuration when the replication is in a
      # non-RUNNING and non-STARTING state.
      def delete_replication_config(
        replication_config_arn : String
      ) : Types::DeleteReplicationConfigResponse
        input = Types::DeleteReplicationConfigMessage.new(replication_config_arn: replication_config_arn)
        delete_replication_config(input)
      end
      def delete_replication_config(input : Types::DeleteReplicationConfigMessage) : Types::DeleteReplicationConfigResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPLICATION_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteReplicationConfigResponse, "DeleteReplicationConfig")
      end

      # Deletes the specified replication instance. You must delete any migration tasks that are associated
      # with the replication instance before you can delete it.
      def delete_replication_instance(
        replication_instance_arn : String
      ) : Types::DeleteReplicationInstanceResponse
        input = Types::DeleteReplicationInstanceMessage.new(replication_instance_arn: replication_instance_arn)
        delete_replication_instance(input)
      end
      def delete_replication_instance(input : Types::DeleteReplicationInstanceMessage) : Types::DeleteReplicationInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPLICATION_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteReplicationInstanceResponse, "DeleteReplicationInstance")
      end

      # Deletes a subnet group.
      def delete_replication_subnet_group(
        replication_subnet_group_identifier : String
      ) : Types::DeleteReplicationSubnetGroupResponse
        input = Types::DeleteReplicationSubnetGroupMessage.new(replication_subnet_group_identifier: replication_subnet_group_identifier)
        delete_replication_subnet_group(input)
      end
      def delete_replication_subnet_group(input : Types::DeleteReplicationSubnetGroupMessage) : Types::DeleteReplicationSubnetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPLICATION_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteReplicationSubnetGroupResponse, "DeleteReplicationSubnetGroup")
      end

      # Deletes the specified replication task.
      def delete_replication_task(
        replication_task_arn : String
      ) : Types::DeleteReplicationTaskResponse
        input = Types::DeleteReplicationTaskMessage.new(replication_task_arn: replication_task_arn)
        delete_replication_task(input)
      end
      def delete_replication_task(input : Types::DeleteReplicationTaskMessage) : Types::DeleteReplicationTaskResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPLICATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteReplicationTaskResponse, "DeleteReplicationTask")
      end

      # Deletes the record of a single premigration assessment run. This operation removes all metadata that
      # DMS maintains about this assessment run. However, the operation leaves untouched all information
      # about this assessment run that is stored in your Amazon S3 bucket.
      def delete_replication_task_assessment_run(
        replication_task_assessment_run_arn : String
      ) : Types::DeleteReplicationTaskAssessmentRunResponse
        input = Types::DeleteReplicationTaskAssessmentRunMessage.new(replication_task_assessment_run_arn: replication_task_assessment_run_arn)
        delete_replication_task_assessment_run(input)
      end
      def delete_replication_task_assessment_run(input : Types::DeleteReplicationTaskAssessmentRunMessage) : Types::DeleteReplicationTaskAssessmentRunResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPLICATION_TASK_ASSESSMENT_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteReplicationTaskAssessmentRunResponse, "DeleteReplicationTaskAssessmentRun")
      end

      # Lists all of the DMS attributes for a customer account. These attributes include DMS quotas for the
      # account and a unique account identifier in a particular DMS region. DMS quotas include a list of
      # resource quotas supported by the account, such as the number of replication instances allowed. The
      # description for each resource quota, includes the quota name, current usage toward that quota, and
      # the quota's maximum value. DMS uses the unique account identifier to name each artifact used by DMS
      # in the given region. This command does not take any parameters.
      def describe_account_attributes : Types::DescribeAccountAttributesResponse
        input = Types::DescribeAccountAttributesMessage.new
        describe_account_attributes(input)
      end
      def describe_account_attributes(input : Types::DescribeAccountAttributesMessage) : Types::DescribeAccountAttributesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountAttributesResponse, "DescribeAccountAttributes")
      end

      # Provides a list of individual assessments that you can specify for a new premigration assessment
      # run, given one or more parameters. If you specify an existing migration task, this operation
      # provides the default individual assessments you can specify for that task. Otherwise, the specified
      # parameters model elements of a possible migration task on which to base a premigration assessment
      # run. To use these migration task modeling parameters, you must specify an existing replication
      # instance, a source database engine, a target database engine, and a migration type. This combination
      # of parameters potentially limits the default individual assessments available for an assessment run
      # created for a corresponding migration task. If you specify no parameters, this operation provides a
      # list of all possible individual assessments that you can specify for an assessment run. If you
      # specify any one of the task modeling parameters, you must specify all of them or the operation
      # cannot provide a list of individual assessments. The only parameter that you can specify alone is
      # for an existing migration task. The specified task definition then determines the default list of
      # individual assessments that you can specify in an assessment run for the task.
      def describe_applicable_individual_assessments(
        marker : String? = nil,
        max_records : Int32? = nil,
        migration_type : String? = nil,
        replication_config_arn : String? = nil,
        replication_instance_arn : String? = nil,
        replication_task_arn : String? = nil,
        source_engine_name : String? = nil,
        target_engine_name : String? = nil
      ) : Types::DescribeApplicableIndividualAssessmentsResponse
        input = Types::DescribeApplicableIndividualAssessmentsMessage.new(marker: marker, max_records: max_records, migration_type: migration_type, replication_config_arn: replication_config_arn, replication_instance_arn: replication_instance_arn, replication_task_arn: replication_task_arn, source_engine_name: source_engine_name, target_engine_name: target_engine_name)
        describe_applicable_individual_assessments(input)
      end
      def describe_applicable_individual_assessments(input : Types::DescribeApplicableIndividualAssessmentsMessage) : Types::DescribeApplicableIndividualAssessmentsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICABLE_INDIVIDUAL_ASSESSMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicableIndividualAssessmentsResponse, "DescribeApplicableIndividualAssessments")
      end

      # Provides a description of the certificate.
      def describe_certificates(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeCertificatesResponse
        input = Types::DescribeCertificatesMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_certificates(input)
      end
      def describe_certificates(input : Types::DescribeCertificatesMessage) : Types::DescribeCertificatesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCertificatesResponse, "DescribeCertificates")
      end

      # Describes the status of the connections that have been made between the replication instance and an
      # endpoint. Connections are created when you test an endpoint.
      def describe_connections(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeConnectionsResponse
        input = Types::DescribeConnectionsMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_connections(input)
      end
      def describe_connections(input : Types::DescribeConnectionsMessage) : Types::DescribeConnectionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConnectionsResponse, "DescribeConnections")
      end

      # Returns configuration parameters for a schema conversion project.
      def describe_conversion_configuration(
        migration_project_identifier : String
      ) : Types::DescribeConversionConfigurationResponse
        input = Types::DescribeConversionConfigurationMessage.new(migration_project_identifier: migration_project_identifier)
        describe_conversion_configuration(input)
      end
      def describe_conversion_configuration(input : Types::DescribeConversionConfigurationMessage) : Types::DescribeConversionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONVERSION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConversionConfigurationResponse, "DescribeConversionConfiguration")
      end

      # Returns information about data migrations.
      def describe_data_migrations(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        without_settings : Bool? = nil,
        without_statistics : Bool? = nil
      ) : Types::DescribeDataMigrationsResponse
        input = Types::DescribeDataMigrationsMessage.new(filters: filters, marker: marker, max_records: max_records, without_settings: without_settings, without_statistics: without_statistics)
        describe_data_migrations(input)
      end
      def describe_data_migrations(input : Types::DescribeDataMigrationsMessage) : Types::DescribeDataMigrationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATA_MIGRATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDataMigrationsResponse, "DescribeDataMigrations")
      end

      # Returns a paginated list of data providers for your account in the current region.
      def describe_data_providers(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeDataProvidersResponse
        input = Types::DescribeDataProvidersMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_data_providers(input)
      end
      def describe_data_providers(input : Types::DescribeDataProvidersMessage) : Types::DescribeDataProvidersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATA_PROVIDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDataProvidersResponse, "DescribeDataProviders")
      end

      # Returns information about the possible endpoint settings available when you create an endpoint for a
      # specific database engine.
      def describe_endpoint_settings(
        engine_name : String,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeEndpointSettingsResponse
        input = Types::DescribeEndpointSettingsMessage.new(engine_name: engine_name, marker: marker, max_records: max_records)
        describe_endpoint_settings(input)
      end
      def describe_endpoint_settings(input : Types::DescribeEndpointSettingsMessage) : Types::DescribeEndpointSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENDPOINT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEndpointSettingsResponse, "DescribeEndpointSettings")
      end

      # Returns information about the type of endpoints available.
      def describe_endpoint_types(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeEndpointTypesResponse
        input = Types::DescribeEndpointTypesMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_endpoint_types(input)
      end
      def describe_endpoint_types(input : Types::DescribeEndpointTypesMessage) : Types::DescribeEndpointTypesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENDPOINT_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEndpointTypesResponse, "DescribeEndpointTypes")
      end

      # Returns information about the endpoints for your account in the current region.
      def describe_endpoints(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeEndpointsResponse
        input = Types::DescribeEndpointsMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_endpoints(input)
      end
      def describe_endpoints(input : Types::DescribeEndpointsMessage) : Types::DescribeEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEndpointsResponse, "DescribeEndpoints")
      end

      # Returns information about the replication instance versions used in the project.
      def describe_engine_versions(
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeEngineVersionsResponse
        input = Types::DescribeEngineVersionsMessage.new(marker: marker, max_records: max_records)
        describe_engine_versions(input)
      end
      def describe_engine_versions(input : Types::DescribeEngineVersionsMessage) : Types::DescribeEngineVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENGINE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEngineVersionsResponse, "DescribeEngineVersions")
      end

      # Lists categories for all event source types, or, if specified, for a specified source type. You can
      # see a list of the event categories and source types in Working with Events and Notifications in the
      # Database Migration Service User Guide.
      def describe_event_categories(
        filters : Array(Types::Filter)? = nil,
        source_type : String? = nil
      ) : Types::DescribeEventCategoriesResponse
        input = Types::DescribeEventCategoriesMessage.new(filters: filters, source_type: source_type)
        describe_event_categories(input)
      end
      def describe_event_categories(input : Types::DescribeEventCategoriesMessage) : Types::DescribeEventCategoriesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_CATEGORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventCategoriesResponse, "DescribeEventCategories")
      end

      # Lists all the event subscriptions for a customer account. The description of a subscription includes
      # SubscriptionName , SNSTopicARN , CustomerID , SourceType , SourceID , CreationTime , and Status . If
      # you specify SubscriptionName , this action lists the description for that subscription.
      def describe_event_subscriptions(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        subscription_name : String? = nil
      ) : Types::DescribeEventSubscriptionsResponse
        input = Types::DescribeEventSubscriptionsMessage.new(filters: filters, marker: marker, max_records: max_records, subscription_name: subscription_name)
        describe_event_subscriptions(input)
      end
      def describe_event_subscriptions(input : Types::DescribeEventSubscriptionsMessage) : Types::DescribeEventSubscriptionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENT_SUBSCRIPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventSubscriptionsResponse, "DescribeEventSubscriptions")
      end

      # Lists events for a given source identifier and source type. You can also specify a start and end
      # time. For more information on DMS events, see Working with Events and Notifications in the Database
      # Migration Service User Guide.
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
      ) : Types::DescribeEventsResponse
        input = Types::DescribeEventsMessage.new(duration: duration, end_time: end_time, event_categories: event_categories, filters: filters, marker: marker, max_records: max_records, source_identifier: source_identifier, source_type: source_type, start_time: start_time)
        describe_events(input)
      end
      def describe_events(input : Types::DescribeEventsMessage) : Types::DescribeEventsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventsResponse, "DescribeEvents")
      end

      # Returns a paginated list of extension pack associations for the specified migration project. An
      # extension pack is an add-on module that emulates functions present in a source database that are
      # required when converting objects to the target database.
      def describe_extension_pack_associations(
        migration_project_identifier : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeExtensionPackAssociationsResponse
        input = Types::DescribeExtensionPackAssociationsMessage.new(migration_project_identifier: migration_project_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_extension_pack_associations(input)
      end
      def describe_extension_pack_associations(input : Types::DescribeExtensionPackAssociationsMessage) : Types::DescribeExtensionPackAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXTENSION_PACK_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExtensionPackAssociationsResponse, "DescribeExtensionPackAssociations")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Returns a list of the Fleet
      # Advisor collectors in your account.
      def describe_fleet_advisor_collectors(
        filters : Array(Types::Filter)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetAdvisorCollectorsResponse
        input = Types::DescribeFleetAdvisorCollectorsRequest.new(filters: filters, max_records: max_records, next_token: next_token)
        describe_fleet_advisor_collectors(input)
      end
      def describe_fleet_advisor_collectors(input : Types::DescribeFleetAdvisorCollectorsRequest) : Types::DescribeFleetAdvisorCollectorsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_ADVISOR_COLLECTORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetAdvisorCollectorsResponse, "DescribeFleetAdvisorCollectors")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Returns a list of Fleet
      # Advisor databases in your account.
      def describe_fleet_advisor_databases(
        filters : Array(Types::Filter)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetAdvisorDatabasesResponse
        input = Types::DescribeFleetAdvisorDatabasesRequest.new(filters: filters, max_records: max_records, next_token: next_token)
        describe_fleet_advisor_databases(input)
      end
      def describe_fleet_advisor_databases(input : Types::DescribeFleetAdvisorDatabasesRequest) : Types::DescribeFleetAdvisorDatabasesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_ADVISOR_DATABASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetAdvisorDatabasesResponse, "DescribeFleetAdvisorDatabases")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Provides descriptions of
      # large-scale assessment (LSA) analyses produced by your Fleet Advisor collectors.
      def describe_fleet_advisor_lsa_analysis(
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetAdvisorLsaAnalysisResponse
        input = Types::DescribeFleetAdvisorLsaAnalysisRequest.new(max_records: max_records, next_token: next_token)
        describe_fleet_advisor_lsa_analysis(input)
      end
      def describe_fleet_advisor_lsa_analysis(input : Types::DescribeFleetAdvisorLsaAnalysisRequest) : Types::DescribeFleetAdvisorLsaAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_ADVISOR_LSA_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetAdvisorLsaAnalysisResponse, "DescribeFleetAdvisorLsaAnalysis")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Provides descriptions of the
      # schemas discovered by your Fleet Advisor collectors.
      def describe_fleet_advisor_schema_object_summary(
        filters : Array(Types::Filter)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetAdvisorSchemaObjectSummaryResponse
        input = Types::DescribeFleetAdvisorSchemaObjectSummaryRequest.new(filters: filters, max_records: max_records, next_token: next_token)
        describe_fleet_advisor_schema_object_summary(input)
      end
      def describe_fleet_advisor_schema_object_summary(input : Types::DescribeFleetAdvisorSchemaObjectSummaryRequest) : Types::DescribeFleetAdvisorSchemaObjectSummaryResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_ADVISOR_SCHEMA_OBJECT_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetAdvisorSchemaObjectSummaryResponse, "DescribeFleetAdvisorSchemaObjectSummary")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Returns a list of schemas
      # detected by Fleet Advisor Collectors in your account.
      def describe_fleet_advisor_schemas(
        filters : Array(Types::Filter)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeFleetAdvisorSchemasResponse
        input = Types::DescribeFleetAdvisorSchemasRequest.new(filters: filters, max_records: max_records, next_token: next_token)
        describe_fleet_advisor_schemas(input)
      end
      def describe_fleet_advisor_schemas(input : Types::DescribeFleetAdvisorSchemasRequest) : Types::DescribeFleetAdvisorSchemasResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLEET_ADVISOR_SCHEMAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFleetAdvisorSchemasResponse, "DescribeFleetAdvisorSchemas")
      end

      # Returns a paginated list of instance profiles for your account in the current region.
      def describe_instance_profiles(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeInstanceProfilesResponse
        input = Types::DescribeInstanceProfilesMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_instance_profiles(input)
      end
      def describe_instance_profiles(input : Types::DescribeInstanceProfilesMessage) : Types::DescribeInstanceProfilesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCE_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstanceProfilesResponse, "DescribeInstanceProfiles")
      end

      # Gets detailed information about the specified metadata model, including its definition and
      # corresponding converted objects in the target database if applicable.
      def describe_metadata_model(
        migration_project_identifier : String,
        origin : String,
        selection_rules : String
      ) : Types::DescribeMetadataModelResponse
        input = Types::DescribeMetadataModelMessage.new(migration_project_identifier: migration_project_identifier, origin: origin, selection_rules: selection_rules)
        describe_metadata_model(input)
      end
      def describe_metadata_model(input : Types::DescribeMetadataModelMessage) : Types::DescribeMetadataModelResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_METADATA_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMetadataModelResponse, "DescribeMetadataModel")
      end

      # Returns a paginated list of metadata model assessments for your account in the current region.
      def describe_metadata_model_assessments(
        migration_project_identifier : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeMetadataModelAssessmentsResponse
        input = Types::DescribeMetadataModelAssessmentsMessage.new(migration_project_identifier: migration_project_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_metadata_model_assessments(input)
      end
      def describe_metadata_model_assessments(input : Types::DescribeMetadataModelAssessmentsMessage) : Types::DescribeMetadataModelAssessmentsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_METADATA_MODEL_ASSESSMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMetadataModelAssessmentsResponse, "DescribeMetadataModelAssessments")
      end

      # Gets a list of child metadata models for the specified metadata model in the database hierarchy.
      def describe_metadata_model_children(
        migration_project_identifier : String,
        origin : String,
        selection_rules : String,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeMetadataModelChildrenResponse
        input = Types::DescribeMetadataModelChildrenMessage.new(migration_project_identifier: migration_project_identifier, origin: origin, selection_rules: selection_rules, marker: marker, max_records: max_records)
        describe_metadata_model_children(input)
      end
      def describe_metadata_model_children(input : Types::DescribeMetadataModelChildrenMessage) : Types::DescribeMetadataModelChildrenResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_METADATA_MODEL_CHILDREN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMetadataModelChildrenResponse, "DescribeMetadataModelChildren")
      end

      # Returns a paginated list of metadata model conversions for a migration project.
      def describe_metadata_model_conversions(
        migration_project_identifier : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeMetadataModelConversionsResponse
        input = Types::DescribeMetadataModelConversionsMessage.new(migration_project_identifier: migration_project_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_metadata_model_conversions(input)
      end
      def describe_metadata_model_conversions(input : Types::DescribeMetadataModelConversionsMessage) : Types::DescribeMetadataModelConversionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_METADATA_MODEL_CONVERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMetadataModelConversionsResponse, "DescribeMetadataModelConversions")
      end

      # Returns a paginated list of metadata model creation requests for a migration project.
      def describe_metadata_model_creations(
        migration_project_identifier : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeMetadataModelCreationsResponse
        input = Types::DescribeMetadataModelCreationsMessage.new(migration_project_identifier: migration_project_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_metadata_model_creations(input)
      end
      def describe_metadata_model_creations(input : Types::DescribeMetadataModelCreationsMessage) : Types::DescribeMetadataModelCreationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_METADATA_MODEL_CREATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMetadataModelCreationsResponse, "DescribeMetadataModelCreations")
      end

      # Returns a paginated list of metadata model exports.
      def describe_metadata_model_exports_as_script(
        migration_project_identifier : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeMetadataModelExportsAsScriptResponse
        input = Types::DescribeMetadataModelExportsAsScriptMessage.new(migration_project_identifier: migration_project_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_metadata_model_exports_as_script(input)
      end
      def describe_metadata_model_exports_as_script(input : Types::DescribeMetadataModelExportsAsScriptMessage) : Types::DescribeMetadataModelExportsAsScriptResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_METADATA_MODEL_EXPORTS_AS_SCRIPT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMetadataModelExportsAsScriptResponse, "DescribeMetadataModelExportsAsScript")
      end

      # Returns a paginated list of metadata model exports.
      def describe_metadata_model_exports_to_target(
        migration_project_identifier : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeMetadataModelExportsToTargetResponse
        input = Types::DescribeMetadataModelExportsToTargetMessage.new(migration_project_identifier: migration_project_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_metadata_model_exports_to_target(input)
      end
      def describe_metadata_model_exports_to_target(input : Types::DescribeMetadataModelExportsToTargetMessage) : Types::DescribeMetadataModelExportsToTargetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_METADATA_MODEL_EXPORTS_TO_TARGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMetadataModelExportsToTargetResponse, "DescribeMetadataModelExportsToTarget")
      end

      # Returns a paginated list of metadata model imports.
      def describe_metadata_model_imports(
        migration_project_identifier : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeMetadataModelImportsResponse
        input = Types::DescribeMetadataModelImportsMessage.new(migration_project_identifier: migration_project_identifier, filters: filters, marker: marker, max_records: max_records)
        describe_metadata_model_imports(input)
      end
      def describe_metadata_model_imports(input : Types::DescribeMetadataModelImportsMessage) : Types::DescribeMetadataModelImportsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_METADATA_MODEL_IMPORTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMetadataModelImportsResponse, "DescribeMetadataModelImports")
      end

      # Returns a paginated list of migration projects for your account in the current region.
      def describe_migration_projects(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeMigrationProjectsResponse
        input = Types::DescribeMigrationProjectsMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_migration_projects(input)
      end
      def describe_migration_projects(input : Types::DescribeMigrationProjectsMessage) : Types::DescribeMigrationProjectsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MIGRATION_PROJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMigrationProjectsResponse, "DescribeMigrationProjects")
      end

      # Returns information about the replication instance types that can be created in the specified
      # region.
      def describe_orderable_replication_instances(
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeOrderableReplicationInstancesResponse
        input = Types::DescribeOrderableReplicationInstancesMessage.new(marker: marker, max_records: max_records)
        describe_orderable_replication_instances(input)
      end
      def describe_orderable_replication_instances(input : Types::DescribeOrderableReplicationInstancesMessage) : Types::DescribeOrderableReplicationInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ORDERABLE_REPLICATION_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOrderableReplicationInstancesResponse, "DescribeOrderableReplicationInstances")
      end

      # Returns a list of upcoming maintenance events for replication instances in your account in the
      # current Region.
      def describe_pending_maintenance_actions(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        replication_instance_arn : String? = nil
      ) : Types::DescribePendingMaintenanceActionsResponse
        input = Types::DescribePendingMaintenanceActionsMessage.new(filters: filters, marker: marker, max_records: max_records, replication_instance_arn: replication_instance_arn)
        describe_pending_maintenance_actions(input)
      end
      def describe_pending_maintenance_actions(input : Types::DescribePendingMaintenanceActionsMessage) : Types::DescribePendingMaintenanceActionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PENDING_MAINTENANCE_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePendingMaintenanceActionsResponse, "DescribePendingMaintenanceActions")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Returns a paginated list of
      # limitations for recommendations of target Amazon Web Services engines.
      def describe_recommendation_limitations(
        filters : Array(Types::Filter)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeRecommendationLimitationsResponse
        input = Types::DescribeRecommendationLimitationsRequest.new(filters: filters, max_records: max_records, next_token: next_token)
        describe_recommendation_limitations(input)
      end
      def describe_recommendation_limitations(input : Types::DescribeRecommendationLimitationsRequest) : Types::DescribeRecommendationLimitationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RECOMMENDATION_LIMITATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRecommendationLimitationsResponse, "DescribeRecommendationLimitations")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Returns a paginated list of
      # target engine recommendations for your source databases.
      def describe_recommendations(
        filters : Array(Types::Filter)? = nil,
        max_records : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeRecommendationsResponse
        input = Types::DescribeRecommendationsRequest.new(filters: filters, max_records: max_records, next_token: next_token)
        describe_recommendations(input)
      end
      def describe_recommendations(input : Types::DescribeRecommendationsRequest) : Types::DescribeRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRecommendationsResponse, "DescribeRecommendations")
      end

      # Returns the status of the RefreshSchemas operation.
      def describe_refresh_schemas_status(
        endpoint_arn : String
      ) : Types::DescribeRefreshSchemasStatusResponse
        input = Types::DescribeRefreshSchemasStatusMessage.new(endpoint_arn: endpoint_arn)
        describe_refresh_schemas_status(input)
      end
      def describe_refresh_schemas_status(input : Types::DescribeRefreshSchemasStatusMessage) : Types::DescribeRefreshSchemasStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REFRESH_SCHEMAS_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRefreshSchemasStatusResponse, "DescribeRefreshSchemasStatus")
      end

      # Returns one or more existing DMS Serverless replication configurations as a list of structures.
      def describe_replication_configs(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeReplicationConfigsResponse
        input = Types::DescribeReplicationConfigsMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_replication_configs(input)
      end
      def describe_replication_configs(input : Types::DescribeReplicationConfigsMessage) : Types::DescribeReplicationConfigsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATION_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationConfigsResponse, "DescribeReplicationConfigs")
      end

      # Returns information about the task logs for the specified task.
      def describe_replication_instance_task_logs(
        replication_instance_arn : String,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeReplicationInstanceTaskLogsResponse
        input = Types::DescribeReplicationInstanceTaskLogsMessage.new(replication_instance_arn: replication_instance_arn, marker: marker, max_records: max_records)
        describe_replication_instance_task_logs(input)
      end
      def describe_replication_instance_task_logs(input : Types::DescribeReplicationInstanceTaskLogsMessage) : Types::DescribeReplicationInstanceTaskLogsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATION_INSTANCE_TASK_LOGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationInstanceTaskLogsResponse, "DescribeReplicationInstanceTaskLogs")
      end

      # Returns information about replication instances for your account in the current region.
      def describe_replication_instances(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeReplicationInstancesResponse
        input = Types::DescribeReplicationInstancesMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_replication_instances(input)
      end
      def describe_replication_instances(input : Types::DescribeReplicationInstancesMessage) : Types::DescribeReplicationInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATION_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationInstancesResponse, "DescribeReplicationInstances")
      end

      # Returns information about the replication subnet groups.
      def describe_replication_subnet_groups(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeReplicationSubnetGroupsResponse
        input = Types::DescribeReplicationSubnetGroupsMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_replication_subnet_groups(input)
      end
      def describe_replication_subnet_groups(input : Types::DescribeReplicationSubnetGroupsMessage) : Types::DescribeReplicationSubnetGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATION_SUBNET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationSubnetGroupsResponse, "DescribeReplicationSubnetGroups")
      end

      # Returns table and schema statistics for one or more provisioned replications that use a given DMS
      # Serverless replication configuration.
      def describe_replication_table_statistics(
        replication_config_arn : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeReplicationTableStatisticsResponse
        input = Types::DescribeReplicationTableStatisticsMessage.new(replication_config_arn: replication_config_arn, filters: filters, marker: marker, max_records: max_records)
        describe_replication_table_statistics(input)
      end
      def describe_replication_table_statistics(input : Types::DescribeReplicationTableStatisticsMessage) : Types::DescribeReplicationTableStatisticsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATION_TABLE_STATISTICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationTableStatisticsResponse, "DescribeReplicationTableStatistics")
      end

      # Returns the task assessment results from the Amazon S3 bucket that DMS creates in your Amazon Web
      # Services account. This action always returns the latest results. For more information about DMS task
      # assessments, see Creating a task assessment report in the Database Migration Service User Guide .
      def describe_replication_task_assessment_results(
        marker : String? = nil,
        max_records : Int32? = nil,
        replication_task_arn : String? = nil
      ) : Types::DescribeReplicationTaskAssessmentResultsResponse
        input = Types::DescribeReplicationTaskAssessmentResultsMessage.new(marker: marker, max_records: max_records, replication_task_arn: replication_task_arn)
        describe_replication_task_assessment_results(input)
      end
      def describe_replication_task_assessment_results(input : Types::DescribeReplicationTaskAssessmentResultsMessage) : Types::DescribeReplicationTaskAssessmentResultsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATION_TASK_ASSESSMENT_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationTaskAssessmentResultsResponse, "DescribeReplicationTaskAssessmentResults")
      end

      # Returns a paginated list of premigration assessment runs based on filter settings. These filter
      # settings can specify a combination of premigration assessment runs, migration tasks, replication
      # instances, and assessment run status values. This operation doesn't return information about
      # individual assessments. For this information, see the DescribeReplicationTaskIndividualAssessments
      # operation.
      def describe_replication_task_assessment_runs(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeReplicationTaskAssessmentRunsResponse
        input = Types::DescribeReplicationTaskAssessmentRunsMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_replication_task_assessment_runs(input)
      end
      def describe_replication_task_assessment_runs(input : Types::DescribeReplicationTaskAssessmentRunsMessage) : Types::DescribeReplicationTaskAssessmentRunsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATION_TASK_ASSESSMENT_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationTaskAssessmentRunsResponse, "DescribeReplicationTaskAssessmentRuns")
      end

      # Returns a paginated list of individual assessments based on filter settings. These filter settings
      # can specify a combination of premigration assessment runs, migration tasks, and assessment status
      # values.
      def describe_replication_task_individual_assessments(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeReplicationTaskIndividualAssessmentsResponse
        input = Types::DescribeReplicationTaskIndividualAssessmentsMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_replication_task_individual_assessments(input)
      end
      def describe_replication_task_individual_assessments(input : Types::DescribeReplicationTaskIndividualAssessmentsMessage) : Types::DescribeReplicationTaskIndividualAssessmentsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATION_TASK_INDIVIDUAL_ASSESSMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationTaskIndividualAssessmentsResponse, "DescribeReplicationTaskIndividualAssessments")
      end

      # Returns information about replication tasks for your account in the current region.
      def describe_replication_tasks(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        without_settings : Bool? = nil
      ) : Types::DescribeReplicationTasksResponse
        input = Types::DescribeReplicationTasksMessage.new(filters: filters, marker: marker, max_records: max_records, without_settings: without_settings)
        describe_replication_tasks(input)
      end
      def describe_replication_tasks(input : Types::DescribeReplicationTasksMessage) : Types::DescribeReplicationTasksResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATION_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationTasksResponse, "DescribeReplicationTasks")
      end

      # Provides details on replication progress by returning status information for one or more provisioned
      # DMS Serverless replications.
      def describe_replications(
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeReplicationsResponse
        input = Types::DescribeReplicationsMessage.new(filters: filters, marker: marker, max_records: max_records)
        describe_replications(input)
      end
      def describe_replications(input : Types::DescribeReplicationsMessage) : Types::DescribeReplicationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReplicationsResponse, "DescribeReplications")
      end

      # Returns information about the schema for the specified endpoint.
      def describe_schemas(
        endpoint_arn : String,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeSchemasResponse
        input = Types::DescribeSchemasMessage.new(endpoint_arn: endpoint_arn, marker: marker, max_records: max_records)
        describe_schemas(input)
      end
      def describe_schemas(input : Types::DescribeSchemasMessage) : Types::DescribeSchemasResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCHEMAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSchemasResponse, "DescribeSchemas")
      end

      # Returns table statistics on the database migration task, including table name, rows inserted, rows
      # updated, and rows deleted. Note that the "last updated" column the DMS console only indicates the
      # time that DMS last updated the table statistics record for a table. It does not indicate the time of
      # the last update to the table.
      def describe_table_statistics(
        replication_task_arn : String,
        filters : Array(Types::Filter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeTableStatisticsResponse
        input = Types::DescribeTableStatisticsMessage.new(replication_task_arn: replication_task_arn, filters: filters, marker: marker, max_records: max_records)
        describe_table_statistics(input)
      end
      def describe_table_statistics(input : Types::DescribeTableStatisticsMessage) : Types::DescribeTableStatisticsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TABLE_STATISTICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTableStatisticsResponse, "DescribeTableStatistics")
      end

      # Saves a copy of a database migration assessment report to your Amazon S3 bucket. DMS can save your
      # assessment report as a comma-separated value (CSV) or a PDF file.
      def export_metadata_model_assessment(
        migration_project_identifier : String,
        selection_rules : String,
        assessment_report_types : Array(String)? = nil,
        file_name : String? = nil
      ) : Types::ExportMetadataModelAssessmentResponse
        input = Types::ExportMetadataModelAssessmentMessage.new(migration_project_identifier: migration_project_identifier, selection_rules: selection_rules, assessment_report_types: assessment_report_types, file_name: file_name)
        export_metadata_model_assessment(input)
      end
      def export_metadata_model_assessment(input : Types::ExportMetadataModelAssessmentMessage) : Types::ExportMetadataModelAssessmentResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_METADATA_MODEL_ASSESSMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportMetadataModelAssessmentResponse, "ExportMetadataModelAssessment")
      end

      # Converts source selection rules into their target counterparts for schema conversion operations.
      def get_target_selection_rules(
        migration_project_identifier : String,
        selection_rules : String
      ) : Types::GetTargetSelectionRulesResponse
        input = Types::GetTargetSelectionRulesMessage.new(migration_project_identifier: migration_project_identifier, selection_rules: selection_rules)
        get_target_selection_rules(input)
      end
      def get_target_selection_rules(input : Types::GetTargetSelectionRulesMessage) : Types::GetTargetSelectionRulesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TARGET_SELECTION_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTargetSelectionRulesResponse, "GetTargetSelectionRules")
      end

      # Uploads the specified certificate.
      def import_certificate(
        certificate_identifier : String,
        certificate_pem : String? = nil,
        certificate_wallet : Bytes? = nil,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportCertificateResponse
        input = Types::ImportCertificateMessage.new(certificate_identifier: certificate_identifier, certificate_pem: certificate_pem, certificate_wallet: certificate_wallet, kms_key_id: kms_key_id, tags: tags)
        import_certificate(input)
      end
      def import_certificate(input : Types::ImportCertificateMessage) : Types::ImportCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportCertificateResponse, "ImportCertificate")
      end

      # Lists all metadata tags attached to an DMS resource, including replication instance, endpoint,
      # subnet group, and migration task. For more information, see Tag data type description.
      def list_tags_for_resource(
        resource_arn : String? = nil,
        resource_arn_list : Array(String)? = nil
      ) : Types::ListTagsForResourceResponse
        input = Types::ListTagsForResourceMessage.new(resource_arn: resource_arn, resource_arn_list: resource_arn_list)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceMessage) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Modifies the specified schema conversion configuration using the provided parameters.
      def modify_conversion_configuration(
        conversion_configuration : String,
        migration_project_identifier : String
      ) : Types::ModifyConversionConfigurationResponse
        input = Types::ModifyConversionConfigurationMessage.new(conversion_configuration: conversion_configuration, migration_project_identifier: migration_project_identifier)
        modify_conversion_configuration(input)
      end
      def modify_conversion_configuration(input : Types::ModifyConversionConfigurationMessage) : Types::ModifyConversionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_CONVERSION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyConversionConfigurationResponse, "ModifyConversionConfiguration")
      end

      # Modifies an existing DMS data migration.
      def modify_data_migration(
        data_migration_identifier : String,
        data_migration_name : String? = nil,
        data_migration_type : String? = nil,
        enable_cloudwatch_logs : Bool? = nil,
        number_of_jobs : Int32? = nil,
        selection_rules : String? = nil,
        service_access_role_arn : String? = nil,
        source_data_settings : Array(Types::SourceDataSetting)? = nil,
        target_data_settings : Array(Types::TargetDataSetting)? = nil
      ) : Types::ModifyDataMigrationResponse
        input = Types::ModifyDataMigrationMessage.new(data_migration_identifier: data_migration_identifier, data_migration_name: data_migration_name, data_migration_type: data_migration_type, enable_cloudwatch_logs: enable_cloudwatch_logs, number_of_jobs: number_of_jobs, selection_rules: selection_rules, service_access_role_arn: service_access_role_arn, source_data_settings: source_data_settings, target_data_settings: target_data_settings)
        modify_data_migration(input)
      end
      def modify_data_migration(input : Types::ModifyDataMigrationMessage) : Types::ModifyDataMigrationResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_DATA_MIGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyDataMigrationResponse, "ModifyDataMigration")
      end

      # Modifies the specified data provider using the provided settings. You must remove the data provider
      # from all migration projects before you can modify it.
      def modify_data_provider(
        data_provider_identifier : String,
        data_provider_name : String? = nil,
        description : String? = nil,
        engine : String? = nil,
        exact_settings : Bool? = nil,
        settings : Types::DataProviderSettings? = nil,
        virtual : Bool? = nil
      ) : Types::ModifyDataProviderResponse
        input = Types::ModifyDataProviderMessage.new(data_provider_identifier: data_provider_identifier, data_provider_name: data_provider_name, description: description, engine: engine, exact_settings: exact_settings, settings: settings, virtual: virtual)
        modify_data_provider(input)
      end
      def modify_data_provider(input : Types::ModifyDataProviderMessage) : Types::ModifyDataProviderResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_DATA_PROVIDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyDataProviderResponse, "ModifyDataProvider")
      end

      # Modifies the specified endpoint. For a MySQL source or target endpoint, don't explicitly specify the
      # database using the DatabaseName request parameter on the ModifyEndpoint API call. Specifying
      # DatabaseName when you modify a MySQL endpoint replicates all the task tables to this single
      # database. For MySQL endpoints, you specify the database only when you specify the schema in the
      # table-mapping rules of the DMS task.
      def modify_endpoint(
        endpoint_arn : String,
        certificate_arn : String? = nil,
        database_name : String? = nil,
        dms_transfer_settings : Types::DmsTransferSettings? = nil,
        doc_db_settings : Types::DocDbSettings? = nil,
        dynamo_db_settings : Types::DynamoDbSettings? = nil,
        elasticsearch_settings : Types::ElasticsearchSettings? = nil,
        endpoint_identifier : String? = nil,
        endpoint_type : String? = nil,
        engine_name : String? = nil,
        exact_settings : Bool? = nil,
        external_table_definition : String? = nil,
        extra_connection_attributes : String? = nil,
        gcp_my_sql_settings : Types::GcpMySQLSettings? = nil,
        ibm_db2_settings : Types::IBMDb2Settings? = nil,
        kafka_settings : Types::KafkaSettings? = nil,
        kinesis_settings : Types::KinesisSettings? = nil,
        microsoft_sql_server_settings : Types::MicrosoftSQLServerSettings? = nil,
        mongo_db_settings : Types::MongoDbSettings? = nil,
        my_sql_settings : Types::MySQLSettings? = nil,
        neptune_settings : Types::NeptuneSettings? = nil,
        oracle_settings : Types::OracleSettings? = nil,
        password : String? = nil,
        port : Int32? = nil,
        postgre_sql_settings : Types::PostgreSQLSettings? = nil,
        redis_settings : Types::RedisSettings? = nil,
        redshift_settings : Types::RedshiftSettings? = nil,
        s3_settings : Types::S3Settings? = nil,
        server_name : String? = nil,
        service_access_role_arn : String? = nil,
        ssl_mode : String? = nil,
        sybase_settings : Types::SybaseSettings? = nil,
        timestream_settings : Types::TimestreamSettings? = nil,
        username : String? = nil
      ) : Types::ModifyEndpointResponse
        input = Types::ModifyEndpointMessage.new(endpoint_arn: endpoint_arn, certificate_arn: certificate_arn, database_name: database_name, dms_transfer_settings: dms_transfer_settings, doc_db_settings: doc_db_settings, dynamo_db_settings: dynamo_db_settings, elasticsearch_settings: elasticsearch_settings, endpoint_identifier: endpoint_identifier, endpoint_type: endpoint_type, engine_name: engine_name, exact_settings: exact_settings, external_table_definition: external_table_definition, extra_connection_attributes: extra_connection_attributes, gcp_my_sql_settings: gcp_my_sql_settings, ibm_db2_settings: ibm_db2_settings, kafka_settings: kafka_settings, kinesis_settings: kinesis_settings, microsoft_sql_server_settings: microsoft_sql_server_settings, mongo_db_settings: mongo_db_settings, my_sql_settings: my_sql_settings, neptune_settings: neptune_settings, oracle_settings: oracle_settings, password: password, port: port, postgre_sql_settings: postgre_sql_settings, redis_settings: redis_settings, redshift_settings: redshift_settings, s3_settings: s3_settings, server_name: server_name, service_access_role_arn: service_access_role_arn, ssl_mode: ssl_mode, sybase_settings: sybase_settings, timestream_settings: timestream_settings, username: username)
        modify_endpoint(input)
      end
      def modify_endpoint(input : Types::ModifyEndpointMessage) : Types::ModifyEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyEndpointResponse, "ModifyEndpoint")
      end

      # Modifies an existing DMS event notification subscription.
      def modify_event_subscription(
        subscription_name : String,
        enabled : Bool? = nil,
        event_categories : Array(String)? = nil,
        sns_topic_arn : String? = nil,
        source_type : String? = nil
      ) : Types::ModifyEventSubscriptionResponse
        input = Types::ModifyEventSubscriptionMessage.new(subscription_name: subscription_name, enabled: enabled, event_categories: event_categories, sns_topic_arn: sns_topic_arn, source_type: source_type)
        modify_event_subscription(input)
      end
      def modify_event_subscription(input : Types::ModifyEventSubscriptionMessage) : Types::ModifyEventSubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_EVENT_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyEventSubscriptionResponse, "ModifyEventSubscription")
      end

      # Modifies the specified instance profile using the provided parameters. All migration projects
      # associated with the instance profile must be deleted or modified before you can modify the instance
      # profile.
      def modify_instance_profile(
        instance_profile_identifier : String,
        availability_zone : String? = nil,
        description : String? = nil,
        instance_profile_name : String? = nil,
        kms_key_arn : String? = nil,
        network_type : String? = nil,
        publicly_accessible : Bool? = nil,
        subnet_group_identifier : String? = nil,
        vpc_security_groups : Array(String)? = nil
      ) : Types::ModifyInstanceProfileResponse
        input = Types::ModifyInstanceProfileMessage.new(instance_profile_identifier: instance_profile_identifier, availability_zone: availability_zone, description: description, instance_profile_name: instance_profile_name, kms_key_arn: kms_key_arn, network_type: network_type, publicly_accessible: publicly_accessible, subnet_group_identifier: subnet_group_identifier, vpc_security_groups: vpc_security_groups)
        modify_instance_profile(input)
      end
      def modify_instance_profile(input : Types::ModifyInstanceProfileMessage) : Types::ModifyInstanceProfileResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_INSTANCE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyInstanceProfileResponse, "ModifyInstanceProfile")
      end

      # Modifies the specified migration project using the provided parameters. The migration project must
      # be closed before you can modify it.
      def modify_migration_project(
        migration_project_identifier : String,
        description : String? = nil,
        instance_profile_identifier : String? = nil,
        migration_project_name : String? = nil,
        schema_conversion_application_attributes : Types::SCApplicationAttributes? = nil,
        source_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition)? = nil,
        target_data_provider_descriptors : Array(Types::DataProviderDescriptorDefinition)? = nil,
        transformation_rules : String? = nil
      ) : Types::ModifyMigrationProjectResponse
        input = Types::ModifyMigrationProjectMessage.new(migration_project_identifier: migration_project_identifier, description: description, instance_profile_identifier: instance_profile_identifier, migration_project_name: migration_project_name, schema_conversion_application_attributes: schema_conversion_application_attributes, source_data_provider_descriptors: source_data_provider_descriptors, target_data_provider_descriptors: target_data_provider_descriptors, transformation_rules: transformation_rules)
        modify_migration_project(input)
      end
      def modify_migration_project(input : Types::ModifyMigrationProjectMessage) : Types::ModifyMigrationProjectResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_MIGRATION_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyMigrationProjectResponse, "ModifyMigrationProject")
      end

      # Modifies an existing DMS Serverless replication configuration that you can use to start a
      # replication. This command includes input validation and logic to check the state of any replication
      # that uses this configuration. You can only modify a replication configuration before any replication
      # that uses it has started. As soon as you have initially started a replication with a given
      # configuiration, you can't modify that configuration, even if you stop it. Other run statuses that
      # allow you to run this command include FAILED and CREATED. A provisioning state that allows you to
      # run this command is FAILED_PROVISION.
      def modify_replication_config(
        replication_config_arn : String,
        compute_config : Types::ComputeConfig? = nil,
        replication_config_identifier : String? = nil,
        replication_settings : String? = nil,
        replication_type : String? = nil,
        source_endpoint_arn : String? = nil,
        supplemental_settings : String? = nil,
        table_mappings : String? = nil,
        target_endpoint_arn : String? = nil
      ) : Types::ModifyReplicationConfigResponse
        input = Types::ModifyReplicationConfigMessage.new(replication_config_arn: replication_config_arn, compute_config: compute_config, replication_config_identifier: replication_config_identifier, replication_settings: replication_settings, replication_type: replication_type, source_endpoint_arn: source_endpoint_arn, supplemental_settings: supplemental_settings, table_mappings: table_mappings, target_endpoint_arn: target_endpoint_arn)
        modify_replication_config(input)
      end
      def modify_replication_config(input : Types::ModifyReplicationConfigMessage) : Types::ModifyReplicationConfigResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_REPLICATION_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyReplicationConfigResponse, "ModifyReplicationConfig")
      end

      # Modifies the replication instance to apply new settings. You can change one or more parameters by
      # specifying these parameters and the new values in the request. Some settings are applied during the
      # maintenance window.
      def modify_replication_instance(
        replication_instance_arn : String,
        allocated_storage : Int32? = nil,
        allow_major_version_upgrade : Bool? = nil,
        apply_immediately : Bool? = nil,
        auto_minor_version_upgrade : Bool? = nil,
        engine_version : String? = nil,
        kerberos_authentication_settings : Types::KerberosAuthenticationSettings? = nil,
        multi_az : Bool? = nil,
        network_type : String? = nil,
        preferred_maintenance_window : String? = nil,
        replication_instance_class : String? = nil,
        replication_instance_identifier : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Types::ModifyReplicationInstanceResponse
        input = Types::ModifyReplicationInstanceMessage.new(replication_instance_arn: replication_instance_arn, allocated_storage: allocated_storage, allow_major_version_upgrade: allow_major_version_upgrade, apply_immediately: apply_immediately, auto_minor_version_upgrade: auto_minor_version_upgrade, engine_version: engine_version, kerberos_authentication_settings: kerberos_authentication_settings, multi_az: multi_az, network_type: network_type, preferred_maintenance_window: preferred_maintenance_window, replication_instance_class: replication_instance_class, replication_instance_identifier: replication_instance_identifier, vpc_security_group_ids: vpc_security_group_ids)
        modify_replication_instance(input)
      end
      def modify_replication_instance(input : Types::ModifyReplicationInstanceMessage) : Types::ModifyReplicationInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_REPLICATION_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyReplicationInstanceResponse, "ModifyReplicationInstance")
      end

      # Modifies the settings for the specified replication subnet group.
      def modify_replication_subnet_group(
        replication_subnet_group_identifier : String,
        subnet_ids : Array(String),
        replication_subnet_group_description : String? = nil
      ) : Types::ModifyReplicationSubnetGroupResponse
        input = Types::ModifyReplicationSubnetGroupMessage.new(replication_subnet_group_identifier: replication_subnet_group_identifier, subnet_ids: subnet_ids, replication_subnet_group_description: replication_subnet_group_description)
        modify_replication_subnet_group(input)
      end
      def modify_replication_subnet_group(input : Types::ModifyReplicationSubnetGroupMessage) : Types::ModifyReplicationSubnetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_REPLICATION_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyReplicationSubnetGroupResponse, "ModifyReplicationSubnetGroup")
      end

      # Modifies the specified replication task. You can't modify the task endpoints. The task must be
      # stopped before you can modify it. For more information about DMS tasks, see Working with Migration
      # Tasks in the Database Migration Service User Guide .
      def modify_replication_task(
        replication_task_arn : String,
        cdc_start_position : String? = nil,
        cdc_start_time : Time? = nil,
        cdc_stop_position : String? = nil,
        migration_type : String? = nil,
        replication_task_identifier : String? = nil,
        replication_task_settings : String? = nil,
        table_mappings : String? = nil,
        task_data : String? = nil
      ) : Types::ModifyReplicationTaskResponse
        input = Types::ModifyReplicationTaskMessage.new(replication_task_arn: replication_task_arn, cdc_start_position: cdc_start_position, cdc_start_time: cdc_start_time, cdc_stop_position: cdc_stop_position, migration_type: migration_type, replication_task_identifier: replication_task_identifier, replication_task_settings: replication_task_settings, table_mappings: table_mappings, task_data: task_data)
        modify_replication_task(input)
      end
      def modify_replication_task(input : Types::ModifyReplicationTaskMessage) : Types::ModifyReplicationTaskResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_REPLICATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyReplicationTaskResponse, "ModifyReplicationTask")
      end

      # Moves a replication task from its current replication instance to a different target replication
      # instance using the specified parameters. The target replication instance must be created with the
      # same or later DMS version as the current replication instance.
      def move_replication_task(
        replication_task_arn : String,
        target_replication_instance_arn : String
      ) : Types::MoveReplicationTaskResponse
        input = Types::MoveReplicationTaskMessage.new(replication_task_arn: replication_task_arn, target_replication_instance_arn: target_replication_instance_arn)
        move_replication_task(input)
      end
      def move_replication_task(input : Types::MoveReplicationTaskMessage) : Types::MoveReplicationTaskResponse
        request = Protocol::JsonRpc.build_request(Model::MOVE_REPLICATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MoveReplicationTaskResponse, "MoveReplicationTask")
      end

      # Reboots a replication instance. Rebooting results in a momentary outage, until the replication
      # instance becomes available again.
      def reboot_replication_instance(
        replication_instance_arn : String,
        force_failover : Bool? = nil,
        force_planned_failover : Bool? = nil
      ) : Types::RebootReplicationInstanceResponse
        input = Types::RebootReplicationInstanceMessage.new(replication_instance_arn: replication_instance_arn, force_failover: force_failover, force_planned_failover: force_planned_failover)
        reboot_replication_instance(input)
      end
      def reboot_replication_instance(input : Types::RebootReplicationInstanceMessage) : Types::RebootReplicationInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::REBOOT_REPLICATION_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RebootReplicationInstanceResponse, "RebootReplicationInstance")
      end

      # Populates the schema for the specified endpoint. This is an asynchronous operation and can take
      # several minutes. You can check the status of this operation by calling the
      # DescribeRefreshSchemasStatus operation.
      def refresh_schemas(
        endpoint_arn : String,
        replication_instance_arn : String
      ) : Types::RefreshSchemasResponse
        input = Types::RefreshSchemasMessage.new(endpoint_arn: endpoint_arn, replication_instance_arn: replication_instance_arn)
        refresh_schemas(input)
      end
      def refresh_schemas(input : Types::RefreshSchemasMessage) : Types::RefreshSchemasResponse
        request = Protocol::JsonRpc.build_request(Model::REFRESH_SCHEMAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RefreshSchemasResponse, "RefreshSchemas")
      end

      # Reloads the target database table with the source data for a given DMS Serverless replication
      # configuration. You can only use this operation with a task in the RUNNING state, otherwise the
      # service will throw an InvalidResourceStateFault exception.
      def reload_replication_tables(
        replication_config_arn : String,
        tables_to_reload : Array(Types::TableToReload),
        reload_option : String? = nil
      ) : Types::ReloadReplicationTablesResponse
        input = Types::ReloadReplicationTablesMessage.new(replication_config_arn: replication_config_arn, tables_to_reload: tables_to_reload, reload_option: reload_option)
        reload_replication_tables(input)
      end
      def reload_replication_tables(input : Types::ReloadReplicationTablesMessage) : Types::ReloadReplicationTablesResponse
        request = Protocol::JsonRpc.build_request(Model::RELOAD_REPLICATION_TABLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReloadReplicationTablesResponse, "ReloadReplicationTables")
      end

      # Reloads the target database table with the source data. You can only use this operation with a task
      # in the RUNNING state, otherwise the service will throw an InvalidResourceStateFault exception.
      def reload_tables(
        replication_task_arn : String,
        tables_to_reload : Array(Types::TableToReload),
        reload_option : String? = nil
      ) : Types::ReloadTablesResponse
        input = Types::ReloadTablesMessage.new(replication_task_arn: replication_task_arn, tables_to_reload: tables_to_reload, reload_option: reload_option)
        reload_tables(input)
      end
      def reload_tables(input : Types::ReloadTablesMessage) : Types::ReloadTablesResponse
        request = Protocol::JsonRpc.build_request(Model::RELOAD_TABLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReloadTablesResponse, "ReloadTables")
      end

      # Removes metadata tags from an DMS resource, including replication instance, endpoint, subnet group,
      # and migration task. For more information, see Tag data type description.
      def remove_tags_from_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::RemoveTagsFromResourceResponse
        input = Types::RemoveTagsFromResourceMessage.new(resource_arn: resource_arn, tag_keys: tag_keys)
        remove_tags_from_resource(input)
      end
      def remove_tags_from_resource(input : Types::RemoveTagsFromResourceMessage) : Types::RemoveTagsFromResourceResponse
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveTagsFromResourceResponse, "RemoveTagsFromResource")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Runs large-scale assessment
      # (LSA) analysis on every Fleet Advisor collector in your account.
      def run_fleet_advisor_lsa_analysis : Types::RunFleetAdvisorLsaAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::RUN_FLEET_ADVISOR_LSA_ANALYSIS, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RunFleetAdvisorLsaAnalysisResponse, "RunFleetAdvisorLsaAnalysis")
      end

      # Starts the specified data migration.
      def start_data_migration(
        data_migration_identifier : String,
        start_type : String
      ) : Types::StartDataMigrationResponse
        input = Types::StartDataMigrationMessage.new(data_migration_identifier: data_migration_identifier, start_type: start_type)
        start_data_migration(input)
      end
      def start_data_migration(input : Types::StartDataMigrationMessage) : Types::StartDataMigrationResponse
        request = Protocol::JsonRpc.build_request(Model::START_DATA_MIGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDataMigrationResponse, "StartDataMigration")
      end

      # Applies the extension pack to your target database. An extension pack is an add-on module that
      # emulates functions present in a source database that are required when converting objects to the
      # target database.
      def start_extension_pack_association(
        migration_project_identifier : String
      ) : Types::StartExtensionPackAssociationResponse
        input = Types::StartExtensionPackAssociationMessage.new(migration_project_identifier: migration_project_identifier)
        start_extension_pack_association(input)
      end
      def start_extension_pack_association(input : Types::StartExtensionPackAssociationMessage) : Types::StartExtensionPackAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::START_EXTENSION_PACK_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartExtensionPackAssociationResponse, "StartExtensionPackAssociation")
      end

      # Creates a database migration assessment report by assessing the migration complexity for your source
      # database. A database migration assessment report summarizes all of the schema conversion tasks. It
      # also details the action items for database objects that can't be converted to the database engine of
      # your target database instance.
      def start_metadata_model_assessment(
        migration_project_identifier : String,
        selection_rules : String
      ) : Types::StartMetadataModelAssessmentResponse
        input = Types::StartMetadataModelAssessmentMessage.new(migration_project_identifier: migration_project_identifier, selection_rules: selection_rules)
        start_metadata_model_assessment(input)
      end
      def start_metadata_model_assessment(input : Types::StartMetadataModelAssessmentMessage) : Types::StartMetadataModelAssessmentResponse
        request = Protocol::JsonRpc.build_request(Model::START_METADATA_MODEL_ASSESSMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMetadataModelAssessmentResponse, "StartMetadataModelAssessment")
      end

      # Converts your source database objects to a format compatible with the target database.
      def start_metadata_model_conversion(
        migration_project_identifier : String,
        selection_rules : String
      ) : Types::StartMetadataModelConversionResponse
        input = Types::StartMetadataModelConversionMessage.new(migration_project_identifier: migration_project_identifier, selection_rules: selection_rules)
        start_metadata_model_conversion(input)
      end
      def start_metadata_model_conversion(input : Types::StartMetadataModelConversionMessage) : Types::StartMetadataModelConversionResponse
        request = Protocol::JsonRpc.build_request(Model::START_METADATA_MODEL_CONVERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMetadataModelConversionResponse, "StartMetadataModelConversion")
      end

      # Creates source metadata model of the given type with the specified properties for schema conversion
      # operations. This action supports only these directions: from SQL Server to Aurora PostgreSQL, or
      # from SQL Server to RDS for PostgreSQL.
      def start_metadata_model_creation(
        metadata_model_name : String,
        migration_project_identifier : String,
        properties : Types::MetadataModelProperties,
        selection_rules : String
      ) : Types::StartMetadataModelCreationResponse
        input = Types::StartMetadataModelCreationMessage.new(metadata_model_name: metadata_model_name, migration_project_identifier: migration_project_identifier, properties: properties, selection_rules: selection_rules)
        start_metadata_model_creation(input)
      end
      def start_metadata_model_creation(input : Types::StartMetadataModelCreationMessage) : Types::StartMetadataModelCreationResponse
        request = Protocol::JsonRpc.build_request(Model::START_METADATA_MODEL_CREATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMetadataModelCreationResponse, "StartMetadataModelCreation")
      end

      # Saves your converted code to a file as a SQL script, and stores this file on your Amazon S3 bucket.
      def start_metadata_model_export_as_script(
        migration_project_identifier : String,
        origin : String,
        selection_rules : String,
        file_name : String? = nil
      ) : Types::StartMetadataModelExportAsScriptResponse
        input = Types::StartMetadataModelExportAsScriptMessage.new(migration_project_identifier: migration_project_identifier, origin: origin, selection_rules: selection_rules, file_name: file_name)
        start_metadata_model_export_as_script(input)
      end
      def start_metadata_model_export_as_script(input : Types::StartMetadataModelExportAsScriptMessage) : Types::StartMetadataModelExportAsScriptResponse
        request = Protocol::JsonRpc.build_request(Model::START_METADATA_MODEL_EXPORT_AS_SCRIPT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMetadataModelExportAsScriptResponse, "StartMetadataModelExportAsScript")
      end

      # Applies converted database objects to your target database.
      def start_metadata_model_export_to_target(
        migration_project_identifier : String,
        selection_rules : String,
        overwrite_extension_pack : Bool? = nil
      ) : Types::StartMetadataModelExportToTargetResponse
        input = Types::StartMetadataModelExportToTargetMessage.new(migration_project_identifier: migration_project_identifier, selection_rules: selection_rules, overwrite_extension_pack: overwrite_extension_pack)
        start_metadata_model_export_to_target(input)
      end
      def start_metadata_model_export_to_target(input : Types::StartMetadataModelExportToTargetMessage) : Types::StartMetadataModelExportToTargetResponse
        request = Protocol::JsonRpc.build_request(Model::START_METADATA_MODEL_EXPORT_TO_TARGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMetadataModelExportToTargetResponse, "StartMetadataModelExportToTarget")
      end

      # Loads the metadata for all the dependent database objects of the parent object. This operation uses
      # your project's Amazon S3 bucket as a metadata cache to improve performance.
      def start_metadata_model_import(
        migration_project_identifier : String,
        origin : String,
        selection_rules : String,
        refresh : Bool? = nil
      ) : Types::StartMetadataModelImportResponse
        input = Types::StartMetadataModelImportMessage.new(migration_project_identifier: migration_project_identifier, origin: origin, selection_rules: selection_rules, refresh: refresh)
        start_metadata_model_import(input)
      end
      def start_metadata_model_import(input : Types::StartMetadataModelImportMessage) : Types::StartMetadataModelImportResponse
        request = Protocol::JsonRpc.build_request(Model::START_METADATA_MODEL_IMPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMetadataModelImportResponse, "StartMetadataModelImport")
      end

      # End of support notice: On May 20, 2026, Amazon Web Services will end support for Amazon Web Services
      # DMS Fleet Advisor;. After May 20, 2026, you will no longer be able to access the Amazon Web Services
      # DMS Fleet Advisor; console or Amazon Web Services DMS Fleet Advisor; resources. For more
      # information, see Amazon Web Services DMS Fleet Advisor end of support . Starts the analysis of your
      # source database to provide recommendations of target engines. You can create recommendations for
      # multiple source databases using BatchStartRecommendations .
      def start_recommendations(
        database_id : String,
        settings : Types::RecommendationSettings
      ) : Nil
        input = Types::StartRecommendationsRequest.new(database_id: database_id, settings: settings)
        start_recommendations(input)
      end
      def start_recommendations(input : Types::StartRecommendationsRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::START_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # For a given DMS Serverless replication configuration, DMS connects to the source endpoint and
      # collects the metadata to analyze the replication workload. Using this metadata, DMS then computes
      # and provisions the required capacity and starts replicating to the target endpoint using the server
      # resources that DMS has provisioned for the DMS Serverless replication.
      def start_replication(
        replication_config_arn : String,
        start_replication_type : String,
        cdc_start_position : String? = nil,
        cdc_start_time : Time? = nil,
        cdc_stop_position : String? = nil,
        premigration_assessment_settings : String? = nil
      ) : Types::StartReplicationResponse
        input = Types::StartReplicationMessage.new(replication_config_arn: replication_config_arn, start_replication_type: start_replication_type, cdc_start_position: cdc_start_position, cdc_start_time: cdc_start_time, cdc_stop_position: cdc_stop_position, premigration_assessment_settings: premigration_assessment_settings)
        start_replication(input)
      end
      def start_replication(input : Types::StartReplicationMessage) : Types::StartReplicationResponse
        request = Protocol::JsonRpc.build_request(Model::START_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartReplicationResponse, "StartReplication")
      end

      # Starts the replication task. For more information about DMS tasks, see Working with Migration Tasks
      # in the Database Migration Service User Guide.
      def start_replication_task(
        replication_task_arn : String,
        start_replication_task_type : String,
        cdc_start_position : String? = nil,
        cdc_start_time : Time? = nil,
        cdc_stop_position : String? = nil
      ) : Types::StartReplicationTaskResponse
        input = Types::StartReplicationTaskMessage.new(replication_task_arn: replication_task_arn, start_replication_task_type: start_replication_task_type, cdc_start_position: cdc_start_position, cdc_start_time: cdc_start_time, cdc_stop_position: cdc_stop_position)
        start_replication_task(input)
      end
      def start_replication_task(input : Types::StartReplicationTaskMessage) : Types::StartReplicationTaskResponse
        request = Protocol::JsonRpc.build_request(Model::START_REPLICATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartReplicationTaskResponse, "StartReplicationTask")
      end

      # Starts the replication task assessment for unsupported data types in the source database. You can
      # only use this operation for a task if the following conditions are true: The task must be in the
      # stopped state. The task must have successful connections to the source and target. If either of
      # these conditions are not met, an InvalidResourceStateFault error will result. For information about
      # DMS task assessments, see Creating a task assessment report in the Database Migration Service User
      # Guide .
      def start_replication_task_assessment(
        replication_task_arn : String
      ) : Types::StartReplicationTaskAssessmentResponse
        input = Types::StartReplicationTaskAssessmentMessage.new(replication_task_arn: replication_task_arn)
        start_replication_task_assessment(input)
      end
      def start_replication_task_assessment(input : Types::StartReplicationTaskAssessmentMessage) : Types::StartReplicationTaskAssessmentResponse
        request = Protocol::JsonRpc.build_request(Model::START_REPLICATION_TASK_ASSESSMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartReplicationTaskAssessmentResponse, "StartReplicationTaskAssessment")
      end

      # Starts a new premigration assessment run for one or more individual assessments of a migration task.
      # The assessments that you can specify depend on the source and target database engine and the
      # migration type defined for the given task. To run this operation, your migration task must already
      # be created. After you run this operation, you can review the status of each individual assessment.
      # You can also run the migration task manually after the assessment run and its individual assessments
      # complete.
      def start_replication_task_assessment_run(
        assessment_run_name : String,
        replication_task_arn : String,
        result_location_bucket : String,
        service_access_role_arn : String,
        exclude : Array(String)? = nil,
        include_only : Array(String)? = nil,
        result_encryption_mode : String? = nil,
        result_kms_key_arn : String? = nil,
        result_location_folder : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartReplicationTaskAssessmentRunResponse
        input = Types::StartReplicationTaskAssessmentRunMessage.new(assessment_run_name: assessment_run_name, replication_task_arn: replication_task_arn, result_location_bucket: result_location_bucket, service_access_role_arn: service_access_role_arn, exclude: exclude, include_only: include_only, result_encryption_mode: result_encryption_mode, result_kms_key_arn: result_kms_key_arn, result_location_folder: result_location_folder, tags: tags)
        start_replication_task_assessment_run(input)
      end
      def start_replication_task_assessment_run(input : Types::StartReplicationTaskAssessmentRunMessage) : Types::StartReplicationTaskAssessmentRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_REPLICATION_TASK_ASSESSMENT_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartReplicationTaskAssessmentRunResponse, "StartReplicationTaskAssessmentRun")
      end

      # Stops the specified data migration.
      def stop_data_migration(
        data_migration_identifier : String
      ) : Types::StopDataMigrationResponse
        input = Types::StopDataMigrationMessage.new(data_migration_identifier: data_migration_identifier)
        stop_data_migration(input)
      end
      def stop_data_migration(input : Types::StopDataMigrationMessage) : Types::StopDataMigrationResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_DATA_MIGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopDataMigrationResponse, "StopDataMigration")
      end

      # For a given DMS Serverless replication configuration, DMS stops any and all ongoing DMS Serverless
      # replications. This command doesn't deprovision the stopped replications.
      def stop_replication(
        replication_config_arn : String
      ) : Types::StopReplicationResponse
        input = Types::StopReplicationMessage.new(replication_config_arn: replication_config_arn)
        stop_replication(input)
      end
      def stop_replication(input : Types::StopReplicationMessage) : Types::StopReplicationResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopReplicationResponse, "StopReplication")
      end

      # Stops the replication task.
      def stop_replication_task(
        replication_task_arn : String
      ) : Types::StopReplicationTaskResponse
        input = Types::StopReplicationTaskMessage.new(replication_task_arn: replication_task_arn)
        stop_replication_task(input)
      end
      def stop_replication_task(input : Types::StopReplicationTaskMessage) : Types::StopReplicationTaskResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_REPLICATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopReplicationTaskResponse, "StopReplicationTask")
      end

      # Tests the connection between the replication instance and the endpoint.
      def test_connection(
        endpoint_arn : String,
        replication_instance_arn : String
      ) : Types::TestConnectionResponse
        input = Types::TestConnectionMessage.new(endpoint_arn: endpoint_arn, replication_instance_arn: replication_instance_arn)
        test_connection(input)
      end
      def test_connection(input : Types::TestConnectionMessage) : Types::TestConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::TEST_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestConnectionResponse, "TestConnection")
      end

      # Migrates 10 active and enabled Amazon SNS subscriptions at a time and converts them to corresponding
      # Amazon EventBridge rules. By default, this operation migrates subscriptions only when all your
      # replication instance versions are 3.4.5 or higher. If any replication instances are from versions
      # earlier than 3.4.5, the operation raises an error and tells you to upgrade these instances to
      # version 3.4.5 or higher. To enable migration regardless of version, set the Force option to true.
      # However, if you don't upgrade instances earlier than version 3.4.5, some types of events might not
      # be available when you use Amazon EventBridge. To call this operation, make sure that you have
      # certain permissions added to your user account. For more information, see Migrating event
      # subscriptions to Amazon EventBridge in the Amazon Web Services Database Migration Service User Guide
      # .
      def update_subscriptions_to_event_bridge(
        force_move : Bool? = nil
      ) : Types::UpdateSubscriptionsToEventBridgeResponse
        input = Types::UpdateSubscriptionsToEventBridgeMessage.new(force_move: force_move)
        update_subscriptions_to_event_bridge(input)
      end
      def update_subscriptions_to_event_bridge(input : Types::UpdateSubscriptionsToEventBridgeMessage) : Types::UpdateSubscriptionsToEventBridgeResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SUBSCRIPTIONS_TO_EVENT_BRIDGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSubscriptionsToEventBridgeResponse, "UpdateSubscriptionsToEventBridge")
      end
    end
  end
end
