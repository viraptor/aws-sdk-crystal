module Aws
  module Glue
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates one or more partitions in a batch operation.

      def batch_create_partition(
        database_name : String,
        partition_input_list : Array(Types::PartitionInput),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::BatchCreatePartitionResponse

        input = Types::BatchCreatePartitionRequest.new(database_name: database_name, partition_input_list: partition_input_list, table_name: table_name, catalog_id: catalog_id)
        batch_create_partition(input)
      end

      def batch_create_partition(input : Types::BatchCreatePartitionRequest) : Types::BatchCreatePartitionResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_CREATE_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchCreatePartitionResponse, "BatchCreatePartition")
      end

      # Deletes a list of connection definitions from the Data Catalog.

      def batch_delete_connection(
        connection_name_list : Array(String),
        catalog_id : String? = nil
      ) : Types::BatchDeleteConnectionResponse

        input = Types::BatchDeleteConnectionRequest.new(connection_name_list: connection_name_list, catalog_id: catalog_id)
        batch_delete_connection(input)
      end

      def batch_delete_connection(input : Types::BatchDeleteConnectionRequest) : Types::BatchDeleteConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteConnectionResponse, "BatchDeleteConnection")
      end

      # Deletes one or more partitions in a batch operation.

      def batch_delete_partition(
        database_name : String,
        partitions_to_delete : Array(Types::PartitionValueList),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::BatchDeletePartitionResponse

        input = Types::BatchDeletePartitionRequest.new(database_name: database_name, partitions_to_delete: partitions_to_delete, table_name: table_name, catalog_id: catalog_id)
        batch_delete_partition(input)
      end

      def batch_delete_partition(input : Types::BatchDeletePartitionRequest) : Types::BatchDeletePartitionResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeletePartitionResponse, "BatchDeletePartition")
      end

      # Deletes multiple tables at once. After completing this operation, you no longer have access to the
      # table versions and partitions that belong to the deleted table. Glue deletes these "orphaned"
      # resources asynchronously in a timely manner, at the discretion of the service. To ensure the
      # immediate deletion of all related resources, before calling BatchDeleteTable , use
      # DeleteTableVersion or BatchDeleteTableVersion , and DeletePartition or BatchDeletePartition , to
      # delete any resources that belong to the table.

      def batch_delete_table(
        database_name : String,
        tables_to_delete : Array(String),
        catalog_id : String? = nil,
        transaction_id : String? = nil
      ) : Types::BatchDeleteTableResponse

        input = Types::BatchDeleteTableRequest.new(database_name: database_name, tables_to_delete: tables_to_delete, catalog_id: catalog_id, transaction_id: transaction_id)
        batch_delete_table(input)
      end

      def batch_delete_table(input : Types::BatchDeleteTableRequest) : Types::BatchDeleteTableResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteTableResponse, "BatchDeleteTable")
      end

      # Deletes a specified batch of versions of a table.

      def batch_delete_table_version(
        database_name : String,
        table_name : String,
        version_ids : Array(String),
        catalog_id : String? = nil
      ) : Types::BatchDeleteTableVersionResponse

        input = Types::BatchDeleteTableVersionRequest.new(database_name: database_name, table_name: table_name, version_ids: version_ids, catalog_id: catalog_id)
        batch_delete_table_version(input)
      end

      def batch_delete_table_version(input : Types::BatchDeleteTableVersionRequest) : Types::BatchDeleteTableVersionResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_TABLE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteTableVersionResponse, "BatchDeleteTableVersion")
      end

      # Retrieves information about a list of blueprints.

      def batch_get_blueprints(
        names : Array(String),
        include_blueprint : Bool? = nil,
        include_parameter_spec : Bool? = nil
      ) : Types::BatchGetBlueprintsResponse

        input = Types::BatchGetBlueprintsRequest.new(names: names, include_blueprint: include_blueprint, include_parameter_spec: include_parameter_spec)
        batch_get_blueprints(input)
      end

      def batch_get_blueprints(input : Types::BatchGetBlueprintsRequest) : Types::BatchGetBlueprintsResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_BLUEPRINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetBlueprintsResponse, "BatchGetBlueprints")
      end

      # Returns a list of resource metadata for a given list of crawler names. After calling the
      # ListCrawlers operation, you can call this operation to access the data to which you have been
      # granted permissions. This operation supports all IAM permissions, including permission conditions
      # that uses tags.

      def batch_get_crawlers(
        crawler_names : Array(String)
      ) : Types::BatchGetCrawlersResponse

        input = Types::BatchGetCrawlersRequest.new(crawler_names: crawler_names)
        batch_get_crawlers(input)
      end

      def batch_get_crawlers(input : Types::BatchGetCrawlersRequest) : Types::BatchGetCrawlersResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_CRAWLERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetCrawlersResponse, "BatchGetCrawlers")
      end

      # Retrieves the details for the custom patterns specified by a list of names.

      def batch_get_custom_entity_types(
        names : Array(String)
      ) : Types::BatchGetCustomEntityTypesResponse

        input = Types::BatchGetCustomEntityTypesRequest.new(names: names)
        batch_get_custom_entity_types(input)
      end

      def batch_get_custom_entity_types(input : Types::BatchGetCustomEntityTypesRequest) : Types::BatchGetCustomEntityTypesResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_CUSTOM_ENTITY_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetCustomEntityTypesResponse, "BatchGetCustomEntityTypes")
      end

      # Retrieves a list of data quality results for the specified result IDs.

      def batch_get_data_quality_result(
        result_ids : Array(String)
      ) : Types::BatchGetDataQualityResultResponse

        input = Types::BatchGetDataQualityResultRequest.new(result_ids: result_ids)
        batch_get_data_quality_result(input)
      end

      def batch_get_data_quality_result(input : Types::BatchGetDataQualityResultRequest) : Types::BatchGetDataQualityResultResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_DATA_QUALITY_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetDataQualityResultResponse, "BatchGetDataQualityResult")
      end

      # Returns a list of resource metadata for a given list of development endpoint names. After calling
      # the ListDevEndpoints operation, you can call this operation to access the data to which you have
      # been granted permissions. This operation supports all IAM permissions, including permission
      # conditions that uses tags.

      def batch_get_dev_endpoints(
        dev_endpoint_names : Array(String)
      ) : Types::BatchGetDevEndpointsResponse

        input = Types::BatchGetDevEndpointsRequest.new(dev_endpoint_names: dev_endpoint_names)
        batch_get_dev_endpoints(input)
      end

      def batch_get_dev_endpoints(input : Types::BatchGetDevEndpointsRequest) : Types::BatchGetDevEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_DEV_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetDevEndpointsResponse, "BatchGetDevEndpoints")
      end

      # Returns a list of resource metadata for a given list of job names. After calling the ListJobs
      # operation, you can call this operation to access the data to which you have been granted
      # permissions. This operation supports all IAM permissions, including permission conditions that uses
      # tags.

      def batch_get_jobs(
        job_names : Array(String)
      ) : Types::BatchGetJobsResponse

        input = Types::BatchGetJobsRequest.new(job_names: job_names)
        batch_get_jobs(input)
      end

      def batch_get_jobs(input : Types::BatchGetJobsRequest) : Types::BatchGetJobsResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetJobsResponse, "BatchGetJobs")
      end

      # Retrieves partitions in a batch request.

      def batch_get_partition(
        database_name : String,
        partitions_to_get : Array(Types::PartitionValueList),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::BatchGetPartitionResponse

        input = Types::BatchGetPartitionRequest.new(database_name: database_name, partitions_to_get: partitions_to_get, table_name: table_name, catalog_id: catalog_id)
        batch_get_partition(input)
      end

      def batch_get_partition(input : Types::BatchGetPartitionRequest) : Types::BatchGetPartitionResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetPartitionResponse, "BatchGetPartition")
      end

      # Returns the configuration for the specified table optimizers.

      def batch_get_table_optimizer(
        entries : Array(Types::BatchGetTableOptimizerEntry)
      ) : Types::BatchGetTableOptimizerResponse

        input = Types::BatchGetTableOptimizerRequest.new(entries: entries)
        batch_get_table_optimizer(input)
      end

      def batch_get_table_optimizer(input : Types::BatchGetTableOptimizerRequest) : Types::BatchGetTableOptimizerResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_TABLE_OPTIMIZER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetTableOptimizerResponse, "BatchGetTableOptimizer")
      end

      # Returns a list of resource metadata for a given list of trigger names. After calling the
      # ListTriggers operation, you can call this operation to access the data to which you have been
      # granted permissions. This operation supports all IAM permissions, including permission conditions
      # that uses tags.

      def batch_get_triggers(
        trigger_names : Array(String)
      ) : Types::BatchGetTriggersResponse

        input = Types::BatchGetTriggersRequest.new(trigger_names: trigger_names)
        batch_get_triggers(input)
      end

      def batch_get_triggers(input : Types::BatchGetTriggersRequest) : Types::BatchGetTriggersResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_TRIGGERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetTriggersResponse, "BatchGetTriggers")
      end

      # Returns a list of resource metadata for a given list of workflow names. After calling the
      # ListWorkflows operation, you can call this operation to access the data to which you have been
      # granted permissions. This operation supports all IAM permissions, including permission conditions
      # that uses tags.

      def batch_get_workflows(
        names : Array(String),
        include_graph : Bool? = nil
      ) : Types::BatchGetWorkflowsResponse

        input = Types::BatchGetWorkflowsRequest.new(names: names, include_graph: include_graph)
        batch_get_workflows(input)
      end

      def batch_get_workflows(input : Types::BatchGetWorkflowsRequest) : Types::BatchGetWorkflowsResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_WORKFLOWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetWorkflowsResponse, "BatchGetWorkflows")
      end

      # Annotate datapoints over time for a specific data quality statistic. The API requires both profileID
      # and statisticID as part of the InclusionAnnotation input. The API only works for a single
      # statisticId across multiple profiles.

      def batch_put_data_quality_statistic_annotation(
        inclusion_annotations : Array(Types::DatapointInclusionAnnotation),
        client_token : String? = nil
      ) : Types::BatchPutDataQualityStatisticAnnotationResponse

        input = Types::BatchPutDataQualityStatisticAnnotationRequest.new(inclusion_annotations: inclusion_annotations, client_token: client_token)
        batch_put_data_quality_statistic_annotation(input)
      end

      def batch_put_data_quality_statistic_annotation(input : Types::BatchPutDataQualityStatisticAnnotationRequest) : Types::BatchPutDataQualityStatisticAnnotationResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_PUT_DATA_QUALITY_STATISTIC_ANNOTATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchPutDataQualityStatisticAnnotationResponse, "BatchPutDataQualityStatisticAnnotation")
      end

      # Stops one or more job runs for a specified job definition.

      def batch_stop_job_run(
        job_name : String,
        job_run_ids : Array(String)
      ) : Types::BatchStopJobRunResponse

        input = Types::BatchStopJobRunRequest.new(job_name: job_name, job_run_ids: job_run_ids)
        batch_stop_job_run(input)
      end

      def batch_stop_job_run(input : Types::BatchStopJobRunRequest) : Types::BatchStopJobRunResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_STOP_JOB_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchStopJobRunResponse, "BatchStopJobRun")
      end

      # Updates one or more partitions in a batch operation.

      def batch_update_partition(
        database_name : String,
        entries : Array(Types::BatchUpdatePartitionRequestEntry),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::BatchUpdatePartitionResponse

        input = Types::BatchUpdatePartitionRequest.new(database_name: database_name, entries: entries, table_name: table_name, catalog_id: catalog_id)
        batch_update_partition(input)
      end

      def batch_update_partition(input : Types::BatchUpdatePartitionRequest) : Types::BatchUpdatePartitionResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_UPDATE_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchUpdatePartitionResponse, "BatchUpdatePartition")
      end

      # Cancels the specified recommendation run that was being used to generate rules.

      def cancel_data_quality_rule_recommendation_run(
        run_id : String
      ) : Types::CancelDataQualityRuleRecommendationRunResponse

        input = Types::CancelDataQualityRuleRecommendationRunRequest.new(run_id: run_id)
        cancel_data_quality_rule_recommendation_run(input)
      end

      def cancel_data_quality_rule_recommendation_run(input : Types::CancelDataQualityRuleRecommendationRunRequest) : Types::CancelDataQualityRuleRecommendationRunResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_DATA_QUALITY_RULE_RECOMMENDATION_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelDataQualityRuleRecommendationRunResponse, "CancelDataQualityRuleRecommendationRun")
      end

      # Cancels a run where a ruleset is being evaluated against a data source.

      def cancel_data_quality_ruleset_evaluation_run(
        run_id : String
      ) : Types::CancelDataQualityRulesetEvaluationRunResponse

        input = Types::CancelDataQualityRulesetEvaluationRunRequest.new(run_id: run_id)
        cancel_data_quality_ruleset_evaluation_run(input)
      end

      def cancel_data_quality_ruleset_evaluation_run(input : Types::CancelDataQualityRulesetEvaluationRunRequest) : Types::CancelDataQualityRulesetEvaluationRunResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_DATA_QUALITY_RULESET_EVALUATION_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelDataQualityRulesetEvaluationRunResponse, "CancelDataQualityRulesetEvaluationRun")
      end

      # Cancels (stops) a task run. Machine learning task runs are asynchronous tasks that Glue runs on your
      # behalf as part of various machine learning workflows. You can cancel a machine learning task run at
      # any time by calling CancelMLTaskRun with a task run's parent transform's TransformID and the task
      # run's TaskRunId .

      def cancel_ml_task_run(
        task_run_id : String,
        transform_id : String
      ) : Types::CancelMLTaskRunResponse

        input = Types::CancelMLTaskRunRequest.new(task_run_id: task_run_id, transform_id: transform_id)
        cancel_ml_task_run(input)
      end

      def cancel_ml_task_run(input : Types::CancelMLTaskRunRequest) : Types::CancelMLTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_ML_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelMLTaskRunResponse, "CancelMLTaskRun")
      end

      # Cancels the statement.

      def cancel_statement(
        id : Int32,
        session_id : String,
        request_origin : String? = nil
      ) : Types::CancelStatementResponse

        input = Types::CancelStatementRequest.new(id: id, session_id: session_id, request_origin: request_origin)
        cancel_statement(input)
      end

      def cancel_statement(input : Types::CancelStatementRequest) : Types::CancelStatementResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelStatementResponse, "CancelStatement")
      end

      # Validates the supplied schema. This call has no side effects, it simply validates using the supplied
      # schema using DataFormat as the format. Since it does not take a schema set name, no compatibility
      # checks are performed.

      def check_schema_version_validity(
        data_format : String,
        schema_definition : String
      ) : Types::CheckSchemaVersionValidityResponse

        input = Types::CheckSchemaVersionValidityInput.new(data_format: data_format, schema_definition: schema_definition)
        check_schema_version_validity(input)
      end

      def check_schema_version_validity(input : Types::CheckSchemaVersionValidityInput) : Types::CheckSchemaVersionValidityResponse
        request = Protocol::JsonRpc.build_request(Model::CHECK_SCHEMA_VERSION_VALIDITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CheckSchemaVersionValidityResponse, "CheckSchemaVersionValidity")
      end

      # Registers a blueprint with Glue.

      def create_blueprint(
        blueprint_location : String,
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateBlueprintResponse

        input = Types::CreateBlueprintRequest.new(blueprint_location: blueprint_location, name: name, description: description, tags: tags)
        create_blueprint(input)
      end

      def create_blueprint(input : Types::CreateBlueprintRequest) : Types::CreateBlueprintResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BLUEPRINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBlueprintResponse, "CreateBlueprint")
      end

      # Creates a new catalog in the Glue Data Catalog.

      def create_catalog(
        catalog_input : Types::CatalogInput,
        name : String,
        tags : Hash(String, String)? = nil
      ) : Types::CreateCatalogResponse

        input = Types::CreateCatalogRequest.new(catalog_input: catalog_input, name: name, tags: tags)
        create_catalog(input)
      end

      def create_catalog(input : Types::CreateCatalogRequest) : Types::CreateCatalogResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCatalogResponse, "CreateCatalog")
      end

      # Creates a classifier in the user's account. This can be a GrokClassifier , an XMLClassifier , a
      # JsonClassifier , or a CsvClassifier , depending on which field of the request is present.

      def create_classifier(
        csv_classifier : Types::CreateCsvClassifierRequest? = nil,
        grok_classifier : Types::CreateGrokClassifierRequest? = nil,
        json_classifier : Types::CreateJsonClassifierRequest? = nil,
        xml_classifier : Types::CreateXMLClassifierRequest? = nil
      ) : Types::CreateClassifierResponse

        input = Types::CreateClassifierRequest.new(csv_classifier: csv_classifier, grok_classifier: grok_classifier, json_classifier: json_classifier, xml_classifier: xml_classifier)
        create_classifier(input)
      end

      def create_classifier(input : Types::CreateClassifierRequest) : Types::CreateClassifierResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLASSIFIER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateClassifierResponse, "CreateClassifier")
      end

      # Creates settings for a column statistics task.

      def create_column_statistics_task_settings(
        database_name : String,
        role : String,
        table_name : String,
        catalog_id : String? = nil,
        column_name_list : Array(String)? = nil,
        sample_size : Float64? = nil,
        schedule : String? = nil,
        security_configuration : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateColumnStatisticsTaskSettingsResponse

        input = Types::CreateColumnStatisticsTaskSettingsRequest.new(database_name: database_name, role: role, table_name: table_name, catalog_id: catalog_id, column_name_list: column_name_list, sample_size: sample_size, schedule: schedule, security_configuration: security_configuration, tags: tags)
        create_column_statistics_task_settings(input)
      end

      def create_column_statistics_task_settings(input : Types::CreateColumnStatisticsTaskSettingsRequest) : Types::CreateColumnStatisticsTaskSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_COLUMN_STATISTICS_TASK_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateColumnStatisticsTaskSettingsResponse, "CreateColumnStatisticsTaskSettings")
      end

      # Creates a connection definition in the Data Catalog. Connections used for creating federated
      # resources require the IAM glue:PassConnection permission.

      def create_connection(
        connection_input : Types::ConnectionInput,
        catalog_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateConnectionResponse

        input = Types::CreateConnectionRequest.new(connection_input: connection_input, catalog_id: catalog_id, tags: tags)
        create_connection(input)
      end

      def create_connection(input : Types::CreateConnectionRequest) : Types::CreateConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConnectionResponse, "CreateConnection")
      end

      # Creates a new crawler with specified targets, role, configuration, and optional schedule. At least
      # one crawl target must be specified, in the s3Targets field, the jdbcTargets field, or the
      # DynamoDBTargets field.

      def create_crawler(
        name : String,
        role : String,
        targets : Types::CrawlerTargets,
        classifiers : Array(String)? = nil,
        configuration : String? = nil,
        crawler_security_configuration : String? = nil,
        database_name : String? = nil,
        description : String? = nil,
        lake_formation_configuration : Types::LakeFormationConfiguration? = nil,
        lineage_configuration : Types::LineageConfiguration? = nil,
        recrawl_policy : Types::RecrawlPolicy? = nil,
        schedule : String? = nil,
        schema_change_policy : Types::SchemaChangePolicy? = nil,
        table_prefix : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateCrawlerResponse

        input = Types::CreateCrawlerRequest.new(name: name, role: role, targets: targets, classifiers: classifiers, configuration: configuration, crawler_security_configuration: crawler_security_configuration, database_name: database_name, description: description, lake_formation_configuration: lake_formation_configuration, lineage_configuration: lineage_configuration, recrawl_policy: recrawl_policy, schedule: schedule, schema_change_policy: schema_change_policy, table_prefix: table_prefix, tags: tags)
        create_crawler(input)
      end

      def create_crawler(input : Types::CreateCrawlerRequest) : Types::CreateCrawlerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CRAWLER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCrawlerResponse, "CreateCrawler")
      end

      # Creates a custom pattern that is used to detect sensitive data across the columns and rows of your
      # structured data. Each custom pattern you create specifies a regular expression and an optional list
      # of context words. If no context words are passed only a regular expression is checked.

      def create_custom_entity_type(
        name : String,
        regex_string : String,
        context_words : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateCustomEntityTypeResponse

        input = Types::CreateCustomEntityTypeRequest.new(name: name, regex_string: regex_string, context_words: context_words, tags: tags)
        create_custom_entity_type(input)
      end

      def create_custom_entity_type(input : Types::CreateCustomEntityTypeRequest) : Types::CreateCustomEntityTypeResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CUSTOM_ENTITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCustomEntityTypeResponse, "CreateCustomEntityType")
      end

      # Creates a data quality ruleset with DQDL rules applied to a specified Glue table. You create the
      # ruleset using the Data Quality Definition Language (DQDL). For more information, see the Glue
      # developer guide.

      def create_data_quality_ruleset(
        name : String,
        ruleset : String,
        client_token : String? = nil,
        data_quality_security_configuration : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil,
        target_table : Types::DataQualityTargetTable? = nil
      ) : Types::CreateDataQualityRulesetResponse

        input = Types::CreateDataQualityRulesetRequest.new(name: name, ruleset: ruleset, client_token: client_token, data_quality_security_configuration: data_quality_security_configuration, description: description, tags: tags, target_table: target_table)
        create_data_quality_ruleset(input)
      end

      def create_data_quality_ruleset(input : Types::CreateDataQualityRulesetRequest) : Types::CreateDataQualityRulesetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_QUALITY_RULESET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataQualityRulesetResponse, "CreateDataQualityRuleset")
      end

      # Creates a new database in a Data Catalog.

      def create_database(
        database_input : Types::DatabaseInput,
        catalog_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateDatabaseResponse

        input = Types::CreateDatabaseRequest.new(database_input: database_input, catalog_id: catalog_id, tags: tags)
        create_database(input)
      end

      def create_database(input : Types::CreateDatabaseRequest) : Types::CreateDatabaseResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatabaseResponse, "CreateDatabase")
      end

      # Creates a new development endpoint.

      def create_dev_endpoint(
        endpoint_name : String,
        role_arn : String,
        arguments : Hash(String, String)? = nil,
        extra_jars_s3_path : String? = nil,
        extra_python_libs_s3_path : String? = nil,
        glue_version : String? = nil,
        number_of_nodes : Int32? = nil,
        number_of_workers : Int32? = nil,
        public_key : String? = nil,
        public_keys : Array(String)? = nil,
        security_configuration : String? = nil,
        security_group_ids : Array(String)? = nil,
        subnet_id : String? = nil,
        tags : Hash(String, String)? = nil,
        worker_type : String? = nil
      ) : Types::CreateDevEndpointResponse

        input = Types::CreateDevEndpointRequest.new(endpoint_name: endpoint_name, role_arn: role_arn, arguments: arguments, extra_jars_s3_path: extra_jars_s3_path, extra_python_libs_s3_path: extra_python_libs_s3_path, glue_version: glue_version, number_of_nodes: number_of_nodes, number_of_workers: number_of_workers, public_key: public_key, public_keys: public_keys, security_configuration: security_configuration, security_group_ids: security_group_ids, subnet_id: subnet_id, tags: tags, worker_type: worker_type)
        create_dev_endpoint(input)
      end

      def create_dev_endpoint(input : Types::CreateDevEndpointRequest) : Types::CreateDevEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DEV_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDevEndpointResponse, "CreateDevEndpoint")
      end

      # Creates a new Glue Identity Center configuration to enable integration between Glue and Amazon Web
      # Services IAM Identity Center for authentication and authorization.

      def create_glue_identity_center_configuration(
        instance_arn : String,
        scopes : Array(String)? = nil,
        user_background_sessions_enabled : Bool? = nil
      ) : Types::CreateGlueIdentityCenterConfigurationResponse

        input = Types::CreateGlueIdentityCenterConfigurationRequest.new(instance_arn: instance_arn, scopes: scopes, user_background_sessions_enabled: user_background_sessions_enabled)
        create_glue_identity_center_configuration(input)
      end

      def create_glue_identity_center_configuration(input : Types::CreateGlueIdentityCenterConfigurationRequest) : Types::CreateGlueIdentityCenterConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_GLUE_IDENTITY_CENTER_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGlueIdentityCenterConfigurationResponse, "CreateGlueIdentityCenterConfiguration")
      end

      # Creates a Zero-ETL integration in the caller's account between two resources with Amazon Resource
      # Names (ARNs): the SourceArn and TargetArn .

      def create_integration(
        integration_name : String,
        source_arn : String,
        target_arn : String,
        additional_encryption_context : Hash(String, String)? = nil,
        data_filter : String? = nil,
        description : String? = nil,
        integration_config : Types::IntegrationConfig? = nil,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateIntegrationResponse

        input = Types::CreateIntegrationRequest.new(integration_name: integration_name, source_arn: source_arn, target_arn: target_arn, additional_encryption_context: additional_encryption_context, data_filter: data_filter, description: description, integration_config: integration_config, kms_key_id: kms_key_id, tags: tags)
        create_integration(input)
      end

      def create_integration(input : Types::CreateIntegrationRequest) : Types::CreateIntegrationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INTEGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIntegrationResponse, "CreateIntegration")
      end

      # This API can be used for setting up the ResourceProperty of the Glue connection (for the source) or
      # Glue database ARN (for the target). These properties can include the role to access the connection
      # or database. To set both source and target properties the same API needs to be invoked with the Glue
      # connection ARN as ResourceArn with SourceProcessingProperties and the Glue database ARN as
      # ResourceArn with TargetProcessingProperties respectively.

      def create_integration_resource_property(
        resource_arn : String,
        source_processing_properties : Types::SourceProcessingProperties? = nil,
        tags : Array(Types::Tag)? = nil,
        target_processing_properties : Types::TargetProcessingProperties? = nil
      ) : Types::CreateIntegrationResourcePropertyResponse

        input = Types::CreateIntegrationResourcePropertyRequest.new(resource_arn: resource_arn, source_processing_properties: source_processing_properties, tags: tags, target_processing_properties: target_processing_properties)
        create_integration_resource_property(input)
      end

      def create_integration_resource_property(input : Types::CreateIntegrationResourcePropertyRequest) : Types::CreateIntegrationResourcePropertyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INTEGRATION_RESOURCE_PROPERTY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIntegrationResourcePropertyResponse, "CreateIntegrationResourceProperty")
      end

      # This API is used to provide optional override properties for the the tables that need to be
      # replicated. These properties can include properties for filtering and partitioning for the source
      # and target tables. To set both source and target properties the same API need to be invoked with the
      # Glue connection ARN as ResourceArn with SourceTableConfig , and the Glue database ARN as ResourceArn
      # with TargetTableConfig respectively.

      def create_integration_table_properties(
        resource_arn : String,
        table_name : String,
        source_table_config : Types::SourceTableConfig? = nil,
        target_table_config : Types::TargetTableConfig? = nil
      ) : Types::CreateIntegrationTablePropertiesResponse

        input = Types::CreateIntegrationTablePropertiesRequest.new(resource_arn: resource_arn, table_name: table_name, source_table_config: source_table_config, target_table_config: target_table_config)
        create_integration_table_properties(input)
      end

      def create_integration_table_properties(input : Types::CreateIntegrationTablePropertiesRequest) : Types::CreateIntegrationTablePropertiesResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INTEGRATION_TABLE_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIntegrationTablePropertiesResponse, "CreateIntegrationTableProperties")
      end

      # Creates a new job definition.

      def create_job(
        command : Types::JobCommand,
        name : String,
        role : String,
        allocated_capacity : Int32? = nil,
        code_gen_configuration_nodes : Hash(String, Types::CodeGenConfigurationNode)? = nil,
        connections : Types::ConnectionsList? = nil,
        default_arguments : Hash(String, String)? = nil,
        description : String? = nil,
        execution_class : String? = nil,
        execution_property : Types::ExecutionProperty? = nil,
        glue_version : String? = nil,
        job_mode : String? = nil,
        job_run_queuing_enabled : Bool? = nil,
        log_uri : String? = nil,
        maintenance_window : String? = nil,
        max_capacity : Float64? = nil,
        max_retries : Int32? = nil,
        non_overridable_arguments : Hash(String, String)? = nil,
        notification_property : Types::NotificationProperty? = nil,
        number_of_workers : Int32? = nil,
        security_configuration : String? = nil,
        source_control_details : Types::SourceControlDetails? = nil,
        tags : Hash(String, String)? = nil,
        timeout : Int32? = nil,
        worker_type : String? = nil
      ) : Types::CreateJobResponse

        input = Types::CreateJobRequest.new(command: command, name: name, role: role, allocated_capacity: allocated_capacity, code_gen_configuration_nodes: code_gen_configuration_nodes, connections: connections, default_arguments: default_arguments, description: description, execution_class: execution_class, execution_property: execution_property, glue_version: glue_version, job_mode: job_mode, job_run_queuing_enabled: job_run_queuing_enabled, log_uri: log_uri, maintenance_window: maintenance_window, max_capacity: max_capacity, max_retries: max_retries, non_overridable_arguments: non_overridable_arguments, notification_property: notification_property, number_of_workers: number_of_workers, security_configuration: security_configuration, source_control_details: source_control_details, tags: tags, timeout: timeout, worker_type: worker_type)
        create_job(input)
      end

      def create_job(input : Types::CreateJobRequest) : Types::CreateJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateJobResponse, "CreateJob")
      end

      # Creates an Glue machine learning transform. This operation creates the transform and all the
      # necessary parameters to train it. Call this operation as the first step in the process of using a
      # machine learning transform (such as the FindMatches transform) for deduplicating data. You can
      # provide an optional Description , in addition to the parameters that you want to use for your
      # algorithm. You must also specify certain parameters for the tasks that Glue runs on your behalf as
      # part of learning from your data and creating a high-quality machine learning transform. These
      # parameters include Role , and optionally, AllocatedCapacity , Timeout , and MaxRetries . For more
      # information, see Jobs .

      def create_ml_transform(
        input_record_tables : Array(Types::GlueTable),
        name : String,
        parameters : Types::TransformParameters,
        role : String,
        description : String? = nil,
        glue_version : String? = nil,
        max_capacity : Float64? = nil,
        max_retries : Int32? = nil,
        number_of_workers : Int32? = nil,
        tags : Hash(String, String)? = nil,
        timeout : Int32? = nil,
        transform_encryption : Types::TransformEncryption? = nil,
        worker_type : String? = nil
      ) : Types::CreateMLTransformResponse

        input = Types::CreateMLTransformRequest.new(input_record_tables: input_record_tables, name: name, parameters: parameters, role: role, description: description, glue_version: glue_version, max_capacity: max_capacity, max_retries: max_retries, number_of_workers: number_of_workers, tags: tags, timeout: timeout, transform_encryption: transform_encryption, worker_type: worker_type)
        create_ml_transform(input)
      end

      def create_ml_transform(input : Types::CreateMLTransformRequest) : Types::CreateMLTransformResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ML_TRANSFORM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMLTransformResponse, "CreateMLTransform")
      end

      # Creates a new partition.

      def create_partition(
        database_name : String,
        partition_input : Types::PartitionInput,
        table_name : String,
        catalog_id : String? = nil
      ) : Types::CreatePartitionResponse

        input = Types::CreatePartitionRequest.new(database_name: database_name, partition_input: partition_input, table_name: table_name, catalog_id: catalog_id)
        create_partition(input)
      end

      def create_partition(input : Types::CreatePartitionRequest) : Types::CreatePartitionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePartitionResponse, "CreatePartition")
      end

      # Creates a specified partition index in an existing table.

      def create_partition_index(
        database_name : String,
        partition_index : Types::PartitionIndex,
        table_name : String,
        catalog_id : String? = nil
      ) : Types::CreatePartitionIndexResponse

        input = Types::CreatePartitionIndexRequest.new(database_name: database_name, partition_index: partition_index, table_name: table_name, catalog_id: catalog_id)
        create_partition_index(input)
      end

      def create_partition_index(input : Types::CreatePartitionIndexRequest) : Types::CreatePartitionIndexResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARTITION_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePartitionIndexResponse, "CreatePartitionIndex")
      end

      # Creates a new registry which may be used to hold a collection of schemas.

      def create_registry(
        registry_name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateRegistryResponse

        input = Types::CreateRegistryInput.new(registry_name: registry_name, description: description, tags: tags)
        create_registry(input)
      end

      def create_registry(input : Types::CreateRegistryInput) : Types::CreateRegistryResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REGISTRY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRegistryResponse, "CreateRegistry")
      end

      # Creates a new schema set and registers the schema definition. Returns an error if the schema set
      # already exists without actually registering the version. When the schema set is created, a version
      # checkpoint will be set to the first version. Compatibility mode "DISABLED" restricts any additional
      # schema versions from being added after the first schema version. For all other compatibility modes,
      # validation of compatibility settings will be applied only from the second version onwards when the
      # RegisterSchemaVersion API is used. When this API is called without a RegistryId , this will create
      # an entry for a "default-registry" in the registry database tables, if it is not already present.

      def create_schema(
        data_format : String,
        schema_name : String,
        compatibility : String? = nil,
        description : String? = nil,
        registry_id : Types::RegistryId? = nil,
        schema_definition : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateSchemaResponse

        input = Types::CreateSchemaInput.new(data_format: data_format, schema_name: schema_name, compatibility: compatibility, description: description, registry_id: registry_id, schema_definition: schema_definition, tags: tags)
        create_schema(input)
      end

      def create_schema(input : Types::CreateSchemaInput) : Types::CreateSchemaResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSchemaResponse, "CreateSchema")
      end

      # Transforms a directed acyclic graph (DAG) into code.

      def create_script(
        dag_edges : Array(Types::CodeGenEdge)? = nil,
        dag_nodes : Array(Types::CodeGenNode)? = nil,
        language : String? = nil
      ) : Types::CreateScriptResponse

        input = Types::CreateScriptRequest.new(dag_edges: dag_edges, dag_nodes: dag_nodes, language: language)
        create_script(input)
      end

      def create_script(input : Types::CreateScriptRequest) : Types::CreateScriptResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SCRIPT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateScriptResponse, "CreateScript")
      end

      # Creates a new security configuration. A security configuration is a set of security properties that
      # can be used by Glue. You can use a security configuration to encrypt data at rest. For information
      # about using security configurations in Glue, see Encrypting Data Written by Crawlers, Jobs, and
      # Development Endpoints .

      def create_security_configuration(
        encryption_configuration : Types::EncryptionConfiguration,
        name : String
      ) : Types::CreateSecurityConfigurationResponse

        input = Types::CreateSecurityConfigurationRequest.new(encryption_configuration: encryption_configuration, name: name)
        create_security_configuration(input)
      end

      def create_security_configuration(input : Types::CreateSecurityConfigurationRequest) : Types::CreateSecurityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SECURITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSecurityConfigurationResponse, "CreateSecurityConfiguration")
      end

      # Creates a new session.

      def create_session(
        command : Types::SessionCommand,
        id : String,
        role : String,
        connections : Types::ConnectionsList? = nil,
        default_arguments : Hash(String, String)? = nil,
        description : String? = nil,
        glue_version : String? = nil,
        idle_timeout : Int32? = nil,
        max_capacity : Float64? = nil,
        number_of_workers : Int32? = nil,
        request_origin : String? = nil,
        security_configuration : String? = nil,
        tags : Hash(String, String)? = nil,
        timeout : Int32? = nil,
        worker_type : String? = nil
      ) : Types::CreateSessionResponse

        input = Types::CreateSessionRequest.new(command: command, id: id, role: role, connections: connections, default_arguments: default_arguments, description: description, glue_version: glue_version, idle_timeout: idle_timeout, max_capacity: max_capacity, number_of_workers: number_of_workers, request_origin: request_origin, security_configuration: security_configuration, tags: tags, timeout: timeout, worker_type: worker_type)
        create_session(input)
      end

      def create_session(input : Types::CreateSessionRequest) : Types::CreateSessionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSessionResponse, "CreateSession")
      end

      # Creates a new table definition in the Data Catalog.

      def create_table(
        database_name : String,
        catalog_id : String? = nil,
        name : String? = nil,
        open_table_format_input : Types::OpenTableFormatInput? = nil,
        partition_indexes : Array(Types::PartitionIndex)? = nil,
        table_input : Types::TableInput? = nil,
        transaction_id : String? = nil
      ) : Types::CreateTableResponse

        input = Types::CreateTableRequest.new(database_name: database_name, catalog_id: catalog_id, name: name, open_table_format_input: open_table_format_input, partition_indexes: partition_indexes, table_input: table_input, transaction_id: transaction_id)
        create_table(input)
      end

      def create_table(input : Types::CreateTableRequest) : Types::CreateTableResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTableResponse, "CreateTable")
      end

      # Creates a new table optimizer for a specific function.

      def create_table_optimizer(
        catalog_id : String,
        database_name : String,
        table_name : String,
        table_optimizer_configuration : Types::TableOptimizerConfiguration,
        type : String
      ) : Types::CreateTableOptimizerResponse

        input = Types::CreateTableOptimizerRequest.new(catalog_id: catalog_id, database_name: database_name, table_name: table_name, table_optimizer_configuration: table_optimizer_configuration, type: type)
        create_table_optimizer(input)
      end

      def create_table_optimizer(input : Types::CreateTableOptimizerRequest) : Types::CreateTableOptimizerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TABLE_OPTIMIZER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTableOptimizerResponse, "CreateTableOptimizer")
      end

      # Creates a new trigger. Job arguments may be logged. Do not pass plaintext secrets as arguments.
      # Retrieve secrets from a Glue Connection, Amazon Web Services Secrets Manager or other secret
      # management mechanism if you intend to keep them within the Job.

      def create_trigger(
        actions : Array(Types::Action),
        name : String,
        type : String,
        description : String? = nil,
        event_batching_condition : Types::EventBatchingCondition? = nil,
        predicate : Types::Predicate? = nil,
        schedule : String? = nil,
        start_on_creation : Bool? = nil,
        tags : Hash(String, String)? = nil,
        workflow_name : String? = nil
      ) : Types::CreateTriggerResponse

        input = Types::CreateTriggerRequest.new(actions: actions, name: name, type: type, description: description, event_batching_condition: event_batching_condition, predicate: predicate, schedule: schedule, start_on_creation: start_on_creation, tags: tags, workflow_name: workflow_name)
        create_trigger(input)
      end

      def create_trigger(input : Types::CreateTriggerRequest) : Types::CreateTriggerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRIGGER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTriggerResponse, "CreateTrigger")
      end

      # Creates an Glue usage profile.

      def create_usage_profile(
        configuration : Types::ProfileConfiguration,
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateUsageProfileResponse

        input = Types::CreateUsageProfileRequest.new(configuration: configuration, name: name, description: description, tags: tags)
        create_usage_profile(input)
      end

      def create_usage_profile(input : Types::CreateUsageProfileRequest) : Types::CreateUsageProfileResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USAGE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUsageProfileResponse, "CreateUsageProfile")
      end

      # Creates a new function definition in the Data Catalog.

      def create_user_defined_function(
        database_name : String,
        function_input : Types::UserDefinedFunctionInput,
        catalog_id : String? = nil
      ) : Types::CreateUserDefinedFunctionResponse

        input = Types::CreateUserDefinedFunctionRequest.new(database_name: database_name, function_input: function_input, catalog_id: catalog_id)
        create_user_defined_function(input)
      end

      def create_user_defined_function(input : Types::CreateUserDefinedFunctionRequest) : Types::CreateUserDefinedFunctionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER_DEFINED_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserDefinedFunctionResponse, "CreateUserDefinedFunction")
      end

      # Creates a new workflow.

      def create_workflow(
        name : String,
        default_run_properties : Hash(String, String)? = nil,
        description : String? = nil,
        max_concurrent_runs : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateWorkflowResponse

        input = Types::CreateWorkflowRequest.new(name: name, default_run_properties: default_run_properties, description: description, max_concurrent_runs: max_concurrent_runs, tags: tags)
        create_workflow(input)
      end

      def create_workflow(input : Types::CreateWorkflowRequest) : Types::CreateWorkflowResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkflowResponse, "CreateWorkflow")
      end

      # Deletes an existing blueprint.

      def delete_blueprint(
        name : String
      ) : Types::DeleteBlueprintResponse

        input = Types::DeleteBlueprintRequest.new(name: name)
        delete_blueprint(input)
      end

      def delete_blueprint(input : Types::DeleteBlueprintRequest) : Types::DeleteBlueprintResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BLUEPRINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBlueprintResponse, "DeleteBlueprint")
      end

      # Removes the specified catalog from the Glue Data Catalog. After completing this operation, you no
      # longer have access to the databases, tables (and all table versions and partitions that might belong
      # to the tables) and the user-defined functions in the deleted catalog. Glue deletes these "orphaned"
      # resources asynchronously in a timely manner, at the discretion of the service. To ensure the
      # immediate deletion of all related resources before calling the DeleteCatalog operation, use
      # DeleteTableVersion (or BatchDeleteTableVersion ), DeletePartition (or BatchDeletePartition ),
      # DeleteTable (or BatchDeleteTable ), DeleteUserDefinedFunction and DeleteDatabase to delete any
      # resources that belong to the catalog.

      def delete_catalog(
        catalog_id : String
      ) : Types::DeleteCatalogResponse

        input = Types::DeleteCatalogRequest.new(catalog_id: catalog_id)
        delete_catalog(input)
      end

      def delete_catalog(input : Types::DeleteCatalogRequest) : Types::DeleteCatalogResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCatalogResponse, "DeleteCatalog")
      end

      # Removes a classifier from the Data Catalog.

      def delete_classifier(
        name : String
      ) : Types::DeleteClassifierResponse

        input = Types::DeleteClassifierRequest.new(name: name)
        delete_classifier(input)
      end

      def delete_classifier(input : Types::DeleteClassifierRequest) : Types::DeleteClassifierResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLASSIFIER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteClassifierResponse, "DeleteClassifier")
      end

      # Delete the partition column statistics of a column. The Identity and Access Management (IAM)
      # permission required for this operation is DeletePartition .

      def delete_column_statistics_for_partition(
        column_name : String,
        database_name : String,
        partition_values : Array(String),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::DeleteColumnStatisticsForPartitionResponse

        input = Types::DeleteColumnStatisticsForPartitionRequest.new(column_name: column_name, database_name: database_name, partition_values: partition_values, table_name: table_name, catalog_id: catalog_id)
        delete_column_statistics_for_partition(input)
      end

      def delete_column_statistics_for_partition(input : Types::DeleteColumnStatisticsForPartitionRequest) : Types::DeleteColumnStatisticsForPartitionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_COLUMN_STATISTICS_FOR_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteColumnStatisticsForPartitionResponse, "DeleteColumnStatisticsForPartition")
      end

      # Retrieves table statistics of columns. The Identity and Access Management (IAM) permission required
      # for this operation is DeleteTable .

      def delete_column_statistics_for_table(
        column_name : String,
        database_name : String,
        table_name : String,
        catalog_id : String? = nil
      ) : Types::DeleteColumnStatisticsForTableResponse

        input = Types::DeleteColumnStatisticsForTableRequest.new(column_name: column_name, database_name: database_name, table_name: table_name, catalog_id: catalog_id)
        delete_column_statistics_for_table(input)
      end

      def delete_column_statistics_for_table(input : Types::DeleteColumnStatisticsForTableRequest) : Types::DeleteColumnStatisticsForTableResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_COLUMN_STATISTICS_FOR_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteColumnStatisticsForTableResponse, "DeleteColumnStatisticsForTable")
      end

      # Deletes settings for a column statistics task.

      def delete_column_statistics_task_settings(
        database_name : String,
        table_name : String
      ) : Types::DeleteColumnStatisticsTaskSettingsResponse

        input = Types::DeleteColumnStatisticsTaskSettingsRequest.new(database_name: database_name, table_name: table_name)
        delete_column_statistics_task_settings(input)
      end

      def delete_column_statistics_task_settings(input : Types::DeleteColumnStatisticsTaskSettingsRequest) : Types::DeleteColumnStatisticsTaskSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_COLUMN_STATISTICS_TASK_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteColumnStatisticsTaskSettingsResponse, "DeleteColumnStatisticsTaskSettings")
      end

      # Deletes a connection from the Data Catalog.

      def delete_connection(
        connection_name : String,
        catalog_id : String? = nil
      ) : Types::DeleteConnectionResponse

        input = Types::DeleteConnectionRequest.new(connection_name: connection_name, catalog_id: catalog_id)
        delete_connection(input)
      end

      def delete_connection(input : Types::DeleteConnectionRequest) : Types::DeleteConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConnectionResponse, "DeleteConnection")
      end

      # Removes a specified crawler from the Glue Data Catalog, unless the crawler state is RUNNING .

      def delete_crawler(
        name : String
      ) : Types::DeleteCrawlerResponse

        input = Types::DeleteCrawlerRequest.new(name: name)
        delete_crawler(input)
      end

      def delete_crawler(input : Types::DeleteCrawlerRequest) : Types::DeleteCrawlerResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CRAWLER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCrawlerResponse, "DeleteCrawler")
      end

      # Deletes a custom pattern by specifying its name.

      def delete_custom_entity_type(
        name : String
      ) : Types::DeleteCustomEntityTypeResponse

        input = Types::DeleteCustomEntityTypeRequest.new(name: name)
        delete_custom_entity_type(input)
      end

      def delete_custom_entity_type(input : Types::DeleteCustomEntityTypeRequest) : Types::DeleteCustomEntityTypeResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CUSTOM_ENTITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCustomEntityTypeResponse, "DeleteCustomEntityType")
      end

      # Deletes a data quality ruleset.

      def delete_data_quality_ruleset(
        name : String
      ) : Types::DeleteDataQualityRulesetResponse

        input = Types::DeleteDataQualityRulesetRequest.new(name: name)
        delete_data_quality_ruleset(input)
      end

      def delete_data_quality_ruleset(input : Types::DeleteDataQualityRulesetRequest) : Types::DeleteDataQualityRulesetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATA_QUALITY_RULESET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDataQualityRulesetResponse, "DeleteDataQualityRuleset")
      end

      # Removes a specified database from a Data Catalog. After completing this operation, you no longer
      # have access to the tables (and all table versions and partitions that might belong to the tables)
      # and the user-defined functions in the deleted database. Glue deletes these "orphaned" resources
      # asynchronously in a timely manner, at the discretion of the service. To ensure the immediate
      # deletion of all related resources, before calling DeleteDatabase , use DeleteTableVersion or
      # BatchDeleteTableVersion , DeletePartition or BatchDeletePartition , DeleteUserDefinedFunction , and
      # DeleteTable or BatchDeleteTable , to delete any resources that belong to the database.

      def delete_database(
        name : String,
        catalog_id : String? = nil
      ) : Types::DeleteDatabaseResponse

        input = Types::DeleteDatabaseRequest.new(name: name, catalog_id: catalog_id)
        delete_database(input)
      end

      def delete_database(input : Types::DeleteDatabaseRequest) : Types::DeleteDatabaseResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDatabaseResponse, "DeleteDatabase")
      end

      # Deletes a specified development endpoint.

      def delete_dev_endpoint(
        endpoint_name : String
      ) : Types::DeleteDevEndpointResponse

        input = Types::DeleteDevEndpointRequest.new(endpoint_name: endpoint_name)
        delete_dev_endpoint(input)
      end

      def delete_dev_endpoint(input : Types::DeleteDevEndpointRequest) : Types::DeleteDevEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DEV_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDevEndpointResponse, "DeleteDevEndpoint")
      end

      # Deletes the existing Glue Identity Center configuration, removing the integration between Glue and
      # Amazon Web Services IAM Identity Center.

      def delete_glue_identity_center_configuration : Types::DeleteGlueIdentityCenterConfigurationResponse
        input = Types::DeleteGlueIdentityCenterConfigurationRequest.new
        delete_glue_identity_center_configuration(input)
      end

      def delete_glue_identity_center_configuration(input : Types::DeleteGlueIdentityCenterConfigurationRequest) : Types::DeleteGlueIdentityCenterConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_GLUE_IDENTITY_CENTER_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGlueIdentityCenterConfigurationResponse, "DeleteGlueIdentityCenterConfiguration")
      end

      # Deletes the specified Zero-ETL integration.

      def delete_integration(
        integration_identifier : String
      ) : Types::DeleteIntegrationResponse

        input = Types::DeleteIntegrationRequest.new(integration_identifier: integration_identifier)
        delete_integration(input)
      end

      def delete_integration(input : Types::DeleteIntegrationRequest) : Types::DeleteIntegrationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INTEGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIntegrationResponse, "DeleteIntegration")
      end

      # This API is used for deleting the ResourceProperty of the Glue connection (for the source) or Glue
      # database ARN (for the target).

      def delete_integration_resource_property(
        resource_arn : String
      ) : Types::DeleteIntegrationResourcePropertyResponse

        input = Types::DeleteIntegrationResourcePropertyRequest.new(resource_arn: resource_arn)
        delete_integration_resource_property(input)
      end

      def delete_integration_resource_property(input : Types::DeleteIntegrationResourcePropertyRequest) : Types::DeleteIntegrationResourcePropertyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INTEGRATION_RESOURCE_PROPERTY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIntegrationResourcePropertyResponse, "DeleteIntegrationResourceProperty")
      end

      # Deletes the table properties that have been created for the tables that need to be replicated.

      def delete_integration_table_properties(
        resource_arn : String,
        table_name : String
      ) : Types::DeleteIntegrationTablePropertiesResponse

        input = Types::DeleteIntegrationTablePropertiesRequest.new(resource_arn: resource_arn, table_name: table_name)
        delete_integration_table_properties(input)
      end

      def delete_integration_table_properties(input : Types::DeleteIntegrationTablePropertiesRequest) : Types::DeleteIntegrationTablePropertiesResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INTEGRATION_TABLE_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIntegrationTablePropertiesResponse, "DeleteIntegrationTableProperties")
      end

      # Deletes a specified job definition. If the job definition is not found, no exception is thrown.

      def delete_job(
        job_name : String
      ) : Types::DeleteJobResponse

        input = Types::DeleteJobRequest.new(job_name: job_name)
        delete_job(input)
      end

      def delete_job(input : Types::DeleteJobRequest) : Types::DeleteJobResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteJobResponse, "DeleteJob")
      end

      # Deletes an Glue machine learning transform. Machine learning transforms are a special type of
      # transform that use machine learning to learn the details of the transformation to be performed by
      # learning from examples provided by humans. These transformations are then saved by Glue. If you no
      # longer need a transform, you can delete it by calling DeleteMLTransforms . However, any Glue jobs
      # that still reference the deleted transform will no longer succeed.

      def delete_ml_transform(
        transform_id : String
      ) : Types::DeleteMLTransformResponse

        input = Types::DeleteMLTransformRequest.new(transform_id: transform_id)
        delete_ml_transform(input)
      end

      def delete_ml_transform(input : Types::DeleteMLTransformRequest) : Types::DeleteMLTransformResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ML_TRANSFORM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMLTransformResponse, "DeleteMLTransform")
      end

      # Deletes a specified partition.

      def delete_partition(
        database_name : String,
        partition_values : Array(String),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::DeletePartitionResponse

        input = Types::DeletePartitionRequest.new(database_name: database_name, partition_values: partition_values, table_name: table_name, catalog_id: catalog_id)
        delete_partition(input)
      end

      def delete_partition(input : Types::DeletePartitionRequest) : Types::DeletePartitionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePartitionResponse, "DeletePartition")
      end

      # Deletes a specified partition index from an existing table.

      def delete_partition_index(
        database_name : String,
        index_name : String,
        table_name : String,
        catalog_id : String? = nil
      ) : Types::DeletePartitionIndexResponse

        input = Types::DeletePartitionIndexRequest.new(database_name: database_name, index_name: index_name, table_name: table_name, catalog_id: catalog_id)
        delete_partition_index(input)
      end

      def delete_partition_index(input : Types::DeletePartitionIndexRequest) : Types::DeletePartitionIndexResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PARTITION_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePartitionIndexResponse, "DeletePartitionIndex")
      end

      # Delete the entire registry including schema and all of its versions. To get the status of the delete
      # operation, you can call the GetRegistry API after the asynchronous call. Deleting a registry will
      # deactivate all online operations for the registry such as the UpdateRegistry , CreateSchema ,
      # UpdateSchema , and RegisterSchemaVersion APIs.

      def delete_registry(
        registry_id : Types::RegistryId
      ) : Types::DeleteRegistryResponse

        input = Types::DeleteRegistryInput.new(registry_id: registry_id)
        delete_registry(input)
      end

      def delete_registry(input : Types::DeleteRegistryInput) : Types::DeleteRegistryResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REGISTRY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRegistryResponse, "DeleteRegistry")
      end

      # Deletes a specified policy.

      def delete_resource_policy(
        policy_hash_condition : String? = nil,
        resource_arn : String? = nil
      ) : Types::DeleteResourcePolicyResponse

        input = Types::DeleteResourcePolicyRequest.new(policy_hash_condition: policy_hash_condition, resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Types::DeleteResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcePolicyResponse, "DeleteResourcePolicy")
      end

      # Deletes the entire schema set, including the schema set and all of its versions. To get the status
      # of the delete operation, you can call GetSchema API after the asynchronous call. Deleting a registry
      # will deactivate all online operations for the schema, such as the GetSchemaByDefinition , and
      # RegisterSchemaVersion APIs.

      def delete_schema(
        schema_id : Types::SchemaId
      ) : Types::DeleteSchemaResponse

        input = Types::DeleteSchemaInput.new(schema_id: schema_id)
        delete_schema(input)
      end

      def delete_schema(input : Types::DeleteSchemaInput) : Types::DeleteSchemaResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSchemaResponse, "DeleteSchema")
      end

      # Remove versions from the specified schema. A version number or range may be supplied. If the
      # compatibility mode forbids deleting of a version that is necessary, such as BACKWARDS_FULL, an error
      # is returned. Calling the GetSchemaVersions API after this call will list the status of the deleted
      # versions. When the range of version numbers contain check pointed version, the API will return a 409
      # conflict and will not proceed with the deletion. You have to remove the checkpoint first using the
      # DeleteSchemaCheckpoint API before using this API. You cannot use the DeleteSchemaVersions API to
      # delete the first schema version in the schema set. The first schema version can only be deleted by
      # the DeleteSchema API. This operation will also delete the attached SchemaVersionMetadata under the
      # schema versions. Hard deletes will be enforced on the database. If the compatibility mode forbids
      # deleting of a version that is necessary, such as BACKWARDS_FULL, an error is returned.

      def delete_schema_versions(
        schema_id : Types::SchemaId,
        versions : String
      ) : Types::DeleteSchemaVersionsResponse

        input = Types::DeleteSchemaVersionsInput.new(schema_id: schema_id, versions: versions)
        delete_schema_versions(input)
      end

      def delete_schema_versions(input : Types::DeleteSchemaVersionsInput) : Types::DeleteSchemaVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCHEMA_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSchemaVersionsResponse, "DeleteSchemaVersions")
      end

      # Deletes a specified security configuration.

      def delete_security_configuration(
        name : String
      ) : Types::DeleteSecurityConfigurationResponse

        input = Types::DeleteSecurityConfigurationRequest.new(name: name)
        delete_security_configuration(input)
      end

      def delete_security_configuration(input : Types::DeleteSecurityConfigurationRequest) : Types::DeleteSecurityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SECURITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSecurityConfigurationResponse, "DeleteSecurityConfiguration")
      end

      # Deletes the session.

      def delete_session(
        id : String,
        request_origin : String? = nil
      ) : Types::DeleteSessionResponse

        input = Types::DeleteSessionRequest.new(id: id, request_origin: request_origin)
        delete_session(input)
      end

      def delete_session(input : Types::DeleteSessionRequest) : Types::DeleteSessionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSessionResponse, "DeleteSession")
      end

      # Removes a table definition from the Data Catalog. After completing this operation, you no longer
      # have access to the table versions and partitions that belong to the deleted table. Glue deletes
      # these "orphaned" resources asynchronously in a timely manner, at the discretion of the service. To
      # ensure the immediate deletion of all related resources, before calling DeleteTable , use
      # DeleteTableVersion or BatchDeleteTableVersion , and DeletePartition or BatchDeletePartition , to
      # delete any resources that belong to the table.

      def delete_table(
        database_name : String,
        name : String,
        catalog_id : String? = nil,
        transaction_id : String? = nil
      ) : Types::DeleteTableResponse

        input = Types::DeleteTableRequest.new(database_name: database_name, name: name, catalog_id: catalog_id, transaction_id: transaction_id)
        delete_table(input)
      end

      def delete_table(input : Types::DeleteTableRequest) : Types::DeleteTableResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTableResponse, "DeleteTable")
      end

      # Deletes an optimizer and all associated metadata for a table. The optimization will no longer be
      # performed on the table.

      def delete_table_optimizer(
        catalog_id : String,
        database_name : String,
        table_name : String,
        type : String
      ) : Types::DeleteTableOptimizerResponse

        input = Types::DeleteTableOptimizerRequest.new(catalog_id: catalog_id, database_name: database_name, table_name: table_name, type: type)
        delete_table_optimizer(input)
      end

      def delete_table_optimizer(input : Types::DeleteTableOptimizerRequest) : Types::DeleteTableOptimizerResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TABLE_OPTIMIZER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTableOptimizerResponse, "DeleteTableOptimizer")
      end

      # Deletes a specified version of a table.

      def delete_table_version(
        database_name : String,
        table_name : String,
        version_id : String,
        catalog_id : String? = nil
      ) : Types::DeleteTableVersionResponse

        input = Types::DeleteTableVersionRequest.new(database_name: database_name, table_name: table_name, version_id: version_id, catalog_id: catalog_id)
        delete_table_version(input)
      end

      def delete_table_version(input : Types::DeleteTableVersionRequest) : Types::DeleteTableVersionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TABLE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTableVersionResponse, "DeleteTableVersion")
      end

      # Deletes a specified trigger. If the trigger is not found, no exception is thrown.

      def delete_trigger(
        name : String
      ) : Types::DeleteTriggerResponse

        input = Types::DeleteTriggerRequest.new(name: name)
        delete_trigger(input)
      end

      def delete_trigger(input : Types::DeleteTriggerRequest) : Types::DeleteTriggerResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRIGGER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTriggerResponse, "DeleteTrigger")
      end

      # Deletes the Glue specified usage profile.

      def delete_usage_profile(
        name : String
      ) : Types::DeleteUsageProfileResponse

        input = Types::DeleteUsageProfileRequest.new(name: name)
        delete_usage_profile(input)
      end

      def delete_usage_profile(input : Types::DeleteUsageProfileRequest) : Types::DeleteUsageProfileResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_USAGE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUsageProfileResponse, "DeleteUsageProfile")
      end

      # Deletes an existing function definition from the Data Catalog.

      def delete_user_defined_function(
        database_name : String,
        function_name : String,
        catalog_id : String? = nil
      ) : Types::DeleteUserDefinedFunctionResponse

        input = Types::DeleteUserDefinedFunctionRequest.new(database_name: database_name, function_name: function_name, catalog_id: catalog_id)
        delete_user_defined_function(input)
      end

      def delete_user_defined_function(input : Types::DeleteUserDefinedFunctionRequest) : Types::DeleteUserDefinedFunctionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER_DEFINED_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUserDefinedFunctionResponse, "DeleteUserDefinedFunction")
      end

      # Deletes a workflow.

      def delete_workflow(
        name : String
      ) : Types::DeleteWorkflowResponse

        input = Types::DeleteWorkflowRequest.new(name: name)
        delete_workflow(input)
      end

      def delete_workflow(input : Types::DeleteWorkflowRequest) : Types::DeleteWorkflowResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkflowResponse, "DeleteWorkflow")
      end

      # The DescribeConnectionType API provides full details of the supported options for a given connection
      # type in Glue.

      def describe_connection_type(
        connection_type : String
      ) : Types::DescribeConnectionTypeResponse

        input = Types::DescribeConnectionTypeRequest.new(connection_type: connection_type)
        describe_connection_type(input)
      end

      def describe_connection_type(input : Types::DescribeConnectionTypeRequest) : Types::DescribeConnectionTypeResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONNECTION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConnectionTypeResponse, "DescribeConnectionType")
      end

      # Provides details regarding the entity used with the connection type, with a description of the data
      # model for each field in the selected entity. The response includes all the fields which make up the
      # entity.

      def describe_entity(
        connection_name : String,
        entity_name : String,
        catalog_id : String? = nil,
        data_store_api_version : String? = nil,
        next_token : String? = nil
      ) : Types::DescribeEntityResponse

        input = Types::DescribeEntityRequest.new(connection_name: connection_name, entity_name: entity_name, catalog_id: catalog_id, data_store_api_version: data_store_api_version, next_token: next_token)
        describe_entity(input)
      end

      def describe_entity(input : Types::DescribeEntityRequest) : Types::DescribeEntityResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEntityResponse, "DescribeEntity")
      end

      # Returns a list of inbound integrations for the specified integration.

      def describe_inbound_integrations(
        integration_arn : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil,
        target_arn : String? = nil
      ) : Types::DescribeInboundIntegrationsResponse

        input = Types::DescribeInboundIntegrationsRequest.new(integration_arn: integration_arn, marker: marker, max_records: max_records, target_arn: target_arn)
        describe_inbound_integrations(input)
      end

      def describe_inbound_integrations(input : Types::DescribeInboundIntegrationsRequest) : Types::DescribeInboundIntegrationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INBOUND_INTEGRATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInboundIntegrationsResponse, "DescribeInboundIntegrations")
      end

      # The API is used to retrieve a list of integrations.

      def describe_integrations(
        filters : Array(Types::IntegrationFilter)? = nil,
        integration_identifier : String? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::DescribeIntegrationsResponse

        input = Types::DescribeIntegrationsRequest.new(filters: filters, integration_identifier: integration_identifier, marker: marker, max_records: max_records)
        describe_integrations(input)
      end

      def describe_integrations(input : Types::DescribeIntegrationsRequest) : Types::DescribeIntegrationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INTEGRATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeIntegrationsResponse, "DescribeIntegrations")
      end

      # Retrieves the details of a blueprint.

      def get_blueprint(
        name : String,
        include_blueprint : Bool? = nil,
        include_parameter_spec : Bool? = nil
      ) : Types::GetBlueprintResponse

        input = Types::GetBlueprintRequest.new(name: name, include_blueprint: include_blueprint, include_parameter_spec: include_parameter_spec)
        get_blueprint(input)
      end

      def get_blueprint(input : Types::GetBlueprintRequest) : Types::GetBlueprintResponse
        request = Protocol::JsonRpc.build_request(Model::GET_BLUEPRINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBlueprintResponse, "GetBlueprint")
      end

      # Retrieves the details of a blueprint run.

      def get_blueprint_run(
        blueprint_name : String,
        run_id : String
      ) : Types::GetBlueprintRunResponse

        input = Types::GetBlueprintRunRequest.new(blueprint_name: blueprint_name, run_id: run_id)
        get_blueprint_run(input)
      end

      def get_blueprint_run(input : Types::GetBlueprintRunRequest) : Types::GetBlueprintRunResponse
        request = Protocol::JsonRpc.build_request(Model::GET_BLUEPRINT_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBlueprintRunResponse, "GetBlueprintRun")
      end

      # Retrieves the details of blueprint runs for a specified blueprint.

      def get_blueprint_runs(
        blueprint_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetBlueprintRunsResponse

        input = Types::GetBlueprintRunsRequest.new(blueprint_name: blueprint_name, max_results: max_results, next_token: next_token)
        get_blueprint_runs(input)
      end

      def get_blueprint_runs(input : Types::GetBlueprintRunsRequest) : Types::GetBlueprintRunsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_BLUEPRINT_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBlueprintRunsResponse, "GetBlueprintRuns")
      end

      # The name of the Catalog to retrieve. This should be all lowercase.

      def get_catalog(
        catalog_id : String
      ) : Types::GetCatalogResponse

        input = Types::GetCatalogRequest.new(catalog_id: catalog_id)
        get_catalog(input)
      end

      def get_catalog(input : Types::GetCatalogRequest) : Types::GetCatalogResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCatalogResponse, "GetCatalog")
      end

      # Retrieves the status of a migration operation.

      def get_catalog_import_status(
        catalog_id : String? = nil
      ) : Types::GetCatalogImportStatusResponse

        input = Types::GetCatalogImportStatusRequest.new(catalog_id: catalog_id)
        get_catalog_import_status(input)
      end

      def get_catalog_import_status(input : Types::GetCatalogImportStatusRequest) : Types::GetCatalogImportStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CATALOG_IMPORT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCatalogImportStatusResponse, "GetCatalogImportStatus")
      end

      # Retrieves all catalogs defined in a catalog in the Glue Data Catalog. For a Redshift-federated
      # catalog use case, this operation returns the list of catalogs mapped to Redshift databases in the
      # Redshift namespace catalog.

      def get_catalogs(
        include_root : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        parent_catalog_id : String? = nil,
        recursive : Bool? = nil
      ) : Types::GetCatalogsResponse

        input = Types::GetCatalogsRequest.new(include_root: include_root, max_results: max_results, next_token: next_token, parent_catalog_id: parent_catalog_id, recursive: recursive)
        get_catalogs(input)
      end

      def get_catalogs(input : Types::GetCatalogsRequest) : Types::GetCatalogsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CATALOGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCatalogsResponse, "GetCatalogs")
      end

      # Retrieve a classifier by name.

      def get_classifier(
        name : String
      ) : Types::GetClassifierResponse

        input = Types::GetClassifierRequest.new(name: name)
        get_classifier(input)
      end

      def get_classifier(input : Types::GetClassifierRequest) : Types::GetClassifierResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CLASSIFIER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetClassifierResponse, "GetClassifier")
      end

      # Lists all classifier objects in the Data Catalog.

      def get_classifiers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetClassifiersResponse

        input = Types::GetClassifiersRequest.new(max_results: max_results, next_token: next_token)
        get_classifiers(input)
      end

      def get_classifiers(input : Types::GetClassifiersRequest) : Types::GetClassifiersResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CLASSIFIERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetClassifiersResponse, "GetClassifiers")
      end

      # Retrieves partition statistics of columns. The Identity and Access Management (IAM) permission
      # required for this operation is GetPartition .

      def get_column_statistics_for_partition(
        column_names : Array(String),
        database_name : String,
        partition_values : Array(String),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::GetColumnStatisticsForPartitionResponse

        input = Types::GetColumnStatisticsForPartitionRequest.new(column_names: column_names, database_name: database_name, partition_values: partition_values, table_name: table_name, catalog_id: catalog_id)
        get_column_statistics_for_partition(input)
      end

      def get_column_statistics_for_partition(input : Types::GetColumnStatisticsForPartitionRequest) : Types::GetColumnStatisticsForPartitionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COLUMN_STATISTICS_FOR_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetColumnStatisticsForPartitionResponse, "GetColumnStatisticsForPartition")
      end

      # Retrieves table statistics of columns. The Identity and Access Management (IAM) permission required
      # for this operation is GetTable .

      def get_column_statistics_for_table(
        column_names : Array(String),
        database_name : String,
        table_name : String,
        catalog_id : String? = nil
      ) : Types::GetColumnStatisticsForTableResponse

        input = Types::GetColumnStatisticsForTableRequest.new(column_names: column_names, database_name: database_name, table_name: table_name, catalog_id: catalog_id)
        get_column_statistics_for_table(input)
      end

      def get_column_statistics_for_table(input : Types::GetColumnStatisticsForTableRequest) : Types::GetColumnStatisticsForTableResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COLUMN_STATISTICS_FOR_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetColumnStatisticsForTableResponse, "GetColumnStatisticsForTable")
      end

      # Get the associated metadata/information for a task run, given a task run ID.

      def get_column_statistics_task_run(
        column_statistics_task_run_id : String
      ) : Types::GetColumnStatisticsTaskRunResponse

        input = Types::GetColumnStatisticsTaskRunRequest.new(column_statistics_task_run_id: column_statistics_task_run_id)
        get_column_statistics_task_run(input)
      end

      def get_column_statistics_task_run(input : Types::GetColumnStatisticsTaskRunRequest) : Types::GetColumnStatisticsTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COLUMN_STATISTICS_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetColumnStatisticsTaskRunResponse, "GetColumnStatisticsTaskRun")
      end

      # Retrieves information about all runs associated with the specified table.

      def get_column_statistics_task_runs(
        database_name : String,
        table_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetColumnStatisticsTaskRunsResponse

        input = Types::GetColumnStatisticsTaskRunsRequest.new(database_name: database_name, table_name: table_name, max_results: max_results, next_token: next_token)
        get_column_statistics_task_runs(input)
      end

      def get_column_statistics_task_runs(input : Types::GetColumnStatisticsTaskRunsRequest) : Types::GetColumnStatisticsTaskRunsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COLUMN_STATISTICS_TASK_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetColumnStatisticsTaskRunsResponse, "GetColumnStatisticsTaskRuns")
      end

      # Gets settings for a column statistics task.

      def get_column_statistics_task_settings(
        database_name : String,
        table_name : String
      ) : Types::GetColumnStatisticsTaskSettingsResponse

        input = Types::GetColumnStatisticsTaskSettingsRequest.new(database_name: database_name, table_name: table_name)
        get_column_statistics_task_settings(input)
      end

      def get_column_statistics_task_settings(input : Types::GetColumnStatisticsTaskSettingsRequest) : Types::GetColumnStatisticsTaskSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COLUMN_STATISTICS_TASK_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetColumnStatisticsTaskSettingsResponse, "GetColumnStatisticsTaskSettings")
      end

      # Retrieves a connection definition from the Data Catalog.

      def get_connection(
        name : String,
        apply_override_for_compute_environment : String? = nil,
        catalog_id : String? = nil,
        hide_password : Bool? = nil
      ) : Types::GetConnectionResponse

        input = Types::GetConnectionRequest.new(name: name, apply_override_for_compute_environment: apply_override_for_compute_environment, catalog_id: catalog_id, hide_password: hide_password)
        get_connection(input)
      end

      def get_connection(input : Types::GetConnectionRequest) : Types::GetConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConnectionResponse, "GetConnection")
      end

      # Retrieves a list of connection definitions from the Data Catalog.

      def get_connections(
        catalog_id : String? = nil,
        filter : Types::GetConnectionsFilter? = nil,
        hide_password : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetConnectionsResponse

        input = Types::GetConnectionsRequest.new(catalog_id: catalog_id, filter: filter, hide_password: hide_password, max_results: max_results, next_token: next_token)
        get_connections(input)
      end

      def get_connections(input : Types::GetConnectionsRequest) : Types::GetConnectionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConnectionsResponse, "GetConnections")
      end

      # Retrieves metadata for a specified crawler.

      def get_crawler(
        name : String
      ) : Types::GetCrawlerResponse

        input = Types::GetCrawlerRequest.new(name: name)
        get_crawler(input)
      end

      def get_crawler(input : Types::GetCrawlerRequest) : Types::GetCrawlerResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CRAWLER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCrawlerResponse, "GetCrawler")
      end

      # Retrieves metrics about specified crawlers.

      def get_crawler_metrics(
        crawler_name_list : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetCrawlerMetricsResponse

        input = Types::GetCrawlerMetricsRequest.new(crawler_name_list: crawler_name_list, max_results: max_results, next_token: next_token)
        get_crawler_metrics(input)
      end

      def get_crawler_metrics(input : Types::GetCrawlerMetricsRequest) : Types::GetCrawlerMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CRAWLER_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCrawlerMetricsResponse, "GetCrawlerMetrics")
      end

      # Retrieves metadata for all crawlers defined in the customer account.

      def get_crawlers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetCrawlersResponse

        input = Types::GetCrawlersRequest.new(max_results: max_results, next_token: next_token)
        get_crawlers(input)
      end

      def get_crawlers(input : Types::GetCrawlersRequest) : Types::GetCrawlersResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CRAWLERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCrawlersResponse, "GetCrawlers")
      end

      # Retrieves the details of a custom pattern by specifying its name.

      def get_custom_entity_type(
        name : String
      ) : Types::GetCustomEntityTypeResponse

        input = Types::GetCustomEntityTypeRequest.new(name: name)
        get_custom_entity_type(input)
      end

      def get_custom_entity_type(input : Types::GetCustomEntityTypeRequest) : Types::GetCustomEntityTypeResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CUSTOM_ENTITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCustomEntityTypeResponse, "GetCustomEntityType")
      end

      # Retrieves the security configuration for a specified catalog.

      def get_data_catalog_encryption_settings(
        catalog_id : String? = nil
      ) : Types::GetDataCatalogEncryptionSettingsResponse

        input = Types::GetDataCatalogEncryptionSettingsRequest.new(catalog_id: catalog_id)
        get_data_catalog_encryption_settings(input)
      end

      def get_data_catalog_encryption_settings(input : Types::GetDataCatalogEncryptionSettingsRequest) : Types::GetDataCatalogEncryptionSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_CATALOG_ENCRYPTION_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataCatalogEncryptionSettingsResponse, "GetDataCatalogEncryptionSettings")
      end

      # Retrieve the training status of the model along with more information (CompletedOn, StartedOn,
      # FailureReason).

      def get_data_quality_model(
        profile_id : String,
        statistic_id : String? = nil
      ) : Types::GetDataQualityModelResponse

        input = Types::GetDataQualityModelRequest.new(profile_id: profile_id, statistic_id: statistic_id)
        get_data_quality_model(input)
      end

      def get_data_quality_model(input : Types::GetDataQualityModelRequest) : Types::GetDataQualityModelResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_QUALITY_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataQualityModelResponse, "GetDataQualityModel")
      end

      # Retrieve a statistic's predictions for a given Profile ID.

      def get_data_quality_model_result(
        profile_id : String,
        statistic_id : String
      ) : Types::GetDataQualityModelResultResponse

        input = Types::GetDataQualityModelResultRequest.new(profile_id: profile_id, statistic_id: statistic_id)
        get_data_quality_model_result(input)
      end

      def get_data_quality_model_result(input : Types::GetDataQualityModelResultRequest) : Types::GetDataQualityModelResultResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_QUALITY_MODEL_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataQualityModelResultResponse, "GetDataQualityModelResult")
      end

      # Retrieves the result of a data quality rule evaluation.

      def get_data_quality_result(
        result_id : String
      ) : Types::GetDataQualityResultResponse

        input = Types::GetDataQualityResultRequest.new(result_id: result_id)
        get_data_quality_result(input)
      end

      def get_data_quality_result(input : Types::GetDataQualityResultRequest) : Types::GetDataQualityResultResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_QUALITY_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataQualityResultResponse, "GetDataQualityResult")
      end

      # Gets the specified recommendation run that was used to generate rules.

      def get_data_quality_rule_recommendation_run(
        run_id : String
      ) : Types::GetDataQualityRuleRecommendationRunResponse

        input = Types::GetDataQualityRuleRecommendationRunRequest.new(run_id: run_id)
        get_data_quality_rule_recommendation_run(input)
      end

      def get_data_quality_rule_recommendation_run(input : Types::GetDataQualityRuleRecommendationRunRequest) : Types::GetDataQualityRuleRecommendationRunResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_QUALITY_RULE_RECOMMENDATION_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataQualityRuleRecommendationRunResponse, "GetDataQualityRuleRecommendationRun")
      end

      # Returns an existing ruleset by identifier or name.

      def get_data_quality_ruleset(
        name : String
      ) : Types::GetDataQualityRulesetResponse

        input = Types::GetDataQualityRulesetRequest.new(name: name)
        get_data_quality_ruleset(input)
      end

      def get_data_quality_ruleset(input : Types::GetDataQualityRulesetRequest) : Types::GetDataQualityRulesetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_QUALITY_RULESET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataQualityRulesetResponse, "GetDataQualityRuleset")
      end

      # Retrieves a specific run where a ruleset is evaluated against a data source.

      def get_data_quality_ruleset_evaluation_run(
        run_id : String
      ) : Types::GetDataQualityRulesetEvaluationRunResponse

        input = Types::GetDataQualityRulesetEvaluationRunRequest.new(run_id: run_id)
        get_data_quality_ruleset_evaluation_run(input)
      end

      def get_data_quality_ruleset_evaluation_run(input : Types::GetDataQualityRulesetEvaluationRunRequest) : Types::GetDataQualityRulesetEvaluationRunResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_QUALITY_RULESET_EVALUATION_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataQualityRulesetEvaluationRunResponse, "GetDataQualityRulesetEvaluationRun")
      end

      # Retrieves the definition of a specified database.

      def get_database(
        name : String,
        catalog_id : String? = nil
      ) : Types::GetDatabaseResponse

        input = Types::GetDatabaseRequest.new(name: name, catalog_id: catalog_id)
        get_database(input)
      end

      def get_database(input : Types::GetDatabaseRequest) : Types::GetDatabaseResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDatabaseResponse, "GetDatabase")
      end

      # Retrieves all databases defined in a given Data Catalog.

      def get_databases(
        attributes_to_get : Array(String)? = nil,
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_share_type : String? = nil
      ) : Types::GetDatabasesResponse

        input = Types::GetDatabasesRequest.new(attributes_to_get: attributes_to_get, catalog_id: catalog_id, max_results: max_results, next_token: next_token, resource_share_type: resource_share_type)
        get_databases(input)
      end

      def get_databases(input : Types::GetDatabasesRequest) : Types::GetDatabasesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATABASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDatabasesResponse, "GetDatabases")
      end

      # Transforms a Python script into a directed acyclic graph (DAG).

      def get_dataflow_graph(
        python_script : String? = nil
      ) : Types::GetDataflowGraphResponse

        input = Types::GetDataflowGraphRequest.new(python_script: python_script)
        get_dataflow_graph(input)
      end

      def get_dataflow_graph(input : Types::GetDataflowGraphRequest) : Types::GetDataflowGraphResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATAFLOW_GRAPH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataflowGraphResponse, "GetDataflowGraph")
      end

      # Retrieves information about a specified development endpoint. When you create a development endpoint
      # in a virtual private cloud (VPC), Glue returns only a private IP address, and the public IP address
      # field is not populated. When you create a non-VPC development endpoint, Glue returns only a public
      # IP address.

      def get_dev_endpoint(
        endpoint_name : String
      ) : Types::GetDevEndpointResponse

        input = Types::GetDevEndpointRequest.new(endpoint_name: endpoint_name)
        get_dev_endpoint(input)
      end

      def get_dev_endpoint(input : Types::GetDevEndpointRequest) : Types::GetDevEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DEV_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDevEndpointResponse, "GetDevEndpoint")
      end

      # Retrieves all the development endpoints in this Amazon Web Services account. When you create a
      # development endpoint in a virtual private cloud (VPC), Glue returns only a private IP address and
      # the public IP address field is not populated. When you create a non-VPC development endpoint, Glue
      # returns only a public IP address.

      def get_dev_endpoints(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetDevEndpointsResponse

        input = Types::GetDevEndpointsRequest.new(max_results: max_results, next_token: next_token)
        get_dev_endpoints(input)
      end

      def get_dev_endpoints(input : Types::GetDevEndpointsRequest) : Types::GetDevEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DEV_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDevEndpointsResponse, "GetDevEndpoints")
      end

      # This API is used to query preview data from a given connection type or from a native Amazon S3 based
      # Glue Data Catalog. Returns records as an array of JSON blobs. Each record is formatted using Jackson
      # JsonNode based on the field type defined by the DescribeEntity API. Spark connectors generate
      # schemas according to the same data type mapping as in the DescribeEntity API. Spark connectors
      # convert data to the appropriate data types matching the schema when returning rows.

      def get_entity_records(
        entity_name : String,
        limit : Int64,
        catalog_id : String? = nil,
        connection_name : String? = nil,
        connection_options : Hash(String, String)? = nil,
        data_store_api_version : String? = nil,
        filter_predicate : String? = nil,
        next_token : String? = nil,
        order_by : String? = nil,
        selected_fields : Array(String)? = nil
      ) : Types::GetEntityRecordsResponse

        input = Types::GetEntityRecordsRequest.new(entity_name: entity_name, limit: limit, catalog_id: catalog_id, connection_name: connection_name, connection_options: connection_options, data_store_api_version: data_store_api_version, filter_predicate: filter_predicate, next_token: next_token, order_by: order_by, selected_fields: selected_fields)
        get_entity_records(input)
      end

      def get_entity_records(input : Types::GetEntityRecordsRequest) : Types::GetEntityRecordsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENTITY_RECORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEntityRecordsResponse, "GetEntityRecords")
      end

      # Retrieves the current Glue Identity Center configuration details, including the associated Identity
      # Center instance and application information.

      def get_glue_identity_center_configuration : Types::GetGlueIdentityCenterConfigurationResponse
        input = Types::GetGlueIdentityCenterConfigurationRequest.new
        get_glue_identity_center_configuration(input)
      end

      def get_glue_identity_center_configuration(input : Types::GetGlueIdentityCenterConfigurationRequest) : Types::GetGlueIdentityCenterConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_GLUE_IDENTITY_CENTER_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetGlueIdentityCenterConfigurationResponse, "GetGlueIdentityCenterConfiguration")
      end

      # This API is used for fetching the ResourceProperty of the Glue connection (for the source) or Glue
      # database ARN (for the target)

      def get_integration_resource_property(
        resource_arn : String
      ) : Types::GetIntegrationResourcePropertyResponse

        input = Types::GetIntegrationResourcePropertyRequest.new(resource_arn: resource_arn)
        get_integration_resource_property(input)
      end

      def get_integration_resource_property(input : Types::GetIntegrationResourcePropertyRequest) : Types::GetIntegrationResourcePropertyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INTEGRATION_RESOURCE_PROPERTY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIntegrationResourcePropertyResponse, "GetIntegrationResourceProperty")
      end

      # This API is used to retrieve optional override properties for the tables that need to be replicated.
      # These properties can include properties for filtering and partition for source and target tables.

      def get_integration_table_properties(
        resource_arn : String,
        table_name : String
      ) : Types::GetIntegrationTablePropertiesResponse

        input = Types::GetIntegrationTablePropertiesRequest.new(resource_arn: resource_arn, table_name: table_name)
        get_integration_table_properties(input)
      end

      def get_integration_table_properties(input : Types::GetIntegrationTablePropertiesRequest) : Types::GetIntegrationTablePropertiesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INTEGRATION_TABLE_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIntegrationTablePropertiesResponse, "GetIntegrationTableProperties")
      end

      # Retrieves an existing job definition.

      def get_job(
        job_name : String
      ) : Types::GetJobResponse

        input = Types::GetJobRequest.new(job_name: job_name)
        get_job(input)
      end

      def get_job(input : Types::GetJobRequest) : Types::GetJobResponse
        request = Protocol::JsonRpc.build_request(Model::GET_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetJobResponse, "GetJob")
      end

      # Returns information on a job bookmark entry. For more information about enabling and using job
      # bookmarks, see: Tracking processed data using job bookmarks Job parameters used by Glue Job
      # structure

      def get_job_bookmark(
        job_name : String,
        run_id : String? = nil
      ) : Types::GetJobBookmarkResponse

        input = Types::GetJobBookmarkRequest.new(job_name: job_name, run_id: run_id)
        get_job_bookmark(input)
      end

      def get_job_bookmark(input : Types::GetJobBookmarkRequest) : Types::GetJobBookmarkResponse
        request = Protocol::JsonRpc.build_request(Model::GET_JOB_BOOKMARK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetJobBookmarkResponse, "GetJobBookmark")
      end

      # Retrieves the metadata for a given job run. Job run history is accessible for 365 days for your
      # workflow and job run.

      def get_job_run(
        job_name : String,
        run_id : String,
        predecessors_included : Bool? = nil
      ) : Types::GetJobRunResponse

        input = Types::GetJobRunRequest.new(job_name: job_name, run_id: run_id, predecessors_included: predecessors_included)
        get_job_run(input)
      end

      def get_job_run(input : Types::GetJobRunRequest) : Types::GetJobRunResponse
        request = Protocol::JsonRpc.build_request(Model::GET_JOB_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetJobRunResponse, "GetJobRun")
      end

      # Retrieves metadata for all runs of a given job definition. GetJobRuns returns the job runs in
      # chronological order, with the newest jobs returned first.

      def get_job_runs(
        job_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetJobRunsResponse

        input = Types::GetJobRunsRequest.new(job_name: job_name, max_results: max_results, next_token: next_token)
        get_job_runs(input)
      end

      def get_job_runs(input : Types::GetJobRunsRequest) : Types::GetJobRunsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_JOB_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetJobRunsResponse, "GetJobRuns")
      end

      # Retrieves all current job definitions.

      def get_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetJobsResponse

        input = Types::GetJobsRequest.new(max_results: max_results, next_token: next_token)
        get_jobs(input)
      end

      def get_jobs(input : Types::GetJobsRequest) : Types::GetJobsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetJobsResponse, "GetJobs")
      end

      # Gets details for a specific task run on a machine learning transform. Machine learning task runs are
      # asynchronous tasks that Glue runs on your behalf as part of various machine learning workflows. You
      # can check the stats of any task run by calling GetMLTaskRun with the TaskRunID and its parent
      # transform's TransformID .

      def get_ml_task_run(
        task_run_id : String,
        transform_id : String
      ) : Types::GetMLTaskRunResponse

        input = Types::GetMLTaskRunRequest.new(task_run_id: task_run_id, transform_id: transform_id)
        get_ml_task_run(input)
      end

      def get_ml_task_run(input : Types::GetMLTaskRunRequest) : Types::GetMLTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ML_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMLTaskRunResponse, "GetMLTaskRun")
      end

      # Gets a list of runs for a machine learning transform. Machine learning task runs are asynchronous
      # tasks that Glue runs on your behalf as part of various machine learning workflows. You can get a
      # sortable, filterable list of machine learning task runs by calling GetMLTaskRuns with their parent
      # transform's TransformID and other optional parameters as documented in this section. This operation
      # returns a list of historic runs and must be paginated.

      def get_ml_task_runs(
        transform_id : String,
        filter : Types::TaskRunFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::TaskRunSortCriteria? = nil
      ) : Types::GetMLTaskRunsResponse

        input = Types::GetMLTaskRunsRequest.new(transform_id: transform_id, filter: filter, max_results: max_results, next_token: next_token, sort: sort)
        get_ml_task_runs(input)
      end

      def get_ml_task_runs(input : Types::GetMLTaskRunsRequest) : Types::GetMLTaskRunsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ML_TASK_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMLTaskRunsResponse, "GetMLTaskRuns")
      end

      # Gets an Glue machine learning transform artifact and all its corresponding metadata. Machine
      # learning transforms are a special type of transform that use machine learning to learn the details
      # of the transformation to be performed by learning from examples provided by humans. These
      # transformations are then saved by Glue. You can retrieve their metadata by calling GetMLTransform .

      def get_ml_transform(
        transform_id : String
      ) : Types::GetMLTransformResponse

        input = Types::GetMLTransformRequest.new(transform_id: transform_id)
        get_ml_transform(input)
      end

      def get_ml_transform(input : Types::GetMLTransformRequest) : Types::GetMLTransformResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ML_TRANSFORM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMLTransformResponse, "GetMLTransform")
      end

      # Gets a sortable, filterable list of existing Glue machine learning transforms. Machine learning
      # transforms are a special type of transform that use machine learning to learn the details of the
      # transformation to be performed by learning from examples provided by humans. These transformations
      # are then saved by Glue, and you can retrieve their metadata by calling GetMLTransforms .

      def get_ml_transforms(
        filter : Types::TransformFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::TransformSortCriteria? = nil
      ) : Types::GetMLTransformsResponse

        input = Types::GetMLTransformsRequest.new(filter: filter, max_results: max_results, next_token: next_token, sort: sort)
        get_ml_transforms(input)
      end

      def get_ml_transforms(input : Types::GetMLTransformsRequest) : Types::GetMLTransformsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ML_TRANSFORMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMLTransformsResponse, "GetMLTransforms")
      end

      # Creates mappings.

      def get_mapping(
        source : Types::CatalogEntry,
        location : Types::Location? = nil,
        sinks : Array(Types::CatalogEntry)? = nil
      ) : Types::GetMappingResponse

        input = Types::GetMappingRequest.new(source: source, location: location, sinks: sinks)
        get_mapping(input)
      end

      def get_mapping(input : Types::GetMappingRequest) : Types::GetMappingResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMappingResponse, "GetMapping")
      end

      # Get the associated metadata/information for a task run, given a task run ID.

      def get_materialized_view_refresh_task_run(
        catalog_id : String,
        materialized_view_refresh_task_run_id : String
      ) : Types::GetMaterializedViewRefreshTaskRunResponse

        input = Types::GetMaterializedViewRefreshTaskRunRequest.new(catalog_id: catalog_id, materialized_view_refresh_task_run_id: materialized_view_refresh_task_run_id)
        get_materialized_view_refresh_task_run(input)
      end

      def get_materialized_view_refresh_task_run(input : Types::GetMaterializedViewRefreshTaskRunRequest) : Types::GetMaterializedViewRefreshTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MATERIALIZED_VIEW_REFRESH_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMaterializedViewRefreshTaskRunResponse, "GetMaterializedViewRefreshTaskRun")
      end

      # Retrieves information about a specified partition.

      def get_partition(
        database_name : String,
        partition_values : Array(String),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::GetPartitionResponse

        input = Types::GetPartitionRequest.new(database_name: database_name, partition_values: partition_values, table_name: table_name, catalog_id: catalog_id)
        get_partition(input)
      end

      def get_partition(input : Types::GetPartitionRequest) : Types::GetPartitionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPartitionResponse, "GetPartition")
      end

      # Retrieves the partition indexes associated with a table.

      def get_partition_indexes(
        database_name : String,
        table_name : String,
        catalog_id : String? = nil,
        next_token : String? = nil
      ) : Types::GetPartitionIndexesResponse

        input = Types::GetPartitionIndexesRequest.new(database_name: database_name, table_name: table_name, catalog_id: catalog_id, next_token: next_token)
        get_partition_indexes(input)
      end

      def get_partition_indexes(input : Types::GetPartitionIndexesRequest) : Types::GetPartitionIndexesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PARTITION_INDEXES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPartitionIndexesResponse, "GetPartitionIndexes")
      end

      # Retrieves information about the partitions in a table.

      def get_partitions(
        database_name : String,
        table_name : String,
        catalog_id : String? = nil,
        exclude_column_schema : Bool? = nil,
        expression : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        query_as_of_time : Time? = nil,
        segment : Types::Segment? = nil,
        transaction_id : String? = nil
      ) : Types::GetPartitionsResponse

        input = Types::GetPartitionsRequest.new(database_name: database_name, table_name: table_name, catalog_id: catalog_id, exclude_column_schema: exclude_column_schema, expression: expression, max_results: max_results, next_token: next_token, query_as_of_time: query_as_of_time, segment: segment, transaction_id: transaction_id)
        get_partitions(input)
      end

      def get_partitions(input : Types::GetPartitionsRequest) : Types::GetPartitionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PARTITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPartitionsResponse, "GetPartitions")
      end

      # Gets code to perform a specified mapping.

      def get_plan(
        mapping : Array(Types::MappingEntry),
        source : Types::CatalogEntry,
        additional_plan_options_map : Hash(String, String)? = nil,
        language : String? = nil,
        location : Types::Location? = nil,
        sinks : Array(Types::CatalogEntry)? = nil
      ) : Types::GetPlanResponse

        input = Types::GetPlanRequest.new(mapping: mapping, source: source, additional_plan_options_map: additional_plan_options_map, language: language, location: location, sinks: sinks)
        get_plan(input)
      end

      def get_plan(input : Types::GetPlanRequest) : Types::GetPlanResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPlanResponse, "GetPlan")
      end

      # Describes the specified registry in detail.

      def get_registry(
        registry_id : Types::RegistryId
      ) : Types::GetRegistryResponse

        input = Types::GetRegistryInput.new(registry_id: registry_id)
        get_registry(input)
      end

      def get_registry(input : Types::GetRegistryInput) : Types::GetRegistryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REGISTRY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRegistryResponse, "GetRegistry")
      end

      # Retrieves the resource policies set on individual resources by Resource Access Manager during
      # cross-account permission grants. Also retrieves the Data Catalog resource policy. If you enabled
      # metadata encryption in Data Catalog settings, and you do not have permission on the KMS key, the
      # operation can't return the Data Catalog resource policy.

      def get_resource_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetResourcePoliciesResponse

        input = Types::GetResourcePoliciesRequest.new(max_results: max_results, next_token: next_token)
        get_resource_policies(input)
      end

      def get_resource_policies(input : Types::GetResourcePoliciesRequest) : Types::GetResourcePoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePoliciesResponse, "GetResourcePolicies")
      end

      # Retrieves a specified resource policy.

      def get_resource_policy(
        resource_arn : String? = nil
      ) : Types::GetResourcePolicyResponse

        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Types::GetResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePolicyResponse, "GetResourcePolicy")
      end

      # Describes the specified schema in detail.

      def get_schema(
        schema_id : Types::SchemaId
      ) : Types::GetSchemaResponse

        input = Types::GetSchemaInput.new(schema_id: schema_id)
        get_schema(input)
      end

      def get_schema(input : Types::GetSchemaInput) : Types::GetSchemaResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSchemaResponse, "GetSchema")
      end

      # Retrieves a schema by the SchemaDefinition . The schema definition is sent to the Schema Registry,
      # canonicalized, and hashed. If the hash is matched within the scope of the SchemaName or ARN (or the
      # default registry, if none is supplied), that schema’s metadata is returned. Otherwise, a 404 or
      # NotFound error is returned. Schema versions in Deleted statuses will not be included in the results.

      def get_schema_by_definition(
        schema_definition : String,
        schema_id : Types::SchemaId
      ) : Types::GetSchemaByDefinitionResponse

        input = Types::GetSchemaByDefinitionInput.new(schema_definition: schema_definition, schema_id: schema_id)
        get_schema_by_definition(input)
      end

      def get_schema_by_definition(input : Types::GetSchemaByDefinitionInput) : Types::GetSchemaByDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SCHEMA_BY_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSchemaByDefinitionResponse, "GetSchemaByDefinition")
      end

      # Get the specified schema by its unique ID assigned when a version of the schema is created or
      # registered. Schema versions in Deleted status will not be included in the results.

      def get_schema_version(
        schema_id : Types::SchemaId? = nil,
        schema_version_id : String? = nil,
        schema_version_number : Types::SchemaVersionNumber? = nil
      ) : Types::GetSchemaVersionResponse

        input = Types::GetSchemaVersionInput.new(schema_id: schema_id, schema_version_id: schema_version_id, schema_version_number: schema_version_number)
        get_schema_version(input)
      end

      def get_schema_version(input : Types::GetSchemaVersionInput) : Types::GetSchemaVersionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SCHEMA_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSchemaVersionResponse, "GetSchemaVersion")
      end

      # Fetches the schema version difference in the specified difference type between two stored schema
      # versions in the Schema Registry. This API allows you to compare two schema versions between two
      # schema definitions under the same schema.

      def get_schema_versions_diff(
        first_schema_version_number : Types::SchemaVersionNumber,
        schema_diff_type : String,
        schema_id : Types::SchemaId,
        second_schema_version_number : Types::SchemaVersionNumber
      ) : Types::GetSchemaVersionsDiffResponse

        input = Types::GetSchemaVersionsDiffInput.new(first_schema_version_number: first_schema_version_number, schema_diff_type: schema_diff_type, schema_id: schema_id, second_schema_version_number: second_schema_version_number)
        get_schema_versions_diff(input)
      end

      def get_schema_versions_diff(input : Types::GetSchemaVersionsDiffInput) : Types::GetSchemaVersionsDiffResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SCHEMA_VERSIONS_DIFF, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSchemaVersionsDiffResponse, "GetSchemaVersionsDiff")
      end

      # Retrieves a specified security configuration.

      def get_security_configuration(
        name : String
      ) : Types::GetSecurityConfigurationResponse

        input = Types::GetSecurityConfigurationRequest.new(name: name)
        get_security_configuration(input)
      end

      def get_security_configuration(input : Types::GetSecurityConfigurationRequest) : Types::GetSecurityConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SECURITY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSecurityConfigurationResponse, "GetSecurityConfiguration")
      end

      # Retrieves a list of all security configurations.

      def get_security_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetSecurityConfigurationsResponse

        input = Types::GetSecurityConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        get_security_configurations(input)
      end

      def get_security_configurations(input : Types::GetSecurityConfigurationsRequest) : Types::GetSecurityConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SECURITY_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSecurityConfigurationsResponse, "GetSecurityConfigurations")
      end

      # Retrieves the session.

      def get_session(
        id : String,
        request_origin : String? = nil
      ) : Types::GetSessionResponse

        input = Types::GetSessionRequest.new(id: id, request_origin: request_origin)
        get_session(input)
      end

      def get_session(input : Types::GetSessionRequest) : Types::GetSessionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSessionResponse, "GetSession")
      end

      # Retrieves the statement.

      def get_statement(
        id : Int32,
        session_id : String,
        request_origin : String? = nil
      ) : Types::GetStatementResponse

        input = Types::GetStatementRequest.new(id: id, session_id: session_id, request_origin: request_origin)
        get_statement(input)
      end

      def get_statement(input : Types::GetStatementRequest) : Types::GetStatementResponse
        request = Protocol::JsonRpc.build_request(Model::GET_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetStatementResponse, "GetStatement")
      end

      # Retrieves the Table definition in a Data Catalog for a specified table.

      def get_table(
        database_name : String,
        name : String,
        audit_context : Types::AuditContext? = nil,
        catalog_id : String? = nil,
        include_status_details : Bool? = nil,
        query_as_of_time : Time? = nil,
        transaction_id : String? = nil
      ) : Types::GetTableResponse

        input = Types::GetTableRequest.new(database_name: database_name, name: name, audit_context: audit_context, catalog_id: catalog_id, include_status_details: include_status_details, query_as_of_time: query_as_of_time, transaction_id: transaction_id)
        get_table(input)
      end

      def get_table(input : Types::GetTableRequest) : Types::GetTableResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTableResponse, "GetTable")
      end

      # Returns the configuration of all optimizers associated with a specified table.

      def get_table_optimizer(
        catalog_id : String,
        database_name : String,
        table_name : String,
        type : String
      ) : Types::GetTableOptimizerResponse

        input = Types::GetTableOptimizerRequest.new(catalog_id: catalog_id, database_name: database_name, table_name: table_name, type: type)
        get_table_optimizer(input)
      end

      def get_table_optimizer(input : Types::GetTableOptimizerRequest) : Types::GetTableOptimizerResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TABLE_OPTIMIZER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTableOptimizerResponse, "GetTableOptimizer")
      end

      # Retrieves a specified version of a table.

      def get_table_version(
        database_name : String,
        table_name : String,
        catalog_id : String? = nil,
        version_id : String? = nil
      ) : Types::GetTableVersionResponse

        input = Types::GetTableVersionRequest.new(database_name: database_name, table_name: table_name, catalog_id: catalog_id, version_id: version_id)
        get_table_version(input)
      end

      def get_table_version(input : Types::GetTableVersionRequest) : Types::GetTableVersionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TABLE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTableVersionResponse, "GetTableVersion")
      end

      # Retrieves a list of strings that identify available versions of a specified table.

      def get_table_versions(
        database_name : String,
        table_name : String,
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetTableVersionsResponse

        input = Types::GetTableVersionsRequest.new(database_name: database_name, table_name: table_name, catalog_id: catalog_id, max_results: max_results, next_token: next_token)
        get_table_versions(input)
      end

      def get_table_versions(input : Types::GetTableVersionsRequest) : Types::GetTableVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TABLE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTableVersionsResponse, "GetTableVersions")
      end

      # Retrieves the definitions of some or all of the tables in a given Database .

      def get_tables(
        database_name : String,
        attributes_to_get : Array(String)? = nil,
        audit_context : Types::AuditContext? = nil,
        catalog_id : String? = nil,
        expression : String? = nil,
        include_status_details : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        query_as_of_time : Time? = nil,
        transaction_id : String? = nil
      ) : Types::GetTablesResponse

        input = Types::GetTablesRequest.new(database_name: database_name, attributes_to_get: attributes_to_get, audit_context: audit_context, catalog_id: catalog_id, expression: expression, include_status_details: include_status_details, max_results: max_results, next_token: next_token, query_as_of_time: query_as_of_time, transaction_id: transaction_id)
        get_tables(input)
      end

      def get_tables(input : Types::GetTablesRequest) : Types::GetTablesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TABLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTablesResponse, "GetTables")
      end

      # Retrieves a list of tags associated with a resource.

      def get_tags(
        resource_arn : String
      ) : Types::GetTagsResponse

        input = Types::GetTagsRequest.new(resource_arn: resource_arn)
        get_tags(input)
      end

      def get_tags(input : Types::GetTagsRequest) : Types::GetTagsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTagsResponse, "GetTags")
      end

      # Retrieves the definition of a trigger.

      def get_trigger(
        name : String
      ) : Types::GetTriggerResponse

        input = Types::GetTriggerRequest.new(name: name)
        get_trigger(input)
      end

      def get_trigger(input : Types::GetTriggerRequest) : Types::GetTriggerResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TRIGGER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTriggerResponse, "GetTrigger")
      end

      # Gets all the triggers associated with a job.

      def get_triggers(
        dependent_job_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetTriggersResponse

        input = Types::GetTriggersRequest.new(dependent_job_name: dependent_job_name, max_results: max_results, next_token: next_token)
        get_triggers(input)
      end

      def get_triggers(input : Types::GetTriggersRequest) : Types::GetTriggersResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TRIGGERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTriggersResponse, "GetTriggers")
      end

      # Retrieves partition metadata from the Data Catalog that contains unfiltered metadata. For IAM
      # authorization, the public IAM action associated with this API is glue:GetPartition .

      def get_unfiltered_partition_metadata(
        catalog_id : String,
        database_name : String,
        partition_values : Array(String),
        supported_permission_types : Array(String),
        table_name : String,
        audit_context : Types::AuditContext? = nil,
        query_session_context : Types::QuerySessionContext? = nil,
        region : String? = nil
      ) : Types::GetUnfilteredPartitionMetadataResponse

        input = Types::GetUnfilteredPartitionMetadataRequest.new(catalog_id: catalog_id, database_name: database_name, partition_values: partition_values, supported_permission_types: supported_permission_types, table_name: table_name, audit_context: audit_context, query_session_context: query_session_context, region: region)
        get_unfiltered_partition_metadata(input)
      end

      def get_unfiltered_partition_metadata(input : Types::GetUnfilteredPartitionMetadataRequest) : Types::GetUnfilteredPartitionMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::GET_UNFILTERED_PARTITION_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUnfilteredPartitionMetadataResponse, "GetUnfilteredPartitionMetadata")
      end

      # Retrieves partition metadata from the Data Catalog that contains unfiltered metadata. For IAM
      # authorization, the public IAM action associated with this API is glue:GetPartitions .

      def get_unfiltered_partitions_metadata(
        catalog_id : String,
        database_name : String,
        supported_permission_types : Array(String),
        table_name : String,
        audit_context : Types::AuditContext? = nil,
        expression : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        query_session_context : Types::QuerySessionContext? = nil,
        region : String? = nil,
        segment : Types::Segment? = nil
      ) : Types::GetUnfilteredPartitionsMetadataResponse

        input = Types::GetUnfilteredPartitionsMetadataRequest.new(catalog_id: catalog_id, database_name: database_name, supported_permission_types: supported_permission_types, table_name: table_name, audit_context: audit_context, expression: expression, max_results: max_results, next_token: next_token, query_session_context: query_session_context, region: region, segment: segment)
        get_unfiltered_partitions_metadata(input)
      end

      def get_unfiltered_partitions_metadata(input : Types::GetUnfilteredPartitionsMetadataRequest) : Types::GetUnfilteredPartitionsMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::GET_UNFILTERED_PARTITIONS_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUnfilteredPartitionsMetadataResponse, "GetUnfilteredPartitionsMetadata")
      end

      # Allows a third-party analytical engine to retrieve unfiltered table metadata from the Data Catalog.
      # For IAM authorization, the public IAM action associated with this API is glue:GetTable .

      def get_unfiltered_table_metadata(
        catalog_id : String,
        database_name : String,
        name : String,
        supported_permission_types : Array(String),
        audit_context : Types::AuditContext? = nil,
        parent_resource_arn : String? = nil,
        permissions : Array(String)? = nil,
        query_session_context : Types::QuerySessionContext? = nil,
        region : String? = nil,
        root_resource_arn : String? = nil,
        supported_dialect : Types::SupportedDialect? = nil
      ) : Types::GetUnfilteredTableMetadataResponse

        input = Types::GetUnfilteredTableMetadataRequest.new(catalog_id: catalog_id, database_name: database_name, name: name, supported_permission_types: supported_permission_types, audit_context: audit_context, parent_resource_arn: parent_resource_arn, permissions: permissions, query_session_context: query_session_context, region: region, root_resource_arn: root_resource_arn, supported_dialect: supported_dialect)
        get_unfiltered_table_metadata(input)
      end

      def get_unfiltered_table_metadata(input : Types::GetUnfilteredTableMetadataRequest) : Types::GetUnfilteredTableMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::GET_UNFILTERED_TABLE_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUnfilteredTableMetadataResponse, "GetUnfilteredTableMetadata")
      end

      # Retrieves information about the specified Glue usage profile.

      def get_usage_profile(
        name : String
      ) : Types::GetUsageProfileResponse

        input = Types::GetUsageProfileRequest.new(name: name)
        get_usage_profile(input)
      end

      def get_usage_profile(input : Types::GetUsageProfileRequest) : Types::GetUsageProfileResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USAGE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUsageProfileResponse, "GetUsageProfile")
      end

      # Retrieves a specified function definition from the Data Catalog.

      def get_user_defined_function(
        database_name : String,
        function_name : String,
        catalog_id : String? = nil
      ) : Types::GetUserDefinedFunctionResponse

        input = Types::GetUserDefinedFunctionRequest.new(database_name: database_name, function_name: function_name, catalog_id: catalog_id)
        get_user_defined_function(input)
      end

      def get_user_defined_function(input : Types::GetUserDefinedFunctionRequest) : Types::GetUserDefinedFunctionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USER_DEFINED_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUserDefinedFunctionResponse, "GetUserDefinedFunction")
      end

      # Retrieves multiple function definitions from the Data Catalog.

      def get_user_defined_functions(
        pattern : String,
        catalog_id : String? = nil,
        database_name : String? = nil,
        function_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetUserDefinedFunctionsResponse

        input = Types::GetUserDefinedFunctionsRequest.new(pattern: pattern, catalog_id: catalog_id, database_name: database_name, function_type: function_type, max_results: max_results, next_token: next_token)
        get_user_defined_functions(input)
      end

      def get_user_defined_functions(input : Types::GetUserDefinedFunctionsRequest) : Types::GetUserDefinedFunctionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USER_DEFINED_FUNCTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUserDefinedFunctionsResponse, "GetUserDefinedFunctions")
      end

      # Retrieves resource metadata for a workflow.

      def get_workflow(
        name : String,
        include_graph : Bool? = nil
      ) : Types::GetWorkflowResponse

        input = Types::GetWorkflowRequest.new(name: name, include_graph: include_graph)
        get_workflow(input)
      end

      def get_workflow(input : Types::GetWorkflowRequest) : Types::GetWorkflowResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkflowResponse, "GetWorkflow")
      end

      # Retrieves the metadata for a given workflow run. Job run history is accessible for 90 days for your
      # workflow and job run.

      def get_workflow_run(
        name : String,
        run_id : String,
        include_graph : Bool? = nil
      ) : Types::GetWorkflowRunResponse

        input = Types::GetWorkflowRunRequest.new(name: name, run_id: run_id, include_graph: include_graph)
        get_workflow_run(input)
      end

      def get_workflow_run(input : Types::GetWorkflowRunRequest) : Types::GetWorkflowRunResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WORKFLOW_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkflowRunResponse, "GetWorkflowRun")
      end

      # Retrieves the workflow run properties which were set during the run.

      def get_workflow_run_properties(
        name : String,
        run_id : String
      ) : Types::GetWorkflowRunPropertiesResponse

        input = Types::GetWorkflowRunPropertiesRequest.new(name: name, run_id: run_id)
        get_workflow_run_properties(input)
      end

      def get_workflow_run_properties(input : Types::GetWorkflowRunPropertiesRequest) : Types::GetWorkflowRunPropertiesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WORKFLOW_RUN_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkflowRunPropertiesResponse, "GetWorkflowRunProperties")
      end

      # Retrieves metadata for all runs of a given workflow.

      def get_workflow_runs(
        name : String,
        include_graph : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetWorkflowRunsResponse

        input = Types::GetWorkflowRunsRequest.new(name: name, include_graph: include_graph, max_results: max_results, next_token: next_token)
        get_workflow_runs(input)
      end

      def get_workflow_runs(input : Types::GetWorkflowRunsRequest) : Types::GetWorkflowRunsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WORKFLOW_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkflowRunsResponse, "GetWorkflowRuns")
      end

      # Imports an existing Amazon Athena Data Catalog to Glue.

      def import_catalog_to_glue(
        catalog_id : String? = nil
      ) : Types::ImportCatalogToGlueResponse

        input = Types::ImportCatalogToGlueRequest.new(catalog_id: catalog_id)
        import_catalog_to_glue(input)
      end

      def import_catalog_to_glue(input : Types::ImportCatalogToGlueRequest) : Types::ImportCatalogToGlueResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_CATALOG_TO_GLUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportCatalogToGlueResponse, "ImportCatalogToGlue")
      end

      # Lists all the blueprint names in an account.

      def list_blueprints(
        max_results : Int32? = nil,
        next_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::ListBlueprintsResponse

        input = Types::ListBlueprintsRequest.new(max_results: max_results, next_token: next_token, tags: tags)
        list_blueprints(input)
      end

      def list_blueprints(input : Types::ListBlueprintsRequest) : Types::ListBlueprintsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BLUEPRINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBlueprintsResponse, "ListBlueprints")
      end

      # List all task runs for a particular account.

      def list_column_statistics_task_runs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListColumnStatisticsTaskRunsResponse

        input = Types::ListColumnStatisticsTaskRunsRequest.new(max_results: max_results, next_token: next_token)
        list_column_statistics_task_runs(input)
      end

      def list_column_statistics_task_runs(input : Types::ListColumnStatisticsTaskRunsRequest) : Types::ListColumnStatisticsTaskRunsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COLUMN_STATISTICS_TASK_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListColumnStatisticsTaskRunsResponse, "ListColumnStatisticsTaskRuns")
      end

      # The ListConnectionTypes API provides a discovery mechanism to learn available connection types in
      # Glue. The response contains a list of connection types with high-level details of what is supported
      # for each connection type. The connection types listed are the set of supported options for the
      # ConnectionType value in the CreateConnection API.

      def list_connection_types(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListConnectionTypesResponse

        input = Types::ListConnectionTypesRequest.new(max_results: max_results, next_token: next_token)
        list_connection_types(input)
      end

      def list_connection_types(input : Types::ListConnectionTypesRequest) : Types::ListConnectionTypesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONNECTION_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConnectionTypesResponse, "ListConnectionTypes")
      end

      # Retrieves the names of all crawler resources in this Amazon Web Services account, or the resources
      # with the specified tag. This operation allows you to see which resources are available in your
      # account, and their names. This operation takes the optional Tags field, which you can use as a
      # filter on the response so that tagged resources can be retrieved as a group. If you choose to use
      # tags filtering, only resources with the tag are retrieved.

      def list_crawlers(
        max_results : Int32? = nil,
        next_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::ListCrawlersResponse

        input = Types::ListCrawlersRequest.new(max_results: max_results, next_token: next_token, tags: tags)
        list_crawlers(input)
      end

      def list_crawlers(input : Types::ListCrawlersRequest) : Types::ListCrawlersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CRAWLERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCrawlersResponse, "ListCrawlers")
      end

      # Returns all the crawls of a specified crawler. Returns only the crawls that have occurred since the
      # launch date of the crawler history feature, and only retains up to 12 months of crawls. Older crawls
      # will not be returned. You may use this API to: Retrive all the crawls of a specified crawler.
      # Retrieve all the crawls of a specified crawler within a limited count. Retrieve all the crawls of a
      # specified crawler in a specific time range. Retrieve all the crawls of a specified crawler with a
      # particular state, crawl ID, or DPU hour value.

      def list_crawls(
        crawler_name : String,
        filters : Array(Types::CrawlsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCrawlsResponse

        input = Types::ListCrawlsRequest.new(crawler_name: crawler_name, filters: filters, max_results: max_results, next_token: next_token)
        list_crawls(input)
      end

      def list_crawls(input : Types::ListCrawlsRequest) : Types::ListCrawlsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CRAWLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCrawlsResponse, "ListCrawls")
      end

      # Lists all the custom patterns that have been created.

      def list_custom_entity_types(
        max_results : Int32? = nil,
        next_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::ListCustomEntityTypesResponse

        input = Types::ListCustomEntityTypesRequest.new(max_results: max_results, next_token: next_token, tags: tags)
        list_custom_entity_types(input)
      end

      def list_custom_entity_types(input : Types::ListCustomEntityTypesRequest) : Types::ListCustomEntityTypesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CUSTOM_ENTITY_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCustomEntityTypesResponse, "ListCustomEntityTypes")
      end

      # Returns all data quality execution results for your account.

      def list_data_quality_results(
        filter : Types::DataQualityResultFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDataQualityResultsResponse

        input = Types::ListDataQualityResultsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_data_quality_results(input)
      end

      def list_data_quality_results(input : Types::ListDataQualityResultsRequest) : Types::ListDataQualityResultsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_QUALITY_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataQualityResultsResponse, "ListDataQualityResults")
      end

      # Lists the recommendation runs meeting the filter criteria.

      def list_data_quality_rule_recommendation_runs(
        filter : Types::DataQualityRuleRecommendationRunFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDataQualityRuleRecommendationRunsResponse

        input = Types::ListDataQualityRuleRecommendationRunsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_data_quality_rule_recommendation_runs(input)
      end

      def list_data_quality_rule_recommendation_runs(input : Types::ListDataQualityRuleRecommendationRunsRequest) : Types::ListDataQualityRuleRecommendationRunsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_QUALITY_RULE_RECOMMENDATION_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataQualityRuleRecommendationRunsResponse, "ListDataQualityRuleRecommendationRuns")
      end

      # Lists all the runs meeting the filter criteria, where a ruleset is evaluated against a data source.

      def list_data_quality_ruleset_evaluation_runs(
        filter : Types::DataQualityRulesetEvaluationRunFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDataQualityRulesetEvaluationRunsResponse

        input = Types::ListDataQualityRulesetEvaluationRunsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_data_quality_ruleset_evaluation_runs(input)
      end

      def list_data_quality_ruleset_evaluation_runs(input : Types::ListDataQualityRulesetEvaluationRunsRequest) : Types::ListDataQualityRulesetEvaluationRunsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_QUALITY_RULESET_EVALUATION_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataQualityRulesetEvaluationRunsResponse, "ListDataQualityRulesetEvaluationRuns")
      end

      # Returns a paginated list of rulesets for the specified list of Glue tables.

      def list_data_quality_rulesets(
        filter : Types::DataQualityRulesetFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::ListDataQualityRulesetsResponse

        input = Types::ListDataQualityRulesetsRequest.new(filter: filter, max_results: max_results, next_token: next_token, tags: tags)
        list_data_quality_rulesets(input)
      end

      def list_data_quality_rulesets(input : Types::ListDataQualityRulesetsRequest) : Types::ListDataQualityRulesetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_QUALITY_RULESETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataQualityRulesetsResponse, "ListDataQualityRulesets")
      end

      # Retrieve annotations for a data quality statistic.

      def list_data_quality_statistic_annotations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        profile_id : String? = nil,
        statistic_id : String? = nil,
        timestamp_filter : Types::TimestampFilter? = nil
      ) : Types::ListDataQualityStatisticAnnotationsResponse

        input = Types::ListDataQualityStatisticAnnotationsRequest.new(max_results: max_results, next_token: next_token, profile_id: profile_id, statistic_id: statistic_id, timestamp_filter: timestamp_filter)
        list_data_quality_statistic_annotations(input)
      end

      def list_data_quality_statistic_annotations(input : Types::ListDataQualityStatisticAnnotationsRequest) : Types::ListDataQualityStatisticAnnotationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_QUALITY_STATISTIC_ANNOTATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataQualityStatisticAnnotationsResponse, "ListDataQualityStatisticAnnotations")
      end

      # Retrieves a list of data quality statistics.

      def list_data_quality_statistics(
        max_results : Int32? = nil,
        next_token : String? = nil,
        profile_id : String? = nil,
        statistic_id : String? = nil,
        timestamp_filter : Types::TimestampFilter? = nil
      ) : Types::ListDataQualityStatisticsResponse

        input = Types::ListDataQualityStatisticsRequest.new(max_results: max_results, next_token: next_token, profile_id: profile_id, statistic_id: statistic_id, timestamp_filter: timestamp_filter)
        list_data_quality_statistics(input)
      end

      def list_data_quality_statistics(input : Types::ListDataQualityStatisticsRequest) : Types::ListDataQualityStatisticsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_QUALITY_STATISTICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataQualityStatisticsResponse, "ListDataQualityStatistics")
      end

      # Retrieves the names of all DevEndpoint resources in this Amazon Web Services account, or the
      # resources with the specified tag. This operation allows you to see which resources are available in
      # your account, and their names. This operation takes the optional Tags field, which you can use as a
      # filter on the response so that tagged resources can be retrieved as a group. If you choose to use
      # tags filtering, only resources with the tag are retrieved.

      def list_dev_endpoints(
        max_results : Int32? = nil,
        next_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::ListDevEndpointsResponse

        input = Types::ListDevEndpointsRequest.new(max_results: max_results, next_token: next_token, tags: tags)
        list_dev_endpoints(input)
      end

      def list_dev_endpoints(input : Types::ListDevEndpointsRequest) : Types::ListDevEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DEV_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDevEndpointsResponse, "ListDevEndpoints")
      end

      # Returns the available entities supported by the connection type.

      def list_entities(
        catalog_id : String? = nil,
        connection_name : String? = nil,
        data_store_api_version : String? = nil,
        next_token : String? = nil,
        parent_entity_name : String? = nil
      ) : Types::ListEntitiesResponse

        input = Types::ListEntitiesRequest.new(catalog_id: catalog_id, connection_name: connection_name, data_store_api_version: data_store_api_version, next_token: next_token, parent_entity_name: parent_entity_name)
        list_entities(input)
      end

      def list_entities(input : Types::ListEntitiesRequest) : Types::ListEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEntitiesResponse, "ListEntities")
      end

      # List integration resource properties for a single customer. It supports the filters, maxRecords and
      # markers.

      def list_integration_resource_properties(
        filters : Array(Types::IntegrationResourcePropertyFilter)? = nil,
        marker : String? = nil,
        max_records : Int32? = nil
      ) : Types::ListIntegrationResourcePropertiesResponse

        input = Types::ListIntegrationResourcePropertiesRequest.new(filters: filters, marker: marker, max_records: max_records)
        list_integration_resource_properties(input)
      end

      def list_integration_resource_properties(input : Types::ListIntegrationResourcePropertiesRequest) : Types::ListIntegrationResourcePropertiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INTEGRATION_RESOURCE_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIntegrationResourcePropertiesResponse, "ListIntegrationResourceProperties")
      end

      # Retrieves the names of all job resources in this Amazon Web Services account, or the resources with
      # the specified tag. This operation allows you to see which resources are available in your account,
      # and their names. This operation takes the optional Tags field, which you can use as a filter on the
      # response so that tagged resources can be retrieved as a group. If you choose to use tags filtering,
      # only resources with the tag are retrieved.

      def list_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::ListJobsResponse

        input = Types::ListJobsRequest.new(max_results: max_results, next_token: next_token, tags: tags)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsRequest) : Types::ListJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListJobsResponse, "ListJobs")
      end

      # Retrieves a sortable, filterable list of existing Glue machine learning transforms in this Amazon
      # Web Services account, or the resources with the specified tag. This operation takes the optional
      # Tags field, which you can use as a filter of the responses so that tagged resources can be retrieved
      # as a group. If you choose to use tag filtering, only resources with the tags are retrieved.

      def list_ml_transforms(
        filter : Types::TransformFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::TransformSortCriteria? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::ListMLTransformsResponse

        input = Types::ListMLTransformsRequest.new(filter: filter, max_results: max_results, next_token: next_token, sort: sort, tags: tags)
        list_ml_transforms(input)
      end

      def list_ml_transforms(input : Types::ListMLTransformsRequest) : Types::ListMLTransformsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ML_TRANSFORMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMLTransformsResponse, "ListMLTransforms")
      end

      # List all task runs for a particular account.

      def list_materialized_view_refresh_task_runs(
        catalog_id : String,
        database_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        table_name : String? = nil
      ) : Types::ListMaterializedViewRefreshTaskRunsResponse

        input = Types::ListMaterializedViewRefreshTaskRunsRequest.new(catalog_id: catalog_id, database_name: database_name, max_results: max_results, next_token: next_token, table_name: table_name)
        list_materialized_view_refresh_task_runs(input)
      end

      def list_materialized_view_refresh_task_runs(input : Types::ListMaterializedViewRefreshTaskRunsRequest) : Types::ListMaterializedViewRefreshTaskRunsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MATERIALIZED_VIEW_REFRESH_TASK_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMaterializedViewRefreshTaskRunsResponse, "ListMaterializedViewRefreshTaskRuns")
      end

      # Returns a list of registries that you have created, with minimal registry information. Registries in
      # the Deleting status will not be included in the results. Empty results will be returned if there are
      # no registries available.

      def list_registries(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRegistriesResponse

        input = Types::ListRegistriesInput.new(max_results: max_results, next_token: next_token)
        list_registries(input)
      end

      def list_registries(input : Types::ListRegistriesInput) : Types::ListRegistriesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REGISTRIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRegistriesResponse, "ListRegistries")
      end

      # Returns a list of schema versions that you have created, with minimal information. Schema versions
      # in Deleted status will not be included in the results. Empty results will be returned if there are
      # no schema versions available.

      def list_schema_versions(
        schema_id : Types::SchemaId,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSchemaVersionsResponse

        input = Types::ListSchemaVersionsInput.new(schema_id: schema_id, max_results: max_results, next_token: next_token)
        list_schema_versions(input)
      end

      def list_schema_versions(input : Types::ListSchemaVersionsInput) : Types::ListSchemaVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SCHEMA_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSchemaVersionsResponse, "ListSchemaVersions")
      end

      # Returns a list of schemas with minimal details. Schemas in Deleting status will not be included in
      # the results. Empty results will be returned if there are no schemas available. When the RegistryId
      # is not provided, all the schemas across registries will be part of the API response.

      def list_schemas(
        max_results : Int32? = nil,
        next_token : String? = nil,
        registry_id : Types::RegistryId? = nil
      ) : Types::ListSchemasResponse

        input = Types::ListSchemasInput.new(max_results: max_results, next_token: next_token, registry_id: registry_id)
        list_schemas(input)
      end

      def list_schemas(input : Types::ListSchemasInput) : Types::ListSchemasResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SCHEMAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSchemasResponse, "ListSchemas")
      end

      # Retrieve a list of sessions.

      def list_sessions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        request_origin : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::ListSessionsResponse

        input = Types::ListSessionsRequest.new(max_results: max_results, next_token: next_token, request_origin: request_origin, tags: tags)
        list_sessions(input)
      end

      def list_sessions(input : Types::ListSessionsRequest) : Types::ListSessionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSessionsResponse, "ListSessions")
      end

      # Lists statements for the session.

      def list_statements(
        session_id : String,
        next_token : String? = nil,
        request_origin : String? = nil
      ) : Types::ListStatementsResponse

        input = Types::ListStatementsRequest.new(session_id: session_id, next_token: next_token, request_origin: request_origin)
        list_statements(input)
      end

      def list_statements(input : Types::ListStatementsRequest) : Types::ListStatementsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_STATEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStatementsResponse, "ListStatements")
      end

      # Lists the history of previous optimizer runs for a specific table.

      def list_table_optimizer_runs(
        catalog_id : String,
        database_name : String,
        table_name : String,
        type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTableOptimizerRunsResponse

        input = Types::ListTableOptimizerRunsRequest.new(catalog_id: catalog_id, database_name: database_name, table_name: table_name, type: type, max_results: max_results, next_token: next_token)
        list_table_optimizer_runs(input)
      end

      def list_table_optimizer_runs(input : Types::ListTableOptimizerRunsRequest) : Types::ListTableOptimizerRunsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TABLE_OPTIMIZER_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTableOptimizerRunsResponse, "ListTableOptimizerRuns")
      end

      # Retrieves the names of all trigger resources in this Amazon Web Services account, or the resources
      # with the specified tag. This operation allows you to see which resources are available in your
      # account, and their names. This operation takes the optional Tags field, which you can use as a
      # filter on the response so that tagged resources can be retrieved as a group. If you choose to use
      # tags filtering, only resources with the tag are retrieved.

      def list_triggers(
        dependent_job_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::ListTriggersResponse

        input = Types::ListTriggersRequest.new(dependent_job_name: dependent_job_name, max_results: max_results, next_token: next_token, tags: tags)
        list_triggers(input)
      end

      def list_triggers(input : Types::ListTriggersRequest) : Types::ListTriggersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRIGGERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTriggersResponse, "ListTriggers")
      end

      # List all the Glue usage profiles.

      def list_usage_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListUsageProfilesResponse

        input = Types::ListUsageProfilesRequest.new(max_results: max_results, next_token: next_token)
        list_usage_profiles(input)
      end

      def list_usage_profiles(input : Types::ListUsageProfilesRequest) : Types::ListUsageProfilesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USAGE_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUsageProfilesResponse, "ListUsageProfiles")
      end

      # Lists names of workflows created in the account.

      def list_workflows(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWorkflowsResponse

        input = Types::ListWorkflowsRequest.new(max_results: max_results, next_token: next_token)
        list_workflows(input)
      end

      def list_workflows(input : Types::ListWorkflowsRequest) : Types::ListWorkflowsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKFLOWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkflowsResponse, "ListWorkflows")
      end

      # Modifies a Zero-ETL integration in the caller's account.

      def modify_integration(
        integration_identifier : String,
        data_filter : String? = nil,
        description : String? = nil,
        integration_config : Types::IntegrationConfig? = nil,
        integration_name : String? = nil
      ) : Types::ModifyIntegrationResponse

        input = Types::ModifyIntegrationRequest.new(integration_identifier: integration_identifier, data_filter: data_filter, description: description, integration_config: integration_config, integration_name: integration_name)
        modify_integration(input)
      end

      def modify_integration(input : Types::ModifyIntegrationRequest) : Types::ModifyIntegrationResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_INTEGRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyIntegrationResponse, "ModifyIntegration")
      end

      # Sets the security configuration for a specified catalog. After the configuration has been set, the
      # specified encryption is applied to every catalog write thereafter.

      def put_data_catalog_encryption_settings(
        data_catalog_encryption_settings : Types::DataCatalogEncryptionSettings,
        catalog_id : String? = nil
      ) : Types::PutDataCatalogEncryptionSettingsResponse

        input = Types::PutDataCatalogEncryptionSettingsRequest.new(data_catalog_encryption_settings: data_catalog_encryption_settings, catalog_id: catalog_id)
        put_data_catalog_encryption_settings(input)
      end

      def put_data_catalog_encryption_settings(input : Types::PutDataCatalogEncryptionSettingsRequest) : Types::PutDataCatalogEncryptionSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_DATA_CATALOG_ENCRYPTION_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutDataCatalogEncryptionSettingsResponse, "PutDataCatalogEncryptionSettings")
      end

      # Annotate all datapoints for a Profile.

      def put_data_quality_profile_annotation(
        inclusion_annotation : String,
        profile_id : String
      ) : Types::PutDataQualityProfileAnnotationResponse

        input = Types::PutDataQualityProfileAnnotationRequest.new(inclusion_annotation: inclusion_annotation, profile_id: profile_id)
        put_data_quality_profile_annotation(input)
      end

      def put_data_quality_profile_annotation(input : Types::PutDataQualityProfileAnnotationRequest) : Types::PutDataQualityProfileAnnotationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_DATA_QUALITY_PROFILE_ANNOTATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutDataQualityProfileAnnotationResponse, "PutDataQualityProfileAnnotation")
      end

      # Sets the Data Catalog resource policy for access control.

      def put_resource_policy(
        policy_in_json : String,
        enable_hybrid : String? = nil,
        policy_exists_condition : String? = nil,
        policy_hash_condition : String? = nil,
        resource_arn : String? = nil
      ) : Types::PutResourcePolicyResponse

        input = Types::PutResourcePolicyRequest.new(policy_in_json: policy_in_json, enable_hybrid: enable_hybrid, policy_exists_condition: policy_exists_condition, policy_hash_condition: policy_hash_condition, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResponse, "PutResourcePolicy")
      end

      # Puts the metadata key value pair for a specified schema version ID. A maximum of 10 key value pairs
      # will be allowed per schema version. They can be added over one or more calls.

      def put_schema_version_metadata(
        metadata_key_value : Types::MetadataKeyValuePair,
        schema_id : Types::SchemaId? = nil,
        schema_version_id : String? = nil,
        schema_version_number : Types::SchemaVersionNumber? = nil
      ) : Types::PutSchemaVersionMetadataResponse

        input = Types::PutSchemaVersionMetadataInput.new(metadata_key_value: metadata_key_value, schema_id: schema_id, schema_version_id: schema_version_id, schema_version_number: schema_version_number)
        put_schema_version_metadata(input)
      end

      def put_schema_version_metadata(input : Types::PutSchemaVersionMetadataInput) : Types::PutSchemaVersionMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_SCHEMA_VERSION_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutSchemaVersionMetadataResponse, "PutSchemaVersionMetadata")
      end

      # Puts the specified workflow run properties for the given workflow run. If a property already exists
      # for the specified run, then it overrides the value otherwise adds the property to existing
      # properties.

      def put_workflow_run_properties(
        name : String,
        run_id : String,
        run_properties : Hash(String, String)
      ) : Types::PutWorkflowRunPropertiesResponse

        input = Types::PutWorkflowRunPropertiesRequest.new(name: name, run_id: run_id, run_properties: run_properties)
        put_workflow_run_properties(input)
      end

      def put_workflow_run_properties(input : Types::PutWorkflowRunPropertiesRequest) : Types::PutWorkflowRunPropertiesResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_WORKFLOW_RUN_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutWorkflowRunPropertiesResponse, "PutWorkflowRunProperties")
      end

      # Queries for the schema version metadata information.

      def query_schema_version_metadata(
        max_results : Int32? = nil,
        metadata_list : Array(Types::MetadataKeyValuePair)? = nil,
        next_token : String? = nil,
        schema_id : Types::SchemaId? = nil,
        schema_version_id : String? = nil,
        schema_version_number : Types::SchemaVersionNumber? = nil
      ) : Types::QuerySchemaVersionMetadataResponse

        input = Types::QuerySchemaVersionMetadataInput.new(max_results: max_results, metadata_list: metadata_list, next_token: next_token, schema_id: schema_id, schema_version_id: schema_version_id, schema_version_number: schema_version_number)
        query_schema_version_metadata(input)
      end

      def query_schema_version_metadata(input : Types::QuerySchemaVersionMetadataInput) : Types::QuerySchemaVersionMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::QUERY_SCHEMA_VERSION_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::QuerySchemaVersionMetadataResponse, "QuerySchemaVersionMetadata")
      end

      # Adds a new version to the existing schema. Returns an error if new version of schema does not meet
      # the compatibility requirements of the schema set. This API will not create a new schema set and will
      # return a 404 error if the schema set is not already present in the Schema Registry. If this is the
      # first schema definition to be registered in the Schema Registry, this API will store the schema
      # version and return immediately. Otherwise, this call has the potential to run longer than other
      # operations due to compatibility modes. You can call the GetSchemaVersion API with the
      # SchemaVersionId to check compatibility modes. If the same schema definition is already stored in
      # Schema Registry as a version, the schema ID of the existing schema is returned to the caller.

      def register_schema_version(
        schema_definition : String,
        schema_id : Types::SchemaId
      ) : Types::RegisterSchemaVersionResponse

        input = Types::RegisterSchemaVersionInput.new(schema_definition: schema_definition, schema_id: schema_id)
        register_schema_version(input)
      end

      def register_schema_version(input : Types::RegisterSchemaVersionInput) : Types::RegisterSchemaVersionResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_SCHEMA_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterSchemaVersionResponse, "RegisterSchemaVersion")
      end

      # Removes a key value pair from the schema version metadata for the specified schema version ID.

      def remove_schema_version_metadata(
        metadata_key_value : Types::MetadataKeyValuePair,
        schema_id : Types::SchemaId? = nil,
        schema_version_id : String? = nil,
        schema_version_number : Types::SchemaVersionNumber? = nil
      ) : Types::RemoveSchemaVersionMetadataResponse

        input = Types::RemoveSchemaVersionMetadataInput.new(metadata_key_value: metadata_key_value, schema_id: schema_id, schema_version_id: schema_version_id, schema_version_number: schema_version_number)
        remove_schema_version_metadata(input)
      end

      def remove_schema_version_metadata(input : Types::RemoveSchemaVersionMetadataInput) : Types::RemoveSchemaVersionMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::REMOVE_SCHEMA_VERSION_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveSchemaVersionMetadataResponse, "RemoveSchemaVersionMetadata")
      end

      # Resets a bookmark entry. For more information about enabling and using job bookmarks, see: Tracking
      # processed data using job bookmarks Job parameters used by Glue Job structure

      def reset_job_bookmark(
        job_name : String,
        run_id : String? = nil
      ) : Types::ResetJobBookmarkResponse

        input = Types::ResetJobBookmarkRequest.new(job_name: job_name, run_id: run_id)
        reset_job_bookmark(input)
      end

      def reset_job_bookmark(input : Types::ResetJobBookmarkRequest) : Types::ResetJobBookmarkResponse
        request = Protocol::JsonRpc.build_request(Model::RESET_JOB_BOOKMARK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResetJobBookmarkResponse, "ResetJobBookmark")
      end

      # Restarts selected nodes of a previous partially completed workflow run and resumes the workflow run.
      # The selected nodes and all nodes that are downstream from the selected nodes are run.

      def resume_workflow_run(
        name : String,
        node_ids : Array(String),
        run_id : String
      ) : Types::ResumeWorkflowRunResponse

        input = Types::ResumeWorkflowRunRequest.new(name: name, node_ids: node_ids, run_id: run_id)
        resume_workflow_run(input)
      end

      def resume_workflow_run(input : Types::ResumeWorkflowRunRequest) : Types::ResumeWorkflowRunResponse
        request = Protocol::JsonRpc.build_request(Model::RESUME_WORKFLOW_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResumeWorkflowRunResponse, "ResumeWorkflowRun")
      end

      # Executes the statement.

      def run_statement(
        code : String,
        session_id : String,
        request_origin : String? = nil
      ) : Types::RunStatementResponse

        input = Types::RunStatementRequest.new(code: code, session_id: session_id, request_origin: request_origin)
        run_statement(input)
      end

      def run_statement(input : Types::RunStatementRequest) : Types::RunStatementResponse
        request = Protocol::JsonRpc.build_request(Model::RUN_STATEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RunStatementResponse, "RunStatement")
      end

      # Searches a set of tables based on properties in the table metadata as well as on the parent
      # database. You can search against text or filter conditions. You can only get tables that you have
      # access to based on the security policies defined in Lake Formation. You need at least a read-only
      # access to the table for it to be returned. If you do not have access to all the columns in the
      # table, these columns will not be searched against when returning the list of tables back to you. If
      # you have access to the columns but not the data in the columns, those columns and the associated
      # metadata for those columns will be included in the search.

      def search_tables(
        catalog_id : String? = nil,
        filters : Array(Types::PropertyPredicate)? = nil,
        include_status_details : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_share_type : String? = nil,
        search_text : String? = nil,
        sort_criteria : Array(Types::SortCriterion)? = nil
      ) : Types::SearchTablesResponse

        input = Types::SearchTablesRequest.new(catalog_id: catalog_id, filters: filters, include_status_details: include_status_details, max_results: max_results, next_token: next_token, resource_share_type: resource_share_type, search_text: search_text, sort_criteria: sort_criteria)
        search_tables(input)
      end

      def search_tables(input : Types::SearchTablesRequest) : Types::SearchTablesResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_TABLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchTablesResponse, "SearchTables")
      end

      # Starts a new run of the specified blueprint.

      def start_blueprint_run(
        blueprint_name : String,
        role_arn : String,
        parameters : String? = nil
      ) : Types::StartBlueprintRunResponse

        input = Types::StartBlueprintRunRequest.new(blueprint_name: blueprint_name, role_arn: role_arn, parameters: parameters)
        start_blueprint_run(input)
      end

      def start_blueprint_run(input : Types::StartBlueprintRunRequest) : Types::StartBlueprintRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_BLUEPRINT_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartBlueprintRunResponse, "StartBlueprintRun")
      end

      # Starts a column statistics task run, for a specified table and columns.

      def start_column_statistics_task_run(
        database_name : String,
        role : String,
        table_name : String,
        catalog_id : String? = nil,
        column_name_list : Array(String)? = nil,
        sample_size : Float64? = nil,
        security_configuration : String? = nil
      ) : Types::StartColumnStatisticsTaskRunResponse

        input = Types::StartColumnStatisticsTaskRunRequest.new(database_name: database_name, role: role, table_name: table_name, catalog_id: catalog_id, column_name_list: column_name_list, sample_size: sample_size, security_configuration: security_configuration)
        start_column_statistics_task_run(input)
      end

      def start_column_statistics_task_run(input : Types::StartColumnStatisticsTaskRunRequest) : Types::StartColumnStatisticsTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_COLUMN_STATISTICS_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartColumnStatisticsTaskRunResponse, "StartColumnStatisticsTaskRun")
      end

      # Starts a column statistics task run schedule.

      def start_column_statistics_task_run_schedule(
        database_name : String,
        table_name : String
      ) : Types::StartColumnStatisticsTaskRunScheduleResponse

        input = Types::StartColumnStatisticsTaskRunScheduleRequest.new(database_name: database_name, table_name: table_name)
        start_column_statistics_task_run_schedule(input)
      end

      def start_column_statistics_task_run_schedule(input : Types::StartColumnStatisticsTaskRunScheduleRequest) : Types::StartColumnStatisticsTaskRunScheduleResponse
        request = Protocol::JsonRpc.build_request(Model::START_COLUMN_STATISTICS_TASK_RUN_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartColumnStatisticsTaskRunScheduleResponse, "StartColumnStatisticsTaskRunSchedule")
      end

      # Starts a crawl using the specified crawler, regardless of what is scheduled. If the crawler is
      # already running, returns a CrawlerRunningException .

      def start_crawler(
        name : String
      ) : Types::StartCrawlerResponse

        input = Types::StartCrawlerRequest.new(name: name)
        start_crawler(input)
      end

      def start_crawler(input : Types::StartCrawlerRequest) : Types::StartCrawlerResponse
        request = Protocol::JsonRpc.build_request(Model::START_CRAWLER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartCrawlerResponse, "StartCrawler")
      end

      # Changes the schedule state of the specified crawler to SCHEDULED , unless the crawler is already
      # running or the schedule state is already SCHEDULED .

      def start_crawler_schedule(
        crawler_name : String
      ) : Types::StartCrawlerScheduleResponse

        input = Types::StartCrawlerScheduleRequest.new(crawler_name: crawler_name)
        start_crawler_schedule(input)
      end

      def start_crawler_schedule(input : Types::StartCrawlerScheduleRequest) : Types::StartCrawlerScheduleResponse
        request = Protocol::JsonRpc.build_request(Model::START_CRAWLER_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartCrawlerScheduleResponse, "StartCrawlerSchedule")
      end

      # Starts a recommendation run that is used to generate rules when you don't know what rules to write.
      # Glue Data Quality analyzes the data and comes up with recommendations for a potential ruleset. You
      # can then triage the ruleset and modify the generated ruleset to your liking. Recommendation runs are
      # automatically deleted after 90 days.

      def start_data_quality_rule_recommendation_run(
        data_source : Types::DataSource,
        role : String,
        client_token : String? = nil,
        created_ruleset_name : String? = nil,
        data_quality_security_configuration : String? = nil,
        number_of_workers : Int32? = nil,
        timeout : Int32? = nil
      ) : Types::StartDataQualityRuleRecommendationRunResponse

        input = Types::StartDataQualityRuleRecommendationRunRequest.new(data_source: data_source, role: role, client_token: client_token, created_ruleset_name: created_ruleset_name, data_quality_security_configuration: data_quality_security_configuration, number_of_workers: number_of_workers, timeout: timeout)
        start_data_quality_rule_recommendation_run(input)
      end

      def start_data_quality_rule_recommendation_run(input : Types::StartDataQualityRuleRecommendationRunRequest) : Types::StartDataQualityRuleRecommendationRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_DATA_QUALITY_RULE_RECOMMENDATION_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDataQualityRuleRecommendationRunResponse, "StartDataQualityRuleRecommendationRun")
      end

      # Once you have a ruleset definition (either recommended or your own), you call this operation to
      # evaluate the ruleset against a data source (Glue table). The evaluation computes results which you
      # can retrieve with the GetDataQualityResult API.

      def start_data_quality_ruleset_evaluation_run(
        data_source : Types::DataSource,
        role : String,
        ruleset_names : Array(String),
        additional_data_sources : Hash(String, Types::DataSource)? = nil,
        additional_run_options : Types::DataQualityEvaluationRunAdditionalRunOptions? = nil,
        client_token : String? = nil,
        number_of_workers : Int32? = nil,
        timeout : Int32? = nil
      ) : Types::StartDataQualityRulesetEvaluationRunResponse

        input = Types::StartDataQualityRulesetEvaluationRunRequest.new(data_source: data_source, role: role, ruleset_names: ruleset_names, additional_data_sources: additional_data_sources, additional_run_options: additional_run_options, client_token: client_token, number_of_workers: number_of_workers, timeout: timeout)
        start_data_quality_ruleset_evaluation_run(input)
      end

      def start_data_quality_ruleset_evaluation_run(input : Types::StartDataQualityRulesetEvaluationRunRequest) : Types::StartDataQualityRulesetEvaluationRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_DATA_QUALITY_RULESET_EVALUATION_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDataQualityRulesetEvaluationRunResponse, "StartDataQualityRulesetEvaluationRun")
      end

      # Begins an asynchronous task to export all labeled data for a particular transform. This task is the
      # only label-related API call that is not part of the typical active learning workflow. You typically
      # use StartExportLabelsTaskRun when you want to work with all of your existing labels at the same
      # time, such as when you want to remove or change labels that were previously submitted as truth. This
      # API operation accepts the TransformId whose labels you want to export and an Amazon Simple Storage
      # Service (Amazon S3) path to export the labels to. The operation returns a TaskRunId . You can check
      # on the status of your task run by calling the GetMLTaskRun API.

      def start_export_labels_task_run(
        output_s3_path : String,
        transform_id : String
      ) : Types::StartExportLabelsTaskRunResponse

        input = Types::StartExportLabelsTaskRunRequest.new(output_s3_path: output_s3_path, transform_id: transform_id)
        start_export_labels_task_run(input)
      end

      def start_export_labels_task_run(input : Types::StartExportLabelsTaskRunRequest) : Types::StartExportLabelsTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_EXPORT_LABELS_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartExportLabelsTaskRunResponse, "StartExportLabelsTaskRun")
      end

      # Enables you to provide additional labels (examples of truth) to be used to teach the machine
      # learning transform and improve its quality. This API operation is generally used as part of the
      # active learning workflow that starts with the StartMLLabelingSetGenerationTaskRun call and that
      # ultimately results in improving the quality of your machine learning transform. After the
      # StartMLLabelingSetGenerationTaskRun finishes, Glue machine learning will have generated a series of
      # questions for humans to answer. (Answering these questions is often called 'labeling' in the machine
      # learning workflows). In the case of the FindMatches transform, these questions are of the form,
      # “What is the correct way to group these rows together into groups composed entirely of matching
      # records?” After the labeling process is finished, users upload their answers/labels with a call to
      # StartImportLabelsTaskRun . After StartImportLabelsTaskRun finishes, all future runs of the machine
      # learning transform use the new and improved labels and perform a higher-quality transformation. By
      # default, StartMLLabelingSetGenerationTaskRun continually learns from and combines all labels that
      # you upload unless you set Replace to true. If you set Replace to true, StartImportLabelsTaskRun
      # deletes and forgets all previously uploaded labels and learns only from the exact set that you
      # upload. Replacing labels can be helpful if you realize that you previously uploaded incorrect
      # labels, and you believe that they are having a negative effect on your transform quality. You can
      # check on the status of your task run by calling the GetMLTaskRun operation.

      def start_import_labels_task_run(
        input_s3_path : String,
        transform_id : String,
        replace_all_labels : Bool? = nil
      ) : Types::StartImportLabelsTaskRunResponse

        input = Types::StartImportLabelsTaskRunRequest.new(input_s3_path: input_s3_path, transform_id: transform_id, replace_all_labels: replace_all_labels)
        start_import_labels_task_run(input)
      end

      def start_import_labels_task_run(input : Types::StartImportLabelsTaskRunRequest) : Types::StartImportLabelsTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_IMPORT_LABELS_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartImportLabelsTaskRunResponse, "StartImportLabelsTaskRun")
      end

      # Starts a job run using a job definition.

      def start_job_run(
        job_name : String,
        allocated_capacity : Int32? = nil,
        arguments : Hash(String, String)? = nil,
        execution_class : String? = nil,
        execution_role_session_policy : String? = nil,
        job_run_id : String? = nil,
        job_run_queuing_enabled : Bool? = nil,
        max_capacity : Float64? = nil,
        notification_property : Types::NotificationProperty? = nil,
        number_of_workers : Int32? = nil,
        security_configuration : String? = nil,
        timeout : Int32? = nil,
        worker_type : String? = nil
      ) : Types::StartJobRunResponse

        input = Types::StartJobRunRequest.new(job_name: job_name, allocated_capacity: allocated_capacity, arguments: arguments, execution_class: execution_class, execution_role_session_policy: execution_role_session_policy, job_run_id: job_run_id, job_run_queuing_enabled: job_run_queuing_enabled, max_capacity: max_capacity, notification_property: notification_property, number_of_workers: number_of_workers, security_configuration: security_configuration, timeout: timeout, worker_type: worker_type)
        start_job_run(input)
      end

      def start_job_run(input : Types::StartJobRunRequest) : Types::StartJobRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_JOB_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartJobRunResponse, "StartJobRun")
      end

      # Starts a task to estimate the quality of the transform. When you provide label sets as examples of
      # truth, Glue machine learning uses some of those examples to learn from them. The rest of the labels
      # are used as a test to estimate quality. Returns a unique identifier for the run. You can call
      # GetMLTaskRun to get more information about the stats of the EvaluationTaskRun .

      def start_ml_evaluation_task_run(
        transform_id : String
      ) : Types::StartMLEvaluationTaskRunResponse

        input = Types::StartMLEvaluationTaskRunRequest.new(transform_id: transform_id)
        start_ml_evaluation_task_run(input)
      end

      def start_ml_evaluation_task_run(input : Types::StartMLEvaluationTaskRunRequest) : Types::StartMLEvaluationTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_ML_EVALUATION_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMLEvaluationTaskRunResponse, "StartMLEvaluationTaskRun")
      end

      # Starts the active learning workflow for your machine learning transform to improve the transform's
      # quality by generating label sets and adding labels. When the StartMLLabelingSetGenerationTaskRun
      # finishes, Glue will have generated a "labeling set" or a set of questions for humans to answer. In
      # the case of the FindMatches transform, these questions are of the form, “What is the correct way to
      # group these rows together into groups composed entirely of matching records?” After the labeling
      # process is finished, you can upload your labels with a call to StartImportLabelsTaskRun . After
      # StartImportLabelsTaskRun finishes, all future runs of the machine learning transform will use the
      # new and improved labels and perform a higher-quality transformation. Note: The role used to write
      # the generated labeling set to the OutputS3Path is the role associated with the Machine Learning
      # Transform, specified in the CreateMLTransform API.

      def start_ml_labeling_set_generation_task_run(
        output_s3_path : String,
        transform_id : String
      ) : Types::StartMLLabelingSetGenerationTaskRunResponse

        input = Types::StartMLLabelingSetGenerationTaskRunRequest.new(output_s3_path: output_s3_path, transform_id: transform_id)
        start_ml_labeling_set_generation_task_run(input)
      end

      def start_ml_labeling_set_generation_task_run(input : Types::StartMLLabelingSetGenerationTaskRunRequest) : Types::StartMLLabelingSetGenerationTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_ML_LABELING_SET_GENERATION_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMLLabelingSetGenerationTaskRunResponse, "StartMLLabelingSetGenerationTaskRun")
      end

      # Starts a materialized view refresh task run, for a specified table and columns.

      def start_materialized_view_refresh_task_run(
        catalog_id : String,
        database_name : String,
        table_name : String,
        full_refresh : Bool? = nil
      ) : Types::StartMaterializedViewRefreshTaskRunResponse

        input = Types::StartMaterializedViewRefreshTaskRunRequest.new(catalog_id: catalog_id, database_name: database_name, table_name: table_name, full_refresh: full_refresh)
        start_materialized_view_refresh_task_run(input)
      end

      def start_materialized_view_refresh_task_run(input : Types::StartMaterializedViewRefreshTaskRunRequest) : Types::StartMaterializedViewRefreshTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_MATERIALIZED_VIEW_REFRESH_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMaterializedViewRefreshTaskRunResponse, "StartMaterializedViewRefreshTaskRun")
      end

      # Starts an existing trigger. See Triggering Jobs for information about how different types of trigger
      # are started.

      def start_trigger(
        name : String
      ) : Types::StartTriggerResponse

        input = Types::StartTriggerRequest.new(name: name)
        start_trigger(input)
      end

      def start_trigger(input : Types::StartTriggerRequest) : Types::StartTriggerResponse
        request = Protocol::JsonRpc.build_request(Model::START_TRIGGER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartTriggerResponse, "StartTrigger")
      end

      # Starts a new run of the specified workflow.

      def start_workflow_run(
        name : String,
        run_properties : Hash(String, String)? = nil
      ) : Types::StartWorkflowRunResponse

        input = Types::StartWorkflowRunRequest.new(name: name, run_properties: run_properties)
        start_workflow_run(input)
      end

      def start_workflow_run(input : Types::StartWorkflowRunRequest) : Types::StartWorkflowRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_WORKFLOW_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartWorkflowRunResponse, "StartWorkflowRun")
      end

      # Stops a task run for the specified table.

      def stop_column_statistics_task_run(
        database_name : String,
        table_name : String
      ) : Types::StopColumnStatisticsTaskRunResponse

        input = Types::StopColumnStatisticsTaskRunRequest.new(database_name: database_name, table_name: table_name)
        stop_column_statistics_task_run(input)
      end

      def stop_column_statistics_task_run(input : Types::StopColumnStatisticsTaskRunRequest) : Types::StopColumnStatisticsTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_COLUMN_STATISTICS_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopColumnStatisticsTaskRunResponse, "StopColumnStatisticsTaskRun")
      end

      # Stops a column statistics task run schedule.

      def stop_column_statistics_task_run_schedule(
        database_name : String,
        table_name : String
      ) : Types::StopColumnStatisticsTaskRunScheduleResponse

        input = Types::StopColumnStatisticsTaskRunScheduleRequest.new(database_name: database_name, table_name: table_name)
        stop_column_statistics_task_run_schedule(input)
      end

      def stop_column_statistics_task_run_schedule(input : Types::StopColumnStatisticsTaskRunScheduleRequest) : Types::StopColumnStatisticsTaskRunScheduleResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_COLUMN_STATISTICS_TASK_RUN_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopColumnStatisticsTaskRunScheduleResponse, "StopColumnStatisticsTaskRunSchedule")
      end

      # If the specified crawler is running, stops the crawl.

      def stop_crawler(
        name : String
      ) : Types::StopCrawlerResponse

        input = Types::StopCrawlerRequest.new(name: name)
        stop_crawler(input)
      end

      def stop_crawler(input : Types::StopCrawlerRequest) : Types::StopCrawlerResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_CRAWLER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopCrawlerResponse, "StopCrawler")
      end

      # Sets the schedule state of the specified crawler to NOT_SCHEDULED , but does not stop the crawler if
      # it is already running.

      def stop_crawler_schedule(
        crawler_name : String
      ) : Types::StopCrawlerScheduleResponse

        input = Types::StopCrawlerScheduleRequest.new(crawler_name: crawler_name)
        stop_crawler_schedule(input)
      end

      def stop_crawler_schedule(input : Types::StopCrawlerScheduleRequest) : Types::StopCrawlerScheduleResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_CRAWLER_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopCrawlerScheduleResponse, "StopCrawlerSchedule")
      end

      # Stops a materialized view refresh task run, for a specified table and columns.

      def stop_materialized_view_refresh_task_run(
        catalog_id : String,
        database_name : String,
        table_name : String
      ) : Types::StopMaterializedViewRefreshTaskRunResponse

        input = Types::StopMaterializedViewRefreshTaskRunRequest.new(catalog_id: catalog_id, database_name: database_name, table_name: table_name)
        stop_materialized_view_refresh_task_run(input)
      end

      def stop_materialized_view_refresh_task_run(input : Types::StopMaterializedViewRefreshTaskRunRequest) : Types::StopMaterializedViewRefreshTaskRunResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_MATERIALIZED_VIEW_REFRESH_TASK_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopMaterializedViewRefreshTaskRunResponse, "StopMaterializedViewRefreshTaskRun")
      end

      # Stops the session.

      def stop_session(
        id : String,
        request_origin : String? = nil
      ) : Types::StopSessionResponse

        input = Types::StopSessionRequest.new(id: id, request_origin: request_origin)
        stop_session(input)
      end

      def stop_session(input : Types::StopSessionRequest) : Types::StopSessionResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopSessionResponse, "StopSession")
      end

      # Stops a specified trigger.

      def stop_trigger(
        name : String
      ) : Types::StopTriggerResponse

        input = Types::StopTriggerRequest.new(name: name)
        stop_trigger(input)
      end

      def stop_trigger(input : Types::StopTriggerRequest) : Types::StopTriggerResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_TRIGGER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopTriggerResponse, "StopTrigger")
      end

      # Stops the execution of the specified workflow run.

      def stop_workflow_run(
        name : String,
        run_id : String
      ) : Types::StopWorkflowRunResponse

        input = Types::StopWorkflowRunRequest.new(name: name, run_id: run_id)
        stop_workflow_run(input)
      end

      def stop_workflow_run(input : Types::StopWorkflowRunRequest) : Types::StopWorkflowRunResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_WORKFLOW_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopWorkflowRunResponse, "StopWorkflowRun")
      end

      # Adds tags to a resource. A tag is a label you can assign to an Amazon Web Services resource. In
      # Glue, you can tag only certain resources. For information about what resources you can tag, see
      # Amazon Web Services Tags in Glue .

      def tag_resource(
        resource_arn : String,
        tags_to_add : Hash(String, String)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags_to_add: tags_to_add)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Tests a connection to a service to validate the service credentials that you provide. You can either
      # provide an existing connection name or a TestConnectionInput for testing a non-existing connection
      # input. Providing both at the same time will cause an error. If the action is successful, the service
      # sends back an HTTP 200 response.

      def test_connection(
        catalog_id : String? = nil,
        connection_name : String? = nil,
        test_connection_input : Types::TestConnectionInput? = nil
      ) : Types::TestConnectionResponse

        input = Types::TestConnectionRequest.new(catalog_id: catalog_id, connection_name: connection_name, test_connection_input: test_connection_input)
        test_connection(input)
      end

      def test_connection(input : Types::TestConnectionRequest) : Types::TestConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::TEST_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestConnectionResponse, "TestConnection")
      end

      # Removes tags from a resource.

      def untag_resource(
        resource_arn : String,
        tags_to_remove : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tags_to_remove: tags_to_remove)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates a registered blueprint.

      def update_blueprint(
        blueprint_location : String,
        name : String,
        description : String? = nil
      ) : Types::UpdateBlueprintResponse

        input = Types::UpdateBlueprintRequest.new(blueprint_location: blueprint_location, name: name, description: description)
        update_blueprint(input)
      end

      def update_blueprint(input : Types::UpdateBlueprintRequest) : Types::UpdateBlueprintResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BLUEPRINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBlueprintResponse, "UpdateBlueprint")
      end

      # Updates an existing catalog's properties in the Glue Data Catalog.

      def update_catalog(
        catalog_id : String,
        catalog_input : Types::CatalogInput
      ) : Types::UpdateCatalogResponse

        input = Types::UpdateCatalogRequest.new(catalog_id: catalog_id, catalog_input: catalog_input)
        update_catalog(input)
      end

      def update_catalog(input : Types::UpdateCatalogRequest) : Types::UpdateCatalogResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CATALOG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCatalogResponse, "UpdateCatalog")
      end

      # Modifies an existing classifier (a GrokClassifier , an XMLClassifier , a JsonClassifier , or a
      # CsvClassifier , depending on which field is present).

      def update_classifier(
        csv_classifier : Types::UpdateCsvClassifierRequest? = nil,
        grok_classifier : Types::UpdateGrokClassifierRequest? = nil,
        json_classifier : Types::UpdateJsonClassifierRequest? = nil,
        xml_classifier : Types::UpdateXMLClassifierRequest? = nil
      ) : Types::UpdateClassifierResponse

        input = Types::UpdateClassifierRequest.new(csv_classifier: csv_classifier, grok_classifier: grok_classifier, json_classifier: json_classifier, xml_classifier: xml_classifier)
        update_classifier(input)
      end

      def update_classifier(input : Types::UpdateClassifierRequest) : Types::UpdateClassifierResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLASSIFIER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClassifierResponse, "UpdateClassifier")
      end

      # Creates or updates partition statistics of columns. The Identity and Access Management (IAM)
      # permission required for this operation is UpdatePartition .

      def update_column_statistics_for_partition(
        column_statistics_list : Array(Types::ColumnStatistics),
        database_name : String,
        partition_values : Array(String),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::UpdateColumnStatisticsForPartitionResponse

        input = Types::UpdateColumnStatisticsForPartitionRequest.new(column_statistics_list: column_statistics_list, database_name: database_name, partition_values: partition_values, table_name: table_name, catalog_id: catalog_id)
        update_column_statistics_for_partition(input)
      end

      def update_column_statistics_for_partition(input : Types::UpdateColumnStatisticsForPartitionRequest) : Types::UpdateColumnStatisticsForPartitionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COLUMN_STATISTICS_FOR_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateColumnStatisticsForPartitionResponse, "UpdateColumnStatisticsForPartition")
      end

      # Creates or updates table statistics of columns. The Identity and Access Management (IAM) permission
      # required for this operation is UpdateTable .

      def update_column_statistics_for_table(
        column_statistics_list : Array(Types::ColumnStatistics),
        database_name : String,
        table_name : String,
        catalog_id : String? = nil
      ) : Types::UpdateColumnStatisticsForTableResponse

        input = Types::UpdateColumnStatisticsForTableRequest.new(column_statistics_list: column_statistics_list, database_name: database_name, table_name: table_name, catalog_id: catalog_id)
        update_column_statistics_for_table(input)
      end

      def update_column_statistics_for_table(input : Types::UpdateColumnStatisticsForTableRequest) : Types::UpdateColumnStatisticsForTableResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COLUMN_STATISTICS_FOR_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateColumnStatisticsForTableResponse, "UpdateColumnStatisticsForTable")
      end

      # Updates settings for a column statistics task.

      def update_column_statistics_task_settings(
        database_name : String,
        table_name : String,
        catalog_id : String? = nil,
        column_name_list : Array(String)? = nil,
        role : String? = nil,
        sample_size : Float64? = nil,
        schedule : String? = nil,
        security_configuration : String? = nil
      ) : Types::UpdateColumnStatisticsTaskSettingsResponse

        input = Types::UpdateColumnStatisticsTaskSettingsRequest.new(database_name: database_name, table_name: table_name, catalog_id: catalog_id, column_name_list: column_name_list, role: role, sample_size: sample_size, schedule: schedule, security_configuration: security_configuration)
        update_column_statistics_task_settings(input)
      end

      def update_column_statistics_task_settings(input : Types::UpdateColumnStatisticsTaskSettingsRequest) : Types::UpdateColumnStatisticsTaskSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COLUMN_STATISTICS_TASK_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateColumnStatisticsTaskSettingsResponse, "UpdateColumnStatisticsTaskSettings")
      end

      # Updates a connection definition in the Data Catalog.

      def update_connection(
        connection_input : Types::ConnectionInput,
        name : String,
        catalog_id : String? = nil
      ) : Types::UpdateConnectionResponse

        input = Types::UpdateConnectionRequest.new(connection_input: connection_input, name: name, catalog_id: catalog_id)
        update_connection(input)
      end

      def update_connection(input : Types::UpdateConnectionRequest) : Types::UpdateConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateConnectionResponse, "UpdateConnection")
      end

      # Updates a crawler. If a crawler is running, you must stop it using StopCrawler before updating it.

      def update_crawler(
        name : String,
        classifiers : Array(String)? = nil,
        configuration : String? = nil,
        crawler_security_configuration : String? = nil,
        database_name : String? = nil,
        description : String? = nil,
        lake_formation_configuration : Types::LakeFormationConfiguration? = nil,
        lineage_configuration : Types::LineageConfiguration? = nil,
        recrawl_policy : Types::RecrawlPolicy? = nil,
        role : String? = nil,
        schedule : String? = nil,
        schema_change_policy : Types::SchemaChangePolicy? = nil,
        table_prefix : String? = nil,
        targets : Types::CrawlerTargets? = nil
      ) : Types::UpdateCrawlerResponse

        input = Types::UpdateCrawlerRequest.new(name: name, classifiers: classifiers, configuration: configuration, crawler_security_configuration: crawler_security_configuration, database_name: database_name, description: description, lake_formation_configuration: lake_formation_configuration, lineage_configuration: lineage_configuration, recrawl_policy: recrawl_policy, role: role, schedule: schedule, schema_change_policy: schema_change_policy, table_prefix: table_prefix, targets: targets)
        update_crawler(input)
      end

      def update_crawler(input : Types::UpdateCrawlerRequest) : Types::UpdateCrawlerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CRAWLER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCrawlerResponse, "UpdateCrawler")
      end

      # Updates the schedule of a crawler using a cron expression.

      def update_crawler_schedule(
        crawler_name : String,
        schedule : String? = nil
      ) : Types::UpdateCrawlerScheduleResponse

        input = Types::UpdateCrawlerScheduleRequest.new(crawler_name: crawler_name, schedule: schedule)
        update_crawler_schedule(input)
      end

      def update_crawler_schedule(input : Types::UpdateCrawlerScheduleRequest) : Types::UpdateCrawlerScheduleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CRAWLER_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCrawlerScheduleResponse, "UpdateCrawlerSchedule")
      end

      # Updates the specified data quality ruleset.

      def update_data_quality_ruleset(
        name : String,
        description : String? = nil,
        ruleset : String? = nil
      ) : Types::UpdateDataQualityRulesetResponse

        input = Types::UpdateDataQualityRulesetRequest.new(name: name, description: description, ruleset: ruleset)
        update_data_quality_ruleset(input)
      end

      def update_data_quality_ruleset(input : Types::UpdateDataQualityRulesetRequest) : Types::UpdateDataQualityRulesetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATA_QUALITY_RULESET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDataQualityRulesetResponse, "UpdateDataQualityRuleset")
      end

      # Updates an existing database definition in a Data Catalog.

      def update_database(
        database_input : Types::DatabaseInput,
        name : String,
        catalog_id : String? = nil
      ) : Types::UpdateDatabaseResponse

        input = Types::UpdateDatabaseRequest.new(database_input: database_input, name: name, catalog_id: catalog_id)
        update_database(input)
      end

      def update_database(input : Types::UpdateDatabaseRequest) : Types::UpdateDatabaseResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATABASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDatabaseResponse, "UpdateDatabase")
      end

      # Updates a specified development endpoint.

      def update_dev_endpoint(
        endpoint_name : String,
        add_arguments : Hash(String, String)? = nil,
        add_public_keys : Array(String)? = nil,
        custom_libraries : Types::DevEndpointCustomLibraries? = nil,
        delete_arguments : Array(String)? = nil,
        delete_public_keys : Array(String)? = nil,
        public_key : String? = nil,
        update_etl_libraries : Bool? = nil
      ) : Types::UpdateDevEndpointResponse

        input = Types::UpdateDevEndpointRequest.new(endpoint_name: endpoint_name, add_arguments: add_arguments, add_public_keys: add_public_keys, custom_libraries: custom_libraries, delete_arguments: delete_arguments, delete_public_keys: delete_public_keys, public_key: public_key, update_etl_libraries: update_etl_libraries)
        update_dev_endpoint(input)
      end

      def update_dev_endpoint(input : Types::UpdateDevEndpointRequest) : Types::UpdateDevEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEV_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDevEndpointResponse, "UpdateDevEndpoint")
      end

      # Updates the existing Glue Identity Center configuration, allowing modification of scopes and
      # permissions for the integration.

      def update_glue_identity_center_configuration(
        scopes : Array(String)? = nil,
        user_background_sessions_enabled : Bool? = nil
      ) : Types::UpdateGlueIdentityCenterConfigurationResponse

        input = Types::UpdateGlueIdentityCenterConfigurationRequest.new(scopes: scopes, user_background_sessions_enabled: user_background_sessions_enabled)
        update_glue_identity_center_configuration(input)
      end

      def update_glue_identity_center_configuration(input : Types::UpdateGlueIdentityCenterConfigurationRequest) : Types::UpdateGlueIdentityCenterConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GLUE_IDENTITY_CENTER_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGlueIdentityCenterConfigurationResponse, "UpdateGlueIdentityCenterConfiguration")
      end

      # This API can be used for updating the ResourceProperty of the Glue connection (for the source) or
      # Glue database ARN (for the target). These properties can include the role to access the connection
      # or database. Since the same resource can be used across multiple integrations, updating resource
      # properties will impact all the integrations using it.

      def update_integration_resource_property(
        resource_arn : String,
        source_processing_properties : Types::SourceProcessingProperties? = nil,
        target_processing_properties : Types::TargetProcessingProperties? = nil
      ) : Types::UpdateIntegrationResourcePropertyResponse

        input = Types::UpdateIntegrationResourcePropertyRequest.new(resource_arn: resource_arn, source_processing_properties: source_processing_properties, target_processing_properties: target_processing_properties)
        update_integration_resource_property(input)
      end

      def update_integration_resource_property(input : Types::UpdateIntegrationResourcePropertyRequest) : Types::UpdateIntegrationResourcePropertyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INTEGRATION_RESOURCE_PROPERTY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateIntegrationResourcePropertyResponse, "UpdateIntegrationResourceProperty")
      end

      # This API is used to provide optional override properties for the tables that need to be replicated.
      # These properties can include properties for filtering and partitioning for the source and target
      # tables. To set both source and target properties the same API need to be invoked with the Glue
      # connection ARN as ResourceArn with SourceTableConfig , and the Glue database ARN as ResourceArn with
      # TargetTableConfig respectively. The override will be reflected across all the integrations using
      # same ResourceArn and source table.

      def update_integration_table_properties(
        resource_arn : String,
        table_name : String,
        source_table_config : Types::SourceTableConfig? = nil,
        target_table_config : Types::TargetTableConfig? = nil
      ) : Types::UpdateIntegrationTablePropertiesResponse

        input = Types::UpdateIntegrationTablePropertiesRequest.new(resource_arn: resource_arn, table_name: table_name, source_table_config: source_table_config, target_table_config: target_table_config)
        update_integration_table_properties(input)
      end

      def update_integration_table_properties(input : Types::UpdateIntegrationTablePropertiesRequest) : Types::UpdateIntegrationTablePropertiesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INTEGRATION_TABLE_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateIntegrationTablePropertiesResponse, "UpdateIntegrationTableProperties")
      end

      # Updates an existing job definition. The previous job definition is completely overwritten by this
      # information.

      def update_job(
        job_name : String,
        job_update : Types::JobUpdate
      ) : Types::UpdateJobResponse

        input = Types::UpdateJobRequest.new(job_name: job_name, job_update: job_update)
        update_job(input)
      end

      def update_job(input : Types::UpdateJobRequest) : Types::UpdateJobResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateJobResponse, "UpdateJob")
      end

      # Synchronizes a job from the source control repository. This operation takes the job artifacts that
      # are located in the remote repository and updates the Glue internal stores with these artifacts. This
      # API supports optional parameters which take in the repository information.

      def update_job_from_source_control(
        auth_strategy : String? = nil,
        auth_token : String? = nil,
        branch_name : String? = nil,
        commit_id : String? = nil,
        folder : String? = nil,
        job_name : String? = nil,
        provider : String? = nil,
        repository_name : String? = nil,
        repository_owner : String? = nil
      ) : Types::UpdateJobFromSourceControlResponse

        input = Types::UpdateJobFromSourceControlRequest.new(auth_strategy: auth_strategy, auth_token: auth_token, branch_name: branch_name, commit_id: commit_id, folder: folder, job_name: job_name, provider: provider, repository_name: repository_name, repository_owner: repository_owner)
        update_job_from_source_control(input)
      end

      def update_job_from_source_control(input : Types::UpdateJobFromSourceControlRequest) : Types::UpdateJobFromSourceControlResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_JOB_FROM_SOURCE_CONTROL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateJobFromSourceControlResponse, "UpdateJobFromSourceControl")
      end

      # Updates an existing machine learning transform. Call this operation to tune the algorithm parameters
      # to achieve better results. After calling this operation, you can call the StartMLEvaluationTaskRun
      # operation to assess how well your new parameters achieved your goals (such as improving the quality
      # of your machine learning transform, or making it more cost-effective).

      def update_ml_transform(
        transform_id : String,
        description : String? = nil,
        glue_version : String? = nil,
        max_capacity : Float64? = nil,
        max_retries : Int32? = nil,
        name : String? = nil,
        number_of_workers : Int32? = nil,
        parameters : Types::TransformParameters? = nil,
        role : String? = nil,
        timeout : Int32? = nil,
        worker_type : String? = nil
      ) : Types::UpdateMLTransformResponse

        input = Types::UpdateMLTransformRequest.new(transform_id: transform_id, description: description, glue_version: glue_version, max_capacity: max_capacity, max_retries: max_retries, name: name, number_of_workers: number_of_workers, parameters: parameters, role: role, timeout: timeout, worker_type: worker_type)
        update_ml_transform(input)
      end

      def update_ml_transform(input : Types::UpdateMLTransformRequest) : Types::UpdateMLTransformResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ML_TRANSFORM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMLTransformResponse, "UpdateMLTransform")
      end

      # Updates a partition.

      def update_partition(
        database_name : String,
        partition_input : Types::PartitionInput,
        partition_value_list : Array(String),
        table_name : String,
        catalog_id : String? = nil
      ) : Types::UpdatePartitionResponse

        input = Types::UpdatePartitionRequest.new(database_name: database_name, partition_input: partition_input, partition_value_list: partition_value_list, table_name: table_name, catalog_id: catalog_id)
        update_partition(input)
      end

      def update_partition(input : Types::UpdatePartitionRequest) : Types::UpdatePartitionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PARTITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePartitionResponse, "UpdatePartition")
      end

      # Updates an existing registry which is used to hold a collection of schemas. The updated properties
      # relate to the registry, and do not modify any of the schemas within the registry.

      def update_registry(
        description : String,
        registry_id : Types::RegistryId
      ) : Types::UpdateRegistryResponse

        input = Types::UpdateRegistryInput.new(description: description, registry_id: registry_id)
        update_registry(input)
      end

      def update_registry(input : Types::UpdateRegistryInput) : Types::UpdateRegistryResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REGISTRY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRegistryResponse, "UpdateRegistry")
      end

      # Updates the description, compatibility setting, or version checkpoint for a schema set. For updating
      # the compatibility setting, the call will not validate compatibility for the entire set of schema
      # versions with the new compatibility setting. If the value for Compatibility is provided, the
      # VersionNumber (a checkpoint) is also required. The API will validate the checkpoint version number
      # for consistency. If the value for the VersionNumber (checkpoint) is provided, Compatibility is
      # optional and this can be used to set/reset a checkpoint for the schema. This update will happen only
      # if the schema is in the AVAILABLE state.

      def update_schema(
        schema_id : Types::SchemaId,
        compatibility : String? = nil,
        description : String? = nil,
        schema_version_number : Types::SchemaVersionNumber? = nil
      ) : Types::UpdateSchemaResponse

        input = Types::UpdateSchemaInput.new(schema_id: schema_id, compatibility: compatibility, description: description, schema_version_number: schema_version_number)
        update_schema(input)
      end

      def update_schema(input : Types::UpdateSchemaInput) : Types::UpdateSchemaResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSchemaResponse, "UpdateSchema")
      end

      # Synchronizes a job to the source control repository. This operation takes the job artifacts from the
      # Glue internal stores and makes a commit to the remote repository that is configured on the job. This
      # API supports optional parameters which take in the repository information.

      def update_source_control_from_job(
        auth_strategy : String? = nil,
        auth_token : String? = nil,
        branch_name : String? = nil,
        commit_id : String? = nil,
        folder : String? = nil,
        job_name : String? = nil,
        provider : String? = nil,
        repository_name : String? = nil,
        repository_owner : String? = nil
      ) : Types::UpdateSourceControlFromJobResponse

        input = Types::UpdateSourceControlFromJobRequest.new(auth_strategy: auth_strategy, auth_token: auth_token, branch_name: branch_name, commit_id: commit_id, folder: folder, job_name: job_name, provider: provider, repository_name: repository_name, repository_owner: repository_owner)
        update_source_control_from_job(input)
      end

      def update_source_control_from_job(input : Types::UpdateSourceControlFromJobRequest) : Types::UpdateSourceControlFromJobResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SOURCE_CONTROL_FROM_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSourceControlFromJobResponse, "UpdateSourceControlFromJob")
      end

      # Updates a metadata table in the Data Catalog.

      def update_table(
        database_name : String,
        catalog_id : String? = nil,
        force : Bool? = nil,
        name : String? = nil,
        skip_archive : Bool? = nil,
        table_input : Types::TableInput? = nil,
        transaction_id : String? = nil,
        update_open_table_format_input : Types::UpdateOpenTableFormatInput? = nil,
        version_id : String? = nil,
        view_update_action : String? = nil
      ) : Types::UpdateTableResponse

        input = Types::UpdateTableRequest.new(database_name: database_name, catalog_id: catalog_id, force: force, name: name, skip_archive: skip_archive, table_input: table_input, transaction_id: transaction_id, update_open_table_format_input: update_open_table_format_input, version_id: version_id, view_update_action: view_update_action)
        update_table(input)
      end

      def update_table(input : Types::UpdateTableRequest) : Types::UpdateTableResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTableResponse, "UpdateTable")
      end

      # Updates the configuration for an existing table optimizer.

      def update_table_optimizer(
        catalog_id : String,
        database_name : String,
        table_name : String,
        table_optimizer_configuration : Types::TableOptimizerConfiguration,
        type : String
      ) : Types::UpdateTableOptimizerResponse

        input = Types::UpdateTableOptimizerRequest.new(catalog_id: catalog_id, database_name: database_name, table_name: table_name, table_optimizer_configuration: table_optimizer_configuration, type: type)
        update_table_optimizer(input)
      end

      def update_table_optimizer(input : Types::UpdateTableOptimizerRequest) : Types::UpdateTableOptimizerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TABLE_OPTIMIZER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTableOptimizerResponse, "UpdateTableOptimizer")
      end

      # Updates a trigger definition. Job arguments may be logged. Do not pass plaintext secrets as
      # arguments. Retrieve secrets from a Glue Connection, Amazon Web Services Secrets Manager or other
      # secret management mechanism if you intend to keep them within the Job.

      def update_trigger(
        name : String,
        trigger_update : Types::TriggerUpdate
      ) : Types::UpdateTriggerResponse

        input = Types::UpdateTriggerRequest.new(name: name, trigger_update: trigger_update)
        update_trigger(input)
      end

      def update_trigger(input : Types::UpdateTriggerRequest) : Types::UpdateTriggerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TRIGGER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTriggerResponse, "UpdateTrigger")
      end

      # Update an Glue usage profile.

      def update_usage_profile(
        configuration : Types::ProfileConfiguration,
        name : String,
        description : String? = nil
      ) : Types::UpdateUsageProfileResponse

        input = Types::UpdateUsageProfileRequest.new(configuration: configuration, name: name, description: description)
        update_usage_profile(input)
      end

      def update_usage_profile(input : Types::UpdateUsageProfileRequest) : Types::UpdateUsageProfileResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USAGE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUsageProfileResponse, "UpdateUsageProfile")
      end

      # Updates an existing function definition in the Data Catalog.

      def update_user_defined_function(
        database_name : String,
        function_input : Types::UserDefinedFunctionInput,
        function_name : String,
        catalog_id : String? = nil
      ) : Types::UpdateUserDefinedFunctionResponse

        input = Types::UpdateUserDefinedFunctionRequest.new(database_name: database_name, function_input: function_input, function_name: function_name, catalog_id: catalog_id)
        update_user_defined_function(input)
      end

      def update_user_defined_function(input : Types::UpdateUserDefinedFunctionRequest) : Types::UpdateUserDefinedFunctionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER_DEFINED_FUNCTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserDefinedFunctionResponse, "UpdateUserDefinedFunction")
      end

      # Updates an existing workflow.

      def update_workflow(
        name : String,
        default_run_properties : Hash(String, String)? = nil,
        description : String? = nil,
        max_concurrent_runs : Int32? = nil
      ) : Types::UpdateWorkflowResponse

        input = Types::UpdateWorkflowRequest.new(name: name, default_run_properties: default_run_properties, description: description, max_concurrent_runs: max_concurrent_runs)
        update_workflow(input)
      end

      def update_workflow(input : Types::UpdateWorkflowRequest) : Types::UpdateWorkflowResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkflowResponse, "UpdateWorkflow")
      end
    end
  end
end
