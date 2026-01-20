module Aws
  module BedrockAgentCoreControl
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

      # Creates an Amazon Bedrock AgentCore Runtime.

      def create_agent_runtime(
        agent_runtime_artifact : Types::AgentRuntimeArtifact,
        agent_runtime_name : String,
        network_configuration : Types::NetworkConfiguration,
        role_arn : String,
        authorizer_configuration : Types::AuthorizerConfiguration? = nil,
        client_token : String? = nil,
        description : String? = nil,
        environment_variables : Hash(String, String)? = nil,
        lifecycle_configuration : Types::LifecycleConfiguration? = nil,
        protocol_configuration : Types::ProtocolConfiguration? = nil,
        request_header_configuration : Types::RequestHeaderConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAgentRuntimeRequest.new(agent_runtime_artifact: agent_runtime_artifact, agent_runtime_name: agent_runtime_name, network_configuration: network_configuration, role_arn: role_arn, authorizer_configuration: authorizer_configuration, client_token: client_token, description: description, environment_variables: environment_variables, lifecycle_configuration: lifecycle_configuration, protocol_configuration: protocol_configuration, request_header_configuration: request_header_configuration, tags: tags)
        create_agent_runtime(input)
      end

      def create_agent_runtime(input : Types::CreateAgentRuntimeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AGENT_RUNTIME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an AgentCore Runtime endpoint.

      def create_agent_runtime_endpoint(
        agent_runtime_id : String,
        name : String,
        agent_runtime_version : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAgentRuntimeEndpointRequest.new(agent_runtime_id: agent_runtime_id, name: name, agent_runtime_version: agent_runtime_version, client_token: client_token, description: description, tags: tags)
        create_agent_runtime_endpoint(input)
      end

      def create_agent_runtime_endpoint(input : Types::CreateAgentRuntimeEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AGENT_RUNTIME_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new API key credential provider.

      def create_api_key_credential_provider(
        api_key : String,
        name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApiKeyCredentialProviderRequest.new(api_key: api_key, name: name, tags: tags)
        create_api_key_credential_provider(input)
      end

      def create_api_key_credential_provider(input : Types::CreateApiKeyCredentialProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_API_KEY_CREDENTIAL_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom browser.

      def create_browser(
        name : String,
        network_configuration : Types::BrowserNetworkConfiguration,
        browser_signing : Types::BrowserSigningConfigInput? = nil,
        client_token : String? = nil,
        description : String? = nil,
        execution_role_arn : String? = nil,
        recording : Types::RecordingConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateBrowserRequest.new(name: name, network_configuration: network_configuration, browser_signing: browser_signing, client_token: client_token, description: description, execution_role_arn: execution_role_arn, recording: recording, tags: tags)
        create_browser(input)
      end

      def create_browser(input : Types::CreateBrowserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BROWSER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom code interpreter.

      def create_code_interpreter(
        name : String,
        network_configuration : Types::CodeInterpreterNetworkConfiguration,
        client_token : String? = nil,
        description : String? = nil,
        execution_role_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCodeInterpreterRequest.new(name: name, network_configuration: network_configuration, client_token: client_token, description: description, execution_role_arn: execution_role_arn, tags: tags)
        create_code_interpreter(input)
      end

      def create_code_interpreter(input : Types::CreateCodeInterpreterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CODE_INTERPRETER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom evaluator for agent quality assessment. Custom evaluators use LLM-as-a-Judge
      # configurations with user-defined prompts, rating scales, and model settings to evaluate agent
      # performance at tool call, trace, or session levels.

      def create_evaluator(
        evaluator_config : Types::EvaluatorConfig,
        evaluator_name : String,
        level : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateEvaluatorRequest.new(evaluator_config: evaluator_config, evaluator_name: evaluator_name, level: level, client_token: client_token, description: description)
        create_evaluator(input)
      end

      def create_evaluator(input : Types::CreateEvaluatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVALUATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a gateway for Amazon Bedrock Agent. A gateway serves as an integration point between your
      # agent and external services. If you specify CUSTOM_JWT as the authorizerType , you must provide an
      # authorizerConfiguration .

      def create_gateway(
        authorizer_type : String,
        name : String,
        protocol_type : String,
        role_arn : String,
        authorizer_configuration : Types::AuthorizerConfiguration? = nil,
        client_token : String? = nil,
        description : String? = nil,
        exception_level : String? = nil,
        interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)? = nil,
        kms_key_arn : String? = nil,
        policy_engine_configuration : Types::GatewayPolicyEngineConfiguration? = nil,
        protocol_configuration : Types::GatewayProtocolConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateGatewayRequest.new(authorizer_type: authorizer_type, name: name, protocol_type: protocol_type, role_arn: role_arn, authorizer_configuration: authorizer_configuration, client_token: client_token, description: description, exception_level: exception_level, interceptor_configurations: interceptor_configurations, kms_key_arn: kms_key_arn, policy_engine_configuration: policy_engine_configuration, protocol_configuration: protocol_configuration, tags: tags)
        create_gateway(input)
      end

      def create_gateway(input : Types::CreateGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a target for a gateway. A target defines an endpoint that the gateway can connect to.

      def create_gateway_target(
        gateway_identifier : String,
        name : String,
        target_configuration : Types::TargetConfiguration,
        client_token : String? = nil,
        credential_provider_configurations : Array(Types::CredentialProviderConfiguration)? = nil,
        description : String? = nil,
        metadata_configuration : Types::MetadataConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateGatewayTargetRequest.new(gateway_identifier: gateway_identifier, name: name, target_configuration: target_configuration, client_token: client_token, credential_provider_configurations: credential_provider_configurations, description: description, metadata_configuration: metadata_configuration)
        create_gateway_target(input)
      end

      def create_gateway_target(input : Types::CreateGatewayTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GATEWAY_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Amazon Bedrock AgentCore Memory resource.

      def create_memory(
        event_expiry_duration : Int32,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        encryption_key_arn : String? = nil,
        memory_execution_role_arn : String? = nil,
        memory_strategies : Array(Types::MemoryStrategyInput)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMemoryInput.new(event_expiry_duration: event_expiry_duration, name: name, client_token: client_token, description: description, encryption_key_arn: encryption_key_arn, memory_execution_role_arn: memory_execution_role_arn, memory_strategies: memory_strategies, tags: tags)
        create_memory(input)
      end

      def create_memory(input : Types::CreateMemoryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEMORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new OAuth2 credential provider.

      def create_oauth2_credential_provider(
        credential_provider_vendor : String,
        name : String,
        oauth2_provider_config_input : Types::Oauth2ProviderConfigInput,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateOauth2CredentialProviderRequest.new(credential_provider_vendor: credential_provider_vendor, name: name, oauth2_provider_config_input: oauth2_provider_config_input, tags: tags)
        create_oauth2_credential_provider(input)
      end

      def create_oauth2_credential_provider(input : Types::CreateOauth2CredentialProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_OAUTH2_CREDENTIAL_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an online evaluation configuration for continuous monitoring of agent performance. Online
      # evaluation automatically samples live traffic from CloudWatch logs at specified rates and applies
      # evaluators to assess agent quality in production.

      def create_online_evaluation_config(
        data_source_config : Types::DataSourceConfig,
        enable_on_create : Bool,
        evaluation_execution_role_arn : String,
        evaluators : Array(Types::EvaluatorReference),
        online_evaluation_config_name : String,
        rule : Types::Rule,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateOnlineEvaluationConfigRequest.new(data_source_config: data_source_config, enable_on_create: enable_on_create, evaluation_execution_role_arn: evaluation_execution_role_arn, evaluators: evaluators, online_evaluation_config_name: online_evaluation_config_name, rule: rule, client_token: client_token, description: description)
        create_online_evaluation_config(input)
      end

      def create_online_evaluation_config(input : Types::CreateOnlineEvaluationConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ONLINE_EVALUATION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a policy within the AgentCore Policy system. Policies provide real-time, deterministic
      # control over agentic interactions with AgentCore Gateway. Using the Cedar policy language, you can
      # define fine-grained policies that specify which interactions with Gateway tools are permitted based
      # on input parameters and OAuth claims, ensuring agents operate within defined boundaries and business
      # rules. The policy is validated during creation against the Cedar schema generated from the Gateway's
      # tools' input schemas, which defines the available tools, their parameters, and expected data types.
      # This is an asynchronous operation. Use the GetPolicy operation to poll the status field to track
      # completion.

      def create_policy(
        definition : Types::PolicyDefinition,
        name : String,
        policy_engine_id : String,
        client_token : String? = nil,
        description : String? = nil,
        validation_mode : String? = nil
      ) : Protocol::Request
        input = Types::CreatePolicyRequest.new(definition: definition, name: name, policy_engine_id: policy_engine_id, client_token: client_token, description: description, validation_mode: validation_mode)
        create_policy(input)
      end

      def create_policy(input : Types::CreatePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new policy engine within the AgentCore Policy system. A policy engine is a collection of
      # policies that evaluates and authorizes agent tool calls. When associated with Gateways (each Gateway
      # can be associated with at most one policy engine, but multiple Gateways can be associated with the
      # same engine), the policy engine intercepts all agent requests and determines whether to allow or
      # deny each action based on the defined policies. This is an asynchronous operation. Use the
      # GetPolicyEngine operation to poll the status field to track completion.

      def create_policy_engine(
        name : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreatePolicyEngineRequest.new(name: name, client_token: client_token, description: description)
        create_policy_engine(input)
      end

      def create_policy_engine(input : Types::CreatePolicyEngineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_POLICY_ENGINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new workload identity.

      def create_workload_identity(
        name : String,
        allowed_resource_oauth2_return_urls : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateWorkloadIdentityRequest.new(name: name, allowed_resource_oauth2_return_urls: allowed_resource_oauth2_return_urls, tags: tags)
        create_workload_identity(input)
      end

      def create_workload_identity(input : Types::CreateWorkloadIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKLOAD_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Bedrock AgentCore Runtime.

      def delete_agent_runtime(
        agent_runtime_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAgentRuntimeRequest.new(agent_runtime_id: agent_runtime_id, client_token: client_token)
        delete_agent_runtime(input)
      end

      def delete_agent_runtime(input : Types::DeleteAgentRuntimeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AGENT_RUNTIME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an AAgentCore Runtime endpoint.

      def delete_agent_runtime_endpoint(
        agent_runtime_id : String,
        endpoint_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAgentRuntimeEndpointRequest.new(agent_runtime_id: agent_runtime_id, endpoint_name: endpoint_name, client_token: client_token)
        delete_agent_runtime_endpoint(input)
      end

      def delete_agent_runtime_endpoint(input : Types::DeleteAgentRuntimeEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AGENT_RUNTIME_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an API key credential provider.

      def delete_api_key_credential_provider(
        name : String
      ) : Protocol::Request
        input = Types::DeleteApiKeyCredentialProviderRequest.new(name: name)
        delete_api_key_credential_provider(input)
      end

      def delete_api_key_credential_provider(input : Types::DeleteApiKeyCredentialProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_API_KEY_CREDENTIAL_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom browser.

      def delete_browser(
        browser_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteBrowserRequest.new(browser_id: browser_id, client_token: client_token)
        delete_browser(input)
      end

      def delete_browser(input : Types::DeleteBrowserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BROWSER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom code interpreter.

      def delete_code_interpreter(
        code_interpreter_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteCodeInterpreterRequest.new(code_interpreter_id: code_interpreter_id, client_token: client_token)
        delete_code_interpreter(input)
      end

      def delete_code_interpreter(input : Types::DeleteCodeInterpreterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CODE_INTERPRETER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom evaluator. Builtin evaluators cannot be deleted. The evaluator must not be
      # referenced by any active online evaluation configurations.

      def delete_evaluator(
        evaluator_id : String
      ) : Protocol::Request
        input = Types::DeleteEvaluatorRequest.new(evaluator_id: evaluator_id)
        delete_evaluator(input)
      end

      def delete_evaluator(input : Types::DeleteEvaluatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVALUATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a gateway.

      def delete_gateway(
        gateway_identifier : String
      ) : Protocol::Request
        input = Types::DeleteGatewayRequest.new(gateway_identifier: gateway_identifier)
        delete_gateway(input)
      end

      def delete_gateway(input : Types::DeleteGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a gateway target.

      def delete_gateway_target(
        gateway_identifier : String,
        target_id : String
      ) : Protocol::Request
        input = Types::DeleteGatewayTargetRequest.new(gateway_identifier: gateway_identifier, target_id: target_id)
        delete_gateway_target(input)
      end

      def delete_gateway_target(input : Types::DeleteGatewayTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GATEWAY_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Bedrock AgentCore Memory resource.

      def delete_memory(
        memory_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteMemoryInput.new(memory_id: memory_id, client_token: client_token)
        delete_memory(input)
      end

      def delete_memory(input : Types::DeleteMemoryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEMORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an OAuth2 credential provider.

      def delete_oauth2_credential_provider(
        name : String
      ) : Protocol::Request
        input = Types::DeleteOauth2CredentialProviderRequest.new(name: name)
        delete_oauth2_credential_provider(input)
      end

      def delete_oauth2_credential_provider(input : Types::DeleteOauth2CredentialProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OAUTH2_CREDENTIAL_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an online evaluation configuration and stops any ongoing evaluation processes associated
      # with it.

      def delete_online_evaluation_config(
        online_evaluation_config_id : String
      ) : Protocol::Request
        input = Types::DeleteOnlineEvaluationConfigRequest.new(online_evaluation_config_id: online_evaluation_config_id)
        delete_online_evaluation_config(input)
      end

      def delete_online_evaluation_config(input : Types::DeleteOnlineEvaluationConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ONLINE_EVALUATION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing policy from the AgentCore Policy system. Once deleted, the policy can no longer
      # be used for agent behavior control and all references to it become invalid. This is an asynchronous
      # operation. Use the GetPolicy operation to poll the status field to track completion.

      def delete_policy(
        policy_engine_id : String,
        policy_id : String
      ) : Protocol::Request
        input = Types::DeletePolicyRequest.new(policy_engine_id: policy_engine_id, policy_id: policy_id)
        delete_policy(input)
      end

      def delete_policy(input : Types::DeletePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing policy engine from the AgentCore Policy system. The policy engine must not have
      # any associated policies before deletion. Once deleted, the policy engine and all its configurations
      # become unavailable for policy management and evaluation. This is an asynchronous operation. Use the
      # GetPolicyEngine operation to poll the status field to track completion.

      def delete_policy_engine(
        policy_engine_id : String
      ) : Protocol::Request
        input = Types::DeletePolicyEngineRequest.new(policy_engine_id: policy_engine_id)
        delete_policy_engine(input)
      end

      def delete_policy_engine(input : Types::DeletePolicyEngineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_POLICY_ENGINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the resource-based policy for a specified resource. This feature is currently available only
      # for AgentCore Runtime and Gateway.

      def delete_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a workload identity.

      def delete_workload_identity(
        name : String
      ) : Protocol::Request
        input = Types::DeleteWorkloadIdentityRequest.new(name: name)
        delete_workload_identity(input)
      end

      def delete_workload_identity(input : Types::DeleteWorkloadIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKLOAD_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon Bedrock AgentCore Runtime.

      def get_agent_runtime(
        agent_runtime_id : String,
        agent_runtime_version : String? = nil
      ) : Protocol::Request
        input = Types::GetAgentRuntimeRequest.new(agent_runtime_id: agent_runtime_id, agent_runtime_version: agent_runtime_version)
        get_agent_runtime(input)
      end

      def get_agent_runtime(input : Types::GetAgentRuntimeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_RUNTIME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about an Amazon Secure AgentEndpoint.

      def get_agent_runtime_endpoint(
        agent_runtime_id : String,
        endpoint_name : String
      ) : Protocol::Request
        input = Types::GetAgentRuntimeEndpointRequest.new(agent_runtime_id: agent_runtime_id, endpoint_name: endpoint_name)
        get_agent_runtime_endpoint(input)
      end

      def get_agent_runtime_endpoint(input : Types::GetAgentRuntimeEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGENT_RUNTIME_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an API key credential provider.

      def get_api_key_credential_provider(
        name : String
      ) : Protocol::Request
        input = Types::GetApiKeyCredentialProviderRequest.new(name: name)
        get_api_key_credential_provider(input)
      end

      def get_api_key_credential_provider(input : Types::GetApiKeyCredentialProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_API_KEY_CREDENTIAL_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a custom browser.

      def get_browser(
        browser_id : String
      ) : Protocol::Request
        input = Types::GetBrowserRequest.new(browser_id: browser_id)
        get_browser(input)
      end

      def get_browser(input : Types::GetBrowserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BROWSER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a custom code interpreter.

      def get_code_interpreter(
        code_interpreter_id : String
      ) : Protocol::Request
        input = Types::GetCodeInterpreterRequest.new(code_interpreter_id: code_interpreter_id)
        get_code_interpreter(input)
      end

      def get_code_interpreter(input : Types::GetCodeInterpreterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CODE_INTERPRETER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about an evaluator, including its configuration, status, and
      # metadata. Works with both built-in and custom evaluators.

      def get_evaluator(
        evaluator_id : String
      ) : Protocol::Request
        input = Types::GetEvaluatorRequest.new(evaluator_id: evaluator_id)
        get_evaluator(input)
      end

      def get_evaluator(input : Types::GetEvaluatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVALUATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific Gateway.

      def get_gateway(
        gateway_identifier : String
      ) : Protocol::Request
        input = Types::GetGatewayRequest.new(gateway_identifier: gateway_identifier)
        get_gateway(input)
      end

      def get_gateway(input : Types::GetGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific gateway target.

      def get_gateway_target(
        gateway_identifier : String,
        target_id : String
      ) : Protocol::Request
        input = Types::GetGatewayTargetRequest.new(gateway_identifier: gateway_identifier, target_id: target_id)
        get_gateway_target(input)
      end

      def get_gateway_target(input : Types::GetGatewayTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GATEWAY_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve an existing Amazon Bedrock AgentCore Memory resource.

      def get_memory(
        memory_id : String,
        view : String? = nil
      ) : Protocol::Request
        input = Types::GetMemoryInput.new(memory_id: memory_id, view: view)
        get_memory(input)
      end

      def get_memory(input : Types::GetMemoryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an OAuth2 credential provider.

      def get_oauth2_credential_provider(
        name : String
      ) : Protocol::Request
        input = Types::GetOauth2CredentialProviderRequest.new(name: name)
        get_oauth2_credential_provider(input)
      end

      def get_oauth2_credential_provider(input : Types::GetOauth2CredentialProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OAUTH2_CREDENTIAL_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about an online evaluation configuration, including its rules, data
      # sources, evaluators, and execution status.

      def get_online_evaluation_config(
        online_evaluation_config_id : String
      ) : Protocol::Request
        input = Types::GetOnlineEvaluationConfigRequest.new(online_evaluation_config_id: online_evaluation_config_id)
        get_online_evaluation_config(input)
      end

      def get_online_evaluation_config(input : Types::GetOnlineEvaluationConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ONLINE_EVALUATION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific policy within the AgentCore Policy system. This
      # operation returns the complete policy definition, metadata, and current status, allowing
      # administrators to review and manage policy configurations.

      def get_policy(
        policy_engine_id : String,
        policy_id : String
      ) : Protocol::Request
        input = Types::GetPolicyRequest.new(policy_engine_id: policy_engine_id, policy_id: policy_id)
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific policy engine within the AgentCore Policy system.
      # This operation returns the complete policy engine configuration, metadata, and current status,
      # allowing administrators to review and manage policy engine settings.

      def get_policy_engine(
        policy_engine_id : String
      ) : Protocol::Request
        input = Types::GetPolicyEngineRequest.new(policy_engine_id: policy_engine_id)
        get_policy_engine(input)
      end

      def get_policy_engine(input : Types::GetPolicyEngineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY_ENGINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a policy generation request within the AgentCore Policy system. Policy
      # generation converts natural language descriptions into Cedar policy statements using AI-powered
      # translation, enabling non-technical users to create policies.

      def get_policy_generation(
        policy_engine_id : String,
        policy_generation_id : String
      ) : Protocol::Request
        input = Types::GetPolicyGenerationRequest.new(policy_engine_id: policy_engine_id, policy_generation_id: policy_generation_id)
        get_policy_generation(input)
      end

      def get_policy_generation(input : Types::GetPolicyGenerationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY_GENERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the resource-based policy for a specified resource. This feature is currently available
      # only for AgentCore Runtime and Gateway.

      def get_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a token vault.

      def get_token_vault(
        token_vault_id : String? = nil
      ) : Protocol::Request
        input = Types::GetTokenVaultRequest.new(token_vault_id: token_vault_id)
        get_token_vault(input)
      end

      def get_token_vault(input : Types::GetTokenVaultRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TOKEN_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a workload identity.

      def get_workload_identity(
        name : String
      ) : Protocol::Request
        input = Types::GetWorkloadIdentityRequest.new(name: name)
        get_workload_identity(input)
      end

      def get_workload_identity(input : Types::GetWorkloadIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKLOAD_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all endpoints for a specific Amazon Secure Agent.

      def list_agent_runtime_endpoints(
        agent_runtime_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentRuntimeEndpointsRequest.new(agent_runtime_id: agent_runtime_id, max_results: max_results, next_token: next_token)
        list_agent_runtime_endpoints(input)
      end

      def list_agent_runtime_endpoints(input : Types::ListAgentRuntimeEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENT_RUNTIME_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all versions of a specific Amazon Secure Agent.

      def list_agent_runtime_versions(
        agent_runtime_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentRuntimeVersionsRequest.new(agent_runtime_id: agent_runtime_id, max_results: max_results, next_token: next_token)
        list_agent_runtime_versions(input)
      end

      def list_agent_runtime_versions(input : Types::ListAgentRuntimeVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENT_RUNTIME_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Amazon Secure Agents in your account.

      def list_agent_runtimes(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentRuntimesRequest.new(max_results: max_results, next_token: next_token)
        list_agent_runtimes(input)
      end

      def list_agent_runtimes(input : Types::ListAgentRuntimesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENT_RUNTIMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all API key credential providers in your account.

      def list_api_key_credential_providers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApiKeyCredentialProvidersRequest.new(max_results: max_results, next_token: next_token)
        list_api_key_credential_providers(input)
      end

      def list_api_key_credential_providers(input : Types::ListApiKeyCredentialProvidersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_API_KEY_CREDENTIAL_PROVIDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all custom browsers in your account.

      def list_browsers(
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListBrowsersRequest.new(max_results: max_results, next_token: next_token, type: type)
        list_browsers(input)
      end

      def list_browsers(input : Types::ListBrowsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BROWSERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all custom code interpreters in your account.

      def list_code_interpreters(
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListCodeInterpretersRequest.new(max_results: max_results, next_token: next_token, type: type)
        list_code_interpreters(input)
      end

      def list_code_interpreters(input : Types::ListCodeInterpretersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CODE_INTERPRETERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all available evaluators, including both builtin evaluators provided by the service and custom
      # evaluators created by the user.

      def list_evaluators(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEvaluatorsRequest.new(max_results: max_results, next_token: next_token)
        list_evaluators(input)
      end

      def list_evaluators(input : Types::ListEvaluatorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVALUATORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all targets for a specific gateway.

      def list_gateway_targets(
        gateway_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGatewayTargetsRequest.new(gateway_identifier: gateway_identifier, max_results: max_results, next_token: next_token)
        list_gateway_targets(input)
      end

      def list_gateway_targets(input : Types::ListGatewayTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GATEWAY_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all gateways in the account.

      def list_gateways(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGatewaysRequest.new(max_results: max_results, next_token: next_token)
        list_gateways(input)
      end

      def list_gateways(input : Types::ListGatewaysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GATEWAYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the available Amazon Bedrock AgentCore Memory resources in the current Amazon Web Services
      # Region.

      def list_memories(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMemoriesInput.new(max_results: max_results, next_token: next_token)
        list_memories(input)
      end

      def list_memories(input : Types::ListMemoriesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMORIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all OAuth2 credential providers in your account.

      def list_oauth2_credential_providers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOauth2CredentialProvidersRequest.new(max_results: max_results, next_token: next_token)
        list_oauth2_credential_providers(input)
      end

      def list_oauth2_credential_providers(input : Types::ListOauth2CredentialProvidersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OAUTH2_CREDENTIAL_PROVIDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all online evaluation configurations in the account, providing summary information about each
      # configuration's status and settings.

      def list_online_evaluation_configs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOnlineEvaluationConfigsRequest.new(max_results: max_results, next_token: next_token)
        list_online_evaluation_configs(input)
      end

      def list_online_evaluation_configs(input : Types::ListOnlineEvaluationConfigsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ONLINE_EVALUATION_CONFIGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of policies within the AgentCore Policy engine. This operation supports pagination
      # and filtering to help administrators manage and discover policies across policy engines. Results can
      # be filtered by policy engine or resource associations.

      def list_policies(
        policy_engine_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        target_resource_scope : String? = nil
      ) : Protocol::Request
        input = Types::ListPoliciesRequest.new(policy_engine_id: policy_engine_id, max_results: max_results, next_token: next_token, target_resource_scope: target_resource_scope)
        list_policies(input)
      end

      def list_policies(input : Types::ListPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of policy engines within the AgentCore Policy system. This operation supports
      # pagination to help administrators discover and manage policy engines across their account. Each
      # policy engine serves as a container for related policies.

      def list_policy_engines(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPolicyEnginesRequest.new(max_results: max_results, next_token: next_token)
        list_policy_engines(input)
      end

      def list_policy_engines(input : Types::ListPolicyEnginesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICY_ENGINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of generated policy assets from a policy generation request within the AgentCore
      # Policy system. This operation returns the actual Cedar policies and related artifacts produced by
      # the AI-powered policy generation process, allowing users to review and select from multiple
      # generated policy options.

      def list_policy_generation_assets(
        policy_engine_id : String,
        policy_generation_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPolicyGenerationAssetsRequest.new(policy_engine_id: policy_engine_id, policy_generation_id: policy_generation_id, max_results: max_results, next_token: next_token)
        list_policy_generation_assets(input)
      end

      def list_policy_generation_assets(input : Types::ListPolicyGenerationAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICY_GENERATION_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of policy generation requests within the AgentCore Policy system. This operation
      # supports pagination and filtering to help track and manage AI-powered policy generation operations.

      def list_policy_generations(
        policy_engine_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPolicyGenerationsRequest.new(policy_engine_id: policy_engine_id, max_results: max_results, next_token: next_token)
        list_policy_generations(input)
      end

      def list_policy_generations(input : Types::ListPolicyGenerationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICY_GENERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags associated with the specified resource. This feature is currently available only for
      # AgentCore Runtime, Browser, Code Interpreter tool, and Gateway.

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

      # Lists all workload identities in your account.

      def list_workload_identities(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkloadIdentitiesRequest.new(max_results: max_results, next_token: next_token)
        list_workload_identities(input)
      end

      def list_workload_identities(input : Types::ListWorkloadIdentitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKLOAD_IDENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates a resource-based policy for a resource with the specified resourceArn. This
      # feature is currently available only for AgentCore Runtime and Gateway.

      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the customer master key (CMK) for a token vault.

      def set_token_vault_cmk(
        kms_configuration : Types::KmsConfiguration,
        token_vault_id : String? = nil
      ) : Protocol::Request
        input = Types::SetTokenVaultCMKRequest.new(kms_configuration: kms_configuration, token_vault_id: token_vault_id)
        set_token_vault_cmk(input)
      end

      def set_token_vault_cmk(input : Types::SetTokenVaultCMKRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_TOKEN_VAULT_CMK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates the AI-powered generation of Cedar policies from natural language descriptions within the
      # AgentCore Policy system. This feature enables both technical and non-technical users to create
      # policies by describing their authorization requirements in plain English, which is then
      # automatically translated into formal Cedar policy statements. The generation process analyzes the
      # natural language input along with the Gateway's tool context to produce validated policy options.
      # Generated policy assets are automatically deleted after 7 days, so you should review and create
      # policies from the generated assets within this timeframe. Once created, policies are permanent and
      # not subject to this expiration. Generated policies should be reviewed and tested in log-only mode
      # before deploying to production. Use this when you want to describe policy intent naturally rather
      # than learning Cedar syntax, though generated policies may require refinement for complex scenarios.

      def start_policy_generation(
        content : Types::Content,
        name : String,
        policy_engine_id : String,
        resource : Types::Resource,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartPolicyGenerationRequest.new(content: content, name: name, policy_engine_id: policy_engine_id, resource: resource, client_token: client_token)
        start_policy_generation(input)
      end

      def start_policy_generation(input : Types::StartPolicyGenerationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_POLICY_GENERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The gateway targets.

      def synchronize_gateway_targets(
        gateway_identifier : String,
        target_id_list : Array(String)
      ) : Protocol::Request
        input = Types::SynchronizeGatewayTargetsRequest.new(gateway_identifier: gateway_identifier, target_id_list: target_id_list)
        synchronize_gateway_targets(input)
      end

      def synchronize_gateway_targets(input : Types::SynchronizeGatewayTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SYNCHRONIZE_GATEWAY_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified tags to a resource with the specified resourceArn. If existing tags on a
      # resource are not specified in the request parameters, they are not changed. When a resource is
      # deleted, the tags associated with that resource are also deleted. This feature is currently
      # available only for AgentCore Runtime, Browser, Code Interpreter tool, and Gateway.

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

      # Removes the specified tags from the specified resource. This feature is currently available only for
      # AgentCore Runtime, Browser, Code Interpreter tool, and Gateway.

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

      # Updates an existing Amazon Secure Agent.

      def update_agent_runtime(
        agent_runtime_artifact : Types::AgentRuntimeArtifact,
        agent_runtime_id : String,
        network_configuration : Types::NetworkConfiguration,
        role_arn : String,
        authorizer_configuration : Types::AuthorizerConfiguration? = nil,
        client_token : String? = nil,
        description : String? = nil,
        environment_variables : Hash(String, String)? = nil,
        lifecycle_configuration : Types::LifecycleConfiguration? = nil,
        protocol_configuration : Types::ProtocolConfiguration? = nil,
        request_header_configuration : Types::RequestHeaderConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateAgentRuntimeRequest.new(agent_runtime_artifact: agent_runtime_artifact, agent_runtime_id: agent_runtime_id, network_configuration: network_configuration, role_arn: role_arn, authorizer_configuration: authorizer_configuration, client_token: client_token, description: description, environment_variables: environment_variables, lifecycle_configuration: lifecycle_configuration, protocol_configuration: protocol_configuration, request_header_configuration: request_header_configuration)
        update_agent_runtime(input)
      end

      def update_agent_runtime(input : Types::UpdateAgentRuntimeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGENT_RUNTIME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Amazon Bedrock AgentCore Runtime endpoint.

      def update_agent_runtime_endpoint(
        agent_runtime_id : String,
        endpoint_name : String,
        agent_runtime_version : String? = nil,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAgentRuntimeEndpointRequest.new(agent_runtime_id: agent_runtime_id, endpoint_name: endpoint_name, agent_runtime_version: agent_runtime_version, client_token: client_token, description: description)
        update_agent_runtime_endpoint(input)
      end

      def update_agent_runtime_endpoint(input : Types::UpdateAgentRuntimeEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGENT_RUNTIME_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing API key credential provider.

      def update_api_key_credential_provider(
        api_key : String,
        name : String
      ) : Protocol::Request
        input = Types::UpdateApiKeyCredentialProviderRequest.new(api_key: api_key, name: name)
        update_api_key_credential_provider(input)
      end

      def update_api_key_credential_provider(input : Types::UpdateApiKeyCredentialProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_API_KEY_CREDENTIAL_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a custom evaluator's configuration, description, or evaluation level. Built-in evaluators
      # cannot be updated. The evaluator must not be locked for modification.

      def update_evaluator(
        evaluator_id : String,
        client_token : String? = nil,
        description : String? = nil,
        evaluator_config : Types::EvaluatorConfig? = nil,
        level : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEvaluatorRequest.new(evaluator_id: evaluator_id, client_token: client_token, description: description, evaluator_config: evaluator_config, level: level)
        update_evaluator(input)
      end

      def update_evaluator(input : Types::UpdateEvaluatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVALUATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing gateway.

      def update_gateway(
        authorizer_type : String,
        gateway_identifier : String,
        name : String,
        protocol_type : String,
        role_arn : String,
        authorizer_configuration : Types::AuthorizerConfiguration? = nil,
        description : String? = nil,
        exception_level : String? = nil,
        interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)? = nil,
        kms_key_arn : String? = nil,
        policy_engine_configuration : Types::GatewayPolicyEngineConfiguration? = nil,
        protocol_configuration : Types::GatewayProtocolConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateGatewayRequest.new(authorizer_type: authorizer_type, gateway_identifier: gateway_identifier, name: name, protocol_type: protocol_type, role_arn: role_arn, authorizer_configuration: authorizer_configuration, description: description, exception_level: exception_level, interceptor_configurations: interceptor_configurations, kms_key_arn: kms_key_arn, policy_engine_configuration: policy_engine_configuration, protocol_configuration: protocol_configuration)
        update_gateway(input)
      end

      def update_gateway(input : Types::UpdateGatewayRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing gateway target.

      def update_gateway_target(
        gateway_identifier : String,
        name : String,
        target_configuration : Types::TargetConfiguration,
        target_id : String,
        credential_provider_configurations : Array(Types::CredentialProviderConfiguration)? = nil,
        description : String? = nil,
        metadata_configuration : Types::MetadataConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateGatewayTargetRequest.new(gateway_identifier: gateway_identifier, name: name, target_configuration: target_configuration, target_id: target_id, credential_provider_configurations: credential_provider_configurations, description: description, metadata_configuration: metadata_configuration)
        update_gateway_target(input)
      end

      def update_gateway_target(input : Types::UpdateGatewayTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GATEWAY_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an Amazon Bedrock AgentCore Memory resource memory.

      def update_memory(
        memory_id : String,
        client_token : String? = nil,
        description : String? = nil,
        event_expiry_duration : Int32? = nil,
        memory_execution_role_arn : String? = nil,
        memory_strategies : Types::ModifyMemoryStrategies? = nil
      ) : Protocol::Request
        input = Types::UpdateMemoryInput.new(memory_id: memory_id, client_token: client_token, description: description, event_expiry_duration: event_expiry_duration, memory_execution_role_arn: memory_execution_role_arn, memory_strategies: memory_strategies)
        update_memory(input)
      end

      def update_memory(input : Types::UpdateMemoryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEMORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing OAuth2 credential provider.

      def update_oauth2_credential_provider(
        credential_provider_vendor : String,
        name : String,
        oauth2_provider_config_input : Types::Oauth2ProviderConfigInput
      ) : Protocol::Request
        input = Types::UpdateOauth2CredentialProviderRequest.new(credential_provider_vendor: credential_provider_vendor, name: name, oauth2_provider_config_input: oauth2_provider_config_input)
        update_oauth2_credential_provider(input)
      end

      def update_oauth2_credential_provider(input : Types::UpdateOauth2CredentialProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_OAUTH2_CREDENTIAL_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an online evaluation configuration's settings, including rules, data sources, evaluators,
      # and execution status. Changes take effect immediately for ongoing evaluations.

      def update_online_evaluation_config(
        online_evaluation_config_id : String,
        client_token : String? = nil,
        data_source_config : Types::DataSourceConfig? = nil,
        description : String? = nil,
        evaluation_execution_role_arn : String? = nil,
        evaluators : Array(Types::EvaluatorReference)? = nil,
        execution_status : String? = nil,
        rule : Types::Rule? = nil
      ) : Protocol::Request
        input = Types::UpdateOnlineEvaluationConfigRequest.new(online_evaluation_config_id: online_evaluation_config_id, client_token: client_token, data_source_config: data_source_config, description: description, evaluation_execution_role_arn: evaluation_execution_role_arn, evaluators: evaluators, execution_status: execution_status, rule: rule)
        update_online_evaluation_config(input)
      end

      def update_online_evaluation_config(input : Types::UpdateOnlineEvaluationConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ONLINE_EVALUATION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing policy within the AgentCore Policy system. This operation allows modification of
      # the policy description and definition while maintaining the policy's identity. The updated policy is
      # validated against the Cedar schema before being applied. This is an asynchronous operation. Use the
      # GetPolicy operation to poll the status field to track completion.

      def update_policy(
        definition : Types::PolicyDefinition,
        policy_engine_id : String,
        policy_id : String,
        description : String? = nil,
        validation_mode : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePolicyRequest.new(definition: definition, policy_engine_id: policy_engine_id, policy_id: policy_id, description: description, validation_mode: validation_mode)
        update_policy(input)
      end

      def update_policy(input : Types::UpdatePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing policy engine within the AgentCore Policy system. This operation allows
      # modification of the policy engine description while maintaining its identity. This is an
      # asynchronous operation. Use the GetPolicyEngine operation to poll the status field to track
      # completion.

      def update_policy_engine(
        policy_engine_id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePolicyEngineRequest.new(policy_engine_id: policy_engine_id, description: description)
        update_policy_engine(input)
      end

      def update_policy_engine(input : Types::UpdatePolicyEngineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_POLICY_ENGINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing workload identity.

      def update_workload_identity(
        name : String,
        allowed_resource_oauth2_return_urls : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkloadIdentityRequest.new(name: name, allowed_resource_oauth2_return_urls: allowed_resource_oauth2_return_urls)
        update_workload_identity(input)
      end

      def update_workload_identity(input : Types::UpdateWorkloadIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKLOAD_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
