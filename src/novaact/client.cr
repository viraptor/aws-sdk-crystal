module Aws
  module NovaAct
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates a new AI task (act) within a session that can interact with tools and perform specific
      # actions.

      def create_act(
        session_id : String,
        task : String,
        workflow_definition_name : String,
        workflow_run_id : String,
        client_token : String? = nil,
        tool_specs : Array(Types::ToolSpec)? = nil
      ) : Protocol::Request
        input = Types::CreateActRequest.new(session_id: session_id, task: task, workflow_definition_name: workflow_definition_name, workflow_run_id: workflow_run_id, client_token: client_token, tool_specs: tool_specs)
        create_act(input)
      end

      def create_act(input : Types::CreateActRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new session context within a workflow run to manage conversation state and acts.

      def create_session(
        workflow_definition_name : String,
        workflow_run_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateSessionRequest.new(workflow_definition_name: workflow_definition_name, workflow_run_id: workflow_run_id, client_token: client_token)
        create_session(input)
      end

      def create_session(input : Types::CreateSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new workflow definition template that can be used to execute multiple workflow runs.

      def create_workflow_definition(
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        export_config : Types::WorkflowExportConfig? = nil
      ) : Protocol::Request
        input = Types::CreateWorkflowDefinitionRequest.new(name: name, client_token: client_token, description: description, export_config: export_config)
        create_workflow_definition(input)
      end

      def create_workflow_definition(input : Types::CreateWorkflowDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKFLOW_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new execution instance of a workflow definition with specified parameters.

      def create_workflow_run(
        client_info : Types::ClientInfo,
        model_id : String,
        workflow_definition_name : String,
        client_token : String? = nil,
        log_group_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateWorkflowRunRequest.new(client_info: client_info, model_id: model_id, workflow_definition_name: workflow_definition_name, client_token: client_token, log_group_name: log_group_name)
        create_workflow_run(input)
      end

      def create_workflow_run(input : Types::CreateWorkflowRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKFLOW_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a workflow definition and all associated resources. This operation cannot be undone.

      def delete_workflow_definition(
        workflow_definition_name : String
      ) : Protocol::Request
        input = Types::DeleteWorkflowDefinitionRequest.new(workflow_definition_name: workflow_definition_name)
        delete_workflow_definition(input)
      end

      def delete_workflow_definition(input : Types::DeleteWorkflowDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKFLOW_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Terminates and cleans up a workflow run, stopping all associated acts and sessions.

      def delete_workflow_run(
        workflow_definition_name : String,
        workflow_run_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkflowRunRequest.new(workflow_definition_name: workflow_definition_name, workflow_run_id: workflow_run_id)
        delete_workflow_run(input)
      end

      def delete_workflow_run(input : Types::DeleteWorkflowRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKFLOW_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details and configuration of a specific workflow definition.

      def get_workflow_definition(
        workflow_definition_name : String
      ) : Protocol::Request
        input = Types::GetWorkflowDefinitionRequest.new(workflow_definition_name: workflow_definition_name)
        get_workflow_definition(input)
      end

      def get_workflow_definition(input : Types::GetWorkflowDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current state, configuration, and execution details of a workflow run.

      def get_workflow_run(
        workflow_definition_name : String,
        workflow_run_id : String
      ) : Protocol::Request
        input = Types::GetWorkflowRunRequest.new(workflow_definition_name: workflow_definition_name, workflow_run_id: workflow_run_id)
        get_workflow_run(input)
      end

      def get_workflow_run(input : Types::GetWorkflowRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Executes the next step of an act, processing tool call results and returning new tool calls if
      # needed.

      def invoke_act_step(
        act_id : String,
        call_results : Array(Types::CallResult),
        session_id : String,
        workflow_definition_name : String,
        workflow_run_id : String,
        previous_step_id : String? = nil
      ) : Protocol::Request
        input = Types::InvokeActStepRequest.new(act_id: act_id, call_results: call_results, session_id: session_id, workflow_definition_name: workflow_definition_name, workflow_run_id: workflow_run_id, previous_step_id: previous_step_id)
        invoke_act_step(input)
      end

      def invoke_act_step(input : Types::InvokeActStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_ACT_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all acts within a specific session with their current status and execution details.

      def list_acts(
        workflow_definition_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        session_id : String? = nil,
        sort_order : String? = nil,
        workflow_run_id : String? = nil
      ) : Protocol::Request
        input = Types::ListActsRequest.new(workflow_definition_name: workflow_definition_name, max_results: max_results, next_token: next_token, session_id: session_id, sort_order: sort_order, workflow_run_id: workflow_run_id)
        list_acts(input)
      end

      def list_acts(input : Types::ListActsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all available AI models that can be used for workflow execution, including their status and
      # compatibility information.

      def list_models(
        client_compatibility_version : Int32
      ) : Protocol::Request
        input = Types::ListModelsRequest.new(client_compatibility_version: client_compatibility_version)
        list_models(input)
      end

      def list_models(input : Types::ListModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all sessions within a specific workflow run.

      def list_sessions(
        workflow_definition_name : String,
        workflow_run_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionsRequest.new(workflow_definition_name: workflow_definition_name, workflow_run_id: workflow_run_id, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_sessions(input)
      end

      def list_sessions(input : Types::ListSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all workflow definitions in your account with optional filtering and pagination.

      def list_workflow_definitions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowDefinitionsRequest.new(max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_workflow_definitions(input)
      end

      def list_workflow_definitions(input : Types::ListWorkflowDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOW_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all workflow runs for a specific workflow definition with optional filtering and pagination.

      def list_workflow_runs(
        workflow_definition_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowRunsRequest.new(workflow_definition_name: workflow_definition_name, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_workflow_runs(input)
      end

      def list_workflow_runs(input : Types::ListWorkflowRunsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOW_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing act's configuration, status, or error information.

      def update_act(
        act_id : String,
        session_id : String,
        status : String,
        workflow_definition_name : String,
        workflow_run_id : String,
        error : Types::ActError? = nil
      ) : Protocol::Request
        input = Types::UpdateActRequest.new(act_id: act_id, session_id: session_id, status: status, workflow_definition_name: workflow_definition_name, workflow_run_id: workflow_run_id, error: error)
        update_act(input)
      end

      def update_act(input : Types::UpdateActRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration or state of an active workflow run.

      def update_workflow_run(
        status : String,
        workflow_definition_name : String,
        workflow_run_id : String
      ) : Protocol::Request
        input = Types::UpdateWorkflowRunRequest.new(status: status, workflow_definition_name: workflow_definition_name, workflow_run_id: workflow_run_id)
        update_workflow_run(input)
      end

      def update_workflow_run(input : Types::UpdateWorkflowRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKFLOW_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
