require "json"
require "time"

module Aws
  module QConnect
    module Types

      # A typed union that specifies the configuration based on the type of AI Agent.

      struct AIAgentConfiguration
        include JSON::Serializable

        # The configuration for AI Agents of type ANSWER_RECOMMENDATION .

        @[JSON::Field(key: "answerRecommendationAIAgentConfiguration")]
        getter answer_recommendation_ai_agent_configuration : Types::AnswerRecommendationAIAgentConfiguration?

        # The configuration for AI Agents of type CASE_SUMMARIZATION .

        @[JSON::Field(key: "caseSummarizationAIAgentConfiguration")]
        getter case_summarization_ai_agent_configuration : Types::CaseSummarizationAIAgentConfiguration?

        # Configuration for the EMAIL_GENERATIVE_ANSWER AI agent that provides comprehensive knowledge-based
        # answers for customer queries.

        @[JSON::Field(key: "emailGenerativeAnswerAIAgentConfiguration")]
        getter email_generative_answer_ai_agent_configuration : Types::EmailGenerativeAnswerAIAgentConfiguration?

        # Configuration for the EMAIL_OVERVIEW AI agent that generates structured overview of email
        # conversations.

        @[JSON::Field(key: "emailOverviewAIAgentConfiguration")]
        getter email_overview_ai_agent_configuration : Types::EmailOverviewAIAgentConfiguration?

        # Configuration for the EMAIL_RESPONSE AI agent that generates professional email responses using
        # knowledge base content.

        @[JSON::Field(key: "emailResponseAIAgentConfiguration")]
        getter email_response_ai_agent_configuration : Types::EmailResponseAIAgentConfiguration?

        # The configuration for AI Agents of type MANUAL_SEARCH .

        @[JSON::Field(key: "manualSearchAIAgentConfiguration")]
        getter manual_search_ai_agent_configuration : Types::ManualSearchAIAgentConfiguration?

        # The configuration for AI Agents of type NOTE_TAKING .

        @[JSON::Field(key: "noteTakingAIAgentConfiguration")]
        getter note_taking_ai_agent_configuration : Types::NoteTakingAIAgentConfiguration?

        # The configuration for AI Agents of type ORCHESTRATION .

        @[JSON::Field(key: "orchestrationAIAgentConfiguration")]
        getter orchestration_ai_agent_configuration : Types::OrchestrationAIAgentConfiguration?

        # The configuration for AI Agents of type SELF_SERVICE.

        @[JSON::Field(key: "selfServiceAIAgentConfiguration")]
        getter self_service_ai_agent_configuration : Types::SelfServiceAIAgentConfiguration?

        def initialize(
          @answer_recommendation_ai_agent_configuration : Types::AnswerRecommendationAIAgentConfiguration? = nil,
          @case_summarization_ai_agent_configuration : Types::CaseSummarizationAIAgentConfiguration? = nil,
          @email_generative_answer_ai_agent_configuration : Types::EmailGenerativeAnswerAIAgentConfiguration? = nil,
          @email_overview_ai_agent_configuration : Types::EmailOverviewAIAgentConfiguration? = nil,
          @email_response_ai_agent_configuration : Types::EmailResponseAIAgentConfiguration? = nil,
          @manual_search_ai_agent_configuration : Types::ManualSearchAIAgentConfiguration? = nil,
          @note_taking_ai_agent_configuration : Types::NoteTakingAIAgentConfiguration? = nil,
          @orchestration_ai_agent_configuration : Types::OrchestrationAIAgentConfiguration? = nil,
          @self_service_ai_agent_configuration : Types::SelfServiceAIAgentConfiguration? = nil
        )
        end
      end

      # A type that specifies the AI Agent ID configuration data when mapping an AI Agents to be used for an
      # AI Agent type on a session or assistant.

      struct AIAgentConfigurationData
        include JSON::Serializable

        # The ID of the AI Agent to be configured.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        def initialize(
          @ai_agent_id : String
        )
        end
      end

      # The data for the AI Agent.

      struct AIAgentData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AI agent.

        @[JSON::Field(key: "aiAgentArn")]
        getter ai_agent_arn : String

        # The identifier of the AI Agent.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # Configuration for the AI Agent.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AIAgentConfiguration

        # The name of the AI Agent.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the AI Agent.

        @[JSON::Field(key: "type")]
        getter type : String

        # The visibility status of the AI Agent.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # The description of the AI Agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time the AI Agent was last modified.

        @[JSON::Field(key: "modifiedTime")]
        getter modified_time : Time?

        # Specifies the origin of the AI Agent. SYSTEM for a default AI Agent created by Q in Connect or
        # CUSTOMER for an AI Agent created by calling AI Agent creation APIs.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        # The status of the AI Agent.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ai_agent_arn : String,
          @ai_agent_id : String,
          @assistant_arn : String,
          @assistant_id : String,
          @configuration : Types::AIAgentConfiguration,
          @name : String,
          @type : String,
          @visibility_status : String,
          @description : String? = nil,
          @modified_time : Time? = nil,
          @origin : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The summary of the AI Agent.

      struct AIAgentSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AI agent.

        @[JSON::Field(key: "aiAgentArn")]
        getter ai_agent_arn : String

        # The identifier of the AI Agent.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The name of the AI Agent.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the AI Agent.

        @[JSON::Field(key: "type")]
        getter type : String

        # The visibility status of the AI Agent.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # The configuration for the AI Agent.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AIAgentConfiguration?

        # The description of the AI Agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time the AI Agent was last modified.

        @[JSON::Field(key: "modifiedTime")]
        getter modified_time : Time?

        # The origin of the AI Agent. SYSTEM for a default AI Agent created by Q in Connect or CUSTOMER for an
        # AI Agent created by calling AI Agent creation APIs.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        # The status of the AI Agent.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ai_agent_arn : String,
          @ai_agent_id : String,
          @assistant_arn : String,
          @assistant_id : String,
          @name : String,
          @type : String,
          @visibility_status : String,
          @configuration : Types::AIAgentConfiguration? = nil,
          @description : String? = nil,
          @modified_time : Time? = nil,
          @origin : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The summary of the AI Agent version.

      struct AIAgentVersionSummary
        include JSON::Serializable

        # The data for the summary of the AI Agent version.

        @[JSON::Field(key: "aiAgentSummary")]
        getter ai_agent_summary : Types::AIAgentSummary?

        # The version number for this AI Agent version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @ai_agent_summary : Types::AIAgentSummary? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      # The assessment information from the AI Guardrail.

      struct AIGuardrailAssessment
        include JSON::Serializable

        # Indicates whether the AI Guardrail blocked the content.

        @[JSON::Field(key: "blocked")]
        getter blocked : Bool

        def initialize(
          @blocked : Bool
        )
        end
      end

      # Contains details about how to handle harmful content.

      struct AIGuardrailContentPolicyConfig
        include JSON::Serializable

        # Contains the type of the content filter and how strongly it should apply to prompts and model
        # responses.

        @[JSON::Field(key: "filtersConfig")]
        getter filters_config : Array(Types::GuardrailContentFilterConfig)

        def initialize(
          @filters_config : Array(Types::GuardrailContentFilterConfig)
        )
        end
      end

      # The policy configuration details for the AI Guardrail's contextual grounding policy.

      struct AIGuardrailContextualGroundingPolicyConfig
        include JSON::Serializable

        # The filter configuration details for the AI Guardrails contextual grounding policy.

        @[JSON::Field(key: "filtersConfig")]
        getter filters_config : Array(Types::GuardrailContextualGroundingFilterConfig)

        def initialize(
          @filters_config : Array(Types::GuardrailContextualGroundingFilterConfig)
        )
        end
      end

      # The data for the AI Guardrail

      struct AIGuardrailData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AI Guardrail.

        @[JSON::Field(key: "aiGuardrailArn")]
        getter ai_guardrail_arn : String

        # The identifier of the Amazon Q in Connect AI Guardrail.

        @[JSON::Field(key: "aiGuardrailId")]
        getter ai_guardrail_id : String

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The message to return when the AI Guardrail blocks a prompt.

        @[JSON::Field(key: "blockedInputMessaging")]
        getter blocked_input_messaging : String

        # The message to return when the AI Guardrail blocks a model response.

        @[JSON::Field(key: "blockedOutputsMessaging")]
        getter blocked_outputs_messaging : String

        # The name of the AI Guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # The visibility status of the AI Guardrail.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # Contains details about how to handle harmful content.

        @[JSON::Field(key: "contentPolicyConfig")]
        getter content_policy_config : Types::AIGuardrailContentPolicyConfig?

        # The policy configuration details for the AI Guardrail's contextual grounding policy.

        @[JSON::Field(key: "contextualGroundingPolicyConfig")]
        getter contextual_grounding_policy_config : Types::AIGuardrailContextualGroundingPolicyConfig?

        # A description of the AI Guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time the AI Guardrail was last modified.

        @[JSON::Field(key: "modifiedTime")]
        getter modified_time : Time?

        # Contains details about PII entities and regular expressions to configure for the AI Guardrail.

        @[JSON::Field(key: "sensitiveInformationPolicyConfig")]
        getter sensitive_information_policy_config : Types::AIGuardrailSensitiveInformationPolicyConfig?

        # The status of the AI Guardrail.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Contains details about topics that the AI Guardrail should identify and deny.

        @[JSON::Field(key: "topicPolicyConfig")]
        getter topic_policy_config : Types::AIGuardrailTopicPolicyConfig?

        # Contains details about the word policy to configured for the AI Guardrail.

        @[JSON::Field(key: "wordPolicyConfig")]
        getter word_policy_config : Types::AIGuardrailWordPolicyConfig?

        def initialize(
          @ai_guardrail_arn : String,
          @ai_guardrail_id : String,
          @assistant_arn : String,
          @assistant_id : String,
          @blocked_input_messaging : String,
          @blocked_outputs_messaging : String,
          @name : String,
          @visibility_status : String,
          @content_policy_config : Types::AIGuardrailContentPolicyConfig? = nil,
          @contextual_grounding_policy_config : Types::AIGuardrailContextualGroundingPolicyConfig? = nil,
          @description : String? = nil,
          @modified_time : Time? = nil,
          @sensitive_information_policy_config : Types::AIGuardrailSensitiveInformationPolicyConfig? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @topic_policy_config : Types::AIGuardrailTopicPolicyConfig? = nil,
          @word_policy_config : Types::AIGuardrailWordPolicyConfig? = nil
        )
        end
      end

      # Contains details about PII entities and regular expressions to configure for the AI Guardrail.

      struct AIGuardrailSensitiveInformationPolicyConfig
        include JSON::Serializable

        # A list of PII entities to configure to the AI Guardrail.

        @[JSON::Field(key: "piiEntitiesConfig")]
        getter pii_entities_config : Array(Types::GuardrailPiiEntityConfig)?

        # A list of regular expressions to configure to the AI Guardrail.

        @[JSON::Field(key: "regexesConfig")]
        getter regexes_config : Array(Types::GuardrailRegexConfig)?

        def initialize(
          @pii_entities_config : Array(Types::GuardrailPiiEntityConfig)? = nil,
          @regexes_config : Array(Types::GuardrailRegexConfig)? = nil
        )
        end
      end

      # The summary of the AI Guardrail.

      struct AIGuardrailSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AI Guardrail.

        @[JSON::Field(key: "aiGuardrailArn")]
        getter ai_guardrail_arn : String

        # The identifier of the Amazon Q in Connect AI Guardrail.

        @[JSON::Field(key: "aiGuardrailId")]
        getter ai_guardrail_id : String

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The name of the AI Guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # The visibility status of the AI Guardrail.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # A description of the AI Guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time the AI Guardrail was last modified.

        @[JSON::Field(key: "modifiedTime")]
        getter modified_time : Time?

        # The status of the AI Guardrail.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ai_guardrail_arn : String,
          @ai_guardrail_id : String,
          @assistant_arn : String,
          @assistant_id : String,
          @name : String,
          @visibility_status : String,
          @description : String? = nil,
          @modified_time : Time? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains details about topics that the AI Guardrail should identify and deny.

      struct AIGuardrailTopicPolicyConfig
        include JSON::Serializable

        # A list of policies related to topics that the AI Guardrail should deny.

        @[JSON::Field(key: "topicsConfig")]
        getter topics_config : Array(Types::GuardrailTopicConfig)

        def initialize(
          @topics_config : Array(Types::GuardrailTopicConfig)
        )
        end
      end

      # The summary of the AI Guardrail version.

      struct AIGuardrailVersionSummary
        include JSON::Serializable

        # The data for the summary of the AI Guardrail version.

        @[JSON::Field(key: "aiGuardrailSummary")]
        getter ai_guardrail_summary : Types::AIGuardrailSummary?

        # The version number for this AI Guardrail version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @ai_guardrail_summary : Types::AIGuardrailSummary? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      # Contains details about the word policy to configured for the AI Guardrail.

      struct AIGuardrailWordPolicyConfig
        include JSON::Serializable

        # A list of managed words to configure for the AI Guardrail.

        @[JSON::Field(key: "managedWordListsConfig")]
        getter managed_word_lists_config : Array(Types::GuardrailManagedWordsConfig)?

        # A list of words to configure for the AI Guardrail.

        @[JSON::Field(key: "wordsConfig")]
        getter words_config : Array(Types::GuardrailWordConfig)?

        def initialize(
          @managed_word_lists_config : Array(Types::GuardrailManagedWordsConfig)? = nil,
          @words_config : Array(Types::GuardrailWordConfig)? = nil
        )
        end
      end

      # The data for the AI Prompt

      struct AIPromptData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AI Prompt.

        @[JSON::Field(key: "aiPromptArn")]
        getter ai_prompt_arn : String

        # The identifier of the Amazon Q in Connect AI prompt.

        @[JSON::Field(key: "aiPromptId")]
        getter ai_prompt_id : String

        # The API format used for this AI Prompt.

        @[JSON::Field(key: "apiFormat")]
        getter api_format : String

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the model used for this AI Prompt. The following model Ids are supported:
        # anthropic.claude-3-haiku--v1:0 apac.amazon.nova-lite-v1:0 apac.amazon.nova-micro-v1:0
        # apac.amazon.nova-pro-v1:0 apac.anthropic.claude-3-5-sonnet--v2:0
        # apac.anthropic.claude-3-haiku-20240307-v1:0 eu.amazon.nova-lite-v1:0 eu.amazon.nova-micro-v1:0
        # eu.amazon.nova-pro-v1:0 eu.anthropic.claude-3-7-sonnet-20250219-v1:0
        # eu.anthropic.claude-3-haiku-20240307-v1:0 us.amazon.nova-lite-v1:0 us.amazon.nova-micro-v1:0
        # us.amazon.nova-pro-v1:0 us.anthropic.claude-3-5-haiku-20241022-v1:0
        # us.anthropic.claude-3-7-sonnet-20250219-v1:0 us.anthropic.claude-3-haiku-20240307-v1:0

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The name of the AI Prompt

        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration of the prompt template for this AI Prompt.

        @[JSON::Field(key: "templateConfiguration")]
        getter template_configuration : Types::AIPromptTemplateConfiguration

        # The type of the prompt template for this AI Prompt.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # The type of this AI Prompt.

        @[JSON::Field(key: "type")]
        getter type : String

        # The visibility status of the AI Prompt.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # The description of the AI Prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration for inference parameters when using the AI Prompt.

        @[JSON::Field(key: "inferenceConfiguration")]
        getter inference_configuration : Types::AIPromptInferenceConfiguration?

        # The time the AI Prompt was last modified.

        @[JSON::Field(key: "modifiedTime")]
        getter modified_time : Time?

        # The origin of the AI Prompt. SYSTEM for a default AI Prompt created by Q in Connect or CUSTOMER for
        # an AI Prompt created by calling AI Prompt creation APIs.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        # The status of the AI Prompt.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ai_prompt_arn : String,
          @ai_prompt_id : String,
          @api_format : String,
          @assistant_arn : String,
          @assistant_id : String,
          @model_id : String,
          @name : String,
          @template_configuration : Types::AIPromptTemplateConfiguration,
          @template_type : String,
          @type : String,
          @visibility_status : String,
          @description : String? = nil,
          @inference_configuration : Types::AIPromptInferenceConfiguration? = nil,
          @modified_time : Time? = nil,
          @origin : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration for inference parameters when using AI Prompts.

      struct AIPromptInferenceConfiguration
        include JSON::Serializable

        # The maximum number of tokens to generate in the response.

        @[JSON::Field(key: "maxTokensToSample")]
        getter max_tokens_to_sample : Int32?

        # The temperature setting for controlling randomness in the generated response.

        @[JSON::Field(key: "temperature")]
        getter temperature : Float64?

        # The top-K sampling parameter for token selection.

        @[JSON::Field(key: "topK")]
        getter top_k : Int32?

        # The top-P sampling parameter for nucleus sampling.

        @[JSON::Field(key: "topP")]
        getter top_p : Float64?

        def initialize(
          @max_tokens_to_sample : Int32? = nil,
          @temperature : Float64? = nil,
          @top_k : Int32? = nil,
          @top_p : Float64? = nil
        )
        end
      end

      # The summary of the AI Prompt.

      struct AIPromptSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AI Prompt.

        @[JSON::Field(key: "aiPromptArn")]
        getter ai_prompt_arn : String

        # The identifier of the Amazon Q in Connect AI prompt.

        @[JSON::Field(key: "aiPromptId")]
        getter ai_prompt_id : String

        # The API format used for this AI Prompt.

        @[JSON::Field(key: "apiFormat")]
        getter api_format : String

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the model used for this AI Prompt. Model Ids supported are:
        # anthropic.claude-3-haiku-20240307-v1:0 .

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The name of the AI Prompt.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the prompt template for this AI Prompt.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # The type of this AI Prompt.

        @[JSON::Field(key: "type")]
        getter type : String

        # The visibility status of the AI Prompt.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # The description of the AI Prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time the AI Prompt was last modified.

        @[JSON::Field(key: "modifiedTime")]
        getter modified_time : Time?

        # The origin of the AI Prompt. SYSTEM for a default AI Prompt created by Q in Connect or CUSTOMER for
        # an AI Prompt created by calling AI Prompt creation APIs.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        # The status of the AI Prompt.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ai_prompt_arn : String,
          @ai_prompt_id : String,
          @api_format : String,
          @assistant_arn : String,
          @assistant_id : String,
          @model_id : String,
          @name : String,
          @template_type : String,
          @type : String,
          @visibility_status : String,
          @description : String? = nil,
          @modified_time : Time? = nil,
          @origin : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A typed union that specifies the configuration for a prompt template based on its type.

      struct AIPromptTemplateConfiguration
        include JSON::Serializable

        # The configuration for a prompt template that supports full textual prompt configuration using a YAML
        # prompt.

        @[JSON::Field(key: "textFullAIPromptEditTemplateConfiguration")]
        getter text_full_ai_prompt_edit_template_configuration : Types::TextFullAIPromptEditTemplateConfiguration?

        def initialize(
          @text_full_ai_prompt_edit_template_configuration : Types::TextFullAIPromptEditTemplateConfiguration? = nil
        )
        end
      end

      # The summary of the AI Prompt version.

      struct AIPromptVersionSummary
        include JSON::Serializable

        # The date for the summary of the AI Prompt version.

        @[JSON::Field(key: "aiPromptSummary")]
        getter ai_prompt_summary : Types::AIPromptSummary?

        # The version number for this AI Prompt version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @ai_prompt_summary : Types::AIPromptSummary? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ActivateMessageTemplateRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN. It cannot contain any
        # qualifier.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The version number of the message template version to activate.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64

        def initialize(
          @knowledge_base_id : String,
          @message_template_id : String,
          @version_number : Int64
        )
        end
      end


      struct ActivateMessageTemplateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "messageTemplateArn")]
        getter message_template_arn : String

        # The identifier of the message template.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The version number of the message template version that is activated.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64

        def initialize(
          @message_template_arn : String,
          @message_template_id : String,
          @version_number : Int64
        )
        end
      end

      # Information about an agent.

      struct AgentAttributes
        include JSON::Serializable

        # The agent’s first name as entered in their Amazon Connect user account.

        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # The agent’s last name as entered in their Amazon Connect user account.

        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        def initialize(
          @first_name : String? = nil,
          @last_name : String? = nil
        )
        end
      end

      # Content association data for a step-by-step guide .

      struct AmazonConnectGuideAssociationData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon Connect flow. Step-by-step guides are a type of flow.

        @[JSON::Field(key: "flowId")]
        getter flow_id : String?

        def initialize(
          @flow_id : String? = nil
        )
        end
      end

      # An annotation that provides additional context or metadata.

      struct Annotation
        include JSON::Serializable

        # A hint indicating that the annotation contains potentially destructive content.

        @[JSON::Field(key: "destructiveHint")]
        getter destructive_hint : Bool?

        # The title of the annotation.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @destructive_hint : Bool? = nil,
          @title : String? = nil
        )
        end
      end

      # The configuration for the ANSWER_RECOMMENDATION AI Agent type.

      struct AnswerRecommendationAIAgentConfiguration
        include JSON::Serializable

        # The AI Guardrail identifier for the Answer Generation Guardrail used by the ANSWER_RECOMMENDATION AI
        # Agent.

        @[JSON::Field(key: "answerGenerationAIGuardrailId")]
        getter answer_generation_ai_guardrail_id : String?

        # The AI Prompt identifier for the Answer Generation prompt used by the ANSWER_RECOMMENDATION AI
        # Agent.

        @[JSON::Field(key: "answerGenerationAIPromptId")]
        getter answer_generation_ai_prompt_id : String?

        # The association configurations for overriding behavior on this AI Agent.

        @[JSON::Field(key: "associationConfigurations")]
        getter association_configurations : Array(Types::AssociationConfiguration)?

        # The AI Prompt identifier for the Intent Labeling prompt used by the ANSWER_RECOMMENDATION AI Agent.

        @[JSON::Field(key: "intentLabelingGenerationAIPromptId")]
        getter intent_labeling_generation_ai_prompt_id : String?

        # The locale to which specifies the language and region settings that determine the response language
        # for QueryAssistant . For more information on supported locales, see Language support for Amazon Q in
        # Connect .

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The AI Prompt identifier for the Query Reformulation prompt used by the ANSWER_RECOMMENDATION AI
        # Agent.

        @[JSON::Field(key: "queryReformulationAIPromptId")]
        getter query_reformulation_ai_prompt_id : String?

        # The suggested messages configuration for the Answer Recommendation AI Agent.

        @[JSON::Field(key: "suggestedMessages")]
        getter suggested_messages : Array(String)?

        def initialize(
          @answer_generation_ai_guardrail_id : String? = nil,
          @answer_generation_ai_prompt_id : String? = nil,
          @association_configurations : Array(Types::AssociationConfiguration)? = nil,
          @intent_labeling_generation_ai_prompt_id : String? = nil,
          @locale : String? = nil,
          @query_reformulation_ai_prompt_id : String? = nil,
          @suggested_messages : Array(String)? = nil
        )
        end
      end

      # Configuration information for Amazon AppIntegrations to automatically ingest content.

      struct AppIntegrationsConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AppIntegrations DataIntegration to use for ingesting content.
        # For Salesforce , your AppIntegrations DataIntegration must have an ObjectConfiguration if
        # objectFields is not provided, including at least Id , ArticleNumber , VersionNumber , Title ,
        # PublishStatus , and IsDeleted as source fields. For ServiceNow , your AppIntegrations
        # DataIntegration must have an ObjectConfiguration if objectFields is not provided, including at least
        # number , short_description , sys_mod_count , workflow_state , and active as source fields. For
        # Zendesk , your AppIntegrations DataIntegration must have an ObjectConfiguration if objectFields is
        # not provided, including at least id , title , updated_at , and draft as source fields. For
        # SharePoint , your AppIntegrations DataIntegration must have a FileConfiguration, including only file
        # extensions that are among docx , pdf , html , htm , and txt . For Amazon S3 , the
        # ObjectConfiguration and FileConfiguration of your AppIntegrations DataIntegration must be null. The
        # SourceURI of your DataIntegration must use the following format: s3://your_s3_bucket_name . The
        # bucket policy of the corresponding S3 bucket must allow the Amazon Web Services principal
        # app-integrations.amazonaws.com to perform s3:ListBucket , s3:GetObject , and s3:GetBucketLocation
        # against the bucket.

        @[JSON::Field(key: "appIntegrationArn")]
        getter app_integration_arn : String

        # The fields from the source that are made available to your agents in Amazon Q in Connect. Optional
        # if ObjectConfiguration is included in the provided DataIntegration. For Salesforce , you must
        # include at least Id , ArticleNumber , VersionNumber , Title , PublishStatus , and IsDeleted . For
        # ServiceNow , you must include at least number , short_description , sys_mod_count , workflow_state ,
        # and active . For Zendesk , you must include at least id , title , updated_at , and draft . Make sure
        # to include additional fields. These fields are indexed and used to source recommendations.

        @[JSON::Field(key: "objectFields")]
        getter object_fields : Array(String)?

        def initialize(
          @app_integration_arn : String,
          @object_fields : Array(String)? = nil
        )
        end
      end

      # Information about the assistant association.

      struct AssistantAssociationData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The Amazon Resource Name (ARN) of the assistant association.

        @[JSON::Field(key: "assistantAssociationArn")]
        getter assistant_association_arn : String

        # The identifier of the assistant association.

        @[JSON::Field(key: "assistantAssociationId")]
        getter assistant_association_id : String

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # A union type that currently has a single argument, the knowledge base ID.

        @[JSON::Field(key: "associationData")]
        getter association_data : Types::AssistantAssociationOutputData

        # The type of association.

        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_arn : String,
          @assistant_association_arn : String,
          @assistant_association_id : String,
          @assistant_id : String,
          @association_data : Types::AssistantAssociationOutputData,
          @association_type : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The data that is input into Amazon Q in Connect as a result of the assistant association.

      struct AssistantAssociationInputData
        include JSON::Serializable

        # The configuration for an external Bedrock knowledge base association.

        @[JSON::Field(key: "externalBedrockKnowledgeBaseConfig")]
        getter external_bedrock_knowledge_base_config : Types::ExternalBedrockKnowledgeBaseConfig?

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String?

        def initialize(
          @external_bedrock_knowledge_base_config : Types::ExternalBedrockKnowledgeBaseConfig? = nil,
          @knowledge_base_id : String? = nil
        )
        end
      end

      # The data that is output as a result of the assistant association.

      struct AssistantAssociationOutputData
        include JSON::Serializable

        # The configuration for an external Bedrock knowledge base association in the output data.

        @[JSON::Field(key: "externalBedrockKnowledgeBaseConfig")]
        getter external_bedrock_knowledge_base_config : Types::ExternalBedrockKnowledgeBaseConfig?

        # The knowledge base where output data is sent.

        @[JSON::Field(key: "knowledgeBaseAssociation")]
        getter knowledge_base_association : Types::KnowledgeBaseAssociationData?

        def initialize(
          @external_bedrock_knowledge_base_config : Types::ExternalBedrockKnowledgeBaseConfig? = nil,
          @knowledge_base_association : Types::KnowledgeBaseAssociationData? = nil
        )
        end
      end

      # Summary information about the assistant association.

      struct AssistantAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The Amazon Resource Name (ARN) of the assistant association.

        @[JSON::Field(key: "assistantAssociationArn")]
        getter assistant_association_arn : String

        # The identifier of the assistant association.

        @[JSON::Field(key: "assistantAssociationId")]
        getter assistant_association_id : String

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The association data.

        @[JSON::Field(key: "associationData")]
        getter association_data : Types::AssistantAssociationOutputData

        # The type of association.

        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_arn : String,
          @assistant_association_arn : String,
          @assistant_association_id : String,
          @assistant_id : String,
          @association_data : Types::AssistantAssociationOutputData,
          @association_type : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The capability configuration for an Amazon Q in Connect assistant.

      struct AssistantCapabilityConfiguration
        include JSON::Serializable

        # The type of Amazon Q in Connect assistant capability.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # The assistant data.

      struct AssistantData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the assistant.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of assistant.

        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration of the AI Agents (mapped by AI Agent Type to AI Agent version) that is set on the
        # Amazon Q in Connect Assistant.

        @[JSON::Field(key: "aiAgentConfiguration")]
        getter ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)?

        # The configuration information for the Amazon Q in Connect assistant capability.

        @[JSON::Field(key: "capabilityConfiguration")]
        getter capability_configuration : Types::AssistantCapabilityConfiguration?

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information for the Amazon Q in Connect assistant integration.

        @[JSON::Field(key: "integrationConfiguration")]
        getter integration_configuration : Types::AssistantIntegrationConfiguration?

        # The list of orchestrator configurations for the assistant.

        @[JSON::Field(key: "orchestratorConfigurationList")]
        getter orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , kms:Decrypt , and kms:GenerateDataKey*
        # permissions to the IAM identity using the key to invoke Amazon Q in Connect. To use Amazon Q in
        # Connect with chat, the key policy must also allow kms:Decrypt , kms:GenerateDataKey* , and
        # kms:DescribeKey permissions to the connect.amazonaws.com service principal. For more information
        # about setting up a customer managed key for Amazon Q in Connect, see Enable Amazon Q in Connect for
        # your instance .

        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_arn : String,
          @assistant_id : String,
          @name : String,
          @status : String,
          @type : String,
          @ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)? = nil,
          @capability_configuration : Types::AssistantCapabilityConfiguration? = nil,
          @description : String? = nil,
          @integration_configuration : Types::AssistantIntegrationConfiguration? = nil,
          @orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration information for the Amazon Q in Connect assistant integration.

      struct AssistantIntegrationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the integrated Amazon SNS topic used for streaming chat messages.

        @[JSON::Field(key: "topicIntegrationArn")]
        getter topic_integration_arn : String?

        def initialize(
          @topic_integration_arn : String? = nil
        )
        end
      end

      # Summary information about the assistant.

      struct AssistantSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The name of the assistant.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the assistant.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the assistant.

        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration of the AI Agents (mapped by AI Agent Type to AI Agent version) that is set on the
        # Amazon Q in Connect Assistant.

        @[JSON::Field(key: "aiAgentConfiguration")]
        getter ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)?

        # The configuration information for the Amazon Q in Connect assistant capability.

        @[JSON::Field(key: "capabilityConfiguration")]
        getter capability_configuration : Types::AssistantCapabilityConfiguration?

        # The description of the assistant.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information for the Amazon Q in Connect assistant integration.

        @[JSON::Field(key: "integrationConfiguration")]
        getter integration_configuration : Types::AssistantIntegrationConfiguration?

        # The list of orchestrator configurations for the assistant.

        @[JSON::Field(key: "orchestratorConfigurationList")]
        getter orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , kms:Decrypt , and kms:GenerateDataKey*
        # permissions to the IAM identity using the key to invoke Amazon Q in Connect. To use Amazon Q in
        # Connect with chat, the key policy must also allow kms:Decrypt , kms:GenerateDataKey* , and
        # kms:DescribeKey permissions to the connect.amazonaws.com service principal. For more information
        # about setting up a customer managed key for Amazon Q in Connect, see Enable Amazon Q in Connect for
        # your instance .

        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_arn : String,
          @assistant_id : String,
          @name : String,
          @status : String,
          @type : String,
          @ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)? = nil,
          @capability_configuration : Types::AssistantCapabilityConfiguration? = nil,
          @description : String? = nil,
          @integration_configuration : Types::AssistantIntegrationConfiguration? = nil,
          @orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration for an Amazon Q in Connect Assistant Association.

      struct AssociationConfiguration
        include JSON::Serializable

        # The data of the configuration for an Amazon Q in Connect Assistant Association.

        @[JSON::Field(key: "associationConfigurationData")]
        getter association_configuration_data : Types::AssociationConfigurationData?

        # The identifier of the association for this Association Configuration.

        @[JSON::Field(key: "associationId")]
        getter association_id : String?

        # The type of the association for this Association Configuration.

        @[JSON::Field(key: "associationType")]
        getter association_type : String?

        def initialize(
          @association_configuration_data : Types::AssociationConfigurationData? = nil,
          @association_id : String? = nil,
          @association_type : String? = nil
        )
        end
      end

      # A typed union of the data of the configuration for an Amazon Q in Connect Assistant Association.

      struct AssociationConfigurationData
        include JSON::Serializable

        # The data of the configuration for a KNOWLEDGE_BASE type Amazon Q in Connect Assistant Association.

        @[JSON::Field(key: "knowledgeBaseAssociationConfigurationData")]
        getter knowledge_base_association_configuration_data : Types::KnowledgeBaseAssociationConfigurationData?

        def initialize(
          @knowledge_base_association_configuration_data : Types::KnowledgeBaseAssociationConfigurationData? = nil
        )
        end
      end

      # Settings for a foundation model used to parse documents for a data source.

      struct BedrockFoundationModelConfigurationForParsing
        include JSON::Serializable

        # The ARN of the foundation model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # Instructions for interpreting the contents of a document.

        @[JSON::Field(key: "parsingPrompt")]
        getter parsing_prompt : Types::ParsingPrompt?

        def initialize(
          @model_arn : String,
          @parsing_prompt : Types::ParsingPrompt? = nil
        )
        end
      end

      # The configuration for AI Agents of type CASE_SUMMARIZATION .

      struct CaseSummarizationAIAgentConfiguration
        include JSON::Serializable

        # The AI Guardrail identifier used by the Case Summarization AI Agent.

        @[JSON::Field(key: "caseSummarizationAIGuardrailId")]
        getter case_summarization_ai_guardrail_id : String?

        # The AI Prompt identifier used by the Case Summarization AI Agent.

        @[JSON::Field(key: "caseSummarizationAIPromptId")]
        getter case_summarization_ai_prompt_id : String?

        # The locale setting for the Case Summarization AI Agent.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @case_summarization_ai_guardrail_id : String? = nil,
          @case_summarization_ai_prompt_id : String? = nil,
          @locale : String? = nil
        )
        end
      end

      # Details about case summarization chunk data.

      struct CaseSummarizationChunkDataDetails
        include JSON::Serializable

        # A chunk of the case summarization completion.

        @[JSON::Field(key: "completion")]
        getter completion : String?

        # Token for retrieving the next chunk of streaming summarization data, if available.

        @[JSON::Field(key: "nextChunkToken")]
        getter next_chunk_token : String?

        def initialize(
          @completion : String? = nil,
          @next_chunk_token : String? = nil
        )
        end
      end

      # Input data for case summarization.

      struct CaseSummarizationInputData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the case for summarization.

        @[JSON::Field(key: "caseArn")]
        getter case_arn : String

        def initialize(
          @case_arn : String
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
        # your files by splitting them up such that each file corresponds to a chunk.

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
        # smaller documents based on groups of similar content derived from the text with natural language
        # processing.

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

      # A citation that references source content.

      struct Citation
        include JSON::Serializable


        @[JSON::Field(key: "citationSpan")]
        getter citation_span : Types::CitationSpan

        # A type to define the KB origin of a cited content

        @[JSON::Field(key: "referenceType")]
        getter reference_type : String

        # The identifier of the content being cited.

        @[JSON::Field(key: "contentId")]
        getter content_id : String?

        # The identifier of the knowledge base containing the cited content.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String?

        # The source URL for the citation.

        @[JSON::Field(key: "sourceURL")]
        getter source_url : String?

        # The title of the cited content.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @citation_span : Types::CitationSpan,
          @reference_type : String,
          @content_id : String? = nil,
          @knowledge_base_id : String? = nil,
          @source_url : String? = nil,
          @title : String? = nil
        )
        end
      end

      # Contains information about where the text with a citation begins and ends in the generated output.

      struct CitationSpan
        include JSON::Serializable

        # Where the text with a citation starts in the generated output.

        @[JSON::Field(key: "beginOffsetInclusive")]
        getter begin_offset_inclusive : Int32?

        # Where the text with a citation ends in the generated output.

        @[JSON::Field(key: "endOffsetExclusive")]
        getter end_offset_exclusive : Int32?

        def initialize(
          @begin_offset_inclusive : Int32? = nil,
          @end_offset_exclusive : Int32? = nil
        )
        end
      end

      # The configuration information of the external data source.

      struct Configuration
        include JSON::Serializable

        # The configuration information of the Amazon Connect data source.

        @[JSON::Field(key: "connectConfiguration")]
        getter connect_configuration : Types::ConnectConfiguration?

        def initialize(
          @connect_configuration : Types::ConnectConfiguration? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource. For
      # example, if you're using a Create API (such as CreateAssistant ) that accepts name, a conflicting
      # resource (usually with the same name) is being created or mutated.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration information of the Amazon Connect data source.

      struct ConnectConfiguration
        include JSON::Serializable

        # The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the
        # instance.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String?

        def initialize(
          @instance_id : String? = nil
        )
        end
      end

      # The contents of a content association.

      struct ContentAssociationContents
        include JSON::Serializable

        # The data of the step-by-step guide association.

        @[JSON::Field(key: "amazonConnectGuideAssociation")]
        getter amazon_connect_guide_association : Types::AmazonConnectGuideAssociationData?

        def initialize(
          @amazon_connect_guide_association : Types::AmazonConnectGuideAssociationData? = nil
        )
        end
      end

      # Information about the content association.

      struct ContentAssociationData
        include JSON::Serializable

        # The content association.

        @[JSON::Field(key: "associationData")]
        getter association_data : Types::ContentAssociationContents

        # The type of association.

        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # The Amazon Resource Name (ARN) of the content.

        @[JSON::Field(key: "contentArn")]
        getter content_arn : String

        # The Amazon Resource Name (ARN) of the content association.

        @[JSON::Field(key: "contentAssociationArn")]
        getter content_association_arn : String

        # The identifier of the content association. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.

        @[JSON::Field(key: "contentAssociationId")]
        getter content_association_id : String

        # The identifier of the content.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @association_data : Types::ContentAssociationContents,
          @association_type : String,
          @content_arn : String,
          @content_association_arn : String,
          @content_association_id : String,
          @content_id : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about a content association.

      struct ContentAssociationSummary
        include JSON::Serializable

        # The content association.

        @[JSON::Field(key: "associationData")]
        getter association_data : Types::ContentAssociationContents

        # The type of association.

        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # The Amazon Resource Name (ARN) of the content.

        @[JSON::Field(key: "contentArn")]
        getter content_arn : String

        # The Amazon Resource Name (ARN) of the content association.

        @[JSON::Field(key: "contentAssociationArn")]
        getter content_association_arn : String

        # The identifier of the content association. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.

        @[JSON::Field(key: "contentAssociationId")]
        getter content_association_id : String

        # The identifier of the content.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @association_data : Types::ContentAssociationContents,
          @association_type : String,
          @content_arn : String,
          @content_association_arn : String,
          @content_association_id : String,
          @content_id : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about the content.

      struct ContentData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the content.

        @[JSON::Field(key: "contentArn")]
        getter content_arn : String

        # The identifier of the content.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The media type of the content.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A key/value map to store attributes without affecting tagging or recommendations. For example, when
        # synchronizing data between an external system and Amazon Q in Connect, you can store an external
        # version identifier as metadata to utilize for determining drift.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)

        # The name of the content.

        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the content revision.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        # The status of the content.

        @[JSON::Field(key: "status")]
        getter status : String

        # The title of the content.

        @[JSON::Field(key: "title")]
        getter title : String

        # The URL of the content.

        @[JSON::Field(key: "url")]
        getter url : String

        # The expiration time of the URL as an epoch timestamp.

        @[JSON::Field(key: "urlExpiry")]
        getter url_expiry : Time

        # The URI of the content.

        @[JSON::Field(key: "linkOutUri")]
        getter link_out_uri : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_arn : String,
          @content_id : String,
          @content_type : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @metadata : Hash(String, String),
          @name : String,
          @revision_id : String,
          @status : String,
          @title : String,
          @url : String,
          @url_expiry : Time,
          @link_out_uri : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Details about the content data.

      struct ContentDataDetails
        include JSON::Serializable

        # Details about the content ranking data.

        @[JSON::Field(key: "rankingData")]
        getter ranking_data : Types::RankingData

        # Details about the content text data.

        @[JSON::Field(key: "textData")]
        getter text_data : Types::TextData

        def initialize(
          @ranking_data : Types::RankingData,
          @text_data : Types::TextData
        )
        end
      end

      # Information about the feedback.

      struct ContentFeedbackData
        include JSON::Serializable

        # Information about the feedback for a generative target type.

        @[JSON::Field(key: "generativeContentFeedbackData")]
        getter generative_content_feedback_data : Types::GenerativeContentFeedbackData?

        def initialize(
          @generative_content_feedback_data : Types::GenerativeContentFeedbackData? = nil
        )
        end
      end

      # Reference information about the content.

      struct ContentReference
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the content.

        @[JSON::Field(key: "contentArn")]
        getter content_arn : String?

        # The identifier of the content.

        @[JSON::Field(key: "contentId")]
        getter content_id : String?

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String?

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String?

        # The type of reference content.

        @[JSON::Field(key: "referenceType")]
        getter reference_type : String?

        # The web URL of the source content.

        @[JSON::Field(key: "sourceURL")]
        getter source_url : String?

        def initialize(
          @content_arn : String? = nil,
          @content_id : String? = nil,
          @knowledge_base_arn : String? = nil,
          @knowledge_base_id : String? = nil,
          @reference_type : String? = nil,
          @source_url : String? = nil
        )
        end
      end

      # Summary information about the content.

      struct ContentSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the content.

        @[JSON::Field(key: "contentArn")]
        getter content_arn : String

        # The identifier of the content.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The media type of the content.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A key/value map to store attributes without affecting tagging or recommendations. For example, when
        # synchronizing data between an external system and Amazon Q in Connect, you can store an external
        # version identifier as metadata to utilize for determining drift.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)

        # The name of the content.

        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the revision of the content.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        # The status of the content.

        @[JSON::Field(key: "status")]
        getter status : String

        # The title of the content.

        @[JSON::Field(key: "title")]
        getter title : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_arn : String,
          @content_id : String,
          @content_type : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @metadata : Hash(String, String),
          @name : String,
          @revision_id : String,
          @status : String,
          @title : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The conversation context to include in SendMessage.

      struct ConversationContext
        include JSON::Serializable

        # The self service conversation history before the Amazon Q in Connect session.

        @[JSON::Field(key: "selfServiceConversationHistory")]
        getter self_service_conversation_history : Array(Types::SelfServiceConversationHistory)

        def initialize(
          @self_service_conversation_history : Array(Types::SelfServiceConversationHistory)
        )
        end
      end

      # The conversation state associated to a message.

      struct ConversationState
        include JSON::Serializable

        # The status of the conversation state.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason of the conversation state.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @status : String,
          @reason : String? = nil
        )
        end
      end


      struct CreateAIAgentRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The configuration of the AI Agent.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AIAgentConfiguration

        # The name of the AI Agent.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the AI Agent.

        @[JSON::Field(key: "type")]
        getter type : String

        # The visibility status of the AI Agent.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs ..

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the AI Agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_id : String,
          @configuration : Types::AIAgentConfiguration,
          @name : String,
          @type : String,
          @visibility_status : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAIAgentResponse
        include JSON::Serializable

        # The data of the created AI Agent.

        @[JSON::Field(key: "aiAgent")]
        getter ai_agent : Types::AIAgentData?

        def initialize(
          @ai_agent : Types::AIAgentData? = nil
        )
        end
      end


      struct CreateAIAgentVersionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Agent.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs ..

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The modification time of the AI Agent should be tracked for version creation. This field should be
        # specified to avoid version creation when simultaneous update to the underlying AI Agent are
        # possible. The value should be the modifiedTime returned from the request to create or update an AI
        # Agent so that version creation can fail if an update to the AI Agent post the specified modification
        # time has been made.

        @[JSON::Field(key: "modifiedTime")]
        getter modified_time : Time?

        def initialize(
          @ai_agent_id : String,
          @assistant_id : String,
          @client_token : String? = nil,
          @modified_time : Time? = nil
        )
        end
      end


      struct CreateAIAgentVersionResponse
        include JSON::Serializable

        # The data of the AI Agent version.

        @[JSON::Field(key: "aiAgent")]
        getter ai_agent : Types::AIAgentData?

        # The version number of the AI Agent version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @ai_agent : Types::AIAgentData? = nil,
          @version_number : Int64? = nil
        )
        end
      end


      struct CreateAIGuardrailRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The message to return when the AI Guardrail blocks a prompt.

        @[JSON::Field(key: "blockedInputMessaging")]
        getter blocked_input_messaging : String

        # The message to return when the AI Guardrail blocks a model response.

        @[JSON::Field(key: "blockedOutputsMessaging")]
        getter blocked_outputs_messaging : String

        # The name of the AI Guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # The visibility status of the AI Guardrail.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs ..

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The content filter policies to configure for the AI Guardrail.

        @[JSON::Field(key: "contentPolicyConfig")]
        getter content_policy_config : Types::AIGuardrailContentPolicyConfig?

        # The contextual grounding policy configuration used to create an AI Guardrail.

        @[JSON::Field(key: "contextualGroundingPolicyConfig")]
        getter contextual_grounding_policy_config : Types::AIGuardrailContextualGroundingPolicyConfig?

        # A description of the AI Guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The sensitive information policy to configure for the AI Guardrail.

        @[JSON::Field(key: "sensitiveInformationPolicyConfig")]
        getter sensitive_information_policy_config : Types::AIGuardrailSensitiveInformationPolicyConfig?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The topic policies to configure for the AI Guardrail.

        @[JSON::Field(key: "topicPolicyConfig")]
        getter topic_policy_config : Types::AIGuardrailTopicPolicyConfig?

        # The word policy you configure for the AI Guardrail.

        @[JSON::Field(key: "wordPolicyConfig")]
        getter word_policy_config : Types::AIGuardrailWordPolicyConfig?

        def initialize(
          @assistant_id : String,
          @blocked_input_messaging : String,
          @blocked_outputs_messaging : String,
          @name : String,
          @visibility_status : String,
          @client_token : String? = nil,
          @content_policy_config : Types::AIGuardrailContentPolicyConfig? = nil,
          @contextual_grounding_policy_config : Types::AIGuardrailContextualGroundingPolicyConfig? = nil,
          @description : String? = nil,
          @sensitive_information_policy_config : Types::AIGuardrailSensitiveInformationPolicyConfig? = nil,
          @tags : Hash(String, String)? = nil,
          @topic_policy_config : Types::AIGuardrailTopicPolicyConfig? = nil,
          @word_policy_config : Types::AIGuardrailWordPolicyConfig? = nil
        )
        end
      end


      struct CreateAIGuardrailResponse
        include JSON::Serializable

        # The data of the AI Guardrail.

        @[JSON::Field(key: "aiGuardrail")]
        getter ai_guardrail : Types::AIGuardrailData?

        def initialize(
          @ai_guardrail : Types::AIGuardrailData? = nil
        )
        end
      end


      struct CreateAIGuardrailVersionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Guardrail.

        @[JSON::Field(key: "aiGuardrailId")]
        getter ai_guardrail_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs ..

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The time the AI Guardrail was last modified.

        @[JSON::Field(key: "modifiedTime")]
        getter modified_time : Time?

        def initialize(
          @ai_guardrail_id : String,
          @assistant_id : String,
          @client_token : String? = nil,
          @modified_time : Time? = nil
        )
        end
      end


      struct CreateAIGuardrailVersionResponse
        include JSON::Serializable

        # The data of the AI Guardrail version.

        @[JSON::Field(key: "aiGuardrail")]
        getter ai_guardrail : Types::AIGuardrailData?

        # The version number of the AI Guardrail version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @ai_guardrail : Types::AIGuardrailData? = nil,
          @version_number : Int64? = nil
        )
        end
      end


      struct CreateAIPromptRequest
        include JSON::Serializable

        # The API Format of the AI Prompt. Recommended values: MESSAGES | TEXT_COMPLETIONS The values
        # ANTHROPIC_CLAUDE_MESSAGES | ANTHROPIC_CLAUDE_TEXT_COMPLETIONS will be deprecated.

        @[JSON::Field(key: "apiFormat")]
        getter api_format : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the model used for this AI Prompt. For information about which models are
        # supported in each Amazon Web Services Region, see Supported models for system/custom prompts .

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The name of the AI Prompt.

        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration of the prompt template for this AI Prompt.

        @[JSON::Field(key: "templateConfiguration")]
        getter template_configuration : Types::AIPromptTemplateConfiguration

        # The type of the prompt template for this AI Prompt.

        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # The type of this AI Prompt.

        @[JSON::Field(key: "type")]
        getter type : String

        # The visibility status of the AI Prompt.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs ..

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the AI Prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The inference configuration for the AI Prompt being created.

        @[JSON::Field(key: "inferenceConfiguration")]
        getter inference_configuration : Types::AIPromptInferenceConfiguration?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @api_format : String,
          @assistant_id : String,
          @model_id : String,
          @name : String,
          @template_configuration : Types::AIPromptTemplateConfiguration,
          @template_type : String,
          @type : String,
          @visibility_status : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @inference_configuration : Types::AIPromptInferenceConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAIPromptResponse
        include JSON::Serializable

        # The data of the AI Prompt.

        @[JSON::Field(key: "aiPrompt")]
        getter ai_prompt : Types::AIPromptData?

        def initialize(
          @ai_prompt : Types::AIPromptData? = nil
        )
        end
      end


      struct CreateAIPromptVersionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI prompt.

        @[JSON::Field(key: "aiPromptId")]
        getter ai_prompt_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs ..

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The time the AI Prompt was last modified.

        @[JSON::Field(key: "modifiedTime")]
        getter modified_time : Time?

        def initialize(
          @ai_prompt_id : String,
          @assistant_id : String,
          @client_token : String? = nil,
          @modified_time : Time? = nil
        )
        end
      end


      struct CreateAIPromptVersionResponse
        include JSON::Serializable

        # The data of the AI Prompt version.

        @[JSON::Field(key: "aiPrompt")]
        getter ai_prompt : Types::AIPromptData?

        # The version number of the AI Prompt version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @ai_prompt : Types::AIPromptData? = nil,
          @version_number : Int64? = nil
        )
        end
      end


      struct CreateAssistantAssociationRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the associated resource.

        @[JSON::Field(key: "association")]
        getter association : Types::AssistantAssociationInputData

        # The type of association.

        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_id : String,
          @association : Types::AssistantAssociationInputData,
          @association_type : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAssistantAssociationResponse
        include JSON::Serializable

        # The assistant association.

        @[JSON::Field(key: "assistantAssociation")]
        getter assistant_association : Types::AssistantAssociationData?

        def initialize(
          @assistant_association : Types::AssistantAssociationData? = nil
        )
        end
      end


      struct CreateAssistantRequest
        include JSON::Serializable

        # The name of the assistant.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of assistant.

        @[JSON::Field(key: "type")]
        getter type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the assistant.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information for the customer managed key used for encryption. The customer managed
        # key must have a policy that allows kms:CreateGrant , kms:DescribeKey , kms:Decrypt , and
        # kms:GenerateDataKey* permissions to the IAM identity using the key to invoke Amazon Q in Connect. To
        # use Amazon Q in Connect with chat, the key policy must also allow kms:Decrypt , kms:GenerateDataKey*
        # , and kms:DescribeKey permissions to the connect.amazonaws.com service principal. For more
        # information about setting up a customer managed key for Amazon Q in Connect, see Enable Amazon Q in
        # Connect for your instance .

        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAssistantResponse
        include JSON::Serializable

        # Information about the assistant.

        @[JSON::Field(key: "assistant")]
        getter assistant : Types::AssistantData?

        def initialize(
          @assistant : Types::AssistantData? = nil
        )
        end
      end


      struct CreateContentAssociationRequest
        include JSON::Serializable

        # The identifier of the associated resource.

        @[JSON::Field(key: "association")]
        getter association : Types::ContentAssociationContents

        # The type of association.

        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # The identifier of the content.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @association : Types::ContentAssociationContents,
          @association_type : String,
          @content_id : String,
          @knowledge_base_id : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateContentAssociationResponse
        include JSON::Serializable

        # The association between Amazon Q in Connect content and another resource.

        @[JSON::Field(key: "contentAssociation")]
        getter content_association : Types::ContentAssociationData?

        def initialize(
          @content_association : Types::ContentAssociationData? = nil
        )
        end
      end


      struct CreateContentRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base. Can
        # be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The name of the content. Each piece of content in a knowledge base must have a unique name. You can
        # retrieve a piece of content using only its knowledge base and its name with the SearchContent API.

        @[JSON::Field(key: "name")]
        getter name : String

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A key/value map to store attributes without affecting tagging or recommendations. For example, when
        # synchronizing data between an external system and Amazon Q in Connect, you can store an external
        # version identifier as metadata to utilize for determining drift.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The URI you want to use for the article. If the knowledge base has a templateUri, setting this
        # argument overrides it for this piece of content.

        @[JSON::Field(key: "overrideLinkOutUri")]
        getter override_link_out_uri : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The title of the content. If not set, the title is equal to the name.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @knowledge_base_id : String,
          @name : String,
          @upload_id : String,
          @client_token : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @override_link_out_uri : String? = nil,
          @tags : Hash(String, String)? = nil,
          @title : String? = nil
        )
        end
      end


      struct CreateContentResponse
        include JSON::Serializable

        # The content.

        @[JSON::Field(key: "content")]
        getter content : Types::ContentData?

        def initialize(
          @content : Types::ContentData? = nil
        )
        end
      end


      struct CreateKnowledgeBaseRequest
        include JSON::Serializable

        # The type of knowledge base. Only CUSTOM knowledge bases allow you to upload your own content.
        # EXTERNAL knowledge bases support integrations with third-party systems whose content is synchronized
        # automatically.

        @[JSON::Field(key: "knowledgeBaseType")]
        getter knowledge_base_type : String

        # The name of the knowledge base.

        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about how to render the content.

        @[JSON::Field(key: "renderingConfiguration")]
        getter rendering_configuration : Types::RenderingConfiguration?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , kms:Decrypt , and kms:GenerateDataKey*
        # permissions to the IAM identity using the key to invoke Amazon Q in Connect. For more information
        # about setting up a customer managed key for Amazon Q in Connect, see Enable Amazon Q in Connect for
        # your instance .

        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The source of the knowledge base content. Only set this argument for EXTERNAL or Managed knowledge
        # bases.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Contains details about how to ingest the documents in a data source.

        @[JSON::Field(key: "vectorIngestionConfiguration")]
        getter vector_ingestion_configuration : Types::VectorIngestionConfiguration?

        def initialize(
          @knowledge_base_type : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @rendering_configuration : Types::RenderingConfiguration? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @source_configuration : Types::SourceConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @vector_ingestion_configuration : Types::VectorIngestionConfiguration? = nil
        )
        end
      end


      struct CreateKnowledgeBaseResponse
        include JSON::Serializable

        # The knowledge base.

        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBaseData?

        def initialize(
          @knowledge_base : Types::KnowledgeBaseData? = nil
        )
        end
      end


      struct CreateMessageTemplateAttachmentRequest
        include JSON::Serializable

        # The body of the attachment file being uploaded. It should be encoded using base64 encoding.

        @[JSON::Field(key: "body")]
        getter body : String

        # The presentation information for the attachment file.

        @[JSON::Field(key: "contentDisposition")]
        getter content_disposition : String

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN. It cannot contain any
        # qualifier.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The name of the attachment file being uploaded. The name should include the file extension.

        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @body : String,
          @content_disposition : String,
          @knowledge_base_id : String,
          @message_template_id : String,
          @name : String,
          @client_token : String? = nil
        )
        end
      end


      struct CreateMessageTemplateAttachmentResponse
        include JSON::Serializable

        # The message template attachment.

        @[JSON::Field(key: "attachment")]
        getter attachment : Types::MessageTemplateAttachment?

        def initialize(
          @attachment : Types::MessageTemplateAttachment? = nil
        )
        end
      end


      struct CreateMessageTemplateRequest
        include JSON::Serializable

        # The channel subtype this message template applies to.

        @[JSON::Field(key: "channelSubtype")]
        getter channel_subtype : String

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The content of the message template.

        @[JSON::Field(key: "content")]
        getter content : Types::MessageTemplateContentProvider?

        # An object that specifies the default values to use for variables in the message template. This
        # object contains different categories of key-value pairs. Each key defines a variable or placeholder
        # in the message template. The corresponding value defines the default value for that variable.

        @[JSON::Field(key: "defaultAttributes")]
        getter default_attributes : Types::MessageTemplateAttributes?

        # The description of the message template.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW

        @[JSON::Field(key: "language")]
        getter language : String?

        # The name of the message template.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The source configuration of the message template. Only set this argument for WHATSAPP channel
        # subtype.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::MessageTemplateSourceConfiguration?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @channel_subtype : String,
          @knowledge_base_id : String,
          @client_token : String? = nil,
          @content : Types::MessageTemplateContentProvider? = nil,
          @default_attributes : Types::MessageTemplateAttributes? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @language : String? = nil,
          @name : String? = nil,
          @source_configuration : Types::MessageTemplateSourceConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMessageTemplateResponse
        include JSON::Serializable

        # The message template.

        @[JSON::Field(key: "messageTemplate")]
        getter message_template : Types::MessageTemplateData?

        def initialize(
          @message_template : Types::MessageTemplateData? = nil
        )
        end
      end


      struct CreateMessageTemplateVersionRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN. It cannot contain any
        # qualifier.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The checksum value of the message template content that is referenced by the $LATEST qualifier. It
        # can be returned in MessageTemplateData or ExtendedMessageTemplateData . It’s calculated by content,
        # language, defaultAttributes and Attachments of the message template. If not supplied, the message
        # template version will be created based on the message template content that is referenced by the
        # $LATEST qualifier by default.

        @[JSON::Field(key: "messageTemplateContentSha256")]
        getter message_template_content_sha256 : String?

        def initialize(
          @knowledge_base_id : String,
          @message_template_id : String,
          @message_template_content_sha256 : String? = nil
        )
        end
      end


      struct CreateMessageTemplateVersionResponse
        include JSON::Serializable

        # The message template.

        @[JSON::Field(key: "messageTemplate")]
        getter message_template : Types::ExtendedMessageTemplateData?

        def initialize(
          @message_template : Types::ExtendedMessageTemplateData? = nil
        )
        end
      end


      struct CreateQuickResponseRequest
        include JSON::Serializable

        # The content of the quick response.

        @[JSON::Field(key: "content")]
        getter content : Types::QuickResponseDataProvider

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The name of the quick response.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Connect channels this quick response applies to.

        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for a
        # quick response written in plain text. Use application/x.quickresponse;format=markdown for a quick
        # response written in richtext.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The description of the quick response.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information of the user groups that the quick response is accessible to.

        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # Whether the quick response is active.

        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW

        @[JSON::Field(key: "language")]
        getter language : String?

        # The shortcut key of the quick response. The value should be unique across the knowledge base.

        @[JSON::Field(key: "shortcutKey")]
        getter shortcut_key : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content : Types::QuickResponseDataProvider,
          @knowledge_base_id : String,
          @name : String,
          @channels : Array(String)? = nil,
          @client_token : String? = nil,
          @content_type : String? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @is_active : Bool? = nil,
          @language : String? = nil,
          @shortcut_key : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateQuickResponseResponse
        include JSON::Serializable

        # The quick response.

        @[JSON::Field(key: "quickResponse")]
        getter quick_response : Types::QuickResponseData?

        def initialize(
          @quick_response : Types::QuickResponseData? = nil
        )
        end
      end


      struct CreateSessionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The name of the session.

        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration of the AI Agents (mapped by AI Agent Type to AI Agent version) that should be used
        # by Amazon Q in Connect for this Session.

        @[JSON::Field(key: "aiAgentConfiguration")]
        getter ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the email contact in Amazon Connect. Used to retrieve email
        # content and establish session context for AI-powered email assistance.

        @[JSON::Field(key: "contactArn")]
        getter contact_arn : String?

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The list of orchestrator configurations for the session being created.

        @[JSON::Field(key: "orchestratorConfigurationList")]
        getter orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)?

        # The list of orchestrator configurations to remove from the session.

        @[JSON::Field(key: "removeOrchestratorConfigurationList")]
        getter remove_orchestrator_configuration_list : Bool?

        # An object that can be used to specify Tag conditions.

        @[JSON::Field(key: "tagFilter")]
        getter tag_filter : Types::TagFilter?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_id : String,
          @name : String,
          @ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)? = nil,
          @client_token : String? = nil,
          @contact_arn : String? = nil,
          @description : String? = nil,
          @orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)? = nil,
          @remove_orchestrator_configuration_list : Bool? = nil,
          @tag_filter : Types::TagFilter? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSessionResponse
        include JSON::Serializable

        # The session.

        @[JSON::Field(key: "session")]
        getter session : Types::SessionData?

        def initialize(
          @session : Types::SessionData? = nil
        )
        end
      end

      # The customer profile attributes that are used with the message template.

      struct CustomerProfileAttributes
        include JSON::Serializable

        # A unique account number that you have given to the customer.

        @[JSON::Field(key: "accountNumber")]
        getter account_number : String?

        # Any additional information relevant to the customer's profile.

        @[JSON::Field(key: "additionalInformation")]
        getter additional_information : String?

        # The first line of a customer address.

        @[JSON::Field(key: "address1")]
        getter address1 : String?

        # The second line of a customer address.

        @[JSON::Field(key: "address2")]
        getter address2 : String?

        # The third line of a customer address.

        @[JSON::Field(key: "address3")]
        getter address3 : String?

        # The fourth line of a customer address.

        @[JSON::Field(key: "address4")]
        getter address4 : String?

        # The first line of a customer’s billing address.

        @[JSON::Field(key: "billingAddress1")]
        getter billing_address1 : String?

        # The second line of a customer’s billing address.

        @[JSON::Field(key: "billingAddress2")]
        getter billing_address2 : String?

        # The third line of a customer’s billing address.

        @[JSON::Field(key: "billingAddress3")]
        getter billing_address3 : String?

        # The fourth line of a customer’s billing address.

        @[JSON::Field(key: "billingAddress4")]
        getter billing_address4 : String?

        # The city of a customer’s billing address.

        @[JSON::Field(key: "billingCity")]
        getter billing_city : String?

        # The country of a customer’s billing address.

        @[JSON::Field(key: "billingCountry")]
        getter billing_country : String?

        # The county of a customer’s billing address.

        @[JSON::Field(key: "billingCounty")]
        getter billing_county : String?

        # The postal code of a customer’s billing address.

        @[JSON::Field(key: "billingPostalCode")]
        getter billing_postal_code : String?

        # The province of a customer’s billing address.

        @[JSON::Field(key: "billingProvince")]
        getter billing_province : String?

        # The state of a customer’s billing address.

        @[JSON::Field(key: "billingState")]
        getter billing_state : String?

        # The customer's birth date.

        @[JSON::Field(key: "birthDate")]
        getter birth_date : String?

        # The customer's business email address.

        @[JSON::Field(key: "businessEmailAddress")]
        getter business_email_address : String?

        # The name of the customer's business.

        @[JSON::Field(key: "businessName")]
        getter business_name : String?

        # The customer's business phone number.

        @[JSON::Field(key: "businessPhoneNumber")]
        getter business_phone_number : String?

        # The city in which a customer lives.

        @[JSON::Field(key: "city")]
        getter city : String?

        # The country in which a customer lives.

        @[JSON::Field(key: "country")]
        getter country : String?

        # The county in which a customer lives.

        @[JSON::Field(key: "county")]
        getter county : String?

        # The custom attributes in customer profile attributes.

        @[JSON::Field(key: "custom")]
        getter custom : Hash(String, String)?

        # The customer's email address, which has not been specified as a personal or business address.

        @[JSON::Field(key: "emailAddress")]
        getter email_address : String?

        # The customer's first name.

        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # The customer's gender.

        @[JSON::Field(key: "gender")]
        getter gender : String?

        # The customer's mobile phone number.

        @[JSON::Field(key: "homePhoneNumber")]
        getter home_phone_number : String?

        # The customer's last name.

        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # The first line of a customer’s mailing address.

        @[JSON::Field(key: "mailingAddress1")]
        getter mailing_address1 : String?

        # The second line of a customer’s mailing address.

        @[JSON::Field(key: "mailingAddress2")]
        getter mailing_address2 : String?

        # The third line of a customer’s mailing address.

        @[JSON::Field(key: "mailingAddress3")]
        getter mailing_address3 : String?

        # The fourth line of a customer’s mailing address.

        @[JSON::Field(key: "mailingAddress4")]
        getter mailing_address4 : String?

        # The city of a customer’s mailing address.

        @[JSON::Field(key: "mailingCity")]
        getter mailing_city : String?

        # The country of a customer’s mailing address.

        @[JSON::Field(key: "mailingCountry")]
        getter mailing_country : String?

        # The county of a customer’s mailing address.

        @[JSON::Field(key: "mailingCounty")]
        getter mailing_county : String?

        # The postal code of a customer’s mailing address.

        @[JSON::Field(key: "mailingPostalCode")]
        getter mailing_postal_code : String?

        # The province of a customer’s mailing address.

        @[JSON::Field(key: "mailingProvince")]
        getter mailing_province : String?

        # The state of a customer’s mailing address.

        @[JSON::Field(key: "mailingState")]
        getter mailing_state : String?

        # The customer's middle name.

        @[JSON::Field(key: "middleName")]
        getter middle_name : String?

        # The customer's mobile phone number.

        @[JSON::Field(key: "mobilePhoneNumber")]
        getter mobile_phone_number : String?

        # The customer's party type.

        @[JSON::Field(key: "partyType")]
        getter party_type : String?

        # The customer's phone number, which has not been specified as a mobile, home, or business number.

        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String?

        # The postal code of a customer address.

        @[JSON::Field(key: "postalCode")]
        getter postal_code : String?

        # The ARN of a customer profile.

        @[JSON::Field(key: "profileARN")]
        getter profile_arn : String?

        # The unique identifier of a customer profile.

        @[JSON::Field(key: "profileId")]
        getter profile_id : String?

        # The province in which a customer lives.

        @[JSON::Field(key: "province")]
        getter province : String?

        # The first line of a customer’s shipping address.

        @[JSON::Field(key: "shippingAddress1")]
        getter shipping_address1 : String?

        # The second line of a customer’s shipping address.

        @[JSON::Field(key: "shippingAddress2")]
        getter shipping_address2 : String?

        # The third line of a customer’s shipping address.

        @[JSON::Field(key: "shippingAddress3")]
        getter shipping_address3 : String?

        # The fourth line of a customer’s shipping address.

        @[JSON::Field(key: "shippingAddress4")]
        getter shipping_address4 : String?

        # The city of a customer’s shipping address.

        @[JSON::Field(key: "shippingCity")]
        getter shipping_city : String?

        # The country of a customer’s shipping address.

        @[JSON::Field(key: "shippingCountry")]
        getter shipping_country : String?

        # The county of a customer’s shipping address.

        @[JSON::Field(key: "shippingCounty")]
        getter shipping_county : String?

        # The postal code of a customer’s shipping address.

        @[JSON::Field(key: "shippingPostalCode")]
        getter shipping_postal_code : String?

        # The province of a customer’s shipping address.

        @[JSON::Field(key: "shippingProvince")]
        getter shipping_province : String?

        # The state of a customer’s shipping address.

        @[JSON::Field(key: "shippingState")]
        getter shipping_state : String?

        # The state in which a customer lives.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @account_number : String? = nil,
          @additional_information : String? = nil,
          @address1 : String? = nil,
          @address2 : String? = nil,
          @address3 : String? = nil,
          @address4 : String? = nil,
          @billing_address1 : String? = nil,
          @billing_address2 : String? = nil,
          @billing_address3 : String? = nil,
          @billing_address4 : String? = nil,
          @billing_city : String? = nil,
          @billing_country : String? = nil,
          @billing_county : String? = nil,
          @billing_postal_code : String? = nil,
          @billing_province : String? = nil,
          @billing_state : String? = nil,
          @birth_date : String? = nil,
          @business_email_address : String? = nil,
          @business_name : String? = nil,
          @business_phone_number : String? = nil,
          @city : String? = nil,
          @country : String? = nil,
          @county : String? = nil,
          @custom : Hash(String, String)? = nil,
          @email_address : String? = nil,
          @first_name : String? = nil,
          @gender : String? = nil,
          @home_phone_number : String? = nil,
          @last_name : String? = nil,
          @mailing_address1 : String? = nil,
          @mailing_address2 : String? = nil,
          @mailing_address3 : String? = nil,
          @mailing_address4 : String? = nil,
          @mailing_city : String? = nil,
          @mailing_country : String? = nil,
          @mailing_county : String? = nil,
          @mailing_postal_code : String? = nil,
          @mailing_province : String? = nil,
          @mailing_state : String? = nil,
          @middle_name : String? = nil,
          @mobile_phone_number : String? = nil,
          @party_type : String? = nil,
          @phone_number : String? = nil,
          @postal_code : String? = nil,
          @profile_arn : String? = nil,
          @profile_id : String? = nil,
          @province : String? = nil,
          @shipping_address1 : String? = nil,
          @shipping_address2 : String? = nil,
          @shipping_address3 : String? = nil,
          @shipping_address4 : String? = nil,
          @shipping_city : String? = nil,
          @shipping_country : String? = nil,
          @shipping_county : String? = nil,
          @shipping_postal_code : String? = nil,
          @shipping_province : String? = nil,
          @shipping_state : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Details about the data.

      struct DataDetails
        include JSON::Serializable

        # Details about case summarization chunk data.

        @[JSON::Field(key: "caseSummarizationChunkData")]
        getter case_summarization_chunk_data : Types::CaseSummarizationChunkDataDetails?

        # Details about the content data.

        @[JSON::Field(key: "contentData")]
        getter content_data : Types::ContentDataDetails?

        # Streaming chunk data for email generative answers containing partial knowledge-based response
        # content.

        @[JSON::Field(key: "emailGenerativeAnswerChunkData")]
        getter email_generative_answer_chunk_data : Types::EmailGenerativeAnswerChunkDataDetails?

        # Streaming chunk data for email overview containing partial overview content.

        @[JSON::Field(key: "emailOverviewChunkData")]
        getter email_overview_chunk_data : Types::EmailOverviewChunkDataDetails?

        # Streaming chunk data for email response generation containing partial response content.

        @[JSON::Field(key: "emailResponseChunkData")]
        getter email_response_chunk_data : Types::EmailResponseChunkDataDetails?

        # Details about the generative chunk data.

        @[JSON::Field(key: "generativeChunkData")]
        getter generative_chunk_data : Types::GenerativeChunkDataDetails?

        # Details about the generative data.

        @[JSON::Field(key: "generativeData")]
        getter generative_data : Types::GenerativeDataDetails?

        # Details about the intent data.

        @[JSON::Field(key: "intentDetectedData")]
        getter intent_detected_data : Types::IntentDetectedDataDetails?

        # Details about notes chunk data.

        @[JSON::Field(key: "notesChunkData")]
        getter notes_chunk_data : Types::NotesChunkDataDetails?

        # Details about notes data.

        @[JSON::Field(key: "notesData")]
        getter notes_data : Types::NotesDataDetails?

        # Details about the content data.

        @[JSON::Field(key: "sourceContentData")]
        getter source_content_data : Types::SourceContentDataDetails?

        # Details about suggested message data.

        @[JSON::Field(key: "suggestedMessageData")]
        getter suggested_message_data : Types::SuggestedMessageDataDetails?

        def initialize(
          @case_summarization_chunk_data : Types::CaseSummarizationChunkDataDetails? = nil,
          @content_data : Types::ContentDataDetails? = nil,
          @email_generative_answer_chunk_data : Types::EmailGenerativeAnswerChunkDataDetails? = nil,
          @email_overview_chunk_data : Types::EmailOverviewChunkDataDetails? = nil,
          @email_response_chunk_data : Types::EmailResponseChunkDataDetails? = nil,
          @generative_chunk_data : Types::GenerativeChunkDataDetails? = nil,
          @generative_data : Types::GenerativeDataDetails? = nil,
          @intent_detected_data : Types::IntentDetectedDataDetails? = nil,
          @notes_chunk_data : Types::NotesChunkDataDetails? = nil,
          @notes_data : Types::NotesDataDetails? = nil,
          @source_content_data : Types::SourceContentDataDetails? = nil,
          @suggested_message_data : Types::SuggestedMessageDataDetails? = nil
        )
        end
      end

      # Reference data.

      struct DataReference
        include JSON::Serializable


        @[JSON::Field(key: "contentReference")]
        getter content_reference : Types::ContentReference?

        # Reference information about the generative content.

        @[JSON::Field(key: "generativeReference")]
        getter generative_reference : Types::GenerativeReference?

        # Reference information for suggested messages.

        @[JSON::Field(key: "suggestedMessageReference")]
        getter suggested_message_reference : Types::SuggestedMessageReference?

        def initialize(
          @content_reference : Types::ContentReference? = nil,
          @generative_reference : Types::GenerativeReference? = nil,
          @suggested_message_reference : Types::SuggestedMessageReference? = nil
        )
        end
      end

      # Summary of the data.

      struct DataSummary
        include JSON::Serializable

        # Details about the data.

        @[JSON::Field(key: "details")]
        getter details : Types::DataDetails

        # Reference information about the content.

        @[JSON::Field(key: "reference")]
        getter reference : Types::DataReference

        def initialize(
          @details : Types::DataDetails,
          @reference : Types::DataReference
        )
        end
      end


      struct DeactivateMessageTemplateRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN. It cannot contain any
        # qualifier.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The version number of the message template version to deactivate.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64

        def initialize(
          @knowledge_base_id : String,
          @message_template_id : String,
          @version_number : Int64
        )
        end
      end


      struct DeactivateMessageTemplateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "messageTemplateArn")]
        getter message_template_arn : String

        # The identifier of the message template.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The version number of the message template version that has been deactivated.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64

        def initialize(
          @message_template_arn : String,
          @message_template_id : String,
          @version_number : Int64
        )
        end
      end


      struct DeleteAIAgentRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Agent. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @ai_agent_id : String,
          @assistant_id : String
        )
        end
      end


      struct DeleteAIAgentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAIAgentVersionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Agent. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The version number of the AI Agent version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64

        def initialize(
          @ai_agent_id : String,
          @assistant_id : String,
          @version_number : Int64
        )
        end
      end


      struct DeleteAIAgentVersionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAIGuardrailRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Guardrail. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "aiGuardrailId")]
        getter ai_guardrail_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @ai_guardrail_id : String,
          @assistant_id : String
        )
        end
      end


      struct DeleteAIGuardrailResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAIGuardrailVersionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Guardrail.

        @[JSON::Field(key: "aiGuardrailId")]
        getter ai_guardrail_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The version number of the AI Guardrail version to be deleted.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64

        def initialize(
          @ai_guardrail_id : String,
          @assistant_id : String,
          @version_number : Int64
        )
        end
      end


      struct DeleteAIGuardrailVersionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAIPromptRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI prompt. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "aiPromptId")]
        getter ai_prompt_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @ai_prompt_id : String,
          @assistant_id : String
        )
        end
      end


      struct DeleteAIPromptResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAIPromptVersionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI prompt.

        @[JSON::Field(key: "aiPromptId")]
        getter ai_prompt_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The version number of the AI Prompt version to be deleted.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64

        def initialize(
          @ai_prompt_id : String,
          @assistant_id : String,
          @version_number : Int64
        )
        end
      end


      struct DeleteAIPromptVersionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAssistantAssociationRequest
        include JSON::Serializable

        # The identifier of the assistant association. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.

        @[JSON::Field(key: "assistantAssociationId")]
        getter assistant_association_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @assistant_association_id : String,
          @assistant_id : String
        )
        end
      end


      struct DeleteAssistantAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAssistantRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @assistant_id : String
        )
        end
      end


      struct DeleteAssistantResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteContentAssociationRequest
        include JSON::Serializable

        # The identifier of the content association. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.

        @[JSON::Field(key: "contentAssociationId")]
        getter content_association_id : String

        # The identifier of the content.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @content_association_id : String,
          @content_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct DeleteContentAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteContentRequest
        include JSON::Serializable

        # The identifier of the content. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @content_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct DeleteContentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteImportJobRequest
        include JSON::Serializable

        # The identifier of the import job to be deleted.

        @[JSON::Field(key: "importJobId")]
        getter import_job_id : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @import_job_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct DeleteImportJobResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteKnowledgeBaseRequest
        include JSON::Serializable

        # The knowledge base to delete content from. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @knowledge_base_id : String
        )
        end
      end


      struct DeleteKnowledgeBaseResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMessageTemplateAttachmentRequest
        include JSON::Serializable

        # The identifier of the attachment file.

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN. It cannot contain any
        # qualifier.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        def initialize(
          @attachment_id : String,
          @knowledge_base_id : String,
          @message_template_id : String
        )
        end
      end


      struct DeleteMessageTemplateAttachmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMessageTemplateRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        def initialize(
          @knowledge_base_id : String,
          @message_template_id : String
        )
        end
      end


      struct DeleteMessageTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteQuickResponseRequest
        include JSON::Serializable

        # The knowledge base from which the quick response is deleted. The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the quick response to delete.

        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        def initialize(
          @knowledge_base_id : String,
          @quick_response_id : String
        )
        end
      end


      struct DeleteQuickResponseResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request failed because it depends on another request that failed.

      struct DependencyFailedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The document.

      struct Document
        include JSON::Serializable

        # A reference to the content resource.

        @[JSON::Field(key: "contentReference")]
        getter content_reference : Types::ContentReference

        # The excerpt from the document.

        @[JSON::Field(key: "excerpt")]
        getter excerpt : Types::DocumentText?

        # The title of the document.

        @[JSON::Field(key: "title")]
        getter title : Types::DocumentText?

        def initialize(
          @content_reference : Types::ContentReference,
          @excerpt : Types::DocumentText? = nil,
          @title : Types::DocumentText? = nil
        )
        end
      end

      # The text of the document.

      struct DocumentText
        include JSON::Serializable

        # Highlights in the document text.

        @[JSON::Field(key: "highlights")]
        getter highlights : Array(Types::Highlight)?

        # Text in the document.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @highlights : Array(Types::Highlight)? = nil,
          @text : String? = nil
        )
        end
      end

      # Configuration settings for the EMAIL_GENERATIVE_ANSWER AI agent including prompts, locale, and
      # knowledge base associations.

      struct EmailGenerativeAnswerAIAgentConfiguration
        include JSON::Serializable

        # Configuration settings for knowledge base associations used by the email generative answer agent.

        @[JSON::Field(key: "associationConfigurations")]
        getter association_configurations : Array(Types::AssociationConfiguration)?

        # The ID of the System AI prompt used for generating comprehensive knowledge-based answers from email
        # queries.

        @[JSON::Field(key: "emailGenerativeAnswerAIPromptId")]
        getter email_generative_answer_ai_prompt_id : String?

        # The ID of the System AI prompt used for reformulating email queries to optimize knowledge base
        # search results.

        @[JSON::Field(key: "emailQueryReformulationAIPromptId")]
        getter email_query_reformulation_ai_prompt_id : String?

        # The locale setting for language-specific email processing and response generation (for example,
        # en_US, es_ES).

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @association_configurations : Array(Types::AssociationConfiguration)? = nil,
          @email_generative_answer_ai_prompt_id : String? = nil,
          @email_query_reformulation_ai_prompt_id : String? = nil,
          @locale : String? = nil
        )
        end
      end

      # Details of streaming chunk data for email generative answers including completion text and
      # references.

      struct EmailGenerativeAnswerChunkDataDetails
        include JSON::Serializable

        # The partial or complete text content of the generative answer response.

        @[JSON::Field(key: "completion")]
        getter completion : String?

        # Token for retrieving the next chunk of streaming response data, if available.

        @[JSON::Field(key: "nextChunkToken")]
        getter next_chunk_token : String?

        # Source references and citations from knowledge base articles used to generate the answer.

        @[JSON::Field(key: "references")]
        getter references : Array(Types::DataSummary)?

        def initialize(
          @completion : String? = nil,
          @next_chunk_token : String? = nil,
          @references : Array(Types::DataSummary)? = nil
        )
        end
      end

      # The email header to include in email messages.

      struct EmailHeader
        include JSON::Serializable

        # The name of the email header.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the email header.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The content of the message template that applies to the email channel subtype.

      struct EmailMessageTemplateContent
        include JSON::Serializable

        # The body to use in email messages.

        @[JSON::Field(key: "body")]
        getter body : Types::EmailMessageTemplateContentBody?

        # The email headers to include in email messages.

        @[JSON::Field(key: "headers")]
        getter headers : Array(Types::EmailHeader)?

        # The subject line, or title, to use in email messages.

        @[JSON::Field(key: "subject")]
        getter subject : String?

        def initialize(
          @body : Types::EmailMessageTemplateContentBody? = nil,
          @headers : Array(Types::EmailHeader)? = nil,
          @subject : String? = nil
        )
        end
      end

      # The body to use in email messages.

      struct EmailMessageTemplateContentBody
        include JSON::Serializable

        # The message body, in HTML format, to use in email messages that are based on the message template.
        # We recommend using HTML format for email clients that render HTML content. You can include links,
        # formatted text, and more in an HTML message.

        @[JSON::Field(key: "html")]
        getter html : Types::MessageTemplateBodyContentProvider?

        # The message body, in plain text format, to use in email messages that are based on the message
        # template. We recommend using plain text format for email clients that don't render HTML content and
        # clients that are connected to high-latency networks, such as mobile devices.

        @[JSON::Field(key: "plainText")]
        getter plain_text : Types::MessageTemplateBodyContentProvider?

        def initialize(
          @html : Types::MessageTemplateBodyContentProvider? = nil,
          @plain_text : Types::MessageTemplateBodyContentProvider? = nil
        )
        end
      end

      # Configuration settings for the EMAIL_OVERVIEW AI agent including prompt ID and locale settings.

      struct EmailOverviewAIAgentConfiguration
        include JSON::Serializable

        # The ID of the System AI prompt used for generating structured email conversation summaries.

        @[JSON::Field(key: "emailOverviewAIPromptId")]
        getter email_overview_ai_prompt_id : String?

        # The locale setting for language-specific email overview processing (for example, en_US, es_ES).

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @email_overview_ai_prompt_id : String? = nil,
          @locale : String? = nil
        )
        end
      end

      # Details of streaming chunk data for email overview including completion text and pagination tokens.

      struct EmailOverviewChunkDataDetails
        include JSON::Serializable

        # The partial or complete overview text content in structured HTML format with customer issues,
        # resolutions, and next steps.

        @[JSON::Field(key: "completion")]
        getter completion : String?

        # Token for retrieving the next chunk of streaming overview data, if available.

        @[JSON::Field(key: "nextChunkToken")]
        getter next_chunk_token : String?

        def initialize(
          @completion : String? = nil,
          @next_chunk_token : String? = nil
        )
        end
      end

      # Configuration settings for the EMAIL_RESPONSE AI agent including prompts, locale, and knowledge base
      # associations.

      struct EmailResponseAIAgentConfiguration
        include JSON::Serializable

        # Configuration settings for knowledge base associations used by the email response agent.

        @[JSON::Field(key: "associationConfigurations")]
        getter association_configurations : Array(Types::AssociationConfiguration)?

        # The ID of the System AI prompt used for reformulating email queries to optimize knowledge base
        # search for response generation.

        @[JSON::Field(key: "emailQueryReformulationAIPromptId")]
        getter email_query_reformulation_ai_prompt_id : String?

        # The ID of the System AI prompt used for generating professional email responses based on knowledge
        # base content.

        @[JSON::Field(key: "emailResponseAIPromptId")]
        getter email_response_ai_prompt_id : String?

        # The locale setting for language-specific email response generation (for example, en_US, es_ES).

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @association_configurations : Array(Types::AssociationConfiguration)? = nil,
          @email_query_reformulation_ai_prompt_id : String? = nil,
          @email_response_ai_prompt_id : String? = nil,
          @locale : String? = nil
        )
        end
      end

      # Details of streaming chunk data for email responses including completion text and pagination tokens.

      struct EmailResponseChunkDataDetails
        include JSON::Serializable

        # The partial or complete professional email response text with appropriate greetings and closings.

        @[JSON::Field(key: "completion")]
        getter completion : String?

        # Token for retrieving the next chunk of streaming response data, if available.

        @[JSON::Field(key: "nextChunkToken")]
        getter next_chunk_token : String?

        def initialize(
          @completion : String? = nil,
          @next_chunk_token : String? = nil
        )
        end
      end

      # The extended data of a message template.

      struct ExtendedMessageTemplateData
        include JSON::Serializable

        # The channel subtype this message template applies to.

        @[JSON::Field(key: "channelSubtype")]
        getter channel_subtype : String

        # The timestamp when the message template was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The Amazon Resource Name (ARN) of the user who last updated the message template data.

        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String

        # The timestamp when the message template data was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "messageTemplateArn")]
        getter message_template_arn : String

        # The checksum value of the message template content that is referenced by the $LATEST qualifier. It
        # can be returned in MessageTemplateData or ExtendedMessageTemplateData . It’s calculated by content,
        # language, defaultAttributes and Attachments of the message template.

        @[JSON::Field(key: "messageTemplateContentSha256")]
        getter message_template_content_sha256 : String

        # The identifier of the message template.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The name of the message template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The message template attachments.

        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::MessageTemplateAttachment)?

        # The types of attributes contain the message template.

        @[JSON::Field(key: "attributeTypes")]
        getter attribute_types : Array(String)?

        # The channel of the message template.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        # The content of the message template.

        @[JSON::Field(key: "content")]
        getter content : Types::MessageTemplateContentProvider?

        # An object that specifies the default values to use for variables in the message template. This
        # object contains different categories of key-value pairs. Each key defines a variable or placeholder
        # in the message template. The corresponding value defines the default value for that variable.

        @[JSON::Field(key: "defaultAttributes")]
        getter default_attributes : Types::MessageTemplateAttributes?

        # The description of the message template.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # Whether the version of the message template is activated.

        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW

        @[JSON::Field(key: "language")]
        getter language : String?

        # The source configuration summary of the message template.

        @[JSON::Field(key: "sourceConfigurationSummary")]
        getter source_configuration_summary : Types::MessageTemplateSourceConfigurationSummary?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The version number of the message template version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @channel_subtype : String,
          @created_time : Time,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_by : String,
          @last_modified_time : Time,
          @message_template_arn : String,
          @message_template_content_sha256 : String,
          @message_template_id : String,
          @name : String,
          @attachments : Array(Types::MessageTemplateAttachment)? = nil,
          @attribute_types : Array(String)? = nil,
          @channel : String? = nil,
          @content : Types::MessageTemplateContentProvider? = nil,
          @default_attributes : Types::MessageTemplateAttributes? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @is_active : Bool? = nil,
          @language : String? = nil,
          @source_configuration_summary : Types::MessageTemplateSourceConfigurationSummary? = nil,
          @tags : Hash(String, String)? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      # Configuration for an external Bedrock knowledge base.

      struct ExternalBedrockKnowledgeBaseConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role used to access the external Bedrock knowledge base.

        @[JSON::Field(key: "accessRoleArn")]
        getter access_role_arn : String

        # The Amazon Resource Name (ARN) of the external Bedrock knowledge base.

        @[JSON::Field(key: "bedrockKnowledgeBaseArn")]
        getter bedrock_knowledge_base_arn : String

        def initialize(
          @access_role_arn : String,
          @bedrock_knowledge_base_arn : String
        )
        end
      end

      # The configuration information of the external data source.

      struct ExternalSourceConfiguration
        include JSON::Serializable

        # The configuration information of the external data source.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::Configuration

        # The type of the external data source.

        @[JSON::Field(key: "source")]
        getter source : String

        def initialize(
          @configuration : Types::Configuration,
          @source : String
        )
        end
      end

      # A search filter.

      struct Filter
        include JSON::Serializable

        # The field on which to filter.

        @[JSON::Field(key: "field")]
        getter field : String

        # The operator to use for comparing the field’s value with the provided value.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The desired field value on which to filter.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @field : String,
          @operator : String,
          @value : String
        )
        end
      end

      # An attribute used for filtering.

      struct FilterAttribute
        include JSON::Serializable

        # The key of the filter attribute.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the filter attribute.

        @[JSON::Field(key: "value")]
        getter value : Types::JSONDocument

        def initialize(
          @key : String,
          @value : Types::JSONDocument
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

      # Details about the generative chunk data.

      struct GenerativeChunkDataDetails
        include JSON::Serializable

        # A chunk of the LLM response.

        @[JSON::Field(key: "completion")]
        getter completion : String?

        # The token for the next set of chunks. Use the value returned in the previous response in the next
        # request to retrieve the next set of chunks.

        @[JSON::Field(key: "nextChunkToken")]
        getter next_chunk_token : String?

        # The references used to generate the LLM response.

        @[JSON::Field(key: "references")]
        getter references : Array(Types::DataSummary)?

        def initialize(
          @completion : String? = nil,
          @next_chunk_token : String? = nil,
          @references : Array(Types::DataSummary)? = nil
        )
        end
      end

      # The feedback information for a generative target type.

      struct GenerativeContentFeedbackData
        include JSON::Serializable

        # The relevance of the feedback.

        @[JSON::Field(key: "relevance")]
        getter relevance : String

        def initialize(
          @relevance : String
        )
        end
      end

      # Details about generative data.

      struct GenerativeDataDetails
        include JSON::Serializable

        # The LLM response.

        @[JSON::Field(key: "completion")]
        getter completion : String

        # Details about the generative content ranking data.

        @[JSON::Field(key: "rankingData")]
        getter ranking_data : Types::RankingData

        # The references used to generative the LLM response.

        @[JSON::Field(key: "references")]
        getter references : Array(Types::DataSummary)

        def initialize(
          @completion : String,
          @ranking_data : Types::RankingData,
          @references : Array(Types::DataSummary)
        )
        end
      end

      # Reference information about generative content.

      struct GenerativeReference
        include JSON::Serializable

        # The identifier of the LLM model.

        @[JSON::Field(key: "generationId")]
        getter generation_id : String?

        # The identifier of the LLM model.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        def initialize(
          @generation_id : String? = nil,
          @model_id : String? = nil
        )
        end
      end


      struct GetAIAgentRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Agent (with or without a version qualifier). Can be
        # either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @ai_agent_id : String,
          @assistant_id : String
        )
        end
      end


      struct GetAIAgentResponse
        include JSON::Serializable

        # The data of the AI Agent.

        @[JSON::Field(key: "aiAgent")]
        getter ai_agent : Types::AIAgentData?

        # The version number of the AI Agent version (returned if an AI Agent version was specified via use of
        # a qualifier for the aiAgentId on the request).

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @ai_agent : Types::AIAgentData? = nil,
          @version_number : Int64? = nil
        )
        end
      end


      struct GetAIGuardrailRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Guardrail.

        @[JSON::Field(key: "aiGuardrailId")]
        getter ai_guardrail_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @ai_guardrail_id : String,
          @assistant_id : String
        )
        end
      end


      struct GetAIGuardrailResponse
        include JSON::Serializable

        # The data of the AI Guardrail.

        @[JSON::Field(key: "aiGuardrail")]
        getter ai_guardrail : Types::AIGuardrailData?

        # The version number of the AI Guardrail version (returned if an AI Guardrail version was specified
        # via use of a qualifier for the aiGuardrailId on the request).

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @ai_guardrail : Types::AIGuardrailData? = nil,
          @version_number : Int64? = nil
        )
        end
      end


      struct GetAIPromptRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI prompt.

        @[JSON::Field(key: "aiPromptId")]
        getter ai_prompt_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @ai_prompt_id : String,
          @assistant_id : String
        )
        end
      end


      struct GetAIPromptResponse
        include JSON::Serializable

        # The data of the AI Prompt.

        @[JSON::Field(key: "aiPrompt")]
        getter ai_prompt : Types::AIPromptData?

        # The version number of the AI Prompt version (returned if an AI Prompt version was specified via use
        # of a qualifier for the aiPromptId on the request).

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @ai_prompt : Types::AIPromptData? = nil,
          @version_number : Int64? = nil
        )
        end
      end


      struct GetAssistantAssociationRequest
        include JSON::Serializable

        # The identifier of the assistant association. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.

        @[JSON::Field(key: "assistantAssociationId")]
        getter assistant_association_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @assistant_association_id : String,
          @assistant_id : String
        )
        end
      end


      struct GetAssistantAssociationResponse
        include JSON::Serializable

        # The assistant association.

        @[JSON::Field(key: "assistantAssociation")]
        getter assistant_association : Types::AssistantAssociationData?

        def initialize(
          @assistant_association : Types::AssistantAssociationData? = nil
        )
        end
      end


      struct GetAssistantRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @assistant_id : String
        )
        end
      end


      struct GetAssistantResponse
        include JSON::Serializable

        # Information about the assistant.

        @[JSON::Field(key: "assistant")]
        getter assistant : Types::AssistantData?

        def initialize(
          @assistant : Types::AssistantData? = nil
        )
        end
      end


      struct GetContentAssociationRequest
        include JSON::Serializable

        # The identifier of the content association. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.

        @[JSON::Field(key: "contentAssociationId")]
        getter content_association_id : String

        # The identifier of the content.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @content_association_id : String,
          @content_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct GetContentAssociationResponse
        include JSON::Serializable

        # The association between Amazon Q in Connect content and another resource.

        @[JSON::Field(key: "contentAssociation")]
        getter content_association : Types::ContentAssociationData?

        def initialize(
          @content_association : Types::ContentAssociationData? = nil
        )
        end
      end


      struct GetContentRequest
        include JSON::Serializable

        # The identifier of the content. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base. Can
        # be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @content_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct GetContentResponse
        include JSON::Serializable

        # The content.

        @[JSON::Field(key: "content")]
        getter content : Types::ContentData?

        def initialize(
          @content : Types::ContentData? = nil
        )
        end
      end


      struct GetContentSummaryRequest
        include JSON::Serializable

        # The identifier of the content. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @content_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct GetContentSummaryResponse
        include JSON::Serializable

        # The content summary.

        @[JSON::Field(key: "contentSummary")]
        getter content_summary : Types::ContentSummary?

        def initialize(
          @content_summary : Types::ContentSummary? = nil
        )
        end
      end


      struct GetImportJobRequest
        include JSON::Serializable

        # The identifier of the import job to retrieve.

        @[JSON::Field(key: "importJobId")]
        getter import_job_id : String

        # The identifier of the knowledge base that the import job belongs to.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @import_job_id : String,
          @knowledge_base_id : String
        )
        end
      end


      struct GetImportJobResponse
        include JSON::Serializable

        # The import job.

        @[JSON::Field(key: "importJob")]
        getter import_job : Types::ImportJobData?

        def initialize(
          @import_job : Types::ImportJobData? = nil
        )
        end
      end


      struct GetKnowledgeBaseRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @knowledge_base_id : String
        )
        end
      end


      struct GetKnowledgeBaseResponse
        include JSON::Serializable

        # The knowledge base.

        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBaseData?

        def initialize(
          @knowledge_base : Types::KnowledgeBaseData? = nil
        )
        end
      end


      struct GetMessageTemplateRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        def initialize(
          @knowledge_base_id : String,
          @message_template_id : String
        )
        end
      end


      struct GetMessageTemplateResponse
        include JSON::Serializable

        # The message template.

        @[JSON::Field(key: "messageTemplate")]
        getter message_template : Types::ExtendedMessageTemplateData?

        def initialize(
          @message_template : Types::ExtendedMessageTemplateData? = nil
        )
        end
      end


      struct GetNextMessageRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The token for the next message. Use the value returned in the SendMessage or previous response in
        # the next request to retrieve the next message.

        @[JSON::Field(key: "nextMessageToken")]
        getter next_message_token : String

        # The identifier of the Amazon Q in Connect session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @assistant_id : String,
          @next_message_token : String,
          @session_id : String
        )
        end
      end


      struct GetNextMessageResponse
        include JSON::Serializable

        # The state of current conversation.

        @[JSON::Field(key: "conversationState")]
        getter conversation_state : Types::ConversationState

        # The identifier of the submitted message.

        @[JSON::Field(key: "requestMessageId")]
        getter request_message_id : String

        # The message response to the requested message.

        @[JSON::Field(key: "response")]
        getter response : Types::MessageOutput

        # The type of message response.

        @[JSON::Field(key: "type")]
        getter type : String

        # Indicates whether the chunked response has been terminated.

        @[JSON::Field(key: "chunkedResponseTerminated")]
        getter chunked_response_terminated : Bool?

        # The conversation data stored on an Amazon Q in Connect Session.

        @[JSON::Field(key: "conversationSessionData")]
        getter conversation_session_data : Array(Types::RuntimeSessionData)?

        # The token for the next message.

        @[JSON::Field(key: "nextMessageToken")]
        getter next_message_token : String?

        def initialize(
          @conversation_state : Types::ConversationState,
          @request_message_id : String,
          @response : Types::MessageOutput,
          @type : String,
          @chunked_response_terminated : Bool? = nil,
          @conversation_session_data : Array(Types::RuntimeSessionData)? = nil,
          @next_message_token : String? = nil
        )
        end
      end


      struct GetQuickResponseRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should be a QUICK_RESPONSES type knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the quick response.

        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        def initialize(
          @knowledge_base_id : String,
          @quick_response_id : String
        )
        end
      end


      struct GetQuickResponseResponse
        include JSON::Serializable

        # The quick response.

        @[JSON::Field(key: "quickResponse")]
        getter quick_response : Types::QuickResponseData?

        def initialize(
          @quick_response : Types::QuickResponseData? = nil
        )
        end
      end


      struct GetRecommendationsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the session. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of chunks. Use the value returned in the previous response in the next
        # request to retrieve the next set of chunks.

        @[JSON::Field(key: "nextChunkToken")]
        getter next_chunk_token : String?

        # The type of recommendation being requested.

        @[JSON::Field(key: "recommendationType")]
        getter recommendation_type : String?

        # The duration (in seconds) for which the call waits for a recommendation to be made available before
        # returning. If a recommendation is available, the call returns sooner than WaitTimeSeconds . If no
        # messages are available and the wait time expires, the call returns successfully with an empty list.

        @[JSON::Field(key: "waitTimeSeconds")]
        getter wait_time_seconds : Int32?

        def initialize(
          @assistant_id : String,
          @session_id : String,
          @max_results : Int32? = nil,
          @next_chunk_token : String? = nil,
          @recommendation_type : String? = nil,
          @wait_time_seconds : Int32? = nil
        )
        end
      end


      struct GetRecommendationsResponse
        include JSON::Serializable

        # The recommendations.

        @[JSON::Field(key: "recommendations")]
        getter recommendations : Array(Types::RecommendationData)

        # The triggers corresponding to recommendations.

        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::RecommendationTrigger)?

        def initialize(
          @recommendations : Array(Types::RecommendationData),
          @triggers : Array(Types::RecommendationTrigger)? = nil
        )
        end
      end


      struct GetSessionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the session. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @assistant_id : String,
          @session_id : String
        )
        end
      end


      struct GetSessionResponse
        include JSON::Serializable

        # The session.

        @[JSON::Field(key: "session")]
        getter session : Types::SessionData?

        def initialize(
          @session : Types::SessionData? = nil
        )
        end
      end

      # The configuration information of the grouping of Amazon Q in Connect users.

      struct GroupingConfiguration
        include JSON::Serializable

        # The criteria used for grouping Amazon Q in Connect users. The following is the list of supported
        # criteria values. RoutingProfileArn : Grouping the users by their Amazon Connect routing profile ARN
        # . User should have SearchRoutingProfile and DescribeRoutingProfile permissions when setting criteria
        # to this value.

        @[JSON::Field(key: "criteria")]
        getter criteria : String?

        # The list of values that define different groups of Amazon Q in Connect users. When setting criteria
        # to RoutingProfileArn , you need to provide a list of ARNs of Amazon Connect routing profiles as
        # values of this parameter.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @criteria : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Contains filter strengths for harmful content. AI Guardrail's support the following content filters
      # to detect and filter harmful user inputs and FM-generated outputs. Hate : Describes input prompts
      # and model responses that discriminate, criticize, insult, denounce, or dehumanize a person or group
      # on the basis of an identity (such as race, ethnicity, gender, religion, sexual orientation, ability,
      # and national origin). Insults : Describes input prompts and model responses that includes demeaning,
      # humiliating, mocking, insulting, or belittling language. This type of language is also labeled as
      # bullying. Sexual : Describes input prompts and model responses that indicates sexual interest,
      # activity, or arousal using direct or indirect references to body parts, physical traits, or sex.
      # Violence : Describes input prompts and model responses that includes glorification of, or threats to
      # inflict physical pain, hurt, or injury toward a person, group, or thing. Content filtering depends
      # on the confidence classification of user inputs and FM responses across each of the four harmful
      # categories. All input and output statements are classified into one of four confidence levels (NONE,
      # LOW, MEDIUM, HIGH) for each harmful category. For example, if a statement is classified as Hate with
      # HIGH confidence, the likelihood of the statement representing hateful content is high. A single
      # statement can be classified across multiple categories with varying confidence levels. For example,
      # a single statement can be classified as Hate with HIGH confidence, Insults with LOW confidence,
      # Sexual with NONE confidence, and Violence with MEDIUM confidence.

      struct GuardrailContentFilterConfig
        include JSON::Serializable

        # The strength of the content filter to apply to prompts. As you increase the filter strength, the
        # likelihood of filtering harmful content increases and the probability of seeing harmful content in
        # your application reduces.

        @[JSON::Field(key: "inputStrength")]
        getter input_strength : String

        # The strength of the content filter to apply to model responses. As you increase the filter strength,
        # the likelihood of filtering harmful content increases and the probability of seeing harmful content
        # in your application reduces.

        @[JSON::Field(key: "outputStrength")]
        getter output_strength : String

        # The harmful category that the content filter is applied to.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @input_strength : String,
          @output_strength : String,
          @type : String
        )
        end
      end

      # The filter configuration details for the AI Guardrail's contextual grounding filter.

      struct GuardrailContextualGroundingFilterConfig
        include JSON::Serializable

        # The threshold details for the AI Guardrail's contextual grounding filter.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64

        # The filter type for the AI Guardrail's contextual grounding filter.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @threshold : Float64,
          @type : String
        )
        end
      end

      # The managed word list to configure for the AI Guardrail.

      struct GuardrailManagedWordsConfig
        include JSON::Serializable

        # The managed word type to configure for the AI Guardrail.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # The PII entity to configure for the AI Guardrail.

      struct GuardrailPiiEntityConfig
        include JSON::Serializable

        # Configure AI Guardrail's action when the PII entity is detected.

        @[JSON::Field(key: "action")]
        getter action : String

        # Configure AI Guardrail type when the PII entity is detected. The following PIIs are used to block or
        # mask sensitive information: General ADDRESS A physical address, such as "100 Main Street, Anytown,
        # USA" or "Suite #12, Building 123". An address can include information such as the street, building,
        # location, city, state, country, county, zip code, precinct, and neighborhood. AGE An individual's
        # age, including the quantity and unit of time. For example, in the phrase "I am 40 years old,"
        # Guarrails recognizes "40 years" as an age. NAME An individual's name. This entity type does not
        # include titles, such as Dr., Mr., Mrs., or Miss. AI Guardrail doesn't apply this entity type to
        # names that are part of organizations or addresses. For example, AI Guardrail recognizes the "John
        # Doe Organization" as an organization, and it recognizes "Jane Doe Street" as an address. EMAIL An
        # email address, such as marymajor@email.com . PHONE A phone number. This entity type also includes
        # fax and pager numbers. USERNAME A user name that identifies an account, such as a login name, screen
        # name, nick name, or handle. PASSWORD An alphanumeric string that is used as a password, such as "*
        # very20special#pass* ". DRIVER_ID The number assigned to a driver's license, which is an official
        # document permitting an individual to operate one or more motorized vehicles on a public road. A
        # driver's license number consists of alphanumeric characters. LICENSE_PLATE A license plate for a
        # vehicle is issued by the state or country where the vehicle is registered. The format for passenger
        # vehicles is typically five to eight digits, consisting of upper-case letters and numbers. The format
        # varies depending on the location of the issuing state or country. VEHICLE_IDENTIFICATION_NUMBER A
        # Vehicle Identification Number (VIN) uniquely identifies a vehicle. VIN content and format are
        # defined in the ISO 3779 specification. Each country has specific codes and formats for VINs. Finance
        # CREDIT_DEBIT_CARD_CVV A three-digit card verification code (CVV) that is present on VISA,
        # MasterCard, and Discover credit and debit cards. For American Express credit or debit cards, the CVV
        # is a four-digit numeric code. CREDIT_DEBIT_CARD_EXPIRY The expiration date for a credit or debit
        # card. This number is usually four digits long and is often formatted as month/year or MM/YY . AI
        # Guardrail recognizes expiration dates such as 01/21 , 01/2021 , and Jan 2021 .
        # CREDIT_DEBIT_CARD_NUMBER The number for a credit or debit card. These numbers can vary from 13 to 16
        # digits in length. However, Amazon Comprehend also recognizes credit or debit card numbers when only
        # the last four digits are present. PIN A four-digit personal identification number (PIN) with which
        # you can access your bank account. INTERNATIONAL_BANK_ACCOUNT_NUMBER An International Bank Account
        # Number has specific formats in each country. For more information, see www.iban.com/structure .
        # SWIFT_CODE A SWIFT code is a standard format of Bank Identifier Code (BIC) used to specify a
        # particular bank or branch. Banks use these codes for money transfers such as international wire
        # transfers. SWIFT codes consist of eight or 11 characters. The 11-digit codes refer to specific
        # branches, while eight-digit codes (or 11-digit codes ending in 'XXX') refer to the head or primary
        # office. IT IP_ADDRESS An IPv4 address, such as 198.51.100.0 . MAC_ADDRESS A media access control
        # (MAC) address is a unique identifier assigned to a network interface controller (NIC). URL A web
        # address, such as www.example.com . AWS_ACCESS_KEY A unique identifier that's associated with a
        # secret access key; you use the access key ID and secret access key to sign programmatic Amazon Web
        # Services requests cryptographically. AWS_SECRET_KEY A unique identifier that's associated with an
        # access key. You use the access key ID and secret access key to sign programmatic Amazon Web Services
        # requests cryptographically. USA specific US_BANK_ACCOUNT_NUMBER A US bank account number, which is
        # typically 10 to 12 digits long. US_BANK_ROUTING_NUMBER A US bank account routing number. These are
        # typically nine digits long, US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER A US Individual Taxpayer
        # Identification Number (ITIN) is a nine-digit number that starts with a "9" and contain a "7" or "8"
        # as the fourth digit. An ITIN can be formatted with a space or a dash after the third and forth
        # digits. US_PASSPORT_NUMBER A US passport number. Passport numbers range from six to nine
        # alphanumeric characters. US_SOCIAL_SECURITY_NUMBER A US Social Security Number (SSN) is a nine-digit
        # number that is issued to US citizens, permanent residents, and temporary working residents. Canada
        # specific CA_HEALTH_NUMBER A Canadian Health Service Number is a 10-digit unique identifier, required
        # for individuals to access healthcare benefits. CA_SOCIAL_INSURANCE_NUMBER A Canadian Social
        # Insurance Number (SIN) is a nine-digit unique identifier, required for individuals to access
        # government programs and benefits. The SIN is formatted as three groups of three digits, such as
        # 123-456-789 . A SIN can be validated through a simple check-digit process called the Luhn algorithm
        # . UK Specific UK_NATIONAL_HEALTH_SERVICE_NUMBER A UK National Health Service Number is a 10-17 digit
        # number, such as 485 555 3456 . The current system formats the 10-digit number with spaces after the
        # third and sixth digits. The final digit is an error-detecting checksum. UK_NATIONAL_INSURANCE_NUMBER
        # A UK National Insurance Number (NINO) provides individuals with access to National Insurance (social
        # security) benefits. It is also used for some purposes in the UK tax system. The number is nine
        # digits long and starts with two letters, followed by six numbers and one letter. A NINO can be
        # formatted with a space or a dash after the two letters and after the second, forth, and sixth
        # digits. UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER A UK Unique Taxpayer Reference (UTR) is a 10-digit
        # number that identifies a taxpayer or a business. Custom Regex filter - You can use a regular
        # expressions to define patterns for an AI Guardrail to recognize and act upon such as serial number,
        # booking ID etc..

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @action : String,
          @type : String
        )
        end
      end

      # The regular expression to configure for the AI Guardrail.

      struct GuardrailRegexConfig
        include JSON::Serializable

        # The AI Guardrail action to configure when matching regular expression is detected.

        @[JSON::Field(key: "action")]
        getter action : String

        # The name of the regular expression to configure for the AI Guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # The regular expression pattern to configure for the AI Guardrail.

        @[JSON::Field(key: "pattern")]
        getter pattern : String

        # The description of the regular expression to configure for the AI Guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @action : String,
          @name : String,
          @pattern : String,
          @description : String? = nil
        )
        end
      end

      # Details about topics for the AI Guardrail to identify and deny.

      struct GuardrailTopicConfig
        include JSON::Serializable

        # A definition of the topic to deny.

        @[JSON::Field(key: "definition")]
        getter definition : String

        # The name of the topic to deny.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies to deny the topic.

        @[JSON::Field(key: "type")]
        getter type : String

        # A list of prompts, each of which is an example of a prompt that can be categorized as belonging to
        # the topic.

        @[JSON::Field(key: "examples")]
        getter examples : Array(String)?

        def initialize(
          @definition : String,
          @name : String,
          @type : String,
          @examples : Array(String)? = nil
        )
        end
      end

      # A word to configure for the AI Guardrail.

      struct GuardrailWordConfig
        include JSON::Serializable

        # Text of the word configured for the AI Guardrail to block.

        @[JSON::Field(key: "text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      # Settings for hierarchical document chunking for a data source. Hierarchical chunking splits
      # documents into layers of chunks where the first layer contains large chunks, and the second layer
      # contains smaller chunks derived from the first layer.

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

      # Token settings for each layer.

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

      # Offset specification to describe highlighting of document excerpts for rendering search results and
      # recommendations.

      struct Highlight
        include JSON::Serializable

        # The offset for the start of the highlight.

        @[JSON::Field(key: "beginOffsetInclusive")]
        getter begin_offset_inclusive : Int32?

        # The offset for the end of the highlight.

        @[JSON::Field(key: "endOffsetExclusive")]
        getter end_offset_exclusive : Int32?

        def initialize(
          @begin_offset_inclusive : Int32? = nil,
          @end_offset_exclusive : Int32? = nil
        )
        end
      end

      # Summary information about the import job.

      struct ImportJobData
        include JSON::Serializable

        # The timestamp when the import job was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The identifier of the import job.

        @[JSON::Field(key: "importJobId")]
        getter import_job_id : String

        # The type of the import job.

        @[JSON::Field(key: "importJobType")]
        getter import_job_type : String

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the import job data was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The status of the import job.

        @[JSON::Field(key: "status")]
        getter status : String

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The download link to the resource file that is uploaded to the import job.

        @[JSON::Field(key: "url")]
        getter url : String

        # The expiration time of the URL as an epoch timestamp.

        @[JSON::Field(key: "urlExpiry")]
        getter url_expiry : Time


        @[JSON::Field(key: "externalSourceConfiguration")]
        getter external_source_configuration : Types::ExternalSourceConfiguration?

        # The link to download the information of resource data that failed to be imported.

        @[JSON::Field(key: "failedRecordReport")]
        getter failed_record_report : String?

        # The metadata fields of the imported Amazon Q in Connect resources.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        def initialize(
          @created_time : Time,
          @import_job_id : String,
          @import_job_type : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @status : String,
          @upload_id : String,
          @url : String,
          @url_expiry : Time,
          @external_source_configuration : Types::ExternalSourceConfiguration? = nil,
          @failed_record_report : String? = nil,
          @metadata : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about the import job.

      struct ImportJobSummary
        include JSON::Serializable

        # The timestamp when the import job was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The identifier of the import job.

        @[JSON::Field(key: "importJobId")]
        getter import_job_id : String

        # The type of import job.

        @[JSON::Field(key: "importJobType")]
        getter import_job_type : String

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the import job was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The status of the import job.

        @[JSON::Field(key: "status")]
        getter status : String

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The configuration information of the external source that the resource data are imported from.

        @[JSON::Field(key: "externalSourceConfiguration")]
        getter external_source_configuration : Types::ExternalSourceConfiguration?

        # The metadata fields of the imported Amazon Q in Connect resources.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        def initialize(
          @created_time : Time,
          @import_job_id : String,
          @import_job_type : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @status : String,
          @upload_id : String,
          @external_source_configuration : Types::ExternalSourceConfiguration? = nil,
          @metadata : Hash(String, String)? = nil
        )
        end
      end

      # Details about the detected intent.

      struct IntentDetectedDataDetails
        include JSON::Serializable

        # The detected intent.

        @[JSON::Field(key: "intent")]
        getter intent : String

        # The identifier of the detected intent.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        # The relevance level of the detected intent.

        @[JSON::Field(key: "relevanceLevel")]
        getter relevance_level : String?

        def initialize(
          @intent : String,
          @intent_id : String,
          @relevance_level : String? = nil
        )
        end
      end

      # Information about the Amazon Q intent.

      struct IntentInputData
        include JSON::Serializable

        # The identifier of the Amazon Q intent.

        @[JSON::Field(key: "intentId")]
        getter intent_id : String

        def initialize(
          @intent_id : String
        )
        end
      end


      struct JSONDocument
        include JSON::Serializable

        def initialize
        end
      end

      # The data of the configuration for a KNOWLEDGE_BASE type Amazon Q in Connect Assistant Association.

      struct KnowledgeBaseAssociationConfigurationData
        include JSON::Serializable


        @[JSON::Field(key: "contentTagFilter")]
        getter content_tag_filter : Types::TagFilter?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The search type to be used against the Knowledge Base for this request. The values can be SEMANTIC
        # which uses vector embeddings or HYBRID which use vector embeddings and raw text

        @[JSON::Field(key: "overrideKnowledgeBaseSearchType")]
        getter override_knowledge_base_search_type : String?

        def initialize(
          @content_tag_filter : Types::TagFilter? = nil,
          @max_results : Int32? = nil,
          @override_knowledge_base_search_type : String? = nil
        )
        end
      end

      # Association information about the knowledge base.

      struct KnowledgeBaseAssociationData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String?

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String?

        def initialize(
          @knowledge_base_arn : String? = nil,
          @knowledge_base_id : String? = nil
        )
        end
      end

      # Information about the knowledge base.

      struct KnowledgeBaseData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The type of knowledge base.

        @[JSON::Field(key: "knowledgeBaseType")]
        getter knowledge_base_type : String

        # The name of the knowledge base.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the knowledge base.

        @[JSON::Field(key: "status")]
        getter status : String

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # List of failure reasons on ingestion per file.

        @[JSON::Field(key: "ingestionFailureReasons")]
        getter ingestion_failure_reasons : Array(String)?

        # Status of ingestion on data source.

        @[JSON::Field(key: "ingestionStatus")]
        getter ingestion_status : String?

        # An epoch timestamp indicating the most recent content modification inside the knowledge base. If no
        # content exists in a knowledge base, this value is unset.

        @[JSON::Field(key: "lastContentModificationTime")]
        getter last_content_modification_time : Time?

        # Information about how to render the content.

        @[JSON::Field(key: "renderingConfiguration")]
        getter rendering_configuration : Types::RenderingConfiguration?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , kms:Decrypt , and kms:GenerateDataKey*
        # permissions to the IAM identity using the key to invoke Amazon Q in Connect. For more information
        # about setting up a customer managed key for Amazon Q in Connect, see Enable Amazon Q in Connect for
        # your instance .

        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # Source configuration information about the knowledge base.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Contains details about how to ingest the documents in a data source.

        @[JSON::Field(key: "vectorIngestionConfiguration")]
        getter vector_ingestion_configuration : Types::VectorIngestionConfiguration?

        def initialize(
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @knowledge_base_type : String,
          @name : String,
          @status : String,
          @description : String? = nil,
          @ingestion_failure_reasons : Array(String)? = nil,
          @ingestion_status : String? = nil,
          @last_content_modification_time : Time? = nil,
          @rendering_configuration : Types::RenderingConfiguration? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @source_configuration : Types::SourceConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @vector_ingestion_configuration : Types::VectorIngestionConfiguration? = nil
        )
        end
      end

      # Summary information about the knowledge base.

      struct KnowledgeBaseSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The type of knowledge base.

        @[JSON::Field(key: "knowledgeBaseType")]
        getter knowledge_base_type : String

        # The name of the knowledge base.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the knowledge base summary.

        @[JSON::Field(key: "status")]
        getter status : String

        # The description of the knowledge base.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about how to render the content.

        @[JSON::Field(key: "renderingConfiguration")]
        getter rendering_configuration : Types::RenderingConfiguration?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , kms:Decrypt , and kms:GenerateDataKey*
        # permissions to the IAM identity using the key to invoke Amazon Q in Connect. For more information
        # about setting up a customer managed key for Amazon Q in Connect, see Enable Amazon Q in Connect for
        # your instance .

        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # Configuration information about the external data source.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Contains details about how to ingest the documents in a data source.

        @[JSON::Field(key: "vectorIngestionConfiguration")]
        getter vector_ingestion_configuration : Types::VectorIngestionConfiguration?

        def initialize(
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @knowledge_base_type : String,
          @name : String,
          @status : String,
          @description : String? = nil,
          @rendering_configuration : Types::RenderingConfiguration? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @source_configuration : Types::SourceConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @vector_ingestion_configuration : Types::VectorIngestionConfiguration? = nil
        )
        end
      end

      # A knowledge source that provides content for recommendations.

      struct KnowledgeSource
        include JSON::Serializable

        # The list of assistant association identifiers for the knowledge source.

        @[JSON::Field(key: "assistantAssociationIds")]
        getter assistant_association_ids : Array(String)?

        def initialize(
          @assistant_association_ids : Array(String)? = nil
        )
        end
      end


      struct ListAIAgentVersionsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Agent for which versions are to be listed.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The origin of the AI Agent versions to be listed. SYSTEM for a default AI Agent created by Q in
        # Connect or CUSTOMER for an AI Agent created by calling AI Agent creation APIs.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        def initialize(
          @ai_agent_id : String,
          @assistant_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @origin : String? = nil
        )
        end
      end


      struct ListAIAgentVersionsResponse
        include JSON::Serializable

        # The summaries of AI Agent versions.

        @[JSON::Field(key: "aiAgentVersionSummaries")]
        getter ai_agent_version_summaries : Array(Types::AIAgentVersionSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ai_agent_version_summaries : Array(Types::AIAgentVersionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAIAgentsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The origin of the AI Agents to be listed. SYSTEM for a default AI Agent created by Q in Connect or
        # CUSTOMER for an AI Agent created by calling AI Agent creation APIs.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        def initialize(
          @assistant_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @origin : String? = nil
        )
        end
      end


      struct ListAIAgentsResponse
        include JSON::Serializable

        # The summaries of AI Agents.

        @[JSON::Field(key: "aiAgentSummaries")]
        getter ai_agent_summaries : Array(Types::AIAgentSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ai_agent_summaries : Array(Types::AIAgentSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAIGuardrailVersionsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Guardrail for which versions are to be listed.

        @[JSON::Field(key: "aiGuardrailId")]
        getter ai_guardrail_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ai_guardrail_id : String,
          @assistant_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAIGuardrailVersionsResponse
        include JSON::Serializable

        # The summaries of the AI Guardrail versions.

        @[JSON::Field(key: "aiGuardrailVersionSummaries")]
        getter ai_guardrail_version_summaries : Array(Types::AIGuardrailVersionSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ai_guardrail_version_summaries : Array(Types::AIGuardrailVersionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAIGuardrailsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAIGuardrailsResponse
        include JSON::Serializable

        # The summaries of the AI Guardrails.

        @[JSON::Field(key: "aiGuardrailSummaries")]
        getter ai_guardrail_summaries : Array(Types::AIGuardrailSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ai_guardrail_summaries : Array(Types::AIGuardrailSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAIPromptVersionsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI prompt for which versions are to be listed.

        @[JSON::Field(key: "aiPromptId")]
        getter ai_prompt_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The origin of the AI Prompt versions to be listed. SYSTEM for a default AI Agent created by Q in
        # Connect or CUSTOMER for an AI Agent created by calling AI Agent creation APIs.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        def initialize(
          @ai_prompt_id : String,
          @assistant_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @origin : String? = nil
        )
        end
      end


      struct ListAIPromptVersionsResponse
        include JSON::Serializable

        # The summaries of the AI Prompt versions.

        @[JSON::Field(key: "aiPromptVersionSummaries")]
        getter ai_prompt_version_summaries : Array(Types::AIPromptVersionSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ai_prompt_version_summaries : Array(Types::AIPromptVersionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAIPromptsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The origin of the AI Prompts to be listed. SYSTEM for a default AI Agent created by Q in Connect or
        # CUSTOMER for an AI Agent created by calling AI Agent creation APIs.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        def initialize(
          @assistant_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @origin : String? = nil
        )
        end
      end


      struct ListAIPromptsResponse
        include JSON::Serializable

        # The summaries of the AI Prompts.

        @[JSON::Field(key: "aiPromptSummaries")]
        getter ai_prompt_summaries : Array(Types::AIPromptSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ai_prompt_summaries : Array(Types::AIPromptSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAssistantAssociationsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssistantAssociationsResponse
        include JSON::Serializable

        # Summary information about assistant associations.

        @[JSON::Field(key: "assistantAssociationSummaries")]
        getter assistant_association_summaries : Array(Types::AssistantAssociationSummary)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_association_summaries : Array(Types::AssistantAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAssistantsRequest
        include JSON::Serializable

        # The maximum number of results to return per page.

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


      struct ListAssistantsResponse
        include JSON::Serializable

        # Information about the assistants.

        @[JSON::Field(key: "assistantSummaries")]
        getter assistant_summaries : Array(Types::AssistantSummary)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_summaries : Array(Types::AssistantSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListContentAssociationsRequest
        include JSON::Serializable

        # The identifier of the content.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @content_id : String,
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContentAssociationsResponse
        include JSON::Serializable

        # Summary information about content associations.

        @[JSON::Field(key: "contentAssociationSummaries")]
        getter content_association_summaries : Array(Types::ContentAssociationSummary)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @content_association_summaries : Array(Types::ContentAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListContentsRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base. Can
        # be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContentsResponse
        include JSON::Serializable

        # Information about the content.

        @[JSON::Field(key: "contentSummaries")]
        getter content_summaries : Array(Types::ContentSummary)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @content_summaries : Array(Types::ContentSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListImportJobsRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListImportJobsResponse
        include JSON::Serializable

        # Summary information about the import jobs.

        @[JSON::Field(key: "importJobSummaries")]
        getter import_job_summaries : Array(Types::ImportJobSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @import_job_summaries : Array(Types::ImportJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListKnowledgeBasesRequest
        include JSON::Serializable

        # The maximum number of results to return per page.

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


      struct ListKnowledgeBasesResponse
        include JSON::Serializable

        # Information about the knowledge bases.

        @[JSON::Field(key: "knowledgeBaseSummaries")]
        getter knowledge_base_summaries : Array(Types::KnowledgeBaseSummary)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_summaries : Array(Types::KnowledgeBaseSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListMessageTemplateVersionsRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN. It cannot contain any
        # qualifier.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @message_template_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMessageTemplateVersionsResponse
        include JSON::Serializable

        # Summary information about the versions of a message template.

        @[JSON::Field(key: "messageTemplateVersionSummaries")]
        getter message_template_version_summaries : Array(Types::MessageTemplateVersionSummary)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @message_template_version_summaries : Array(Types::MessageTemplateVersionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListMessageTemplatesRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMessageTemplatesResponse
        include JSON::Serializable

        # Summary information about the message template.

        @[JSON::Field(key: "messageTemplateSummaries")]
        getter message_template_summaries : Array(Types::MessageTemplateSummary)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @message_template_summaries : Array(Types::MessageTemplateSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListMessagesRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the Amazon Q in Connect session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The filter criteria for listing messages.

        @[JSON::Field(key: "filter")]
        getter filter : String?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_id : String,
          @session_id : String,
          @filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMessagesResponse
        include JSON::Serializable

        # The message information.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::MessageOutput)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @messages : Array(Types::MessageOutput),
          @next_token : String? = nil
        )
        end
      end


      struct ListQuickResponsesRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListQuickResponsesResponse
        include JSON::Serializable

        # Summary information about the quick responses.

        @[JSON::Field(key: "quickResponseSummaries")]
        getter quick_response_summaries : Array(Types::QuickResponseSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @quick_response_summaries : Array(Types::QuickResponseSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListSpansRequest
        include JSON::Serializable

        # UUID or ARN of the Connect AI Assistant resource

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # UUID or ARN of the Connect AI Session resource

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # Maximum number of spans to return per page

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token for retrieving the next page of results

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_id : String,
          @session_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSpansResponse
        include JSON::Serializable

        # Array of span objects for the session

        @[JSON::Field(key: "spans")]
        getter spans : Array(Types::Span)

        # Pagination token for retrieving additional results

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @spans : Array(Types::Span),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Source configuration for managed resources.

      struct ManagedSourceConfiguration
        include JSON::Serializable

        # Configuration data for web crawler data source.

        @[JSON::Field(key: "webCrawlerConfiguration")]
        getter web_crawler_configuration : Types::WebCrawlerConfiguration?

        def initialize(
          @web_crawler_configuration : Types::WebCrawlerConfiguration? = nil
        )
        end
      end

      # The configuration for the MANUAL_SEARCH AI Agent type.

      struct ManualSearchAIAgentConfiguration
        include JSON::Serializable

        # The AI Guardrail identifier for the Answer Generation guardrail used by the MANUAL_SEARCH AI Agent.

        @[JSON::Field(key: "answerGenerationAIGuardrailId")]
        getter answer_generation_ai_guardrail_id : String?

        # The AI Prompt identifier for the Answer Generation prompt used by the MANUAL_SEARCH AI Agent.

        @[JSON::Field(key: "answerGenerationAIPromptId")]
        getter answer_generation_ai_prompt_id : String?

        # The association configurations for overriding behavior on this AI Agent.

        @[JSON::Field(key: "associationConfigurations")]
        getter association_configurations : Array(Types::AssociationConfiguration)?

        # The locale to which specifies the language and region settings that determine the response language
        # for QueryAssistant . For more information on supported locales, see Language support for Amazon Q in
        # Connect .

        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @answer_generation_ai_guardrail_id : String? = nil,
          @answer_generation_ai_prompt_id : String? = nil,
          @association_configurations : Array(Types::AssociationConfiguration)? = nil,
          @locale : String? = nil
        )
        end
      end

      # The configuration for a SendMessage request.

      struct MessageConfiguration
        include JSON::Serializable

        # Configuration for generating chunked messages.

        @[JSON::Field(key: "generateChunkedMessage")]
        getter generate_chunked_message : Bool?

        # Generates a filler response when tool selection is QUESTION .

        @[JSON::Field(key: "generateFillerMessage")]
        getter generate_filler_message : Bool?

        def initialize(
          @generate_chunked_message : Bool? = nil,
          @generate_filler_message : Bool? = nil
        )
        end
      end

      # The message data.

      struct MessageData
        include JSON::Serializable

        # The message data in text type.

        @[JSON::Field(key: "text")]
        getter text : Types::TextMessage?

        # The result of tool usage in the message.

        @[JSON::Field(key: "toolUseResult")]
        getter tool_use_result : Types::ToolUseResultData?

        def initialize(
          @text : Types::TextMessage? = nil,
          @tool_use_result : Types::ToolUseResultData? = nil
        )
        end
      end

      # The message input.

      struct MessageInput
        include JSON::Serializable

        # The message input value.

        @[JSON::Field(key: "value")]
        getter value : Types::MessageData

        def initialize(
          @value : Types::MessageData
        )
        end
      end

      # The message output.

      struct MessageOutput
        include JSON::Serializable

        # The identifier of a message.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The participant of a message.

        @[JSON::Field(key: "participant")]
        getter participant : String

        # The timestamp of a message.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The value of a message data.

        @[JSON::Field(key: "value")]
        getter value : Types::MessageData

        def initialize(
          @message_id : String,
          @participant : String,
          @timestamp : Time,
          @value : Types::MessageData
        )
        end
      end

      # Information about the message template attachment.

      struct MessageTemplateAttachment
        include JSON::Serializable

        # The identifier of the attachment file.

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        # The presentation information for the attachment file.

        @[JSON::Field(key: "contentDisposition")]
        getter content_disposition : String

        # The name of the attachment file being uploaded. The name should include the file extension.

        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp when the attachment file was uploaded.

        @[JSON::Field(key: "uploadedTime")]
        getter uploaded_time : Time

        # A pre-signed Amazon S3 URL that can be used to download the attachment file.

        @[JSON::Field(key: "url")]
        getter url : String

        # The expiration time of the pre-signed Amazon S3 URL.

        @[JSON::Field(key: "urlExpiry")]
        getter url_expiry : Time

        def initialize(
          @attachment_id : String,
          @content_disposition : String,
          @name : String,
          @uploaded_time : Time,
          @url : String,
          @url_expiry : Time
        )
        end
      end

      # The attributes that are used with the message template.

      struct MessageTemplateAttributes
        include JSON::Serializable

        # The agent attributes that are used with the message template.

        @[JSON::Field(key: "agentAttributes")]
        getter agent_attributes : Types::AgentAttributes?

        # The custom attributes that are used with the message template.

        @[JSON::Field(key: "customAttributes")]
        getter custom_attributes : Hash(String, String)?

        # The customer profile attributes that are used with the message template.

        @[JSON::Field(key: "customerProfileAttributes")]
        getter customer_profile_attributes : Types::CustomerProfileAttributes?

        # The system attributes that are used with the message template.

        @[JSON::Field(key: "systemAttributes")]
        getter system_attributes : Types::SystemAttributes?

        def initialize(
          @agent_attributes : Types::AgentAttributes? = nil,
          @custom_attributes : Hash(String, String)? = nil,
          @customer_profile_attributes : Types::CustomerProfileAttributes? = nil,
          @system_attributes : Types::SystemAttributes? = nil
        )
        end
      end

      # The container of the message template body.

      struct MessageTemplateBodyContentProvider
        include JSON::Serializable

        # The content of the message template.

        @[JSON::Field(key: "content")]
        getter content : String?

        def initialize(
          @content : String? = nil
        )
        end
      end

      # The container of message template content.

      struct MessageTemplateContentProvider
        include JSON::Serializable

        # The content of the message template that applies to the email channel subtype.

        @[JSON::Field(key: "email")]
        getter email : Types::EmailMessageTemplateContent?


        @[JSON::Field(key: "push")]
        getter push : Types::PushMessageTemplateContent?

        # The content of the message template that applies to the SMS channel subtype.

        @[JSON::Field(key: "sms")]
        getter sms : Types::SMSMessageTemplateContent?

        # The content of the message template that applies to the WHATSAPP channel subtype.

        @[JSON::Field(key: "whatsApp")]
        getter whats_app : Types::WhatsAppMessageTemplateContent?

        def initialize(
          @email : Types::EmailMessageTemplateContent? = nil,
          @push : Types::PushMessageTemplateContent? = nil,
          @sms : Types::SMSMessageTemplateContent? = nil,
          @whats_app : Types::WhatsAppMessageTemplateContent? = nil
        )
        end
      end

      # The data of a message template.

      struct MessageTemplateData
        include JSON::Serializable

        # The channel subtype this message template applies to.

        @[JSON::Field(key: "channelSubtype")]
        getter channel_subtype : String

        # The timestamp when the message template was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The Amazon Resource Name (ARN) of the user who last updated the message template data.

        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String

        # The timestamp when the message template data was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "messageTemplateArn")]
        getter message_template_arn : String

        # The checksum value of the message template content that is referenced by the $LATEST qualifier. It
        # can be returned in MessageTemplateData or ExtendedMessageTemplateData . It’s calculated by content,
        # language, defaultAttributes and Attachments of the message template.

        @[JSON::Field(key: "messageTemplateContentSha256")]
        getter message_template_content_sha256 : String

        # The identifier of the message template.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The name of the message template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The types of attributes that the message template contains.

        @[JSON::Field(key: "attributeTypes")]
        getter attribute_types : Array(String)?

        # The channel of the message template.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        # The content of the message template.

        @[JSON::Field(key: "content")]
        getter content : Types::MessageTemplateContentProvider?

        # An object that specifies the default values to use for variables in the message template. This
        # object contains different categories of key-value pairs. Each key defines a variable or placeholder
        # in the message template. The corresponding value defines the default value for that variable.

        @[JSON::Field(key: "defaultAttributes")]
        getter default_attributes : Types::MessageTemplateAttributes?

        # The description of the message template.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW

        @[JSON::Field(key: "language")]
        getter language : String?

        # The source configuration summary of the message template.

        @[JSON::Field(key: "sourceConfigurationSummary")]
        getter source_configuration_summary : Types::MessageTemplateSourceConfigurationSummary?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @channel_subtype : String,
          @created_time : Time,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_by : String,
          @last_modified_time : Time,
          @message_template_arn : String,
          @message_template_content_sha256 : String,
          @message_template_id : String,
          @name : String,
          @attribute_types : Array(String)? = nil,
          @channel : String? = nil,
          @content : Types::MessageTemplateContentProvider? = nil,
          @default_attributes : Types::MessageTemplateAttributes? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @language : String? = nil,
          @source_configuration_summary : Types::MessageTemplateSourceConfigurationSummary? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The message template fields to filter the message template query results by. The following is the
      # list of supported field names: name description channel channelSubtype language qualifier
      # createdTime lastModifiedTime lastModifiedBy groupingConfiguration.criteria
      # groupingConfiguration.values

      struct MessageTemplateFilterField
        include JSON::Serializable

        # The name of the attribute field to filter the message templates by.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for filtering.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # Whether to treat null value as a match for the attribute field.

        @[JSON::Field(key: "includeNoExistence")]
        getter include_no_existence : Bool?

        # The values of attribute field to filter the message template by.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String,
          @operator : String,
          @include_no_existence : Bool? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The message template fields to order the message template query results by. The following is the
      # list of supported field names: name description channel channelSubtype language qualifier
      # createdTime lastModifiedTime lastModifiedBy groupingConfiguration.criteria
      # groupingConfiguration.values

      struct MessageTemplateOrderField
        include JSON::Serializable

        # The name of the message template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The order at which the message templates are sorted by.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @name : String,
          @order : String? = nil
        )
        end
      end

      # The message template fields to query message templates by. The following is the list of supported
      # field names: name description

      struct MessageTemplateQueryField
        include JSON::Serializable

        # The name of the attribute to query the message templates by.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for matching attribute field values in the query.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The values of the attribute to query the message templates by.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # Whether the query expects only exact matches on the attribute field values. The results of the query
        # will only include exact matches if this parameter is set to false.

        @[JSON::Field(key: "allowFuzziness")]
        getter allow_fuzziness : Bool?

        # The importance of the attribute field when calculating query result relevancy scores. The value set
        # for this parameter affects the ordering of search results.

        @[JSON::Field(key: "priority")]
        getter priority : String?

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String),
          @allow_fuzziness : Bool? = nil,
          @priority : String? = nil
        )
        end
      end

      # The search expression of the message template.

      struct MessageTemplateSearchExpression
        include JSON::Serializable

        # The configuration of filtering rules applied to message template query results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::MessageTemplateFilterField)?

        # The message template attribute fields on which the query results are ordered.

        @[JSON::Field(key: "orderOnField")]
        getter order_on_field : Types::MessageTemplateOrderField?

        # The message template query expressions.

        @[JSON::Field(key: "queries")]
        getter queries : Array(Types::MessageTemplateQueryField)?

        def initialize(
          @filters : Array(Types::MessageTemplateFilterField)? = nil,
          @order_on_field : Types::MessageTemplateOrderField? = nil,
          @queries : Array(Types::MessageTemplateQueryField)? = nil
        )
        end
      end

      # The result of message template search.

      struct MessageTemplateSearchResultData
        include JSON::Serializable

        # The channel subtype this message template applies to.

        @[JSON::Field(key: "channelSubtype")]
        getter channel_subtype : String

        # The timestamp when the message template was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The Amazon Resource Name (ARN) of the user who last updated the message template data.

        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String

        # The timestamp when the message template data was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "messageTemplateArn")]
        getter message_template_arn : String

        # The identifier of the message template.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The name of the message template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The channel of the message template.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        # The description of the message template.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # Whether the version of the message template is activated.

        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW

        @[JSON::Field(key: "language")]
        getter language : String?

        # The source configuration summary of the message template.

        @[JSON::Field(key: "sourceConfigurationSummary")]
        getter source_configuration_summary : Types::MessageTemplateSourceConfigurationSummary?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The version number of the message template version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @channel_subtype : String,
          @created_time : Time,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_by : String,
          @last_modified_time : Time,
          @message_template_arn : String,
          @message_template_id : String,
          @name : String,
          @channel : String? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @is_active : Bool? = nil,
          @language : String? = nil,
          @source_configuration_summary : Types::MessageTemplateSourceConfigurationSummary? = nil,
          @tags : Hash(String, String)? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      # The container of message template source configuration.

      struct MessageTemplateSourceConfiguration
        include JSON::Serializable

        # The sourceConfiguration of the message template that applies to the WHATSAPP channel subtype.

        @[JSON::Field(key: "whatsApp")]
        getter whats_app : Types::WhatsAppMessageTemplateSourceConfiguration?

        def initialize(
          @whats_app : Types::WhatsAppMessageTemplateSourceConfiguration? = nil
        )
        end
      end

      # The container of message template source configuration summary.

      struct MessageTemplateSourceConfigurationSummary
        include JSON::Serializable

        # The sourceConfiguration summary of the message template that applies to the WHATSAPP channel
        # subtype.

        @[JSON::Field(key: "whatsApp")]
        getter whats_app : Types::WhatsAppMessageTemplateSourceConfigurationSummary?

        def initialize(
          @whats_app : Types::WhatsAppMessageTemplateSourceConfigurationSummary? = nil
        )
        end
      end

      # The summary of the message template.

      struct MessageTemplateSummary
        include JSON::Serializable

        # The channel subtype this message template applies to.

        @[JSON::Field(key: "channelSubtype")]
        getter channel_subtype : String

        # The timestamp when the message template was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The Amazon Resource Name (ARN) of the user who last updated the message template data.

        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String

        # The timestamp when the message template data was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "messageTemplateArn")]
        getter message_template_arn : String

        # The identifier of the message template.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The name of the message template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version number of the message template version that is activated.

        @[JSON::Field(key: "activeVersionNumber")]
        getter active_version_number : Int64?

        # The channel this message template applies to.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        # The description of the message template.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::MessageTemplateSourceConfiguration?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @channel_subtype : String,
          @created_time : Time,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_by : String,
          @last_modified_time : Time,
          @message_template_arn : String,
          @message_template_id : String,
          @name : String,
          @active_version_number : Int64? = nil,
          @channel : String? = nil,
          @description : String? = nil,
          @source_configuration : Types::MessageTemplateSourceConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The summary of the message template version.

      struct MessageTemplateVersionSummary
        include JSON::Serializable

        # The channel subtype this message template applies to.

        @[JSON::Field(key: "channelSubtype")]
        getter channel_subtype : String

        # Whether the version of the message template is activated.

        @[JSON::Field(key: "isActive")]
        getter is_active : Bool

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The Amazon Resource Name (ARN) of the message template.

        @[JSON::Field(key: "messageTemplateArn")]
        getter message_template_arn : String

        # The identifier of the message template.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The name of the message template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version number of the message template version.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64

        # The channel of the message template.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        def initialize(
          @channel_subtype : String,
          @is_active : Bool,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @message_template_arn : String,
          @message_template_id : String,
          @name : String,
          @version_number : Int64,
          @channel : String? = nil
        )
        end
      end

      # The configuration for AI Agents of type NOTE_TAKING .

      struct NoteTakingAIAgentConfiguration
        include JSON::Serializable

        # The locale setting for language-specific case summarization generation (for example, en_US, es_ES).

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The AI Guardrail identifier used by the Note Taking AI Agent.

        @[JSON::Field(key: "noteTakingAIGuardrailId")]
        getter note_taking_ai_guardrail_id : String?

        # The AI Prompt identifier used by the Note Taking AI Agent.

        @[JSON::Field(key: "noteTakingAIPromptId")]
        getter note_taking_ai_prompt_id : String?

        def initialize(
          @locale : String? = nil,
          @note_taking_ai_guardrail_id : String? = nil,
          @note_taking_ai_prompt_id : String? = nil
        )
        end
      end

      # Details about notes chunk data.

      struct NotesChunkDataDetails
        include JSON::Serializable

        # A chunk of the notes completion.

        @[JSON::Field(key: "completion")]
        getter completion : String?

        # The token for the next chunk of notes data.

        @[JSON::Field(key: "nextChunkToken")]
        getter next_chunk_token : String?

        def initialize(
          @completion : String? = nil,
          @next_chunk_token : String? = nil
        )
        end
      end

      # Details about notes data.

      struct NotesDataDetails
        include JSON::Serializable

        # The completion data for notes.

        @[JSON::Field(key: "completion")]
        getter completion : String?

        def initialize(
          @completion : String? = nil
        )
        end
      end

      # An error occurred when creating a recommendation.

      struct NotifyRecommendationsReceivedError
        include JSON::Serializable

        # A recommendation is causing an error.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The identifier of the recommendation that is in error.

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        def initialize(
          @message : String? = nil,
          @recommendation_id : String? = nil
        )
        end
      end


      struct NotifyRecommendationsReceivedRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifiers of the recommendations.

        @[JSON::Field(key: "recommendationIds")]
        getter recommendation_ids : Array(String)

        # The identifier of the session. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @assistant_id : String,
          @recommendation_ids : Array(String),
          @session_id : String
        )
        end
      end


      struct NotifyRecommendationsReceivedResponse
        include JSON::Serializable

        # The identifiers of recommendations that are causing errors.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::NotifyRecommendationsReceivedError)?

        # The identifiers of the recommendations.

        @[JSON::Field(key: "recommendationIds")]
        getter recommendation_ids : Array(String)?

        def initialize(
          @errors : Array(Types::NotifyRecommendationsReceivedError)? = nil,
          @recommendation_ids : Array(String)? = nil
        )
        end
      end

      # A list of conditions which would be applied together with an OR condition.

      struct OrCondition
        include JSON::Serializable

        # A list of conditions which would be applied together with an AND condition.

        @[JSON::Field(key: "andConditions")]
        getter and_conditions : Array(Types::TagCondition)?

        # A leaf node condition which can be used to specify a tag condition.

        @[JSON::Field(key: "tagCondition")]
        getter tag_condition : Types::TagCondition?

        def initialize(
          @and_conditions : Array(Types::TagCondition)? = nil,
          @tag_condition : Types::TagCondition? = nil
        )
        end
      end

      # The configuration for AI Agents of type ORCHESTRATION .

      struct OrchestrationAIAgentConfiguration
        include JSON::Serializable

        # The AI Prompt identifier used by the Orchestration AI Agent.

        @[JSON::Field(key: "orchestrationAIPromptId")]
        getter orchestration_ai_prompt_id : String

        # The Amazon Resource Name (ARN) of the Amazon Connect instance used by the Orchestration AI Agent.

        @[JSON::Field(key: "connectInstanceArn")]
        getter connect_instance_arn : String?

        # The locale setting for the Orchestration AI Agent.

        @[JSON::Field(key: "locale")]
        getter locale : String?

        # The AI Guardrail identifier used by the Orchestration AI Agent.

        @[JSON::Field(key: "orchestrationAIGuardrailId")]
        getter orchestration_ai_guardrail_id : String?

        # The tool configurations used by the Orchestration AI Agent.

        @[JSON::Field(key: "toolConfigurations")]
        getter tool_configurations : Array(Types::ToolConfiguration)?

        def initialize(
          @orchestration_ai_prompt_id : String,
          @connect_instance_arn : String? = nil,
          @locale : String? = nil,
          @orchestration_ai_guardrail_id : String? = nil,
          @tool_configurations : Array(Types::ToolConfiguration)? = nil
        )
        end
      end

      # An entry in the orchestrator configuration list.

      struct OrchestratorConfigurationEntry
        include JSON::Serializable

        # The use case for the orchestrator configuration. (for example Connect.SelfService,
        # Connect.AgentAssistance)

        @[JSON::Field(key: "orchestratorUseCase")]
        getter orchestrator_use_case : String

        # The identifier of the AI Agent in the orchestrator configuration.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String?

        def initialize(
          @orchestrator_use_case : String,
          @ai_agent_id : String? = nil
        )
        end
      end

      # Settings for parsing document contents. By default, the service converts the contents of each
      # document into text before splitting it into chunks. To improve processing of PDF files with tables
      # and images, you can configure the data source to convert the pages of text into images and use a
      # model to describe the contents of each page.

      struct ParsingConfiguration
        include JSON::Serializable

        # The parsing strategy for the data source.

        @[JSON::Field(key: "parsingStrategy")]
        getter parsing_strategy : String

        # Settings for a foundation model used to parse documents for a data source.

        @[JSON::Field(key: "bedrockFoundationModelConfiguration")]
        getter bedrock_foundation_model_configuration : Types::BedrockFoundationModelConfigurationForParsing?

        def initialize(
          @parsing_strategy : String,
          @bedrock_foundation_model_configuration : Types::BedrockFoundationModelConfigurationForParsing? = nil
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

      # The provided revisionId does not match, indicating the content has been modified since it was last
      # read.

      struct PreconditionFailedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The content of the push message template that applies to ADM (Amazon Device Messaging) notification
      # service.

      struct PushADMMessageTemplateContent
        include JSON::Serializable

        # The action to occur if a recipient taps a push notification that is based on the message template.
        # Valid values are: OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the
        # background. This is the default action. DEEP_LINK - Your app opens and displays a designated user
        # interface in the app. This action uses the deep-linking features of the Android platform. URL - The
        # default mobile browser on the recipient's device opens and loads the web page at a URL that you
        # specify.

        @[JSON::Field(key: "action")]
        getter action : String?

        # The message body to use in a push notification that is based on the message template.

        @[JSON::Field(key: "body")]
        getter body : Types::MessageTemplateBodyContentProvider?

        # The URL of the large icon image to display in the content view of a push notification that's based
        # on the message template.

        @[JSON::Field(key: "imageIconUrl")]
        getter image_icon_url : String?

        # The URL of an image to display in a push notification that's based on the message template.

        @[JSON::Field(key: "imageUrl")]
        getter image_url : String?

        # The URL of the small icon image to display in the status bar and the content view of a push
        # notification that's based on the message template.

        @[JSON::Field(key: "rawContent")]
        getter raw_content : Types::MessageTemplateBodyContentProvider?

        # The URL of the small icon image to display in the status bar and the content view of a push
        # notification that's based on the message template.

        @[JSON::Field(key: "smallImageIconUrl")]
        getter small_image_icon_url : String?

        # The sound to play when a recipient receives a push notification that's based on the message
        # template. You can use the default stream or specify the file name of a sound resource that's bundled
        # in your app. On an Android platform, the sound file must reside in /res/raw/ .

        @[JSON::Field(key: "sound")]
        getter sound : String?

        # The title to use in a push notification that's based on the message template. This title appears
        # above the notification message on a recipient's device.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The URL to open in a recipient's default mobile browser, if a recipient taps a push notification
        # that's based on the message template and the value of the action property is URL .

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : Types::MessageTemplateBodyContentProvider? = nil,
          @image_icon_url : String? = nil,
          @image_url : String? = nil,
          @raw_content : Types::MessageTemplateBodyContentProvider? = nil,
          @small_image_icon_url : String? = nil,
          @sound : String? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The content of the push message template that applies to APNS (Apple Push Notification service)
      # notification service.

      struct PushAPNSMessageTemplateContent
        include JSON::Serializable

        # The action to occur if a recipient taps a push notification that is based on the message template.
        # Valid values are: OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the
        # background. This is the default action. DEEP_LINK - Your app opens and displays a designated user
        # interface in the app. This action uses the deep-linking features of the iOS platform. URL - The
        # default mobile browser on the recipient's device opens and loads the web page at a URL that you
        # specify.

        @[JSON::Field(key: "action")]
        getter action : String?

        # The message body to use in a push notification that is based on the message template.

        @[JSON::Field(key: "body")]
        getter body : Types::MessageTemplateBodyContentProvider?

        # The URL of an image or video to display in push notifications that are based on the message
        # template.

        @[JSON::Field(key: "mediaUrl")]
        getter media_url : String?

        # The raw, JSON-formatted string to use as the payload for a push notification that's based on the
        # message template. If specified, this value overrides all other content for the message template.

        @[JSON::Field(key: "rawContent")]
        getter raw_content : Types::MessageTemplateBodyContentProvider?

        # The key for the sound to play when the recipient receives a push notification that's based on the
        # message template. The value for this key is the name of a sound file in your app's main bundle or
        # the Library/Sounds folder in your app's data container. If the sound file can't be found or you
        # specify default for the value, the system plays the default alert sound.

        @[JSON::Field(key: "sound")]
        getter sound : String?

        # The title to use in a push notification that's based on the message template. This title appears
        # above the notification message on a recipient's device.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The URL to open in a recipient's default mobile browser, if a recipient taps a push notification
        # that's based on the message template and the value of the action property is URL .

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : Types::MessageTemplateBodyContentProvider? = nil,
          @media_url : String? = nil,
          @raw_content : Types::MessageTemplateBodyContentProvider? = nil,
          @sound : String? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The content of the push message template that applies to Baidu notification service.

      struct PushBaiduMessageTemplateContent
        include JSON::Serializable

        # The action to occur if a recipient taps a push notification that is based on the message template.
        # Valid values are: OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the
        # background. This is the default action. DEEP_LINK - Your app opens and displays a designated user
        # interface in the app. This action uses the deep-linking features of the Android platform. URL - The
        # default mobile browser on the recipient's device opens and loads the web page at a URL that you
        # specify.

        @[JSON::Field(key: "action")]
        getter action : String?

        # The message body to use in a push notification that is based on the message template.

        @[JSON::Field(key: "body")]
        getter body : Types::MessageTemplateBodyContentProvider?

        # The URL of the large icon image to display in the content view of a push notification that's based
        # on the message template.

        @[JSON::Field(key: "imageIconUrl")]
        getter image_icon_url : String?

        # The URL of an image to display in a push notification that's based on the message template.

        @[JSON::Field(key: "imageUrl")]
        getter image_url : String?

        # The URL of the small icon image to display in the status bar and the content view of a push
        # notification that's based on the message template.

        @[JSON::Field(key: "rawContent")]
        getter raw_content : Types::MessageTemplateBodyContentProvider?

        # The URL of the small icon image to display in the status bar and the content view of a push
        # notification that's based on the message template.

        @[JSON::Field(key: "smallImageIconUrl")]
        getter small_image_icon_url : String?

        # The sound to play when a recipient receives a push notification that's based on the message
        # template. You can use the default stream or specify the file name of a sound resource that's bundled
        # in your app. On an Android platform, the sound file must reside in /res/raw/ .

        @[JSON::Field(key: "sound")]
        getter sound : String?

        # The title to use in a push notification that's based on the message template. This title appears
        # above the notification message on a recipient's device.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The URL to open in a recipient's default mobile browser, if a recipient taps a push notification
        # that's based on the message template and the value of the action property is URL .

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : Types::MessageTemplateBodyContentProvider? = nil,
          @image_icon_url : String? = nil,
          @image_url : String? = nil,
          @raw_content : Types::MessageTemplateBodyContentProvider? = nil,
          @small_image_icon_url : String? = nil,
          @sound : String? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The content of the push message template that applies to FCM (Firebase Cloud Messaging) notification
      # service.

      struct PushFCMMessageTemplateContent
        include JSON::Serializable

        # The action to occur if a recipient taps a push notification that is based on the message template.
        # Valid values are: OPEN_APP - Your app opens or it becomes the foreground app if it was sent to the
        # background. This is the default action. DEEP_LINK - Your app opens and displays a designated user
        # interface in the app. This action uses the deep-linking features of the Android platform. URL - The
        # default mobile browser on the recipient's device opens and loads the web page at a URL that you
        # specify.

        @[JSON::Field(key: "action")]
        getter action : String?

        # The message body to use in a push notification that is based on the message template.

        @[JSON::Field(key: "body")]
        getter body : Types::MessageTemplateBodyContentProvider?

        # The URL of the large icon image to display in the content view of a push notification that's based
        # on the message template.

        @[JSON::Field(key: "imageIconUrl")]
        getter image_icon_url : String?

        # The URL of an image to display in a push notification that's based on the message template.

        @[JSON::Field(key: "imageUrl")]
        getter image_url : String?

        # The URL of the small icon image to display in the status bar and the content view of a push
        # notification that's based on the message template.

        @[JSON::Field(key: "rawContent")]
        getter raw_content : Types::MessageTemplateBodyContentProvider?

        # The URL of the small icon image to display in the status bar and the content view of a push
        # notification that's based on the message template.

        @[JSON::Field(key: "smallImageIconUrl")]
        getter small_image_icon_url : String?

        # The sound to play when a recipient receives a push notification that's based on the message
        # template. You can use the default stream or specify the file name of a sound resource that's bundled
        # in your app. On an Android platform, the sound file must reside in /res/raw/ .

        @[JSON::Field(key: "sound")]
        getter sound : String?

        # The title to use in a push notification that's based on the message template. This title appears
        # above the notification message on a recipient's device.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The URL to open in a recipient's default mobile browser, if a recipient taps a push notification
        # that's based on the message template and the value of the action property is URL .

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @action : String? = nil,
          @body : Types::MessageTemplateBodyContentProvider? = nil,
          @image_icon_url : String? = nil,
          @image_url : String? = nil,
          @raw_content : Types::MessageTemplateBodyContentProvider? = nil,
          @small_image_icon_url : String? = nil,
          @sound : String? = nil,
          @title : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The content of the message template that applies to the push channel subtype.

      struct PushMessageTemplateContent
        include JSON::Serializable

        # The content of the message template that applies to ADM (Amazon Device Messaging) notification
        # service.

        @[JSON::Field(key: "adm")]
        getter adm : Types::PushADMMessageTemplateContent?

        # The content of the message template that applies to APNS(Apple Push Notification service)
        # notification service.

        @[JSON::Field(key: "apns")]
        getter apns : Types::PushAPNSMessageTemplateContent?

        # The content of the message template that applies to Baidu notification service.

        @[JSON::Field(key: "baidu")]
        getter baidu : Types::PushBaiduMessageTemplateContent?

        # The content of the message template that applies to FCM (Firebase Cloud Messaging) notification
        # service.

        @[JSON::Field(key: "fcm")]
        getter fcm : Types::PushFCMMessageTemplateContent?

        def initialize(
          @adm : Types::PushADMMessageTemplateContent? = nil,
          @apns : Types::PushAPNSMessageTemplateContent? = nil,
          @baidu : Types::PushBaiduMessageTemplateContent? = nil,
          @fcm : Types::PushFCMMessageTemplateContent? = nil
        )
        end
      end


      struct PutFeedbackRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # Information about the feedback provided.

        @[JSON::Field(key: "contentFeedback")]
        getter content_feedback : Types::ContentFeedbackData

        # The identifier of the feedback target.

        @[JSON::Field(key: "targetId")]
        getter target_id : String

        # The type of the feedback target.

        @[JSON::Field(key: "targetType")]
        getter target_type : String

        def initialize(
          @assistant_id : String,
          @content_feedback : Types::ContentFeedbackData,
          @target_id : String,
          @target_type : String
        )
        end
      end


      struct PutFeedbackResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # Information about the feedback provided.

        @[JSON::Field(key: "contentFeedback")]
        getter content_feedback : Types::ContentFeedbackData

        # The identifier of the feedback target.

        @[JSON::Field(key: "targetId")]
        getter target_id : String

        # The type of the feedback target.

        @[JSON::Field(key: "targetType")]
        getter target_type : String

        def initialize(
          @assistant_arn : String,
          @assistant_id : String,
          @content_feedback : Types::ContentFeedbackData,
          @target_id : String,
          @target_type : String
        )
        end
      end


      struct QueryAssistantRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The search type to be used against the Knowledge Base for this request. The values can be SEMANTIC
        # which uses vector embeddings or HYBRID which use vector embeddings and raw text.

        @[JSON::Field(key: "overrideKnowledgeBaseSearchType")]
        getter override_knowledge_base_search_type : String?

        # Information about how to query content.

        @[JSON::Field(key: "queryCondition")]
        getter query_condition : Array(Types::QueryCondition)?

        # Information about the query.

        @[JSON::Field(key: "queryInputData")]
        getter query_input_data : Types::QueryInputData?

        # The text to search for.

        @[JSON::Field(key: "queryText")]
        getter query_text : String?

        # The identifier of the Amazon Q in Connect session. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @assistant_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @override_knowledge_base_search_type : String? = nil,
          @query_condition : Array(Types::QueryCondition)? = nil,
          @query_input_data : Types::QueryInputData? = nil,
          @query_text : String? = nil,
          @session_id : String? = nil
        )
        end
      end


      struct QueryAssistantResponse
        include JSON::Serializable

        # The results of the query.

        @[JSON::Field(key: "results")]
        getter results : Array(Types::ResultData)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @results : Array(Types::ResultData),
          @next_token : String? = nil
        )
        end
      end

      # Information about how to query content.

      struct QueryCondition
        include JSON::Serializable

        # The condition for the query.

        @[JSON::Field(key: "single")]
        getter single : Types::QueryConditionItem?

        def initialize(
          @single : Types::QueryConditionItem? = nil
        )
        end
      end

      # The condition for the query.

      struct QueryConditionItem
        include JSON::Serializable

        # The comparison operator for query condition to query on.

        @[JSON::Field(key: "comparator")]
        getter comparator : String

        # The name of the field for query condition to query on.

        @[JSON::Field(key: "field")]
        getter field : String

        # The value for the query condition to query on.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparator : String,
          @field : String,
          @value : String
        )
        end
      end

      # Input information for the query.

      struct QueryInputData
        include JSON::Serializable

        # Input data for case summarization queries.

        @[JSON::Field(key: "caseSummarizationInputData")]
        getter case_summarization_input_data : Types::CaseSummarizationInputData?

        # Input information for the intent.

        @[JSON::Field(key: "intentInputData")]
        getter intent_input_data : Types::IntentInputData?

        # Input information for the query.

        @[JSON::Field(key: "queryTextInputData")]
        getter query_text_input_data : Types::QueryTextInputData?

        def initialize(
          @case_summarization_input_data : Types::CaseSummarizationInputData? = nil,
          @intent_input_data : Types::IntentInputData? = nil,
          @query_text_input_data : Types::QueryTextInputData? = nil
        )
        end
      end

      # Data associated with the QUERY RecommendationTriggerType.

      struct QueryRecommendationTriggerData
        include JSON::Serializable

        # The text associated with the recommendation trigger.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Information about the text to search for.

      struct QueryTextInputData
        include JSON::Serializable

        # The text to search for.

        @[JSON::Field(key: "text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      # The container quick response content.

      struct QuickResponseContentProvider
        include JSON::Serializable

        # The content of the quick response.

        @[JSON::Field(key: "content")]
        getter content : String?

        def initialize(
          @content : String? = nil
        )
        end
      end

      # The content of the quick response stored in different media types.

      struct QuickResponseContents
        include JSON::Serializable


        @[JSON::Field(key: "markdown")]
        getter markdown : Types::QuickResponseContentProvider?


        @[JSON::Field(key: "plainText")]
        getter plain_text : Types::QuickResponseContentProvider?

        def initialize(
          @markdown : Types::QuickResponseContentProvider? = nil,
          @plain_text : Types::QuickResponseContentProvider? = nil
        )
        end
      end

      # Information about the quick response.

      struct QuickResponseData
        include JSON::Serializable

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for quick
        # response written in plain text. Use application/x.quickresponse;format=markdown for quick response
        # written in richtext.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The timestamp when the quick response was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the quick response data was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The name of the quick response.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the quick response.

        @[JSON::Field(key: "quickResponseArn")]
        getter quick_response_arn : String

        # The identifier of the quick response.

        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        # The status of the quick response data.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Connect contact channels this quick response applies to. The supported contact channel
        # types include Chat .

        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The contents of the quick response.

        @[JSON::Field(key: "contents")]
        getter contents : Types::QuickResponseContents?

        # The description of the quick response.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information of the user groups that the quick response is accessible to.

        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # Whether the quick response is active.

        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW

        @[JSON::Field(key: "language")]
        getter language : String?

        # The Amazon Resource Name (ARN) of the user who last updated the quick response data.

        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String?

        # The shortcut key of the quick response. The value should be unique across the knowledge base.

        @[JSON::Field(key: "shortcutKey")]
        getter shortcut_key : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_type : String,
          @created_time : Time,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @name : String,
          @quick_response_arn : String,
          @quick_response_id : String,
          @status : String,
          @channels : Array(String)? = nil,
          @contents : Types::QuickResponseContents? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @is_active : Bool? = nil,
          @language : String? = nil,
          @last_modified_by : String? = nil,
          @shortcut_key : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The container of quick response data.

      struct QuickResponseDataProvider
        include JSON::Serializable

        # The content of the quick response.

        @[JSON::Field(key: "content")]
        getter content : String?

        def initialize(
          @content : String? = nil
        )
        end
      end

      # The quick response fields to filter the quick response query results by. The following is the list
      # of supported field names. name description shortcutKey isActive channels language contentType
      # createdTime lastModifiedTime lastModifiedBy groupingConfiguration.criteria
      # groupingConfiguration.values

      struct QuickResponseFilterField
        include JSON::Serializable

        # The name of the attribute field to filter the quick responses by.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for filtering.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # Whether to treat null value as a match for the attribute field.

        @[JSON::Field(key: "includeNoExistence")]
        getter include_no_existence : Bool?

        # The values of attribute field to filter the quick response by.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String,
          @operator : String,
          @include_no_existence : Bool? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The quick response fields to order the quick response query results by. The following is the list of
      # supported field names. name description shortcutKey isActive channels language contentType
      # createdTime lastModifiedTime lastModifiedBy groupingConfiguration.criteria
      # groupingConfiguration.values

      struct QuickResponseOrderField
        include JSON::Serializable

        # The name of the attribute to order the quick response query results by.

        @[JSON::Field(key: "name")]
        getter name : String

        # The order at which the quick responses are sorted by.

        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @name : String,
          @order : String? = nil
        )
        end
      end

      # The quick response fields to query quick responses by. The following is the list of supported field
      # names. content name description shortcutKey

      struct QuickResponseQueryField
        include JSON::Serializable

        # The name of the attribute to query the quick responses by.

        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for matching attribute field values in the query.

        @[JSON::Field(key: "operator")]
        getter operator : String

        # The values of the attribute to query the quick responses by.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # Whether the query expects only exact matches on the attribute field values. The results of the query
        # will only include exact matches if this parameter is set to false.

        @[JSON::Field(key: "allowFuzziness")]
        getter allow_fuzziness : Bool?

        # The importance of the attribute field when calculating query result relevancy scores. The value set
        # for this parameter affects the ordering of search results.

        @[JSON::Field(key: "priority")]
        getter priority : String?

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String),
          @allow_fuzziness : Bool? = nil,
          @priority : String? = nil
        )
        end
      end

      # Information about the import job.

      struct QuickResponseSearchExpression
        include JSON::Serializable

        # The configuration of filtering rules applied to quick response query results.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::QuickResponseFilterField)?

        # The quick response attribute fields on which the query results are ordered.

        @[JSON::Field(key: "orderOnField")]
        getter order_on_field : Types::QuickResponseOrderField?

        # The quick response query expressions.

        @[JSON::Field(key: "queries")]
        getter queries : Array(Types::QuickResponseQueryField)?

        def initialize(
          @filters : Array(Types::QuickResponseFilterField)? = nil,
          @order_on_field : Types::QuickResponseOrderField? = nil,
          @queries : Array(Types::QuickResponseQueryField)? = nil
        )
        end
      end

      # The result of quick response search.

      struct QuickResponseSearchResultData
        include JSON::Serializable

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for quick
        # response written in plain text. Use application/x.quickresponse;format=markdown for quick response
        # written in richtext.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The contents of the quick response.

        @[JSON::Field(key: "contents")]
        getter contents : Types::QuickResponseContents

        # The timestamp when the quick response was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # Whether the quick response is active.

        @[JSON::Field(key: "isActive")]
        getter is_active : Bool

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the quick response search result data was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The name of the quick response.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the quick response.

        @[JSON::Field(key: "quickResponseArn")]
        getter quick_response_arn : String

        # The identifier of the quick response.

        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        # The resource status of the quick response.

        @[JSON::Field(key: "status")]
        getter status : String

        # The user defined contact attributes that are resolved when the search result is returned.

        @[JSON::Field(key: "attributesInterpolated")]
        getter attributes_interpolated : Array(String)?

        # The user defined contact attributes that are not resolved when the search result is returned.

        @[JSON::Field(key: "attributesNotInterpolated")]
        getter attributes_not_interpolated : Array(String)?

        # The Amazon Connect contact channels this quick response applies to. The supported contact channel
        # types include Chat .

        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The description of the quick response.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information of the user groups that the quick response is accessible to.

        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # The language code value for the language in which the quick response is written.

        @[JSON::Field(key: "language")]
        getter language : String?

        # The Amazon Resource Name (ARN) of the user who last updated the quick response search result data.

        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String?

        # The shortcut key of the quick response. The value should be unique across the knowledge base.

        @[JSON::Field(key: "shortcutKey")]
        getter shortcut_key : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_type : String,
          @contents : Types::QuickResponseContents,
          @created_time : Time,
          @is_active : Bool,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @name : String,
          @quick_response_arn : String,
          @quick_response_id : String,
          @status : String,
          @attributes_interpolated : Array(String)? = nil,
          @attributes_not_interpolated : Array(String)? = nil,
          @channels : Array(String)? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @language : String? = nil,
          @last_modified_by : String? = nil,
          @shortcut_key : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The summary information about the quick response.

      struct QuickResponseSummary
        include JSON::Serializable

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for quick
        # response written in plain text. Use application/x.quickresponse;format=markdown for quick response
        # written in richtext.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The timestamp when the quick response was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the quick response summary was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The name of the quick response.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the quick response.

        @[JSON::Field(key: "quickResponseArn")]
        getter quick_response_arn : String

        # The identifier of the quick response.

        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        # The resource status of the quick response.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Connect contact channels this quick response applies to. The supported contact channel
        # types include Chat .

        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The description of the quick response.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether the quick response is active.

        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The Amazon Resource Name (ARN) of the user who last updated the quick response data.

        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_type : String,
          @created_time : Time,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @name : String,
          @quick_response_arn : String,
          @quick_response_id : String,
          @status : String,
          @channels : Array(String)? = nil,
          @description : String? = nil,
          @is_active : Bool? = nil,
          @last_modified_by : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Details about the source content ranking data.

      struct RankingData
        include JSON::Serializable

        # The relevance score of the content.

        @[JSON::Field(key: "relevanceLevel")]
        getter relevance_level : String?

        # The relevance level of the recommendation.

        @[JSON::Field(key: "relevanceScore")]
        getter relevance_score : Float64?

        def initialize(
          @relevance_level : String? = nil,
          @relevance_score : Float64? = nil
        )
        end
      end

      # Information about the recommendation.

      struct RecommendationData
        include JSON::Serializable

        # The identifier of the recommendation.

        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String

        # Summary of the recommended content.

        @[JSON::Field(key: "data")]
        getter data : Types::DataSummary?

        # The recommended document.

        @[JSON::Field(key: "document")]
        getter document : Types::Document?

        # The relevance level of the recommendation.

        @[JSON::Field(key: "relevanceLevel")]
        getter relevance_level : String?

        # The relevance score of the recommendation.

        @[JSON::Field(key: "relevanceScore")]
        getter relevance_score : Float64?

        # The type of recommendation.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @recommendation_id : String,
          @data : Types::DataSummary? = nil,
          @document : Types::Document? = nil,
          @relevance_level : String? = nil,
          @relevance_score : Float64? = nil,
          @type : String? = nil
        )
        end
      end

      # A recommendation trigger provides context on the event that produced the referenced recommendations.
      # Recommendations are only referenced in recommendationIds by a single RecommendationTrigger.

      struct RecommendationTrigger
        include JSON::Serializable

        # A union type containing information related to the trigger.

        @[JSON::Field(key: "data")]
        getter data : Types::RecommendationTriggerData

        # The identifier of the recommendation trigger.

        @[JSON::Field(key: "id")]
        getter id : String

        # The identifiers of the recommendations.

        @[JSON::Field(key: "recommendationIds")]
        getter recommendation_ids : Array(String)

        # The source of the recommendation trigger. ISSUE_DETECTION: The corresponding recommendations were
        # triggered by a Contact Lens issue. RULE_EVALUATION: The corresponding recommendations were triggered
        # by a Contact Lens rule.

        @[JSON::Field(key: "source")]
        getter source : String

        # The type of recommendation trigger.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @data : Types::RecommendationTriggerData,
          @id : String,
          @recommendation_ids : Array(String),
          @source : String,
          @type : String
        )
        end
      end

      # A union type containing information related to the trigger.

      struct RecommendationTriggerData
        include JSON::Serializable

        # Data associated with the QUERY RecommendationTriggerType.

        @[JSON::Field(key: "query")]
        getter query : Types::QueryRecommendationTriggerData?

        def initialize(
          @query : Types::QueryRecommendationTriggerData? = nil
        )
        end
      end


      struct RemoveAssistantAIAgentRequest
        include JSON::Serializable

        # The type of the AI Agent being removed for use by default from the Amazon Q in Connect Assistant.

        @[JSON::Field(key: "aiAgentType")]
        getter ai_agent_type : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The orchestrator use case for the AI Agent being removed.

        @[JSON::Field(key: "orchestratorUseCase")]
        getter orchestrator_use_case : String?

        def initialize(
          @ai_agent_type : String,
          @assistant_id : String,
          @orchestrator_use_case : String? = nil
        )
        end
      end


      struct RemoveAssistantAIAgentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveKnowledgeBaseTemplateUriRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @knowledge_base_id : String
        )
        end
      end


      struct RemoveKnowledgeBaseTemplateUriResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct RenderMessageTemplateRequest
        include JSON::Serializable

        # An object that specifies the values to use for variables in the message template. This object
        # contains different categories of key-value pairs. Each key defines a variable or placeholder in the
        # message template. The corresponding value defines the value for that variable.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::MessageTemplateAttributes

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        def initialize(
          @attributes : Types::MessageTemplateAttributes,
          @knowledge_base_id : String,
          @message_template_id : String
        )
        end
      end


      struct RenderMessageTemplateResponse
        include JSON::Serializable

        # The message template attachments.

        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::MessageTemplateAttachment)?

        # The attribute keys that are not resolved.

        @[JSON::Field(key: "attributesNotInterpolated")]
        getter attributes_not_interpolated : Array(String)?

        # The content of the message template.

        @[JSON::Field(key: "content")]
        getter content : Types::MessageTemplateContentProvider?

        # The source configuration of the message template.

        @[JSON::Field(key: "sourceConfigurationSummary")]
        getter source_configuration_summary : Types::MessageTemplateSourceConfigurationSummary?

        def initialize(
          @attachments : Array(Types::MessageTemplateAttachment)? = nil,
          @attributes_not_interpolated : Array(String)? = nil,
          @content : Types::MessageTemplateContentProvider? = nil,
          @source_configuration_summary : Types::MessageTemplateSourceConfigurationSummary? = nil
        )
        end
      end

      # Information about how to render the content.

      struct RenderingConfiguration
        include JSON::Serializable

        # A URI template containing exactly one variable in ${variableName} format. This can only be set for
        # EXTERNAL knowledge bases. For Salesforce, ServiceNow, and Zendesk, the variable must be one of the
        # following: Salesforce: Id , ArticleNumber , VersionNumber , Title , PublishStatus , or IsDeleted
        # ServiceNow: number , short_description , sys_mod_count , workflow_state , or active Zendesk: id ,
        # title , updated_at , or draft The variable is replaced with the actual value for a piece of content
        # when calling GetContent .

        @[JSON::Field(key: "templateUri")]
        getter template_uri : String?

        def initialize(
          @template_uri : String? = nil
        )
        end
      end

      # The request reached the service more than 15 minutes after the date stamp on the request or more
      # than 15 minutes after the request expiration date (such as for pre-signed URLs), or the date stamp
      # on the request is more than 15 minutes in the future.

      struct RequestTimeoutException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The specified resource name.

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Information about the result.

      struct ResultData
        include JSON::Serializable

        # The identifier of the result data.

        @[JSON::Field(key: "resultId")]
        getter result_id : String

        # Summary of the recommended content.

        @[JSON::Field(key: "data")]
        getter data : Types::DataSummary?

        # The document.

        @[JSON::Field(key: "document")]
        getter document : Types::Document?

        # The relevance score of the results.

        @[JSON::Field(key: "relevanceScore")]
        getter relevance_score : Float64?

        # The type of the query result.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @result_id : String,
          @data : Types::DataSummary? = nil,
          @document : Types::Document? = nil,
          @relevance_score : Float64? = nil,
          @type : String? = nil
        )
        end
      end

      # Configuration for content retrieval operations.

      struct RetrievalConfiguration
        include JSON::Serializable

        # The knowledge source configuration for content retrieval.

        @[JSON::Field(key: "knowledgeSource")]
        getter knowledge_source : Types::KnowledgeSource

        # The filter configuration for content retrieval.

        @[JSON::Field(key: "filter")]
        getter filter : Types::RetrievalFilterConfiguration?

        # The number of results to retrieve.

        @[JSON::Field(key: "numberOfResults")]
        getter number_of_results : Int32?

        # Override setting for the knowledge base search type during retrieval.

        @[JSON::Field(key: "overrideKnowledgeBaseSearchType")]
        getter override_knowledge_base_search_type : String?

        def initialize(
          @knowledge_source : Types::KnowledgeSource,
          @filter : Types::RetrievalFilterConfiguration? = nil,
          @number_of_results : Int32? = nil,
          @override_knowledge_base_search_type : String? = nil
        )
        end
      end

      # Configuration for filtering content during retrieval operations.

      struct RetrievalFilterConfiguration
        include JSON::Serializable

        # Filter configuration that requires all conditions to be met.

        @[JSON::Field(key: "andAll")]
        getter and_all : Array(Types::RetrievalFilterConfiguration)?

        # Filter configuration for exact equality matching.

        @[JSON::Field(key: "equals")]
        getter equals : Types::FilterAttribute?

        # Filter configuration for greater than comparison.

        @[JSON::Field(key: "greaterThan")]
        getter greater_than : Types::FilterAttribute?

        # Filter configuration for greater than or equal comparison.

        @[JSON::Field(key: "greaterThanOrEquals")]
        getter greater_than_or_equals : Types::FilterAttribute?

        # Filter configuration for membership in a set of values.

        @[JSON::Field(key: "in")]
        getter in : Types::FilterAttribute?

        # Filter configuration for less than comparison.

        @[JSON::Field(key: "lessThan")]
        getter less_than : Types::FilterAttribute?

        # Filter configuration for less than or equal comparison.

        @[JSON::Field(key: "lessThanOrEquals")]
        getter less_than_or_equals : Types::FilterAttribute?

        # Filter configuration for checking if a list contains a value.

        @[JSON::Field(key: "listContains")]
        getter list_contains : Types::FilterAttribute?

        # Filter configuration for inequality matching.

        @[JSON::Field(key: "notEquals")]
        getter not_equals : Types::FilterAttribute?

        # Filter configuration for exclusion from a set of values.

        @[JSON::Field(key: "notIn")]
        getter not_in : Types::FilterAttribute?

        # Filter configuration where any condition can be met.

        @[JSON::Field(key: "orAll")]
        getter or_all : Array(Types::RetrievalFilterConfiguration)?

        # Filter configuration for prefix matching.

        @[JSON::Field(key: "startsWith")]
        getter starts_with : Types::FilterAttribute?

        # Filter configuration for substring matching.

        @[JSON::Field(key: "stringContains")]
        getter string_contains : Types::FilterAttribute?

        def initialize(
          @and_all : Array(Types::RetrievalFilterConfiguration)? = nil,
          @equals : Types::FilterAttribute? = nil,
          @greater_than : Types::FilterAttribute? = nil,
          @greater_than_or_equals : Types::FilterAttribute? = nil,
          @in : Types::FilterAttribute? = nil,
          @less_than : Types::FilterAttribute? = nil,
          @less_than_or_equals : Types::FilterAttribute? = nil,
          @list_contains : Types::FilterAttribute? = nil,
          @not_equals : Types::FilterAttribute? = nil,
          @not_in : Types::FilterAttribute? = nil,
          @or_all : Array(Types::RetrievalFilterConfiguration)? = nil,
          @starts_with : Types::FilterAttribute? = nil,
          @string_contains : Types::FilterAttribute? = nil
        )
        end
      end


      struct RetrieveRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant for content retrieval.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The configuration for the content retrieval operation.

        @[JSON::Field(key: "retrievalConfiguration")]
        getter retrieval_configuration : Types::RetrievalConfiguration

        # The query for content retrieval.

        @[JSON::Field(key: "retrievalQuery")]
        getter retrieval_query : String

        def initialize(
          @assistant_id : String,
          @retrieval_configuration : Types::RetrievalConfiguration,
          @retrieval_query : String
        )
        end
      end


      struct RetrieveResponse
        include JSON::Serializable

        # The results of the content retrieval operation.

        @[JSON::Field(key: "results")]
        getter results : Array(Types::RetrieveResult)

        def initialize(
          @results : Array(Types::RetrieveResult)
        )
        end
      end

      # A single result from a content retrieval operation.

      struct RetrieveResult
        include JSON::Serializable

        # The identifier of the assistant association for the retrieved result.

        @[JSON::Field(key: "associationId")]
        getter association_id : String

        # The text content of the retrieved result.

        @[JSON::Field(key: "contentText")]
        getter content_text : String

        # A type to define the KB origin of a retrieved content.

        @[JSON::Field(key: "referenceType")]
        getter reference_type : String

        # The URL, URI, or ID of the retrieved content when available, or a UUID when unavailable.

        @[JSON::Field(key: "sourceId")]
        getter source_id : String

        def initialize(
          @association_id : String,
          @content_text : String,
          @reference_type : String,
          @source_id : String
        )
        end
      end

      # The list of key-value pairs that are stored on the session.

      struct RuntimeSessionData
        include JSON::Serializable

        # The key of the data stored on the session.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the data stored on the session.

        @[JSON::Field(key: "value")]
        getter value : Types::RuntimeSessionDataValue

        def initialize(
          @key : String,
          @value : Types::RuntimeSessionDataValue
        )
        end
      end

      # A union type that specifies the data stored on the session.

      struct RuntimeSessionDataValue
        include JSON::Serializable

        # The string value of the data stored on the session.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @string_value : String? = nil
        )
        end
      end

      # The content of the message template that applies to the SMS channel subtype.

      struct SMSMessageTemplateContent
        include JSON::Serializable

        # The body to use in SMS messages.

        @[JSON::Field(key: "body")]
        getter body : Types::SMSMessageTemplateContentBody?

        def initialize(
          @body : Types::SMSMessageTemplateContentBody? = nil
        )
        end
      end

      # The body to use in SMS messages.

      struct SMSMessageTemplateContentBody
        include JSON::Serializable

        # The message body to use in SMS messages.

        @[JSON::Field(key: "plainText")]
        getter plain_text : Types::MessageTemplateBodyContentProvider?

        def initialize(
          @plain_text : Types::MessageTemplateBodyContentProvider? = nil
        )
        end
      end


      struct SearchContentRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base. Can
        # be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The search expression to filter results.

        @[JSON::Field(key: "searchExpression")]
        getter search_expression : Types::SearchExpression

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @search_expression : Types::SearchExpression,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchContentResponse
        include JSON::Serializable

        # Summary information about the content.

        @[JSON::Field(key: "contentSummaries")]
        getter content_summaries : Array(Types::ContentSummary)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @content_summaries : Array(Types::ContentSummary),
          @next_token : String? = nil
        )
        end
      end

      # The search expression.

      struct SearchExpression
        include JSON::Serializable

        # The search expression filters.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)

        def initialize(
          @filters : Array(Types::Filter)
        )
        end
      end


      struct SearchMessageTemplatesRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The search expression for querying the message template.

        @[JSON::Field(key: "searchExpression")]
        getter search_expression : Types::MessageTemplateSearchExpression

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @search_expression : Types::MessageTemplateSearchExpression,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchMessageTemplatesResponse
        include JSON::Serializable

        # The results of the message template search.

        @[JSON::Field(key: "results")]
        getter results : Array(Types::MessageTemplateSearchResultData)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @results : Array(Types::MessageTemplateSearchResultData),
          @next_token : String? = nil
        )
        end
      end


      struct SearchQuickResponsesRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should be a QUICK_RESPONSES type knowledge base. Can be
        # either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The search expression for querying the quick response.

        @[JSON::Field(key: "searchExpression")]
        getter search_expression : Types::QuickResponseSearchExpression

        # The user-defined Amazon Connect contact attributes to be resolved when search results are returned.

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @search_expression : Types::QuickResponseSearchExpression,
          @attributes : Hash(String, String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchQuickResponsesResponse
        include JSON::Serializable

        # The results of the quick response search.

        @[JSON::Field(key: "results")]
        getter results : Array(Types::QuickResponseSearchResultData)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @results : Array(Types::QuickResponseSearchResultData),
          @next_token : String? = nil
        )
        end
      end


      struct SearchSessionsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The search expression to filter results.

        @[JSON::Field(key: "searchExpression")]
        getter search_expression : Types::SearchExpression

        # The maximum number of results to return per page.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_id : String,
          @search_expression : Types::SearchExpression,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchSessionsResponse
        include JSON::Serializable

        # Summary information about the sessions.

        @[JSON::Field(key: "sessionSummaries")]
        getter session_summaries : Array(Types::SessionSummary)

        # If there are additional results, this is the token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @session_summaries : Array(Types::SessionSummary),
          @next_token : String? = nil
        )
        end
      end

      # A URL for crawling.

      struct SeedUrl
        include JSON::Serializable

        # URL for crawling

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # The configuration for AI Agents of type SELF_SERVICE.

      struct SelfServiceAIAgentConfiguration
        include JSON::Serializable

        # The association configurations for overriding behavior on this AI Agent.

        @[JSON::Field(key: "associationConfigurations")]
        getter association_configurations : Array(Types::AssociationConfiguration)?

        # The AI Guardrail identifier used by the SELF_SERVICE AI Agent.

        @[JSON::Field(key: "selfServiceAIGuardrailId")]
        getter self_service_ai_guardrail_id : String?

        # The AI Prompt identifier for the Self Service Answer Generation prompt used by the SELF_SERVICE AI
        # Agent

        @[JSON::Field(key: "selfServiceAnswerGenerationAIPromptId")]
        getter self_service_answer_generation_ai_prompt_id : String?

        # The AI Prompt identifier for the Self Service Pre-Processing prompt used by the SELF_SERVICE AI
        # Agent

        @[JSON::Field(key: "selfServicePreProcessingAIPromptId")]
        getter self_service_pre_processing_ai_prompt_id : String?

        def initialize(
          @association_configurations : Array(Types::AssociationConfiguration)? = nil,
          @self_service_ai_guardrail_id : String? = nil,
          @self_service_answer_generation_ai_prompt_id : String? = nil,
          @self_service_pre_processing_ai_prompt_id : String? = nil
        )
        end
      end

      # The conversation history data to included in conversation context data before the Amazon Q in
      # Connect session.

      struct SelfServiceConversationHistory
        include JSON::Serializable

        # The bot response of the conversation history data.

        @[JSON::Field(key: "botResponse")]
        getter bot_response : String?

        # The input transcript of the conversation history data.

        @[JSON::Field(key: "inputTranscript")]
        getter input_transcript : String?

        # The timestamp of the conversation history entry.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        # The number of turn of the conversation history data.

        @[JSON::Field(key: "turnNumber")]
        getter turn_number : Int32?

        def initialize(
          @bot_response : String? = nil,
          @input_transcript : String? = nil,
          @timestamp : Time? = nil,
          @turn_number : Int32? = nil
        )
        end
      end

      # Settings for semantic document chunking for a data source. Semantic chunking splits a document into
      # smaller documents based on groups of similar content derived from the text with natural language
      # processing.

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


      struct SendMessageRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The message data to submit to the Amazon Q in Connect session.

        @[JSON::Field(key: "message")]
        getter message : Types::MessageInput

        # The identifier of the Amazon Q in Connect session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The message type.

        @[JSON::Field(key: "type")]
        getter type : String

        # The identifier of the AI Agent to use for processing the message.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the AWS SDK populates this field.For more information about idempotency, see Making
        # retries safe with idempotent APIs.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration of the SendMessage request.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::MessageConfiguration?

        # The conversation context before the Amazon Q in Connect session.

        @[JSON::Field(key: "conversationContext")]
        getter conversation_context : Types::ConversationContext?

        # Additional metadata for the message.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The orchestrator use case for message processing.

        @[JSON::Field(key: "orchestratorUseCase")]
        getter orchestrator_use_case : String?

        def initialize(
          @assistant_id : String,
          @message : Types::MessageInput,
          @session_id : String,
          @type : String,
          @ai_agent_id : String? = nil,
          @client_token : String? = nil,
          @configuration : Types::MessageConfiguration? = nil,
          @conversation_context : Types::ConversationContext? = nil,
          @metadata : Hash(String, String)? = nil,
          @orchestrator_use_case : String? = nil
        )
        end
      end


      struct SendMessageResponse
        include JSON::Serializable

        # The token for the next message, used by GetNextMessage.

        @[JSON::Field(key: "nextMessageToken")]
        getter next_message_token : String

        # The identifier of the submitted message.

        @[JSON::Field(key: "requestMessageId")]
        getter request_message_id : String

        # The configuration of the SendMessage request.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::MessageConfiguration?

        def initialize(
          @next_message_token : String,
          @request_message_id : String,
          @configuration : Types::MessageConfiguration? = nil
        )
        end
      end

      # The configuration information for the customer managed key used for encryption.

      struct ServerSideEncryptionConfiguration
        include JSON::Serializable

        # The customer managed key used for encryption. For more information about setting up a customer
        # managed key for Amazon Q in Connect, see Enable Amazon Q in Connect for your instance . For
        # information about valid ID values, see Key identifiers (KeyId) .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @kms_key_id : String? = nil
        )
        end
      end

      # You've exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use service quotas to request a service quota increase.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the session.

      struct SessionData
        include JSON::Serializable

        # The name of the session.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the session.

        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The identifier of the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The configuration of the AI Agents (mapped by AI Agent Type to AI Agent version) that should be used
        # by Amazon Q in Connect for this Session.

        @[JSON::Field(key: "aiAgentConfiguration")]
        getter ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)?

        # The description of the session.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information for the session integration.

        @[JSON::Field(key: "integrationConfiguration")]
        getter integration_configuration : Types::SessionIntegrationConfiguration?

        # The list of orchestrator configurations for the session.

        @[JSON::Field(key: "orchestratorConfigurationList")]
        getter orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)?

        # The origin of the Session to be listed. SYSTEM for a default Session created by Amazon Q in Connect
        # or CUSTOMER for a Session created by calling CreateSession API.

        @[JSON::Field(key: "origin")]
        getter origin : String?

        # An object that can be used to specify Tag conditions.

        @[JSON::Field(key: "tagFilter")]
        getter tag_filter : Types::TagFilter?

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @session_arn : String,
          @session_id : String,
          @ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)? = nil,
          @description : String? = nil,
          @integration_configuration : Types::SessionIntegrationConfiguration? = nil,
          @orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)? = nil,
          @origin : String? = nil,
          @tag_filter : Types::TagFilter? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration information for the session integration.

      struct SessionIntegrationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the integrated Amazon SNS topic used for streaming chat messages.

        @[JSON::Field(key: "topicIntegrationArn")]
        getter topic_integration_arn : String?

        def initialize(
          @topic_integration_arn : String? = nil
        )
        end
      end

      # Summary information about the session.

      struct SessionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Amazon Q in Connect assistant.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The Amazon Resource Name (ARN) of the session.

        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The identifier of the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @assistant_arn : String,
          @assistant_id : String,
          @session_arn : String,
          @session_id : String
        )
        end
      end

      # Configuration information about the external data source.

      struct SourceConfiguration
        include JSON::Serializable

        # Configuration information for Amazon AppIntegrations to automatically ingest content.

        @[JSON::Field(key: "appIntegrations")]
        getter app_integrations : Types::AppIntegrationsConfiguration?

        # Source configuration for managed resources.

        @[JSON::Field(key: "managedSourceConfiguration")]
        getter managed_source_configuration : Types::ManagedSourceConfiguration?

        def initialize(
          @app_integrations : Types::AppIntegrationsConfiguration? = nil,
          @managed_source_configuration : Types::ManagedSourceConfiguration? = nil
        )
        end
      end

      # Details about the source content data.

      struct SourceContentDataDetails
        include JSON::Serializable

        # The identifier of the source content.

        @[JSON::Field(key: "id")]
        getter id : String

        # Details about the source content ranking data.

        @[JSON::Field(key: "rankingData")]
        getter ranking_data : Types::RankingData

        # Details about the source content text data.

        @[JSON::Field(key: "textData")]
        getter text_data : Types::TextData

        # The type of the source content.

        @[JSON::Field(key: "type")]
        getter type : String

        # Contains information about where the text with a citation begins and ends in the generated output.

        @[JSON::Field(key: "citationSpan")]
        getter citation_span : Types::CitationSpan?

        def initialize(
          @id : String,
          @ranking_data : Types::RankingData,
          @text_data : Types::TextData,
          @type : String,
          @citation_span : Types::CitationSpan? = nil
        )
        end
      end

      # A span represents a unit of work during AI agent execution, capturing timing, status, and contextual
      # attributes.

      struct Span
        include JSON::Serializable

        # UUID of the Connect AI Assistant resource

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # Span-specific contextual attributes

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::SpanAttributes

        # Operation end time in milliseconds since epoch

        @[JSON::Field(key: "endTimestamp")]
        getter end_timestamp : Time

        # The service request ID that initiated the operation

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # UUID of the Connect AI Session resource

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # Unique span identifier

        @[JSON::Field(key: "spanId")]
        getter span_id : String

        # Service-defined operation name

        @[JSON::Field(key: "spanName")]
        getter span_name : String

        # Operation relationship type

        @[JSON::Field(key: "spanType")]
        getter span_type : String

        # Operation start time in milliseconds since epoch

        @[JSON::Field(key: "startTimestamp")]
        getter start_timestamp : Time

        # Span completion status

        @[JSON::Field(key: "status")]
        getter status : String

        # Parent span identifier for hierarchy. Null for root spans.

        @[JSON::Field(key: "parentSpanId")]
        getter parent_span_id : String?

        def initialize(
          @assistant_id : String,
          @attributes : Types::SpanAttributes,
          @end_timestamp : Time,
          @request_id : String,
          @session_id : String,
          @span_id : String,
          @span_name : String,
          @span_type : String,
          @start_timestamp : Time,
          @status : String,
          @parent_span_id : String? = nil
        )
        end
      end

      # Contextual attributes capturing operation details, LLM configuration, usage metrics, and
      # conversation data

      struct SpanAttributes
        include JSON::Serializable

        # Amazon Connect agent ID

        @[JSON::Field(key: "agentId")]
        getter agent_id : String?

        # AI agent ARN

        @[JSON::Field(key: "aiAgentArn")]
        getter ai_agent_arn : String?

        # AI agent identifier

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String?

        # Entity that invoked the AI agent

        @[JSON::Field(key: "aiAgentInvoker")]
        getter ai_agent_invoker : String?

        # AI agent name

        @[JSON::Field(key: "aiAgentName")]
        getter ai_agent_name : String?

        # AI agent orchestrator use case

        @[JSON::Field(key: "aiAgentOrchestratorUseCase")]
        getter ai_agent_orchestrator_use_case : String?

        # AI agent type

        @[JSON::Field(key: "aiAgentType")]
        getter ai_agent_type : String?

        # AI agent version number

        @[JSON::Field(key: "aiAgentVersion")]
        getter ai_agent_version : Int32?

        # Number of input tokens that were retrieved from cache

        @[JSON::Field(key: "cacheReadInputTokens")]
        getter cache_read_input_tokens : Int32?

        # Number of input tokens that were written to cache in this request

        @[JSON::Field(key: "cacheWriteInputTokens")]
        getter cache_write_input_tokens : Int32?

        # Amazon Connect contact identifier

        @[JSON::Field(key: "contactId")]
        getter contact_id : String?

        # Error classification if span failed (e.g., throttle, timeout)

        @[JSON::Field(key: "errorType")]
        getter error_type : String?

        # Amazon Connect contact identifier

        @[JSON::Field(key: "initialContactId")]
        getter initial_contact_id : String?

        # Input message collection sent to LLM

        @[JSON::Field(key: "inputMessages")]
        getter input_messages : Array(Types::SpanMessage)?

        # Amazon Connect instance ARN

        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?

        # Action being performed

        @[JSON::Field(key: "operationName")]
        getter operation_name : String?

        # Output message collection received from LLM

        @[JSON::Field(key: "outputMessages")]
        getter output_messages : Array(Types::SpanMessage)?

        # AI prompt ARN

        @[JSON::Field(key: "promptArn")]
        getter prompt_arn : String?

        # AI prompt identifier

        @[JSON::Field(key: "promptId")]
        getter prompt_id : String?

        # AI prompt name

        @[JSON::Field(key: "promptName")]
        getter prompt_name : String?

        # AI prompt type

        @[JSON::Field(key: "promptType")]
        getter prompt_type : String?

        # AI prompt version number

        @[JSON::Field(key: "promptVersion")]
        getter prompt_version : Int32?

        # Model provider identifier (e.g., aws.bedrock)

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        # Maximum tokens configured for generation

        @[JSON::Field(key: "requestMaxTokens")]
        getter request_max_tokens : Int32?

        # LLM model ID for request (e.g., anthropic.claude-3-sonnet)

        @[JSON::Field(key: "requestModel")]
        getter request_model : String?

        # Generation termination reasons (e.g., stop, max_tokens)

        @[JSON::Field(key: "responseFinishReasons")]
        getter response_finish_reasons : Array(String)?

        # Actual model used for response (usually matches requestModel)

        @[JSON::Field(key: "responseModel")]
        getter response_model : String?

        # Session name

        @[JSON::Field(key: "sessionName")]
        getter session_name : String?

        # System prompt instructions

        @[JSON::Field(key: "systemInstructions")]
        getter system_instructions : Array(Types::SpanMessageValue)?

        # Sampling temperature for generation

        @[JSON::Field(key: "temperature")]
        getter temperature : Float64?

        # Top-p sampling parameter for generation

        @[JSON::Field(key: "topP")]
        getter top_p : Float64?

        # Number of input tokens in prompt

        @[JSON::Field(key: "usageInputTokens")]
        getter usage_input_tokens : Int32?

        # Number of output tokens in response

        @[JSON::Field(key: "usageOutputTokens")]
        getter usage_output_tokens : Int32?

        # Total tokens consumed (input + output)

        @[JSON::Field(key: "usageTotalTokens")]
        getter usage_total_tokens : Int32?

        def initialize(
          @agent_id : String? = nil,
          @ai_agent_arn : String? = nil,
          @ai_agent_id : String? = nil,
          @ai_agent_invoker : String? = nil,
          @ai_agent_name : String? = nil,
          @ai_agent_orchestrator_use_case : String? = nil,
          @ai_agent_type : String? = nil,
          @ai_agent_version : Int32? = nil,
          @cache_read_input_tokens : Int32? = nil,
          @cache_write_input_tokens : Int32? = nil,
          @contact_id : String? = nil,
          @error_type : String? = nil,
          @initial_contact_id : String? = nil,
          @input_messages : Array(Types::SpanMessage)? = nil,
          @instance_arn : String? = nil,
          @operation_name : String? = nil,
          @output_messages : Array(Types::SpanMessage)? = nil,
          @prompt_arn : String? = nil,
          @prompt_id : String? = nil,
          @prompt_name : String? = nil,
          @prompt_type : String? = nil,
          @prompt_version : Int32? = nil,
          @provider_name : String? = nil,
          @request_max_tokens : Int32? = nil,
          @request_model : String? = nil,
          @response_finish_reasons : Array(String)? = nil,
          @response_model : String? = nil,
          @session_name : String? = nil,
          @system_instructions : Array(Types::SpanMessageValue)? = nil,
          @temperature : Float64? = nil,
          @top_p : Float64? = nil,
          @usage_input_tokens : Int32? = nil,
          @usage_output_tokens : Int32? = nil,
          @usage_total_tokens : Int32? = nil
        )
        end
      end

      # A citation that spans a specific range of text.

      struct SpanCitation
        include JSON::Serializable

        # The identifier of the content being cited in the span.

        @[JSON::Field(key: "contentId")]
        getter content_id : String?

        # The Amazon Resource Name (ARN) of the knowledge base containing the cited content.

        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String?

        # The identifier of the knowledge base containing the cited content.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String?

        # The title of the content being cited in the span.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @content_id : String? = nil,
          @knowledge_base_arn : String? = nil,
          @knowledge_base_id : String? = nil,
          @title : String? = nil
        )
        end
      end

      # A message in the conversation history with participant role and content values

      struct SpanMessage
        include JSON::Serializable

        # Unique message identifier

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # Message source role

        @[JSON::Field(key: "participant")]
        getter participant : String

        # Message timestamp

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # Message content values (text, tool use, tool result)

        @[JSON::Field(key: "values")]
        getter values : Array(Types::SpanMessageValue)

        def initialize(
          @message_id : String,
          @participant : String,
          @timestamp : Time,
          @values : Array(Types::SpanMessageValue)
        )
        end
      end

      # Message content value - can be text, tool invocation, or tool result

      struct SpanMessageValue
        include JSON::Serializable

        # Text message content

        @[JSON::Field(key: "text")]
        getter text : Types::SpanTextValue?

        # Tool result message content

        @[JSON::Field(key: "toolResult")]
        getter tool_result : Types::SpanToolResultValue?

        # Tool invocation message content

        @[JSON::Field(key: "toolUse")]
        getter tool_use : Types::SpanToolUseValue?

        def initialize(
          @text : Types::SpanTextValue? = nil,
          @tool_result : Types::SpanToolResultValue? = nil,
          @tool_use : Types::SpanToolUseValue? = nil
        )
        end
      end

      # Text message content

      struct SpanTextValue
        include JSON::Serializable

        # String content of the message text

        @[JSON::Field(key: "value")]
        getter value : String

        # The AI Guardrail assessment for the span text.

        @[JSON::Field(key: "aiGuardrailAssessment")]
        getter ai_guardrail_assessment : Types::AIGuardrailAssessment?

        # The citations associated with the span text.

        @[JSON::Field(key: "citations")]
        getter citations : Array(Types::SpanCitation)?

        def initialize(
          @value : String,
          @ai_guardrail_assessment : Types::AIGuardrailAssessment? = nil,
          @citations : Array(Types::SpanCitation)? = nil
        )
        end
      end

      # Tool result message content

      struct SpanToolResultValue
        include JSON::Serializable

        # Relates this result back to the tool invocation

        @[JSON::Field(key: "toolUseId")]
        getter tool_use_id : String

        # The tool results

        @[JSON::Field(key: "values")]
        getter values : Array(Types::SpanMessageValue)

        # The tool invocation error if failed

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @tool_use_id : String,
          @values : Array(Types::SpanMessageValue),
          @error : String? = nil
        )
        end
      end

      # Tool invocation message content

      struct SpanToolUseValue
        include JSON::Serializable

        # The tool input arguments

        @[JSON::Field(key: "arguments")]
        getter arguments : Types::JSONDocument

        # The tool name

        @[JSON::Field(key: "name")]
        getter name : String

        # Unique ID for this tool invocation

        @[JSON::Field(key: "toolUseId")]
        getter tool_use_id : String

        def initialize(
          @arguments : Types::JSONDocument,
          @name : String,
          @tool_use_id : String
        )
        end
      end


      struct StartContentUploadRequest
        include JSON::Serializable

        # The type of content to upload.

        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The expected expiration time of the generated presigned URL, specified in minutes.

        @[JSON::Field(key: "presignedUrlTimeToLive")]
        getter presigned_url_time_to_live : Int32?

        def initialize(
          @content_type : String,
          @knowledge_base_id : String,
          @presigned_url_time_to_live : Int32? = nil
        )
        end
      end


      struct StartContentUploadResponse
        include JSON::Serializable

        # The headers to include in the upload.

        @[JSON::Field(key: "headersToInclude")]
        getter headers_to_include : Hash(String, String)

        # The identifier of the upload.

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The URL of the upload.

        @[JSON::Field(key: "url")]
        getter url : String

        # The expiration time of the URL as an epoch timestamp.

        @[JSON::Field(key: "urlExpiry")]
        getter url_expiry : Time

        def initialize(
          @headers_to_include : Hash(String, String),
          @upload_id : String,
          @url : String,
          @url_expiry : Time
        )
        end
      end


      struct StartImportJobRequest
        include JSON::Serializable

        # The type of the import job. For importing quick response resource, set the value to QUICK_RESPONSES
        # .

        @[JSON::Field(key: "importJobType")]
        getter import_job_type : String

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.
        # For importing Amazon Q in Connect quick responses, this should be a QUICK_RESPONSES type knowledge
        # base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The tags used to organize, track, or control access for this resource.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration information of the external source that the resource data are imported from.

        @[JSON::Field(key: "externalSourceConfiguration")]
        getter external_source_configuration : Types::ExternalSourceConfiguration?

        # The metadata fields of the imported Amazon Q in Connect resources.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        def initialize(
          @import_job_type : String,
          @knowledge_base_id : String,
          @upload_id : String,
          @client_token : String? = nil,
          @external_source_configuration : Types::ExternalSourceConfiguration? = nil,
          @metadata : Hash(String, String)? = nil
        )
        end
      end


      struct StartImportJobResponse
        include JSON::Serializable

        # The import job.

        @[JSON::Field(key: "importJob")]
        getter import_job : Types::ImportJobData?

        def initialize(
          @import_job : Types::ImportJobData? = nil
        )
        end
      end

      # Details about suggested message data.

      struct SuggestedMessageDataDetails
        include JSON::Serializable

        # The text content of the suggested message.

        @[JSON::Field(key: "messageText")]
        getter message_text : String

        def initialize(
          @message_text : String
        )
        end
      end

      # Reference information for a suggested message.

      struct SuggestedMessageReference
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AI Agent that generated the suggested message.

        @[JSON::Field(key: "aiAgentArn")]
        getter ai_agent_arn : String

        # The identifier of the AI Agent that generated the suggested message.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        def initialize(
          @ai_agent_arn : String,
          @ai_agent_id : String
        )
        end
      end

      # The system attributes that are used with the message template.

      struct SystemAttributes
        include JSON::Serializable

        # The CustomerEndpoint attribute.

        @[JSON::Field(key: "customerEndpoint")]
        getter customer_endpoint : Types::SystemEndpointAttributes?

        # The name of the task.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The SystemEndpoint attribute.

        @[JSON::Field(key: "systemEndpoint")]
        getter system_endpoint : Types::SystemEndpointAttributes?

        def initialize(
          @customer_endpoint : Types::SystemEndpointAttributes? = nil,
          @name : String? = nil,
          @system_endpoint : Types::SystemEndpointAttributes? = nil
        )
        end
      end

      # The system endpoint attributes that are used with the message template.

      struct SystemEndpointAttributes
        include JSON::Serializable

        # The customer's phone number if used with customerEndpoint , or the number the customer dialed to
        # call your contact center if used with systemEndpoint .

        @[JSON::Field(key: "address")]
        getter address : String?

        def initialize(
          @address : String? = nil
        )
        end
      end

      # A leaf node condition which can be used to specify a tag condition.

      struct TagCondition
        include JSON::Serializable

        # The tag key in the tag condition.

        @[JSON::Field(key: "key")]
        getter key : String

        # The tag value in the tag condition.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # An object that can be used to specify Tag conditions.

      struct TagFilter
        include JSON::Serializable

        # A list of conditions which would be applied together with an AND condition.

        @[JSON::Field(key: "andConditions")]
        getter and_conditions : Array(Types::TagCondition)?

        # A list of conditions which would be applied together with an OR condition.

        @[JSON::Field(key: "orConditions")]
        getter or_conditions : Array(Types::OrCondition)?

        # A leaf node condition which can be used to specify a tag condition.

        @[JSON::Field(key: "tagCondition")]
        getter tag_condition : Types::TagCondition?

        def initialize(
          @and_conditions : Array(Types::TagCondition)? = nil,
          @or_conditions : Array(Types::OrCondition)? = nil,
          @tag_condition : Types::TagCondition? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags used to organize, track, or control access for this resource.

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

      # Details about the source content text data.

      struct TextData
        include JSON::Serializable


        @[JSON::Field(key: "excerpt")]
        getter excerpt : Types::DocumentText?


        @[JSON::Field(key: "title")]
        getter title : Types::DocumentText?

        def initialize(
          @excerpt : Types::DocumentText? = nil,
          @title : Types::DocumentText? = nil
        )
        end
      end

      # The configuration for a prompt template that supports full textual prompt configuration using a YAML
      # prompt.

      struct TextFullAIPromptEditTemplateConfiguration
        include JSON::Serializable

        # The YAML text for the AI Prompt template.

        @[JSON::Field(key: "text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      # The message data in text type.

      struct TextMessage
        include JSON::Serializable

        # The AI Guardrail assessment for the text message.

        @[JSON::Field(key: "aiGuardrailAssessment")]
        getter ai_guardrail_assessment : Types::AIGuardrailAssessment?

        # The citations associated with the text message.

        @[JSON::Field(key: "citations")]
        getter citations : Array(Types::Citation)?

        # The value of the message data in text type.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @ai_guardrail_assessment : Types::AIGuardrailAssessment? = nil,
          @citations : Array(Types::Citation)? = nil,
          @value : String? = nil
        )
        end
      end

      # The throttling limit has been exceeded.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon Q in Connect throws this exception if you have too many tags in your tag set.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The specified resource name.

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Configuration settings for a tool used by AI Agents.

      struct ToolConfiguration
        include JSON::Serializable

        # The name of the tool.

        @[JSON::Field(key: "toolName")]
        getter tool_name : String

        # The type of the tool.

        @[JSON::Field(key: "toolType")]
        getter tool_type : String

        # Annotations for the tool configuration.

        @[JSON::Field(key: "annotations")]
        getter annotations : Types::Annotation?

        # The description of the tool configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The input schema for the tool configuration.

        @[JSON::Field(key: "inputSchema")]
        getter input_schema : Types::JSONDocument?

        # Instructions for using the tool.

        @[JSON::Field(key: "instruction")]
        getter instruction : Types::ToolInstruction?

        # Output filters applies to the tool result.

        @[JSON::Field(key: "outputFilters")]
        getter output_filters : Array(Types::ToolOutputFilter)?

        # The output schema for the tool configuration.

        @[JSON::Field(key: "outputSchema")]
        getter output_schema : Types::JSONDocument?

        # Override input values for the tool configuration.

        @[JSON::Field(key: "overrideInputValues")]
        getter override_input_values : Array(Types::ToolOverrideInputValue)?

        # The title of the tool configuration.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The identifier of the tool, for example toolName from Model Context Provider server.

        @[JSON::Field(key: "toolId")]
        getter tool_id : String?

        # Configuration for user interaction with the tool.

        @[JSON::Field(key: "userInteractionConfiguration")]
        getter user_interaction_configuration : Types::UserInteractionConfiguration?

        def initialize(
          @tool_name : String,
          @tool_type : String,
          @annotations : Types::Annotation? = nil,
          @description : String? = nil,
          @input_schema : Types::JSONDocument? = nil,
          @instruction : Types::ToolInstruction? = nil,
          @output_filters : Array(Types::ToolOutputFilter)? = nil,
          @output_schema : Types::JSONDocument? = nil,
          @override_input_values : Array(Types::ToolOverrideInputValue)? = nil,
          @title : String? = nil,
          @tool_id : String? = nil,
          @user_interaction_configuration : Types::UserInteractionConfiguration? = nil
        )
        end
      end

      # Instructions for using a tool.

      struct ToolInstruction
        include JSON::Serializable

        # Examples for using the tool.

        @[JSON::Field(key: "examples")]
        getter examples : Array(String)?

        # The instruction text for the tool.

        @[JSON::Field(key: "instruction")]
        getter instruction : String?

        def initialize(
          @examples : Array(String)? = nil,
          @instruction : String? = nil
        )
        end
      end

      # Configuration for tool output handling.

      struct ToolOutputConfiguration
        include JSON::Serializable

        # Override the tool output results to different variable name.

        @[JSON::Field(key: "outputVariableNameOverride")]
        getter output_variable_name_override : String?

        # The session data namespace for tool output.

        @[JSON::Field(key: "sessionDataNamespace")]
        getter session_data_namespace : String?

        def initialize(
          @output_variable_name_override : String? = nil,
          @session_data_namespace : String? = nil
        )
        end
      end

      # Filter configuration for tool output.

      struct ToolOutputFilter
        include JSON::Serializable

        # The JSON path for filtering tool output.

        @[JSON::Field(key: "jsonPath")]
        getter json_path : String

        # The output configuration for the filter.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::ToolOutputConfiguration?

        def initialize(
          @json_path : String,
          @output_configuration : Types::ToolOutputConfiguration? = nil
        )
        end
      end

      # A constant input value for tool override.

      struct ToolOverrideConstantInputValue
        include JSON::Serializable

        # Override tool input value with constant values

        @[JSON::Field(key: "type")]
        getter type : String

        # The constant input override value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # An input value override for tools.

      struct ToolOverrideInputValue
        include JSON::Serializable

        # The JSON path for the input value override.

        @[JSON::Field(key: "jsonPath")]
        getter json_path : String

        # The override input value.

        @[JSON::Field(key: "value")]
        getter value : Types::ToolOverrideInputValueConfiguration

        def initialize(
          @json_path : String,
          @value : Types::ToolOverrideInputValueConfiguration
        )
        end
      end

      # Configuration for overriding tool input values.

      struct ToolOverrideInputValueConfiguration
        include JSON::Serializable

        # Constant input value configuration for tool override.

        @[JSON::Field(key: "constant")]
        getter constant : Types::ToolOverrideConstantInputValue?

        def initialize(
          @constant : Types::ToolOverrideConstantInputValue? = nil
        )
        end
      end

      # Data about the result of tool usage.

      struct ToolUseResultData
        include JSON::Serializable

        # The name of the tool that was used.

        @[JSON::Field(key: "toolName")]
        getter tool_name : String

        # The result of the tool usage.

        @[JSON::Field(key: "toolResult")]
        getter tool_result : Types::JSONDocument

        # The identifier of the tool use instance.

        @[JSON::Field(key: "toolUseId")]
        getter tool_use_id : String

        # The input schema for the tool use result.

        @[JSON::Field(key: "inputSchema")]
        getter input_schema : Types::JSONDocument?

        def initialize(
          @tool_name : String,
          @tool_result : Types::JSONDocument,
          @tool_use_id : String,
          @input_schema : Types::JSONDocument? = nil
        )
        end
      end

      # You do not have permission to perform this action.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The server has a failure of processing the message

      struct UnprocessableContentException
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

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys.

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


      struct UpdateAIAgentRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Agent.

        @[JSON::Field(key: "aiAgentId")]
        getter ai_agent_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The visbility status of the Amazon Q in Connect AI Agent.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs ..

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration of the Amazon Q in Connect AI Agent.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AIAgentConfiguration?

        # The description of the Amazon Q in Connect AI Agent.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @ai_agent_id : String,
          @assistant_id : String,
          @visibility_status : String,
          @client_token : String? = nil,
          @configuration : Types::AIAgentConfiguration? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateAIAgentResponse
        include JSON::Serializable

        # The data of the updated Amazon Q in Connect AI Agent.

        @[JSON::Field(key: "aiAgent")]
        getter ai_agent : Types::AIAgentData?

        def initialize(
          @ai_agent : Types::AIAgentData? = nil
        )
        end
      end


      struct UpdateAIGuardrailRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Guardrail.

        @[JSON::Field(key: "aiGuardrailId")]
        getter ai_guardrail_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The message to return when the AI Guardrail blocks a prompt.

        @[JSON::Field(key: "blockedInputMessaging")]
        getter blocked_input_messaging : String

        # The message to return when the AI Guardrail blocks a model response.

        @[JSON::Field(key: "blockedOutputsMessaging")]
        getter blocked_outputs_messaging : String

        # The visibility status of the Amazon Q in Connect AI Guardrail.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs ..

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The content filter policies to configure for the AI Guardrail.

        @[JSON::Field(key: "contentPolicyConfig")]
        getter content_policy_config : Types::AIGuardrailContentPolicyConfig?

        # The contextual grounding policy configuration used to create an AI Guardrail.

        @[JSON::Field(key: "contextualGroundingPolicyConfig")]
        getter contextual_grounding_policy_config : Types::AIGuardrailContextualGroundingPolicyConfig?

        # A description of the AI Guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The sensitive information policy to configure for the AI Guardrail.

        @[JSON::Field(key: "sensitiveInformationPolicyConfig")]
        getter sensitive_information_policy_config : Types::AIGuardrailSensitiveInformationPolicyConfig?

        # The topic policies to configure for the AI Guardrail.

        @[JSON::Field(key: "topicPolicyConfig")]
        getter topic_policy_config : Types::AIGuardrailTopicPolicyConfig?

        # The word policy you configure for the AI Guardrail.

        @[JSON::Field(key: "wordPolicyConfig")]
        getter word_policy_config : Types::AIGuardrailWordPolicyConfig?

        def initialize(
          @ai_guardrail_id : String,
          @assistant_id : String,
          @blocked_input_messaging : String,
          @blocked_outputs_messaging : String,
          @visibility_status : String,
          @client_token : String? = nil,
          @content_policy_config : Types::AIGuardrailContentPolicyConfig? = nil,
          @contextual_grounding_policy_config : Types::AIGuardrailContextualGroundingPolicyConfig? = nil,
          @description : String? = nil,
          @sensitive_information_policy_config : Types::AIGuardrailSensitiveInformationPolicyConfig? = nil,
          @topic_policy_config : Types::AIGuardrailTopicPolicyConfig? = nil,
          @word_policy_config : Types::AIGuardrailWordPolicyConfig? = nil
        )
        end
      end


      struct UpdateAIGuardrailResponse
        include JSON::Serializable

        # The data of the updated Amazon Q in Connect AI Guardrail.

        @[JSON::Field(key: "aiGuardrail")]
        getter ai_guardrail : Types::AIGuardrailData?

        def initialize(
          @ai_guardrail : Types::AIGuardrailData? = nil
        )
        end
      end


      struct UpdateAIPromptRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect AI Prompt.

        @[JSON::Field(key: "aiPromptId")]
        getter ai_prompt_id : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The visibility status of the Amazon Q in Connect AI prompt.

        @[JSON::Field(key: "visibilityStatus")]
        getter visibility_status : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs ..

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the Amazon Q in Connect AI Prompt.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated inference configuration for the AI Prompt.

        @[JSON::Field(key: "inferenceConfiguration")]
        getter inference_configuration : Types::AIPromptInferenceConfiguration?

        # The identifier of the model used for this AI Prompt. For information about which models are
        # supported in each Amazon Web Services Region, see Supported models for system/custom prompts .

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The configuration of the prompt template for this AI Prompt.

        @[JSON::Field(key: "templateConfiguration")]
        getter template_configuration : Types::AIPromptTemplateConfiguration?

        def initialize(
          @ai_prompt_id : String,
          @assistant_id : String,
          @visibility_status : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @inference_configuration : Types::AIPromptInferenceConfiguration? = nil,
          @model_id : String? = nil,
          @template_configuration : Types::AIPromptTemplateConfiguration? = nil
        )
        end
      end


      struct UpdateAIPromptResponse
        include JSON::Serializable

        # The data of the updated Amazon Q in Connect AI Prompt.

        @[JSON::Field(key: "aiPrompt")]
        getter ai_prompt : Types::AIPromptData?

        def initialize(
          @ai_prompt : Types::AIPromptData? = nil
        )
        end
      end


      struct UpdateAssistantAIAgentRequest
        include JSON::Serializable

        # The type of the AI Agent being updated for use by default on the Amazon Q in Connect Assistant.

        @[JSON::Field(key: "aiAgentType")]
        getter ai_agent_type : String

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The configuration of the AI Agent being updated for use by default on the Amazon Q in Connect
        # Assistant.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AIAgentConfigurationData

        # The updated list of orchestrator configurations for the assistant AI Agent.

        @[JSON::Field(key: "orchestratorConfigurationList")]
        getter orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)?

        def initialize(
          @ai_agent_type : String,
          @assistant_id : String,
          @configuration : Types::AIAgentConfigurationData,
          @orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)? = nil
        )
        end
      end


      struct UpdateAssistantAIAgentResponse
        include JSON::Serializable


        @[JSON::Field(key: "assistant")]
        getter assistant : Types::AssistantData?

        def initialize(
          @assistant : Types::AssistantData? = nil
        )
        end
      end


      struct UpdateContentRequest
        include JSON::Serializable

        # The identifier of the content. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base. Can
        # be either the ID or the ARN

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A key/value map to store attributes without affecting tagging or recommendations. For example, when
        # synchronizing data between an external system and Amazon Q in Connect, you can store an external
        # version identifier as metadata to utilize for determining drift.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The URI for the article. If the knowledge base has a templateUri, setting this argument overrides it
        # for this piece of content. To remove an existing overrideLinkOurUri , exclude this argument and set
        # removeOverrideLinkOutUri to true.

        @[JSON::Field(key: "overrideLinkOutUri")]
        getter override_link_out_uri : String?

        # Unset the existing overrideLinkOutUri if it exists.

        @[JSON::Field(key: "removeOverrideLinkOutUri")]
        getter remove_override_link_out_uri : Bool?

        # The revisionId of the content resource to update, taken from an earlier call to GetContent ,
        # GetContentSummary , SearchContent , or ListContents . If included, this argument acts as an
        # optimistic lock to ensure content was not modified since it was last read. If it has been modified,
        # this API throws a PreconditionFailedException .

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # The title of the content.

        @[JSON::Field(key: "title")]
        getter title : String?

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .

        @[JSON::Field(key: "uploadId")]
        getter upload_id : String?

        def initialize(
          @content_id : String,
          @knowledge_base_id : String,
          @metadata : Hash(String, String)? = nil,
          @override_link_out_uri : String? = nil,
          @remove_override_link_out_uri : Bool? = nil,
          @revision_id : String? = nil,
          @title : String? = nil,
          @upload_id : String? = nil
        )
        end
      end


      struct UpdateContentResponse
        include JSON::Serializable

        # The content.

        @[JSON::Field(key: "content")]
        getter content : Types::ContentData?

        def initialize(
          @content : Types::ContentData? = nil
        )
        end
      end


      struct UpdateKnowledgeBaseTemplateUriRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base. Can
        # be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The template URI to update.

        @[JSON::Field(key: "templateUri")]
        getter template_uri : String

        def initialize(
          @knowledge_base_id : String,
          @template_uri : String
        )
        end
      end


      struct UpdateKnowledgeBaseTemplateUriResponse
        include JSON::Serializable

        # The knowledge base to update.

        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBaseData?

        def initialize(
          @knowledge_base : Types::KnowledgeBaseData? = nil
        )
        end
      end


      struct UpdateMessageTemplateMetadataRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN. It cannot contain any
        # qualifier.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The description of the message template.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # The name of the message template.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @knowledge_base_id : String,
          @message_template_id : String,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateMessageTemplateMetadataResponse
        include JSON::Serializable

        # The message template.

        @[JSON::Field(key: "messageTemplate")]
        getter message_template : Types::MessageTemplateData?

        def initialize(
          @message_template : Types::MessageTemplateData? = nil
        )
        end
      end


      struct UpdateMessageTemplateRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the message template. Can be either the ID or the ARN. It cannot contain any
        # qualifier.

        @[JSON::Field(key: "messageTemplateId")]
        getter message_template_id : String

        # The content of the message template.

        @[JSON::Field(key: "content")]
        getter content : Types::MessageTemplateContentProvider?

        # An object that specifies the default values to use for variables in the message template. This
        # object contains different categories of key-value pairs. Each key defines a variable or placeholder
        # in the message template. The corresponding value defines the default value for that variable.

        @[JSON::Field(key: "defaultAttributes")]
        getter default_attributes : Types::MessageTemplateAttributes?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW

        @[JSON::Field(key: "language")]
        getter language : String?

        # The source configuration of the message template. Only set this argument for WHATSAPP channel
        # subtype.

        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::MessageTemplateSourceConfiguration?

        def initialize(
          @knowledge_base_id : String,
          @message_template_id : String,
          @content : Types::MessageTemplateContentProvider? = nil,
          @default_attributes : Types::MessageTemplateAttributes? = nil,
          @language : String? = nil,
          @source_configuration : Types::MessageTemplateSourceConfiguration? = nil
        )
        end
      end


      struct UpdateMessageTemplateResponse
        include JSON::Serializable

        # The message template.

        @[JSON::Field(key: "messageTemplate")]
        getter message_template : Types::MessageTemplateData?

        def initialize(
          @message_template : Types::MessageTemplateData? = nil
        )
        end
      end


      struct UpdateQuickResponseRequest
        include JSON::Serializable

        # The identifier of the knowledge base. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the quick response.

        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        # The Amazon Connect contact channels this quick response applies to. The supported contact channel
        # types include Chat .

        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The updated content of the quick response.

        @[JSON::Field(key: "content")]
        getter content : Types::QuickResponseDataProvider?

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for quick
        # response written in plain text. Use application/x.quickresponse;format=markdown for quick response
        # written in richtext.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The updated description of the quick response.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated grouping configuration of the quick response.

        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # Whether the quick response is active.

        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW

        @[JSON::Field(key: "language")]
        getter language : String?

        # The name of the quick response.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Whether to remove the description from the quick response.

        @[JSON::Field(key: "removeDescription")]
        getter remove_description : Bool?

        # Whether to remove the grouping configuration of the quick response.

        @[JSON::Field(key: "removeGroupingConfiguration")]
        getter remove_grouping_configuration : Bool?

        # Whether to remove the shortcut key of the quick response.

        @[JSON::Field(key: "removeShortcutKey")]
        getter remove_shortcut_key : Bool?

        # The shortcut key of the quick response. The value should be unique across the knowledge base.

        @[JSON::Field(key: "shortcutKey")]
        getter shortcut_key : String?

        def initialize(
          @knowledge_base_id : String,
          @quick_response_id : String,
          @channels : Array(String)? = nil,
          @content : Types::QuickResponseDataProvider? = nil,
          @content_type : String? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @is_active : Bool? = nil,
          @language : String? = nil,
          @name : String? = nil,
          @remove_description : Bool? = nil,
          @remove_grouping_configuration : Bool? = nil,
          @remove_shortcut_key : Bool? = nil,
          @shortcut_key : String? = nil
        )
        end
      end


      struct UpdateQuickResponseResponse
        include JSON::Serializable

        # The quick response.

        @[JSON::Field(key: "quickResponse")]
        getter quick_response : Types::QuickResponseData?

        def initialize(
          @quick_response : Types::QuickResponseData? = nil
        )
        end
      end


      struct UpdateSessionDataRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The data stored on the Amazon Q in Connect Session.

        @[JSON::Field(key: "data")]
        getter data : Array(Types::RuntimeSessionData)

        # The identifier of the session. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The namespace into which the session data is stored. Supported namespaces are: Custom

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @assistant_id : String,
          @data : Array(Types::RuntimeSessionData),
          @session_id : String,
          @namespace : String? = nil
        )
        end
      end


      struct UpdateSessionDataResponse
        include JSON::Serializable

        # Data stored in the session.

        @[JSON::Field(key: "data")]
        getter data : Array(Types::RuntimeSessionData)

        # The namespace into which the session data is stored. Supported namespaces are: Custom

        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The Amazon Resource Name (ARN) of the session.

        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The identifier of the session.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @data : Array(Types::RuntimeSessionData),
          @namespace : String,
          @session_arn : String,
          @session_id : String
        )
        end
      end


      struct UpdateSessionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q in Connect assistant. Can be either the ID or the ARN. URLs cannot
        # contain the ARN.

        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the session. Can be either the ID or the ARN. URLs cannot contain the ARN.

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The configuration of the AI Agents (mapped by AI Agent Type to AI Agent version) that should be used
        # by Amazon Q in Connect for this Session.

        @[JSON::Field(key: "aiAgentConfiguration")]
        getter ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)?

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated list of orchestrator configurations for the session.

        @[JSON::Field(key: "orchestratorConfigurationList")]
        getter orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)?

        # The list of orchestrator configurations to remove from the session.

        @[JSON::Field(key: "removeOrchestratorConfigurationList")]
        getter remove_orchestrator_configuration_list : Bool?

        # An object that can be used to specify Tag conditions.

        @[JSON::Field(key: "tagFilter")]
        getter tag_filter : Types::TagFilter?

        def initialize(
          @assistant_id : String,
          @session_id : String,
          @ai_agent_configuration : Hash(String, Types::AIAgentConfigurationData)? = nil,
          @description : String? = nil,
          @orchestrator_configuration_list : Array(Types::OrchestratorConfigurationEntry)? = nil,
          @remove_orchestrator_configuration_list : Bool? = nil,
          @tag_filter : Types::TagFilter? = nil
        )
        end
      end


      struct UpdateSessionResponse
        include JSON::Serializable


        @[JSON::Field(key: "session")]
        getter session : Types::SessionData?

        def initialize(
          @session : Types::SessionData? = nil
        )
        end
      end

      # The configuration of the URL/URLs for the web content that you want to crawl. You should be
      # authorized to crawl the URLs.

      struct UrlConfiguration
        include JSON::Serializable

        # List of URLs for crawling.

        @[JSON::Field(key: "seedUrls")]
        getter seed_urls : Array(Types::SeedUrl)?

        def initialize(
          @seed_urls : Array(Types::SeedUrl)? = nil
        )
        end
      end

      # Configuration for user interaction settings.

      struct UserInteractionConfiguration
        include JSON::Serializable

        # Indicates whether user confirmation is required for the interaction.

        @[JSON::Field(key: "isUserConfirmationRequired")]
        getter is_user_confirmation_required : Bool?

        def initialize(
          @is_user_confirmation_required : Bool? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by a service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
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

        # A custom parser for data source documents.

        @[JSON::Field(key: "parsingConfiguration")]
        getter parsing_configuration : Types::ParsingConfiguration?

        def initialize(
          @chunking_configuration : Types::ChunkingConfiguration? = nil,
          @parsing_configuration : Types::ParsingConfiguration? = nil
        )
        end
      end

      # The configuration details for the web data source.

      struct WebCrawlerConfiguration
        include JSON::Serializable

        # The configuration of the URL/URLs for the web content that you want to crawl. You should be
        # authorized to crawl the URLs.

        @[JSON::Field(key: "urlConfiguration")]
        getter url_configuration : Types::UrlConfiguration

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
        # https://docs.aws.amazon.com/bedrock/latest/userguide/ and no other domains. You can choose to
        # include sub domains in addition to the host or primary domain. For example, web pages that contain
        # aws.amazon.com can also include sub domain docs.aws.amazon.com .

        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @url_configuration : Types::UrlConfiguration,
          @crawler_limits : Types::WebCrawlerLimits? = nil,
          @exclusion_filters : Array(String)? = nil,
          @inclusion_filters : Array(String)? = nil,
          @scope : String? = nil
        )
        end
      end

      # The configuration of crawl limits for the web URLs.

      struct WebCrawlerLimits
        include JSON::Serializable

        # Rate of web URLs retrieved per minute.

        @[JSON::Field(key: "rateLimit")]
        getter rate_limit : Int32?

        def initialize(
          @rate_limit : Int32? = nil
        )
        end
      end

      # The content of the message template that applies to the WHATSAPP channel subtype.

      struct WhatsAppMessageTemplateContent
        include JSON::Serializable

        # The data.

        @[JSON::Field(key: "data")]
        getter data : String?

        def initialize(
          @data : String? = nil
        )
        end
      end

      # Configuration information about the external data source.

      struct WhatsAppMessageTemplateSourceConfiguration
        include JSON::Serializable

        # The ID of the End User Messaging WhatsApp Business Account to associate with this template.

        @[JSON::Field(key: "businessAccountId")]
        getter business_account_id : String

        # The WhatsApp template ID.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # The list of component mapping from WhatsApp template parameters to Message Template attributes.

        @[JSON::Field(key: "components")]
        getter components : Array(String)?

        def initialize(
          @business_account_id : String,
          @template_id : String,
          @components : Array(String)? = nil
        )
        end
      end

      # Configuration information about the external data source.

      struct WhatsAppMessageTemplateSourceConfigurationSummary
        include JSON::Serializable

        # The ID of the End User Messaging WhatsApp Business Account to associate with this template.

        @[JSON::Field(key: "businessAccountId")]
        getter business_account_id : String

        # The ID of WhatsApp template.

        @[JSON::Field(key: "templateId")]
        getter template_id : String

        # The list of component mapping from WhatsApp template parameters to Message Template attributes.

        @[JSON::Field(key: "components")]
        getter components : Array(String)?

        # The language of the WhatsApp template.

        @[JSON::Field(key: "language")]
        getter language : String?

        # The name of the WhatsApp template.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the message template.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The status reason of the message template.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @business_account_id : String,
          @template_id : String,
          @components : Array(String)? = nil,
          @language : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end
    end
  end
end
