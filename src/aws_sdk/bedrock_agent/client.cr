module AwsSdk
  module BedrockAgent
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

      # Makes an agent a collaborator for another agent.
      def associate_agent_collaborator(
        agent_descriptor : Types::AgentDescriptor,
        agent_id : String,
        agent_version : String,
        collaboration_instruction : String,
        collaborator_name : String,
        client_token : String? = nil,
        relay_conversation_history : String? = nil
      ) : Protocol::Request
        input = Types::AssociateAgentCollaboratorRequest.new(agent_descriptor: agent_descriptor, agent_id: agent_id, agent_version: agent_version, collaboration_instruction: collaboration_instruction, collaborator_name: collaborator_name, client_token: client_token, relay_conversation_history: relay_conversation_history)
        associate_agent_collaborator(input)
      end
      def associate_agent_collaborator(input : Types::AssociateAgentCollaboratorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_AGENT_COLLABORATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a knowledge base with an agent. If a knowledge base is associated and its indexState is
      # set to Enabled , the agent queries the knowledge base for information to augment its response to the
      # user.
      def associate_agent_knowledge_base(
        agent_id : String,
        agent_version : String,
        description : String,
        knowledge_base_id : String,
        knowledge_base_state : String? = nil
      ) : Protocol::Request
        input = Types::AssociateAgentKnowledgeBaseRequest.new(agent_id: agent_id, agent_version: agent_version, description: description, knowledge_base_id: knowledge_base_id, knowledge_base_state: knowledge_base_state)
        associate_agent_knowledge_base(input)
      end
      def associate_agent_knowledge_base(input : Types::AssociateAgentKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_AGENT_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an agent that orchestrates interactions between foundation models, data sources, software
      # applications, user conversations, and APIs to carry out tasks to help customers. Specify the
      # following fields for security purposes. agentResourceRoleArn – The Amazon Resource Name (ARN) of the
      # role with permissions to invoke API operations on an agent. (Optional) customerEncryptionKeyArn –
      # The Amazon Resource Name (ARN) of a KMS key to encrypt the creation of the agent. (Optional)
      # idleSessionTTLinSeconds – Specify the number of seconds for which the agent should maintain session
      # information. After this time expires, the subsequent InvokeAgent request begins a new session. To
      # enable your agent to retain conversational context across multiple sessions, include a
      # memoryConfiguration object. For more information, see Configure memory . To override the default
      # prompt behavior for agent orchestration and to use advanced prompts, include a
      # promptOverrideConfiguration object. For more information, see Advanced prompts . If your agent fails
      # to be created, the response returns a list of failureReasons alongside a list of recommendedActions
      # for you to troubleshoot. The agent instructions will not be honored if your agent has only one
      # knowledge base, uses default prompts, has no action group, and user input is disabled.
      def create_agent(
        agent_name : String,
        agent_collaboration : String? = nil,
        agent_resource_role_arn : String? = nil,
        client_token : String? = nil,
        custom_orchestration : Types::CustomOrchestration? = nil,
        customer_encryption_key_arn : String? = nil,
        description : String? = nil,
        foundation_model : String? = nil,
        guardrail_configuration : Types::GuardrailConfiguration? = nil,
        idle_session_ttl_in_seconds : Int32? = nil,
        instruction : String? = nil,
        memory_configuration : Types::MemoryConfiguration? = nil,
        orchestration_type : String? = nil,
        prompt_override_configuration : Types::PromptOverrideConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAgentRequest.new(agent_name: agent_name, agent_collaboration: agent_collaboration, agent_resource_role_arn: agent_resource_role_arn, client_token: client_token, custom_orchestration: custom_orchestration, customer_encryption_key_arn: customer_encryption_key_arn, description: description, foundation_model: foundation_model, guardrail_configuration: guardrail_configuration, idle_session_ttl_in_seconds: idle_session_ttl_in_seconds, instruction: instruction, memory_configuration: memory_configuration, orchestration_type: orchestration_type, prompt_override_configuration: prompt_override_configuration, tags: tags)
        create_agent(input)
      end
      def create_agent(input : Types::CreateAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an action group for an agent. An action group represents the actions that an agent can carry
      # out for the customer by defining the APIs that an agent can call and the logic for calling them. To
      # allow your agent to request the user for additional information when trying to complete a task, add
      # an action group with the parentActionGroupSignature field set to AMAZON.UserInput . To allow your
      # agent to generate, run, and troubleshoot code when trying to complete a task, add an action group
      # with the parentActionGroupSignature field set to AMAZON.CodeInterpreter . You must leave the
      # description , apiSchema , and actionGroupExecutor fields blank for this action group. During
      # orchestration, if your agent determines that it needs to invoke an API in an action group, but
      # doesn't have enough information to complete the API request, it will invoke this action group
      # instead and return an Observation reprompting the user for more information.
      def create_agent_action_group(
        action_group_name : String,
        agent_id : String,
        agent_version : String,
        action_group_executor : Types::ActionGroupExecutor? = nil,
        action_group_state : String? = nil,
        api_schema : Types::APISchema? = nil,
        client_token : String? = nil,
        description : String? = nil,
        function_schema : Types::FunctionSchema? = nil,
        parent_action_group_signature : String? = nil,
        parent_action_group_signature_params : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAgentActionGroupRequest.new(action_group_name: action_group_name, agent_id: agent_id, agent_version: agent_version, action_group_executor: action_group_executor, action_group_state: action_group_state, api_schema: api_schema, client_token: client_token, description: description, function_schema: function_schema, parent_action_group_signature: parent_action_group_signature, parent_action_group_signature_params: parent_action_group_signature_params)
        create_agent_action_group(input)
      end
      def create_agent_action_group(input : Types::CreateAgentActionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AGENT_ACTION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an alias of an agent that can be used to deploy the agent.
      def create_agent_alias(
        agent_alias_name : String,
        agent_id : String,
        client_token : String? = nil,
        description : String? = nil,
        routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAgentAliasRequest.new(agent_alias_name: agent_alias_name, agent_id: agent_id, client_token: client_token, description: description, routing_configuration: routing_configuration, tags: tags)
        create_agent_alias(input)
      end
      def create_agent_alias(input : Types::CreateAgentAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AGENT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Connects a knowledge base to a data source. You specify the configuration for the specific data
      # source service in the dataSourceConfiguration field. You can't change the chunkingConfiguration
      # after you create the data source connector.
      def create_data_source(
        data_source_configuration : Types::DataSourceConfiguration,
        knowledge_base_id : String,
        name : String,
        client_token : String? = nil,
        data_deletion_policy : String? = nil,
        description : String? = nil,
        server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
        vector_ingestion_configuration : Types::VectorIngestionConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateDataSourceRequest.new(data_source_configuration: data_source_configuration, knowledge_base_id: knowledge_base_id, name: name, client_token: client_token, data_deletion_policy: data_deletion_policy, description: description, server_side_encryption_configuration: server_side_encryption_configuration, vector_ingestion_configuration: vector_ingestion_configuration)
        create_data_source(input)
      end
      def create_data_source(input : Types::CreateDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a prompt flow that you can use to send an input through various steps to yield an output.
      # Configure nodes, each of which corresponds to a step of the flow, and create connections between the
      # nodes to create paths to different outputs. For more information, see How it works and Create a flow
      # in Amazon Bedrock in the Amazon Bedrock User Guide.
      def create_flow(
        execution_role_arn : String,
        name : String,
        client_token : String? = nil,
        customer_encryption_key_arn : String? = nil,
        definition : Types::FlowDefinition? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFlowRequest.new(execution_role_arn: execution_role_arn, name: name, client_token: client_token, customer_encryption_key_arn: customer_encryption_key_arn, definition: definition, description: description, tags: tags)
        create_flow(input)
      end
      def create_flow(input : Types::CreateFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an alias of a flow for deployment. For more information, see Deploy a flow in Amazon Bedrock
      # in the Amazon Bedrock User Guide.
      def create_flow_alias(
        flow_identifier : String,
        name : String,
        routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem),
        client_token : String? = nil,
        concurrency_configuration : Types::FlowAliasConcurrencyConfiguration? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFlowAliasRequest.new(flow_identifier: flow_identifier, name: name, routing_configuration: routing_configuration, client_token: client_token, concurrency_configuration: concurrency_configuration, description: description, tags: tags)
        create_flow_alias(input)
      end
      def create_flow_alias(input : Types::CreateFlowAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FLOW_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version of the flow that you can deploy. For more information, see Deploy a flow in Amazon
      # Bedrock in the Amazon Bedrock User Guide.
      def create_flow_version(
        flow_identifier : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateFlowVersionRequest.new(flow_identifier: flow_identifier, client_token: client_token, description: description)
        create_flow_version(input)
      end
      def create_flow_version(input : Types::CreateFlowVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FLOW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a knowledge base. A knowledge base contains your data sources so that Large Language Models
      # (LLMs) can use your data. To create a knowledge base, you must first set up your data sources and
      # configure a supported vector store. For more information, see Set up a knowledge base . If you
      # prefer to let Amazon Bedrock create and manage a vector store for you in Amazon OpenSearch Service,
      # use the console. For more information, see Create a knowledge base . Provide the name and an
      # optional description . Provide the Amazon Resource Name (ARN) with permissions to create a knowledge
      # base in the roleArn field. Provide the embedding model to use in the embeddingModelArn field in the
      # knowledgeBaseConfiguration object. Provide the configuration for your vector store in the
      # storageConfiguration object. For an Amazon OpenSearch Service database, use the
      # opensearchServerlessConfiguration object. For more information, see Create a vector store in Amazon
      # OpenSearch Service . For an Amazon Aurora database, use the RdsConfiguration object. For more
      # information, see Create a vector store in Amazon Aurora . For a Pinecone database, use the
      # pineconeConfiguration object. For more information, see Create a vector store in Pinecone . For a
      # Redis Enterprise Cloud database, use the redisEnterpriseCloudConfiguration object. For more
      # information, see Create a vector store in Redis Enterprise Cloud .
      def create_knowledge_base(
        knowledge_base_configuration : Types::KnowledgeBaseConfiguration,
        name : String,
        role_arn : String,
        client_token : String? = nil,
        description : String? = nil,
        storage_configuration : Types::StorageConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateKnowledgeBaseRequest.new(knowledge_base_configuration: knowledge_base_configuration, name: name, role_arn: role_arn, client_token: client_token, description: description, storage_configuration: storage_configuration, tags: tags)
        create_knowledge_base(input)
      end
      def create_knowledge_base(input : Types::CreateKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a prompt in your prompt library that you can add to a flow. For more information, see Prompt
      # management in Amazon Bedrock , Create a prompt using Prompt management and Prompt flows in Amazon
      # Bedrock in the Amazon Bedrock User Guide.
      def create_prompt(
        name : String,
        client_token : String? = nil,
        customer_encryption_key_arn : String? = nil,
        default_variant : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil,
        variants : Array(Types::PromptVariant)? = nil
      ) : Protocol::Request
        input = Types::CreatePromptRequest.new(name: name, client_token: client_token, customer_encryption_key_arn: customer_encryption_key_arn, default_variant: default_variant, description: description, tags: tags, variants: variants)
        create_prompt(input)
      end
      def create_prompt(input : Types::CreatePromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a static snapshot of your prompt that can be deployed to production. For more information,
      # see Deploy prompts using Prompt management by creating versions in the Amazon Bedrock User Guide.
      def create_prompt_version(
        prompt_identifier : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePromptVersionRequest.new(prompt_identifier: prompt_identifier, client_token: client_token, description: description, tags: tags)
        create_prompt_version(input)
      end
      def create_prompt_version(input : Types::CreatePromptVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROMPT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an agent.
      def delete_agent(
        agent_id : String,
        skip_resource_in_use_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteAgentRequest.new(agent_id: agent_id, skip_resource_in_use_check: skip_resource_in_use_check)
        delete_agent(input)
      end
      def delete_agent(input : Types::DeleteAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an action group in an agent.
      def delete_agent_action_group(
        action_group_id : String,
        agent_id : String,
        agent_version : String,
        skip_resource_in_use_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteAgentActionGroupRequest.new(action_group_id: action_group_id, agent_id: agent_id, agent_version: agent_version, skip_resource_in_use_check: skip_resource_in_use_check)
        delete_agent_action_group(input)
      end
      def delete_agent_action_group(input : Types::DeleteAgentActionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AGENT_ACTION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an alias of an agent.
      def delete_agent_alias(
        agent_alias_id : String,
        agent_id : String
      ) : Protocol::Request
        input = Types::DeleteAgentAliasRequest.new(agent_alias_id: agent_alias_id, agent_id: agent_id)
        delete_agent_alias(input)
      end
      def delete_agent_alias(input : Types::DeleteAgentAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AGENT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a version of an agent.
      def delete_agent_version(
        agent_id : String,
        agent_version : String,
        skip_resource_in_use_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteAgentVersionRequest.new(agent_id: agent_id, agent_version: agent_version, skip_resource_in_use_check: skip_resource_in_use_check)
        delete_agent_version(input)
      end
      def delete_agent_version(input : Types::DeleteAgentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AGENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a data source from a knowledge base.
      def delete_data_source(
        data_source_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::DeleteDataSourceRequest.new(data_source_id: data_source_id, knowledge_base_id: knowledge_base_id)
        delete_data_source(input)
      end
      def delete_data_source(input : Types::DeleteDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a flow.
      def delete_flow(
        flow_identifier : String,
        skip_resource_in_use_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteFlowRequest.new(flow_identifier: flow_identifier, skip_resource_in_use_check: skip_resource_in_use_check)
        delete_flow(input)
      end
      def delete_flow(input : Types::DeleteFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an alias of a flow.
      def delete_flow_alias(
        alias_identifier : String,
        flow_identifier : String
      ) : Protocol::Request
        input = Types::DeleteFlowAliasRequest.new(alias_identifier: alias_identifier, flow_identifier: flow_identifier)
        delete_flow_alias(input)
      end
      def delete_flow_alias(input : Types::DeleteFlowAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FLOW_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a version of a flow.
      def delete_flow_version(
        flow_identifier : String,
        flow_version : String,
        skip_resource_in_use_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteFlowVersionRequest.new(flow_identifier: flow_identifier, flow_version: flow_version, skip_resource_in_use_check: skip_resource_in_use_check)
        delete_flow_version(input)
      end
      def delete_flow_version(input : Types::DeleteFlowVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FLOW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a knowledge base. Before deleting a knowledge base, you should disassociate the knowledge
      # base from any agents that it is associated with by making a DisassociateAgentKnowledgeBase request.
      def delete_knowledge_base(
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::DeleteKnowledgeBaseRequest.new(knowledge_base_id: knowledge_base_id)
        delete_knowledge_base(input)
      end
      def delete_knowledge_base(input : Types::DeleteKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes documents from a data source and syncs the changes to the knowledge base that is connected
      # to it. For more information, see Ingest changes directly into a knowledge base in the Amazon Bedrock
      # User Guide.
      def delete_knowledge_base_documents(
        data_source_id : String,
        document_identifiers : Array(Types::DocumentIdentifier),
        knowledge_base_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteKnowledgeBaseDocumentsRequest.new(data_source_id: data_source_id, document_identifiers: document_identifiers, knowledge_base_id: knowledge_base_id, client_token: client_token)
        delete_knowledge_base_documents(input)
      end
      def delete_knowledge_base_documents(input : Types::DeleteKnowledgeBaseDocumentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KNOWLEDGE_BASE_DOCUMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a prompt or a version of it, depending on whether you include the promptVersion field or
      # not. For more information, see Delete prompts from the Prompt management tool and Delete a version
      # of a prompt from the Prompt management tool in the Amazon Bedrock User Guide.
      def delete_prompt(
        prompt_identifier : String,
        prompt_version : String? = nil
      ) : Protocol::Request
        input = Types::DeletePromptRequest.new(prompt_identifier: prompt_identifier, prompt_version: prompt_version)
        delete_prompt(input)
      end
      def delete_prompt(input : Types::DeletePromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an agent collaborator.
      def disassociate_agent_collaborator(
        agent_id : String,
        agent_version : String,
        collaborator_id : String
      ) : Protocol::Request
        input = Types::DisassociateAgentCollaboratorRequest.new(agent_id: agent_id, agent_version: agent_version, collaborator_id: collaborator_id)
        disassociate_agent_collaborator(input)
      end
      def disassociate_agent_collaborator(input : Types::DisassociateAgentCollaboratorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_AGENT_COLLABORATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a knowledge base from an agent.
      def disassociate_agent_knowledge_base(
        agent_id : String,
        agent_version : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::DisassociateAgentKnowledgeBaseRequest.new(agent_id: agent_id, agent_version: agent_version, knowledge_base_id: knowledge_base_id)
        disassociate_agent_knowledge_base(input)
      end
      def disassociate_agent_knowledge_base(input : Types::DisassociateAgentKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_AGENT_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an agent.
      def get_agent(
        agent_id : String
      ) : Protocol::Request
        input = Types::GetAgentRequest.new(agent_id: agent_id)
        get_agent(input)
      end
      def get_agent(input : Types::GetAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an action group for an agent.
      def get_agent_action_group(
        action_group_id : String,
        agent_id : String,
        agent_version : String
      ) : Protocol::Request
        input = Types::GetAgentActionGroupRequest.new(action_group_id: action_group_id, agent_id: agent_id, agent_version: agent_version)
        get_agent_action_group(input)
      end
      def get_agent_action_group(input : Types::GetAgentActionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_ACTION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an alias of an agent.
      def get_agent_alias(
        agent_alias_id : String,
        agent_id : String
      ) : Protocol::Request
        input = Types::GetAgentAliasRequest.new(agent_alias_id: agent_alias_id, agent_id: agent_id)
        get_agent_alias(input)
      end
      def get_agent_alias(input : Types::GetAgentAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an agent's collaborator.
      def get_agent_collaborator(
        agent_id : String,
        agent_version : String,
        collaborator_id : String
      ) : Protocol::Request
        input = Types::GetAgentCollaboratorRequest.new(agent_id: agent_id, agent_version: agent_version, collaborator_id: collaborator_id)
        get_agent_collaborator(input)
      end
      def get_agent_collaborator(input : Types::GetAgentCollaboratorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_COLLABORATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a knowledge base associated with an agent.
      def get_agent_knowledge_base(
        agent_id : String,
        agent_version : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetAgentKnowledgeBaseRequest.new(agent_id: agent_id, agent_version: agent_version, knowledge_base_id: knowledge_base_id)
        get_agent_knowledge_base(input)
      end
      def get_agent_knowledge_base(input : Types::GetAgentKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a version of an agent.
      def get_agent_version(
        agent_id : String,
        agent_version : String
      ) : Protocol::Request
        input = Types::GetAgentVersionRequest.new(agent_id: agent_id, agent_version: agent_version)
        get_agent_version(input)
      end
      def get_agent_version(input : Types::GetAgentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a data source.
      def get_data_source(
        data_source_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetDataSourceRequest.new(data_source_id: data_source_id, knowledge_base_id: knowledge_base_id)
        get_data_source(input)
      end
      def get_data_source(input : Types::GetDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a flow. For more information, see Manage a flow in Amazon Bedrock in the
      # Amazon Bedrock User Guide.
      def get_flow(
        flow_identifier : String
      ) : Protocol::Request
        input = Types::GetFlowRequest.new(flow_identifier: flow_identifier)
        get_flow(input)
      end
      def get_flow(input : Types::GetFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a flow. For more information, see Deploy a flow in Amazon Bedrock in the
      # Amazon Bedrock User Guide.
      def get_flow_alias(
        alias_identifier : String,
        flow_identifier : String
      ) : Protocol::Request
        input = Types::GetFlowAliasRequest.new(alias_identifier: alias_identifier, flow_identifier: flow_identifier)
        get_flow_alias(input)
      end
      def get_flow_alias(input : Types::GetFlowAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FLOW_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a version of a flow. For more information, see Deploy a flow in Amazon
      # Bedrock in the Amazon Bedrock User Guide.
      def get_flow_version(
        flow_identifier : String,
        flow_version : String
      ) : Protocol::Request
        input = Types::GetFlowVersionRequest.new(flow_identifier: flow_identifier, flow_version: flow_version)
        get_flow_version(input)
      end
      def get_flow_version(input : Types::GetFlowVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FLOW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a data ingestion job. Data sources are ingested into your knowledge base so
      # that Large Language Models (LLMs) can use your data.
      def get_ingestion_job(
        data_source_id : String,
        ingestion_job_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetIngestionJobRequest.new(data_source_id: data_source_id, ingestion_job_id: ingestion_job_id, knowledge_base_id: knowledge_base_id)
        get_ingestion_job(input)
      end
      def get_ingestion_job(input : Types::GetIngestionJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INGESTION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a knowledge base.
      def get_knowledge_base(
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetKnowledgeBaseRequest.new(knowledge_base_id: knowledge_base_id)
        get_knowledge_base(input)
      end
      def get_knowledge_base(input : Types::GetKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves specific documents from a data source that is connected to a knowledge base. For more
      # information, see Ingest changes directly into a knowledge base in the Amazon Bedrock User Guide.
      def get_knowledge_base_documents(
        data_source_id : String,
        document_identifiers : Array(Types::DocumentIdentifier),
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::GetKnowledgeBaseDocumentsRequest.new(data_source_id: data_source_id, document_identifiers: document_identifiers, knowledge_base_id: knowledge_base_id)
        get_knowledge_base_documents(input)
      end
      def get_knowledge_base_documents(input : Types::GetKnowledgeBaseDocumentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KNOWLEDGE_BASE_DOCUMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the working draft ( DRAFT version) of a prompt or a version of it,
      # depending on whether you include the promptVersion field or not. For more information, see View
      # information about prompts using Prompt management and View information about a version of your
      # prompt in the Amazon Bedrock User Guide.
      def get_prompt(
        prompt_identifier : String,
        prompt_version : String? = nil
      ) : Protocol::Request
        input = Types::GetPromptRequest.new(prompt_identifier: prompt_identifier, prompt_version: prompt_version)
        get_prompt(input)
      end
      def get_prompt(input : Types::GetPromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Ingests documents directly into the knowledge base that is connected to the data source. The
      # dataSourceType specified in the content for each document must match the type of the data source
      # that you specify in the header. For more information, see Ingest changes directly into a knowledge
      # base in the Amazon Bedrock User Guide.
      def ingest_knowledge_base_documents(
        data_source_id : String,
        documents : Array(Types::KnowledgeBaseDocument),
        knowledge_base_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::IngestKnowledgeBaseDocumentsRequest.new(data_source_id: data_source_id, documents: documents, knowledge_base_id: knowledge_base_id, client_token: client_token)
        ingest_knowledge_base_documents(input)
      end
      def ingest_knowledge_base_documents(input : Types::IngestKnowledgeBaseDocumentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INGEST_KNOWLEDGE_BASE_DOCUMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the action groups for an agent and information about each one.
      def list_agent_action_groups(
        agent_id : String,
        agent_version : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentActionGroupsRequest.new(agent_id: agent_id, agent_version: agent_version, max_results: max_results, next_token: next_token)
        list_agent_action_groups(input)
      end
      def list_agent_action_groups(input : Types::ListAgentActionGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENT_ACTION_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the aliases of an agent and information about each one.
      def list_agent_aliases(
        agent_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentAliasesRequest.new(agent_id: agent_id, max_results: max_results, next_token: next_token)
        list_agent_aliases(input)
      end
      def list_agent_aliases(input : Types::ListAgentAliasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENT_ALIASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a list of an agent's collaborators.
      def list_agent_collaborators(
        agent_id : String,
        agent_version : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentCollaboratorsRequest.new(agent_id: agent_id, agent_version: agent_version, max_results: max_results, next_token: next_token)
        list_agent_collaborators(input)
      end
      def list_agent_collaborators(input : Types::ListAgentCollaboratorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENT_COLLABORATORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists knowledge bases associated with an agent and information about each one.
      def list_agent_knowledge_bases(
        agent_id : String,
        agent_version : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentKnowledgeBasesRequest.new(agent_id: agent_id, agent_version: agent_version, max_results: max_results, next_token: next_token)
        list_agent_knowledge_bases(input)
      end
      def list_agent_knowledge_bases(input : Types::ListAgentKnowledgeBasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENT_KNOWLEDGE_BASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of an agent and information about each version.
      def list_agent_versions(
        agent_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentVersionsRequest.new(agent_id: agent_id, max_results: max_results, next_token: next_token)
        list_agent_versions(input)
      end
      def list_agent_versions(input : Types::ListAgentVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the agents belonging to an account and information about each agent.
      def list_agents(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentsRequest.new(max_results: max_results, next_token: next_token)
        list_agents(input)
      end
      def list_agents(input : Types::ListAgentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the data sources in a knowledge base and information about each one.
      def list_data_sources(
        knowledge_base_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSourcesRequest.new(knowledge_base_id: knowledge_base_id, max_results: max_results, next_token: next_token)
        list_data_sources(input)
      end
      def list_data_sources(input : Types::ListDataSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of aliases for a flow.
      def list_flow_aliases(
        flow_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFlowAliasesRequest.new(flow_identifier: flow_identifier, max_results: max_results, next_token: next_token)
        list_flow_aliases(input)
      end
      def list_flow_aliases(input : Types::ListFlowAliasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLOW_ALIASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of information about each flow. For more information, see Deploy a flow in Amazon
      # Bedrock in the Amazon Bedrock User Guide.
      def list_flow_versions(
        flow_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFlowVersionsRequest.new(flow_identifier: flow_identifier, max_results: max_results, next_token: next_token)
        list_flow_versions(input)
      end
      def list_flow_versions(input : Types::ListFlowVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLOW_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of flows and information about each flow. For more information, see Manage a flow in
      # Amazon Bedrock in the Amazon Bedrock User Guide.
      def list_flows(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFlowsRequest.new(max_results: max_results, next_token: next_token)
        list_flows(input)
      end
      def list_flows(input : Types::ListFlowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the data ingestion jobs for a data source. The list also includes information about each job.
      def list_ingestion_jobs(
        data_source_id : String,
        knowledge_base_id : String,
        filters : Array(Types::IngestionJobFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::IngestionJobSortBy? = nil
      ) : Protocol::Request
        input = Types::ListIngestionJobsRequest.new(data_source_id: data_source_id, knowledge_base_id: knowledge_base_id, filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by)
        list_ingestion_jobs(input)
      end
      def list_ingestion_jobs(input : Types::ListIngestionJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INGESTION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all the documents contained in a data source that is connected to a knowledge base. For
      # more information, see Ingest changes directly into a knowledge base in the Amazon Bedrock User
      # Guide.
      def list_knowledge_base_documents(
        data_source_id : String,
        knowledge_base_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKnowledgeBaseDocumentsRequest.new(data_source_id: data_source_id, knowledge_base_id: knowledge_base_id, max_results: max_results, next_token: next_token)
        list_knowledge_base_documents(input)
      end
      def list_knowledge_base_documents(input : Types::ListKnowledgeBaseDocumentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KNOWLEDGE_BASE_DOCUMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the knowledge bases in an account. The list also includesinformation about each knowledge
      # base.
      def list_knowledge_bases(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKnowledgeBasesRequest.new(max_results: max_results, next_token: next_token)
        list_knowledge_bases(input)
      end
      def list_knowledge_bases(input : Types::ListKnowledgeBasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KNOWLEDGE_BASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns either information about the working draft ( DRAFT version) of each prompt in an account, or
      # information about of all versions of a prompt, depending on whether you include the promptIdentifier
      # field or not. For more information, see View information about prompts using Prompt management in
      # the Amazon Bedrock User Guide.
      def list_prompts(
        max_results : Int32? = nil,
        next_token : String? = nil,
        prompt_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListPromptsRequest.new(max_results: max_results, next_token: next_token, prompt_identifier: prompt_identifier)
        list_prompts(input)
      end
      def list_prompts(input : Types::ListPromptsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROMPTS, input, endpoint)
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

      # Creates a DRAFT version of the agent that can be used for internal testing.
      def prepare_agent(
        agent_id : String
      ) : Protocol::Request
        input = Types::PrepareAgentRequest.new(agent_id: agent_id)
        prepare_agent(input)
      end
      def prepare_agent(input : Types::PrepareAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PREPARE_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Prepares the DRAFT version of a flow so that it can be invoked. For more information, see Test a
      # flow in Amazon Bedrock in the Amazon Bedrock User Guide.
      def prepare_flow(
        flow_identifier : String
      ) : Protocol::Request
        input = Types::PrepareFlowRequest.new(flow_identifier: flow_identifier)
        prepare_flow(input)
      end
      def prepare_flow(input : Types::PrepareFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PREPARE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Begins a data ingestion job. Data sources are ingested into your knowledge base so that Large
      # Language Models (LLMs) can use your data.
      def start_ingestion_job(
        data_source_id : String,
        knowledge_base_id : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::StartIngestionJobRequest.new(data_source_id: data_source_id, knowledge_base_id: knowledge_base_id, client_token: client_token, description: description)
        start_ingestion_job(input)
      end
      def start_ingestion_job(input : Types::StartIngestionJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_INGESTION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a currently running data ingestion job. You can send a StartIngestionJob request again to
      # ingest the rest of your data when you are ready.
      def stop_ingestion_job(
        data_source_id : String,
        ingestion_job_id : String,
        knowledge_base_id : String
      ) : Protocol::Request
        input = Types::StopIngestionJobRequest.new(data_source_id: data_source_id, ingestion_job_id: ingestion_job_id, knowledge_base_id: knowledge_base_id)
        stop_ingestion_job(input)
      end
      def stop_ingestion_job(input : Types::StopIngestionJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_INGESTION_JOB, input, endpoint)
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

      # Updates the configuration of an agent.
      def update_agent(
        agent_id : String,
        agent_name : String,
        agent_resource_role_arn : String,
        foundation_model : String,
        agent_collaboration : String? = nil,
        custom_orchestration : Types::CustomOrchestration? = nil,
        customer_encryption_key_arn : String? = nil,
        description : String? = nil,
        guardrail_configuration : Types::GuardrailConfiguration? = nil,
        idle_session_ttl_in_seconds : Int32? = nil,
        instruction : String? = nil,
        memory_configuration : Types::MemoryConfiguration? = nil,
        orchestration_type : String? = nil,
        prompt_override_configuration : Types::PromptOverrideConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateAgentRequest.new(agent_id: agent_id, agent_name: agent_name, agent_resource_role_arn: agent_resource_role_arn, foundation_model: foundation_model, agent_collaboration: agent_collaboration, custom_orchestration: custom_orchestration, customer_encryption_key_arn: customer_encryption_key_arn, description: description, guardrail_configuration: guardrail_configuration, idle_session_ttl_in_seconds: idle_session_ttl_in_seconds, instruction: instruction, memory_configuration: memory_configuration, orchestration_type: orchestration_type, prompt_override_configuration: prompt_override_configuration)
        update_agent(input)
      end
      def update_agent(input : Types::UpdateAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration for an action group for an agent.
      def update_agent_action_group(
        action_group_id : String,
        action_group_name : String,
        agent_id : String,
        agent_version : String,
        action_group_executor : Types::ActionGroupExecutor? = nil,
        action_group_state : String? = nil,
        api_schema : Types::APISchema? = nil,
        description : String? = nil,
        function_schema : Types::FunctionSchema? = nil,
        parent_action_group_signature : String? = nil,
        parent_action_group_signature_params : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateAgentActionGroupRequest.new(action_group_id: action_group_id, action_group_name: action_group_name, agent_id: agent_id, agent_version: agent_version, action_group_executor: action_group_executor, action_group_state: action_group_state, api_schema: api_schema, description: description, function_schema: function_schema, parent_action_group_signature: parent_action_group_signature, parent_action_group_signature_params: parent_action_group_signature_params)
        update_agent_action_group(input)
      end
      def update_agent_action_group(input : Types::UpdateAgentActionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGENT_ACTION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates configurations for an alias of an agent.
      def update_agent_alias(
        agent_alias_id : String,
        agent_alias_name : String,
        agent_id : String,
        alias_invocation_state : String? = nil,
        description : String? = nil,
        routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)? = nil
      ) : Protocol::Request
        input = Types::UpdateAgentAliasRequest.new(agent_alias_id: agent_alias_id, agent_alias_name: agent_alias_name, agent_id: agent_id, alias_invocation_state: alias_invocation_state, description: description, routing_configuration: routing_configuration)
        update_agent_alias(input)
      end
      def update_agent_alias(input : Types::UpdateAgentAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGENT_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an agent's collaborator.
      def update_agent_collaborator(
        agent_descriptor : Types::AgentDescriptor,
        agent_id : String,
        agent_version : String,
        collaboration_instruction : String,
        collaborator_id : String,
        collaborator_name : String,
        relay_conversation_history : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAgentCollaboratorRequest.new(agent_descriptor: agent_descriptor, agent_id: agent_id, agent_version: agent_version, collaboration_instruction: collaboration_instruction, collaborator_id: collaborator_id, collaborator_name: collaborator_name, relay_conversation_history: relay_conversation_history)
        update_agent_collaborator(input)
      end
      def update_agent_collaborator(input : Types::UpdateAgentCollaboratorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGENT_COLLABORATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration for a knowledge base that has been associated with an agent.
      def update_agent_knowledge_base(
        agent_id : String,
        agent_version : String,
        knowledge_base_id : String,
        description : String? = nil,
        knowledge_base_state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAgentKnowledgeBaseRequest.new(agent_id: agent_id, agent_version: agent_version, knowledge_base_id: knowledge_base_id, description: description, knowledge_base_state: knowledge_base_state)
        update_agent_knowledge_base(input)
      end
      def update_agent_knowledge_base(input : Types::UpdateAgentKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGENT_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configurations for a data source connector. You can't change the chunkingConfiguration
      # after you create the data source connector. Specify the existing chunkingConfiguration .
      def update_data_source(
        data_source_configuration : Types::DataSourceConfiguration,
        data_source_id : String,
        knowledge_base_id : String,
        name : String,
        data_deletion_policy : String? = nil,
        description : String? = nil,
        server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
        vector_ingestion_configuration : Types::VectorIngestionConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSourceRequest.new(data_source_configuration: data_source_configuration, data_source_id: data_source_id, knowledge_base_id: knowledge_base_id, name: name, data_deletion_policy: data_deletion_policy, description: description, server_side_encryption_configuration: server_side_encryption_configuration, vector_ingestion_configuration: vector_ingestion_configuration)
        update_data_source(input)
      end
      def update_data_source(input : Types::UpdateDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies a flow. Include both fields that you want to keep and fields that you want to change. For
      # more information, see How it works and Create a flow in Amazon Bedrock in the Amazon Bedrock User
      # Guide.
      def update_flow(
        execution_role_arn : String,
        flow_identifier : String,
        name : String,
        customer_encryption_key_arn : String? = nil,
        definition : Types::FlowDefinition? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFlowRequest.new(execution_role_arn: execution_role_arn, flow_identifier: flow_identifier, name: name, customer_encryption_key_arn: customer_encryption_key_arn, definition: definition, description: description)
        update_flow(input)
      end
      def update_flow(input : Types::UpdateFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the alias of a flow. Include both fields that you want to keep and ones that you want to
      # change. For more information, see Deploy a flow in Amazon Bedrock in the Amazon Bedrock User Guide.
      def update_flow_alias(
        alias_identifier : String,
        flow_identifier : String,
        name : String,
        routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem),
        concurrency_configuration : Types::FlowAliasConcurrencyConfiguration? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFlowAliasRequest.new(alias_identifier: alias_identifier, flow_identifier: flow_identifier, name: name, routing_configuration: routing_configuration, concurrency_configuration: concurrency_configuration, description: description)
        update_flow_alias(input)
      end
      def update_flow_alias(input : Types::UpdateFlowAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLOW_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of a knowledge base with the fields that you specify. Because all fields
      # will be overwritten, you must include the same values for fields that you want to keep the same. You
      # can change the following fields: name description roleArn You can't change the
      # knowledgeBaseConfiguration or storageConfiguration fields, so you must specify the same
      # configurations as when you created the knowledge base. You can send a GetKnowledgeBase request and
      # copy the same configurations.
      def update_knowledge_base(
        knowledge_base_configuration : Types::KnowledgeBaseConfiguration,
        knowledge_base_id : String,
        name : String,
        role_arn : String,
        description : String? = nil,
        storage_configuration : Types::StorageConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateKnowledgeBaseRequest.new(knowledge_base_configuration: knowledge_base_configuration, knowledge_base_id: knowledge_base_id, name: name, role_arn: role_arn, description: description, storage_configuration: storage_configuration)
        update_knowledge_base(input)
      end
      def update_knowledge_base(input : Types::UpdateKnowledgeBaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KNOWLEDGE_BASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies a prompt in your prompt library. Include both fields that you want to keep and fields that
      # you want to replace. For more information, see Prompt management in Amazon Bedrock and Edit prompts
      # in your prompt library in the Amazon Bedrock User Guide.
      def update_prompt(
        name : String,
        prompt_identifier : String,
        customer_encryption_key_arn : String? = nil,
        default_variant : String? = nil,
        description : String? = nil,
        variants : Array(Types::PromptVariant)? = nil
      ) : Protocol::Request
        input = Types::UpdatePromptRequest.new(name: name, prompt_identifier: prompt_identifier, customer_encryption_key_arn: customer_encryption_key_arn, default_variant: default_variant, description: description, variants: variants)
        update_prompt(input)
      end
      def update_prompt(input : Types::UpdatePromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Validates the definition of a flow.
      def validate_flow_definition(
        definition : Types::FlowDefinition
      ) : Protocol::Request
        input = Types::ValidateFlowDefinitionRequest.new(definition: definition)
        validate_flow_definition(input)
      end
      def validate_flow_definition(input : Types::ValidateFlowDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_FLOW_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
