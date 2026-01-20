module AwsSdk
  module BedrockAgentCore
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

      # Creates multiple memory records in a single batch operation for the specified memory with custom
      # content.

      def batch_create_memory_records(
        memory_id : String,
        records : Array(Types::MemoryRecordCreateInput),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchCreateMemoryRecordsInput.new(memory_id: memory_id, records: records, client_token: client_token)
        batch_create_memory_records(input)
      end

      def batch_create_memory_records(input : Types::BatchCreateMemoryRecordsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_MEMORY_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes multiple memory records in a single batch operation from the specified memory.

      def batch_delete_memory_records(
        memory_id : String,
        records : Array(Types::MemoryRecordDeleteInput)
      ) : Protocol::Request
        input = Types::BatchDeleteMemoryRecordsInput.new(memory_id: memory_id, records: records)
        batch_delete_memory_records(input)
      end

      def batch_delete_memory_records(input : Types::BatchDeleteMemoryRecordsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_MEMORY_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates multiple memory records with custom content in a single batch operation within the specified
      # memory.

      def batch_update_memory_records(
        memory_id : String,
        records : Array(Types::MemoryRecordUpdateInput)
      ) : Protocol::Request
        input = Types::BatchUpdateMemoryRecordsInput.new(memory_id: memory_id, records: records)
        batch_update_memory_records(input)
      end

      def batch_update_memory_records(input : Types::BatchUpdateMemoryRecordsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_MEMORY_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Confirms the user authentication session for obtaining OAuth2.0 tokens for a resource.

      def complete_resource_token_auth(
        session_uri : String,
        user_identifier : Types::UserIdentifier
      ) : Protocol::Request
        input = Types::CompleteResourceTokenAuthRequest.new(session_uri: session_uri, user_identifier: user_identifier)
        complete_resource_token_auth(input)
      end

      def complete_resource_token_auth(input : Types::CompleteResourceTokenAuthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COMPLETE_RESOURCE_TOKEN_AUTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an event in an AgentCore Memory resource. Events represent interactions or activities that
      # occur within a session and are associated with specific actors. To use this operation, you must have
      # the bedrock-agentcore:CreateEvent permission. This operation is subject to request rate limiting.

      def create_event(
        actor_id : String,
        event_timestamp : Time,
        memory_id : String,
        payload : Array(Types::PayloadType),
        branch : Types::Branch? = nil,
        client_token : String? = nil,
        metadata : Hash(String, Types::MetadataValue)? = nil,
        session_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateEventInput.new(actor_id: actor_id, event_timestamp: event_timestamp, memory_id: memory_id, payload: payload, branch: branch, client_token: client_token, metadata: metadata, session_id: session_id)
        create_event(input)
      end

      def create_event(input : Types::CreateEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an event from an AgentCore Memory resource. When you delete an event, it is permanently
      # removed. To use this operation, you must have the bedrock-agentcore:DeleteEvent permission.

      def delete_event(
        actor_id : String,
        event_id : String,
        memory_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::DeleteEventInput.new(actor_id: actor_id, event_id: event_id, memory_id: memory_id, session_id: session_id)
        delete_event(input)
      end

      def delete_event(input : Types::DeleteEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a memory record from an AgentCore Memory resource. When you delete a memory record, it is
      # permanently removed. To use this operation, you must have the bedrock-agentcore:DeleteMemoryRecord
      # permission.

      def delete_memory_record(
        memory_id : String,
        memory_record_id : String
      ) : Protocol::Request
        input = Types::DeleteMemoryRecordInput.new(memory_id: memory_id, memory_record_id: memory_record_id)
        delete_memory_record(input)
      end

      def delete_memory_record(input : Types::DeleteMemoryRecordInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEMORY_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs on-demand evaluation of agent traces using a specified evaluator. This synchronous API
      # accepts traces in OpenTelemetry format and returns immediate scoring results with detailed
      # explanations.

      def evaluate(
        evaluation_input : Types::EvaluationInput,
        evaluator_id : String,
        evaluation_target : Types::EvaluationTarget? = nil
      ) : Protocol::Request
        input = Types::EvaluateRequest.new(evaluation_input: evaluation_input, evaluator_id: evaluator_id, evaluation_target: evaluation_target)
        evaluate(input)
      end

      def evaluate(input : Types::EvaluateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EVALUATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the A2A agent card associated with an AgentCore Runtime agent.

      def get_agent_card(
        agent_runtime_arn : String,
        qualifier : String? = nil,
        runtime_session_id : String? = nil
      ) : Protocol::Request
        input = Types::GetAgentCardRequest.new(agent_runtime_arn: agent_runtime_arn, qualifier: qualifier, runtime_session_id: runtime_session_id)
        get_agent_card(input)
      end

      def get_agent_card(input : Types::GetAgentCardRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_CARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific browser session in Amazon Bedrock. This operation
      # returns the session's configuration, current status, associated streams, and metadata. To get a
      # browser session, you must specify both the browser identifier and the session ID. The response
      # includes information about the session's viewport configuration, timeout settings, and stream
      # endpoints. The following operations are related to GetBrowserSession : StartBrowserSession
      # ListBrowserSessions StopBrowserSession

      def get_browser_session(
        browser_identifier : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetBrowserSessionRequest.new(browser_identifier: browser_identifier, session_id: session_id)
        get_browser_session(input)
      end

      def get_browser_session(input : Types::GetBrowserSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BROWSER_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific code interpreter session in Amazon Bedrock. This
      # operation returns the session's configuration, current status, and metadata. To get a code
      # interpreter session, you must specify both the code interpreter identifier and the session ID. The
      # response includes information about the session's timeout settings and current status. The following
      # operations are related to GetCodeInterpreterSession : StartCodeInterpreterSession
      # ListCodeInterpreterSessions StopCodeInterpreterSession

      def get_code_interpreter_session(
        code_interpreter_identifier : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetCodeInterpreterSessionRequest.new(code_interpreter_identifier: code_interpreter_identifier, session_id: session_id)
        get_code_interpreter_session(input)
      end

      def get_code_interpreter_session(input : Types::GetCodeInterpreterSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CODE_INTERPRETER_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific event in an AgentCore Memory resource. To use this operation,
      # you must have the bedrock-agentcore:GetEvent permission.

      def get_event(
        actor_id : String,
        event_id : String,
        memory_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetEventInput.new(actor_id: actor_id, event_id: event_id, memory_id: memory_id, session_id: session_id)
        get_event(input)
      end

      def get_event(input : Types::GetEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a specific memory record from an AgentCore Memory resource. To use this operation, you
      # must have the bedrock-agentcore:GetMemoryRecord permission.

      def get_memory_record(
        memory_id : String,
        memory_record_id : String
      ) : Protocol::Request
        input = Types::GetMemoryRecordInput.new(memory_id: memory_id, memory_record_id: memory_record_id)
        get_memory_record(input)
      end

      def get_memory_record(input : Types::GetMemoryRecordInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMORY_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the API key associated with an API key credential provider.

      def get_resource_api_key(
        resource_credential_provider_name : String,
        workload_identity_token : String
      ) : Protocol::Request
        input = Types::GetResourceApiKeyRequest.new(resource_credential_provider_name: resource_credential_provider_name, workload_identity_token: workload_identity_token)
        get_resource_api_key(input)
      end

      def get_resource_api_key(input : Types::GetResourceApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the OAuth 2.0 token of the provided resource.

      def get_resource_oauth2_token(
        oauth2_flow : String,
        resource_credential_provider_name : String,
        scopes : Array(String),
        workload_identity_token : String,
        custom_parameters : Hash(String, String)? = nil,
        custom_state : String? = nil,
        force_authentication : Bool? = nil,
        resource_oauth2_return_url : String? = nil,
        session_uri : String? = nil
      ) : Protocol::Request
        input = Types::GetResourceOauth2TokenRequest.new(oauth2_flow: oauth2_flow, resource_credential_provider_name: resource_credential_provider_name, scopes: scopes, workload_identity_token: workload_identity_token, custom_parameters: custom_parameters, custom_state: custom_state, force_authentication: force_authentication, resource_oauth2_return_url: resource_oauth2_return_url, session_uri: session_uri)
        get_resource_oauth2_token(input)
      end

      def get_resource_oauth2_token(input : Types::GetResourceOauth2TokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_OAUTH2_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Obtains a workload access token for agentic workloads not acting on behalf of a user.

      def get_workload_access_token(
        workload_name : String
      ) : Protocol::Request
        input = Types::GetWorkloadAccessTokenRequest.new(workload_name: workload_name)
        get_workload_access_token(input)
      end

      def get_workload_access_token(input : Types::GetWorkloadAccessTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKLOAD_ACCESS_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Obtains a workload access token for agentic workloads acting on behalf of a user, using a JWT token.

      def get_workload_access_token_for_jwt(
        user_token : String,
        workload_name : String
      ) : Protocol::Request
        input = Types::GetWorkloadAccessTokenForJWTRequest.new(user_token: user_token, workload_name: workload_name)
        get_workload_access_token_for_jwt(input)
      end

      def get_workload_access_token_for_jwt(input : Types::GetWorkloadAccessTokenForJWTRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKLOAD_ACCESS_TOKEN_FOR_JWT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Obtains a workload access token for agentic workloads acting on behalf of a user, using the user's
      # ID.

      def get_workload_access_token_for_user_id(
        user_id : String,
        workload_name : String
      ) : Protocol::Request
        input = Types::GetWorkloadAccessTokenForUserIdRequest.new(user_id: user_id, workload_name: workload_name)
        get_workload_access_token_for_user_id(input)
      end

      def get_workload_access_token_for_user_id(input : Types::GetWorkloadAccessTokenForUserIdRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKLOAD_ACCESS_TOKEN_FOR_USER_ID, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a request to an agent or tool hosted in an Amazon Bedrock AgentCore Runtime and receives
      # responses in real-time. To invoke an agent you must specify the AgentCore Runtime ARN and provide a
      # payload containing your request. You can optionally specify a qualifier to target a specific version
      # or endpoint of the agent. This operation supports streaming responses, allowing you to receive
      # partial responses as they become available. We recommend using pagination to ensure that the
      # operation returns quickly and successfully when processing large responses. For example code, see
      # Invoke an AgentCore Runtime agent . If you're integrating your agent with OAuth, you can't use the
      # Amazon Web Services SDK to call InvokeAgentRuntime . Instead, make a HTTPS request to
      # InvokeAgentRuntime . For an example, see Authenticate and authorize with Inbound Auth and Outbound
      # Auth . To use this operation, you must have the bedrock-agentcore:InvokeAgentRuntime permission. If
      # you are making a call to InvokeAgentRuntime on behalf of a user ID with the
      # X-Amzn-Bedrock-AgentCore-Runtime-User-Id header, You require permissions to both actions (
      # bedrock-agentcore:InvokeAgentRuntime and bedrock-agentcore:InvokeAgentRuntimeForUser ).

      def invoke_agent_runtime(
        agent_runtime_arn : String,
        payload : Bytes,
        accept : String? = nil,
        account_id : String? = nil,
        baggage : String? = nil,
        content_type : String? = nil,
        mcp_protocol_version : String? = nil,
        mcp_session_id : String? = nil,
        qualifier : String? = nil,
        runtime_session_id : String? = nil,
        runtime_user_id : String? = nil,
        trace_id : String? = nil,
        trace_parent : String? = nil,
        trace_state : String? = nil
      ) : Protocol::Request
        input = Types::InvokeAgentRuntimeRequest.new(agent_runtime_arn: agent_runtime_arn, payload: payload, accept: accept, account_id: account_id, baggage: baggage, content_type: content_type, mcp_protocol_version: mcp_protocol_version, mcp_session_id: mcp_session_id, qualifier: qualifier, runtime_session_id: runtime_session_id, runtime_user_id: runtime_user_id, trace_id: trace_id, trace_parent: trace_parent, trace_state: trace_state)
        invoke_agent_runtime(input)
      end

      def invoke_agent_runtime(input : Types::InvokeAgentRuntimeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_AGENT_RUNTIME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Executes code within an active code interpreter session in Amazon Bedrock. This operation processes
      # the provided code, runs it in a secure environment, and returns the execution results including
      # output, errors, and generated visualizations. To execute code, you must specify the code interpreter
      # identifier, session ID, and the code to run in the arguments parameter. The operation returns a
      # stream containing the execution results, which can include text output, error messages, and data
      # visualizations. This operation is subject to request rate limiting based on your account's service
      # quotas. The following operations are related to InvokeCodeInterpreter : StartCodeInterpreterSession
      # GetCodeInterpreterSession

      def invoke_code_interpreter(
        code_interpreter_identifier : String,
        name : String,
        arguments : Types::ToolArguments? = nil,
        session_id : String? = nil,
        trace_id : String? = nil,
        trace_parent : String? = nil
      ) : Protocol::Request
        input = Types::InvokeCodeInterpreterRequest.new(code_interpreter_identifier: code_interpreter_identifier, name: name, arguments: arguments, session_id: session_id, trace_id: trace_id, trace_parent: trace_parent)
        invoke_code_interpreter(input)
      end

      def invoke_code_interpreter(input : Types::InvokeCodeInterpreterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_CODE_INTERPRETER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all actors in an AgentCore Memory resource. We recommend using pagination to ensure that the
      # operation returns quickly and successfully. To use this operation, you must have the
      # bedrock-agentcore:ListActors permission.

      def list_actors(
        memory_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListActorsInput.new(memory_id: memory_id, max_results: max_results, next_token: next_token)
        list_actors(input)
      end

      def list_actors(input : Types::ListActorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of browser sessions in Amazon Bedrock that match the specified criteria. This
      # operation returns summary information about each session, including identifiers, status, and
      # timestamps. You can filter the results by browser identifier and session status. The operation
      # supports pagination to handle large result sets efficiently. We recommend using pagination to ensure
      # that the operation returns quickly and successfully when retrieving large numbers of sessions. The
      # following operations are related to ListBrowserSessions : StartBrowserSession GetBrowserSession

      def list_browser_sessions(
        browser_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListBrowserSessionsRequest.new(browser_identifier: browser_identifier, max_results: max_results, next_token: next_token, status: status)
        list_browser_sessions(input)
      end

      def list_browser_sessions(input : Types::ListBrowserSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BROWSER_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of code interpreter sessions in Amazon Bedrock that match the specified criteria.
      # This operation returns summary information about each session, including identifiers, status, and
      # timestamps. You can filter the results by code interpreter identifier and session status. The
      # operation supports pagination to handle large result sets efficiently. We recommend using pagination
      # to ensure that the operation returns quickly and successfully when retrieving large numbers of
      # sessions. The following operations are related to ListCodeInterpreterSessions :
      # StartCodeInterpreterSession GetCodeInterpreterSession

      def list_code_interpreter_sessions(
        code_interpreter_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListCodeInterpreterSessionsRequest.new(code_interpreter_identifier: code_interpreter_identifier, max_results: max_results, next_token: next_token, status: status)
        list_code_interpreter_sessions(input)
      end

      def list_code_interpreter_sessions(input : Types::ListCodeInterpreterSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CODE_INTERPRETER_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists events in an AgentCore Memory resource based on specified criteria. We recommend using
      # pagination to ensure that the operation returns quickly and successfully. To use this operation, you
      # must have the bedrock-agentcore:ListEvents permission.

      def list_events(
        actor_id : String,
        memory_id : String,
        session_id : String,
        filter : Types::FilterInput? = nil,
        include_payloads : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventsInput.new(actor_id: actor_id, memory_id: memory_id, session_id: session_id, filter: filter, include_payloads: include_payloads, max_results: max_results, next_token: next_token)
        list_events(input)
      end

      def list_events(input : Types::ListEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all long-term memory extraction jobs that are eligible to be started with optional filtering.
      # To use this operation, you must have the bedrock-agentcore:ListMemoryExtractionJobs permission.

      def list_memory_extraction_jobs(
        memory_id : String,
        filter : Types::ExtractionJobFilterInput? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMemoryExtractionJobsInput.new(memory_id: memory_id, filter: filter, max_results: max_results, next_token: next_token)
        list_memory_extraction_jobs(input)
      end

      def list_memory_extraction_jobs(input : Types::ListMemoryExtractionJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMORY_EXTRACTION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists memory records in an AgentCore Memory resource based on specified criteria. We recommend using
      # pagination to ensure that the operation returns quickly and successfully. To use this operation, you
      # must have the bedrock-agentcore:ListMemoryRecords permission.

      def list_memory_records(
        memory_id : String,
        namespace : String,
        max_results : Int32? = nil,
        memory_strategy_id : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMemoryRecordsInput.new(memory_id: memory_id, namespace: namespace, max_results: max_results, memory_strategy_id: memory_strategy_id, next_token: next_token)
        list_memory_records(input)
      end

      def list_memory_records(input : Types::ListMemoryRecordsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMORY_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists sessions in an AgentCore Memory resource based on specified criteria. We recommend using
      # pagination to ensure that the operation returns quickly and successfully. To use this operation, you
      # must have the bedrock-agentcore:ListSessions permission.

      def list_sessions(
        actor_id : String,
        memory_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionsInput.new(actor_id: actor_id, memory_id: memory_id, max_results: max_results, next_token: next_token)
        list_sessions(input)
      end

      def list_sessions(input : Types::ListSessionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for and retrieves memory records from an AgentCore Memory resource based on specified
      # search criteria. We recommend using pagination to ensure that the operation returns quickly and
      # successfully. To use this operation, you must have the bedrock-agentcore:RetrieveMemoryRecords
      # permission.

      def retrieve_memory_records(
        memory_id : String,
        namespace : String,
        search_criteria : Types::SearchCriteria,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::RetrieveMemoryRecordsInput.new(memory_id: memory_id, namespace: namespace, search_criteria: search_criteria, max_results: max_results, next_token: next_token)
        retrieve_memory_records(input)
      end

      def retrieve_memory_records(input : Types::RetrieveMemoryRecordsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETRIEVE_MEMORY_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and initializes a browser session in Amazon Bedrock. The session enables agents to navigate
      # and interact with web content, extract information from websites, and perform web-based tasks as
      # part of their response generation. To create a session, you must specify a browser identifier and a
      # name. You can also configure the viewport dimensions to control the visible area of web content. The
      # session remains active until it times out or you explicitly stop it using the StopBrowserSession
      # operation. The following operations are related to StartBrowserSession : GetBrowserSession
      # UpdateBrowserStream StopBrowserSession

      def start_browser_session(
        browser_identifier : String,
        client_token : String? = nil,
        name : String? = nil,
        session_timeout_seconds : Int32? = nil,
        trace_id : String? = nil,
        trace_parent : String? = nil,
        view_port : Types::ViewPort? = nil
      ) : Protocol::Request
        input = Types::StartBrowserSessionRequest.new(browser_identifier: browser_identifier, client_token: client_token, name: name, session_timeout_seconds: session_timeout_seconds, trace_id: trace_id, trace_parent: trace_parent, view_port: view_port)
        start_browser_session(input)
      end

      def start_browser_session(input : Types::StartBrowserSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_BROWSER_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and initializes a code interpreter session in Amazon Bedrock. The session enables agents to
      # execute code as part of their response generation, supporting programming languages such as Python
      # for data analysis, visualization, and computation tasks. To create a session, you must specify a
      # code interpreter identifier and a name. The session remains active until it times out or you
      # explicitly stop it using the StopCodeInterpreterSession operation. The following operations are
      # related to StartCodeInterpreterSession : InvokeCodeInterpreter GetCodeInterpreterSession
      # StopCodeInterpreterSession

      def start_code_interpreter_session(
        code_interpreter_identifier : String,
        client_token : String? = nil,
        name : String? = nil,
        session_timeout_seconds : Int32? = nil,
        trace_id : String? = nil,
        trace_parent : String? = nil
      ) : Protocol::Request
        input = Types::StartCodeInterpreterSessionRequest.new(code_interpreter_identifier: code_interpreter_identifier, client_token: client_token, name: name, session_timeout_seconds: session_timeout_seconds, trace_id: trace_id, trace_parent: trace_parent)
        start_code_interpreter_session(input)
      end

      def start_code_interpreter_session(input : Types::StartCodeInterpreterSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CODE_INTERPRETER_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a memory extraction job that processes events that failed extraction previously in an
      # AgentCore Memory resource and produces structured memory records. When earlier extraction attempts
      # have left events unprocessed, this job will pick up and extract those as well. To use this
      # operation, you must have the bedrock-agentcore:StartMemoryExtractionJob permission.

      def start_memory_extraction_job(
        extraction_job : Types::ExtractionJob,
        memory_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartMemoryExtractionJobInput.new(extraction_job: extraction_job, memory_id: memory_id, client_token: client_token)
        start_memory_extraction_job(input)
      end

      def start_memory_extraction_job(input : Types::StartMemoryExtractionJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MEMORY_EXTRACTION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Terminates an active browser session in Amazon Bedrock. This operation stops the session, releases
      # associated resources, and makes the session unavailable for further use. To stop a browser session,
      # you must specify both the browser identifier and the session ID. Once stopped, a session cannot be
      # restarted; you must create a new session using StartBrowserSession . The following operations are
      # related to StopBrowserSession : StartBrowserSession GetBrowserSession

      def stop_browser_session(
        browser_identifier : String,
        session_id : String,
        client_token : String? = nil,
        trace_id : String? = nil,
        trace_parent : String? = nil
      ) : Protocol::Request
        input = Types::StopBrowserSessionRequest.new(browser_identifier: browser_identifier, session_id: session_id, client_token: client_token, trace_id: trace_id, trace_parent: trace_parent)
        stop_browser_session(input)
      end

      def stop_browser_session(input : Types::StopBrowserSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_BROWSER_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Terminates an active code interpreter session in Amazon Bedrock. This operation stops the session,
      # releases associated resources, and makes the session unavailable for further use. To stop a code
      # interpreter session, you must specify both the code interpreter identifier and the session ID. Once
      # stopped, a session cannot be restarted; you must create a new session using
      # StartCodeInterpreterSession . The following operations are related to StopCodeInterpreterSession :
      # StartCodeInterpreterSession GetCodeInterpreterSession

      def stop_code_interpreter_session(
        code_interpreter_identifier : String,
        session_id : String,
        client_token : String? = nil,
        trace_id : String? = nil,
        trace_parent : String? = nil
      ) : Protocol::Request
        input = Types::StopCodeInterpreterSessionRequest.new(code_interpreter_identifier: code_interpreter_identifier, session_id: session_id, client_token: client_token, trace_id: trace_id, trace_parent: trace_parent)
        stop_code_interpreter_session(input)
      end

      def stop_code_interpreter_session(input : Types::StopCodeInterpreterSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CODE_INTERPRETER_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a session that is running in an running AgentCore Runtime agent.

      def stop_runtime_session(
        agent_runtime_arn : String,
        runtime_session_id : String,
        client_token : String? = nil,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::StopRuntimeSessionRequest.new(agent_runtime_arn: agent_runtime_arn, runtime_session_id: runtime_session_id, client_token: client_token, qualifier: qualifier)
        stop_runtime_session(input)
      end

      def stop_runtime_session(input : Types::StopRuntimeSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_RUNTIME_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a browser stream. To use this operation, you must have permissions to perform the
      # bedrock:UpdateBrowserStream action.

      def update_browser_stream(
        browser_identifier : String,
        session_id : String,
        stream_update : Types::StreamUpdate,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateBrowserStreamRequest.new(browser_identifier: browser_identifier, session_id: session_id, stream_update: stream_update, client_token: client_token)
        update_browser_stream(input)
      end

      def update_browser_stream(input : Types::UpdateBrowserStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BROWSER_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
