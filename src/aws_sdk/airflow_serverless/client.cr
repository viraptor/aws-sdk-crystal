module AwsSdk
  module MWAAServerless
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

      # Creates a new workflow in Amazon Managed Workflows for Apache Airflow Serverless. This operation
      # initializes a workflow with the specified configuration including the workflow definition, execution
      # role, and optional settings for encryption, logging, and networking. You must provide the workflow
      # definition as a YAML file stored in Amazon S3 that defines the DAG structure using supported Amazon
      # Web Services operators. Amazon Managed Workflows for Apache Airflow Serverless automatically creates
      # the first version of the workflow and sets up the necessary execution environment with multi-tenant
      # isolation and security controls.
      def create_workflow(
        definition_s3_location : Types::DefinitionS3Location,
        name : String,
        role_arn : String,
        client_token : String? = nil,
        description : String? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        engine_version : Int32? = nil,
        logging_configuration : Types::LoggingConfiguration? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        tags : Hash(String, String)? = nil,
        trigger_mode : String? = nil
      ) : Types::CreateWorkflowResponse
        input = Types::CreateWorkflowRequest.new(definition_s3_location: definition_s3_location, name: name, role_arn: role_arn, client_token: client_token, description: description, encryption_configuration: encryption_configuration, engine_version: engine_version, logging_configuration: logging_configuration, network_configuration: network_configuration, tags: tags, trigger_mode: trigger_mode)
        create_workflow(input)
      end
      def create_workflow(input : Types::CreateWorkflowRequest) : Types::CreateWorkflowResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkflowResponse, "CreateWorkflow")
      end

      # Deletes a workflow and all its versions. This operation permanently removes the workflow and cannot
      # be undone. Amazon Managed Workflows for Apache Airflow Serverless ensures that all associated
      # resources are properly cleaned up, including stopping any running executions, removing scheduled
      # triggers, and cleaning up execution history. The deletion process respects the multi-tenant
      # isolation boundaries and ensures that no residual data or configurations remain that could affect
      # other customers or workflows.
      def delete_workflow(
        workflow_arn : String,
        workflow_version : String? = nil
      ) : Types::DeleteWorkflowResponse
        input = Types::DeleteWorkflowRequest.new(workflow_arn: workflow_arn, workflow_version: workflow_version)
        delete_workflow(input)
      end
      def delete_workflow(input : Types::DeleteWorkflowRequest) : Types::DeleteWorkflowResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkflowResponse, "DeleteWorkflow")
      end

      # Retrieves detailed information about a specific task instance within a workflow run. Task instances
      # represent individual tasks that are executed as part of a workflow in the Amazon Managed Workflows
      # for Apache Airflow Serverless environment. Each task instance runs in an isolated ECS container with
      # dedicated resources and security boundaries. The service tracks task execution state, retry
      # attempts, and provides detailed timing and error information for troubleshooting and monitoring
      # purposes.
      def get_task_instance(
        run_id : String,
        task_instance_id : String,
        workflow_arn : String
      ) : Types::GetTaskInstanceResponse
        input = Types::GetTaskInstanceRequest.new(run_id: run_id, task_instance_id: task_instance_id, workflow_arn: workflow_arn)
        get_task_instance(input)
      end
      def get_task_instance(input : Types::GetTaskInstanceRequest) : Types::GetTaskInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TASK_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTaskInstanceResponse, "GetTaskInstance")
      end

      # Retrieves detailed information about a workflow, including its configuration, status, and metadata.
      def get_workflow(
        workflow_arn : String,
        workflow_version : String? = nil
      ) : Types::GetWorkflowResponse
        input = Types::GetWorkflowRequest.new(workflow_arn: workflow_arn, workflow_version: workflow_version)
        get_workflow(input)
      end
      def get_workflow(input : Types::GetWorkflowRequest) : Types::GetWorkflowResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WORKFLOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkflowResponse, "GetWorkflow")
      end

      # Retrieves detailed information about a specific workflow run, including its status, execution
      # details, and task instances.
      def get_workflow_run(
        run_id : String,
        workflow_arn : String
      ) : Types::GetWorkflowRunResponse
        input = Types::GetWorkflowRunRequest.new(run_id: run_id, workflow_arn: workflow_arn)
        get_workflow_run(input)
      end
      def get_workflow_run(input : Types::GetWorkflowRunRequest) : Types::GetWorkflowRunResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WORKFLOW_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkflowRunResponse, "GetWorkflowRun")
      end

      # Lists all tags that are associated with a specified Amazon Managed Workflows for Apache Airflow
      # Serverless resource.
      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Lists all task instances for a specific workflow run, with optional pagination support.
      def list_task_instances(
        run_id : String,
        workflow_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTaskInstancesResponse
        input = Types::ListTaskInstancesRequest.new(run_id: run_id, workflow_arn: workflow_arn, max_results: max_results, next_token: next_token)
        list_task_instances(input)
      end
      def list_task_instances(input : Types::ListTaskInstancesRequest) : Types::ListTaskInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TASK_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTaskInstancesResponse, "ListTaskInstances")
      end

      # Lists all runs for a specified workflow, with optional pagination and filtering support.
      def list_workflow_runs(
        workflow_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        workflow_version : String? = nil
      ) : Types::ListWorkflowRunsResponse
        input = Types::ListWorkflowRunsRequest.new(workflow_arn: workflow_arn, max_results: max_results, next_token: next_token, workflow_version: workflow_version)
        list_workflow_runs(input)
      end
      def list_workflow_runs(input : Types::ListWorkflowRunsRequest) : Types::ListWorkflowRunsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKFLOW_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkflowRunsResponse, "ListWorkflowRuns")
      end

      # Lists all versions of a specified workflow, with optional pagination support.
      def list_workflow_versions(
        workflow_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWorkflowVersionsResponse
        input = Types::ListWorkflowVersionsRequest.new(workflow_arn: workflow_arn, max_results: max_results, next_token: next_token)
        list_workflow_versions(input)
      end
      def list_workflow_versions(input : Types::ListWorkflowVersionsRequest) : Types::ListWorkflowVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKFLOW_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkflowVersionsResponse, "ListWorkflowVersions")
      end

      # Lists all workflows in your account, with optional pagination support. This operation returns
      # summary information for workflows, showing only the most recently created version of each workflow.
      # Amazon Managed Workflows for Apache Airflow Serverless maintains workflow metadata in a highly
      # available, distributed storage system that enables efficient querying and filtering. The service
      # implements proper access controls to ensure you can only view workflows that you have permissions to
      # access, supporting both individual and team-based workflow management scenarios.
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

      # Starts a new execution of a workflow. This operation creates a workflow run that executes the tasks
      # that are defined in the workflow. Amazon Managed Workflows for Apache Airflow Serverless schedules
      # the workflow execution across its managed Airflow environment, automatically scaling ECS worker
      # tasks based on the workload. The service handles task isolation, dependency resolution, and provides
      # comprehensive monitoring and logging throughout the execution lifecycle.
      def start_workflow_run(
        workflow_arn : String,
        client_token : String? = nil,
        override_parameters : Hash(String, Types::Document)? = nil,
        workflow_version : String? = nil
      ) : Types::StartWorkflowRunResponse
        input = Types::StartWorkflowRunRequest.new(workflow_arn: workflow_arn, client_token: client_token, override_parameters: override_parameters, workflow_version: workflow_version)
        start_workflow_run(input)
      end
      def start_workflow_run(input : Types::StartWorkflowRunRequest) : Types::StartWorkflowRunResponse
        request = Protocol::JsonRpc.build_request(Model::START_WORKFLOW_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartWorkflowRunResponse, "StartWorkflowRun")
      end

      # Stops a running workflow execution. This operation terminates all running tasks and prevents new
      # tasks from starting. Amazon Managed Workflows for Apache Airflow Serverless gracefully shuts down
      # the workflow execution by stopping task scheduling and terminating active ECS worker containers. The
      # operation transitions the workflow run to a STOPPING state and then to STOPPED once all cleanup is
      # complete. In-flight tasks may complete or be terminated depending on their current execution state.
      def stop_workflow_run(
        run_id : String,
        workflow_arn : String
      ) : Types::StopWorkflowRunResponse
        input = Types::StopWorkflowRunRequest.new(run_id: run_id, workflow_arn: workflow_arn)
        stop_workflow_run(input)
      end
      def stop_workflow_run(input : Types::StopWorkflowRunRequest) : Types::StopWorkflowRunResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_WORKFLOW_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopWorkflowRunResponse, "StopWorkflowRun")
      end

      # Adds tags to an Amazon Managed Workflows for Apache Airflow Serverless resource. Tags are key-value
      # pairs that help you organize and categorize your resources.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Types::TagResourceResponse
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes tags from an Amazon Managed Workflows for Apache Airflow Serverless resource. This operation
      # removes the specified tags from the resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates an existing workflow with new configuration settings. This operation allows you to modify
      # the workflow definition, role, and other settings. When you update a workflow, Amazon Managed
      # Workflows for Apache Airflow Serverless automatically creates a new version with the updated
      # configuration and disables scheduling on all previous versions to ensure only one version is
      # actively scheduled at a time. The update operation maintains workflow history while providing a
      # clean transition to the new configuration.
      def update_workflow(
        definition_s3_location : Types::DefinitionS3Location,
        role_arn : String,
        workflow_arn : String,
        description : String? = nil,
        engine_version : Int32? = nil,
        logging_configuration : Types::LoggingConfiguration? = nil,
        network_configuration : Types::NetworkConfiguration? = nil,
        trigger_mode : String? = nil
      ) : Types::UpdateWorkflowResponse
        input = Types::UpdateWorkflowRequest.new(definition_s3_location: definition_s3_location, role_arn: role_arn, workflow_arn: workflow_arn, description: description, engine_version: engine_version, logging_configuration: logging_configuration, network_configuration: network_configuration, trigger_mode: trigger_mode)
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
