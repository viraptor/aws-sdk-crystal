require "json"
require "time"

module AwsSdk
  module BedrockAgentCoreControl
    module Types

      # This exception is thrown when a request is denied per access permissions
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct AdditionalModelRequestFields
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about an agent runtime. An agent runtime is the execution environment for a
      # Amazon Bedrock Agent.
      struct AgentRuntime
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the agent runtime.
        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The unique identifier of the agent runtime.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The name of the agent runtime.
        @[JSON::Field(key: "agentRuntimeName")]
        getter agent_runtime_name : String

        # The version of the agent runtime.
        @[JSON::Field(key: "agentRuntimeVersion")]
        getter agent_runtime_version : String

        # The description of the agent runtime.
        @[JSON::Field(key: "description")]
        getter description : String

        # The timestamp when the agent runtime was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The current status of the agent runtime.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @agent_runtime_arn : String,
          @agent_runtime_id : String,
          @agent_runtime_name : String,
          @agent_runtime_version : String,
          @description : String,
          @last_updated_at : Time,
          @status : String
        )
        end
      end

      # The artifact of the agent.
      struct AgentRuntimeArtifact
        include JSON::Serializable

        # The code configuration for the agent runtime artifact, including the source code location and
        # execution settings.
        @[JSON::Field(key: "codeConfiguration")]
        getter code_configuration : Types::CodeConfiguration?

        # The container configuration for the agent artifact.
        @[JSON::Field(key: "containerConfiguration")]
        getter container_configuration : Types::ContainerConfiguration?

        def initialize(
          @code_configuration : Types::CodeConfiguration? = nil,
          @container_configuration : Types::ContainerConfiguration? = nil
        )
        end
      end

      # Contains information about an agent runtime endpoint. An endpoint provides a way to connect to and
      # interact with an agent runtime.
      struct AgentRuntimeEndpoint
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the agent runtime associated with the endpoint.
        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The Amazon Resource Name (ARN) of the agent runtime endpoint.
        @[JSON::Field(key: "agentRuntimeEndpointArn")]
        getter agent_runtime_endpoint_arn : String

        # The timestamp when the agent runtime endpoint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the agent runtime endpoint.
        @[JSON::Field(key: "id")]
        getter id : String

        # The timestamp when the agent runtime endpoint was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the agent runtime endpoint.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the agent runtime endpoint.
        @[JSON::Field(key: "status")]
        getter status : String

        # The description of the agent runtime endpoint.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The live version of the agent runtime endpoint. This is the version that is currently serving
        # requests.
        @[JSON::Field(key: "liveVersion")]
        getter live_version : String?

        # The target version of the agent runtime endpoint. This is the version that the endpoint is being
        # updated to.
        @[JSON::Field(key: "targetVersion")]
        getter target_version : String?

        def initialize(
          @agent_runtime_arn : String,
          @agent_runtime_endpoint_arn : String,
          @created_at : Time,
          @id : String,
          @last_updated_at : Time,
          @name : String,
          @status : String,
          @description : String? = nil,
          @live_version : String? = nil,
          @target_version : String? = nil
        )
        end
      end

      # The configuration for an Amazon API Gateway target.
      struct ApiGatewayTargetConfiguration
        include JSON::Serializable

        # The configuration for defining REST API tool filters and overrides for the gateway target.
        @[JSON::Field(key: "apiGatewayToolConfiguration")]
        getter api_gateway_tool_configuration : Types::ApiGatewayToolConfiguration

        # The ID of the API Gateway REST API.
        @[JSON::Field(key: "restApiId")]
        getter rest_api_id : String

        # The ID of the stage of the REST API to add as a target.
        @[JSON::Field(key: "stage")]
        getter stage : String

        def initialize(
          @api_gateway_tool_configuration : Types::ApiGatewayToolConfiguration,
          @rest_api_id : String,
          @stage : String
        )
        end
      end

      # The configuration for defining REST API tool filters and overrides for the gateway target.
      struct ApiGatewayToolConfiguration
        include JSON::Serializable

        # A list of path and method patterns to expose as tools using metadata from the REST API's OpenAPI
        # specification.
        @[JSON::Field(key: "toolFilters")]
        getter tool_filters : Array(Types::ApiGatewayToolFilter)

        # A list of explicit tool definitions with optional custom names and descriptions.
        @[JSON::Field(key: "toolOverrides")]
        getter tool_overrides : Array(Types::ApiGatewayToolOverride)?

        def initialize(
          @tool_filters : Array(Types::ApiGatewayToolFilter),
          @tool_overrides : Array(Types::ApiGatewayToolOverride)? = nil
        )
        end
      end

      # Specifies which operations from an API Gateway REST API are exposed as tools. Tool names and
      # descriptions are derived from the operationId and description fields in the API's exported OpenAPI
      # specification.
      struct ApiGatewayToolFilter
        include JSON::Serializable

        # Resource path to match in the REST API. Supports exact paths (for example, /pets ) or wildcard paths
        # (for example, /pets/* to match all paths under /pets ). Must match existing paths in the REST API.
        @[JSON::Field(key: "filterPath")]
        getter filter_path : String

        # The methods to filter for.
        @[JSON::Field(key: "methods")]
        getter methods : Array(String)

        def initialize(
          @filter_path : String,
          @methods : Array(String)
        )
        end
      end

      # Settings to override configurations for a tool.
      struct ApiGatewayToolOverride
        include JSON::Serializable

        # The HTTP method to expose for the specified path.
        @[JSON::Field(key: "method")]
        getter method : String

        # The name of tool. Identifies the tool in the Model Context Protocol.
        @[JSON::Field(key: "name")]
        getter name : String

        # Resource path in the REST API (e.g., /pets ). Must explicitly match an existing path in the REST
        # API.
        @[JSON::Field(key: "path")]
        getter path : String

        # The description of the tool. Provides information about the purpose and usage of the tool. If not
        # provided, uses the description from the API's OpenAPI specification.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @method : String,
          @name : String,
          @path : String,
          @description : String? = nil
        )
        end
      end

      # An API key credential provider for gateway authentication. This structure contains the configuration
      # for authenticating with the target endpoint using an API key.
      struct ApiKeyCredentialProvider
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the API key credential provider. This ARN identifies the provider
        # in Amazon Web Services.
        @[JSON::Field(key: "providerArn")]
        getter provider_arn : String

        # The location of the API key credential. This field specifies where in the request the API key should
        # be placed.
        @[JSON::Field(key: "credentialLocation")]
        getter credential_location : String?

        # The name of the credential parameter for the API key. This parameter name is used when sending the
        # API key to the target endpoint.
        @[JSON::Field(key: "credentialParameterName")]
        getter credential_parameter_name : String?

        # The prefix for the API key credential. This prefix is added to the API key when sending it to the
        # target endpoint.
        @[JSON::Field(key: "credentialPrefix")]
        getter credential_prefix : String?

        def initialize(
          @provider_arn : String,
          @credential_location : String? = nil,
          @credential_parameter_name : String? = nil,
          @credential_prefix : String? = nil
        )
        end
      end

      # Contains information about an API key credential provider.
      struct ApiKeyCredentialProviderItem
        include JSON::Serializable

        # The timestamp when the API key credential provider was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the API key credential provider.
        @[JSON::Field(key: "credentialProviderArn")]
        getter credential_provider_arn : String

        # The timestamp when the API key credential provider was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the API key credential provider.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @created_time : Time,
          @credential_provider_arn : String,
          @last_updated_time : Time,
          @name : String
        )
        end
      end

      # Configuration for API schema.
      struct ApiSchemaConfiguration
        include JSON::Serializable

        # The inline payload containing the API schema definition.
        @[JSON::Field(key: "inlinePayload")]
        getter inline_payload : String?

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Configuration?

        def initialize(
          @inline_payload : String? = nil,
          @s3 : Types::S3Configuration? = nil
        )
        end
      end

      # Configuration settings for connecting to Atlassian services using OAuth2 authentication. This
      # includes the client credentials required to authenticate with Atlassian's OAuth2 authorization
      # server.
      struct AtlassianOauth2ProviderConfigInput
        include JSON::Serializable

        # The client ID for the Atlassian OAuth2 provider. This identifier is assigned by Atlassian when you
        # register your application.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret for the Atlassian OAuth2 provider. This secret is assigned by Atlassian and used
        # along with the client ID to authenticate your application.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        def initialize(
          @client_id : String,
          @client_secret : String
        )
        end
      end

      # The configuration details returned for an Atlassian OAuth2 provider, including the client ID and
      # OAuth2 discovery information.
      struct AtlassianOauth2ProviderConfigOutput
        include JSON::Serializable

        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        # The client ID for the Atlassian OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @oauth_discovery : Types::Oauth2Discovery,
          @client_id : String? = nil
        )
        end
      end

      # Represents inbound authorization configuration options used to authenticate incoming requests.
      struct AuthorizerConfiguration
        include JSON::Serializable

        # The inbound JWT-based authorization, specifying how incoming requests should be authenticated.
        @[JSON::Field(key: "customJWTAuthorizer")]
        getter custom_jwt_authorizer : Types::CustomJWTAuthorizerConfiguration?

        def initialize(
          @custom_jwt_authorizer : Types::CustomJWTAuthorizerConfiguration? = nil
        )
        end
      end

      # Defines the value or values to match for and the relationship of the match.
      struct AuthorizingClaimMatchValueType
        include JSON::Serializable

        # Defines the relationship between the claim field value and the value or values you're matching for.
        @[JSON::Field(key: "claimMatchOperator")]
        getter claim_match_operator : String

        # The value or values to match for.
        @[JSON::Field(key: "claimMatchValue")]
        getter claim_match_value : Types::ClaimMatchValueType

        def initialize(
          @claim_match_operator : String,
          @claim_match_value : Types::ClaimMatchValueType
        )
        end
      end

      # The configuration for using Amazon Bedrock models in evaluator assessments, including model
      # selection and inference parameters.
      struct BedrockEvaluatorModelConfig
        include JSON::Serializable

        # The identifier of the Amazon Bedrock model to use for evaluation. Must be a supported foundation
        # model available in your region.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Additional model-specific request fields to customize model behavior beyond the standard inference
        # configuration.
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Types::AdditionalModelRequestFields?

        # The inference configuration parameters that control model behavior during evaluation, including
        # temperature, token limits, and sampling settings.
        @[JSON::Field(key: "inferenceConfig")]
        getter inference_config : Types::InferenceConfiguration?

        def initialize(
          @model_id : String,
          @additional_model_request_fields : Types::AdditionalModelRequestFields? = nil,
          @inference_config : Types::InferenceConfiguration? = nil
        )
        end
      end

      # The network configuration for a browser. This structure defines how the browser connects to the
      # network.
      struct BrowserNetworkConfiguration
        include JSON::Serializable

        # The network mode for the browser. This field specifies how the browser connects to the network.
        @[JSON::Field(key: "networkMode")]
        getter network_mode : String

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @network_mode : String,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Configuration for enabling browser signing capabilities that allow agents to cryptographically
      # identify themselves to websites using HTTP message signatures.
      struct BrowserSigningConfigInput
        include JSON::Serializable

        # Specifies whether browser signing is enabled. When enabled, the browser will cryptographically sign
        # HTTP requests to identify itself as an AI agent to bot control vendors.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # The current browser signing configuration that shows whether cryptographic agent identification is
      # enabled for web bot authentication.
      struct BrowserSigningConfigOutput
        include JSON::Serializable

        # Indicates whether browser signing is currently enabled for cryptographic agent identification using
        # HTTP message signatures.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        def initialize(
          @enabled : Bool
        )
        end
      end

      # Contains summary information about a browser. A browser enables Amazon Bedrock Agent to interact
      # with web content.
      struct BrowserSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the browser.
        @[JSON::Field(key: "browserArn")]
        getter browser_arn : String

        # The unique identifier of the browser.
        @[JSON::Field(key: "browserId")]
        getter browser_id : String

        # The timestamp when the browser was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The current status of the browser.
        @[JSON::Field(key: "status")]
        getter status : String

        # The description of the browser.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp when the browser was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the browser.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @browser_arn : String,
          @browser_id : String,
          @created_at : Time,
          @status : String,
          @description : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # The definition of a categorical rating scale option that provides a named category with its
      # description for evaluation scoring.
      struct CategoricalScaleDefinition
        include JSON::Serializable

        # The description that explains what this categorical rating represents and when it should be used.
        @[JSON::Field(key: "definition")]
        getter definition : String

        # The label or name of this categorical rating option.
        @[JSON::Field(key: "label")]
        getter label : String

        def initialize(
          @definition : String,
          @label : String
        )
        end
      end

      # Represents a Cedar policy statement within the AgentCore Policy system. Cedar is a policy language
      # designed for authorization that provides human-readable, analyzable, and high-performance policy
      # evaluation for controlling agent behavior and access decisions.
      struct CedarPolicy
        include JSON::Serializable

        # The Cedar policy statement that defines the authorization logic. This statement follows Cedar syntax
        # and specifies principals, actions, resources, and conditions that determine when access should be
        # allowed or denied.
        @[JSON::Field(key: "statement")]
        getter statement : String

        def initialize(
          @statement : String
        )
        end
      end

      # The value or values to match for. Include a matchValueString with the EQUALS operator to specify a
      # string that matches the claim field value. Include a matchValueArray to specify an array of string
      # values. You can use the following operators: Use CONTAINS to yield a match if the claim field value
      # is in the array. Use CONTAINS_ANY to yield a match if the claim field value contains any of the
      # strings in the array.
      struct ClaimMatchValueType
        include JSON::Serializable

        # The string value to match for.
        @[JSON::Field(key: "matchValueString")]
        getter match_value_string : String?

        # An array of strings to check for a match.
        @[JSON::Field(key: "matchValueStringList")]
        getter match_value_string_list : Array(String)?

        def initialize(
          @match_value_string : String? = nil,
          @match_value_string_list : Array(String)? = nil
        )
        end
      end

      # The configuration for reading agent traces from CloudWatch logs as input for online evaluation.
      struct CloudWatchLogsInputConfig
        include JSON::Serializable

        # The list of CloudWatch log group names to monitor for agent traces.
        @[JSON::Field(key: "logGroupNames")]
        getter log_group_names : Array(String)

        # The list of service names to filter traces within the specified log groups. Used to identify
        # relevant agent sessions.
        @[JSON::Field(key: "serviceNames")]
        getter service_names : Array(String)

        def initialize(
          @log_group_names : Array(String),
          @service_names : Array(String)
        )
        end
      end

      # The configuration for writing evaluation results to CloudWatch logs with embedded metric format
      # (EMF) for monitoring.
      struct CloudWatchOutputConfig
        include JSON::Serializable

        # The name of the CloudWatch log group where evaluation results will be written. The log group will be
        # created if it doesn't exist.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String

        def initialize(
          @log_group_name : String
        )
        end
      end

      # The source code configuration that specifies the location and details of the code to be executed.
      struct Code
        include JSON::Serializable

        # The Amazon Amazon S3 object that contains the source code for the agent runtime.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Location?

        def initialize(
          @s3 : Types::S3Location? = nil
        )
        end
      end

      # The configuration for the source code that defines how the agent runtime code should be executed,
      # including the code location, runtime environment, and entry point.
      struct CodeConfiguration
        include JSON::Serializable

        # The source code location and configuration details.
        @[JSON::Field(key: "code")]
        getter code : Types::Code

        # The entry point for the code execution, specifying the function or method that should be invoked
        # when the code runs.
        @[JSON::Field(key: "entryPoint")]
        getter entry_point : Array(String)

        # The runtime environment for executing the code (for example, Python 3.9 or Node.js 18).
        @[JSON::Field(key: "runtime")]
        getter runtime : String

        def initialize(
          @code : Types::Code,
          @entry_point : Array(String),
          @runtime : String
        )
        end
      end

      # The network configuration for a code interpreter. This structure defines how the code interpreter
      # connects to the network.
      struct CodeInterpreterNetworkConfiguration
        include JSON::Serializable

        # The network mode for the code interpreter. This field specifies how the code interpreter connects to
        # the network.
        @[JSON::Field(key: "networkMode")]
        getter network_mode : String

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @network_mode : String,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Contains summary information about a code interpreter. A code interpreter enables Amazon Bedrock
      # Agent to execute code.
      struct CodeInterpreterSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the code interpreter.
        @[JSON::Field(key: "codeInterpreterArn")]
        getter code_interpreter_arn : String

        # The unique identifier of the code interpreter.
        @[JSON::Field(key: "codeInterpreterId")]
        getter code_interpreter_id : String

        # The timestamp when the code interpreter was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The current status of the code interpreter.
        @[JSON::Field(key: "status")]
        getter status : String

        # The description of the code interpreter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp when the code interpreter was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the code interpreter.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @code_interpreter_arn : String,
          @code_interpreter_id : String,
          @created_at : Time,
          @status : String,
          @description : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Exception thrown when a resource is modified concurrently by multiple requests.
      struct ConcurrentModificationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # This exception is thrown when there is a conflict performing an operation
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains consolidation configuration information for a memory strategy.
      struct ConsolidationConfiguration
        include JSON::Serializable

        # The custom consolidation configuration.
        @[JSON::Field(key: "customConsolidationConfiguration")]
        getter custom_consolidation_configuration : Types::CustomConsolidationConfiguration?

        def initialize(
          @custom_consolidation_configuration : Types::CustomConsolidationConfiguration? = nil
        )
        end
      end

      # Representation of a container configuration.
      struct ContainerConfiguration
        include JSON::Serializable

        # The ECR URI of the container.
        @[JSON::Field(key: "containerUri")]
        getter container_uri : String

        def initialize(
          @container_uri : String
        )
        end
      end

      # Represents content input for policy generation operations. This structure encapsulates the natural
      # language descriptions or other content formats that are used as input for AI-powered policy
      # generation.
      struct Content
        include JSON::Serializable

        # The raw text content containing natural language descriptions of desired policy behavior. This text
        # is processed by AI to generate corresponding Cedar policy statements that match the described
        # intent.
        @[JSON::Field(key: "rawText")]
        getter raw_text : String?

        def initialize(
          @raw_text : String? = nil
        )
        end
      end

      struct CreateAgentRuntimeEndpointRequest
        include JSON::Serializable

        # The unique identifier of the AgentCore Runtime to create an endpoint for.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The name of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the AgentCore Runtime to use for the endpoint.
        @[JSON::Field(key: "agentRuntimeVersion")]
        getter agent_runtime_version : String?

        # A unique, case-sensitive identifier to ensure idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A map of tag keys and values to assign to the agent runtime endpoint. Tags enable you to categorize
        # your resources in different ways, for example, by purpose, owner, or environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @agent_runtime_id : String,
          @name : String,
          @agent_runtime_version : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAgentRuntimeEndpointResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The Amazon Resource Name (ARN) of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "agentRuntimeEndpointArn")]
        getter agent_runtime_endpoint_arn : String

        # The timestamp when the AgentCore Runtime endpoint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The current status of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "status")]
        getter status : String

        # The target version of the AgentCore Runtime for the endpoint.
        @[JSON::Field(key: "targetVersion")]
        getter target_version : String

        # The unique identifier of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String?

        # The name of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String?

        def initialize(
          @agent_runtime_arn : String,
          @agent_runtime_endpoint_arn : String,
          @created_at : Time,
          @status : String,
          @target_version : String,
          @agent_runtime_id : String? = nil,
          @endpoint_name : String? = nil
        )
        end
      end

      struct CreateAgentRuntimeRequest
        include JSON::Serializable

        # The artifact of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeArtifact")]
        getter agent_runtime_artifact : Types::AgentRuntimeArtifact

        # The name of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeName")]
        getter agent_runtime_name : String

        # The network configuration for the AgentCore Runtime.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration

        # The IAM role ARN that provides permissions for the AgentCore Runtime.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The authorizer configuration for the AgentCore Runtime.
        @[JSON::Field(key: "authorizerConfiguration")]
        getter authorizer_configuration : Types::AuthorizerConfiguration?

        # A unique, case-sensitive identifier to ensure idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the AgentCore Runtime.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Environment variables to set in the AgentCore Runtime environment.
        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The life cycle configuration for the AgentCore Runtime.
        @[JSON::Field(key: "lifecycleConfiguration")]
        getter lifecycle_configuration : Types::LifecycleConfiguration?

        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::ProtocolConfiguration?

        # Configuration for HTTP request headers that will be passed through to the runtime.
        @[JSON::Field(key: "requestHeaderConfiguration")]
        getter request_header_configuration : Types::RequestHeaderConfiguration?

        # A map of tag keys and values to assign to the agent runtime. Tags enable you to categorize your
        # resources in different ways, for example, by purpose, owner, or environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @agent_runtime_artifact : Types::AgentRuntimeArtifact,
          @agent_runtime_name : String,
          @network_configuration : Types::NetworkConfiguration,
          @role_arn : String,
          @authorizer_configuration : Types::AuthorizerConfiguration? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @lifecycle_configuration : Types::LifecycleConfiguration? = nil,
          @protocol_configuration : Types::ProtocolConfiguration? = nil,
          @request_header_configuration : Types::RequestHeaderConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAgentRuntimeResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The unique identifier of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The version of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeVersion")]
        getter agent_runtime_version : String

        # The timestamp when the AgentCore Runtime was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The current status of the AgentCore Runtime.
        @[JSON::Field(key: "status")]
        getter status : String

        # The workload identity details for the AgentCore Runtime.
        @[JSON::Field(key: "workloadIdentityDetails")]
        getter workload_identity_details : Types::WorkloadIdentityDetails?

        def initialize(
          @agent_runtime_arn : String,
          @agent_runtime_id : String,
          @agent_runtime_version : String,
          @created_at : Time,
          @status : String,
          @workload_identity_details : Types::WorkloadIdentityDetails? = nil
        )
        end
      end

      struct CreateApiKeyCredentialProviderRequest
        include JSON::Serializable

        # The API key to use for authentication. This value is encrypted and stored securely.
        @[JSON::Field(key: "apiKey")]
        getter api_key : String

        # The name of the API key credential provider. The name must be unique within your account.
        @[JSON::Field(key: "name")]
        getter name : String

        # A map of tag keys and values to assign to the API key credential provider. Tags enable you to
        # categorize your resources in different ways, for example, by purpose, owner, or environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @api_key : String,
          @name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateApiKeyCredentialProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret containing the API key.
        @[JSON::Field(key: "apiKeySecretArn")]
        getter api_key_secret_arn : Types::Secret

        # The Amazon Resource Name (ARN) of the created API key credential provider.
        @[JSON::Field(key: "credentialProviderArn")]
        getter credential_provider_arn : String

        # The name of the created API key credential provider.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @api_key_secret_arn : Types::Secret,
          @credential_provider_arn : String,
          @name : String
        )
        end
      end

      struct CreateBrowserRequest
        include JSON::Serializable

        # The name of the browser. The name must be unique within your account.
        @[JSON::Field(key: "name")]
        getter name : String

        # The network configuration for the browser. This configuration specifies the network mode for the
        # browser.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::BrowserNetworkConfiguration

        # The browser signing configuration that enables cryptographic agent identification using HTTP message
        # signatures for web bot authentication.
        @[JSON::Field(key: "browserSigning")]
        getter browser_signing : Types::BrowserSigningConfigInput?

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Bedrock ignores the request but does not return an
        # error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the browser.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the IAM role that provides permissions for the browser to access
        # Amazon Web Services services.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The recording configuration for the browser. When enabled, browser sessions are recorded and stored
        # in the specified Amazon S3 location.
        @[JSON::Field(key: "recording")]
        getter recording : Types::RecordingConfig?

        # A map of tag keys and values to assign to the browser. Tags enable you to categorize your resources
        # in different ways, for example, by purpose, owner, or environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @network_configuration : Types::BrowserNetworkConfiguration,
          @browser_signing : Types::BrowserSigningConfigInput? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @execution_role_arn : String? = nil,
          @recording : Types::RecordingConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateBrowserResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created browser.
        @[JSON::Field(key: "browserArn")]
        getter browser_arn : String

        # The unique identifier of the created browser.
        @[JSON::Field(key: "browserId")]
        getter browser_id : String

        # The timestamp when the browser was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The current status of the browser.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @browser_arn : String,
          @browser_id : String,
          @created_at : Time,
          @status : String
        )
        end
      end

      struct CreateCodeInterpreterRequest
        include JSON::Serializable

        # The name of the code interpreter. The name must be unique within your account.
        @[JSON::Field(key: "name")]
        getter name : String

        # The network configuration for the code interpreter. This configuration specifies the network mode
        # for the code interpreter.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::CodeInterpreterNetworkConfiguration

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Bedrock ignores the request but does not return an
        # error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the code interpreter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the IAM role that provides permissions for the code interpreter to
        # access Amazon Web Services services.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # A map of tag keys and values to assign to the code interpreter. Tags enable you to categorize your
        # resources in different ways, for example, by purpose, owner, or environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @network_configuration : Types::CodeInterpreterNetworkConfiguration,
          @client_token : String? = nil,
          @description : String? = nil,
          @execution_role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateCodeInterpreterResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created code interpreter.
        @[JSON::Field(key: "codeInterpreterArn")]
        getter code_interpreter_arn : String

        # The unique identifier of the created code interpreter.
        @[JSON::Field(key: "codeInterpreterId")]
        getter code_interpreter_id : String

        # The timestamp when the code interpreter was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The current status of the code interpreter.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @code_interpreter_arn : String,
          @code_interpreter_id : String,
          @created_at : Time,
          @status : String
        )
        end
      end

      struct CreateEvaluatorRequest
        include JSON::Serializable

        # The configuration for the evaluator, including LLM-as-a-Judge settings with instructions, rating
        # scale, and model configuration.
        @[JSON::Field(key: "evaluatorConfig")]
        getter evaluator_config : Types::EvaluatorConfig

        # The name of the evaluator. Must be unique within your account.
        @[JSON::Field(key: "evaluatorName")]
        getter evaluator_name : String

        # The evaluation level that determines the scope of evaluation. Valid values are TOOL_CALL for
        # individual tool invocations, TRACE for single request-response interactions, or SESSION for entire
        # conversation sessions.
        @[JSON::Field(key: "level")]
        getter level : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If you don't specify this field, a value is randomly generated for you. If this token matches a
        # previous request, the service ignores the request, but doesn't return an error. For more
        # information, see Ensuring idempotency .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the evaluator that explains its purpose and evaluation criteria.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @evaluator_config : Types::EvaluatorConfig,
          @evaluator_name : String,
          @level : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateEvaluatorResponse
        include JSON::Serializable

        # The timestamp when the evaluator was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the created evaluator.
        @[JSON::Field(key: "evaluatorArn")]
        getter evaluator_arn : String

        # The unique identifier of the created evaluator.
        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        # The status of the evaluator creation operation.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @created_at : Time,
          @evaluator_arn : String,
          @evaluator_id : String,
          @status : String
        )
        end
      end

      struct CreateGatewayRequest
        include JSON::Serializable

        # The type of authorizer to use for the gateway. CUSTOM_JWT - Authorize with a bearer token. AWS_IAM -
        # Authorize with your Amazon Web Services IAM credentials. NONE - No authorization
        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String

        # The name of the gateway. The name must be unique within your account.
        @[JSON::Field(key: "name")]
        getter name : String

        # The protocol type for the gateway.
        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String

        # The Amazon Resource Name (ARN) of the IAM role that provides permissions for the gateway to access
        # Amazon Web Services services.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The authorizer configuration for the gateway. Required if authorizerType is CUSTOM_JWT .
        @[JSON::Field(key: "authorizerConfiguration")]
        getter authorizer_configuration : Types::AuthorizerConfiguration?

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If you don't specify this field, a value is randomly generated for you. If this token matches a
        # previous request, the service ignores the request, but doesn't return an error. For more
        # information, see Ensuring idempotency .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the gateway.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The level of detail in error messages returned when invoking the gateway. If the value is DEBUG ,
        # granular exception messages are returned to help a user debug the gateway. If the value is omitted,
        # a generic error message is returned to the end user.
        @[JSON::Field(key: "exceptionLevel")]
        getter exception_level : String?

        # A list of configuration settings for a gateway interceptor. Gateway interceptors allow custom code
        # to be invoked during gateway invocations.
        @[JSON::Field(key: "interceptorConfigurations")]
        getter interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt data associated with the gateway.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The policy engine configuration for the gateway. A policy engine is a collection of policies that
        # evaluates and authorizes agent tool calls. When associated with a gateway, the policy engine
        # intercepts all agent requests and determines whether to allow or deny each action based on the
        # defined policies.
        @[JSON::Field(key: "policyEngineConfiguration")]
        getter policy_engine_configuration : Types::GatewayPolicyEngineConfiguration?

        # The configuration settings for the protocol specified in the protocolType parameter.
        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::GatewayProtocolConfiguration?

        # A map of key-value pairs to associate with the gateway as metadata tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorizer_type : String,
          @name : String,
          @protocol_type : String,
          @role_arn : String,
          @authorizer_configuration : Types::AuthorizerConfiguration? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @exception_level : String? = nil,
          @interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)? = nil,
          @kms_key_arn : String? = nil,
          @policy_engine_configuration : Types::GatewayPolicyEngineConfiguration? = nil,
          @protocol_configuration : Types::GatewayProtocolConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateGatewayResponse
        include JSON::Serializable

        # The type of authorizer used by the gateway.
        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String

        # The timestamp when the gateway was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the created gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The unique identifier of the created gateway.
        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The name of the gateway.
        @[JSON::Field(key: "name")]
        getter name : String

        # The protocol type of the gateway.
        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String

        # The current status of the gateway.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the gateway was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The authorizer configuration for the created gateway.
        @[JSON::Field(key: "authorizerConfiguration")]
        getter authorizer_configuration : Types::AuthorizerConfiguration?

        # The description of the gateway.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The level of detail in error messages returned when invoking the gateway. If the value is DEBUG ,
        # granular exception messages are returned to help a user debug the gateway. If the value is omitted,
        # a generic error message is returned to the end user.
        @[JSON::Field(key: "exceptionLevel")]
        getter exception_level : String?

        # The URL endpoint for the created gateway.
        @[JSON::Field(key: "gatewayUrl")]
        getter gateway_url : String?

        # The list of interceptor configurations for the created gateway.
        @[JSON::Field(key: "interceptorConfigurations")]
        getter interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt data associated with the gateway.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The policy engine configuration for the created gateway.
        @[JSON::Field(key: "policyEngineConfiguration")]
        getter policy_engine_configuration : Types::GatewayPolicyEngineConfiguration?

        # The configuration settings for the protocol used by the gateway.
        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::GatewayProtocolConfiguration?

        # The Amazon Resource Name (ARN) of the IAM role associated with the gateway.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The reasons for the current status of the gateway.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        # The workload identity details for the created gateway.
        @[JSON::Field(key: "workloadIdentityDetails")]
        getter workload_identity_details : Types::WorkloadIdentityDetails?

        def initialize(
          @authorizer_type : String,
          @created_at : Time,
          @gateway_arn : String,
          @gateway_id : String,
          @name : String,
          @protocol_type : String,
          @status : String,
          @updated_at : Time,
          @authorizer_configuration : Types::AuthorizerConfiguration? = nil,
          @description : String? = nil,
          @exception_level : String? = nil,
          @gateway_url : String? = nil,
          @interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)? = nil,
          @kms_key_arn : String? = nil,
          @policy_engine_configuration : Types::GatewayPolicyEngineConfiguration? = nil,
          @protocol_configuration : Types::GatewayProtocolConfiguration? = nil,
          @role_arn : String? = nil,
          @status_reasons : Array(String)? = nil,
          @workload_identity_details : Types::WorkloadIdentityDetails? = nil
        )
        end
      end

      struct CreateGatewayTargetRequest
        include JSON::Serializable

        # The identifier of the gateway to create a target for.
        @[JSON::Field(key: "gatewayIdentifier")]
        getter gateway_identifier : String

        # The name of the gateway target. The name must be unique within the gateway.
        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration settings for the target, including endpoint information and schema definitions.
        @[JSON::Field(key: "targetConfiguration")]
        getter target_configuration : Types::TargetConfiguration

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If you don't specify this field, a value is randomly generated for you. If this token matches a
        # previous request, the service ignores the request, but doesn't return an error. For more
        # information, see Ensuring idempotency .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The credential provider configurations for the target. These configurations specify how the gateway
        # authenticates with the target endpoint.
        @[JSON::Field(key: "credentialProviderConfigurations")]
        getter credential_provider_configurations : Array(Types::CredentialProviderConfiguration)?

        # The description of the gateway target.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Optional configuration for HTTP header and query parameter propagation to and from the gateway
        # target.
        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfiguration?

        def initialize(
          @gateway_identifier : String,
          @name : String,
          @target_configuration : Types::TargetConfiguration,
          @client_token : String? = nil,
          @credential_provider_configurations : Array(Types::CredentialProviderConfiguration)? = nil,
          @description : String? = nil,
          @metadata_configuration : Types::MetadataConfiguration? = nil
        )
        end
      end

      struct CreateGatewayTargetResponse
        include JSON::Serializable

        # The timestamp when the target was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The credential provider configurations for the target.
        @[JSON::Field(key: "credentialProviderConfigurations")]
        getter credential_provider_configurations : Array(Types::CredentialProviderConfiguration)

        # The Amazon Resource Name (ARN) of the gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The name of the target.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the target.
        @[JSON::Field(key: "status")]
        getter status : String

        # The configuration settings for the target.
        @[JSON::Field(key: "targetConfiguration")]
        getter target_configuration : Types::TargetConfiguration

        # The unique identifier of the created target.
        @[JSON::Field(key: "targetId")]
        getter target_id : String

        # The timestamp when the target was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the target.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The last synchronization of the target.
        @[JSON::Field(key: "lastSynchronizedAt")]
        getter last_synchronized_at : Time?

        # The metadata configuration that was applied to the created gateway target.
        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfiguration?

        # The reasons for the current status of the target.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        def initialize(
          @created_at : Time,
          @credential_provider_configurations : Array(Types::CredentialProviderConfiguration),
          @gateway_arn : String,
          @name : String,
          @status : String,
          @target_configuration : Types::TargetConfiguration,
          @target_id : String,
          @updated_at : Time,
          @description : String? = nil,
          @last_synchronized_at : Time? = nil,
          @metadata_configuration : Types::MetadataConfiguration? = nil,
          @status_reasons : Array(String)? = nil
        )
        end
      end

      struct CreateMemoryInput
        include JSON::Serializable

        # The duration after which memory events expire. Specified as an ISO 8601 duration.
        @[JSON::Field(key: "eventExpiryDuration")]
        getter event_expiry_duration : Int32

        # The name of the memory. The name must be unique within your account.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Bedrock ignores the request but does not return an
        # error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the memory.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the memory data.
        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # The Amazon Resource Name (ARN) of the IAM role that provides permissions for the memory to access
        # Amazon Web Services services.
        @[JSON::Field(key: "memoryExecutionRoleArn")]
        getter memory_execution_role_arn : String?

        # The memory strategies to use for this memory. Strategies define how information is extracted,
        # processed, and consolidated.
        @[JSON::Field(key: "memoryStrategies")]
        getter memory_strategies : Array(Types::MemoryStrategyInput)?

        # A map of tag keys and values to assign to an AgentCore Memory. Tags enable you to categorize your
        # resources in different ways, for example, by purpose, owner, or environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @event_expiry_duration : Int32,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @encryption_key_arn : String? = nil,
          @memory_execution_role_arn : String? = nil,
          @memory_strategies : Array(Types::MemoryStrategyInput)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateMemoryOutput
        include JSON::Serializable

        # The details of the created memory, including its ID, ARN, name, description, and configuration
        # settings.
        @[JSON::Field(key: "memory")]
        getter memory : Types::Memory?

        def initialize(
          @memory : Types::Memory? = nil
        )
        end
      end

      struct CreateOauth2CredentialProviderRequest
        include JSON::Serializable

        # The vendor of the OAuth2 credential provider. This specifies which OAuth2 implementation to use.
        @[JSON::Field(key: "credentialProviderVendor")]
        getter credential_provider_vendor : String

        # The name of the OAuth2 credential provider. The name must be unique within your account.
        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration settings for the OAuth2 provider, including client ID, client secret, and other
        # vendor-specific settings.
        @[JSON::Field(key: "oauth2ProviderConfigInput")]
        getter oauth2_provider_config_input : Types::Oauth2ProviderConfigInput

        # A map of tag keys and values to assign to the OAuth2 credential provider. Tags enable you to
        # categorize your resources in different ways, for example, by purpose, owner, or environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @credential_provider_vendor : String,
          @name : String,
          @oauth2_provider_config_input : Types::Oauth2ProviderConfigInput,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateOauth2CredentialProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the client secret in AWS Secrets Manager.
        @[JSON::Field(key: "clientSecretArn")]
        getter client_secret_arn : Types::Secret

        # The Amazon Resource Name (ARN) of the OAuth2 credential provider.
        @[JSON::Field(key: "credentialProviderArn")]
        getter credential_provider_arn : String

        # The name of the OAuth2 credential provider.
        @[JSON::Field(key: "name")]
        getter name : String

        # Callback URL to register on the OAuth2 credential provider as an allowed callback URL. This URL is
        # where the OAuth2 authorization server redirects users after they complete the authorization flow.
        @[JSON::Field(key: "callbackUrl")]
        getter callback_url : String?

        @[JSON::Field(key: "oauth2ProviderConfigOutput")]
        getter oauth2_provider_config_output : Types::Oauth2ProviderConfigOutput?

        def initialize(
          @client_secret_arn : Types::Secret,
          @credential_provider_arn : String,
          @name : String,
          @callback_url : String? = nil,
          @oauth2_provider_config_output : Types::Oauth2ProviderConfigOutput? = nil
        )
        end
      end

      struct CreateOnlineEvaluationConfigRequest
        include JSON::Serializable

        # The data source configuration that specifies CloudWatch log groups and service names to monitor for
        # agent traces.
        @[JSON::Field(key: "dataSourceConfig")]
        getter data_source_config : Types::DataSourceConfig

        # Whether to enable the online evaluation configuration immediately upon creation. If true, evaluation
        # begins automatically.
        @[JSON::Field(key: "enableOnCreate")]
        getter enable_on_create : Bool

        # The Amazon Resource Name (ARN) of the IAM role that grants permissions to read from CloudWatch logs,
        # write evaluation results, and invoke Amazon Bedrock models for evaluation.
        @[JSON::Field(key: "evaluationExecutionRoleArn")]
        getter evaluation_execution_role_arn : String

        # The list of evaluators to apply during online evaluation. Can include both built-in evaluators and
        # custom evaluators created with CreateEvaluator .
        @[JSON::Field(key: "evaluators")]
        getter evaluators : Array(Types::EvaluatorReference)

        # The name of the online evaluation configuration. Must be unique within your account.
        @[JSON::Field(key: "onlineEvaluationConfigName")]
        getter online_evaluation_config_name : String

        # The evaluation rule that defines sampling configuration, filters, and session detection settings for
        # the online evaluation.
        @[JSON::Field(key: "rule")]
        getter rule : Types::Rule

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If you don't specify this field, a value is randomly generated for you. If this token matches a
        # previous request, the service ignores the request, but doesn't return an error. For more
        # information, see Ensuring idempotency .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the online evaluation configuration that explains its monitoring purpose and
        # scope.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @data_source_config : Types::DataSourceConfig,
          @enable_on_create : Bool,
          @evaluation_execution_role_arn : String,
          @evaluators : Array(Types::EvaluatorReference),
          @online_evaluation_config_name : String,
          @rule : Types::Rule,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateOnlineEvaluationConfigResponse
        include JSON::Serializable

        # The timestamp when the online evaluation configuration was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The execution status indicating whether the online evaluation is currently running.
        @[JSON::Field(key: "executionStatus")]
        getter execution_status : String

        # The Amazon Resource Name (ARN) of the created online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigArn")]
        getter online_evaluation_config_arn : String

        # The unique identifier of the created online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigId")]
        getter online_evaluation_config_id : String

        # The status of the online evaluation configuration.
        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for failure if the online evaluation configuration creation or execution failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        @[JSON::Field(key: "outputConfig")]
        getter output_config : Types::OutputConfig?

        def initialize(
          @created_at : Time,
          @execution_status : String,
          @online_evaluation_config_arn : String,
          @online_evaluation_config_id : String,
          @status : String,
          @failure_reason : String? = nil,
          @output_config : Types::OutputConfig? = nil
        )
        end
      end

      struct CreatePolicyEngineRequest
        include JSON::Serializable

        # The customer-assigned immutable name for the policy engine. This name identifies the policy engine
        # and cannot be changed after creation.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you retry a request with the same client token, the service returns the same response without
        # creating a duplicate policy engine.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A human-readable description of the policy engine's purpose and scope (1-4,096 characters). This
        # helps administrators understand the policy engine's role in the overall governance strategy.
        # Document which Gateway this engine will be associated with, what types of tools or workflows it
        # governs, and the team or service responsible for maintaining it. Clear descriptions are essential
        # when managing multiple policy engines across different services or environments.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreatePolicyEngineResponse
        include JSON::Serializable

        # The timestamp when the policy engine was created. This is automatically set by the service and used
        # for auditing and lifecycle management.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The customer-assigned name of the created policy engine. This matches the name provided in the
        # request and serves as the human-readable identifier.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the created policy engine. This globally unique identifier can be
        # used for cross-service references and IAM policy statements.
        @[JSON::Field(key: "policyEngineArn")]
        getter policy_engine_arn : String

        # The unique identifier for the created policy engine. This system-generated identifier consists of
        # the user name plus a 10-character generated suffix and is used for all subsequent policy engine
        # operations.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The current status of the policy engine. A status of ACTIVE indicates the policy engine is ready for
        # use.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the policy engine status. This provides details about any failures or
        # the current state of the policy engine creation process.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy engine was last updated. For newly created policy engines, this
        # matches the createdAt timestamp.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A human-readable description of the policy engine's purpose.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_engine_arn : String,
          @policy_engine_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct CreatePolicyRequest
        include JSON::Serializable

        # The Cedar policy statement that defines the access control rules. This contains the actual policy
        # logic written in Cedar policy language, specifying effect (permit or forbid), principals, actions,
        # resources, and conditions for agent behavior control.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinition

        # The customer-assigned immutable name for the policy. Must be unique within the account. This name is
        # used for policy identification and cannot be changed after creation.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the policy engine which contains this policy. Policy engines group related
        # policies and provide the execution context for policy evaluation.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # A unique, case-sensitive identifier to ensure the idempotency of the request. The AWS SDK
        # automatically generates this token, so you don't need to provide it in most cases. If you retry a
        # request with the same client token, the service returns the same response without creating a
        # duplicate policy.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A human-readable description of the policy's purpose and functionality (1-4,096 characters). This
        # helps policy administrators understand the policy's intent, business rules, and operational scope.
        # Use this field to document why the policy exists, what business requirement it addresses, and any
        # special considerations for maintenance. Clear descriptions are essential for policy governance,
        # auditing, and troubleshooting.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The validation mode for the policy creation. Determines how Cedar analyzer validation results are
        # handled during policy creation. FAIL_ON_ANY_FINDINGS (default) runs the Cedar analyzer to validate
        # the policy against the Cedar schema and tool context, failing creation if the analyzer detects any
        # validation issues to ensure strict conformance. IGNORE_ALL_FINDINGS runs the Cedar analyzer but
        # allows policy creation even if validation issues are detected, useful for testing or when the policy
        # schema is evolving. Use FAIL_ON_ANY_FINDINGS for production policies to ensure correctness, and
        # IGNORE_ALL_FINDINGS only when you understand and accept the analyzer findings.
        @[JSON::Field(key: "validationMode")]
        getter validation_mode : String?

        def initialize(
          @definition : Types::PolicyDefinition,
          @name : String,
          @policy_engine_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @validation_mode : String? = nil
        )
        end
      end

      struct CreatePolicyResponse
        include JSON::Serializable

        # The timestamp when the policy was created. This is automatically set by the service and used for
        # auditing and lifecycle management.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Cedar policy statement that was created. This is the validated policy definition that will be
        # used for agent behavior control and access decisions.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinition

        # The customer-assigned name of the created policy. This matches the name provided in the request and
        # serves as the human-readable identifier for the policy.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the created policy. This globally unique identifier can be used
        # for cross-service references and IAM policy statements.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The identifier of the policy engine that manages this policy. This confirms the policy engine
        # assignment and is used for policy evaluation routing.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier for the created policy. This is a system-generated identifier consisting of
        # the user name plus a 10-character generated suffix, used for all subsequent policy operations.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The current status of the policy. A status of ACTIVE indicates the policy is ready for use.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the policy status. This provides details about any failures or the
        # current state of the policy creation process.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy was last updated. For newly created policies, this matches the
        # createdAt timestamp.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The human-readable description of the policy's purpose and functionality. This helps administrators
        # understand and manage the policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @definition : Types::PolicyDefinition,
          @name : String,
          @policy_arn : String,
          @policy_engine_id : String,
          @policy_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct CreateWorkloadIdentityRequest
        include JSON::Serializable

        # The name of the workload identity. The name must be unique within your account.
        @[JSON::Field(key: "name")]
        getter name : String

        # The list of allowed OAuth2 return URLs for resources associated with this workload identity.
        @[JSON::Field(key: "allowedResourceOauth2ReturnUrls")]
        getter allowed_resource_oauth2_return_urls : Array(String)?

        # A map of tag keys and values to assign to the workload identity. Tags enable you to categorize your
        # resources in different ways, for example, by purpose, owner, or environment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @allowed_resource_oauth2_return_urls : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateWorkloadIdentityResponse
        include JSON::Serializable

        # The name of the workload identity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the workload identity.
        @[JSON::Field(key: "workloadIdentityArn")]
        getter workload_identity_arn : String

        # The list of allowed OAuth2 return URLs for resources associated with this workload identity.
        @[JSON::Field(key: "allowedResourceOauth2ReturnUrls")]
        getter allowed_resource_oauth2_return_urls : Array(String)?

        def initialize(
          @name : String,
          @workload_identity_arn : String,
          @allowed_resource_oauth2_return_urls : Array(String)? = nil
        )
        end
      end

      # A credential provider for gateway authentication. This structure contains the configuration for
      # authenticating with the target endpoint.
      struct CredentialProvider
        include JSON::Serializable

        # The API key credential provider. This provider uses an API key to authenticate with the target
        # endpoint.
        @[JSON::Field(key: "apiKeyCredentialProvider")]
        getter api_key_credential_provider : Types::ApiKeyCredentialProvider?

        # The OAuth credential provider. This provider uses OAuth authentication to access the target
        # endpoint.
        @[JSON::Field(key: "oauthCredentialProvider")]
        getter oauth_credential_provider : Types::OAuthCredentialProvider?

        def initialize(
          @api_key_credential_provider : Types::ApiKeyCredentialProvider? = nil,
          @oauth_credential_provider : Types::OAuthCredentialProvider? = nil
        )
        end
      end

      # The configuration for a credential provider. This structure defines how the gateway authenticates
      # with the target endpoint.
      struct CredentialProviderConfiguration
        include JSON::Serializable

        # The type of credential provider. This field specifies which authentication method the gateway uses.
        @[JSON::Field(key: "credentialProviderType")]
        getter credential_provider_type : String

        # The credential provider. This field contains the specific configuration for the credential provider
        # type.
        @[JSON::Field(key: "credentialProvider")]
        getter credential_provider : Types::CredentialProvider?

        def initialize(
          @credential_provider_type : String,
          @credential_provider : Types::CredentialProvider? = nil
        )
        end
      end

      # Defines the name of a custom claim field and rules for finding matches to authenticate its value.
      struct CustomClaimValidationType
        include JSON::Serializable

        # Defines the value or values to match for and the relationship of the match.
        @[JSON::Field(key: "authorizingClaimMatchValue")]
        getter authorizing_claim_match_value : Types::AuthorizingClaimMatchValueType

        # The name of the custom claim field to check.
        @[JSON::Field(key: "inboundTokenClaimName")]
        getter inbound_token_claim_name : String

        # The data type of the claim value to check for. Use STRING if you want to find an exact match to a
        # string you define. Use STRING_ARRAY if you want to fnd a match to at least one value in an array you
        # define.
        @[JSON::Field(key: "inboundTokenClaimValueType")]
        getter inbound_token_claim_value_type : String

        def initialize(
          @authorizing_claim_match_value : Types::AuthorizingClaimMatchValueType,
          @inbound_token_claim_name : String,
          @inbound_token_claim_value_type : String
        )
        end
      end

      # Input for custom configuration of a memory strategy.
      struct CustomConfigurationInput
        include JSON::Serializable

        # The episodic memory strategy override configuration for a custom memory strategy.
        @[JSON::Field(key: "episodicOverride")]
        getter episodic_override : Types::EpisodicOverrideConfigurationInput?

        # The self managed configuration for a custom memory strategy.
        @[JSON::Field(key: "selfManagedConfiguration")]
        getter self_managed_configuration : Types::SelfManagedConfigurationInput?

        # The semantic override configuration for a custom memory strategy.
        @[JSON::Field(key: "semanticOverride")]
        getter semantic_override : Types::SemanticOverrideConfigurationInput?

        # The summary override configuration for a custom memory strategy.
        @[JSON::Field(key: "summaryOverride")]
        getter summary_override : Types::SummaryOverrideConfigurationInput?

        # The user preference override configuration for a custom memory strategy.
        @[JSON::Field(key: "userPreferenceOverride")]
        getter user_preference_override : Types::UserPreferenceOverrideConfigurationInput?

        def initialize(
          @episodic_override : Types::EpisodicOverrideConfigurationInput? = nil,
          @self_managed_configuration : Types::SelfManagedConfigurationInput? = nil,
          @semantic_override : Types::SemanticOverrideConfigurationInput? = nil,
          @summary_override : Types::SummaryOverrideConfigurationInput? = nil,
          @user_preference_override : Types::UserPreferenceOverrideConfigurationInput? = nil
        )
        end
      end

      # Contains custom consolidation configuration information.
      struct CustomConsolidationConfiguration
        include JSON::Serializable

        # The configurations to override the default consolidation step for the episodic memory strategy.
        @[JSON::Field(key: "episodicConsolidationOverride")]
        getter episodic_consolidation_override : Types::EpisodicConsolidationOverride?

        # The semantic consolidation override configuration.
        @[JSON::Field(key: "semanticConsolidationOverride")]
        getter semantic_consolidation_override : Types::SemanticConsolidationOverride?

        # The summary consolidation override configuration.
        @[JSON::Field(key: "summaryConsolidationOverride")]
        getter summary_consolidation_override : Types::SummaryConsolidationOverride?

        # The user preference consolidation override configuration.
        @[JSON::Field(key: "userPreferenceConsolidationOverride")]
        getter user_preference_consolidation_override : Types::UserPreferenceConsolidationOverride?

        def initialize(
          @episodic_consolidation_override : Types::EpisodicConsolidationOverride? = nil,
          @semantic_consolidation_override : Types::SemanticConsolidationOverride? = nil,
          @summary_consolidation_override : Types::SummaryConsolidationOverride? = nil,
          @user_preference_consolidation_override : Types::UserPreferenceConsolidationOverride? = nil
        )
        end
      end

      # Input for a custom consolidation configuration.
      struct CustomConsolidationConfigurationInput
        include JSON::Serializable

        # Configurations to override the consolidation step of the episodic strategy.
        @[JSON::Field(key: "episodicConsolidationOverride")]
        getter episodic_consolidation_override : Types::EpisodicOverrideConsolidationConfigurationInput?

        # The semantic consolidation override configuration input.
        @[JSON::Field(key: "semanticConsolidationOverride")]
        getter semantic_consolidation_override : Types::SemanticOverrideConsolidationConfigurationInput?

        # The summary consolidation override configuration input.
        @[JSON::Field(key: "summaryConsolidationOverride")]
        getter summary_consolidation_override : Types::SummaryOverrideConsolidationConfigurationInput?

        # The user preference consolidation override configuration input.
        @[JSON::Field(key: "userPreferenceConsolidationOverride")]
        getter user_preference_consolidation_override : Types::UserPreferenceOverrideConsolidationConfigurationInput?

        def initialize(
          @episodic_consolidation_override : Types::EpisodicOverrideConsolidationConfigurationInput? = nil,
          @semantic_consolidation_override : Types::SemanticOverrideConsolidationConfigurationInput? = nil,
          @summary_consolidation_override : Types::SummaryOverrideConsolidationConfigurationInput? = nil,
          @user_preference_consolidation_override : Types::UserPreferenceOverrideConsolidationConfigurationInput? = nil
        )
        end
      end

      # Contains custom extraction configuration information.
      struct CustomExtractionConfiguration
        include JSON::Serializable

        # The configurations to override the default extraction step for the episodic memory strategy.
        @[JSON::Field(key: "episodicExtractionOverride")]
        getter episodic_extraction_override : Types::EpisodicExtractionOverride?

        # The semantic extraction override configuration.
        @[JSON::Field(key: "semanticExtractionOverride")]
        getter semantic_extraction_override : Types::SemanticExtractionOverride?

        # The user preference extraction override configuration.
        @[JSON::Field(key: "userPreferenceExtractionOverride")]
        getter user_preference_extraction_override : Types::UserPreferenceExtractionOverride?

        def initialize(
          @episodic_extraction_override : Types::EpisodicExtractionOverride? = nil,
          @semantic_extraction_override : Types::SemanticExtractionOverride? = nil,
          @user_preference_extraction_override : Types::UserPreferenceExtractionOverride? = nil
        )
        end
      end

      # Input for a custom extraction configuration.
      struct CustomExtractionConfigurationInput
        include JSON::Serializable

        # Configurations to override the extraction step of the episodic strategy.
        @[JSON::Field(key: "episodicExtractionOverride")]
        getter episodic_extraction_override : Types::EpisodicOverrideExtractionConfigurationInput?

        # The semantic extraction override configuration input.
        @[JSON::Field(key: "semanticExtractionOverride")]
        getter semantic_extraction_override : Types::SemanticOverrideExtractionConfigurationInput?

        # The user preference extraction override configuration input.
        @[JSON::Field(key: "userPreferenceExtractionOverride")]
        getter user_preference_extraction_override : Types::UserPreferenceOverrideExtractionConfigurationInput?

        def initialize(
          @episodic_extraction_override : Types::EpisodicOverrideExtractionConfigurationInput? = nil,
          @semantic_extraction_override : Types::SemanticOverrideExtractionConfigurationInput? = nil,
          @user_preference_extraction_override : Types::UserPreferenceOverrideExtractionConfigurationInput? = nil
        )
        end
      end

      # Configuration for inbound JWT-based authorization, specifying how incoming requests should be
      # authenticated.
      struct CustomJWTAuthorizerConfiguration
        include JSON::Serializable

        # This URL is used to fetch OpenID Connect configuration or authorization server metadata for
        # validating incoming tokens.
        @[JSON::Field(key: "discoveryUrl")]
        getter discovery_url : String

        # Represents individual audience values that are validated in the incoming JWT token validation
        # process.
        @[JSON::Field(key: "allowedAudience")]
        getter allowed_audience : Array(String)?

        # Represents individual client IDs that are validated in the incoming JWT token validation process.
        @[JSON::Field(key: "allowedClients")]
        getter allowed_clients : Array(String)?

        # An array of scopes that are allowed to access the token.
        @[JSON::Field(key: "allowedScopes")]
        getter allowed_scopes : Array(String)?

        # An array of objects that define a custom claim validation name, value, and operation
        @[JSON::Field(key: "customClaims")]
        getter custom_claims : Array(Types::CustomClaimValidationType)?

        def initialize(
          @discovery_url : String,
          @allowed_audience : Array(String)? = nil,
          @allowed_clients : Array(String)? = nil,
          @allowed_scopes : Array(String)? = nil,
          @custom_claims : Array(Types::CustomClaimValidationType)? = nil
        )
        end
      end

      # Input for creating a custom memory strategy.
      struct CustomMemoryStrategyInput
        include JSON::Serializable

        # The name of the custom memory strategy.
        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration for the custom memory strategy.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CustomConfigurationInput?

        # The description of the custom memory strategy.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The namespaces associated with the custom memory strategy.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        def initialize(
          @name : String,
          @configuration : Types::CustomConfigurationInput? = nil,
          @description : String? = nil,
          @namespaces : Array(String)? = nil
        )
        end
      end

      # Input configuration for a custom OAuth2 provider.
      struct CustomOauth2ProviderConfigInput
        include JSON::Serializable

        # The client ID for the custom OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret for the custom OAuth2 provider.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        # The OAuth2 discovery information for the custom provider.
        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        def initialize(
          @client_id : String,
          @client_secret : String,
          @oauth_discovery : Types::Oauth2Discovery
        )
        end
      end

      # Output configuration for a custom OAuth2 provider.
      struct CustomOauth2ProviderConfigOutput
        include JSON::Serializable

        # The OAuth2 discovery information for the custom provider.
        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        # The client ID for the custom OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @oauth_discovery : Types::Oauth2Discovery,
          @client_id : String? = nil
        )
        end
      end

      # Contains configurations for a custom reflection strategy.
      struct CustomReflectionConfiguration
        include JSON::Serializable

        # The configuration for a reflection strategy to override the default one.
        @[JSON::Field(key: "episodicReflectionOverride")]
        getter episodic_reflection_override : Types::EpisodicReflectionOverride?

        def initialize(
          @episodic_reflection_override : Types::EpisodicReflectionOverride? = nil
        )
        end
      end

      # Input for a custom reflection configuration.
      struct CustomReflectionConfigurationInput
        include JSON::Serializable

        # The reflection override configuration input.
        @[JSON::Field(key: "episodicReflectionOverride")]
        getter episodic_reflection_override : Types::EpisodicOverrideReflectionConfigurationInput?

        def initialize(
          @episodic_reflection_override : Types::EpisodicOverrideReflectionConfigurationInput? = nil
        )
        end
      end

      # The configuration that specifies where to read agent traces for online evaluation.
      struct DataSourceConfig
        include JSON::Serializable

        # The CloudWatch logs configuration for reading agent traces from log groups.
        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogsInputConfig?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogsInputConfig? = nil
        )
        end
      end

      # Exception thrown when decryption of a secret fails.
      struct DecryptionFailure
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct DeleteAgentRuntimeEndpointRequest
        include JSON::Serializable

        # The unique identifier of the AgentCore Runtime associated with the endpoint.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The name of the AgentCore Runtime endpoint to delete.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @agent_runtime_id : String,
          @endpoint_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteAgentRuntimeEndpointResponse
        include JSON::Serializable

        # The current status of the AgentCore Runtime endpoint deletion.
        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String?

        # The name of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String?

        def initialize(
          @status : String,
          @agent_runtime_id : String? = nil,
          @endpoint_name : String? = nil
        )
        end
      end

      struct DeleteAgentRuntimeRequest
        include JSON::Serializable

        # The unique identifier of the AgentCore Runtime to delete.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, the service ignores the request but does not return an error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @agent_runtime_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteAgentRuntimeResponse
        include JSON::Serializable

        # The current status of the AgentCore Runtime deletion.
        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String?

        def initialize(
          @status : String,
          @agent_runtime_id : String? = nil
        )
        end
      end

      struct DeleteApiKeyCredentialProviderRequest
        include JSON::Serializable

        # The name of the API key credential provider to delete.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteApiKeyCredentialProviderResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteBrowserRequest
        include JSON::Serializable

        # The unique identifier of the browser to delete.
        @[JSON::Field(key: "browserId")]
        getter browser_id : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @browser_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteBrowserResponse
        include JSON::Serializable

        # The unique identifier of the deleted browser.
        @[JSON::Field(key: "browserId")]
        getter browser_id : String

        # The timestamp when the browser was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The current status of the browser deletion.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @browser_id : String,
          @last_updated_at : Time,
          @status : String
        )
        end
      end

      struct DeleteCodeInterpreterRequest
        include JSON::Serializable

        # The unique identifier of the code interpreter to delete.
        @[JSON::Field(key: "codeInterpreterId")]
        getter code_interpreter_id : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @code_interpreter_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteCodeInterpreterResponse
        include JSON::Serializable

        # The unique identifier of the deleted code interpreter.
        @[JSON::Field(key: "codeInterpreterId")]
        getter code_interpreter_id : String

        # The timestamp when the code interpreter was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The current status of the code interpreter deletion.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @code_interpreter_id : String,
          @last_updated_at : Time,
          @status : String
        )
        end
      end

      struct DeleteEvaluatorRequest
        include JSON::Serializable

        # The unique identifier of the evaluator to delete.
        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        def initialize(
          @evaluator_id : String
        )
        end
      end

      struct DeleteEvaluatorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted evaluator.
        @[JSON::Field(key: "evaluatorArn")]
        getter evaluator_arn : String

        # The unique identifier of the deleted evaluator.
        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        # The status of the evaluator deletion operation.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @evaluator_arn : String,
          @evaluator_id : String,
          @status : String
        )
        end
      end

      struct DeleteGatewayRequest
        include JSON::Serializable

        # The identifier of the gateway to delete.
        @[JSON::Field(key: "gatewayIdentifier")]
        getter gateway_identifier : String

        def initialize(
          @gateway_identifier : String
        )
        end
      end

      struct DeleteGatewayResponse
        include JSON::Serializable

        # The unique identifier of the deleted gateway.
        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The current status of the gateway deletion.
        @[JSON::Field(key: "status")]
        getter status : String

        # The reasons for the current status of the gateway deletion.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        def initialize(
          @gateway_id : String,
          @status : String,
          @status_reasons : Array(String)? = nil
        )
        end
      end

      struct DeleteGatewayTargetRequest
        include JSON::Serializable

        # The unique identifier of the gateway associated with the target.
        @[JSON::Field(key: "gatewayIdentifier")]
        getter gateway_identifier : String

        # The unique identifier of the gateway target to delete.
        @[JSON::Field(key: "targetId")]
        getter target_id : String

        def initialize(
          @gateway_identifier : String,
          @target_id : String
        )
        end
      end

      struct DeleteGatewayTargetResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The current status of the gateway target deletion.
        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the deleted gateway target.
        @[JSON::Field(key: "targetId")]
        getter target_id : String

        # The reasons for the current status of the gateway target deletion.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        def initialize(
          @gateway_arn : String,
          @status : String,
          @target_id : String,
          @status_reasons : Array(String)? = nil
        )
        end
      end

      struct DeleteMemoryInput
        include JSON::Serializable

        # The unique identifier of the memory to delete.
        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # A client token is used for keeping track of idempotent requests. It can contain a session id which
        # can be around 250 chars, combined with a unique AWS identifier.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @memory_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteMemoryOutput
        include JSON::Serializable

        # The unique identifier of the deleted AgentCore Memory resource.
        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The current status of the AgentCore Memory resource deletion.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @memory_id : String,
          @status : String? = nil
        )
        end
      end

      # Input for deleting a memory strategy.
      struct DeleteMemoryStrategyInput
        include JSON::Serializable

        # The unique identifier of the memory strategy to delete.
        @[JSON::Field(key: "memoryStrategyId")]
        getter memory_strategy_id : String

        def initialize(
          @memory_strategy_id : String
        )
        end
      end

      struct DeleteOauth2CredentialProviderRequest
        include JSON::Serializable

        # The name of the OAuth2 credential provider to delete.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteOauth2CredentialProviderResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteOnlineEvaluationConfigRequest
        include JSON::Serializable

        # The unique identifier of the online evaluation configuration to delete.
        @[JSON::Field(key: "onlineEvaluationConfigId")]
        getter online_evaluation_config_id : String

        def initialize(
          @online_evaluation_config_id : String
        )
        end
      end

      struct DeleteOnlineEvaluationConfigResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigArn")]
        getter online_evaluation_config_arn : String

        # The unique identifier of the deleted online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigId")]
        getter online_evaluation_config_id : String

        # The status of the online evaluation configuration deletion operation.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @online_evaluation_config_arn : String,
          @online_evaluation_config_id : String,
          @status : String
        )
        end
      end

      struct DeletePolicyEngineRequest
        include JSON::Serializable

        # The unique identifier of the policy engine to be deleted. This must be a valid policy engine ID that
        # exists within the account.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        def initialize(
          @policy_engine_id : String
        )
        end
      end

      struct DeletePolicyEngineResponse
        include JSON::Serializable

        # The timestamp when the deleted policy engine was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The customer-assigned name of the deleted policy engine.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the deleted policy engine. This globally unique identifier
        # confirms which policy engine resource was successfully removed.
        @[JSON::Field(key: "policyEngineArn")]
        getter policy_engine_arn : String

        # The unique identifier of the policy engine being deleted. This confirms which policy engine the
        # deletion operation targets.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The status of the policy engine deletion operation. This provides status about any issues that
        # occurred during the deletion process.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the deletion status. This provides details about the deletion process
        # or any issues that may have occurred.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the deleted policy engine was last modified before deletion. This tracks the
        # final state of the policy engine before it was removed from the system.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The human-readable description of the deleted policy engine.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_engine_arn : String,
          @policy_engine_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct DeletePolicyRequest
        include JSON::Serializable

        # The identifier of the policy engine that manages the policy to be deleted. This ensures the policy
        # is deleted from the correct policy engine context.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier of the policy to be deleted. This must be a valid policy ID that exists within
        # the specified policy engine.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        def initialize(
          @policy_engine_id : String,
          @policy_id : String
        )
        end
      end

      struct DeletePolicyResponse
        include JSON::Serializable

        # The timestamp when the deleted policy was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinition

        # The customer-assigned name of the deleted policy. This confirms which policy was successfully
        # removed from the system and matches the name that was originally assigned during policy creation.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the deleted policy. This globally unique identifier confirms which
        # policy resource was successfully removed.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The identifier of the policy engine from which the policy was deleted. This confirms the policy
        # engine context for the deletion operation.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier of the policy being deleted. This confirms which policy the deletion operation
        # targets.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The status of the policy deletion operation. This provides information about any issues that
        # occurred during the deletion process.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the deletion status. This provides details about the deletion process
        # or any issues that may have occurred.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the deleted policy was last modified before deletion. This tracks the final state
        # of the policy before it was removed from the system.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The human-readable description of the deleted policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @definition : Types::PolicyDefinition,
          @name : String,
          @policy_arn : String,
          @policy_engine_id : String,
          @policy_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which to delete the resource policy.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteWorkloadIdentityRequest
        include JSON::Serializable

        # The name of the workload identity to delete.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteWorkloadIdentityResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Exception thrown when encryption of a secret fails.
      struct EncryptionFailure
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains configurations to override the default consolidation step for the episodic memory strategy.
      struct EpisodicConsolidationOverride
        include JSON::Serializable

        # The text appended to the prompt for the consolidation step of the episodic memory strategy.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID used for the consolidation step of the episodic memory strategy.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Contains configurations to override the default extraction step for the episodic memory strategy.
      struct EpisodicExtractionOverride
        include JSON::Serializable

        # The text appended to the prompt for the extraction step of the episodic memory strategy.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID used for the extraction step of the episodic memory strategy.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Input for creating an episodic memory strategy.
      struct EpisodicMemoryStrategyInput
        include JSON::Serializable

        # The name of the episodic memory strategy.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the episodic memory strategy.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The namespaces for which to create episodes.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        # The configuration for the reflections created with the episodic memory strategy.
        @[JSON::Field(key: "reflectionConfiguration")]
        getter reflection_configuration : Types::EpisodicReflectionConfigurationInput?

        def initialize(
          @name : String,
          @description : String? = nil,
          @namespaces : Array(String)? = nil,
          @reflection_configuration : Types::EpisodicReflectionConfigurationInput? = nil
        )
        end
      end

      # Input for the configuration to override the episodic memory strategy.
      struct EpisodicOverrideConfigurationInput
        include JSON::Serializable

        # Contains configurations for overriding the consolidation step of the episodic memory strategy.
        @[JSON::Field(key: "consolidation")]
        getter consolidation : Types::EpisodicOverrideConsolidationConfigurationInput?

        # Contains configurations for overriding the extraction step of the episodic memory strategy.
        @[JSON::Field(key: "extraction")]
        getter extraction : Types::EpisodicOverrideExtractionConfigurationInput?

        # Contains configurations for overriding the reflection step of the episodic memory strategy.
        @[JSON::Field(key: "reflection")]
        getter reflection : Types::EpisodicOverrideReflectionConfigurationInput?

        def initialize(
          @consolidation : Types::EpisodicOverrideConsolidationConfigurationInput? = nil,
          @extraction : Types::EpisodicOverrideExtractionConfigurationInput? = nil,
          @reflection : Types::EpisodicOverrideReflectionConfigurationInput? = nil
        )
        end
      end

      # Configurations for overriding the consolidation step of the episodic memory strategy.
      struct EpisodicOverrideConsolidationConfigurationInput
        include JSON::Serializable

        # The text to append to the prompt for the consolidation step of the episodic memory strategy.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for the consolidation step of the episodic memory strategy.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Configurations for overriding the extraction step of the episodic memory strategy.
      struct EpisodicOverrideExtractionConfigurationInput
        include JSON::Serializable

        # The text to append to the prompt for the extraction step of the episodic memory strategy.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for the extraction step of the episodic memory strategy.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Configurations for overriding the reflection step of the episodic memory strategy.
      struct EpisodicOverrideReflectionConfigurationInput
        include JSON::Serializable

        # The text to append to the prompt for reflection step of the episodic memory strategy.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for the reflection step of the episodic memory strategy.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The namespaces to use for episodic reflection. Can be less nested than the episodic namespaces.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        def initialize(
          @append_to_prompt : String,
          @model_id : String,
          @namespaces : Array(String)? = nil
        )
        end
      end

      # The configuration for the reflections created with the episodic memory strategy.
      struct EpisodicReflectionConfiguration
        include JSON::Serializable

        # The namespaces for which to create reflections. Can be less nested than the episodic namespaces.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)

        def initialize(
          @namespaces : Array(String)
        )
        end
      end

      # An episodic reflection configuration input.
      struct EpisodicReflectionConfigurationInput
        include JSON::Serializable

        # The namespaces over which to create reflections. Can be less nested than episode namespaces.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)

        def initialize(
          @namespaces : Array(String)
        )
        end
      end

      # Contains configurations to override the default reflection step for the episodic memory strategy.
      struct EpisodicReflectionOverride
        include JSON::Serializable

        # The text appended to the prompt for the reflection step of the episodic memory strategy.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID used for the reflection step of the episodic memory strategy.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The namespaces over which reflections were created. Can be less nested than the episodic namespaces.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        def initialize(
          @append_to_prompt : String,
          @model_id : String,
          @namespaces : Array(String)? = nil
        )
        end
      end

      # The configuration that defines how an evaluator assesses agent performance, including the evaluation
      # method and parameters.
      struct EvaluatorConfig
        include JSON::Serializable

        # The LLM-as-a-Judge configuration that uses a language model to evaluate agent performance based on
        # custom instructions and rating scales.
        @[JSON::Field(key: "llmAsAJudge")]
        getter llm_as_a_judge : Types::LlmAsAJudgeEvaluatorConfig?

        def initialize(
          @llm_as_a_judge : Types::LlmAsAJudgeEvaluatorConfig? = nil
        )
        end
      end

      # The model configuration that specifies which foundation model to use for evaluation and how to
      # configure it.
      struct EvaluatorModelConfig
        include JSON::Serializable

        # The Amazon Bedrock model configuration for evaluation.
        @[JSON::Field(key: "bedrockEvaluatorModelConfig")]
        getter bedrock_evaluator_model_config : Types::BedrockEvaluatorModelConfig?

        def initialize(
          @bedrock_evaluator_model_config : Types::BedrockEvaluatorModelConfig? = nil
        )
        end
      end

      # The reference to an evaluator used in online evaluation configurations, containing the evaluator
      # identifier.
      struct EvaluatorReference
        include JSON::Serializable

        # The unique identifier of the evaluator. Can reference builtin evaluators (e.g., Builtin.Helpfulness)
        # or custom evaluators.
        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String?

        def initialize(
          @evaluator_id : String? = nil
        )
        end
      end

      # The summary information about an evaluator, including basic metadata and status information.
      struct EvaluatorSummary
        include JSON::Serializable

        # The timestamp when the evaluator was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the evaluator.
        @[JSON::Field(key: "evaluatorArn")]
        getter evaluator_arn : String

        # The unique identifier of the evaluator.
        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        # The name of the evaluator.
        @[JSON::Field(key: "evaluatorName")]
        getter evaluator_name : String

        # The type of evaluator, indicating whether it is a built-in evaluator provided by the service or a
        # custom evaluator created by the user.
        @[JSON::Field(key: "evaluatorType")]
        getter evaluator_type : String

        # The current status of the evaluator.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the evaluator was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the evaluator.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The evaluation level ( TOOL_CALL , TRACE , or SESSION ) that determines the scope of evaluation.
        @[JSON::Field(key: "level")]
        getter level : String?

        # Whether the evaluator is locked for modification due to being referenced by active online evaluation
        # configurations.
        @[JSON::Field(key: "lockedForModification")]
        getter locked_for_modification : Bool?

        def initialize(
          @created_at : Time,
          @evaluator_arn : String,
          @evaluator_id : String,
          @evaluator_name : String,
          @evaluator_type : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @level : String? = nil,
          @locked_for_modification : Bool? = nil
        )
        end
      end

      # Contains extraction configuration information for a memory strategy.
      struct ExtractionConfiguration
        include JSON::Serializable

        # The custom extraction configuration.
        @[JSON::Field(key: "customExtractionConfiguration")]
        getter custom_extraction_configuration : Types::CustomExtractionConfiguration?

        def initialize(
          @custom_extraction_configuration : Types::CustomExtractionConfiguration? = nil
        )
        end
      end

      # The filter that applies conditions to agent traces during online evaluation to determine which
      # traces should be evaluated.
      struct Filter
        include JSON::Serializable

        # The key or field name to filter on within the agent trace data.
        @[JSON::Field(key: "key")]
        getter key : String

        # The comparison operator to use for filtering.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # The value to compare against using the specified operator.
        @[JSON::Field(key: "value")]
        getter value : Types::FilterValue

        def initialize(
          @key : String,
          @operator : String,
          @value : Types::FilterValue
        )
        end
      end

      # The value used in filter comparisons, supporting different data types for flexible filtering
      # criteria.
      struct FilterValue
        include JSON::Serializable

        # The boolean value for true/false filtering conditions.
        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : Bool?

        # The numeric value for numerical filtering and comparisons.
        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # The string value for text-based filtering.
        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @boolean_value : Bool? = nil,
          @double_value : Float64? = nil,
          @string_value : String? = nil
        )
        end
      end

      # Represents a finding or issue discovered during policy generation or validation. Findings provide
      # insights about potential problems, recommendations, or validation results from policy analysis
      # operations. Finding types include: VALID (policy is ready to use), INVALID (policy has validation
      # errors that must be fixed), NOT_TRANSLATABLE (input couldn't be converted to policy), ALLOW_ALL
      # (policy would allow all actions, potential security risk), ALLOW_NONE (policy would allow no
      # actions, unusable), DENY_ALL (policy would deny all actions, may be too restrictive), and DENY_NONE
      # (policy would deny no actions, ineffective). Review all findings before creating policies from
      # generated assets to ensure they match your security requirements.
      struct Finding
        include JSON::Serializable

        # A human-readable description of the finding. This provides detailed information about the issue,
        # recommendation, or validation result to help users understand and address the finding.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The type or category of the finding. This classifies the finding as an error, warning,
        # recommendation, or informational message to help users understand the severity and nature of the
        # issue.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @description : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The configuration for an interceptor on a gateway. This structure defines settings for an
      # interceptor that will be invoked during the invocation of the gateway.
      struct GatewayInterceptorConfiguration
        include JSON::Serializable

        # The supported points of interception. This field specifies which points during the gateway
        # invocation to invoke the interceptor
        @[JSON::Field(key: "interceptionPoints")]
        getter interception_points : Array(String)

        # The infrastructure settings of an interceptor configuration. This structure defines how the
        # interceptor can be invoked.
        @[JSON::Field(key: "interceptor")]
        getter interceptor : Types::InterceptorConfiguration

        # The configuration for the input of the interceptor. This field specifies how the input to the
        # interceptor is constructed
        @[JSON::Field(key: "inputConfiguration")]
        getter input_configuration : Types::InterceptorInputConfiguration?

        def initialize(
          @interception_points : Array(String),
          @interceptor : Types::InterceptorConfiguration,
          @input_configuration : Types::InterceptorInputConfiguration? = nil
        )
        end
      end

      # The configuration for a policy engine associated with a gateway. A policy engine is a collection of
      # policies that evaluates and authorizes agent tool calls. When associated with a gateway, the policy
      # engine intercepts all agent requests and determines whether to allow or deny each action based on
      # the defined policies.
      struct GatewayPolicyEngineConfiguration
        include JSON::Serializable

        # The ARN of the policy engine. The policy engine contains Cedar policies that define fine-grained
        # authorization rules specifying who can perform what actions on which resources as agents interact
        # through the gateway.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The enforcement mode for the policy engine. Valid values include: LOG_ONLY - The policy engine
        # evaluates each action against your policies and adds traces on whether tool calls would be allowed
        # or denied, but does not enforce the decision. Use this mode to test and validate policies before
        # enabling enforcement. ENFORCE - The policy engine evaluates actions against your policies and
        # enforces decisions by allowing or denying agent operations. Test and validate policies in LOG_ONLY
        # mode before enabling enforcement to avoid unintended denials or adversely affecting production
        # traffic.
        @[JSON::Field(key: "mode")]
        getter mode : String

        def initialize(
          @arn : String,
          @mode : String
        )
        end
      end

      # The configuration for a gateway protocol. This structure defines how the gateway communicates with
      # external services.
      struct GatewayProtocolConfiguration
        include JSON::Serializable

        # The configuration for the Model Context Protocol (MCP). This protocol enables communication between
        # Amazon Bedrock Agent and external tools.
        @[JSON::Field(key: "mcp")]
        getter mcp : Types::MCPGatewayConfiguration?

        def initialize(
          @mcp : Types::MCPGatewayConfiguration? = nil
        )
        end
      end

      # Contains summary information about a gateway.
      struct GatewaySummary
        include JSON::Serializable

        # The type of authorizer used by the gateway.
        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String

        # The timestamp when the gateway was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the gateway.
        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The name of the gateway.
        @[JSON::Field(key: "name")]
        getter name : String

        # The protocol type used by the gateway.
        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String

        # The current status of the gateway.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the gateway was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the gateway.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @authorizer_type : String,
          @created_at : Time,
          @gateway_id : String,
          @name : String,
          @protocol_type : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      # The gateway target.
      struct GatewayTarget
        include JSON::Serializable

        # The date and time at which the target was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The provider configurations.
        @[JSON::Field(key: "credentialProviderConfigurations")]
        getter credential_provider_configurations : Array(Types::CredentialProviderConfiguration)

        # The Amazon Resource Name (ARN) of the gateway target.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The name of the gateway target.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the gateway target.
        @[JSON::Field(key: "status")]
        getter status : String

        @[JSON::Field(key: "targetConfiguration")]
        getter target_configuration : Types::TargetConfiguration

        # The target ID.
        @[JSON::Field(key: "targetId")]
        getter target_id : String

        # The date and time at which the target was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description for the gateway target.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The last synchronization time.
        @[JSON::Field(key: "lastSynchronizedAt")]
        getter last_synchronized_at : Time?

        # The metadata configuration for HTTP header and query parameter propagation to and from this gateway
        # target.
        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfiguration?

        # The status reasons for the target status.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        def initialize(
          @created_at : Time,
          @credential_provider_configurations : Array(Types::CredentialProviderConfiguration),
          @gateway_arn : String,
          @name : String,
          @status : String,
          @target_configuration : Types::TargetConfiguration,
          @target_id : String,
          @updated_at : Time,
          @description : String? = nil,
          @last_synchronized_at : Time? = nil,
          @metadata_configuration : Types::MetadataConfiguration? = nil,
          @status_reasons : Array(String)? = nil
        )
        end
      end

      struct GetAgentRuntimeEndpointRequest
        include JSON::Serializable

        # The unique identifier of the AgentCore Runtime associated with the endpoint.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The name of the AgentCore Runtime endpoint to retrieve.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String

        def initialize(
          @agent_runtime_id : String,
          @endpoint_name : String
        )
        end
      end

      struct GetAgentRuntimeEndpointResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The Amazon Resource Name (ARN) of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "agentRuntimeEndpointArn")]
        getter agent_runtime_endpoint_arn : String

        # The timestamp when the AgentCore Runtime endpoint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "id")]
        getter id : String

        # The timestamp when the AgentCore Runtime endpoint was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "status")]
        getter status : String

        # The description of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The reason for failure if the AgentCore Runtime endpoint is in a failed state.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The currently deployed version of the AgentCore Runtime on the endpoint.
        @[JSON::Field(key: "liveVersion")]
        getter live_version : String?

        # The target version of the AgentCore Runtime for the endpoint.
        @[JSON::Field(key: "targetVersion")]
        getter target_version : String?

        def initialize(
          @agent_runtime_arn : String,
          @agent_runtime_endpoint_arn : String,
          @created_at : Time,
          @id : String,
          @last_updated_at : Time,
          @name : String,
          @status : String,
          @description : String? = nil,
          @failure_reason : String? = nil,
          @live_version : String? = nil,
          @target_version : String? = nil
        )
        end
      end

      struct GetAgentRuntimeRequest
        include JSON::Serializable

        # The unique identifier of the AgentCore Runtime to retrieve.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The version of the AgentCore Runtime to retrieve.
        @[JSON::Field(key: "version")]
        getter agent_runtime_version : String?

        def initialize(
          @agent_runtime_id : String,
          @agent_runtime_version : String? = nil
        )
        end
      end

      struct GetAgentRuntimeResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The unique identifier of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The name of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeName")]
        getter agent_runtime_name : String

        # The version of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeVersion")]
        getter agent_runtime_version : String

        # The timestamp when the AgentCore Runtime was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp when the AgentCore Runtime was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The life cycle configuration for the AgentCore Runtime.
        @[JSON::Field(key: "lifecycleConfiguration")]
        getter lifecycle_configuration : Types::LifecycleConfiguration

        # The network configuration for the AgentCore Runtime.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration

        # The IAM role ARN that provides permissions for the AgentCore Runtime.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The current status of the AgentCore Runtime.
        @[JSON::Field(key: "status")]
        getter status : String

        # The artifact of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeArtifact")]
        getter agent_runtime_artifact : Types::AgentRuntimeArtifact?

        # The authorizer configuration for the AgentCore Runtime.
        @[JSON::Field(key: "authorizerConfiguration")]
        getter authorizer_configuration : Types::AuthorizerConfiguration?

        # The description of the AgentCore Runtime.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Environment variables set in the AgentCore Runtime environment.
        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The reason for failure if the AgentCore Runtime is in a failed state.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::ProtocolConfiguration?

        # Configuration for HTTP request headers that will be passed through to the runtime.
        @[JSON::Field(key: "requestHeaderConfiguration")]
        getter request_header_configuration : Types::RequestHeaderConfiguration?

        # The workload identity details for the AgentCore Runtime.
        @[JSON::Field(key: "workloadIdentityDetails")]
        getter workload_identity_details : Types::WorkloadIdentityDetails?

        def initialize(
          @agent_runtime_arn : String,
          @agent_runtime_id : String,
          @agent_runtime_name : String,
          @agent_runtime_version : String,
          @created_at : Time,
          @last_updated_at : Time,
          @lifecycle_configuration : Types::LifecycleConfiguration,
          @network_configuration : Types::NetworkConfiguration,
          @role_arn : String,
          @status : String,
          @agent_runtime_artifact : Types::AgentRuntimeArtifact? = nil,
          @authorizer_configuration : Types::AuthorizerConfiguration? = nil,
          @description : String? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @failure_reason : String? = nil,
          @protocol_configuration : Types::ProtocolConfiguration? = nil,
          @request_header_configuration : Types::RequestHeaderConfiguration? = nil,
          @workload_identity_details : Types::WorkloadIdentityDetails? = nil
        )
        end
      end

      struct GetApiKeyCredentialProviderRequest
        include JSON::Serializable

        # The name of the API key credential provider to retrieve.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetApiKeyCredentialProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the API key secret in AWS Secrets Manager.
        @[JSON::Field(key: "apiKeySecretArn")]
        getter api_key_secret_arn : Types::Secret

        # The timestamp when the API key credential provider was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the API key credential provider.
        @[JSON::Field(key: "credentialProviderArn")]
        getter credential_provider_arn : String

        # The timestamp when the API key credential provider was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the API key credential provider.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @api_key_secret_arn : Types::Secret,
          @created_time : Time,
          @credential_provider_arn : String,
          @last_updated_time : Time,
          @name : String
        )
        end
      end

      struct GetBrowserRequest
        include JSON::Serializable

        # The unique identifier of the browser to retrieve.
        @[JSON::Field(key: "browserId")]
        getter browser_id : String

        def initialize(
          @browser_id : String
        )
        end
      end

      struct GetBrowserResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the browser.
        @[JSON::Field(key: "browserArn")]
        getter browser_arn : String

        # The unique identifier of the browser.
        @[JSON::Field(key: "browserId")]
        getter browser_id : String

        # The timestamp when the browser was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp when the browser was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the browser.
        @[JSON::Field(key: "name")]
        getter name : String

        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::BrowserNetworkConfiguration

        # The current status of the browser.
        @[JSON::Field(key: "status")]
        getter status : String

        # The browser signing configuration that shows whether cryptographic agent identification is enabled
        # for web bot authentication.
        @[JSON::Field(key: "browserSigning")]
        getter browser_signing : Types::BrowserSigningConfigOutput?

        # The description of the browser.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The IAM role ARN that provides permissions for the browser.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The reason for failure if the browser is in a failed state.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        @[JSON::Field(key: "recording")]
        getter recording : Types::RecordingConfig?

        def initialize(
          @browser_arn : String,
          @browser_id : String,
          @created_at : Time,
          @last_updated_at : Time,
          @name : String,
          @network_configuration : Types::BrowserNetworkConfiguration,
          @status : String,
          @browser_signing : Types::BrowserSigningConfigOutput? = nil,
          @description : String? = nil,
          @execution_role_arn : String? = nil,
          @failure_reason : String? = nil,
          @recording : Types::RecordingConfig? = nil
        )
        end
      end

      struct GetCodeInterpreterRequest
        include JSON::Serializable

        # The unique identifier of the code interpreter to retrieve.
        @[JSON::Field(key: "codeInterpreterId")]
        getter code_interpreter_id : String

        def initialize(
          @code_interpreter_id : String
        )
        end
      end

      struct GetCodeInterpreterResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the code interpreter.
        @[JSON::Field(key: "codeInterpreterArn")]
        getter code_interpreter_arn : String

        # The unique identifier of the code interpreter.
        @[JSON::Field(key: "codeInterpreterId")]
        getter code_interpreter_id : String

        # The timestamp when the code interpreter was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp when the code interpreter was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the code interpreter.
        @[JSON::Field(key: "name")]
        getter name : String

        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::CodeInterpreterNetworkConfiguration

        # The current status of the code interpreter.
        @[JSON::Field(key: "status")]
        getter status : String

        # The description of the code interpreter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The IAM role ARN that provides permissions for the code interpreter.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The reason for failure if the code interpreter is in a failed state.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        def initialize(
          @code_interpreter_arn : String,
          @code_interpreter_id : String,
          @created_at : Time,
          @last_updated_at : Time,
          @name : String,
          @network_configuration : Types::CodeInterpreterNetworkConfiguration,
          @status : String,
          @description : String? = nil,
          @execution_role_arn : String? = nil,
          @failure_reason : String? = nil
        )
        end
      end

      struct GetEvaluatorRequest
        include JSON::Serializable

        # The unique identifier of the evaluator to retrieve. Can be a built-in evaluator ID (e.g.,
        # Builtin.Helpfulness) or a custom evaluator ID.
        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        def initialize(
          @evaluator_id : String
        )
        end
      end

      struct GetEvaluatorResponse
        include JSON::Serializable

        # The timestamp when the evaluator was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the evaluator.
        @[JSON::Field(key: "evaluatorArn")]
        getter evaluator_arn : String

        # The configuration of the evaluator, including LLM-as-a-Judge settings for custom evaluators.
        @[JSON::Field(key: "evaluatorConfig")]
        getter evaluator_config : Types::EvaluatorConfig

        # The unique identifier of the evaluator.
        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        # The name of the evaluator.
        @[JSON::Field(key: "evaluatorName")]
        getter evaluator_name : String

        # The evaluation level ( TOOL_CALL , TRACE , or SESSION ) that determines the scope of evaluation.
        @[JSON::Field(key: "level")]
        getter level : String

        # The current status of the evaluator.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the evaluator was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the evaluator.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether the evaluator is locked for modification due to being referenced by active online evaluation
        # configurations.
        @[JSON::Field(key: "lockedForModification")]
        getter locked_for_modification : Bool?

        def initialize(
          @created_at : Time,
          @evaluator_arn : String,
          @evaluator_config : Types::EvaluatorConfig,
          @evaluator_id : String,
          @evaluator_name : String,
          @level : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @locked_for_modification : Bool? = nil
        )
        end
      end

      struct GetGatewayRequest
        include JSON::Serializable

        # The identifier of the gateway to retrieve.
        @[JSON::Field(key: "gatewayIdentifier")]
        getter gateway_identifier : String

        def initialize(
          @gateway_identifier : String
        )
        end
      end

      struct GetGatewayResponse
        include JSON::Serializable

        # Authorizer type for the gateway.
        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String

        # The timestamp when the gateway was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The unique identifier of the gateway.
        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The name of the gateway.
        @[JSON::Field(key: "name")]
        getter name : String

        # Protocol applied to a gateway.
        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String

        # The current status of the gateway.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the gateway was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The authorizer configuration for the gateway.
        @[JSON::Field(key: "authorizerConfiguration")]
        getter authorizer_configuration : Types::AuthorizerConfiguration?

        # The description of the gateway.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The level of detail in error messages returned when invoking the gateway. If the value is DEBUG ,
        # granular exception messages are returned to help a user debug the gateway. If the value is omitted,
        # a generic error message is returned to the end user.
        @[JSON::Field(key: "exceptionLevel")]
        getter exception_level : String?

        # An endpoint for invoking gateway.
        @[JSON::Field(key: "gatewayUrl")]
        getter gateway_url : String?

        # The interceptors configured on the gateway.
        @[JSON::Field(key: "interceptorConfigurations")]
        getter interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the gateway.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The policy engine configuration for the gateway.
        @[JSON::Field(key: "policyEngineConfiguration")]
        getter policy_engine_configuration : Types::GatewayPolicyEngineConfiguration?

        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::GatewayProtocolConfiguration?

        # The IAM role ARN that provides permissions for the gateway.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The reasons for the current status of the gateway.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        # The workload identity details for the gateway.
        @[JSON::Field(key: "workloadIdentityDetails")]
        getter workload_identity_details : Types::WorkloadIdentityDetails?

        def initialize(
          @authorizer_type : String,
          @created_at : Time,
          @gateway_arn : String,
          @gateway_id : String,
          @name : String,
          @protocol_type : String,
          @status : String,
          @updated_at : Time,
          @authorizer_configuration : Types::AuthorizerConfiguration? = nil,
          @description : String? = nil,
          @exception_level : String? = nil,
          @gateway_url : String? = nil,
          @interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)? = nil,
          @kms_key_arn : String? = nil,
          @policy_engine_configuration : Types::GatewayPolicyEngineConfiguration? = nil,
          @protocol_configuration : Types::GatewayProtocolConfiguration? = nil,
          @role_arn : String? = nil,
          @status_reasons : Array(String)? = nil,
          @workload_identity_details : Types::WorkloadIdentityDetails? = nil
        )
        end
      end

      struct GetGatewayTargetRequest
        include JSON::Serializable

        # The identifier of the gateway that contains the target.
        @[JSON::Field(key: "gatewayIdentifier")]
        getter gateway_identifier : String

        # The unique identifier of the target to retrieve.
        @[JSON::Field(key: "targetId")]
        getter target_id : String

        def initialize(
          @gateway_identifier : String,
          @target_id : String
        )
        end
      end

      struct GetGatewayTargetResponse
        include JSON::Serializable

        # The timestamp when the gateway target was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The credential provider configurations for the gateway target.
        @[JSON::Field(key: "credentialProviderConfigurations")]
        getter credential_provider_configurations : Array(Types::CredentialProviderConfiguration)

        # The Amazon Resource Name (ARN) of the gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The name of the gateway target.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the gateway target.
        @[JSON::Field(key: "status")]
        getter status : String

        @[JSON::Field(key: "targetConfiguration")]
        getter target_configuration : Types::TargetConfiguration

        # The unique identifier of the gateway target.
        @[JSON::Field(key: "targetId")]
        getter target_id : String

        # The timestamp when the gateway target was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the gateway target.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The last synchronization of the target.
        @[JSON::Field(key: "lastSynchronizedAt")]
        getter last_synchronized_at : Time?

        # The metadata configuration for HTTP header and query parameter propagation for the retrieved gateway
        # target.
        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfiguration?

        # The reasons for the current status of the gateway target.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        def initialize(
          @created_at : Time,
          @credential_provider_configurations : Array(Types::CredentialProviderConfiguration),
          @gateway_arn : String,
          @name : String,
          @status : String,
          @target_configuration : Types::TargetConfiguration,
          @target_id : String,
          @updated_at : Time,
          @description : String? = nil,
          @last_synchronized_at : Time? = nil,
          @metadata_configuration : Types::MetadataConfiguration? = nil,
          @status_reasons : Array(String)? = nil
        )
        end
      end

      struct GetMemoryInput
        include JSON::Serializable

        # The unique identifier of the memory to retrieve.
        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The level of detail to return for the memory.
        @[JSON::Field(key: "view")]
        getter view : String?

        def initialize(
          @memory_id : String,
          @view : String? = nil
        )
        end
      end

      struct GetMemoryOutput
        include JSON::Serializable

        # The retrieved AgentCore Memory resource details.
        @[JSON::Field(key: "memory")]
        getter memory : Types::Memory

        def initialize(
          @memory : Types::Memory
        )
        end
      end

      struct GetOauth2CredentialProviderRequest
        include JSON::Serializable

        # The name of the OAuth2 credential provider to retrieve.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetOauth2CredentialProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the client secret in AWS Secrets Manager.
        @[JSON::Field(key: "clientSecretArn")]
        getter client_secret_arn : Types::Secret

        # The timestamp when the OAuth2 credential provider was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # ARN of the credential provider requested.
        @[JSON::Field(key: "credentialProviderArn")]
        getter credential_provider_arn : String

        # The vendor of the OAuth2 credential provider.
        @[JSON::Field(key: "credentialProviderVendor")]
        getter credential_provider_vendor : String

        # The timestamp when the OAuth2 credential provider was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the OAuth2 credential provider.
        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration output for the OAuth2 provider.
        @[JSON::Field(key: "oauth2ProviderConfigOutput")]
        getter oauth2_provider_config_output : Types::Oauth2ProviderConfigOutput

        # Callback URL to register on the OAuth2 credential provider as an allowed callback URL. This URL is
        # where the OAuth2 authorization server redirects users after they complete the authorization flow.
        @[JSON::Field(key: "callbackUrl")]
        getter callback_url : String?

        def initialize(
          @client_secret_arn : Types::Secret,
          @created_time : Time,
          @credential_provider_arn : String,
          @credential_provider_vendor : String,
          @last_updated_time : Time,
          @name : String,
          @oauth2_provider_config_output : Types::Oauth2ProviderConfigOutput,
          @callback_url : String? = nil
        )
        end
      end

      struct GetOnlineEvaluationConfigRequest
        include JSON::Serializable

        # The unique identifier of the online evaluation configuration to retrieve.
        @[JSON::Field(key: "onlineEvaluationConfigId")]
        getter online_evaluation_config_id : String

        def initialize(
          @online_evaluation_config_id : String
        )
        end
      end

      struct GetOnlineEvaluationConfigResponse
        include JSON::Serializable

        # The timestamp when the online evaluation configuration was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The data source configuration specifying CloudWatch log groups and service names to monitor.
        @[JSON::Field(key: "dataSourceConfig")]
        getter data_source_config : Types::DataSourceConfig

        # The list of evaluators applied during online evaluation.
        @[JSON::Field(key: "evaluators")]
        getter evaluators : Array(Types::EvaluatorReference)

        # The execution status indicating whether the online evaluation is currently running.
        @[JSON::Field(key: "executionStatus")]
        getter execution_status : String

        # The Amazon Resource Name (ARN) of the online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigArn")]
        getter online_evaluation_config_arn : String

        # The unique identifier of the online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigId")]
        getter online_evaluation_config_id : String

        # The name of the online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigName")]
        getter online_evaluation_config_name : String

        # The evaluation rule containing sampling configuration, filters, and session settings.
        @[JSON::Field(key: "rule")]
        getter rule : Types::Rule

        # The status of the online evaluation configuration.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the online evaluation configuration was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the online evaluation configuration.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the IAM role used for evaluation execution.
        @[JSON::Field(key: "evaluationExecutionRoleArn")]
        getter evaluation_execution_role_arn : String?

        # The reason for failure if the online evaluation configuration execution failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The output configuration specifying where evaluation results are written.
        @[JSON::Field(key: "outputConfig")]
        getter output_config : Types::OutputConfig?

        def initialize(
          @created_at : Time,
          @data_source_config : Types::DataSourceConfig,
          @evaluators : Array(Types::EvaluatorReference),
          @execution_status : String,
          @online_evaluation_config_arn : String,
          @online_evaluation_config_id : String,
          @online_evaluation_config_name : String,
          @rule : Types::Rule,
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @evaluation_execution_role_arn : String? = nil,
          @failure_reason : String? = nil,
          @output_config : Types::OutputConfig? = nil
        )
        end
      end

      struct GetPolicyEngineRequest
        include JSON::Serializable

        # The unique identifier of the policy engine to be retrieved. This must be a valid policy engine ID
        # that exists within the account.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        def initialize(
          @policy_engine_id : String
        )
        end
      end

      struct GetPolicyEngineResponse
        include JSON::Serializable

        # The timestamp when the policy engine was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The customer-assigned name of the policy engine. This is the human-readable identifier that was
        # specified when the policy engine was created.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the policy engine. This globally unique identifier can be used for
        # cross-service references and IAM policy statements.
        @[JSON::Field(key: "policyEngineArn")]
        getter policy_engine_arn : String

        # The unique identifier of the retrieved policy engine. This matches the policy engine ID provided in
        # the request and serves as the system identifier.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The current status of the policy engine.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the policy engine status. This provides details about any failures or
        # the current state of the policy engine.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy engine was last modified. This tracks the most recent changes to the
        # policy engine configuration.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The human-readable description of the policy engine's purpose and scope. This helps administrators
        # understand the policy engine's role in governance.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_engine_arn : String,
          @policy_engine_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct GetPolicyGenerationRequest
        include JSON::Serializable

        # The identifier of the policy engine associated with the policy generation request. This provides the
        # context for the generation operation and schema validation.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier of the policy generation request to be retrieved. This must be a valid
        # generation ID from a previous StartPolicyGeneration call.
        @[JSON::Field(key: "policyGenerationId")]
        getter policy_generation_id : String

        def initialize(
          @policy_engine_id : String,
          @policy_generation_id : String
        )
        end
      end

      struct GetPolicyGenerationResponse
        include JSON::Serializable

        # The timestamp when the policy generation request was created. This is used for tracking and auditing
        # generation operations and their lifecycle.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The customer-assigned name for the policy generation request. This helps identify and track
        # generation operations across multiple requests.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the policy engine associated with this policy generation. This confirms the policy
        # engine context for the generation operation.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The Amazon Resource Name (ARN) of the policy generation. This globally unique identifier can be used
        # for tracking, auditing, and cross-service references.
        @[JSON::Field(key: "policyGenerationArn")]
        getter policy_generation_arn : String

        # The unique identifier of the policy generation request. This matches the generation ID provided in
        # the request and serves as the tracking identifier.
        @[JSON::Field(key: "policyGenerationId")]
        getter policy_generation_id : String

        # The resource information associated with the policy generation. This provides context about the
        # target resources for which the policies are being generated.
        @[JSON::Field(key: "resource")]
        getter resource : Types::Resource

        # The current status of the policy generation. This indicates whether the generation is in progress,
        # completed successfully, or failed during processing.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the generation status. This provides details about any failures,
        # warnings, or the current state of the generation process.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy generation was last updated. This tracks the progress of the
        # generation process and any status changes.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The findings and results from the policy generation process. This includes any issues,
        # recommendations, validation results, or insights from the generated policies.
        @[JSON::Field(key: "findings")]
        getter findings : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_engine_id : String,
          @policy_generation_arn : String,
          @policy_generation_id : String,
          @resource : Types::Resource,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @findings : String? = nil
        )
        end
      end

      struct GetPolicyRequest
        include JSON::Serializable

        # The identifier of the policy engine that manages the policy to be retrieved.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier of the policy to be retrieved. This must be a valid policy ID that exists
        # within the specified policy engine.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        def initialize(
          @policy_engine_id : String,
          @policy_id : String
        )
        end
      end

      struct GetPolicyResponse
        include JSON::Serializable

        # The timestamp when the policy was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Cedar policy statement that defines the access control rules. This contains the actual policy
        # logic used for agent behavior control and access decisions.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinition

        # The customer-assigned name of the policy. This is the human-readable identifier that was specified
        # when the policy was created.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the policy. This globally unique identifier can be used for
        # cross-service references and IAM policy statements.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The identifier of the policy engine that manages this policy. This confirms the policy engine
        # context for the retrieved policy.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier of the retrieved policy. This matches the policy ID provided in the request
        # and serves as the system identifier for the policy.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The current status of the policy.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the policy status. This provides details about any failures or the
        # current state of the policy.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy was last modified. This tracks the most recent changes to the policy
        # configuration.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The human-readable description of the policy's purpose and functionality. This helps administrators
        # understand and manage the policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @definition : Types::PolicyDefinition,
          @name : String,
          @policy_arn : String,
          @policy_engine_id : String,
          @policy_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which to retrieve the resource policy.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The resource policy associated with the specified resource.
        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      struct GetTokenVaultRequest
        include JSON::Serializable

        # The unique identifier of the token vault to retrieve.
        @[JSON::Field(key: "tokenVaultId")]
        getter token_vault_id : String?

        def initialize(
          @token_vault_id : String? = nil
        )
        end
      end

      struct GetTokenVaultResponse
        include JSON::Serializable

        # The KMS configuration for the token vault.
        @[JSON::Field(key: "kmsConfiguration")]
        getter kms_configuration : Types::KmsConfiguration

        # The timestamp when the token vault was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time

        # The ID of the token vault.
        @[JSON::Field(key: "tokenVaultId")]
        getter token_vault_id : String

        def initialize(
          @kms_configuration : Types::KmsConfiguration,
          @last_modified_date : Time,
          @token_vault_id : String
        )
        end
      end

      struct GetWorkloadIdentityRequest
        include JSON::Serializable

        # The name of the workload identity to retrieve.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetWorkloadIdentityResponse
        include JSON::Serializable

        # The timestamp when the workload identity was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The timestamp when the workload identity was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the workload identity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the workload identity.
        @[JSON::Field(key: "workloadIdentityArn")]
        getter workload_identity_arn : String

        # The list of allowed OAuth2 return URLs for resources associated with this workload identity.
        @[JSON::Field(key: "allowedResourceOauth2ReturnUrls")]
        getter allowed_resource_oauth2_return_urls : Array(String)?

        def initialize(
          @created_time : Time,
          @last_updated_time : Time,
          @name : String,
          @workload_identity_arn : String,
          @allowed_resource_oauth2_return_urls : Array(String)? = nil
        )
        end
      end

      # Input configuration for a GitHub OAuth2 provider.
      struct GithubOauth2ProviderConfigInput
        include JSON::Serializable

        # The client ID for the GitHub OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret for the GitHub OAuth2 provider.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        def initialize(
          @client_id : String,
          @client_secret : String
        )
        end
      end

      # Output configuration for a GitHub OAuth2 provider.
      struct GithubOauth2ProviderConfigOutput
        include JSON::Serializable

        # The OAuth2 discovery information for the GitHub provider.
        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        # The client ID for the GitHub OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @oauth_discovery : Types::Oauth2Discovery,
          @client_id : String? = nil
        )
        end
      end

      # Input configuration for a Google OAuth2 provider.
      struct GoogleOauth2ProviderConfigInput
        include JSON::Serializable

        # The client ID for the Google OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret for the Google OAuth2 provider.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        def initialize(
          @client_id : String,
          @client_secret : String
        )
        end
      end

      # Output configuration for a Google OAuth2 provider.
      struct GoogleOauth2ProviderConfigOutput
        include JSON::Serializable

        # The OAuth2 discovery information for the Google provider.
        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        # The client ID for the Google OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @oauth_discovery : Types::Oauth2Discovery,
          @client_id : String? = nil
        )
        end
      end

      # Configuration settings for connecting to a supported OAuth2 provider. This includes client
      # credentials and OAuth2 discovery information for providers that have built-in support.
      struct IncludedOauth2ProviderConfigInput
        include JSON::Serializable

        # The client ID for the supported OAuth2 provider. This identifier is assigned by the OAuth2 provider
        # when you register your application.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret for the supported OAuth2 provider. This secret is assigned by the OAuth2 provider
        # and used along with the client ID to authenticate your application.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        # OAuth2 authorization endpoint for your isolated OAuth2 application tenant. This is where users are
        # redirected to authenticate and authorize access to their resources.
        @[JSON::Field(key: "authorizationEndpoint")]
        getter authorization_endpoint : String?

        # Token issuer of your isolated OAuth2 application tenant. This URL identifies the authorization
        # server that issues tokens for this provider.
        @[JSON::Field(key: "issuer")]
        getter issuer : String?

        # OAuth2 token endpoint for your isolated OAuth2 application tenant. This is where authorization codes
        # are exchanged for access tokens.
        @[JSON::Field(key: "tokenEndpoint")]
        getter token_endpoint : String?

        def initialize(
          @client_id : String,
          @client_secret : String,
          @authorization_endpoint : String? = nil,
          @issuer : String? = nil,
          @token_endpoint : String? = nil
        )
        end
      end

      # The configuration details returned for a supported OAuth2 provider, including client credentials and
      # OAuth2 discovery information.
      struct IncludedOauth2ProviderConfigOutput
        include JSON::Serializable

        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        # The client ID for the supported OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @oauth_discovery : Types::Oauth2Discovery,
          @client_id : String? = nil
        )
        end
      end

      # The configuration parameters that control how the foundation model behaves during evaluation,
      # including response generation settings.
      struct InferenceConfiguration
        include JSON::Serializable

        # The maximum number of tokens to generate in the model response during evaluation.
        @[JSON::Field(key: "maxTokens")]
        getter max_tokens : Int32?

        # The list of sequences that will cause the model to stop generating tokens when encountered.
        @[JSON::Field(key: "stopSequences")]
        getter stop_sequences : Array(String)?

        # The temperature value that controls randomness in the model's responses. Lower values produce more
        # deterministic outputs.
        @[JSON::Field(key: "temperature")]
        getter temperature : Float64?

        # The top-p sampling parameter that controls the diversity of the model's responses by limiting the
        # cumulative probability of token choices.
        @[JSON::Field(key: "topP")]
        getter top_p : Float64?

        def initialize(
          @max_tokens : Int32? = nil,
          @stop_sequences : Array(String)? = nil,
          @temperature : Float64? = nil,
          @top_p : Float64? = nil
        )
        end
      end

      # The interceptor configuration.
      struct InterceptorConfiguration
        include JSON::Serializable

        # The details of the lambda function used for the interceptor.
        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaInterceptorConfiguration?

        def initialize(
          @lambda : Types::LambdaInterceptorConfiguration? = nil
        )
        end
      end

      # The input configuration of the interceptor.
      struct InterceptorInputConfiguration
        include JSON::Serializable

        # Indicates whether to pass request headers as input into the interceptor. When set to true, request
        # headers will be passed.
        @[JSON::Field(key: "passRequestHeaders")]
        getter pass_request_headers : Bool

        def initialize(
          @pass_request_headers : Bool
        )
        end
      end

      # This exception is thrown if there was an unexpected error during processing of request
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration to invoke a self-managed memory processing pipeline with.
      struct InvocationConfiguration
        include JSON::Serializable

        # The S3 bucket name for event payload delivery.
        @[JSON::Field(key: "payloadDeliveryBucketName")]
        getter payload_delivery_bucket_name : String

        # The ARN of the SNS topic for job notifications.
        @[JSON::Field(key: "topicArn")]
        getter topic_arn : String

        def initialize(
          @payload_delivery_bucket_name : String,
          @topic_arn : String
        )
        end
      end

      # The configuration to invoke a self-managed memory processing pipeline with.
      struct InvocationConfigurationInput
        include JSON::Serializable

        # The S3 bucket name for event payload delivery.
        @[JSON::Field(key: "payloadDeliveryBucketName")]
        getter payload_delivery_bucket_name : String

        # The ARN of the SNS topic for job notifications.
        @[JSON::Field(key: "topicArn")]
        getter topic_arn : String

        def initialize(
          @payload_delivery_bucket_name : String,
          @topic_arn : String
        )
        end
      end

      # Contains the KMS configuration for a resource.
      struct KmsConfiguration
        include JSON::Serializable

        # The type of KMS key (CustomerManagedKey or ServiceManagedKey).
        @[JSON::Field(key: "keyType")]
        getter key_type : String

        # The Amazon Resource Name (ARN) of the KMS key.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @key_type : String,
          @kms_key_arn : String? = nil
        )
        end
      end

      # The lambda configuration for the interceptor
      struct LambdaInterceptorConfiguration
        include JSON::Serializable

        # The arn of the lambda function to be invoked for the interceptor.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # LifecycleConfiguration lets you manage the lifecycle of runtime sessions and resources in AgentCore
      # Runtime. This configuration helps optimize resource utilization by automatically cleaning up idle
      # sessions and preventing long-running instances from consuming resources indefinitely.
      struct LifecycleConfiguration
        include JSON::Serializable

        # Timeout in seconds for idle runtime sessions. When a session remains idle for this duration, it will
        # be automatically terminated. Default: 900 seconds (15 minutes).
        @[JSON::Field(key: "idleRuntimeSessionTimeout")]
        getter idle_runtime_session_timeout : Int32?

        # Maximum lifetime for the instance in seconds. Once reached, instances will be automatically
        # terminated and replaced. Default: 28800 seconds (8 hours).
        @[JSON::Field(key: "maxLifetime")]
        getter max_lifetime : Int32?

        def initialize(
          @idle_runtime_session_timeout : Int32? = nil,
          @max_lifetime : Int32? = nil
        )
        end
      end

      # Configuration settings for connecting to LinkedIn services using OAuth2 authentication. This
      # includes the client credentials required to authenticate with LinkedIn's OAuth2 authorization
      # server.
      struct LinkedinOauth2ProviderConfigInput
        include JSON::Serializable

        # The client ID for the LinkedIn OAuth2 provider. This identifier is assigned by LinkedIn when you
        # register your application.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret for the LinkedIn OAuth2 provider. This secret is assigned by LinkedIn and used
        # along with the client ID to authenticate your application.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        def initialize(
          @client_id : String,
          @client_secret : String
        )
        end
      end

      # The configuration details returned for a LinkedIn OAuth2 provider, including the client ID and
      # OAuth2 discovery information.
      struct LinkedinOauth2ProviderConfigOutput
        include JSON::Serializable

        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        # The client ID for the LinkedIn OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @oauth_discovery : Types::Oauth2Discovery,
          @client_id : String? = nil
        )
        end
      end

      struct ListAgentRuntimeEndpointsRequest
        include JSON::Serializable

        # The unique identifier of the AgentCore Runtime to list endpoints for.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_runtime_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAgentRuntimeEndpointsResponse
        include JSON::Serializable

        # The list of AgentCore Runtime endpoints.
        @[JSON::Field(key: "runtimeEndpoints")]
        getter runtime_endpoints : Array(Types::AgentRuntimeEndpoint)

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @runtime_endpoints : Array(Types::AgentRuntimeEndpoint),
          @next_token : String? = nil
        )
        end
      end

      struct ListAgentRuntimeVersionsRequest
        include JSON::Serializable

        # The unique identifier of the AgentCore Runtime to list versions for.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_runtime_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAgentRuntimeVersionsResponse
        include JSON::Serializable

        # The list of AgentCore Runtime versions.
        @[JSON::Field(key: "agentRuntimes")]
        getter agent_runtimes : Array(Types::AgentRuntime)

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_runtimes : Array(Types::AgentRuntime),
          @next_token : String? = nil
        )
        end
      end

      struct ListAgentRuntimesRequest
        include JSON::Serializable

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAgentRuntimesResponse
        include JSON::Serializable

        # The list of AgentCore Runtime resources.
        @[JSON::Field(key: "agentRuntimes")]
        getter agent_runtimes : Array(Types::AgentRuntime)

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_runtimes : Array(Types::AgentRuntime),
          @next_token : String? = nil
        )
        end
      end

      struct ListApiKeyCredentialProvidersRequest
        include JSON::Serializable

        # Maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListApiKeyCredentialProvidersResponse
        include JSON::Serializable

        # The list of API key credential providers.
        @[JSON::Field(key: "credentialProviders")]
        getter credential_providers : Array(Types::ApiKeyCredentialProviderItem)

        # Pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @credential_providers : Array(Types::ApiKeyCredentialProviderItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListBrowsersRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call. The default value is 10. The maximum value
        # is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of browsers to list. If not specified, all browser types are returned.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListBrowsersResponse
        include JSON::Serializable

        # The list of browser summaries.
        @[JSON::Field(key: "browserSummaries")]
        getter browser_summaries : Array(Types::BrowserSummary)

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @browser_summaries : Array(Types::BrowserSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListCodeInterpretersRequest
        include JSON::Serializable

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of code interpreters to list.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListCodeInterpretersResponse
        include JSON::Serializable

        # The list of code interpreter summaries.
        @[JSON::Field(key: "codeInterpreterSummaries")]
        getter code_interpreter_summaries : Array(Types::CodeInterpreterSummary)

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @code_interpreter_summaries : Array(Types::CodeInterpreterSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListEvaluatorsRequest
        include JSON::Serializable

        # The maximum number of evaluators to return in a single response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEvaluatorsResponse
        include JSON::Serializable

        # The list of evaluator summaries containing basic information about each evaluator.
        @[JSON::Field(key: "evaluators")]
        getter evaluators : Array(Types::EvaluatorSummary)

        # The pagination token to use in a subsequent request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @evaluators : Array(Types::EvaluatorSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListGatewayTargetsRequest
        include JSON::Serializable

        # The identifier of the gateway to list targets for.
        @[JSON::Field(key: "gatewayIdentifier")]
        getter gateway_identifier : String

        # The maximum number of results to return in the response. If the total number of results is greater
        # than this value, use the token returned in the response in the nextToken field when making another
        # request to return the next batch of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the total number of results is greater than the maxResults value provided in the request, enter
        # the token returned in the nextToken field in the response in this field to return the next batch of
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @gateway_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGatewayTargetsResponse
        include JSON::Serializable

        # The list of gateway target summaries.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::TargetSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::TargetSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListGatewaysRequest
        include JSON::Serializable

        # The maximum number of results to return in the response. If the total number of results is greater
        # than this value, use the token returned in the response in the nextToken field when making another
        # request to return the next batch of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the total number of results is greater than the maxResults value provided in the request, enter
        # the token returned in the nextToken field in the response in this field to return the next batch of
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGatewaysResponse
        include JSON::Serializable

        # The list of gateway summaries.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::GatewaySummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::GatewaySummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListMemoriesInput
        include JSON::Serializable

        # The maximum number of results to return in a single call. The default value is 10. The maximum value
        # is 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMemoriesOutput
        include JSON::Serializable

        # The list of AgentCore Memory resource summaries.
        @[JSON::Field(key: "memories")]
        getter memories : Array(Types::MemorySummary)

        # A token to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @memories : Array(Types::MemorySummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListOauth2CredentialProvidersRequest
        include JSON::Serializable

        # Maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOauth2CredentialProvidersResponse
        include JSON::Serializable

        # The list of OAuth2 credential providers.
        @[JSON::Field(key: "credentialProviders")]
        getter credential_providers : Array(Types::Oauth2CredentialProviderItem)

        # Pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @credential_providers : Array(Types::Oauth2CredentialProviderItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListOnlineEvaluationConfigsRequest
        include JSON::Serializable

        # The maximum number of online evaluation configurations to return in a single response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOnlineEvaluationConfigsResponse
        include JSON::Serializable

        # The list of online evaluation configuration summaries containing basic information about each
        # configuration.
        @[JSON::Field(key: "onlineEvaluationConfigs")]
        getter online_evaluation_configs : Array(Types::OnlineEvaluationConfigSummary)

        # The pagination token to use in a subsequent request to retrieve the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @online_evaluation_configs : Array(Types::OnlineEvaluationConfigSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListPoliciesRequest
        include JSON::Serializable

        # The identifier of the policy engine whose policies to retrieve.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The maximum number of policies to return in a single response. If not specified, the default is 10
        # policies per page, with a maximum of 100 per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token returned from a previous ListPolicies call. Use this token to retrieve the next
        # page of results when the response is paginated.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional filter to list policies that apply to a specific resource scope or resource type. This
        # helps narrow down policy results to those relevant for particular Amazon Web Services resources,
        # agent tools, or operational contexts within the policy engine ecosystem.
        @[JSON::Field(key: "targetResourceScope")]
        getter target_resource_scope : String?

        def initialize(
          @policy_engine_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @target_resource_scope : String? = nil
        )
        end
      end

      struct ListPoliciesResponse
        include JSON::Serializable

        # An array of policy objects that match the specified criteria. Each policy object contains the policy
        # metadata, status, and key identifiers for further operations.
        @[JSON::Field(key: "policies")]
        getter policies : Array(Types::Policy)

        # A pagination token that can be used in subsequent ListPolicies calls to retrieve additional results.
        # This token is only present when there are more results available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policies : Array(Types::Policy),
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyEnginesRequest
        include JSON::Serializable

        # The maximum number of policy engines to return in a single response. If not specified, the default
        # is 10 policy engines per page, with a maximum of 100 per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token returned from a previous ListPolicyEngines call. Use this token to retrieve the
        # next page of results when the response is paginated.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyEnginesResponse
        include JSON::Serializable

        # An array of policy engine objects that exist in the account. Each policy engine object contains the
        # engine metadata, status, and key identifiers for further operations.
        @[JSON::Field(key: "policyEngines")]
        getter policy_engines : Array(Types::PolicyEngine)

        # A pagination token that can be used in subsequent ListPolicyEngines calls to retrieve additional
        # results. This token is only present when there are more results available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_engines : Array(Types::PolicyEngine),
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyGenerationAssetsRequest
        include JSON::Serializable

        # The unique identifier of the policy engine associated with the policy generation request. This
        # provides the context for the generation operation and ensures assets are retrieved from the correct
        # policy engine.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier of the policy generation request whose assets are to be retrieved. This must
        # be a valid generation ID from a previous StartPolicyGeneration call that has completed processing.
        @[JSON::Field(key: "policyGenerationId")]
        getter policy_generation_id : String

        # The maximum number of policy generation assets to return in a single response. If not specified, the
        # default is 10 assets per page, with a maximum of 100 per page. This helps control response size when
        # dealing with policy generations that produce many alternative policy options.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token returned from a previous ListPolicyGenerationAssets call. Use this token to
        # retrieve the next page of assets when the response is paginated due to large numbers of generated
        # policy options.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_engine_id : String,
          @policy_generation_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyGenerationAssetsResponse
        include JSON::Serializable

        # A pagination token that can be used in subsequent ListPolicyGenerationAssets calls to retrieve
        # additional assets. This token is only present when there are more generated policy assets available
        # beyond the current response.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of generated policy assets including Cedar policies and related artifacts from the
        # AI-powered policy generation process. Each asset represents a different policy option or variation
        # generated from the original natural language input.
        @[JSON::Field(key: "policyGenerationAssets")]
        getter policy_generation_assets : Array(Types::PolicyGenerationAsset)?

        def initialize(
          @next_token : String? = nil,
          @policy_generation_assets : Array(Types::PolicyGenerationAsset)? = nil
        )
        end
      end

      struct ListPolicyGenerationsRequest
        include JSON::Serializable

        # The identifier of the policy engine whose policy generations to retrieve.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The maximum number of policy generations to return in a single response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for retrieving additional policy generations when results are paginated.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_engine_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyGenerationsResponse
        include JSON::Serializable

        # An array of policy generation objects that match the specified criteria.
        @[JSON::Field(key: "policyGenerations")]
        getter policy_generations : Array(Types::PolicyGeneration)

        # A pagination token for retrieving additional policy generations if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_generations : Array(Types::PolicyGeneration),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to list tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListWorkloadIdentitiesRequest
        include JSON::Serializable

        # Maximum number of results to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkloadIdentitiesResponse
        include JSON::Serializable

        # The list of workload identities.
        @[JSON::Field(key: "workloadIdentities")]
        getter workload_identities : Array(Types::WorkloadIdentityType)

        # Pagination token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workload_identities : Array(Types::WorkloadIdentityType),
          @next_token : String? = nil
        )
        end
      end

      # The configuration for LLM-as-a-Judge evaluation that uses a language model to assess agent
      # performance based on custom instructions and rating scales.
      struct LlmAsAJudgeEvaluatorConfig
        include JSON::Serializable

        # The evaluation instructions that guide the language model in assessing agent performance, including
        # criteria and evaluation guidelines.
        @[JSON::Field(key: "instructions")]
        getter instructions : String

        # The model configuration that specifies which foundation model to use and how to configure it for
        # evaluation.
        @[JSON::Field(key: "modelConfig")]
        getter model_config : Types::EvaluatorModelConfig

        # The rating scale that defines how the evaluator should score agent performance, either numerical or
        # categorical.
        @[JSON::Field(key: "ratingScale")]
        getter rating_scale : Types::RatingScale

        def initialize(
          @instructions : String,
          @model_config : Types::EvaluatorModelConfig,
          @rating_scale : Types::RatingScale
        )
        end
      end

      # The configuration for a Model Context Protocol (MCP) gateway. This structure defines how the gateway
      # implements the MCP protocol.
      struct MCPGatewayConfiguration
        include JSON::Serializable

        # The instructions for using the Model Context Protocol gateway. These instructions provide guidance
        # on how to interact with the gateway.
        @[JSON::Field(key: "instructions")]
        getter instructions : String?

        # The search type for the Model Context Protocol gateway. This field specifies how the gateway handles
        # search operations.
        @[JSON::Field(key: "searchType")]
        getter search_type : String?

        # The supported versions of the Model Context Protocol. This field specifies which versions of the
        # protocol the gateway can use.
        @[JSON::Field(key: "supportedVersions")]
        getter supported_versions : Array(String)?

        def initialize(
          @instructions : String? = nil,
          @search_type : String? = nil,
          @supported_versions : Array(String)? = nil
        )
        end
      end

      # The Lambda configuration for a Model Context Protocol target. This structure defines how the gateway
      # uses a Lambda function to communicate with the target.
      struct McpLambdaTargetConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda function. This function is invoked by the gateway to
        # communicate with the target.
        @[JSON::Field(key: "lambdaArn")]
        getter lambda_arn : String

        # The tool schema for the Lambda function. This schema defines the structure of the tools that the
        # Lambda function provides.
        @[JSON::Field(key: "toolSchema")]
        getter tool_schema : Types::ToolSchema

        def initialize(
          @lambda_arn : String,
          @tool_schema : Types::ToolSchema
        )
        end
      end

      # The target configuration for the MCP server.
      struct McpServerTargetConfiguration
        include JSON::Serializable

        # The endpoint for the MCP server target configuration.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        def initialize(
          @endpoint : String
        )
        end
      end

      # The Model Context Protocol (MCP) configuration for a target. This structure defines how the gateway
      # uses MCP to communicate with the target.
      struct McpTargetConfiguration
        include JSON::Serializable

        # The configuration for an Amazon API Gateway target.
        @[JSON::Field(key: "apiGateway")]
        getter api_gateway : Types::ApiGatewayTargetConfiguration?

        # The Lambda configuration for the Model Context Protocol target. This configuration defines how the
        # gateway uses a Lambda function to communicate with the target.
        @[JSON::Field(key: "lambda")]
        getter lambda : Types::McpLambdaTargetConfiguration?

        # The MCP server specified as the gateway target.
        @[JSON::Field(key: "mcpServer")]
        getter mcp_server : Types::McpServerTargetConfiguration?

        # The OpenAPI schema for the Model Context Protocol target. This schema defines the API structure of
        # the target.
        @[JSON::Field(key: "openApiSchema")]
        getter open_api_schema : Types::ApiSchemaConfiguration?

        # The Smithy model for the Model Context Protocol target. This model defines the API structure of the
        # target using the Smithy specification.
        @[JSON::Field(key: "smithyModel")]
        getter smithy_model : Types::ApiSchemaConfiguration?

        def initialize(
          @api_gateway : Types::ApiGatewayTargetConfiguration? = nil,
          @lambda : Types::McpLambdaTargetConfiguration? = nil,
          @mcp_server : Types::McpServerTargetConfiguration? = nil,
          @open_api_schema : Types::ApiSchemaConfiguration? = nil,
          @smithy_model : Types::ApiSchemaConfiguration? = nil
        )
        end
      end

      # Contains information about a memory resource.
      struct Memory
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the memory.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The timestamp when the memory was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The number of days after which memory events will expire.
        @[JSON::Field(key: "eventExpiryDuration")]
        getter event_expiry_duration : Int32

        # The unique identifier of the memory.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the memory.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the memory.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the memory was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the memory.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the KMS key used to encrypt the memory.
        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # The reason for failure if the memory is in a failed state.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ARN of the IAM role that provides permissions for the memory.
        @[JSON::Field(key: "memoryExecutionRoleArn")]
        getter memory_execution_role_arn : String?

        # The list of memory strategies associated with this memory.
        @[JSON::Field(key: "strategies")]
        getter strategies : Array(Types::MemoryStrategy)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @event_expiry_duration : Int32,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @encryption_key_arn : String? = nil,
          @failure_reason : String? = nil,
          @memory_execution_role_arn : String? = nil,
          @strategies : Array(Types::MemoryStrategy)? = nil
        )
        end
      end

      # Contains information about a memory strategy.
      struct MemoryStrategy
        include JSON::Serializable

        # The name of the memory strategy.
        @[JSON::Field(key: "name")]
        getter name : String

        # The namespaces associated with the memory strategy.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)

        # The unique identifier of the memory strategy.
        @[JSON::Field(key: "strategyId")]
        getter strategy_id : String

        # The type of the memory strategy.
        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration of the memory strategy.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::StrategyConfiguration?

        # The timestamp when the memory strategy was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the memory strategy.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The current status of the memory strategy.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp when the memory strategy was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @name : String,
          @namespaces : Array(String),
          @strategy_id : String,
          @type : String,
          @configuration : Types::StrategyConfiguration? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Contains input information for creating a memory strategy.
      struct MemoryStrategyInput
        include JSON::Serializable

        # Input for creating a custom memory strategy.
        @[JSON::Field(key: "customMemoryStrategy")]
        getter custom_memory_strategy : Types::CustomMemoryStrategyInput?

        # Input for creating an episodic memory strategy
        @[JSON::Field(key: "episodicMemoryStrategy")]
        getter episodic_memory_strategy : Types::EpisodicMemoryStrategyInput?

        # Input for creating a semantic memory strategy.
        @[JSON::Field(key: "semanticMemoryStrategy")]
        getter semantic_memory_strategy : Types::SemanticMemoryStrategyInput?

        # Input for creating a summary memory strategy.
        @[JSON::Field(key: "summaryMemoryStrategy")]
        getter summary_memory_strategy : Types::SummaryMemoryStrategyInput?

        # Input for creating a user preference memory strategy.
        @[JSON::Field(key: "userPreferenceMemoryStrategy")]
        getter user_preference_memory_strategy : Types::UserPreferenceMemoryStrategyInput?

        def initialize(
          @custom_memory_strategy : Types::CustomMemoryStrategyInput? = nil,
          @episodic_memory_strategy : Types::EpisodicMemoryStrategyInput? = nil,
          @semantic_memory_strategy : Types::SemanticMemoryStrategyInput? = nil,
          @summary_memory_strategy : Types::SummaryMemoryStrategyInput? = nil,
          @user_preference_memory_strategy : Types::UserPreferenceMemoryStrategyInput? = nil
        )
        end
      end

      # Contains summary information about a memory resource.
      struct MemorySummary
        include JSON::Serializable

        # The timestamp when the memory was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp when the memory was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The Amazon Resource Name (ARN) of the memory.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique identifier of the memory.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The current status of the memory.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_at : Time,
          @updated_at : Time,
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The trigger configuration based on a message.
      struct MessageBasedTrigger
        include JSON::Serializable

        # The number of messages that trigger memory processing.
        @[JSON::Field(key: "messageCount")]
        getter message_count : Int32?

        def initialize(
          @message_count : Int32? = nil
        )
        end
      end

      # The trigger configuration based on a message.
      struct MessageBasedTriggerInput
        include JSON::Serializable

        # The number of messages that trigger memory processing.
        @[JSON::Field(key: "messageCount")]
        getter message_count : Int32?

        def initialize(
          @message_count : Int32? = nil
        )
        end
      end

      # Configuration for HTTP header and query parameter propagation between the gateway and target
      # servers.
      struct MetadataConfiguration
        include JSON::Serializable

        # A list of URL query parameters that are allowed to be propagated from incoming gateway URL to the
        # target.
        @[JSON::Field(key: "allowedQueryParameters")]
        getter allowed_query_parameters : Array(String)?

        # A list of HTTP headers that are allowed to be propagated from incoming client requests to the
        # target.
        @[JSON::Field(key: "allowedRequestHeaders")]
        getter allowed_request_headers : Array(String)?

        # A list of HTTP headers that are allowed to be propagated from the target response back to the
        # client.
        @[JSON::Field(key: "allowedResponseHeaders")]
        getter allowed_response_headers : Array(String)?

        def initialize(
          @allowed_query_parameters : Array(String)? = nil,
          @allowed_request_headers : Array(String)? = nil,
          @allowed_response_headers : Array(String)? = nil
        )
        end
      end

      # Input configuration for a Microsoft OAuth2 provider.
      struct MicrosoftOauth2ProviderConfigInput
        include JSON::Serializable

        # The client ID for the Microsoft OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret for the Microsoft OAuth2 provider.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        # The Microsoft Entra ID (formerly Azure AD) tenant ID for your organization. This identifies the
        # specific tenant within Microsoft's identity platform where your application is registered.
        @[JSON::Field(key: "tenantId")]
        getter tenant_id : String?

        def initialize(
          @client_id : String,
          @client_secret : String,
          @tenant_id : String? = nil
        )
        end
      end

      # Output configuration for a Microsoft OAuth2 provider.
      struct MicrosoftOauth2ProviderConfigOutput
        include JSON::Serializable

        # The OAuth2 discovery information for the Microsoft provider.
        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        # The client ID for the Microsoft OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @oauth_discovery : Types::Oauth2Discovery,
          @client_id : String? = nil
        )
        end
      end

      # Contains information for modifying a consolidation configuration.
      struct ModifyConsolidationConfiguration
        include JSON::Serializable

        # The updated custom consolidation configuration.
        @[JSON::Field(key: "customConsolidationConfiguration")]
        getter custom_consolidation_configuration : Types::CustomConsolidationConfigurationInput?

        def initialize(
          @custom_consolidation_configuration : Types::CustomConsolidationConfigurationInput? = nil
        )
        end
      end

      # Contains information for modifying an extraction configuration.
      struct ModifyExtractionConfiguration
        include JSON::Serializable

        # The updated custom extraction configuration.
        @[JSON::Field(key: "customExtractionConfiguration")]
        getter custom_extraction_configuration : Types::CustomExtractionConfigurationInput?

        def initialize(
          @custom_extraction_configuration : Types::CustomExtractionConfigurationInput? = nil
        )
        end
      end

      # The configuration for updating invocation settings.
      struct ModifyInvocationConfigurationInput
        include JSON::Serializable

        # The updated S3 bucket name for event payload delivery.
        @[JSON::Field(key: "payloadDeliveryBucketName")]
        getter payload_delivery_bucket_name : String?

        # The updated ARN of the SNS topic for job notifications.
        @[JSON::Field(key: "topicArn")]
        getter topic_arn : String?

        def initialize(
          @payload_delivery_bucket_name : String? = nil,
          @topic_arn : String? = nil
        )
        end
      end

      # Contains information for modifying memory strategies.
      struct ModifyMemoryStrategies
        include JSON::Serializable

        # The list of memory strategies to add.
        @[JSON::Field(key: "addMemoryStrategies")]
        getter add_memory_strategies : Array(Types::MemoryStrategyInput)?

        # The list of memory strategies to delete.
        @[JSON::Field(key: "deleteMemoryStrategies")]
        getter delete_memory_strategies : Array(Types::DeleteMemoryStrategyInput)?

        # The list of memory strategies to modify.
        @[JSON::Field(key: "modifyMemoryStrategies")]
        getter modify_memory_strategies : Array(Types::ModifyMemoryStrategyInput)?

        def initialize(
          @add_memory_strategies : Array(Types::MemoryStrategyInput)? = nil,
          @delete_memory_strategies : Array(Types::DeleteMemoryStrategyInput)? = nil,
          @modify_memory_strategies : Array(Types::ModifyMemoryStrategyInput)? = nil
        )
        end
      end

      # Input for modifying a memory strategy.
      struct ModifyMemoryStrategyInput
        include JSON::Serializable

        # The unique identifier of the memory strategy to modify.
        @[JSON::Field(key: "memoryStrategyId")]
        getter memory_strategy_id : String

        # The updated configuration for the memory strategy.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ModifyStrategyConfiguration?

        # The updated description of the memory strategy.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated namespaces for the memory strategy.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        def initialize(
          @memory_strategy_id : String,
          @configuration : Types::ModifyStrategyConfiguration? = nil,
          @description : String? = nil,
          @namespaces : Array(String)? = nil
        )
        end
      end

      # Contains information for modifying a reflection configuration.
      struct ModifyReflectionConfiguration
        include JSON::Serializable

        # The updated custom reflection configuration.
        @[JSON::Field(key: "customReflectionConfiguration")]
        getter custom_reflection_configuration : Types::CustomReflectionConfigurationInput?

        # The updated episodic reflection configuration.
        @[JSON::Field(key: "episodicReflectionConfiguration")]
        getter episodic_reflection_configuration : Types::EpisodicReflectionConfigurationInput?

        def initialize(
          @custom_reflection_configuration : Types::CustomReflectionConfigurationInput? = nil,
          @episodic_reflection_configuration : Types::EpisodicReflectionConfigurationInput? = nil
        )
        end
      end

      # The configuration for updating the self-managed memory strategy.
      struct ModifySelfManagedConfiguration
        include JSON::Serializable

        # The updated number of historical messages to include in processing context.
        @[JSON::Field(key: "historicalContextWindowSize")]
        getter historical_context_window_size : Int32?

        # The updated configuration to invoke self-managed memory processing pipeline.
        @[JSON::Field(key: "invocationConfiguration")]
        getter invocation_configuration : Types::ModifyInvocationConfigurationInput?

        # The updated list of conditions that trigger memory processing.
        @[JSON::Field(key: "triggerConditions")]
        getter trigger_conditions : Array(Types::TriggerConditionInput)?

        def initialize(
          @historical_context_window_size : Int32? = nil,
          @invocation_configuration : Types::ModifyInvocationConfigurationInput? = nil,
          @trigger_conditions : Array(Types::TriggerConditionInput)? = nil
        )
        end
      end

      # Contains information for modifying a strategy configuration.
      struct ModifyStrategyConfiguration
        include JSON::Serializable

        # The updated consolidation configuration.
        @[JSON::Field(key: "consolidation")]
        getter consolidation : Types::ModifyConsolidationConfiguration?

        # The updated extraction configuration.
        @[JSON::Field(key: "extraction")]
        getter extraction : Types::ModifyExtractionConfiguration?

        # The updated reflection configuration.
        @[JSON::Field(key: "reflection")]
        getter reflection : Types::ModifyReflectionConfiguration?

        # The updated self-managed configuration.
        @[JSON::Field(key: "selfManagedConfiguration")]
        getter self_managed_configuration : Types::ModifySelfManagedConfiguration?

        def initialize(
          @consolidation : Types::ModifyConsolidationConfiguration? = nil,
          @extraction : Types::ModifyExtractionConfiguration? = nil,
          @reflection : Types::ModifyReflectionConfiguration? = nil,
          @self_managed_configuration : Types::ModifySelfManagedConfiguration? = nil
        )
        end
      end

      # SecurityConfig for the Agent.
      struct NetworkConfiguration
        include JSON::Serializable

        # The network mode for the AgentCore Runtime.
        @[JSON::Field(key: "networkMode")]
        getter network_mode : String

        # The network mode configuration for the AgentCore Runtime.
        @[JSON::Field(key: "networkModeConfig")]
        getter network_mode_config : Types::VpcConfig?

        def initialize(
          @network_mode : String,
          @network_mode_config : Types::VpcConfig? = nil
        )
        end
      end

      # The definition of a numerical rating scale option that provides a numeric value with its description
      # for evaluation scoring.
      struct NumericalScaleDefinition
        include JSON::Serializable

        # The description that explains what this numerical rating represents and when it should be used.
        @[JSON::Field(key: "definition")]
        getter definition : String

        # The label or name that describes this numerical rating option.
        @[JSON::Field(key: "label")]
        getter label : String

        # The numerical value for this rating scale option.
        @[JSON::Field(key: "value")]
        getter value : Float64

        def initialize(
          @definition : String,
          @label : String,
          @value : Float64
        )
        end
      end

      # An OAuth credential provider for gateway authentication. This structure contains the configuration
      # for authenticating with the target endpoint using OAuth.
      struct OAuthCredentialProvider
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the OAuth credential provider. This ARN identifies the provider in
        # Amazon Web Services.
        @[JSON::Field(key: "providerArn")]
        getter provider_arn : String

        # The OAuth scopes for the credential provider. These scopes define the level of access requested from
        # the OAuth provider.
        @[JSON::Field(key: "scopes")]
        getter scopes : Array(String)

        # The custom parameters for the OAuth credential provider. These parameters provide additional
        # configuration for the OAuth authentication process.
        @[JSON::Field(key: "customParameters")]
        getter custom_parameters : Hash(String, String)?

        # The URL where the end user's browser is redirected after obtaining the authorization code. Generally
        # points to the customer's application.
        @[JSON::Field(key: "defaultReturnUrl")]
        getter default_return_url : String?

        # Specifies the kind of credentials to use for authorization: CLIENT_CREDENTIALS - Authorization with
        # a client ID and secret. AUTHORIZATION_CODE - Authorization with a token that is specific to an
        # individual end user.
        @[JSON::Field(key: "grantType")]
        getter grant_type : String?

        def initialize(
          @provider_arn : String,
          @scopes : Array(String),
          @custom_parameters : Hash(String, String)? = nil,
          @default_return_url : String? = nil,
          @grant_type : String? = nil
        )
        end
      end

      # Contains the authorization server metadata for an OAuth2 provider.
      struct Oauth2AuthorizationServerMetadata
        include JSON::Serializable

        # The authorization endpoint URL for the OAuth2 authorization server.
        @[JSON::Field(key: "authorizationEndpoint")]
        getter authorization_endpoint : String

        # The issuer URL for the OAuth2 authorization server.
        @[JSON::Field(key: "issuer")]
        getter issuer : String

        # The token endpoint URL for the OAuth2 authorization server.
        @[JSON::Field(key: "tokenEndpoint")]
        getter token_endpoint : String

        # The supported response types for the OAuth2 authorization server.
        @[JSON::Field(key: "responseTypes")]
        getter response_types : Array(String)?

        # The authentication methods supported by the token endpoint. This specifies how clients can
        # authenticate when requesting tokens from the authorization server.
        @[JSON::Field(key: "tokenEndpointAuthMethods")]
        getter token_endpoint_auth_methods : Array(String)?

        def initialize(
          @authorization_endpoint : String,
          @issuer : String,
          @token_endpoint : String,
          @response_types : Array(String)? = nil,
          @token_endpoint_auth_methods : Array(String)? = nil
        )
        end
      end

      # Contains information about an OAuth2 credential provider.
      struct Oauth2CredentialProviderItem
        include JSON::Serializable

        # The timestamp when the OAuth2 credential provider was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the OAuth2 credential provider.
        @[JSON::Field(key: "credentialProviderArn")]
        getter credential_provider_arn : String

        # The vendor of the OAuth2 credential provider.
        @[JSON::Field(key: "credentialProviderVendor")]
        getter credential_provider_vendor : String

        # The timestamp when the OAuth2 credential provider was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the OAuth2 credential provider.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @created_time : Time,
          @credential_provider_arn : String,
          @credential_provider_vendor : String,
          @last_updated_time : Time,
          @name : String
        )
        end
      end

      # Contains the discovery information for an OAuth2 provider.
      struct Oauth2Discovery
        include JSON::Serializable

        # The authorization server metadata for the OAuth2 provider.
        @[JSON::Field(key: "authorizationServerMetadata")]
        getter authorization_server_metadata : Types::Oauth2AuthorizationServerMetadata?

        # The discovery URL for the OAuth2 provider.
        @[JSON::Field(key: "discoveryUrl")]
        getter discovery_url : String?

        def initialize(
          @authorization_server_metadata : Types::Oauth2AuthorizationServerMetadata? = nil,
          @discovery_url : String? = nil
        )
        end
      end

      # Contains the input configuration for an OAuth2 provider.
      struct Oauth2ProviderConfigInput
        include JSON::Serializable

        # Configuration settings for Atlassian OAuth2 provider integration.
        @[JSON::Field(key: "atlassianOauth2ProviderConfig")]
        getter atlassian_oauth2_provider_config : Types::AtlassianOauth2ProviderConfigInput?

        # The configuration for a custom OAuth2 provider.
        @[JSON::Field(key: "customOauth2ProviderConfig")]
        getter custom_oauth2_provider_config : Types::CustomOauth2ProviderConfigInput?

        # The configuration for a GitHub OAuth2 provider.
        @[JSON::Field(key: "githubOauth2ProviderConfig")]
        getter github_oauth2_provider_config : Types::GithubOauth2ProviderConfigInput?

        # The configuration for a Google OAuth2 provider.
        @[JSON::Field(key: "googleOauth2ProviderConfig")]
        getter google_oauth2_provider_config : Types::GoogleOauth2ProviderConfigInput?

        # The configuration for a non-custom OAuth2 provider. This includes settings for supported OAuth2
        # providers that have built-in integration support.
        @[JSON::Field(key: "includedOauth2ProviderConfig")]
        getter included_oauth2_provider_config : Types::IncludedOauth2ProviderConfigInput?

        # Configuration settings for LinkedIn OAuth2 provider integration.
        @[JSON::Field(key: "linkedinOauth2ProviderConfig")]
        getter linkedin_oauth2_provider_config : Types::LinkedinOauth2ProviderConfigInput?

        # The configuration for a Microsoft OAuth2 provider.
        @[JSON::Field(key: "microsoftOauth2ProviderConfig")]
        getter microsoft_oauth2_provider_config : Types::MicrosoftOauth2ProviderConfigInput?

        # The configuration for a Salesforce OAuth2 provider.
        @[JSON::Field(key: "salesforceOauth2ProviderConfig")]
        getter salesforce_oauth2_provider_config : Types::SalesforceOauth2ProviderConfigInput?

        # The configuration for a Slack OAuth2 provider.
        @[JSON::Field(key: "slackOauth2ProviderConfig")]
        getter slack_oauth2_provider_config : Types::SlackOauth2ProviderConfigInput?

        def initialize(
          @atlassian_oauth2_provider_config : Types::AtlassianOauth2ProviderConfigInput? = nil,
          @custom_oauth2_provider_config : Types::CustomOauth2ProviderConfigInput? = nil,
          @github_oauth2_provider_config : Types::GithubOauth2ProviderConfigInput? = nil,
          @google_oauth2_provider_config : Types::GoogleOauth2ProviderConfigInput? = nil,
          @included_oauth2_provider_config : Types::IncludedOauth2ProviderConfigInput? = nil,
          @linkedin_oauth2_provider_config : Types::LinkedinOauth2ProviderConfigInput? = nil,
          @microsoft_oauth2_provider_config : Types::MicrosoftOauth2ProviderConfigInput? = nil,
          @salesforce_oauth2_provider_config : Types::SalesforceOauth2ProviderConfigInput? = nil,
          @slack_oauth2_provider_config : Types::SlackOauth2ProviderConfigInput? = nil
        )
        end
      end

      # Contains the output configuration for an OAuth2 provider.
      struct Oauth2ProviderConfigOutput
        include JSON::Serializable

        # The configuration details for the Atlassian OAuth2 provider.
        @[JSON::Field(key: "atlassianOauth2ProviderConfig")]
        getter atlassian_oauth2_provider_config : Types::AtlassianOauth2ProviderConfigOutput?

        # The output configuration for a custom OAuth2 provider.
        @[JSON::Field(key: "customOauth2ProviderConfig")]
        getter custom_oauth2_provider_config : Types::CustomOauth2ProviderConfigOutput?

        # The output configuration for a GitHub OAuth2 provider.
        @[JSON::Field(key: "githubOauth2ProviderConfig")]
        getter github_oauth2_provider_config : Types::GithubOauth2ProviderConfigOutput?

        # The output configuration for a Google OAuth2 provider.
        @[JSON::Field(key: "googleOauth2ProviderConfig")]
        getter google_oauth2_provider_config : Types::GoogleOauth2ProviderConfigOutput?

        # The configuration for a non-custom OAuth2 provider. This includes the configuration details for
        # supported OAuth2 providers that have built-in integration support.
        @[JSON::Field(key: "includedOauth2ProviderConfig")]
        getter included_oauth2_provider_config : Types::IncludedOauth2ProviderConfigOutput?

        # The configuration details for the LinkedIn OAuth2 provider.
        @[JSON::Field(key: "linkedinOauth2ProviderConfig")]
        getter linkedin_oauth2_provider_config : Types::LinkedinOauth2ProviderConfigOutput?

        # The output configuration for a Microsoft OAuth2 provider.
        @[JSON::Field(key: "microsoftOauth2ProviderConfig")]
        getter microsoft_oauth2_provider_config : Types::MicrosoftOauth2ProviderConfigOutput?

        # The output configuration for a Salesforce OAuth2 provider.
        @[JSON::Field(key: "salesforceOauth2ProviderConfig")]
        getter salesforce_oauth2_provider_config : Types::SalesforceOauth2ProviderConfigOutput?

        # The output configuration for a Slack OAuth2 provider.
        @[JSON::Field(key: "slackOauth2ProviderConfig")]
        getter slack_oauth2_provider_config : Types::SlackOauth2ProviderConfigOutput?

        def initialize(
          @atlassian_oauth2_provider_config : Types::AtlassianOauth2ProviderConfigOutput? = nil,
          @custom_oauth2_provider_config : Types::CustomOauth2ProviderConfigOutput? = nil,
          @github_oauth2_provider_config : Types::GithubOauth2ProviderConfigOutput? = nil,
          @google_oauth2_provider_config : Types::GoogleOauth2ProviderConfigOutput? = nil,
          @included_oauth2_provider_config : Types::IncludedOauth2ProviderConfigOutput? = nil,
          @linkedin_oauth2_provider_config : Types::LinkedinOauth2ProviderConfigOutput? = nil,
          @microsoft_oauth2_provider_config : Types::MicrosoftOauth2ProviderConfigOutput? = nil,
          @salesforce_oauth2_provider_config : Types::SalesforceOauth2ProviderConfigOutput? = nil,
          @slack_oauth2_provider_config : Types::SlackOauth2ProviderConfigOutput? = nil
        )
        end
      end

      # The summary information about an online evaluation configuration, including basic metadata and
      # execution status.
      struct OnlineEvaluationConfigSummary
        include JSON::Serializable

        # The timestamp when the online evaluation configuration was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The execution status indicating whether the online evaluation is currently running.
        @[JSON::Field(key: "executionStatus")]
        getter execution_status : String

        # The Amazon Resource Name (ARN) of the online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigArn")]
        getter online_evaluation_config_arn : String

        # The unique identifier of the online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigId")]
        getter online_evaluation_config_id : String

        # The name of the online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigName")]
        getter online_evaluation_config_name : String

        # The status of the online evaluation configuration.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the online evaluation configuration was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the online evaluation configuration.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The reason for failure if the online evaluation configuration execution failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        def initialize(
          @created_at : Time,
          @execution_status : String,
          @online_evaluation_config_arn : String,
          @online_evaluation_config_id : String,
          @online_evaluation_config_name : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @failure_reason : String? = nil
        )
        end
      end

      # The configuration that specifies where evaluation results should be written for monitoring and
      # analysis.
      struct OutputConfig
        include JSON::Serializable

        # The CloudWatch configuration for writing evaluation results to CloudWatch logs with embedded metric
        # format.
        @[JSON::Field(key: "cloudWatchConfig")]
        getter cloud_watch_config : Types::CloudWatchOutputConfig

        def initialize(
          @cloud_watch_config : Types::CloudWatchOutputConfig
        )
        end
      end

      # Represents a complete policy resource within the AgentCore Policy system. Policies are ARN-able
      # resources that contain Cedar policy statements and associated metadata for controlling agent
      # behavior and access decisions. Each policy belongs to a policy engine and defines fine-grained
      # authorization rules that are evaluated in real-time as agents interact with tools through Gateway.
      # Policies use the Cedar policy language to specify who (principals based on OAuth claims like
      # username, role, or scope) can perform what actions (tool calls) on which resources (Gateways), with
      # optional conditions for attribute-based access control. Multiple policies can apply to a single
      # request, with Cedar's forbid-wins semantics ensuring that security restrictions are never
      # accidentally overridden.
      struct Policy
        include JSON::Serializable

        # The timestamp when the policy was originally created. This is automatically set by the service and
        # used for auditing and lifecycle management.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Cedar policy statement that defines the access control rules. This contains the actual policy
        # logic used for agent behavior control and access decisions.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinition

        # The customer-assigned immutable name for the policy. This human-readable identifier must be unique
        # within the account and cannot exceed 48 characters.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the policy. This globally unique identifier can be used for
        # cross-service references and IAM policy statements.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The identifier of the policy engine that manages this policy. This establishes the policy engine
        # context for policy evaluation and management.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier for the policy. This system-generated identifier consists of the user name
        # plus a 10-character generated suffix and serves as the primary key for policy operations.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The current status of the policy.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the policy status. This provides details about any failures or the
        # current state of the policy lifecycle.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy was last modified. This tracks the most recent changes to the policy
        # configuration or metadata.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A human-readable description of the policy's purpose and functionality. Limited to 4,096 characters,
        # this helps administrators understand and manage the policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @definition : Types::PolicyDefinition,
          @name : String,
          @policy_arn : String,
          @policy_engine_id : String,
          @policy_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      # Represents the definition structure for policies within the AgentCore Policy system. This structure
      # encapsulates different policy formats and languages that can be used to define access control rules.
      struct PolicyDefinition
        include JSON::Serializable

        # The Cedar policy definition within the policy definition structure. This contains the Cedar policy
        # statement that defines the authorization logic using Cedar's human-readable, analyzable policy
        # language. Cedar policies specify principals (who can access), actions (what operations are allowed),
        # resources (what can be accessed), and optional conditions for fine-grained control. Cedar provides a
        # formal policy language designed for authorization with deterministic evaluation, making policies
        # testable, reviewable, and auditable. All Cedar policies follow a default-deny model where actions
        # are denied unless explicitly permitted, and forbid policies always override permit policies.
        @[JSON::Field(key: "cedar")]
        getter cedar : Types::CedarPolicy?

        def initialize(
          @cedar : Types::CedarPolicy? = nil
        )
        end
      end

      # Represents a policy engine resource within the AgentCore Policy system. Policy engines serve as
      # containers for grouping related policies and provide the execution context for policy evaluation and
      # management. Each policy engine can be associated with one Gateway (one engine per Gateway), where it
      # intercepts all agent tool calls and evaluates them against the contained policies before allowing
      # tools to execute. The policy engine maintains the Cedar schema generated from the Gateway's tool
      # manifest, ensuring that policies are validated against the actual tools and parameters available.
      # Policy engines support two enforcement modes that can be configured when associating with a Gateway:
      # log-only mode for testing (evaluates decisions without blocking) and enforce mode for production
      # (actively allows or denies based on policy evaluation).
      struct PolicyEngine
        include JSON::Serializable

        # The timestamp when the policy engine was originally created. This is automatically set by the
        # service and used for auditing and lifecycle management.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The customer-assigned immutable name for the policy engine. This human-readable identifier must be
        # unique within the account and cannot exceed 48 characters.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the policy engine. This globally unique identifier can be used for
        # cross-service references and IAM policy statements.
        @[JSON::Field(key: "policyEngineArn")]
        getter policy_engine_arn : String

        # The unique identifier for the policy engine. This system-generated identifier consists of the user
        # name plus a 10-character generated suffix and serves as the primary key for policy engine
        # operations.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The current status of the policy engine.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the policy engine status. This provides details about any failures or
        # the current state of the policy engine lifecycle.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy engine was last modified. This tracks the most recent changes to the
        # policy engine configuration or metadata.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A human-readable description of the policy engine's purpose and scope. Limited to 4,096 characters,
        # this helps administrators understand the policy engine's role in the overall governance strategy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_engine_arn : String,
          @policy_engine_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      # Represents a policy generation request within the AgentCore Policy system. Tracks the AI-powered
      # conversion of natural language descriptions into Cedar policy statements, enabling users to author
      # policies by describing authorization requirements in plain English. The generation process analyzes
      # the natural language input along with the Gateway's tool context and Cedar schema to produce one or
      # more validated policy options. Each generation request tracks the status of the conversion process
      # and maintains findings about the generated policies, including validation results and potential
      # issues. Generated policy assets remain available for one week after successful generation, allowing
      # time to review and create policies from the generated options.
      struct PolicyGeneration
        include JSON::Serializable

        # The timestamp when this policy generation request was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The customer-assigned name for this policy generation request.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the policy engine associated with this generation request.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The ARN of this policy generation request.
        @[JSON::Field(key: "policyGenerationArn")]
        getter policy_generation_arn : String

        # The unique identifier for this policy generation request.
        @[JSON::Field(key: "policyGenerationId")]
        getter policy_generation_id : String

        # The resource information associated with this policy generation.
        @[JSON::Field(key: "resource")]
        getter resource : Types::Resource

        # The current status of this policy generation request.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the generation status.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when this policy generation was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Findings and insights from this policy generation process.
        @[JSON::Field(key: "findings")]
        getter findings : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_engine_id : String,
          @policy_generation_arn : String,
          @policy_generation_id : String,
          @resource : Types::Resource,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @findings : String? = nil
        )
        end
      end

      # Represents a generated policy asset from the AI-powered policy generation process within the
      # AgentCore Policy system. Each asset contains a Cedar policy statement generated from natural
      # language input, along with associated metadata and analysis findings to help users evaluate and
      # select the most appropriate policy option.
      struct PolicyGenerationAsset
        include JSON::Serializable

        # Analysis findings and insights related to this specific generated policy asset. These findings may
        # include validation results, potential issues, or recommendations for improvement to help users
        # evaluate the quality and appropriateness of the generated policy.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::Finding)

        # The unique identifier for this generated policy asset within the policy generation request. This ID
        # can be used to reference specific generated policy options when creating actual policies from the
        # generation results.
        @[JSON::Field(key: "policyGenerationAssetId")]
        getter policy_generation_asset_id : String

        # The portion of the original natural language input that this generated policy asset addresses. This
        # helps users understand which part of their policy description was translated into this specific
        # Cedar policy statement, enabling better policy selection and refinement. When a single natural
        # language input describes multiple authorization requirements, the generation process creates
        # separate policy assets for each requirement, with each asset's rawTextFragment showing which
        # requirement it addresses. Use this mapping to verify that all parts of your natural language input
        # were correctly translated into Cedar policies.
        @[JSON::Field(key: "rawTextFragment")]
        getter raw_text_fragment : String

        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinition?

        def initialize(
          @findings : Array(Types::Finding),
          @policy_generation_asset_id : String,
          @raw_text_fragment : String,
          @definition : Types::PolicyDefinition? = nil
        )
        end
      end

      # The protocol configuration for an agent runtime. This structure defines how the agent runtime
      # communicates with clients.
      struct ProtocolConfiguration
        include JSON::Serializable

        # The server protocol for the agent runtime. This field specifies which protocol the agent runtime
        # uses to communicate with clients.
        @[JSON::Field(key: "serverProtocol")]
        getter server_protocol : String

        def initialize(
          @server_protocol : String
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The resource policy to create or update.
        @[JSON::Field(key: "policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the resource for which to create or update the resource policy.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end

      struct PutResourcePolicyResponse
        include JSON::Serializable

        # The resource policy that was created or updated.
        @[JSON::Field(key: "policy")]
        getter policy : String

        def initialize(
          @policy : String
        )
        end
      end

      # The rating scale that defines how evaluators should score agent performance, supporting both
      # numerical and categorical scales.
      struct RatingScale
        include JSON::Serializable

        # The categorical rating scale with named categories and definitions for qualitative evaluation.
        @[JSON::Field(key: "categorical")]
        getter categorical : Array(Types::CategoricalScaleDefinition)?

        # The numerical rating scale with defined score values and descriptions for quantitative evaluation.
        @[JSON::Field(key: "numerical")]
        getter numerical : Array(Types::NumericalScaleDefinition)?

        def initialize(
          @categorical : Array(Types::CategoricalScaleDefinition)? = nil,
          @numerical : Array(Types::NumericalScaleDefinition)? = nil
        )
        end
      end

      # The recording configuration for a browser. This structure defines how browser sessions are recorded.
      struct RecordingConfig
        include JSON::Serializable

        # Indicates whether recording is enabled for the browser. When set to true, browser sessions are
        # recorded.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The Amazon S3 location where browser recordings are stored. This location contains the recorded
        # browser sessions.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @enabled : Bool? = nil,
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      # Contains reflection configuration information for a memory strategy.
      struct ReflectionConfiguration
        include JSON::Serializable

        # The configuration for a custom reflection strategy.
        @[JSON::Field(key: "customReflectionConfiguration")]
        getter custom_reflection_configuration : Types::CustomReflectionConfiguration?

        # The configuration for the episodic reflection strategy.
        @[JSON::Field(key: "episodicReflectionConfiguration")]
        getter episodic_reflection_configuration : Types::EpisodicReflectionConfiguration?

        def initialize(
          @custom_reflection_configuration : Types::CustomReflectionConfiguration? = nil,
          @episodic_reflection_configuration : Types::EpisodicReflectionConfiguration? = nil
        )
        end
      end

      # Configuration for HTTP request headers that will be passed through to the runtime.
      struct RequestHeaderConfiguration
        include JSON::Serializable

        # A list of HTTP request headers that are allowed to be passed through to the runtime.
        @[JSON::Field(key: "requestHeaderAllowlist")]
        getter request_header_allowlist : Array(String)?

        def initialize(
          @request_header_allowlist : Array(String)? = nil
        )
        end
      end

      # Represents a resource within the AgentCore Policy system. Resources are the targets of policy
      # evaluation. Currently, only AgentCore Gateways are supported as resources for policy enforcement.
      struct Resource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. This globally unique identifier specifies the exact
        # resource that policies will be evaluated against for access control decisions.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # Exception thrown when a resource limit is exceeded.
      struct ResourceLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when a resource referenced by the operation does not exist
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The evaluation rule that defines sampling configuration, filtering criteria, and session detection
      # settings for online evaluation.
      struct Rule
        include JSON::Serializable

        # The sampling configuration that determines what percentage of agent traces to evaluate.
        @[JSON::Field(key: "samplingConfig")]
        getter sampling_config : Types::SamplingConfig

        # The list of filters that determine which agent traces should be included in the evaluation based on
        # trace properties.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The session configuration that defines timeout settings for detecting when agent sessions are
        # complete and ready for evaluation.
        @[JSON::Field(key: "sessionConfig")]
        getter session_config : Types::SessionConfig?

        def initialize(
          @sampling_config : Types::SamplingConfig,
          @filters : Array(Types::Filter)? = nil,
          @session_config : Types::SessionConfig? = nil
        )
        end
      end

      # The Amazon S3 configuration for a gateway. This structure defines how the gateway accesses files in
      # Amazon S3.
      struct S3Configuration
        include JSON::Serializable

        # The account ID of the Amazon S3 bucket owner. This ID is used for cross-account access to the
        # bucket.
        @[JSON::Field(key: "bucketOwnerAccountId")]
        getter bucket_owner_account_id : String?

        # The URI of the Amazon S3 object. This URI specifies the location of the object in Amazon S3.
        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @bucket_owner_account_id : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # The Amazon S3 location for storing data. This structure defines where in Amazon S3 data is stored.
      struct S3Location
        include JSON::Serializable

        # The name of the Amazon S3 bucket. This bucket contains the stored data.
        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The prefix for objects in the Amazon S3 bucket. This prefix is added to the object keys to organize
        # the data.
        @[JSON::Field(key: "prefix")]
        getter prefix : String

        # The version ID of the Amazon Amazon S3 object. If not specified, the latest version of the object is
        # used.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @prefix : String,
          @version_id : String? = nil
        )
        end
      end

      # Input configuration for a Salesforce OAuth2 provider.
      struct SalesforceOauth2ProviderConfigInput
        include JSON::Serializable

        # The client ID for the Salesforce OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret for the Salesforce OAuth2 provider.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        def initialize(
          @client_id : String,
          @client_secret : String
        )
        end
      end

      # Output configuration for a Salesforce OAuth2 provider.
      struct SalesforceOauth2ProviderConfigOutput
        include JSON::Serializable

        # The OAuth2 discovery information for the Salesforce provider.
        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        # The client ID for the Salesforce OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @oauth_discovery : Types::Oauth2Discovery,
          @client_id : String? = nil
        )
        end
      end

      # The configuration that controls what percentage of agent traces are sampled for evaluation to manage
      # evaluation volume and costs.
      struct SamplingConfig
        include JSON::Serializable

        # The percentage of agent traces to sample for evaluation, ranging from 0.01% to 100%.
        @[JSON::Field(key: "samplingPercentage")]
        getter sampling_percentage : Float64

        def initialize(
          @sampling_percentage : Float64
        )
        end
      end

      # A schema definition for a gateway target. This structure defines the structure of the API that the
      # target exposes.
      struct SchemaDefinition
        include JSON::Serializable

        # The type of the schema definition. This field specifies the data type of the schema.
        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the schema definition. This description provides information about the purpose
        # and usage of the schema.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The items in the schema definition. This field is used for array types to define the structure of
        # the array elements.
        @[JSON::Field(key: "items")]
        getter items : Types::SchemaDefinition?

        # The properties of the schema definition. These properties define the fields in the schema.
        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, Types::SchemaDefinition)?

        # The required fields in the schema definition. These fields must be provided when using the schema.
        @[JSON::Field(key: "required")]
        getter required : Array(String)?

        def initialize(
          @type : String,
          @description : String? = nil,
          @items : Types::SchemaDefinition? = nil,
          @properties : Hash(String, Types::SchemaDefinition)? = nil,
          @required : Array(String)? = nil
        )
        end
      end

      # Contains information about a secret in AWS Secrets Manager.
      struct Secret
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret in AWS Secrets Manager.
        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        def initialize(
          @secret_arn : String
        )
        end
      end

      # A configuration for a self-managed memory strategy.
      struct SelfManagedConfiguration
        include JSON::Serializable

        # The number of historical messages to include in processing context.
        @[JSON::Field(key: "historicalContextWindowSize")]
        getter historical_context_window_size : Int32

        # The configuration to use when invoking memory processing.
        @[JSON::Field(key: "invocationConfiguration")]
        getter invocation_configuration : Types::InvocationConfiguration

        # A list of conditions that trigger memory processing.
        @[JSON::Field(key: "triggerConditions")]
        getter trigger_conditions : Array(Types::TriggerCondition)

        def initialize(
          @historical_context_window_size : Int32,
          @invocation_configuration : Types::InvocationConfiguration,
          @trigger_conditions : Array(Types::TriggerCondition)
        )
        end
      end

      # Input configuration for a self-managed memory strategy.
      struct SelfManagedConfigurationInput
        include JSON::Serializable

        # Configuration to invoke a self-managed memory processing pipeline with.
        @[JSON::Field(key: "invocationConfiguration")]
        getter invocation_configuration : Types::InvocationConfigurationInput

        # Number of historical messages to include in processing context.
        @[JSON::Field(key: "historicalContextWindowSize")]
        getter historical_context_window_size : Int32?

        # A list of conditions that trigger memory processing.
        @[JSON::Field(key: "triggerConditions")]
        getter trigger_conditions : Array(Types::TriggerConditionInput)?

        def initialize(
          @invocation_configuration : Types::InvocationConfigurationInput,
          @historical_context_window_size : Int32? = nil,
          @trigger_conditions : Array(Types::TriggerConditionInput)? = nil
        )
        end
      end

      # Contains semantic consolidation override configuration.
      struct SemanticConsolidationOverride
        include JSON::Serializable

        # The text to append to the prompt for semantic consolidation.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for semantic consolidation.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Contains semantic extraction override configuration.
      struct SemanticExtractionOverride
        include JSON::Serializable

        # The text to append to the prompt for semantic extraction.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for semantic extraction.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Input for creating a semantic memory strategy.
      struct SemanticMemoryStrategyInput
        include JSON::Serializable

        # The name of the semantic memory strategy.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the semantic memory strategy.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The namespaces associated with the semantic memory strategy.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @namespaces : Array(String)? = nil
        )
        end
      end

      # Input for semantic override configuration in a memory strategy.
      struct SemanticOverrideConfigurationInput
        include JSON::Serializable

        # The consolidation configuration for a semantic override.
        @[JSON::Field(key: "consolidation")]
        getter consolidation : Types::SemanticOverrideConsolidationConfigurationInput?

        # The extraction configuration for a semantic override.
        @[JSON::Field(key: "extraction")]
        getter extraction : Types::SemanticOverrideExtractionConfigurationInput?

        def initialize(
          @consolidation : Types::SemanticOverrideConsolidationConfigurationInput? = nil,
          @extraction : Types::SemanticOverrideExtractionConfigurationInput? = nil
        )
        end
      end

      # Input for semantic override consolidation configuration in a memory strategy.
      struct SemanticOverrideConsolidationConfigurationInput
        include JSON::Serializable

        # The text to append to the prompt for semantic consolidation.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for semantic consolidation.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Input for semantic override extraction configuration in a memory strategy.
      struct SemanticOverrideExtractionConfigurationInput
        include JSON::Serializable

        # The text to append to the prompt for semantic extraction.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for semantic extraction.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # An internal error occurred.
      struct ServiceException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when a request is made beyond the service quota
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration that defines how agent sessions are detected and when they are considered complete
      # for evaluation.
      struct SessionConfig
        include JSON::Serializable

        # The number of minutes of inactivity after which an agent session is considered complete and ready
        # for evaluation. Default is 15 minutes.
        @[JSON::Field(key: "sessionTimeoutMinutes")]
        getter session_timeout_minutes : Int32

        def initialize(
          @session_timeout_minutes : Int32
        )
        end
      end

      struct SetTokenVaultCMKRequest
        include JSON::Serializable

        # The KMS configuration for the token vault, including the key type and KMS key ARN.
        @[JSON::Field(key: "kmsConfiguration")]
        getter kms_configuration : Types::KmsConfiguration

        # The unique identifier of the token vault to update.
        @[JSON::Field(key: "tokenVaultId")]
        getter token_vault_id : String?

        def initialize(
          @kms_configuration : Types::KmsConfiguration,
          @token_vault_id : String? = nil
        )
        end
      end

      struct SetTokenVaultCMKResponse
        include JSON::Serializable

        # The KMS configuration for the token vault.
        @[JSON::Field(key: "kmsConfiguration")]
        getter kms_configuration : Types::KmsConfiguration

        # The timestamp when the token vault was last modified.
        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Time

        # The ID of the token vault.
        @[JSON::Field(key: "tokenVaultId")]
        getter token_vault_id : String

        def initialize(
          @kms_configuration : Types::KmsConfiguration,
          @last_modified_date : Time,
          @token_vault_id : String
        )
        end
      end

      # Input configuration for a Slack OAuth2 provider.
      struct SlackOauth2ProviderConfigInput
        include JSON::Serializable

        # The client ID for the Slack OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret for the Slack OAuth2 provider.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        def initialize(
          @client_id : String,
          @client_secret : String
        )
        end
      end

      # Output configuration for a Slack OAuth2 provider.
      struct SlackOauth2ProviderConfigOutput
        include JSON::Serializable

        # The OAuth2 discovery information for the Slack provider.
        @[JSON::Field(key: "oauthDiscovery")]
        getter oauth_discovery : Types::Oauth2Discovery

        # The client ID for the Slack OAuth2 provider.
        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        def initialize(
          @oauth_discovery : Types::Oauth2Discovery,
          @client_id : String? = nil
        )
        end
      end

      struct StartPolicyGenerationRequest
        include JSON::Serializable

        # The natural language description of the desired policy behavior. This content is processed by AI to
        # generate corresponding Cedar policy statements that match the described intent.
        @[JSON::Field(key: "content")]
        getter content : Types::Content

        # A customer-assigned name for the policy generation request. This helps track and identify generation
        # operations, especially when running multiple generations simultaneously.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the policy engine that provides the context for policy generation. This engine's
        # schema and tool context are used to ensure generated policies are valid and applicable.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The resource information that provides context for policy generation. This helps the AI understand
        # the target resources and generate appropriate access control rules.
        @[JSON::Field(key: "resource")]
        getter resource : Types::Resource

        # A unique, case-sensitive identifier to ensure the idempotency of the request. The AWS SDK
        # automatically generates this token, so you don't need to provide it in most cases. If you retry a
        # request with the same client token, the service returns the same response without starting a
        # duplicate generation.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @content : Types::Content,
          @name : String,
          @policy_engine_id : String,
          @resource : Types::Resource,
          @client_token : String? = nil
        )
        end
      end

      struct StartPolicyGenerationResponse
        include JSON::Serializable

        # The timestamp when the policy generation request was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The customer-assigned name for the policy generation request.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the policy engine associated with the started policy generation.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The ARN of the created policy generation request.
        @[JSON::Field(key: "policyGenerationArn")]
        getter policy_generation_arn : String

        # The unique identifier assigned to the policy generation request for tracking progress.
        @[JSON::Field(key: "policyGenerationId")]
        getter policy_generation_id : String

        # The resource information associated with the policy generation request.
        @[JSON::Field(key: "resource")]
        getter resource : Types::Resource

        # The initial status of the policy generation request.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the generation status.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy generation was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Initial findings from the policy generation process.
        @[JSON::Field(key: "findings")]
        getter findings : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_engine_id : String,
          @policy_generation_arn : String,
          @policy_generation_id : String,
          @resource : Types::Resource,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @findings : String? = nil
        )
        end
      end

      # Contains configuration information for a memory strategy.
      struct StrategyConfiguration
        include JSON::Serializable

        # The consolidation configuration for the memory strategy.
        @[JSON::Field(key: "consolidation")]
        getter consolidation : Types::ConsolidationConfiguration?

        # The extraction configuration for the memory strategy.
        @[JSON::Field(key: "extraction")]
        getter extraction : Types::ExtractionConfiguration?

        # The reflection configuration for the memory strategy.
        @[JSON::Field(key: "reflection")]
        getter reflection : Types::ReflectionConfiguration?

        # Self-managed configuration settings.
        @[JSON::Field(key: "selfManagedConfiguration")]
        getter self_managed_configuration : Types::SelfManagedConfiguration?

        # The type of override for the strategy configuration.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @consolidation : Types::ConsolidationConfiguration? = nil,
          @extraction : Types::ExtractionConfiguration? = nil,
          @reflection : Types::ReflectionConfiguration? = nil,
          @self_managed_configuration : Types::SelfManagedConfiguration? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains summary consolidation override configuration.
      struct SummaryConsolidationOverride
        include JSON::Serializable

        # The text to append to the prompt for summary consolidation.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for summary consolidation.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Input for creating a summary memory strategy.
      struct SummaryMemoryStrategyInput
        include JSON::Serializable

        # The name of the summary memory strategy.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the summary memory strategy.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The namespaces associated with the summary memory strategy.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @namespaces : Array(String)? = nil
        )
        end
      end

      # Input for summary override configuration in a memory strategy.
      struct SummaryOverrideConfigurationInput
        include JSON::Serializable

        # The consolidation configuration for a summary override.
        @[JSON::Field(key: "consolidation")]
        getter consolidation : Types::SummaryOverrideConsolidationConfigurationInput?

        def initialize(
          @consolidation : Types::SummaryOverrideConsolidationConfigurationInput? = nil
        )
        end
      end

      # Input for summary override consolidation configuration in a memory strategy.
      struct SummaryOverrideConsolidationConfigurationInput
        include JSON::Serializable

        # The text to append to the prompt for summary consolidation.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for summary consolidation.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      struct SynchronizeGatewayTargetsRequest
        include JSON::Serializable

        # The gateway Identifier.
        @[JSON::Field(key: "gatewayIdentifier")]
        getter gateway_identifier : String

        # The target ID list.
        @[JSON::Field(key: "targetIdList")]
        getter target_id_list : Array(String)

        def initialize(
          @gateway_identifier : String,
          @target_id_list : Array(String)
        )
        end
      end

      struct SynchronizeGatewayTargetsResponse
        include JSON::Serializable

        # The gateway targets for synchronization.
        @[JSON::Field(key: "targets")]
        getter targets : Array(Types::GatewayTarget)?

        def initialize(
          @targets : Array(Types::GatewayTarget)? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to tag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to add to the resource. A tag is a key-value pair.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration for a gateway target. This structure defines how the gateway connects to and
      # interacts with the target endpoint.
      struct TargetConfiguration
        include JSON::Serializable

        # The Model Context Protocol (MCP) configuration for the target. This configuration defines how the
        # gateway uses MCP to communicate with the target.
        @[JSON::Field(key: "mcp")]
        getter mcp : Types::McpTargetConfiguration?

        def initialize(
          @mcp : Types::McpTargetConfiguration? = nil
        )
        end
      end

      # Contains summary information about a gateway target. A target represents an endpoint that the
      # gateway can connect to.
      struct TargetSummary
        include JSON::Serializable

        # The timestamp when the target was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the target.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the target.
        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of the target.
        @[JSON::Field(key: "targetId")]
        getter target_id : String

        # The timestamp when the target was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the target.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @status : String,
          @target_id : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      # API rate limit has been exceeded.
      struct ThrottledException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This exception is thrown when the number of requests exceeds the limit
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Trigger configuration based on time.
      struct TimeBasedTrigger
        include JSON::Serializable

        # Idle session timeout (seconds) that triggers memory processing.
        @[JSON::Field(key: "idleSessionTimeout")]
        getter idle_session_timeout : Int32?

        def initialize(
          @idle_session_timeout : Int32? = nil
        )
        end
      end

      # Trigger configuration based on time.
      struct TimeBasedTriggerInput
        include JSON::Serializable

        # Idle session timeout (seconds) that triggers memory processing.
        @[JSON::Field(key: "idleSessionTimeout")]
        getter idle_session_timeout : Int32?

        def initialize(
          @idle_session_timeout : Int32? = nil
        )
        end
      end

      # Trigger configuration based on tokens.
      struct TokenBasedTrigger
        include JSON::Serializable

        # Number of tokens that trigger memory processing.
        @[JSON::Field(key: "tokenCount")]
        getter token_count : Int32?

        def initialize(
          @token_count : Int32? = nil
        )
        end
      end

      # Trigger configuration based on tokens.
      struct TokenBasedTriggerInput
        include JSON::Serializable

        # Number of tokens that trigger memory processing.
        @[JSON::Field(key: "tokenCount")]
        getter token_count : Int32?

        def initialize(
          @token_count : Int32? = nil
        )
        end
      end

      # A tool definition for a gateway target. This structure defines a tool that the target exposes
      # through the Model Context Protocol.
      struct ToolDefinition
        include JSON::Serializable

        # The description of the tool. This description provides information about the purpose and usage of
        # the tool.
        @[JSON::Field(key: "description")]
        getter description : String

        # The input schema for the tool. This schema defines the structure of the input that the tool accepts.
        @[JSON::Field(key: "inputSchema")]
        getter input_schema : Types::SchemaDefinition

        # The name of the tool. This name identifies the tool in the Model Context Protocol.
        @[JSON::Field(key: "name")]
        getter name : String

        # The output schema for the tool. This schema defines the structure of the output that the tool
        # produces.
        @[JSON::Field(key: "outputSchema")]
        getter output_schema : Types::SchemaDefinition?

        def initialize(
          @description : String,
          @input_schema : Types::SchemaDefinition,
          @name : String,
          @output_schema : Types::SchemaDefinition? = nil
        )
        end
      end

      # A tool schema for a gateway target. This structure defines the schema for a tool that the target
      # exposes through the Model Context Protocol.
      struct ToolSchema
        include JSON::Serializable

        # The inline payload of the tool schema. This payload contains the schema definition directly in the
        # request.
        @[JSON::Field(key: "inlinePayload")]
        getter inline_payload : Array(Types::ToolDefinition)?

        # The Amazon S3 location of the tool schema. This location contains the schema definition file.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Configuration?

        def initialize(
          @inline_payload : Array(Types::ToolDefinition)? = nil,
          @s3 : Types::S3Configuration? = nil
        )
        end
      end

      # Condition that triggers memory processing.
      struct TriggerCondition
        include JSON::Serializable

        # Message based trigger configuration.
        @[JSON::Field(key: "messageBasedTrigger")]
        getter message_based_trigger : Types::MessageBasedTrigger?

        # Time based trigger configuration.
        @[JSON::Field(key: "timeBasedTrigger")]
        getter time_based_trigger : Types::TimeBasedTrigger?

        # Token based trigger configuration.
        @[JSON::Field(key: "tokenBasedTrigger")]
        getter token_based_trigger : Types::TokenBasedTrigger?

        def initialize(
          @message_based_trigger : Types::MessageBasedTrigger? = nil,
          @time_based_trigger : Types::TimeBasedTrigger? = nil,
          @token_based_trigger : Types::TokenBasedTrigger? = nil
        )
        end
      end

      # Condition that triggers memory processing.
      struct TriggerConditionInput
        include JSON::Serializable

        # Message based trigger configuration.
        @[JSON::Field(key: "messageBasedTrigger")]
        getter message_based_trigger : Types::MessageBasedTriggerInput?

        # Time based trigger configuration.
        @[JSON::Field(key: "timeBasedTrigger")]
        getter time_based_trigger : Types::TimeBasedTriggerInput?

        # Token based trigger configuration.
        @[JSON::Field(key: "tokenBasedTrigger")]
        getter token_based_trigger : Types::TokenBasedTriggerInput?

        def initialize(
          @message_based_trigger : Types::MessageBasedTriggerInput? = nil,
          @time_based_trigger : Types::TimeBasedTriggerInput? = nil,
          @token_based_trigger : Types::TokenBasedTriggerInput? = nil
        )
        end
      end

      # This exception is thrown when the JWT bearer token is invalid or not found for OAuth bearer token
      # based access
      struct UnauthorizedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to untag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys of the tags to remove from the resource.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateAgentRuntimeEndpointRequest
        include JSON::Serializable

        # The unique identifier of the AgentCore Runtime associated with the endpoint.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The name of the AgentCore Runtime endpoint to update.
        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String

        # The updated version of the AgentCore Runtime for the endpoint.
        @[JSON::Field(key: "agentRuntimeVersion")]
        getter agent_runtime_version : String?

        # A unique, case-sensitive identifier to ensure idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The updated description of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @agent_runtime_id : String,
          @endpoint_name : String,
          @agent_runtime_version : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct UpdateAgentRuntimeEndpointResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The Amazon Resource Name (ARN) of the AgentCore Runtime endpoint.
        @[JSON::Field(key: "agentRuntimeEndpointArn")]
        getter agent_runtime_endpoint_arn : String

        # The timestamp when the AgentCore Runtime endpoint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp when the AgentCore Runtime endpoint was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The current status of the updated AgentCore Runtime endpoint.
        @[JSON::Field(key: "status")]
        getter status : String

        # The currently deployed version of the AgentCore Runtime on the endpoint.
        @[JSON::Field(key: "liveVersion")]
        getter live_version : String?

        # The target version of the AgentCore Runtime for the endpoint.
        @[JSON::Field(key: "targetVersion")]
        getter target_version : String?

        def initialize(
          @agent_runtime_arn : String,
          @agent_runtime_endpoint_arn : String,
          @created_at : Time,
          @last_updated_at : Time,
          @status : String,
          @live_version : String? = nil,
          @target_version : String? = nil
        )
        end
      end

      struct UpdateAgentRuntimeRequest
        include JSON::Serializable

        # The updated artifact of the AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeArtifact")]
        getter agent_runtime_artifact : Types::AgentRuntimeArtifact

        # The unique identifier of the AgentCore Runtime to update.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The updated network configuration for the AgentCore Runtime.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration

        # The updated IAM role ARN that provides permissions for the AgentCore Runtime.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The updated authorizer configuration for the AgentCore Runtime.
        @[JSON::Field(key: "authorizerConfiguration")]
        getter authorizer_configuration : Types::AuthorizerConfiguration?

        # A unique, case-sensitive identifier to ensure idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The updated description of the AgentCore Runtime.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Updated environment variables to set in the AgentCore Runtime environment.
        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Hash(String, String)?

        # The updated life cycle configuration for the AgentCore Runtime.
        @[JSON::Field(key: "lifecycleConfiguration")]
        getter lifecycle_configuration : Types::LifecycleConfiguration?

        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::ProtocolConfiguration?

        # The updated configuration for HTTP request headers that will be passed through to the runtime.
        @[JSON::Field(key: "requestHeaderConfiguration")]
        getter request_header_configuration : Types::RequestHeaderConfiguration?

        def initialize(
          @agent_runtime_artifact : Types::AgentRuntimeArtifact,
          @agent_runtime_id : String,
          @network_configuration : Types::NetworkConfiguration,
          @role_arn : String,
          @authorizer_configuration : Types::AuthorizerConfiguration? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @lifecycle_configuration : Types::LifecycleConfiguration? = nil,
          @protocol_configuration : Types::ProtocolConfiguration? = nil,
          @request_header_configuration : Types::RequestHeaderConfiguration? = nil
        )
        end
      end

      struct UpdateAgentRuntimeResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeArn")]
        getter agent_runtime_arn : String

        # The unique identifier of the updated AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeId")]
        getter agent_runtime_id : String

        # The version of the updated AgentCore Runtime.
        @[JSON::Field(key: "agentRuntimeVersion")]
        getter agent_runtime_version : String

        # The timestamp when the AgentCore Runtime was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp when the AgentCore Runtime was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The current status of the updated AgentCore Runtime.
        @[JSON::Field(key: "status")]
        getter status : String

        # The workload identity details for the updated AgentCore Runtime.
        @[JSON::Field(key: "workloadIdentityDetails")]
        getter workload_identity_details : Types::WorkloadIdentityDetails?

        def initialize(
          @agent_runtime_arn : String,
          @agent_runtime_id : String,
          @agent_runtime_version : String,
          @created_at : Time,
          @last_updated_at : Time,
          @status : String,
          @workload_identity_details : Types::WorkloadIdentityDetails? = nil
        )
        end
      end

      struct UpdateApiKeyCredentialProviderRequest
        include JSON::Serializable

        # The new API key to use for authentication. This value replaces the existing API key and is encrypted
        # and stored securely.
        @[JSON::Field(key: "apiKey")]
        getter api_key : String

        # The name of the API key credential provider to update.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @api_key : String,
          @name : String
        )
        end
      end

      struct UpdateApiKeyCredentialProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the API key secret in AWS Secrets Manager.
        @[JSON::Field(key: "apiKeySecretArn")]
        getter api_key_secret_arn : Types::Secret

        # The timestamp when the API key credential provider was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the API key credential provider.
        @[JSON::Field(key: "credentialProviderArn")]
        getter credential_provider_arn : String

        # The timestamp when the API key credential provider was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the API key credential provider.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @api_key_secret_arn : Types::Secret,
          @created_time : Time,
          @credential_provider_arn : String,
          @last_updated_time : Time,
          @name : String
        )
        end
      end

      struct UpdateEvaluatorRequest
        include JSON::Serializable

        # The unique identifier of the evaluator to update.
        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If you don't specify this field, a value is randomly generated for you. If this token matches a
        # previous request, the service ignores the request, but doesn't return an error. For more
        # information, see Ensuring idempotency .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The updated description of the evaluator.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated configuration for the evaluator, including LLM-as-a-Judge settings with instructions,
        # rating scale, and model configuration.
        @[JSON::Field(key: "evaluatorConfig")]
        getter evaluator_config : Types::EvaluatorConfig?

        # The updated evaluation level ( TOOL_CALL , TRACE , or SESSION ) that determines the scope of
        # evaluation.
        @[JSON::Field(key: "level")]
        getter level : String?

        def initialize(
          @evaluator_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @evaluator_config : Types::EvaluatorConfig? = nil,
          @level : String? = nil
        )
        end
      end

      struct UpdateEvaluatorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated evaluator.
        @[JSON::Field(key: "evaluatorArn")]
        getter evaluator_arn : String

        # The unique identifier of the updated evaluator.
        @[JSON::Field(key: "evaluatorId")]
        getter evaluator_id : String

        # The status of the evaluator update operation.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the evaluator was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @evaluator_arn : String,
          @evaluator_id : String,
          @status : String,
          @updated_at : Time
        )
        end
      end

      struct UpdateGatewayRequest
        include JSON::Serializable

        # The updated authorizer type for the gateway.
        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String

        # The identifier of the gateway to update.
        @[JSON::Field(key: "gatewayIdentifier")]
        getter gateway_identifier : String

        # The name of the gateway. This name must be the same as the one when the gateway was created.
        @[JSON::Field(key: "name")]
        getter name : String

        # The updated protocol type for the gateway.
        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String

        # The updated IAM role ARN that provides permissions for the gateway.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The updated authorizer configuration for the gateway.
        @[JSON::Field(key: "authorizerConfiguration")]
        getter authorizer_configuration : Types::AuthorizerConfiguration?

        # The updated description for the gateway.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The level of detail in error messages returned when invoking the gateway. If the value is DEBUG ,
        # granular exception messages are returned to help a user debug the gateway. If the value is omitted,
        # a generic error message is returned to the end user.
        @[JSON::Field(key: "exceptionLevel")]
        getter exception_level : String?

        # The updated interceptor configurations for the gateway.
        @[JSON::Field(key: "interceptorConfigurations")]
        getter interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)?

        # The updated ARN of the KMS key used to encrypt the gateway.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The updated policy engine configuration for the gateway. A policy engine is a collection of policies
        # that evaluates and authorizes agent tool calls. When associated with a gateway, the policy engine
        # intercepts all agent requests and determines whether to allow or deny each action based on the
        # defined policies.
        @[JSON::Field(key: "policyEngineConfiguration")]
        getter policy_engine_configuration : Types::GatewayPolicyEngineConfiguration?

        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::GatewayProtocolConfiguration?

        def initialize(
          @authorizer_type : String,
          @gateway_identifier : String,
          @name : String,
          @protocol_type : String,
          @role_arn : String,
          @authorizer_configuration : Types::AuthorizerConfiguration? = nil,
          @description : String? = nil,
          @exception_level : String? = nil,
          @interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)? = nil,
          @kms_key_arn : String? = nil,
          @policy_engine_configuration : Types::GatewayPolicyEngineConfiguration? = nil,
          @protocol_configuration : Types::GatewayProtocolConfiguration? = nil
        )
        end
      end

      struct UpdateGatewayResponse
        include JSON::Serializable

        # The updated authorizer type for the gateway.
        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String

        # The timestamp when the gateway was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the updated gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The unique identifier of the updated gateway.
        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The name of the gateway.
        @[JSON::Field(key: "name")]
        getter name : String

        # The updated protocol type for the gateway.
        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String

        # The current status of the updated gateway.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the gateway was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The updated authorizer configuration for the gateway.
        @[JSON::Field(key: "authorizerConfiguration")]
        getter authorizer_configuration : Types::AuthorizerConfiguration?

        # The updated description of the gateway.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The level of detail in error messages returned when invoking the gateway. If the value is DEBUG ,
        # granular exception messages are returned to help a user debug the gateway. If the value is omitted,
        # a generic error message is returned to the end user.
        @[JSON::Field(key: "exceptionLevel")]
        getter exception_level : String?

        # An endpoint for invoking the updated gateway.
        @[JSON::Field(key: "gatewayUrl")]
        getter gateway_url : String?

        # The updated interceptor configurations for the gateway.
        @[JSON::Field(key: "interceptorConfigurations")]
        getter interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)?

        # The updated ARN of the KMS key used to encrypt the gateway.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The updated policy engine configuration for the gateway.
        @[JSON::Field(key: "policyEngineConfiguration")]
        getter policy_engine_configuration : Types::GatewayPolicyEngineConfiguration?

        @[JSON::Field(key: "protocolConfiguration")]
        getter protocol_configuration : Types::GatewayProtocolConfiguration?

        # The updated IAM role ARN that provides permissions for the gateway.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The reasons for the current status of the updated gateway.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        # The workload identity details for the updated gateway.
        @[JSON::Field(key: "workloadIdentityDetails")]
        getter workload_identity_details : Types::WorkloadIdentityDetails?

        def initialize(
          @authorizer_type : String,
          @created_at : Time,
          @gateway_arn : String,
          @gateway_id : String,
          @name : String,
          @protocol_type : String,
          @status : String,
          @updated_at : Time,
          @authorizer_configuration : Types::AuthorizerConfiguration? = nil,
          @description : String? = nil,
          @exception_level : String? = nil,
          @gateway_url : String? = nil,
          @interceptor_configurations : Array(Types::GatewayInterceptorConfiguration)? = nil,
          @kms_key_arn : String? = nil,
          @policy_engine_configuration : Types::GatewayPolicyEngineConfiguration? = nil,
          @protocol_configuration : Types::GatewayProtocolConfiguration? = nil,
          @role_arn : String? = nil,
          @status_reasons : Array(String)? = nil,
          @workload_identity_details : Types::WorkloadIdentityDetails? = nil
        )
        end
      end

      struct UpdateGatewayTargetRequest
        include JSON::Serializable

        # The unique identifier of the gateway associated with the target.
        @[JSON::Field(key: "gatewayIdentifier")]
        getter gateway_identifier : String

        # The updated name for the gateway target.
        @[JSON::Field(key: "name")]
        getter name : String

        @[JSON::Field(key: "targetConfiguration")]
        getter target_configuration : Types::TargetConfiguration

        # The unique identifier of the gateway target to update.
        @[JSON::Field(key: "targetId")]
        getter target_id : String

        # The updated credential provider configurations for the gateway target.
        @[JSON::Field(key: "credentialProviderConfigurations")]
        getter credential_provider_configurations : Array(Types::CredentialProviderConfiguration)?

        # The updated description for the gateway target.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Configuration for HTTP header and query parameter propagation to the gateway target.
        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfiguration?

        def initialize(
          @gateway_identifier : String,
          @name : String,
          @target_configuration : Types::TargetConfiguration,
          @target_id : String,
          @credential_provider_configurations : Array(Types::CredentialProviderConfiguration)? = nil,
          @description : String? = nil,
          @metadata_configuration : Types::MetadataConfiguration? = nil
        )
        end
      end

      struct UpdateGatewayTargetResponse
        include JSON::Serializable

        # The timestamp when the gateway target was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The updated credential provider configurations for the gateway target.
        @[JSON::Field(key: "credentialProviderConfigurations")]
        getter credential_provider_configurations : Array(Types::CredentialProviderConfiguration)

        # The Amazon Resource Name (ARN) of the gateway.
        @[JSON::Field(key: "gatewayArn")]
        getter gateway_arn : String

        # The updated name of the gateway target.
        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the updated gateway target.
        @[JSON::Field(key: "status")]
        getter status : String

        @[JSON::Field(key: "targetConfiguration")]
        getter target_configuration : Types::TargetConfiguration

        # The unique identifier of the updated gateway target.
        @[JSON::Field(key: "targetId")]
        getter target_id : String

        # The timestamp when the gateway target was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The updated description of the gateway target.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time at which the targets were last synchronized.
        @[JSON::Field(key: "lastSynchronizedAt")]
        getter last_synchronized_at : Time?

        # The metadata configuration that was applied to the gateway target.
        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfiguration?

        # The reasons for the current status of the updated gateway target.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        def initialize(
          @created_at : Time,
          @credential_provider_configurations : Array(Types::CredentialProviderConfiguration),
          @gateway_arn : String,
          @name : String,
          @status : String,
          @target_configuration : Types::TargetConfiguration,
          @target_id : String,
          @updated_at : Time,
          @description : String? = nil,
          @last_synchronized_at : Time? = nil,
          @metadata_configuration : Types::MetadataConfiguration? = nil,
          @status_reasons : Array(String)? = nil
        )
        end
      end

      struct UpdateMemoryInput
        include JSON::Serializable

        # The unique identifier of the memory to update.
        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # A client token is used for keeping track of idempotent requests. It can contain a session id which
        # can be around 250 chars, combined with a unique AWS identifier.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The updated description of the AgentCore Memory resource.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The number of days after which memory events will expire, between 7 and 365 days.
        @[JSON::Field(key: "eventExpiryDuration")]
        getter event_expiry_duration : Int32?

        # The ARN of the IAM role that provides permissions for the AgentCore Memory resource.
        @[JSON::Field(key: "memoryExecutionRoleArn")]
        getter memory_execution_role_arn : String?

        # The memory strategies to add, modify, or delete.
        @[JSON::Field(key: "memoryStrategies")]
        getter memory_strategies : Types::ModifyMemoryStrategies?

        def initialize(
          @memory_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @event_expiry_duration : Int32? = nil,
          @memory_execution_role_arn : String? = nil,
          @memory_strategies : Types::ModifyMemoryStrategies? = nil
        )
        end
      end

      struct UpdateMemoryOutput
        include JSON::Serializable

        # The updated AgentCore Memory resource details.
        @[JSON::Field(key: "memory")]
        getter memory : Types::Memory?

        def initialize(
          @memory : Types::Memory? = nil
        )
        end
      end

      struct UpdateOauth2CredentialProviderRequest
        include JSON::Serializable

        # The vendor of the OAuth2 credential provider.
        @[JSON::Field(key: "credentialProviderVendor")]
        getter credential_provider_vendor : String

        # The name of the OAuth2 credential provider to update.
        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration input for the OAuth2 provider.
        @[JSON::Field(key: "oauth2ProviderConfigInput")]
        getter oauth2_provider_config_input : Types::Oauth2ProviderConfigInput

        def initialize(
          @credential_provider_vendor : String,
          @name : String,
          @oauth2_provider_config_input : Types::Oauth2ProviderConfigInput
        )
        end
      end

      struct UpdateOauth2CredentialProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the client secret in AWS Secrets Manager.
        @[JSON::Field(key: "clientSecretArn")]
        getter client_secret_arn : Types::Secret

        # The timestamp when the OAuth2 credential provider was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the OAuth2 credential provider.
        @[JSON::Field(key: "credentialProviderArn")]
        getter credential_provider_arn : String

        # The vendor of the OAuth2 credential provider.
        @[JSON::Field(key: "credentialProviderVendor")]
        getter credential_provider_vendor : String

        # The timestamp when the OAuth2 credential provider was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the OAuth2 credential provider.
        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration output for the OAuth2 provider.
        @[JSON::Field(key: "oauth2ProviderConfigOutput")]
        getter oauth2_provider_config_output : Types::Oauth2ProviderConfigOutput

        # Callback URL to register on the OAuth2 credential provider as an allowed callback URL. This URL is
        # where the OAuth2 authorization server redirects users after they complete the authorization flow.
        @[JSON::Field(key: "callbackUrl")]
        getter callback_url : String?

        def initialize(
          @client_secret_arn : Types::Secret,
          @created_time : Time,
          @credential_provider_arn : String,
          @credential_provider_vendor : String,
          @last_updated_time : Time,
          @name : String,
          @oauth2_provider_config_output : Types::Oauth2ProviderConfigOutput,
          @callback_url : String? = nil
        )
        end
      end

      struct UpdateOnlineEvaluationConfigRequest
        include JSON::Serializable

        # The unique identifier of the online evaluation configuration to update.
        @[JSON::Field(key: "onlineEvaluationConfigId")]
        getter online_evaluation_config_id : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If you don't specify this field, a value is randomly generated for you. If this token matches a
        # previous request, the service ignores the request, but doesn't return an error. For more
        # information, see Ensuring idempotency .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The updated data source configuration specifying CloudWatch log groups and service names to monitor.
        @[JSON::Field(key: "dataSourceConfig")]
        getter data_source_config : Types::DataSourceConfig?

        # The updated description of the online evaluation configuration.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated Amazon Resource Name (ARN) of the IAM role used for evaluation execution.
        @[JSON::Field(key: "evaluationExecutionRoleArn")]
        getter evaluation_execution_role_arn : String?

        # The updated list of evaluators to apply during online evaluation.
        @[JSON::Field(key: "evaluators")]
        getter evaluators : Array(Types::EvaluatorReference)?

        # The updated execution status to enable or disable the online evaluation.
        @[JSON::Field(key: "executionStatus")]
        getter execution_status : String?

        # The updated evaluation rule containing sampling configuration, filters, and session settings.
        @[JSON::Field(key: "rule")]
        getter rule : Types::Rule?

        def initialize(
          @online_evaluation_config_id : String,
          @client_token : String? = nil,
          @data_source_config : Types::DataSourceConfig? = nil,
          @description : String? = nil,
          @evaluation_execution_role_arn : String? = nil,
          @evaluators : Array(Types::EvaluatorReference)? = nil,
          @execution_status : String? = nil,
          @rule : Types::Rule? = nil
        )
        end
      end

      struct UpdateOnlineEvaluationConfigResponse
        include JSON::Serializable

        # The execution status indicating whether the online evaluation is currently running.
        @[JSON::Field(key: "executionStatus")]
        getter execution_status : String

        # The Amazon Resource Name (ARN) of the updated online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigArn")]
        getter online_evaluation_config_arn : String

        # The unique identifier of the updated online evaluation configuration.
        @[JSON::Field(key: "onlineEvaluationConfigId")]
        getter online_evaluation_config_id : String

        # The status of the online evaluation configuration.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the online evaluation configuration was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The reason for failure if the online evaluation configuration update or execution failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        def initialize(
          @execution_status : String,
          @online_evaluation_config_arn : String,
          @online_evaluation_config_id : String,
          @status : String,
          @updated_at : Time,
          @failure_reason : String? = nil
        )
        end
      end

      struct UpdatePolicyEngineRequest
        include JSON::Serializable

        # The unique identifier of the policy engine to be updated.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The new description for the policy engine.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @policy_engine_id : String,
          @description : String? = nil
        )
        end
      end

      struct UpdatePolicyEngineResponse
        include JSON::Serializable

        # The original creation timestamp of the policy engine.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the updated policy engine.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the updated policy engine.
        @[JSON::Field(key: "policyEngineArn")]
        getter policy_engine_arn : String

        # The unique identifier of the updated policy engine.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The current status of the updated policy engine.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the update status.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy engine was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The updated description of the policy engine.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_engine_arn : String,
          @policy_engine_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct UpdatePolicyRequest
        include JSON::Serializable

        # The new Cedar policy statement that defines the access control rules. This replaces the existing
        # policy definition with new logic while maintaining the policy's identity.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinition

        # The identifier of the policy engine that manages the policy to be updated. This ensures the policy
        # is updated within the correct policy engine context.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier of the policy to be updated. This must be a valid policy ID that exists within
        # the specified policy engine.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The new human-readable description for the policy. This optional field allows updating the policy's
        # documentation while keeping the same policy logic.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The validation mode for the policy update. Determines how Cedar analyzer validation results are
        # handled during policy updates. FAIL_ON_ANY_FINDINGS runs the Cedar analyzer and fails the update if
        # validation issues are detected, ensuring the policy conforms to the Cedar schema and tool context.
        # IGNORE_ALL_FINDINGS runs the Cedar analyzer but allows updates despite validation warnings. Use
        # FAIL_ON_ANY_FINDINGS to ensure policy correctness during updates, especially when modifying policy
        # logic or conditions.
        @[JSON::Field(key: "validationMode")]
        getter validation_mode : String?

        def initialize(
          @definition : Types::PolicyDefinition,
          @policy_engine_id : String,
          @policy_id : String,
          @description : String? = nil,
          @validation_mode : String? = nil
        )
        end
      end

      struct UpdatePolicyResponse
        include JSON::Serializable

        # The original creation timestamp of the policy.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The updated Cedar policy statement.
        @[JSON::Field(key: "definition")]
        getter definition : Types::PolicyDefinition

        # The name of the updated policy.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the updated policy.
        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The identifier of the policy engine managing the updated policy.
        @[JSON::Field(key: "policyEngineId")]
        getter policy_engine_id : String

        # The unique identifier of the updated policy.
        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The current status of the updated policy.
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional information about the update status.
        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)

        # The timestamp when the policy was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The updated description of the policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @definition : Types::PolicyDefinition,
          @name : String,
          @policy_arn : String,
          @policy_engine_id : String,
          @policy_id : String,
          @status : String,
          @status_reasons : Array(String),
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct UpdateWorkloadIdentityRequest
        include JSON::Serializable

        # The name of the workload identity to update.
        @[JSON::Field(key: "name")]
        getter name : String

        # The new list of allowed OAuth2 return URLs for resources associated with this workload identity.
        # This list replaces the existing list.
        @[JSON::Field(key: "allowedResourceOauth2ReturnUrls")]
        getter allowed_resource_oauth2_return_urls : Array(String)?

        def initialize(
          @name : String,
          @allowed_resource_oauth2_return_urls : Array(String)? = nil
        )
        end
      end

      struct UpdateWorkloadIdentityResponse
        include JSON::Serializable

        # The timestamp when the workload identity was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The timestamp when the workload identity was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the workload identity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the workload identity.
        @[JSON::Field(key: "workloadIdentityArn")]
        getter workload_identity_arn : String

        # The list of allowed OAuth2 return URLs for resources associated with this workload identity.
        @[JSON::Field(key: "allowedResourceOauth2ReturnUrls")]
        getter allowed_resource_oauth2_return_urls : Array(String)?

        def initialize(
          @created_time : Time,
          @last_updated_time : Time,
          @name : String,
          @workload_identity_arn : String,
          @allowed_resource_oauth2_return_urls : Array(String)? = nil
        )
        end
      end

      # Contains user preference consolidation override configuration.
      struct UserPreferenceConsolidationOverride
        include JSON::Serializable

        # The text to append to the prompt for user preference consolidation.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for user preference consolidation.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Contains user preference extraction override configuration.
      struct UserPreferenceExtractionOverride
        include JSON::Serializable

        # The text to append to the prompt for user preference extraction.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for user preference extraction.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Input for creating a user preference memory strategy.
      struct UserPreferenceMemoryStrategyInput
        include JSON::Serializable

        # The name of the user preference memory strategy.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the user preference memory strategy.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The namespaces associated with the user preference memory strategy.
        @[JSON::Field(key: "namespaces")]
        getter namespaces : Array(String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @namespaces : Array(String)? = nil
        )
        end
      end

      # Input for user preference override configuration in a memory strategy.
      struct UserPreferenceOverrideConfigurationInput
        include JSON::Serializable

        # The consolidation configuration for a user preference override.
        @[JSON::Field(key: "consolidation")]
        getter consolidation : Types::UserPreferenceOverrideConsolidationConfigurationInput?

        # The extraction configuration for a user preference override.
        @[JSON::Field(key: "extraction")]
        getter extraction : Types::UserPreferenceOverrideExtractionConfigurationInput?

        def initialize(
          @consolidation : Types::UserPreferenceOverrideConsolidationConfigurationInput? = nil,
          @extraction : Types::UserPreferenceOverrideExtractionConfigurationInput? = nil
        )
        end
      end

      # Input for user preference override consolidation configuration in a memory strategy.
      struct UserPreferenceOverrideConsolidationConfigurationInput
        include JSON::Serializable

        # The text to append to the prompt for user preference consolidation.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for user preference consolidation.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # Input for user preference override extraction configuration in a memory strategy.
      struct UserPreferenceOverrideExtractionConfigurationInput
        include JSON::Serializable

        # The text to append to the prompt for user preference extraction.
        @[JSON::Field(key: "appendToPrompt")]
        getter append_to_prompt : String

        # The model ID to use for user preference extraction.
        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @append_to_prompt : String,
          @model_id : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by the service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        @[JSON::Field(key: "reason")]
        getter reason : String

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Stores information about a field passed inside a request that resulted in an exception.
      struct ValidationExceptionField
        include JSON::Serializable

        # A message describing why this field failed validation.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # VpcConfig for the Agent.
      struct VpcConfig
        include JSON::Serializable

        # The security groups associated with the VPC configuration.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)

        # The subnets associated with the VPC configuration.
        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)

        def initialize(
          @security_groups : Array(String),
          @subnets : Array(String)
        )
        end
      end

      # The information about the workload identity.
      struct WorkloadIdentityDetails
        include JSON::Serializable

        # The ARN associated with the workload identity.
        @[JSON::Field(key: "workloadIdentityArn")]
        getter workload_identity_arn : String

        def initialize(
          @workload_identity_arn : String
        )
        end
      end

      # Contains information about a workload identity.
      struct WorkloadIdentityType
        include JSON::Serializable

        # The name of the workload identity.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the workload identity.
        @[JSON::Field(key: "workloadIdentityArn")]
        getter workload_identity_arn : String

        def initialize(
          @name : String,
          @workload_identity_arn : String
        )
        end
      end
    end
  end
end
