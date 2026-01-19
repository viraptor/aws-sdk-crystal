require "json"
require "time"

module AwsSdk
  module BedrockAgentRuntime
    module Types

      # Contains details about the OpenAPI schema for the action group. For more information, see Action
      # group OpenAPI schemas . You can either include the schema directly in the payload field or you can
      # upload it to an S3 bucket and specify the S3 bucket location in the s3 field.
      struct APISchema
        include JSON::Serializable

        # The JSON or YAML-formatted payload defining the OpenAPI schema for the action group.
        @[JSON::Field(key: "payload")]
        getter payload : String?

        # Contains details about the S3 object containing the OpenAPI schema for the action group.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Identifier?

        def initialize(
          @payload : String? = nil,
          @s3 : Types::S3Identifier? = nil
        )
        end
      end

      # The request is denied because of missing access permissions. Check your permissions and retry your
      # request.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about the Lambda function containing the business logic that is carried out upon
      # invoking the action or the custom control method for handling the information elicited from the
      # user.
      struct ActionGroupExecutor
        include JSON::Serializable

        # To return the action group invocation results directly in the InvokeInlineAgent response, specify
        # RETURN_CONTROL .
        @[JSON::Field(key: "customControl")]
        getter custom_control : String?

        # The Amazon Resource Name (ARN) of the Lambda function containing the business logic that is carried
        # out upon invoking the action.
        @[JSON::Field(key: "lambda")]
        getter lambda : String?

        def initialize(
          @custom_control : String? = nil,
          @lambda : String? = nil
        )
        end
      end

      # Contains information about the action group being invoked. For more information about the possible
      # structures, see the InvocationInput tab in OrchestrationTrace in the Amazon Bedrock User Guide .
      struct ActionGroupInvocationInput
        include JSON::Serializable

        # The name of the action group.
        @[JSON::Field(key: "actionGroupName")]
        getter action_group_name : String?

        # The path to the API to call, based off the action group.
        @[JSON::Field(key: "apiPath")]
        getter api_path : String?

        # How fulfillment of the action is handled. For more information, see Handling fulfillment of the
        # action .
        @[JSON::Field(key: "executionType")]
        getter execution_type : String?

        # The function in the action group to call.
        @[JSON::Field(key: "function")]
        getter function : String?

        # The unique identifier of the invocation. Only returned if the executionType is RETURN_CONTROL .
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String?

        # The parameters in the Lambda input event.
        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::Parameter)?

        # The parameters in the request body for the Lambda input event.
        @[JSON::Field(key: "requestBody")]
        getter request_body : Types::RequestBody?

        # The API method being used, based off the action group.
        @[JSON::Field(key: "verb")]
        getter verb : String?

        def initialize(
          @action_group_name : String? = nil,
          @api_path : String? = nil,
          @execution_type : String? = nil,
          @function : String? = nil,
          @invocation_id : String? = nil,
          @parameters : Array(Types::Parameter)? = nil,
          @request_body : Types::RequestBody? = nil,
          @verb : String? = nil
        )
        end
      end

      # Contains the JSON-formatted string returned by the API invoked by the action group.
      struct ActionGroupInvocationOutput
        include JSON::Serializable

        # Contains information about the action group output.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # The JSON-formatted string returned by the API invoked by the action group.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @metadata : Types::Metadata? = nil,
          @text : String? = nil
        )
        end
      end

      struct AdditionalModelRequestFieldsValue
        include JSON::Serializable

        def initialize
        end
      end

      # Contains details of the inline agent's action group.
      struct AgentActionGroup
        include JSON::Serializable

        # The name of the action group.
        @[JSON::Field(key: "actionGroupName")]
        getter action_group_name : String

        # The Amazon Resource Name (ARN) of the Lambda function containing the business logic that is carried
        # out upon invoking the action or the custom control method for handling the information elicited from
        # the user.
        @[JSON::Field(key: "actionGroupExecutor")]
        getter action_group_executor : Types::ActionGroupExecutor?

        # Contains either details about the S3 object containing the OpenAPI schema for the action group or
        # the JSON or YAML-formatted payload defining the schema. For more information, see Action group
        # OpenAPI schemas .
        @[JSON::Field(key: "apiSchema")]
        getter api_schema : Types::APISchema?

        # A description of the action group.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains details about the function schema for the action group or the JSON or YAML-formatted
        # payload defining the schema.
        @[JSON::Field(key: "functionSchema")]
        getter function_schema : Types::FunctionSchema?

        # Specify a built-in or computer use action for this action group. If you specify a value, you must
        # leave the description , apiSchema , and actionGroupExecutor fields empty for this action group. To
        # allow your agent to request the user for additional information when trying to complete a task, set
        # this field to AMAZON.UserInput . To allow your agent to generate, run, and troubleshoot code when
        # trying to complete a task, set this field to AMAZON.CodeInterpreter . To allow your agent to use an
        # Anthropic computer use tool, specify one of the following values. Computer use is a new Anthropic
        # Claude model capability (in beta) available with Anthropic Claude 3.7 Sonnet and Claude 3.5 Sonnet
        # v2 only. When operating computer use functionality, we recommend taking additional security
        # precautions, such as executing computer actions in virtual environments with restricted data access
        # and limited internet connectivity. For more information, see Configure an Amazon Bedrock Agent to
        # complete tasks with computer use tools . ANTHROPIC.Computer - Gives the agent permission to use the
        # mouse and keyboard and take screenshots. ANTHROPIC.TextEditor - Gives the agent permission to view,
        # create and edit files. ANTHROPIC.Bash - Gives the agent permission to run commands in a bash shell.
        @[JSON::Field(key: "parentActionGroupSignature")]
        getter parent_action_group_signature : String?

        # The configuration settings for a computer use action. Computer use is a new Anthropic Claude model
        # capability (in beta) available with Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only. For more
        # information, see Configure an Amazon Bedrock Agent to complete tasks with computer use tools .
        @[JSON::Field(key: "parentActionGroupSignatureParams")]
        getter parent_action_group_signature_params : Hash(String, String)?

        def initialize(
          @action_group_name : String,
          @action_group_executor : Types::ActionGroupExecutor? = nil,
          @api_schema : Types::APISchema? = nil,
          @description : String? = nil,
          @function_schema : Types::FunctionSchema? = nil,
          @parent_action_group_signature : String? = nil,
          @parent_action_group_signature_params : Hash(String, String)? = nil
        )
        end
      end

      # Input for an agent collaborator. The input can be text or an action invocation result.
      struct AgentCollaboratorInputPayload
        include JSON::Serializable

        # An action invocation result.
        @[JSON::Field(key: "returnControlResults")]
        getter return_control_results : Types::ReturnControlResults?

        # Input text.
        @[JSON::Field(key: "text")]
        getter text : String?

        # The input type.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @return_control_results : Types::ReturnControlResults? = nil,
          @text : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An agent collaborator invocation input.
      struct AgentCollaboratorInvocationInput
        include JSON::Serializable

        # The collaborator's alias ARN.
        @[JSON::Field(key: "agentCollaboratorAliasArn")]
        getter agent_collaborator_alias_arn : String?

        # The collaborator's name.
        @[JSON::Field(key: "agentCollaboratorName")]
        getter agent_collaborator_name : String?

        # Text or action invocation result input for the collaborator.
        @[JSON::Field(key: "input")]
        getter input : Types::AgentCollaboratorInputPayload?

        def initialize(
          @agent_collaborator_alias_arn : String? = nil,
          @agent_collaborator_name : String? = nil,
          @input : Types::AgentCollaboratorInputPayload? = nil
        )
        end
      end

      # Output from an agent collaborator.
      struct AgentCollaboratorInvocationOutput
        include JSON::Serializable

        # The output's agent collaborator alias ARN.
        @[JSON::Field(key: "agentCollaboratorAliasArn")]
        getter agent_collaborator_alias_arn : String?

        # The output's agent collaborator name.
        @[JSON::Field(key: "agentCollaboratorName")]
        getter agent_collaborator_name : String?

        # Contains information about the output from the agent collaborator.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # The output's output.
        @[JSON::Field(key: "output")]
        getter output : Types::AgentCollaboratorOutputPayload?

        def initialize(
          @agent_collaborator_alias_arn : String? = nil,
          @agent_collaborator_name : String? = nil,
          @metadata : Types::Metadata? = nil,
          @output : Types::AgentCollaboratorOutputPayload? = nil
        )
        end
      end

      # Output from an agent collaborator. The output can be text or an action invocation result.
      struct AgentCollaboratorOutputPayload
        include JSON::Serializable

        # An action invocation result.
        @[JSON::Field(key: "returnControlPayload")]
        getter return_control_payload : Types::ReturnControlPayload?

        # Text output.
        @[JSON::Field(key: "text")]
        getter text : String?

        # The type of output.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @return_control_payload : Types::ReturnControlPayload? = nil,
          @text : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An event in which the prompt was analyzed in preparation for optimization.
      struct AnalyzePromptEvent
        include JSON::Serializable

        # A message describing the analysis of the prompt.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about the API operation that the agent predicts should be called. This data
      # type is used in the following API operations: In the returnControl field of the InvokeAgent response
      struct ApiInvocationInput
        include JSON::Serializable

        # The action group that the API operation belongs to.
        @[JSON::Field(key: "actionGroup")]
        getter action_group : String

        # Contains information about the API operation to invoke.
        @[JSON::Field(key: "actionInvocationType")]
        getter action_invocation_type : String?

        # The agent's ID.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # The path to the API operation.
        @[JSON::Field(key: "apiPath")]
        getter api_path : String?

        # The agent collaborator's name.
        @[JSON::Field(key: "collaboratorName")]
        getter collaborator_name : String?

        # The HTTP method of the API operation.
        @[JSON::Field(key: "httpMethod")]
        getter http_method : String?

        # The parameters to provide for the API request, as the agent elicited from the user.
        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::ApiParameter)?

        # The request body to provide for the API request, as the agent elicited from the user.
        @[JSON::Field(key: "requestBody")]
        getter request_body : Types::ApiRequestBody?

        def initialize(
          @action_group : String,
          @action_invocation_type : String? = nil,
          @agent_id : String? = nil,
          @api_path : String? = nil,
          @collaborator_name : String? = nil,
          @http_method : String? = nil,
          @parameters : Array(Types::ApiParameter)? = nil,
          @request_body : Types::ApiRequestBody? = nil
        )
        end
      end

      # Information about a parameter to provide to the API request. This data type is used in the following
      # API operations: InvokeAgent response
      struct ApiParameter
        include JSON::Serializable

        # The name of the parameter.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The data type for the parameter.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The value of the parameter.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The request body to provide for the API request, as the agent elicited from the user. This data type
      # is used in the following API operations: InvokeAgent response
      struct ApiRequestBody
        include JSON::Serializable

        # The content of the request body. The key of the object in this field is a media type defining the
        # format of the request body.
        @[JSON::Field(key: "content")]
        getter content : Hash(String, Types::PropertyParameters)?

        def initialize(
          @content : Hash(String, Types::PropertyParameters)? = nil
        )
        end
      end

      # Contains information about the API operation that was called from the action group and the response
      # body that was returned. This data type is used in the following API operations: In the
      # returnControlInvocationResults of the InvokeAgent request
      struct ApiResult
        include JSON::Serializable

        # The action group that the API operation belongs to.
        @[JSON::Field(key: "actionGroup")]
        getter action_group : String

        # The agent's ID.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # The path to the API operation.
        @[JSON::Field(key: "apiPath")]
        getter api_path : String?

        # Controls the API operations or functions to invoke based on the user confirmation.
        @[JSON::Field(key: "confirmationState")]
        getter confirmation_state : String?

        # The HTTP method for the API operation.
        @[JSON::Field(key: "httpMethod")]
        getter http_method : String?

        # http status code from API execution response (for example: 200, 400, 500).
        @[JSON::Field(key: "httpStatusCode")]
        getter http_status_code : Int32?

        # The response body from the API operation. The key of the object is the content type (currently, only
        # TEXT is supported). The response may be returned directly or from the Lambda function.
        @[JSON::Field(key: "responseBody")]
        getter response_body : Hash(String, Types::ContentBody)?

        # Controls the final response state returned to end user when API/Function execution failed. When this
        # state is FAILURE, the request would fail with dependency failure exception. When this state is
        # REPROMPT, the API/function response will be sent to model for re-prompt
        @[JSON::Field(key: "responseState")]
        getter response_state : String?

        def initialize(
          @action_group : String,
          @agent_id : String? = nil,
          @api_path : String? = nil,
          @confirmation_state : String? = nil,
          @http_method : String? = nil,
          @http_status_code : Int32? = nil,
          @response_body : Hash(String, Types::ContentBody)? = nil,
          @response_state : String? = nil
        )
        end
      end

      # Contains citations for a part of an agent response.
      struct Attribution
        include JSON::Serializable

        # A list of citations and related information for a part of an agent response.
        @[JSON::Field(key: "citations")]
        getter citations : Array(Types::Citation)?

        def initialize(
          @citations : Array(Types::Citation)? = nil
        )
        end
      end

      # Contains information about an audio segment retrieved from a knowledge base, including its location
      # and transcription. This data type is used in the following API operations: Retrieve response – in
      # the audio field
      struct AudioSegment
        include JSON::Serializable

        # The S3 URI where this specific audio segment is stored in the multimodal storage destination.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # The text transcription of the audio segment content.
        @[JSON::Field(key: "transcription")]
        getter transcription : String?

        def initialize(
          @s3_uri : String,
          @transcription : String? = nil
        )
        end
      end

      # There was an issue with a dependency due to a server issue. Retry your request.
      struct BadGatewayException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the dependency that caused the issue, such as Amazon Bedrock, Lambda, or STS.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Settings for a model called with InvokeAgent .
      struct BedrockModelConfigurations
        include JSON::Serializable

        # The performance configuration for the model.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        def initialize(
          @performance_config : Types::PerformanceConfiguration? = nil
        )
        end
      end

      # Contains configurations for an Amazon Bedrock reranker model.
      struct BedrockRerankingConfiguration
        include JSON::Serializable

        # Contains configurations for a reranker model.
        @[JSON::Field(key: "modelConfiguration")]
        getter model_configuration : Types::BedrockRerankingModelConfiguration

        # The number of results to return after reranking.
        @[JSON::Field(key: "numberOfResults")]
        getter number_of_results : Int32?

        def initialize(
          @model_configuration : Types::BedrockRerankingModelConfiguration,
          @number_of_results : Int32? = nil
        )
        end
      end

      # Contains configurations for a reranker model.
      struct BedrockRerankingModelConfiguration
        include JSON::Serializable

        # The ARN of the reranker model.
        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # A JSON object whose keys are request fields for the model and whose values are values for those
        # fields.
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        def initialize(
          @model_arn : String,
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil
        )
        end
      end

      # A block of content that you pass to, or receive from, a Amazon Bedrock session in an invocation
      # step. You pass the content to a session in the payLoad of the PutInvocationStep API operation. You
      # retrieve the content with the GetInvocationStep API operation. For more information about sessions,
      # see Store and retrieve conversation history and context with Amazon Bedrock sessions .
      struct BedrockSessionContentBlock
        include JSON::Serializable

        # The image in the invocation step.
        @[JSON::Field(key: "image")]
        getter image : Types::ImageBlock?

        # The text in the invocation step.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @image : Types::ImageBlock? = nil,
          @text : String? = nil
        )
        end
      end

      # This property contains the document to chat with, along with its attributes.
      struct ByteContentDoc
        include JSON::Serializable

        # The MIME type of the document contained in the wrapper object.
        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The byte value of the file to upload, encoded as a Base-64 string.
        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The file name of the document contained in the wrapper object.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @content_type : String,
          @data : Bytes,
          @identifier : String
        )
        end
      end

      # The property contains the file to chat with, along with its attributes.
      struct ByteContentFile
        include JSON::Serializable

        # The raw bytes of the file to attach. The maximum size of all files that is attached is 10MB. You can
        # attach a maximum of 5 files.
        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The MIME type of data contained in the file used for chat.
        @[JSON::Field(key: "mediaType")]
        getter media_type : String

        def initialize(
          @data : Bytes,
          @media_type : String
        )
        end
      end

      # Details about a caller.
      struct Caller
        include JSON::Serializable

        # The caller's agent alias ARN.
        @[JSON::Field(key: "agentAliasArn")]
        getter agent_alias_arn : String?

        def initialize(
          @agent_alias_arn : String? = nil
        )
        end
      end

      # An object containing a segment of the generated response that is based on a source in the knowledge
      # base, alongside information about the source. This data type is used in the following API
      # operations: InvokeAgent response – in the citations field RetrieveAndGenerate response – in the
      # citations field
      struct Citation
        include JSON::Serializable

        # Contains the generated response and metadata
        @[JSON::Field(key: "generatedResponsePart")]
        getter generated_response_part : Types::GeneratedResponsePart?

        # Contains metadata about the sources cited for the generated response.
        @[JSON::Field(key: "retrievedReferences")]
        getter retrieved_references : Array(Types::RetrievedReference)?

        def initialize(
          @generated_response_part : Types::GeneratedResponsePart? = nil,
          @retrieved_references : Array(Types::RetrievedReference)? = nil
        )
        end
      end

      # A citation event.
      struct CitationEvent
        include JSON::Serializable

        # The citation.
        @[JSON::Field(key: "citation")]
        getter citation : Types::Citation?

        # The generated response to the citation event.
        @[JSON::Field(key: "generatedResponsePart")]
        getter generated_response_part : Types::GeneratedResponsePart?

        # The retrieved references of the citation event.
        @[JSON::Field(key: "retrievedReferences")]
        getter retrieved_references : Array(Types::RetrievedReference)?

        def initialize(
          @citation : Types::Citation? = nil,
          @generated_response_part : Types::GeneratedResponsePart? = nil,
          @retrieved_references : Array(Types::RetrievedReference)? = nil
        )
        end
      end

      # Contains information about the code interpreter being invoked.
      struct CodeInterpreterInvocationInput
        include JSON::Serializable

        # The code for the code interpreter to use.
        @[JSON::Field(key: "code")]
        getter code : String?

        # Files that are uploaded for code interpreter to use.
        @[JSON::Field(key: "files")]
        getter files : Array(String)?

        def initialize(
          @code : String? = nil,
          @files : Array(String)? = nil
        )
        end
      end

      # Contains the JSON-formatted string returned by the API invoked by the code interpreter.
      struct CodeInterpreterInvocationOutput
        include JSON::Serializable

        # Contains the error returned from code execution.
        @[JSON::Field(key: "executionError")]
        getter execution_error : String?

        # Contains the successful output returned from code execution
        @[JSON::Field(key: "executionOutput")]
        getter execution_output : String?

        # Indicates if the execution of the code timed out.
        @[JSON::Field(key: "executionTimeout")]
        getter execution_timeout : Bool?

        # Contains output files, if generated by code execution.
        @[JSON::Field(key: "files")]
        getter files : Array(String)?

        # Contains information about the output from the code interpreter.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        def initialize(
          @execution_error : String? = nil,
          @execution_output : String? = nil,
          @execution_timeout : Bool? = nil,
          @files : Array(String)? = nil,
          @metadata : Types::Metadata? = nil
        )
        end
      end

      # List of inline collaborators.
      struct Collaborator
        include JSON::Serializable

        # The foundation model used by the inline collaborator agent.
        @[JSON::Field(key: "foundationModel")]
        getter foundation_model : String

        # Instruction that tell the inline collaborator agent what it should do and how it should interact
        # with users.
        @[JSON::Field(key: "instruction")]
        getter instruction : String

        # List of action groups with each action group defining tasks the inline collaborator agent needs to
        # carry out.
        @[JSON::Field(key: "actionGroups")]
        getter action_groups : Array(Types::AgentActionGroup)?

        # Defines how the inline supervisor agent handles information across multiple collaborator agents to
        # coordinate a final response.
        @[JSON::Field(key: "agentCollaboration")]
        getter agent_collaboration : String?

        # Name of the inline collaborator agent which must be the same name as specified for collaboratorName
        # .
        @[JSON::Field(key: "agentName")]
        getter agent_name : String?

        # Settings of the collaborator agent.
        @[JSON::Field(key: "collaboratorConfigurations")]
        getter collaborator_configurations : Array(Types::CollaboratorConfiguration)?

        # The Amazon Resource Name (ARN) of the AWS KMS key that encrypts the inline collaborator.
        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # Details of the guardwrail associated with the inline collaborator.
        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfigurationWithArn?

        # The number of seconds for which the Amazon Bedrock keeps information about the user's conversation
        # with the inline collaborator agent. A user interaction remains active for the amount of time
        # specified. If no conversation occurs during this time, the session expires and Amazon Bedrock
        # deletes any data provided before the timeout.
        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # Knowledge base associated with the inline collaborator agent.
        @[JSON::Field(key: "knowledgeBases")]
        getter knowledge_bases : Array(Types::KnowledgeBase)?

        # Contains configurations to override prompt templates in different parts of an inline collaborator
        # sequence. For more information, see Advanced prompts .
        @[JSON::Field(key: "promptOverrideConfiguration")]
        getter prompt_override_configuration : Types::PromptOverrideConfiguration?

        def initialize(
          @foundation_model : String,
          @instruction : String,
          @action_groups : Array(Types::AgentActionGroup)? = nil,
          @agent_collaboration : String? = nil,
          @agent_name : String? = nil,
          @collaborator_configurations : Array(Types::CollaboratorConfiguration)? = nil,
          @customer_encryption_key_arn : String? = nil,
          @guardrail_configuration : Types::GuardrailConfigurationWithArn? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @knowledge_bases : Array(Types::KnowledgeBase)? = nil,
          @prompt_override_configuration : Types::PromptOverrideConfiguration? = nil
        )
        end
      end

      # Settings of an inline collaborator agent.
      struct CollaboratorConfiguration
        include JSON::Serializable

        # Instructions that tell the inline collaborator agent what it should do and how it should interact
        # with users.
        @[JSON::Field(key: "collaboratorInstruction")]
        getter collaborator_instruction : String

        # Name of the inline collaborator agent which must be the same name as specified for agentName .
        @[JSON::Field(key: "collaboratorName")]
        getter collaborator_name : String

        # The Amazon Resource Name (ARN) of the inline collaborator agent.
        @[JSON::Field(key: "agentAliasArn")]
        getter agent_alias_arn : String?

        # A relay conversation history for the inline collaborator agent.
        @[JSON::Field(key: "relayConversationHistory")]
        getter relay_conversation_history : String?

        def initialize(
          @collaborator_instruction : String,
          @collaborator_name : String,
          @agent_alias_arn : String? = nil,
          @relay_conversation_history : String? = nil
        )
        end
      end

      # Contains information about a condition evaluation result during a flow execution. This event is
      # generated when a condition node in the flow evaluates its conditions. Flow executions is in preview
      # release for Amazon Bedrock and is subject to change.
      struct ConditionResultEvent
        include JSON::Serializable

        # The name of the condition node that evaluated the conditions.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # A list of conditions that were satisfied during the evaluation.
        @[JSON::Field(key: "satisfiedConditions")]
        getter satisfied_conditions : Array(Types::SatisfiedCondition)

        # The timestamp when the condition evaluation occurred.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @node_name : String,
          @satisfied_conditions : Array(Types::SatisfiedCondition),
          @timestamp : Time
        )
        end
      end

      # There was a conflict performing an operation. Resolve the conflict and retry your request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A content block.
      struct ContentBlock
        include JSON::Serializable

        # The block's text.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Contains the body of the API response. This data type is used in the following API operations: In
      # the returnControlInvocationResults field of the InvokeAgent request
      struct ContentBody
        include JSON::Serializable

        # The body of the API response.
        @[JSON::Field(key: "body")]
        getter body : String?

        # Lists details, including format and source, for the image in the response from the function call.
        # You can specify only one image and the function in the returnControlInvocationResults must be a
        # computer use action. For more information, see Configure an Amazon Bedrock Agent to complete tasks
        # with computer use tools .
        @[JSON::Field(key: "images")]
        getter images : Array(Types::ImageInput)?

        def initialize(
          @body : String? = nil,
          @images : Array(Types::ImageInput)? = nil
        )
        end
      end

      # A conversation history.
      struct ConversationHistory
        include JSON::Serializable

        # The conversation's messages.
        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?

        def initialize(
          @messages : Array(Types::Message)? = nil
        )
        end
      end

      struct CreateInvocationRequest
        include JSON::Serializable

        # The unique identifier for the associated session for the invocation. You can specify either the
        # session's sessionId or its Amazon Resource Name (ARN).
        @[JSON::Field(key: "sessionIdentifier")]
        getter session_identifier : String

        # A description for the interactions in the invocation. For example, "User asking about weather in
        # Seattle".
        @[JSON::Field(key: "description")]
        getter description : String?

        # A unique identifier for the invocation in UUID format.
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String?

        def initialize(
          @session_identifier : String,
          @description : String? = nil,
          @invocation_id : String? = nil
        )
        end
      end

      struct CreateInvocationResponse
        include JSON::Serializable

        # The timestamp for when the invocation was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier for the invocation.
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String

        # The unique identifier for the session associated with the invocation.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @created_at : Time,
          @invocation_id : String,
          @session_id : String
        )
        end
      end

      struct CreateSessionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the KMS key to use to encrypt the session data. The user or role
        # creating the session must have permission to use the key. For more information, see Amazon Bedrock
        # session encryption .
        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # A map of key-value pairs containing attributes to be persisted across the session. For example, the
        # user's ID, their language preference, and the type of device they are using.
        @[JSON::Field(key: "sessionMetadata")]
        getter session_metadata : Hash(String, String)?

        # Specify the key-value pairs for the tags that you want to attach to the session.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @encryption_key_arn : String? = nil,
          @session_metadata : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSessionResponse
        include JSON::Serializable

        # The timestamp for when the session was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the created session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier for the session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The current status of the session.
        @[JSON::Field(key: "sessionStatus")]
        getter session_status : String

        def initialize(
          @created_at : Time,
          @session_arn : String,
          @session_id : String,
          @session_status : String
        )
        end
      end

      # Contains details of the custom orchestration configured for the agent.
      struct CustomOrchestration
        include JSON::Serializable

        # The structure of the executor invoking the actions in custom orchestration.
        @[JSON::Field(key: "executor")]
        getter executor : Types::OrchestrationExecutor?

        def initialize(
          @executor : Types::OrchestrationExecutor? = nil
        )
        end
      end

      # The trace behavior for the custom orchestration.
      struct CustomOrchestrationTrace
        include JSON::Serializable

        # The event details used with the custom orchestration.
        @[JSON::Field(key: "event")]
        getter event : Types::CustomOrchestrationTraceEvent?

        # The unique identifier of the trace.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @event : Types::CustomOrchestrationTraceEvent? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # The event in the custom orchestration sequence. Events are the responses which the custom
      # orchestration Lambda function sends as response to the agent.
      struct CustomOrchestrationTraceEvent
        include JSON::Serializable

        # The text that prompted the event at this step.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      struct DeleteAgentMemoryRequest
        include JSON::Serializable

        # The unique identifier of an alias of an agent.
        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String

        # The unique identifier of the agent to which the alias belongs.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The unique identifier of the memory.
        @[JSON::Field(key: "memoryId")]
        getter memory_id : String?

        # The unique session identifier of the memory.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @agent_alias_id : String,
          @agent_id : String,
          @memory_id : String? = nil,
          @session_id : String? = nil
        )
        end
      end

      struct DeleteAgentMemoryResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSessionRequest
        include JSON::Serializable

        # The unique identifier for the session to be deleted. You can specify either the session's sessionId
        # or its Amazon Resource Name (ARN).
        @[JSON::Field(key: "sessionIdentifier")]
        getter session_identifier : String

        def initialize(
          @session_identifier : String
        )
        end
      end

      struct DeleteSessionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # There was an issue with a dependency. Check the resource configurations and retry the request.
      struct DependencyFailedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the dependency that caused the issue, such as Amazon Bedrock, Lambda, or STS.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      struct EndSessionRequest
        include JSON::Serializable

        # The unique identifier for the session to end. You can specify either the session's sessionId or its
        # Amazon Resource Name (ARN).
        @[JSON::Field(key: "sessionIdentifier")]
        getter session_identifier : String

        def initialize(
          @session_identifier : String
        )
        end
      end

      struct EndSessionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the session you ended.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier of the session you ended.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The current status of the session you ended.
        @[JSON::Field(key: "sessionStatus")]
        getter session_status : String

        def initialize(
          @session_arn : String,
          @session_id : String,
          @session_status : String
        )
        end
      end

      # The unique external source of the content contained in the wrapper object.
      struct ExternalSource
        include JSON::Serializable

        # The source type of the external source wrapper object.
        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # The identifier, contentType, and data of the external source wrapper object.
        @[JSON::Field(key: "byteContent")]
        getter byte_content : Types::ByteContentDoc?

        # The S3 location of the external source wrapper object.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3ObjectDoc?

        def initialize(
          @source_type : String,
          @byte_content : Types::ByteContentDoc? = nil,
          @s3_location : Types::S3ObjectDoc? = nil
        )
        end
      end

      # Contains the generation configuration of the external source wrapper object.
      struct ExternalSourcesGenerationConfiguration
        include JSON::Serializable

        # Additional model parameters and their corresponding values not included in the textInferenceConfig
        # structure for an external source. Takes in custom model parameters specific to the language model
        # being used.
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        # The configuration details for the guardrail.
        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # Configuration settings for inference when using RetrieveAndGenerate to generate responses while
        # using an external source.
        @[JSON::Field(key: "inferenceConfig")]
        getter inference_config : Types::InferenceConfig?

        # The latency configuration for the model.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        # Contain the textPromptTemplate string for the external source wrapper object.
        @[JSON::Field(key: "promptTemplate")]
        getter prompt_template : Types::PromptTemplate?

        def initialize(
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @inference_config : Types::InferenceConfig? = nil,
          @performance_config : Types::PerformanceConfiguration? = nil,
          @prompt_template : Types::PromptTemplate? = nil
        )
        end
      end

      # The configurations of the external source wrapper object in the retrieveAndGenerate function.
      struct ExternalSourcesRetrieveAndGenerateConfiguration
        include JSON::Serializable

        # The model Amazon Resource Name (ARN) for the external source wrapper object in the
        # retrieveAndGenerate function.
        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The document for the external source wrapper object in the retrieveAndGenerate function.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::ExternalSource)

        # The prompt used with the external source wrapper object with the retrieveAndGenerate function.
        @[JSON::Field(key: "generationConfiguration")]
        getter generation_configuration : Types::ExternalSourcesGenerationConfiguration?

        def initialize(
          @model_arn : String,
          @sources : Array(Types::ExternalSource),
          @generation_configuration : Types::ExternalSourcesGenerationConfiguration? = nil
        )
        end
      end

      # Contains information about the failure of the interaction.
      struct FailureTrace
        include JSON::Serializable

        # The failure code for the trace.
        @[JSON::Field(key: "failureCode")]
        getter failure_code : Int32?

        # The reason the interaction failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # Information about the failure that occurred.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # The unique identifier of the trace.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @failure_code : Int32? = nil,
          @failure_reason : String? = nil,
          @metadata : Types::Metadata? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # Contains information for a metadata field to include in or exclude from consideration when
      # reranking.
      struct FieldForReranking
        include JSON::Serializable

        # The name of a metadata field to include in or exclude from consideration when reranking.
        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        def initialize(
          @field_name : String
        )
        end
      end

      # Contains intermediate response for code interpreter if any files have been generated.
      struct FilePart
        include JSON::Serializable

        # Files containing intermediate response for the user.
        @[JSON::Field(key: "files")]
        getter files : Array(Types::OutputFile)?

        def initialize(
          @files : Array(Types::OutputFile)? = nil
        )
        end
      end

      # The source file of the content contained in the wrapper object.
      struct FileSource
        include JSON::Serializable

        # The source type of the files to attach.
        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # The data and the text of the attached files.
        @[JSON::Field(key: "byteContent")]
        getter byte_content : Types::ByteContentFile?

        # The s3 location of the files to attach.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3ObjectFile?

        def initialize(
          @source_type : String,
          @byte_content : Types::ByteContentFile? = nil,
          @s3_location : Types::S3ObjectFile? = nil
        )
        end
      end

      # Specifies the name that the metadata attribute must match and the value to which to compare the
      # value of the metadata attribute. For more information, see Query configurations . This data type is
      # used in the following API operations: RetrieveAndGenerate request
      struct FilterAttribute
        include JSON::Serializable

        # The name that the metadata attribute must match.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value to whcih to compare the value of the metadata attribute.
        @[JSON::Field(key: "value")]
        getter value : Types::FilterValue

        def initialize(
          @key : String,
          @value : Types::FilterValue
        )
        end
      end

      struct FilterValue
        include JSON::Serializable

        def initialize
        end
      end

      # Contains details about the response to the user.
      struct FinalResponse
        include JSON::Serializable

        # Contains information about the invoke agent operation.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # The text in the response to the user.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @metadata : Types::Metadata? = nil,
          @text : String? = nil
        )
        end
      end

      # Contains information about why a flow completed.
      struct FlowCompletionEvent
        include JSON::Serializable

        # The reason that the flow completed.
        @[JSON::Field(key: "completionReason")]
        getter completion_reason : String

        def initialize(
          @completion_reason : String
        )
        end
      end

      # Contains the content of an flow execution input or output field. Flow executions is in preview
      # release for Amazon Bedrock and is subject to change.
      struct FlowExecutionContent
        include JSON::Serializable

        # The document content of the field, which can contain text or structured data.
        @[JSON::Field(key: "document")]
        getter document : Types::Document?

        def initialize(
          @document : Types::Document? = nil
        )
        end
      end

      # Contains information about an error that occurred during an flow execution. Flow executions is in
      # preview release for Amazon Bedrock and is subject to change.
      struct FlowExecutionError
        include JSON::Serializable

        # The error code for the type of error that occurred.
        @[JSON::Field(key: "error")]
        getter error : String?

        # A descriptive message that provides details about the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the node in the flow where the error occurred (if applicable).
        @[JSON::Field(key: "nodeName")]
        getter node_name : String?

        def initialize(
          @error : String? = nil,
          @message : String? = nil,
          @node_name : String? = nil
        )
        end
      end

      # Represents an event that occurred during an flow execution. This is a union type that can contain
      # one of several event types, such as node input and output events; flow input and output events;
      # condition node result events, or failure events. Flow executions is in preview release for Amazon
      # Bedrock and is subject to change.
      struct FlowExecutionEvent
        include JSON::Serializable

        # Contains information about a condition evaluation result during the flow execution. This event is
        # generated when a condition node in the flow evaluates its conditions.
        @[JSON::Field(key: "conditionResultEvent")]
        getter condition_result_event : Types::ConditionResultEvent?

        # Contains information about a failure that occurred at the flow level during execution.
        @[JSON::Field(key: "flowFailureEvent")]
        getter flow_failure_event : Types::FlowFailureEvent?

        # Contains information about the inputs provided to the flow at the start of execution.
        @[JSON::Field(key: "flowInputEvent")]
        getter flow_input_event : Types::FlowExecutionInputEvent?

        # Contains information about the outputs produced by the flow at the end of execution.
        @[JSON::Field(key: "flowOutputEvent")]
        getter flow_output_event : Types::FlowExecutionOutputEvent?

        # Contains information about an action (operation) called by a node during execution.
        @[JSON::Field(key: "nodeActionEvent")]
        getter node_action_event : Types::NodeActionEvent?

        # Contains information about an internal trace of a specific node during execution.
        @[JSON::Field(key: "nodeDependencyEvent")]
        getter node_dependency_event : Types::NodeDependencyEvent?

        # Contains information about a failure that occurred at a specific node during execution.
        @[JSON::Field(key: "nodeFailureEvent")]
        getter node_failure_event : Types::NodeFailureEvent?

        # Contains information about the inputs provided to a specific node during execution.
        @[JSON::Field(key: "nodeInputEvent")]
        getter node_input_event : Types::NodeInputEvent?

        # Contains information about the outputs produced by a specific node during execution.
        @[JSON::Field(key: "nodeOutputEvent")]
        getter node_output_event : Types::NodeOutputEvent?

        def initialize(
          @condition_result_event : Types::ConditionResultEvent? = nil,
          @flow_failure_event : Types::FlowFailureEvent? = nil,
          @flow_input_event : Types::FlowExecutionInputEvent? = nil,
          @flow_output_event : Types::FlowExecutionOutputEvent? = nil,
          @node_action_event : Types::NodeActionEvent? = nil,
          @node_dependency_event : Types::NodeDependencyEvent? = nil,
          @node_failure_event : Types::NodeFailureEvent? = nil,
          @node_input_event : Types::NodeInputEvent? = nil,
          @node_output_event : Types::NodeOutputEvent? = nil
        )
        end
      end

      # Contains information about the inputs provided to the flow at the start of a flow execution. Flow
      # executions is in preview release for Amazon Bedrock and is subject to change.
      struct FlowExecutionInputEvent
        include JSON::Serializable

        # A list of input fields provided to the flow.
        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FlowInputField)

        # The name of the node that receives the inputs.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The timestamp when the inputs are provided.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @fields : Array(Types::FlowInputField),
          @node_name : String,
          @timestamp : Time
        )
        end
      end

      # Contains information about the outputs produced by the flow during a flow execution. Flow executions
      # is in preview release for Amazon Bedrock and is subject to change.
      struct FlowExecutionOutputEvent
        include JSON::Serializable

        # A list of output fields produced by the flow.
        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FlowOutputField)

        # The name of the node that produces the outputs.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The timestamp when the outputs are produced.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @fields : Array(Types::FlowOutputField),
          @node_name : String,
          @timestamp : Time
        )
        end
      end

      # Contains summary information about a flow execution, including its status, timestamps, and
      # identifiers. Flow executions is in preview release for Amazon Bedrock and is subject to change.
      struct FlowExecutionSummary
        include JSON::Serializable

        # The timestamp when the flow execution was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) that uniquely identifies the flow execution.
        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # The unique identifier of the flow alias used for the execution.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String

        # The unique identifier of the flow.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # The version of the flow used for the execution.
        @[JSON::Field(key: "flowVersion")]
        getter flow_version : String

        # The current status of the flow execution. Flow executions time out after 24 hours.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the flow execution ended. This field is only populated when the execution has
        # completed, failed, timed out, or been aborted.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        def initialize(
          @created_at : Time,
          @execution_arn : String,
          @flow_alias_identifier : String,
          @flow_identifier : String,
          @flow_version : String,
          @status : String,
          @ended_at : Time? = nil
        )
        end
      end

      # Contains information about a failure that occurred at the flow level during a flow execution. Flow
      # executions is in preview release for Amazon Bedrock and is subject to change.
      struct FlowFailureEvent
        include JSON::Serializable

        # The error code that identifies the type of failure that occurred.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # A descriptive message that provides details about the failure.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The timestamp when the failure occurred.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @error_code : String,
          @error_message : String,
          @timestamp : Time
        )
        end
      end

      # Contains information about an input into the prompt flow and where to send it.
      struct FlowInput
        include JSON::Serializable

        # Contains information about an input into the prompt flow.
        @[JSON::Field(key: "content")]
        getter content : Types::FlowInputContent

        # The name of the flow input node that begins the prompt flow.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The name of the input from the flow input node.
        @[JSON::Field(key: "nodeInputName")]
        getter node_input_name : String?

        # The name of the output from the flow input node that begins the prompt flow.
        @[JSON::Field(key: "nodeOutputName")]
        getter node_output_name : String?

        def initialize(
          @content : Types::FlowInputContent,
          @node_name : String,
          @node_input_name : String? = nil,
          @node_output_name : String? = nil
        )
        end
      end

      # Contains information about an input into the flow.
      struct FlowInputContent
        include JSON::Serializable

        # The input to send to the prompt flow input node.
        @[JSON::Field(key: "document")]
        getter document : Types::Document?

        def initialize(
          @document : Types::Document? = nil
        )
        end
      end

      # Represents an input field provided to a flow during a flow execution. Flow executions is in preview
      # release for Amazon Bedrock and is subject to change.
      struct FlowInputField
        include JSON::Serializable

        # The content of the input field, which can contain text or structured data.
        @[JSON::Field(key: "content")]
        getter content : Types::FlowExecutionContent

        # The name of the input field as defined in the flow's input schema.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @content : Types::FlowExecutionContent,
          @name : String
        )
        end
      end

      # The content structure containing input information for multi-turn flow interactions.
      struct FlowMultiTurnInputContent
        include JSON::Serializable

        # The requested additional input to send back to the multi-turn flow node.
        @[JSON::Field(key: "document")]
        getter document : Types::Document?

        def initialize(
          @document : Types::Document? = nil
        )
        end
      end

      # Response object from the flow multi-turn node requesting additional information.
      struct FlowMultiTurnInputRequestEvent
        include JSON::Serializable

        # The content payload containing the input request details for the multi-turn interaction.
        @[JSON::Field(key: "content")]
        getter content : Types::FlowMultiTurnInputContent

        # The name of the node in the flow that is requesting the input.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The type of the node in the flow that is requesting the input.
        @[JSON::Field(key: "nodeType")]
        getter node_type : String

        def initialize(
          @content : Types::FlowMultiTurnInputContent,
          @node_name : String,
          @node_type : String
        )
        end
      end

      # Contains information about the content in an output from prompt flow invocation.
      struct FlowOutputContent
        include JSON::Serializable

        # The content in the output.
        @[JSON::Field(key: "document")]
        getter document : Types::Document?

        def initialize(
          @document : Types::Document? = nil
        )
        end
      end

      # Contains information about an output from prompt flow invoction.
      struct FlowOutputEvent
        include JSON::Serializable

        # The content in the output.
        @[JSON::Field(key: "content")]
        getter content : Types::FlowOutputContent

        # The name of the flow output node that the output is from.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The type of the node that the output is from.
        @[JSON::Field(key: "nodeType")]
        getter node_type : String

        def initialize(
          @content : Types::FlowOutputContent,
          @node_name : String,
          @node_type : String
        )
        end
      end

      # Represents an output field produced by a flow during a flow execution. Flow executions is in preview
      # release for Amazon Bedrock and is subject to change.
      struct FlowOutputField
        include JSON::Serializable

        # The content of the output field, which can contain text or structured data.
        @[JSON::Field(key: "content")]
        getter content : Types::FlowExecutionContent

        # The name of the output field as defined in the flow's output schema.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @content : Types::FlowExecutionContent,
          @name : String
        )
        end
      end

      # The output of the flow.
      struct FlowResponseStream
        include JSON::Serializable

        # The request is denied because of missing access permissions. Check your permissions and retry your
        # request.
        @[JSON::Field(key: "accessDeniedException")]
        getter access_denied_exception : Types::AccessDeniedException?

        # There was an issue with a dependency due to a server issue. Retry your request.
        @[JSON::Field(key: "badGatewayException")]
        getter bad_gateway_exception : Types::BadGatewayException?

        # There was a conflict performing an operation. Resolve the conflict and retry your request.
        @[JSON::Field(key: "conflictException")]
        getter conflict_exception : Types::ConflictException?

        # There was an issue with a dependency. Check the resource configurations and retry the request.
        @[JSON::Field(key: "dependencyFailedException")]
        getter dependency_failed_exception : Types::DependencyFailedException?

        # Contains information about why the flow completed.
        @[JSON::Field(key: "flowCompletionEvent")]
        getter flow_completion_event : Types::FlowCompletionEvent?

        # The event stream containing the multi-turn input request information from the flow.
        @[JSON::Field(key: "flowMultiTurnInputRequestEvent")]
        getter flow_multi_turn_input_request_event : Types::FlowMultiTurnInputRequestEvent?

        # Contains information about an output from flow invocation.
        @[JSON::Field(key: "flowOutputEvent")]
        getter flow_output_event : Types::FlowOutputEvent?

        # Contains information about a trace, which tracks an input or output for a node in the flow.
        @[JSON::Field(key: "flowTraceEvent")]
        getter flow_trace_event : Types::FlowTraceEvent?

        # An internal server error occurred. Retry your request.
        @[JSON::Field(key: "internalServerException")]
        getter internal_server_exception : Types::InternalServerException?

        # The specified resource Amazon Resource Name (ARN) was not found. Check the Amazon Resource Name
        # (ARN) and try your request again.
        @[JSON::Field(key: "resourceNotFoundException")]
        getter resource_not_found_exception : Types::ResourceNotFoundException?

        # The number of requests exceeds the service quota. Resubmit your request later.
        @[JSON::Field(key: "serviceQuotaExceededException")]
        getter service_quota_exceeded_exception : Types::ServiceQuotaExceededException?

        # The number of requests exceeds the limit. Resubmit your request later.
        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?

        # Input validation failed. Check your request parameters and retry the request.
        @[JSON::Field(key: "validationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @access_denied_exception : Types::AccessDeniedException? = nil,
          @bad_gateway_exception : Types::BadGatewayException? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @dependency_failed_exception : Types::DependencyFailedException? = nil,
          @flow_completion_event : Types::FlowCompletionEvent? = nil,
          @flow_multi_turn_input_request_event : Types::FlowMultiTurnInputRequestEvent? = nil,
          @flow_output_event : Types::FlowOutputEvent? = nil,
          @flow_trace_event : Types::FlowTraceEvent? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @resource_not_found_exception : Types::ResourceNotFoundException? = nil,
          @service_quota_exceeded_exception : Types::ServiceQuotaExceededException? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end

      # Contains information about an input or output for a node in the flow. For more information, see
      # Track each step in your prompt flow by viewing its trace in Amazon Bedrock .
      struct FlowTrace
        include JSON::Serializable

        # Contains information about an output from a condition node.
        @[JSON::Field(key: "conditionNodeResultTrace")]
        getter condition_node_result_trace : Types::FlowTraceConditionNodeResultEvent?

        # Contains information about an action (operation) called by a node.
        @[JSON::Field(key: "nodeActionTrace")]
        getter node_action_trace : Types::FlowTraceNodeActionEvent?

        # Contains information about an internal trace of a node.
        @[JSON::Field(key: "nodeDependencyTrace")]
        getter node_dependency_trace : Types::FlowTraceDependencyEvent?

        # Contains information about the input into a node.
        @[JSON::Field(key: "nodeInputTrace")]
        getter node_input_trace : Types::FlowTraceNodeInputEvent?

        # Contains information about the output from a node.
        @[JSON::Field(key: "nodeOutputTrace")]
        getter node_output_trace : Types::FlowTraceNodeOutputEvent?

        def initialize(
          @condition_node_result_trace : Types::FlowTraceConditionNodeResultEvent? = nil,
          @node_action_trace : Types::FlowTraceNodeActionEvent? = nil,
          @node_dependency_trace : Types::FlowTraceDependencyEvent? = nil,
          @node_input_trace : Types::FlowTraceNodeInputEvent? = nil,
          @node_output_trace : Types::FlowTraceNodeOutputEvent? = nil
        )
        end
      end

      # Contains information about a condition that was satisfied. For more information, see Track each step
      # in your prompt flow by viewing its trace in Amazon Bedrock .
      struct FlowTraceCondition
        include JSON::Serializable

        # The name of the condition.
        @[JSON::Field(key: "conditionName")]
        getter condition_name : String

        def initialize(
          @condition_name : String
        )
        end
      end

      # Contains information about an output from a condition node. For more information, see Track each
      # step in your prompt flow by viewing its trace in Amazon Bedrock .
      struct FlowTraceConditionNodeResultEvent
        include JSON::Serializable

        # The name of the condition node.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # An array of objects containing information about the conditions that were satisfied.
        @[JSON::Field(key: "satisfiedConditions")]
        getter satisfied_conditions : Array(Types::FlowTraceCondition)

        # The date and time that the trace was returned.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @node_name : String,
          @satisfied_conditions : Array(Types::FlowTraceCondition),
          @timestamp : Time
        )
        end
      end

      # Contains information about a dependency trace event in the flow.
      struct FlowTraceDependencyEvent
        include JSON::Serializable

        # The name of the node that generated the dependency trace.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The date and time that the dependency trace was generated.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The trace elements containing detailed information about the dependency.
        @[JSON::Field(key: "traceElements")]
        getter trace_elements : Types::TraceElements

        def initialize(
          @node_name : String,
          @timestamp : Time,
          @trace_elements : Types::TraceElements
        )
        end
      end

      # Contains information about a trace, which tracks an input or output for a node in the flow. For more
      # information, see Track each step in your prompt flow by viewing its trace in Amazon Bedrock .
      struct FlowTraceEvent
        include JSON::Serializable

        # The trace object containing information about an input or output for a node in the flow.
        @[JSON::Field(key: "trace")]
        getter trace : Types::FlowTrace

        def initialize(
          @trace : Types::FlowTrace
        )
        end
      end

      # Contains information about an action (operation) called by a node in an Amazon Bedrock flow. The
      # service generates action events for calls made by prompt nodes, agent nodes, and Amazon Web Services
      # Lambda nodes.
      struct FlowTraceNodeActionEvent
        include JSON::Serializable

        # The name of the node that called the operation.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The name of the operation that the node called.
        @[JSON::Field(key: "operationName")]
        getter operation_name : String

        # The ID of the request that the node made to the operation.
        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # The name of the service that the node called.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The date and time that the operation was called.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The request payload sent to the downstream service.
        @[JSON::Field(key: "operationRequest")]
        getter operation_request : Types::Document?

        # The response payload received from the downstream service.
        @[JSON::Field(key: "operationResponse")]
        getter operation_response : Types::Document?

        def initialize(
          @node_name : String,
          @operation_name : String,
          @request_id : String,
          @service_name : String,
          @timestamp : Time,
          @operation_request : Types::Document? = nil,
          @operation_response : Types::Document? = nil
        )
        end
      end

      # Contains the content of the node input. For more information, see Track each step in your prompt
      # flow by viewing its trace in Amazon Bedrock .
      struct FlowTraceNodeInputContent
        include JSON::Serializable

        # The content of the node input.
        @[JSON::Field(key: "document")]
        getter document : Types::Document?

        def initialize(
          @document : Types::Document? = nil
        )
        end
      end

      # Contains information about the input into a node. For more information, see Track each step in your
      # prompt flow by viewing its trace in Amazon Bedrock .
      struct FlowTraceNodeInputEvent
        include JSON::Serializable

        # An array of objects containing information about each field in the input.
        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FlowTraceNodeInputField)

        # The name of the node that received the input.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The date and time that the trace was returned.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @fields : Array(Types::FlowTraceNodeInputField),
          @node_name : String,
          @timestamp : Time
        )
        end
      end

      # Represents an item in the execution chain for flow trace node input tracking.
      struct FlowTraceNodeInputExecutionChainItem
        include JSON::Serializable

        # The name of the node in the execution chain.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The type of execution chain item. Supported values are Iterator and Loop.
        @[JSON::Field(key: "type")]
        getter type : String

        # The index position of this item in the execution chain.
        @[JSON::Field(key: "index")]
        getter index : Int32?

        def initialize(
          @node_name : String,
          @type : String,
          @index : Int32? = nil
        )
        end
      end

      # Contains information about a field in the input into a node. For more information, see Track each
      # step in your prompt flow by viewing its trace in Amazon Bedrock .
      struct FlowTraceNodeInputField
        include JSON::Serializable

        # The content of the node input.
        @[JSON::Field(key: "content")]
        getter content : Types::FlowTraceNodeInputContent

        # The name of the node input.
        @[JSON::Field(key: "nodeInputName")]
        getter node_input_name : String

        # The category of the input field.
        @[JSON::Field(key: "category")]
        getter category : String?

        # The execution path through nested nodes like iterators and loops.
        @[JSON::Field(key: "executionChain")]
        getter execution_chain : Array(Types::FlowTraceNodeInputExecutionChainItem)?

        # The source node that provides input data to this field.
        @[JSON::Field(key: "source")]
        getter source : Types::FlowTraceNodeInputSource?

        # The data type of the input field for compatibility validation.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @content : Types::FlowTraceNodeInputContent,
          @node_input_name : String,
          @category : String? = nil,
          @execution_chain : Array(Types::FlowTraceNodeInputExecutionChainItem)? = nil,
          @source : Types::FlowTraceNodeInputSource? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents the source of input data for a flow trace node field.
      struct FlowTraceNodeInputSource
        include JSON::Serializable

        # The expression used to extract data from the source.
        @[JSON::Field(key: "expression")]
        getter expression : String

        # The name of the source node that provides the input data.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The name of the output field from the source node.
        @[JSON::Field(key: "outputFieldName")]
        getter output_field_name : String

        def initialize(
          @expression : String,
          @node_name : String,
          @output_field_name : String
        )
        end
      end

      # Contains the content of the node output. For more information, see Track each step in your prompt
      # flow by viewing its trace in Amazon Bedrock .
      struct FlowTraceNodeOutputContent
        include JSON::Serializable

        # The content of the node output.
        @[JSON::Field(key: "document")]
        getter document : Types::Document?

        def initialize(
          @document : Types::Document? = nil
        )
        end
      end

      # Contains information about the output from a node. For more information, see Track each step in your
      # prompt flow by viewing its trace in Amazon Bedrock .
      struct FlowTraceNodeOutputEvent
        include JSON::Serializable

        # An array of objects containing information about each field in the output.
        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::FlowTraceNodeOutputField)

        # The name of the node that yielded the output.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The date and time that the trace was returned.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @fields : Array(Types::FlowTraceNodeOutputField),
          @node_name : String,
          @timestamp : Time
        )
        end
      end

      # Contains information about a field in the output from a node. For more information, see Track each
      # step in your prompt flow by viewing its trace in Amazon Bedrock .
      struct FlowTraceNodeOutputField
        include JSON::Serializable

        # The content of the node output.
        @[JSON::Field(key: "content")]
        getter content : Types::FlowTraceNodeOutputContent

        # The name of the node output.
        @[JSON::Field(key: "nodeOutputName")]
        getter node_output_name : String

        # The next node that receives output data from this field.
        @[JSON::Field(key: "next")]
        getter next : Array(Types::FlowTraceNodeOutputNext)?

        # The data type of the output field for compatibility validation.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @content : Types::FlowTraceNodeOutputContent,
          @node_output_name : String,
          @next : Array(Types::FlowTraceNodeOutputNext)? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents the next node that receives output data from a flow trace.
      struct FlowTraceNodeOutputNext
        include JSON::Serializable

        # The name of the input field in the next node that receives the data.
        @[JSON::Field(key: "inputFieldName")]
        getter input_field_name : String

        # The name of the next node that receives the output data.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        def initialize(
          @input_field_name : String,
          @node_name : String
        )
        end
      end

      # Defines parameters that the agent needs to invoke from the user to complete the function.
      # Corresponds to an action in an action group.
      struct FunctionDefinition
        include JSON::Serializable

        # A name for the function.
        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the function and its purpose.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The parameters that the agent elicits from the user to fulfill the function.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::ParameterDetail)?

        # Contains information if user confirmation is required to invoke the function.
        @[JSON::Field(key: "requireConfirmation")]
        getter require_confirmation : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @parameters : Hash(String, Types::ParameterDetail)? = nil,
          @require_confirmation : String? = nil
        )
        end
      end

      # Contains information about the function that the agent predicts should be called. This data type is
      # used in the following API operations: In the returnControl field of the InvokeAgent response
      struct FunctionInvocationInput
        include JSON::Serializable

        # The action group that the function belongs to.
        @[JSON::Field(key: "actionGroup")]
        getter action_group : String

        # Contains information about the function to invoke,
        @[JSON::Field(key: "actionInvocationType")]
        getter action_invocation_type : String?

        # The agent's ID.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # The collaborator's name.
        @[JSON::Field(key: "collaboratorName")]
        getter collaborator_name : String?

        # The name of the function.
        @[JSON::Field(key: "function")]
        getter function : String?

        # A list of parameters of the function.
        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::FunctionParameter)?

        def initialize(
          @action_group : String,
          @action_invocation_type : String? = nil,
          @agent_id : String? = nil,
          @collaborator_name : String? = nil,
          @function : String? = nil,
          @parameters : Array(Types::FunctionParameter)? = nil
        )
        end
      end

      # Contains information about a parameter of the function. This data type is used in the following API
      # operations: In the returnControl field of the InvokeAgent response
      struct FunctionParameter
        include JSON::Serializable

        # The name of the parameter.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The data type of the parameter.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The value of the parameter.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains information about the function that was called from the action group and the response that
      # was returned. This data type is used in the following API operations: In the
      # returnControlInvocationResults of the InvokeAgent request
      struct FunctionResult
        include JSON::Serializable

        # The action group that the function belongs to.
        @[JSON::Field(key: "actionGroup")]
        getter action_group : String

        # The agent's ID.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # Contains the user confirmation information about the function that was called.
        @[JSON::Field(key: "confirmationState")]
        getter confirmation_state : String?

        # The name of the function that was called.
        @[JSON::Field(key: "function")]
        getter function : String?

        # The response from the function call using the parameters. The response might be returned directly or
        # from the Lambda function. Specify TEXT or IMAGES . The key of the object is the content type. You
        # can only specify one type. If you specify IMAGES , you can specify only one image. You can specify
        # images only when the function in the returnControlInvocationResults is a computer use action. For
        # more information, see Configure an Amazon Bedrock Agent to complete tasks with computer use tools .
        @[JSON::Field(key: "responseBody")]
        getter response_body : Hash(String, Types::ContentBody)?

        # Controls the final response state returned to end user when API/Function execution failed. When this
        # state is FAILURE, the request would fail with dependency failure exception. When this state is
        # REPROMPT, the API/function response will be sent to model for re-prompt
        @[JSON::Field(key: "responseState")]
        getter response_state : String?

        def initialize(
          @action_group : String,
          @agent_id : String? = nil,
          @confirmation_state : String? = nil,
          @function : String? = nil,
          @response_body : Hash(String, Types::ContentBody)? = nil,
          @response_state : String? = nil
        )
        end
      end

      # Contains details about the function schema for the action group or the JSON or YAML-formatted
      # payload defining the schema.
      struct FunctionSchema
        include JSON::Serializable

        # A list of functions that each define an action in the action group.
        @[JSON::Field(key: "functions")]
        getter functions : Array(Types::FunctionDefinition)?

        def initialize(
          @functions : Array(Types::FunctionDefinition)? = nil
        )
        end
      end

      struct GenerateQueryRequest
        include JSON::Serializable

        # Specifies information about a natural language query to transform into SQL.
        @[JSON::Field(key: "queryGenerationInput")]
        getter query_generation_input : Types::QueryGenerationInput

        # Specifies configurations for transforming the natural language query into SQL.
        @[JSON::Field(key: "transformationConfiguration")]
        getter transformation_configuration : Types::TransformationConfiguration

        def initialize(
          @query_generation_input : Types::QueryGenerationInput,
          @transformation_configuration : Types::TransformationConfiguration
        )
        end
      end

      struct GenerateQueryResponse
        include JSON::Serializable

        # A list of objects, each of which defines a generated query that can correspond to the natural
        # language queries.
        @[JSON::Field(key: "queries")]
        getter queries : Array(Types::GeneratedQuery)?

        def initialize(
          @queries : Array(Types::GeneratedQuery)? = nil
        )
        end
      end

      # Contains information about a query generated for a natural language query.
      struct GeneratedQuery
        include JSON::Serializable

        # An SQL query that corresponds to the natural language query.
        @[JSON::Field(key: "sql")]
        getter sql : String?

        # The type of transformed query.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @sql : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains metadata about a part of the generated response that is accompanied by a citation. This
      # data type is used in the following API operations: InvokeAgent response – in the
      # generatedResponsePart field RetrieveAndGenerate response – in the generatedResponsePart field
      struct GeneratedResponsePart
        include JSON::Serializable

        # Contains metadata about a textual part of the generated response that is accompanied by a citation.
        @[JSON::Field(key: "textResponsePart")]
        getter text_response_part : Types::TextResponsePart?

        def initialize(
          @text_response_part : Types::TextResponsePart? = nil
        )
        end
      end

      # Contains configurations for response generation based on the knowledge base query results. This data
      # type is used in the following API operations: RetrieveAndGenerate request
      struct GenerationConfiguration
        include JSON::Serializable

        # Additional model parameters and corresponding values not included in the textInferenceConfig
        # structure for a knowledge base. This allows users to provide custom model parameters specific to the
        # language model being used.
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        # The configuration details for the guardrail.
        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # Configuration settings for inference when using RetrieveAndGenerate to generate responses while
        # using a knowledge base as a source.
        @[JSON::Field(key: "inferenceConfig")]
        getter inference_config : Types::InferenceConfig?

        # The latency configuration for the model.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        # Contains the template for the prompt that's sent to the model for response generation. Generation
        # prompts must include the $search_results$ variable. For more information, see Use placeholder
        # variables in the user guide.
        @[JSON::Field(key: "promptTemplate")]
        getter prompt_template : Types::PromptTemplate?

        def initialize(
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @inference_config : Types::InferenceConfig? = nil,
          @performance_config : Types::PerformanceConfiguration? = nil,
          @prompt_template : Types::PromptTemplate? = nil
        )
        end
      end

      struct GetAgentMemoryRequest
        include JSON::Serializable

        # The unique identifier of an alias of an agent.
        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String

        # The unique identifier of the agent to which the alias belongs.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The unique identifier of the memory.
        @[JSON::Field(key: "memoryId")]
        getter memory_id : String

        # The type of memory.
        @[JSON::Field(key: "memoryType")]
        getter memory_type : String

        # The maximum number of items to return in the response. If the total number of results is greater
        # than this value, use the token returned in the response in the nextToken field when making another
        # request to return the next batch of results.
        @[JSON::Field(key: "maxItems")]
        getter max_items : Int32?

        # If the total number of results is greater than the maxItems value provided in the request, enter the
        # token returned in the nextToken field in the response in this field to return the next batch of
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_alias_id : String,
          @agent_id : String,
          @memory_id : String,
          @memory_type : String,
          @max_items : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAgentMemoryResponse
        include JSON::Serializable

        # Contains details of the sessions stored in the memory
        @[JSON::Field(key: "memoryContents")]
        getter memory_contents : Array(Types::Memory)?

        # If the total number of results is greater than the maxItems value provided in the request, use this
        # token when making another request in the nextToken field to return the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @memory_contents : Array(Types::Memory)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetExecutionFlowSnapshotRequest
        include JSON::Serializable

        # The unique identifier of the flow execution.
        @[JSON::Field(key: "executionIdentifier")]
        getter execution_identifier : String

        # The unique identifier of the flow alias used for the flow execution.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String

        # The unique identifier of the flow.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        def initialize(
          @execution_identifier : String,
          @flow_alias_identifier : String,
          @flow_identifier : String
        )
        end
      end

      struct GetExecutionFlowSnapshotResponse
        include JSON::Serializable

        # The flow definition used for the flow execution, including the nodes, connections, and configuration
        # at the time when the execution started. The definition returns as a string that follows the
        # structure of a FlowDefinition object.
        @[JSON::Field(key: "definition")]
        getter definition : String

        # The Amazon Resource Name (ARN) of the IAM service role that's used by the flow execution.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The unique identifier of the flow alias used for the flow execution.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String

        # The unique identifier of the flow.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # The version of the flow used for the flow execution.
        @[JSON::Field(key: "flowVersion")]
        getter flow_version : String

        # The Amazon Resource Name (ARN) of the customer managed KMS key that's used to encrypt the flow
        # snapshot.
        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        def initialize(
          @definition : String,
          @execution_role_arn : String,
          @flow_alias_identifier : String,
          @flow_identifier : String,
          @flow_version : String,
          @customer_encryption_key_arn : String? = nil
        )
        end
      end

      struct GetFlowExecutionRequest
        include JSON::Serializable

        # The unique identifier of the flow execution to retrieve.
        @[JSON::Field(key: "executionIdentifier")]
        getter execution_identifier : String

        # The unique identifier of the flow alias used for the execution.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String

        # The unique identifier of the flow.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        def initialize(
          @execution_identifier : String,
          @flow_alias_identifier : String,
          @flow_identifier : String
        )
        end
      end

      struct GetFlowExecutionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the flow execution.
        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # The unique identifier of the flow alias used for the execution.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String

        # The unique identifier of the flow.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # The version of the flow used for the execution.
        @[JSON::Field(key: "flowVersion")]
        getter flow_version : String

        # The timestamp when the flow execution started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time

        # The current status of the flow execution. Flow executions time out after 24 hours.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the flow execution ended. This field is only populated when the execution has
        # completed, failed, timed out, or been aborted.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # A list of errors that occurred during the flow execution. Each error includes an error code,
        # message, and the node where the error occurred, if applicable.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::FlowExecutionError)?

        def initialize(
          @execution_arn : String,
          @flow_alias_identifier : String,
          @flow_identifier : String,
          @flow_version : String,
          @started_at : Time,
          @status : String,
          @ended_at : Time? = nil,
          @errors : Array(Types::FlowExecutionError)? = nil
        )
        end
      end

      struct GetInvocationStepRequest
        include JSON::Serializable

        # The unique identifier for the invocation in UUID format.
        @[JSON::Field(key: "invocationIdentifier")]
        getter invocation_identifier : String

        # The unique identifier (in UUID format) for the specific invocation step to retrieve.
        @[JSON::Field(key: "invocationStepId")]
        getter invocation_step_id : String

        # The unique identifier for the invocation step's associated session. You can specify either the
        # session's sessionId or its Amazon Resource Name (ARN).
        @[JSON::Field(key: "sessionIdentifier")]
        getter session_identifier : String

        def initialize(
          @invocation_identifier : String,
          @invocation_step_id : String,
          @session_identifier : String
        )
        end
      end

      struct GetInvocationStepResponse
        include JSON::Serializable

        # The complete details of the requested invocation step.
        @[JSON::Field(key: "invocationStep")]
        getter invocation_step : Types::InvocationStep

        def initialize(
          @invocation_step : Types::InvocationStep
        )
        end
      end

      struct GetSessionRequest
        include JSON::Serializable

        # A unique identifier for the session to retrieve. You can specify either the session's sessionId or
        # its Amazon Resource Name (ARN).
        @[JSON::Field(key: "sessionIdentifier")]
        getter session_identifier : String

        def initialize(
          @session_identifier : String
        )
        end
      end

      struct GetSessionResponse
        include JSON::Serializable

        # The timestamp for when the session was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp for when the session was last modified.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The Amazon Resource Name (ARN) of the session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier for the session in UUID format.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The current status of the session.
        @[JSON::Field(key: "sessionStatus")]
        getter session_status : String

        # The Amazon Resource Name (ARN) of the Key Management Service key used to encrypt the session data.
        # For more information, see Amazon Bedrock session encryption .
        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # A map of key-value pairs containing attributes persisted across the session.
        @[JSON::Field(key: "sessionMetadata")]
        getter session_metadata : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @last_updated_at : Time,
          @session_arn : String,
          @session_id : String,
          @session_status : String,
          @encryption_key_arn : String? = nil,
          @session_metadata : Hash(String, String)? = nil
        )
        end
      end

      # Assessment details of the content analyzed by Guardrails.
      struct GuardrailAssessment
        include JSON::Serializable

        # Content policy details of the Guardrail.
        @[JSON::Field(key: "contentPolicy")]
        getter content_policy : Types::GuardrailContentPolicyAssessment?

        # Sensitive Information policy details of Guardrail.
        @[JSON::Field(key: "sensitiveInformationPolicy")]
        getter sensitive_information_policy : Types::GuardrailSensitiveInformationPolicyAssessment?

        # Topic policy details of the Guardrail.
        @[JSON::Field(key: "topicPolicy")]
        getter topic_policy : Types::GuardrailTopicPolicyAssessment?

        # Word policy details of the Guardrail.
        @[JSON::Field(key: "wordPolicy")]
        getter word_policy : Types::GuardrailWordPolicyAssessment?

        def initialize(
          @content_policy : Types::GuardrailContentPolicyAssessment? = nil,
          @sensitive_information_policy : Types::GuardrailSensitiveInformationPolicyAssessment? = nil,
          @topic_policy : Types::GuardrailTopicPolicyAssessment? = nil,
          @word_policy : Types::GuardrailWordPolicyAssessment? = nil
        )
        end
      end

      # The configuration details for the guardrail.
      struct GuardrailConfiguration
        include JSON::Serializable

        # The unique identifier for the guardrail.
        @[JSON::Field(key: "guardrailId")]
        getter guardrail_id : String

        # The version of the guardrail.
        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String

        def initialize(
          @guardrail_id : String,
          @guardrail_version : String
        )
        end
      end

      # The configuration details for the guardrail.
      struct GuardrailConfigurationWithArn
        include JSON::Serializable

        # The unique identifier for the guardrail.
        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String

        # The version of the guardrail.
        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String

        def initialize(
          @guardrail_identifier : String,
          @guardrail_version : String
        )
        end
      end

      # Details of the content filter used in the Guardrail.
      struct GuardrailContentFilter
        include JSON::Serializable

        # The action placed on the content by the Guardrail filter.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The confidence level regarding the content detected in the filter by the Guardrail.
        @[JSON::Field(key: "confidence")]
        getter confidence : String?

        # The type of content detected in the filter by the Guardrail.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @action : String? = nil,
          @confidence : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The details of the policy assessment in the Guardrails filter.
      struct GuardrailContentPolicyAssessment
        include JSON::Serializable

        # The filter details of the policy assessment used in the Guardrails filter.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::GuardrailContentFilter)?

        def initialize(
          @filters : Array(Types::GuardrailContentFilter)? = nil
        )
        end
      end

      # The custom word details for the filter in the Guardrail.
      struct GuardrailCustomWord
        include JSON::Serializable

        # The action details for the custom word filter in the Guardrail.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The match details for the custom word filter in the Guardrail.
        @[JSON::Field(key: "match")]
        getter match : String?

        def initialize(
          @action : String? = nil,
          @match : String? = nil
        )
        end
      end

      # A guardrail event.
      struct GuardrailEvent
        include JSON::Serializable

        # The guardrail action.
        @[JSON::Field(key: "action")]
        getter action : String?

        def initialize(
          @action : String? = nil
        )
        end
      end

      # The managed word details for the filter in the Guardrail.
      struct GuardrailManagedWord
        include JSON::Serializable

        # The action details for the managed word filter in the Guardrail.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The match details for the managed word filter in the Guardrail.
        @[JSON::Field(key: "match")]
        getter match : String?

        # The type details for the managed word filter in the Guardrail.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @action : String? = nil,
          @match : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The Guardrail filter to identify and remove personally identifiable information (PII).
      struct GuardrailPiiEntityFilter
        include JSON::Serializable

        # The action of the Guardrail filter to identify and remove PII.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The match to settings in the Guardrail filter to identify and remove PII.
        @[JSON::Field(key: "match")]
        getter match : String?

        # The type of PII the Guardrail filter has identified and removed.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @action : String? = nil,
          @match : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The details for the regex filter used in the Guardrail.
      struct GuardrailRegexFilter
        include JSON::Serializable

        # The action details for the regex filter used in the Guardrail.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The match details for the regex filter used in the Guardrail.
        @[JSON::Field(key: "match")]
        getter match : String?

        # The name details for the regex filter used in the Guardrail.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The regex details for the regex filter used in the Guardrail.
        @[JSON::Field(key: "regex")]
        getter regex : String?

        def initialize(
          @action : String? = nil,
          @match : String? = nil,
          @name : String? = nil,
          @regex : String? = nil
        )
        end
      end

      # The details of the sensitive policy assessment used in the Guardrail.
      struct GuardrailSensitiveInformationPolicyAssessment
        include JSON::Serializable

        # The details of the PII entities used in the sensitive policy assessment for the Guardrail.
        @[JSON::Field(key: "piiEntities")]
        getter pii_entities : Array(Types::GuardrailPiiEntityFilter)?

        # The details of the regexes used in the sensitive policy assessment for the Guardrail.
        @[JSON::Field(key: "regexes")]
        getter regexes : Array(Types::GuardrailRegexFilter)?

        def initialize(
          @pii_entities : Array(Types::GuardrailPiiEntityFilter)? = nil,
          @regexes : Array(Types::GuardrailRegexFilter)? = nil
        )
        end
      end

      # The details for a specific topic defined in the Guardrail.
      struct GuardrailTopic
        include JSON::Serializable

        # The action details on a specific topic in the Guardrail.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The name details on a specific topic in the Guardrail.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type details on a specific topic in the Guardrail.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @action : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The details of the policy assessment used in the Guardrail.
      struct GuardrailTopicPolicyAssessment
        include JSON::Serializable

        # The topic details of the policy assessment used in the Guardrail.
        @[JSON::Field(key: "topics")]
        getter topics : Array(Types::GuardrailTopic)?

        def initialize(
          @topics : Array(Types::GuardrailTopic)? = nil
        )
        end
      end

      # The trace details used in the Guardrail.
      struct GuardrailTrace
        include JSON::Serializable

        # The trace action details used with the Guardrail.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The details of the input assessments used in the Guardrail Trace.
        @[JSON::Field(key: "inputAssessments")]
        getter input_assessments : Array(Types::GuardrailAssessment)?

        # Contains information about the Guardrail output.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # The details of the output assessments used in the Guardrail Trace.
        @[JSON::Field(key: "outputAssessments")]
        getter output_assessments : Array(Types::GuardrailAssessment)?

        # The details of the trace Id used in the Guardrail Trace.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @action : String? = nil,
          @input_assessments : Array(Types::GuardrailAssessment)? = nil,
          @metadata : Types::Metadata? = nil,
          @output_assessments : Array(Types::GuardrailAssessment)? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # The assessment details for words defined in the Guardrail filter.
      struct GuardrailWordPolicyAssessment
        include JSON::Serializable

        # The custom word details for words defined in the Guardrail filter.
        @[JSON::Field(key: "customWords")]
        getter custom_words : Array(Types::GuardrailCustomWord)?

        # The managed word lists for words defined in the Guardrail filter.
        @[JSON::Field(key: "managedWordLists")]
        getter managed_word_lists : Array(Types::GuardrailManagedWord)?

        def initialize(
          @custom_words : Array(Types::GuardrailCustomWord)? = nil,
          @managed_word_lists : Array(Types::GuardrailManagedWord)? = nil
        )
        end
      end

      # Image content for an invocation step.
      struct ImageBlock
        include JSON::Serializable

        # The format of the image.
        @[JSON::Field(key: "format")]
        getter format : String

        # The source for the image.
        @[JSON::Field(key: "source")]
        getter source : Types::ImageSource

        def initialize(
          @format : String,
          @source : Types::ImageSource
        )
        end
      end

      # Details about an image in the result from a function in the action group invocation. You can specify
      # images only when the function is a computer use action. For more information, see Configure an
      # Amazon Bedrock Agent to complete tasks with computer use tools .
      struct ImageInput
        include JSON::Serializable

        # The type of image in the result.
        @[JSON::Field(key: "format")]
        getter format : String

        # The source of the image in the result.
        @[JSON::Field(key: "source")]
        getter source : Types::ImageInputSource

        def initialize(
          @format : String,
          @source : Types::ImageInputSource
        )
        end
      end

      # Details about the source of an input image in the result from a function in the action group
      # invocation.
      struct ImageInputSource
        include JSON::Serializable

        # The raw image bytes for the image. If you use an Amazon Web Services SDK, you don't need to encode
        # the image bytes in base64.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        def initialize(
          @bytes : Bytes? = nil
        )
        end
      end

      # The source for an image.
      struct ImageSource
        include JSON::Serializable

        # The raw image bytes for the image. If you use an Amazon Web Services SDK, you don't need to encode
        # the image bytes in base64.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        # The path to the Amazon S3 bucket where the image is stored.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @bytes : Bytes? = nil,
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      # Settings for implicit filtering, where a model generates a metadata filter based on the prompt.
      struct ImplicitFilterConfiguration
        include JSON::Serializable

        # Metadata that can be used in a filter.
        @[JSON::Field(key: "metadataAttributes")]
        getter metadata_attributes : Array(Types::MetadataAttributeSchema)

        # The model that generates the filter.
        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        def initialize(
          @metadata_attributes : Array(Types::MetadataAttributeSchema),
          @model_arn : String
        )
        end
      end

      # The configuration for inference settings when generating responses using RetrieveAndGenerate.
      struct InferenceConfig
        include JSON::Serializable

        # Configuration settings specific to text generation while generating responses using
        # RetrieveAndGenerate.
        @[JSON::Field(key: "textInferenceConfig")]
        getter text_inference_config : Types::TextInferenceConfig?

        def initialize(
          @text_inference_config : Types::TextInferenceConfig? = nil
        )
        end
      end

      # Specifications about the inference parameters that were provided alongside the prompt. These are
      # specified in the PromptOverrideConfiguration object that was set when the agent was created or
      # updated. For more information, see Inference parameters for foundation models .
      struct InferenceConfiguration
        include JSON::Serializable

        # The maximum number of tokens allowed in the generated response.
        @[JSON::Field(key: "maximumLength")]
        getter maximum_length : Int32?

        # A list of stop sequences. A stop sequence is a sequence of characters that causes the model to stop
        # generating the response.
        @[JSON::Field(key: "stopSequences")]
        getter stop_sequences : Array(String)?

        # The likelihood of the model selecting higher-probability options while generating a response. A
        # lower value makes the model more likely to choose higher-probability options, while a higher value
        # makes the model more likely to choose lower-probability options.
        @[JSON::Field(key: "temperature")]
        getter temperature : Float64?

        # While generating a response, the model determines the probability of the following token at each
        # point of generation. The value that you set for topK is the number of most-likely candidates from
        # which the model chooses the next token in the sequence. For example, if you set topK to 50, the
        # model selects the next token from among the top 50 most likely choices.
        @[JSON::Field(key: "topK")]
        getter top_k : Int32?

        # While generating a response, the model determines the probability of the following token at each
        # point of generation. The value that you set for Top P determines the number of most-likely
        # candidates from which the model chooses the next token in the sequence. For example, if you set topP
        # to 0.8, the model only selects the next token from the top 80% of the probability distribution of
        # next tokens.
        @[JSON::Field(key: "topP")]
        getter top_p : Float64?

        def initialize(
          @maximum_length : Int32? = nil,
          @stop_sequences : Array(String)? = nil,
          @temperature : Float64? = nil,
          @top_k : Int32? = nil,
          @top_p : Float64? = nil
        )
        end
      end

      # Contains intermediate response for code interpreter if any files have been generated.
      struct InlineAgentFilePart
        include JSON::Serializable

        # Files containing intermediate response for the user.
        @[JSON::Field(key: "files")]
        getter files : Array(Types::OutputFile)?

        def initialize(
          @files : Array(Types::OutputFile)? = nil
        )
        end
      end

      # Contains a part of an agent response and citations for it.
      struct InlineAgentPayloadPart
        include JSON::Serializable

        # Contains citations for a part of an agent response.
        @[JSON::Field(key: "attribution")]
        getter attribution : Types::Attribution?

        # A part of the agent response in bytes.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        def initialize(
          @attribution : Types::Attribution? = nil,
          @bytes : Bytes? = nil
        )
        end
      end

      # The response from invoking the agent and associated citations and trace information.
      struct InlineAgentResponseStream
        include JSON::Serializable

        # The request is denied because of missing access permissions. Check your permissions and retry your
        # request.
        @[JSON::Field(key: "accessDeniedException")]
        getter access_denied_exception : Types::AccessDeniedException?

        # There was an issue with a dependency due to a server issue. Retry your request.
        @[JSON::Field(key: "badGatewayException")]
        getter bad_gateway_exception : Types::BadGatewayException?

        # Contains a part of an agent response and citations for it.
        @[JSON::Field(key: "chunk")]
        getter chunk : Types::InlineAgentPayloadPart?

        # There was a conflict performing an operation. Resolve the conflict and retry your request.
        @[JSON::Field(key: "conflictException")]
        getter conflict_exception : Types::ConflictException?

        # There was an issue with a dependency. Check the resource configurations and retry the request.
        @[JSON::Field(key: "dependencyFailedException")]
        getter dependency_failed_exception : Types::DependencyFailedException?

        # Contains intermediate response for code interpreter if any files have been generated.
        @[JSON::Field(key: "files")]
        getter files : Types::InlineAgentFilePart?

        # An internal server error occurred. Retry your request.
        @[JSON::Field(key: "internalServerException")]
        getter internal_server_exception : Types::InternalServerException?

        # The specified resource Amazon Resource Name (ARN) was not found. Check the Amazon Resource Name
        # (ARN) and try your request again.
        @[JSON::Field(key: "resourceNotFoundException")]
        getter resource_not_found_exception : Types::ResourceNotFoundException?

        # Contains the parameters and information that the agent elicited from the customer to carry out an
        # action. This information is returned to the system and can be used in your own setup for fulfilling
        # the action.
        @[JSON::Field(key: "returnControl")]
        getter return_control : Types::InlineAgentReturnControlPayload?

        # The number of requests exceeds the service quota. Resubmit your request later.
        @[JSON::Field(key: "serviceQuotaExceededException")]
        getter service_quota_exceeded_exception : Types::ServiceQuotaExceededException?

        # The number of requests exceeds the limit. Resubmit your request later.
        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?

        # Contains information about the agent and session, alongside the agent's reasoning process and
        # results from calling actions and querying knowledge bases and metadata about the trace. You can use
        # the trace to understand how the agent arrived at the response it provided the customer. For more
        # information, see Trace events .
        @[JSON::Field(key: "trace")]
        getter trace : Types::InlineAgentTracePart?

        # Input validation failed. Check your request parameters and retry the request.
        @[JSON::Field(key: "validationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @access_denied_exception : Types::AccessDeniedException? = nil,
          @bad_gateway_exception : Types::BadGatewayException? = nil,
          @chunk : Types::InlineAgentPayloadPart? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @dependency_failed_exception : Types::DependencyFailedException? = nil,
          @files : Types::InlineAgentFilePart? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @resource_not_found_exception : Types::ResourceNotFoundException? = nil,
          @return_control : Types::InlineAgentReturnControlPayload? = nil,
          @service_quota_exceeded_exception : Types::ServiceQuotaExceededException? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @trace : Types::InlineAgentTracePart? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end

      # Contains information to return from the action group that the agent has predicted to invoke. This
      # data type is used in the InvokeAgent response API operation.
      struct InlineAgentReturnControlPayload
        include JSON::Serializable

        # The identifier of the action group invocation.
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String?

        # A list of objects that contain information about the parameters and inputs that need to be sent into
        # the API operation or function, based on what the agent determines from its session with the user.
        @[JSON::Field(key: "invocationInputs")]
        getter invocation_inputs : Array(Types::InvocationInputMember)?

        def initialize(
          @invocation_id : String? = nil,
          @invocation_inputs : Array(Types::InvocationInputMember)? = nil
        )
        end
      end

      # Contains information about the agent and session, alongside the agent's reasoning process and
      # results from calling API actions and querying knowledge bases and metadata about the trace. You can
      # use the trace to understand how the agent arrived at the response it provided the customer. For more
      # information, see Trace enablement .
      struct InlineAgentTracePart
        include JSON::Serializable

        # The caller chain for the trace part.
        @[JSON::Field(key: "callerChain")]
        getter caller_chain : Array(Types::Caller)?

        # The collaborator name for the trace part.
        @[JSON::Field(key: "collaboratorName")]
        getter collaborator_name : String?

        # The time that trace occurred.
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time?

        # The unique identifier of the session with the agent.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # Contains one part of the agent's reasoning process and results from calling API actions and querying
        # knowledge bases. You can use the trace to understand how the agent arrived at the response it
        # provided the customer. For more information, see Trace enablement .
        @[JSON::Field(key: "trace")]
        getter trace : Types::Trace?

        def initialize(
          @caller_chain : Array(Types::Caller)? = nil,
          @collaborator_name : String? = nil,
          @event_time : Time? = nil,
          @session_id : String? = nil,
          @trace : Types::Trace? = nil
        )
        end
      end

      # Settings for a model called with InvokeInlineAgent .
      struct InlineBedrockModelConfigurations
        include JSON::Serializable

        # The latency configuration for the model.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        def initialize(
          @performance_config : Types::PerformanceConfiguration? = nil
        )
        end
      end

      # Contains parameters that specify various attributes that persist across a session or prompt. You can
      # define session state attributes as key-value pairs when writing a Lambda function for an action
      # group or pass them when making an InvokeInlineAgent request. Use session state attributes to control
      # and provide conversational context for your inline agent and to help customize your agent's
      # behavior. For more information, see Control session context
      struct InlineSessionState
        include JSON::Serializable

        # Contains the conversation history that persist across sessions.
        @[JSON::Field(key: "conversationHistory")]
        getter conversation_history : Types::ConversationHistory?

        # Contains information about the files used by code interpreter.
        @[JSON::Field(key: "files")]
        getter files : Array(Types::InputFile)?

        # The identifier of the invocation of an action. This value must match the invocationId returned in
        # the InvokeInlineAgent response for the action whose results are provided in the
        # returnControlInvocationResults field. For more information, see Return control to the agent
        # developer .
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String?

        # Contains attributes that persist across a session and the values of those attributes.
        @[JSON::Field(key: "promptSessionAttributes")]
        getter prompt_session_attributes : Hash(String, String)?

        # Contains information about the results from the action group invocation. For more information, see
        # Return control to the agent developer . If you include this field in the sessionState field, the
        # inputText field will be ignored.
        @[JSON::Field(key: "returnControlInvocationResults")]
        getter return_control_invocation_results : Array(Types::InvocationResultMember)?

        # Contains attributes that persist across a session and the values of those attributes.
        @[JSON::Field(key: "sessionAttributes")]
        getter session_attributes : Hash(String, String)?

        def initialize(
          @conversation_history : Types::ConversationHistory? = nil,
          @files : Array(Types::InputFile)? = nil,
          @invocation_id : String? = nil,
          @prompt_session_attributes : Hash(String, String)? = nil,
          @return_control_invocation_results : Array(Types::InvocationResultMember)? = nil,
          @session_attributes : Hash(String, String)? = nil
        )
        end
      end

      # Contains details of the source files.
      struct InputFile
        include JSON::Serializable

        # The name of the source file.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies where the files are located.
        @[JSON::Field(key: "source")]
        getter source : Types::FileSource

        # Specifies how the source files will be used by the code interpreter.
        @[JSON::Field(key: "useCase")]
        getter use_case : String

        def initialize(
          @name : String,
          @source : Types::FileSource,
          @use_case : String
        )
        end
      end

      # Contains the image data for multimodal knowledge base queries, including format and content. This
      # data type is used in the following API operations: Retrieve request – in the image field
      struct InputImage
        include JSON::Serializable

        # The format of the input image. Supported formats include png, gif, jpeg, and webp.
        @[JSON::Field(key: "format")]
        getter format : String

        # The base64-encoded image data for inline image content. Maximum size is 5MB.
        @[JSON::Field(key: "inlineContent")]
        getter inline_content : Bytes

        def initialize(
          @format : String,
          @inline_content : Bytes
        )
        end
      end

      # Contains information about the prompt to optimize.
      struct InputPrompt
        include JSON::Serializable

        # Contains information about the text prompt to optimize.
        @[JSON::Field(key: "textPrompt")]
        getter text_prompt : Types::TextPrompt?

        def initialize(
          @text_prompt : Types::TextPrompt? = nil
        )
        end
      end

      # An internal server error occurred. Retry your request.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The reason for the exception. If the reason is BEDROCK_MODEL_INVOCATION_SERVICE_UNAVAILABLE , the
        # model invocation service is unavailable. Retry your request.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains information pertaining to the action group or knowledge base that is being invoked.
      struct InvocationInput
        include JSON::Serializable

        # Contains information about the action group to be invoked.
        @[JSON::Field(key: "actionGroupInvocationInput")]
        getter action_group_invocation_input : Types::ActionGroupInvocationInput?

        # The collaborator's invocation input.
        @[JSON::Field(key: "agentCollaboratorInvocationInput")]
        getter agent_collaborator_invocation_input : Types::AgentCollaboratorInvocationInput?

        # Contains information about the code interpreter to be invoked.
        @[JSON::Field(key: "codeInterpreterInvocationInput")]
        getter code_interpreter_invocation_input : Types::CodeInterpreterInvocationInput?

        # Specifies whether the agent is invoking an action group or a knowledge base.
        @[JSON::Field(key: "invocationType")]
        getter invocation_type : String?

        # Contains details about the knowledge base to look up and the query to be made.
        @[JSON::Field(key: "knowledgeBaseLookupInput")]
        getter knowledge_base_lookup_input : Types::KnowledgeBaseLookupInput?

        # The unique identifier of the trace.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @action_group_invocation_input : Types::ActionGroupInvocationInput? = nil,
          @agent_collaborator_invocation_input : Types::AgentCollaboratorInvocationInput? = nil,
          @code_interpreter_invocation_input : Types::CodeInterpreterInvocationInput? = nil,
          @invocation_type : String? = nil,
          @knowledge_base_lookup_input : Types::KnowledgeBaseLookupInput? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # Contains details about the API operation or function that the agent predicts should be called. This
      # data type is used in the following API operations: In the returnControl field of the InvokeAgent
      # response
      struct InvocationInputMember
        include JSON::Serializable

        # Contains information about the API operation that the agent predicts should be called.
        @[JSON::Field(key: "apiInvocationInput")]
        getter api_invocation_input : Types::ApiInvocationInput?

        # Contains information about the function that the agent predicts should be called.
        @[JSON::Field(key: "functionInvocationInput")]
        getter function_invocation_input : Types::FunctionInvocationInput?

        def initialize(
          @api_invocation_input : Types::ApiInvocationInput? = nil,
          @function_invocation_input : Types::FunctionInvocationInput? = nil
        )
        end
      end

      # A result from the invocation of an action. For more information, see Return control to the agent
      # developer and Control session context . This data type is used in the following API operations:
      # InvokeAgent request
      struct InvocationResultMember
        include JSON::Serializable

        # The result from the API response from the action group invocation.
        @[JSON::Field(key: "apiResult")]
        getter api_result : Types::ApiResult?

        # The result from the function from the action group invocation.
        @[JSON::Field(key: "functionResult")]
        getter function_result : Types::FunctionResult?

        def initialize(
          @api_result : Types::ApiResult? = nil,
          @function_result : Types::FunctionResult? = nil
        )
        end
      end

      # Stores fine-grained state checkpoints, including text and images, for each interaction in an
      # invocation in a session. For more information about sessions, see Store and retrieve conversation
      # history and context with Amazon Bedrock sessions .
      struct InvocationStep
        include JSON::Serializable

        # The unique identifier (in UUID format) for the invocation that includes the invocation step.
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String

        # The unique identifier (in UUID format) for the invocation step.
        @[JSON::Field(key: "invocationStepId")]
        getter invocation_step_id : String

        # The timestamp for when the invocation step was created.
        @[JSON::Field(key: "invocationStepTime")]
        getter invocation_step_time : Time

        # Payload content, such as text and images, for the invocation step.
        @[JSON::Field(key: "payload")]
        getter payload : Types::InvocationStepPayload

        # The unique identifier of the session containing the invocation step.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @invocation_id : String,
          @invocation_step_id : String,
          @invocation_step_time : Time,
          @payload : Types::InvocationStepPayload,
          @session_id : String
        )
        end
      end

      # Payload content, such as text and images, for the invocation step.
      struct InvocationStepPayload
        include JSON::Serializable

        # The content for the invocation step.
        @[JSON::Field(key: "contentBlocks")]
        getter content_blocks : Array(Types::BedrockSessionContentBlock)?

        def initialize(
          @content_blocks : Array(Types::BedrockSessionContentBlock)? = nil
        )
        end
      end

      # Contains details about an invocation step within an invocation in a session. For more information
      # about sessions, see Store and retrieve conversation history and context with Amazon Bedrock sessions
      # .
      struct InvocationStepSummary
        include JSON::Serializable

        # A unique identifier for the invocation in UUID format.
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String

        # The unique identifier (in UUID format) for the invocation step.
        @[JSON::Field(key: "invocationStepId")]
        getter invocation_step_id : String

        # The timestamp for when the invocation step was created.
        @[JSON::Field(key: "invocationStepTime")]
        getter invocation_step_time : Time

        # The unique identifier for the session associated with the invocation step.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @invocation_id : String,
          @invocation_step_id : String,
          @invocation_step_time : Time,
          @session_id : String
        )
        end
      end

      # Contains details about an invocation in a session. For more information about sessions, see Store
      # and retrieve conversation history and context with Amazon Bedrock sessions .
      struct InvocationSummary
        include JSON::Serializable

        # The timestamp for when the invocation was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # A unique identifier for the invocation in UUID format.
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String

        # The unique identifier for the session associated with the invocation.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @created_at : Time,
          @invocation_id : String,
          @session_id : String
        )
        end
      end

      struct InvokeAgentRequest
        include JSON::Serializable

        # The alias of the agent to use.
        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String

        # The unique identifier of the agent to use.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The unique identifier of the session. Use the same value across requests to continue the same
        # conversation.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # Model performance settings for the request.
        @[JSON::Field(key: "bedrockModelConfigurations")]
        getter bedrock_model_configurations : Types::BedrockModelConfigurations?

        # Specifies whether to turn on the trace or not to track the agent's reasoning process. For more
        # information, see Trace enablement .
        @[JSON::Field(key: "enableTrace")]
        getter enable_trace : Bool?

        # Specifies whether to end the session with the agent or not.
        @[JSON::Field(key: "endSession")]
        getter end_session : Bool?

        # The prompt text to send the agent. If you include returnControlInvocationResults in the sessionState
        # field, the inputText field will be ignored.
        @[JSON::Field(key: "inputText")]
        getter input_text : String?

        # The unique identifier of the agent memory.
        @[JSON::Field(key: "memoryId")]
        getter memory_id : String?

        # Specifies parameters that control how the service populates the agent prompt for an InvokeAgent
        # request. You can control which aspects of previous invocations in the same agent session the service
        # uses to populate the agent prompt. This gives you more granular control over the contextual history
        # that is used to process the current request.
        @[JSON::Field(key: "promptCreationConfigurations")]
        getter prompt_creation_configurations : Types::PromptCreationConfigurations?

        # Contains parameters that specify various attributes of the session. For more information, see
        # Control session context . If you include returnControlInvocationResults in the sessionState field,
        # the inputText field will be ignored.
        @[JSON::Field(key: "sessionState")]
        getter session_state : Types::SessionState?

        # The ARN of the resource making the request.
        @[JSON::Field(key: "x-amz-source-arn")]
        getter source_arn : String?

        # Specifies the configurations for streaming. To use agent streaming, you need permissions to perform
        # the bedrock:InvokeModelWithResponseStream action.
        @[JSON::Field(key: "streamingConfigurations")]
        getter streaming_configurations : Types::StreamingConfigurations?

        def initialize(
          @agent_alias_id : String,
          @agent_id : String,
          @session_id : String,
          @bedrock_model_configurations : Types::BedrockModelConfigurations? = nil,
          @enable_trace : Bool? = nil,
          @end_session : Bool? = nil,
          @input_text : String? = nil,
          @memory_id : String? = nil,
          @prompt_creation_configurations : Types::PromptCreationConfigurations? = nil,
          @session_state : Types::SessionState? = nil,
          @source_arn : String? = nil,
          @streaming_configurations : Types::StreamingConfigurations? = nil
        )
        end
      end

      struct InvokeAgentResponse
        include JSON::Serializable

        # The agent's response to the user prompt.
        @[JSON::Field(key: "completion")]
        getter completion : Types::ResponseStream

        # The MIME type of the input data in the request. The default value is application/json .
        @[JSON::Field(key: "x-amzn-bedrock-agent-content-type")]
        getter content_type : String

        # The unique identifier of the session with the agent.
        @[JSON::Field(key: "x-amz-bedrock-agent-session-id")]
        getter session_id : String

        # The unique identifier of the agent memory.
        @[JSON::Field(key: "x-amz-bedrock-agent-memory-id")]
        getter memory_id : String?

        def initialize(
          @completion : Types::ResponseStream,
          @content_type : String,
          @session_id : String,
          @memory_id : String? = nil
        )
        end
      end

      struct InvokeFlowRequest
        include JSON::Serializable

        # The unique identifier of the flow alias.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String

        # The unique identifier of the flow.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # A list of objects, each containing information about an input into the flow.
        @[JSON::Field(key: "inputs")]
        getter inputs : Array(Types::FlowInput)

        # Specifies whether to return the trace for the flow or not. Traces track inputs and outputs for nodes
        # in the flow. For more information, see Track each step in your prompt flow by viewing its trace in
        # Amazon Bedrock .
        @[JSON::Field(key: "enableTrace")]
        getter enable_trace : Bool?

        # The unique identifier for the current flow execution. If you don't provide a value, Amazon Bedrock
        # creates the identifier for you.
        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        # Model performance settings for the request.
        @[JSON::Field(key: "modelPerformanceConfiguration")]
        getter model_performance_configuration : Types::ModelPerformanceConfiguration?

        def initialize(
          @flow_alias_identifier : String,
          @flow_identifier : String,
          @inputs : Array(Types::FlowInput),
          @enable_trace : Bool? = nil,
          @execution_id : String? = nil,
          @model_performance_configuration : Types::ModelPerformanceConfiguration? = nil
        )
        end
      end

      struct InvokeFlowResponse
        include JSON::Serializable

        # The output of the flow, returned as a stream. If there's an error, the error is returned.
        @[JSON::Field(key: "responseStream")]
        getter response_stream : Types::FlowResponseStream

        # The unique identifier for the current flow execution.
        @[JSON::Field(key: "x-amz-bedrock-flow-execution-id")]
        getter execution_id : String?

        def initialize(
          @response_stream : Types::FlowResponseStream,
          @execution_id : String? = nil
        )
        end
      end

      struct InvokeInlineAgentRequest
        include JSON::Serializable

        # The model identifier (ID) of the model to use for orchestration by the inline agent. For example,
        # meta.llama3-1-70b-instruct-v1:0 .
        @[JSON::Field(key: "foundationModel")]
        getter foundation_model : String

        # The instructions that tell the inline agent what it should do and how it should interact with users.
        @[JSON::Field(key: "instruction")]
        getter instruction : String

        # The unique identifier of the session. Use the same value across requests to continue the same
        # conversation.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # A list of action groups with each action group defining the action the inline agent needs to carry
        # out.
        @[JSON::Field(key: "actionGroups")]
        getter action_groups : Array(Types::AgentActionGroup)?

        # Defines how the inline collaborator agent handles information across multiple collaborator agents to
        # coordinate a final response. The inline collaborator agent can also be the supervisor.
        @[JSON::Field(key: "agentCollaboration")]
        getter agent_collaboration : String?

        # The name for the agent.
        @[JSON::Field(key: "agentName")]
        getter agent_name : String?

        # Model settings for the request.
        @[JSON::Field(key: "bedrockModelConfigurations")]
        getter bedrock_model_configurations : Types::InlineBedrockModelConfigurations?

        # Settings for an inline agent collaborator called with InvokeInlineAgent .
        @[JSON::Field(key: "collaboratorConfigurations")]
        getter collaborator_configurations : Array(Types::CollaboratorConfiguration)?

        # List of collaborator inline agents.
        @[JSON::Field(key: "collaborators")]
        getter collaborators : Array(Types::Collaborator)?

        # Contains details of the custom orchestration configured for the agent.
        @[JSON::Field(key: "customOrchestration")]
        getter custom_orchestration : Types::CustomOrchestration?

        # The Amazon Resource Name (ARN) of the Amazon Web Services KMS key to use to encrypt your inline
        # agent.
        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # Specifies whether to turn on the trace or not to track the agent's reasoning process. For more
        # information, see Using trace .
        @[JSON::Field(key: "enableTrace")]
        getter enable_trace : Bool?

        # Specifies whether to end the session with the inline agent or not.
        @[JSON::Field(key: "endSession")]
        getter end_session : Bool?

        # The guardrails to assign to the inline agent.
        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfigurationWithArn?

        # The number of seconds for which the inline agent should maintain session information. After this
        # time expires, the subsequent InvokeInlineAgent request begins a new session. A user interaction
        # remains active for the amount of time specified. If no conversation occurs during this time, the
        # session expires and the data provided before the timeout is deleted.
        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # Parameters that specify the various attributes of a sessions. You can include attributes for the
        # session or prompt or, if you configured an action group to return control, results from invocation
        # of the action group. For more information, see Control session context . If you include
        # returnControlInvocationResults in the sessionState field, the inputText field will be ignored.
        @[JSON::Field(key: "inlineSessionState")]
        getter inline_session_state : Types::InlineSessionState?

        # The prompt text to send to the agent. If you include returnControlInvocationResults in the
        # sessionState field, the inputText field will be ignored.
        @[JSON::Field(key: "inputText")]
        getter input_text : String?

        # Contains information of the knowledge bases to associate with.
        @[JSON::Field(key: "knowledgeBases")]
        getter knowledge_bases : Array(Types::KnowledgeBase)?

        # Specifies the type of orchestration strategy for the agent. This is set to DEFAULT orchestration
        # type, by default.
        @[JSON::Field(key: "orchestrationType")]
        getter orchestration_type : String?

        # Specifies parameters that control how the service populates the agent prompt for an
        # InvokeInlineAgent request. You can control which aspects of previous invocations in the same agent
        # session the service uses to populate the agent prompt. This gives you more granular control over the
        # contextual history that is used to process the current request.
        @[JSON::Field(key: "promptCreationConfigurations")]
        getter prompt_creation_configurations : Types::PromptCreationConfigurations?

        # Configurations for advanced prompts used to override the default prompts to enhance the accuracy of
        # the inline agent.
        @[JSON::Field(key: "promptOverrideConfiguration")]
        getter prompt_override_configuration : Types::PromptOverrideConfiguration?

        # Specifies the configurations for streaming. To use agent streaming, you need permissions to perform
        # the bedrock:InvokeModelWithResponseStream action.
        @[JSON::Field(key: "streamingConfigurations")]
        getter streaming_configurations : Types::StreamingConfigurations?

        def initialize(
          @foundation_model : String,
          @instruction : String,
          @session_id : String,
          @action_groups : Array(Types::AgentActionGroup)? = nil,
          @agent_collaboration : String? = nil,
          @agent_name : String? = nil,
          @bedrock_model_configurations : Types::InlineBedrockModelConfigurations? = nil,
          @collaborator_configurations : Array(Types::CollaboratorConfiguration)? = nil,
          @collaborators : Array(Types::Collaborator)? = nil,
          @custom_orchestration : Types::CustomOrchestration? = nil,
          @customer_encryption_key_arn : String? = nil,
          @enable_trace : Bool? = nil,
          @end_session : Bool? = nil,
          @guardrail_configuration : Types::GuardrailConfigurationWithArn? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @inline_session_state : Types::InlineSessionState? = nil,
          @input_text : String? = nil,
          @knowledge_bases : Array(Types::KnowledgeBase)? = nil,
          @orchestration_type : String? = nil,
          @prompt_creation_configurations : Types::PromptCreationConfigurations? = nil,
          @prompt_override_configuration : Types::PromptOverrideConfiguration? = nil,
          @streaming_configurations : Types::StreamingConfigurations? = nil
        )
        end
      end

      struct InvokeInlineAgentResponse
        include JSON::Serializable

        # The inline agent's response to the user prompt.
        @[JSON::Field(key: "completion")]
        getter completion : Types::InlineAgentResponseStream

        # The MIME type of the input data in the request. The default value is application/json.
        @[JSON::Field(key: "x-amzn-bedrock-agent-content-type")]
        getter content_type : String

        # The unique identifier of the session with the agent.
        @[JSON::Field(key: "x-amz-bedrock-agent-session-id")]
        getter session_id : String

        def initialize(
          @completion : Types::InlineAgentResponseStream,
          @content_type : String,
          @session_id : String
        )
        end
      end

      # Details of the knowledge base associated withe inline agent.
      struct KnowledgeBase
        include JSON::Serializable

        # The description of the knowledge base associated with the inline agent.
        @[JSON::Field(key: "description")]
        getter description : String

        # The unique identifier for a knowledge base associated with the inline agent.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The configurations to apply to the knowledge base during query. For more information, see Query
        # configurations .
        @[JSON::Field(key: "retrievalConfiguration")]
        getter retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration?

        def initialize(
          @description : String,
          @knowledge_base_id : String,
          @retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration? = nil
        )
        end
      end

      # Configurations to apply to a knowledge base attached to the agent during query. For more
      # information, see Knowledge base retrieval configurations .
      struct KnowledgeBaseConfiguration
        include JSON::Serializable

        # The unique identifier for a knowledge base attached to the agent.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The configurations to apply to the knowledge base during query. For more information, see Query
        # configurations .
        @[JSON::Field(key: "retrievalConfiguration")]
        getter retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration

        def initialize(
          @knowledge_base_id : String,
          @retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration
        )
        end
      end

      # Contains details about the knowledge base to look up and the query to be made.
      struct KnowledgeBaseLookupInput
        include JSON::Serializable

        # The unique identifier of the knowledge base to look up.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String?

        # The query made to the knowledge base.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @knowledge_base_id : String? = nil,
          @text : String? = nil
        )
        end
      end

      # Contains details about the results from looking up the knowledge base.
      struct KnowledgeBaseLookupOutput
        include JSON::Serializable

        # Contains information about the knowledge base output.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # Contains metadata about the sources cited for the generated response.
        @[JSON::Field(key: "retrievedReferences")]
        getter retrieved_references : Array(Types::RetrievedReference)?

        def initialize(
          @metadata : Types::Metadata? = nil,
          @retrieved_references : Array(Types::RetrievedReference)? = nil
        )
        end
      end

      # Contains the query made to the knowledge base. This data type is used in the following API
      # operations: Retrieve request – in the retrievalQuery field
      struct KnowledgeBaseQuery
        include JSON::Serializable

        # An image to include in the knowledge base query for multimodal retrieval.
        @[JSON::Field(key: "image")]
        getter image : Types::InputImage?

        # The text of the query made to the knowledge base.
        @[JSON::Field(key: "text")]
        getter text : String?

        # The type of query being performed.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @image : Types::InputImage? = nil,
          @text : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains configurations for knowledge base query. For more information, see Query configurations .
      # This data type is used in the following API operations: Retrieve request – in the
      # retrievalConfiguration field RetrieveAndGenerate request – in the retrievalConfiguration field
      struct KnowledgeBaseRetrievalConfiguration
        include JSON::Serializable

        # Contains details about how the results from the vector search should be returned. For more
        # information, see Query configurations .
        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::KnowledgeBaseVectorSearchConfiguration

        def initialize(
          @vector_search_configuration : Types::KnowledgeBaseVectorSearchConfiguration
        )
        end
      end

      # Details about a result from querying the knowledge base. This data type is used in the following API
      # operations: Retrieve response – in the retrievalResults field
      struct KnowledgeBaseRetrievalResult
        include JSON::Serializable

        # Contains information about the content of the chunk.
        @[JSON::Field(key: "content")]
        getter content : Types::RetrievalResultContent

        # Contains information about the location of the data source.
        @[JSON::Field(key: "location")]
        getter location : Types::RetrievalResultLocation?

        # Contains metadata attributes and their values for the file in the data source. For more information,
        # see Metadata and filtering .
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, Types::RetrievalResultMetadataValue)?

        # The level of relevance of the result to the query.
        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @content : Types::RetrievalResultContent,
          @location : Types::RetrievalResultLocation? = nil,
          @metadata : Hash(String, Types::RetrievalResultMetadataValue)? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Contains details about the resource being queried. This data type is used in the following API
      # operations: Retrieve request – in the knowledgeBaseConfiguration field RetrieveAndGenerate request –
      # in the knowledgeBaseConfiguration field
      struct KnowledgeBaseRetrieveAndGenerateConfiguration
        include JSON::Serializable

        # The unique identifier of the knowledge base that is queried.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The ARN of the foundation model or inference profile used to generate a response.
        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # Contains configurations for response generation based on the knowledge base query results.
        @[JSON::Field(key: "generationConfiguration")]
        getter generation_configuration : Types::GenerationConfiguration?

        # Settings for how the model processes the prompt prior to retrieval and generation.
        @[JSON::Field(key: "orchestrationConfiguration")]
        getter orchestration_configuration : Types::OrchestrationConfiguration?

        # Contains configurations for how to retrieve and return the knowledge base query.
        @[JSON::Field(key: "retrievalConfiguration")]
        getter retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration?

        def initialize(
          @knowledge_base_id : String,
          @model_arn : String,
          @generation_configuration : Types::GenerationConfiguration? = nil,
          @orchestration_configuration : Types::OrchestrationConfiguration? = nil,
          @retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration? = nil
        )
        end
      end

      # Configurations for how to perform the search query and return results. For more information, see
      # Query configurations . This data type is used in the following API operations: Retrieve request – in
      # the vectorSearchConfiguration field RetrieveAndGenerate request – in the vectorSearchConfiguration
      # field
      struct KnowledgeBaseVectorSearchConfiguration
        include JSON::Serializable

        # Specifies the filters to use on the metadata in the knowledge base data sources before returning
        # results. For more information, see Query configurations .
        @[JSON::Field(key: "filter")]
        getter filter : Types::RetrievalFilter?

        # Settings for implicit filtering.
        @[JSON::Field(key: "implicitFilterConfiguration")]
        getter implicit_filter_configuration : Types::ImplicitFilterConfiguration?

        # The number of source chunks to retrieve.
        @[JSON::Field(key: "numberOfResults")]
        getter number_of_results : Int32?

        # By default, Amazon Bedrock decides a search strategy for you. If you're using an Amazon OpenSearch
        # Serverless vector store that contains a filterable text field, you can specify whether to query the
        # knowledge base with a HYBRID search using both vector embeddings and raw text, or SEMANTIC search
        # using only vector embeddings. For other vector store configurations, only SEMANTIC search is
        # available. For more information, see Test a knowledge base .
        @[JSON::Field(key: "overrideSearchType")]
        getter override_search_type : String?

        # Contains configurations for reranking the retrieved results. For more information, see Improve the
        # relevance of query responses with a reranker model .
        @[JSON::Field(key: "rerankingConfiguration")]
        getter reranking_configuration : Types::VectorSearchRerankingConfiguration?

        def initialize(
          @filter : Types::RetrievalFilter? = nil,
          @implicit_filter_configuration : Types::ImplicitFilterConfiguration? = nil,
          @number_of_results : Int32? = nil,
          @override_search_type : String? = nil,
          @reranking_configuration : Types::VectorSearchRerankingConfiguration? = nil
        )
        end
      end

      struct ListFlowExecutionEventsRequest
        include JSON::Serializable

        # The type of events to retrieve. Specify Node for node-level events or Flow for flow-level events.
        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The unique identifier of the flow execution.
        @[JSON::Field(key: "executionIdentifier")]
        getter execution_identifier : String

        # The unique identifier of the flow alias used for the execution.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String

        # The unique identifier of the flow.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # The maximum number of events to return in a single response. If more events exist than the specified
        # maxResults value, a token is included in the response so that the remaining results can be
        # retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next set of results. This value is returned in the response if more results
        # are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_type : String,
          @execution_identifier : String,
          @flow_alias_identifier : String,
          @flow_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFlowExecutionEventsResponse
        include JSON::Serializable

        # A list of events that occurred during the flow execution. Events can include node inputs and
        # outputs, flow inputs and outputs, condition results, and failure events.
        @[JSON::Field(key: "flowExecutionEvents")]
        getter flow_execution_events : Array(Types::FlowExecutionEvent)

        # A token to retrieve the next set of results. This value is returned if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_execution_events : Array(Types::FlowExecutionEvent),
          @next_token : String? = nil
        )
        end
      end

      struct ListFlowExecutionsRequest
        include JSON::Serializable

        # The unique identifier of the flow to list executions for.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # The unique identifier of the flow alias to list executions for.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String?

        # The maximum number of flow executions to return in a single response. If more executions exist than
        # the specified maxResults value, a token is included in the response so that the remaining results
        # can be retrieved.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next set of results. This value is returned in the response if more results
        # are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_identifier : String,
          @flow_alias_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFlowExecutionsResponse
        include JSON::Serializable

        # A list of flow execution summaries. Each summary includes the execution ARN, flow identifier, flow
        # alias identifier, flow version, status, and timestamps.
        @[JSON::Field(key: "flowExecutionSummaries")]
        getter flow_execution_summaries : Array(Types::FlowExecutionSummary)

        # A token to retrieve the next set of results. This value is returned if more results are available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_execution_summaries : Array(Types::FlowExecutionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListInvocationStepsRequest
        include JSON::Serializable

        # The unique identifier for the session associated with the invocation steps. You can specify either
        # the session's sessionId or its Amazon Resource Name (ARN).
        @[JSON::Field(key: "sessionIdentifier")]
        getter session_identifier : String

        # The unique identifier (in UUID format) for the invocation to list invocation steps for.
        @[JSON::Field(key: "invocationIdentifier")]
        getter invocation_identifier : String?

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
          @session_identifier : String,
          @invocation_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInvocationStepsResponse
        include JSON::Serializable

        # A list of summaries for each invocation step associated with a session and if you specified it, an
        # invocation within the session.
        @[JSON::Field(key: "invocationStepSummaries")]
        getter invocation_step_summaries : Array(Types::InvocationStepSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @invocation_step_summaries : Array(Types::InvocationStepSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListInvocationsRequest
        include JSON::Serializable

        # The unique identifier for the session to list invocations for. You can specify either the session's
        # sessionId or its Amazon Resource Name (ARN).
        @[JSON::Field(key: "sessionIdentifier")]
        getter session_identifier : String

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
          @session_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInvocationsResponse
        include JSON::Serializable

        # A list of invocation summaries associated with the session.
        @[JSON::Field(key: "invocationSummaries")]
        getter invocation_summaries : Array(Types::InvocationSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @invocation_summaries : Array(Types::InvocationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSessionsRequest
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

      struct ListSessionsResponse
        include JSON::Serializable

        # A list of summaries for each session in your Amazon Web Services account.
        @[JSON::Field(key: "sessionSummaries")]
        getter session_summaries : Array(Types::SessionSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @session_summaries : Array(Types::SessionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which to list tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The key-value pairs for the tags associated with the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains sessions summaries.
      struct Memory
        include JSON::Serializable

        # Contains summary of a session.
        @[JSON::Field(key: "sessionSummary")]
        getter session_summary : Types::MemorySessionSummary?

        def initialize(
          @session_summary : Types::MemorySessionSummary? = nil
        )
        end
      end

      # Contains details of a session summary.
      struct MemorySessionSummary
        include JSON::Serializable

        # The unique identifier of the memory where the session summary is stored.
        @[JSON::Field(key: "memoryId")]
        getter memory_id : String?

        # The time when the memory duration for the session is set to end.
        @[JSON::Field(key: "sessionExpiryTime")]
        getter session_expiry_time : Time?

        # The identifier for this session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The start time for this session.
        @[JSON::Field(key: "sessionStartTime")]
        getter session_start_time : Time?

        # The summarized text for this session.
        @[JSON::Field(key: "summaryText")]
        getter summary_text : String?

        def initialize(
          @memory_id : String? = nil,
          @session_expiry_time : Time? = nil,
          @session_id : String? = nil,
          @session_start_time : Time? = nil,
          @summary_text : String? = nil
        )
        end
      end

      # Details about a message.
      struct Message
        include JSON::Serializable

        # The message's content.
        @[JSON::Field(key: "content")]
        getter content : Array(Types::ContentBlock)

        # The message's role.
        @[JSON::Field(key: "role")]
        getter role : String

        def initialize(
          @content : Array(Types::ContentBlock),
          @role : String
        )
        end
      end

      # Provides information about the execution process for different types of invocations, such as model
      # invocation, knowledge base invocation, agent collaborator invocation, guardrail invocation, and code
      # interpreter Invocation.
      struct Metadata
        include JSON::Serializable

        # A unique identifier associated with the downstream invocation. This ID can be used for tracing,
        # debugging, and identifying specific invocations in customer logs or systems.
        @[JSON::Field(key: "clientRequestId")]
        getter client_request_id : String?

        # In the final response, endTime is the end time of the agent invocation operation.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The total time it took for the agent to complete execution. This field is only set for the final
        # response.
        @[JSON::Field(key: "operationTotalTimeMs")]
        getter operation_total_time_ms : Int64?

        # In the final response, startTime is the start time of the agent invocation operation.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The total execution time for the specific invocation being processed (model, knowledge base,
        # guardrail, agent collaborator, or code interpreter). It represents how long the individual
        # invocation took.
        @[JSON::Field(key: "totalTimeMs")]
        getter total_time_ms : Int64?

        # Specific to model invocation and contains details about the usage of a foundation model.
        @[JSON::Field(key: "usage")]
        getter usage : Types::Usage?

        def initialize(
          @client_request_id : String? = nil,
          @end_time : Time? = nil,
          @operation_total_time_ms : Int64? = nil,
          @start_time : Time? = nil,
          @total_time_ms : Int64? = nil,
          @usage : Types::Usage? = nil
        )
        end
      end

      # Details about a metadata attribute.
      struct MetadataAttributeSchema
        include JSON::Serializable

        # The attribute's description.
        @[JSON::Field(key: "description")]
        getter description : String

        # The attribute's key.
        @[JSON::Field(key: "key")]
        getter key : String

        # The attribute's type.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @description : String,
          @key : String,
          @type : String
        )
        end
      end

      # Contains configurations for the metadata to use in reranking.
      struct MetadataConfigurationForReranking
        include JSON::Serializable

        # Specifies whether to consider all metadata when reranking, or only the metadata that you select. If
        # you specify SELECTIVE , include the selectiveModeConfiguration field.
        @[JSON::Field(key: "selectionMode")]
        getter selection_mode : String

        # Contains configurations for the metadata fields to include or exclude when considering reranking.
        @[JSON::Field(key: "selectiveModeConfiguration")]
        getter selective_mode_configuration : Types::RerankingMetadataSelectiveModeConfiguration?

        def initialize(
          @selection_mode : String,
          @selective_mode_configuration : Types::RerankingMetadataSelectiveModeConfiguration? = nil
        )
        end
      end

      # The input for the pre-processing step. The type matches the agent step. The text contains the
      # prompt. The inferenceConfiguration , parserMode , and overrideLambda values are set in the
      # PromptOverrideConfiguration object that was set when the agent was created or updated.
      struct ModelInvocationInput
        include JSON::Serializable

        # The identifier of a foundation model.
        @[JSON::Field(key: "foundationModel")]
        getter foundation_model : String?

        # Specifications about the inference parameters that were provided alongside the prompt. These are
        # specified in the PromptOverrideConfiguration object that was set when the agent was created or
        # updated. For more information, see Inference parameters for foundation models .
        @[JSON::Field(key: "inferenceConfiguration")]
        getter inference_configuration : Types::InferenceConfiguration?

        # The ARN of the Lambda function to use when parsing the raw foundation model output in parts of the
        # agent sequence.
        @[JSON::Field(key: "overrideLambda")]
        getter override_lambda : String?

        # Specifies whether to override the default parser Lambda function when parsing the raw foundation
        # model output in the part of the agent sequence defined by the promptType .
        @[JSON::Field(key: "parserMode")]
        getter parser_mode : String?

        # Specifies whether the default prompt template was OVERRIDDEN . If it was, the basePromptTemplate
        # that was set in the PromptOverrideConfiguration object when the agent was created or updated is used
        # instead.
        @[JSON::Field(key: "promptCreationMode")]
        getter prompt_creation_mode : String?

        # The text that prompted the agent at this step.
        @[JSON::Field(key: "text")]
        getter text : String?

        # The unique identifier of the trace.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        # The step in the agent sequence.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @foundation_model : String? = nil,
          @inference_configuration : Types::InferenceConfiguration? = nil,
          @override_lambda : String? = nil,
          @parser_mode : String? = nil,
          @prompt_creation_mode : String? = nil,
          @text : String? = nil,
          @trace_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The model specified in the request is not ready to serve inference requests. The AWS SDK will
      # automatically retry the operation up to 5 times. For information about configuring automatic
      # retries, see Retry behavior in the AWS SDKs and Tools reference guide.
      struct ModelNotReadyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The performance configuration for a model called with InvokeFlow .
      struct ModelPerformanceConfiguration
        include JSON::Serializable

        # The latency configuration for the model.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        def initialize(
          @performance_config : Types::PerformanceConfiguration? = nil
        )
        end
      end

      # Contains information about an action (operation) called by a node during execution.
      struct NodeActionEvent
        include JSON::Serializable

        # The name of the node that called the operation.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The name of the operation that the node called.
        @[JSON::Field(key: "operationName")]
        getter operation_name : String

        # The ID of the request that the node made to the operation.
        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # The name of the service that the node called.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The date and time that the operation was called.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The request payload sent to the downstream service.
        @[JSON::Field(key: "operationRequest")]
        getter operation_request : Types::Document?

        # The response payload received from the downstream service.
        @[JSON::Field(key: "operationResponse")]
        getter operation_response : Types::Document?

        def initialize(
          @node_name : String,
          @operation_name : String,
          @request_id : String,
          @service_name : String,
          @timestamp : Time,
          @operation_request : Types::Document? = nil,
          @operation_response : Types::Document? = nil
        )
        end
      end

      # Contains information about an internal trace of a specific node during execution.
      struct NodeDependencyEvent
        include JSON::Serializable

        # The name of the node that generated the dependency trace.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The date and time that the dependency trace was generated.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The trace elements containing detailed information about the node execution.
        @[JSON::Field(key: "traceElements")]
        getter trace_elements : Types::NodeTraceElements

        def initialize(
          @node_name : String,
          @timestamp : Time,
          @trace_elements : Types::NodeTraceElements
        )
        end
      end

      # Contains the content of a flow node's input or output field for a flow execution. Flow executions is
      # in preview release for Amazon Bedrock and is subject to change.
      struct NodeExecutionContent
        include JSON::Serializable

        # The document content of the field, which can contain text or structured data.
        @[JSON::Field(key: "document")]
        getter document : Types::Document?

        def initialize(
          @document : Types::Document? = nil
        )
        end
      end

      # Contains information about a failure that occurred at a specific node during a flow execution. Flow
      # executions is in preview release for Amazon Bedrock and is subject to change.
      struct NodeFailureEvent
        include JSON::Serializable

        # The error code that identifies the type of failure that occurred at the node.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # A descriptive message that provides details about the node failure.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The name of the node where the failure occurred.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The timestamp when the node failure occurred.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @error_code : String,
          @error_message : String,
          @node_name : String,
          @timestamp : Time
        )
        end
      end

      # Contains information about the inputs provided to a specific node during a flow execution. Flow
      # executions is in preview release for Amazon Bedrock and is subject to change.
      struct NodeInputEvent
        include JSON::Serializable

        # A list of input fields provided to the node.
        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::NodeInputField)

        # The name of the node that received the inputs.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The timestamp when the inputs were provided to the node.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @fields : Array(Types::NodeInputField),
          @node_name : String,
          @timestamp : Time
        )
        end
      end

      # Represents an item in the execution chain for node input tracking.
      struct NodeInputExecutionChainItem
        include JSON::Serializable

        # The name of the node in the execution chain.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The type of execution chain item. Supported values are Iterator and Loop.
        @[JSON::Field(key: "type")]
        getter type : String

        # The index position of this item in the execution chain.
        @[JSON::Field(key: "index")]
        getter index : Int32?

        def initialize(
          @node_name : String,
          @type : String,
          @index : Int32? = nil
        )
        end
      end

      # Represents an input field provided to a node during a flow execution.
      struct NodeInputField
        include JSON::Serializable

        # The content of the input field, which can contain text or structured data.
        @[JSON::Field(key: "content")]
        getter content : Types::NodeExecutionContent

        # The name of the input field as defined in the node's input schema.
        @[JSON::Field(key: "name")]
        getter name : String

        # The category of the input field.
        @[JSON::Field(key: "category")]
        getter category : String?

        # The execution path through nested nodes like iterators and loops.
        @[JSON::Field(key: "executionChain")]
        getter execution_chain : Array(Types::NodeInputExecutionChainItem)?

        # The source node that provides input data to this field.
        @[JSON::Field(key: "source")]
        getter source : Types::NodeInputSource?

        # The data type of the input field for compatibility validation.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @content : Types::NodeExecutionContent,
          @name : String,
          @category : String? = nil,
          @execution_chain : Array(Types::NodeInputExecutionChainItem)? = nil,
          @source : Types::NodeInputSource? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents the source of input data for a node field.
      struct NodeInputSource
        include JSON::Serializable

        # The expression used to extract data from the source.
        @[JSON::Field(key: "expression")]
        getter expression : String

        # The name of the source node that provides the input data.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The name of the output field from the source node.
        @[JSON::Field(key: "outputFieldName")]
        getter output_field_name : String

        def initialize(
          @expression : String,
          @node_name : String,
          @output_field_name : String
        )
        end
      end

      # Contains information about the outputs produced by a specific node during a flow execution. Flow
      # executions is in preview release for Amazon Bedrock and is subject to change.
      struct NodeOutputEvent
        include JSON::Serializable

        # A list of output fields produced by the node.
        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::NodeOutputField)

        # The name of the node that produced the outputs.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        # The timestamp when the outputs were produced by the node.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        def initialize(
          @fields : Array(Types::NodeOutputField),
          @node_name : String,
          @timestamp : Time
        )
        end
      end

      # Represents an output field produced by a node during a flow execution. Flow executions is in preview
      # release for Amazon Bedrock and is subject to change.
      struct NodeOutputField
        include JSON::Serializable

        # The content of the output field, which can contain text or structured data.
        @[JSON::Field(key: "content")]
        getter content : Types::NodeExecutionContent

        # The name of the output field as defined in the node's output schema.
        @[JSON::Field(key: "name")]
        getter name : String

        # The next node that receives output data from this field.
        @[JSON::Field(key: "next")]
        getter next : Array(Types::NodeOutputNext)?

        # The data type of the output field for compatibility validation.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @content : Types::NodeExecutionContent,
          @name : String,
          @next : Array(Types::NodeOutputNext)? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents the next node that receives output data.
      struct NodeOutputNext
        include JSON::Serializable

        # The name of the input field in the next node that receives the data.
        @[JSON::Field(key: "inputFieldName")]
        getter input_field_name : String

        # The name of the next node that receives the output data.
        @[JSON::Field(key: "nodeName")]
        getter node_name : String

        def initialize(
          @input_field_name : String,
          @node_name : String
        )
        end
      end

      # Contains trace elements for node execution tracking.
      struct NodeTraceElements
        include JSON::Serializable

        # Agent trace information for the node execution.
        @[JSON::Field(key: "agentTraces")]
        getter agent_traces : Array(Types::TracePart)?

        def initialize(
          @agent_traces : Array(Types::TracePart)? = nil
        )
        end
      end

      # Contains the result or output of an action group or knowledge base, or the response to the user.
      struct Observation
        include JSON::Serializable

        # Contains the JSON-formatted string returned by the API invoked by the action group.
        @[JSON::Field(key: "actionGroupInvocationOutput")]
        getter action_group_invocation_output : Types::ActionGroupInvocationOutput?

        # A collaborator's invocation output.
        @[JSON::Field(key: "agentCollaboratorInvocationOutput")]
        getter agent_collaborator_invocation_output : Types::AgentCollaboratorInvocationOutput?

        # Contains the JSON-formatted string returned by the API invoked by the code interpreter.
        @[JSON::Field(key: "codeInterpreterInvocationOutput")]
        getter code_interpreter_invocation_output : Types::CodeInterpreterInvocationOutput?

        # Contains details about the response to the user.
        @[JSON::Field(key: "finalResponse")]
        getter final_response : Types::FinalResponse?

        # Contains details about the results from looking up the knowledge base.
        @[JSON::Field(key: "knowledgeBaseLookupOutput")]
        getter knowledge_base_lookup_output : Types::KnowledgeBaseLookupOutput?

        # Contains details about the response to reprompt the input.
        @[JSON::Field(key: "repromptResponse")]
        getter reprompt_response : Types::RepromptResponse?

        # The unique identifier of the trace.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        # Specifies what kind of information the agent returns in the observation. The following values are
        # possible. ACTION_GROUP – The agent returns the result of an action group. KNOWLEDGE_BASE – The agent
        # returns information from a knowledge base. FINISH – The agent returns a final response to the user
        # with no follow-up. ASK_USER – The agent asks the user a question. REPROMPT – The agent prompts the
        # user again for the same information.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @action_group_invocation_output : Types::ActionGroupInvocationOutput? = nil,
          @agent_collaborator_invocation_output : Types::AgentCollaboratorInvocationOutput? = nil,
          @code_interpreter_invocation_output : Types::CodeInterpreterInvocationOutput? = nil,
          @final_response : Types::FinalResponse? = nil,
          @knowledge_base_lookup_output : Types::KnowledgeBaseLookupOutput? = nil,
          @reprompt_response : Types::RepromptResponse? = nil,
          @trace_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct OptimizePromptRequest
        include JSON::Serializable

        # Contains the prompt to optimize.
        @[JSON::Field(key: "input")]
        getter input : Types::InputPrompt

        # The unique identifier of the model that you want to optimize the prompt for.
        @[JSON::Field(key: "targetModelId")]
        getter target_model_id : String

        def initialize(
          @input : Types::InputPrompt,
          @target_model_id : String
        )
        end
      end

      struct OptimizePromptResponse
        include JSON::Serializable

        # The prompt after being optimized for the task.
        @[JSON::Field(key: "optimizedPrompt")]
        getter optimized_prompt : Types::OptimizedPromptStream

        def initialize(
          @optimized_prompt : Types::OptimizedPromptStream
        )
        end
      end

      # Contains information about the optimized prompt.
      struct OptimizedPrompt
        include JSON::Serializable

        # Contains information about the text in the prompt that was optimized.
        @[JSON::Field(key: "textPrompt")]
        getter text_prompt : Types::TextPrompt?

        def initialize(
          @text_prompt : Types::TextPrompt? = nil
        )
        end
      end

      # An event in which the prompt was optimized.
      struct OptimizedPromptEvent
        include JSON::Serializable

        # Contains information about the optimized prompt.
        @[JSON::Field(key: "optimizedPrompt")]
        getter optimized_prompt : Types::OptimizedPrompt?

        def initialize(
          @optimized_prompt : Types::OptimizedPrompt? = nil
        )
        end
      end

      # The stream containing events in the prompt optimization process.
      struct OptimizedPromptStream
        include JSON::Serializable

        # The request is denied because of missing access permissions. Check your permissions and retry your
        # request.
        @[JSON::Field(key: "accessDeniedException")]
        getter access_denied_exception : Types::AccessDeniedException?

        # An event in which the prompt was analyzed in preparation for optimization.
        @[JSON::Field(key: "analyzePromptEvent")]
        getter analyze_prompt_event : Types::AnalyzePromptEvent?

        # There was an issue with a dependency due to a server issue. Retry your request.
        @[JSON::Field(key: "badGatewayException")]
        getter bad_gateway_exception : Types::BadGatewayException?

        # There was an issue with a dependency. Check the resource configurations and retry the request.
        @[JSON::Field(key: "dependencyFailedException")]
        getter dependency_failed_exception : Types::DependencyFailedException?

        # An internal server error occurred. Retry your request.
        @[JSON::Field(key: "internalServerException")]
        getter internal_server_exception : Types::InternalServerException?

        # An event in which the prompt was optimized.
        @[JSON::Field(key: "optimizedPromptEvent")]
        getter optimized_prompt_event : Types::OptimizedPromptEvent?

        # Your request was throttled because of service-wide limitations. Resubmit your request later or in a
        # different region. You can also purchase Provisioned Throughput to increase the rate or number of
        # tokens you can process.
        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?

        # Input validation failed. Check your request parameters and retry the request.
        @[JSON::Field(key: "validationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @access_denied_exception : Types::AccessDeniedException? = nil,
          @analyze_prompt_event : Types::AnalyzePromptEvent? = nil,
          @bad_gateway_exception : Types::BadGatewayException? = nil,
          @dependency_failed_exception : Types::DependencyFailedException? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @optimized_prompt_event : Types::OptimizedPromptEvent? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end

      # Settings for how the model processes the prompt prior to retrieval and generation.
      struct OrchestrationConfiguration
        include JSON::Serializable

        # Additional model parameters and corresponding values not included in the textInferenceConfig
        # structure for a knowledge base. This allows users to provide custom model parameters specific to the
        # language model being used.
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        # Configuration settings for inference when using RetrieveAndGenerate to generate responses while
        # using a knowledge base as a source.
        @[JSON::Field(key: "inferenceConfig")]
        getter inference_config : Types::InferenceConfig?

        # The latency configuration for the model.
        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        # Contains the template for the prompt that's sent to the model. Orchestration prompts must include
        # the $conversation_history$ and $output_format_instructions$ variables. For more information, see Use
        # placeholder variables in the user guide.
        @[JSON::Field(key: "promptTemplate")]
        getter prompt_template : Types::PromptTemplate?

        # To split up the prompt and retrieve multiple sources, set the transformation type to
        # QUERY_DECOMPOSITION .
        @[JSON::Field(key: "queryTransformationConfiguration")]
        getter query_transformation_configuration : Types::QueryTransformationConfiguration?

        def initialize(
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil,
          @inference_config : Types::InferenceConfig? = nil,
          @performance_config : Types::PerformanceConfiguration? = nil,
          @prompt_template : Types::PromptTemplate? = nil,
          @query_transformation_configuration : Types::QueryTransformationConfiguration? = nil
        )
        end
      end

      # The structure of the executor invoking the actions in custom orchestration.
      struct OrchestrationExecutor
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda function containing the business logic that is carried
        # out upon invoking the action.
        @[JSON::Field(key: "lambda")]
        getter lambda : String?

        def initialize(
          @lambda : String? = nil
        )
        end
      end

      # The foundation model output from the orchestration step.
      struct OrchestrationModelInvocationOutput
        include JSON::Serializable

        # Contains information about the foundation model output from the orchestration step.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # Contains details of the raw response from the foundation model output.
        @[JSON::Field(key: "rawResponse")]
        getter raw_response : Types::RawResponse?

        # Contains content about the reasoning that the model made during the orchestration step.
        @[JSON::Field(key: "reasoningContent")]
        getter reasoning_content : Types::ReasoningContentBlock?

        # The unique identifier of the trace.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @metadata : Types::Metadata? = nil,
          @raw_response : Types::RawResponse? = nil,
          @reasoning_content : Types::ReasoningContentBlock? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # Details about the orchestration step, in which the agent determines the order in which actions are
      # executed and which knowledge bases are retrieved.
      struct OrchestrationTrace
        include JSON::Serializable

        # Contains information pertaining to the action group or knowledge base that is being invoked.
        @[JSON::Field(key: "invocationInput")]
        getter invocation_input : Types::InvocationInput?

        # The input for the orchestration step. The type is ORCHESTRATION . The text contains the prompt. The
        # inferenceConfiguration , parserMode , and overrideLambda values are set in the
        # PromptOverrideConfiguration object that was set when the agent was created or updated.
        @[JSON::Field(key: "modelInvocationInput")]
        getter model_invocation_input : Types::ModelInvocationInput?

        # Contains information pertaining to the output from the foundation model that is being invoked.
        @[JSON::Field(key: "modelInvocationOutput")]
        getter model_invocation_output : Types::OrchestrationModelInvocationOutput?

        # Details about the observation (the output of the action group Lambda or knowledge base) made by the
        # agent.
        @[JSON::Field(key: "observation")]
        getter observation : Types::Observation?

        # Details about the reasoning, based on the input, that the agent uses to justify carrying out an
        # action group or getting information from a knowledge base.
        @[JSON::Field(key: "rationale")]
        getter rationale : Types::Rationale?

        def initialize(
          @invocation_input : Types::InvocationInput? = nil,
          @model_invocation_input : Types::ModelInvocationInput? = nil,
          @model_invocation_output : Types::OrchestrationModelInvocationOutput? = nil,
          @observation : Types::Observation? = nil,
          @rationale : Types::Rationale? = nil
        )
        end
      end

      # Contains details of the response from code interpreter.
      struct OutputFile
        include JSON::Serializable

        # The byte count of files that contains response from code interpreter.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        # The name of the file containing response from code interpreter.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of file that contains response from the code interpreter.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @bytes : Bytes? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A parameter for the API request or function.
      struct Parameter
        include JSON::Serializable

        # The name of the parameter.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of the parameter.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The value of the parameter.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains details about a parameter in a function for an action group.
      struct ParameterDetail
        include JSON::Serializable

        # The data type of the parameter.
        @[JSON::Field(key: "type")]
        getter type : String

        # A description of the parameter. Helps the foundation model determine how to elicit the parameters
        # from the user.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether the parameter is required for the agent to complete the function for action group
        # invocation.
        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @type : String,
          @description : String? = nil,
          @required : Bool? = nil
        )
        end
      end

      # Contains a part of an agent response and citations for it.
      struct PayloadPart
        include JSON::Serializable

        # Contains citations for a part of an agent response.
        @[JSON::Field(key: "attribution")]
        getter attribution : Types::Attribution?

        # A part of the agent response in bytes.
        @[JSON::Field(key: "bytes")]
        getter bytes : Bytes?

        def initialize(
          @attribution : Types::Attribution? = nil,
          @bytes : Bytes? = nil
        )
        end
      end

      # Performance settings for a model.
      struct PerformanceConfiguration
        include JSON::Serializable

        # To use a latency-optimized version of the model, set to optimized .
        @[JSON::Field(key: "latency")]
        getter latency : String?

        def initialize(
          @latency : String? = nil
        )
        end
      end

      # The foundation model output from the post-processing step.
      struct PostProcessingModelInvocationOutput
        include JSON::Serializable

        # Contains information about the foundation model output from the post-processing step.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # Details about the response from the Lambda parsing of the output of the post-processing step.
        @[JSON::Field(key: "parsedResponse")]
        getter parsed_response : Types::PostProcessingParsedResponse?

        # Details of the raw response from the foundation model output.
        @[JSON::Field(key: "rawResponse")]
        getter raw_response : Types::RawResponse?

        # Contains content about the reasoning that the model made during the post-processing step.
        @[JSON::Field(key: "reasoningContent")]
        getter reasoning_content : Types::ReasoningContentBlock?

        # The unique identifier of the trace.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @metadata : Types::Metadata? = nil,
          @parsed_response : Types::PostProcessingParsedResponse? = nil,
          @raw_response : Types::RawResponse? = nil,
          @reasoning_content : Types::ReasoningContentBlock? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # Details about the response from the Lambda parsing of the output from the post-processing step.
      struct PostProcessingParsedResponse
        include JSON::Serializable

        # The text returned by the parser.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Details about the post-processing step, in which the agent shapes the response.
      struct PostProcessingTrace
        include JSON::Serializable

        # The input for the post-processing step. The type is POST_PROCESSING . The text contains the prompt.
        # The inferenceConfiguration , parserMode , and overrideLambda values are set in the
        # PromptOverrideConfiguration object that was set when the agent was created or updated.
        @[JSON::Field(key: "modelInvocationInput")]
        getter model_invocation_input : Types::ModelInvocationInput?

        # The foundation model output from the post-processing step.
        @[JSON::Field(key: "modelInvocationOutput")]
        getter model_invocation_output : Types::PostProcessingModelInvocationOutput?

        def initialize(
          @model_invocation_input : Types::ModelInvocationInput? = nil,
          @model_invocation_output : Types::PostProcessingModelInvocationOutput? = nil
        )
        end
      end

      # The foundation model output from the pre-processing step.
      struct PreProcessingModelInvocationOutput
        include JSON::Serializable

        # Contains information about the foundation model output from the pre-processing step.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # Details about the response from the Lambda parsing of the output of the pre-processing step.
        @[JSON::Field(key: "parsedResponse")]
        getter parsed_response : Types::PreProcessingParsedResponse?

        # Details of the raw response from the foundation model output.
        @[JSON::Field(key: "rawResponse")]
        getter raw_response : Types::RawResponse?

        # Contains content about the reasoning that the model made during the pre-processing step.
        @[JSON::Field(key: "reasoningContent")]
        getter reasoning_content : Types::ReasoningContentBlock?

        # The unique identifier of the trace.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @metadata : Types::Metadata? = nil,
          @parsed_response : Types::PreProcessingParsedResponse? = nil,
          @raw_response : Types::RawResponse? = nil,
          @reasoning_content : Types::ReasoningContentBlock? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # Details about the response from the Lambda parsing of the output from the pre-processing step.
      struct PreProcessingParsedResponse
        include JSON::Serializable

        # Whether the user input is valid or not. If false , the agent doesn't proceed to orchestration.
        @[JSON::Field(key: "isValid")]
        getter is_valid : Bool?

        # The text returned by the parsing of the pre-processing step, explaining the steps that the agent
        # plans to take in orchestration, if the user input is valid.
        @[JSON::Field(key: "rationale")]
        getter rationale : String?

        def initialize(
          @is_valid : Bool? = nil,
          @rationale : String? = nil
        )
        end
      end

      # Details about the pre-processing step, in which the agent contextualizes and categorizes user
      # inputs.
      struct PreProcessingTrace
        include JSON::Serializable

        # The input for the pre-processing step. The type is PRE_PROCESSING . The text contains the prompt.
        # The inferenceConfiguration , parserMode , and overrideLambda values are set in the
        # PromptOverrideConfiguration object that was set when the agent was created or updated.
        @[JSON::Field(key: "modelInvocationInput")]
        getter model_invocation_input : Types::ModelInvocationInput?

        # The foundation model output from the pre-processing step.
        @[JSON::Field(key: "modelInvocationOutput")]
        getter model_invocation_output : Types::PreProcessingModelInvocationOutput?

        def initialize(
          @model_invocation_input : Types::ModelInvocationInput? = nil,
          @model_invocation_output : Types::PreProcessingModelInvocationOutput? = nil
        )
        end
      end

      # Contains configurations to override a prompt template in one part of an agent sequence. For more
      # information, see Advanced prompts .
      struct PromptConfiguration
        include JSON::Serializable

        # If the Converse or ConverseStream operations support the model, additionalModelRequestFields
        # contains additional inference parameters, beyond the base set of inference parameters in the
        # inferenceConfiguration field. For more information, see Inference request parameters and response
        # fields for foundation models in the Amazon Bedrock user guide.
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Types::Document?

        # Defines the prompt template with which to replace the default prompt template. You can use
        # placeholder variables in the base prompt template to customize the prompt. For more information, see
        # Prompt template placeholder variables . For more information, see Configure the prompt templates .
        @[JSON::Field(key: "basePromptTemplate")]
        getter base_prompt_template : String?

        # The foundation model to use.
        @[JSON::Field(key: "foundationModel")]
        getter foundation_model : String?

        # Contains inference parameters to use when the agent invokes a foundation model in the part of the
        # agent sequence defined by the promptType . For more information, see Inference parameters for
        # foundation models .
        @[JSON::Field(key: "inferenceConfiguration")]
        getter inference_configuration : Types::InferenceConfiguration?

        # Specifies whether to override the default parser Lambda function when parsing the raw foundation
        # model output in the part of the agent sequence defined by the promptType . If you set the field as
        # OVERRIDDEN , the overrideLambda field in the PromptOverrideConfiguration must be specified with the
        # ARN of a Lambda function.
        @[JSON::Field(key: "parserMode")]
        getter parser_mode : String?

        # Specifies whether to override the default prompt template for this promptType . Set this value to
        # OVERRIDDEN to use the prompt that you provide in the basePromptTemplate . If you leave it as DEFAULT
        # , the agent uses a default prompt template.
        @[JSON::Field(key: "promptCreationMode")]
        getter prompt_creation_mode : String?

        # Specifies whether to allow the inline agent to carry out the step specified in the promptType . If
        # you set this value to DISABLED , the agent skips that step. The default state for each promptType is
        # as follows. PRE_PROCESSING – ENABLED ORCHESTRATION – ENABLED KNOWLEDGE_BASE_RESPONSE_GENERATION –
        # ENABLED POST_PROCESSING – DISABLED
        @[JSON::Field(key: "promptState")]
        getter prompt_state : String?

        # The step in the agent sequence that this prompt configuration applies to.
        @[JSON::Field(key: "promptType")]
        getter prompt_type : String?

        def initialize(
          @additional_model_request_fields : Types::Document? = nil,
          @base_prompt_template : String? = nil,
          @foundation_model : String? = nil,
          @inference_configuration : Types::InferenceConfiguration? = nil,
          @parser_mode : String? = nil,
          @prompt_creation_mode : String? = nil,
          @prompt_state : String? = nil,
          @prompt_type : String? = nil
        )
        end
      end

      # Specifies parameters that control how the service populates the agent prompt for an InvokeAgent or
      # InvokeInlineAgent request. You can control which aspects of previous invocations in the same agent
      # session the service uses to populate the agent prompt. This gives you more granular control over the
      # contextual history that is used to process the current request.
      struct PromptCreationConfigurations
        include JSON::Serializable

        # If true , the service removes any content between &lt;thinking&gt; tags from previous conversations
        # in an agent session. The service will only remove content from already processed turns. This helps
        # you remove content which might not be useful for current and subsequent invocations. This can reduce
        # the input token count and potentially save costs. The default value is false .
        @[JSON::Field(key: "excludePreviousThinkingSteps")]
        getter exclude_previous_thinking_steps : Bool?

        # The number of previous conversations from the ongoing agent session to include in the conversation
        # history of the agent prompt, during the current invocation. This gives you more granular control
        # over the context that the model is made aware of, and helps the model remove older context which is
        # no longer useful during the ongoing agent session.
        @[JSON::Field(key: "previousConversationTurnsToInclude")]
        getter previous_conversation_turns_to_include : Int32?

        def initialize(
          @exclude_previous_thinking_steps : Bool? = nil,
          @previous_conversation_turns_to_include : Int32? = nil
        )
        end
      end

      # Contains configurations to override prompts in different parts of an agent sequence. For more
      # information, see Advanced prompts .
      struct PromptOverrideConfiguration
        include JSON::Serializable

        # Contains configurations to override a prompt template in one part of an agent sequence. For more
        # information, see Advanced prompts .
        @[JSON::Field(key: "promptConfigurations")]
        getter prompt_configurations : Array(Types::PromptConfiguration)

        # The ARN of the Lambda function to use when parsing the raw foundation model output in parts of the
        # agent sequence. If you specify this field, at least one of the promptConfigurations must contain a
        # parserMode value that is set to OVERRIDDEN . For more information, see Parser Lambda function in
        # Amazon Bedrock Agents .
        @[JSON::Field(key: "overrideLambda")]
        getter override_lambda : String?

        def initialize(
          @prompt_configurations : Array(Types::PromptConfiguration),
          @override_lambda : String? = nil
        )
        end
      end

      # Contains the template for the prompt that's sent to the model for response generation. For more
      # information, see Knowledge base prompt templates . This data type is used in the following API
      # operations: RetrieveAndGenerate request – in the filter field
      struct PromptTemplate
        include JSON::Serializable

        # The template for the prompt that's sent to the model for response generation. You can include prompt
        # placeholders, which become replaced before the prompt is sent to the model to provide instructions
        # and context to the model. In addition, you can include XML tags to delineate meaningful sections of
        # the prompt template. For more information, see the following resources: Knowledge base prompt
        # templates Use XML tags with Anthropic Claude models
        @[JSON::Field(key: "textPromptTemplate")]
        getter text_prompt_template : String?

        def initialize(
          @text_prompt_template : String? = nil
        )
        end
      end

      # Contains the parameters in the request body.
      struct PropertyParameters
        include JSON::Serializable

        # A list of parameters in the request body.
        @[JSON::Field(key: "properties")]
        getter properties : Array(Types::Parameter)?

        def initialize(
          @properties : Array(Types::Parameter)? = nil
        )
        end
      end

      struct PutInvocationStepRequest
        include JSON::Serializable

        # The unique identifier (in UUID format) of the invocation to add the invocation step to.
        @[JSON::Field(key: "invocationIdentifier")]
        getter invocation_identifier : String

        # The timestamp for when the invocation step occurred.
        @[JSON::Field(key: "invocationStepTime")]
        getter invocation_step_time : Time

        # The payload for the invocation step, including text and images for the interaction.
        @[JSON::Field(key: "payload")]
        getter payload : Types::InvocationStepPayload

        # The unique identifier for the session to add the invocation step to. You can specify either the
        # session's sessionId or its Amazon Resource Name (ARN).
        @[JSON::Field(key: "sessionIdentifier")]
        getter session_identifier : String

        # The unique identifier of the invocation step in UUID format.
        @[JSON::Field(key: "invocationStepId")]
        getter invocation_step_id : String?

        def initialize(
          @invocation_identifier : String,
          @invocation_step_time : Time,
          @payload : Types::InvocationStepPayload,
          @session_identifier : String,
          @invocation_step_id : String? = nil
        )
        end
      end

      struct PutInvocationStepResponse
        include JSON::Serializable

        # The unique identifier of the invocation step in UUID format.
        @[JSON::Field(key: "invocationStepId")]
        getter invocation_step_id : String

        def initialize(
          @invocation_step_id : String
        )
        end
      end

      # Contains information about a natural language query to transform into SQL.
      struct QueryGenerationInput
        include JSON::Serializable

        # The text of the query.
        @[JSON::Field(key: "text")]
        getter text : String

        # The type of the query.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @text : String,
          @type : String
        )
        end
      end

      # To split up the prompt and retrieve multiple sources, set the transformation type to
      # QUERY_DECOMPOSITION .
      struct QueryTransformationConfiguration
        include JSON::Serializable

        # The type of transformation to apply to the prompt.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # Contains the reasoning, based on the input, that the agent uses to justify carrying out an action
      # group or getting information from a knowledge base.
      struct Rationale
        include JSON::Serializable

        # The reasoning or thought process of the agent, based on the input.
        @[JSON::Field(key: "text")]
        getter text : String?

        # The unique identifier of the trace step.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @text : String? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # Contains the raw output from the foundation model.
      struct RawResponse
        include JSON::Serializable

        # The foundation model's raw output content.
        @[JSON::Field(key: "content")]
        getter content : String?

        def initialize(
          @content : String? = nil
        )
        end
      end

      # Contains content regarding the reasoning that the foundation model made with respect to the content
      # in the content block. Reasoning refers to a Chain of Thought (CoT) that the model generates to
      # enhance the accuracy of its final response.
      struct ReasoningContentBlock
        include JSON::Serializable

        # Contains information about the reasoning that the model used to return the content in the content
        # block.
        @[JSON::Field(key: "reasoningText")]
        getter reasoning_text : Types::ReasoningTextBlock?

        # The content in the reasoning that was encrypted by the model provider for trust and safety reasons.
        @[JSON::Field(key: "redactedContent")]
        getter redacted_content : Bytes?

        def initialize(
          @reasoning_text : Types::ReasoningTextBlock? = nil,
          @redacted_content : Bytes? = nil
        )
        end
      end

      # Contains information about the reasoning that the model used to return the content in the content
      # block.
      struct ReasoningTextBlock
        include JSON::Serializable

        # Text describing the reasoning that the model used to return the content in the content block.
        @[JSON::Field(key: "text")]
        getter text : String

        # A hash of all the messages in the conversation to ensure that the content in the reasoning text
        # block isn't tampered with. You must submit the signature in subsequent Converse requests, in
        # addition to the previous messages. If the previous messages are tampered with, the response throws
        # an error.
        @[JSON::Field(key: "signature")]
        getter signature : String?

        def initialize(
          @text : String,
          @signature : String? = nil
        )
        end
      end

      # Contains details about the agent's response to reprompt the input.
      struct RepromptResponse
        include JSON::Serializable

        # Specifies what output is prompting the agent to reprompt the input.
        @[JSON::Field(key: "source")]
        getter source : String?

        # The text reprompting the input.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @source : String? = nil,
          @text : String? = nil
        )
        end
      end

      # The parameters in the API request body.
      struct RequestBody
        include JSON::Serializable

        # The content in the request body.
        @[JSON::Field(key: "content")]
        getter content : Hash(String, Array(Types::Parameter))?

        def initialize(
          @content : Hash(String, Array(Types::Parameter))? = nil
        )
        end
      end

      # Contains information about a document to rerank. Choose the type to define and include the field
      # that corresponds to the type.
      struct RerankDocument
        include JSON::Serializable

        # The type of document to rerank.
        @[JSON::Field(key: "type")]
        getter type : String

        # Contains a JSON document to rerank.
        @[JSON::Field(key: "jsonDocument")]
        getter json_document : Types::Document?

        # Contains information about a text document to rerank.
        @[JSON::Field(key: "textDocument")]
        getter text_document : Types::RerankTextDocument?

        def initialize(
          @type : String,
          @json_document : Types::Document? = nil,
          @text_document : Types::RerankTextDocument? = nil
        )
        end
      end

      # Contains information about a query to submit to the reranker model.
      struct RerankQuery
        include JSON::Serializable

        # Contains information about a text query.
        @[JSON::Field(key: "textQuery")]
        getter text_query : Types::RerankTextDocument

        # The type of the query.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @text_query : Types::RerankTextDocument,
          @type : String
        )
        end
      end

      struct RerankRequest
        include JSON::Serializable

        # An array of objects, each of which contains information about a query to submit to the reranker
        # model.
        @[JSON::Field(key: "queries")]
        getter queries : Array(Types::RerankQuery)

        # Contains configurations for reranking.
        @[JSON::Field(key: "rerankingConfiguration")]
        getter reranking_configuration : Types::RerankingConfiguration

        # An array of objects, each of which contains information about the sources to rerank.
        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::RerankSource)

        # If the total number of results was greater than could fit in a response, a token is returned in the
        # nextToken field. You can enter that token in this field to return the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @queries : Array(Types::RerankQuery),
          @reranking_configuration : Types::RerankingConfiguration,
          @sources : Array(Types::RerankSource),
          @next_token : String? = nil
        )
        end
      end

      struct RerankResponse
        include JSON::Serializable

        # An array of objects, each of which contains information about the results of reranking.
        @[JSON::Field(key: "results")]
        getter results : Array(Types::RerankResult)

        # If the total number of results is greater than can fit in the response, use this token in the
        # nextToken field when making another request to return the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @results : Array(Types::RerankResult),
          @next_token : String? = nil
        )
        end
      end

      # Contains information about a document that was reranked.
      struct RerankResult
        include JSON::Serializable

        # The original index of the document from the input sources array.
        @[JSON::Field(key: "index")]
        getter index : Int32

        # The relevance score of the document.
        @[JSON::Field(key: "relevanceScore")]
        getter relevance_score : Float64

        # Contains information about the document.
        @[JSON::Field(key: "document")]
        getter document : Types::RerankDocument?

        def initialize(
          @index : Int32,
          @relevance_score : Float64,
          @document : Types::RerankDocument? = nil
        )
        end
      end

      # Contains information about a source for reranking.
      struct RerankSource
        include JSON::Serializable

        # Contains an inline definition of a source for reranking.
        @[JSON::Field(key: "inlineDocumentSource")]
        getter inline_document_source : Types::RerankDocument

        # The type of the source.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @inline_document_source : Types::RerankDocument,
          @type : String
        )
        end
      end

      # Contains information about a text document to rerank.
      struct RerankTextDocument
        include JSON::Serializable

        # The text of the document.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Contains configurations for reranking.
      struct RerankingConfiguration
        include JSON::Serializable

        # Contains configurations for an Amazon Bedrock reranker.
        @[JSON::Field(key: "bedrockRerankingConfiguration")]
        getter bedrock_reranking_configuration : Types::BedrockRerankingConfiguration

        # The type of reranker that the configurations apply to.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @bedrock_reranking_configuration : Types::BedrockRerankingConfiguration,
          @type : String
        )
        end
      end

      # Contains configurations for the metadata fields to include or exclude when considering reranking. If
      # you include the fieldsToExclude field, the reranker ignores all the metadata fields that you
      # specify. If you include the fieldsToInclude field, the reranker uses only the metadata fields that
      # you specify and ignores all others. You can include only one of these fields.
      struct RerankingMetadataSelectiveModeConfiguration
        include JSON::Serializable

        # An array of objects, each of which specifies a metadata field to exclude from consideration when
        # reranking.
        @[JSON::Field(key: "fieldsToExclude")]
        getter fields_to_exclude : Array(Types::FieldForReranking)?

        # An array of objects, each of which specifies a metadata field to include in consideration when
        # reranking. The remaining metadata fields are ignored.
        @[JSON::Field(key: "fieldsToInclude")]
        getter fields_to_include : Array(Types::FieldForReranking)?

        def initialize(
          @fields_to_exclude : Array(Types::FieldForReranking)? = nil,
          @fields_to_include : Array(Types::FieldForReranking)? = nil
        )
        end
      end

      # The specified resource Amazon Resource Name (ARN) was not found. Check the Amazon Resource Name
      # (ARN) and try your request again.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The response from invoking the agent and associated citations and trace information.
      struct ResponseStream
        include JSON::Serializable

        # The request is denied because of missing access permissions. Check your permissions and retry your
        # request.
        @[JSON::Field(key: "accessDeniedException")]
        getter access_denied_exception : Types::AccessDeniedException?

        # There was an issue with a dependency due to a server issue. Retry your request.
        @[JSON::Field(key: "badGatewayException")]
        getter bad_gateway_exception : Types::BadGatewayException?

        # Contains a part of an agent response and citations for it.
        @[JSON::Field(key: "chunk")]
        getter chunk : Types::PayloadPart?

        # There was a conflict performing an operation. Resolve the conflict and retry your request.
        @[JSON::Field(key: "conflictException")]
        getter conflict_exception : Types::ConflictException?

        # There was an issue with a dependency. Check the resource configurations and retry the request.
        @[JSON::Field(key: "dependencyFailedException")]
        getter dependency_failed_exception : Types::DependencyFailedException?

        # Contains intermediate response for code interpreter if any files have been generated.
        @[JSON::Field(key: "files")]
        getter files : Types::FilePart?

        # An internal server error occurred. Retry your request.
        @[JSON::Field(key: "internalServerException")]
        getter internal_server_exception : Types::InternalServerException?

        # The model specified in the request is not ready to serve Inference requests. The AWS SDK will
        # automatically retry the operation up to 5 times. For information about configuring automatic
        # retries, see Retry behavior in the AWS SDKs and Tools reference guide.
        @[JSON::Field(key: "modelNotReadyException")]
        getter model_not_ready_exception : Types::ModelNotReadyException?

        # The specified resource Amazon Resource Name (ARN) was not found. Check the Amazon Resource Name
        # (ARN) and try your request again.
        @[JSON::Field(key: "resourceNotFoundException")]
        getter resource_not_found_exception : Types::ResourceNotFoundException?

        # Contains the parameters and information that the agent elicited from the customer to carry out an
        # action. This information is returned to the system and can be used in your own setup for fulfilling
        # the action.
        @[JSON::Field(key: "returnControl")]
        getter return_control : Types::ReturnControlPayload?

        # The number of requests exceeds the service quota. Resubmit your request later.
        @[JSON::Field(key: "serviceQuotaExceededException")]
        getter service_quota_exceeded_exception : Types::ServiceQuotaExceededException?

        # The number of requests exceeds the limit. Resubmit your request later.
        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?

        # Contains information about the agent and session, alongside the agent's reasoning process and
        # results from calling actions and querying knowledge bases and metadata about the trace. You can use
        # the trace to understand how the agent arrived at the response it provided the customer. For more
        # information, see Trace events .
        @[JSON::Field(key: "trace")]
        getter trace : Types::TracePart?

        # Input validation failed. Check your request parameters and retry the request.
        @[JSON::Field(key: "validationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @access_denied_exception : Types::AccessDeniedException? = nil,
          @bad_gateway_exception : Types::BadGatewayException? = nil,
          @chunk : Types::PayloadPart? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @dependency_failed_exception : Types::DependencyFailedException? = nil,
          @files : Types::FilePart? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @model_not_ready_exception : Types::ModelNotReadyException? = nil,
          @resource_not_found_exception : Types::ResourceNotFoundException? = nil,
          @return_control : Types::ReturnControlPayload? = nil,
          @service_quota_exceeded_exception : Types::ServiceQuotaExceededException? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @trace : Types::TracePart? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end

      # Specifies the filters to use on the metadata attributes in the knowledge base data sources before
      # returning results. For more information, see Query configurations . See the examples below to see
      # how to use these filters. This data type is used in the following API operations: Retrieve request –
      # in the filter field RetrieveAndGenerate request – in the filter field
      struct RetrievalFilter
        include JSON::Serializable

        # Knowledge base data sources are returned if their metadata attributes fulfill all the filter
        # conditions inside this list.
        @[JSON::Field(key: "andAll")]
        getter and_all : Array(Types::RetrievalFilter)?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value matches the value in this object. The following example would return data
        # sources with an animal attribute whose value is cat : "equals": { "key": "animal", "value": "cat" }
        @[JSON::Field(key: "equals")]
        getter equals : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is greater than the value in this object. The following example would return
        # data sources with an year attribute whose value is greater than 1989 : "greaterThan": { "key":
        # "year", "value": 1989 }
        @[JSON::Field(key: "greaterThan")]
        getter greater_than : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is greater than or equal to the value in this object. The following example
        # would return data sources with an year attribute whose value is greater than or equal to 1989 :
        # "greaterThanOrEquals": { "key": "year", "value": 1989 }
        @[JSON::Field(key: "greaterThanOrEquals")]
        getter greater_than_or_equals : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is in the list specified in the value in this object. The following example
        # would return data sources with an animal attribute that is either cat or dog : "in": { "key":
        # "animal", "value": ["cat", "dog"] }
        @[JSON::Field(key: "in")]
        getter in : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is less than the value in this object. The following example would return data
        # sources with an year attribute whose value is less than to 1989 . "lessThan": { "key": "year",
        # "value": 1989 }
        @[JSON::Field(key: "lessThan")]
        getter less_than : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is less than or equal to the value in this object. The following example would
        # return data sources with an year attribute whose value is less than or equal to 1989 .
        # "lessThanOrEquals": { "key": "year", "value": 1989 }
        @[JSON::Field(key: "lessThanOrEquals")]
        getter less_than_or_equals : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is a list that contains the value as one of its members. The following example
        # would return data sources with an animals attribute that is a list containing a cat member (for
        # example ["dog", "cat"] ). "listContains": { "key": "animals", "value": "cat" }
        @[JSON::Field(key: "listContains")]
        getter list_contains : Types::FilterAttribute?

        # Knowledge base data sources are returned when: It contains a metadata attribute whose name matches
        # the key and whose value doesn't match the value in this object. The key is not present in the
        # document. The following example would return data sources that don't contain an animal attribute
        # whose value is cat . "notEquals": { "key": "animal", "value": "cat" }
        @[JSON::Field(key: "notEquals")]
        getter not_equals : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value isn't in the list specified in the value in this object. The following example
        # would return data sources whose animal attribute is neither cat nor dog . "notIn": { "key":
        # "animal", "value": ["cat", "dog"] }
        @[JSON::Field(key: "notIn")]
        getter not_in : Types::FilterAttribute?

        # Knowledge base data sources are returned if their metadata attributes fulfill at least one of the
        # filter conditions inside this list.
        @[JSON::Field(key: "orAll")]
        getter or_all : Array(Types::RetrievalFilter)?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value starts with the value in this object. This filter is currently only supported
        # for Amazon OpenSearch Serverless vector stores. The following example would return data sources with
        # an animal attribute starts with ca (for example, cat or camel ). "startsWith": { "key": "animal",
        # "value": "ca" }
        @[JSON::Field(key: "startsWith")]
        getter starts_with : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is one of the following: A string that contains the value as a substring. The
        # following example would return data sources with an animal attribute that contains the substring at
        # (for example cat ). "stringContains": { "key": "animal", "value": "at" } A list with a member that
        # contains the value as a substring. The following example would return data sources with an animals
        # attribute that is a list containing a member that contains the substring at (for example ["dog",
        # "cat"] ). "stringContains": { "key": "animals", "value": "at" }
        @[JSON::Field(key: "stringContains")]
        getter string_contains : Types::FilterAttribute?

        def initialize(
          @and_all : Array(Types::RetrievalFilter)? = nil,
          @equals : Types::FilterAttribute? = nil,
          @greater_than : Types::FilterAttribute? = nil,
          @greater_than_or_equals : Types::FilterAttribute? = nil,
          @in : Types::FilterAttribute? = nil,
          @less_than : Types::FilterAttribute? = nil,
          @less_than_or_equals : Types::FilterAttribute? = nil,
          @list_contains : Types::FilterAttribute? = nil,
          @not_equals : Types::FilterAttribute? = nil,
          @not_in : Types::FilterAttribute? = nil,
          @or_all : Array(Types::RetrievalFilter)? = nil,
          @starts_with : Types::FilterAttribute? = nil,
          @string_contains : Types::FilterAttribute? = nil
        )
        end
      end

      # The Confluence data source location.
      struct RetrievalResultConfluenceLocation
        include JSON::Serializable

        # The Confluence host URL for the data source location.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # Contains information about a chunk of text from a data source in the knowledge base. If the result
      # is from a structured data source, the cell in the database and the type of the value is also
      # identified. This data type is used in the following API operations: Retrieve response – in the
      # content field RetrieveAndGenerate response – in the content field InvokeAgent response – in the
      # content field
      struct RetrievalResultContent
        include JSON::Serializable

        # Audio segment information when the retrieval result contains audio content.
        @[JSON::Field(key: "audio")]
        getter audio : Types::AudioSegment?

        # A data URI with base64-encoded content from the data source. The URI is in the following format:
        # returned in the following format: data:image/jpeg;base64,${base64-encoded string} .
        @[JSON::Field(key: "byteContent")]
        getter byte_content : String?

        # Specifies information about the rows with the cells to return in retrieval.
        @[JSON::Field(key: "row")]
        getter row : Array(Types::RetrievalResultContentColumn)?

        # The cited text from the data source.
        @[JSON::Field(key: "text")]
        getter text : String?

        # The type of content in the retrieval result.
        @[JSON::Field(key: "type")]
        getter type : String?

        # Video segment information when the retrieval result contains video content.
        @[JSON::Field(key: "video")]
        getter video : Types::VideoSegment?

        def initialize(
          @audio : Types::AudioSegment? = nil,
          @byte_content : String? = nil,
          @row : Array(Types::RetrievalResultContentColumn)? = nil,
          @text : String? = nil,
          @type : String? = nil,
          @video : Types::VideoSegment? = nil
        )
        end
      end

      # Contains information about a column with a cell to return in retrieval.
      struct RetrievalResultContentColumn
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String?

        # The value in the column.
        @[JSON::Field(key: "columnValue")]
        getter column_value : String?

        # The data type of the value.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @column_name : String? = nil,
          @column_value : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information about the location of a document in a custom data source.
      struct RetrievalResultCustomDocumentLocation
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # The location of a result in Amazon Kendra.
      struct RetrievalResultKendraDocumentLocation
        include JSON::Serializable

        # The document's uri.
        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @uri : String? = nil
        )
        end
      end

      # Contains information about the data source location. This data type is used in the following API
      # operations: Retrieve response – in the location field RetrieveAndGenerate response – in the location
      # field InvokeAgent response – in the location field
      struct RetrievalResultLocation
        include JSON::Serializable

        # The type of data source location.
        @[JSON::Field(key: "type")]
        getter type : String

        # The Confluence data source location.
        @[JSON::Field(key: "confluenceLocation")]
        getter confluence_location : Types::RetrievalResultConfluenceLocation?

        # Specifies the location of a document in a custom data source.
        @[JSON::Field(key: "customDocumentLocation")]
        getter custom_document_location : Types::RetrievalResultCustomDocumentLocation?

        # The location of a document in Amazon Kendra.
        @[JSON::Field(key: "kendraDocumentLocation")]
        getter kendra_document_location : Types::RetrievalResultKendraDocumentLocation?

        # The S3 data source location.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::RetrievalResultS3Location?

        # The Salesforce data source location.
        @[JSON::Field(key: "salesforceLocation")]
        getter salesforce_location : Types::RetrievalResultSalesforceLocation?

        # The SharePoint data source location.
        @[JSON::Field(key: "sharePointLocation")]
        getter share_point_location : Types::RetrievalResultSharePointLocation?

        # Specifies information about the SQL query used to retrieve the result.
        @[JSON::Field(key: "sqlLocation")]
        getter sql_location : Types::RetrievalResultSqlLocation?

        # The web URL/URLs data source location.
        @[JSON::Field(key: "webLocation")]
        getter web_location : Types::RetrievalResultWebLocation?

        def initialize(
          @type : String,
          @confluence_location : Types::RetrievalResultConfluenceLocation? = nil,
          @custom_document_location : Types::RetrievalResultCustomDocumentLocation? = nil,
          @kendra_document_location : Types::RetrievalResultKendraDocumentLocation? = nil,
          @s3_location : Types::RetrievalResultS3Location? = nil,
          @salesforce_location : Types::RetrievalResultSalesforceLocation? = nil,
          @share_point_location : Types::RetrievalResultSharePointLocation? = nil,
          @sql_location : Types::RetrievalResultSqlLocation? = nil,
          @web_location : Types::RetrievalResultWebLocation? = nil
        )
        end
      end

      struct RetrievalResultMetadataValue
        include JSON::Serializable

        def initialize
        end
      end

      # The S3 data source location. This data type is used in the following API operations: Retrieve
      # response – in the s3Location field RetrieveAndGenerate response – in the s3Location field
      # InvokeAgent response – in the s3Location field
      struct RetrievalResultS3Location
        include JSON::Serializable

        # The S3 URI for the data source location.
        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @uri : String? = nil
        )
        end
      end

      # The Salesforce data source location.
      struct RetrievalResultSalesforceLocation
        include JSON::Serializable

        # The Salesforce host URL for the data source location.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # The SharePoint data source location.
      struct RetrievalResultSharePointLocation
        include JSON::Serializable

        # The SharePoint site URL for the data source location.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # Contains information about the SQL query used to retrieve the result.
      struct RetrievalResultSqlLocation
        include JSON::Serializable

        # The SQL query used to retrieve the result.
        @[JSON::Field(key: "query")]
        getter query : String?

        def initialize(
          @query : String? = nil
        )
        end
      end

      # The web URL/URLs data source location.
      struct RetrievalResultWebLocation
        include JSON::Serializable

        # The web URL/URLs for the data source location.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # Contains details about the resource being queried. This data type is used in the following API
      # operations: RetrieveAndGenerate request – in the retrieveAndGenerateConfiguration field
      struct RetrieveAndGenerateConfiguration
        include JSON::Serializable

        # The type of resource that contains your data for retrieving information and generating responses. If
        # you choose to use EXTERNAL_SOURCES , then currently only Anthropic Claude 3 Sonnet models for
        # knowledge bases are supported.
        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration for the external source wrapper object in the retrieveAndGenerate function.
        @[JSON::Field(key: "externalSourcesConfiguration")]
        getter external_sources_configuration : Types::ExternalSourcesRetrieveAndGenerateConfiguration?

        # Contains details about the knowledge base for retrieving information and generating responses.
        @[JSON::Field(key: "knowledgeBaseConfiguration")]
        getter knowledge_base_configuration : Types::KnowledgeBaseRetrieveAndGenerateConfiguration?

        def initialize(
          @type : String,
          @external_sources_configuration : Types::ExternalSourcesRetrieveAndGenerateConfiguration? = nil,
          @knowledge_base_configuration : Types::KnowledgeBaseRetrieveAndGenerateConfiguration? = nil
        )
        end
      end

      # Contains the query made to the knowledge base. This data type is used in the following API
      # operations: RetrieveAndGenerate request – in the input field
      struct RetrieveAndGenerateInput
        include JSON::Serializable

        # The query made to the knowledge base, in characters.
        @[JSON::Field(key: "text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      # Contains the response generated from querying the knowledge base. This data type is used in the
      # following API operations: RetrieveAndGenerate response – in the output field
      struct RetrieveAndGenerateOutput
        include JSON::Serializable

        # The response generated from querying the knowledge base.
        @[JSON::Field(key: "text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      # A retrieve and generate output event.
      struct RetrieveAndGenerateOutputEvent
        include JSON::Serializable

        # A text response.
        @[JSON::Field(key: "text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      struct RetrieveAndGenerateRequest
        include JSON::Serializable

        # Contains the query to be made to the knowledge base.
        @[JSON::Field(key: "input")]
        getter input : Types::RetrieveAndGenerateInput

        # Contains configurations for the knowledge base query and retrieval process. For more information,
        # see Query configurations .
        @[JSON::Field(key: "retrieveAndGenerateConfiguration")]
        getter retrieve_and_generate_configuration : Types::RetrieveAndGenerateConfiguration?

        # Contains details about the session with the knowledge base.
        @[JSON::Field(key: "sessionConfiguration")]
        getter session_configuration : Types::RetrieveAndGenerateSessionConfiguration?

        # The unique identifier of the session. When you first make a RetrieveAndGenerate request, Amazon
        # Bedrock automatically generates this value. You must reuse this value for all subsequent requests in
        # the same conversational session. This value allows Amazon Bedrock to maintain context and knowledge
        # from previous interactions. You can't explicitly set the sessionId yourself.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @input : Types::RetrieveAndGenerateInput,
          @retrieve_and_generate_configuration : Types::RetrieveAndGenerateConfiguration? = nil,
          @session_configuration : Types::RetrieveAndGenerateSessionConfiguration? = nil,
          @session_id : String? = nil
        )
        end
      end

      struct RetrieveAndGenerateResponse
        include JSON::Serializable

        # Contains the response generated from querying the knowledge base.
        @[JSON::Field(key: "output")]
        getter output : Types::RetrieveAndGenerateOutput

        # The unique identifier of the session. When you first make a RetrieveAndGenerate request, Amazon
        # Bedrock automatically generates this value. You must reuse this value for all subsequent requests in
        # the same conversational session. This value allows Amazon Bedrock to maintain context and knowledge
        # from previous interactions. You can't explicitly set the sessionId yourself.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # A list of segments of the generated response that are based on sources in the knowledge base,
        # alongside information about the sources.
        @[JSON::Field(key: "citations")]
        getter citations : Array(Types::Citation)?

        # Specifies if there is a guardrail intervention in the response.
        @[JSON::Field(key: "guardrailAction")]
        getter guardrail_action : String?

        def initialize(
          @output : Types::RetrieveAndGenerateOutput,
          @session_id : String,
          @citations : Array(Types::Citation)? = nil,
          @guardrail_action : String? = nil
        )
        end
      end

      # Contains configuration about the session with the knowledge base. This data type is used in the
      # following API operations: RetrieveAndGenerate request – in the sessionConfiguration field
      struct RetrieveAndGenerateSessionConfiguration
        include JSON::Serializable

        # The ARN of the KMS key encrypting the session.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String

        def initialize(
          @kms_key_arn : String
        )
        end
      end

      struct RetrieveAndGenerateStreamRequest
        include JSON::Serializable

        # Contains the query to be made to the knowledge base.
        @[JSON::Field(key: "input")]
        getter input : Types::RetrieveAndGenerateInput

        # Contains configurations for the knowledge base query and retrieval process. For more information,
        # see Query configurations .
        @[JSON::Field(key: "retrieveAndGenerateConfiguration")]
        getter retrieve_and_generate_configuration : Types::RetrieveAndGenerateConfiguration?

        # Contains details about the session with the knowledge base.
        @[JSON::Field(key: "sessionConfiguration")]
        getter session_configuration : Types::RetrieveAndGenerateSessionConfiguration?

        # The unique identifier of the session. When you first make a RetrieveAndGenerate request, Amazon
        # Bedrock automatically generates this value. You must reuse this value for all subsequent requests in
        # the same conversational session. This value allows Amazon Bedrock to maintain context and knowledge
        # from previous interactions. You can't explicitly set the sessionId yourself.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @input : Types::RetrieveAndGenerateInput,
          @retrieve_and_generate_configuration : Types::RetrieveAndGenerateConfiguration? = nil,
          @session_configuration : Types::RetrieveAndGenerateSessionConfiguration? = nil,
          @session_id : String? = nil
        )
        end
      end

      struct RetrieveAndGenerateStreamResponse
        include JSON::Serializable

        # The session ID.
        @[JSON::Field(key: "x-amzn-bedrock-knowledge-base-session-id")]
        getter session_id : String

        # A stream of events from the model.
        @[JSON::Field(key: "stream")]
        getter stream : Types::RetrieveAndGenerateStreamResponseOutput

        def initialize(
          @session_id : String,
          @stream : Types::RetrieveAndGenerateStreamResponseOutput
        )
        end
      end

      # A retrieve and generate stream response output.
      struct RetrieveAndGenerateStreamResponseOutput
        include JSON::Serializable

        # The request is denied because you do not have sufficient permissions to perform the requested
        # action. For troubleshooting this error, see AccessDeniedException in the Amazon Bedrock User Guide.
        @[JSON::Field(key: "accessDeniedException")]
        getter access_denied_exception : Types::AccessDeniedException?

        # The request failed due to a bad gateway error.
        @[JSON::Field(key: "badGatewayException")]
        getter bad_gateway_exception : Types::BadGatewayException?

        # A citation event.
        @[JSON::Field(key: "citation")]
        getter citation : Types::CitationEvent?

        # Error occurred because of a conflict while performing an operation.
        @[JSON::Field(key: "conflictException")]
        getter conflict_exception : Types::ConflictException?

        # The request failed due to a dependency error.
        @[JSON::Field(key: "dependencyFailedException")]
        getter dependency_failed_exception : Types::DependencyFailedException?

        # A guardrail event.
        @[JSON::Field(key: "guardrail")]
        getter guardrail : Types::GuardrailEvent?

        # An internal server error occurred. Retry your request.
        @[JSON::Field(key: "internalServerException")]
        getter internal_server_exception : Types::InternalServerException?

        # An output event.
        @[JSON::Field(key: "output")]
        getter output : Types::RetrieveAndGenerateOutputEvent?

        # The specified resource ARN was not found. For troubleshooting this error, see ResourceNotFound in
        # the Amazon Bedrock User Guide.
        @[JSON::Field(key: "resourceNotFoundException")]
        getter resource_not_found_exception : Types::ResourceNotFoundException?

        # Your request exceeds the service quota for your account. You can view your quotas at Viewing service
        # quotas . You can resubmit your request later.
        @[JSON::Field(key: "serviceQuotaExceededException")]
        getter service_quota_exceeded_exception : Types::ServiceQuotaExceededException?

        # Your request was denied due to exceeding the account quotas for Amazon Bedrock . For troubleshooting
        # this error, see ThrottlingException in the Amazon Bedrock User Guide.
        @[JSON::Field(key: "throttlingException")]
        getter throttling_exception : Types::ThrottlingException?

        # The input fails to satisfy the constraints specified by Amazon Bedrock . For troubleshooting this
        # error, see ValidationError in the Amazon Bedrock User Guide.
        @[JSON::Field(key: "validationException")]
        getter validation_exception : Types::ValidationException?

        def initialize(
          @access_denied_exception : Types::AccessDeniedException? = nil,
          @bad_gateway_exception : Types::BadGatewayException? = nil,
          @citation : Types::CitationEvent? = nil,
          @conflict_exception : Types::ConflictException? = nil,
          @dependency_failed_exception : Types::DependencyFailedException? = nil,
          @guardrail : Types::GuardrailEvent? = nil,
          @internal_server_exception : Types::InternalServerException? = nil,
          @output : Types::RetrieveAndGenerateOutputEvent? = nil,
          @resource_not_found_exception : Types::ResourceNotFoundException? = nil,
          @service_quota_exceeded_exception : Types::ServiceQuotaExceededException? = nil,
          @throttling_exception : Types::ThrottlingException? = nil,
          @validation_exception : Types::ValidationException? = nil
        )
        end
      end

      struct RetrieveRequest
        include JSON::Serializable

        # The unique identifier of the knowledge base to query.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Contains the query to send the knowledge base.
        @[JSON::Field(key: "retrievalQuery")]
        getter retrieval_query : Types::KnowledgeBaseQuery

        # Guardrail settings.
        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # If there are more results than can fit in the response, the response returns a nextToken . Use this
        # token in the nextToken field of another request to retrieve the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Contains configurations for the knowledge base query and retrieval process. For more information,
        # see Query configurations .
        @[JSON::Field(key: "retrievalConfiguration")]
        getter retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration?

        def initialize(
          @knowledge_base_id : String,
          @retrieval_query : Types::KnowledgeBaseQuery,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @next_token : String? = nil,
          @retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration? = nil
        )
        end
      end

      struct RetrieveResponse
        include JSON::Serializable

        # A list of results from querying the knowledge base.
        @[JSON::Field(key: "retrievalResults")]
        getter retrieval_results : Array(Types::KnowledgeBaseRetrievalResult)

        # Specifies if there is a guardrail intervention in the response.
        @[JSON::Field(key: "guardrailAction")]
        getter guardrail_action : String?

        # If there are more results than can fit in the response, the response returns a nextToken . Use this
        # token in the nextToken field of another request to retrieve the next batch of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @retrieval_results : Array(Types::KnowledgeBaseRetrievalResult),
          @guardrail_action : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains metadata about a source cited for the generated response. This data type is used in the
      # following API operations: RetrieveAndGenerate response – in the retrievedReferences field
      # InvokeAgent response – in the retrievedReferences field
      struct RetrievedReference
        include JSON::Serializable

        # Contains the cited text from the data source.
        @[JSON::Field(key: "content")]
        getter content : Types::RetrievalResultContent?

        # Contains information about the location of the data source.
        @[JSON::Field(key: "location")]
        getter location : Types::RetrievalResultLocation?

        # Contains metadata attributes and their values for the file in the data source. For more information,
        # see Metadata and filtering .
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, Types::RetrievalResultMetadataValue)?

        def initialize(
          @content : Types::RetrievalResultContent? = nil,
          @location : Types::RetrievalResultLocation? = nil,
          @metadata : Hash(String, Types::RetrievalResultMetadataValue)? = nil
        )
        end
      end

      # Contains information to return from the action group that the agent has predicted to invoke. This
      # data type is used in the following API operations: InvokeAgent response
      struct ReturnControlPayload
        include JSON::Serializable

        # The identifier of the action group invocation.
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String?

        # A list of objects that contain information about the parameters and inputs that need to be sent into
        # the API operation or function, based on what the agent determines from its session with the user.
        @[JSON::Field(key: "invocationInputs")]
        getter invocation_inputs : Array(Types::InvocationInputMember)?

        def initialize(
          @invocation_id : String? = nil,
          @invocation_inputs : Array(Types::InvocationInputMember)? = nil
        )
        end
      end

      # An action invocation result.
      struct ReturnControlResults
        include JSON::Serializable

        # The action's invocation ID.
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String?

        # The action invocation result.
        @[JSON::Field(key: "returnControlInvocationResults")]
        getter return_control_invocation_results : Array(Types::InvocationResultMember)?

        def initialize(
          @invocation_id : String? = nil,
          @return_control_invocation_results : Array(Types::InvocationResultMember)? = nil
        )
        end
      end

      # Invocation output from a routing classifier model.
      struct RoutingClassifierModelInvocationOutput
        include JSON::Serializable

        # The invocation's metadata.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::Metadata?

        # The invocation's raw response.
        @[JSON::Field(key: "rawResponse")]
        getter raw_response : Types::RawResponse?

        # The invocation's trace ID.
        @[JSON::Field(key: "traceId")]
        getter trace_id : String?

        def initialize(
          @metadata : Types::Metadata? = nil,
          @raw_response : Types::RawResponse? = nil,
          @trace_id : String? = nil
        )
        end
      end

      # A trace for a routing classifier.
      struct RoutingClassifierTrace
        include JSON::Serializable

        # The classifier's invocation input.
        @[JSON::Field(key: "invocationInput")]
        getter invocation_input : Types::InvocationInput?

        # The classifier's model invocation input.
        @[JSON::Field(key: "modelInvocationInput")]
        getter model_invocation_input : Types::ModelInvocationInput?

        # The classifier's model invocation output.
        @[JSON::Field(key: "modelInvocationOutput")]
        getter model_invocation_output : Types::RoutingClassifierModelInvocationOutput?

        # The classifier's observation.
        @[JSON::Field(key: "observation")]
        getter observation : Types::Observation?

        def initialize(
          @invocation_input : Types::InvocationInput? = nil,
          @model_invocation_input : Types::ModelInvocationInput? = nil,
          @model_invocation_output : Types::RoutingClassifierModelInvocationOutput? = nil,
          @observation : Types::Observation? = nil
        )
        end
      end

      # The identifier information for an Amazon S3 bucket.
      struct S3Identifier
        include JSON::Serializable

        # The name of the S3 bucket.
        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String?

        # The S3 object key for the S3 resource.
        @[JSON::Field(key: "s3ObjectKey")]
        getter s3_object_key : String?

        def initialize(
          @s3_bucket_name : String? = nil,
          @s3_object_key : String? = nil
        )
        end
      end

      # Information about the Amazon S3 bucket where the image is stored.
      struct S3Location
        include JSON::Serializable

        # The path to the Amazon S3 bucket where the image is stored.
        @[JSON::Field(key: "uri")]
        getter uri : String

        def initialize(
          @uri : String
        )
        end
      end

      # The unique wrapper object of the document from the S3 location.
      struct S3ObjectDoc
        include JSON::Serializable

        # The file location of the S3 wrapper object.
        @[JSON::Field(key: "uri")]
        getter uri : String

        def initialize(
          @uri : String
        )
        end
      end

      # Contains details of the s3 object where the source file is located.
      struct S3ObjectFile
        include JSON::Serializable

        # The uri of the s3 object.
        @[JSON::Field(key: "uri")]
        getter uri : String

        def initialize(
          @uri : String
        )
        end
      end

      # Represents a condition that was satisfied during a condition node evaluation in a flow execution.
      # Flow executions is in preview release for Amazon Bedrock and is subject to change.
      struct SatisfiedCondition
        include JSON::Serializable

        # The name of the condition that was satisfied.
        @[JSON::Field(key: "conditionName")]
        getter condition_name : String

        def initialize(
          @condition_name : String
        )
        end
      end

      # The number of requests exceeds the service quota. Resubmit your request later.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains parameters that specify various attributes that persist across a session or prompt. You can
      # define session state attributes as key-value pairs when writing a Lambda function for an action
      # group or pass them when making an InvokeAgent request. Use session state attributes to control and
      # provide conversational context for your agent and to help customize your agent's behavior. For more
      # information, see Control session context .
      struct SessionState
        include JSON::Serializable

        # The state's conversation history.
        @[JSON::Field(key: "conversationHistory")]
        getter conversation_history : Types::ConversationHistory?

        # Contains information about the files used by code interpreter.
        @[JSON::Field(key: "files")]
        getter files : Array(Types::InputFile)?

        # The identifier of the invocation of an action. This value must match the invocationId returned in
        # the InvokeAgent response for the action whose results are provided in the
        # returnControlInvocationResults field. For more information, see Return control to the agent
        # developer and Control session context .
        @[JSON::Field(key: "invocationId")]
        getter invocation_id : String?

        # An array of configurations, each of which applies to a knowledge base attached to the agent.
        @[JSON::Field(key: "knowledgeBaseConfigurations")]
        getter knowledge_base_configurations : Array(Types::KnowledgeBaseConfiguration)?

        # Contains attributes that persist across a prompt and the values of those attributes. In
        # orchestration prompt template, these attributes replace the $prompt_session_attributes$ placeholder
        # variable. For more information, see Prompt template placeholder variables . In multi-agent
        # collaboration , the promptSessionAttributes will only be used by supervisor agent when
        # $prompt_session_attributes$ is present in prompt template.
        @[JSON::Field(key: "promptSessionAttributes")]
        getter prompt_session_attributes : Hash(String, String)?

        # Contains information about the results from the action group invocation. For more information, see
        # Return control to the agent developer and Control session context . If you include this field, the
        # inputText field will be ignored.
        @[JSON::Field(key: "returnControlInvocationResults")]
        getter return_control_invocation_results : Array(Types::InvocationResultMember)?

        # Contains attributes that persist across a session and the values of those attributes. If
        # sessionAttributes are passed to a supervisor agent in multi-agent collaboration , it will be
        # forwarded to all agent collaborators.
        @[JSON::Field(key: "sessionAttributes")]
        getter session_attributes : Hash(String, String)?

        def initialize(
          @conversation_history : Types::ConversationHistory? = nil,
          @files : Array(Types::InputFile)? = nil,
          @invocation_id : String? = nil,
          @knowledge_base_configurations : Array(Types::KnowledgeBaseConfiguration)? = nil,
          @prompt_session_attributes : Hash(String, String)? = nil,
          @return_control_invocation_results : Array(Types::InvocationResultMember)? = nil,
          @session_attributes : Hash(String, String)? = nil
        )
        end
      end

      # Contains details about a session. For more information about sessions, see Store and retrieve
      # conversation history and context with Amazon Bedrock sessions .
      struct SessionSummary
        include JSON::Serializable

        # The timestamp for when the session was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp for when the session was last modified.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The Amazon Resource Name (ARN) of the session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier for the session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The current status of the session.
        @[JSON::Field(key: "sessionStatus")]
        getter session_status : String

        def initialize(
          @created_at : Time,
          @last_updated_at : Time,
          @session_arn : String,
          @session_id : String,
          @session_status : String
        )
        end
      end

      # Contains information about where the text with a citation begins and ends in the generated output.
      # This data type is used in the following API operations: RetrieveAndGenerate response – in the span
      # field InvokeAgent response – in the span field
      struct Span
        include JSON::Serializable

        # Where the text with a citation ends in the generated output.
        @[JSON::Field(key: "end")]
        getter end : Int32?

        # Where the text with a citation starts in the generated output.
        @[JSON::Field(key: "start")]
        getter start : Int32?

        def initialize(
          @end : Int32? = nil,
          @start : Int32? = nil
        )
        end
      end

      struct StartFlowExecutionRequest
        include JSON::Serializable

        # The unique identifier of the flow alias to use for the flow execution.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String

        # The unique identifier of the flow to execute.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # The input data required for the flow execution. This must match the input schema defined in the
        # flow.
        @[JSON::Field(key: "inputs")]
        getter inputs : Array(Types::FlowInput)

        # The unique name for the flow execution. If you don't provide one, a system-generated name is used.
        @[JSON::Field(key: "flowExecutionName")]
        getter flow_execution_name : String?

        # The performance settings for the foundation model used in the flow execution.
        @[JSON::Field(key: "modelPerformanceConfiguration")]
        getter model_performance_configuration : Types::ModelPerformanceConfiguration?

        def initialize(
          @flow_alias_identifier : String,
          @flow_identifier : String,
          @inputs : Array(Types::FlowInput),
          @flow_execution_name : String? = nil,
          @model_performance_configuration : Types::ModelPerformanceConfiguration? = nil
        )
        end
      end

      struct StartFlowExecutionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the flow execution.
        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String?

        def initialize(
          @execution_arn : String? = nil
        )
        end
      end

      struct StopFlowExecutionRequest
        include JSON::Serializable

        # The unique identifier of the flow execution to stop.
        @[JSON::Field(key: "executionIdentifier")]
        getter execution_identifier : String

        # The unique identifier of the flow alias used for the execution.
        @[JSON::Field(key: "flowAliasIdentifier")]
        getter flow_alias_identifier : String

        # The unique identifier of the flow.
        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        def initialize(
          @execution_identifier : String,
          @flow_alias_identifier : String,
          @flow_identifier : String
        )
        end
      end

      struct StopFlowExecutionResponse
        include JSON::Serializable

        # The updated status of the flow execution after the stop request. This will typically be ABORTED if
        # the execution was successfully stopped.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) that uniquely identifies the flow execution that was stopped.
        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String?

        def initialize(
          @status : String,
          @execution_arn : String? = nil
        )
        end
      end

      # Configurations for streaming.
      struct StreamingConfigurations
        include JSON::Serializable

        # The guardrail interval to apply as response is generated. By default, the guardrail interval is set
        # to 50 characters. If a larger interval is specified, the response will be generated in larger chunks
        # with fewer ApplyGuardrail calls. The following examples show the response generated for Hello, I am
        # an agent input string. Example response in chunks: Interval set to 3 characters 'Hel', 'lo, ','I
        # am', ' an', ' Age', 'nt' Each chunk has at least 3 characters except for the last chunk Example
        # response in chunks: Interval set to 20 or more characters Hello, I am an Agent
        @[JSON::Field(key: "applyGuardrailInterval")]
        getter apply_guardrail_interval : Int32?

        # Specifies whether to enable streaming for the final response. This is set to false by default.
        @[JSON::Field(key: "streamFinalResponse")]
        getter stream_final_response : Bool?

        def initialize(
          @apply_guardrail_interval : Int32? = nil,
          @stream_final_response : Bool? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to tag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # An object containing key-value pairs that define the tags to attach to the resource.
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

      # Configuration settings for text generation using a language model via the RetrieveAndGenerate
      # operation. Includes parameters like temperature, top-p, maximum token count, and stop sequences. The
      # valid range of maxTokens depends on the accepted values for your chosen model's inference
      # parameters. To see the inference parameters for your model, see Inference parameters for foundation
      # models.
      struct TextInferenceConfig
        include JSON::Serializable

        # The maximum number of tokens to generate in the output text. Do not use the minimum of 0 or the
        # maximum of 65536. The limit values described here are arbitary values, for actual values consult the
        # limits defined by your specific model.
        @[JSON::Field(key: "maxTokens")]
        getter max_tokens : Int32?

        # A list of sequences of characters that, if generated, will cause the model to stop generating
        # further tokens. Do not use a minimum length of 1 or a maximum length of 1000. The limit values
        # described here are arbitary values, for actual values consult the limits defined by your specific
        # model.
        @[JSON::Field(key: "stopSequences")]
        getter stop_sequences : Array(String)?

        # Controls the random-ness of text generated by the language model, influencing how much the model
        # sticks to the most predictable next words versus exploring more surprising options. A lower
        # temperature value (e.g. 0.2 or 0.3) makes model outputs more deterministic or predictable, while a
        # higher temperature (e.g. 0.8 or 0.9) makes the outputs more creative or unpredictable.
        @[JSON::Field(key: "temperature")]
        getter temperature : Float64?

        # A probability distribution threshold which controls what the model considers for the set of possible
        # next tokens. The model will only consider the top p% of the probability distribution when generating
        # the next token.
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

      # Contains information about the text prompt to optimize.
      struct TextPrompt
        include JSON::Serializable

        # The text in the text prompt to optimize.
        @[JSON::Field(key: "text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      # Contains the part of the generated text that contains a citation, alongside where it begins and
      # ends. This data type is used in the following API operations: RetrieveAndGenerate response – in the
      # textResponsePart field InvokeAgent response – in the textResponsePart field
      struct TextResponsePart
        include JSON::Serializable

        # Contains information about where the text with a citation begins and ends in the generated output.
        @[JSON::Field(key: "span")]
        getter span : Types::Span?

        # The part of the generated text that contains a citation.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @span : Types::Span? = nil,
          @text : String? = nil
        )
        end
      end

      # Contains configurations for transforming text to SQL.
      struct TextToSqlConfiguration
        include JSON::Serializable

        # The type of resource to use in transformation.
        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies configurations for a knowledge base to use in transformation.
        @[JSON::Field(key: "knowledgeBaseConfiguration")]
        getter knowledge_base_configuration : Types::TextToSqlKnowledgeBaseConfiguration?

        def initialize(
          @type : String,
          @knowledge_base_configuration : Types::TextToSqlKnowledgeBaseConfiguration? = nil
        )
        end
      end

      # Contains configurations for a knowledge base to use in transformation.
      struct TextToSqlKnowledgeBaseConfiguration
        include JSON::Serializable

        # The ARN of the knowledge base
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        def initialize(
          @knowledge_base_arn : String
        )
        end
      end

      # The number of requests exceeds the limit. Resubmit your request later.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains one part of the agent's reasoning process and results from calling API actions and querying
      # knowledge bases. You can use the trace to understand how the agent arrived at the response it
      # provided the customer. For more information, see Trace enablement .
      struct Trace
        include JSON::Serializable

        # Details about the custom orchestration step in which the agent determines the order in which actions
        # are executed.
        @[JSON::Field(key: "customOrchestrationTrace")]
        getter custom_orchestration_trace : Types::CustomOrchestrationTrace?

        # Contains information about the failure of the interaction.
        @[JSON::Field(key: "failureTrace")]
        getter failure_trace : Types::FailureTrace?

        # The trace details for a trace defined in the Guardrail filter.
        @[JSON::Field(key: "guardrailTrace")]
        getter guardrail_trace : Types::GuardrailTrace?

        # Details about the orchestration step, in which the agent determines the order in which actions are
        # executed and which knowledge bases are retrieved.
        @[JSON::Field(key: "orchestrationTrace")]
        getter orchestration_trace : Types::OrchestrationTrace?

        # Details about the post-processing step, in which the agent shapes the response..
        @[JSON::Field(key: "postProcessingTrace")]
        getter post_processing_trace : Types::PostProcessingTrace?

        # Details about the pre-processing step, in which the agent contextualizes and categorizes user
        # inputs.
        @[JSON::Field(key: "preProcessingTrace")]
        getter pre_processing_trace : Types::PreProcessingTrace?

        # A routing classifier's trace.
        @[JSON::Field(key: "routingClassifierTrace")]
        getter routing_classifier_trace : Types::RoutingClassifierTrace?

        def initialize(
          @custom_orchestration_trace : Types::CustomOrchestrationTrace? = nil,
          @failure_trace : Types::FailureTrace? = nil,
          @guardrail_trace : Types::GuardrailTrace? = nil,
          @orchestration_trace : Types::OrchestrationTrace? = nil,
          @post_processing_trace : Types::PostProcessingTrace? = nil,
          @pre_processing_trace : Types::PreProcessingTrace? = nil,
          @routing_classifier_trace : Types::RoutingClassifierTrace? = nil
        )
        end
      end

      # Contains trace elements for flow execution tracking.
      struct TraceElements
        include JSON::Serializable

        # Agent trace information for the flow execution.
        @[JSON::Field(key: "agentTraces")]
        getter agent_traces : Array(Types::TracePart)?

        def initialize(
          @agent_traces : Array(Types::TracePart)? = nil
        )
        end
      end

      # Contains information about the agent and session, alongside the agent's reasoning process and
      # results from calling API actions and querying knowledge bases and metadata about the trace. You can
      # use the trace to understand how the agent arrived at the response it provided the customer. For more
      # information, see Trace enablement .
      struct TracePart
        include JSON::Serializable

        # The unique identifier of the alias of the agent.
        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String?

        # The unique identifier of the agent.
        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # The version of the agent.
        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String?

        # The part's caller chain.
        @[JSON::Field(key: "callerChain")]
        getter caller_chain : Array(Types::Caller)?

        # The part's collaborator name.
        @[JSON::Field(key: "collaboratorName")]
        getter collaborator_name : String?

        # The time of the trace.
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time?

        # The unique identifier of the session with the agent.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # Contains one part of the agent's reasoning process and results from calling API actions and querying
        # knowledge bases. You can use the trace to understand how the agent arrived at the response it
        # provided the customer. For more information, see Trace enablement .
        @[JSON::Field(key: "trace")]
        getter trace : Types::Trace?

        def initialize(
          @agent_alias_id : String? = nil,
          @agent_id : String? = nil,
          @agent_version : String? = nil,
          @caller_chain : Array(Types::Caller)? = nil,
          @collaborator_name : String? = nil,
          @event_time : Time? = nil,
          @session_id : String? = nil,
          @trace : Types::Trace? = nil
        )
        end
      end

      # Contains configurations for transforming the natural language query into SQL.
      struct TransformationConfiguration
        include JSON::Serializable

        # The mode of the transformation.
        @[JSON::Field(key: "mode")]
        getter mode : String

        # Specifies configurations for transforming text to SQL.
        @[JSON::Field(key: "textToSqlConfiguration")]
        getter text_to_sql_configuration : Types::TextToSqlConfiguration?

        def initialize(
          @mode : String,
          @text_to_sql_configuration : Types::TextToSqlConfiguration? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which to remove tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of keys of the tags to remove from the resource.
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

      struct UpdateSessionRequest
        include JSON::Serializable

        # The unique identifier of the session to modify. You can specify either the session's sessionId or
        # its Amazon Resource Name (ARN).
        @[JSON::Field(key: "sessionIdentifier")]
        getter session_identifier : String

        # A map of key-value pairs containing attributes to be persisted across the session. For example the
        # user's ID, their language preference, and the type of device they are using.
        @[JSON::Field(key: "sessionMetadata")]
        getter session_metadata : Hash(String, String)?

        def initialize(
          @session_identifier : String,
          @session_metadata : Hash(String, String)? = nil
        )
        end
      end

      struct UpdateSessionResponse
        include JSON::Serializable

        # The timestamp for when the session was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp for when the session was last modified.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The Amazon Resource Name (ARN) of the session that was updated.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier of the session you updated.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The status of the session you updated.
        @[JSON::Field(key: "sessionStatus")]
        getter session_status : String

        def initialize(
          @created_at : Time,
          @last_updated_at : Time,
          @session_arn : String,
          @session_id : String,
          @session_status : String
        )
        end
      end

      # Contains information of the usage of the foundation model.
      struct Usage
        include JSON::Serializable

        # Contains information about the input tokens from the foundation model usage.
        @[JSON::Field(key: "inputTokens")]
        getter input_tokens : Int32?

        # Contains information about the output tokens from the foundation model usage.
        @[JSON::Field(key: "outputTokens")]
        getter output_tokens : Int32?

        def initialize(
          @input_tokens : Int32? = nil,
          @output_tokens : Int32? = nil
        )
        end
      end

      # Input validation failed. Check your request parameters and retry the request.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains configurations for reranking with an Amazon Bedrock reranker model.
      struct VectorSearchBedrockRerankingConfiguration
        include JSON::Serializable

        # Contains configurations for the reranker model.
        @[JSON::Field(key: "modelConfiguration")]
        getter model_configuration : Types::VectorSearchBedrockRerankingModelConfiguration

        # Contains configurations for the metadata to use in reranking.
        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfigurationForReranking?

        # The number of results to return after reranking.
        @[JSON::Field(key: "numberOfRerankedResults")]
        getter number_of_reranked_results : Int32?

        def initialize(
          @model_configuration : Types::VectorSearchBedrockRerankingModelConfiguration,
          @metadata_configuration : Types::MetadataConfigurationForReranking? = nil,
          @number_of_reranked_results : Int32? = nil
        )
        end
      end

      # Contains configurations for an Amazon Bedrock reranker model.
      struct VectorSearchBedrockRerankingModelConfiguration
        include JSON::Serializable

        # The ARN of the reranker model to use.
        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # A JSON object whose keys are request fields for the model and whose values are values for those
        # fields.
        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        def initialize(
          @model_arn : String,
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil
        )
        end
      end

      # Contains configurations for reranking the retrieved results.
      struct VectorSearchRerankingConfiguration
        include JSON::Serializable

        # The type of reranker model.
        @[JSON::Field(key: "type")]
        getter type : String

        # Contains configurations for an Amazon Bedrock reranker model.
        @[JSON::Field(key: "bedrockRerankingConfiguration")]
        getter bedrock_reranking_configuration : Types::VectorSearchBedrockRerankingConfiguration?

        def initialize(
          @type : String,
          @bedrock_reranking_configuration : Types::VectorSearchBedrockRerankingConfiguration? = nil
        )
        end
      end

      # Contains information about a video segment retrieved from a knowledge base, including its location
      # and summary. This data type is used in the following API operations: Retrieve response – in the
      # video field
      struct VideoSegment
        include JSON::Serializable

        # The S3 URI where this specific video segment is stored in the multimodal storage destination.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # A text summary describing the content of the video segment.
        @[JSON::Field(key: "summary")]
        getter summary : String?

        def initialize(
          @s3_uri : String,
          @summary : String? = nil
        )
        end
      end
    end
  end
end
