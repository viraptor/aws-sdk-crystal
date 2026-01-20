require "json"
require "time"

module Aws
  module BedrockAgent
    module Types

      # Contains details about the OpenAPI schema for the action group. For more information, see Action
      # group OpenAPI schemas . You can either include the schema directly in the payload field or you can
      # upload it to an S3 bucket and specify the S3 bucket location in the s3 field.

      struct APISchema
        include JSON::Serializable

        # The JSON or YAML-formatted payload defining the OpenAPI schema for the action group. For more
        # information, see Action group OpenAPI schemas .

        @[JSON::Field(key: "payload")]
        getter payload : String?

        # Contains details about the S3 object containing the OpenAPI schema for the action group. For more
        # information, see Action group OpenAPI schemas .

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Identifier?

        def initialize(
          @payload : String? = nil,
          @s3 : Types::S3Identifier? = nil
        )
        end
      end

      # The request is denied because of missing access permissions.

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

        # To return the action group invocation results directly in the InvokeAgent response, specify
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

      # Contains details about an action group.

      struct ActionGroupSummary
        include JSON::Serializable

        # The unique identifier of the action group.

        @[JSON::Field(key: "actionGroupId")]
        getter action_group_id : String

        # The name of the action group.

        @[JSON::Field(key: "actionGroupName")]
        getter action_group_name : String

        # Specifies whether the action group is available for the agent to invoke or not when sending an
        # InvokeAgent request.

        @[JSON::Field(key: "actionGroupState")]
        getter action_group_state : String

        # The time at which the action group was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the action group.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @action_group_id : String,
          @action_group_name : String,
          @action_group_state : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end


      struct AdditionalModelRequestFieldsValue
        include JSON::Serializable

        def initialize
        end
      end

      # Contains details about an agent.

      struct Agent
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the agent.

        @[JSON::Field(key: "agentArn")]
        getter agent_arn : String

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The name of the agent.

        @[JSON::Field(key: "agentName")]
        getter agent_name : String

        # The Amazon Resource Name (ARN) of the IAM role with permissions to invoke API operations on the
        # agent.

        @[JSON::Field(key: "agentResourceRoleArn")]
        getter agent_resource_role_arn : String

        # The status of the agent and whether it is ready for use. The following statuses are possible:
        # CREATING – The agent is being created. PREPARING – The agent is being prepared. PREPARED – The agent
        # is prepared and ready to be invoked. NOT_PREPARED – The agent has been created but not yet prepared.
        # FAILED – The agent API operation failed. UPDATING – The agent is being updated. DELETING – The agent
        # is being deleted.

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String

        # The version of the agent.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The time at which the agent was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The number of seconds for which Amazon Bedrock keeps information about a user's conversation with
        # the agent. A user interaction remains active for the amount of time specified. If no conversation
        # occurs during this time, the session expires and Amazon Bedrock deletes any data provided before the
        # timeout.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32

        # The time at which the agent was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The agent's collaboration settings.

        @[JSON::Field(key: "agentCollaboration")]
        getter agent_collaboration : String?

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Contains custom orchestration configurations for the agent.

        @[JSON::Field(key: "customOrchestration")]
        getter custom_orchestration : Types::CustomOrchestration?

        # The Amazon Resource Name (ARN) of the KMS key that encrypts the agent.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The description of the agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains reasons that the agent-related API that you invoked failed.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The foundation model used for orchestration by the agent.

        @[JSON::Field(key: "foundationModel")]
        getter foundation_model : String?

        # Details about the guardrail associated with the agent.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # Instructions that tell the agent what it should do and how it should interact with users.

        @[JSON::Field(key: "instruction")]
        getter instruction : String?

        # Contains memory configuration for the agent.

        @[JSON::Field(key: "memoryConfiguration")]
        getter memory_configuration : Types::MemoryConfiguration?

        # Specifies the orchestration strategy for the agent.

        @[JSON::Field(key: "orchestrationType")]
        getter orchestration_type : String?

        # The time at which the agent was last prepared.

        @[JSON::Field(key: "preparedAt")]
        getter prepared_at : Time?

        # Contains configurations to override prompt templates in different parts of an agent sequence. For
        # more information, see Advanced prompts .

        @[JSON::Field(key: "promptOverrideConfiguration")]
        getter prompt_override_configuration : Types::PromptOverrideConfiguration?

        # Contains recommended actions to take for the agent-related API that you invoked to succeed.

        @[JSON::Field(key: "recommendedActions")]
        getter recommended_actions : Array(String)?

        def initialize(
          @agent_arn : String,
          @agent_id : String,
          @agent_name : String,
          @agent_resource_role_arn : String,
          @agent_status : String,
          @agent_version : String,
          @created_at : Time,
          @idle_session_ttl_in_seconds : Int32,
          @updated_at : Time,
          @agent_collaboration : String? = nil,
          @client_token : String? = nil,
          @custom_orchestration : Types::CustomOrchestration? = nil,
          @customer_encryption_key_arn : String? = nil,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @foundation_model : String? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @instruction : String? = nil,
          @memory_configuration : Types::MemoryConfiguration? = nil,
          @orchestration_type : String? = nil,
          @prepared_at : Time? = nil,
          @prompt_override_configuration : Types::PromptOverrideConfiguration? = nil,
          @recommended_actions : Array(String)? = nil
        )
        end
      end

      # Contains details about an action group.

      struct AgentActionGroup
        include JSON::Serializable

        # The unique identifier of the action group.

        @[JSON::Field(key: "actionGroupId")]
        getter action_group_id : String

        # The name of the action group.

        @[JSON::Field(key: "actionGroupName")]
        getter action_group_name : String

        # Specifies whether the action group is available for the agent to invoke or not when sending an
        # InvokeAgent request.

        @[JSON::Field(key: "actionGroupState")]
        getter action_group_state : String

        # The unique identifier of the agent to which the action group belongs.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent to which the action group belongs.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The time at which the action group was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The time at which the action group was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

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

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the action group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Defines functions that each define parameters that the agent needs to invoke from the user. Each
        # function represents an action in an action group.

        @[JSON::Field(key: "functionSchema")]
        getter function_schema : Types::FunctionSchema?

        # The configuration settings for a computer use action. Computer use is a new Anthropic Claude model
        # capability (in beta) available with Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only. For more
        # information, see Configure an Amazon Bedrock Agent to complete tasks with computer use tools .

        @[JSON::Field(key: "parentActionGroupSignatureParams")]
        getter parent_action_group_signature_params : Hash(String, String)?

        # If this field is set as AMAZON.UserInput , the agent can request the user for additional information
        # when trying to complete a task. The description , apiSchema , and actionGroupExecutor fields must be
        # blank for this action group. During orchestration, if the agent determines that it needs to invoke
        # an API in an action group, but doesn't have enough information to complete the API request, it will
        # invoke this action group instead and return an Observation reprompting the user for more
        # information.

        @[JSON::Field(key: "parentActionSignature")]
        getter parent_action_signature : String?

        def initialize(
          @action_group_id : String,
          @action_group_name : String,
          @action_group_state : String,
          @agent_id : String,
          @agent_version : String,
          @created_at : Time,
          @updated_at : Time,
          @action_group_executor : Types::ActionGroupExecutor? = nil,
          @api_schema : Types::APISchema? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @function_schema : Types::FunctionSchema? = nil,
          @parent_action_group_signature_params : Hash(String, String)? = nil,
          @parent_action_signature : String? = nil
        )
        end
      end

      # Contains details about an alias of an agent.

      struct AgentAlias
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the alias of the agent.

        @[JSON::Field(key: "agentAliasArn")]
        getter agent_alias_arn : String

        # The unique identifier of the alias of the agent.

        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String

        # The name of the alias of the agent.

        @[JSON::Field(key: "agentAliasName")]
        getter agent_alias_name : String

        # The status of the alias of the agent and whether it is ready for use. The following statuses are
        # possible: CREATING – The agent alias is being created. PREPARED – The agent alias is finished being
        # created or updated and is ready to be invoked. FAILED – The agent alias API operation failed.
        # UPDATING – The agent alias is being updated. DELETING – The agent alias is being deleted.
        # DISSOCIATED - The agent alias has no version associated with it.

        @[JSON::Field(key: "agentAliasStatus")]
        getter agent_alias_status : String

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The time at which the alias of the agent was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Contains details about the routing configuration of the alias.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)

        # The time at which the alias was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Contains details about the history of the alias.

        @[JSON::Field(key: "agentAliasHistoryEvents")]
        getter agent_alias_history_events : Array(Types::AgentAliasHistoryEvent)?

        # The invocation state for the agent alias. If the agent alias is running, the value is
        # ACCEPT_INVOCATIONS . If the agent alias is paused, the value is REJECT_INVOCATIONS . Use the
        # UpdateAgentAlias operation to change the invocation state.

        @[JSON::Field(key: "aliasInvocationState")]
        getter alias_invocation_state : String?

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the alias of the agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Information on the failure of Provisioned Throughput assigned to an agent alias.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        def initialize(
          @agent_alias_arn : String,
          @agent_alias_id : String,
          @agent_alias_name : String,
          @agent_alias_status : String,
          @agent_id : String,
          @created_at : Time,
          @routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem),
          @updated_at : Time,
          @agent_alias_history_events : Array(Types::AgentAliasHistoryEvent)? = nil,
          @alias_invocation_state : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil
        )
        end
      end

      # Contains details about the history of the alias.

      struct AgentAliasHistoryEvent
        include JSON::Serializable

        # The date that the alias stopped being associated to the version in the routingConfiguration object

        @[JSON::Field(key: "endDate")]
        getter end_date : Time?

        # Contains details about the version of the agent with which the alias is associated.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)?

        # The date that the alias began being associated to the version in the routingConfiguration object.

        @[JSON::Field(key: "startDate")]
        getter start_date : Time?

        def initialize(
          @end_date : Time? = nil,
          @routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)? = nil,
          @start_date : Time? = nil
        )
        end
      end

      # Contains details about the routing configuration of the alias.

      struct AgentAliasRoutingConfigurationListItem
        include JSON::Serializable

        # The version of the agent with which the alias is associated.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String?

        # Information on the Provisioned Throughput assigned to an agent alias.

        @[JSON::Field(key: "provisionedThroughput")]
        getter provisioned_throughput : String?

        def initialize(
          @agent_version : String? = nil,
          @provisioned_throughput : String? = nil
        )
        end
      end

      # Contains details about an alias of an agent.

      struct AgentAliasSummary
        include JSON::Serializable

        # Contains details about

        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String

        # The name of the alias.

        @[JSON::Field(key: "agentAliasName")]
        getter agent_alias_name : String

        # The status of the alias.

        @[JSON::Field(key: "agentAliasStatus")]
        getter agent_alias_status : String

        # The time at which the alias of the agent was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The time at which the alias was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The invocation state for the agent alias. If the agent alias is running, the value is
        # ACCEPT_INVOCATIONS . If the agent alias is paused, the value is REJECT_INVOCATIONS . Use the
        # UpdateAgentAlias operation to change the invocation state.

        @[JSON::Field(key: "aliasInvocationState")]
        getter alias_invocation_state : String?

        # The description of the alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains details about the version of the agent with which the alias is associated.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)?

        def initialize(
          @agent_alias_id : String,
          @agent_alias_name : String,
          @agent_alias_status : String,
          @created_at : Time,
          @updated_at : Time,
          @alias_invocation_state : String? = nil,
          @description : String? = nil,
          @routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)? = nil
        )
        end
      end

      # An agent collaborator.

      struct AgentCollaborator
        include JSON::Serializable

        # The collaborator's agent descriptor.

        @[JSON::Field(key: "agentDescriptor")]
        getter agent_descriptor : Types::AgentDescriptor

        # The collaborator's agent ID.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The collaborator's agent version.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The collaborator's instructions.

        @[JSON::Field(key: "collaborationInstruction")]
        getter collaboration_instruction : String

        # The collaborator's collaborator ID.

        @[JSON::Field(key: "collaboratorId")]
        getter collaborator_id : String

        # The collaborator's collaborator name.

        @[JSON::Field(key: "collaboratorName")]
        getter collaborator_name : String

        # When the collaborator was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # When the collaborator was updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The collaborator's client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The collaborator's relay conversation history.

        @[JSON::Field(key: "relayConversationHistory")]
        getter relay_conversation_history : String?

        def initialize(
          @agent_descriptor : Types::AgentDescriptor,
          @agent_id : String,
          @agent_version : String,
          @collaboration_instruction : String,
          @collaborator_id : String,
          @collaborator_name : String,
          @created_at : Time,
          @last_updated_at : Time,
          @client_token : String? = nil,
          @relay_conversation_history : String? = nil
        )
        end
      end

      # An agent collaborator summary.

      struct AgentCollaboratorSummary
        include JSON::Serializable

        # The collaborator's agent descriptor.

        @[JSON::Field(key: "agentDescriptor")]
        getter agent_descriptor : Types::AgentDescriptor

        # The collaborator's agent ID.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The collaborator's agent version.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The collaborator's collaboration instruction.

        @[JSON::Field(key: "collaborationInstruction")]
        getter collaboration_instruction : String

        # The collaborator's ID.

        @[JSON::Field(key: "collaboratorId")]
        getter collaborator_id : String

        # The collaborator's name.

        @[JSON::Field(key: "collaboratorName")]
        getter collaborator_name : String

        # When the collaborator was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # When the collaborator was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The collaborator's relay conversation history.

        @[JSON::Field(key: "relayConversationHistory")]
        getter relay_conversation_history : String

        def initialize(
          @agent_descriptor : Types::AgentDescriptor,
          @agent_id : String,
          @agent_version : String,
          @collaboration_instruction : String,
          @collaborator_id : String,
          @collaborator_name : String,
          @created_at : Time,
          @last_updated_at : Time,
          @relay_conversation_history : String
        )
        end
      end

      # An agent descriptor.

      struct AgentDescriptor
        include JSON::Serializable

        # The agent's alias ARN.

        @[JSON::Field(key: "aliasArn")]
        getter alias_arn : String?

        def initialize(
          @alias_arn : String? = nil
        )
        end
      end

      # Defines an agent node in your flow. You specify the agent to invoke at this point in the flow. For
      # more information, see Node types in a flow in the Amazon Bedrock User Guide.

      struct AgentFlowNodeConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the alias of the agent to invoke.

        @[JSON::Field(key: "agentAliasArn")]
        getter agent_alias_arn : String

        def initialize(
          @agent_alias_arn : String
        )
        end
      end

      # Contains details about a knowledge base that is associated with an agent.

      struct AgentKnowledgeBase
        include JSON::Serializable

        # The unique identifier of the agent with which the knowledge base is associated.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent with which the knowledge base is associated.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The time at which the association between the agent and the knowledge base was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The description of the association between the agent and the knowledge base.

        @[JSON::Field(key: "description")]
        getter description : String

        # The unique identifier of the association between the agent and the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Specifies whether to use the knowledge base or not when sending an InvokeAgent request.

        @[JSON::Field(key: "knowledgeBaseState")]
        getter knowledge_base_state : String

        # The time at which the association between the agent and the knowledge base was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @agent_id : String,
          @agent_version : String,
          @created_at : Time,
          @description : String,
          @knowledge_base_id : String,
          @knowledge_base_state : String,
          @updated_at : Time
        )
        end
      end

      # Contains details about a knowledge base associated with an agent.

      struct AgentKnowledgeBaseSummary
        include JSON::Serializable

        # The unique identifier of the knowledge base associated with an agent.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Specifies whether the agent uses the knowledge base or not when sending an InvokeAgent request.

        @[JSON::Field(key: "knowledgeBaseState")]
        getter knowledge_base_state : String

        # The time at which the knowledge base associated with an agent was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the knowledge base associated with an agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @knowledge_base_id : String,
          @knowledge_base_state : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      # Contains details about an agent.

      struct AgentSummary
        include JSON::Serializable

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The name of the agent.

        @[JSON::Field(key: "agentName")]
        getter agent_name : String

        # The status of the agent.

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String

        # The time at which the agent was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Details about the guardrail associated with the agent.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # The latest version of the agent.

        @[JSON::Field(key: "latestAgentVersion")]
        getter latest_agent_version : String?

        def initialize(
          @agent_id : String,
          @agent_name : String,
          @agent_status : String,
          @updated_at : Time,
          @description : String? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @latest_agent_version : String? = nil
        )
        end
      end

      # Contains details about a version of an agent.

      struct AgentVersion
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the agent that the version belongs to.

        @[JSON::Field(key: "agentArn")]
        getter agent_arn : String

        # The unique identifier of the agent that the version belongs to.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The name of the agent that the version belongs to.

        @[JSON::Field(key: "agentName")]
        getter agent_name : String

        # The Amazon Resource Name (ARN) of the IAM role with permissions to invoke API operations on the
        # agent.

        @[JSON::Field(key: "agentResourceRoleArn")]
        getter agent_resource_role_arn : String

        # The status of the agent that the version belongs to.

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String

        # The time at which the version was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The number of seconds for which Amazon Bedrock keeps information about a user's conversation with
        # the agent. A user interaction remains active for the amount of time specified. If no conversation
        # occurs during this time, the session expires and Amazon Bedrock deletes any data provided before the
        # timeout.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32

        # The time at which the version was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version number.

        @[JSON::Field(key: "version")]
        getter version : String

        # The agent's collaboration settings.

        @[JSON::Field(key: "agentCollaboration")]
        getter agent_collaboration : String?

        # The Amazon Resource Name (ARN) of the KMS key that encrypts the agent.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The description of the version.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of reasons that the API operation on the version failed.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # The foundation model that the version invokes.

        @[JSON::Field(key: "foundationModel")]
        getter foundation_model : String?

        # Details about the guardrail associated with the agent.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # The instructions provided to the agent.

        @[JSON::Field(key: "instruction")]
        getter instruction : String?

        # Contains details of the memory configuration on the version of the agent.

        @[JSON::Field(key: "memoryConfiguration")]
        getter memory_configuration : Types::MemoryConfiguration?

        # Contains configurations to override prompt templates in different parts of an agent sequence. For
        # more information, see Advanced prompts .

        @[JSON::Field(key: "promptOverrideConfiguration")]
        getter prompt_override_configuration : Types::PromptOverrideConfiguration?

        # A list of recommended actions to take for the failed API operation on the version to succeed.

        @[JSON::Field(key: "recommendedActions")]
        getter recommended_actions : Array(String)?

        def initialize(
          @agent_arn : String,
          @agent_id : String,
          @agent_name : String,
          @agent_resource_role_arn : String,
          @agent_status : String,
          @created_at : Time,
          @idle_session_ttl_in_seconds : Int32,
          @updated_at : Time,
          @version : String,
          @agent_collaboration : String? = nil,
          @customer_encryption_key_arn : String? = nil,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @foundation_model : String? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @instruction : String? = nil,
          @memory_configuration : Types::MemoryConfiguration? = nil,
          @prompt_override_configuration : Types::PromptOverrideConfiguration? = nil,
          @recommended_actions : Array(String)? = nil
        )
        end
      end

      # Contains details about a version of an agent.

      struct AgentVersionSummary
        include JSON::Serializable

        # The name of the agent to which the version belongs.

        @[JSON::Field(key: "agentName")]
        getter agent_name : String

        # The status of the agent to which the version belongs.

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String

        # The version of the agent.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The time at which the version was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The time at which the version was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the version of the agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Details about the guardrail associated with the agent.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        def initialize(
          @agent_name : String,
          @agent_status : String,
          @agent_version : String,
          @created_at : Time,
          @updated_at : Time,
          @description : String? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil
        )
        end
      end

      # Defines tools, at least one of which must be requested by the model. No text is generated but the
      # results of tool use are sent back to the model to help generate a response. For more information,
      # see Use a tool to complete an Amazon Bedrock model response .

      struct AnyToolChoice
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateAgentCollaboratorRequest
        include JSON::Serializable

        # The alias of the collaborator agent.

        @[JSON::Field(key: "agentDescriptor")]
        getter agent_descriptor : Types::AgentDescriptor

        # The agent's ID.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # An agent version.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # Instruction for the collaborator.

        @[JSON::Field(key: "collaborationInstruction")]
        getter collaboration_instruction : String

        # A name for the collaborator.

        @[JSON::Field(key: "collaboratorName")]
        getter collaborator_name : String

        # A client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A relay conversation history for the collaborator.

        @[JSON::Field(key: "relayConversationHistory")]
        getter relay_conversation_history : String?

        def initialize(
          @agent_descriptor : Types::AgentDescriptor,
          @agent_id : String,
          @agent_version : String,
          @collaboration_instruction : String,
          @collaborator_name : String,
          @client_token : String? = nil,
          @relay_conversation_history : String? = nil
        )
        end
      end


      struct AssociateAgentCollaboratorResponse
        include JSON::Serializable

        # Details about the collaborator.

        @[JSON::Field(key: "agentCollaborator")]
        getter agent_collaborator : Types::AgentCollaborator

        def initialize(
          @agent_collaborator : Types::AgentCollaborator
        )
        end
      end


      struct AssociateAgentKnowledgeBaseRequest
        include JSON::Serializable

        # The unique identifier of the agent with which you want to associate the knowledge base.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent with which you want to associate the knowledge base.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # A description of what the agent should use the knowledge base for.

        @[JSON::Field(key: "description")]
        getter description : String

        # The unique identifier of the knowledge base to associate with the agent.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Specifies whether to use the knowledge base or not when sending an InvokeAgent request.

        @[JSON::Field(key: "knowledgeBaseState")]
        getter knowledge_base_state : String?

        def initialize(
          @agent_id : String,
          @agent_version : String,
          @description : String,
          @knowledge_base_id : String,
          @knowledge_base_state : String? = nil
        )
        end
      end


      struct AssociateAgentKnowledgeBaseResponse
        include JSON::Serializable

        # Contains details about the knowledge base that has been associated with the agent.

        @[JSON::Field(key: "agentKnowledgeBase")]
        getter agent_knowledge_base : Types::AgentKnowledgeBase

        def initialize(
          @agent_knowledge_base : Types::AgentKnowledgeBase
        )
        end
      end

      # Configuration settings for processing audio content in multimodal knowledge bases.

      struct AudioConfiguration
        include JSON::Serializable

        # Configuration for segmenting audio content during processing.

        @[JSON::Field(key: "segmentationConfiguration")]
        getter segmentation_configuration : Types::AudioSegmentationConfiguration

        def initialize(
          @segmentation_configuration : Types::AudioSegmentationConfiguration
        )
        end
      end

      # Configuration for segmenting audio content during multimodal knowledge base ingestion. Determines
      # how audio files are divided into chunks for processing.

      struct AudioSegmentationConfiguration
        include JSON::Serializable

        # The duration in seconds for each audio segment. Audio files will be divided into chunks of this
        # length for processing.

        @[JSON::Field(key: "fixedLengthDuration")]
        getter fixed_length_duration : Int32

        def initialize(
          @fixed_length_duration : Int32
        )
        end
      end

      # Defines tools. The model automatically decides whether to call a tool or to generate text instead.
      # For more information, see Use a tool to complete an Amazon Bedrock model response .

      struct AutoToolChoice
        include JSON::Serializable

        def initialize
        end
      end

      # Contains configurations for using Amazon Bedrock Data Automation as the parser for ingesting your
      # data sources.

      struct BedrockDataAutomationConfiguration
        include JSON::Serializable

        # Specifies whether to enable parsing of multimodal data, including both text and/or images.

        @[JSON::Field(key: "parsingModality")]
        getter parsing_modality : String?

        def initialize(
          @parsing_modality : String? = nil
        )
        end
      end

      # The vector configuration details for the Bedrock embeddings model.

      struct BedrockEmbeddingModelConfiguration
        include JSON::Serializable

        # Configuration settings for processing audio content in multimodal knowledge bases.

        @[JSON::Field(key: "audio")]
        getter audio : Array(Types::AudioConfiguration)?

        # The dimensions details for the vector configuration used on the Bedrock embeddings model.

        @[JSON::Field(key: "dimensions")]
        getter dimensions : Int32?

        # The data type for the vectors when using a model to convert text into vector embeddings. The model
        # must support the specified data type for vector embeddings. Floating-point (float32) is the default
        # data type, and is supported by most models for vector embeddings. See Supported embeddings models
        # for information on the available models and their vector data types.

        @[JSON::Field(key: "embeddingDataType")]
        getter embedding_data_type : String?

        # Configuration settings for processing video content in multimodal knowledge bases.

        @[JSON::Field(key: "video")]
        getter video : Array(Types::VideoConfiguration)?

        def initialize(
          @audio : Array(Types::AudioConfiguration)? = nil,
          @dimensions : Int32? = nil,
          @embedding_data_type : String? = nil,
          @video : Array(Types::VideoConfiguration)? = nil
        )
        end
      end

      # Settings for a foundation model used to parse documents for a data source.

      struct BedrockFoundationModelConfiguration
        include JSON::Serializable

        # The ARN of the foundation model to use for parsing.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # Specifies whether to enable parsing of multimodal data, including both text and/or images.

        @[JSON::Field(key: "parsingModality")]
        getter parsing_modality : String?

        # Instructions for interpreting the contents of a document.

        @[JSON::Field(key: "parsingPrompt")]
        getter parsing_prompt : Types::ParsingPrompt?

        def initialize(
          @model_arn : String,
          @parsing_modality : String? = nil,
          @parsing_prompt : Types::ParsingPrompt? = nil
        )
        end
      end

      # Context enrichment configuration is used to provide additional context to the RAG application using
      # Amazon Bedrock foundation models.

      struct BedrockFoundationModelContextEnrichmentConfiguration
        include JSON::Serializable

        # The enrichment stategy used to provide additional context. For example, Neptune GraphRAG uses Amazon
        # Bedrock foundation models to perform chunk entity extraction.

        @[JSON::Field(key: "enrichmentStrategyConfiguration")]
        getter enrichment_strategy_configuration : Types::EnrichmentStrategyConfiguration

        # The Amazon Resource Name (ARN) of the model used to create vector embeddings for the knowledge base.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        def initialize(
          @enrichment_strategy_configuration : Types::EnrichmentStrategyConfiguration,
          @model_arn : String
        )
        end
      end

      # Contains information about content defined inline in bytes.

      struct ByteContentDoc
        include JSON::Serializable

        # The base64-encoded string of the content.

        @[JSON::Field(key: "data")]
        getter data : Bytes

        # The MIME type of the content. For a list of MIME types, see Media Types . The following MIME types
        # are supported: text/plain text/html text/csv text/vtt message/rfc822 application/xhtml+xml
        # application/pdf application/msword application/vnd.ms-word.document.macroenabled.12
        # application/vnd.ms-word.template.macroenabled.12 application/vnd.ms-excel
        # application/vnd.ms-excel.addin.macroenabled.12 application/vnd.ms-excel.sheet.macroenabled.12
        # application/vnd.ms-excel.template.macroenabled.12
        # application/vnd.ms-excel.sheet.binary.macroenabled.12 application/vnd.ms-spreadsheetml
        # application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
        # application/vnd.openxmlformats-officedocument.spreadsheetml.template
        # application/vnd.openxmlformats-officedocument.wordprocessingml.document
        # application/vnd.openxmlformats-officedocument.wordprocessingml.template

        @[JSON::Field(key: "mimeType")]
        getter mime_type : String

        def initialize(
          @data : Bytes,
          @mime_type : String
        )
        end
      end

      # Indicates where a cache checkpoint is located. All information before this checkpoint is cached to
      # be accessed on subsequent requests.

      struct CachePointBlock
        include JSON::Serializable

        # Indicates that the CachePointBlock is of the default type

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # Contains configurations to use a prompt in a conversational format. For more information, see Create
      # a prompt using Prompt management .

      struct ChatPromptTemplateConfiguration
        include JSON::Serializable

        # Contains messages in the chat for the prompt.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)

        # An array of the variables in the prompt template.

        @[JSON::Field(key: "inputVariables")]
        getter input_variables : Array(Types::PromptInputVariable)?

        # Contains system prompts to provide context to the model or to describe how it should behave.

        @[JSON::Field(key: "system")]
        getter system : Array(Types::SystemContentBlock)?

        # Configuration information for the tools that the model can use when generating a response.

        @[JSON::Field(key: "toolConfiguration")]
        getter tool_configuration : Types::ToolConfiguration?

        def initialize(
          @messages : Array(Types::Message),
          @input_variables : Array(Types::PromptInputVariable)? = nil,
          @system : Array(Types::SystemContentBlock)? = nil,
          @tool_configuration : Types::ToolConfiguration? = nil
        )
        end
      end

      # Details about how to chunk the documents in the data source. A chunk refers to an excerpt from a
      # data source that is returned when the knowledge base that it belongs to is queried.

      struct ChunkingConfiguration
        include JSON::Serializable

        # Knowledge base can split your source data into chunks. A chunk refers to an excerpt from a data
        # source that is returned when the knowledge base that it belongs to is queried. You have the
        # following options for chunking your data. If you opt for NONE , then you may want to pre-process
        # your files by splitting them up such that each file corresponds to a chunk. FIXED_SIZE – Amazon
        # Bedrock splits your source data into chunks of the approximate size that you set in the
        # fixedSizeChunkingConfiguration . HIERARCHICAL – Split documents into layers of chunks where the
        # first layer contains large chunks, and the second layer contains smaller chunks derived from the
        # first layer. SEMANTIC – Split documents into chunks based on groups of similar content derived with
        # natural language processing. NONE – Amazon Bedrock treats each file as one chunk. If you choose this
        # option, you may want to pre-process your documents by splitting them into separate files.

        @[JSON::Field(key: "chunkingStrategy")]
        getter chunking_strategy : String

        # Configurations for when you choose fixed-size chunking. If you set the chunkingStrategy as NONE ,
        # exclude this field.

        @[JSON::Field(key: "fixedSizeChunkingConfiguration")]
        getter fixed_size_chunking_configuration : Types::FixedSizeChunkingConfiguration?

        # Settings for hierarchical document chunking for a data source. Hierarchical chunking splits
        # documents into layers of chunks where the first layer contains large chunks, and the second layer
        # contains smaller chunks derived from the first layer.

        @[JSON::Field(key: "hierarchicalChunkingConfiguration")]
        getter hierarchical_chunking_configuration : Types::HierarchicalChunkingConfiguration?

        # Settings for semantic document chunking for a data source. Semantic chunking splits a document into
        # into smaller documents based on groups of similar content derived from the text with natural
        # language processing.

        @[JSON::Field(key: "semanticChunkingConfiguration")]
        getter semantic_chunking_configuration : Types::SemanticChunkingConfiguration?

        def initialize(
          @chunking_strategy : String,
          @fixed_size_chunking_configuration : Types::FixedSizeChunkingConfiguration? = nil,
          @hierarchical_chunking_configuration : Types::HierarchicalChunkingConfiguration? = nil,
          @semantic_chunking_configuration : Types::SemanticChunkingConfiguration? = nil
        )
        end
      end

      # Defines a collector node in your flow. This node takes an iteration of inputs and consolidates them
      # into an array in the output. For more information, see Node types in a flow in the Amazon Bedrock
      # User Guide.

      struct CollectorFlowNodeConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # Defines a condition node in your flow. You can specify conditions that determine which node comes
      # next in the flow. For more information, see Node types in a flow in the Amazon Bedrock User Guide.

      struct ConditionFlowNodeConfiguration
        include JSON::Serializable

        # An array of conditions. Each member contains the name of a condition and an expression that defines
        # the condition.

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::FlowCondition)

        def initialize(
          @conditions : Array(Types::FlowCondition)
        )
        end
      end

      # There was a conflict performing an operation.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration of the Confluence content. For example, configuring specific types of Confluence
      # content.

      struct ConfluenceCrawlerConfiguration
        include JSON::Serializable

        # The configuration of filtering the Confluence content. For example, configuring regular expression
        # patterns to include or exclude certain content.

        @[JSON::Field(key: "filterConfiguration")]
        getter filter_configuration : Types::CrawlFilterConfiguration?

        def initialize(
          @filter_configuration : Types::CrawlFilterConfiguration? = nil
        )
        end
      end

      # The configuration information to connect to Confluence as your data source.

      struct ConfluenceDataSourceConfiguration
        include JSON::Serializable

        # The endpoint information to connect to your Confluence data source.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::ConfluenceSourceConfiguration

        # The configuration of the Confluence content. For example, configuring specific types of Confluence
        # content.

        @[JSON::Field(key: "crawlerConfiguration")]
        getter crawler_configuration : Types::ConfluenceCrawlerConfiguration?

        def initialize(
          @source_configuration : Types::ConfluenceSourceConfiguration,
          @crawler_configuration : Types::ConfluenceCrawlerConfiguration? = nil
        )
        end
      end

      # The endpoint information to connect to your Confluence data source.

      struct ConfluenceSourceConfiguration
        include JSON::Serializable

        # The supported authentication type to authenticate and connect to your Confluence instance.

        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # The Amazon Resource Name of an Secrets Manager secret that stores your authentication credentials
        # for your Confluence instance URL. For more information on the key-value pairs that must be included
        # in your secret, depending on your authentication type, see Confluence connection configuration .

        @[JSON::Field(key: "credentialsSecretArn")]
        getter credentials_secret_arn : String

        # The supported host type, whether online/cloud or server/on-premises.

        @[JSON::Field(key: "hostType")]
        getter host_type : String

        # The Confluence host URL or instance URL.

        @[JSON::Field(key: "hostUrl")]
        getter host_url : String

        def initialize(
          @auth_type : String,
          @credentials_secret_arn : String,
          @host_type : String,
          @host_url : String
        )
        end
      end

      # Contains the content for the message you pass to, or receive from a model. For more information, see
      # Create a prompt using Prompt management .

      struct ContentBlock
        include JSON::Serializable

        # Creates a cache checkpoint within a message.

        @[JSON::Field(key: "cachePoint")]
        getter cache_point : Types::CachePointBlock?

        # The text in the message.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @cache_point : Types::CachePointBlock? = nil,
          @text : String? = nil
        )
        end
      end

      # Context enrichment configuration is used to provide additional context to the RAG application.

      struct ContextEnrichmentConfiguration
        include JSON::Serializable

        # The method used for context enrichment. It must be Amazon Bedrock foundation models.

        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration of the Amazon Bedrock foundation model used for context enrichment.

        @[JSON::Field(key: "bedrockFoundationModelConfiguration")]
        getter bedrock_foundation_model_configuration : Types::BedrockFoundationModelContextEnrichmentConfiguration?

        def initialize(
          @type : String,
          @bedrock_foundation_model_configuration : Types::BedrockFoundationModelContextEnrichmentConfiguration? = nil
        )
        end
      end

      # The configuration of filtering the data source content. For example, configuring regular expression
      # patterns to include or exclude certain content.

      struct CrawlFilterConfiguration
        include JSON::Serializable

        # The type of filtering that you want to apply to certain objects or content of the data source. For
        # example, the PATTERN type is regular expression patterns you can apply to filter your content.

        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration of filtering certain objects or content types of the data source.

        @[JSON::Field(key: "patternObjectFilter")]
        getter pattern_object_filter : Types::PatternObjectFilterConfiguration?

        def initialize(
          @type : String,
          @pattern_object_filter : Types::PatternObjectFilterConfiguration? = nil
        )
        end
      end


      struct CreateAgentActionGroupRequest
        include JSON::Serializable

        # The name to give the action group.

        @[JSON::Field(key: "actionGroupName")]
        getter action_group_name : String

        # The unique identifier of the agent for which to create the action group.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent for which to create the action group.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The Amazon Resource Name (ARN) of the Lambda function containing the business logic that is carried
        # out upon invoking the action or the custom control method for handling the information elicited from
        # the user.

        @[JSON::Field(key: "actionGroupExecutor")]
        getter action_group_executor : Types::ActionGroupExecutor?

        # Specifies whether the action group is available for the agent to invoke or not when sending an
        # InvokeAgent request.

        @[JSON::Field(key: "actionGroupState")]
        getter action_group_state : String?

        # Contains either details about the S3 object containing the OpenAPI schema for the action group or
        # the JSON or YAML-formatted payload defining the schema. For more information, see Action group
        # OpenAPI schemas .

        @[JSON::Field(key: "apiSchema")]
        getter api_schema : Types::APISchema?

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

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
        # capability (in beta) available with Anthropic Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only. For
        # more information, see Configure an Amazon Bedrock Agent to complete tasks with computer use tools .

        @[JSON::Field(key: "parentActionGroupSignatureParams")]
        getter parent_action_group_signature_params : Hash(String, String)?

        def initialize(
          @action_group_name : String,
          @agent_id : String,
          @agent_version : String,
          @action_group_executor : Types::ActionGroupExecutor? = nil,
          @action_group_state : String? = nil,
          @api_schema : Types::APISchema? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @function_schema : Types::FunctionSchema? = nil,
          @parent_action_group_signature : String? = nil,
          @parent_action_group_signature_params : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAgentActionGroupResponse
        include JSON::Serializable

        # Contains details about the action group that was created.

        @[JSON::Field(key: "agentActionGroup")]
        getter agent_action_group : Types::AgentActionGroup

        def initialize(
          @agent_action_group : Types::AgentActionGroup
        )
        end
      end


      struct CreateAgentAliasRequest
        include JSON::Serializable

        # The name of the alias.

        @[JSON::Field(key: "agentAliasName")]
        getter agent_alias_name : String

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the alias of the agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains details about the routing configuration of the alias.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)?

        # Any tags that you want to attach to the alias of the agent.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @agent_alias_name : String,
          @agent_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAgentAliasResponse
        include JSON::Serializable

        # Contains details about the alias that was created.

        @[JSON::Field(key: "agentAlias")]
        getter agent_alias : Types::AgentAlias

        def initialize(
          @agent_alias : Types::AgentAlias
        )
        end
      end


      struct CreateAgentRequest
        include JSON::Serializable

        # A name for the agent that you create.

        @[JSON::Field(key: "agentName")]
        getter agent_name : String

        # The agent's collaboration role.

        @[JSON::Field(key: "agentCollaboration")]
        getter agent_collaboration : String?

        # The Amazon Resource Name (ARN) of the IAM role with permissions to invoke API operations on the
        # agent.

        @[JSON::Field(key: "agentResourceRoleArn")]
        getter agent_resource_role_arn : String?

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Contains details of the custom orchestration configured for the agent.

        @[JSON::Field(key: "customOrchestration")]
        getter custom_orchestration : Types::CustomOrchestration?

        # The Amazon Resource Name (ARN) of the KMS key with which to encrypt the agent.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # A description of the agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier for the model that you want to be used for orchestration by the agent you create. The
        # modelId to provide depends on the type of model or throughput that you use: If you use a base model,
        # specify the model ID or its ARN. For a list of model IDs for base models, see Amazon Bedrock base
        # model IDs (on-demand throughput) in the Amazon Bedrock User Guide. If you use an inference profile,
        # specify the inference profile ID or its ARN. For a list of inference profile IDs, see Supported
        # Regions and models for cross-region inference in the Amazon Bedrock User Guide. If you use a
        # provisioned model, specify the ARN of the Provisioned Throughput. For more information, see Run
        # inference using a Provisioned Throughput in the Amazon Bedrock User Guide. If you use a custom
        # model, first purchase Provisioned Throughput for it. Then specify the ARN of the resulting
        # provisioned model. For more information, see Use a custom model in Amazon Bedrock in the Amazon
        # Bedrock User Guide. If you use an imported model , specify the ARN of the imported model. You can
        # get the model ARN from a successful call to CreateModelImportJob or from the Imported models page in
        # the Amazon Bedrock console.

        @[JSON::Field(key: "foundationModel")]
        getter foundation_model : String?

        # The unique Guardrail configuration assigned to the agent when it is created.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # The number of seconds for which Amazon Bedrock keeps information about a user's conversation with
        # the agent. A user interaction remains active for the amount of time specified. If no conversation
        # occurs during this time, the session expires and Amazon Bedrock deletes any data provided before the
        # timeout.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # Instructions that tell the agent what it should do and how it should interact with users.

        @[JSON::Field(key: "instruction")]
        getter instruction : String?

        # Contains the details of the memory configured for the agent.

        @[JSON::Field(key: "memoryConfiguration")]
        getter memory_configuration : Types::MemoryConfiguration?

        # Specifies the type of orchestration strategy for the agent. This is set to DEFAULT orchestration
        # type, by default.

        @[JSON::Field(key: "orchestrationType")]
        getter orchestration_type : String?

        # Contains configurations to override prompts in different parts of an agent sequence. For more
        # information, see Advanced prompts .

        @[JSON::Field(key: "promptOverrideConfiguration")]
        getter prompt_override_configuration : Types::PromptOverrideConfiguration?

        # Any tags that you want to attach to the agent.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @agent_name : String,
          @agent_collaboration : String? = nil,
          @agent_resource_role_arn : String? = nil,
          @client_token : String? = nil,
          @custom_orchestration : Types::CustomOrchestration? = nil,
          @customer_encryption_key_arn : String? = nil,
          @description : String? = nil,
          @foundation_model : String? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @instruction : String? = nil,
          @memory_configuration : Types::MemoryConfiguration? = nil,
          @orchestration_type : String? = nil,
          @prompt_override_configuration : Types::PromptOverrideConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAgentResponse
        include JSON::Serializable

        # Contains details about the agent created.

        @[JSON::Field(key: "agent")]
        getter agent : Types::Agent

        def initialize(
          @agent : Types::Agent
        )
        end
      end


      struct CreateDataSourceRequest
        include JSON::Serializable

        # The connection configuration for the data source.

        @[JSON::Field(key: "dataSourceConfiguration")]
        getter data_source_configuration : Types::DataSourceConfiguration

        # The unique identifier of the knowledge base to which to add the data source.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The name of the data source.

        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The data deletion policy for the data source. You can set the data deletion policy to: DELETE:
        # Deletes all data from your data source that’s converted into vector embeddings upon deletion of a
        # knowledge base or data source resource. Note that the vector store itself is not deleted , only the
        # data. This flag is ignored if an Amazon Web Services account is deleted. RETAIN: Retains all data
        # from your data source that’s converted into vector embeddings upon deletion of a knowledge base or
        # data source resource. Note that the vector store itself is not deleted if you delete a knowledge
        # base or data source resource.

        @[JSON::Field(key: "dataDeletionPolicy")]
        getter data_deletion_policy : String?

        # A description of the data source.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains details about the server-side encryption for the data source.

        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # Contains details about how to ingest the documents in the data source.

        @[JSON::Field(key: "vectorIngestionConfiguration")]
        getter vector_ingestion_configuration : Types::VectorIngestionConfiguration?

        def initialize(
          @data_source_configuration : Types::DataSourceConfiguration,
          @knowledge_base_id : String,
          @name : String,
          @client_token : String? = nil,
          @data_deletion_policy : String? = nil,
          @description : String? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @vector_ingestion_configuration : Types::VectorIngestionConfiguration? = nil
        )
        end
      end


      struct CreateDataSourceResponse
        include JSON::Serializable

        # Contains details about the data source.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource

        def initialize(
          @data_source : Types::DataSource
        )
        end
      end


      struct CreateFlowAliasRequest
        include JSON::Serializable

        # The unique identifier of the flow for which to create an alias.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # A name for the alias.

        @[JSON::Field(key: "name")]
        getter name : String

        # Contains information about the version to which to map the alias.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem)

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration that specifies how nodes in the flow are executed in parallel.

        @[JSON::Field(key: "concurrencyConfiguration")]
        getter concurrency_configuration : Types::FlowAliasConcurrencyConfiguration?

        # A description for the alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Any tags that you want to attach to the alias of the flow. For more information, see Tagging
        # resources in Amazon Bedrock .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @flow_identifier : String,
          @name : String,
          @routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem),
          @client_token : String? = nil,
          @concurrency_configuration : Types::FlowAliasConcurrencyConfiguration? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateFlowAliasResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the alias.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the alias was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the flow that the alias belongs to.

        @[JSON::Field(key: "flowId")]
        getter flow_id : String

        # The unique identifier of the alias.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the alias.

        @[JSON::Field(key: "name")]
        getter name : String

        # Contains information about the version that the alias is mapped to.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem)

        # The time at which the alias of the flow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The configuration that specifies how nodes in the flow are executed in parallel.

        @[JSON::Field(key: "concurrencyConfiguration")]
        getter concurrency_configuration : Types::FlowAliasConcurrencyConfiguration?

        # The description of the alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @flow_id : String,
          @id : String,
          @name : String,
          @routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem),
          @updated_at : Time,
          @concurrency_configuration : Types::FlowAliasConcurrencyConfiguration? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateFlowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service role with permissions to create and manage a flow. For
        # more information, see Create a service role for flows in Amazon Bedrock in the Amazon Bedrock User
        # Guide.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # A name for the flow.

        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the KMS key to encrypt the flow.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # A definition of the nodes and connections between nodes in the flow.

        @[JSON::Field(key: "definition")]
        getter definition : Types::FlowDefinition?

        # A description for the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Any tags that you want to attach to the flow. For more information, see Tagging resources in Amazon
        # Bedrock .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @execution_role_arn : String,
          @name : String,
          @client_token : String? = nil,
          @customer_encryption_key_arn : String? = nil,
          @definition : Types::FlowDefinition? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateFlowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the service role with permissions to create a flow. For more
        # information, see Create a service role for flows in Amazon Bedrock in the Amazon Bedrock User Guide.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the flow.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the flow. When you submit this request, the status will be NotPrepared . If creation
        # fails, the status becomes Failed .

        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the flow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the flow. When you create a flow, the version created is the DRAFT version.

        @[JSON::Field(key: "version")]
        getter version : String

        # The Amazon Resource Name (ARN) of the KMS key that you encrypted the flow with.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # A definition of the nodes and connections between nodes in the flow.

        @[JSON::Field(key: "definition")]
        getter definition : Types::FlowDefinition?

        # The description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @execution_role_arn : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @version : String,
          @customer_encryption_key_arn : String? = nil,
          @definition : Types::FlowDefinition? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateFlowVersionRequest
        include JSON::Serializable

        # The unique identifier of the flow that you want to create a version of.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the version of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @flow_identifier : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateFlowVersionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the service role with permissions to create a flow. For more
        # information, see Create a service role for flows in Amazon Bedrock in the Amazon Bedrock User Guide.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the version.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the flow.

        @[JSON::Field(key: "status")]
        getter status : String

        # The version of the flow that was created. Versions are numbered incrementally, starting from 1.

        @[JSON::Field(key: "version")]
        getter version : String

        # The KMS key that the flow is encrypted with.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # A definition of the nodes and connections in the flow.

        @[JSON::Field(key: "definition")]
        getter definition : Types::FlowDefinition?

        # The description of the version.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @execution_role_arn : String,
          @id : String,
          @name : String,
          @status : String,
          @version : String,
          @customer_encryption_key_arn : String? = nil,
          @definition : Types::FlowDefinition? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateKnowledgeBaseRequest
        include JSON::Serializable

        # Contains details about the embeddings model used for the knowledge base.

        @[JSON::Field(key: "knowledgeBaseConfiguration")]
        getter knowledge_base_configuration : Types::KnowledgeBaseConfiguration

        # A name for the knowledge base.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the IAM role with permissions to invoke API operations on the
        # knowledge base.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the knowledge base.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains details about the configuration of the vector database used for the knowledge base.

        @[JSON::Field(key: "storageConfiguration")]
        getter storage_configuration : Types::StorageConfiguration?

        # Specify the key-value pairs for the tags that you want to attach to your knowledge base in this
        # object.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @knowledge_base_configuration : Types::KnowledgeBaseConfiguration,
          @name : String,
          @role_arn : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @storage_configuration : Types::StorageConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateKnowledgeBaseResponse
        include JSON::Serializable

        # Contains details about the knowledge base.

        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBase

        def initialize(
          @knowledge_base : Types::KnowledgeBase
        )
        end
      end


      struct CreatePromptRequest
        include JSON::Serializable

        # A name for the prompt.

        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the KMS key to encrypt the prompt.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The name of the default variant for the prompt. This value must match the name field in the relevant
        # PromptVariant object.

        @[JSON::Field(key: "defaultVariant")]
        getter default_variant : String?

        # A description for the prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Any tags that you want to attach to the prompt. For more information, see Tagging resources in
        # Amazon Bedrock .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A list of objects, each containing details about a variant of the prompt.

        @[JSON::Field(key: "variants")]
        getter variants : Array(Types::PromptVariant)?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @customer_encryption_key_arn : String? = nil,
          @default_variant : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil,
          @variants : Array(Types::PromptVariant)? = nil
        )
        end
      end


      struct CreatePromptResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the prompt.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the prompt was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the prompt.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the prompt.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time at which the prompt was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the prompt. When you create a prompt, the version created is the DRAFT version.

        @[JSON::Field(key: "version")]
        getter version : String

        # The Amazon Resource Name (ARN) of the KMS key that you encrypted the prompt with.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The name of the default variant for your prompt.

        @[JSON::Field(key: "defaultVariant")]
        getter default_variant : String?

        # The description of the prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of objects, each containing details about a variant of the prompt.

        @[JSON::Field(key: "variants")]
        getter variants : Array(Types::PromptVariant)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @updated_at : Time,
          @version : String,
          @customer_encryption_key_arn : String? = nil,
          @default_variant : String? = nil,
          @description : String? = nil,
          @variants : Array(Types::PromptVariant)? = nil
        )
        end
      end


      struct CreatePromptVersionRequest
        include JSON::Serializable

        # The unique identifier of the prompt that you want to create a version of.

        @[JSON::Field(key: "promptIdentifier")]
        getter prompt_identifier : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the version of the prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Any tags that you want to attach to the version of the prompt. For more information, see Tagging
        # resources in Amazon Bedrock .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @prompt_identifier : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePromptVersionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the version of the prompt.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the prompt was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the prompt.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the prompt.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time at which the prompt was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the prompt that was created. Versions are numbered incrementally, starting from 1.

        @[JSON::Field(key: "version")]
        getter version : String

        # The Amazon Resource Name (ARN) of the KMS key to encrypt the version of the prompt.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The name of the default variant for the prompt. This value must match the name field in the relevant
        # PromptVariant object.

        @[JSON::Field(key: "defaultVariant")]
        getter default_variant : String?

        # A description for the version.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of objects, each containing details about a variant of the prompt.

        @[JSON::Field(key: "variants")]
        getter variants : Array(Types::PromptVariant)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @updated_at : Time,
          @version : String,
          @customer_encryption_key_arn : String? = nil,
          @default_variant : String? = nil,
          @description : String? = nil,
          @variants : Array(Types::PromptVariant)? = nil
        )
        end
      end

      # Contains configurations for a query, each of which defines information about example queries to help
      # the query engine generate appropriate SQL queries.

      struct CuratedQuery
        include JSON::Serializable

        # An example natural language query.

        @[JSON::Field(key: "naturalLanguage")]
        getter natural_language : String

        # The SQL equivalent of the natural language query.

        @[JSON::Field(key: "sql")]
        getter sql : String

        def initialize(
          @natural_language : String,
          @sql : String
        )
        end
      end

      # Contains information about the content to ingest into a knowledge base connected to a custom data
      # source. Choose a sourceType and include the field that corresponds to it.

      struct CustomContent
        include JSON::Serializable

        # A unique identifier for the document.

        @[JSON::Field(key: "customDocumentIdentifier")]
        getter custom_document_identifier : Types::CustomDocumentIdentifier

        # The source of the data to ingest.

        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # Contains information about content defined inline to ingest into a knowledge base.

        @[JSON::Field(key: "inlineContent")]
        getter inline_content : Types::InlineContent?

        # Contains information about the Amazon S3 location of the file from which to ingest data.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::CustomS3Location?

        def initialize(
          @custom_document_identifier : Types::CustomDocumentIdentifier,
          @source_type : String,
          @inline_content : Types::InlineContent? = nil,
          @s3_location : Types::CustomS3Location? = nil
        )
        end
      end

      # Contains information about the identifier of the document to ingest into a custom data source.

      struct CustomDocumentIdentifier
        include JSON::Serializable

        # The identifier of the document to ingest into a custom data source.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Details of custom orchestration.

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

      # Contains information about the Amazon S3 location of the file containing the content to ingest into
      # a knowledge base connected to a custom data source.

      struct CustomS3Location
        include JSON::Serializable

        # The S3 URI of the file containing the content to ingest.

        @[JSON::Field(key: "uri")]
        getter uri : String

        # The identifier of the Amazon Web Services account that owns the S3 bucket containing the content to
        # ingest.

        @[JSON::Field(key: "bucketOwnerAccountId")]
        getter bucket_owner_account_id : String?

        def initialize(
          @uri : String,
          @bucket_owner_account_id : String? = nil
        )
        end
      end

      # Settings for customizing steps in the data source content ingestion pipeline. You can configure the
      # data source to process documents with a Lambda function after they are parsed and converted into
      # chunks. When you add a post-chunking transformation, the service stores chunked documents in an S3
      # bucket and invokes a Lambda function to process them. To process chunked documents with a Lambda
      # function, define an S3 bucket path for input and output objects, and a transformation that specifies
      # the Lambda function to invoke. You can use the Lambda function to customize how chunks are split,
      # and the metadata for each chunk.

      struct CustomTransformationConfiguration
        include JSON::Serializable

        # An S3 bucket path for input and output objects.

        @[JSON::Field(key: "intermediateStorage")]
        getter intermediate_storage : Types::IntermediateStorage

        # A Lambda function that processes documents.

        @[JSON::Field(key: "transformations")]
        getter transformations : Array(Types::Transformation)

        def initialize(
          @intermediate_storage : Types::IntermediateStorage,
          @transformations : Array(Types::Transformation)
        )
        end
      end

      # Details about a cyclic connection detected in the flow.

      struct CyclicConnectionFlowValidationDetails
        include JSON::Serializable

        # The name of the connection that causes the cycle in the flow.

        @[JSON::Field(key: "connection")]
        getter connection : String

        def initialize(
          @connection : String
        )
        end
      end

      # Contains details about a data source.

      struct DataSource
        include JSON::Serializable

        # The time at which the data source was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The connection configuration for the data source.

        @[JSON::Field(key: "dataSourceConfiguration")]
        getter data_source_configuration : Types::DataSourceConfiguration

        # The unique identifier of the data source.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the knowledge base to which the data source belongs.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The name of the data source.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the data source. The following statuses are possible: Available – The data source has
        # been created and is ready for ingestion into the knowledge base. Deleting – The data source is being
        # deleted.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the data source was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The data deletion policy for the data source.

        @[JSON::Field(key: "dataDeletionPolicy")]
        getter data_deletion_policy : String?

        # The description of the data source.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The detailed reasons on the failure to delete a data source.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # Contains details about the configuration of the server-side encryption.

        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # Contains details about how to ingest the documents in the data source.

        @[JSON::Field(key: "vectorIngestionConfiguration")]
        getter vector_ingestion_configuration : Types::VectorIngestionConfiguration?

        def initialize(
          @created_at : Time,
          @data_source_configuration : Types::DataSourceConfiguration,
          @data_source_id : String,
          @knowledge_base_id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @data_deletion_policy : String? = nil,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @vector_ingestion_configuration : Types::VectorIngestionConfiguration? = nil
        )
        end
      end

      # The connection configuration for the data source.

      struct DataSourceConfiguration
        include JSON::Serializable

        # The type of data source.

        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration information to connect to Confluence as your data source. Confluence data source
        # connector is in preview release and is subject to change.

        @[JSON::Field(key: "confluenceConfiguration")]
        getter confluence_configuration : Types::ConfluenceDataSourceConfiguration?

        # The configuration information to connect to Amazon S3 as your data source.

        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::S3DataSourceConfiguration?

        # The configuration information to connect to Salesforce as your data source. Salesforce data source
        # connector is in preview release and is subject to change.

        @[JSON::Field(key: "salesforceConfiguration")]
        getter salesforce_configuration : Types::SalesforceDataSourceConfiguration?

        # The configuration information to connect to SharePoint as your data source. SharePoint data source
        # connector is in preview release and is subject to change.

        @[JSON::Field(key: "sharePointConfiguration")]
        getter share_point_configuration : Types::SharePointDataSourceConfiguration?

        # The configuration of web URLs to crawl for your data source. You should be authorized to crawl the
        # URLs. Crawling web URLs as your data source is in preview release and is subject to change.

        @[JSON::Field(key: "webConfiguration")]
        getter web_configuration : Types::WebDataSourceConfiguration?

        def initialize(
          @type : String,
          @confluence_configuration : Types::ConfluenceDataSourceConfiguration? = nil,
          @s3_configuration : Types::S3DataSourceConfiguration? = nil,
          @salesforce_configuration : Types::SalesforceDataSourceConfiguration? = nil,
          @share_point_configuration : Types::SharePointDataSourceConfiguration? = nil,
          @web_configuration : Types::WebDataSourceConfiguration? = nil
        )
        end
      end

      # Contains details about a data source.

      struct DataSourceSummary
        include JSON::Serializable

        # The unique identifier of the data source.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the knowledge base to which the data source belongs.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The name of the data source.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the data source.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the data source was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the data source.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @data_source_id : String,
          @knowledge_base_id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end


      struct DeleteAgentActionGroupRequest
        include JSON::Serializable

        # The unique identifier of the action group to delete.

        @[JSON::Field(key: "actionGroupId")]
        getter action_group_id : String

        # The unique identifier of the agent that the action group belongs to.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent that the action group belongs to.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # By default, this value is false and deletion is stopped if the resource is in use. If you set it to
        # true , the resource will be deleted even if the resource is in use.

        @[JSON::Field(key: "skipResourceInUseCheck")]
        getter skip_resource_in_use_check : Bool?

        def initialize(
          @action_group_id : String,
          @agent_id : String,
          @agent_version : String,
          @skip_resource_in_use_check : Bool? = nil
        )
        end
      end


      struct DeleteAgentActionGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAgentAliasRequest
        include JSON::Serializable

        # The unique identifier of the alias to delete.

        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String

        # The unique identifier of the agent that the alias belongs to.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        def initialize(
          @agent_alias_id : String,
          @agent_id : String
        )
        end
      end


      struct DeleteAgentAliasResponse
        include JSON::Serializable

        # The unique identifier of the alias that was deleted.

        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String

        # The status of the alias.

        @[JSON::Field(key: "agentAliasStatus")]
        getter agent_alias_status : String

        # The unique identifier of the agent that the alias belongs to.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        def initialize(
          @agent_alias_id : String,
          @agent_alias_status : String,
          @agent_id : String
        )
        end
      end


      struct DeleteAgentRequest
        include JSON::Serializable

        # The unique identifier of the agent to delete.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # By default, this value is false and deletion is stopped if the resource is in use. If you set it to
        # true , the resource will be deleted even if the resource is in use.

        @[JSON::Field(key: "skipResourceInUseCheck")]
        getter skip_resource_in_use_check : Bool?

        def initialize(
          @agent_id : String,
          @skip_resource_in_use_check : Bool? = nil
        )
        end
      end


      struct DeleteAgentResponse
        include JSON::Serializable

        # The unique identifier of the agent that was deleted.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The status of the agent.

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String

        def initialize(
          @agent_id : String,
          @agent_status : String
        )
        end
      end


      struct DeleteAgentVersionRequest
        include JSON::Serializable

        # The unique identifier of the agent that the version belongs to.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent to delete.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # By default, this value is false and deletion is stopped if the resource is in use. If you set it to
        # true , the resource will be deleted even if the resource is in use.

        @[JSON::Field(key: "skipResourceInUseCheck")]
        getter skip_resource_in_use_check : Bool?

        def initialize(
          @agent_id : String,
          @agent_version : String,
          @skip_resource_in_use_check : Bool? = nil
        )
        end
      end


      struct DeleteAgentVersionResponse
        include JSON::Serializable

        # The unique identifier of the agent that the version belongs to.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The status of the agent version.

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String

        # The version that was deleted.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        def initialize(
          @agent_id : String,
          @agent_status : String,
          @agent_version : String
        )
        end
      end


      struct DeleteDataSourceRequest
        include JSON::Serializable

        # The unique identifier of the data source to delete.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the knowledge base from which to delete the data source.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @data_source_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct DeleteDataSourceResponse
        include JSON::Serializable

        # The unique identifier of the data source that was deleted.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the knowledge base to which the data source that was deleted belonged.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The status of the data source.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @data_source_id : String,
          @knowledge_base_id : String,
          @status : String
        )
        end
      end


      struct DeleteFlowAliasRequest
        include JSON::Serializable

        # The unique identifier of the alias to be deleted.

        @[JSON::Field(key: "aliasIdentifier")]
        getter alias_identifier : String

        # The unique identifier of the flow that the alias belongs to.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        def initialize(
          @alias_identifier : String,
          @flow_identifier : String
        )
        end
      end


      struct DeleteFlowAliasResponse
        include JSON::Serializable

        # The unique identifier of the flow that the alias belongs to.

        @[JSON::Field(key: "flowId")]
        getter flow_id : String

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @flow_id : String,
          @id : String
        )
        end
      end


      struct DeleteFlowRequest
        include JSON::Serializable

        # The unique identifier of the flow.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # By default, this value is false and deletion is stopped if the resource is in use. If you set it to
        # true , the resource will be deleted even if the resource is in use.

        @[JSON::Field(key: "skipResourceInUseCheck")]
        getter skip_resource_in_use_check : Bool?

        def initialize(
          @flow_identifier : String,
          @skip_resource_in_use_check : Bool? = nil
        )
        end
      end


      struct DeleteFlowResponse
        include JSON::Serializable

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteFlowVersionRequest
        include JSON::Serializable

        # The unique identifier of the flow whose version that you want to delete

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # The version of the flow that you want to delete.

        @[JSON::Field(key: "flowVersion")]
        getter flow_version : String

        # By default, this value is false and deletion is stopped if the resource is in use. If you set it to
        # true , the resource will be deleted even if the resource is in use.

        @[JSON::Field(key: "skipResourceInUseCheck")]
        getter skip_resource_in_use_check : Bool?

        def initialize(
          @flow_identifier : String,
          @flow_version : String,
          @skip_resource_in_use_check : Bool? = nil
        )
        end
      end


      struct DeleteFlowVersionResponse
        include JSON::Serializable

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The version of the flow being deleted.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @id : String,
          @version : String
        )
        end
      end


      struct DeleteKnowledgeBaseDocumentsRequest
        include JSON::Serializable

        # The unique identifier of the data source that contains the documents.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # A list of objects, each of which contains information to identify a document to delete.

        @[JSON::Field(key: "documentIdentifiers")]
        getter document_identifiers : Array(Types::DocumentIdentifier)

        # The unique identifier of the knowledge base that is connected to the data source.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @data_source_id : String,
          @document_identifiers : Array(Types::DocumentIdentifier),
          @knowledge_base_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteKnowledgeBaseDocumentsResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about the documents that were deleted.

        @[JSON::Field(key: "documentDetails")]
        getter document_details : Array(Types::KnowledgeBaseDocumentDetail)?

        def initialize(
          @document_details : Array(Types::KnowledgeBaseDocumentDetail)? = nil
        )
        end
      end


      struct DeleteKnowledgeBaseRequest
        include JSON::Serializable

        # The unique identifier of the knowledge base to delete.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @knowledge_base_id : String
        )
        end
      end


      struct DeleteKnowledgeBaseResponse
        include JSON::Serializable

        # The unique identifier of the knowledge base that was deleted.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The status of the knowledge base and whether it has been successfully deleted.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @knowledge_base_id : String,
          @status : String
        )
        end
      end


      struct DeletePromptRequest
        include JSON::Serializable

        # The unique identifier of the prompt.

        @[JSON::Field(key: "promptIdentifier")]
        getter prompt_identifier : String

        # The version of the prompt to delete. To delete the prompt, omit this field.

        @[JSON::Field(key: "promptVersion")]
        getter prompt_version : String?

        def initialize(
          @prompt_identifier : String,
          @prompt_version : String? = nil
        )
        end
      end


      struct DeletePromptResponse
        include JSON::Serializable

        # The unique identifier of the prompt that was deleted.

        @[JSON::Field(key: "id")]
        getter id : String

        # The version of the prompt that was deleted.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @id : String,
          @version : String? = nil
        )
        end
      end


      struct DisassociateAgentCollaboratorRequest
        include JSON::Serializable

        # An agent ID.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The agent's version.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The collaborator's ID.

        @[JSON::Field(key: "collaboratorId")]
        getter collaborator_id : String

        def initialize(
          @agent_id : String,
          @agent_version : String,
          @collaborator_id : String
        )
        end
      end


      struct DisassociateAgentCollaboratorResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateAgentKnowledgeBaseRequest
        include JSON::Serializable

        # The unique identifier of the agent from which to disassociate the knowledge base.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent from which to disassociate the knowledge base.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The unique identifier of the knowledge base to disassociate.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @agent_id : String,
          @agent_version : String,
          @knowledge_base_id : String
        )
        end
      end


      struct DisassociateAgentKnowledgeBaseResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the content of a document. Choose a dataSourceType and include the field
      # that corresponds to it.

      struct DocumentContent
        include JSON::Serializable

        # The type of data source that is connected to the knowledge base to which to ingest this document.

        @[JSON::Field(key: "dataSourceType")]
        getter data_source_type : String

        # Contains information about the content to ingest into a knowledge base connected to a custom data
        # source.

        @[JSON::Field(key: "custom")]
        getter custom : Types::CustomContent?

        # Contains information about the content to ingest into a knowledge base connected to an Amazon S3
        # data source

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Content?

        def initialize(
          @data_source_type : String,
          @custom : Types::CustomContent? = nil,
          @s3 : Types::S3Content? = nil
        )
        end
      end

      # Contains information that identifies the document.

      struct DocumentIdentifier
        include JSON::Serializable

        # The type of data source connected to the knowledge base that contains the document.

        @[JSON::Field(key: "dataSourceType")]
        getter data_source_type : String

        # Contains information that identifies the document in a custom data source.

        @[JSON::Field(key: "custom")]
        getter custom : Types::CustomDocumentIdentifier?

        # Contains information that identifies the document in an S3 data source.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Location?

        def initialize(
          @data_source_type : String,
          @custom : Types::CustomDocumentIdentifier? = nil,
          @s3 : Types::S3Location? = nil
        )
        end
      end

      # Contains information about the metadata associate with the content to ingest into a knowledge base.
      # Choose a type and include the field that corresponds to it.

      struct DocumentMetadata
        include JSON::Serializable

        # The type of the source source from which to add metadata.

        @[JSON::Field(key: "type")]
        getter type : String

        # An array of objects, each of which defines a metadata attribute to associate with the content to
        # ingest. You define the attributes inline.

        @[JSON::Field(key: "inlineAttributes")]
        getter inline_attributes : Array(Types::MetadataAttribute)?

        # The Amazon S3 location of the file containing metadata to associate with the content to ingest.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::CustomS3Location?

        def initialize(
          @type : String,
          @inline_attributes : Array(Types::MetadataAttribute)? = nil,
          @s3_location : Types::CustomS3Location? = nil
        )
        end
      end

      # Details about duplicate condition expressions found in a condition node.

      struct DuplicateConditionExpressionFlowValidationDetails
        include JSON::Serializable

        # The duplicated condition expression.

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The name of the node containing the duplicate condition expressions.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @expression : String,
          @node : String
        )
        end
      end

      # Details about duplicate connections found between two nodes in the flow.

      struct DuplicateConnectionsFlowValidationDetails
        include JSON::Serializable

        # The name of the source node where the duplicate connection starts.

        @[JSON::Field(key: "source")]
        getter source : String

        # The name of the target node where the duplicate connection ends.

        @[JSON::Field(key: "target")]
        getter target : String

        def initialize(
          @source : String,
          @target : String
        )
        end
      end

      # The configuration details for the embeddings model.

      struct EmbeddingModelConfiguration
        include JSON::Serializable

        # The vector configuration details on the Bedrock embeddings model.

        @[JSON::Field(key: "bedrockEmbeddingModelConfiguration")]
        getter bedrock_embedding_model_configuration : Types::BedrockEmbeddingModelConfiguration?

        def initialize(
          @bedrock_embedding_model_configuration : Types::BedrockEmbeddingModelConfiguration? = nil
        )
        end
      end

      # The strategy used for performing context enrichment.

      struct EnrichmentStrategyConfiguration
        include JSON::Serializable

        # The method used for the context enrichment strategy.

        @[JSON::Field(key: "method")]
        getter method : String

        def initialize(
          @method : String
        )
        end
      end

      # Specifies a metadata field to include or exclude during the reranking process.

      struct FieldForReranking
        include JSON::Serializable

        # The name of the metadata field to include or exclude during reranking.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        def initialize(
          @field_name : String
        )
        end
      end

      # Configurations for when you choose fixed-size chunking. If you set the chunkingStrategy as NONE ,
      # exclude this field.

      struct FixedSizeChunkingConfiguration
        include JSON::Serializable

        # The maximum number of tokens to include in a chunk.

        @[JSON::Field(key: "maxTokens")]
        getter max_tokens : Int32

        # The percentage of overlap between adjacent chunks of a data source.

        @[JSON::Field(key: "overlapPercentage")]
        getter overlap_percentage : Int32

        def initialize(
          @max_tokens : Int32,
          @overlap_percentage : Int32
        )
        end
      end

      # Determines how multiple nodes in a flow can run in parallel. Running nodes concurrently can improve
      # your flow's performance.

      struct FlowAliasConcurrencyConfiguration
        include JSON::Serializable

        # The type of concurrency to use for parallel node execution. Specify one of the following options:
        # Automatic - Amazon Bedrock determines which nodes can be executed in parallel based on the flow
        # definition and its dependencies. Manual - You specify which nodes can be executed in parallel.

        @[JSON::Field(key: "type")]
        getter type : String

        # The maximum number of nodes that can be executed concurrently in the flow.

        @[JSON::Field(key: "maxConcurrency")]
        getter max_concurrency : Int32?

        def initialize(
          @type : String,
          @max_concurrency : Int32? = nil
        )
        end
      end

      # Contains information about a version that the alias maps to.

      struct FlowAliasRoutingConfigurationListItem
        include JSON::Serializable

        # The version that the alias maps to.

        @[JSON::Field(key: "flowVersion")]
        getter flow_version : String?

        def initialize(
          @flow_version : String? = nil
        )
        end
      end

      # Contains information about an alias of a flow. This data type is used in the following API
      # operations: ListFlowAliases response

      struct FlowAliasSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the alias.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the alias was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the flow.

        @[JSON::Field(key: "flowId")]
        getter flow_id : String

        # The unique identifier of the alias of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the alias.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of configurations about the versions that the alias maps to. Currently, you can only specify
        # one.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem)

        # The time at which the alias was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The configuration that specifies how nodes in the flow are executed concurrently.

        @[JSON::Field(key: "concurrencyConfiguration")]
        getter concurrency_configuration : Types::FlowAliasConcurrencyConfiguration?

        # A description of the alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @flow_id : String,
          @id : String,
          @name : String,
          @routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem),
          @updated_at : Time,
          @concurrency_configuration : Types::FlowAliasConcurrencyConfiguration? = nil,
          @description : String? = nil
        )
        end
      end

      # Defines a condition in the condition node.

      struct FlowCondition
        include JSON::Serializable

        # A name for the condition that you can reference.

        @[JSON::Field(key: "name")]
        getter name : String

        # Defines the condition. You must refer to at least one of the inputs in the condition. For more
        # information, expand the Condition node section in Node types in prompt flows .

        @[JSON::Field(key: "expression")]
        getter expression : String?

        def initialize(
          @name : String,
          @expression : String? = nil
        )
        end
      end

      # The configuration of a connection between a condition node and another node.

      struct FlowConditionalConnectionConfiguration
        include JSON::Serializable

        # The condition that triggers this connection. For more information about how to write conditions, see
        # the Condition node type in the Node types topic in the Amazon Bedrock User Guide.

        @[JSON::Field(key: "condition")]
        getter condition : String

        def initialize(
          @condition : String
        )
        end
      end

      # Contains information about a connection between two nodes in the flow.

      struct FlowConnection
        include JSON::Serializable

        # A name for the connection that you can reference.

        @[JSON::Field(key: "name")]
        getter name : String

        # The node that the connection starts at.

        @[JSON::Field(key: "source")]
        getter source : String

        # The node that the connection ends at.

        @[JSON::Field(key: "target")]
        getter target : String

        # Whether the source node that the connection begins from is a condition node ( Conditional ) or not (
        # Data ).

        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration of the connection.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::FlowConnectionConfiguration?

        def initialize(
          @name : String,
          @source : String,
          @target : String,
          @type : String,
          @configuration : Types::FlowConnectionConfiguration? = nil
        )
        end
      end

      # The configuration of the connection.

      struct FlowConnectionConfiguration
        include JSON::Serializable

        # The configuration of a connection originating from a Condition node.

        @[JSON::Field(key: "conditional")]
        getter conditional : Types::FlowConditionalConnectionConfiguration?

        # The configuration of a connection originating from a node that isn't a Condition node.

        @[JSON::Field(key: "data")]
        getter data : Types::FlowDataConnectionConfiguration?

        def initialize(
          @conditional : Types::FlowConditionalConnectionConfiguration? = nil,
          @data : Types::FlowDataConnectionConfiguration? = nil
        )
        end
      end

      # The configuration of a connection originating from a node that isn't a Condition node.

      struct FlowDataConnectionConfiguration
        include JSON::Serializable

        # The name of the output in the source node that the connection begins from.

        @[JSON::Field(key: "sourceOutput")]
        getter source_output : String

        # The name of the input in the target node that the connection ends at.

        @[JSON::Field(key: "targetInput")]
        getter target_input : String

        def initialize(
          @source_output : String,
          @target_input : String
        )
        end
      end

      # The definition of the nodes and connections between nodes in the flow.

      struct FlowDefinition
        include JSON::Serializable

        # An array of connection definitions in the flow.

        @[JSON::Field(key: "connections")]
        getter connections : Array(Types::FlowConnection)?

        # An array of node definitions in the flow.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(Types::FlowNode)?

        def initialize(
          @connections : Array(Types::FlowConnection)? = nil,
          @nodes : Array(Types::FlowNode)? = nil
        )
        end
      end

      # Contains configurations about a node in the flow.

      struct FlowNode
        include JSON::Serializable

        # A name for the node.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of node. This value must match the name of the key that you provide in the configuration
        # you provide in the FlowNodeConfiguration field.

        @[JSON::Field(key: "type")]
        getter type : String

        # Contains configurations for the node.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::FlowNodeConfiguration?

        # An array of objects, each of which contains information about an input into the node.

        @[JSON::Field(key: "inputs")]
        getter inputs : Array(Types::FlowNodeInput)?

        # A list of objects, each of which contains information about an output from the node.

        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::FlowNodeOutput)?

        def initialize(
          @name : String,
          @type : String,
          @configuration : Types::FlowNodeConfiguration? = nil,
          @inputs : Array(Types::FlowNodeInput)? = nil,
          @outputs : Array(Types::FlowNodeOutput)? = nil
        )
        end
      end

      # Contains configurations for a node in your flow. For more information, see Node types in a flow in
      # the Amazon Bedrock User Guide.

      struct FlowNodeConfiguration
        include JSON::Serializable

        # Contains configurations for an agent node in your flow. Invokes an alias of an agent and returns the
        # response.

        @[JSON::Field(key: "agent")]
        getter agent : Types::AgentFlowNodeConfiguration?

        # Contains configurations for a collector node in your flow. Collects an iteration of inputs and
        # consolidates them into an array of outputs.

        @[JSON::Field(key: "collector")]
        getter collector : Types::CollectorFlowNodeConfiguration?

        # Contains configurations for a condition node in your flow. Defines conditions that lead to different
        # branches of the flow.

        @[JSON::Field(key: "condition")]
        getter condition : Types::ConditionFlowNodeConfiguration?

        # Contains configurations for an inline code node in your flow. Inline code nodes let you write and
        # execute code directly within your flow, enabling data transformations, custom logic, and
        # integrations without needing an external Lambda function.

        @[JSON::Field(key: "inlineCode")]
        getter inline_code : Types::InlineCodeFlowNodeConfiguration?

        # Contains configurations for an input flow node in your flow. The first node in the flow. inputs
        # can't be specified for this node.

        @[JSON::Field(key: "input")]
        getter input : Types::InputFlowNodeConfiguration?

        # Contains configurations for an iterator node in your flow. Takes an input that is an array and
        # iteratively sends each item of the array as an output to the following node. The size of the array
        # is also returned in the output. The output flow node at the end of the flow iteration will return a
        # response for each member of the array. To return only one response, you can include a collector node
        # downstream from the iterator node.

        @[JSON::Field(key: "iterator")]
        getter iterator : Types::IteratorFlowNodeConfiguration?

        # Contains configurations for a knowledge base node in your flow. Queries a knowledge base and returns
        # the retrieved results or generated response.

        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBaseFlowNodeConfiguration?

        # Contains configurations for a Lambda function node in your flow. Invokes an Lambda function.

        @[JSON::Field(key: "lambdaFunction")]
        getter lambda_function : Types::LambdaFunctionFlowNodeConfiguration?

        # Contains configurations for a Lex node in your flow. Invokes an Amazon Lex bot to identify the
        # intent of the input and return the intent as the output.

        @[JSON::Field(key: "lex")]
        getter lex : Types::LexFlowNodeConfiguration?

        # Contains configurations for a DoWhile loop in your flow.

        @[JSON::Field(key: "loop")]
        getter loop : Types::LoopFlowNodeConfiguration?

        # Contains controller node configurations for a DoWhile loop in your flow.

        @[JSON::Field(key: "loopController")]
        getter loop_controller : Types::LoopControllerFlowNodeConfiguration?

        # Contains input node configurations for a DoWhile loop in your flow.

        @[JSON::Field(key: "loopInput")]
        getter loop_input : Types::LoopInputFlowNodeConfiguration?

        # Contains configurations for an output flow node in your flow. The last node in the flow. outputs
        # can't be specified for this node.

        @[JSON::Field(key: "output")]
        getter output : Types::OutputFlowNodeConfiguration?

        # Contains configurations for a prompt node in your flow. Runs a prompt and generates the model
        # response as the output. You can use a prompt from Prompt management or you can configure one in this
        # node.

        @[JSON::Field(key: "prompt")]
        getter prompt : Types::PromptFlowNodeConfiguration?

        # Contains configurations for a retrieval node in your flow. Retrieves data from an Amazon S3 location
        # and returns it as the output.

        @[JSON::Field(key: "retrieval")]
        getter retrieval : Types::RetrievalFlowNodeConfiguration?

        # Contains configurations for a storage node in your flow. Stores an input in an Amazon S3 location.

        @[JSON::Field(key: "storage")]
        getter storage : Types::StorageFlowNodeConfiguration?

        def initialize(
          @agent : Types::AgentFlowNodeConfiguration? = nil,
          @collector : Types::CollectorFlowNodeConfiguration? = nil,
          @condition : Types::ConditionFlowNodeConfiguration? = nil,
          @inline_code : Types::InlineCodeFlowNodeConfiguration? = nil,
          @input : Types::InputFlowNodeConfiguration? = nil,
          @iterator : Types::IteratorFlowNodeConfiguration? = nil,
          @knowledge_base : Types::KnowledgeBaseFlowNodeConfiguration? = nil,
          @lambda_function : Types::LambdaFunctionFlowNodeConfiguration? = nil,
          @lex : Types::LexFlowNodeConfiguration? = nil,
          @loop : Types::LoopFlowNodeConfiguration? = nil,
          @loop_controller : Types::LoopControllerFlowNodeConfiguration? = nil,
          @loop_input : Types::LoopInputFlowNodeConfiguration? = nil,
          @output : Types::OutputFlowNodeConfiguration? = nil,
          @prompt : Types::PromptFlowNodeConfiguration? = nil,
          @retrieval : Types::RetrievalFlowNodeConfiguration? = nil,
          @storage : Types::StorageFlowNodeConfiguration? = nil
        )
        end
      end

      # Contains configurations for an input in an Amazon Bedrock Flows node.

      struct FlowNodeInput
        include JSON::Serializable

        # An expression that formats the input for the node. For an explanation of how to create expressions,
        # see Expressions in Prompt flows in Amazon Bedrock .

        @[JSON::Field(key: "expression")]
        getter expression : String

        # Specifies a name for the input that you can reference.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the data type of the input. If the input doesn't match this type at runtime, a validation
        # error will be thrown.

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies how input data flows between iterations in a DoWhile loop. LoopCondition - Controls
        # whether the loop continues by evaluating condition expressions against the input data. Use this
        # category to define the condition that determines if the loop should continue. ReturnValueToLoopStart
        # - Defines data to pass back to the start of the loop's next iteration. Use this category for
        # variables that you want to update for each loop iteration. ExitLoop - Defines the value that's
        # available once the loop ends. Use this category to expose loop results to nodes outside the loop.

        @[JSON::Field(key: "category")]
        getter category : String?

        def initialize(
          @expression : String,
          @name : String,
          @type : String,
          @category : String? = nil
        )
        end
      end

      # Contains configurations for an output from a node.

      struct FlowNodeOutput
        include JSON::Serializable

        # A name for the output that you can reference.

        @[JSON::Field(key: "name")]
        getter name : String

        # The data type of the output. If the output doesn't match this type at runtime, a validation error
        # will be thrown.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # Contains the definition of a flow.

      struct FlowSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the flow.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the flow. The following statuses are possible: NotPrepared – The flow has been created
        # or updated, but hasn't been prepared. If you just created the flow, you can't test it. If you
        # updated the flow, the DRAFT version won't contain the latest changes for testing. Send a PrepareFlow
        # request to package the latest changes into the DRAFT version. Preparing – The flow is being prepared
        # so that the DRAFT version contains the latest changes for testing. Prepared – The flow is prepared
        # and the DRAFT version contains the latest changes for testing. Failed – The last API operation that
        # you invoked on the flow failed. Send a GetFlow request and check the error message in the
        # validations field.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the flow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The latest version of the flow.

        @[JSON::Field(key: "version")]
        getter version : String

        # A description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @version : String,
          @description : String? = nil
        )
        end
      end

      # Contains information about validation of the flow. This data type is used in the following API
      # operations: GetFlow response GetFlowVersion response

      struct FlowValidation
        include JSON::Serializable

        # A message describing the validation error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The severity of the issue described in the message.

        @[JSON::Field(key: "severity")]
        getter severity : String

        # Specific details about the validation issue encountered in the flow.

        @[JSON::Field(key: "details")]
        getter details : Types::FlowValidationDetails?

        # The type of validation issue encountered in the flow.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @message : String,
          @severity : String,
          @details : Types::FlowValidationDetails? = nil,
          @type : String? = nil
        )
        end
      end

      # A union type containing various possible validation issues in the flow.

      struct FlowValidationDetails
        include JSON::Serializable

        # Details about a cyclic connection in the flow.

        @[JSON::Field(key: "cyclicConnection")]
        getter cyclic_connection : Types::CyclicConnectionFlowValidationDetails?

        # Details about duplicate condition expressions in a node.

        @[JSON::Field(key: "duplicateConditionExpression")]
        getter duplicate_condition_expression : Types::DuplicateConditionExpressionFlowValidationDetails?

        # Details about duplicate connections between nodes.

        @[JSON::Field(key: "duplicateConnections")]
        getter duplicate_connections : Types::DuplicateConnectionsFlowValidationDetails?

        # Details about incompatible data types in a connection.

        @[JSON::Field(key: "incompatibleConnectionDataType")]
        getter incompatible_connection_data_type : Types::IncompatibleConnectionDataTypeFlowValidationDetails?

        # Details about a flow that includes connections that violate loop boundary rules.

        @[JSON::Field(key: "invalidLoopBoundary")]
        getter invalid_loop_boundary : Types::InvalidLoopBoundaryFlowValidationDetails?

        # Details about a flow that includes incompatible node types in a DoWhile loop.

        @[JSON::Field(key: "loopIncompatibleNodeType")]
        getter loop_incompatible_node_type : Types::LoopIncompatibleNodeTypeFlowValidationDetails?

        # Details about a malformed condition expression in a node.

        @[JSON::Field(key: "malformedConditionExpression")]
        getter malformed_condition_expression : Types::MalformedConditionExpressionFlowValidationDetails?

        # Details about a malformed input expression in a node.

        @[JSON::Field(key: "malformedNodeInputExpression")]
        getter malformed_node_input_expression : Types::MalformedNodeInputExpressionFlowValidationDetails?

        # Details about mismatched input data types in a node.

        @[JSON::Field(key: "mismatchedNodeInputType")]
        getter mismatched_node_input_type : Types::MismatchedNodeInputTypeFlowValidationDetails?

        # Details about mismatched output data types in a node.

        @[JSON::Field(key: "mismatchedNodeOutputType")]
        getter mismatched_node_output_type : Types::MismatchedNodeOutputTypeFlowValidationDetails?

        # Details about missing configuration for a connection.

        @[JSON::Field(key: "missingConnectionConfiguration")]
        getter missing_connection_configuration : Types::MissingConnectionConfigurationFlowValidationDetails?

        # Details about a missing default condition in a conditional node.

        @[JSON::Field(key: "missingDefaultCondition")]
        getter missing_default_condition : Types::MissingDefaultConditionFlowValidationDetails?

        # Details about missing ending nodes in the flow.

        @[JSON::Field(key: "missingEndingNodes")]
        getter missing_ending_nodes : Types::MissingEndingNodesFlowValidationDetails?

        # Details about a flow that's missing a required LoopController node in a DoWhile loop.

        @[JSON::Field(key: "missingLoopControllerNode")]
        getter missing_loop_controller_node : Types::MissingLoopControllerNodeFlowValidationDetails?

        # Details about a flow that's missing a required LoopInput node in a DoWhile loop.

        @[JSON::Field(key: "missingLoopInputNode")]
        getter missing_loop_input_node : Types::MissingLoopInputNodeFlowValidationDetails?

        # Details about missing configuration for a node.

        @[JSON::Field(key: "missingNodeConfiguration")]
        getter missing_node_configuration : Types::MissingNodeConfigurationFlowValidationDetails?

        # Details about a missing required input in a node.

        @[JSON::Field(key: "missingNodeInput")]
        getter missing_node_input : Types::MissingNodeInputFlowValidationDetails?

        # Details about a missing required output in a node.

        @[JSON::Field(key: "missingNodeOutput")]
        getter missing_node_output : Types::MissingNodeOutputFlowValidationDetails?

        # Details about missing starting nodes in the flow.

        @[JSON::Field(key: "missingStartingNodes")]
        getter missing_starting_nodes : Types::MissingStartingNodesFlowValidationDetails?

        # Details about a flow that contains multiple LoopController nodes in a DoWhile loop.

        @[JSON::Field(key: "multipleLoopControllerNodes")]
        getter multiple_loop_controller_nodes : Types::MultipleLoopControllerNodesFlowValidationDetails?

        # Details about a flow that contains multiple LoopInput nodes in a DoWhile loop.

        @[JSON::Field(key: "multipleLoopInputNodes")]
        getter multiple_loop_input_nodes : Types::MultipleLoopInputNodesFlowValidationDetails?

        # Details about multiple connections to a single node input.

        @[JSON::Field(key: "multipleNodeInputConnections")]
        getter multiple_node_input_connections : Types::MultipleNodeInputConnectionsFlowValidationDetails?

        # Details about an unfulfilled node input with no valid connections.

        @[JSON::Field(key: "unfulfilledNodeInput")]
        getter unfulfilled_node_input : Types::UnfulfilledNodeInputFlowValidationDetails?

        # Details about an unknown condition for a connection.

        @[JSON::Field(key: "unknownConnectionCondition")]
        getter unknown_connection_condition : Types::UnknownConnectionConditionFlowValidationDetails?

        # Details about an unknown source node for a connection.

        @[JSON::Field(key: "unknownConnectionSource")]
        getter unknown_connection_source : Types::UnknownConnectionSourceFlowValidationDetails?

        # Details about an unknown source output for a connection.

        @[JSON::Field(key: "unknownConnectionSourceOutput")]
        getter unknown_connection_source_output : Types::UnknownConnectionSourceOutputFlowValidationDetails?

        # Details about an unknown target node for a connection.

        @[JSON::Field(key: "unknownConnectionTarget")]
        getter unknown_connection_target : Types::UnknownConnectionTargetFlowValidationDetails?

        # Details about an unknown target input for a connection.

        @[JSON::Field(key: "unknownConnectionTargetInput")]
        getter unknown_connection_target_input : Types::UnknownConnectionTargetInputFlowValidationDetails?

        # Details about an unknown input for a node.

        @[JSON::Field(key: "unknownNodeInput")]
        getter unknown_node_input : Types::UnknownNodeInputFlowValidationDetails?

        # Details about an unknown output for a node.

        @[JSON::Field(key: "unknownNodeOutput")]
        getter unknown_node_output : Types::UnknownNodeOutputFlowValidationDetails?

        # Details about an unreachable node in the flow.

        @[JSON::Field(key: "unreachableNode")]
        getter unreachable_node : Types::UnreachableNodeFlowValidationDetails?

        # Details about unsatisfied conditions for a connection.

        @[JSON::Field(key: "unsatisfiedConnectionConditions")]
        getter unsatisfied_connection_conditions : Types::UnsatisfiedConnectionConditionsFlowValidationDetails?

        # Details about an unspecified validation.

        @[JSON::Field(key: "unspecified")]
        getter unspecified : Types::UnspecifiedFlowValidationDetails?

        def initialize(
          @cyclic_connection : Types::CyclicConnectionFlowValidationDetails? = nil,
          @duplicate_condition_expression : Types::DuplicateConditionExpressionFlowValidationDetails? = nil,
          @duplicate_connections : Types::DuplicateConnectionsFlowValidationDetails? = nil,
          @incompatible_connection_data_type : Types::IncompatibleConnectionDataTypeFlowValidationDetails? = nil,
          @invalid_loop_boundary : Types::InvalidLoopBoundaryFlowValidationDetails? = nil,
          @loop_incompatible_node_type : Types::LoopIncompatibleNodeTypeFlowValidationDetails? = nil,
          @malformed_condition_expression : Types::MalformedConditionExpressionFlowValidationDetails? = nil,
          @malformed_node_input_expression : Types::MalformedNodeInputExpressionFlowValidationDetails? = nil,
          @mismatched_node_input_type : Types::MismatchedNodeInputTypeFlowValidationDetails? = nil,
          @mismatched_node_output_type : Types::MismatchedNodeOutputTypeFlowValidationDetails? = nil,
          @missing_connection_configuration : Types::MissingConnectionConfigurationFlowValidationDetails? = nil,
          @missing_default_condition : Types::MissingDefaultConditionFlowValidationDetails? = nil,
          @missing_ending_nodes : Types::MissingEndingNodesFlowValidationDetails? = nil,
          @missing_loop_controller_node : Types::MissingLoopControllerNodeFlowValidationDetails? = nil,
          @missing_loop_input_node : Types::MissingLoopInputNodeFlowValidationDetails? = nil,
          @missing_node_configuration : Types::MissingNodeConfigurationFlowValidationDetails? = nil,
          @missing_node_input : Types::MissingNodeInputFlowValidationDetails? = nil,
          @missing_node_output : Types::MissingNodeOutputFlowValidationDetails? = nil,
          @missing_starting_nodes : Types::MissingStartingNodesFlowValidationDetails? = nil,
          @multiple_loop_controller_nodes : Types::MultipleLoopControllerNodesFlowValidationDetails? = nil,
          @multiple_loop_input_nodes : Types::MultipleLoopInputNodesFlowValidationDetails? = nil,
          @multiple_node_input_connections : Types::MultipleNodeInputConnectionsFlowValidationDetails? = nil,
          @unfulfilled_node_input : Types::UnfulfilledNodeInputFlowValidationDetails? = nil,
          @unknown_connection_condition : Types::UnknownConnectionConditionFlowValidationDetails? = nil,
          @unknown_connection_source : Types::UnknownConnectionSourceFlowValidationDetails? = nil,
          @unknown_connection_source_output : Types::UnknownConnectionSourceOutputFlowValidationDetails? = nil,
          @unknown_connection_target : Types::UnknownConnectionTargetFlowValidationDetails? = nil,
          @unknown_connection_target_input : Types::UnknownConnectionTargetInputFlowValidationDetails? = nil,
          @unknown_node_input : Types::UnknownNodeInputFlowValidationDetails? = nil,
          @unknown_node_output : Types::UnknownNodeOutputFlowValidationDetails? = nil,
          @unreachable_node : Types::UnreachableNodeFlowValidationDetails? = nil,
          @unsatisfied_connection_conditions : Types::UnsatisfiedConnectionConditionsFlowValidationDetails? = nil,
          @unspecified : Types::UnspecifiedFlowValidationDetails? = nil
        )
        end
      end

      # Contains information about a version of a flow. This data type is used in the following API
      # operations: ListFlowVersions response

      struct FlowVersionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow that the version belongs to.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at the version was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the flow.

        @[JSON::Field(key: "status")]
        getter status : String

        # The version of the flow.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @status : String,
          @version : String
        )
        end
      end

      # Defines parameters that the agent needs to invoke from the user to complete the function.
      # Corresponds to an action in an action group. This data type is used in the following API operations:
      # CreateAgentActionGroup request CreateAgentActionGroup response UpdateAgentActionGroup request
      # UpdateAgentActionGroup response GetAgentActionGroup response

      struct Function
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

      # Defines functions that each define parameters that the agent needs to invoke from the user. Each
      # function represents an action in an action group. This data type is used in the following API
      # operations: CreateAgentActionGroup request CreateAgentActionGroup response UpdateAgentActionGroup
      # request UpdateAgentActionGroup response GetAgentActionGroup response

      struct FunctionSchema
        include JSON::Serializable

        # A list of functions that each define an action in the action group.

        @[JSON::Field(key: "functions")]
        getter functions : Array(Types::Function)?

        def initialize(
          @functions : Array(Types::Function)? = nil
        )
        end
      end


      struct GetAgentActionGroupRequest
        include JSON::Serializable

        # The unique identifier of the action group for which to get information.

        @[JSON::Field(key: "actionGroupId")]
        getter action_group_id : String

        # The unique identifier of the agent that the action group belongs to.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent that the action group belongs to.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        def initialize(
          @action_group_id : String,
          @agent_id : String,
          @agent_version : String
        )
        end
      end


      struct GetAgentActionGroupResponse
        include JSON::Serializable

        # Contains details about the action group.

        @[JSON::Field(key: "agentActionGroup")]
        getter agent_action_group : Types::AgentActionGroup

        def initialize(
          @agent_action_group : Types::AgentActionGroup
        )
        end
      end


      struct GetAgentAliasRequest
        include JSON::Serializable

        # The unique identifier of the alias for which to get information.

        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String

        # The unique identifier of the agent to which the alias to get information belongs.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        def initialize(
          @agent_alias_id : String,
          @agent_id : String
        )
        end
      end


      struct GetAgentAliasResponse
        include JSON::Serializable

        # Contains information about the alias.

        @[JSON::Field(key: "agentAlias")]
        getter agent_alias : Types::AgentAlias

        def initialize(
          @agent_alias : Types::AgentAlias
        )
        end
      end


      struct GetAgentCollaboratorRequest
        include JSON::Serializable

        # The agent's ID.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The agent's version.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The collaborator's ID.

        @[JSON::Field(key: "collaboratorId")]
        getter collaborator_id : String

        def initialize(
          @agent_id : String,
          @agent_version : String,
          @collaborator_id : String
        )
        end
      end


      struct GetAgentCollaboratorResponse
        include JSON::Serializable

        # Details about the collaborator.

        @[JSON::Field(key: "agentCollaborator")]
        getter agent_collaborator : Types::AgentCollaborator

        def initialize(
          @agent_collaborator : Types::AgentCollaborator
        )
        end
      end


      struct GetAgentKnowledgeBaseRequest
        include JSON::Serializable

        # The unique identifier of the agent with which the knowledge base is associated.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent with which the knowledge base is associated.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The unique identifier of the knowledge base associated with the agent.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @agent_id : String,
          @agent_version : String,
          @knowledge_base_id : String
        )
        end
      end


      struct GetAgentKnowledgeBaseResponse
        include JSON::Serializable

        # Contains details about a knowledge base attached to an agent.

        @[JSON::Field(key: "agentKnowledgeBase")]
        getter agent_knowledge_base : Types::AgentKnowledgeBase

        def initialize(
          @agent_knowledge_base : Types::AgentKnowledgeBase
        )
        end
      end


      struct GetAgentRequest
        include JSON::Serializable

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        def initialize(
          @agent_id : String
        )
        end
      end


      struct GetAgentResponse
        include JSON::Serializable

        # Contains details about the agent.

        @[JSON::Field(key: "agent")]
        getter agent : Types::Agent

        def initialize(
          @agent : Types::Agent
        )
        end
      end


      struct GetAgentVersionRequest
        include JSON::Serializable

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        def initialize(
          @agent_id : String,
          @agent_version : String
        )
        end
      end


      struct GetAgentVersionResponse
        include JSON::Serializable

        # Contains details about the version of the agent.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : Types::AgentVersion

        def initialize(
          @agent_version : Types::AgentVersion
        )
        end
      end


      struct GetDataSourceRequest
        include JSON::Serializable

        # The unique identifier of the data source.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the knowledge base for the data source.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @data_source_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct GetDataSourceResponse
        include JSON::Serializable

        # Contains details about the data source.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource

        def initialize(
          @data_source : Types::DataSource
        )
        end
      end


      struct GetFlowAliasRequest
        include JSON::Serializable

        # The unique identifier of the alias for which to retrieve information.

        @[JSON::Field(key: "aliasIdentifier")]
        getter alias_identifier : String

        # The unique identifier of the flow that the alias belongs to.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        def initialize(
          @alias_identifier : String,
          @flow_identifier : String
        )
        end
      end


      struct GetFlowAliasResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the flow that the alias belongs to.

        @[JSON::Field(key: "flowId")]
        getter flow_id : String

        # The unique identifier of the alias of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the alias.

        @[JSON::Field(key: "name")]
        getter name : String

        # Contains information about the version that the alias is mapped to.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem)

        # The time at which the alias was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The configuration that specifies how nodes in the flow are executed in parallel.

        @[JSON::Field(key: "concurrencyConfiguration")]
        getter concurrency_configuration : Types::FlowAliasConcurrencyConfiguration?

        # The description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @flow_id : String,
          @id : String,
          @name : String,
          @routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem),
          @updated_at : Time,
          @concurrency_configuration : Types::FlowAliasConcurrencyConfiguration? = nil,
          @description : String? = nil
        )
        end
      end


      struct GetFlowRequest
        include JSON::Serializable

        # The unique identifier of the flow.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        def initialize(
          @flow_identifier : String
        )
        end
      end


      struct GetFlowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the service role with permissions to create a flow. For more
        # information, see Create a service row for flows in the Amazon Bedrock User Guide.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the flow.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the flow. The following statuses are possible: NotPrepared – The flow has been created
        # or updated, but hasn't been prepared. If you just created the flow, you can't test it. If you
        # updated the flow, the DRAFT version won't contain the latest changes for testing. Send a PrepareFlow
        # request to package the latest changes into the DRAFT version. Preparing – The flow is being prepared
        # so that the DRAFT version contains the latest changes for testing. Prepared – The flow is prepared
        # and the DRAFT version contains the latest changes for testing. Failed – The last API operation that
        # you invoked on the flow failed. Send a GetFlow request and check the error message in the
        # validations field.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the flow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the flow for which information was retrieved.

        @[JSON::Field(key: "version")]
        getter version : String

        # The Amazon Resource Name (ARN) of the KMS key that the flow is encrypted with.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The definition of the nodes and connections between the nodes in the flow.

        @[JSON::Field(key: "definition")]
        getter definition : Types::FlowDefinition?

        # The description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of validation error messages related to the last failed operation on the flow.

        @[JSON::Field(key: "validations")]
        getter validations : Array(Types::FlowValidation)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @execution_role_arn : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @version : String,
          @customer_encryption_key_arn : String? = nil,
          @definition : Types::FlowDefinition? = nil,
          @description : String? = nil,
          @validations : Array(Types::FlowValidation)? = nil
        )
        end
      end


      struct GetFlowVersionRequest
        include JSON::Serializable

        # The unique identifier of the flow for which to get information.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # The version of the flow for which to get information.

        @[JSON::Field(key: "flowVersion")]
        getter flow_version : String

        def initialize(
          @flow_identifier : String,
          @flow_version : String
        )
        end
      end


      struct GetFlowVersionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the service role with permissions to create a flow. For more
        # information, see Create a service role for flows in Amazon Bedrock in the Amazon Bedrock User Guide.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the version.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the flow.

        @[JSON::Field(key: "status")]
        getter status : String

        # The version of the flow for which information was retrieved.

        @[JSON::Field(key: "version")]
        getter version : String

        # The Amazon Resource Name (ARN) of the KMS key that the version of the flow is encrypted with.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The definition of the nodes and connections between nodes in the flow.

        @[JSON::Field(key: "definition")]
        getter definition : Types::FlowDefinition?

        # The description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @execution_role_arn : String,
          @id : String,
          @name : String,
          @status : String,
          @version : String,
          @customer_encryption_key_arn : String? = nil,
          @definition : Types::FlowDefinition? = nil,
          @description : String? = nil
        )
        end
      end


      struct GetIngestionJobRequest
        include JSON::Serializable

        # The unique identifier of the data source for the data ingestion job you want to get information on.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the data ingestion job you want to get information on.

        @[JSON::Field(key: "ingestionJobId")]
        getter ingestion_job_id : String

        # The unique identifier of the knowledge base for the data ingestion job you want to get information
        # on.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @data_source_id : String,
          @ingestion_job_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct GetIngestionJobResponse
        include JSON::Serializable

        # Contains details about the data ingestion job.

        @[JSON::Field(key: "ingestionJob")]
        getter ingestion_job : Types::IngestionJob

        def initialize(
          @ingestion_job : Types::IngestionJob
        )
        end
      end


      struct GetKnowledgeBaseDocumentsRequest
        include JSON::Serializable

        # The unique identifier of the data source that contains the documents.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # A list of objects, each of which contains information to identify a document for which to retrieve
        # information.

        @[JSON::Field(key: "documentIdentifiers")]
        getter document_identifiers : Array(Types::DocumentIdentifier)

        # The unique identifier of the knowledge base that is connected to the data source.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @data_source_id : String,
          @document_identifiers : Array(Types::DocumentIdentifier),
          @knowledge_base_id : String
        )
        end
      end


      struct GetKnowledgeBaseDocumentsResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about the documents that were retrieved.

        @[JSON::Field(key: "documentDetails")]
        getter document_details : Array(Types::KnowledgeBaseDocumentDetail)?

        def initialize(
          @document_details : Array(Types::KnowledgeBaseDocumentDetail)? = nil
        )
        end
      end


      struct GetKnowledgeBaseRequest
        include JSON::Serializable

        # The unique identifier of the knowledge base you want to get information on.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @knowledge_base_id : String
        )
        end
      end


      struct GetKnowledgeBaseResponse
        include JSON::Serializable

        # Contains details about the knowledge base.

        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBase

        def initialize(
          @knowledge_base : Types::KnowledgeBase
        )
        end
      end


      struct GetPromptRequest
        include JSON::Serializable

        # The unique identifier of the prompt.

        @[JSON::Field(key: "promptIdentifier")]
        getter prompt_identifier : String

        # The version of the prompt about which you want to retrieve information. Omit this field to return
        # information about the working draft of the prompt.

        @[JSON::Field(key: "promptVersion")]
        getter prompt_version : String?

        def initialize(
          @prompt_identifier : String,
          @prompt_version : String? = nil
        )
        end
      end


      struct GetPromptResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the prompt or the prompt version (if you specified a version in
        # the request).

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the prompt was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the prompt.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the prompt.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time at which the prompt was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the prompt.

        @[JSON::Field(key: "version")]
        getter version : String

        # The Amazon Resource Name (ARN) of the KMS key that the prompt is encrypted with.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The name of the default variant for the prompt. This value must match the name field in the relevant
        # PromptVariant object.

        @[JSON::Field(key: "defaultVariant")]
        getter default_variant : String?

        # The descriptino of the prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of objects, each containing details about a variant of the prompt.

        @[JSON::Field(key: "variants")]
        getter variants : Array(Types::PromptVariant)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @updated_at : Time,
          @version : String,
          @customer_encryption_key_arn : String? = nil,
          @default_variant : String? = nil,
          @description : String? = nil,
          @variants : Array(Types::PromptVariant)? = nil
        )
        end
      end

      # Details about a guardrail associated with a resource.

      struct GuardrailConfiguration
        include JSON::Serializable

        # The unique identifier of the guardrail.

        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String?

        # The version of the guardrail.

        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String?

        def initialize(
          @guardrail_identifier : String? = nil,
          @guardrail_version : String? = nil
        )
        end
      end

      # Settings for hierarchical document chunking for a data source. Hierarchical chunking splits
      # documents into layers of chunks where the first layer contains large chunks, and the second layer
      # contains smaller chunks derived from the first layer. You configure the number of tokens to overlap,
      # or repeat across adjacent chunks. For example, if you set overlap tokens to 60, the last 60 tokens
      # in the first chunk are also included at the beginning of the second chunk. For each layer, you must
      # also configure the maximum number of tokens in a chunk.

      struct HierarchicalChunkingConfiguration
        include JSON::Serializable

        # Token settings for each layer.

        @[JSON::Field(key: "levelConfigurations")]
        getter level_configurations : Array(Types::HierarchicalChunkingLevelConfiguration)

        # The number of tokens to repeat across chunks in the same layer.

        @[JSON::Field(key: "overlapTokens")]
        getter overlap_tokens : Int32

        def initialize(
          @level_configurations : Array(Types::HierarchicalChunkingLevelConfiguration),
          @overlap_tokens : Int32
        )
        end
      end

      # Token settings for a layer in a hierarchical chunking configuration.

      struct HierarchicalChunkingLevelConfiguration
        include JSON::Serializable

        # The maximum number of tokens that a chunk can contain in this layer.

        @[JSON::Field(key: "maxTokens")]
        getter max_tokens : Int32

        def initialize(
          @max_tokens : Int32
        )
        end
      end

      # Details about incompatible data types in a connection between nodes.

      struct IncompatibleConnectionDataTypeFlowValidationDetails
        include JSON::Serializable

        # The name of the connection with incompatible data types.

        @[JSON::Field(key: "connection")]
        getter connection : String

        def initialize(
          @connection : String
        )
        end
      end

      # Contains inference parameters to use when the agent invokes a foundation model in the part of the
      # agent sequence defined by the promptType . For more information, see Inference parameters for
      # foundation models .

      struct InferenceConfiguration
        include JSON::Serializable

        # The maximum number of tokens to allow in the generated response.

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


      struct IngestKnowledgeBaseDocumentsRequest
        include JSON::Serializable

        # The unique identifier of the data source connected to the knowledge base that you're adding
        # documents to.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # A list of objects, each of which contains information about the documents to add.

        @[JSON::Field(key: "documents")]
        getter documents : Array(Types::KnowledgeBaseDocument)

        # The unique identifier of the knowledge base to ingest the documents into.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @data_source_id : String,
          @documents : Array(Types::KnowledgeBaseDocument),
          @knowledge_base_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct IngestKnowledgeBaseDocumentsResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about the documents that were ingested.

        @[JSON::Field(key: "documentDetails")]
        getter document_details : Array(Types::KnowledgeBaseDocumentDetail)?

        def initialize(
          @document_details : Array(Types::KnowledgeBaseDocumentDetail)? = nil
        )
        end
      end

      # Contains details about a data ingestion job. Data sources are ingested into a knowledge base so that
      # Large Language Models (LLMs) can use your data. This data type is used in the following API
      # operations: StartIngestionJob response GetIngestionJob response ListIngestionJob response

      struct IngestionJob
        include JSON::Serializable

        # The unique identifier of the data source for the data ingestion job.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the data ingestion job.

        @[JSON::Field(key: "ingestionJobId")]
        getter ingestion_job_id : String

        # The unique identifier of the knowledge for the data ingestion job.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The time the data ingestion job started. If you stop a data ingestion job, the startedAt time is the
        # time the job was started before the job was stopped.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Time

        # The status of the data ingestion job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time the data ingestion job was last updated. If you stop a data ingestion job, the updatedAt
        # time is the time the job was stopped.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the data ingestion job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of reasons that the data ingestion job failed.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # Contains statistics about the data ingestion job.

        @[JSON::Field(key: "statistics")]
        getter statistics : Types::IngestionJobStatistics?

        def initialize(
          @data_source_id : String,
          @ingestion_job_id : String,
          @knowledge_base_id : String,
          @started_at : Time,
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @statistics : Types::IngestionJobStatistics? = nil
        )
        end
      end

      # The definition of a filter to filter the data.

      struct IngestionJobFilter
        include JSON::Serializable

        # The name of field or attribute to apply the filter.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The operation to apply to the field or attribute.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # A list of values that belong to the field or attribute.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @attribute : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # The parameters of sorting the data.

      struct IngestionJobSortBy
        include JSON::Serializable

        # The name of field or attribute to apply sorting of data.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order for sorting the data.

        @[JSON::Field(key: "order")]
        getter order : String

        def initialize(
          @attribute : String,
          @order : String
        )
        end
      end

      # Contains the statistics for the data ingestion job.

      struct IngestionJobStatistics
        include JSON::Serializable

        # The number of source documents that were deleted.

        @[JSON::Field(key: "numberOfDocumentsDeleted")]
        getter number_of_documents_deleted : Int64?

        # The number of source documents that failed to be ingested.

        @[JSON::Field(key: "numberOfDocumentsFailed")]
        getter number_of_documents_failed : Int64?

        # The total number of source documents that were scanned. Includes new, updated, and unchanged
        # documents.

        @[JSON::Field(key: "numberOfDocumentsScanned")]
        getter number_of_documents_scanned : Int64?

        # The number of metadata files that were updated or deleted.

        @[JSON::Field(key: "numberOfMetadataDocumentsModified")]
        getter number_of_metadata_documents_modified : Int64?

        # The total number of metadata files that were scanned. Includes new, updated, and unchanged files.

        @[JSON::Field(key: "numberOfMetadataDocumentsScanned")]
        getter number_of_metadata_documents_scanned : Int64?

        # The number of modified source documents in the data source that were successfully indexed.

        @[JSON::Field(key: "numberOfModifiedDocumentsIndexed")]
        getter number_of_modified_documents_indexed : Int64?

        # The number of new source documents in the data source that were successfully indexed.

        @[JSON::Field(key: "numberOfNewDocumentsIndexed")]
        getter number_of_new_documents_indexed : Int64?

        def initialize(
          @number_of_documents_deleted : Int64? = nil,
          @number_of_documents_failed : Int64? = nil,
          @number_of_documents_scanned : Int64? = nil,
          @number_of_metadata_documents_modified : Int64? = nil,
          @number_of_metadata_documents_scanned : Int64? = nil,
          @number_of_modified_documents_indexed : Int64? = nil,
          @number_of_new_documents_indexed : Int64? = nil
        )
        end
      end

      # Contains details about a data ingestion job.

      struct IngestionJobSummary
        include JSON::Serializable

        # The unique identifier of the data source for the data ingestion job.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the data ingestion job.

        @[JSON::Field(key: "ingestionJobId")]
        getter ingestion_job_id : String

        # The unique identifier of the knowledge base for the data ingestion job.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The time the data ingestion job started.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Time

        # The status of the data ingestion job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time the data ingestion job was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the data ingestion job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains statistics for the data ingestion job.

        @[JSON::Field(key: "statistics")]
        getter statistics : Types::IngestionJobStatistics?

        def initialize(
          @data_source_id : String,
          @ingestion_job_id : String,
          @knowledge_base_id : String,
          @started_at : Time,
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @statistics : Types::IngestionJobStatistics? = nil
        )
        end
      end

      # Contains configurations for an inline code node in your flow. Inline code nodes let you write and
      # execute code directly within your flow, enabling data transformations, custom logic, and
      # integrations without needing an external Lambda function.

      struct InlineCodeFlowNodeConfiguration
        include JSON::Serializable

        # The code that's executed in your inline code node. The code can access input data from previous
        # nodes in the flow, perform operations on that data, and produce output that can be used by other
        # nodes in your flow. The code must be valid in the programming language that you specify.

        @[JSON::Field(key: "code")]
        getter code : String

        # The programming language used by your inline code node. The code must be valid in the programming
        # language that you specify. Currently, only Python 3 ( Python_3 ) is supported.

        @[JSON::Field(key: "language")]
        getter language : String

        def initialize(
          @code : String,
          @language : String
        )
        end
      end

      # Contains information about content defined inline to ingest into a data source. Choose a type and
      # include the field that corresponds to it.

      struct InlineContent
        include JSON::Serializable

        # The type of inline content to define.

        @[JSON::Field(key: "type")]
        getter type : String

        # Contains information about content defined inline in bytes.

        @[JSON::Field(key: "byteContent")]
        getter byte_content : Types::ByteContentDoc?

        # Contains information about content defined inline in text.

        @[JSON::Field(key: "textContent")]
        getter text_content : Types::TextContentDoc?

        def initialize(
          @type : String,
          @byte_content : Types::ByteContentDoc? = nil,
          @text_content : Types::TextContentDoc? = nil
        )
        end
      end

      # Contains configurations for the input flow node for a flow. This node takes the input from flow
      # invocation and passes it to the next node in the data type that you specify.

      struct InputFlowNodeConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # A location for storing content from data sources temporarily as it is processed by custom components
      # in the ingestion pipeline.

      struct IntermediateStorage
        include JSON::Serializable

        # An S3 bucket path.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location

        def initialize(
          @s3_location : Types::S3Location
        )
        end
      end

      # An internal server error occurred. Retry your request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about a flow that contains connections that violate loop boundary rules.

      struct InvalidLoopBoundaryFlowValidationDetails
        include JSON::Serializable

        # The name of the connection that violates loop boundary rules.

        @[JSON::Field(key: "connection")]
        getter connection : String

        # The source node of the connection that violates DoWhile loop boundary rules.

        @[JSON::Field(key: "source")]
        getter source : String

        # The target node of the connection that violates DoWhile loop boundary rules.

        @[JSON::Field(key: "target")]
        getter target : String

        def initialize(
          @connection : String,
          @source : String,
          @target : String
        )
        end
      end

      # Contains configurations for an iterator node in a flow. Takes an input that is an array and
      # iteratively sends each item of the array as an output to the following node. The size of the array
      # is also returned in the output. The output flow node at the end of the flow iteration will return a
      # response for each member of the array. To return only one response, you can include a collector node
      # downstream from the iterator node.

      struct IteratorFlowNodeConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # Settings for an Amazon Kendra knowledge base.

      struct KendraKnowledgeBaseConfiguration
        include JSON::Serializable

        # The ARN of the Amazon Kendra index.

        @[JSON::Field(key: "kendraIndexArn")]
        getter kendra_index_arn : String

        def initialize(
          @kendra_index_arn : String
        )
        end
      end

      # Contains information about a knowledge base.

      struct KnowledgeBase
        include JSON::Serializable

        # The time the knowledge base was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # Contains details about the embeddings configuration of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseConfiguration")]
        getter knowledge_base_configuration : Types::KnowledgeBaseConfiguration

        # The unique identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The name of the knowledge base.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the IAM role with permissions to invoke API operations on the
        # knowledge base.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The status of the knowledge base. The following statuses are possible: CREATING – The knowledge base
        # is being created. ACTIVE – The knowledge base is ready to be queried. DELETING – The knowledge base
        # is being deleted. UPDATING – The knowledge base is being updated. FAILED – The knowledge base API
        # operation failed.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time the knowledge base was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the knowledge base.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of reasons that the API operation on the knowledge base failed.

        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(String)?

        # Contains details about the storage configuration of the knowledge base.

        @[JSON::Field(key: "storageConfiguration")]
        getter storage_configuration : Types::StorageConfiguration?

        def initialize(
          @created_at : Time,
          @knowledge_base_arn : String,
          @knowledge_base_configuration : Types::KnowledgeBaseConfiguration,
          @knowledge_base_id : String,
          @name : String,
          @role_arn : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil,
          @failure_reasons : Array(String)? = nil,
          @storage_configuration : Types::StorageConfiguration? = nil
        )
        end
      end

      # Contains details about the vector embeddings configuration of the knowledge base.

      struct KnowledgeBaseConfiguration
        include JSON::Serializable

        # The type of data that the data source is converted into for the knowledge base.

        @[JSON::Field(key: "type")]
        getter type : String

        # Settings for an Amazon Kendra knowledge base.

        @[JSON::Field(key: "kendraKnowledgeBaseConfiguration")]
        getter kendra_knowledge_base_configuration : Types::KendraKnowledgeBaseConfiguration?

        # Specifies configurations for a knowledge base connected to an SQL database.

        @[JSON::Field(key: "sqlKnowledgeBaseConfiguration")]
        getter sql_knowledge_base_configuration : Types::SqlKnowledgeBaseConfiguration?

        # Contains details about the model that's used to convert the data source into vector embeddings.

        @[JSON::Field(key: "vectorKnowledgeBaseConfiguration")]
        getter vector_knowledge_base_configuration : Types::VectorKnowledgeBaseConfiguration?

        def initialize(
          @type : String,
          @kendra_knowledge_base_configuration : Types::KendraKnowledgeBaseConfiguration? = nil,
          @sql_knowledge_base_configuration : Types::SqlKnowledgeBaseConfiguration? = nil,
          @vector_knowledge_base_configuration : Types::VectorKnowledgeBaseConfiguration? = nil
        )
        end
      end

      # Contains information about a document to ingest into a knowledge base and metadata to associate with
      # it.

      struct KnowledgeBaseDocument
        include JSON::Serializable

        # Contains the content of the document.

        @[JSON::Field(key: "content")]
        getter content : Types::DocumentContent

        # Contains the metadata to associate with the document.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::DocumentMetadata?

        def initialize(
          @content : Types::DocumentContent,
          @metadata : Types::DocumentMetadata? = nil
        )
        end
      end

      # Contains the details for a document that was ingested or deleted.

      struct KnowledgeBaseDocumentDetail
        include JSON::Serializable

        # The identifier of the data source connected to the knowledge base that the document was ingested
        # into or deleted from.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # Contains information that identifies the document.

        @[JSON::Field(key: "identifier")]
        getter identifier : Types::DocumentIdentifier

        # The identifier of the knowledge base that the document was ingested into or deleted from.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The ingestion status of the document. The following statuses are possible: STARTING – You submitted
        # the ingestion job containing the document. PENDING – The document is waiting to be ingested.
        # IN_PROGRESS – The document is being ingested. INDEXED – The document was successfully indexed.
        # PARTIALLY_INDEXED – The document was partially indexed. METADATA_PARTIALLY_INDEXED – You submitted
        # metadata for an existing document and it was partially indexed. METADATA_UPDATE_FAILED – You
        # submitted a metadata update for an existing document but it failed. FAILED – The document failed to
        # be ingested. NOT_FOUND – The document wasn't found. IGNORED – The document was ignored during
        # ingestion. DELETING – You submitted the delete job containing the document. DELETE_IN_PROGRESS – The
        # document is being deleted.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the status. Appears alongside the status IGNORED .

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The date and time at which the document was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @data_source_id : String,
          @identifier : Types::DocumentIdentifier,
          @knowledge_base_id : String,
          @status : String,
          @status_reason : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Contains configurations for a knowledge base node in a flow. This node takes a query as the input
      # and returns, as the output, the retrieved responses directly (as an array) or a response generated
      # based on the retrieved responses. For more information, see Node types in a flow in the Amazon
      # Bedrock User Guide.

      struct KnowledgeBaseFlowNodeConfiguration
        include JSON::Serializable

        # The unique identifier of the knowledge base to query.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Contains configurations for a guardrail to apply during query and response generation for the
        # knowledge base in this configuration.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # Contains inference configurations for the prompt.

        @[JSON::Field(key: "inferenceConfiguration")]
        getter inference_configuration : Types::PromptInferenceConfiguration?

        # The unique identifier of the model or inference profile to use to generate a response from the query
        # results. Omit this field if you want to return the retrieved results as an array.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The number of results to retrieve from the knowledge base.

        @[JSON::Field(key: "numberOfResults")]
        getter number_of_results : Int32?

        # The configuration for orchestrating the retrieval and generation process in the knowledge base node.

        @[JSON::Field(key: "orchestrationConfiguration")]
        getter orchestration_configuration : Types::KnowledgeBaseOrchestrationConfiguration?

        # A custom prompt template to use with the knowledge base for generating responses.

        @[JSON::Field(key: "promptTemplate")]
        getter prompt_template : Types::KnowledgeBasePromptTemplate?

        # The configuration for reranking the retrieved results from the knowledge base to improve relevance.

        @[JSON::Field(key: "rerankingConfiguration")]
        getter reranking_configuration : Types::VectorSearchRerankingConfiguration?

        def initialize(
          @knowledge_base_id : String,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @inference_configuration : Types::PromptInferenceConfiguration? = nil,
          @model_id : String? = nil,
          @number_of_results : Int32? = nil,
          @orchestration_configuration : Types::KnowledgeBaseOrchestrationConfiguration? = nil,
          @prompt_template : Types::KnowledgeBasePromptTemplate? = nil,
          @reranking_configuration : Types::VectorSearchRerankingConfiguration? = nil
        )
        end
      end

      # Configures how the knowledge base orchestrates the retrieval and generation process, allowing for
      # customization of prompts, inference parameters, and performance settings.

      struct KnowledgeBaseOrchestrationConfiguration
        include JSON::Serializable

        # The additional model-specific request parameters as key-value pairs to be included in the request to
        # the foundation model.

        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        # Contains inference configurations for the prompt.

        @[JSON::Field(key: "inferenceConfig")]
        getter inference_config : Types::PromptInferenceConfiguration?

        # The performance configuration options for the knowledge base retrieval and generation process.

        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        # A custom prompt template for orchestrating the retrieval and generation process.

        @[JSON::Field(key: "promptTemplate")]
        getter prompt_template : Types::KnowledgeBasePromptTemplate?

        def initialize(
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil,
          @inference_config : Types::PromptInferenceConfiguration? = nil,
          @performance_config : Types::PerformanceConfiguration? = nil,
          @prompt_template : Types::KnowledgeBasePromptTemplate? = nil
        )
        end
      end

      # Defines a custom prompt template for orchestrating the retrieval and generation process.

      struct KnowledgeBasePromptTemplate
        include JSON::Serializable

        # The text of the prompt template.

        @[JSON::Field(key: "textPromptTemplate")]
        getter text_prompt_template : String?

        def initialize(
          @text_prompt_template : String? = nil
        )
        end
      end

      # Contains details about a knowledge base.

      struct KnowledgeBaseSummary
        include JSON::Serializable

        # The unique identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The name of the knowledge base.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the knowledge base.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time the knowledge base was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the knowledge base.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @knowledge_base_id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      # Contains configurations for a Lambda function node in the flow. You specify the Lambda function to
      # invoke and the inputs into the function. The output is the response that is defined in the Lambda
      # function. For more information, see Node types in a flow in the Amazon Bedrock User Guide.

      struct LambdaFunctionFlowNodeConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda function to invoke.

        @[JSON::Field(key: "lambdaArn")]
        getter lambda_arn : String

        def initialize(
          @lambda_arn : String
        )
        end
      end

      # Contains configurations for a Lex node in the flow. You specify a Amazon Lex bot to invoke. This
      # node takes an utterance as the input and returns as the output the intent identified by the Amazon
      # Lex bot. For more information, see Node types in a flow in the Amazon Bedrock User Guide.

      struct LexFlowNodeConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Lex bot alias to invoke.

        @[JSON::Field(key: "botAliasArn")]
        getter bot_alias_arn : String

        # The Region to invoke the Amazon Lex bot in.

        @[JSON::Field(key: "localeId")]
        getter locale_id : String

        def initialize(
          @bot_alias_arn : String,
          @locale_id : String
        )
        end
      end


      struct ListAgentActionGroupsRequest
        include JSON::Serializable

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

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
          @agent_id : String,
          @agent_version : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentActionGroupsResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about an action group.

        @[JSON::Field(key: "actionGroupSummaries")]
        getter action_group_summaries : Array(Types::ActionGroupSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @action_group_summaries : Array(Types::ActionGroupSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentAliasesRequest
        include JSON::Serializable

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

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
          @agent_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentAliasesResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about an alias of the agent.

        @[JSON::Field(key: "agentAliasSummaries")]
        getter agent_alias_summaries : Array(Types::AgentAliasSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_alias_summaries : Array(Types::AgentAliasSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentCollaboratorsRequest
        include JSON::Serializable

        # The agent's ID.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The agent's version.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The maximum number of agent collaborators to return in one page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_id : String,
          @agent_version : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentCollaboratorsResponse
        include JSON::Serializable

        # A list of collaborator summaries.

        @[JSON::Field(key: "agentCollaboratorSummaries")]
        getter agent_collaborator_summaries : Array(Types::AgentCollaboratorSummary)

        # Specify the pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_collaborator_summaries : Array(Types::AgentCollaboratorSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentKnowledgeBasesRequest
        include JSON::Serializable

        # The unique identifier of the agent for which to return information about knowledge bases associated
        # with it.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent for which to return information about knowledge bases associated with it.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

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
          @agent_id : String,
          @agent_version : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentKnowledgeBasesResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about a knowledge base associated with the
        # agent.

        @[JSON::Field(key: "agentKnowledgeBaseSummaries")]
        getter agent_knowledge_base_summaries : Array(Types::AgentKnowledgeBaseSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_knowledge_base_summaries : Array(Types::AgentKnowledgeBaseSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentVersionsRequest
        include JSON::Serializable

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

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
          @agent_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentVersionsResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about a version of the agent.

        @[JSON::Field(key: "agentVersionSummaries")]
        getter agent_version_summaries : Array(Types::AgentVersionSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_version_summaries : Array(Types::AgentVersionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAgentsRequest
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


      struct ListAgentsResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about an agent.

        @[JSON::Field(key: "agentSummaries")]
        getter agent_summaries : Array(Types::AgentSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @agent_summaries : Array(Types::AgentSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourcesRequest
        include JSON::Serializable

        # The unique identifier of the knowledge base for which to return a list of information.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

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
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourcesResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about a data source.

        @[JSON::Field(key: "dataSourceSummaries")]
        getter data_source_summaries : Array(Types::DataSourceSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_source_summaries : Array(Types::DataSourceSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListFlowAliasesRequest
        include JSON::Serializable

        # The unique identifier of the flow for which aliases are being returned.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

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
          @flow_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFlowAliasesResponse
        include JSON::Serializable

        # A list, each member of which contains information about an alias.

        @[JSON::Field(key: "flowAliasSummaries")]
        getter flow_alias_summaries : Array(Types::FlowAliasSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_alias_summaries : Array(Types::FlowAliasSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListFlowVersionsRequest
        include JSON::Serializable

        # The unique identifier of the flow.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

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
          @flow_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFlowVersionsResponse
        include JSON::Serializable

        # A list, each member of which contains information about a flow.

        @[JSON::Field(key: "flowVersionSummaries")]
        getter flow_version_summaries : Array(Types::FlowVersionSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_version_summaries : Array(Types::FlowVersionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListFlowsRequest
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


      struct ListFlowsResponse
        include JSON::Serializable

        # A list, each member of which contains information about a flow.

        @[JSON::Field(key: "flowSummaries")]
        getter flow_summaries : Array(Types::FlowSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @flow_summaries : Array(Types::FlowSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListIngestionJobsRequest
        include JSON::Serializable

        # The unique identifier of the data source for the list of data ingestion jobs.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the knowledge base for the list of data ingestion jobs.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Contains information about the filters for filtering the data.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::IngestionJobFilter)?

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

        # Contains details about how to sort the data.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : Types::IngestionJobSortBy?

        def initialize(
          @data_source_id : String,
          @knowledge_base_id : String,
          @filters : Array(Types::IngestionJobFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::IngestionJobSortBy? = nil
        )
        end
      end


      struct ListIngestionJobsResponse
        include JSON::Serializable

        # A list of data ingestion jobs with information about each job.

        @[JSON::Field(key: "ingestionJobSummaries")]
        getter ingestion_job_summaries : Array(Types::IngestionJobSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ingestion_job_summaries : Array(Types::IngestionJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListKnowledgeBaseDocumentsRequest
        include JSON::Serializable

        # The unique identifier of the data source that contains the documents.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the knowledge base that is connected to the data source.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

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
          @data_source_id : String,
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListKnowledgeBaseDocumentsResponse
        include JSON::Serializable

        # A list of objects, each of which contains information about the documents that were retrieved.

        @[JSON::Field(key: "documentDetails")]
        getter document_details : Array(Types::KnowledgeBaseDocumentDetail)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @document_details : Array(Types::KnowledgeBaseDocumentDetail),
          @next_token : String? = nil
        )
        end
      end


      struct ListKnowledgeBasesRequest
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


      struct ListKnowledgeBasesResponse
        include JSON::Serializable

        # A list of knowledge bases with information about each knowledge base.

        @[JSON::Field(key: "knowledgeBaseSummaries")]
        getter knowledge_base_summaries : Array(Types::KnowledgeBaseSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_summaries : Array(Types::KnowledgeBaseSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListPromptsRequest
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

        # The unique identifier of the prompt for whose versions you want to return information. Omit this
        # field to list information about all prompts in an account.

        @[JSON::Field(key: "promptIdentifier")]
        getter prompt_identifier : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @prompt_identifier : String? = nil
        )
        end
      end


      struct ListPromptsResponse
        include JSON::Serializable

        # A list, each member of which contains information about a prompt using Prompt management.

        @[JSON::Field(key: "promptSummaries")]
        getter prompt_summaries : Array(Types::PromptSummary)

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @prompt_summaries : Array(Types::PromptSummary),
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

      # Contains configurations for the controller node of a DoWhile loop in the flow.

      struct LoopControllerFlowNodeConfiguration
        include JSON::Serializable

        # Specifies the condition that determines when the flow exits the DoWhile loop. The loop executes
        # until this condition evaluates to true.

        @[JSON::Field(key: "continueCondition")]
        getter continue_condition : Types::FlowCondition

        # Specifies the maximum number of times the DoWhile loop can iterate before the flow exits the loop.

        @[JSON::Field(key: "maxIterations")]
        getter max_iterations : Int32?

        def initialize(
          @continue_condition : Types::FlowCondition,
          @max_iterations : Int32? = nil
        )
        end
      end

      # Contains configurations for the nodes of a DoWhile loop in your flow. A DoWhile loop is made up of
      # the following nodes: Loop - The container node that holds the loop's flow definition. This node
      # encompasses the entire loop structure. LoopInput - The entry point node for the loop. This node
      # receives inputs from nodes outside the loop and from previous loop iterations. Body nodes - The
      # processing nodes that execute within each loop iteration. These can be nodes for handling data in
      # your flow, such as a prompt or Lambda function nodes. Some node types aren't supported inside a
      # DoWhile loop body. For more information, see LoopIncompatibleNodeTypeFlowValidationDetails .
      # LoopController - The node that evaluates whether the loop should continue or exit based on a
      # condition. These nodes work together to create a loop that runs at least once and continues until a
      # specified condition is met or a maximum number of iterations is reached.

      struct LoopFlowNodeConfiguration
        include JSON::Serializable

        # The definition of the DoWhile loop nodes and connections between nodes in the flow.

        @[JSON::Field(key: "definition")]
        getter definition : Types::FlowDefinition

        def initialize(
          @definition : Types::FlowDefinition
        )
        end
      end

      # Details about a flow that contains an incompatible node in a DoWhile loop.

      struct LoopIncompatibleNodeTypeFlowValidationDetails
        include JSON::Serializable

        # The node that's incompatible in the DoWhile loop.

        @[JSON::Field(key: "incompatibleNodeName")]
        getter incompatible_node_name : String

        # The node type of the incompatible node in the DoWhile loop. Some node types, like a condition node,
        # aren't allowed in a DoWhile loop.

        @[JSON::Field(key: "incompatibleNodeType")]
        getter incompatible_node_type : String

        # The Loop container node that contains an incompatible node.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @incompatible_node_name : String,
          @incompatible_node_type : String,
          @node : String
        )
        end
      end

      # Contains configurations for the input node of a DoWhile loop in the flow.

      struct LoopInputFlowNodeConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # Details about a malformed condition expression in a node.

      struct MalformedConditionExpressionFlowValidationDetails
        include JSON::Serializable

        # The error message describing why the condition expression is malformed.

        @[JSON::Field(key: "cause")]
        getter cause : String

        # The name of the malformed condition.

        @[JSON::Field(key: "condition")]
        getter condition : String

        # The name of the node containing the malformed condition expression.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @cause : String,
          @condition : String,
          @node : String
        )
        end
      end

      # Details about a malformed input expression in a node.

      struct MalformedNodeInputExpressionFlowValidationDetails
        include JSON::Serializable

        # The error message describing why the input expression is malformed.

        @[JSON::Field(key: "cause")]
        getter cause : String

        # The name of the input with the malformed expression.

        @[JSON::Field(key: "input")]
        getter input : String

        # The name of the node containing the malformed input expression.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @cause : String,
          @input : String,
          @node : String
        )
        end
      end

      # Details of the memory configuration.

      struct MemoryConfiguration
        include JSON::Serializable

        # The type of memory that is stored.

        @[JSON::Field(key: "enabledMemoryTypes")]
        getter enabled_memory_types : Array(String)

        # Contains the configuration for SESSION_SUMMARY memory type enabled for the agent.

        @[JSON::Field(key: "sessionSummaryConfiguration")]
        getter session_summary_configuration : Types::SessionSummaryConfiguration?

        # The number of days the agent is configured to retain the conversational context.

        @[JSON::Field(key: "storageDays")]
        getter storage_days : Int32?

        def initialize(
          @enabled_memory_types : Array(String),
          @session_summary_configuration : Types::SessionSummaryConfiguration? = nil,
          @storage_days : Int32? = nil
        )
        end
      end

      # A message input or response from a model. For more information, see Create a prompt using Prompt
      # management .

      struct Message
        include JSON::Serializable

        # The content in the message.

        @[JSON::Field(key: "content")]
        getter content : Array(Types::ContentBlock)

        # The role that the message belongs to.

        @[JSON::Field(key: "role")]
        getter role : String

        def initialize(
          @content : Array(Types::ContentBlock),
          @role : String
        )
        end
      end

      # Contains information about a metadata attribute.

      struct MetadataAttribute
        include JSON::Serializable

        # The key of the metadata attribute.

        @[JSON::Field(key: "key")]
        getter key : String

        # Contains the value of the metadata attribute.

        @[JSON::Field(key: "value")]
        getter value : Types::MetadataAttributeValue

        def initialize(
          @key : String,
          @value : Types::MetadataAttributeValue
        )
        end
      end

      # Contains the value of the metadata attribute. Choose a type and include the field that corresponds
      # to it.

      struct MetadataAttributeValue
        include JSON::Serializable

        # The type of the metadata attribute.

        @[JSON::Field(key: "type")]
        getter type : String

        # The value of the Boolean metadata attribute.

        @[JSON::Field(key: "booleanValue")]
        getter boolean_value : Bool?

        # The value of the numeric metadata attribute.

        @[JSON::Field(key: "numberValue")]
        getter number_value : Float64?

        # An array of strings that define the value of the metadata attribute.

        @[JSON::Field(key: "stringListValue")]
        getter string_list_value : Array(String)?

        # The value of the string metadata attribute.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @type : String,
          @boolean_value : Bool? = nil,
          @number_value : Float64? = nil,
          @string_list_value : Array(String)? = nil,
          @string_value : String? = nil
        )
        end
      end

      # Specifies how metadata fields should be handled during the reranking process.

      struct MetadataConfigurationForReranking
        include JSON::Serializable

        # The mode for selecting metadata fields for reranking.

        @[JSON::Field(key: "selectionMode")]
        getter selection_mode : String

        # The configuration for selective metadata field inclusion or exclusion during reranking.

        @[JSON::Field(key: "selectiveModeConfiguration")]
        getter selective_mode_configuration : Types::RerankingMetadataSelectiveModeConfiguration?

        def initialize(
          @selection_mode : String,
          @selective_mode_configuration : Types::RerankingMetadataSelectiveModeConfiguration? = nil
        )
        end
      end

      # Details about mismatched input data types in a node.

      struct MismatchedNodeInputTypeFlowValidationDetails
        include JSON::Serializable

        # The expected data type for the node input.

        @[JSON::Field(key: "expectedType")]
        getter expected_type : String

        # The name of the input with the mismatched data type.

        @[JSON::Field(key: "input")]
        getter input : String

        # The name of the node containing the input with the mismatched data type.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @expected_type : String,
          @input : String,
          @node : String
        )
        end
      end

      # Details about mismatched output data types in a node.

      struct MismatchedNodeOutputTypeFlowValidationDetails
        include JSON::Serializable

        # The expected data type for the node output.

        @[JSON::Field(key: "expectedType")]
        getter expected_type : String

        # The name of the node containing the output with the mismatched data type.

        @[JSON::Field(key: "node")]
        getter node : String

        # The name of the output with the mismatched data type.

        @[JSON::Field(key: "output")]
        getter output : String

        def initialize(
          @expected_type : String,
          @node : String,
          @output : String
        )
        end
      end

      # Details about a connection missing required configuration.

      struct MissingConnectionConfigurationFlowValidationDetails
        include JSON::Serializable

        # The name of the connection missing configuration.

        @[JSON::Field(key: "connection")]
        getter connection : String

        def initialize(
          @connection : String
        )
        end
      end

      # Details about a missing default condition in a conditional node.

      struct MissingDefaultConditionFlowValidationDetails
        include JSON::Serializable

        # The name of the node missing the default condition.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @node : String
        )
        end
      end

      # Details about missing ending nodes (such as FlowOutputNode) in the flow.

      struct MissingEndingNodesFlowValidationDetails
        include JSON::Serializable

        def initialize
        end
      end

      # Details about a flow that's missing a required LoopController node in a DoWhile loop.

      struct MissingLoopControllerNodeFlowValidationDetails
        include JSON::Serializable

        # The DoWhile loop in a flow that's missing a required LoopController node.

        @[JSON::Field(key: "loopNode")]
        getter loop_node : String

        def initialize(
          @loop_node : String
        )
        end
      end

      # Details about a flow that's missing a required LoopInput node in a DoWhile loop.

      struct MissingLoopInputNodeFlowValidationDetails
        include JSON::Serializable

        # The DoWhile loop in a flow that's missing a required LoopInput node.

        @[JSON::Field(key: "loopNode")]
        getter loop_node : String

        def initialize(
          @loop_node : String
        )
        end
      end

      # Details about a node missing a required configuration.

      struct MissingNodeConfigurationFlowValidationDetails
        include JSON::Serializable

        # The name of the node missing a required configuration.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @node : String
        )
        end
      end

      # Details about a missing required input in a node.

      struct MissingNodeInputFlowValidationDetails
        include JSON::Serializable

        # The name of the missing input.

        @[JSON::Field(key: "input")]
        getter input : String

        # The name of the node missing the required input.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @input : String,
          @node : String
        )
        end
      end

      # Details about a missing required output in a node.

      struct MissingNodeOutputFlowValidationDetails
        include JSON::Serializable

        # The name of the node missing the required output.

        @[JSON::Field(key: "node")]
        getter node : String

        # The name of the missing output.

        @[JSON::Field(key: "output")]
        getter output : String

        def initialize(
          @node : String,
          @output : String
        )
        end
      end

      # Details about missing starting nodes (such as FlowInputNode) in the flow.

      struct MissingStartingNodesFlowValidationDetails
        include JSON::Serializable

        def initialize
        end
      end

      # Contains details about the storage configuration of the knowledge base in MongoDB Atlas.

      struct MongoDbAtlasConfiguration
        include JSON::Serializable

        # The collection name of the knowledge base in MongoDB Atlas.

        @[JSON::Field(key: "collectionName")]
        getter collection_name : String

        # The Amazon Resource Name (ARN) of the secret that you created in Secrets Manager that contains user
        # credentials for your MongoDB Atlas cluster.

        @[JSON::Field(key: "credentialsSecretArn")]
        getter credentials_secret_arn : String

        # The database name in your MongoDB Atlas cluster for your knowledge base.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The endpoint URL of your MongoDB Atlas cluster for your knowledge base.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # Contains the names of the fields to which to map information about the vector store.

        @[JSON::Field(key: "fieldMapping")]
        getter field_mapping : Types::MongoDbAtlasFieldMapping

        # The name of the MongoDB Atlas vector search index.

        @[JSON::Field(key: "vectorIndexName")]
        getter vector_index_name : String

        # The name of the VPC endpoint service in your account that is connected to your MongoDB Atlas
        # cluster.

        @[JSON::Field(key: "endpointServiceName")]
        getter endpoint_service_name : String?

        # The name of the text search index in the MongoDB collection. This is required for using the hybrid
        # search feature.

        @[JSON::Field(key: "textIndexName")]
        getter text_index_name : String?

        def initialize(
          @collection_name : String,
          @credentials_secret_arn : String,
          @database_name : String,
          @endpoint : String,
          @field_mapping : Types::MongoDbAtlasFieldMapping,
          @vector_index_name : String,
          @endpoint_service_name : String? = nil,
          @text_index_name : String? = nil
        )
        end
      end

      # Contains the names of the fields to which to map information about the vector store.

      struct MongoDbAtlasFieldMapping
        include JSON::Serializable

        # The name of the field in which Amazon Bedrock stores metadata about the vector store.

        @[JSON::Field(key: "metadataField")]
        getter metadata_field : String

        # The name of the field in which Amazon Bedrock stores the raw text from your data. The text is split
        # according to the chunking strategy you choose.

        @[JSON::Field(key: "textField")]
        getter text_field : String

        # The name of the field in which Amazon Bedrock stores the vector embeddings for your data sources.

        @[JSON::Field(key: "vectorField")]
        getter vector_field : String

        def initialize(
          @metadata_field : String,
          @text_field : String,
          @vector_field : String
        )
        end
      end

      # Details about a flow that contains multiple LoopController nodes in a DoWhile loop.

      struct MultipleLoopControllerNodesFlowValidationDetails
        include JSON::Serializable

        # The DoWhile loop in a flow that contains multiple LoopController nodes.

        @[JSON::Field(key: "loopNode")]
        getter loop_node : String

        def initialize(
          @loop_node : String
        )
        end
      end

      # Details about a flow that contains multiple LoopInput nodes in a DoWhile loop.

      struct MultipleLoopInputNodesFlowValidationDetails
        include JSON::Serializable

        # The DoWhile loop in a flow that contains multiple LoopInput nodes.

        @[JSON::Field(key: "loopNode")]
        getter loop_node : String

        def initialize(
          @loop_node : String
        )
        end
      end

      # Details about multiple connections to a single node input.

      struct MultipleNodeInputConnectionsFlowValidationDetails
        include JSON::Serializable

        # The name of the input with multiple connections to it.

        @[JSON::Field(key: "input")]
        getter input : String

        # The name of the node containing the input with multiple connections.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @input : String,
          @node : String
        )
        end
      end

      # Contains details about the storage configuration of the knowledge base in Amazon Neptune Analytics.
      # For more information, see Create a vector index in Amazon Neptune Analytics .

      struct NeptuneAnalyticsConfiguration
        include JSON::Serializable

        # Contains the names of the fields to which to map information about the vector store.

        @[JSON::Field(key: "fieldMapping")]
        getter field_mapping : Types::NeptuneAnalyticsFieldMapping

        # The Amazon Resource Name (ARN) of the Neptune Analytics vector store.

        @[JSON::Field(key: "graphArn")]
        getter graph_arn : String

        def initialize(
          @field_mapping : Types::NeptuneAnalyticsFieldMapping,
          @graph_arn : String
        )
        end
      end

      # Contains the names of the fields to which to map information about the vector store.

      struct NeptuneAnalyticsFieldMapping
        include JSON::Serializable

        # The name of the field in which Amazon Bedrock stores metadata about the vector store.

        @[JSON::Field(key: "metadataField")]
        getter metadata_field : String

        # The name of the field in which Amazon Bedrock stores the raw text from your data. The text is split
        # according to the chunking strategy you choose.

        @[JSON::Field(key: "textField")]
        getter text_field : String

        def initialize(
          @metadata_field : String,
          @text_field : String
        )
        end
      end

      # Contains details about the Managed Cluster configuration of the knowledge base in Amazon OpenSearch
      # Service. For more information, see Create a vector index in OpenSearch Managed Cluster .

      struct OpenSearchManagedClusterConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the OpenSearch domain.

        @[JSON::Field(key: "domainArn")]
        getter domain_arn : String

        # The endpoint URL the OpenSearch domain.

        @[JSON::Field(key: "domainEndpoint")]
        getter domain_endpoint : String

        # Contains the names of the fields to which to map information about the vector store.

        @[JSON::Field(key: "fieldMapping")]
        getter field_mapping : Types::OpenSearchManagedClusterFieldMapping

        # The name of the vector store.

        @[JSON::Field(key: "vectorIndexName")]
        getter vector_index_name : String

        def initialize(
          @domain_arn : String,
          @domain_endpoint : String,
          @field_mapping : Types::OpenSearchManagedClusterFieldMapping,
          @vector_index_name : String
        )
        end
      end

      # Contains the names of the fields to which to map information about the vector store.

      struct OpenSearchManagedClusterFieldMapping
        include JSON::Serializable

        # The name of the field in which Amazon Bedrock stores metadata about the vector store.

        @[JSON::Field(key: "metadataField")]
        getter metadata_field : String

        # The name of the field in which Amazon Bedrock stores the raw text from your data. The text is split
        # according to the chunking strategy you choose.

        @[JSON::Field(key: "textField")]
        getter text_field : String

        # The name of the field in which Amazon Bedrock stores the vector embeddings for your data sources.

        @[JSON::Field(key: "vectorField")]
        getter vector_field : String

        def initialize(
          @metadata_field : String,
          @text_field : String,
          @vector_field : String
        )
        end
      end

      # Contains details about the storage configuration of the knowledge base in Amazon OpenSearch Service.
      # For more information, see Create a vector index in Amazon OpenSearch Service .

      struct OpenSearchServerlessConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the OpenSearch Service vector store.

        @[JSON::Field(key: "collectionArn")]
        getter collection_arn : String

        # Contains the names of the fields to which to map information about the vector store.

        @[JSON::Field(key: "fieldMapping")]
        getter field_mapping : Types::OpenSearchServerlessFieldMapping

        # The name of the vector store.

        @[JSON::Field(key: "vectorIndexName")]
        getter vector_index_name : String

        def initialize(
          @collection_arn : String,
          @field_mapping : Types::OpenSearchServerlessFieldMapping,
          @vector_index_name : String
        )
        end
      end

      # Contains the names of the fields to which to map information about the vector store.

      struct OpenSearchServerlessFieldMapping
        include JSON::Serializable

        # The name of the field in which Amazon Bedrock stores metadata about the vector store.

        @[JSON::Field(key: "metadataField")]
        getter metadata_field : String

        # The name of the field in which Amazon Bedrock stores the raw text from your data. The text is split
        # according to the chunking strategy you choose.

        @[JSON::Field(key: "textField")]
        getter text_field : String

        # The name of the field in which Amazon Bedrock stores the vector embeddings for your data sources.

        @[JSON::Field(key: "vectorField")]
        getter vector_field : String

        def initialize(
          @metadata_field : String,
          @text_field : String,
          @vector_field : String
        )
        end
      end

      # Contains details about the Lambda function containing the orchestration logic carried out upon
      # invoking the custom orchestration.

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

      # Contains configurations for an output flow node in the flow. You specify the data type expected for
      # the input into the node in the type field and how to return the final output in the expression
      # field.

      struct OutputFlowNodeConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # Contains details about a parameter in a function for an action group. This data type is used in the
      # following API operations: CreateAgentActionGroup request CreateAgentActionGroup response
      # UpdateAgentActionGroup request UpdateAgentActionGroup response GetAgentActionGroup response

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

      # Settings for parsing document contents. If you exclude this field, the default parser converts the
      # contents of each document into text before splitting it into chunks. Specify the parsing strategy to
      # use in the parsingStrategy field and include the relevant configuration, or omit it to use the
      # Amazon Bedrock default parser. For more information, see Parsing options for your data source . If
      # you specify BEDROCK_DATA_AUTOMATION or BEDROCK_FOUNDATION_MODEL and it fails to parse a file, the
      # Amazon Bedrock default parser will be used instead.

      struct ParsingConfiguration
        include JSON::Serializable

        # The parsing strategy for the data source.

        @[JSON::Field(key: "parsingStrategy")]
        getter parsing_strategy : String

        # If you specify BEDROCK_DATA_AUTOMATION as the parsing strategy for ingesting your data source, use
        # this object to modify configurations for using the Amazon Bedrock Data Automation parser.

        @[JSON::Field(key: "bedrockDataAutomationConfiguration")]
        getter bedrock_data_automation_configuration : Types::BedrockDataAutomationConfiguration?

        # If you specify BEDROCK_FOUNDATION_MODEL as the parsing strategy for ingesting your data source, use
        # this object to modify configurations for using a foundation model to parse documents.

        @[JSON::Field(key: "bedrockFoundationModelConfiguration")]
        getter bedrock_foundation_model_configuration : Types::BedrockFoundationModelConfiguration?

        def initialize(
          @parsing_strategy : String,
          @bedrock_data_automation_configuration : Types::BedrockDataAutomationConfiguration? = nil,
          @bedrock_foundation_model_configuration : Types::BedrockFoundationModelConfiguration? = nil
        )
        end
      end

      # Instructions for interpreting the contents of a document.

      struct ParsingPrompt
        include JSON::Serializable

        # Instructions for interpreting the contents of a document.

        @[JSON::Field(key: "parsingPromptText")]
        getter parsing_prompt_text : String

        def initialize(
          @parsing_prompt_text : String
        )
        end
      end

      # The specific filters applied to your data source content. You can filter out or include certain
      # content.

      struct PatternObjectFilter
        include JSON::Serializable

        # The supported object type or content type of the data source.

        @[JSON::Field(key: "objectType")]
        getter object_type : String

        # A list of one or more exclusion regular expression patterns to exclude certain object types that
        # adhere to the pattern. If you specify an inclusion and exclusion filter/pattern and both match a
        # document, the exclusion filter takes precedence and the document isn’t crawled.

        @[JSON::Field(key: "exclusionFilters")]
        getter exclusion_filters : Array(String)?

        # A list of one or more inclusion regular expression patterns to include certain object types that
        # adhere to the pattern. If you specify an inclusion and exclusion filter/pattern and both match a
        # document, the exclusion filter takes precedence and the document isn’t crawled.

        @[JSON::Field(key: "inclusionFilters")]
        getter inclusion_filters : Array(String)?

        def initialize(
          @object_type : String,
          @exclusion_filters : Array(String)? = nil,
          @inclusion_filters : Array(String)? = nil
        )
        end
      end

      # The configuration of filtering certain objects or content types of the data source.

      struct PatternObjectFilterConfiguration
        include JSON::Serializable

        # The configuration of specific filters applied to your data source content. You can filter out or
        # include certain content.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::PatternObjectFilter)

        def initialize(
          @filters : Array(Types::PatternObjectFilter)
        )
        end
      end

      # The performance-related configuration options for the knowledge base retrieval and generation
      # process.

      struct PerformanceConfiguration
        include JSON::Serializable

        # The latency optimization setting.

        @[JSON::Field(key: "latency")]
        getter latency : String?

        def initialize(
          @latency : String? = nil
        )
        end
      end

      # Contains details about the storage configuration of the knowledge base in Pinecone. For more
      # information, see Create a vector index in Pinecone .

      struct PineconeConfiguration
        include JSON::Serializable

        # The endpoint URL for your index management page.

        @[JSON::Field(key: "connectionString")]
        getter connection_string : String

        # The Amazon Resource Name (ARN) of the secret that you created in Secrets Manager that is linked to
        # your Pinecone API key.

        @[JSON::Field(key: "credentialsSecretArn")]
        getter credentials_secret_arn : String

        # Contains the names of the fields to which to map information about the vector store.

        @[JSON::Field(key: "fieldMapping")]
        getter field_mapping : Types::PineconeFieldMapping

        # The namespace to be used to write new data to your database.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @connection_string : String,
          @credentials_secret_arn : String,
          @field_mapping : Types::PineconeFieldMapping,
          @namespace : String? = nil
        )
        end
      end

      # Contains the names of the fields to which to map information about the vector store.

      struct PineconeFieldMapping
        include JSON::Serializable

        # The name of the field in which Amazon Bedrock stores metadata about the vector store.

        @[JSON::Field(key: "metadataField")]
        getter metadata_field : String

        # The name of the field in which Amazon Bedrock stores the raw text from your data. The text is split
        # according to the chunking strategy you choose.

        @[JSON::Field(key: "textField")]
        getter text_field : String

        def initialize(
          @metadata_field : String,
          @text_field : String
        )
        end
      end


      struct PrepareAgentRequest
        include JSON::Serializable

        # The unique identifier of the agent for which to create a DRAFT version.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        def initialize(
          @agent_id : String
        )
        end
      end


      struct PrepareAgentResponse
        include JSON::Serializable

        # The unique identifier of the agent for which the DRAFT version was created.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The status of the DRAFT version and whether it is ready for use.

        @[JSON::Field(key: "agentStatus")]
        getter agent_status : String

        # The version of the agent.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The time at which the DRAFT version of the agent was last prepared.

        @[JSON::Field(key: "preparedAt")]
        getter prepared_at : Time

        def initialize(
          @agent_id : String,
          @agent_status : String,
          @agent_version : String,
          @prepared_at : Time
        )
        end
      end


      struct PrepareFlowRequest
        include JSON::Serializable

        # The unique identifier of the flow.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        def initialize(
          @flow_identifier : String
        )
        end
      end


      struct PrepareFlowResponse
        include JSON::Serializable

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the flow. When you submit this request, the status will be NotPrepared . If
        # preparation succeeds, the status becomes Prepared . If it fails, the status becomes FAILED .

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @id : String,
          @status : String
        )
        end
      end

      # Contains specifications for an Amazon Bedrock agent with which to use the prompt. For more
      # information, see Create a prompt using Prompt management and Automate tasks in your application
      # using conversational agents .

      struct PromptAgentResource
        include JSON::Serializable

        # The ARN of the agent with which to use the prompt.

        @[JSON::Field(key: "agentIdentifier")]
        getter agent_identifier : String

        def initialize(
          @agent_identifier : String
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

        # The agent's foundation model.

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

        # Specifies whether to allow the agent to carry out the step specified in the promptType . If you set
        # this value to DISABLED , the agent skips that step. The default state for each promptType is as
        # follows. PRE_PROCESSING – DISABLED ORCHESTRATION – ENABLED KNOWLEDGE_BASE_RESPONSE_GENERATION –
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

      # Contains configurations for a prompt node in the flow. You can use a prompt from Prompt management
      # or you can define one in this node. If the prompt contains variables, the inputs into this node will
      # fill in the variables. The output from this node is the response generated by the model. For more
      # information, see Node types in a flow in the Amazon Bedrock User Guide.

      struct PromptFlowNodeConfiguration
        include JSON::Serializable

        # Specifies whether the prompt is from Prompt management or defined inline.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::PromptFlowNodeSourceConfiguration

        # Contains configurations for a guardrail to apply to the prompt in this node and the response
        # generated from it.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        def initialize(
          @source_configuration : Types::PromptFlowNodeSourceConfiguration,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil
        )
        end
      end

      # Contains configurations for a prompt defined inline in the node.

      struct PromptFlowNodeInlineConfiguration
        include JSON::Serializable

        # The unique identifier of the model or inference profile to run inference with.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Contains a prompt and variables in the prompt that can be replaced with values at runtime.

        @[JSON::Field(key: "templateConfiguration")]
        getter template_configuration : Types::PromptTemplateConfiguration

        # The type of prompt template.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # Additional fields to be included in the model request for the Prompt node.

        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Types::Document?

        # Contains inference configurations for the prompt.

        @[JSON::Field(key: "inferenceConfiguration")]
        getter inference_configuration : Types::PromptInferenceConfiguration?

        def initialize(
          @model_id : String,
          @template_configuration : Types::PromptTemplateConfiguration,
          @template_type : String,
          @additional_model_request_fields : Types::Document? = nil,
          @inference_configuration : Types::PromptInferenceConfiguration? = nil
        )
        end
      end

      # Contains configurations for a prompt from Prompt management to use in a node.

      struct PromptFlowNodeResourceConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the prompt from Prompt management.

        @[JSON::Field(key: "promptArn")]
        getter prompt_arn : String

        def initialize(
          @prompt_arn : String
        )
        end
      end

      # Contains configurations for a prompt and whether it is from Prompt management or defined inline.

      struct PromptFlowNodeSourceConfiguration
        include JSON::Serializable

        # Contains configurations for a prompt that is defined inline

        @[JSON::Field(key: "inline")]
        getter inline : Types::PromptFlowNodeInlineConfiguration?

        # Contains configurations for a prompt from Prompt management.

        @[JSON::Field(key: "resource")]
        getter resource : Types::PromptFlowNodeResourceConfiguration?

        def initialize(
          @inline : Types::PromptFlowNodeInlineConfiguration? = nil,
          @resource : Types::PromptFlowNodeResourceConfiguration? = nil
        )
        end
      end

      # Contains specifications for a generative AI resource with which to use the prompt. For more
      # information, see Create a prompt using Prompt management .

      struct PromptGenAiResource
        include JSON::Serializable

        # Specifies an Amazon Bedrock agent with which to use the prompt.

        @[JSON::Field(key: "agent")]
        getter agent : Types::PromptAgentResource?

        def initialize(
          @agent : Types::PromptAgentResource? = nil
        )
        end
      end

      # Contains inference configurations for the prompt.

      struct PromptInferenceConfiguration
        include JSON::Serializable

        # Contains inference configurations for a text prompt.

        @[JSON::Field(key: "text")]
        getter text : Types::PromptModelInferenceConfiguration?

        def initialize(
          @text : Types::PromptModelInferenceConfiguration? = nil
        )
        end
      end

      # Contains information about a variable in the prompt.

      struct PromptInputVariable
        include JSON::Serializable

        # The name of the variable.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Contains a key-value pair that defines a metadata tag and value to attach to a prompt variant. For
      # more information, see Create a prompt using Prompt management .

      struct PromptMetadataEntry
        include JSON::Serializable

        # The key of a metadata tag for a prompt variant.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of a metadata tag for a prompt variant.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Contains inference configurations related to model inference for a prompt. For more information, see
      # Inference parameters .

      struct PromptModelInferenceConfiguration
        include JSON::Serializable

        # The maximum number of tokens to return in the response.

        @[JSON::Field(key: "maxTokens")]
        getter max_tokens : Int32?

        # A list of strings that define sequences after which the model will stop generating.

        @[JSON::Field(key: "stopSequences")]
        getter stop_sequences : Array(String)?

        # Controls the randomness of the response. Choose a lower value for more predictable outputs and a
        # higher value for more surprising outputs.

        @[JSON::Field(key: "temperature")]
        getter temperature : Float64?

        # The percentage of most-likely candidates that the model considers for the next token.

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

      # Contains information about a prompt in your Prompt management tool. This data type is used in the
      # following API operations: ListPrompts response

      struct PromptSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the prompt or the prompt version (if you specified a version in
        # the request).

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the prompt was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the prompt.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the prompt.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time at which the prompt was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the prompt that this summary applies to.

        @[JSON::Field(key: "version")]
        getter version : String

        # The description of the prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @updated_at : Time,
          @version : String,
          @description : String? = nil
        )
        end
      end

      # Contains the message for a prompt. For more information, see Construct and store reusable prompts
      # with Prompt management in Amazon Bedrock .

      struct PromptTemplateConfiguration
        include JSON::Serializable

        # Contains configurations to use the prompt in a conversational format.

        @[JSON::Field(key: "chat")]
        getter chat : Types::ChatPromptTemplateConfiguration?

        # Contains configurations for the text in a message for a prompt.

        @[JSON::Field(key: "text")]
        getter text : Types::TextPromptTemplateConfiguration?

        def initialize(
          @chat : Types::ChatPromptTemplateConfiguration? = nil,
          @text : Types::TextPromptTemplateConfiguration? = nil
        )
        end
      end

      # Contains details about a variant of the prompt.

      struct PromptVariant
        include JSON::Serializable

        # The name of the prompt variant.

        @[JSON::Field(key: "name")]
        getter name : String

        # Contains configurations for the prompt template.

        @[JSON::Field(key: "templateConfiguration")]
        getter template_configuration : Types::PromptTemplateConfiguration

        # The type of prompt template to use.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # Contains model-specific inference configurations that aren't in the inferenceConfiguration field. To
        # see model-specific inference parameters, see Inference request parameters and response fields for
        # foundation models .

        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Types::Document?

        # Specifies a generative AI resource with which to use the prompt.

        @[JSON::Field(key: "genAiResource")]
        getter gen_ai_resource : Types::PromptGenAiResource?

        # Contains inference configurations for the prompt variant.

        @[JSON::Field(key: "inferenceConfiguration")]
        getter inference_configuration : Types::PromptInferenceConfiguration?

        # An array of objects, each containing a key-value pair that defines a metadata tag and value to
        # attach to a prompt variant.

        @[JSON::Field(key: "metadata")]
        getter metadata : Array(Types::PromptMetadataEntry)?

        # The unique identifier of the model or inference profile with which to run inference on the prompt.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        def initialize(
          @name : String,
          @template_configuration : Types::PromptTemplateConfiguration,
          @template_type : String,
          @additional_model_request_fields : Types::Document? = nil,
          @gen_ai_resource : Types::PromptGenAiResource? = nil,
          @inference_configuration : Types::PromptInferenceConfiguration? = nil,
          @metadata : Array(Types::PromptMetadataEntry)? = nil,
          @model_id : String? = nil
        )
        end
      end

      # Contains information about a column in the current table for the query engine to consider.

      struct QueryGenerationColumn
        include JSON::Serializable

        # A description of the column that helps the query engine understand the contents of the column.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether to include or exclude the column during query generation. If you specify EXCLUDE ,
        # the column will be ignored. If you specify INCLUDE , all other columns in the table will be ignored.

        @[JSON::Field(key: "inclusion")]
        getter inclusion : String?

        # The name of the column for which the other fields in this object apply.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @description : String? = nil,
          @inclusion : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains configurations for query generation. For more information, see Build a knowledge base by
      # connecting to a structured data source in the Amazon Bedrock User Guide..

      struct QueryGenerationConfiguration
        include JSON::Serializable

        # The time after which query generation will time out.

        @[JSON::Field(key: "executionTimeoutSeconds")]
        getter execution_timeout_seconds : Int32?

        # Specifies configurations for context to use during query generation.

        @[JSON::Field(key: "generationContext")]
        getter generation_context : Types::QueryGenerationContext?

        def initialize(
          @execution_timeout_seconds : Int32? = nil,
          @generation_context : Types::QueryGenerationContext? = nil
        )
        end
      end

      # &gt;Contains configurations for context to use during query generation.

      struct QueryGenerationContext
        include JSON::Serializable

        # An array of objects, each of which defines information about example queries to help the query
        # engine generate appropriate SQL queries.

        @[JSON::Field(key: "curatedQueries")]
        getter curated_queries : Array(Types::CuratedQuery)?

        # An array of objects, each of which defines information about a table in the database.

        @[JSON::Field(key: "tables")]
        getter tables : Array(Types::QueryGenerationTable)?

        def initialize(
          @curated_queries : Array(Types::CuratedQuery)? = nil,
          @tables : Array(Types::QueryGenerationTable)? = nil
        )
        end
      end

      # Contains information about a table for the query engine to consider.

      struct QueryGenerationTable
        include JSON::Serializable

        # The name of the table for which the other fields in this object apply.

        @[JSON::Field(key: "name")]
        getter name : String

        # An array of objects, each of which defines information about a column in the table.

        @[JSON::Field(key: "columns")]
        getter columns : Array(Types::QueryGenerationColumn)?

        # A description of the table that helps the query engine understand the contents of the table.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether to include or exclude the table during query generation. If you specify EXCLUDE ,
        # the table will be ignored. If you specify INCLUDE , all other tables will be ignored.

        @[JSON::Field(key: "inclusion")]
        getter inclusion : String?

        def initialize(
          @name : String,
          @columns : Array(Types::QueryGenerationColumn)? = nil,
          @description : String? = nil,
          @inclusion : String? = nil
        )
        end
      end

      # Contains details about the storage configuration of the knowledge base in Amazon RDS. For more
      # information, see Create a vector index in Amazon RDS .

      struct RdsConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret that you created in Secrets Manager that is linked to
        # your Amazon RDS database.

        @[JSON::Field(key: "credentialsSecretArn")]
        getter credentials_secret_arn : String

        # The name of your Amazon RDS database.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # Contains the names of the fields to which to map information about the vector store.

        @[JSON::Field(key: "fieldMapping")]
        getter field_mapping : Types::RdsFieldMapping

        # The Amazon Resource Name (ARN) of the vector store.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name of the table in the database.

        @[JSON::Field(key: "tableName")]
        getter table_name : String

        def initialize(
          @credentials_secret_arn : String,
          @database_name : String,
          @field_mapping : Types::RdsFieldMapping,
          @resource_arn : String,
          @table_name : String
        )
        end
      end

      # Contains the names of the fields to which to map information about the vector store.

      struct RdsFieldMapping
        include JSON::Serializable

        # The name of the field in which Amazon Bedrock stores metadata about the vector store.

        @[JSON::Field(key: "metadataField")]
        getter metadata_field : String

        # The name of the field in which Amazon Bedrock stores the ID for each entry.

        @[JSON::Field(key: "primaryKeyField")]
        getter primary_key_field : String

        # The name of the field in which Amazon Bedrock stores the raw text from your data. The text is split
        # according to the chunking strategy you choose.

        @[JSON::Field(key: "textField")]
        getter text_field : String

        # The name of the field in which Amazon Bedrock stores the vector embeddings for your data sources.

        @[JSON::Field(key: "vectorField")]
        getter vector_field : String

        # Provide a name for the universal metadata field where Amazon Bedrock will store any custom metadata
        # from your data source.

        @[JSON::Field(key: "customMetadataField")]
        getter custom_metadata_field : String?

        def initialize(
          @metadata_field : String,
          @primary_key_field : String,
          @text_field : String,
          @vector_field : String,
          @custom_metadata_field : String? = nil
        )
        end
      end

      # Contains details about the storage configuration of the knowledge base in Redis Enterprise Cloud.
      # For more information, see Create a vector index in Redis Enterprise Cloud .

      struct RedisEnterpriseCloudConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret that you created in Secrets Manager that is linked to
        # your Redis Enterprise Cloud database.

        @[JSON::Field(key: "credentialsSecretArn")]
        getter credentials_secret_arn : String

        # The endpoint URL of the Redis Enterprise Cloud database.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # Contains the names of the fields to which to map information about the vector store.

        @[JSON::Field(key: "fieldMapping")]
        getter field_mapping : Types::RedisEnterpriseCloudFieldMapping

        # The name of the vector index.

        @[JSON::Field(key: "vectorIndexName")]
        getter vector_index_name : String

        def initialize(
          @credentials_secret_arn : String,
          @endpoint : String,
          @field_mapping : Types::RedisEnterpriseCloudFieldMapping,
          @vector_index_name : String
        )
        end
      end

      # Contains the names of the fields to which to map information about the vector store.

      struct RedisEnterpriseCloudFieldMapping
        include JSON::Serializable

        # The name of the field in which Amazon Bedrock stores metadata about the vector store.

        @[JSON::Field(key: "metadataField")]
        getter metadata_field : String

        # The name of the field in which Amazon Bedrock stores the raw text from your data. The text is split
        # according to the chunking strategy you choose.

        @[JSON::Field(key: "textField")]
        getter text_field : String

        # The name of the field in which Amazon Bedrock stores the vector embeddings for your data sources.

        @[JSON::Field(key: "vectorField")]
        getter vector_field : String

        def initialize(
          @metadata_field : String,
          @text_field : String,
          @vector_field : String
        )
        end
      end

      # Contains configurations for an Amazon Redshift database. For more information, see Build a knowledge
      # base by connecting to a structured data source in the Amazon Bedrock User Guide.

      struct RedshiftConfiguration
        include JSON::Serializable

        # Specifies configurations for an Amazon Redshift query engine.

        @[JSON::Field(key: "queryEngineConfiguration")]
        getter query_engine_configuration : Types::RedshiftQueryEngineConfiguration

        # Specifies configurations for Amazon Redshift database storage.

        @[JSON::Field(key: "storageConfigurations")]
        getter storage_configurations : Array(Types::RedshiftQueryEngineStorageConfiguration)

        # Specifies configurations for generating queries.

        @[JSON::Field(key: "queryGenerationConfiguration")]
        getter query_generation_configuration : Types::QueryGenerationConfiguration?

        def initialize(
          @query_engine_configuration : Types::RedshiftQueryEngineConfiguration,
          @storage_configurations : Array(Types::RedshiftQueryEngineStorageConfiguration),
          @query_generation_configuration : Types::QueryGenerationConfiguration? = nil
        )
        end
      end

      # Contains configurations for authentication to an Amazon Redshift provisioned data warehouse. Specify
      # the type of authentication to use in the type field and include the corresponding field. If you
      # specify IAM authentication, you don't need to include another field.

      struct RedshiftProvisionedAuthConfiguration
        include JSON::Serializable

        # The type of authentication to use.

        @[JSON::Field(key: "type")]
        getter type : String

        # The database username for authentication to an Amazon Redshift provisioned data warehouse.

        @[JSON::Field(key: "databaseUser")]
        getter database_user : String?

        # The ARN of an Secrets Manager secret for authentication.

        @[JSON::Field(key: "usernamePasswordSecretArn")]
        getter username_password_secret_arn : String?

        def initialize(
          @type : String,
          @database_user : String? = nil,
          @username_password_secret_arn : String? = nil
        )
        end
      end

      # Contains configurations for a provisioned Amazon Redshift query engine.

      struct RedshiftProvisionedConfiguration
        include JSON::Serializable

        # Specifies configurations for authentication to Amazon Redshift.

        @[JSON::Field(key: "authConfiguration")]
        getter auth_configuration : Types::RedshiftProvisionedAuthConfiguration

        # The ID of the Amazon Redshift cluster.

        @[JSON::Field(key: "clusterIdentifier")]
        getter cluster_identifier : String

        def initialize(
          @auth_configuration : Types::RedshiftProvisionedAuthConfiguration,
          @cluster_identifier : String
        )
        end
      end

      # Contains configurations for storage in Glue Data Catalog.

      struct RedshiftQueryEngineAwsDataCatalogStorageConfiguration
        include JSON::Serializable

        # A list of names of the tables to use.

        @[JSON::Field(key: "tableNames")]
        getter table_names : Array(String)

        def initialize(
          @table_names : Array(String)
        )
        end
      end

      # Contains configurations for an Amazon Redshift query engine. Specify the type of query engine in
      # type and include the corresponding field. For more information, see Build a knowledge base by
      # connecting to a structured data source in the Amazon Bedrock User Guide.

      struct RedshiftQueryEngineConfiguration
        include JSON::Serializable

        # The type of query engine.

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies configurations for a provisioned Amazon Redshift query engine.

        @[JSON::Field(key: "provisionedConfiguration")]
        getter provisioned_configuration : Types::RedshiftProvisionedConfiguration?

        # Specifies configurations for a serverless Amazon Redshift query engine.

        @[JSON::Field(key: "serverlessConfiguration")]
        getter serverless_configuration : Types::RedshiftServerlessConfiguration?

        def initialize(
          @type : String,
          @provisioned_configuration : Types::RedshiftProvisionedConfiguration? = nil,
          @serverless_configuration : Types::RedshiftServerlessConfiguration? = nil
        )
        end
      end

      # Contains configurations for storage in Amazon Redshift.

      struct RedshiftQueryEngineRedshiftStorageConfiguration
        include JSON::Serializable

        # The name of the Amazon Redshift database.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        def initialize(
          @database_name : String
        )
        end
      end

      # Contains configurations for Amazon Redshift data storage. Specify the data storage service to use in
      # the type field and include the corresponding field. For more information, see Build a knowledge base
      # by connecting to a structured data source in the Amazon Bedrock User Guide.

      struct RedshiftQueryEngineStorageConfiguration
        include JSON::Serializable

        # The data storage service to use.

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies configurations for storage in Glue Data Catalog.

        @[JSON::Field(key: "awsDataCatalogConfiguration")]
        getter aws_data_catalog_configuration : Types::RedshiftQueryEngineAwsDataCatalogStorageConfiguration?

        # Specifies configurations for storage in Amazon Redshift.

        @[JSON::Field(key: "redshiftConfiguration")]
        getter redshift_configuration : Types::RedshiftQueryEngineRedshiftStorageConfiguration?

        def initialize(
          @type : String,
          @aws_data_catalog_configuration : Types::RedshiftQueryEngineAwsDataCatalogStorageConfiguration? = nil,
          @redshift_configuration : Types::RedshiftQueryEngineRedshiftStorageConfiguration? = nil
        )
        end
      end

      # Specifies configurations for authentication to a Redshift Serverless. Specify the type of
      # authentication to use in the type field and include the corresponding field. If you specify IAM
      # authentication, you don't need to include another field.

      struct RedshiftServerlessAuthConfiguration
        include JSON::Serializable

        # The type of authentication to use.

        @[JSON::Field(key: "type")]
        getter type : String

        # The ARN of an Secrets Manager secret for authentication.

        @[JSON::Field(key: "usernamePasswordSecretArn")]
        getter username_password_secret_arn : String?

        def initialize(
          @type : String,
          @username_password_secret_arn : String? = nil
        )
        end
      end

      # Contains configurations for authentication to Amazon Redshift Serverless.

      struct RedshiftServerlessConfiguration
        include JSON::Serializable

        # Specifies configurations for authentication to an Amazon Redshift provisioned data warehouse.

        @[JSON::Field(key: "authConfiguration")]
        getter auth_configuration : Types::RedshiftServerlessAuthConfiguration

        # The ARN of the Amazon Redshift workgroup.

        @[JSON::Field(key: "workgroupArn")]
        getter workgroup_arn : String

        def initialize(
          @auth_configuration : Types::RedshiftServerlessAuthConfiguration,
          @workgroup_arn : String
        )
        end
      end

      # Configures the metadata fields to include or exclude during the reranking process when using
      # selective mode.

      struct RerankingMetadataSelectiveModeConfiguration
        include JSON::Serializable

        # Specifies the metadata fields to exclude from the reranking process.

        @[JSON::Field(key: "fieldsToExclude")]
        getter fields_to_exclude : Array(Types::FieldForReranking)?

        # Specifies the metadata fields to include in the reranking process.

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

      # Contains configurations for a Retrieval node in a flow. This node retrieves data from the Amazon S3
      # location that you specify and returns it as the output.

      struct RetrievalFlowNodeConfiguration
        include JSON::Serializable

        # Contains configurations for the service to use for retrieving data to return as the output from the
        # node.

        @[JSON::Field(key: "serviceConfiguration")]
        getter service_configuration : Types::RetrievalFlowNodeServiceConfiguration

        def initialize(
          @service_configuration : Types::RetrievalFlowNodeServiceConfiguration
        )
        end
      end

      # Contains configurations for the Amazon S3 location from which to retrieve data to return as the
      # output from the node.

      struct RetrievalFlowNodeS3Configuration
        include JSON::Serializable

        # The name of the Amazon S3 bucket from which to retrieve data.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        def initialize(
          @bucket_name : String
        )
        end
      end

      # Contains configurations for the service to use for retrieving data to return as the output from the
      # node.

      struct RetrievalFlowNodeServiceConfiguration
        include JSON::Serializable

        # Contains configurations for the Amazon S3 location from which to retrieve data to return as the
        # output from the node.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::RetrievalFlowNodeS3Configuration?

        def initialize(
          @s3 : Types::RetrievalFlowNodeS3Configuration? = nil
        )
        end
      end

      # Contains information about the content to ingest into a knowledge base connected to an Amazon S3
      # data source.

      struct S3Content
        include JSON::Serializable

        # The S3 location of the file containing the content to ingest.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location

        def initialize(
          @s3_location : Types::S3Location
        )
        end
      end

      # The configuration information to connect to Amazon S3 as your data source.

      struct S3DataSourceConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 bucket that contains your data.

        @[JSON::Field(key: "bucketArn")]
        getter bucket_arn : String

        # The account ID for the owner of the S3 bucket.

        @[JSON::Field(key: "bucketOwnerAccountId")]
        getter bucket_owner_account_id : String?

        # A list of S3 prefixes to include certain files or content. For more information, see Organizing
        # objects using prefixes .

        @[JSON::Field(key: "inclusionPrefixes")]
        getter inclusion_prefixes : Array(String)?

        def initialize(
          @bucket_arn : String,
          @bucket_owner_account_id : String? = nil,
          @inclusion_prefixes : Array(String)? = nil
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

      # An Amazon S3 location.

      struct S3Location
        include JSON::Serializable

        # The location's URI. For example, s3://my-bucket/chunk-processor/ .

        @[JSON::Field(key: "uri")]
        getter uri : String

        def initialize(
          @uri : String
        )
        end
      end

      # Contains the storage configuration of the knowledge base for S3 vectors.

      struct S3VectorsConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the vector index used for the knowledge base. This ARN identifies
        # the specific vector index resource within Amazon Bedrock.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The name of the vector index used for the knowledge base. This name identifies the vector index
        # within the Amazon Bedrock service.

        @[JSON::Field(key: "indexName")]
        getter index_name : String?

        # The Amazon Resource Name (ARN) of the S3 bucket where vector embeddings are stored. This bucket
        # contains the vector data used by the knowledge base.

        @[JSON::Field(key: "vectorBucketArn")]
        getter vector_bucket_arn : String?

        def initialize(
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @vector_bucket_arn : String? = nil
        )
        end
      end

      # The configuration of the Salesforce content. For example, configuring specific types of Salesforce
      # content.

      struct SalesforceCrawlerConfiguration
        include JSON::Serializable

        # The configuration of filtering the Salesforce content. For example, configuring regular expression
        # patterns to include or exclude certain content.

        @[JSON::Field(key: "filterConfiguration")]
        getter filter_configuration : Types::CrawlFilterConfiguration?

        def initialize(
          @filter_configuration : Types::CrawlFilterConfiguration? = nil
        )
        end
      end

      # The configuration information to connect to Salesforce as your data source.

      struct SalesforceDataSourceConfiguration
        include JSON::Serializable

        # The endpoint information to connect to your Salesforce data source.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::SalesforceSourceConfiguration

        # The configuration of the Salesforce content. For example, configuring specific types of Salesforce
        # content.

        @[JSON::Field(key: "crawlerConfiguration")]
        getter crawler_configuration : Types::SalesforceCrawlerConfiguration?

        def initialize(
          @source_configuration : Types::SalesforceSourceConfiguration,
          @crawler_configuration : Types::SalesforceCrawlerConfiguration? = nil
        )
        end
      end

      # The endpoint information to connect to your Salesforce data source.

      struct SalesforceSourceConfiguration
        include JSON::Serializable

        # The supported authentication type to authenticate and connect to your Salesforce instance.

        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # The Amazon Resource Name of an Secrets Manager secret that stores your authentication credentials
        # for your Salesforce instance URL. For more information on the key-value pairs that must be included
        # in your secret, depending on your authentication type, see Salesforce connection configuration .

        @[JSON::Field(key: "credentialsSecretArn")]
        getter credentials_secret_arn : String

        # The Salesforce host URL or instance URL.

        @[JSON::Field(key: "hostUrl")]
        getter host_url : String

        def initialize(
          @auth_type : String,
          @credentials_secret_arn : String,
          @host_url : String
        )
        end
      end

      # The seed or starting point URL. You should be authorized to crawl the URL.

      struct SeedUrl
        include JSON::Serializable

        # A seed or starting point URL.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # Settings for semantic document chunking for a data source. Semantic chunking splits a document into
      # into smaller documents based on groups of similar content derived from the text with natural
      # language processing. With semantic chunking, each sentence is compared to the next to determine how
      # similar they are. You specify a threshold in the form of a percentile, where adjacent sentences that
      # are less similar than that percentage of sentence pairs are divided into separate chunks. For
      # example, if you set the threshold to 90, then the 10 percent of sentence pairs that are least
      # similar are split. So if you have 101 sentences, 100 sentence pairs are compared, and the 10 with
      # the least similarity are split, creating 11 chunks. These chunks are further split if they exceed
      # the max token size. You must also specify a buffer size, which determines whether sentences are
      # compared in isolation, or within a moving context window that includes the previous and following
      # sentence. For example, if you set the buffer size to 1 , the embedding for sentence 10 is derived
      # from sentences 9, 10, and 11 combined.

      struct SemanticChunkingConfiguration
        include JSON::Serializable

        # The dissimilarity threshold for splitting chunks.

        @[JSON::Field(key: "breakpointPercentileThreshold")]
        getter breakpoint_percentile_threshold : Int32

        # The buffer size.

        @[JSON::Field(key: "bufferSize")]
        getter buffer_size : Int32

        # The maximum number of tokens that a chunk can contain.

        @[JSON::Field(key: "maxTokens")]
        getter max_tokens : Int32

        def initialize(
          @breakpoint_percentile_threshold : Int32,
          @buffer_size : Int32,
          @max_tokens : Int32
        )
        end
      end

      # Contains the configuration for server-side encryption.

      struct ServerSideEncryptionConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the resource.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @kms_key_arn : String? = nil
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

      # Configuration for SESSION_SUMMARY memory type enabled for the agent.

      struct SessionSummaryConfiguration
        include JSON::Serializable

        # Maximum number of recent session summaries to include in the agent's prompt context.

        @[JSON::Field(key: "maxRecentSessions")]
        getter max_recent_sessions : Int32?

        def initialize(
          @max_recent_sessions : Int32? = nil
        )
        end
      end

      # The configuration of the SharePoint content. For example, configuring specific types of SharePoint
      # content.

      struct SharePointCrawlerConfiguration
        include JSON::Serializable

        # The configuration of filtering the SharePoint content. For example, configuring regular expression
        # patterns to include or exclude certain content.

        @[JSON::Field(key: "filterConfiguration")]
        getter filter_configuration : Types::CrawlFilterConfiguration?

        def initialize(
          @filter_configuration : Types::CrawlFilterConfiguration? = nil
        )
        end
      end

      # The configuration information to connect to SharePoint as your data source.

      struct SharePointDataSourceConfiguration
        include JSON::Serializable

        # The endpoint information to connect to your SharePoint data source.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::SharePointSourceConfiguration

        # The configuration of the SharePoint content. For example, configuring specific types of SharePoint
        # content.

        @[JSON::Field(key: "crawlerConfiguration")]
        getter crawler_configuration : Types::SharePointCrawlerConfiguration?

        def initialize(
          @source_configuration : Types::SharePointSourceConfiguration,
          @crawler_configuration : Types::SharePointCrawlerConfiguration? = nil
        )
        end
      end

      # The endpoint information to connect to your SharePoint data source.

      struct SharePointSourceConfiguration
        include JSON::Serializable

        # The supported authentication type to authenticate and connect to your SharePoint site/sites.

        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # The Amazon Resource Name of an Secrets Manager secret that stores your authentication credentials
        # for your SharePoint site/sites. For more information on the key-value pairs that must be included in
        # your secret, depending on your authentication type, see SharePoint connection configuration .

        @[JSON::Field(key: "credentialsSecretArn")]
        getter credentials_secret_arn : String

        # The domain of your SharePoint instance or site URL/URLs.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The supported host type, whether online/cloud or server/on-premises.

        @[JSON::Field(key: "hostType")]
        getter host_type : String

        # A list of one or more SharePoint site URLs.

        @[JSON::Field(key: "siteUrls")]
        getter site_urls : Array(String)

        # The identifier of your Microsoft 365 tenant.

        @[JSON::Field(key: "tenantId")]
        getter tenant_id : String?

        def initialize(
          @auth_type : String,
          @credentials_secret_arn : String,
          @domain : String,
          @host_type : String,
          @site_urls : Array(String),
          @tenant_id : String? = nil
        )
        end
      end

      # Defines a specific tool that the model must request. No text is generated but the results of tool
      # use are sent back to the model to help generate a response. For more information, see Use a tool to
      # complete an Amazon Bedrock model response .

      struct SpecificToolChoice
        include JSON::Serializable

        # The name of the tool.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Contains configurations for a knowledge base connected to an SQL database. Specify the SQL database
      # type in the type field and include the corresponding field. For more information, see Build a
      # knowledge base by connecting to a structured data source in the Amazon Bedrock User Guide.

      struct SqlKnowledgeBaseConfiguration
        include JSON::Serializable

        # The type of SQL database to connect to the knowledge base.

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies configurations for a knowledge base connected to an Amazon Redshift database.

        @[JSON::Field(key: "redshiftConfiguration")]
        getter redshift_configuration : Types::RedshiftConfiguration?

        def initialize(
          @type : String,
          @redshift_configuration : Types::RedshiftConfiguration? = nil
        )
        end
      end


      struct StartIngestionJobRequest
        include JSON::Serializable

        # The unique identifier of the data source you want to ingest into your knowledge base.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the knowledge base for the data ingestion job.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the data ingestion job.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @data_source_id : String,
          @knowledge_base_id : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct StartIngestionJobResponse
        include JSON::Serializable

        # Contains information about the data ingestion job.

        @[JSON::Field(key: "ingestionJob")]
        getter ingestion_job : Types::IngestionJob

        def initialize(
          @ingestion_job : Types::IngestionJob
        )
        end
      end


      struct StopIngestionJobRequest
        include JSON::Serializable

        # The unique identifier of the data source for the data ingestion job you want to stop.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the data ingestion job you want to stop.

        @[JSON::Field(key: "ingestionJobId")]
        getter ingestion_job_id : String

        # The unique identifier of the knowledge base for the data ingestion job you want to stop.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @data_source_id : String,
          @ingestion_job_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct StopIngestionJobResponse
        include JSON::Serializable

        # Contains information about the stopped data ingestion job.

        @[JSON::Field(key: "ingestionJob")]
        getter ingestion_job : Types::IngestionJob

        def initialize(
          @ingestion_job : Types::IngestionJob
        )
        end
      end

      # Contains the storage configuration of the knowledge base.

      struct StorageConfiguration
        include JSON::Serializable

        # The vector store service in which the knowledge base is stored.

        @[JSON::Field(key: "type")]
        getter type : String

        # Contains the storage configuration of the knowledge base in MongoDB Atlas.

        @[JSON::Field(key: "mongoDbAtlasConfiguration")]
        getter mongo_db_atlas_configuration : Types::MongoDbAtlasConfiguration?

        # Contains details about the Neptune Analytics configuration of the knowledge base in Amazon Neptune.
        # For more information, see Create a vector index in Amazon Neptune Analytics. .

        @[JSON::Field(key: "neptuneAnalyticsConfiguration")]
        getter neptune_analytics_configuration : Types::NeptuneAnalyticsConfiguration?

        # Contains details about the storage configuration of the knowledge base in OpenSearch Managed
        # Cluster. For more information, see Create a vector index in Amazon OpenSearch Service .

        @[JSON::Field(key: "opensearchManagedClusterConfiguration")]
        getter opensearch_managed_cluster_configuration : Types::OpenSearchManagedClusterConfiguration?

        # Contains the storage configuration of the knowledge base in Amazon OpenSearch Service.

        @[JSON::Field(key: "opensearchServerlessConfiguration")]
        getter opensearch_serverless_configuration : Types::OpenSearchServerlessConfiguration?

        # Contains the storage configuration of the knowledge base in Pinecone.

        @[JSON::Field(key: "pineconeConfiguration")]
        getter pinecone_configuration : Types::PineconeConfiguration?

        # Contains details about the storage configuration of the knowledge base in Amazon RDS. For more
        # information, see Create a vector index in Amazon RDS .

        @[JSON::Field(key: "rdsConfiguration")]
        getter rds_configuration : Types::RdsConfiguration?

        # Contains the storage configuration of the knowledge base in Redis Enterprise Cloud.

        @[JSON::Field(key: "redisEnterpriseCloudConfiguration")]
        getter redis_enterprise_cloud_configuration : Types::RedisEnterpriseCloudConfiguration?

        # The configuration settings for storing knowledge base data using S3 vectors. This includes vector
        # index information and S3 bucket details for vector storage.

        @[JSON::Field(key: "s3VectorsConfiguration")]
        getter s3_vectors_configuration : Types::S3VectorsConfiguration?

        def initialize(
          @type : String,
          @mongo_db_atlas_configuration : Types::MongoDbAtlasConfiguration? = nil,
          @neptune_analytics_configuration : Types::NeptuneAnalyticsConfiguration? = nil,
          @opensearch_managed_cluster_configuration : Types::OpenSearchManagedClusterConfiguration? = nil,
          @opensearch_serverless_configuration : Types::OpenSearchServerlessConfiguration? = nil,
          @pinecone_configuration : Types::PineconeConfiguration? = nil,
          @rds_configuration : Types::RdsConfiguration? = nil,
          @redis_enterprise_cloud_configuration : Types::RedisEnterpriseCloudConfiguration? = nil,
          @s3_vectors_configuration : Types::S3VectorsConfiguration? = nil
        )
        end
      end

      # Contains configurations for a Storage node in a flow. This node stores the input in an Amazon S3
      # location that you specify.

      struct StorageFlowNodeConfiguration
        include JSON::Serializable

        # Contains configurations for the service to use for storing the input into the node.

        @[JSON::Field(key: "serviceConfiguration")]
        getter service_configuration : Types::StorageFlowNodeServiceConfiguration

        def initialize(
          @service_configuration : Types::StorageFlowNodeServiceConfiguration
        )
        end
      end

      # Contains configurations for the Amazon S3 location in which to store the input into the node.

      struct StorageFlowNodeS3Configuration
        include JSON::Serializable

        # The name of the Amazon S3 bucket in which to store the input into the node.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        def initialize(
          @bucket_name : String
        )
        end
      end

      # Contains configurations for the service to use for storing the input into the node.

      struct StorageFlowNodeServiceConfiguration
        include JSON::Serializable

        # Contains configurations for the Amazon S3 location in which to store the input into the node.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::StorageFlowNodeS3Configuration?

        def initialize(
          @s3 : Types::StorageFlowNodeS3Configuration? = nil
        )
        end
      end

      # Specifies configurations for the storage location of the images extracted from multimodal documents
      # in your data source. These images can be retrieved and returned to the end user.

      struct SupplementalDataStorageConfiguration
        include JSON::Serializable

        # A list of objects specifying storage locations for images extracted from multimodal documents in
        # your data source.

        @[JSON::Field(key: "storageLocations")]
        getter storage_locations : Array(Types::SupplementalDataStorageLocation)

        def initialize(
          @storage_locations : Array(Types::SupplementalDataStorageLocation)
        )
        end
      end

      # Contains information about a storage location for images extracted from multimodal documents in your
      # data source.

      struct SupplementalDataStorageLocation
        include JSON::Serializable

        # Specifies the storage service used for this location.

        @[JSON::Field(key: "type")]
        getter type : String

        # Contains information about the Amazon S3 location for the extracted images.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        def initialize(
          @type : String,
          @s3_location : Types::S3Location? = nil
        )
        end
      end

      # Contains a system prompt to provide context to the model or to describe how it should behave. For
      # more information, see Create a prompt using Prompt management .

      struct SystemContentBlock
        include JSON::Serializable

        # Creates a cache checkpoint within a tool designation

        @[JSON::Field(key: "cachePoint")]
        getter cache_point : Types::CachePointBlock?

        # The text in the system prompt.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @cache_point : Types::CachePointBlock? = nil,
          @text : String? = nil
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

      # Contains information about content defined inline in text.

      struct TextContentDoc
        include JSON::Serializable

        # The text of the content.

        @[JSON::Field(key: "data")]
        getter data : String

        def initialize(
          @data : String
        )
        end
      end

      # Contains configurations for a text prompt template. To include a variable, enclose a word in double
      # curly braces as in {{variable}} .

      struct TextPromptTemplateConfiguration
        include JSON::Serializable

        # The message for the prompt.

        @[JSON::Field(key: "text")]
        getter text : String

        # A cache checkpoint within a template configuration.

        @[JSON::Field(key: "cachePoint")]
        getter cache_point : Types::CachePointBlock?

        # An array of the variables in the prompt template.

        @[JSON::Field(key: "inputVariables")]
        getter input_variables : Array(Types::PromptInputVariable)?

        def initialize(
          @text : String,
          @cache_point : Types::CachePointBlock? = nil,
          @input_variables : Array(Types::PromptInputVariable)? = nil
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

      # Contains configurations for a tool that a model can use when generating a response. For more
      # information, see Use a tool to complete an Amazon Bedrock model response .

      struct Tool
        include JSON::Serializable

        # Creates a cache checkpoint within a tool designation

        @[JSON::Field(key: "cachePoint")]
        getter cache_point : Types::CachePointBlock?

        # The specification for the tool.

        @[JSON::Field(key: "toolSpec")]
        getter tool_spec : Types::ToolSpecification?

        def initialize(
          @cache_point : Types::CachePointBlock? = nil,
          @tool_spec : Types::ToolSpecification? = nil
        )
        end
      end

      # Defines which tools the model should request when invoked. For more information, see Use a tool to
      # complete an Amazon Bedrock model response .

      struct ToolChoice
        include JSON::Serializable

        # Defines tools, at least one of which must be requested by the model. No text is generated but the
        # results of tool use are sent back to the model to help generate a response.

        @[JSON::Field(key: "any")]
        getter any : Types::AnyToolChoice?

        # Defines tools. The model automatically decides whether to call a tool or to generate text instead.

        @[JSON::Field(key: "auto")]
        getter auto : Types::AutoToolChoice?

        # Defines a specific tool that the model must request. No text is generated but the results of tool
        # use are sent back to the model to help generate a response.

        @[JSON::Field(key: "tool")]
        getter tool : Types::SpecificToolChoice?

        def initialize(
          @any : Types::AnyToolChoice? = nil,
          @auto : Types::AutoToolChoice? = nil,
          @tool : Types::SpecificToolChoice? = nil
        )
        end
      end

      # Configuration information for the tools that the model can use when generating a response. For more
      # information, see Use a tool to complete an Amazon Bedrock model response .

      struct ToolConfiguration
        include JSON::Serializable

        # An array of tools to pass to a model.

        @[JSON::Field(key: "tools")]
        getter tools : Array(Types::Tool)

        # Defines which tools the model should request when invoked.

        @[JSON::Field(key: "toolChoice")]
        getter tool_choice : Types::ToolChoice?

        def initialize(
          @tools : Array(Types::Tool),
          @tool_choice : Types::ToolChoice? = nil
        )
        end
      end

      # The input schema for the tool. For more information, see Use a tool to complete an Amazon Bedrock
      # model response .

      struct ToolInputSchema
        include JSON::Serializable

        # A JSON object defining the input schema for the tool.

        @[JSON::Field(key: "json")]
        getter json : Types::Document?

        def initialize(
          @json : Types::Document? = nil
        )
        end
      end

      # Contains a specification for a tool. For more information, see Use a tool to complete an Amazon
      # Bedrock model response .

      struct ToolSpecification
        include JSON::Serializable

        # The input schema for the tool.

        @[JSON::Field(key: "inputSchema")]
        getter input_schema : Types::ToolInputSchema

        # The name of the tool.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the tool.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @input_schema : Types::ToolInputSchema,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # A custom processing step for documents moving through a data source ingestion pipeline. To process
      # documents after they have been converted into chunks, set the step to apply to POST_CHUNKING .

      struct Transformation
        include JSON::Serializable

        # When the service applies the transformation.

        @[JSON::Field(key: "stepToApply")]
        getter step_to_apply : String

        # A Lambda function that processes documents.

        @[JSON::Field(key: "transformationFunction")]
        getter transformation_function : Types::TransformationFunction

        def initialize(
          @step_to_apply : String,
          @transformation_function : Types::TransformationFunction
        )
        end
      end

      # A Lambda function that processes documents.

      struct TransformationFunction
        include JSON::Serializable

        # The Lambda function.

        @[JSON::Field(key: "transformationLambdaConfiguration")]
        getter transformation_lambda_configuration : Types::TransformationLambdaConfiguration

        def initialize(
          @transformation_lambda_configuration : Types::TransformationLambdaConfiguration
        )
        end
      end

      # A Lambda function that processes documents.

      struct TransformationLambdaConfiguration
        include JSON::Serializable

        # The function's ARN identifier.

        @[JSON::Field(key: "lambdaArn")]
        getter lambda_arn : String

        def initialize(
          @lambda_arn : String
        )
        end
      end

      # Details about an unfulfilled node input with no valid connections.

      struct UnfulfilledNodeInputFlowValidationDetails
        include JSON::Serializable

        # The name of the unfulfilled input. An input is unfulfilled if there are no data connections to it.

        @[JSON::Field(key: "input")]
        getter input : String

        # The name of the node containing the unfulfilled input.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @input : String,
          @node : String
        )
        end
      end

      # Details about an unknown condition for a connection.

      struct UnknownConnectionConditionFlowValidationDetails
        include JSON::Serializable

        # The name of the connection with the unknown condition.

        @[JSON::Field(key: "connection")]
        getter connection : String

        def initialize(
          @connection : String
        )
        end
      end

      # Details about an unknown source node for a connection.

      struct UnknownConnectionSourceFlowValidationDetails
        include JSON::Serializable

        # The name of the connection with the unknown source.

        @[JSON::Field(key: "connection")]
        getter connection : String

        def initialize(
          @connection : String
        )
        end
      end

      # Details about an unknown source output for a connection.

      struct UnknownConnectionSourceOutputFlowValidationDetails
        include JSON::Serializable

        # The name of the connection with the unknown source output.

        @[JSON::Field(key: "connection")]
        getter connection : String

        def initialize(
          @connection : String
        )
        end
      end

      # Details about an unknown target node for a connection.

      struct UnknownConnectionTargetFlowValidationDetails
        include JSON::Serializable

        # The name of the connection with the unknown target.

        @[JSON::Field(key: "connection")]
        getter connection : String

        def initialize(
          @connection : String
        )
        end
      end

      # Details about an unknown target input for a connection.

      struct UnknownConnectionTargetInputFlowValidationDetails
        include JSON::Serializable

        # The name of the connection with the unknown target input.

        @[JSON::Field(key: "connection")]
        getter connection : String

        def initialize(
          @connection : String
        )
        end
      end

      # Details about an unknown input for a node.

      struct UnknownNodeInputFlowValidationDetails
        include JSON::Serializable

        # The name of the node with the unknown input.

        @[JSON::Field(key: "input")]
        getter input : String

        # The name of the unknown input.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @input : String,
          @node : String
        )
        end
      end

      # Details about an unknown output for a node.

      struct UnknownNodeOutputFlowValidationDetails
        include JSON::Serializable

        # The name of the node with the unknown output.

        @[JSON::Field(key: "node")]
        getter node : String

        # The name of the unknown output.

        @[JSON::Field(key: "output")]
        getter output : String

        def initialize(
          @node : String,
          @output : String
        )
        end
      end

      # Details about an unreachable node in the flow. A node is unreachable when there are no paths to it
      # from any starting node.

      struct UnreachableNodeFlowValidationDetails
        include JSON::Serializable

        # The name of the unreachable node.

        @[JSON::Field(key: "node")]
        getter node : String

        def initialize(
          @node : String
        )
        end
      end

      # Details about unsatisfied conditions for a connection. A condition is unsatisfied if it can never be
      # true, for example two branches of condition node cannot be simultaneously true.

      struct UnsatisfiedConnectionConditionsFlowValidationDetails
        include JSON::Serializable

        # The name of the connection with unsatisfied conditions.

        @[JSON::Field(key: "connection")]
        getter connection : String

        def initialize(
          @connection : String
        )
        end
      end

      # Details about an unspecified validation that doesn't fit other categories.

      struct UnspecifiedFlowValidationDetails
        include JSON::Serializable

        def initialize
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


      struct UpdateAgentActionGroupRequest
        include JSON::Serializable

        # The unique identifier of the action group.

        @[JSON::Field(key: "actionGroupId")]
        getter action_group_id : String

        # Specifies a new name for the action group.

        @[JSON::Field(key: "actionGroupName")]
        getter action_group_name : String

        # The unique identifier of the agent for which to update the action group.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The unique identifier of the agent version for which to update the action group.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The Amazon Resource Name (ARN) of the Lambda function containing the business logic that is carried
        # out upon invoking the action.

        @[JSON::Field(key: "actionGroupExecutor")]
        getter action_group_executor : Types::ActionGroupExecutor?

        # Specifies whether the action group is available for the agent to invoke or not when sending an
        # InvokeAgent request.

        @[JSON::Field(key: "actionGroupState")]
        getter action_group_state : String?

        # Contains either details about the S3 object containing the OpenAPI schema for the action group or
        # the JSON or YAML-formatted payload defining the schema. For more information, see Action group
        # OpenAPI schemas .

        @[JSON::Field(key: "apiSchema")]
        getter api_schema : Types::APISchema?

        # Specifies a new name for the action group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains details about the function schema for the action group or the JSON or YAML-formatted
        # payload defining the schema.

        @[JSON::Field(key: "functionSchema")]
        getter function_schema : Types::FunctionSchema?

        # Update the built-in or computer use action for this action group. If you specify a value, you must
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
        # During orchestration, if your agent determines that it needs to invoke an API in an action group,
        # but doesn't have enough information to complete the API request, it will invoke this action group
        # instead and return an Observation reprompting the user for more information.

        @[JSON::Field(key: "parentActionGroupSignature")]
        getter parent_action_group_signature : String?

        # The configuration settings for a computer use action. Computer use is a new Anthropic Claude model
        # capability (in beta) available with Claude 3.7 Sonnet and Claude 3.5 Sonnet v2 only. For more
        # information, see Configure an Amazon Bedrock Agent to complete tasks with computer use tools .

        @[JSON::Field(key: "parentActionGroupSignatureParams")]
        getter parent_action_group_signature_params : Hash(String, String)?

        def initialize(
          @action_group_id : String,
          @action_group_name : String,
          @agent_id : String,
          @agent_version : String,
          @action_group_executor : Types::ActionGroupExecutor? = nil,
          @action_group_state : String? = nil,
          @api_schema : Types::APISchema? = nil,
          @description : String? = nil,
          @function_schema : Types::FunctionSchema? = nil,
          @parent_action_group_signature : String? = nil,
          @parent_action_group_signature_params : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateAgentActionGroupResponse
        include JSON::Serializable

        # Contains details about the action group that was updated.

        @[JSON::Field(key: "agentActionGroup")]
        getter agent_action_group : Types::AgentActionGroup

        def initialize(
          @agent_action_group : Types::AgentActionGroup
        )
        end
      end


      struct UpdateAgentAliasRequest
        include JSON::Serializable

        # The unique identifier of the alias.

        @[JSON::Field(key: "agentAliasId")]
        getter agent_alias_id : String

        # Specifies a new name for the alias.

        @[JSON::Field(key: "agentAliasName")]
        getter agent_alias_name : String

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The invocation state for the agent alias. To pause the agent alias, set the value to
        # REJECT_INVOCATIONS . To start the agent alias running again, set the value to ACCEPT_INVOCATIONS .
        # Use the GetAgentAlias , or ListAgentAliases , operation to get the invocation state of an agent
        # alias.

        @[JSON::Field(key: "aliasInvocationState")]
        getter alias_invocation_state : String?

        # Specifies a new description for the alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains details about the routing configuration of the alias.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)?

        def initialize(
          @agent_alias_id : String,
          @agent_alias_name : String,
          @agent_id : String,
          @alias_invocation_state : String? = nil,
          @description : String? = nil,
          @routing_configuration : Array(Types::AgentAliasRoutingConfigurationListItem)? = nil
        )
        end
      end


      struct UpdateAgentAliasResponse
        include JSON::Serializable

        # Contains details about the alias that was updated.

        @[JSON::Field(key: "agentAlias")]
        getter agent_alias : Types::AgentAlias

        def initialize(
          @agent_alias : Types::AgentAlias
        )
        end
      end


      struct UpdateAgentCollaboratorRequest
        include JSON::Serializable

        # An agent descriptor for the agent collaborator.

        @[JSON::Field(key: "agentDescriptor")]
        getter agent_descriptor : Types::AgentDescriptor

        # The agent's ID.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The agent's version.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # Instruction for the collaborator.

        @[JSON::Field(key: "collaborationInstruction")]
        getter collaboration_instruction : String

        # The collaborator's ID.

        @[JSON::Field(key: "collaboratorId")]
        getter collaborator_id : String

        # The collaborator's name.

        @[JSON::Field(key: "collaboratorName")]
        getter collaborator_name : String

        # A relay conversation history for the collaborator.

        @[JSON::Field(key: "relayConversationHistory")]
        getter relay_conversation_history : String?

        def initialize(
          @agent_descriptor : Types::AgentDescriptor,
          @agent_id : String,
          @agent_version : String,
          @collaboration_instruction : String,
          @collaborator_id : String,
          @collaborator_name : String,
          @relay_conversation_history : String? = nil
        )
        end
      end


      struct UpdateAgentCollaboratorResponse
        include JSON::Serializable

        # Details about the collaborator.

        @[JSON::Field(key: "agentCollaborator")]
        getter agent_collaborator : Types::AgentCollaborator

        def initialize(
          @agent_collaborator : Types::AgentCollaborator
        )
        end
      end


      struct UpdateAgentKnowledgeBaseRequest
        include JSON::Serializable

        # The unique identifier of the agent associated with the knowledge base that you want to update.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # The version of the agent associated with the knowledge base that you want to update.

        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String

        # The unique identifier of the knowledge base that has been associated with an agent.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Specifies a new description for the knowledge base associated with an agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether the agent uses the knowledge base or not when sending an InvokeAgent request.

        @[JSON::Field(key: "knowledgeBaseState")]
        getter knowledge_base_state : String?

        def initialize(
          @agent_id : String,
          @agent_version : String,
          @knowledge_base_id : String,
          @description : String? = nil,
          @knowledge_base_state : String? = nil
        )
        end
      end


      struct UpdateAgentKnowledgeBaseResponse
        include JSON::Serializable

        # Contains details about the knowledge base that has been associated with an agent.

        @[JSON::Field(key: "agentKnowledgeBase")]
        getter agent_knowledge_base : Types::AgentKnowledgeBase

        def initialize(
          @agent_knowledge_base : Types::AgentKnowledgeBase
        )
        end
      end


      struct UpdateAgentRequest
        include JSON::Serializable

        # The unique identifier of the agent.

        @[JSON::Field(key: "agentId")]
        getter agent_id : String

        # Specifies a new name for the agent.

        @[JSON::Field(key: "agentName")]
        getter agent_name : String

        # The Amazon Resource Name (ARN) of the IAM role with permissions to invoke API operations on the
        # agent.

        @[JSON::Field(key: "agentResourceRoleArn")]
        getter agent_resource_role_arn : String

        # The identifier for the model that you want to be used for orchestration by the agent you create. The
        # modelId to provide depends on the type of model or throughput that you use: If you use a base model,
        # specify the model ID or its ARN. For a list of model IDs for base models, see Amazon Bedrock base
        # model IDs (on-demand throughput) in the Amazon Bedrock User Guide. If you use an inference profile,
        # specify the inference profile ID or its ARN. For a list of inference profile IDs, see Supported
        # Regions and models for cross-region inference in the Amazon Bedrock User Guide. If you use a
        # provisioned model, specify the ARN of the Provisioned Throughput. For more information, see Run
        # inference using a Provisioned Throughput in the Amazon Bedrock User Guide. If you use a custom
        # model, first purchase Provisioned Throughput for it. Then specify the ARN of the resulting
        # provisioned model. For more information, see Use a custom model in Amazon Bedrock in the Amazon
        # Bedrock User Guide. If you use an imported model , specify the ARN of the imported model. You can
        # get the model ARN from a successful call to CreateModelImportJob or from the Imported models page in
        # the Amazon Bedrock console.

        @[JSON::Field(key: "foundationModel")]
        getter foundation_model : String

        # The agent's collaboration role.

        @[JSON::Field(key: "agentCollaboration")]
        getter agent_collaboration : String?

        # Contains details of the custom orchestration configured for the agent.

        @[JSON::Field(key: "customOrchestration")]
        getter custom_orchestration : Types::CustomOrchestration?

        # The Amazon Resource Name (ARN) of the KMS key with which to encrypt the agent.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # Specifies a new description of the agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique Guardrail configuration assigned to the agent when it is updated.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # The number of seconds for which Amazon Bedrock keeps information about a user's conversation with
        # the agent. A user interaction remains active for the amount of time specified. If no conversation
        # occurs during this time, the session expires and Amazon Bedrock deletes any data provided before the
        # timeout.

        @[JSON::Field(key: "idleSessionTTLInSeconds")]
        getter idle_session_ttl_in_seconds : Int32?

        # Specifies new instructions that tell the agent what it should do and how it should interact with
        # users.

        @[JSON::Field(key: "instruction")]
        getter instruction : String?

        # Specifies the new memory configuration for the agent.

        @[JSON::Field(key: "memoryConfiguration")]
        getter memory_configuration : Types::MemoryConfiguration?

        # Specifies the type of orchestration strategy for the agent. This is set to DEFAULT orchestration
        # type, by default.

        @[JSON::Field(key: "orchestrationType")]
        getter orchestration_type : String?

        # Contains configurations to override prompts in different parts of an agent sequence. For more
        # information, see Advanced prompts .

        @[JSON::Field(key: "promptOverrideConfiguration")]
        getter prompt_override_configuration : Types::PromptOverrideConfiguration?

        def initialize(
          @agent_id : String,
          @agent_name : String,
          @agent_resource_role_arn : String,
          @foundation_model : String,
          @agent_collaboration : String? = nil,
          @custom_orchestration : Types::CustomOrchestration? = nil,
          @customer_encryption_key_arn : String? = nil,
          @description : String? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @idle_session_ttl_in_seconds : Int32? = nil,
          @instruction : String? = nil,
          @memory_configuration : Types::MemoryConfiguration? = nil,
          @orchestration_type : String? = nil,
          @prompt_override_configuration : Types::PromptOverrideConfiguration? = nil
        )
        end
      end


      struct UpdateAgentResponse
        include JSON::Serializable

        # Contains details about the agent that was updated.

        @[JSON::Field(key: "agent")]
        getter agent : Types::Agent

        def initialize(
          @agent : Types::Agent
        )
        end
      end


      struct UpdateDataSourceRequest
        include JSON::Serializable

        # The connection configuration for the data source that you want to update.

        @[JSON::Field(key: "dataSourceConfiguration")]
        getter data_source_configuration : Types::DataSourceConfiguration

        # The unique identifier of the data source.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The unique identifier of the knowledge base for the data source.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Specifies a new name for the data source.

        @[JSON::Field(key: "name")]
        getter name : String

        # The data deletion policy for the data source that you want to update.

        @[JSON::Field(key: "dataDeletionPolicy")]
        getter data_deletion_policy : String?

        # Specifies a new description for the data source.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Contains details about server-side encryption of the data source.

        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # Contains details about how to ingest the documents in the data source.

        @[JSON::Field(key: "vectorIngestionConfiguration")]
        getter vector_ingestion_configuration : Types::VectorIngestionConfiguration?

        def initialize(
          @data_source_configuration : Types::DataSourceConfiguration,
          @data_source_id : String,
          @knowledge_base_id : String,
          @name : String,
          @data_deletion_policy : String? = nil,
          @description : String? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @vector_ingestion_configuration : Types::VectorIngestionConfiguration? = nil
        )
        end
      end


      struct UpdateDataSourceResponse
        include JSON::Serializable

        # Contains details about the data source.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource

        def initialize(
          @data_source : Types::DataSource
        )
        end
      end


      struct UpdateFlowAliasRequest
        include JSON::Serializable

        # The unique identifier of the alias.

        @[JSON::Field(key: "aliasIdentifier")]
        getter alias_identifier : String

        # The unique identifier of the flow.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # The name of the alias.

        @[JSON::Field(key: "name")]
        getter name : String

        # Contains information about the version to which to map the alias.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem)

        # The configuration that specifies how nodes in the flow are executed in parallel.

        @[JSON::Field(key: "concurrencyConfiguration")]
        getter concurrency_configuration : Types::FlowAliasConcurrencyConfiguration?

        # A description for the alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @alias_identifier : String,
          @flow_identifier : String,
          @name : String,
          @routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem),
          @concurrency_configuration : Types::FlowAliasConcurrencyConfiguration? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateFlowAliasResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the flow.

        @[JSON::Field(key: "flowId")]
        getter flow_id : String

        # The unique identifier of the alias.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the alias.

        @[JSON::Field(key: "name")]
        getter name : String

        # Contains information about the version that the alias is mapped to.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem)

        # The time at which the alias was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The configuration that specifies how nodes in the flow are executed in parallel.

        @[JSON::Field(key: "concurrencyConfiguration")]
        getter concurrency_configuration : Types::FlowAliasConcurrencyConfiguration?

        # The description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @flow_id : String,
          @id : String,
          @name : String,
          @routing_configuration : Array(Types::FlowAliasRoutingConfigurationListItem),
          @updated_at : Time,
          @concurrency_configuration : Types::FlowAliasConcurrencyConfiguration? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateFlowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service role with permissions to create and manage a flow. For
        # more information, see Create a service role for flows in Amazon Bedrock in the Amazon Bedrock User
        # Guide.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The unique identifier of the flow.

        @[JSON::Field(key: "flowIdentifier")]
        getter flow_identifier : String

        # A name for the flow.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the KMS key to encrypt the flow.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # A definition of the nodes and the connections between the nodes in the flow.

        @[JSON::Field(key: "definition")]
        getter definition : Types::FlowDefinition?

        # A description for the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @execution_role_arn : String,
          @flow_identifier : String,
          @name : String,
          @customer_encryption_key_arn : String? = nil,
          @definition : Types::FlowDefinition? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateFlowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the flow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the service role with permissions to create a flow. For more
        # information, see Create a service role for flows in Amazon Bedrock in the Amazon Bedrock User Guide.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The unique identifier of the flow.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the flow.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the flow. When you submit this request, the status will be NotPrepared . If updating
        # fails, the status becomes Failed .

        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the flow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the flow. When you update a flow, the version updated is the DRAFT version.

        @[JSON::Field(key: "version")]
        getter version : String

        # The Amazon Resource Name (ARN) of the KMS key that the flow was encrypted with.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # A definition of the nodes and the connections between nodes in the flow.

        @[JSON::Field(key: "definition")]
        getter definition : Types::FlowDefinition?

        # The description of the flow.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @execution_role_arn : String,
          @id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @version : String,
          @customer_encryption_key_arn : String? = nil,
          @definition : Types::FlowDefinition? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateKnowledgeBaseRequest
        include JSON::Serializable

        # Specifies the configuration for the embeddings model used for the knowledge base. You must use the
        # same configuration as when the knowledge base was created.

        @[JSON::Field(key: "knowledgeBaseConfiguration")]
        getter knowledge_base_configuration : Types::KnowledgeBaseConfiguration

        # The unique identifier of the knowledge base to update.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Specifies a new name for the knowledge base.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies a different Amazon Resource Name (ARN) of the IAM role with permissions to invoke API
        # operations on the knowledge base.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Specifies a new description for the knowledge base.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the configuration for the vector store used for the knowledge base. You must use the same
        # configuration as when the knowledge base was created.

        @[JSON::Field(key: "storageConfiguration")]
        getter storage_configuration : Types::StorageConfiguration?

        def initialize(
          @knowledge_base_configuration : Types::KnowledgeBaseConfiguration,
          @knowledge_base_id : String,
          @name : String,
          @role_arn : String,
          @description : String? = nil,
          @storage_configuration : Types::StorageConfiguration? = nil
        )
        end
      end


      struct UpdateKnowledgeBaseResponse
        include JSON::Serializable

        # Contains details about the knowledge base.

        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBase

        def initialize(
          @knowledge_base : Types::KnowledgeBase
        )
        end
      end


      struct UpdatePromptRequest
        include JSON::Serializable

        # A name for the prompt.

        @[JSON::Field(key: "name")]
        getter name : String

        # The unique identifier of the prompt.

        @[JSON::Field(key: "promptIdentifier")]
        getter prompt_identifier : String

        # The Amazon Resource Name (ARN) of the KMS key to encrypt the prompt.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The name of the default variant for the prompt. This value must match the name field in the relevant
        # PromptVariant object.

        @[JSON::Field(key: "defaultVariant")]
        getter default_variant : String?

        # A description for the prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of objects, each containing details about a variant of the prompt.

        @[JSON::Field(key: "variants")]
        getter variants : Array(Types::PromptVariant)?

        def initialize(
          @name : String,
          @prompt_identifier : String,
          @customer_encryption_key_arn : String? = nil,
          @default_variant : String? = nil,
          @description : String? = nil,
          @variants : Array(Types::PromptVariant)? = nil
        )
        end
      end


      struct UpdatePromptResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the prompt.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time at which the prompt was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the prompt.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the prompt.

        @[JSON::Field(key: "name")]
        getter name : String

        # The time at which the prompt was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the prompt. When you update a prompt, the version updated is the DRAFT version.

        @[JSON::Field(key: "version")]
        getter version : String

        # The Amazon Resource Name (ARN) of the KMS key to encrypt the prompt.

        @[JSON::Field(key: "customerEncryptionKeyArn")]
        getter customer_encryption_key_arn : String?

        # The name of the default variant for the prompt. This value must match the name field in the relevant
        # PromptVariant object.

        @[JSON::Field(key: "defaultVariant")]
        getter default_variant : String?

        # The description of the prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of objects, each containing details about a variant of the prompt.

        @[JSON::Field(key: "variants")]
        getter variants : Array(Types::PromptVariant)?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @name : String,
          @updated_at : Time,
          @version : String,
          @customer_encryption_key_arn : String? = nil,
          @default_variant : String? = nil,
          @description : String? = nil,
          @variants : Array(Types::PromptVariant)? = nil
        )
        end
      end

      # The configuration of web URLs that you want to crawl. You should be authorized to crawl the URLs.

      struct UrlConfiguration
        include JSON::Serializable

        # One or more seed or starting point URLs.

        @[JSON::Field(key: "seedUrls")]
        getter seed_urls : Array(Types::SeedUrl)?

        def initialize(
          @seed_urls : Array(Types::SeedUrl)? = nil
        )
        end
      end


      struct ValidateFlowDefinitionRequest
        include JSON::Serializable

        # The definition of a flow to validate.

        @[JSON::Field(key: "definition")]
        getter definition : Types::FlowDefinition

        def initialize(
          @definition : Types::FlowDefinition
        )
        end
      end


      struct ValidateFlowDefinitionResponse
        include JSON::Serializable

        # Contains an array of objects, each of which contains an error identified by validation.

        @[JSON::Field(key: "validations")]
        getter validations : Array(Types::FlowValidation)

        def initialize(
          @validations : Array(Types::FlowValidation)
        )
        end
      end

      # Input validation failed. Check your request parameters and retry the request.

      struct ValidationException
        include JSON::Serializable

        # A list of objects containing fields that caused validation errors and their corresponding validation
        # error messages.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil
        )
        end
      end

      # Stores information about a field passed inside a request that resulted in an validation error.

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

      # Contains details about how to ingest the documents in a data source.

      struct VectorIngestionConfiguration
        include JSON::Serializable

        # Details about how to chunk the documents in the data source. A chunk refers to an excerpt from a
        # data source that is returned when the knowledge base that it belongs to is queried.

        @[JSON::Field(key: "chunkingConfiguration")]
        getter chunking_configuration : Types::ChunkingConfiguration?

        # The context enrichment configuration used for ingestion of the data into the vector store.

        @[JSON::Field(key: "contextEnrichmentConfiguration")]
        getter context_enrichment_configuration : Types::ContextEnrichmentConfiguration?

        # A custom document transformer for parsed data source documents.

        @[JSON::Field(key: "customTransformationConfiguration")]
        getter custom_transformation_configuration : Types::CustomTransformationConfiguration?

        # Configurations for a parser to use for parsing documents in your data source. If you exclude this
        # field, the default parser will be used.

        @[JSON::Field(key: "parsingConfiguration")]
        getter parsing_configuration : Types::ParsingConfiguration?

        def initialize(
          @chunking_configuration : Types::ChunkingConfiguration? = nil,
          @context_enrichment_configuration : Types::ContextEnrichmentConfiguration? = nil,
          @custom_transformation_configuration : Types::CustomTransformationConfiguration? = nil,
          @parsing_configuration : Types::ParsingConfiguration? = nil
        )
        end
      end

      # Contains details about the model used to create vector embeddings for the knowledge base.

      struct VectorKnowledgeBaseConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the model used to create vector embeddings for the knowledge base.

        @[JSON::Field(key: "embeddingModelArn")]
        getter embedding_model_arn : String

        # The embeddings model configuration details for the vector model used in Knowledge Base.

        @[JSON::Field(key: "embeddingModelConfiguration")]
        getter embedding_model_configuration : Types::EmbeddingModelConfiguration?

        # If you include multimodal data from your data source, use this object to specify configurations for
        # the storage location of the images extracted from your documents. These images can be retrieved and
        # returned to the end user. They can also be used in generation when using RetrieveAndGenerate .

        @[JSON::Field(key: "supplementalDataStorageConfiguration")]
        getter supplemental_data_storage_configuration : Types::SupplementalDataStorageConfiguration?

        def initialize(
          @embedding_model_arn : String,
          @embedding_model_configuration : Types::EmbeddingModelConfiguration? = nil,
          @supplemental_data_storage_configuration : Types::SupplementalDataStorageConfiguration? = nil
        )
        end
      end

      # Configures the Amazon Bedrock reranker model to improve the relevance of retrieved results.

      struct VectorSearchBedrockRerankingConfiguration
        include JSON::Serializable

        # Specifies the configuration for the Amazon Bedrock reranker model.

        @[JSON::Field(key: "modelConfiguration")]
        getter model_configuration : Types::VectorSearchBedrockRerankingModelConfiguration

        # Specifies how metadata fields should be handled during the reranking process.

        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfigurationForReranking?

        # Specifies the number of results to return after reranking.

        @[JSON::Field(key: "numberOfRerankedResults")]
        getter number_of_reranked_results : Int32?

        def initialize(
          @model_configuration : Types::VectorSearchBedrockRerankingModelConfiguration,
          @metadata_configuration : Types::MetadataConfigurationForReranking? = nil,
          @number_of_reranked_results : Int32? = nil
        )
        end
      end

      # Configures the Amazon Bedrock model used for reranking retrieved results.

      struct VectorSearchBedrockRerankingModelConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Bedrock reranker model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # Specifies additional model-specific request parameters as key-value pairs that are included in the
        # request to the Amazon Bedrock reranker model.

        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        def initialize(
          @model_arn : String,
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil
        )
        end
      end

      # Specifies how retrieved results from a knowledge base are reranked to improve relevance.

      struct VectorSearchRerankingConfiguration
        include JSON::Serializable

        # Specifies the type of reranking model to use. Currently, the only supported value is
        # BEDROCK_RERANKING_MODEL .

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies the configuration for using an Amazon Bedrock reranker model to rerank retrieved results.

        @[JSON::Field(key: "bedrockRerankingConfiguration")]
        getter bedrock_reranking_configuration : Types::VectorSearchBedrockRerankingConfiguration?

        def initialize(
          @type : String,
          @bedrock_reranking_configuration : Types::VectorSearchBedrockRerankingConfiguration? = nil
        )
        end
      end

      # Configuration settings for processing video content in multimodal knowledge bases.

      struct VideoConfiguration
        include JSON::Serializable

        # Configuration for segmenting video content during processing.

        @[JSON::Field(key: "segmentationConfiguration")]
        getter segmentation_configuration : Types::VideoSegmentationConfiguration

        def initialize(
          @segmentation_configuration : Types::VideoSegmentationConfiguration
        )
        end
      end

      # Configuration for segmenting video content during multimodal knowledge base ingestion. Determines
      # how video files are divided into chunks for processing.

      struct VideoSegmentationConfiguration
        include JSON::Serializable

        # The duration in seconds for each video segment. Video files will be divided into chunks of this
        # length for processing.

        @[JSON::Field(key: "fixedLengthDuration")]
        getter fixed_length_duration : Int32

        def initialize(
          @fixed_length_duration : Int32
        )
        end
      end

      # The configuration of web URLs that you want to crawl. You should be authorized to crawl the URLs.

      struct WebCrawlerConfiguration
        include JSON::Serializable

        # The configuration of crawl limits for the web URLs.

        @[JSON::Field(key: "crawlerLimits")]
        getter crawler_limits : Types::WebCrawlerLimits?

        # A list of one or more exclusion regular expression patterns to exclude certain URLs. If you specify
        # an inclusion and exclusion filter/pattern and both match a URL, the exclusion filter takes
        # precedence and the web content of the URL isn’t crawled.

        @[JSON::Field(key: "exclusionFilters")]
        getter exclusion_filters : Array(String)?

        # A list of one or more inclusion regular expression patterns to include certain URLs. If you specify
        # an inclusion and exclusion filter/pattern and both match a URL, the exclusion filter takes
        # precedence and the web content of the URL isn’t crawled.

        @[JSON::Field(key: "inclusionFilters")]
        getter inclusion_filters : Array(String)?

        # The scope of what is crawled for your URLs. You can choose to crawl only web pages that belong to
        # the same host or primary domain. For example, only web pages that contain the seed URL
        # "https://docs.aws.amazon.com/bedrock/latest/userguide/" and no other domains. You can choose to
        # include sub domains in addition to the host or primary domain. For example, web pages that contain
        # "aws.amazon.com" can also include sub domain "docs.aws.amazon.com".

        @[JSON::Field(key: "scope")]
        getter scope : String?

        # Returns the user agent suffix for your web crawler.

        @[JSON::Field(key: "userAgent")]
        getter user_agent : String?

        # A string used for identifying the crawler or bot when it accesses a web server. The user agent
        # header value consists of the bedrockbot , UUID, and a user agent suffix for your crawler (if one is
        # provided). By default, it is set to bedrockbot_UUID . You can optionally append a custom suffix to
        # bedrockbot_UUID to allowlist a specific user agent permitted to access your source URLs.

        @[JSON::Field(key: "userAgentHeader")]
        getter user_agent_header : String?

        def initialize(
          @crawler_limits : Types::WebCrawlerLimits? = nil,
          @exclusion_filters : Array(String)? = nil,
          @inclusion_filters : Array(String)? = nil,
          @scope : String? = nil,
          @user_agent : String? = nil,
          @user_agent_header : String? = nil
        )
        end
      end

      # The rate limits for the URLs that you want to crawl. You should be authorized to crawl the URLs.

      struct WebCrawlerLimits
        include JSON::Serializable

        # The max number of web pages crawled from your source URLs, up to 25,000 pages. If the web pages
        # exceed this limit, the data source sync will fail and no web pages will be ingested.

        @[JSON::Field(key: "maxPages")]
        getter max_pages : Int32?

        # The max rate at which pages are crawled, up to 300 per minute per host.

        @[JSON::Field(key: "rateLimit")]
        getter rate_limit : Int32?

        def initialize(
          @max_pages : Int32? = nil,
          @rate_limit : Int32? = nil
        )
        end
      end

      # The configuration details for the web data source.

      struct WebDataSourceConfiguration
        include JSON::Serializable

        # The source configuration details for the web data source.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::WebSourceConfiguration

        # The Web Crawler configuration details for the web data source.

        @[JSON::Field(key: "crawlerConfiguration")]
        getter crawler_configuration : Types::WebCrawlerConfiguration?

        def initialize(
          @source_configuration : Types::WebSourceConfiguration,
          @crawler_configuration : Types::WebCrawlerConfiguration? = nil
        )
        end
      end

      # The configuration of the URL/URLs for the web content that you want to crawl. You should be
      # authorized to crawl the URLs.

      struct WebSourceConfiguration
        include JSON::Serializable

        # The configuration of the URL/URLs.

        @[JSON::Field(key: "urlConfiguration")]
        getter url_configuration : Types::UrlConfiguration

        def initialize(
          @url_configuration : Types::UrlConfiguration
        )
        end
      end
    end
  end
end
