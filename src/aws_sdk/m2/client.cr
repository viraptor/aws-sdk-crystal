module AwsSdk
  module M2
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Cancels the running of a specific batch job execution.
      def cancel_batch_job_execution(
        application_id : String,
        execution_id : String,
        auth_secrets_manager_arn : String? = nil
      ) : Protocol::Request
        input = Types::CancelBatchJobExecutionRequest.new(application_id: application_id, execution_id: execution_id, auth_secrets_manager_arn: auth_secrets_manager_arn)
        cancel_batch_job_execution(input)
      end
      def cancel_batch_job_execution(input : Types::CancelBatchJobExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_BATCH_JOB_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new application with given parameters. Requires an existing runtime environment and
      # application definition file.
      def create_application(
        definition : Types::Definition,
        engine_type : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        kms_key_id : String? = nil,
        role_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(definition: definition, engine_type: engine_type, name: name, client_token: client_token, description: description, kms_key_id: kms_key_id, role_arn: role_arn, tags: tags)
        create_application(input)
      end
      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a data set export task for a specific application.
      def create_data_set_export_task(
        application_id : String,
        export_config : Types::DataSetExportConfig,
        client_token : String? = nil,
        kms_key_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateDataSetExportTaskRequest.new(application_id: application_id, export_config: export_config, client_token: client_token, kms_key_id: kms_key_id)
        create_data_set_export_task(input)
      end
      def create_data_set_export_task(input : Types::CreateDataSetExportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_SET_EXPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a data set import task for a specific application.
      def create_data_set_import_task(
        application_id : String,
        import_config : Types::DataSetImportConfig,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateDataSetImportTaskRequest.new(application_id: application_id, import_config: import_config, client_token: client_token)
        create_data_set_import_task(input)
      end
      def create_data_set_import_task(input : Types::CreateDataSetImportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_SET_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and starts a deployment to deploy an application into a runtime environment.
      def create_deployment(
        application_id : String,
        application_version : Int32,
        environment_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateDeploymentRequest.new(application_id: application_id, application_version: application_version, environment_id: environment_id, client_token: client_token)
        create_deployment(input)
      end
      def create_deployment(input : Types::CreateDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a runtime environment for a given runtime engine.
      def create_environment(
        engine_type : String,
        instance_type : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        engine_version : String? = nil,
        high_availability_config : Types::HighAvailabilityConfig? = nil,
        kms_key_id : String? = nil,
        network_type : String? = nil,
        preferred_maintenance_window : String? = nil,
        publicly_accessible : Bool? = nil,
        security_group_ids : Array(String)? = nil,
        storage_configurations : Array(Types::StorageConfiguration)? = nil,
        subnet_ids : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentRequest.new(engine_type: engine_type, instance_type: instance_type, name: name, client_token: client_token, description: description, engine_version: engine_version, high_availability_config: high_availability_config, kms_key_id: kms_key_id, network_type: network_type, preferred_maintenance_window: preferred_maintenance_window, publicly_accessible: publicly_accessible, security_group_ids: security_group_ids, storage_configurations: storage_configurations, subnet_ids: subnet_ids, tags: tags)
        create_environment(input)
      end
      def create_environment(input : Types::CreateEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific application. You cannot delete a running application.
      def delete_application(
        application_id : String
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(application_id: application_id)
        delete_application(input)
      end
      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific application from the specific runtime environment where it was previously
      # deployed. You cannot delete a runtime environment using DeleteEnvironment if any application has
      # ever been deployed to it. This API removes the association of the application with the runtime
      # environment so you can delete the environment smoothly.
      def delete_application_from_environment(
        application_id : String,
        environment_id : String
      ) : Protocol::Request
        input = Types::DeleteApplicationFromEnvironmentRequest.new(application_id: application_id, environment_id: environment_id)
        delete_application_from_environment(input)
      end
      def delete_application_from_environment(input : Types::DeleteApplicationFromEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION_FROM_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific runtime environment. The environment cannot contain deployed applications. If it
      # does, you must delete those applications before you delete the environment.
      def delete_environment(
        environment_id : String
      ) : Protocol::Request
        input = Types::DeleteEnvironmentRequest.new(environment_id: environment_id)
        delete_environment(input)
      end
      def delete_environment(input : Types::DeleteEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the details of a specific application.
      def get_application(
        application_id : String
      ) : Protocol::Request
        input = Types::GetApplicationRequest.new(application_id: application_id)
        get_application(input)
      end
      def get_application(input : Types::GetApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about a specific version of a specific application.
      def get_application_version(
        application_id : String,
        application_version : Int32
      ) : Protocol::Request
        input = Types::GetApplicationVersionRequest.new(application_id: application_id, application_version: application_version)
        get_application_version(input)
      end
      def get_application_version(input : Types::GetApplicationVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of a specific batch job execution for a specific application.
      def get_batch_job_execution(
        application_id : String,
        execution_id : String
      ) : Protocol::Request
        input = Types::GetBatchJobExecutionRequest.new(application_id: application_id, execution_id: execution_id)
        get_batch_job_execution(input)
      end
      def get_batch_job_execution(input : Types::GetBatchJobExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BATCH_JOB_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of a specific data set.
      def get_data_set_details(
        application_id : String,
        data_set_name : String
      ) : Protocol::Request
        input = Types::GetDataSetDetailsRequest.new(application_id: application_id, data_set_name: data_set_name)
        get_data_set_details(input)
      end
      def get_data_set_details(input : Types::GetDataSetDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SET_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the status of a data set import task initiated with the CreateDataSetExportTask operation.
      def get_data_set_export_task(
        application_id : String,
        task_id : String
      ) : Protocol::Request
        input = Types::GetDataSetExportTaskRequest.new(application_id: application_id, task_id: task_id)
        get_data_set_export_task(input)
      end
      def get_data_set_export_task(input : Types::GetDataSetExportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SET_EXPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the status of a data set import task initiated with the CreateDataSetImportTask operation.
      def get_data_set_import_task(
        application_id : String,
        task_id : String
      ) : Protocol::Request
        input = Types::GetDataSetImportTaskRequest.new(application_id: application_id, task_id: task_id)
        get_data_set_import_task(input)
      end
      def get_data_set_import_task(input : Types::GetDataSetImportTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SET_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details of a specific deployment with a given deployment identifier.
      def get_deployment(
        application_id : String,
        deployment_id : String
      ) : Protocol::Request
        input = Types::GetDeploymentRequest.new(application_id: application_id, deployment_id: deployment_id)
        get_deployment(input)
      end
      def get_deployment(input : Types::GetDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a specific runtime environment.
      def get_environment(
        environment_id : String
      ) : Protocol::Request
        input = Types::GetEnvironmentRequest.new(environment_id: environment_id)
        get_environment(input)
      end
      def get_environment(input : Types::GetEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a single sign-on URL that can be used to connect to AWS Blu Insights.
      def get_signed_bluinsights_url : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIGNED_BLUINSIGHTS_URL, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the application versions for a specific application.
      def list_application_versions(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationVersionsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_application_versions(input)
      end
      def list_application_versions(input : Types::ListApplicationVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the applications associated with a specific Amazon Web Services account. You can provide the
      # unique identifier of a specific runtime environment in a query parameter to see all applications
      # associated with that environment.
      def list_applications(
        environment_id : String? = nil,
        max_results : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(environment_id: environment_id, max_results: max_results, names: names, next_token: next_token)
        list_applications(input)
      end
      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the available batch job definitions based on the batch job resources uploaded during the
      # application creation. You can use the batch job definitions in the list to start a batch job.
      def list_batch_job_definitions(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListBatchJobDefinitionsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token, prefix: prefix)
        list_batch_job_definitions(input)
      end
      def list_batch_job_definitions(input : Types::ListBatchJobDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BATCH_JOB_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists historical, current, and scheduled batch job executions for a specific application.
      def list_batch_job_executions(
        application_id : String,
        execution_ids : Array(String)? = nil,
        job_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        started_after : Time? = nil,
        started_before : Time? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListBatchJobExecutionsRequest.new(application_id: application_id, execution_ids: execution_ids, job_name: job_name, max_results: max_results, next_token: next_token, started_after: started_after, started_before: started_before, status: status)
        list_batch_job_executions(input)
      end
      def list_batch_job_executions(input : Types::ListBatchJobExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BATCH_JOB_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the job steps for a JCL file to restart a batch job. This is only applicable for Micro
      # Focus engine with versions 8.0.6 and above.
      def list_batch_job_restart_points(
        application_id : String,
        execution_id : String,
        auth_secrets_manager_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListBatchJobRestartPointsRequest.new(application_id: application_id, execution_id: execution_id, auth_secrets_manager_arn: auth_secrets_manager_arn)
        list_batch_job_restart_points(input)
      end
      def list_batch_job_restart_points(input : Types::ListBatchJobRestartPointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BATCH_JOB_RESTART_POINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the data set exports for the specified application.
      def list_data_set_export_history(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSetExportHistoryRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_data_set_export_history(input)
      end
      def list_data_set_export_history(input : Types::ListDataSetExportHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SET_EXPORT_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the data set imports for the specified application.
      def list_data_set_import_history(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSetImportHistoryRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_data_set_import_history(input)
      end
      def list_data_set_import_history(input : Types::ListDataSetImportHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SET_IMPORT_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the data sets imported for a specific application. In Amazon Web Services Mainframe
      # Modernization, data sets are associated with applications deployed on runtime environments. This is
      # known as importing data sets. Currently, Amazon Web Services Mainframe Modernization can import data
      # sets into catalogs using CreateDataSetImportTask .
      def list_data_sets(
        application_id : String,
        max_results : Int32? = nil,
        name_filter : String? = nil,
        next_token : String? = nil,
        prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSetsRequest.new(application_id: application_id, max_results: max_results, name_filter: name_filter, next_token: next_token, prefix: prefix)
        list_data_sets(input)
      end
      def list_data_sets(input : Types::ListDataSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all deployments of a specific application. A deployment is a combination of a
      # specific application and a specific version of that application. Each deployment is mapped to a
      # particular application version.
      def list_deployments(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDeploymentsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_deployments(input)
      end
      def list_deployments(input : Types::ListDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the available engine versions.
      def list_engine_versions(
        engine_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEngineVersionsRequest.new(engine_type: engine_type, max_results: max_results, next_token: next_token)
        list_engine_versions(input)
      end
      def list_engine_versions(input : Types::ListEngineVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENGINE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the runtime environments.
      def list_environments(
        engine_type : String? = nil,
        max_results : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentsRequest.new(engine_type: engine_type, max_results: max_results, names: names, next_token: next_token)
        list_environments(input)
      end
      def list_environments(input : Types::ListEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for the specified resource.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an application that is currently stopped.
      def start_application(
        application_id : String
      ) : Protocol::Request
        input = Types::StartApplicationRequest.new(application_id: application_id)
        start_application(input)
      end
      def start_application(input : Types::StartApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a batch job and returns the unique identifier of this execution of the batch job. The
      # associated application must be running in order to start the batch job.
      def start_batch_job(
        application_id : String,
        batch_job_identifier : Types::BatchJobIdentifier,
        auth_secrets_manager_arn : String? = nil,
        job_params : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartBatchJobRequest.new(application_id: application_id, batch_job_identifier: batch_job_identifier, auth_secrets_manager_arn: auth_secrets_manager_arn, job_params: job_params)
        start_batch_job(input)
      end
      def start_batch_job(input : Types::StartBatchJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_BATCH_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a running application.
      def stop_application(
        application_id : String,
        force_stop : Bool? = nil
      ) : Protocol::Request
        input = Types::StopApplicationRequest.new(application_id: application_id, force_stop: force_stop)
        stop_application(input)
      end
      def stop_application(input : Types::StopApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tags to the specified resource.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from the specified resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an application and creates a new version.
      def update_application(
        application_id : String,
        current_application_version : Int32,
        definition : Types::Definition? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationRequest.new(application_id: application_id, current_application_version: current_application_version, definition: definition, description: description)
        update_application(input)
      end
      def update_application(input : Types::UpdateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration details for a specific runtime environment.
      def update_environment(
        environment_id : String,
        apply_during_maintenance_window : Bool? = nil,
        desired_capacity : Int32? = nil,
        engine_version : String? = nil,
        force_update : Bool? = nil,
        instance_type : String? = nil,
        preferred_maintenance_window : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEnvironmentRequest.new(environment_id: environment_id, apply_during_maintenance_window: apply_during_maintenance_window, desired_capacity: desired_capacity, engine_version: engine_version, force_update: force_update, instance_type: instance_type, preferred_maintenance_window: preferred_maintenance_window)
        update_environment(input)
      end
      def update_environment(input : Types::UpdateEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
