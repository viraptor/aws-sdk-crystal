module AwsSdk
  module BedrockAgentRuntime
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

      # Creates a new invocation within a session. An invocation groups the related invocation steps that
      # store the content from a conversation. For more information about sessions, see Store and retrieve
      # conversation history and context with Amazon Bedrock sessions . Related APIs ListInvocations
      # ListSessions GetSession
      def create_invocation(
        session_identifier : String,
        description : String? = nil,
        invocation_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateInvocationRequest.new(session_identifier: session_identifier, description: description, invocation_id: invocation_id)
        create_invocation(input)
      end
      def create_invocation(input : Types::CreateInvocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INVOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a session to temporarily store conversations for generative AI (GenAI) applications built
      # with open-source frameworks such as LangGraph and LlamaIndex. Sessions enable you to save the state
      # of conversations at checkpoints, with the added security and infrastructure of Amazon Web Services.
      # For more information, see Store and retrieve conversation history and context with Amazon Bedrock
      # sessions . By default, Amazon Bedrock uses Amazon Web Services-managed keys for session encryption,
      # including session metadata, or you can use your own KMS key. For more information, see Amazon
      # Bedrock session encryption . You use a session to store state and conversation history for
      # generative AI applications built with open-source frameworks. For Amazon Bedrock Agents, the service
      # automatically manages conversation context and associates them with the agent-specific sessionId you
      # specify in the InvokeAgent API operation. Related APIs: ListSessions GetSession EndSession
      # DeleteSession
      def create_session(
        encryption_key_arn : String? = nil,
        session_metadata : Hash(String, String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSessionRequest.new(encryption_key_arn: encryption_key_arn, session_metadata: session_metadata, tags: tags)
        create_session(input)
      end
      def create_session(input : Types::CreateSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes memory from the specified memory identifier.
      def delete_agent_memory(
        agent_alias_id : String,
        agent_id : String,
        memory_id : String? = nil,
        session_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAgentMemoryRequest.new(agent_alias_id: agent_alias_id, agent_id: agent_id, memory_id: memory_id, session_id: session_id)
        delete_agent_memory(input)
      end
      def delete_agent_memory(input : Types::DeleteAgentMemoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AGENT_MEMORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a session that you ended. You can't delete a session with an ACTIVE status. To delete an
      # active session, you must first end it with the EndSession API operation. For more information about
      # sessions, see Store and retrieve conversation history and context with Amazon Bedrock sessions .
      def delete_session(
        session_identifier : String
      ) : Protocol::Request
        input = Types::DeleteSessionRequest.new(session_identifier: session_identifier)
        delete_session(input)
      end
      def delete_session(input : Types::DeleteSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Ends the session. After you end a session, you can still access its content but you can’t add to it.
      # To delete the session and it's content, you use the DeleteSession API operation. For more
      # information about sessions, see Store and retrieve conversation history and context with Amazon
      # Bedrock sessions .
      def end_session(
        session_identifier : String
      ) : Protocol::Request
        input = Types::EndSessionRequest.new(session_identifier: session_identifier)
        end_session(input)
      end
      def end_session(input : Types::EndSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::END_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates an SQL query from a natural language query. For more information, see Generate a query for
      # structured data in the Amazon Bedrock User Guide.
      def generate_query(
        query_generation_input : Types::QueryGenerationInput,
        transformation_configuration : Types::TransformationConfiguration
      ) : Protocol::Request
        input = Types::GenerateQueryRequest.new(query_generation_input: query_generation_input, transformation_configuration: transformation_configuration)
        generate_query(input)
      end
      def generate_query(input : Types::GenerateQueryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the sessions stored in the memory of the agent.
      def get_agent_memory(
        agent_alias_id : String,
        agent_id : String,
        memory_id : String,
        memory_type : String,
        max_items : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetAgentMemoryRequest.new(agent_alias_id: agent_alias_id, agent_id: agent_id, memory_id: memory_id, memory_type: memory_type, max_items: max_items, next_token: next_token)
        get_agent_memory(input)
      end
      def get_agent_memory(input : Types::GetAgentMemoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_MEMORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the flow definition snapshot used for a flow execution. The snapshot represents the flow
      # metadata and definition as it existed at the time the execution was started. Note that even if the
      # flow is edited after an execution starts, the snapshot connected to the execution remains unchanged.
      # Flow executions is in preview release for Amazon Bedrock and is subject to change.
      def get_execution_flow_snapshot(
        execution_identifier : String,
        flow_alias_identifier : String,
        flow_identifier : String
      ) : Protocol::Request
        input = Types::GetExecutionFlowSnapshotRequest.new(execution_identifier: execution_identifier, flow_alias_identifier: flow_alias_identifier, flow_identifier: flow_identifier)
        get_execution_flow_snapshot(input)
      end
      def get_execution_flow_snapshot(input : Types::GetExecutionFlowSnapshotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXECUTION_FLOW_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about a specific flow execution, including its status, start and end times, and
      # any errors that occurred during execution.
      def get_flow_execution(
        execution_identifier : String,
        flow_alias_identifier : String,
        flow_identifier : String
      ) : Protocol::Request
        input = Types::GetFlowExecutionRequest.new(execution_identifier: execution_identifier, flow_alias_identifier: flow_alias_identifier, flow_identifier: flow_identifier)
        get_flow_execution(input)
      end
      def get_flow_execution(input : Types::GetFlowExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FLOW_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of a specific invocation step within an invocation in a session. For more
      # information about sessions, see Store and retrieve conversation history and context with Amazon
      # Bedrock sessions .
      def get_invocation_step(
        invocation_identifier : String,
        invocation_step_id : String,
        session_identifier : String
      ) : Protocol::Request
        input = Types::GetInvocationStepRequest.new(invocation_identifier: invocation_identifier, invocation_step_id: invocation_step_id, session_identifier: session_identifier)
        get_invocation_step(input)
      end
      def get_invocation_step(input : Types::GetInvocationStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INVOCATION_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about a specific session. For more information about sessions, see Store and
      # retrieve conversation history and context with Amazon Bedrock sessions .
      def get_session(
        session_identifier : String
      ) : Protocol::Request
        input = Types::GetSessionRequest.new(session_identifier: session_identifier)
        get_session(input)
      end
      def get_session(input : Types::GetSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a prompt for the agent to process and respond to. Note the following fields for the request:
      # To continue the same conversation with an agent, use the same sessionId value in the request. To
      # activate trace enablement, turn enableTrace to true . Trace enablement helps you follow the agent's
      # reasoning process that led it to the information it processed, the actions it took, and the final
      # result it yielded. For more information, see Trace enablement . End a conversation by setting
      # endSession to true . In the sessionState object, you can include attributes for the session or
      # prompt or, if you configured an action group to return control, results from invocation of the
      # action group. The response contains both chunk and trace attributes. The final response is returned
      # in the bytes field of the chunk object. The InvokeAgent returns one chunk for the entire
      # interaction. The attribution object contains citations for parts of the response. If you set
      # enableTrace to true in the request, you can trace the agent's steps and reasoning process that led
      # it to the response. If the action predicted was configured to return control, the response returns
      # parameters for the action, elicited from the user, in the returnControl field. Errors are also
      # surfaced in the response.
      def invoke_agent(
        agent_alias_id : String,
        agent_id : String,
        session_id : String,
        bedrock_model_configurations : Types::BedrockModelConfigurations? = nil,
        enable_trace : Bool? = nil,
        end_session : Bool? = nil,
        input_text : String? = nil,
        memory_id : String? = nil,
        prompt_creation_configurations : Types::PromptCreationConfigurations? = nil,
        session_state : Types::SessionState? = nil,
        source_arn : String? = nil,
        streaming_configurations : Types::StreamingConfigurations? = nil
      ) : Protocol::Request
        input = Types::InvokeAgentRequest.new(agent_alias_id: agent_alias_id, agent_id: agent_id, session_id: session_id, bedrock_model_configurations: bedrock_model_configurations, enable_trace: enable_trace, end_session: end_session, input_text: input_text, memory_id: memory_id, prompt_creation_configurations: prompt_creation_configurations, session_state: session_state, source_arn: source_arn, streaming_configurations: streaming_configurations)
        invoke_agent(input)
      end
      def invoke_agent(input : Types::InvokeAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invokes an alias of a flow to run the inputs that you specify and return the output of each node as
      # a stream. If there's an error, the error is returned. For more information, see Test a flow in
      # Amazon Bedrock in the Amazon Bedrock User Guide . The CLI doesn't support streaming operations in
      # Amazon Bedrock, including InvokeFlow .
      def invoke_flow(
        flow_alias_identifier : String,
        flow_identifier : String,
        inputs : Array(Types::FlowInput),
        enable_trace : Bool? = nil,
        execution_id : String? = nil,
        model_performance_configuration : Types::ModelPerformanceConfiguration? = nil
      ) : Protocol::Request
        input = Types::InvokeFlowRequest.new(flow_alias_identifier: flow_alias_identifier, flow_identifier: flow_identifier, inputs: inputs, enable_trace: enable_trace, execution_id: execution_id, model_performance_configuration: model_performance_configuration)
        invoke_flow(input)
      end
      def invoke_flow(input : Types::InvokeFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invokes an inline Amazon Bedrock agent using the configurations you provide with the request.
      # Specify the following fields for security purposes. (Optional) customerEncryptionKeyArn – The Amazon
      # Resource Name (ARN) of a KMS key to encrypt the creation of the agent. (Optional)
      # idleSessionTTLinSeconds – Specify the number of seconds for which the agent should maintain session
      # information. After this time expires, the subsequent InvokeInlineAgent request begins a new session.
      # To override the default prompt behavior for agent orchestration and to use advanced prompts, include
      # a promptOverrideConfiguration object. For more information, see Advanced prompts . The agent
      # instructions will not be honored if your agent has only one knowledge base, uses default prompts,
      # has no action group, and user input is disabled.
      def invoke_inline_agent(
        foundation_model : String,
        instruction : String,
        session_id : String,
        action_groups : Array(Types::AgentActionGroup)? = nil,
        agent_collaboration : String? = nil,
        agent_name : String? = nil,
        bedrock_model_configurations : Types::InlineBedrockModelConfigurations? = nil,
        collaborator_configurations : Array(Types::CollaboratorConfiguration)? = nil,
        collaborators : Array(Types::Collaborator)? = nil,
        custom_orchestration : Types::CustomOrchestration? = nil,
        customer_encryption_key_arn : String? = nil,
        enable_trace : Bool? = nil,
        end_session : Bool? = nil,
        guardrail_configuration : Types::GuardrailConfigurationWithArn? = nil,
        idle_session_ttl_in_seconds : Int32? = nil,
        inline_session_state : Types::InlineSessionState? = nil,
        input_text : String? = nil,
        knowledge_bases : Array(Types::KnowledgeBase)? = nil,
        orchestration_type : String? = nil,
        prompt_creation_configurations : Types::PromptCreationConfigurations? = nil,
        prompt_override_configuration : Types::PromptOverrideConfiguration? = nil,
        streaming_configurations : Types::StreamingConfigurations? = nil
      ) : Protocol::Request
        input = Types::InvokeInlineAgentRequest.new(foundation_model: foundation_model, instruction: instruction, session_id: session_id, action_groups: action_groups, agent_collaboration: agent_collaboration, agent_name: agent_name, bedrock_model_configurations: bedrock_model_configurations, collaborator_configurations: collaborator_configurations, collaborators: collaborators, custom_orchestration: custom_orchestration, customer_encryption_key_arn: customer_encryption_key_arn, enable_trace: enable_trace, end_session: end_session, guardrail_configuration: guardrail_configuration, idle_session_ttl_in_seconds: idle_session_ttl_in_seconds, inline_session_state: inline_session_state, input_text: input_text, knowledge_bases: knowledge_bases, orchestration_type: orchestration_type, prompt_creation_configurations: prompt_creation_configurations, prompt_override_configuration: prompt_override_configuration, streaming_configurations: streaming_configurations)
        invoke_inline_agent(input)
      end
      def invoke_inline_agent(input : Types::InvokeInlineAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_INLINE_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists events that occurred during a flow execution. Events provide detailed information about the
      # execution progress, including node inputs and outputs, flow inputs and outputs, condition results,
      # and failure events. Flow executions is in preview release for Amazon Bedrock and is subject to
      # change.
      def list_flow_execution_events(
        event_type : String,
        execution_identifier : String,
        flow_alias_identifier : String,
        flow_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFlowExecutionEventsRequest.new(event_type: event_type, execution_identifier: execution_identifier, flow_alias_identifier: flow_alias_identifier, flow_identifier: flow_identifier, max_results: max_results, next_token: next_token)
        list_flow_execution_events(input)
      end
      def list_flow_execution_events(input : Types::ListFlowExecutionEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLOW_EXECUTION_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all executions of a flow. Results can be paginated and include summary information about each
      # execution, such as status, start and end times, and the execution's Amazon Resource Name (ARN). Flow
      # executions is in preview release for Amazon Bedrock and is subject to change.
      def list_flow_executions(
        flow_identifier : String,
        flow_alias_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFlowExecutionsRequest.new(flow_identifier: flow_identifier, flow_alias_identifier: flow_alias_identifier, max_results: max_results, next_token: next_token)
        list_flow_executions(input)
      end
      def list_flow_executions(input : Types::ListFlowExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLOW_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all invocation steps associated with a session and optionally, an invocation within the
      # session. For more information about sessions, see Store and retrieve conversation history and
      # context with Amazon Bedrock sessions .
      def list_invocation_steps(
        session_identifier : String,
        invocation_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInvocationStepsRequest.new(session_identifier: session_identifier, invocation_identifier: invocation_identifier, max_results: max_results, next_token: next_token)
        list_invocation_steps(input)
      end
      def list_invocation_steps(input : Types::ListInvocationStepsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INVOCATION_STEPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all invocations associated with a specific session. For more information about sessions, see
      # Store and retrieve conversation history and context with Amazon Bedrock sessions .
      def list_invocations(
        session_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInvocationsRequest.new(session_identifier: session_identifier, max_results: max_results, next_token: next_token)
        list_invocations(input)
      end
      def list_invocations(input : Types::ListInvocationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INVOCATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all sessions in your Amazon Web Services account. For more information about sessions, see
      # Store and retrieve conversation history and context with Amazon Bedrock sessions .
      def list_sessions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionsRequest.new(max_results: max_results, next_token: next_token)
        list_sessions(input)
      end
      def list_sessions(input : Types::ListSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all the tags for the resource you specify.
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

      # Optimizes a prompt for the task that you specify. For more information, see Optimize a prompt in the
      # Amazon Bedrock User Guide .
      def optimize_prompt(
        input : Types::InputPrompt,
        target_model_id : String
      ) : Protocol::Request
        input = Types::OptimizePromptRequest.new(input: input, target_model_id: target_model_id)
        optimize_prompt(input)
      end
      def optimize_prompt(input : Types::OptimizePromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::OPTIMIZE_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add an invocation step to an invocation in a session. An invocation step stores fine-grained state
      # checkpoints, including text and images, for each interaction. For more information about sessions,
      # see Store and retrieve conversation history and context with Amazon Bedrock sessions . Related APIs:
      # GetInvocationStep ListInvocationSteps ListInvocations ListSessions
      def put_invocation_step(
        invocation_identifier : String,
        invocation_step_time : Time,
        payload : Types::InvocationStepPayload,
        session_identifier : String,
        invocation_step_id : String? = nil
      ) : Protocol::Request
        input = Types::PutInvocationStepRequest.new(invocation_identifier: invocation_identifier, invocation_step_time: invocation_step_time, payload: payload, session_identifier: session_identifier, invocation_step_id: invocation_step_id)
        put_invocation_step(input)
      end
      def put_invocation_step(input : Types::PutInvocationStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_INVOCATION_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Reranks the relevance of sources based on queries. For more information, see Improve the relevance
      # of query responses with a reranker model .
      def rerank(
        queries : Array(Types::RerankQuery),
        reranking_configuration : Types::RerankingConfiguration,
        sources : Array(Types::RerankSource),
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::RerankRequest.new(queries: queries, reranking_configuration: reranking_configuration, sources: sources, next_token: next_token)
        rerank(input)
      end
      def rerank(input : Types::RerankRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RERANK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Queries a knowledge base and retrieves information from it.
      def retrieve(
        knowledge_base_id : String,
        retrieval_query : Types::KnowledgeBaseQuery,
        guardrail_configuration : Types::GuardrailConfiguration? = nil,
        next_token : String? = nil,
        retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration? = nil
      ) : Protocol::Request
        input = Types::RetrieveRequest.new(knowledge_base_id: knowledge_base_id, retrieval_query: retrieval_query, guardrail_configuration: guardrail_configuration, next_token: next_token, retrieval_configuration: retrieval_configuration)
        retrieve(input)
      end
      def retrieve(input : Types::RetrieveRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETRIEVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Queries a knowledge base and generates responses based on the retrieved results and using the
      # specified foundation model or inference profile . The response only cites sources that are relevant
      # to the query.
      def retrieve_and_generate(
        input : Types::RetrieveAndGenerateInput,
        retrieve_and_generate_configuration : Types::RetrieveAndGenerateConfiguration? = nil,
        session_configuration : Types::RetrieveAndGenerateSessionConfiguration? = nil,
        session_id : String? = nil
      ) : Protocol::Request
        input = Types::RetrieveAndGenerateRequest.new(input: input, retrieve_and_generate_configuration: retrieve_and_generate_configuration, session_configuration: session_configuration, session_id: session_id)
        retrieve_and_generate(input)
      end
      def retrieve_and_generate(input : Types::RetrieveAndGenerateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETRIEVE_AND_GENERATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Queries a knowledge base and generates responses based on the retrieved results, with output in
      # streaming format. The CLI doesn't support streaming operations in Amazon Bedrock, including
      # InvokeModelWithResponseStream . This operation requires permission for the
      # bedrock:RetrieveAndGenerate action.
      def retrieve_and_generate_stream(
        input : Types::RetrieveAndGenerateInput,
        retrieve_and_generate_configuration : Types::RetrieveAndGenerateConfiguration? = nil,
        session_configuration : Types::RetrieveAndGenerateSessionConfiguration? = nil,
        session_id : String? = nil
      ) : Protocol::Request
        input = Types::RetrieveAndGenerateStreamRequest.new(input: input, retrieve_and_generate_configuration: retrieve_and_generate_configuration, session_configuration: session_configuration, session_id: session_id)
        retrieve_and_generate_stream(input)
      end
      def retrieve_and_generate_stream(input : Types::RetrieveAndGenerateStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RETRIEVE_AND_GENERATE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an execution of an Amazon Bedrock flow. Unlike flows that run until completion or time out
      # after five minutes, flow executions let you run flows asynchronously for longer durations. Flow
      # executions also yield control so that your application can perform other tasks. This operation
      # returns an Amazon Resource Name (ARN) that you can use to track and manage your flow execution. Flow
      # executions is in preview release for Amazon Bedrock and is subject to change.
      def start_flow_execution(
        flow_alias_identifier : String,
        flow_identifier : String,
        inputs : Array(Types::FlowInput),
        flow_execution_name : String? = nil,
        model_performance_configuration : Types::ModelPerformanceConfiguration? = nil
      ) : Protocol::Request
        input = Types::StartFlowExecutionRequest.new(flow_alias_identifier: flow_alias_identifier, flow_identifier: flow_identifier, inputs: inputs, flow_execution_name: flow_execution_name, model_performance_configuration: model_performance_configuration)
        start_flow_execution(input)
      end
      def start_flow_execution(input : Types::StartFlowExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_FLOW_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops an Amazon Bedrock flow's execution. This operation prevents further processing of the flow and
      # changes the execution status to Aborted .
      def stop_flow_execution(
        execution_identifier : String,
        flow_alias_identifier : String,
        flow_identifier : String
      ) : Protocol::Request
        input = Types::StopFlowExecutionRequest.new(execution_identifier: execution_identifier, flow_alias_identifier: flow_alias_identifier, flow_identifier: flow_identifier)
        stop_flow_execution(input)
      end
      def stop_flow_execution(input : Types::StopFlowExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_FLOW_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate tags with a resource. For more information, see Tagging resources in the Amazon Bedrock
      # User Guide.
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

      # Remove tags from a resource.
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

      # Updates the metadata or encryption settings of a session. For more information about sessions, see
      # Store and retrieve conversation history and context with Amazon Bedrock sessions .
      def update_session(
        session_identifier : String,
        session_metadata : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateSessionRequest.new(session_identifier: session_identifier, session_metadata: session_metadata)
        update_session(input)
      end
      def update_session(input : Types::UpdateSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
