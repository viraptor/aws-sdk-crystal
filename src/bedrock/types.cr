require "json"
require "time"

module Aws
  module Bedrock
    module Types

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

      # Account-level enforced guardrail input configuration.

      struct AccountEnforcedGuardrailInferenceInputConfiguration
        include JSON::Serializable

        # Identifier for the guardrail, could be the ID or the ARN.

        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String

        # Numerical guardrail version.

        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String

        # Whether to honor or ignore input tags at runtime.

        @[JSON::Field(key: "inputTags")]
        getter input_tags : String

        def initialize(
          @guardrail_identifier : String,
          @guardrail_version : String,
          @input_tags : String
        )
        end
      end

      # Account enforced guardrail output configuration.

      struct AccountEnforcedGuardrailOutputConfiguration
        include JSON::Serializable

        # Unique ID for the account enforced configuration.

        @[JSON::Field(key: "configId")]
        getter config_id : String?

        # Timestamp.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ARN of the role used to update the configuration.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # ARN representation for the guardrail.

        @[JSON::Field(key: "guardrailArn")]
        getter guardrail_arn : String?

        # Unique ID for the guardrail.

        @[JSON::Field(key: "guardrailId")]
        getter guardrail_id : String?

        # Numerical guardrail version.

        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String?

        # Whether to honor or ignore input tags at runtime.

        @[JSON::Field(key: "inputTags")]
        getter input_tags : String?

        # Configuration owner type.

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # Timestamp.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The ARN of the role used to update the configuration.

        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @config_id : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @guardrail_arn : String? = nil,
          @guardrail_id : String? = nil,
          @guardrail_version : String? = nil,
          @input_tags : String? = nil,
          @owner : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end


      struct AdditionalModelRequestFieldsValue
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the agreement availability

      struct AgreementAvailability
        include JSON::Serializable

        # Status of the agreement.

        @[JSON::Field(key: "status")]
        getter status : String

        # Error message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @status : String,
          @error_message : String? = nil
        )
        end
      end

      # The configuration details of an automated evaluation job. The EvaluationDatasetMetricConfig object
      # is used to specify the prompt datasets, task type, and metric names.

      struct AutomatedEvaluationConfig
        include JSON::Serializable

        # Configuration details of the prompt datasets and metrics you want to use for your evaluation job.

        @[JSON::Field(key: "datasetMetricConfigs")]
        getter dataset_metric_configs : Array(Types::EvaluationDatasetMetricConfig)

        # Defines the configuration of custom metrics to be used in an evaluation job.

        @[JSON::Field(key: "customMetricConfig")]
        getter custom_metric_config : Types::AutomatedEvaluationCustomMetricConfig?

        # Contains the evaluator model configuration details. EvaluatorModelConfig is required for evaluation
        # jobs that use a knowledge base or in model evaluation job that use a model as judge. This model
        # computes all evaluation related metrics.

        @[JSON::Field(key: "evaluatorModelConfig")]
        getter evaluator_model_config : Types::EvaluatorModelConfig?

        def initialize(
          @dataset_metric_configs : Array(Types::EvaluationDatasetMetricConfig),
          @custom_metric_config : Types::AutomatedEvaluationCustomMetricConfig? = nil,
          @evaluator_model_config : Types::EvaluatorModelConfig? = nil
        )
        end
      end

      # Defines the configuration of custom metrics to be used in an evaluation job. To learn more about
      # using custom metrics in Amazon Bedrock evaluation jobs, see Create a prompt for a custom metrics
      # (LLM-as-a-judge model evaluations) and Create a prompt for a custom metrics (RAG evaluations) .

      struct AutomatedEvaluationCustomMetricConfig
        include JSON::Serializable

        # Defines a list of custom metrics to be used in an Amazon Bedrock evaluation job.

        @[JSON::Field(key: "customMetrics")]
        getter custom_metrics : Array(Types::AutomatedEvaluationCustomMetricSource)

        # Configuration of the evaluator model you want to use to evaluate custom metrics in an Amazon Bedrock
        # evaluation job.

        @[JSON::Field(key: "evaluatorModelConfig")]
        getter evaluator_model_config : Types::CustomMetricEvaluatorModelConfig

        def initialize(
          @custom_metrics : Array(Types::AutomatedEvaluationCustomMetricSource),
          @evaluator_model_config : Types::CustomMetricEvaluatorModelConfig
        )
        end
      end

      # An array item definining a single custom metric for use in an Amazon Bedrock evaluation job.

      struct AutomatedEvaluationCustomMetricSource
        include JSON::Serializable

        # The definition of a custom metric for use in an Amazon Bedrock evaluation job.

        @[JSON::Field(key: "customMetricDefinition")]
        getter custom_metric_definition : Types::CustomMetricDefinition?

        def initialize(
          @custom_metric_definition : Types::CustomMetricDefinition? = nil
        )
        end
      end

      # Represents the result of an Automated Reasoning validation check, indicating whether the content is
      # logically valid, invalid, or falls into other categories based on the policy rules.

      struct AutomatedReasoningCheckFinding
        include JSON::Serializable

        # Indicates that Automated Reasoning cannot make a statement about the claims. This can happen if the
        # premises are logically incorrect, or if there is a conflict within the Automated Reasoning policy
        # itself.

        @[JSON::Field(key: "impossible")]
        getter impossible : Types::AutomatedReasoningCheckImpossibleFinding?

        # Indicates that the claims are false. The claims are not implied by the premises and Automated
        # Reasoning policy. Furthermore, there exist different claims that are consistent with the premises
        # and Automated Reasoning policy.

        @[JSON::Field(key: "invalid")]
        getter invalid : Types::AutomatedReasoningCheckInvalidFinding?

        # Identifies that some or all of the input prompt wasn't translated into logic. This can happen if the
        # input isn't relevant to the Automated Reasoning policy, or if the policy doesn't have variables to
        # model relevant input.

        @[JSON::Field(key: "noTranslations")]
        getter no_translations : Types::AutomatedReasoningCheckNoTranslationsFinding?

        # Indicates that the claims can be true or false. It depends on what assumptions are made for the
        # claim to be implied from the premises and Automated Reasoning policy rules. In this situation,
        # different assumptions can make input claims false and alternative claims true.

        @[JSON::Field(key: "satisfiable")]
        getter satisfiable : Types::AutomatedReasoningCheckSatisfiableFinding?

        # Indicates that the input contains too much information for Automated Reasoning to process within its
        # latency limits.

        @[JSON::Field(key: "tooComplex")]
        getter too_complex : Types::AutomatedReasoningCheckTooComplexFinding?

        # Indicates that an ambiguity was detected in the translation, making it unsound to continue with
        # validity checking. Additional context or follow-up questions might be needed to get translation to
        # succeed.

        @[JSON::Field(key: "translationAmbiguous")]
        getter translation_ambiguous : Types::AutomatedReasoningCheckTranslationAmbiguousFinding?

        # Indicates that the claims are true. The claims are implied by the premises and the Automated
        # Reasoning policy. Given the Automated Reasoning policy and premises, it is not possible for these
        # claims to be false.

        @[JSON::Field(key: "valid")]
        getter valid : Types::AutomatedReasoningCheckValidFinding?

        def initialize(
          @impossible : Types::AutomatedReasoningCheckImpossibleFinding? = nil,
          @invalid : Types::AutomatedReasoningCheckInvalidFinding? = nil,
          @no_translations : Types::AutomatedReasoningCheckNoTranslationsFinding? = nil,
          @satisfiable : Types::AutomatedReasoningCheckSatisfiableFinding? = nil,
          @too_complex : Types::AutomatedReasoningCheckTooComplexFinding? = nil,
          @translation_ambiguous : Types::AutomatedReasoningCheckTranslationAmbiguousFinding? = nil,
          @valid : Types::AutomatedReasoningCheckValidFinding? = nil
        )
        end
      end

      # Indicates that no valid claims can be made due to logical contradictions in the premises or rules.

      struct AutomatedReasoningCheckImpossibleFinding
        include JSON::Serializable

        # The automated reasoning policy rules that contradict the claims and/or premises in the input.

        @[JSON::Field(key: "contradictingRules")]
        getter contradicting_rules : Array(Types::AutomatedReasoningCheckRule)?

        # Indication of a logic issue with the translation without needing to consider the automated reasoning
        # policy rules.

        @[JSON::Field(key: "logicWarning")]
        getter logic_warning : Types::AutomatedReasoningCheckLogicWarning?

        # The logical translation of the input that this finding evaluates.

        @[JSON::Field(key: "translation")]
        getter translation : Types::AutomatedReasoningCheckTranslation?

        def initialize(
          @contradicting_rules : Array(Types::AutomatedReasoningCheckRule)? = nil,
          @logic_warning : Types::AutomatedReasoningCheckLogicWarning? = nil,
          @translation : Types::AutomatedReasoningCheckTranslation? = nil
        )
        end
      end

      # References a portion of the original input text that corresponds to logical elements.

      struct AutomatedReasoningCheckInputTextReference
        include JSON::Serializable

        # The specific text from the original input that this reference points to.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # Indicates that the claims are logically false and contradictory to the established rules or
      # premises.

      struct AutomatedReasoningCheckInvalidFinding
        include JSON::Serializable

        # The automated reasoning policy rules that contradict the claims in the input.

        @[JSON::Field(key: "contradictingRules")]
        getter contradicting_rules : Array(Types::AutomatedReasoningCheckRule)?

        # Indication of a logic issue with the translation without needing to consider the automated reasoning
        # policy rules.

        @[JSON::Field(key: "logicWarning")]
        getter logic_warning : Types::AutomatedReasoningCheckLogicWarning?

        # The logical translation of the input that this finding invalidates.

        @[JSON::Field(key: "translation")]
        getter translation : Types::AutomatedReasoningCheckTranslation?

        def initialize(
          @contradicting_rules : Array(Types::AutomatedReasoningCheckRule)? = nil,
          @logic_warning : Types::AutomatedReasoningCheckLogicWarning? = nil,
          @translation : Types::AutomatedReasoningCheckTranslation? = nil
        )
        end
      end

      # Identifies logical issues in the translated statements that exist independent of any policy rules,
      # such as statements that are always true or always false.

      struct AutomatedReasoningCheckLogicWarning
        include JSON::Serializable

        # The logical statements that are validated while assuming the policy and premises.

        @[JSON::Field(key: "claims")]
        getter claims : Array(Types::AutomatedReasoningLogicStatement)?

        # The logical statements that serve as premises under which the claims are validated.

        @[JSON::Field(key: "premises")]
        getter premises : Array(Types::AutomatedReasoningLogicStatement)?

        # The category of the detected logical issue, such as statements that are always true or always false.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @claims : Array(Types::AutomatedReasoningLogicStatement)? = nil,
          @premises : Array(Types::AutomatedReasoningLogicStatement)? = nil,
          @type : String? = nil
        )
        end
      end

      # Indicates that no relevant logical information could be extracted from the input for validation.

      struct AutomatedReasoningCheckNoTranslationsFinding
        include JSON::Serializable

        def initialize
        end
      end

      # References a specific automated reasoning policy rule that was applied during evaluation.

      struct AutomatedReasoningCheckRule
        include JSON::Serializable

        # The unique identifier of the automated reasoning rule.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ARN of the automated reasoning policy version that contains this rule.

        @[JSON::Field(key: "policyVersionArn")]
        getter policy_version_arn : String?

        def initialize(
          @id : String? = nil,
          @policy_version_arn : String? = nil
        )
        end
      end

      # Indicates that the claims could be either true or false depending on additional assumptions not
      # provided in the input.

      struct AutomatedReasoningCheckSatisfiableFinding
        include JSON::Serializable

        # An example scenario demonstrating how the claims could be logically false.

        @[JSON::Field(key: "claimsFalseScenario")]
        getter claims_false_scenario : Types::AutomatedReasoningCheckScenario?

        # An example scenario demonstrating how the claims could be logically true.

        @[JSON::Field(key: "claimsTrueScenario")]
        getter claims_true_scenario : Types::AutomatedReasoningCheckScenario?

        # Indication of a logic issue with the translation without needing to consider the automated reasoning
        # policy rules.

        @[JSON::Field(key: "logicWarning")]
        getter logic_warning : Types::AutomatedReasoningCheckLogicWarning?

        # The logical translation of the input that this finding evaluates.

        @[JSON::Field(key: "translation")]
        getter translation : Types::AutomatedReasoningCheckTranslation?

        def initialize(
          @claims_false_scenario : Types::AutomatedReasoningCheckScenario? = nil,
          @claims_true_scenario : Types::AutomatedReasoningCheckScenario? = nil,
          @logic_warning : Types::AutomatedReasoningCheckLogicWarning? = nil,
          @translation : Types::AutomatedReasoningCheckTranslation? = nil
        )
        end
      end

      # Represents a logical scenario where claims can be evaluated as true or false, containing specific
      # logical assignments.

      struct AutomatedReasoningCheckScenario
        include JSON::Serializable

        # List of logical assignments and statements that define this scenario.

        @[JSON::Field(key: "statements")]
        getter statements : Array(Types::AutomatedReasoningLogicStatement)?

        def initialize(
          @statements : Array(Types::AutomatedReasoningLogicStatement)? = nil
        )
        end
      end

      # Indicates that the input exceeds the processing capacity due to the volume or complexity of the
      # logical information.

      struct AutomatedReasoningCheckTooComplexFinding
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the logical translation of natural language input into formal logical statements, including
      # premises, claims, and confidence scores.

      struct AutomatedReasoningCheckTranslation
        include JSON::Serializable

        # The logical statements that are being validated against the premises and policy rules.

        @[JSON::Field(key: "claims")]
        getter claims : Array(Types::AutomatedReasoningLogicStatement)

        # A confidence score between 0 and 1 indicating how certain the system is about the logical
        # translation.

        @[JSON::Field(key: "confidence")]
        getter confidence : Float64

        # The logical statements that serve as the foundation or assumptions for the claims.

        @[JSON::Field(key: "premises")]
        getter premises : Array(Types::AutomatedReasoningLogicStatement)?

        # References to portions of the original input text that correspond to the claims but could not be
        # fully translated.

        @[JSON::Field(key: "untranslatedClaims")]
        getter untranslated_claims : Array(Types::AutomatedReasoningCheckInputTextReference)?

        # References to portions of the original input text that correspond to the premises but could not be
        # fully translated.

        @[JSON::Field(key: "untranslatedPremises")]
        getter untranslated_premises : Array(Types::AutomatedReasoningCheckInputTextReference)?

        def initialize(
          @claims : Array(Types::AutomatedReasoningLogicStatement),
          @confidence : Float64,
          @premises : Array(Types::AutomatedReasoningLogicStatement)? = nil,
          @untranslated_claims : Array(Types::AutomatedReasoningCheckInputTextReference)? = nil,
          @untranslated_premises : Array(Types::AutomatedReasoningCheckInputTextReference)? = nil
        )
        end
      end

      # Indicates that the input has multiple valid logical interpretations, requiring additional context or
      # clarification.

      struct AutomatedReasoningCheckTranslationAmbiguousFinding
        include JSON::Serializable

        # Scenarios showing how the different translation options differ in meaning.

        @[JSON::Field(key: "differenceScenarios")]
        getter difference_scenarios : Array(Types::AutomatedReasoningCheckScenario)?

        # Different logical interpretations that were detected during translation of the input.

        @[JSON::Field(key: "options")]
        getter options : Array(Types::AutomatedReasoningCheckTranslationOption)?

        def initialize(
          @difference_scenarios : Array(Types::AutomatedReasoningCheckScenario)? = nil,
          @options : Array(Types::AutomatedReasoningCheckTranslationOption)? = nil
        )
        end
      end

      # Represents one possible logical interpretation of ambiguous input content.

      struct AutomatedReasoningCheckTranslationOption
        include JSON::Serializable

        # Different logical interpretations that were detected during translation of the input.

        @[JSON::Field(key: "translations")]
        getter translations : Array(Types::AutomatedReasoningCheckTranslation)?

        def initialize(
          @translations : Array(Types::AutomatedReasoningCheckTranslation)? = nil
        )
        end
      end

      # Indicates that the claims are definitively true and logically implied by the premises, with no
      # possible alternative interpretations.

      struct AutomatedReasoningCheckValidFinding
        include JSON::Serializable

        # An example scenario demonstrating how the claims are logically true.

        @[JSON::Field(key: "claimsTrueScenario")]
        getter claims_true_scenario : Types::AutomatedReasoningCheckScenario?

        # Indication of a logic issue with the translation without needing to consider the automated reasoning
        # policy rules.

        @[JSON::Field(key: "logicWarning")]
        getter logic_warning : Types::AutomatedReasoningCheckLogicWarning?

        # The automated reasoning policy rules that support why this result is considered valid.

        @[JSON::Field(key: "supportingRules")]
        getter supporting_rules : Array(Types::AutomatedReasoningCheckRule)?

        # The logical translation of the input that this finding validates.

        @[JSON::Field(key: "translation")]
        getter translation : Types::AutomatedReasoningCheckTranslation?

        def initialize(
          @claims_true_scenario : Types::AutomatedReasoningCheckScenario? = nil,
          @logic_warning : Types::AutomatedReasoningCheckLogicWarning? = nil,
          @supporting_rules : Array(Types::AutomatedReasoningCheckRule)? = nil,
          @translation : Types::AutomatedReasoningCheckTranslation? = nil
        )
        end
      end

      # Represents a logical statement that can be expressed both in formal logic notation and natural
      # language, providing dual representations for better understanding and validation.

      struct AutomatedReasoningLogicStatement
        include JSON::Serializable

        # The formal logic representation of the statement using mathematical notation and logical operators.

        @[JSON::Field(key: "logic")]
        getter logic : String

        # The natural language representation of the logical statement, providing a human-readable
        # interpretation of the formal logic.

        @[JSON::Field(key: "naturalLanguage")]
        getter natural_language : String?

        def initialize(
          @logic : String,
          @natural_language : String? = nil
        )
        end
      end

      # An annotation for adding a new rule to an Automated Reasoning policy using a formal logical
      # expression.

      struct AutomatedReasoningPolicyAddRuleAnnotation
        include JSON::Serializable

        # The formal logical expression that defines the rule, using mathematical notation and referencing
        # policy variables and types.

        @[JSON::Field(key: "expression")]
        getter expression : String

        def initialize(
          @expression : String
        )
        end
      end

      # An annotation for adding a new rule to the policy by converting a natural language description into
      # a formal logical expression.

      struct AutomatedReasoningPolicyAddRuleFromNaturalLanguageAnnotation
        include JSON::Serializable

        # The natural language description of the rule that should be converted into a formal logical
        # expression.

        @[JSON::Field(key: "naturalLanguage")]
        getter natural_language : String

        def initialize(
          @natural_language : String
        )
        end
      end

      # A mutation operation that adds a new rule to the policy definition during the build process.

      struct AutomatedReasoningPolicyAddRuleMutation
        include JSON::Serializable

        # The rule definition that specifies the formal logical expression and metadata for the new rule being
        # added to the policy.

        @[JSON::Field(key: "rule")]
        getter rule : Types::AutomatedReasoningPolicyDefinitionRule

        def initialize(
          @rule : Types::AutomatedReasoningPolicyDefinitionRule
        )
        end
      end

      # An annotation for adding a new custom type to an Automated Reasoning policy, defining a set of
      # possible values for variables.

      struct AutomatedReasoningPolicyAddTypeAnnotation
        include JSON::Serializable

        # A description of what the custom type represents and how it should be used in the policy.

        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the new custom type. This name will be used to reference the type in variable
        # definitions and rules.

        @[JSON::Field(key: "name")]
        getter name : String

        # The list of possible values that variables of this type can take, each with its own description and
        # identifier.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::AutomatedReasoningPolicyDefinitionTypeValue)

        def initialize(
          @description : String,
          @name : String,
          @values : Array(Types::AutomatedReasoningPolicyDefinitionTypeValue)
        )
        end
      end

      # A mutation operation that adds a new custom type to the policy definition during the build process.

      struct AutomatedReasoningPolicyAddTypeMutation
        include JSON::Serializable

        # The type definition that specifies the name, description, and possible values for the new custom
        # type being added to the policy.

        @[JSON::Field(key: "type")]
        getter type : Types::AutomatedReasoningPolicyDefinitionType

        def initialize(
          @type : Types::AutomatedReasoningPolicyDefinitionType
        )
        end
      end

      # Represents a single value that can be added to an existing custom type in the policy.

      struct AutomatedReasoningPolicyAddTypeValue
        include JSON::Serializable

        # The identifier or name of the new value to add to the type.

        @[JSON::Field(key: "value")]
        getter value : String

        # A description of what this new type value represents and when it should be used.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @value : String,
          @description : String? = nil
        )
        end
      end

      # An annotation for adding a new variable to an Automated Reasoning policy, which can be used in rule
      # expressions.

      struct AutomatedReasoningPolicyAddVariableAnnotation
        include JSON::Serializable

        # A description of what the variable represents and how it should be used in rules.

        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the new variable. This name will be used to reference the variable in rule expressions.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the variable, which can be a built-in type (like string or number) or a custom type
        # defined in the policy.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @description : String,
          @name : String,
          @type : String
        )
        end
      end

      # A mutation operation that adds a new variable to the policy definition during the build process.

      struct AutomatedReasoningPolicyAddVariableMutation
        include JSON::Serializable

        # The variable definition that specifies the name, type, and description for the new variable being
        # added to the policy.

        @[JSON::Field(key: "variable")]
        getter variable : Types::AutomatedReasoningPolicyDefinitionVariable

        def initialize(
          @variable : Types::AutomatedReasoningPolicyDefinitionVariable
        )
        end
      end

      # Contains the various operations that can be performed on an Automated Reasoning policy, including
      # adding, updating, and deleting rules, variables, and types.

      struct AutomatedReasoningPolicyAnnotation
        include JSON::Serializable

        # An operation to add a new logical rule to the policy using formal mathematical expressions.

        @[JSON::Field(key: "addRule")]
        getter add_rule : Types::AutomatedReasoningPolicyAddRuleAnnotation?

        # An operation to add a new rule by converting natural language descriptions into formal logical
        # expressions.

        @[JSON::Field(key: "addRuleFromNaturalLanguage")]
        getter add_rule_from_natural_language : Types::AutomatedReasoningPolicyAddRuleFromNaturalLanguageAnnotation?

        # An operation to add a new custom type to the policy, defining a set of possible values for policy
        # variables.

        @[JSON::Field(key: "addType")]
        getter add_type : Types::AutomatedReasoningPolicyAddTypeAnnotation?

        # An operation to add a new variable to the policy, which can be used in rule expressions to represent
        # dynamic values.

        @[JSON::Field(key: "addVariable")]
        getter add_variable : Types::AutomatedReasoningPolicyAddVariableAnnotation?

        # An operation to remove a rule from the policy.

        @[JSON::Field(key: "deleteRule")]
        getter delete_rule : Types::AutomatedReasoningPolicyDeleteRuleAnnotation?

        # An operation to remove a custom type from the policy. The type must not be referenced by any
        # variables or rules.

        @[JSON::Field(key: "deleteType")]
        getter delete_type : Types::AutomatedReasoningPolicyDeleteTypeAnnotation?

        # An operation to remove a variable from the policy. The variable must not be referenced by any rules.

        @[JSON::Field(key: "deleteVariable")]
        getter delete_variable : Types::AutomatedReasoningPolicyDeleteVariableAnnotation?

        # An operation to process and incorporate new content into the policy, extracting additional rules and
        # concepts.

        @[JSON::Field(key: "ingestContent")]
        getter ingest_content : Types::AutomatedReasoningPolicyIngestContentAnnotation?

        # An operation to update the policy based on feedback about how specific rules performed during
        # testing or validation.

        @[JSON::Field(key: "updateFromRulesFeedback")]
        getter update_from_rules_feedback : Types::AutomatedReasoningPolicyUpdateFromRuleFeedbackAnnotation?

        # An operation to update the policy based on feedback about how it performed on specific test
        # scenarios.

        @[JSON::Field(key: "updateFromScenarioFeedback")]
        getter update_from_scenario_feedback : Types::AutomatedReasoningPolicyUpdateFromScenarioFeedbackAnnotation?

        # An operation to modify an existing rule in the policy, such as changing its logical expression or
        # conditions.

        @[JSON::Field(key: "updateRule")]
        getter update_rule : Types::AutomatedReasoningPolicyUpdateRuleAnnotation?

        # An operation to modify an existing custom type in the policy, such as changing its name,
        # description, or allowed values.

        @[JSON::Field(key: "updateType")]
        getter update_type : Types::AutomatedReasoningPolicyUpdateTypeAnnotation?

        # An operation to modify an existing variable in the policy, such as changing its name, type, or
        # description.

        @[JSON::Field(key: "updateVariable")]
        getter update_variable : Types::AutomatedReasoningPolicyUpdateVariableAnnotation?

        def initialize(
          @add_rule : Types::AutomatedReasoningPolicyAddRuleAnnotation? = nil,
          @add_rule_from_natural_language : Types::AutomatedReasoningPolicyAddRuleFromNaturalLanguageAnnotation? = nil,
          @add_type : Types::AutomatedReasoningPolicyAddTypeAnnotation? = nil,
          @add_variable : Types::AutomatedReasoningPolicyAddVariableAnnotation? = nil,
          @delete_rule : Types::AutomatedReasoningPolicyDeleteRuleAnnotation? = nil,
          @delete_type : Types::AutomatedReasoningPolicyDeleteTypeAnnotation? = nil,
          @delete_variable : Types::AutomatedReasoningPolicyDeleteVariableAnnotation? = nil,
          @ingest_content : Types::AutomatedReasoningPolicyIngestContentAnnotation? = nil,
          @update_from_rules_feedback : Types::AutomatedReasoningPolicyUpdateFromRuleFeedbackAnnotation? = nil,
          @update_from_scenario_feedback : Types::AutomatedReasoningPolicyUpdateFromScenarioFeedbackAnnotation? = nil,
          @update_rule : Types::AutomatedReasoningPolicyUpdateRuleAnnotation? = nil,
          @update_type : Types::AutomatedReasoningPolicyUpdateTypeAnnotation? = nil,
          @update_variable : Types::AutomatedReasoningPolicyUpdateVariableAnnotation? = nil
        )
        end
      end

      # Contains detailed logging information about the policy build process, including steps taken,
      # decisions made, and any issues encountered.

      struct AutomatedReasoningPolicyBuildLog
        include JSON::Serializable

        # A list of log entries documenting each step in the policy build process, including timestamps,
        # status, and detailed messages.

        @[JSON::Field(key: "entries")]
        getter entries : Array(Types::AutomatedReasoningPolicyBuildLogEntry)

        def initialize(
          @entries : Array(Types::AutomatedReasoningPolicyBuildLogEntry)
        )
        end
      end

      # Represents a single entry in the policy build log, containing information about a specific step or
      # event in the build process.

      struct AutomatedReasoningPolicyBuildLogEntry
        include JSON::Serializable

        # The annotation or operation that was being processed when this log entry was created.

        @[JSON::Field(key: "annotation")]
        getter annotation : Types::AutomatedReasoningPolicyAnnotation

        # Detailed information about the specific build steps that were executed, including any sub-operations
        # or transformations.

        @[JSON::Field(key: "buildSteps")]
        getter build_steps : Array(Types::AutomatedReasoningPolicyBuildStep)

        # The status of the build step (e.g., SUCCESS, FAILED, IN_PROGRESS).

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @annotation : Types::AutomatedReasoningPolicyAnnotation,
          @build_steps : Array(Types::AutomatedReasoningPolicyBuildStep),
          @status : String
        )
        end
      end

      # Contains the various assets generated during a policy build workflow, including logs, quality
      # reports, test cases, and the final policy definition.

      struct AutomatedReasoningPolicyBuildResultAssets
        include JSON::Serializable

        # The complete build log containing detailed information about each step in the policy generation
        # process.

        @[JSON::Field(key: "buildLog")]
        getter build_log : Types::AutomatedReasoningPolicyBuildLog?

        # A comprehensive test suite generated by the build workflow, providing validation capabilities for
        # automated reasoning policies.

        @[JSON::Field(key: "generatedTestCases")]
        getter generated_test_cases : Types::AutomatedReasoningPolicyGeneratedTestCases?

        # The complete policy definition generated by the build workflow, containing all rules, variables, and
        # custom types extracted from the source documents.

        @[JSON::Field(key: "policyDefinition")]
        getter policy_definition : Types::AutomatedReasoningPolicyDefinition?

        # An entity encompassing all the policy scenarios generated by the build workflow, which can be used
        # to validate an Automated Reasoning policy.

        @[JSON::Field(key: "policyScenarios")]
        getter policy_scenarios : Types::AutomatedReasoningPolicyScenarios?

        # A comprehensive report analyzing the quality of the generated policy, including metrics about rule
        # coverage, potential conflicts, and unused elements.

        @[JSON::Field(key: "qualityReport")]
        getter quality_report : Types::AutomatedReasoningPolicyDefinitionQualityReport?

        def initialize(
          @build_log : Types::AutomatedReasoningPolicyBuildLog? = nil,
          @generated_test_cases : Types::AutomatedReasoningPolicyGeneratedTestCases? = nil,
          @policy_definition : Types::AutomatedReasoningPolicyDefinition? = nil,
          @policy_scenarios : Types::AutomatedReasoningPolicyScenarios? = nil,
          @quality_report : Types::AutomatedReasoningPolicyDefinitionQualityReport? = nil
        )
        end
      end

      # Represents a single step in the policy build process, containing context about what was being
      # processed and any messages or results.

      struct AutomatedReasoningPolicyBuildStep
        include JSON::Serializable

        # Contextual information about what was being processed during this build step, such as the type of
        # operation or the source material being analyzed.

        @[JSON::Field(key: "context")]
        getter context : Types::AutomatedReasoningPolicyBuildStepContext

        # A list of messages generated during this build step, including informational messages, warnings, and
        # error details.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::AutomatedReasoningPolicyBuildStepMessage)

        # Reference to the previous element or step in the build process, helping to trace the sequence of
        # operations.

        @[JSON::Field(key: "priorElement")]
        getter prior_element : Types::AutomatedReasoningPolicyDefinitionElement?

        def initialize(
          @context : Types::AutomatedReasoningPolicyBuildStepContext,
          @messages : Array(Types::AutomatedReasoningPolicyBuildStepMessage),
          @prior_element : Types::AutomatedReasoningPolicyDefinitionElement? = nil
        )
        end
      end

      # Provides context about what type of operation was being performed during a build step.

      struct AutomatedReasoningPolicyBuildStepContext
        include JSON::Serializable

        # Indicates that this build step involved modifying the policy structure, such as adding or updating
        # rules, variables, or types.

        @[JSON::Field(key: "mutation")]
        getter mutation : Types::AutomatedReasoningPolicyMutation?

        # Indicates that this build step was part of the planning phase, where the system determines what
        # operations to perform.

        @[JSON::Field(key: "planning")]
        getter planning : Types::AutomatedReasoningPolicyPlanning?

        def initialize(
          @mutation : Types::AutomatedReasoningPolicyMutation? = nil,
          @planning : Types::AutomatedReasoningPolicyPlanning? = nil
        )
        end
      end

      # Represents a message generated during a build step, providing information about what happened or any
      # issues encountered.

      struct AutomatedReasoningPolicyBuildStepMessage
        include JSON::Serializable

        # The content of the message, describing what occurred during the build step.

        @[JSON::Field(key: "message")]
        getter message : String

        # The type of message (e.g., INFO, WARNING, ERROR) indicating its severity and purpose.

        @[JSON::Field(key: "messageType")]
        getter message_type : String

        def initialize(
          @message : String,
          @message_type : String
        )
        end
      end

      # Represents a source document used in the policy build workflow, containing the content and metadata
      # needed for policy generation.

      struct AutomatedReasoningPolicyBuildWorkflowDocument
        include JSON::Serializable

        # The actual content of the source document that will be analyzed to extract policy rules and
        # concepts.

        @[JSON::Field(key: "document")]
        getter document : Bytes

        # The MIME type of the document content (e.g., text/plain, application/pdf, text/markdown).

        @[JSON::Field(key: "documentContentType")]
        getter document_content_type : String

        # A descriptive name for the document that helps identify its purpose and content.

        @[JSON::Field(key: "documentName")]
        getter document_name : String

        # A detailed description of the document's content and how it should be used in the policy generation
        # process.

        @[JSON::Field(key: "documentDescription")]
        getter document_description : String?

        def initialize(
          @document : Bytes,
          @document_content_type : String,
          @document_name : String,
          @document_description : String? = nil
        )
        end
      end

      # Contains content and instructions for repairing or improving an existing Automated Reasoning policy.

      struct AutomatedReasoningPolicyBuildWorkflowRepairContent
        include JSON::Serializable

        # Specific annotations or modifications to apply during the policy repair process, such as rule
        # corrections or variable updates.

        @[JSON::Field(key: "annotations")]
        getter annotations : Array(Types::AutomatedReasoningPolicyAnnotation)

        def initialize(
          @annotations : Array(Types::AutomatedReasoningPolicyAnnotation)
        )
        end
      end

      # Defines the source content for a policy build workflow, which can include documents, repair
      # instructions, or other input materials.

      struct AutomatedReasoningPolicyBuildWorkflowSource
        include JSON::Serializable

        # An existing policy definition that serves as the starting point for the build workflow, typically
        # used in policy repair or update scenarios.

        @[JSON::Field(key: "policyDefinition")]
        getter policy_definition : Types::AutomatedReasoningPolicyDefinition?

        # The actual content to be processed in the build workflow, such as documents to analyze or repair
        # instructions to apply.

        @[JSON::Field(key: "workflowContent")]
        getter workflow_content : Types::AutomatedReasoningPolicyWorkflowTypeContent?

        def initialize(
          @policy_definition : Types::AutomatedReasoningPolicyDefinition? = nil,
          @workflow_content : Types::AutomatedReasoningPolicyWorkflowTypeContent? = nil
        )
        end
      end

      # Provides a summary of a policy build workflow, including its current status, timing information, and
      # key identifiers.

      struct AutomatedReasoningPolicyBuildWorkflowSummary
        include JSON::Serializable

        # The unique identifier of the build workflow.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The type of build workflow (e.g., DOCUMENT_INGESTION, POLICY_REPAIR).

        @[JSON::Field(key: "buildWorkflowType")]
        getter build_workflow_type : String

        # The timestamp when the build workflow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy associated with this build
        # workflow.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The current status of the build workflow (e.g., RUNNING, COMPLETED, FAILED, CANCELLED).

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the build workflow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @build_workflow_id : String,
          @build_workflow_type : String,
          @created_at : Time,
          @policy_arn : String,
          @status : String,
          @updated_at : Time
        )
        end
      end

      # Contains the formal logic rules, variables, and custom variable types that define an Automated
      # Reasoning policy. The policy definition specifies the constraints used to validate foundation model
      # responses for accuracy and logical consistency.

      struct AutomatedReasoningPolicyDefinition
        include JSON::Serializable

        # The formal logic rules extracted from the source document. Rules define the logical constraints that
        # determine whether model responses are valid, invalid, or satisfiable.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::AutomatedReasoningPolicyDefinitionRule)?

        # The custom user-defined vairable types used in the policy. Types are enum-based variable types that
        # provide additional context beyond the predefined variable types.

        @[JSON::Field(key: "types")]
        getter types : Array(Types::AutomatedReasoningPolicyDefinitionType)?

        # The variables that represent concepts in the policy. Variables can have values assigned when
        # translating natural language into formal logic. Their descriptions are crucial for accurate
        # translation.

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::AutomatedReasoningPolicyDefinitionVariable)?

        # The version of the policy definition format.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @rules : Array(Types::AutomatedReasoningPolicyDefinitionRule)? = nil,
          @types : Array(Types::AutomatedReasoningPolicyDefinitionType)? = nil,
          @variables : Array(Types::AutomatedReasoningPolicyDefinitionVariable)? = nil,
          @version : String? = nil
        )
        end
      end

      # Represents a single element in an Automated Reasoning policy definition, such as a rule, variable,
      # or type definition.

      struct AutomatedReasoningPolicyDefinitionElement
        include JSON::Serializable

        # A rule element within the policy definition that contains a formal logical expression used for
        # validation.

        @[JSON::Field(key: "policyDefinitionRule")]
        getter policy_definition_rule : Types::AutomatedReasoningPolicyDefinitionRule?

        # A custom type element within the policy definition that defines a set of possible values for
        # variables.

        @[JSON::Field(key: "policyDefinitionType")]
        getter policy_definition_type : Types::AutomatedReasoningPolicyDefinitionType?

        # A variable element within the policy definition that represents a concept used in logical
        # expressions and rules.

        @[JSON::Field(key: "policyDefinitionVariable")]
        getter policy_definition_variable : Types::AutomatedReasoningPolicyDefinitionVariable?

        def initialize(
          @policy_definition_rule : Types::AutomatedReasoningPolicyDefinitionRule? = nil,
          @policy_definition_type : Types::AutomatedReasoningPolicyDefinitionType? = nil,
          @policy_definition_variable : Types::AutomatedReasoningPolicyDefinitionVariable? = nil
        )
        end
      end

      # Provides a comprehensive analysis of the quality and completeness of an Automated Reasoning policy
      # definition, highlighting potential issues and optimization opportunities.

      struct AutomatedReasoningPolicyDefinitionQualityReport
        include JSON::Serializable

        # A list of rules that may conflict with each other, potentially leading to inconsistent policy
        # behavior.

        @[JSON::Field(key: "conflictingRules")]
        getter conflicting_rules : Array(String)

        # Groups of rules that operate on completely separate sets of variables, indicating the policy may be
        # addressing multiple unrelated concerns.

        @[JSON::Field(key: "disjointRuleSets")]
        getter disjoint_rule_sets : Array(Types::AutomatedReasoningPolicyDisjointRuleSet)

        # The total number of rules defined in the policy.

        @[JSON::Field(key: "ruleCount")]
        getter rule_count : Int32

        # The total number of custom types defined in the policy.

        @[JSON::Field(key: "typeCount")]
        getter type_count : Int32

        # A list of type values that are defined but never used in any rules, indicating potential cleanup
        # opportunities.

        @[JSON::Field(key: "unusedTypeValues")]
        getter unused_type_values : Array(Types::AutomatedReasoningPolicyDefinitionTypeValuePair)

        # A list of custom types that are defined but not referenced by any variables or rules, suggesting
        # they may be unnecessary.

        @[JSON::Field(key: "unusedTypes")]
        getter unused_types : Array(String)

        # A list of variables that are defined but not referenced by any rules, suggesting they may be
        # unnecessary.

        @[JSON::Field(key: "unusedVariables")]
        getter unused_variables : Array(String)

        # The total number of variables defined in the policy.

        @[JSON::Field(key: "variableCount")]
        getter variable_count : Int32

        def initialize(
          @conflicting_rules : Array(String),
          @disjoint_rule_sets : Array(Types::AutomatedReasoningPolicyDisjointRuleSet),
          @rule_count : Int32,
          @type_count : Int32,
          @unused_type_values : Array(Types::AutomatedReasoningPolicyDefinitionTypeValuePair),
          @unused_types : Array(String),
          @unused_variables : Array(String),
          @variable_count : Int32
        )
        end
      end

      # Represents a formal logic rule in an Automated Reasoning policy. For example, rules can be expressed
      # as if-then statements that define logical constraints.

      struct AutomatedReasoningPolicyDefinitionRule
        include JSON::Serializable

        # The formal logic expression of the rule.

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The unique identifier of the rule within the policy.

        @[JSON::Field(key: "id")]
        getter id : String

        # The human-readable form of the rule expression, often in natural language or simplified notation.

        @[JSON::Field(key: "alternateExpression")]
        getter alternate_expression : String?

        def initialize(
          @expression : String,
          @id : String,
          @alternate_expression : String? = nil
        )
        end
      end

      # Represents a custom user-defined viarble type in an Automated Reasoning policy. Types are enum-based
      # and provide additional context beyond predefined variable types.

      struct AutomatedReasoningPolicyDefinitionType
        include JSON::Serializable

        # The name of the custom type.

        @[JSON::Field(key: "name")]
        getter name : String

        # The possible values for this enum-based type, each with its own description.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::AutomatedReasoningPolicyDefinitionTypeValue)

        # The description of what the custom type represents.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @values : Array(Types::AutomatedReasoningPolicyDefinitionTypeValue),
          @description : String? = nil
        )
        end
      end

      # Represents a single value within a custom type definition, including its identifier and description.

      struct AutomatedReasoningPolicyDefinitionTypeValue
        include JSON::Serializable

        # The actual value or identifier for this type value.

        @[JSON::Field(key: "value")]
        getter value : String

        # A human-readable description explaining what this type value represents and when it should be used.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @value : String,
          @description : String? = nil
        )
        end
      end

      # Associates a type name with a specific value name, used for referencing type values in rules and
      # other policy elements.

      struct AutomatedReasoningPolicyDefinitionTypeValuePair
        include JSON::Serializable

        # The name of the custom type that contains the referenced value.

        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The name of the specific value within the type.

        @[JSON::Field(key: "valueName")]
        getter value_name : String

        def initialize(
          @type_name : String,
          @value_name : String
        )
        end
      end

      # Represents a variable in an Automated Reasoning policy. Variables represent concepts that can have
      # values assigned during natural language translation.

      struct AutomatedReasoningPolicyDefinitionVariable
        include JSON::Serializable

        # The description of the variable that explains what it represents and how users might refer to it.
        # Clear and comprehensive descriptions are essential for accurate natural language translation.

        @[JSON::Field(key: "description")]
        getter description : String

        # The name of the variable. Use descriptive names that clearly indicate the concept being represented.

        @[JSON::Field(key: "name")]
        getter name : String

        # The data type of the variable. Valid types include bool, int, real, enum, and custom types that you
        # can provide.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @description : String,
          @name : String,
          @type : String
        )
        end
      end

      # An annotation for removing a rule from an Automated Reasoning policy.

      struct AutomatedReasoningPolicyDeleteRuleAnnotation
        include JSON::Serializable

        # The unique identifier of the rule to delete from the policy.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String

        def initialize(
          @rule_id : String
        )
        end
      end

      # A mutation operation that removes a rule from the policy definition during the build process.

      struct AutomatedReasoningPolicyDeleteRuleMutation
        include JSON::Serializable

        # The unique identifier of the rule to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # An annotation for removing a custom type from an Automated Reasoning policy.

      struct AutomatedReasoningPolicyDeleteTypeAnnotation
        include JSON::Serializable

        # The name of the custom type to delete from the policy. The type must not be referenced by any
        # variables or rules.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # A mutation operation that removes a custom type from the policy definition during the build process.

      struct AutomatedReasoningPolicyDeleteTypeMutation
        include JSON::Serializable

        # The name of the custom type to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Represents a value to be removed from an existing custom type in the policy.

      struct AutomatedReasoningPolicyDeleteTypeValue
        include JSON::Serializable

        # The identifier or name of the value to remove from the type.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end

      # An annotation for removing a variable from an Automated Reasoning policy.

      struct AutomatedReasoningPolicyDeleteVariableAnnotation
        include JSON::Serializable

        # The name of the variable to delete from the policy. The variable must not be referenced by any
        # rules.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # A mutation operation that removes a variable from the policy definition during the build process.

      struct AutomatedReasoningPolicyDeleteVariableMutation
        include JSON::Serializable

        # The name of the variable to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Represents a set of rules that operate on completely separate variables, indicating they address
      # different concerns or domains within the policy.

      struct AutomatedReasoningPolicyDisjointRuleSet
        include JSON::Serializable

        # The list of rules that form this disjoint set, all operating on the same set of variables.

        @[JSON::Field(key: "rules")]
        getter rules : Array(String)

        # The set of variables that are used by the rules in this disjoint set.

        @[JSON::Field(key: "variables")]
        getter variables : Array(String)

        def initialize(
          @rules : Array(String),
          @variables : Array(String)
        )
        end
      end

      # Represents a generated test case, consisting of query content, guard content, and expected results.

      struct AutomatedReasoningPolicyGeneratedTestCase
        include JSON::Serializable

        # The expected results of the generated test case. Possible values include: VALID - The claims are
        # true. The claims are implied by the premises and the Automated Reasoning policy. Given the Automated
        # Reasoning policy and premises, it is not possible for these claims to be false. In other words,
        # there are no alternative answers that are true that contradict the claims. INVALID - The claims are
        # false. The claims are not implied by the premises and Automated Reasoning policy. Furthermore, there
        # exists different claims that are consistent with the premises and Automated Reasoning policy.
        # SATISFIABLE - The claims can be true or false. It depends on what assumptions are made for the claim
        # to be implied from the premises and Automated Reasoning policy rules. In this situation, different
        # assumptions can make input claims false and alternative claims true. IMPOSSIBLE - Automated
        # Reasoning can’t make a statement about the claims. This can happen if the premises are logically
        # incorrect, or if there is a conflict within the Automated Reasoning policy itself.

        @[JSON::Field(key: "expectedAggregatedFindingsResult")]
        getter expected_aggregated_findings_result : String

        # The output content that's validated by the Automated Reasoning policy. This represents the
        # foundation model response that will be checked for accuracy.

        @[JSON::Field(key: "guardContent")]
        getter guard_content : String

        # The input query or prompt that generated the content. This provides context for the validation.

        @[JSON::Field(key: "queryContent")]
        getter query_content : String

        def initialize(
          @expected_aggregated_findings_result : String,
          @guard_content : String,
          @query_content : String
        )
        end
      end

      # Contains a comprehensive test suite generated by the build workflow, providing validation
      # capabilities for automated reasoning policies.

      struct AutomatedReasoningPolicyGeneratedTestCases
        include JSON::Serializable

        # Represents a collection of generated test cases.

        @[JSON::Field(key: "generatedTestCases")]
        getter generated_test_cases : Array(Types::AutomatedReasoningPolicyGeneratedTestCase)

        def initialize(
          @generated_test_cases : Array(Types::AutomatedReasoningPolicyGeneratedTestCase)
        )
        end
      end

      # An annotation for processing and incorporating new content into an Automated Reasoning policy.

      struct AutomatedReasoningPolicyIngestContentAnnotation
        include JSON::Serializable

        # The new content to be analyzed and incorporated into the policy, such as additional documents or
        # rule descriptions.

        @[JSON::Field(key: "content")]
        getter content : String

        def initialize(
          @content : String
        )
        end
      end

      # A container for various mutation operations that can be applied to an Automated Reasoning policy,
      # including adding, updating, and deleting policy elements.

      struct AutomatedReasoningPolicyMutation
        include JSON::Serializable

        # A mutation to add a new rule to the policy.

        @[JSON::Field(key: "addRule")]
        getter add_rule : Types::AutomatedReasoningPolicyAddRuleMutation?

        # A mutation to add a new custom type to the policy.

        @[JSON::Field(key: "addType")]
        getter add_type : Types::AutomatedReasoningPolicyAddTypeMutation?

        # A mutation to add a new variable to the policy.

        @[JSON::Field(key: "addVariable")]
        getter add_variable : Types::AutomatedReasoningPolicyAddVariableMutation?

        # A mutation to remove a rule from the policy.

        @[JSON::Field(key: "deleteRule")]
        getter delete_rule : Types::AutomatedReasoningPolicyDeleteRuleMutation?

        # A mutation to remove a custom type from the policy.

        @[JSON::Field(key: "deleteType")]
        getter delete_type : Types::AutomatedReasoningPolicyDeleteTypeMutation?

        # A mutation to remove a variable from the policy.

        @[JSON::Field(key: "deleteVariable")]
        getter delete_variable : Types::AutomatedReasoningPolicyDeleteVariableMutation?

        # A mutation to modify an existing rule in the policy.

        @[JSON::Field(key: "updateRule")]
        getter update_rule : Types::AutomatedReasoningPolicyUpdateRuleMutation?

        # A mutation to modify an existing custom type in the policy.

        @[JSON::Field(key: "updateType")]
        getter update_type : Types::AutomatedReasoningPolicyUpdateTypeMutation?

        # A mutation to modify an existing variable in the policy.

        @[JSON::Field(key: "updateVariable")]
        getter update_variable : Types::AutomatedReasoningPolicyUpdateVariableMutation?

        def initialize(
          @add_rule : Types::AutomatedReasoningPolicyAddRuleMutation? = nil,
          @add_type : Types::AutomatedReasoningPolicyAddTypeMutation? = nil,
          @add_variable : Types::AutomatedReasoningPolicyAddVariableMutation? = nil,
          @delete_rule : Types::AutomatedReasoningPolicyDeleteRuleMutation? = nil,
          @delete_type : Types::AutomatedReasoningPolicyDeleteTypeMutation? = nil,
          @delete_variable : Types::AutomatedReasoningPolicyDeleteVariableMutation? = nil,
          @update_rule : Types::AutomatedReasoningPolicyUpdateRuleMutation? = nil,
          @update_type : Types::AutomatedReasoningPolicyUpdateTypeMutation? = nil,
          @update_variable : Types::AutomatedReasoningPolicyUpdateVariableMutation? = nil
        )
        end
      end

      # Represents the planning phase of policy build workflow, where the system analyzes source content and
      # determines what operations to perform.

      struct AutomatedReasoningPolicyPlanning
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a test scenario used to validate an Automated Reasoning policy, including the test
      # conditions and expected outcomes.

      struct AutomatedReasoningPolicyScenario
        include JSON::Serializable

        # An alternative way to express the same test scenario, used for validation and comparison purposes.

        @[JSON::Field(key: "alternateExpression")]
        getter alternate_expression : String

        # The expected outcome when this scenario is evaluated against the policy (e.g., PASS, FAIL,
        # VIOLATION).

        @[JSON::Field(key: "expectedResult")]
        getter expected_result : String

        # The logical expression or condition that defines this test scenario.

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The list of rule identifiers that are expected to be triggered or evaluated by this test scenario.

        @[JSON::Field(key: "ruleIds")]
        getter rule_ids : Array(String)

        def initialize(
          @alternate_expression : String,
          @expected_result : String,
          @expression : String,
          @rule_ids : Array(String)
        )
        end
      end

      # Contains a comprehensive entity encompassing all the scenarios generated by the build workflow,
      # which can be used to validate an Automated Reasoning policy.

      struct AutomatedReasoningPolicyScenarios
        include JSON::Serializable

        # Represents a collection of generated policy scenarios.

        @[JSON::Field(key: "policyScenarios")]
        getter policy_scenarios : Array(Types::AutomatedReasoningPolicyScenario)

        def initialize(
          @policy_scenarios : Array(Types::AutomatedReasoningPolicyScenario)
        )
        end
      end

      # Contains summary information about an Automated Reasoning policy, including metadata and timestamps.

      struct AutomatedReasoningPolicySummary
        include JSON::Serializable

        # The timestamp when the policy was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The unique identifier of the policy.

        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The timestamp when the policy was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the policy.

        @[JSON::Field(key: "version")]
        getter version : String

        # The description of the policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_arn : String,
          @policy_id : String,
          @updated_at : Time,
          @version : String,
          @description : String? = nil
        )
        end
      end

      # Represents a test for validating an Automated Reasoning policy. tests contain sample inputs and
      # expected outcomes to verify policy behavior.

      struct AutomatedReasoningPolicyTestCase
        include JSON::Serializable

        # The timestamp when the test was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The output content to be validated by the policy, typically representing a foundation model
        # response.

        @[JSON::Field(key: "guardContent")]
        getter guard_content : String

        # The unique identifier of the test.

        @[JSON::Field(key: "testCaseId")]
        getter test_case_id : String

        # The timestamp when the test was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The minimum confidence level for logic validation. Content meeting this threshold is considered
        # high-confidence and can be validated.

        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : Float64?

        # The expected result of the Automated Reasoning check for this test.

        @[JSON::Field(key: "expectedAggregatedFindingsResult")]
        getter expected_aggregated_findings_result : String?

        # The input query or prompt that generated the content. This provides context for the validation.

        @[JSON::Field(key: "queryContent")]
        getter query_content : String?

        def initialize(
          @created_at : Time,
          @guard_content : String,
          @test_case_id : String,
          @updated_at : Time,
          @confidence_threshold : Float64? = nil,
          @expected_aggregated_findings_result : String? = nil,
          @query_content : String? = nil
        )
        end
      end

      # Contains the results of testing an Automated Reasoning policy against various scenarios and
      # validation checks.

      struct AutomatedReasoningPolicyTestResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy that was tested.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The test case that was executed, including the input content, expected results, and configuration
        # parameters used during validation.

        @[JSON::Field(key: "testCase")]
        getter test_case : Types::AutomatedReasoningPolicyTestCase

        # The overall status of the test run (e.g., COMPLETED, FAILED, IN_PROGRESS).

        @[JSON::Field(key: "testRunStatus")]
        getter test_run_status : String

        # The timestamp when the test results were last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A summary of all test findings, aggregated to provide an overall assessment of policy quality and
        # correctness.

        @[JSON::Field(key: "aggregatedTestFindingsResult")]
        getter aggregated_test_findings_result : String?

        # Detailed findings from the test run, including any issues, violations, or unexpected behaviors
        # discovered.

        @[JSON::Field(key: "testFindings")]
        getter test_findings : Array(Types::AutomatedReasoningCheckFinding)?

        # The overall result of the test run, indicating whether the policy passed or failed validation.

        @[JSON::Field(key: "testRunResult")]
        getter test_run_result : String?

        def initialize(
          @policy_arn : String,
          @test_case : Types::AutomatedReasoningPolicyTestCase,
          @test_run_status : String,
          @updated_at : Time,
          @aggregated_test_findings_result : String? = nil,
          @test_findings : Array(Types::AutomatedReasoningCheckFinding)? = nil,
          @test_run_result : String? = nil
        )
        end
      end

      # An annotation for managing values within custom types, including adding, updating, or removing
      # specific type values.

      struct AutomatedReasoningPolicyTypeValueAnnotation
        include JSON::Serializable

        # An operation to add a new value to an existing custom type.

        @[JSON::Field(key: "addTypeValue")]
        getter add_type_value : Types::AutomatedReasoningPolicyAddTypeValue?

        # An operation to remove a value from an existing custom type.

        @[JSON::Field(key: "deleteTypeValue")]
        getter delete_type_value : Types::AutomatedReasoningPolicyDeleteTypeValue?

        # An operation to modify an existing value within a custom type.

        @[JSON::Field(key: "updateTypeValue")]
        getter update_type_value : Types::AutomatedReasoningPolicyUpdateTypeValue?

        def initialize(
          @add_type_value : Types::AutomatedReasoningPolicyAddTypeValue? = nil,
          @delete_type_value : Types::AutomatedReasoningPolicyDeleteTypeValue? = nil,
          @update_type_value : Types::AutomatedReasoningPolicyUpdateTypeValue? = nil
        )
        end
      end

      # An annotation for updating the policy based on feedback about how specific rules performed during
      # testing or real-world usage.

      struct AutomatedReasoningPolicyUpdateFromRuleFeedbackAnnotation
        include JSON::Serializable

        # The feedback information about rule performance, including suggestions for improvements or
        # corrections.

        @[JSON::Field(key: "feedback")]
        getter feedback : String

        # The list of rule identifiers that the feedback applies to.

        @[JSON::Field(key: "ruleIds")]
        getter rule_ids : Array(String)?

        def initialize(
          @feedback : String,
          @rule_ids : Array(String)? = nil
        )
        end
      end

      # An annotation for updating the policy based on feedback about how it performed on specific test
      # scenarios.

      struct AutomatedReasoningPolicyUpdateFromScenarioFeedbackAnnotation
        include JSON::Serializable

        # The logical expression that defines the test scenario that generated this feedback.

        @[JSON::Field(key: "scenarioExpression")]
        getter scenario_expression : String

        # The feedback information about scenario performance, including any issues or improvements
        # identified.

        @[JSON::Field(key: "feedback")]
        getter feedback : String?

        # The list of rule identifiers that were involved in the scenario being evaluated.

        @[JSON::Field(key: "ruleIds")]
        getter rule_ids : Array(String)?

        def initialize(
          @scenario_expression : String,
          @feedback : String? = nil,
          @rule_ids : Array(String)? = nil
        )
        end
      end

      # An annotation for modifying an existing rule in an Automated Reasoning policy.

      struct AutomatedReasoningPolicyUpdateRuleAnnotation
        include JSON::Serializable

        # The new formal logical expression for the rule, replacing the previous expression.

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The unique identifier of the rule to update.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String

        def initialize(
          @expression : String,
          @rule_id : String
        )
        end
      end

      # A mutation operation that modifies an existing rule in the policy definition during the build
      # process.

      struct AutomatedReasoningPolicyUpdateRuleMutation
        include JSON::Serializable

        # The updated rule definition containing the modified formal logical expression and any changed
        # metadata for the existing rule.

        @[JSON::Field(key: "rule")]
        getter rule : Types::AutomatedReasoningPolicyDefinitionRule

        def initialize(
          @rule : Types::AutomatedReasoningPolicyDefinitionRule
        )
        end
      end

      # An annotation for modifying an existing custom type in an Automated Reasoning policy.

      struct AutomatedReasoningPolicyUpdateTypeAnnotation
        include JSON::Serializable

        # The current name of the custom type to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The updated list of values for the custom type, which can include additions, modifications, or
        # removals.

        @[JSON::Field(key: "values")]
        getter values : Array(Types::AutomatedReasoningPolicyTypeValueAnnotation)

        # The new description for the custom type, replacing the previous description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The new name for the custom type, if you want to rename it. If not provided, the name remains
        # unchanged.

        @[JSON::Field(key: "newName")]
        getter new_name : String?

        def initialize(
          @name : String,
          @values : Array(Types::AutomatedReasoningPolicyTypeValueAnnotation),
          @description : String? = nil,
          @new_name : String? = nil
        )
        end
      end

      # A mutation operation that modifies an existing custom type in the policy definition during the build
      # process.

      struct AutomatedReasoningPolicyUpdateTypeMutation
        include JSON::Serializable

        # The updated type definition containing the modified name, description, or values for the existing
        # custom type.

        @[JSON::Field(key: "type")]
        getter type : Types::AutomatedReasoningPolicyDefinitionType

        def initialize(
          @type : Types::AutomatedReasoningPolicyDefinitionType
        )
        end
      end

      # Represents a modification to a value within an existing custom type.

      struct AutomatedReasoningPolicyUpdateTypeValue
        include JSON::Serializable

        # The current identifier or name of the type value to update.

        @[JSON::Field(key: "value")]
        getter value : String

        # The new description for the type value, replacing the previous description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The new identifier or name for the type value, if you want to rename it.

        @[JSON::Field(key: "newValue")]
        getter new_value : String?

        def initialize(
          @value : String,
          @description : String? = nil,
          @new_value : String? = nil
        )
        end
      end

      # An annotation for modifying an existing variable in an Automated Reasoning policy.

      struct AutomatedReasoningPolicyUpdateVariableAnnotation
        include JSON::Serializable

        # The current name of the variable to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The new description for the variable, replacing the previous description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The new name for the variable, if you want to rename it. If not provided, the name remains
        # unchanged.

        @[JSON::Field(key: "newName")]
        getter new_name : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @new_name : String? = nil
        )
        end
      end

      # A mutation operation that modifies an existing variable in the policy definition during the build
      # process.

      struct AutomatedReasoningPolicyUpdateVariableMutation
        include JSON::Serializable

        # The updated variable definition containing the modified name, type, or description for the existing
        # variable.

        @[JSON::Field(key: "variable")]
        getter variable : Types::AutomatedReasoningPolicyDefinitionVariable

        def initialize(
          @variable : Types::AutomatedReasoningPolicyDefinitionVariable
        )
        end
      end

      # Defines the content and configuration for different types of policy build workflows.

      struct AutomatedReasoningPolicyWorkflowTypeContent
        include JSON::Serializable

        # The list of documents to be processed in a document ingestion workflow.

        @[JSON::Field(key: "documents")]
        getter documents : Array(Types::AutomatedReasoningPolicyBuildWorkflowDocument)?

        # The assets and instructions needed for a policy repair workflow, including repair annotations and
        # guidance.

        @[JSON::Field(key: "policyRepairAssets")]
        getter policy_repair_assets : Types::AutomatedReasoningPolicyBuildWorkflowRepairContent?

        def initialize(
          @documents : Array(Types::AutomatedReasoningPolicyBuildWorkflowDocument)? = nil,
          @policy_repair_assets : Types::AutomatedReasoningPolicyBuildWorkflowRepairContent? = nil
        )
        end
      end

      # A JSON array that provides the status of the evaluation jobs being deleted.

      struct BatchDeleteEvaluationJobError
        include JSON::Serializable

        # A HTTP status code of the evaluation job being deleted.

        @[JSON::Field(key: "code")]
        getter code : String

        # The ARN of the evaluation job being deleted.

        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        # A status message about the evaluation job deletion.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String,
          @job_identifier : String,
          @message : String? = nil
        )
        end
      end

      # An evaluation job for deletion, and it’s current status.

      struct BatchDeleteEvaluationJobItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the evaluation job for deletion.

        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        # The status of the evaluation job for deletion.

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        def initialize(
          @job_identifier : String,
          @job_status : String
        )
        end
      end


      struct BatchDeleteEvaluationJobRequest
        include JSON::Serializable

        # A list of one or more evaluation job Amazon Resource Names (ARNs) you want to delete.

        @[JSON::Field(key: "jobIdentifiers")]
        getter job_identifiers : Array(String)

        def initialize(
          @job_identifiers : Array(String)
        )
        end
      end


      struct BatchDeleteEvaluationJobResponse
        include JSON::Serializable

        # A JSON object containing the HTTP status codes and the ARNs of evaluation jobs that failed to be
        # deleted.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDeleteEvaluationJobError)

        # The list of evaluation jobs for deletion.

        @[JSON::Field(key: "evaluationJobs")]
        getter evaluation_jobs : Array(Types::BatchDeleteEvaluationJobItem)

        def initialize(
          @errors : Array(Types::BatchDeleteEvaluationJobError),
          @evaluation_jobs : Array(Types::BatchDeleteEvaluationJobItem)
        )
        end
      end

      # The evaluator model used in knowledge base evaluation job or in model evaluation job that use a
      # model as judge. This model computes all evaluation related metrics.

      struct BedrockEvaluatorModel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the evaluator model used used in knowledge base evaluation job or
        # in model evaluation job that use a model as judge.

        @[JSON::Field(key: "modelIdentifier")]
        getter model_identifier : String

        def initialize(
          @model_identifier : String
        )
        end
      end

      # Contains the document contained in the wrapper object, along with its attributes/fields.

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


      struct CancelAutomatedReasoningPolicyBuildWorkflowRequest
        include JSON::Serializable

        # The unique identifier of the build workflow to cancel. You can get this ID from the
        # StartAutomatedReasoningPolicyBuildWorkflow response or by listing build workflows.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy whose build workflow you want to
        # cancel.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @build_workflow_id : String,
          @policy_arn : String
        )
        end
      end


      struct CancelAutomatedReasoningPolicyBuildWorkflowResponse
        include JSON::Serializable

        def initialize
        end
      end

      # CloudWatch logging configuration.

      struct CloudWatchConfig
        include JSON::Serializable

        # The log group name.

        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String

        # The role Amazon Resource Name (ARN).

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # S3 configuration for delivering a large amount of data.

        @[JSON::Field(key: "largeDataDeliveryS3Config")]
        getter large_data_delivery_s3_config : Types::S3Config?

        def initialize(
          @log_group_name : String,
          @role_arn : String,
          @large_data_delivery_s3_config : Types::S3Config? = nil
        )
        end
      end

      # Error occurred because of a conflict while performing an operation.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateAutomatedReasoningPolicyRequest
        include JSON::Serializable

        # A unique name for the Automated Reasoning policy. The name must be between 1 and 63 characters and
        # can contain letters, numbers, hyphens, and underscores.

        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier to ensure that the operation completes no more than once. If
        # this token matches a previous request, Amazon Bedrock ignores the request but doesn't return an
        # error.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # A description of the Automated Reasoning policy. Use this to provide context about the policy's
        # purpose and the types of validations it performs.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the KMS key to use for encrypting the automated reasoning policy and its
        # associated artifacts. If you don't specify a KMS key, Amazon Bedrock uses an KMS managed key for
        # encryption. For enhanced security and control, you can specify a customer managed KMS key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The policy definition that contains the formal logic rules, variables, and custom variable types
        # used to validate foundation model responses in your application.

        @[JSON::Field(key: "policyDefinition")]
        getter policy_definition : Types::AutomatedReasoningPolicyDefinition?

        # A list of tags to associate with the Automated Reasoning policy. Tags help you organize and manage
        # your policies.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @policy_definition : Types::AutomatedReasoningPolicyDefinition? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAutomatedReasoningPolicyResponse
        include JSON::Serializable

        # The timestamp when the policy was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the Automated Reasoning policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy that you created.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The timestamp when the policy was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version number of the newly created Automated Reasoning policy. The initial version is always
        # DRAFT.

        @[JSON::Field(key: "version")]
        getter version : String

        # The hash of the policy definition. This is used as a concurrency token for creating policy versions
        # that you can use in your application.

        @[JSON::Field(key: "definitionHash")]
        getter definition_hash : String?

        # The description of the Automated Reasoning policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @name : String,
          @policy_arn : String,
          @updated_at : Time,
          @version : String,
          @definition_hash : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateAutomatedReasoningPolicyTestCaseRequest
        include JSON::Serializable

        # The expected result of the Automated Reasoning check. Valid values include: , TOO_COMPLEX, and
        # NO_TRANSLATIONS. VALID - The claims are true. The claims are implied by the premises and the
        # Automated Reasoning policy. Given the Automated Reasoning policy and premises, it is not possible
        # for these claims to be false. In other words, there are no alternative answers that are true that
        # contradict the claims. INVALID - The claims are false. The claims are not implied by the premises
        # and Automated Reasoning policy. Furthermore, there exists different claims that are consistent with
        # the premises and Automated Reasoning policy. SATISFIABLE - The claims can be true or false. It
        # depends on what assumptions are made for the claim to be implied from the premises and Automated
        # Reasoning policy rules. In this situation, different assumptions can make input claims false and
        # alternative claims true. IMPOSSIBLE - Automated Reasoning can’t make a statement about the claims.
        # This can happen if the premises are logically incorrect, or if there is a conflict within the
        # Automated Reasoning policy itself. TRANSLATION_AMBIGUOUS - Detected an ambiguity in the translation
        # meant it would be unsound to continue with validity checking. Additional context or follow-up
        # questions might be needed to get translation to succeed. TOO_COMPLEX - The input contains too much
        # information for Automated Reasoning to process within its latency limits. NO_TRANSLATIONS -
        # Identifies that some or all of the input prompt wasn't translated into logic. This can happen if the
        # input isn't relevant to the Automated Reasoning policy, or if the policy doesn't have variables to
        # model relevant input. If Automated Reasoning can't translate anything, you get a single
        # NO_TRANSLATIONS finding. You might also see a NO_TRANSLATIONS (along with other findings) if some
        # part of the validation isn't translated.

        @[JSON::Field(key: "expectedAggregatedFindingsResult")]
        getter expected_aggregated_findings_result : String

        # The output content that's validated by the Automated Reasoning policy. This represents the
        # foundation model response that will be checked for accuracy.

        @[JSON::Field(key: "guardContent")]
        getter guard_content : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy for which to create the test.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The minimum confidence level for logic validation. Content that meets the threshold is considered a
        # high-confidence finding that can be validated.

        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : Float64?

        # The input query or prompt that generated the content. This provides context for the validation.

        @[JSON::Field(key: "queryContent")]
        getter query_content : String?

        def initialize(
          @expected_aggregated_findings_result : String,
          @guard_content : String,
          @policy_arn : String,
          @client_request_token : String? = nil,
          @confidence_threshold : Float64? = nil,
          @query_content : String? = nil
        )
        end
      end


      struct CreateAutomatedReasoningPolicyTestCaseResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the policy for which the test was created.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The unique identifier of the created test.

        @[JSON::Field(key: "testCaseId")]
        getter test_case_id : String

        def initialize(
          @policy_arn : String,
          @test_case_id : String
        )
        end
      end


      struct CreateAutomatedReasoningPolicyVersionRequest
        include JSON::Serializable

        # The hash of the current policy definition used as a concurrency token to ensure the policy hasn't
        # been modified since you last retrieved it.

        @[JSON::Field(key: "lastUpdatedDefinitionHash")]
        getter last_updated_definition_hash : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy for which to create a version.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # A list of tags to associate with the policy version.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @last_updated_definition_hash : String,
          @policy_arn : String,
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAutomatedReasoningPolicyVersionResponse
        include JSON::Serializable

        # The timestamp when the policy version was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The hash of the policy definition for this version.

        @[JSON::Field(key: "definitionHash")]
        getter definition_hash : String

        # The name of the policy version.

        @[JSON::Field(key: "name")]
        getter name : String

        # The versioned Amazon Resource Name (ARN) of the policy version.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The version number of the policy version.

        @[JSON::Field(key: "version")]
        getter version : String

        # The description of the policy version.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @created_at : Time,
          @definition_hash : String,
          @name : String,
          @policy_arn : String,
          @version : String,
          @description : String? = nil
        )
        end
      end


      struct CreateCustomModelDeploymentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom model to deploy for on-demand inference. The custom
        # model must be in the Active state.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The name for the custom model deployment. The name must be unique within your Amazon Web Services
        # account and Region.

        @[JSON::Field(key: "modelDeploymentName")]
        getter model_deployment_name : String

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # A description for the custom model deployment to help you identify its purpose.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Tags to assign to the custom model deployment. You can use tags to organize and track your Amazon
        # Web Services resources for cost allocation and management purposes.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @model_arn : String,
          @model_deployment_name : String,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCustomModelDeploymentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom model deployment. Use this ARN as the modelId parameter
        # when invoking the model with the InvokeModel or Converse operations.

        @[JSON::Field(key: "customModelDeploymentArn")]
        getter custom_model_deployment_arn : String

        def initialize(
          @custom_model_deployment_arn : String
        )
        end
      end


      struct CreateCustomModelRequest
        include JSON::Serializable

        # A unique name for the custom model.

        @[JSON::Field(key: "modelName")]
        getter model_name : String

        # The data source for the model. The Amazon S3 URI in the model source must be for the Amazon-managed
        # Amazon S3 bucket containing your model artifacts.

        @[JSON::Field(key: "modelSourceConfig")]
        getter model_source_config : Types::ModelDataSource

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The Amazon Resource Name (ARN) of the customer managed KMS key to encrypt the custom model. If you
        # don't provide a KMS key, Amazon Bedrock uses an Amazon Web Services-managed KMS key to encrypt the
        # model. If you provide a customer managed KMS key, your Amazon Bedrock service role must have
        # permissions to use it. For more information see Encryption of imported models .

        @[JSON::Field(key: "modelKmsKeyArn")]
        getter model_kms_key_arn : String?

        # A list of key-value pairs to associate with the custom model resource. You can use these tags to
        # organize and identify your resources. For more information, see Tagging resources in the Amazon
        # Bedrock User Guide .

        @[JSON::Field(key: "modelTags")]
        getter model_tags : Array(Types::Tag)?

        # The Amazon Resource Name (ARN) of an IAM service role that Amazon Bedrock assumes to perform tasks
        # on your behalf. This role must have permissions to access the Amazon S3 bucket containing your model
        # artifacts and the KMS key (if specified). For more information, see Setting up an IAM service role
        # for importing models in the Amazon Bedrock User Guide.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @model_name : String,
          @model_source_config : Types::ModelDataSource,
          @client_request_token : String? = nil,
          @model_kms_key_arn : String? = nil,
          @model_tags : Array(Types::Tag)? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct CreateCustomModelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new custom model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        def initialize(
          @model_arn : String
        )
        end
      end


      struct CreateEvaluationJobRequest
        include JSON::Serializable

        # Contains the configuration details of either an automated or human-based evaluation job.

        @[JSON::Field(key: "evaluationConfig")]
        getter evaluation_config : Types::EvaluationConfig

        # Contains the configuration details of the inference model for the evaluation job. For model
        # evaluation jobs, automated jobs support a single model or inference profile , and jobs that use
        # human workers support two models or inference profiles.

        @[JSON::Field(key: "inferenceConfig")]
        getter inference_config : Types::EvaluationInferenceConfig

        # A name for the evaluation job. Names must unique with your Amazon Web Services account, and your
        # account's Amazon Web Services region.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # Contains the configuration details of the Amazon S3 bucket for storing the results of the evaluation
        # job.

        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::EvaluationOutputDataConfig

        # The Amazon Resource Name (ARN) of an IAM service role that Amazon Bedrock can assume to perform
        # tasks on your behalf. To learn more about the required permissions, see Required permissions for
        # model evaluations .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Specifies whether the evaluation job is for evaluating a model or evaluating a knowledge base
        # (retrieval and response generation).

        @[JSON::Field(key: "applicationType")]
        getter application_type : String?

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Specify your customer managed encryption key Amazon Resource Name (ARN) that will be used to encrypt
        # your evaluation job.

        @[JSON::Field(key: "customerEncryptionKeyId")]
        getter customer_encryption_key_id : String?

        # A description of the evaluation job.

        @[JSON::Field(key: "jobDescription")]
        getter job_description : String?

        # Tags to attach to the model evaluation job.

        @[JSON::Field(key: "jobTags")]
        getter job_tags : Array(Types::Tag)?

        def initialize(
          @evaluation_config : Types::EvaluationConfig,
          @inference_config : Types::EvaluationInferenceConfig,
          @job_name : String,
          @output_data_config : Types::EvaluationOutputDataConfig,
          @role_arn : String,
          @application_type : String? = nil,
          @client_request_token : String? = nil,
          @customer_encryption_key_id : String? = nil,
          @job_description : String? = nil,
          @job_tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateEvaluationJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the evaluation job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        def initialize(
          @job_arn : String
        )
        end
      end


      struct CreateFoundationModelAgreementRequest
        include JSON::Serializable

        # Model Id of the model for the access request.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # An offer token encapsulates the information for an offer.

        @[JSON::Field(key: "offerToken")]
        getter offer_token : String

        def initialize(
          @model_id : String,
          @offer_token : String
        )
        end
      end


      struct CreateFoundationModelAgreementResponse
        include JSON::Serializable

        # Model Id of the model for the access request.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @model_id : String
        )
        end
      end


      struct CreateGuardrailRequest
        include JSON::Serializable

        # The message to return when the guardrail blocks a prompt.

        @[JSON::Field(key: "blockedInputMessaging")]
        getter blocked_input_messaging : String

        # The message to return when the guardrail blocks a model response.

        @[JSON::Field(key: "blockedOutputsMessaging")]
        getter blocked_outputs_messaging : String

        # The name to give the guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # Optional configuration for integrating Automated Reasoning policies with the new guardrail.

        @[JSON::Field(key: "automatedReasoningPolicyConfig")]
        getter automated_reasoning_policy_config : Types::GuardrailAutomatedReasoningPolicyConfig?

        # A unique, case-sensitive identifier to ensure that the API request completes no more than once. If
        # this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency in the Amazon S3 User Guide .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The content filter policies to configure for the guardrail.

        @[JSON::Field(key: "contentPolicyConfig")]
        getter content_policy_config : Types::GuardrailContentPolicyConfig?

        # The contextual grounding policy configuration used to create a guardrail.

        @[JSON::Field(key: "contextualGroundingPolicyConfig")]
        getter contextual_grounding_policy_config : Types::GuardrailContextualGroundingPolicyConfig?

        # The system-defined guardrail profile that you're using with your guardrail. Guardrail profiles
        # define the destination Amazon Web Services Regions where guardrail inference requests can be
        # automatically routed. For more information, see the Amazon Bedrock User Guide .

        @[JSON::Field(key: "crossRegionConfig")]
        getter cross_region_config : Types::GuardrailCrossRegionConfig?

        # A description of the guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the KMS key that you use to encrypt the guardrail.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The sensitive information policy to configure for the guardrail.

        @[JSON::Field(key: "sensitiveInformationPolicyConfig")]
        getter sensitive_information_policy_config : Types::GuardrailSensitiveInformationPolicyConfig?

        # The tags that you want to attach to the guardrail.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The topic policies to configure for the guardrail.

        @[JSON::Field(key: "topicPolicyConfig")]
        getter topic_policy_config : Types::GuardrailTopicPolicyConfig?

        # The word policy you configure for the guardrail.

        @[JSON::Field(key: "wordPolicyConfig")]
        getter word_policy_config : Types::GuardrailWordPolicyConfig?

        def initialize(
          @blocked_input_messaging : String,
          @blocked_outputs_messaging : String,
          @name : String,
          @automated_reasoning_policy_config : Types::GuardrailAutomatedReasoningPolicyConfig? = nil,
          @client_request_token : String? = nil,
          @content_policy_config : Types::GuardrailContentPolicyConfig? = nil,
          @contextual_grounding_policy_config : Types::GuardrailContextualGroundingPolicyConfig? = nil,
          @cross_region_config : Types::GuardrailCrossRegionConfig? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @sensitive_information_policy_config : Types::GuardrailSensitiveInformationPolicyConfig? = nil,
          @tags : Array(Types::Tag)? = nil,
          @topic_policy_config : Types::GuardrailTopicPolicyConfig? = nil,
          @word_policy_config : Types::GuardrailWordPolicyConfig? = nil
        )
        end
      end


      struct CreateGuardrailResponse
        include JSON::Serializable

        # The time at which the guardrail was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ARN of the guardrail.

        @[JSON::Field(key: "guardrailArn")]
        getter guardrail_arn : String

        # The unique identifier of the guardrail that was created.

        @[JSON::Field(key: "guardrailId")]
        getter guardrail_id : String

        # The version of the guardrail that was created. This value will always be DRAFT .

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @created_at : Time,
          @guardrail_arn : String,
          @guardrail_id : String,
          @version : String
        )
        end
      end


      struct CreateGuardrailVersionRequest
        include JSON::Serializable

        # The unique identifier of the guardrail. This can be an ID or the ARN.

        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than once. If
        # this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency in the Amazon S3 User Guide .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # A description of the guardrail version.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @guardrail_identifier : String,
          @client_request_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateGuardrailVersionResponse
        include JSON::Serializable

        # The unique identifier of the guardrail.

        @[JSON::Field(key: "guardrailId")]
        getter guardrail_id : String

        # The number of the version of the guardrail.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @guardrail_id : String,
          @version : String
        )
        end
      end


      struct CreateInferenceProfileRequest
        include JSON::Serializable

        # A name for the inference profile.

        @[JSON::Field(key: "inferenceProfileName")]
        getter inference_profile_name : String

        # The foundation model or system-defined inference profile that the inference profile will track
        # metrics and costs for.

        @[JSON::Field(key: "modelSource")]
        getter model_source : Types::InferenceProfileModelSource

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # A description for the inference profile.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An array of objects, each of which contains a tag and its value. For more information, see Tagging
        # resources in the Amazon Bedrock User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @inference_profile_name : String,
          @model_source : Types::InferenceProfileModelSource,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateInferenceProfileResponse
        include JSON::Serializable

        # The ARN of the inference profile that you created.

        @[JSON::Field(key: "inferenceProfileArn")]
        getter inference_profile_arn : String

        # The status of the inference profile. ACTIVE means that the inference profile is ready to be used.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @inference_profile_arn : String,
          @status : String? = nil
        )
        end
      end


      struct CreateMarketplaceModelEndpointRequest
        include JSON::Serializable

        # The configuration for the endpoint, including the number and type of instances to use.

        @[JSON::Field(key: "endpointConfig")]
        getter endpoint_config : Types::EndpointConfig

        # The name of the endpoint. This name must be unique within your Amazon Web Services account and
        # region.

        @[JSON::Field(key: "endpointName")]
        getter endpoint_name : String

        # The ARN of the model from Amazon Bedrock Marketplace that you want to deploy to the endpoint.

        @[JSON::Field(key: "modelSourceIdentifier")]
        getter model_source_identifier : String

        # Indicates whether you accept the end-user license agreement (EULA) for the model. Set to true to
        # accept the EULA.

        @[JSON::Field(key: "acceptEula")]
        getter accept_eula : Bool?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. This
        # token is listed as not required because Amazon Web Services SDKs automatically generate it for you
        # and set this parameter. If you're not using the Amazon Web Services SDK or the CLI, you must provide
        # this token or the action will fail.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # An array of key-value pairs to apply to the underlying Amazon SageMaker endpoint. You can use these
        # tags to organize and identify your Amazon Web Services resources.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @endpoint_config : Types::EndpointConfig,
          @endpoint_name : String,
          @model_source_identifier : String,
          @accept_eula : Bool? = nil,
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateMarketplaceModelEndpointResponse
        include JSON::Serializable

        # Details about the created endpoint.

        @[JSON::Field(key: "marketplaceModelEndpoint")]
        getter marketplace_model_endpoint : Types::MarketplaceModelEndpoint

        def initialize(
          @marketplace_model_endpoint : Types::MarketplaceModelEndpoint
        )
        end
      end


      struct CreateModelCopyJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the model to be copied.

        @[JSON::Field(key: "sourceModelArn")]
        getter source_model_arn : String

        # A name for the copied model.

        @[JSON::Field(key: "targetModelName")]
        getter target_model_name : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The ARN of the KMS key that you use to encrypt the model copy.

        @[JSON::Field(key: "modelKmsKeyId")]
        getter model_kms_key_id : String?

        # Tags to associate with the target model. For more information, see Tag resources in the Amazon
        # Bedrock User Guide .

        @[JSON::Field(key: "targetModelTags")]
        getter target_model_tags : Array(Types::Tag)?

        def initialize(
          @source_model_arn : String,
          @target_model_name : String,
          @client_request_token : String? = nil,
          @model_kms_key_id : String? = nil,
          @target_model_tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateModelCopyJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the model copy job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        def initialize(
          @job_arn : String
        )
        end
      end


      struct CreateModelCustomizationJobRequest
        include JSON::Serializable

        # Name of the base model.

        @[JSON::Field(key: "baseModelIdentifier")]
        getter base_model_identifier : String

        # A name for the resulting custom model.

        @[JSON::Field(key: "customModelName")]
        getter custom_model_name : String

        # A name for the fine-tuning job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # S3 location for the output data.

        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # The Amazon Resource Name (ARN) of an IAM service role that Amazon Bedrock can assume to perform
        # tasks on your behalf. For example, during model training, Amazon Bedrock needs your permission to
        # read input data from an S3 bucket, write model artifacts to an S3 bucket. To pass this role to
        # Amazon Bedrock, the caller of this API must have the iam:PassRole permission.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Information about the training dataset.

        @[JSON::Field(key: "trainingDataConfig")]
        getter training_data_config : Types::TrainingDataConfig

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The custom model is encrypted at rest using this key.

        @[JSON::Field(key: "customModelKmsKeyId")]
        getter custom_model_kms_key_id : String?

        # Tags to attach to the resulting custom model.

        @[JSON::Field(key: "customModelTags")]
        getter custom_model_tags : Array(Types::Tag)?

        # The customization configuration for the model customization job.

        @[JSON::Field(key: "customizationConfig")]
        getter customization_config : Types::CustomizationConfig?

        # The customization type.

        @[JSON::Field(key: "customizationType")]
        getter customization_type : String?

        # Parameters related to tuning the model. For details on the format for different models, see Custom
        # model hyperparameters .

        @[JSON::Field(key: "hyperParameters")]
        getter hyper_parameters : Hash(String, String)?

        # Tags to attach to the job.

        @[JSON::Field(key: "jobTags")]
        getter job_tags : Array(Types::Tag)?

        # Information about the validation dataset.

        @[JSON::Field(key: "validationDataConfig")]
        getter validation_data_config : Types::ValidationDataConfig?

        # The configuration of the Virtual Private Cloud (VPC) that contains the resources that you're using
        # for this job. For more information, see Protect your model customization jobs using a VPC .

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @base_model_identifier : String,
          @custom_model_name : String,
          @job_name : String,
          @output_data_config : Types::OutputDataConfig,
          @role_arn : String,
          @training_data_config : Types::TrainingDataConfig,
          @client_request_token : String? = nil,
          @custom_model_kms_key_id : String? = nil,
          @custom_model_tags : Array(Types::Tag)? = nil,
          @customization_config : Types::CustomizationConfig? = nil,
          @customization_type : String? = nil,
          @hyper_parameters : Hash(String, String)? = nil,
          @job_tags : Array(Types::Tag)? = nil,
          @validation_data_config : Types::ValidationDataConfig? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct CreateModelCustomizationJobResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the fine tuning job

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        def initialize(
          @job_arn : String
        )
        end
      end


      struct CreateModelImportJobRequest
        include JSON::Serializable

        # The name of the imported model.

        @[JSON::Field(key: "importedModelName")]
        getter imported_model_name : String

        # The name of the import job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The data source for the imported model.

        @[JSON::Field(key: "modelDataSource")]
        getter model_data_source : Types::ModelDataSource

        # The Amazon Resource Name (ARN) of the model import job.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The imported model is encrypted at rest using this key.

        @[JSON::Field(key: "importedModelKmsKeyId")]
        getter imported_model_kms_key_id : String?

        # Tags to attach to the imported model.

        @[JSON::Field(key: "importedModelTags")]
        getter imported_model_tags : Array(Types::Tag)?

        # Tags to attach to this import job.

        @[JSON::Field(key: "jobTags")]
        getter job_tags : Array(Types::Tag)?

        # VPC configuration parameters for the private Virtual Private Cloud (VPC) that contains the resources
        # you are using for the import job.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @imported_model_name : String,
          @job_name : String,
          @model_data_source : Types::ModelDataSource,
          @role_arn : String,
          @client_request_token : String? = nil,
          @imported_model_kms_key_id : String? = nil,
          @imported_model_tags : Array(Types::Tag)? = nil,
          @job_tags : Array(Types::Tag)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct CreateModelImportJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the model import job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        def initialize(
          @job_arn : String
        )
        end
      end


      struct CreateModelInvocationJobRequest
        include JSON::Serializable

        # Details about the location of the input to the batch inference job.

        @[JSON::Field(key: "inputDataConfig")]
        getter input_data_config : Types::ModelInvocationJobInputDataConfig

        # A name to give the batch inference job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The unique identifier of the foundation model to use for the batch inference job.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Details about the location of the output of the batch inference job.

        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::ModelInvocationJobOutputDataConfig

        # The Amazon Resource Name (ARN) of the service role with permissions to carry out and manage batch
        # inference. You can use the console to create a default service role or follow the steps at Create a
        # service role for batch inference .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # Any tags to associate with the batch inference job. For more information, see Tagging Amazon Bedrock
        # resources .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The number of hours after which to force the batch inference job to time out.

        @[JSON::Field(key: "timeoutDurationInHours")]
        getter timeout_duration_in_hours : Int32?

        # The configuration of the Virtual Private Cloud (VPC) for the data in the batch inference job. For
        # more information, see Protect batch inference jobs using a VPC .

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @input_data_config : Types::ModelInvocationJobInputDataConfig,
          @job_name : String,
          @model_id : String,
          @output_data_config : Types::ModelInvocationJobOutputDataConfig,
          @role_arn : String,
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_duration_in_hours : Int32? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct CreateModelInvocationJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the batch inference job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        def initialize(
          @job_arn : String
        )
        end
      end


      struct CreatePromptRouterRequest
        include JSON::Serializable

        # The default model to use when the routing criteria is not met.

        @[JSON::Field(key: "fallbackModel")]
        getter fallback_model : Types::PromptRouterTargetModel

        # A list of foundation models that the prompt router can route requests to. At least one model must be
        # specified.

        @[JSON::Field(key: "models")]
        getter models : Array(Types::PromptRouterTargetModel)

        # The name of the prompt router. The name must be unique within your Amazon Web Services account in
        # the current region.

        @[JSON::Field(key: "promptRouterName")]
        getter prompt_router_name : String

        # The criteria, which is the response quality difference, used to determine how incoming requests are
        # routed to different models.

        @[JSON::Field(key: "routingCriteria")]
        getter routing_criteria : Types::RoutingCriteria

        # A unique, case-sensitive identifier that you provide to ensure idempotency of your requests. If not
        # specified, the Amazon Web Services SDK automatically generates one for you.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # An optional description of the prompt router to help identify its purpose.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An array of key-value pairs to apply to this resource as tags. You can use tags to categorize and
        # manage your Amazon Web Services resources.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @fallback_model : Types::PromptRouterTargetModel,
          @models : Array(Types::PromptRouterTargetModel),
          @prompt_router_name : String,
          @routing_criteria : Types::RoutingCriteria,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePromptRouterResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the prompt router.

        @[JSON::Field(key: "promptRouterArn")]
        getter prompt_router_arn : String?

        def initialize(
          @prompt_router_arn : String? = nil
        )
        end
      end


      struct CreateProvisionedModelThroughputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or name of the model to associate with this Provisioned Throughput.
        # For a list of models for which you can purchase Provisioned Throughput, see Amazon Bedrock model IDs
        # for purchasing Provisioned Throughput in the Amazon Bedrock User Guide .

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Number of model units to allocate. A model unit delivers a specific throughput level for the
        # specified model. The throughput level of a model unit specifies the total number of input and output
        # tokens that it can process and generate within a span of one minute. By default, your account has no
        # model units for purchasing Provisioned Throughputs with commitment. You must first visit the Amazon
        # Web Services support center to request MUs. For model unit quotas, see Provisioned Throughput quotas
        # in the Amazon Bedrock User Guide . For more information about what an MU specifies, contact your
        # Amazon Web Services account manager.

        @[JSON::Field(key: "modelUnits")]
        getter model_units : Int32

        # The name for this Provisioned Throughput.

        @[JSON::Field(key: "provisionedModelName")]
        getter provisioned_model_name : String

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency in the Amazon S3 User Guide.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The commitment duration requested for the Provisioned Throughput. Billing occurs hourly and is
        # discounted for longer commitment terms. To request a no-commit Provisioned Throughput, omit this
        # field. Custom models support all levels of commitment. To see which base models support no
        # commitment, see Supported regions and models for Provisioned Throughput in the Amazon Bedrock User
        # Guide

        @[JSON::Field(key: "commitmentDuration")]
        getter commitment_duration : String?

        # Tags to associate with this Provisioned Throughput.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @model_id : String,
          @model_units : Int32,
          @provisioned_model_name : String,
          @client_request_token : String? = nil,
          @commitment_duration : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateProvisionedModelThroughputResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for this Provisioned Throughput.

        @[JSON::Field(key: "provisionedModelArn")]
        getter provisioned_model_arn : String

        def initialize(
          @provisioned_model_arn : String
        )
        end
      end

      # Defines the model you want to evaluate custom metrics in an Amazon Bedrock evaluation job.

      struct CustomMetricBedrockEvaluatorModel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the evaluator model for custom metrics. For a list of supported
        # evaluator models, see Evaluate model performance using another LLM as a judge and Evaluate the
        # performance of RAG sources using Amazon Bedrock evaluations .

        @[JSON::Field(key: "modelIdentifier")]
        getter model_identifier : String

        def initialize(
          @model_identifier : String
        )
        end
      end

      # The definition of a custom metric for use in an Amazon Bedrock evaluation job. A custom metric
      # definition includes a metric name, prompt (instructions) and optionally, a rating scale. Your prompt
      # must include a task description and input variables. The required input variables are different for
      # model-as-a-judge and RAG evaluations. For more information about how to define a custom metric in
      # Amazon Bedrock, see Create a prompt for a custom metrics (LLM-as-a-judge model evaluations) and
      # Create a prompt for a custom metrics (RAG evaluations) .

      struct CustomMetricDefinition
        include JSON::Serializable

        # The prompt for a custom metric that instructs the evaluator model how to rate the model or RAG
        # source under evaluation.

        @[JSON::Field(key: "instructions")]
        getter instructions : String

        # The name for a custom metric. Names must be unique in your Amazon Web Services region.

        @[JSON::Field(key: "name")]
        getter name : String

        # Defines the rating scale to be used for a custom metric. We recommend that you always define a
        # ratings scale when creating a custom metric. If you don't define a scale, Amazon Bedrock won't be
        # able to visually display the results of the evaluation in the console or calculate average values of
        # numerical scores. For more information on specifying a rating scale, see Specifying an output schema
        # (rating scale) .

        @[JSON::Field(key: "ratingScale")]
        getter rating_scale : Array(Types::RatingScaleItem)?

        def initialize(
          @instructions : String,
          @name : String,
          @rating_scale : Array(Types::RatingScaleItem)? = nil
        )
        end
      end

      # Configuration of the evaluator model you want to use to evaluate custom metrics in an Amazon Bedrock
      # evaluation job.

      struct CustomMetricEvaluatorModelConfig
        include JSON::Serializable

        # Defines the model you want to evaluate custom metrics in an Amazon Bedrock evaluation job.

        @[JSON::Field(key: "bedrockEvaluatorModels")]
        getter bedrock_evaluator_models : Array(Types::CustomMetricBedrockEvaluatorModel)

        def initialize(
          @bedrock_evaluator_models : Array(Types::CustomMetricBedrockEvaluatorModel)
        )
        end
      end

      # Contains summary information about a custom model deployment, including its ARN, name, status, and
      # associated custom model.

      struct CustomModelDeploymentSummary
        include JSON::Serializable

        # The date and time when the custom model deployment was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the custom model deployment.

        @[JSON::Field(key: "customModelDeploymentArn")]
        getter custom_model_deployment_arn : String

        # The name of the custom model deployment.

        @[JSON::Field(key: "customModelDeploymentName")]
        getter custom_model_deployment_name : String

        # The Amazon Resource Name (ARN) of the custom model associated with this deployment.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The status of the custom model deployment. Possible values are CREATING , ACTIVE , and FAILED .

        @[JSON::Field(key: "status")]
        getter status : String

        # If the deployment status is FAILED , this field contains a message describing the failure reason.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The date and time when the custom model deployment was last modified.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        def initialize(
          @created_at : Time,
          @custom_model_deployment_arn : String,
          @custom_model_deployment_name : String,
          @model_arn : String,
          @status : String,
          @failure_message : String? = nil,
          @last_updated_at : Time? = nil
        )
        end
      end

      # Details about an update to a custom model deployment, including the new custom model resource ARN
      # and current update status.

      struct CustomModelDeploymentUpdateDetails
        include JSON::Serializable

        # ARN of the new custom model being deployed as part of the update.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # Current status of the deployment update.

        @[JSON::Field(key: "updateStatus")]
        getter update_status : String

        def initialize(
          @model_arn : String,
          @update_status : String
        )
        end
      end

      # Summary information for a custom model.

      struct CustomModelSummary
        include JSON::Serializable

        # The base model Amazon Resource Name (ARN).

        @[JSON::Field(key: "baseModelArn")]
        getter base_model_arn : String

        # The base model name.

        @[JSON::Field(key: "baseModelName")]
        getter base_model_name : String

        # Creation time of the model.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the custom model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The name of the custom model.

        @[JSON::Field(key: "modelName")]
        getter model_name : String

        # Specifies whether to carry out continued pre-training of a model or whether to fine-tune it. For
        # more information, see Custom models .

        @[JSON::Field(key: "customizationType")]
        getter customization_type : String?

        # The current status of the custom model. Possible values include: Creating - The model is being
        # created and validated. Active - The model has been successfully created and is ready for use. Failed
        # - The model creation process failed.

        @[JSON::Field(key: "modelStatus")]
        getter model_status : String?

        # The unique identifier of the account that owns the model.

        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String?

        def initialize(
          @base_model_arn : String,
          @base_model_name : String,
          @creation_time : Time,
          @model_arn : String,
          @model_name : String,
          @customization_type : String? = nil,
          @model_status : String? = nil,
          @owner_account_id : String? = nil
        )
        end
      end

      # A CustomModelUnit (CMU) is an abstract view of the hardware utilization that Amazon Bedrock needs to
      # host a single copy of your custom model. A model copy represents a single instance of your imported
      # model that is ready to serve inference requests. Amazon Bedrock determines the number of custom
      # model units that a model copy needs when you import the custom model. You can use CustomModelUnits
      # to estimate the cost of running your custom model. For more information, see Calculate the cost of
      # running a custom model in the Amazon Bedrock user guide.

      struct CustomModelUnits
        include JSON::Serializable

        # The number of custom model units used to host a model copy.

        @[JSON::Field(key: "customModelUnitsPerModelCopy")]
        getter custom_model_units_per_model_copy : Int32?

        # The version of the custom model unit. Use to determine the billing rate for the custom model unit.

        @[JSON::Field(key: "customModelUnitsVersion")]
        getter custom_model_units_version : String?

        def initialize(
          @custom_model_units_per_model_copy : Int32? = nil,
          @custom_model_units_version : String? = nil
        )
        end
      end

      # A model customization configuration

      struct CustomizationConfig
        include JSON::Serializable

        # The Distillation configuration for the custom model.

        @[JSON::Field(key: "distillationConfig")]
        getter distillation_config : Types::DistillationConfig?

        # Configuration settings for reinforcement fine-tuning (RFT) model customization, including grader
        # configuration and hyperparameters.

        @[JSON::Field(key: "rftConfig")]
        getter rft_config : Types::RFTConfig?

        def initialize(
          @distillation_config : Types::DistillationConfig? = nil,
          @rft_config : Types::RFTConfig? = nil
        )
        end
      end

      # For a Distillation job, the status details for the data processing sub-task of the job.

      struct DataProcessingDetails
        include JSON::Serializable

        # The start time of the data processing sub-task of the job.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The latest update to the data processing sub-task of the job.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The status of the data processing sub-task of the job.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteAutomatedReasoningPolicyBuildWorkflowRequest
        include JSON::Serializable

        # The unique identifier of the build workflow to delete.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The timestamp when the build workflow was last updated. This is used for optimistic concurrency
        # control to prevent accidental deletion of workflows that have been modified.

        @[JSON::Field(key: "updatedAt")]
        getter last_updated_at : Time

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy whose build workflow you want to
        # delete.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @build_workflow_id : String,
          @last_updated_at : Time,
          @policy_arn : String
        )
        end
      end


      struct DeleteAutomatedReasoningPolicyBuildWorkflowResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAutomatedReasoningPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy to delete.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # Specifies whether to force delete the automated reasoning policy even if it has active resources.
        # When false , Amazon Bedrock validates if all artifacts have been deleted (e.g. policy version, test
        # case, test result) for a policy before deletion. When true , Amazon Bedrock will delete the policy
        # and all its artifacts without validation. Default is false .

        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @policy_arn : String,
          @force : Bool? = nil
        )
        end
      end


      struct DeleteAutomatedReasoningPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAutomatedReasoningPolicyTestCaseRequest
        include JSON::Serializable

        # The timestamp when the test was last updated. This is used as a concurrency token to prevent
        # conflicting modifications.

        @[JSON::Field(key: "updatedAt")]
        getter last_updated_at : Time

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy that contains the test.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The unique identifier of the test to delete.

        @[JSON::Field(key: "testCaseId")]
        getter test_case_id : String

        def initialize(
          @last_updated_at : Time,
          @policy_arn : String,
          @test_case_id : String
        )
        end
      end


      struct DeleteAutomatedReasoningPolicyTestCaseResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCustomModelDeploymentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or name of the custom model deployment to delete.

        @[JSON::Field(key: "customModelDeploymentIdentifier")]
        getter custom_model_deployment_identifier : String

        def initialize(
          @custom_model_deployment_identifier : String
        )
        end
      end


      struct DeleteCustomModelDeploymentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCustomModelRequest
        include JSON::Serializable

        # Name of the model to delete.

        @[JSON::Field(key: "modelIdentifier")]
        getter model_identifier : String

        def initialize(
          @model_identifier : String
        )
        end
      end


      struct DeleteCustomModelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEnforcedGuardrailConfigurationRequest
        include JSON::Serializable

        # Unique ID for the account enforced configuration.

        @[JSON::Field(key: "configId")]
        getter config_id : String

        def initialize(
          @config_id : String
        )
        end
      end


      struct DeleteEnforcedGuardrailConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFoundationModelAgreementRequest
        include JSON::Serializable

        # Model Id of the model access to delete.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @model_id : String
        )
        end
      end


      struct DeleteFoundationModelAgreementResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteGuardrailRequest
        include JSON::Serializable

        # The unique identifier of the guardrail. This can be an ID or the ARN.

        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String

        # The version of the guardrail.

        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String?

        def initialize(
          @guardrail_identifier : String,
          @guardrail_version : String? = nil
        )
        end
      end


      struct DeleteGuardrailResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteImportedModelRequest
        include JSON::Serializable

        # Name of the imported model to delete.

        @[JSON::Field(key: "modelIdentifier")]
        getter model_identifier : String

        def initialize(
          @model_identifier : String
        )
        end
      end


      struct DeleteImportedModelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteInferenceProfileRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or ID of the application inference profile to delete.

        @[JSON::Field(key: "inferenceProfileIdentifier")]
        getter inference_profile_identifier : String

        def initialize(
          @inference_profile_identifier : String
        )
        end
      end


      struct DeleteInferenceProfileResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMarketplaceModelEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint you want to delete.

        @[JSON::Field(key: "endpointArn")]
        getter endpoint_arn : String

        def initialize(
          @endpoint_arn : String
        )
        end
      end


      struct DeleteMarketplaceModelEndpointResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteModelInvocationLoggingConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteModelInvocationLoggingConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePromptRouterRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the prompt router to delete.

        @[JSON::Field(key: "promptRouterArn")]
        getter prompt_router_arn : String

        def initialize(
          @prompt_router_arn : String
        )
        end
      end


      struct DeletePromptRouterResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteProvisionedModelThroughputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or name of the Provisioned Throughput.

        @[JSON::Field(key: "provisionedModelId")]
        getter provisioned_model_id : String

        def initialize(
          @provisioned_model_id : String
        )
        end
      end


      struct DeleteProvisionedModelThroughputResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterMarketplaceModelEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint you want to deregister.

        @[JSON::Field(key: "endpointArn")]
        getter endpoint_arn : String

        def initialize(
          @endpoint_arn : String
        )
        end
      end


      struct DeregisterMarketplaceModelEndpointResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Dimensional price rate.

      struct DimensionalPriceRate
        include JSON::Serializable

        # Description of the price rate.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Dimension for the price rate.

        @[JSON::Field(key: "dimension")]
        getter dimension : String?

        # Single-dimensional rate information.

        @[JSON::Field(key: "price")]
        getter price : String?

        # Unit associated with the price.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @description : String? = nil,
          @dimension : String? = nil,
          @price : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # Settings for distilling a foundation model into a smaller and more efficient model.

      struct DistillationConfig
        include JSON::Serializable

        # The teacher model configuration.

        @[JSON::Field(key: "teacherModelConfig")]
        getter teacher_model_config : Types::TeacherModelConfig

        def initialize(
          @teacher_model_config : Types::TeacherModelConfig
        )
        end
      end

      # Specifies the configuration for the endpoint.

      struct EndpointConfig
        include JSON::Serializable

        # The configuration specific to Amazon SageMaker for the endpoint.

        @[JSON::Field(key: "sageMaker")]
        getter sage_maker : Types::SageMakerEndpoint?

        def initialize(
          @sage_maker : Types::SageMakerEndpoint? = nil
        )
        end
      end

      # Contains the ARN of the Amazon Bedrock model or inference profile specified in your evaluation job.
      # Each Amazon Bedrock model supports different inferenceParams . To learn more about supported
      # inference parameters for Amazon Bedrock models, see Inference parameters for foundation models . The
      # inferenceParams are specified using JSON. To successfully insert JSON as string make sure that all
      # quotations are properly escaped. For example, "temperature":"0.25" key value pair would need to be
      # formatted as \"temperature\":\"0.25\" to successfully accepted in the request.

      struct EvaluationBedrockModel
        include JSON::Serializable

        # The ARN of the Amazon Bedrock model or inference profile specified.

        @[JSON::Field(key: "modelIdentifier")]
        getter model_identifier : String

        # Each Amazon Bedrock support different inference parameters that change how the model behaves during
        # inference.

        @[JSON::Field(key: "inferenceParams")]
        getter inference_params : String?

        # Specifies performance settings for the model or inference profile.

        @[JSON::Field(key: "performanceConfig")]
        getter performance_config : Types::PerformanceConfiguration?

        def initialize(
          @model_identifier : String,
          @inference_params : String? = nil,
          @performance_config : Types::PerformanceConfiguration? = nil
        )
        end
      end

      # The configuration details of either an automated or human-based evaluation job.

      struct EvaluationConfig
        include JSON::Serializable

        # Contains the configuration details of an automated evaluation job that computes metrics.

        @[JSON::Field(key: "automated")]
        getter automated : Types::AutomatedEvaluationConfig?

        # Contains the configuration details of an evaluation job that uses human workers.

        @[JSON::Field(key: "human")]
        getter human : Types::HumanEvaluationConfig?

        def initialize(
          @automated : Types::AutomatedEvaluationConfig? = nil,
          @human : Types::HumanEvaluationConfig? = nil
        )
        end
      end

      # Used to specify the name of a built-in prompt dataset and optionally, the Amazon S3 bucket where a
      # custom prompt dataset is saved.

      struct EvaluationDataset
        include JSON::Serializable

        # Used to specify supported built-in prompt datasets. Valid values are Builtin.Bold , Builtin.BoolQ ,
        # Builtin.NaturalQuestions , Builtin.Gigaword , Builtin.RealToxicityPrompts , Builtin.TriviaQA ,
        # Builtin.T-Rex , Builtin.WomensEcommerceClothingReviews and Builtin.Wikitext2 .

        @[JSON::Field(key: "name")]
        getter name : String

        # For custom prompt datasets, you must specify the location in Amazon S3 where the prompt dataset is
        # saved.

        @[JSON::Field(key: "datasetLocation")]
        getter dataset_location : Types::EvaluationDatasetLocation?

        def initialize(
          @name : String,
          @dataset_location : Types::EvaluationDatasetLocation? = nil
        )
        end
      end

      # The location in Amazon S3 where your prompt dataset is stored.

      struct EvaluationDatasetLocation
        include JSON::Serializable

        # The S3 URI of the S3 bucket specified in the job.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String?

        def initialize(
          @s3_uri : String? = nil
        )
        end
      end

      # Defines the prompt datasets, built-in metric names and custom metric names, and the task type.

      struct EvaluationDatasetMetricConfig
        include JSON::Serializable

        # Specifies the prompt dataset.

        @[JSON::Field(key: "dataset")]
        getter dataset : Types::EvaluationDataset

        # The names of the metrics you want to use for your evaluation job. For knowledge base evaluation jobs
        # that evaluate retrieval only, valid values are " Builtin.ContextRelevance ", "
        # Builtin.ContextCoverage ". For knowledge base evaluation jobs that evaluate retrieval with response
        # generation, valid values are " Builtin.Correctness ", " Builtin.Completeness ", "
        # Builtin.Helpfulness ", " Builtin.LogicalCoherence ", " Builtin.Faithfulness ", " Builtin.Harmfulness
        # ", " Builtin.Stereotyping ", " Builtin.Refusal ". For automated model evaluation jobs, valid values
        # are " Builtin.Accuracy ", " Builtin.Robustness ", and " Builtin.Toxicity ". In model evaluation jobs
        # that use a LLM as judge you can specify " Builtin.Correctness ", " Builtin.Completeness" , "
        # Builtin.Faithfulness" , " Builtin.Helpfulness ", " Builtin.Coherence ", " Builtin.Relevance ", "
        # Builtin.FollowingInstructions ", " Builtin.ProfessionalStyleAndTone ", You can also specify the
        # following responsible AI related metrics only for model evaluation job that use a LLM as judge "
        # Builtin.Harmfulness ", " Builtin.Stereotyping ", and " Builtin.Refusal ". For human-based model
        # evaluation jobs, the list of strings must match the name parameter specified in
        # HumanEvaluationCustomMetric .

        @[JSON::Field(key: "metricNames")]
        getter metric_names : Array(String)

        # The the type of task you want to evaluate for your evaluation job. This applies only to model
        # evaluation jobs and is ignored for knowledge base evaluation jobs.

        @[JSON::Field(key: "taskType")]
        getter task_type : String

        def initialize(
          @dataset : Types::EvaluationDataset,
          @metric_names : Array(String),
          @task_type : String
        )
        end
      end

      # The configuration details of the inference model for an evaluation job. For automated model
      # evaluation jobs, only a single model is supported. For human-based model evaluation jobs, your
      # annotator can compare the responses for up to two different models.

      struct EvaluationInferenceConfig
        include JSON::Serializable

        # Specifies the inference models.

        @[JSON::Field(key: "models")]
        getter models : Array(Types::EvaluationModelConfig)?

        # Contains the configuration details of the inference for a knowledge base evaluation job, including
        # either the retrieval only configuration or the retrieval with response generation configuration.

        @[JSON::Field(key: "ragConfigs")]
        getter rag_configs : Array(Types::RAGConfig)?

        def initialize(
          @models : Array(Types::EvaluationModelConfig)? = nil,
          @rag_configs : Array(Types::RAGConfig)? = nil
        )
        end
      end

      # Identifies the models, Knowledge Bases, or other RAG sources evaluated in a model or Knowledge Base
      # evaluation job.

      struct EvaluationInferenceConfigSummary
        include JSON::Serializable

        # A summary of the models used in an Amazon Bedrock model evaluation job. These resources can be
        # models in Amazon Bedrock or models outside of Amazon Bedrock that you use to generate your own
        # inference response data.

        @[JSON::Field(key: "modelConfigSummary")]
        getter model_config_summary : Types::EvaluationModelConfigSummary?

        # A summary of the RAG resources used in an Amazon Bedrock Knowledge Base evaluation job. These
        # resources can be Knowledge Bases in Amazon Bedrock or RAG sources outside of Amazon Bedrock that you
        # use to generate your own inference response data.

        @[JSON::Field(key: "ragConfigSummary")]
        getter rag_config_summary : Types::EvaluationRagConfigSummary?

        def initialize(
          @model_config_summary : Types::EvaluationModelConfigSummary? = nil,
          @rag_config_summary : Types::EvaluationRagConfigSummary? = nil
        )
        end
      end

      # Defines the models used in the model evaluation job.

      struct EvaluationModelConfig
        include JSON::Serializable

        # Defines the Amazon Bedrock model or inference profile and inference parameters you want used.

        @[JSON::Field(key: "bedrockModel")]
        getter bedrock_model : Types::EvaluationBedrockModel?

        # Defines the model used to generate inference response data for a model evaluation job where you
        # provide your own inference response data.

        @[JSON::Field(key: "precomputedInferenceSource")]
        getter precomputed_inference_source : Types::EvaluationPrecomputedInferenceSource?

        def initialize(
          @bedrock_model : Types::EvaluationBedrockModel? = nil,
          @precomputed_inference_source : Types::EvaluationPrecomputedInferenceSource? = nil
        )
        end
      end

      # A summary of the models used in an Amazon Bedrock model evaluation job. These resources can be
      # models in Amazon Bedrock or models outside of Amazon Bedrock that you use to generate your own
      # inference response data.

      struct EvaluationModelConfigSummary
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the models used for the evaluation job.

        @[JSON::Field(key: "bedrockModelIdentifiers")]
        getter bedrock_model_identifiers : Array(String)?

        # A label that identifies the models used for a model evaluation job where you provide your own
        # inference response data.

        @[JSON::Field(key: "precomputedInferenceSourceIdentifiers")]
        getter precomputed_inference_source_identifiers : Array(String)?

        def initialize(
          @bedrock_model_identifiers : Array(String)? = nil,
          @precomputed_inference_source_identifiers : Array(String)? = nil
        )
        end
      end

      # The Amazon S3 location where the results of your evaluation job are saved.

      struct EvaluationOutputDataConfig
        include JSON::Serializable

        # The Amazon S3 URI where the results of the evaluation job are saved.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # A summary of a model used for a model evaluation job where you provide your own inference response
      # data.

      struct EvaluationPrecomputedInferenceSource
        include JSON::Serializable

        # A label that identifies a model used in a model evaluation job where you provide your own inference
        # response data.

        @[JSON::Field(key: "inferenceSourceIdentifier")]
        getter inference_source_identifier : String

        def initialize(
          @inference_source_identifier : String
        )
        end
      end

      # A summary of a RAG source used for a Knowledge Base evaluation job where you provide your own
      # inference response data.

      struct EvaluationPrecomputedRagSourceConfig
        include JSON::Serializable

        # A summary of a RAG source used for a retrieve-and-generate Knowledge Base evaluation job where you
        # provide your own inference response data.

        @[JSON::Field(key: "retrieveAndGenerateSourceConfig")]
        getter retrieve_and_generate_source_config : Types::EvaluationPrecomputedRetrieveAndGenerateSourceConfig?

        # A summary of a RAG source used for a retrieve-only Knowledge Base evaluation job where you provide
        # your own inference response data.

        @[JSON::Field(key: "retrieveSourceConfig")]
        getter retrieve_source_config : Types::EvaluationPrecomputedRetrieveSourceConfig?

        def initialize(
          @retrieve_and_generate_source_config : Types::EvaluationPrecomputedRetrieveAndGenerateSourceConfig? = nil,
          @retrieve_source_config : Types::EvaluationPrecomputedRetrieveSourceConfig? = nil
        )
        end
      end

      # A summary of a RAG source used for a retrieve-and-generate Knowledge Base evaluation job where you
      # provide your own inference response data.

      struct EvaluationPrecomputedRetrieveAndGenerateSourceConfig
        include JSON::Serializable

        # A label that identifies the RAG source used for a retrieve-and-generate Knowledge Base evaluation
        # job where you provide your own inference response data.

        @[JSON::Field(key: "ragSourceIdentifier")]
        getter rag_source_identifier : String

        def initialize(
          @rag_source_identifier : String
        )
        end
      end

      # A summary of a RAG source used for a retrieve-only Knowledge Base evaluation job where you provide
      # your own inference response data.

      struct EvaluationPrecomputedRetrieveSourceConfig
        include JSON::Serializable

        # A label that identifies the RAG source used for a retrieve-only Knowledge Base evaluation job where
        # you provide your own inference response data.

        @[JSON::Field(key: "ragSourceIdentifier")]
        getter rag_source_identifier : String

        def initialize(
          @rag_source_identifier : String
        )
        end
      end

      # A summary of the RAG resources used in an Amazon Bedrock Knowledge Base evaluation job. These
      # resources can be Knowledge Bases in Amazon Bedrock or RAG sources outside of Amazon Bedrock that you
      # use to generate your own inference response data.

      struct EvaluationRagConfigSummary
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the Knowledge Base resources used for a Knowledge Base
        # evaluation job where Amazon Bedrock invokes the Knowledge Base for you.

        @[JSON::Field(key: "bedrockKnowledgeBaseIdentifiers")]
        getter bedrock_knowledge_base_identifiers : Array(String)?

        # A label that identifies the RAG sources used for a Knowledge Base evaluation job where you provide
        # your own inference response data.

        @[JSON::Field(key: "precomputedRagSourceIdentifiers")]
        getter precomputed_rag_source_identifiers : Array(String)?

        def initialize(
          @bedrock_knowledge_base_identifiers : Array(String)? = nil,
          @precomputed_rag_source_identifiers : Array(String)? = nil
        )
        end
      end

      # Summary information of an evaluation job.

      struct EvaluationSummary
        include JSON::Serializable

        # The time the evaluation job was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The type of task for model evaluation.

        @[JSON::Field(key: "evaluationTaskTypes")]
        getter evaluation_task_types : Array(String)

        # The Amazon Resource Name (ARN) of the evaluation job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The name for the evaluation job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # Specifies whether the evaluation job is automated or human-based.

        @[JSON::Field(key: "jobType")]
        getter job_type : String

        # The current status of the evaluation job.

        @[JSON::Field(key: "status")]
        getter status : String

        # Specifies whether the evaluation job is for evaluating a model or evaluating a knowledge base
        # (retrieval and response generation).

        @[JSON::Field(key: "applicationType")]
        getter application_type : String?

        # The Amazon Resource Names (ARNs) of the models used to compute custom metrics in an Amazon Bedrock
        # evaluation job.

        @[JSON::Field(key: "customMetricsEvaluatorModelIdentifiers")]
        getter custom_metrics_evaluator_model_identifiers : Array(String)?

        # The Amazon Resource Names (ARNs) of the models used to compute the metrics for a knowledge base
        # evaluation job.

        @[JSON::Field(key: "evaluatorModelIdentifiers")]
        getter evaluator_model_identifiers : Array(String)?

        # Identifies the models, Knowledge Bases, or other RAG sources evaluated in a model or Knowledge Base
        # evaluation job.

        @[JSON::Field(key: "inferenceConfigSummary")]
        getter inference_config_summary : Types::EvaluationInferenceConfigSummary?

        # The Amazon Resource Names (ARNs) of the model(s) used for the evaluation job.

        @[JSON::Field(key: "modelIdentifiers")]
        getter model_identifiers : Array(String)?

        # The Amazon Resource Names (ARNs) of the knowledge base resources used for a knowledge base
        # evaluation job.

        @[JSON::Field(key: "ragIdentifiers")]
        getter rag_identifiers : Array(String)?

        def initialize(
          @creation_time : Time,
          @evaluation_task_types : Array(String),
          @job_arn : String,
          @job_name : String,
          @job_type : String,
          @status : String,
          @application_type : String? = nil,
          @custom_metrics_evaluator_model_identifiers : Array(String)? = nil,
          @evaluator_model_identifiers : Array(String)? = nil,
          @inference_config_summary : Types::EvaluationInferenceConfigSummary? = nil,
          @model_identifiers : Array(String)? = nil,
          @rag_identifiers : Array(String)? = nil
        )
        end
      end

      # Specifies the model configuration for the evaluator model. EvaluatorModelConfig is required for
      # evaluation jobs that use a knowledge base or in model evaluation job that use a model as judge. This
      # model computes all evaluation related metrics.

      struct EvaluatorModelConfig
        include JSON::Serializable

        # The evaluator model used in knowledge base evaluation job or in model evaluation job that use a
        # model as judge. This model computes all evaluation related metrics.

        @[JSON::Field(key: "bedrockEvaluatorModels")]
        getter bedrock_evaluator_models : Array(Types::BedrockEvaluatorModel)?

        def initialize(
          @bedrock_evaluator_models : Array(Types::BedrockEvaluatorModel)? = nil
        )
        end
      end


      struct ExportAutomatedReasoningPolicyVersionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy to export. Can be either the
        # unversioned ARN for the draft policy or a versioned ARN for a specific policy version.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @policy_arn : String
        )
        end
      end


      struct ExportAutomatedReasoningPolicyVersionResponse
        include JSON::Serializable

        # The exported policy definition containing the formal logic rules, variables, and custom variable
        # types.

        @[JSON::Field(key: "policyDefinition")]
        getter policy_definition : Types::AutomatedReasoningPolicyDefinition

        def initialize(
          @policy_definition : Types::AutomatedReasoningPolicyDefinition
        )
        end
      end

      # The unique external source of the content contained in the wrapper object.

      struct ExternalSource
        include JSON::Serializable

        # The source type of the external source wrapper object.

        @[JSON::Field(key: "sourceType")]
        getter source_type : String

        # The identifier, content type, and data of the external source wrapper object.

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

      # The response generation configuration of the external source wrapper object.

      struct ExternalSourcesGenerationConfiguration
        include JSON::Serializable

        # Additional model parameters and their corresponding values not included in the text inference
        # configuration for an external source. Takes in custom model parameters specific to the language
        # model being used.

        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        # Configuration details for the guardrail.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # Configuration details for inference when using RetrieveAndGenerate to generate responses while using
        # an external source.

        @[JSON::Field(key: "kbInferenceConfig")]
        getter kb_inference_config : Types::KbInferenceConfig?

        # Contains the template for the prompt for the external source wrapper object.

        @[JSON::Field(key: "promptTemplate")]
        getter prompt_template : Types::PromptTemplate?

        def initialize(
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @kb_inference_config : Types::KbInferenceConfig? = nil,
          @prompt_template : Types::PromptTemplate? = nil
        )
        end
      end

      # The configuration of the external source wrapper object in the retrieveAndGenerate function.

      struct ExternalSourcesRetrieveAndGenerateConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the foundation model or inference profile used to generate
        # responses.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The document for the external source wrapper object in the retrieveAndGenerate function.

        @[JSON::Field(key: "sources")]
        getter sources : Array(Types::ExternalSource)

        # Contains configurations details for response generation based on retrieved text chunks.

        @[JSON::Field(key: "generationConfiguration")]
        getter generation_configuration : Types::ExternalSourcesGenerationConfiguration?

        def initialize(
          @model_arn : String,
          @sources : Array(Types::ExternalSource),
          @generation_configuration : Types::ExternalSourcesGenerationConfiguration? = nil
        )
        end
      end

      # Specifies a field to be used during the reranking process in a Knowledge Base vector search. This
      # structure identifies metadata fields that should be considered when reordering search results to
      # improve relevance.

      struct FieldForReranking
        include JSON::Serializable

        # The name of the metadata field to be used during the reranking process.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        def initialize(
          @field_name : String
        )
        end
      end

      # Specifies the name of the metadata attribute/field to apply filters. You must match the name of the
      # attribute/field in your data source/document metadata.

      struct FilterAttribute
        include JSON::Serializable

        # The name of metadata attribute/field, which must match the name in your data source/document
        # metadata.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the metadata attribute/field.

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

      # Information about a foundation model.

      struct FoundationModelDetails
        include JSON::Serializable

        # The model Amazon Resource Name (ARN).

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The model identifier.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # The customization that the model supports.

        @[JSON::Field(key: "customizationsSupported")]
        getter customizations_supported : Array(String)?

        # The inference types that the model supports.

        @[JSON::Field(key: "inferenceTypesSupported")]
        getter inference_types_supported : Array(String)?

        # The input modalities that the model supports.

        @[JSON::Field(key: "inputModalities")]
        getter input_modalities : Array(String)?

        # Contains details about whether a model version is available or deprecated

        @[JSON::Field(key: "modelLifecycle")]
        getter model_lifecycle : Types::FoundationModelLifecycle?

        # The model name.

        @[JSON::Field(key: "modelName")]
        getter model_name : String?

        # The output modalities that the model supports.

        @[JSON::Field(key: "outputModalities")]
        getter output_modalities : Array(String)?

        # The model's provider name.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        # Indicates whether the model supports streaming.

        @[JSON::Field(key: "responseStreamingSupported")]
        getter response_streaming_supported : Bool?

        def initialize(
          @model_arn : String,
          @model_id : String,
          @customizations_supported : Array(String)? = nil,
          @inference_types_supported : Array(String)? = nil,
          @input_modalities : Array(String)? = nil,
          @model_lifecycle : Types::FoundationModelLifecycle? = nil,
          @model_name : String? = nil,
          @output_modalities : Array(String)? = nil,
          @provider_name : String? = nil,
          @response_streaming_supported : Bool? = nil
        )
        end
      end

      # Details about whether a model version is available or deprecated.

      struct FoundationModelLifecycle
        include JSON::Serializable

        # Specifies whether a model version is available ( ACTIVE ) or deprecated ( LEGACY .

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Summary information for a foundation model.

      struct FoundationModelSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the foundation model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The model ID of the foundation model.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Whether the model supports fine-tuning or continual pre-training.

        @[JSON::Field(key: "customizationsSupported")]
        getter customizations_supported : Array(String)?

        # The inference types that the model supports.

        @[JSON::Field(key: "inferenceTypesSupported")]
        getter inference_types_supported : Array(String)?

        # The input modalities that the model supports.

        @[JSON::Field(key: "inputModalities")]
        getter input_modalities : Array(String)?

        # Contains details about whether a model version is available or deprecated.

        @[JSON::Field(key: "modelLifecycle")]
        getter model_lifecycle : Types::FoundationModelLifecycle?

        # The name of the model.

        @[JSON::Field(key: "modelName")]
        getter model_name : String?

        # The output modalities that the model supports.

        @[JSON::Field(key: "outputModalities")]
        getter output_modalities : Array(String)?

        # The model's provider name.

        @[JSON::Field(key: "providerName")]
        getter provider_name : String?

        # Indicates whether the model supports streaming.

        @[JSON::Field(key: "responseStreamingSupported")]
        getter response_streaming_supported : Bool?

        def initialize(
          @model_arn : String,
          @model_id : String,
          @customizations_supported : Array(String)? = nil,
          @inference_types_supported : Array(String)? = nil,
          @input_modalities : Array(String)? = nil,
          @model_lifecycle : Types::FoundationModelLifecycle? = nil,
          @model_name : String? = nil,
          @output_modalities : Array(String)? = nil,
          @provider_name : String? = nil,
          @response_streaming_supported : Bool? = nil
        )
        end
      end

      # The configuration details for response generation based on retrieved text chunks.

      struct GenerationConfiguration
        include JSON::Serializable

        # Additional model parameters and corresponding values not included in the textInferenceConfig
        # structure for a knowledge base. This allows you to provide custom model parameters specific to the
        # language model being used.

        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        # Contains configuration details for the guardrail.

        @[JSON::Field(key: "guardrailConfiguration")]
        getter guardrail_configuration : Types::GuardrailConfiguration?

        # Contains configuration details for inference for knowledge base retrieval and response generation.

        @[JSON::Field(key: "kbInferenceConfig")]
        getter kb_inference_config : Types::KbInferenceConfig?

        # Contains the template for the prompt that's sent to the model for response generation.

        @[JSON::Field(key: "promptTemplate")]
        getter prompt_template : Types::PromptTemplate?

        def initialize(
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil,
          @guardrail_configuration : Types::GuardrailConfiguration? = nil,
          @kb_inference_config : Types::KbInferenceConfig? = nil,
          @prompt_template : Types::PromptTemplate? = nil
        )
        end
      end


      struct GetAutomatedReasoningPolicyAnnotationsRequest
        include JSON::Serializable

        # The unique identifier of the build workflow whose annotations you want to retrieve.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy whose annotations you want to
        # retrieve.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @build_workflow_id : String,
          @policy_arn : String
        )
        end
      end


      struct GetAutomatedReasoningPolicyAnnotationsResponse
        include JSON::Serializable

        # A hash value representing the current state of the annotations. This is used for optimistic
        # concurrency control when updating annotations.

        @[JSON::Field(key: "annotationSetHash")]
        getter annotation_set_hash : String

        # The current set of annotations containing rules, variables, and types extracted from the source
        # documents. These can be modified before finalizing the policy.

        @[JSON::Field(key: "annotations")]
        getter annotations : Array(Types::AutomatedReasoningPolicyAnnotation)

        # The unique identifier of the build workflow.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The name of the Automated Reasoning policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The timestamp when the annotations were last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @annotation_set_hash : String,
          @annotations : Array(Types::AutomatedReasoningPolicyAnnotation),
          @build_workflow_id : String,
          @name : String,
          @policy_arn : String,
          @updated_at : Time
        )
        end
      end


      struct GetAutomatedReasoningPolicyBuildWorkflowRequest
        include JSON::Serializable

        # The unique identifier of the build workflow to retrieve.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy whose build workflow you want to
        # retrieve.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @build_workflow_id : String,
          @policy_arn : String
        )
        end
      end


      struct GetAutomatedReasoningPolicyBuildWorkflowResponse
        include JSON::Serializable

        # The unique identifier of the build workflow.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The type of build workflow being executed (e.g., DOCUMENT_INGESTION, POLICY_REPAIR).

        @[JSON::Field(key: "buildWorkflowType")]
        getter build_workflow_type : String

        # The timestamp when the build workflow was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The current status of the build workflow (e.g., RUNNING, COMPLETED, FAILED, CANCELLED).

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp when the build workflow was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The content type of the source document (e.g., text/plain, application/pdf).

        @[JSON::Field(key: "documentContentType")]
        getter document_content_type : String?

        # A detailed description of the document's content and how it should be used in the policy generation
        # process.

        @[JSON::Field(key: "documentDescription")]
        getter document_description : String?

        # The name of the source document used in the build workflow.

        @[JSON::Field(key: "documentName")]
        getter document_name : String?

        def initialize(
          @build_workflow_id : String,
          @build_workflow_type : String,
          @created_at : Time,
          @policy_arn : String,
          @status : String,
          @updated_at : Time,
          @document_content_type : String? = nil,
          @document_description : String? = nil,
          @document_name : String? = nil
        )
        end
      end


      struct GetAutomatedReasoningPolicyBuildWorkflowResultAssetsRequest
        include JSON::Serializable

        # The type of asset to retrieve (e.g., BUILD_LOG, QUALITY_REPORT, POLICY_DEFINITION).

        @[JSON::Field(key: "assetType")]
        getter asset_type : String

        # The unique identifier of the build workflow whose result assets you want to retrieve.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy whose build workflow assets you
        # want to retrieve.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @asset_type : String,
          @build_workflow_id : String,
          @policy_arn : String
        )
        end
      end


      struct GetAutomatedReasoningPolicyBuildWorkflowResultAssetsResponse
        include JSON::Serializable

        # The unique identifier of the build workflow.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The requested build workflow asset. This is a union type that returns only one of the available
        # asset types (logs, reports, or generated artifacts) based on the specific asset type requested in
        # the API call.

        @[JSON::Field(key: "buildWorkflowAssets")]
        getter build_workflow_assets : Types::AutomatedReasoningPolicyBuildResultAssets?

        def initialize(
          @build_workflow_id : String,
          @policy_arn : String,
          @build_workflow_assets : Types::AutomatedReasoningPolicyBuildResultAssets? = nil
        )
        end
      end


      struct GetAutomatedReasoningPolicyNextScenarioRequest
        include JSON::Serializable

        # The unique identifier of the build workflow associated with the test scenarios.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy for which you want to get the next
        # test scenario.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @build_workflow_id : String,
          @policy_arn : String
        )
        end
      end


      struct GetAutomatedReasoningPolicyNextScenarioResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The next test scenario to validate, including the test expression and expected results.

        @[JSON::Field(key: "scenario")]
        getter scenario : Types::AutomatedReasoningPolicyScenario?

        def initialize(
          @policy_arn : String,
          @scenario : Types::AutomatedReasoningPolicyScenario? = nil
        )
        end
      end


      struct GetAutomatedReasoningPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy to retrieve. Can be either the
        # unversioned ARN for the draft policy or an ARN for a specific policy version.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @policy_arn : String
        )
        end
      end


      struct GetAutomatedReasoningPolicyResponse
        include JSON::Serializable

        # The hash of the policy definition used as a concurrency token.

        @[JSON::Field(key: "definitionHash")]
        getter definition_hash : String

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The unique identifier of the policy.

        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # The timestamp when the policy was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the policy.

        @[JSON::Field(key: "version")]
        getter version : String

        # The timestamp when the policy was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the automated reasoning policy and its
        # associated artifacts. If a KMS key is not provided during the initial
        # CreateAutomatedReasoningPolicyRequest, the kmsKeyArn won't be included in the
        # GetAutomatedReasoningPolicyResponse.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @definition_hash : String,
          @name : String,
          @policy_arn : String,
          @policy_id : String,
          @updated_at : Time,
          @version : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct GetAutomatedReasoningPolicyTestCaseRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy that contains the test.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The unique identifier of the test to retrieve.

        @[JSON::Field(key: "testCaseId")]
        getter test_case_id : String

        def initialize(
          @policy_arn : String,
          @test_case_id : String
        )
        end
      end


      struct GetAutomatedReasoningPolicyTestCaseResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the policy that contains the test.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The test details including the content, query, expected result, and metadata.

        @[JSON::Field(key: "testCase")]
        getter test_case : Types::AutomatedReasoningPolicyTestCase

        def initialize(
          @policy_arn : String,
          @test_case : Types::AutomatedReasoningPolicyTestCase
        )
        end
      end


      struct GetAutomatedReasoningPolicyTestResultRequest
        include JSON::Serializable

        # The build workflow identifier. The build workflow must display a COMPLETED status to get results.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The unique identifier of the test for which to retrieve results.

        @[JSON::Field(key: "testCaseId")]
        getter test_case_id : String

        def initialize(
          @build_workflow_id : String,
          @policy_arn : String,
          @test_case_id : String
        )
        end
      end


      struct GetAutomatedReasoningPolicyTestResultResponse
        include JSON::Serializable

        # The test result containing validation findings, execution status, and detailed analysis.

        @[JSON::Field(key: "testResult")]
        getter test_result : Types::AutomatedReasoningPolicyTestResult

        def initialize(
          @test_result : Types::AutomatedReasoningPolicyTestResult
        )
        end
      end


      struct GetCustomModelDeploymentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or name of the custom model deployment to retrieve information about.

        @[JSON::Field(key: "customModelDeploymentIdentifier")]
        getter custom_model_deployment_identifier : String

        def initialize(
          @custom_model_deployment_identifier : String
        )
        end
      end


      struct GetCustomModelDeploymentResponse
        include JSON::Serializable

        # The date and time when the custom model deployment was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the custom model deployment.

        @[JSON::Field(key: "customModelDeploymentArn")]
        getter custom_model_deployment_arn : String

        # The Amazon Resource Name (ARN) of the custom model associated with this deployment.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The name of the custom model deployment.

        @[JSON::Field(key: "modelDeploymentName")]
        getter model_deployment_name : String

        # The status of the custom model deployment. Possible values are: CREATING - The deployment is being
        # set up and prepared for inference. ACTIVE - The deployment is ready and available for inference
        # requests. FAILED - The deployment failed to be created or became unavailable.

        @[JSON::Field(key: "status")]
        getter status : String

        # The description of the custom model deployment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # If the deployment status is FAILED , this field contains a message describing the failure reason.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The date and time when the custom model deployment was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Details about any pending or completed updates to the custom model deployment, including the new
        # model ARN and update status.

        @[JSON::Field(key: "updateDetails")]
        getter update_details : Types::CustomModelDeploymentUpdateDetails?

        def initialize(
          @created_at : Time,
          @custom_model_deployment_arn : String,
          @model_arn : String,
          @model_deployment_name : String,
          @status : String,
          @description : String? = nil,
          @failure_message : String? = nil,
          @last_updated_at : Time? = nil,
          @update_details : Types::CustomModelDeploymentUpdateDetails? = nil
        )
        end
      end


      struct GetCustomModelRequest
        include JSON::Serializable

        # Name or Amazon Resource Name (ARN) of the custom model.

        @[JSON::Field(key: "modelIdentifier")]
        getter model_identifier : String

        def initialize(
          @model_identifier : String
        )
        end
      end


      struct GetCustomModelResponse
        include JSON::Serializable

        # Creation time of the model.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # Amazon Resource Name (ARN) associated with this model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # Model name associated with this model.

        @[JSON::Field(key: "modelName")]
        getter model_name : String

        # Amazon Resource Name (ARN) of the base model.

        @[JSON::Field(key: "baseModelArn")]
        getter base_model_arn : String?

        # The customization configuration for the custom model.

        @[JSON::Field(key: "customizationConfig")]
        getter customization_config : Types::CustomizationConfig?

        # The type of model customization.

        @[JSON::Field(key: "customizationType")]
        getter customization_type : String?

        # A failure message for any issues that occurred when creating the custom model. This is included for
        # only a failed CreateCustomModel operation.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # Hyperparameter values associated with this model. For details on the format for different models,
        # see Custom model hyperparameters .

        @[JSON::Field(key: "hyperParameters")]
        getter hyper_parameters : Hash(String, String)?

        # Job Amazon Resource Name (ARN) associated with this model. For models that you create with the
        # CreateCustomModel API operation, this is NULL .

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # Job name associated with this model.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The custom model is encrypted at rest using this key.

        @[JSON::Field(key: "modelKmsKeyArn")]
        getter model_kms_key_arn : String?

        # The current status of the custom model. Possible values include: Creating - The model is being
        # created and validated. Active - The model has been successfully created and is ready for use. Failed
        # - The model creation process failed. Check the failureMessage field for details.

        @[JSON::Field(key: "modelStatus")]
        getter model_status : String?

        # Output data configuration associated with this custom model.

        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # Contains information about the training dataset.

        @[JSON::Field(key: "trainingDataConfig")]
        getter training_data_config : Types::TrainingDataConfig?

        # Contains training metrics from the job creation.

        @[JSON::Field(key: "trainingMetrics")]
        getter training_metrics : Types::TrainingMetrics?

        # Contains information about the validation dataset.

        @[JSON::Field(key: "validationDataConfig")]
        getter validation_data_config : Types::ValidationDataConfig?

        # The validation metrics from the job creation.

        @[JSON::Field(key: "validationMetrics")]
        getter validation_metrics : Array(Types::ValidatorMetric)?

        def initialize(
          @creation_time : Time,
          @model_arn : String,
          @model_name : String,
          @base_model_arn : String? = nil,
          @customization_config : Types::CustomizationConfig? = nil,
          @customization_type : String? = nil,
          @failure_message : String? = nil,
          @hyper_parameters : Hash(String, String)? = nil,
          @job_arn : String? = nil,
          @job_name : String? = nil,
          @model_kms_key_arn : String? = nil,
          @model_status : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @training_data_config : Types::TrainingDataConfig? = nil,
          @training_metrics : Types::TrainingMetrics? = nil,
          @validation_data_config : Types::ValidationDataConfig? = nil,
          @validation_metrics : Array(Types::ValidatorMetric)? = nil
        )
        end
      end


      struct GetEvaluationJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the evaluation job you want get information on.

        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        def initialize(
          @job_identifier : String
        )
        end
      end


      struct GetEvaluationJobResponse
        include JSON::Serializable

        # The time the evaluation job was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # Contains the configuration details of either an automated or human-based evaluation job.

        @[JSON::Field(key: "evaluationConfig")]
        getter evaluation_config : Types::EvaluationConfig

        # Contains the configuration details of the inference model used for the evaluation job.

        @[JSON::Field(key: "inferenceConfig")]
        getter inference_config : Types::EvaluationInferenceConfig

        # The Amazon Resource Name (ARN) of the evaluation job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The name for the evaluation job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # Specifies whether the evaluation job is automated or human-based.

        @[JSON::Field(key: "jobType")]
        getter job_type : String

        # Contains the configuration details of the Amazon S3 bucket for storing the results of the evaluation
        # job.

        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::EvaluationOutputDataConfig

        # The Amazon Resource Name (ARN) of the IAM service role used in the evaluation job.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The current status of the evaluation job.

        @[JSON::Field(key: "status")]
        getter status : String

        # Specifies whether the evaluation job is for evaluating a model or evaluating a knowledge base
        # (retrieval and response generation).

        @[JSON::Field(key: "applicationType")]
        getter application_type : String?

        # The Amazon Resource Name (ARN) of the customer managed encryption key specified when the evaluation
        # job was created.

        @[JSON::Field(key: "customerEncryptionKeyId")]
        getter customer_encryption_key_id : String?

        # A list of strings that specify why the evaluation job failed to create.

        @[JSON::Field(key: "failureMessages")]
        getter failure_messages : Array(String)?

        # The description of the evaluation job.

        @[JSON::Field(key: "jobDescription")]
        getter job_description : String?

        # The time the evaluation job was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        def initialize(
          @creation_time : Time,
          @evaluation_config : Types::EvaluationConfig,
          @inference_config : Types::EvaluationInferenceConfig,
          @job_arn : String,
          @job_name : String,
          @job_type : String,
          @output_data_config : Types::EvaluationOutputDataConfig,
          @role_arn : String,
          @status : String,
          @application_type : String? = nil,
          @customer_encryption_key_id : String? = nil,
          @failure_messages : Array(String)? = nil,
          @job_description : String? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end


      struct GetFoundationModelAvailabilityRequest
        include JSON::Serializable

        # The model Id of the foundation model.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @model_id : String
        )
        end
      end


      struct GetFoundationModelAvailabilityResponse
        include JSON::Serializable

        # Agreement availability.

        @[JSON::Field(key: "agreementAvailability")]
        getter agreement_availability : Types::AgreementAvailability

        # Authorization status.

        @[JSON::Field(key: "authorizationStatus")]
        getter authorization_status : String

        # Entitlement availability.

        @[JSON::Field(key: "entitlementAvailability")]
        getter entitlement_availability : String

        # The model Id of the foundation model.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Region availability.

        @[JSON::Field(key: "regionAvailability")]
        getter region_availability : String

        def initialize(
          @agreement_availability : Types::AgreementAvailability,
          @authorization_status : String,
          @entitlement_availability : String,
          @model_id : String,
          @region_availability : String
        )
        end
      end


      struct GetFoundationModelRequest
        include JSON::Serializable

        # The model identifier.

        @[JSON::Field(key: "modelIdentifier")]
        getter model_identifier : String

        def initialize(
          @model_identifier : String
        )
        end
      end


      struct GetFoundationModelResponse
        include JSON::Serializable

        # Information about the foundation model.

        @[JSON::Field(key: "modelDetails")]
        getter model_details : Types::FoundationModelDetails?

        def initialize(
          @model_details : Types::FoundationModelDetails? = nil
        )
        end
      end


      struct GetGuardrailRequest
        include JSON::Serializable

        # The unique identifier of the guardrail for which to get details. This can be an ID or the ARN.

        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String

        # The version of the guardrail for which to get details. If you don't specify a version, the response
        # returns details for the DRAFT version.

        @[JSON::Field(key: "guardrailVersion")]
        getter guardrail_version : String?

        def initialize(
          @guardrail_identifier : String,
          @guardrail_version : String? = nil
        )
        end
      end


      struct GetGuardrailResponse
        include JSON::Serializable

        # The message that the guardrail returns when it blocks a prompt.

        @[JSON::Field(key: "blockedInputMessaging")]
        getter blocked_input_messaging : String

        # The message that the guardrail returns when it blocks a model response.

        @[JSON::Field(key: "blockedOutputsMessaging")]
        getter blocked_outputs_messaging : String

        # The date and time at which the guardrail was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ARN of the guardrail.

        @[JSON::Field(key: "guardrailArn")]
        getter guardrail_arn : String

        # The unique identifier of the guardrail.

        @[JSON::Field(key: "guardrailId")]
        getter guardrail_id : String

        # The name of the guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the guardrail.

        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time at which the guardrail was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the guardrail.

        @[JSON::Field(key: "version")]
        getter version : String

        # The current Automated Reasoning policy configuration for the guardrail, if any is configured.

        @[JSON::Field(key: "automatedReasoningPolicy")]
        getter automated_reasoning_policy : Types::GuardrailAutomatedReasoningPolicy?

        # The content policy that was configured for the guardrail.

        @[JSON::Field(key: "contentPolicy")]
        getter content_policy : Types::GuardrailContentPolicy?

        # The contextual grounding policy used in the guardrail.

        @[JSON::Field(key: "contextualGroundingPolicy")]
        getter contextual_grounding_policy : Types::GuardrailContextualGroundingPolicy?

        # Details about the system-defined guardrail profile that you're using with your guardrail, including
        # the guardrail profile ID and Amazon Resource Name (ARN).

        @[JSON::Field(key: "crossRegionDetails")]
        getter cross_region_details : Types::GuardrailCrossRegionDetails?

        # The description of the guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Appears if the status of the guardrail is FAILED . A list of recommendations to carry out before
        # retrying the request.

        @[JSON::Field(key: "failureRecommendations")]
        getter failure_recommendations : Array(String)?

        # The ARN of the KMS key that encrypts the guardrail.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The sensitive information policy that was configured for the guardrail.

        @[JSON::Field(key: "sensitiveInformationPolicy")]
        getter sensitive_information_policy : Types::GuardrailSensitiveInformationPolicy?

        # Appears if the status is FAILED . A list of reasons for why the guardrail failed to be created,
        # updated, versioned, or deleted.

        @[JSON::Field(key: "statusReasons")]
        getter status_reasons : Array(String)?

        # The topic policy that was configured for the guardrail.

        @[JSON::Field(key: "topicPolicy")]
        getter topic_policy : Types::GuardrailTopicPolicy?

        # The word policy that was configured for the guardrail.

        @[JSON::Field(key: "wordPolicy")]
        getter word_policy : Types::GuardrailWordPolicy?

        def initialize(
          @blocked_input_messaging : String,
          @blocked_outputs_messaging : String,
          @created_at : Time,
          @guardrail_arn : String,
          @guardrail_id : String,
          @name : String,
          @status : String,
          @updated_at : Time,
          @version : String,
          @automated_reasoning_policy : Types::GuardrailAutomatedReasoningPolicy? = nil,
          @content_policy : Types::GuardrailContentPolicy? = nil,
          @contextual_grounding_policy : Types::GuardrailContextualGroundingPolicy? = nil,
          @cross_region_details : Types::GuardrailCrossRegionDetails? = nil,
          @description : String? = nil,
          @failure_recommendations : Array(String)? = nil,
          @kms_key_arn : String? = nil,
          @sensitive_information_policy : Types::GuardrailSensitiveInformationPolicy? = nil,
          @status_reasons : Array(String)? = nil,
          @topic_policy : Types::GuardrailTopicPolicy? = nil,
          @word_policy : Types::GuardrailWordPolicy? = nil
        )
        end
      end


      struct GetImportedModelRequest
        include JSON::Serializable

        # Name or Amazon Resource Name (ARN) of the imported model.

        @[JSON::Field(key: "modelIdentifier")]
        getter model_identifier : String

        def initialize(
          @model_identifier : String
        )
        end
      end


      struct GetImportedModelResponse
        include JSON::Serializable

        # Creation time of the imported model.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Information about the hardware utilization for a single copy of the model.

        @[JSON::Field(key: "customModelUnits")]
        getter custom_model_units : Types::CustomModelUnits?

        # Specifies if the imported model supports converse.

        @[JSON::Field(key: "instructSupported")]
        getter instruct_supported : Bool?

        # Job Amazon Resource Name (ARN) associated with the imported model.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # Job name associated with the imported model.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The architecture of the imported model.

        @[JSON::Field(key: "modelArchitecture")]
        getter model_architecture : String?

        # The Amazon Resource Name (ARN) associated with this imported model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String?

        # The data source for this imported model.

        @[JSON::Field(key: "modelDataSource")]
        getter model_data_source : Types::ModelDataSource?

        # The imported model is encrypted at rest using this key.

        @[JSON::Field(key: "modelKmsKeyArn")]
        getter model_kms_key_arn : String?

        # The name of the imported model.

        @[JSON::Field(key: "modelName")]
        getter model_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @custom_model_units : Types::CustomModelUnits? = nil,
          @instruct_supported : Bool? = nil,
          @job_arn : String? = nil,
          @job_name : String? = nil,
          @model_architecture : String? = nil,
          @model_arn : String? = nil,
          @model_data_source : Types::ModelDataSource? = nil,
          @model_kms_key_arn : String? = nil,
          @model_name : String? = nil
        )
        end
      end


      struct GetInferenceProfileRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the inference profile.

        @[JSON::Field(key: "inferenceProfileIdentifier")]
        getter inference_profile_identifier : String

        def initialize(
          @inference_profile_identifier : String
        )
        end
      end


      struct GetInferenceProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the inference profile.

        @[JSON::Field(key: "inferenceProfileArn")]
        getter inference_profile_arn : String

        # The unique identifier of the inference profile.

        @[JSON::Field(key: "inferenceProfileId")]
        getter inference_profile_id : String

        # The name of the inference profile.

        @[JSON::Field(key: "inferenceProfileName")]
        getter inference_profile_name : String

        # A list of information about each model in the inference profile.

        @[JSON::Field(key: "models")]
        getter models : Array(Types::InferenceProfileModel)

        # The status of the inference profile. ACTIVE means that the inference profile is ready to be used.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the inference profile. The following types are possible: SYSTEM_DEFINED – The inference
        # profile is defined by Amazon Bedrock. You can route inference requests across regions with these
        # inference profiles. APPLICATION – The inference profile was created by a user. This type of
        # inference profile can track metrics and costs when invoking the model in it. The inference profile
        # may route requests to one or multiple regions.

        @[JSON::Field(key: "type")]
        getter type : String

        # The time at which the inference profile was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the inference profile.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time at which the inference profile was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @inference_profile_arn : String,
          @inference_profile_id : String,
          @inference_profile_name : String,
          @models : Array(Types::InferenceProfileModel),
          @status : String,
          @type : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetMarketplaceModelEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint you want to get information about.

        @[JSON::Field(key: "endpointArn")]
        getter endpoint_arn : String

        def initialize(
          @endpoint_arn : String
        )
        end
      end


      struct GetMarketplaceModelEndpointResponse
        include JSON::Serializable

        # Details about the requested endpoint.

        @[JSON::Field(key: "marketplaceModelEndpoint")]
        getter marketplace_model_endpoint : Types::MarketplaceModelEndpoint?

        def initialize(
          @marketplace_model_endpoint : Types::MarketplaceModelEndpoint? = nil
        )
        end
      end


      struct GetModelCopyJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the model copy job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        def initialize(
          @job_arn : String
        )
        end
      end


      struct GetModelCopyJobResponse
        include JSON::Serializable

        # The time at which the model copy job was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the model copy job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The unique identifier of the account that the model being copied originated from.

        @[JSON::Field(key: "sourceAccountId")]
        getter source_account_id : String

        # The Amazon Resource Name (ARN) of the original model being copied.

        @[JSON::Field(key: "sourceModelArn")]
        getter source_model_arn : String

        # The status of the model copy job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the copied model.

        @[JSON::Field(key: "targetModelArn")]
        getter target_model_arn : String

        # An error message for why the model copy job failed.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The name of the original model being copied.

        @[JSON::Field(key: "sourceModelName")]
        getter source_model_name : String?

        # The Amazon Resource Name (ARN) of the KMS key encrypting the copied model.

        @[JSON::Field(key: "targetModelKmsKeyArn")]
        getter target_model_kms_key_arn : String?

        # The name of the copied model.

        @[JSON::Field(key: "targetModelName")]
        getter target_model_name : String?

        # The tags associated with the copied model.

        @[JSON::Field(key: "targetModelTags")]
        getter target_model_tags : Array(Types::Tag)?

        def initialize(
          @creation_time : Time,
          @job_arn : String,
          @source_account_id : String,
          @source_model_arn : String,
          @status : String,
          @target_model_arn : String,
          @failure_message : String? = nil,
          @source_model_name : String? = nil,
          @target_model_kms_key_arn : String? = nil,
          @target_model_name : String? = nil,
          @target_model_tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct GetModelCustomizationJobRequest
        include JSON::Serializable

        # Identifier for the customization job.

        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        def initialize(
          @job_identifier : String
        )
        end
      end


      struct GetModelCustomizationJobResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the base model.

        @[JSON::Field(key: "baseModelArn")]
        getter base_model_arn : String

        # Time that the resource was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the customization job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The name of the customization job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # Output data configuration

        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # The name of the output model.

        @[JSON::Field(key: "outputModelName")]
        getter output_model_name : String

        # The Amazon Resource Name (ARN) of the IAM role.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Contains information about the training dataset.

        @[JSON::Field(key: "trainingDataConfig")]
        getter training_data_config : Types::TrainingDataConfig

        # Contains information about the validation dataset.

        @[JSON::Field(key: "validationDataConfig")]
        getter validation_data_config : Types::ValidationDataConfig

        # The token that you specified in the CreateCustomizationJob request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The customization configuration for the model customization job.

        @[JSON::Field(key: "customizationConfig")]
        getter customization_config : Types::CustomizationConfig?

        # The type of model customization.

        @[JSON::Field(key: "customizationType")]
        getter customization_type : String?

        # Time that the resource transitioned to terminal state.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Information about why the job failed.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The hyperparameter values for the job. For details on the format for different models, see Custom
        # model hyperparameters .

        @[JSON::Field(key: "hyperParameters")]
        getter hyper_parameters : Hash(String, String)?

        # Time that the resource was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The Amazon Resource Name (ARN) of the output model.

        @[JSON::Field(key: "outputModelArn")]
        getter output_model_arn : String?

        # The custom model is encrypted at rest using this key.

        @[JSON::Field(key: "outputModelKmsKeyArn")]
        getter output_model_kms_key_arn : String?

        # The status of the job. A successful job transitions from in-progress to completed when the output
        # model is ready to use. If the job failed, the failure message contains information about why the job
        # failed.

        @[JSON::Field(key: "status")]
        getter status : String?

        # For a Distillation job, the details about the statuses of the sub-tasks of the customization job.

        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        # Contains training metrics from the job creation.

        @[JSON::Field(key: "trainingMetrics")]
        getter training_metrics : Types::TrainingMetrics?

        # The loss metric for each validator that you provided in the createjob request.

        @[JSON::Field(key: "validationMetrics")]
        getter validation_metrics : Array(Types::ValidatorMetric)?

        # VPC configuration for the custom model job.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @base_model_arn : String,
          @creation_time : Time,
          @job_arn : String,
          @job_name : String,
          @output_data_config : Types::OutputDataConfig,
          @output_model_name : String,
          @role_arn : String,
          @training_data_config : Types::TrainingDataConfig,
          @validation_data_config : Types::ValidationDataConfig,
          @client_request_token : String? = nil,
          @customization_config : Types::CustomizationConfig? = nil,
          @customization_type : String? = nil,
          @end_time : Time? = nil,
          @failure_message : String? = nil,
          @hyper_parameters : Hash(String, String)? = nil,
          @last_modified_time : Time? = nil,
          @output_model_arn : String? = nil,
          @output_model_kms_key_arn : String? = nil,
          @status : String? = nil,
          @status_details : Types::StatusDetails? = nil,
          @training_metrics : Types::TrainingMetrics? = nil,
          @validation_metrics : Array(Types::ValidatorMetric)? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct GetModelImportJobRequest
        include JSON::Serializable

        # The identifier of the import job.

        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        def initialize(
          @job_identifier : String
        )
        end
      end


      struct GetModelImportJobResponse
        include JSON::Serializable

        # The time the resource was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # Time that the resource transitioned to terminal state.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Information about why the import job failed.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The Amazon Resource Name (ARN) of the imported model.

        @[JSON::Field(key: "importedModelArn")]
        getter imported_model_arn : String?

        # The imported model is encrypted at rest using this key.

        @[JSON::Field(key: "importedModelKmsKeyArn")]
        getter imported_model_kms_key_arn : String?

        # The name of the imported model.

        @[JSON::Field(key: "importedModelName")]
        getter imported_model_name : String?

        # The Amazon Resource Name (ARN) of the import job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # The name of the import job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # Time the resource was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The data source for the imported model.

        @[JSON::Field(key: "modelDataSource")]
        getter model_data_source : Types::ModelDataSource?

        # The Amazon Resource Name (ARN) of the IAM role associated with this job.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the job. A successful job transitions from in-progress to completed when the imported
        # model is ready to use. If the job failed, the failure message contains information about why the job
        # failed.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Virtual Private Cloud (VPC) configuration of the import model job.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @creation_time : Time? = nil,
          @end_time : Time? = nil,
          @failure_message : String? = nil,
          @imported_model_arn : String? = nil,
          @imported_model_kms_key_arn : String? = nil,
          @imported_model_name : String? = nil,
          @job_arn : String? = nil,
          @job_name : String? = nil,
          @last_modified_time : Time? = nil,
          @model_data_source : Types::ModelDataSource? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct GetModelInvocationJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the batch inference job.

        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        def initialize(
          @job_identifier : String
        )
        end
      end


      struct GetModelInvocationJobResponse
        include JSON::Serializable

        # Details about the location of the input to the batch inference job.

        @[JSON::Field(key: "inputDataConfig")]
        getter input_data_config : Types::ModelInvocationJobInputDataConfig

        # The Amazon Resource Name (ARN) of the batch inference job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The unique identifier of the foundation model used for model inference.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Details about the location of the output of the batch inference job.

        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::ModelInvocationJobOutputDataConfig

        # The Amazon Resource Name (ARN) of the service role with permissions to carry out and manage batch
        # inference. You can use the console to create a default service role or follow the steps at Create a
        # service role for batch inference .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The time at which the batch inference job was submitted.

        @[JSON::Field(key: "submitTime")]
        getter submit_time : Time

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The time at which the batch inference job ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The time at which the batch inference job times or timed out.

        @[JSON::Field(key: "jobExpirationTime")]
        getter job_expiration_time : Time?

        # The name of the batch inference job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The time at which the batch inference job was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # If the batch inference job failed, this field contains a message describing why the job failed.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The status of the batch inference job. The following statuses are possible: Submitted – This job has
        # been submitted to a queue for validation. Validating – This job is being validated for the
        # requirements described in Format and upload your batch inference data . The criteria include the
        # following: Your IAM service role has access to the Amazon S3 buckets containing your files. Your
        # files are .jsonl files and each individual record is a JSON object in the correct format. Note that
        # validation doesn't check if the modelInput value matches the request body for the model. Your files
        # fulfill the requirements for file size and number of records. For more information, see Quotas for
        # Amazon Bedrock . Scheduled – This job has been validated and is now in a queue. The job will
        # automatically start when it reaches its turn. Expired – This job timed out because it was scheduled
        # but didn't begin before the set timeout duration. Submit a new job request. InProgress – This job
        # has begun. You can start viewing the results in the output S3 location. Completed – This job has
        # successfully completed. View the output files in the output S3 location. PartiallyCompleted – This
        # job has partially completed. Not all of your records could be processed in time. View the output
        # files in the output S3 location. Failed – This job has failed. Check the failure message for any
        # further details. For further assistance, reach out to the Amazon Web Services Support Center .
        # Stopped – This job was stopped by a user. Stopping – This job is being stopped by a user.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The number of hours after which batch inference job was set to time out.

        @[JSON::Field(key: "timeoutDurationInHours")]
        getter timeout_duration_in_hours : Int32?

        # The configuration of the Virtual Private Cloud (VPC) for the data in the batch inference job. For
        # more information, see Protect batch inference jobs using a VPC .

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @input_data_config : Types::ModelInvocationJobInputDataConfig,
          @job_arn : String,
          @model_id : String,
          @output_data_config : Types::ModelInvocationJobOutputDataConfig,
          @role_arn : String,
          @submit_time : Time,
          @client_request_token : String? = nil,
          @end_time : Time? = nil,
          @job_expiration_time : Time? = nil,
          @job_name : String? = nil,
          @last_modified_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @timeout_duration_in_hours : Int32? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end


      struct GetModelInvocationLoggingConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetModelInvocationLoggingConfigurationResponse
        include JSON::Serializable

        # The current configuration values.

        @[JSON::Field(key: "loggingConfig")]
        getter logging_config : Types::LoggingConfig?

        def initialize(
          @logging_config : Types::LoggingConfig? = nil
        )
        end
      end


      struct GetPromptRouterRequest
        include JSON::Serializable

        # The prompt router's ARN

        @[JSON::Field(key: "promptRouterArn")]
        getter prompt_router_arn : String

        def initialize(
          @prompt_router_arn : String
        )
        end
      end


      struct GetPromptRouterResponse
        include JSON::Serializable

        # The router's fallback model.

        @[JSON::Field(key: "fallbackModel")]
        getter fallback_model : Types::PromptRouterTargetModel

        # The router's models.

        @[JSON::Field(key: "models")]
        getter models : Array(Types::PromptRouterTargetModel)

        # The prompt router's ARN

        @[JSON::Field(key: "promptRouterArn")]
        getter prompt_router_arn : String

        # The router's name.

        @[JSON::Field(key: "promptRouterName")]
        getter prompt_router_name : String

        # The router's routing criteria.

        @[JSON::Field(key: "routingCriteria")]
        getter routing_criteria : Types::RoutingCriteria

        # The router's status.

        @[JSON::Field(key: "status")]
        getter status : String

        # The router's type.

        @[JSON::Field(key: "type")]
        getter type : String

        # When the router was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The router's description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # When the router was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @fallback_model : Types::PromptRouterTargetModel,
          @models : Array(Types::PromptRouterTargetModel),
          @prompt_router_arn : String,
          @prompt_router_name : String,
          @routing_criteria : Types::RoutingCriteria,
          @status : String,
          @type : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetProvisionedModelThroughputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or name of the Provisioned Throughput.

        @[JSON::Field(key: "provisionedModelId")]
        getter provisioned_model_id : String

        def initialize(
          @provisioned_model_id : String
        )
        end
      end


      struct GetProvisionedModelThroughputResponse
        include JSON::Serializable

        # The timestamp of the creation time for this Provisioned Throughput.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the model requested to be associated to this Provisioned
        # Throughput. This value differs from the modelArn if updating hasn't completed.

        @[JSON::Field(key: "desiredModelArn")]
        getter desired_model_arn : String

        # The number of model units that was requested for this Provisioned Throughput.

        @[JSON::Field(key: "desiredModelUnits")]
        getter desired_model_units : Int32

        # The Amazon Resource Name (ARN) of the base model for which the Provisioned Throughput was created,
        # or of the base model that the custom model for which the Provisioned Throughput was created was
        # customized.

        @[JSON::Field(key: "foundationModelArn")]
        getter foundation_model_arn : String

        # The timestamp of the last time that this Provisioned Throughput was modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The Amazon Resource Name (ARN) of the model associated with this Provisioned Throughput.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The number of model units allocated to this Provisioned Throughput.

        @[JSON::Field(key: "modelUnits")]
        getter model_units : Int32

        # The Amazon Resource Name (ARN) of the Provisioned Throughput.

        @[JSON::Field(key: "provisionedModelArn")]
        getter provisioned_model_arn : String

        # The name of the Provisioned Throughput.

        @[JSON::Field(key: "provisionedModelName")]
        getter provisioned_model_name : String

        # The status of the Provisioned Throughput.

        @[JSON::Field(key: "status")]
        getter status : String

        # Commitment duration of the Provisioned Throughput.

        @[JSON::Field(key: "commitmentDuration")]
        getter commitment_duration : String?

        # The timestamp for when the commitment term for the Provisioned Throughput expires.

        @[JSON::Field(key: "commitmentExpirationTime")]
        getter commitment_expiration_time : Time?

        # A failure message for any issues that occurred during creation, updating, or deletion of the
        # Provisioned Throughput.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        def initialize(
          @creation_time : Time,
          @desired_model_arn : String,
          @desired_model_units : Int32,
          @foundation_model_arn : String,
          @last_modified_time : Time,
          @model_arn : String,
          @model_units : Int32,
          @provisioned_model_arn : String,
          @provisioned_model_name : String,
          @status : String,
          @commitment_duration : String? = nil,
          @commitment_expiration_time : Time? = nil,
          @failure_message : String? = nil
        )
        end
      end


      struct GetUseCaseForModelAccessRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetUseCaseForModelAccessResponse
        include JSON::Serializable

        # Get customer profile Response.

        @[JSON::Field(key: "formData")]
        getter form_data : Bytes

        def initialize(
          @form_data : Bytes
        )
        end
      end

      # Configuration for the grader used in reinforcement fine-tuning to evaluate model responses and
      # provide reward signals.

      struct GraderConfig
        include JSON::Serializable

        # Configuration for using an AWS Lambda function as the grader for evaluating model responses and
        # provide reward signals in reinforcement fine-tuning.

        @[JSON::Field(key: "lambdaGrader")]
        getter lambda_grader : Types::LambdaGraderConfig?

        def initialize(
          @lambda_grader : Types::LambdaGraderConfig? = nil
        )
        end
      end

      # Represents the configuration of Automated Reasoning policies within a Amazon Bedrock Guardrail,
      # including the policies to apply and confidence thresholds.

      struct GuardrailAutomatedReasoningPolicy
        include JSON::Serializable

        # The list of Automated Reasoning policy ARNs that should be applied as part of this guardrail
        # configuration.

        @[JSON::Field(key: "policies")]
        getter policies : Array(String)

        # The minimum confidence level required for Automated Reasoning policy violations to trigger guardrail
        # actions. Values range from 0.0 to 1.0.

        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : Float64?

        def initialize(
          @policies : Array(String),
          @confidence_threshold : Float64? = nil
        )
        end
      end

      # Configuration settings for integrating Automated Reasoning policies with Amazon Bedrock Guardrails.

      struct GuardrailAutomatedReasoningPolicyConfig
        include JSON::Serializable

        # The list of Automated Reasoning policy ARNs to include in the guardrail configuration.

        @[JSON::Field(key: "policies")]
        getter policies : Array(String)

        # The confidence threshold for triggering guardrail actions based on Automated Reasoning policy
        # violations.

        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : Float64?

        def initialize(
          @policies : Array(String),
          @confidence_threshold : Float64? = nil
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

      # Contains filter strengths for harmful content. Guardrails support the following content filters to
      # detect and filter harmful user inputs and FM-generated outputs. Hate – Describes language or a
      # statement that discriminates, criticizes, insults, denounces, or dehumanizes a person or group on
      # the basis of an identity (such as race, ethnicity, gender, religion, sexual orientation, ability,
      # and national origin). Insults – Describes language or a statement that includes demeaning,
      # humiliating, mocking, insulting, or belittling language. This type of language is also labeled as
      # bullying. Sexual – Describes language or a statement that indicates sexual interest, activity, or
      # arousal using direct or indirect references to body parts, physical traits, or sex. Violence –
      # Describes language or a statement that includes glorification of or threats to inflict physical
      # pain, hurt, or injury toward a person, group or thing. Content filtering depends on the confidence
      # classification of user inputs and FM responses across each of the four harmful categories. All input
      # and output statements are classified into one of four confidence levels (NONE, LOW, MEDIUM, HIGH)
      # for each harmful category. For example, if a statement is classified as Hate with HIGH confidence,
      # the likelihood of the statement representing hateful content is high. A single statement can be
      # classified across multiple categories with varying confidence levels. For example, a single
      # statement can be classified as Hate with HIGH confidence, Insults with LOW confidence, Sexual with
      # NONE confidence, and Violence with MEDIUM confidence. For more information, see Guardrails content
      # filters . This data type is used in the following API operations: GetGuardrail response body

      struct GuardrailContentFilter
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

        # The action to take when harmful content is detected in the input. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Indicates whether guardrail evaluation is enabled on the input. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # The input modalities selected for the guardrail content filter.

        @[JSON::Field(key: "inputModalities")]
        getter input_modalities : Array(String)?

        # The action to take when harmful content is detected in the output. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Indicates whether guardrail evaluation is enabled on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        # The output modalities selected for the guardrail content filter.

        @[JSON::Field(key: "outputModalities")]
        getter output_modalities : Array(String)?

        def initialize(
          @input_strength : String,
          @output_strength : String,
          @type : String,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @input_modalities : Array(String)? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil,
          @output_modalities : Array(String)? = nil
        )
        end
      end

      # Contains filter strengths for harmful content. Guardrails support the following content filters to
      # detect and filter harmful user inputs and FM-generated outputs. Hate – Describes language or a
      # statement that discriminates, criticizes, insults, denounces, or dehumanizes a person or group on
      # the basis of an identity (such as race, ethnicity, gender, religion, sexual orientation, ability,
      # and national origin). Insults – Describes language or a statement that includes demeaning,
      # humiliating, mocking, insulting, or belittling language. This type of language is also labeled as
      # bullying. Sexual – Describes language or a statement that indicates sexual interest, activity, or
      # arousal using direct or indirect references to body parts, physical traits, or sex. Violence –
      # Describes language or a statement that includes glorification of or threats to inflict physical
      # pain, hurt, or injury toward a person, group or thing. Content filtering depends on the confidence
      # classification of user inputs and FM responses across each of the four harmful categories. All input
      # and output statements are classified into one of four confidence levels (NONE, LOW, MEDIUM, HIGH)
      # for each harmful category. For example, if a statement is classified as Hate with HIGH confidence,
      # the likelihood of the statement representing hateful content is high. A single statement can be
      # classified across multiple categories with varying confidence levels. For example, a single
      # statement can be classified as Hate with HIGH confidence, Insults with LOW confidence, Sexual with
      # NONE confidence, and Violence with MEDIUM confidence. For more information, see Guardrails content
      # filters .

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

        # Specifies the action to take when harmful content is detected. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Specifies whether to enable guardrail evaluation on the input. When disabled, you aren't charged for
        # the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # The input modalities selected for the guardrail content filter configuration.

        @[JSON::Field(key: "inputModalities")]
        getter input_modalities : Array(String)?

        # Specifies the action to take when harmful content is detected in the output. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but
        # return detection information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Specifies whether to enable guardrail evaluation on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        # The output modalities selected for the guardrail content filter configuration.

        @[JSON::Field(key: "outputModalities")]
        getter output_modalities : Array(String)?

        def initialize(
          @input_strength : String,
          @output_strength : String,
          @type : String,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @input_modalities : Array(String)? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil,
          @output_modalities : Array(String)? = nil
        )
        end
      end

      # The tier that your guardrail uses for content filters.

      struct GuardrailContentFiltersTier
        include JSON::Serializable

        # The tier that your guardrail uses for content filters. Valid values include: CLASSIC tier – Provides
        # established guardrails functionality supporting English, French, and Spanish languages. STANDARD
        # tier – Provides a more robust solution than the CLASSIC tier and has more comprehensive language
        # support. This tier requires that your guardrail use cross-Region inference .

        @[JSON::Field(key: "tierName")]
        getter tier_name : String

        def initialize(
          @tier_name : String
        )
        end
      end

      # The tier that your guardrail uses for content filters. Consider using a tier that balances
      # performance, accuracy, and compatibility with your existing generative AI workflows.

      struct GuardrailContentFiltersTierConfig
        include JSON::Serializable

        # The tier that your guardrail uses for content filters. Valid values include: CLASSIC tier – Provides
        # established guardrails functionality supporting English, French, and Spanish languages. STANDARD
        # tier – Provides a more robust solution than the CLASSIC tier and has more comprehensive language
        # support. This tier requires that your guardrail use cross-Region inference .

        @[JSON::Field(key: "tierName")]
        getter tier_name : String

        def initialize(
          @tier_name : String
        )
        end
      end

      # Contains details about how to handle harmful content. This data type is used in the following API
      # operations: GetGuardrail response body

      struct GuardrailContentPolicy
        include JSON::Serializable

        # Contains the type of the content filter and how strongly it should apply to prompts and model
        # responses.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::GuardrailContentFilter)?

        # The tier that your guardrail uses for content filters.

        @[JSON::Field(key: "tier")]
        getter tier : Types::GuardrailContentFiltersTier?

        def initialize(
          @filters : Array(Types::GuardrailContentFilter)? = nil,
          @tier : Types::GuardrailContentFiltersTier? = nil
        )
        end
      end

      # Contains details about how to handle harmful content.

      struct GuardrailContentPolicyConfig
        include JSON::Serializable

        # Contains the type of the content filter and how strongly it should apply to prompts and model
        # responses.

        @[JSON::Field(key: "filtersConfig")]
        getter filters_config : Array(Types::GuardrailContentFilterConfig)

        # The tier that your guardrail uses for content filters.

        @[JSON::Field(key: "tierConfig")]
        getter tier_config : Types::GuardrailContentFiltersTierConfig?

        def initialize(
          @filters_config : Array(Types::GuardrailContentFilterConfig),
          @tier_config : Types::GuardrailContentFiltersTierConfig? = nil
        )
        end
      end

      # The details for the guardrails contextual grounding filter.

      struct GuardrailContextualGroundingFilter
        include JSON::Serializable

        # The threshold details for the guardrails contextual grounding filter.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64

        # The filter type details for the guardrails contextual grounding filter.

        @[JSON::Field(key: "type")]
        getter type : String

        # The action to take when content fails the contextual grounding evaluation. Supported values include:
        # BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but return
        # detection information in the trace response.

        @[JSON::Field(key: "action")]
        getter action : String?

        # Indicates whether contextual grounding is enabled for evaluation. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @threshold : Float64,
          @type : String,
          @action : String? = nil,
          @enabled : Bool? = nil
        )
        end
      end

      # The filter configuration details for the guardrails contextual grounding filter.

      struct GuardrailContextualGroundingFilterConfig
        include JSON::Serializable

        # The threshold details for the guardrails contextual grounding filter.

        @[JSON::Field(key: "threshold")]
        getter threshold : Float64

        # The filter details for the guardrails contextual grounding filter.

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies the action to take when content fails the contextual grounding evaluation. Supported
        # values include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no
        # action but return detection information in the trace response.

        @[JSON::Field(key: "action")]
        getter action : String?

        # Specifies whether to enable contextual grounding evaluation. When disabled, you aren't charged for
        # the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @threshold : Float64,
          @type : String,
          @action : String? = nil,
          @enabled : Bool? = nil
        )
        end
      end

      # The details for the guardrails contextual grounding policy.

      struct GuardrailContextualGroundingPolicy
        include JSON::Serializable

        # The filter details for the guardrails contextual grounding policy.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::GuardrailContextualGroundingFilter)

        def initialize(
          @filters : Array(Types::GuardrailContextualGroundingFilter)
        )
        end
      end

      # The policy configuration details for the guardrails contextual grounding policy.

      struct GuardrailContextualGroundingPolicyConfig
        include JSON::Serializable

        # The filter configuration details for the guardrails contextual grounding policy.

        @[JSON::Field(key: "filtersConfig")]
        getter filters_config : Array(Types::GuardrailContextualGroundingFilterConfig)

        def initialize(
          @filters_config : Array(Types::GuardrailContextualGroundingFilterConfig)
        )
        end
      end

      # The system-defined guardrail profile that you're using with your guardrail. Guardrail profiles
      # define the destination Amazon Web Services Regions where guardrail inference requests can be
      # automatically routed. Using guardrail profiles helps maintain guardrail performance and reliability
      # when demand increases. For more information, see the Amazon Bedrock User Guide .

      struct GuardrailCrossRegionConfig
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the guardrail profile that your guardrail is using.
        # Guardrail profile availability depends on your current Amazon Web Services Region. For more
        # information, see the Amazon Bedrock User Guide .

        @[JSON::Field(key: "guardrailProfileIdentifier")]
        getter guardrail_profile_identifier : String

        def initialize(
          @guardrail_profile_identifier : String
        )
        end
      end

      # Contains details about the system-defined guardrail profile that you're using with your guardrail
      # for cross-Region inference. For more information, see the Amazon Bedrock User Guide .

      struct GuardrailCrossRegionDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the guardrail profile that you're using with your guardrail.

        @[JSON::Field(key: "guardrailProfileArn")]
        getter guardrail_profile_arn : String?

        # The ID of the guardrail profile that your guardrail is using. Profile availability depends on your
        # current Amazon Web Services Region. For more information, see the Amazon Bedrock User Guide .

        @[JSON::Field(key: "guardrailProfileId")]
        getter guardrail_profile_id : String?

        def initialize(
          @guardrail_profile_arn : String? = nil,
          @guardrail_profile_id : String? = nil
        )
        end
      end

      # The managed word list that was configured for the guardrail. (This is a list of words that are
      # pre-defined and managed by guardrails only.)

      struct GuardrailManagedWords
        include JSON::Serializable

        # ManagedWords$type The managed word type that was configured for the guardrail. (For now, we only
        # offer profanity word list)

        @[JSON::Field(key: "type")]
        getter type : String

        # The action to take when harmful content is detected in the input. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Indicates whether guardrail evaluation is enabled on the input. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # The action to take when harmful content is detected in the output. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Indicates whether guardrail evaluation is enabled on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        def initialize(
          @type : String,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil
        )
        end
      end

      # The managed word list to configure for the guardrail.

      struct GuardrailManagedWordsConfig
        include JSON::Serializable

        # The managed word type to configure for the guardrail.

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies the action to take when harmful content is detected in the input. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but
        # return detection information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Specifies whether to enable guardrail evaluation on the input. When disabled, you aren't charged for
        # the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # Specifies the action to take when harmful content is detected in the output. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but
        # return detection information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Specifies whether to enable guardrail evaluation on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        def initialize(
          @type : String,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil
        )
        end
      end

      # The PII entity configured for the guardrail.

      struct GuardrailPiiEntity
        include JSON::Serializable

        # The configured guardrail action when PII entity is detected.

        @[JSON::Field(key: "action")]
        getter action : String

        # The type of PII entity. For example, Social Security Number.

        @[JSON::Field(key: "type")]
        getter type : String

        # The action to take when harmful content is detected in the input. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. ANONYMIZE – Mask the content and replace it
        # with identifier tags. NONE – Take no action but return detection information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Indicates whether guardrail evaluation is enabled on the input. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # The action to take when harmful content is detected in the output. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. ANONYMIZE – Mask the content and replace it
        # with identifier tags. NONE – Take no action but return detection information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Indicates whether guardrail evaluation is enabled on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        def initialize(
          @action : String,
          @type : String,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil
        )
        end
      end

      # The PII entity to configure for the guardrail.

      struct GuardrailPiiEntityConfig
        include JSON::Serializable

        # Configure guardrail action when the PII entity is detected.

        @[JSON::Field(key: "action")]
        getter action : String

        # Configure guardrail type when the PII entity is detected. The following PIIs are used to block or
        # mask sensitive information: General ADDRESS A physical address, such as "100 Main Street, Anytown,
        # USA" or "Suite #12, Building 123". An address can include information such as the street, building,
        # location, city, state, country, county, zip code, precinct, and neighborhood. AGE An individual's
        # age, including the quantity and unit of time. For example, in the phrase "I am 40 years old,"
        # Guardrails recognizes "40 years" as an age. NAME An individual's name. This entity type does not
        # include titles, such as Dr., Mr., Mrs., or Miss. guardrails doesn't apply this entity type to names
        # that are part of organizations or addresses. For example, guardrails recognizes the "John Doe
        # Organization" as an organization, and it recognizes "Jane Doe Street" as an address. EMAIL An email
        # address, such as marymajor@email.com . PHONE A phone number. This entity type also includes fax and
        # pager numbers. USERNAME A user name that identifies an account, such as a login name, screen name,
        # nick name, or handle. PASSWORD An alphanumeric string that is used as a password, such as "*
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
        # card. This number is usually four digits long and is often formatted as month/year or MM/YY .
        # Guardrails recognizes expiration dates such as 01/21 , 01/2021 , and Jan 2021 .
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
        # number, such as 485 777 3456 . The current system formats the 10-digit number with spaces after the
        # third and sixth digits. The final digit is an error-detecting checksum. UK_NATIONAL_INSURANCE_NUMBER
        # A UK National Insurance Number (NINO) provides individuals with access to National Insurance (social
        # security) benefits. It is also used for some purposes in the UK tax system. The number is nine
        # digits long and starts with two letters, followed by six numbers and one letter. A NINO can be
        # formatted with a space or a dash after the two letters and after the second, forth, and sixth
        # digits. UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER A UK Unique Taxpayer Reference (UTR) is a 10-digit
        # number that identifies a taxpayer or a business. Custom Regex filter - You can use a regular
        # expressions to define patterns for a guardrail to recognize and act upon such as serial number,
        # booking ID etc..

        @[JSON::Field(key: "type")]
        getter type : String

        # Specifies the action to take when harmful content is detected in the input. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. ANONYMIZE – Mask the
        # content and replace it with identifier tags. NONE – Take no action but return detection information
        # in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Specifies whether to enable guardrail evaluation on the input. When disabled, you aren't charged for
        # the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # Specifies the action to take when harmful content is detected in the output. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. ANONYMIZE – Mask the
        # content and replace it with identifier tags. NONE – Take no action but return detection information
        # in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Specifies whether to enable guardrail evaluation on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        def initialize(
          @action : String,
          @type : String,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil
        )
        end
      end

      # The regular expression configured for the guardrail.

      struct GuardrailRegex
        include JSON::Serializable

        # The action taken when a match to the regular expression is detected.

        @[JSON::Field(key: "action")]
        getter action : String

        # The name of the regular expression for the guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # The pattern of the regular expression configured for the guardrail.

        @[JSON::Field(key: "pattern")]
        getter pattern : String

        # The description of the regular expression for the guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The action to take when harmful content is detected in the input. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Indicates whether guardrail evaluation is enabled on the input. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # The action to take when harmful content is detected in the output. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Indicates whether guardrail evaluation is enabled on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        def initialize(
          @action : String,
          @name : String,
          @pattern : String,
          @description : String? = nil,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil
        )
        end
      end

      # The regular expression to configure for the guardrail.

      struct GuardrailRegexConfig
        include JSON::Serializable

        # The guardrail action to configure when matching regular expression is detected.

        @[JSON::Field(key: "action")]
        getter action : String

        # The name of the regular expression to configure for the guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # The regular expression pattern to configure for the guardrail.

        @[JSON::Field(key: "pattern")]
        getter pattern : String

        # The description of the regular expression to configure for the guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the action to take when harmful content is detected in the input. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but
        # return detection information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Specifies whether to enable guardrail evaluation on the input. When disabled, you aren't charged for
        # the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # Specifies the action to take when harmful content is detected in the output. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but
        # return detection information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Specifies whether to enable guardrail evaluation on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        def initialize(
          @action : String,
          @name : String,
          @pattern : String,
          @description : String? = nil,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil
        )
        end
      end

      # Contains details about PII entities and regular expressions configured for the guardrail.

      struct GuardrailSensitiveInformationPolicy
        include JSON::Serializable

        # The list of PII entities configured for the guardrail.

        @[JSON::Field(key: "piiEntities")]
        getter pii_entities : Array(Types::GuardrailPiiEntity)?

        # The list of regular expressions configured for the guardrail.

        @[JSON::Field(key: "regexes")]
        getter regexes : Array(Types::GuardrailRegex)?

        def initialize(
          @pii_entities : Array(Types::GuardrailPiiEntity)? = nil,
          @regexes : Array(Types::GuardrailRegex)? = nil
        )
        end
      end

      # Contains details about PII entities and regular expressions to configure for the guardrail.

      struct GuardrailSensitiveInformationPolicyConfig
        include JSON::Serializable

        # A list of PII entities to configure to the guardrail.

        @[JSON::Field(key: "piiEntitiesConfig")]
        getter pii_entities_config : Array(Types::GuardrailPiiEntityConfig)?

        # A list of regular expressions to configure to the guardrail.

        @[JSON::Field(key: "regexesConfig")]
        getter regexes_config : Array(Types::GuardrailRegexConfig)?

        def initialize(
          @pii_entities_config : Array(Types::GuardrailPiiEntityConfig)? = nil,
          @regexes_config : Array(Types::GuardrailRegexConfig)? = nil
        )
        end
      end

      # Contains details about a guardrail. This data type is used in the following API operations:
      # ListGuardrails response body

      struct GuardrailSummary
        include JSON::Serializable

        # The ARN of the guardrail.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time at which the guardrail was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the guardrail.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the guardrail.

        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time at which the guardrail was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the guardrail.

        @[JSON::Field(key: "version")]
        getter version : String

        # Details about the system-defined guardrail profile that you're using with your guardrail, including
        # the guardrail profile ID and Amazon Resource Name (ARN).

        @[JSON::Field(key: "crossRegionDetails")]
        getter cross_region_details : Types::GuardrailCrossRegionDetails?

        # A description of the guardrail.

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
          @cross_region_details : Types::GuardrailCrossRegionDetails? = nil,
          @description : String? = nil
        )
        end
      end

      # Details about topics for the guardrail to identify and deny. This data type is used in the following
      # API operations: GetGuardrail response body

      struct GuardrailTopic
        include JSON::Serializable

        # A definition of the topic to deny.

        @[JSON::Field(key: "definition")]
        getter definition : String

        # The name of the topic to deny.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of prompts, each of which is an example of a prompt that can be categorized as belonging to
        # the topic.

        @[JSON::Field(key: "examples")]
        getter examples : Array(String)?

        # The action to take when harmful content is detected in the input. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Indicates whether guardrail evaluation is enabled on the input. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # The action to take when harmful content is detected in the output. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Indicates whether guardrail evaluation is enabled on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        # Specifies to deny the topic.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @definition : String,
          @name : String,
          @examples : Array(String)? = nil,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil,
          @type : String? = nil
        )
        end
      end

      # Details about topics for the guardrail to identify and deny.

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

        # Specifies the action to take when harmful content is detected in the input. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but
        # return detection information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Specifies whether to enable guardrail evaluation on the input. When disabled, you aren't charged for
        # the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # Specifies the action to take when harmful content is detected in the output. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but
        # return detection information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Specifies whether to enable guardrail evaluation on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        def initialize(
          @definition : String,
          @name : String,
          @type : String,
          @examples : Array(String)? = nil,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil
        )
        end
      end

      # Contains details about topics that the guardrail should identify and deny. This data type is used in
      # the following API operations: GetGuardrail response body

      struct GuardrailTopicPolicy
        include JSON::Serializable

        # A list of policies related to topics that the guardrail should deny.

        @[JSON::Field(key: "topics")]
        getter topics : Array(Types::GuardrailTopic)

        # The tier that your guardrail uses for denied topic filters.

        @[JSON::Field(key: "tier")]
        getter tier : Types::GuardrailTopicsTier?

        def initialize(
          @topics : Array(Types::GuardrailTopic),
          @tier : Types::GuardrailTopicsTier? = nil
        )
        end
      end

      # Contains details about topics that the guardrail should identify and deny.

      struct GuardrailTopicPolicyConfig
        include JSON::Serializable

        # A list of policies related to topics that the guardrail should deny.

        @[JSON::Field(key: "topicsConfig")]
        getter topics_config : Array(Types::GuardrailTopicConfig)

        # The tier that your guardrail uses for denied topic filters.

        @[JSON::Field(key: "tierConfig")]
        getter tier_config : Types::GuardrailTopicsTierConfig?

        def initialize(
          @topics_config : Array(Types::GuardrailTopicConfig),
          @tier_config : Types::GuardrailTopicsTierConfig? = nil
        )
        end
      end

      # The tier that your guardrail uses for denied topic filters.

      struct GuardrailTopicsTier
        include JSON::Serializable

        # The tier that your guardrail uses for denied topic filters. Valid values include: CLASSIC tier –
        # Provides established guardrails functionality supporting English, French, and Spanish languages.
        # STANDARD tier – Provides a more robust solution than the CLASSIC tier and has more comprehensive
        # language support. This tier requires that your guardrail use cross-Region inference .

        @[JSON::Field(key: "tierName")]
        getter tier_name : String

        def initialize(
          @tier_name : String
        )
        end
      end

      # The tier that your guardrail uses for denied topic filters. Consider using a tier that balances
      # performance, accuracy, and compatibility with your existing generative AI workflows.

      struct GuardrailTopicsTierConfig
        include JSON::Serializable

        # The tier that your guardrail uses for denied topic filters. Valid values include: CLASSIC tier –
        # Provides established guardrails functionality supporting English, French, and Spanish languages.
        # STANDARD tier – Provides a more robust solution than the CLASSIC tier and has more comprehensive
        # language support. This tier requires that your guardrail use cross-Region inference .

        @[JSON::Field(key: "tierName")]
        getter tier_name : String

        def initialize(
          @tier_name : String
        )
        end
      end

      # A word configured for the guardrail.

      struct GuardrailWord
        include JSON::Serializable

        # Text of the word configured for the guardrail to block.

        @[JSON::Field(key: "text")]
        getter text : String

        # The action to take when harmful content is detected in the input. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Indicates whether guardrail evaluation is enabled on the input. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # The action to take when harmful content is detected in the output. Supported values include: BLOCK –
        # Block the content and replace it with blocked messaging. NONE – Take no action but return detection
        # information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Indicates whether guardrail evaluation is enabled on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        def initialize(
          @text : String,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil
        )
        end
      end

      # A word to configure for the guardrail.

      struct GuardrailWordConfig
        include JSON::Serializable

        # Text of the word configured for the guardrail to block.

        @[JSON::Field(key: "text")]
        getter text : String

        # Specifies the action to take when harmful content is detected in the input. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but
        # return detection information in the trace response.

        @[JSON::Field(key: "inputAction")]
        getter input_action : String?

        # Specifies whether to enable guardrail evaluation on the intput. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "inputEnabled")]
        getter input_enabled : Bool?

        # Specifies the action to take when harmful content is detected in the output. Supported values
        # include: BLOCK – Block the content and replace it with blocked messaging. NONE – Take no action but
        # return detection information in the trace response.

        @[JSON::Field(key: "outputAction")]
        getter output_action : String?

        # Specifies whether to enable guardrail evaluation on the output. When disabled, you aren't charged
        # for the evaluation. The evaluation doesn't appear in the response.

        @[JSON::Field(key: "outputEnabled")]
        getter output_enabled : Bool?

        def initialize(
          @text : String,
          @input_action : String? = nil,
          @input_enabled : Bool? = nil,
          @output_action : String? = nil,
          @output_enabled : Bool? = nil
        )
        end
      end

      # Contains details about the word policy configured for the guardrail.

      struct GuardrailWordPolicy
        include JSON::Serializable

        # A list of managed words configured for the guardrail.

        @[JSON::Field(key: "managedWordLists")]
        getter managed_word_lists : Array(Types::GuardrailManagedWords)?

        # A list of words configured for the guardrail.

        @[JSON::Field(key: "words")]
        getter words : Array(Types::GuardrailWord)?

        def initialize(
          @managed_word_lists : Array(Types::GuardrailManagedWords)? = nil,
          @words : Array(Types::GuardrailWord)? = nil
        )
        end
      end

      # Contains details about the word policy to configured for the guardrail.

      struct GuardrailWordPolicyConfig
        include JSON::Serializable

        # A list of managed words to configure for the guardrail.

        @[JSON::Field(key: "managedWordListsConfig")]
        getter managed_word_lists_config : Array(Types::GuardrailManagedWordsConfig)?

        # A list of words to configure for the guardrail.

        @[JSON::Field(key: "wordsConfig")]
        getter words_config : Array(Types::GuardrailWordConfig)?

        def initialize(
          @managed_word_lists_config : Array(Types::GuardrailManagedWordsConfig)? = nil,
          @words_config : Array(Types::GuardrailWordConfig)? = nil
        )
        end
      end

      # Specifies the custom metrics, how tasks will be rated, the flow definition ARN, and your custom
      # prompt datasets. Model evaluation jobs use human workers only support the use of custom prompt
      # datasets. To learn more about custom prompt datasets and the required format, see Custom prompt
      # datasets . When you create custom metrics in HumanEvaluationCustomMetric you must specify the
      # metric's name . The list of names specified in the HumanEvaluationCustomMetric array, must match the
      # metricNames array of strings specified in EvaluationDatasetMetricConfig . For example, if in the
      # HumanEvaluationCustomMetric array your specified the names "accuracy", "toxicity", "readability" as
      # custom metrics then the metricNames array would need to look like the following ["accuracy",
      # "toxicity", "readability"] in EvaluationDatasetMetricConfig .

      struct HumanEvaluationConfig
        include JSON::Serializable

        # Use to specify the metrics, task, and prompt dataset to be used in your model evaluation job.

        @[JSON::Field(key: "datasetMetricConfigs")]
        getter dataset_metric_configs : Array(Types::EvaluationDatasetMetricConfig)

        # A HumanEvaluationCustomMetric object. It contains the names the metrics, how the metrics are to be
        # evaluated, an optional description.

        @[JSON::Field(key: "customMetrics")]
        getter custom_metrics : Array(Types::HumanEvaluationCustomMetric)?

        # The parameters of the human workflow.

        @[JSON::Field(key: "humanWorkflowConfig")]
        getter human_workflow_config : Types::HumanWorkflowConfig?

        def initialize(
          @dataset_metric_configs : Array(Types::EvaluationDatasetMetricConfig),
          @custom_metrics : Array(Types::HumanEvaluationCustomMetric)? = nil,
          @human_workflow_config : Types::HumanWorkflowConfig? = nil
        )
        end
      end

      # In a model evaluation job that uses human workers you must define the name of the metric, and how
      # you want that metric rated ratingMethod , and an optional description of the metric.

      struct HumanEvaluationCustomMetric
        include JSON::Serializable

        # The name of the metric. Your human evaluators will see this name in the evaluation UI.

        @[JSON::Field(key: "name")]
        getter name : String

        # Choose how you want your human workers to evaluation your model. Valid values for rating methods are
        # ThumbsUpDown , IndividualLikertScale , ComparisonLikertScale , ComparisonChoice , and ComparisonRank

        @[JSON::Field(key: "ratingMethod")]
        getter rating_method : String

        # An optional description of the metric. Use this parameter to provide more details about the metric.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @rating_method : String,
          @description : String? = nil
        )
        end
      end

      # Contains SageMakerFlowDefinition object. The object is used to specify the prompt dataset, task
      # type, rating method and metric names.

      struct HumanWorkflowConfig
        include JSON::Serializable

        # The Amazon Resource Number (ARN) for the flow definition

        @[JSON::Field(key: "flowDefinitionArn")]
        getter flow_definition_arn : String

        # Instructions for the flow definition

        @[JSON::Field(key: "instructions")]
        getter instructions : String?

        def initialize(
          @flow_definition_arn : String,
          @instructions : String? = nil
        )
        end
      end

      # Configuration for implicit filtering in Knowledge Base vector searches. Implicit filtering allows
      # you to automatically filter search results based on metadata attributes without requiring explicit
      # filter expressions in each query.

      struct ImplicitFilterConfiguration
        include JSON::Serializable

        # A list of metadata attribute schemas that define the structure and properties of metadata fields
        # used for implicit filtering. Each attribute defines a key, type, and optional description.

        @[JSON::Field(key: "metadataAttributes")]
        getter metadata_attributes : Array(Types::MetadataAttributeSchema)

        # The Amazon Resource Name (ARN) of the foundation model used for implicit filtering. This model
        # processes the query to extract relevant filtering criteria.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        def initialize(
          @metadata_attributes : Array(Types::MetadataAttributeSchema),
          @model_arn : String
        )
        end
      end

      # Information about the imported model.

      struct ImportedModelSummary
        include JSON::Serializable

        # Creation time of the imported model.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the imported model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # Name of the imported model.

        @[JSON::Field(key: "modelName")]
        getter model_name : String

        # Specifies if the imported model supports converse.

        @[JSON::Field(key: "instructSupported")]
        getter instruct_supported : Bool?

        # The architecture of the imported model.

        @[JSON::Field(key: "modelArchitecture")]
        getter model_architecture : String?

        def initialize(
          @creation_time : Time,
          @model_arn : String,
          @model_name : String,
          @instruct_supported : Bool? = nil,
          @model_architecture : String? = nil
        )
        end
      end

      # Contains information about a model.

      struct InferenceProfileModel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String?

        def initialize(
          @model_arn : String? = nil
        )
        end
      end

      # Contains information about the model or system-defined inference profile that is the source for an
      # inference profile..

      struct InferenceProfileModelSource
        include JSON::Serializable

        # The ARN of the model or system-defined inference profile that is the source for the inference
        # profile.

        @[JSON::Field(key: "copyFrom")]
        getter copy_from : String?

        def initialize(
          @copy_from : String? = nil
        )
        end
      end

      # Contains information about an inference profile.

      struct InferenceProfileSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the inference profile.

        @[JSON::Field(key: "inferenceProfileArn")]
        getter inference_profile_arn : String

        # The unique identifier of the inference profile.

        @[JSON::Field(key: "inferenceProfileId")]
        getter inference_profile_id : String

        # The name of the inference profile.

        @[JSON::Field(key: "inferenceProfileName")]
        getter inference_profile_name : String

        # A list of information about each model in the inference profile.

        @[JSON::Field(key: "models")]
        getter models : Array(Types::InferenceProfileModel)

        # The status of the inference profile. ACTIVE means that the inference profile is ready to be used.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the inference profile. The following types are possible: SYSTEM_DEFINED – The inference
        # profile is defined by Amazon Bedrock. You can route inference requests across regions with these
        # inference profiles. APPLICATION – The inference profile was created by a user. This type of
        # inference profile can track metrics and costs when invoking the model in it. The inference profile
        # may route requests to one or multiple regions.

        @[JSON::Field(key: "type")]
        getter type : String

        # The time at which the inference profile was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the inference profile.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time at which the inference profile was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @inference_profile_arn : String,
          @inference_profile_id : String,
          @inference_profile_name : String,
          @models : Array(Types::InferenceProfileModel),
          @status : String,
          @type : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @updated_at : Time? = nil
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

      # A storage location for invocation logs.

      struct InvocationLogSource
        include JSON::Serializable

        # The URI of an invocation log in a bucket.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String?

        def initialize(
          @s3_uri : String? = nil
        )
        end
      end

      # Settings for using invocation logs to customize a model.

      struct InvocationLogsConfig
        include JSON::Serializable

        # The source of the invocation logs.

        @[JSON::Field(key: "invocationLogSource")]
        getter invocation_log_source : Types::InvocationLogSource

        # Rules for filtering invocation logs based on request metadata.

        @[JSON::Field(key: "requestMetadataFilters")]
        getter request_metadata_filters : Types::RequestMetadataFilters?

        # Whether to use the model's response for training, or just the prompt. The default value is False .

        @[JSON::Field(key: "usePromptResponse")]
        getter use_prompt_response : Bool?

        def initialize(
          @invocation_log_source : Types::InvocationLogSource,
          @request_metadata_filters : Types::RequestMetadataFilters? = nil,
          @use_prompt_response : Bool? = nil
        )
        end
      end

      # Contains configuration details of the inference for knowledge base retrieval and response
      # generation.

      struct KbInferenceConfig
        include JSON::Serializable

        # Contains configuration details for text generation using a language model via the
        # RetrieveAndGenerate function.

        @[JSON::Field(key: "textInferenceConfig")]
        getter text_inference_config : Types::TextInferenceConfig?

        def initialize(
          @text_inference_config : Types::TextInferenceConfig? = nil
        )
        end
      end

      # The configuration details for retrieving information from a knowledge base and generating responses.

      struct KnowledgeBaseConfig
        include JSON::Serializable

        # Contains configuration details for retrieving information from a knowledge base and generating
        # responses.

        @[JSON::Field(key: "retrieveAndGenerateConfig")]
        getter retrieve_and_generate_config : Types::RetrieveAndGenerateConfiguration?

        # Contains configuration details for retrieving information from a knowledge base.

        @[JSON::Field(key: "retrieveConfig")]
        getter retrieve_config : Types::RetrieveConfig?

        def initialize(
          @retrieve_and_generate_config : Types::RetrieveAndGenerateConfiguration? = nil,
          @retrieve_config : Types::RetrieveConfig? = nil
        )
        end
      end

      # Contains configuration details for retrieving information from a knowledge base.

      struct KnowledgeBaseRetrievalConfiguration
        include JSON::Serializable

        # Contains configuration details for returning the results from the vector search.

        @[JSON::Field(key: "vectorSearchConfiguration")]
        getter vector_search_configuration : Types::KnowledgeBaseVectorSearchConfiguration

        def initialize(
          @vector_search_configuration : Types::KnowledgeBaseVectorSearchConfiguration
        )
        end
      end

      # Contains configuration details for retrieving information from a knowledge base and generating
      # responses.

      struct KnowledgeBaseRetrieveAndGenerateConfiguration
        include JSON::Serializable

        # The unique identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The Amazon Resource Name (ARN) of the foundation model or inference profile used to generate
        # responses.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # Contains configurations details for response generation based on retrieved text chunks.

        @[JSON::Field(key: "generationConfiguration")]
        getter generation_configuration : Types::GenerationConfiguration?

        # Contains configuration details for the model to process the prompt prior to retrieval and response
        # generation.

        @[JSON::Field(key: "orchestrationConfiguration")]
        getter orchestration_configuration : Types::OrchestrationConfiguration?

        # Contains configuration details for retrieving text chunks.

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

      # The configuration details for returning the results from the knowledge base vector search.

      struct KnowledgeBaseVectorSearchConfiguration
        include JSON::Serializable

        # Specifies the filters to use on the metadata fields in the knowledge base data sources before
        # returning results.

        @[JSON::Field(key: "filter")]
        getter filter : Types::RetrievalFilter?

        # Configuration for implicit filtering in Knowledge Base vector searches. This allows the system to
        # automatically apply filters based on the query context without requiring explicit filter
        # expressions.

        @[JSON::Field(key: "implicitFilterConfiguration")]
        getter implicit_filter_configuration : Types::ImplicitFilterConfiguration?

        # The number of text chunks to retrieve; the number of results to return.

        @[JSON::Field(key: "numberOfResults")]
        getter number_of_results : Int32?

        # By default, Amazon Bedrock decides a search strategy for you. If you're using an Amazon OpenSearch
        # Serverless vector store that contains a filterable text field, you can specify whether to query the
        # knowledge base with a HYBRID search using both vector embeddings and raw text, or SEMANTIC search
        # using only vector embeddings. For other vector store configurations, only SEMANTIC search is
        # available.

        @[JSON::Field(key: "overrideSearchType")]
        getter override_search_type : String?

        # Configuration for reranking search results in Knowledge Base vector searches. Reranking improves
        # search relevance by reordering initial vector search results using more sophisticated relevance
        # models.

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

      # Configuration for using an AWS Lambda function to grade model responses during reinforcement
      # fine-tuning training.

      struct LambdaGraderConfig
        include JSON::Serializable

        # ARN of the AWS Lambda function that will evaluate model responses and return reward scores for RFT
        # training.

        @[JSON::Field(key: "lambdaArn")]
        getter lambda_arn : String

        def initialize(
          @lambda_arn : String
        )
        end
      end

      # The legal term of the agreement.

      struct LegalTerm
        include JSON::Serializable

        # URL to the legal term document.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end


      struct ListAutomatedReasoningPoliciesRequest
        include JSON::Serializable

        # The maximum number of policies to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional filter to list only the policy versions with the specified Amazon Resource Name (ARN). If
        # not provided, the DRAFT versions for all policies are listed.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @policy_arn : String? = nil
        )
        end
      end


      struct ListAutomatedReasoningPoliciesResponse
        include JSON::Serializable

        # A list of Automated Reasoning policy summaries.

        @[JSON::Field(key: "automatedReasoningPolicySummaries")]
        getter automated_reasoning_policy_summaries : Array(Types::AutomatedReasoningPolicySummary)

        # The pagination token to use in a subsequent request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @automated_reasoning_policy_summaries : Array(Types::AutomatedReasoningPolicySummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomatedReasoningPolicyBuildWorkflowsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy whose build workflows you want to
        # list.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The maximum number of build workflows to return in a single response. Valid range is 1-100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token from a previous request to continue listing build workflows from where the
        # previous request left off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomatedReasoningPolicyBuildWorkflowsResponse
        include JSON::Serializable

        # A list of build workflow summaries, each containing key information about a build workflow including
        # its status and timestamps.

        @[JSON::Field(key: "automatedReasoningPolicyBuildWorkflowSummaries")]
        getter automated_reasoning_policy_build_workflow_summaries : Array(Types::AutomatedReasoningPolicyBuildWorkflowSummary)

        # A pagination token to use in subsequent requests to retrieve additional build workflows.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @automated_reasoning_policy_build_workflow_summaries : Array(Types::AutomatedReasoningPolicyBuildWorkflowSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomatedReasoningPolicyTestCasesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy for which to list tests.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The maximum number of tests to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @policy_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomatedReasoningPolicyTestCasesResponse
        include JSON::Serializable

        # A list of tests for the specified policy.

        @[JSON::Field(key: "testCases")]
        getter test_cases : Array(Types::AutomatedReasoningPolicyTestCase)

        # The pagination token to use in a subsequent request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @test_cases : Array(Types::AutomatedReasoningPolicyTestCase),
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomatedReasoningPolicyTestResultsRequest
        include JSON::Serializable

        # The unique identifier of the build workflow whose test results you want to list.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy whose test results you want to
        # list.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The maximum number of test results to return in a single response. Valid range is 1-100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token from a previous request to continue listing test results from where the previous
        # request left off.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @build_workflow_id : String,
          @policy_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomatedReasoningPolicyTestResultsResponse
        include JSON::Serializable

        # A list of test results, each containing information about how the policy performed on specific test
        # scenarios.

        @[JSON::Field(key: "testResults")]
        getter test_results : Array(Types::AutomatedReasoningPolicyTestResult)

        # A pagination token to use in subsequent requests to retrieve additional test results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @test_results : Array(Types::AutomatedReasoningPolicyTestResult),
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomModelDeploymentsRequest
        include JSON::Serializable

        # Filters deployments created after the specified date and time.

        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # Filters deployments created before the specified date and time.

        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Filters deployments by the Amazon Resource Name (ARN) of the associated custom model.

        @[JSON::Field(key: "modelArnEquals")]
        getter model_arn_equals : String?

        # Filters deployments whose names contain the specified string.

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # The token for the next set of results. Use this token to retrieve additional results when the
        # response is truncated.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The field to sort the results by. The only supported value is CreationTime .

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order for the results. Valid values are Ascending and Descending . Default is Descending .

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # Filters deployments by status. Valid values are CREATING , ACTIVE , and FAILED .

        @[JSON::Field(key: "statusEquals")]
        getter status_equals : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @max_results : Int32? = nil,
          @model_arn_equals : String? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status_equals : String? = nil
        )
        end
      end


      struct ListCustomModelDeploymentsResponse
        include JSON::Serializable

        # A list of custom model deployment summaries.

        @[JSON::Field(key: "modelDeploymentSummaries")]
        getter model_deployment_summaries : Array(Types::CustomModelDeploymentSummary)?

        # The token for the next set of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @model_deployment_summaries : Array(Types::CustomModelDeploymentSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomModelsRequest
        include JSON::Serializable

        # Return custom models only if the base model Amazon Resource Name (ARN) matches this parameter.

        @[JSON::Field(key: "baseModelArnEquals")]
        getter base_model_arn_equals : String?

        # Return custom models created after the specified time.

        @[JSON::Field(key: "creationTimeAfter")]
        getter creation_time_after : Time?

        # Return custom models created before the specified time.

        @[JSON::Field(key: "creationTimeBefore")]
        getter creation_time_before : Time?

        # Return custom models only if the foundation model Amazon Resource Name (ARN) matches this parameter.

        @[JSON::Field(key: "foundationModelArnEquals")]
        getter foundation_model_arn_equals : String?

        # Return custom models depending on if the current account owns them ( true ) or if they were shared
        # with the current account ( false ).

        @[JSON::Field(key: "isOwned")]
        getter is_owned : Bool?

        # The maximum number of results to return in the response. If the total number of results is greater
        # than this value, use the token returned in the response in the nextToken field when making another
        # request to return the next batch of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The status of them model to filter results by. Possible values include: Creating - Include only
        # models that are currently being created and validated. Active - Include only models that have been
        # successfully created and are ready for use. Failed - Include only models where the creation process
        # failed. If you don't specify a status, the API returns models in all states.

        @[JSON::Field(key: "modelStatus")]
        getter model_status : String?

        # Return custom models only if the job name contains these characters.

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # If the total number of results is greater than the maxResults value provided in the request, enter
        # the token returned in the nextToken field in the response in this field to return the next batch of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The field to sort by in the returned list of models.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order of the results.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @base_model_arn_equals : String? = nil,
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @foundation_model_arn_equals : String? = nil,
          @is_owned : Bool? = nil,
          @max_results : Int32? = nil,
          @model_status : String? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListCustomModelsResponse
        include JSON::Serializable

        # Model summaries.

        @[JSON::Field(key: "modelSummaries")]
        getter model_summaries : Array(Types::CustomModelSummary)?

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @model_summaries : Array(Types::CustomModelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnforcedGuardrailsConfigurationRequest
        include JSON::Serializable

        # Opaque continuation token of previous paginated response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListEnforcedGuardrailsConfigurationResponse
        include JSON::Serializable

        # Array of AccountEnforcedGuardrailOutputConfiguration objects.

        @[JSON::Field(key: "guardrailsConfig")]
        getter guardrails_config : Array(Types::AccountEnforcedGuardrailOutputConfiguration)

        # Opaque continuation token of previous paginated response.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @guardrails_config : Array(Types::AccountEnforcedGuardrailOutputConfiguration),
          @next_token : String? = nil
        )
        end
      end


      struct ListEvaluationJobsRequest
        include JSON::Serializable

        # A filter to only list evaluation jobs that are either model evaluations or knowledge base
        # evaluations.

        @[JSON::Field(key: "applicationTypeEquals")]
        getter application_type_equals : String?

        # A filter to only list evaluation jobs created after a specified time.

        @[JSON::Field(key: "creationTimeAfter")]
        getter creation_time_after : Time?

        # A filter to only list evaluation jobs created before a specified time.

        @[JSON::Field(key: "creationTimeBefore")]
        getter creation_time_before : Time?

        # The maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A filter to only list evaluation jobs that contain a specified string in the job name.

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # Continuation token from the previous response, for Amazon Bedrock to list the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies a creation time to sort the list of evaluation jobs by when they were created.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies whether to sort the list of evaluation jobs by either ascending or descending order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # A filter to only list evaluation jobs that are of a certain status.

        @[JSON::Field(key: "statusEquals")]
        getter status_equals : String?

        def initialize(
          @application_type_equals : String? = nil,
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status_equals : String? = nil
        )
        end
      end


      struct ListEvaluationJobsResponse
        include JSON::Serializable

        # A list of summaries of the evaluation jobs.

        @[JSON::Field(key: "jobSummaries")]
        getter job_summaries : Array(Types::EvaluationSummary)?

        # Continuation token from the previous response, for Amazon Bedrock to list the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_summaries : Array(Types::EvaluationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFoundationModelAgreementOffersRequest
        include JSON::Serializable

        # Model Id of the foundation model.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Type of offer associated with the model.

        @[JSON::Field(key: "offerType")]
        getter offer_type : String?

        def initialize(
          @model_id : String,
          @offer_type : String? = nil
        )
        end
      end


      struct ListFoundationModelAgreementOffersResponse
        include JSON::Serializable

        # Model Id of the foundation model.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # List of the offers associated with the specified model.

        @[JSON::Field(key: "offers")]
        getter offers : Array(Types::Offer)

        def initialize(
          @model_id : String,
          @offers : Array(Types::Offer)
        )
        end
      end


      struct ListFoundationModelsRequest
        include JSON::Serializable

        # Return models that support the customization type that you specify. For more information, see Custom
        # models in the Amazon Bedrock User Guide .

        @[JSON::Field(key: "byCustomizationType")]
        getter by_customization_type : String?

        # Return models that support the inference type that you specify. For more information, see
        # Provisioned Throughput in the Amazon Bedrock User Guide .

        @[JSON::Field(key: "byInferenceType")]
        getter by_inference_type : String?

        # Return models that support the output modality that you specify.

        @[JSON::Field(key: "byOutputModality")]
        getter by_output_modality : String?

        # Return models belonging to the model provider that you specify.

        @[JSON::Field(key: "byProvider")]
        getter by_provider : String?

        def initialize(
          @by_customization_type : String? = nil,
          @by_inference_type : String? = nil,
          @by_output_modality : String? = nil,
          @by_provider : String? = nil
        )
        end
      end


      struct ListFoundationModelsResponse
        include JSON::Serializable

        # A list of Amazon Bedrock foundation models.

        @[JSON::Field(key: "modelSummaries")]
        getter model_summaries : Array(Types::FoundationModelSummary)?

        def initialize(
          @model_summaries : Array(Types::FoundationModelSummary)? = nil
        )
        end
      end


      struct ListGuardrailsRequest
        include JSON::Serializable

        # The unique identifier of the guardrail. This can be an ID or the ARN.

        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String?

        # The maximum number of results to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If there are more results than were returned in the response, the response returns a nextToken that
        # you can send in another ListGuardrails request to see the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @guardrail_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGuardrailsResponse
        include JSON::Serializable

        # A list of objects, each of which contains details about a guardrail.

        @[JSON::Field(key: "guardrails")]
        getter guardrails : Array(Types::GuardrailSummary)

        # If there are more results than were returned in the response, the response returns a nextToken that
        # you can send in another ListGuardrails request to see the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @guardrails : Array(Types::GuardrailSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListImportedModelsRequest
        include JSON::Serializable

        # Return imported models that were created after the specified time.

        @[JSON::Field(key: "creationTimeAfter")]
        getter creation_time_after : Time?

        # Return imported models that created before the specified time.

        @[JSON::Field(key: "creationTimeBefore")]
        getter creation_time_before : Time?

        # The maximum number of results to return in the response. If the total number of results is greater
        # than this value, use the token returned in the response in the nextToken field when making another
        # request to return the next batch of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Return imported models only if the model name contains these characters.

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # If the total number of results is greater than the maxResults value provided in the request, enter
        # the token returned in the nextToken field in the response in this field to return the next batch of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The field to sort by in the returned list of imported models.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies whetehr to sort the results in ascending or descending order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListImportedModelsResponse
        include JSON::Serializable

        # Model summaries.

        @[JSON::Field(key: "modelSummaries")]
        getter model_summaries : Array(Types::ImportedModelSummary)?

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @model_summaries : Array(Types::ImportedModelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInferenceProfilesRequest
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

        # Filters for inference profiles that match the type you specify. SYSTEM_DEFINED – The inference
        # profile is defined by Amazon Bedrock. You can route inference requests across regions with these
        # inference profiles. APPLICATION – The inference profile was created by a user. This type of
        # inference profile can track metrics and costs when invoking the model in it. The inference profile
        # may route requests to one or multiple regions.

        @[JSON::Field(key: "type")]
        getter type_equals : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @type_equals : String? = nil
        )
        end
      end


      struct ListInferenceProfilesResponse
        include JSON::Serializable

        # A list of information about each inference profile that you can use.

        @[JSON::Field(key: "inferenceProfileSummaries")]
        getter inference_profile_summaries : Array(Types::InferenceProfileSummary)?

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @inference_profile_summaries : Array(Types::InferenceProfileSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMarketplaceModelEndpointsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call. If more results are available, the
        # operation returns a NextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If specified, only endpoints for the given model source identifier are returned.

        @[JSON::Field(key: "modelSourceIdentifier")]
        getter model_source_equals : String?

        # The token for the next set of results. You receive this token from a previous
        # ListMarketplaceModelEndpoints call.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @model_source_equals : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMarketplaceModelEndpointsResponse
        include JSON::Serializable

        # An array of endpoint summaries.

        @[JSON::Field(key: "marketplaceModelEndpoints")]
        getter marketplace_model_endpoints : Array(Types::MarketplaceModelEndpointSummary)?

        # The token for the next set of results. Use this token to get the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @marketplace_model_endpoints : Array(Types::MarketplaceModelEndpointSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListModelCopyJobsRequest
        include JSON::Serializable

        # Filters for model copy jobs created after the specified time.

        @[JSON::Field(key: "creationTimeAfter")]
        getter creation_time_after : Time?

        # Filters for model copy jobs created before the specified time.

        @[JSON::Field(key: "creationTimeBefore")]
        getter creation_time_before : Time?

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

        # The field to sort by in the returned list of model copy jobs.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies whether to sort the results in ascending or descending order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # Filters for model copy jobs in which the account that the source model belongs to is equal to the
        # value that you specify.

        @[JSON::Field(key: "sourceAccountEquals")]
        getter source_account_equals : String?

        # Filters for model copy jobs in which the Amazon Resource Name (ARN) of the source model to is equal
        # to the value that you specify.

        @[JSON::Field(key: "sourceModelArnEquals")]
        getter source_model_arn_equals : String?

        # Filters for model copy jobs whose status matches the value that you specify.

        @[JSON::Field(key: "statusEquals")]
        getter status_equals : String?

        # Filters for model copy jobs in which the name of the copied model contains the string that you
        # specify.

        @[JSON::Field(key: "outputModelNameContains")]
        getter target_model_name_contains : String?

        def initialize(
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @source_account_equals : String? = nil,
          @source_model_arn_equals : String? = nil,
          @status_equals : String? = nil,
          @target_model_name_contains : String? = nil
        )
        end
      end


      struct ListModelCopyJobsResponse
        include JSON::Serializable

        # A list of information about each model copy job.

        @[JSON::Field(key: "modelCopyJobSummaries")]
        getter model_copy_job_summaries : Array(Types::ModelCopyJobSummary)?

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @model_copy_job_summaries : Array(Types::ModelCopyJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListModelCustomizationJobsRequest
        include JSON::Serializable

        # Return customization jobs created after the specified time.

        @[JSON::Field(key: "creationTimeAfter")]
        getter creation_time_after : Time?

        # Return customization jobs created before the specified time.

        @[JSON::Field(key: "creationTimeBefore")]
        getter creation_time_before : Time?

        # The maximum number of results to return in the response. If the total number of results is greater
        # than this value, use the token returned in the response in the nextToken field when making another
        # request to return the next batch of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Return customization jobs only if the job name contains these characters.

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # If the total number of results is greater than the maxResults value provided in the request, enter
        # the token returned in the nextToken field in the response in this field to return the next batch of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The field to sort by in the returned list of jobs.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order of the results.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # Return customization jobs with the specified status.

        @[JSON::Field(key: "statusEquals")]
        getter status_equals : String?

        def initialize(
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status_equals : String? = nil
        )
        end
      end


      struct ListModelCustomizationJobsResponse
        include JSON::Serializable

        # Job summaries.

        @[JSON::Field(key: "modelCustomizationJobSummaries")]
        getter model_customization_job_summaries : Array(Types::ModelCustomizationJobSummary)?

        # If the total number of results is greater than the maxResults value provided in the request, use
        # this token when making another request in the nextToken field to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @model_customization_job_summaries : Array(Types::ModelCustomizationJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListModelImportJobsRequest
        include JSON::Serializable

        # Return import jobs that were created after the specified time.

        @[JSON::Field(key: "creationTimeAfter")]
        getter creation_time_after : Time?

        # Return import jobs that were created before the specified time.

        @[JSON::Field(key: "creationTimeBefore")]
        getter creation_time_before : Time?

        # The maximum number of results to return in the response. If the total number of results is greater
        # than this value, use the token returned in the response in the nextToken field when making another
        # request to return the next batch of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Return imported jobs only if the job name contains these characters.

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # If the total number of results is greater than the maxResults value provided in the request, enter
        # the token returned in the nextToken field in the response in this field to return the next batch of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The field to sort by in the returned list of imported jobs.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies whether to sort the results in ascending or descending order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # Return imported jobs with the specified status.

        @[JSON::Field(key: "statusEquals")]
        getter status_equals : String?

        def initialize(
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status_equals : String? = nil
        )
        end
      end


      struct ListModelImportJobsResponse
        include JSON::Serializable

        # Import job summaries.

        @[JSON::Field(key: "modelImportJobSummaries")]
        getter model_import_job_summaries : Array(Types::ModelImportJobSummary)?

        # If the total number of results is greater than the maxResults value provided in the request, enter
        # the token returned in the nextToken field in the response in this field to return the next batch of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @model_import_job_summaries : Array(Types::ModelImportJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListModelInvocationJobsRequest
        include JSON::Serializable

        # The maximum number of results to return. If there are more results than the number that you specify,
        # a nextToken value is returned. Use the nextToken in a request to return the next batch of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify a string to filter for batch inference jobs whose names contain the string.

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # If there were more results than the value you specified in the maxResults field in a previous
        # ListModelInvocationJobs request, the response would have returned a nextToken value. To see the next
        # batch of results, send the nextToken value in another request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An attribute by which to sort the results.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies whether to sort the results by ascending or descending order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # Specify a status to filter for batch inference jobs whose statuses match the string you specify. The
        # following statuses are possible: Submitted – This job has been submitted to a queue for validation.
        # Validating – This job is being validated for the requirements described in Format and upload your
        # batch inference data . The criteria include the following: Your IAM service role has access to the
        # Amazon S3 buckets containing your files. Your files are .jsonl files and each individual record is a
        # JSON object in the correct format. Note that validation doesn't check if the modelInput value
        # matches the request body for the model. Your files fulfill the requirements for file size and number
        # of records. For more information, see Quotas for Amazon Bedrock . Scheduled – This job has been
        # validated and is now in a queue. The job will automatically start when it reaches its turn. Expired
        # – This job timed out because it was scheduled but didn't begin before the set timeout duration.
        # Submit a new job request. InProgress – This job has begun. You can start viewing the results in the
        # output S3 location. Completed – This job has successfully completed. View the output files in the
        # output S3 location. PartiallyCompleted – This job has partially completed. Not all of your records
        # could be processed in time. View the output files in the output S3 location. Failed – This job has
        # failed. Check the failure message for any further details. For further assistance, reach out to the
        # Amazon Web Services Support Center . Stopped – This job was stopped by a user. Stopping – This job
        # is being stopped by a user.

        @[JSON::Field(key: "statusEquals")]
        getter status_equals : String?

        # Specify a time to filter for batch inference jobs that were submitted after the time you specify.

        @[JSON::Field(key: "submitTimeAfter")]
        getter submit_time_after : Time?

        # Specify a time to filter for batch inference jobs that were submitted before the time you specify.

        @[JSON::Field(key: "submitTimeBefore")]
        getter submit_time_before : Time?

        def initialize(
          @max_results : Int32? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status_equals : String? = nil,
          @submit_time_after : Time? = nil,
          @submit_time_before : Time? = nil
        )
        end
      end


      struct ListModelInvocationJobsResponse
        include JSON::Serializable

        # A list of items, each of which contains a summary about a batch inference job.

        @[JSON::Field(key: "invocationJobSummaries")]
        getter invocation_job_summaries : Array(Types::ModelInvocationJobSummary)?

        # If there are more results than can fit in the response, a nextToken is returned. Use the nextToken
        # in a request to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @invocation_job_summaries : Array(Types::ModelInvocationJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPromptRoutersRequest
        include JSON::Serializable

        # The maximum number of prompt routers to return in one page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specify the pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of the prompt routers, such as whether it's default or custom.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListPromptRoutersResponse
        include JSON::Serializable

        # Specify the pagination token from a previous request to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of prompt router summaries.

        @[JSON::Field(key: "promptRouterSummaries")]
        getter prompt_router_summaries : Array(Types::PromptRouterSummary)?

        def initialize(
          @next_token : String? = nil,
          @prompt_router_summaries : Array(Types::PromptRouterSummary)? = nil
        )
        end
      end


      struct ListProvisionedModelThroughputsRequest
        include JSON::Serializable

        # A filter that returns Provisioned Throughputs created after the specified time.

        @[JSON::Field(key: "creationTimeAfter")]
        getter creation_time_after : Time?

        # A filter that returns Provisioned Throughputs created before the specified time.

        @[JSON::Field(key: "creationTimeBefore")]
        getter creation_time_before : Time?

        # THe maximum number of results to return in the response. If there are more results than the number
        # you specified, the response returns a nextToken value. To see the next batch of results, send the
        # nextToken value in another list request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A filter that returns Provisioned Throughputs whose model Amazon Resource Name (ARN) is equal to the
        # value that you specify.

        @[JSON::Field(key: "modelArnEquals")]
        getter model_arn_equals : String?

        # A filter that returns Provisioned Throughputs if their name contains the expression that you
        # specify.

        @[JSON::Field(key: "nameContains")]
        getter name_contains : String?

        # If there are more results than the number you specified in the maxResults field, the response
        # returns a nextToken value. To see the next batch of results, specify the nextToken value in this
        # field.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The field by which to sort the returned list of Provisioned Throughputs.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order of the results.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # A filter that returns Provisioned Throughputs if their statuses matches the value that you specify.

        @[JSON::Field(key: "statusEquals")]
        getter status_equals : String?

        def initialize(
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @max_results : Int32? = nil,
          @model_arn_equals : String? = nil,
          @name_contains : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status_equals : String? = nil
        )
        end
      end


      struct ListProvisionedModelThroughputsResponse
        include JSON::Serializable

        # If there are more results than the number you specified in the maxResults field, this value is
        # returned. To see the next batch of results, include this value in the nextToken field in another
        # list request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of summaries, one for each Provisioned Throughput in the response.

        @[JSON::Field(key: "provisionedModelSummaries")]
        getter provisioned_model_summaries : Array(Types::ProvisionedModelSummary)?

        def initialize(
          @next_token : String? = nil,
          @provisioned_model_summaries : Array(Types::ProvisionedModelSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # An array of the tags associated with this resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Configuration fields for invocation logging.

      struct LoggingConfig
        include JSON::Serializable

        # Set to include audio data in the log delivery.

        @[JSON::Field(key: "audioDataDeliveryEnabled")]
        getter audio_data_delivery_enabled : Bool?

        # CloudWatch logging configuration.

        @[JSON::Field(key: "cloudWatchConfig")]
        getter cloud_watch_config : Types::CloudWatchConfig?

        # Set to include embeddings data in the log delivery.

        @[JSON::Field(key: "embeddingDataDeliveryEnabled")]
        getter embedding_data_delivery_enabled : Bool?

        # Set to include image data in the log delivery.

        @[JSON::Field(key: "imageDataDeliveryEnabled")]
        getter image_data_delivery_enabled : Bool?

        # S3 configuration for storing log data.

        @[JSON::Field(key: "s3Config")]
        getter s3_config : Types::S3Config?

        # Set to include text data in the log delivery.

        @[JSON::Field(key: "textDataDeliveryEnabled")]
        getter text_data_delivery_enabled : Bool?

        # Set to include video data in the log delivery.

        @[JSON::Field(key: "videoDataDeliveryEnabled")]
        getter video_data_delivery_enabled : Bool?

        def initialize(
          @audio_data_delivery_enabled : Bool? = nil,
          @cloud_watch_config : Types::CloudWatchConfig? = nil,
          @embedding_data_delivery_enabled : Bool? = nil,
          @image_data_delivery_enabled : Bool? = nil,
          @s3_config : Types::S3Config? = nil,
          @text_data_delivery_enabled : Bool? = nil,
          @video_data_delivery_enabled : Bool? = nil
        )
        end
      end

      # Contains details about an endpoint for a model from Amazon Bedrock Marketplace.

      struct MarketplaceModelEndpoint
        include JSON::Serializable

        # The timestamp when the endpoint was registered.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the endpoint.

        @[JSON::Field(key: "endpointArn")]
        getter endpoint_arn : String

        # The configuration of the endpoint, including the number and type of instances used.

        @[JSON::Field(key: "endpointConfig")]
        getter endpoint_config : Types::EndpointConfig

        # The current status of the endpoint (e.g., Creating, InService, Updating, Failed).

        @[JSON::Field(key: "endpointStatus")]
        getter endpoint_status : String

        # The ARN of the model from Amazon Bedrock Marketplace that is deployed on this endpoint.

        @[JSON::Field(key: "modelSourceIdentifier")]
        getter model_source_identifier : String

        # The timestamp when the endpoint was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Additional information about the endpoint status, if available.

        @[JSON::Field(key: "endpointStatusMessage")]
        getter endpoint_status_message : String?

        # The overall status of the endpoint in Amazon Bedrock Marketplace (e.g., ACTIVE, INACTIVE).

        @[JSON::Field(key: "status")]
        getter status : String?

        # Additional information about the overall status, if available.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @created_at : Time,
          @endpoint_arn : String,
          @endpoint_config : Types::EndpointConfig,
          @endpoint_status : String,
          @model_source_identifier : String,
          @updated_at : Time,
          @endpoint_status_message : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Provides a summary of an endpoint for a model from Amazon Bedrock Marketplace.

      struct MarketplaceModelEndpointSummary
        include JSON::Serializable

        # The timestamp when the endpoint was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the endpoint.

        @[JSON::Field(key: "endpointArn")]
        getter endpoint_arn : String

        # The ARN of the model from Amazon Bedrock Marketplace that is deployed on this endpoint.

        @[JSON::Field(key: "modelSourceIdentifier")]
        getter model_source_identifier : String

        # The timestamp when the endpoint was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The overall status of the endpoint in Amazon Bedrock Marketplace.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Additional information about the overall status, if available.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @created_at : Time,
          @endpoint_arn : String,
          @model_source_identifier : String,
          @updated_at : Time,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Defines the schema for a metadata attribute used in Knowledge Base vector searches. Metadata
      # attributes provide additional context for documents and can be used for filtering and reranking
      # search results.

      struct MetadataAttributeSchema
        include JSON::Serializable

        # An optional description of the metadata attribute that provides additional context about its purpose
        # and usage.

        @[JSON::Field(key: "description")]
        getter description : String

        # The unique identifier for the metadata attribute. This key is used to reference the attribute in
        # filter expressions and reranking configurations.

        @[JSON::Field(key: "key")]
        getter key : String

        # The data type of the metadata attribute. The type determines how the attribute can be used in filter
        # expressions and reranking.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @description : String,
          @key : String,
          @type : String
        )
        end
      end

      # Configuration for how metadata should be used during the reranking process in Knowledge Base vector
      # searches. This determines which metadata fields are included or excluded when reordering search
      # results.

      struct MetadataConfigurationForReranking
        include JSON::Serializable

        # The mode for selecting which metadata fields to include in the reranking process. Valid values are
        # ALL (use all available metadata fields) or SELECTIVE (use only specified fields).

        @[JSON::Field(key: "selectionMode")]
        getter selection_mode : String

        # Configuration for selective mode, which allows you to explicitly include or exclude specific
        # metadata fields during reranking. This is only used when selectionMode is set to SELECTIVE.

        @[JSON::Field(key: "selectiveModeConfiguration")]
        getter selective_mode_configuration : Types::RerankingMetadataSelectiveModeConfiguration?

        def initialize(
          @selection_mode : String,
          @selective_mode_configuration : Types::RerankingMetadataSelectiveModeConfiguration? = nil
        )
        end
      end

      # Contains details about each model copy job. This data type is used in the following API operations:
      # ListModelCopyJobs response

      struct ModelCopyJobSummary
        include JSON::Serializable

        # The time that the model copy job was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resoource Name (ARN) of the model copy job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The unique identifier of the account that the model being copied originated from.

        @[JSON::Field(key: "sourceAccountId")]
        getter source_account_id : String

        # The Amazon Resource Name (ARN) of the original model being copied.

        @[JSON::Field(key: "sourceModelArn")]
        getter source_model_arn : String

        # The status of the model copy job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the copied model.

        @[JSON::Field(key: "targetModelArn")]
        getter target_model_arn : String

        # If a model fails to be copied, a message describing why the job failed is included here.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The name of the original model being copied.

        @[JSON::Field(key: "sourceModelName")]
        getter source_model_name : String?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the copied model.

        @[JSON::Field(key: "targetModelKmsKeyArn")]
        getter target_model_kms_key_arn : String?

        # The name of the copied model.

        @[JSON::Field(key: "targetModelName")]
        getter target_model_name : String?

        # Tags associated with the copied model.

        @[JSON::Field(key: "targetModelTags")]
        getter target_model_tags : Array(Types::Tag)?

        def initialize(
          @creation_time : Time,
          @job_arn : String,
          @source_account_id : String,
          @source_model_arn : String,
          @status : String,
          @target_model_arn : String,
          @failure_message : String? = nil,
          @source_model_name : String? = nil,
          @target_model_kms_key_arn : String? = nil,
          @target_model_name : String? = nil,
          @target_model_tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about one customization job

      struct ModelCustomizationJobSummary
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the base model.

        @[JSON::Field(key: "baseModelArn")]
        getter base_model_arn : String

        # Creation time of the custom model.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # Amazon Resource Name (ARN) of the customization job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # Name of the customization job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # Status of the customization job.

        @[JSON::Field(key: "status")]
        getter status : String

        # Amazon Resource Name (ARN) of the custom model.

        @[JSON::Field(key: "customModelArn")]
        getter custom_model_arn : String?

        # Name of the custom model.

        @[JSON::Field(key: "customModelName")]
        getter custom_model_name : String?

        # Specifies whether to carry out continued pre-training of a model or whether to fine-tune it. For
        # more information, see Custom models .

        @[JSON::Field(key: "customizationType")]
        getter customization_type : String?

        # Time that the customization job ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Time that the customization job was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # Details about the status of the data processing sub-task of the job.

        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        def initialize(
          @base_model_arn : String,
          @creation_time : Time,
          @job_arn : String,
          @job_name : String,
          @status : String,
          @custom_model_arn : String? = nil,
          @custom_model_name : String? = nil,
          @customization_type : String? = nil,
          @end_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @status_details : Types::StatusDetails? = nil
        )
        end
      end

      # The data source of the model to import.

      struct ModelDataSource
        include JSON::Serializable

        # The Amazon S3 data source of the model to import.

        @[JSON::Field(key: "s3DataSource")]
        getter s3_data_source : Types::S3DataSource?

        def initialize(
          @s3_data_source : Types::S3DataSource? = nil
        )
        end
      end

      # Information about the import job.

      struct ModelImportJobSummary
        include JSON::Serializable

        # The time import job was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the import job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The name of the import job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The status of the imported job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The time when import job ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The Amazon resource Name (ARN) of the imported model.

        @[JSON::Field(key: "importedModelArn")]
        getter imported_model_arn : String?

        # The name of the imported model.

        @[JSON::Field(key: "importedModelName")]
        getter imported_model_name : String?

        # The time when the import job was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        def initialize(
          @creation_time : Time,
          @job_arn : String,
          @job_name : String,
          @status : String,
          @end_time : Time? = nil,
          @imported_model_arn : String? = nil,
          @imported_model_name : String? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end

      # Details about the location of the input to the batch inference job.

      struct ModelInvocationJobInputDataConfig
        include JSON::Serializable

        # Contains the configuration of the S3 location of the input data.

        @[JSON::Field(key: "s3InputDataConfig")]
        getter s3_input_data_config : Types::ModelInvocationJobS3InputDataConfig?

        def initialize(
          @s3_input_data_config : Types::ModelInvocationJobS3InputDataConfig? = nil
        )
        end
      end

      # Contains the configuration of the S3 location of the output data.

      struct ModelInvocationJobOutputDataConfig
        include JSON::Serializable

        # Contains the configuration of the S3 location of the output data.

        @[JSON::Field(key: "s3OutputDataConfig")]
        getter s3_output_data_config : Types::ModelInvocationJobS3OutputDataConfig?

        def initialize(
          @s3_output_data_config : Types::ModelInvocationJobS3OutputDataConfig? = nil
        )
        end
      end

      # Contains the configuration of the S3 location of the input data.

      struct ModelInvocationJobS3InputDataConfig
        include JSON::Serializable

        # The S3 location of the input data.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # The ID of the Amazon Web Services account that owns the S3 bucket containing the input data.

        @[JSON::Field(key: "s3BucketOwner")]
        getter s3_bucket_owner : String?

        # The format of the input data.

        @[JSON::Field(key: "s3InputFormat")]
        getter s3_input_format : String?

        def initialize(
          @s3_uri : String,
          @s3_bucket_owner : String? = nil,
          @s3_input_format : String? = nil
        )
        end
      end

      # Contains the configuration of the S3 location of the output data.

      struct ModelInvocationJobS3OutputDataConfig
        include JSON::Serializable

        # The S3 location of the output data.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # The ID of the Amazon Web Services account that owns the S3 bucket containing the output data.

        @[JSON::Field(key: "s3BucketOwner")]
        getter s3_bucket_owner : String?

        # The unique identifier of the key that encrypts the S3 location of the output data.

        @[JSON::Field(key: "s3EncryptionKeyId")]
        getter s3_encryption_key_id : String?

        def initialize(
          @s3_uri : String,
          @s3_bucket_owner : String? = nil,
          @s3_encryption_key_id : String? = nil
        )
        end
      end

      # A summary of a batch inference job.

      struct ModelInvocationJobSummary
        include JSON::Serializable

        # Details about the location of the input to the batch inference job.

        @[JSON::Field(key: "inputDataConfig")]
        getter input_data_config : Types::ModelInvocationJobInputDataConfig

        # The Amazon Resource Name (ARN) of the batch inference job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The name of the batch inference job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The unique identifier of the foundation model used for model inference.

        @[JSON::Field(key: "modelId")]
        getter model_id : String

        # Details about the location of the output of the batch inference job.

        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::ModelInvocationJobOutputDataConfig

        # The Amazon Resource Name (ARN) of the service role with permissions to carry out and manage batch
        # inference. You can use the console to create a default service role or follow the steps at Create a
        # service role for batch inference .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The time at which the batch inference job was submitted.

        @[JSON::Field(key: "submitTime")]
        getter submit_time : Time

        # A unique, case-sensitive identifier to ensure that the API request completes no more than one time.
        # If this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error. For more information, see Ensuring idempotency .

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The time at which the batch inference job ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The time at which the batch inference job times or timed out.

        @[JSON::Field(key: "jobExpirationTime")]
        getter job_expiration_time : Time?

        # The time at which the batch inference job was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # If the batch inference job failed, this field contains a message describing why the job failed.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The status of the batch inference job. The following statuses are possible: Submitted – This job has
        # been submitted to a queue for validation. Validating – This job is being validated for the
        # requirements described in Format and upload your batch inference data . The criteria include the
        # following: Your IAM service role has access to the Amazon S3 buckets containing your files. Your
        # files are .jsonl files and each individual record is a JSON object in the correct format. Note that
        # validation doesn't check if the modelInput value matches the request body for the model. Your files
        # fulfill the requirements for file size and number of records. For more information, see Quotas for
        # Amazon Bedrock . Scheduled – This job has been validated and is now in a queue. The job will
        # automatically start when it reaches its turn. Expired – This job timed out because it was scheduled
        # but didn't begin before the set timeout duration. Submit a new job request. InProgress – This job
        # has begun. You can start viewing the results in the output S3 location. Completed – This job has
        # successfully completed. View the output files in the output S3 location. PartiallyCompleted – This
        # job has partially completed. Not all of your records could be processed in time. View the output
        # files in the output S3 location. Failed – This job has failed. Check the failure message for any
        # further details. For further assistance, reach out to the Amazon Web Services Support Center .
        # Stopped – This job was stopped by a user. Stopping – This job is being stopped by a user.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The number of hours after which the batch inference job was set to time out.

        @[JSON::Field(key: "timeoutDurationInHours")]
        getter timeout_duration_in_hours : Int32?

        # The configuration of the Virtual Private Cloud (VPC) for the data in the batch inference job. For
        # more information, see Protect batch inference jobs using a VPC .

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @input_data_config : Types::ModelInvocationJobInputDataConfig,
          @job_arn : String,
          @job_name : String,
          @model_id : String,
          @output_data_config : Types::ModelInvocationJobOutputDataConfig,
          @role_arn : String,
          @submit_time : Time,
          @client_request_token : String? = nil,
          @end_time : Time? = nil,
          @job_expiration_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @timeout_duration_in_hours : Int32? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # An offer dictates usage terms for the model.

      struct Offer
        include JSON::Serializable

        # Offer token.

        @[JSON::Field(key: "offerToken")]
        getter offer_token : String

        # Details about the terms of the offer.

        @[JSON::Field(key: "termDetails")]
        getter term_details : Types::TermDetails

        # Offer Id for a model offer.

        @[JSON::Field(key: "offerId")]
        getter offer_id : String?

        def initialize(
          @offer_token : String,
          @term_details : Types::TermDetails,
          @offer_id : String? = nil
        )
        end
      end

      # The configuration details for the model to process the prompt prior to retrieval and response
      # generation.

      struct OrchestrationConfiguration
        include JSON::Serializable

        # Contains configuration details for transforming the prompt.

        @[JSON::Field(key: "queryTransformationConfiguration")]
        getter query_transformation_configuration : Types::QueryTransformationConfiguration

        def initialize(
          @query_transformation_configuration : Types::QueryTransformationConfiguration
        )
        end
      end

      # S3 Location of the output data.

      struct OutputDataConfig
        include JSON::Serializable

        # The S3 URI where the output data is stored.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # Contains performance settings for a model.

      struct PerformanceConfiguration
        include JSON::Serializable

        # Specifies whether to use the latency-optimized or standard version of a model or inference profile.

        @[JSON::Field(key: "latency")]
        getter latency : String?

        def initialize(
          @latency : String? = nil
        )
        end
      end

      # Describes the usage-based pricing term.

      struct PricingTerm
        include JSON::Serializable

        # Describes a usage price for each dimension.

        @[JSON::Field(key: "rateCard")]
        getter rate_card : Array(Types::DimensionalPriceRate)

        def initialize(
          @rate_card : Array(Types::DimensionalPriceRate)
        )
        end
      end

      # Details about a prompt router.

      struct PromptRouterSummary
        include JSON::Serializable

        # The router's fallback model.

        @[JSON::Field(key: "fallbackModel")]
        getter fallback_model : Types::PromptRouterTargetModel

        # The router's models.

        @[JSON::Field(key: "models")]
        getter models : Array(Types::PromptRouterTargetModel)

        # The router's ARN.

        @[JSON::Field(key: "promptRouterArn")]
        getter prompt_router_arn : String

        # The router's name.

        @[JSON::Field(key: "promptRouterName")]
        getter prompt_router_name : String

        # The router's routing criteria.

        @[JSON::Field(key: "routingCriteria")]
        getter routing_criteria : Types::RoutingCriteria

        # The router's status.

        @[JSON::Field(key: "status")]
        getter status : String

        # The summary's type.

        @[JSON::Field(key: "type")]
        getter type : String

        # When the router was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The router's description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # When the router was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @fallback_model : Types::PromptRouterTargetModel,
          @models : Array(Types::PromptRouterTargetModel),
          @prompt_router_arn : String,
          @prompt_router_name : String,
          @routing_criteria : Types::RoutingCriteria,
          @status : String,
          @type : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The target model for a prompt router.

      struct PromptRouterTargetModel
        include JSON::Serializable

        # The target model's ARN.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        def initialize(
          @model_arn : String
        )
        end
      end

      # The template for the prompt that's sent to the model for response generation.

      struct PromptTemplate
        include JSON::Serializable

        # The template for the prompt that's sent to the model for response generation. You can include prompt
        # placeholders, which become replaced before the prompt is sent to the model to provide instructions
        # and context to the model. In addition, you can include XML tags to delineate meaningful sections of
        # the prompt template. For more information, see Knowledge base prompt template and Use XML tags with
        # Anthropic Claude models .

        @[JSON::Field(key: "textPromptTemplate")]
        getter text_prompt_template : String?

        def initialize(
          @text_prompt_template : String? = nil
        )
        end
      end

      # A summary of information about a Provisioned Throughput. This data type is used in the following API
      # operations: ListProvisionedThroughputs response

      struct ProvisionedModelSummary
        include JSON::Serializable

        # The time that the Provisioned Throughput was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the model requested to be associated to this Provisioned
        # Throughput. This value differs from the modelArn if updating hasn't completed.

        @[JSON::Field(key: "desiredModelArn")]
        getter desired_model_arn : String

        # The number of model units that was requested to be allocated to the Provisioned Throughput.

        @[JSON::Field(key: "desiredModelUnits")]
        getter desired_model_units : Int32

        # The Amazon Resource Name (ARN) of the base model for which the Provisioned Throughput was created,
        # or of the base model that the custom model for which the Provisioned Throughput was created was
        # customized.

        @[JSON::Field(key: "foundationModelArn")]
        getter foundation_model_arn : String

        # The time that the Provisioned Throughput was last modified.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The Amazon Resource Name (ARN) of the model associated with the Provisioned Throughput.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # The number of model units allocated to the Provisioned Throughput.

        @[JSON::Field(key: "modelUnits")]
        getter model_units : Int32

        # The Amazon Resource Name (ARN) of the Provisioned Throughput.

        @[JSON::Field(key: "provisionedModelArn")]
        getter provisioned_model_arn : String

        # The name of the Provisioned Throughput.

        @[JSON::Field(key: "provisionedModelName")]
        getter provisioned_model_name : String

        # The status of the Provisioned Throughput.

        @[JSON::Field(key: "status")]
        getter status : String

        # The duration for which the Provisioned Throughput was committed.

        @[JSON::Field(key: "commitmentDuration")]
        getter commitment_duration : String?

        # The timestamp for when the commitment term of the Provisioned Throughput expires.

        @[JSON::Field(key: "commitmentExpirationTime")]
        getter commitment_expiration_time : Time?

        def initialize(
          @creation_time : Time,
          @desired_model_arn : String,
          @desired_model_units : Int32,
          @foundation_model_arn : String,
          @last_modified_time : Time,
          @model_arn : String,
          @model_units : Int32,
          @provisioned_model_arn : String,
          @provisioned_model_name : String,
          @status : String,
          @commitment_duration : String? = nil,
          @commitment_expiration_time : Time? = nil
        )
        end
      end


      struct PutEnforcedGuardrailConfigurationRequest
        include JSON::Serializable

        # Account-level enforced guardrail input configuration.

        @[JSON::Field(key: "guardrailInferenceConfig")]
        getter guardrail_inference_config : Types::AccountEnforcedGuardrailInferenceInputConfiguration

        # Unique ID for the account enforced configuration.

        @[JSON::Field(key: "configId")]
        getter config_id : String?

        def initialize(
          @guardrail_inference_config : Types::AccountEnforcedGuardrailInferenceInputConfiguration,
          @config_id : String? = nil
        )
        end
      end


      struct PutEnforcedGuardrailConfigurationResponse
        include JSON::Serializable

        # Unique ID for the account enforced configuration.

        @[JSON::Field(key: "configId")]
        getter config_id : String?

        # Timestamp.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The ARN of the role used to update the configuration.

        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @config_id : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end


      struct PutModelInvocationLoggingConfigurationRequest
        include JSON::Serializable

        # The logging configuration values to set.

        @[JSON::Field(key: "loggingConfig")]
        getter logging_config : Types::LoggingConfig

        def initialize(
          @logging_config : Types::LoggingConfig
        )
        end
      end


      struct PutModelInvocationLoggingConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutUseCaseForModelAccessRequest
        include JSON::Serializable

        # Put customer profile Request.

        @[JSON::Field(key: "formData")]
        getter form_data : Bytes

        def initialize(
          @form_data : Bytes
        )
        end
      end


      struct PutUseCaseForModelAccessResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration details for transforming the prompt.

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

      # Contains configuration details for retrieval of information and response generation.

      struct RAGConfig
        include JSON::Serializable

        # Contains configuration details for knowledge base retrieval and response generation.

        @[JSON::Field(key: "knowledgeBaseConfig")]
        getter knowledge_base_config : Types::KnowledgeBaseConfig?

        # Contains configuration details about the RAG source used to generate inference response data for a
        # Knowledge Base evaluation job.

        @[JSON::Field(key: "precomputedRagSourceConfig")]
        getter precomputed_rag_source_config : Types::EvaluationPrecomputedRagSourceConfig?

        def initialize(
          @knowledge_base_config : Types::KnowledgeBaseConfig? = nil,
          @precomputed_rag_source_config : Types::EvaluationPrecomputedRagSourceConfig? = nil
        )
        end
      end

      # Configuration settings for reinforcement fine-tuning (RFT), including grader configuration and
      # training hyperparameters.

      struct RFTConfig
        include JSON::Serializable

        # Configuration for the grader that evaluates model responses and provides reward signals during RFT
        # training.

        @[JSON::Field(key: "graderConfig")]
        getter grader_config : Types::GraderConfig?

        # Hyperparameters that control the reinforcement fine-tuning training process, including learning
        # rate, batch size, and epoch count.

        @[JSON::Field(key: "hyperParameters")]
        getter hyper_parameters : Types::RFTHyperParameters?

        def initialize(
          @grader_config : Types::GraderConfig? = nil,
          @hyper_parameters : Types::RFTHyperParameters? = nil
        )
        end
      end

      # Hyperparameters for controlling the reinforcement fine-tuning training process, including learning
      # settings and evaluation intervals.

      struct RFTHyperParameters
        include JSON::Serializable

        # Number of training samples processed in each batch during reinforcement fine-tuning (RFT) training.
        # Larger batches may improve training stability.

        @[JSON::Field(key: "batchSize")]
        getter batch_size : Int32?

        # Number of training epochs to run during reinforcement fine-tuning. Higher values may improve
        # performance but increase training time.

        @[JSON::Field(key: "epochCount")]
        getter epoch_count : Int32?

        # Interval between evaluation runs during RFT training, measured in training steps. More frequent
        # evaluation provides better monitoring.

        @[JSON::Field(key: "evalInterval")]
        getter eval_interval : Int32?

        # Maximum number of tokens the model can generate in response to each prompt during RFT training.

        @[JSON::Field(key: "inferenceMaxTokens")]
        getter inference_max_tokens : Int32?

        # Learning rate for the reinforcement fine-tuning. Controls how quickly the model adapts to reward
        # signals.

        @[JSON::Field(key: "learningRate")]
        getter learning_rate : Float64?

        # Maximum length of input prompts during RFT training, measured in tokens. Longer prompts allow more
        # context but increase memory usage and training-time.

        @[JSON::Field(key: "maxPromptLength")]
        getter max_prompt_length : Int32?

        # Level of reasoning effort applied during RFT training. Higher values may improve response quality
        # but increase training time.

        @[JSON::Field(key: "reasoningEffort")]
        getter reasoning_effort : String?

        # Number of response samples generated per prompt during RFT training. More samples provide better
        # reward signal estimation.

        @[JSON::Field(key: "trainingSamplePerPrompt")]
        getter training_sample_per_prompt : Int32?

        def initialize(
          @batch_size : Int32? = nil,
          @epoch_count : Int32? = nil,
          @eval_interval : Int32? = nil,
          @inference_max_tokens : Int32? = nil,
          @learning_rate : Float64? = nil,
          @max_prompt_length : Int32? = nil,
          @reasoning_effort : String? = nil,
          @training_sample_per_prompt : Int32? = nil
        )
        end
      end

      # Defines the value and corresponding definition for one rating in a custom metric rating scale.

      struct RatingScaleItem
        include JSON::Serializable

        # Defines the definition for one rating in a custom metric rating scale.

        @[JSON::Field(key: "definition")]
        getter definition : String

        # Defines the value for one rating in a custom metric rating scale.

        @[JSON::Field(key: "value")]
        getter value : Types::RatingScaleItemValue

        def initialize(
          @definition : String,
          @value : Types::RatingScaleItemValue
        )
        end
      end

      # Defines the value for one rating in a custom metric rating scale.

      struct RatingScaleItemValue
        include JSON::Serializable

        # A floating point number representing the value for a rating in a custom metric rating scale.

        @[JSON::Field(key: "floatValue")]
        getter float_value : Float64?

        # A string representing the value for a rating in a custom metric rating scale.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @float_value : Float64? = nil,
          @string_value : String? = nil
        )
        end
      end


      struct RegisterMarketplaceModelEndpointRequest
        include JSON::Serializable

        # The ARN of the Amazon SageMaker endpoint you want to register with Amazon Bedrock Marketplace.

        @[JSON::Field(key: "endpointIdentifier")]
        getter endpoint_identifier : String

        # The ARN of the model from Amazon Bedrock Marketplace that is deployed on the endpoint.

        @[JSON::Field(key: "modelSourceIdentifier")]
        getter model_source_identifier : String

        def initialize(
          @endpoint_identifier : String,
          @model_source_identifier : String
        )
        end
      end


      struct RegisterMarketplaceModelEndpointResponse
        include JSON::Serializable

        # Details about the registered endpoint.

        @[JSON::Field(key: "marketplaceModelEndpoint")]
        getter marketplace_model_endpoint : Types::MarketplaceModelEndpoint

        def initialize(
          @marketplace_model_endpoint : Types::MarketplaceModelEndpoint
        )
        end
      end

      # A mapping of a metadata key to a value that it should or should not equal.

      struct RequestMetadataBaseFilters
        include JSON::Serializable

        # Include results where the key equals the value.

        @[JSON::Field(key: "equals")]
        getter equals : Hash(String, String)?

        # Include results where the key does not equal the value.

        @[JSON::Field(key: "notEquals")]
        getter not_equals : Hash(String, String)?

        def initialize(
          @equals : Hash(String, String)? = nil,
          @not_equals : Hash(String, String)? = nil
        )
        end
      end

      # Rules for filtering invocation logs. A filter can be a mapping of a metadata key to a value that it
      # should or should not equal (a base filter), or a list of base filters that are all applied with AND
      # or OR logical operators

      struct RequestMetadataFilters
        include JSON::Serializable

        # Include results where all of the based filters match.

        @[JSON::Field(key: "andAll")]
        getter and_all : Array(Types::RequestMetadataBaseFilters)?

        # Include results where the key equals the value.

        @[JSON::Field(key: "equals")]
        getter equals : Hash(String, String)?

        # Include results where the key does not equal the value.

        @[JSON::Field(key: "notEquals")]
        getter not_equals : Hash(String, String)?

        # Include results where any of the base filters match.

        @[JSON::Field(key: "orAll")]
        getter or_all : Array(Types::RequestMetadataBaseFilters)?

        def initialize(
          @and_all : Array(Types::RequestMetadataBaseFilters)? = nil,
          @equals : Hash(String, String)? = nil,
          @not_equals : Hash(String, String)? = nil,
          @or_all : Array(Types::RequestMetadataBaseFilters)? = nil
        )
        end
      end

      # Configuration for selectively including or excluding metadata fields during the reranking process.
      # This allows you to control which metadata attributes are considered when reordering search results.

      struct RerankingMetadataSelectiveModeConfiguration
        include JSON::Serializable

        # A list of metadata field names to explicitly exclude from the reranking process. All metadata fields
        # except these will be considered when reordering search results. This parameter cannot be used
        # together with fieldsToInclude.

        @[JSON::Field(key: "fieldsToExclude")]
        getter fields_to_exclude : Array(Types::FieldForReranking)?

        # A list of metadata field names to explicitly include in the reranking process. Only these fields
        # will be considered when reordering search results. This parameter cannot be used together with
        # fieldsToExclude.

        @[JSON::Field(key: "fieldsToInclude")]
        getter fields_to_include : Array(Types::FieldForReranking)?

        def initialize(
          @fields_to_exclude : Array(Types::FieldForReranking)? = nil,
          @fields_to_include : Array(Types::FieldForReranking)? = nil
        )
        end
      end

      # Thrown when attempting to delete or modify a resource that is currently being used by other
      # resources or operations. For example, trying to delete an Automated Reasoning policy that is
      # referenced by an active guardrail.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
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

      # Specifies the filters to use on the metadata attributes/fields in the knowledge base data sources
      # before returning results.

      struct RetrievalFilter
        include JSON::Serializable

        # Knowledge base data sources are returned if their metadata attributes fulfill all the filter
        # conditions inside this list.

        @[JSON::Field(key: "andAll")]
        getter and_all : Array(Types::RetrievalFilter)?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value matches the value in this object. The following example would return data
        # sources with an animal attribute whose value is 'cat': "equals": { "key": "animal", "value": "cat" }

        @[JSON::Field(key: "equals")]
        getter equals : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is greater than the value in this object. The following example would return
        # data sources with an year attribute whose value is greater than '1989': "greaterThan": { "key":
        # "year", "value": 1989 }

        @[JSON::Field(key: "greaterThan")]
        getter greater_than : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is greater than or equal to the value in this object. The following example
        # would return data sources with an year attribute whose value is greater than or equal to '1989':
        # "greaterThanOrEquals": { "key": "year", "value": 1989 }

        @[JSON::Field(key: "greaterThanOrEquals")]
        getter greater_than_or_equals : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is in the list specified in the value in this object. The following example
        # would return data sources with an animal attribute that is either 'cat' or 'dog': "in": { "key":
        # "animal", "value": ["cat", "dog"] }

        @[JSON::Field(key: "in")]
        getter in : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is less than the value in this object. The following example would return data
        # sources with an year attribute whose value is less than to '1989': "lessThan": { "key": "year",
        # "value": 1989 }

        @[JSON::Field(key: "lessThan")]
        getter less_than : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is less than or equal to the value in this object. The following example would
        # return data sources with an year attribute whose value is less than or equal to '1989':
        # "lessThanOrEquals": { "key": "year", "value": 1989 }

        @[JSON::Field(key: "lessThanOrEquals")]
        getter less_than_or_equals : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is a list that contains the value as one of its members. The following example
        # would return data sources with an animals attribute that is a list containing a cat member (for
        # example, ["dog", "cat"] ): "listContains": { "key": "animals", "value": "cat" }

        @[JSON::Field(key: "listContains")]
        getter list_contains : Types::FilterAttribute?

        # Knowledge base data sources that contain a metadata attribute whose name matches the key and whose
        # value doesn't match the value in this object are returned. The following example would return data
        # sources that don't contain an animal attribute whose value is 'cat': "notEquals": { "key": "animal",
        # "value": "cat" }

        @[JSON::Field(key: "notEquals")]
        getter not_equals : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value isn't in the list specified in the value in this object. The following example
        # would return data sources whose animal attribute is neither 'cat' nor 'dog': "notIn": { "key":
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
        # an animal attribute starts with 'ca' (for example, 'cat' or 'camel'). "startsWith": { "key":
        # "animal", "value": "ca" }

        @[JSON::Field(key: "startsWith")]
        getter starts_with : Types::FilterAttribute?

        # Knowledge base data sources are returned if they contain a metadata attribute whose name matches the
        # key and whose value is one of the following: A string that contains the value as a substring. The
        # following example would return data sources with an animal attribute that contains the substring at
        # (for example, 'cat'): "stringContains": { "key": "animal", "value": "at" } A list with a member that
        # contains the value as a substring. The following example would return data sources with an animals
        # attribute that is a list containing a member that contains the substring at (for example, ["dog",
        # "cat"] ): "stringContains": { "key": "animals", "value": "at" }

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

      # Contains configuration details for a knowledge base retrieval and response generation.

      struct RetrieveAndGenerateConfiguration
        include JSON::Serializable

        # The type of resource that contains your data for retrieving information and generating responses. If
        # you choose to use EXTERNAL_SOURCES , then currently only Claude 3 Sonnet models for knowledge bases
        # are supported.

        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration for the external source wrapper object in the retrieveAndGenerate function.

        @[JSON::Field(key: "externalSourcesConfiguration")]
        getter external_sources_configuration : Types::ExternalSourcesRetrieveAndGenerateConfiguration?

        # Contains configuration details for the knowledge base retrieval and response generation.

        @[JSON::Field(key: "knowledgeBaseConfiguration")]
        getter knowledge_base_configuration : Types::KnowledgeBaseRetrieveAndGenerateConfiguration?

        def initialize(
          @type : String,
          @external_sources_configuration : Types::ExternalSourcesRetrieveAndGenerateConfiguration? = nil,
          @knowledge_base_configuration : Types::KnowledgeBaseRetrieveAndGenerateConfiguration? = nil
        )
        end
      end

      # The configuration details for retrieving information from a knowledge base.

      struct RetrieveConfig
        include JSON::Serializable

        # The unique identifier of the knowledge base.

        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # Contains configuration details for knowledge base retrieval.

        @[JSON::Field(key: "knowledgeBaseRetrievalConfiguration")]
        getter knowledge_base_retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration

        def initialize(
          @knowledge_base_id : String,
          @knowledge_base_retrieval_configuration : Types::KnowledgeBaseRetrievalConfiguration
        )
        end
      end

      # Routing criteria for a prompt router.

      struct RoutingCriteria
        include JSON::Serializable

        # The criteria's response quality difference.

        @[JSON::Field(key: "responseQualityDifference")]
        getter response_quality_difference : Float64

        def initialize(
          @response_quality_difference : Float64
        )
        end
      end

      # S3 configuration for storing log data.

      struct S3Config
        include JSON::Serializable

        # S3 bucket name.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # S3 prefix.

        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket_name : String,
          @key_prefix : String? = nil
        )
        end
      end

      # The Amazon S3 data source of the model to import.

      struct S3DataSource
        include JSON::Serializable

        # The URI of the Amazon S3 data source.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # The unique wrapper object of the document from the S3 location.

      struct S3ObjectDoc
        include JSON::Serializable

        # The S3 URI location for the wrapper object of the document.

        @[JSON::Field(key: "uri")]
        getter uri : String

        def initialize(
          @uri : String
        )
        end
      end

      # Specifies the configuration for a Amazon SageMaker endpoint.

      struct SageMakerEndpoint
        include JSON::Serializable

        # The ARN of the IAM role that Amazon SageMaker can assume to access model artifacts and docker image
        # for deployment on Amazon EC2 compute instances or for batch transform jobs.

        @[JSON::Field(key: "executionRole")]
        getter execution_role : String

        # The number of Amazon EC2 compute instances to deploy for initial endpoint creation.

        @[JSON::Field(key: "initialInstanceCount")]
        getter initial_instance_count : Int32

        # The Amazon EC2 compute instance type to deploy for hosting the model.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The Amazon Web Services KMS key that Amazon SageMaker uses to encrypt data on the storage volume
        # attached to the Amazon EC2 compute instance that hosts the endpoint.

        @[JSON::Field(key: "kmsEncryptionKey")]
        getter kms_encryption_key : String?

        # The VPC configuration for the endpoint.

        @[JSON::Field(key: "vpc")]
        getter vpc : Types::VpcConfig?

        def initialize(
          @execution_role : String,
          @initial_instance_count : Int32,
          @instance_type : String,
          @kms_encryption_key : String? = nil,
          @vpc : Types::VpcConfig? = nil
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

      # Returned if the service cannot complete the request.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartAutomatedReasoningPolicyBuildWorkflowRequest
        include JSON::Serializable

        # The type of build workflow to start (e.g., DOCUMENT_INGESTION for processing new documents,
        # POLICY_REPAIR for fixing existing policies).

        @[JSON::Field(key: "buildWorkflowType")]
        getter build_workflow_type : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy for which to start the build
        # workflow.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The source content for the build workflow, such as documents to analyze or repair instructions for
        # existing policies.

        @[JSON::Field(key: "sourceContent")]
        getter source_content : Types::AutomatedReasoningPolicyBuildWorkflowSource

        # A unique, case-sensitive identifier to ensure that the operation completes no more than once. If
        # this token matches a previous request, Amazon Bedrock ignores the request but doesn't return an
        # error.

        @[JSON::Field(key: "x-amz-client-token")]
        getter client_request_token : String?

        def initialize(
          @build_workflow_type : String,
          @policy_arn : String,
          @source_content : Types::AutomatedReasoningPolicyBuildWorkflowSource,
          @client_request_token : String? = nil
        )
        end
      end


      struct StartAutomatedReasoningPolicyBuildWorkflowResponse
        include JSON::Serializable

        # The unique identifier of the newly started build workflow. Use this ID to track the workflow's
        # progress and retrieve its results.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @build_workflow_id : String,
          @policy_arn : String
        )
        end
      end


      struct StartAutomatedReasoningPolicyTestWorkflowRequest
        include JSON::Serializable

        # The build workflow identifier. The build workflow must show a COMPLETED status before running tests.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy to test.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Bedrock ignores the request but doesn't return an
        # error.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The list of test identifiers to run. If not provided, all tests for the policy are run.

        @[JSON::Field(key: "testCaseIds")]
        getter test_case_ids : Array(String)?

        def initialize(
          @build_workflow_id : String,
          @policy_arn : String,
          @client_request_token : String? = nil,
          @test_case_ids : Array(String)? = nil
        )
        end
      end


      struct StartAutomatedReasoningPolicyTestWorkflowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the policy for which the test workflow was started.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @policy_arn : String
        )
        end
      end

      # For a Distillation job, the status details for sub-tasks of the job. Possible statuses for each
      # sub-task include the following: NotStarted InProgress Completed Stopping Stopped Failed

      struct StatusDetails
        include JSON::Serializable

        # The status details for the data processing sub-task of the job.

        @[JSON::Field(key: "dataProcessingDetails")]
        getter data_processing_details : Types::DataProcessingDetails?

        # The status details for the training sub-task of the job.

        @[JSON::Field(key: "trainingDetails")]
        getter training_details : Types::TrainingDetails?

        # The status details for the validation sub-task of the job.

        @[JSON::Field(key: "validationDetails")]
        getter validation_details : Types::ValidationDetails?

        def initialize(
          @data_processing_details : Types::DataProcessingDetails? = nil,
          @training_details : Types::TrainingDetails? = nil,
          @validation_details : Types::ValidationDetails? = nil
        )
        end
      end


      struct StopEvaluationJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the evaluation job you want to stop.

        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        def initialize(
          @job_identifier : String
        )
        end
      end


      struct StopEvaluationJobResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StopModelCustomizationJobRequest
        include JSON::Serializable

        # Job identifier of the job to stop.

        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        def initialize(
          @job_identifier : String
        )
        end
      end


      struct StopModelCustomizationJobResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StopModelInvocationJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the batch inference job to stop.

        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        def initialize(
          @job_identifier : String
        )
        end
      end


      struct StopModelInvocationJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a support term.

      struct SupportTerm
        include JSON::Serializable

        # Describes the refund policy.

        @[JSON::Field(key: "refundPolicyDescription")]
        getter refund_policy_description : String?

        def initialize(
          @refund_policy_description : String? = nil
        )
        end
      end

      # Definition of the key/value pair for a tag.

      struct Tag
        include JSON::Serializable

        # Key for the tag.

        @[JSON::Field(key: "key")]
        getter key : String

        # Value for the tag.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to tag.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # Tags to associate with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Details about a teacher model used for model customization.

      struct TeacherModelConfig
        include JSON::Serializable

        # The identifier of the teacher model.

        @[JSON::Field(key: "teacherModelIdentifier")]
        getter teacher_model_identifier : String

        # The maximum number of tokens requested when the customization job invokes the teacher model.

        @[JSON::Field(key: "maxResponseLengthForInference")]
        getter max_response_length_for_inference : Int32?

        def initialize(
          @teacher_model_identifier : String,
          @max_response_length_for_inference : Int32? = nil
        )
        end
      end

      # Describes the usage terms of an offer.

      struct TermDetails
        include JSON::Serializable

        # Describes the legal terms.

        @[JSON::Field(key: "legalTerm")]
        getter legal_term : Types::LegalTerm

        # Describes the support terms.

        @[JSON::Field(key: "supportTerm")]
        getter support_term : Types::SupportTerm


        @[JSON::Field(key: "usageBasedPricingTerm")]
        getter usage_based_pricing_term : Types::PricingTerm

        # Describes the validity terms.

        @[JSON::Field(key: "validityTerm")]
        getter validity_term : Types::ValidityTerm?

        def initialize(
          @legal_term : Types::LegalTerm,
          @support_term : Types::SupportTerm,
          @usage_based_pricing_term : Types::PricingTerm,
          @validity_term : Types::ValidityTerm? = nil
        )
        end
      end

      # The configuration details for text generation using a language model via the RetrieveAndGenerate
      # function.

      struct TextInferenceConfig
        include JSON::Serializable

        # The maximum number of tokens to generate in the output text. Do not use the minimum of 0 or the
        # maximum of 65536. The limit values described here are arbitrary values, for actual values consult
        # the limits defined by your specific model.

        @[JSON::Field(key: "maxTokens")]
        getter max_tokens : Int32?

        # A list of sequences of characters that, if generated, will cause the model to stop generating
        # further tokens. Do not use a minimum length of 1 or a maximum length of 1000. The limit values
        # described here are arbitrary values, for actual values consult the limits defined by your specific
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

      # The request contains more tags than can be associated with a resource (50 tags per resource). The
      # maximum number of tags includes both existing tags and those included in your current request.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the resource with too many tags.

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # S3 Location of the training data.

      struct TrainingDataConfig
        include JSON::Serializable

        # Settings for using invocation logs to customize a model.

        @[JSON::Field(key: "invocationLogsConfig")]
        getter invocation_logs_config : Types::InvocationLogsConfig?

        # The S3 URI where the training data is stored.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String?

        def initialize(
          @invocation_logs_config : Types::InvocationLogsConfig? = nil,
          @s3_uri : String? = nil
        )
        end
      end

      # For a Distillation job, the status details for the training sub-task of the job.

      struct TrainingDetails
        include JSON::Serializable

        # The start time of the training sub-task of the job.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The latest update to the training sub-task of the job.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The status of the training sub-task of the job.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Metrics associated with the custom job.

      struct TrainingMetrics
        include JSON::Serializable

        # Loss metric associated with the custom job.

        @[JSON::Field(key: "trainingLoss")]
        getter training_loss : Float64?

        def initialize(
          @training_loss : Float64? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to untag.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # Tag keys of the tags to remove from the resource.

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


      struct UpdateAutomatedReasoningPolicyAnnotationsRequest
        include JSON::Serializable

        # The updated annotations containing modified rules, variables, and types for the policy.

        @[JSON::Field(key: "annotations")]
        getter annotations : Array(Types::AutomatedReasoningPolicyAnnotation)

        # The unique identifier of the build workflow whose annotations you want to update.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The hash value of the annotation set that you're updating. This is used for optimistic concurrency
        # control to prevent conflicting updates.

        @[JSON::Field(key: "lastUpdatedAnnotationSetHash")]
        getter last_updated_annotation_set_hash : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy whose annotations you want to
        # update.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        def initialize(
          @annotations : Array(Types::AutomatedReasoningPolicyAnnotation),
          @build_workflow_id : String,
          @last_updated_annotation_set_hash : String,
          @policy_arn : String
        )
        end
      end


      struct UpdateAutomatedReasoningPolicyAnnotationsResponse
        include JSON::Serializable

        # The new hash value representing the updated state of the annotations.

        @[JSON::Field(key: "annotationSetHash")]
        getter annotation_set_hash : String

        # The unique identifier of the build workflow.

        @[JSON::Field(key: "buildWorkflowId")]
        getter build_workflow_id : String

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The timestamp when the annotations were updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @annotation_set_hash : String,
          @build_workflow_id : String,
          @policy_arn : String,
          @updated_at : Time
        )
        end
      end


      struct UpdateAutomatedReasoningPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy to update. This must be the ARN of
        # a draft policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The updated policy definition containing the formal logic rules, variables, and types.

        @[JSON::Field(key: "policyDefinition")]
        getter policy_definition : Types::AutomatedReasoningPolicyDefinition

        # The updated description for the Automated Reasoning policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated name for the Automated Reasoning policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @policy_arn : String,
          @policy_definition : Types::AutomatedReasoningPolicyDefinition,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateAutomatedReasoningPolicyResponse
        include JSON::Serializable

        # The hash of the updated policy definition.

        @[JSON::Field(key: "definitionHash")]
        getter definition_hash : String

        # The updated name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the updated policy.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The timestamp when the policy was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @definition_hash : String,
          @name : String,
          @policy_arn : String,
          @updated_at : Time
        )
        end
      end


      struct UpdateAutomatedReasoningPolicyTestCaseRequest
        include JSON::Serializable

        # The updated expected result of the Automated Reasoning check.

        @[JSON::Field(key: "expectedAggregatedFindingsResult")]
        getter expected_aggregated_findings_result : String

        # The updated content to be validated by the Automated Reasoning policy.

        @[JSON::Field(key: "guardContent")]
        getter guard_content : String

        # The timestamp when the test was last updated. This is used as a concurrency token to prevent
        # conflicting modifications.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The Amazon Resource Name (ARN) of the Automated Reasoning policy that contains the test.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The unique identifier of the test to update.

        @[JSON::Field(key: "testCaseId")]
        getter test_case_id : String

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Bedrock ignores the request, but does not return an
        # error.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The updated minimum confidence level for logic validation. If null is provided, the threshold will
        # be removed.

        @[JSON::Field(key: "confidenceThreshold")]
        getter confidence_threshold : Float64?

        # The updated input query or prompt that generated the content.

        @[JSON::Field(key: "queryContent")]
        getter query_content : String?

        def initialize(
          @expected_aggregated_findings_result : String,
          @guard_content : String,
          @last_updated_at : Time,
          @policy_arn : String,
          @test_case_id : String,
          @client_request_token : String? = nil,
          @confidence_threshold : Float64? = nil,
          @query_content : String? = nil
        )
        end
      end


      struct UpdateAutomatedReasoningPolicyTestCaseResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the policy that contains the updated test.

        @[JSON::Field(key: "policyArn")]
        getter policy_arn : String

        # The unique identifier of the updated test.

        @[JSON::Field(key: "testCaseId")]
        getter test_case_id : String

        def initialize(
          @policy_arn : String,
          @test_case_id : String
        )
        end
      end


      struct UpdateCustomModelDeploymentRequest
        include JSON::Serializable

        # Identifier of the custom model deployment to update with the new custom model.

        @[JSON::Field(key: "customModelDeploymentIdentifier")]
        getter custom_model_deployment_identifier : String

        # ARN of the new custom model to deploy. This replaces the currently deployed model.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        def initialize(
          @custom_model_deployment_identifier : String,
          @model_arn : String
        )
        end
      end


      struct UpdateCustomModelDeploymentResponse
        include JSON::Serializable

        # ARN of the custom model deployment being updated.

        @[JSON::Field(key: "customModelDeploymentArn")]
        getter custom_model_deployment_arn : String

        def initialize(
          @custom_model_deployment_arn : String
        )
        end
      end


      struct UpdateGuardrailRequest
        include JSON::Serializable

        # The message to return when the guardrail blocks a prompt.

        @[JSON::Field(key: "blockedInputMessaging")]
        getter blocked_input_messaging : String

        # The message to return when the guardrail blocks a model response.

        @[JSON::Field(key: "blockedOutputsMessaging")]
        getter blocked_outputs_messaging : String

        # The unique identifier of the guardrail. This can be an ID or the ARN.

        @[JSON::Field(key: "guardrailIdentifier")]
        getter guardrail_identifier : String

        # A name for the guardrail.

        @[JSON::Field(key: "name")]
        getter name : String

        # Updated configuration for Automated Reasoning policies associated with the guardrail.

        @[JSON::Field(key: "automatedReasoningPolicyConfig")]
        getter automated_reasoning_policy_config : Types::GuardrailAutomatedReasoningPolicyConfig?

        # The content policy to configure for the guardrail.

        @[JSON::Field(key: "contentPolicyConfig")]
        getter content_policy_config : Types::GuardrailContentPolicyConfig?

        # The contextual grounding policy configuration used to update a guardrail.

        @[JSON::Field(key: "contextualGroundingPolicyConfig")]
        getter contextual_grounding_policy_config : Types::GuardrailContextualGroundingPolicyConfig?

        # The system-defined guardrail profile that you're using with your guardrail. Guardrail profiles
        # define the destination Amazon Web Services Regions where guardrail inference requests can be
        # automatically routed. For more information, see the Amazon Bedrock User Guide .

        @[JSON::Field(key: "crossRegionConfig")]
        getter cross_region_config : Types::GuardrailCrossRegionConfig?

        # A description of the guardrail.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the KMS key with which to encrypt the guardrail.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The sensitive information policy to configure for the guardrail.

        @[JSON::Field(key: "sensitiveInformationPolicyConfig")]
        getter sensitive_information_policy_config : Types::GuardrailSensitiveInformationPolicyConfig?

        # The topic policy to configure for the guardrail.

        @[JSON::Field(key: "topicPolicyConfig")]
        getter topic_policy_config : Types::GuardrailTopicPolicyConfig?

        # The word policy to configure for the guardrail.

        @[JSON::Field(key: "wordPolicyConfig")]
        getter word_policy_config : Types::GuardrailWordPolicyConfig?

        def initialize(
          @blocked_input_messaging : String,
          @blocked_outputs_messaging : String,
          @guardrail_identifier : String,
          @name : String,
          @automated_reasoning_policy_config : Types::GuardrailAutomatedReasoningPolicyConfig? = nil,
          @content_policy_config : Types::GuardrailContentPolicyConfig? = nil,
          @contextual_grounding_policy_config : Types::GuardrailContextualGroundingPolicyConfig? = nil,
          @cross_region_config : Types::GuardrailCrossRegionConfig? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @sensitive_information_policy_config : Types::GuardrailSensitiveInformationPolicyConfig? = nil,
          @topic_policy_config : Types::GuardrailTopicPolicyConfig? = nil,
          @word_policy_config : Types::GuardrailWordPolicyConfig? = nil
        )
        end
      end


      struct UpdateGuardrailResponse
        include JSON::Serializable

        # The ARN of the guardrail.

        @[JSON::Field(key: "guardrailArn")]
        getter guardrail_arn : String

        # The unique identifier of the guardrail

        @[JSON::Field(key: "guardrailId")]
        getter guardrail_id : String

        # The date and time at which the guardrail was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The version of the guardrail.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @guardrail_arn : String,
          @guardrail_id : String,
          @updated_at : Time,
          @version : String
        )
        end
      end


      struct UpdateMarketplaceModelEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint you want to update.

        @[JSON::Field(key: "endpointArn")]
        getter endpoint_arn : String

        # The new configuration for the endpoint, including the number and type of instances to use.

        @[JSON::Field(key: "endpointConfig")]
        getter endpoint_config : Types::EndpointConfig

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. This
        # token is listed as not required because Amazon Web Services SDKs automatically generate it for you
        # and set this parameter. If you're not using the Amazon Web Services SDK or the CLI, you must provide
        # this token or the action will fail.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @endpoint_arn : String,
          @endpoint_config : Types::EndpointConfig,
          @client_request_token : String? = nil
        )
        end
      end


      struct UpdateMarketplaceModelEndpointResponse
        include JSON::Serializable

        # Details about the updated endpoint.

        @[JSON::Field(key: "marketplaceModelEndpoint")]
        getter marketplace_model_endpoint : Types::MarketplaceModelEndpoint

        def initialize(
          @marketplace_model_endpoint : Types::MarketplaceModelEndpoint
        )
        end
      end


      struct UpdateProvisionedModelThroughputRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or name of the Provisioned Throughput to update.

        @[JSON::Field(key: "provisionedModelId")]
        getter provisioned_model_id : String

        # The Amazon Resource Name (ARN) of the new model to associate with this Provisioned Throughput. You
        # can't specify this field if this Provisioned Throughput is associated with a base model. If this
        # Provisioned Throughput is associated with a custom model, you can specify one of the following
        # options: The base model from which the custom model was customized. Another custom model that was
        # customized from the same base model as the custom model.

        @[JSON::Field(key: "desiredModelId")]
        getter desired_model_id : String?

        # The new name for this Provisioned Throughput.

        @[JSON::Field(key: "desiredProvisionedModelName")]
        getter desired_provisioned_model_name : String?

        def initialize(
          @provisioned_model_id : String,
          @desired_model_id : String? = nil,
          @desired_provisioned_model_name : String? = nil
        )
        end
      end


      struct UpdateProvisionedModelThroughputResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Array of up to 10 validators.

      struct ValidationDataConfig
        include JSON::Serializable

        # Information about the validators.

        @[JSON::Field(key: "validators")]
        getter validators : Array(Types::Validator)

        def initialize(
          @validators : Array(Types::Validator)
        )
        end
      end

      # For a Distillation job, the status details for the validation sub-task of the job.

      struct ValidationDetails
        include JSON::Serializable

        # The start time of the validation sub-task of the job.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The latest update to the validation sub-task of the job.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time?

        # The status of the validation sub-task of the job.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @status : String? = nil
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

      # Information about a validator.

      struct Validator
        include JSON::Serializable

        # The S3 URI where the validation data is stored.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # The metric for the validator.

      struct ValidatorMetric
        include JSON::Serializable

        # The validation loss associated with this validator.

        @[JSON::Field(key: "validationLoss")]
        getter validation_loss : Float64?

        def initialize(
          @validation_loss : Float64? = nil
        )
        end
      end

      # Describes the validity terms.

      struct ValidityTerm
        include JSON::Serializable

        # Describes the agreement duration.

        @[JSON::Field(key: "agreementDuration")]
        getter agreement_duration : String?

        def initialize(
          @agreement_duration : String? = nil
        )
        end
      end

      # Configuration for using Amazon Bedrock foundation models to rerank Knowledge Base vector search
      # results. This enables more sophisticated relevance ranking using large language models.

      struct VectorSearchBedrockRerankingConfiguration
        include JSON::Serializable

        # Configuration for the Amazon Bedrock foundation model used for reranking. This includes the model
        # ARN and any additional request fields required by the model.

        @[JSON::Field(key: "modelConfiguration")]
        getter model_configuration : Types::VectorSearchBedrockRerankingModelConfiguration

        # Configuration for how document metadata should be used during the reranking process. This determines
        # which metadata fields are included when reordering search results.

        @[JSON::Field(key: "metadataConfiguration")]
        getter metadata_configuration : Types::MetadataConfigurationForReranking?

        # The maximum number of results to rerank. This limits how many of the initial vector search results
        # will be processed by the reranking model. A smaller number improves performance but may exclude
        # potentially relevant results.

        @[JSON::Field(key: "numberOfRerankedResults")]
        getter number_of_reranked_results : Int32?

        def initialize(
          @model_configuration : Types::VectorSearchBedrockRerankingModelConfiguration,
          @metadata_configuration : Types::MetadataConfigurationForReranking? = nil,
          @number_of_reranked_results : Int32? = nil
        )
        end
      end

      # Configuration for the Amazon Bedrock foundation model used for reranking vector search results. This
      # specifies which model to use and any additional parameters required by the model.

      struct VectorSearchBedrockRerankingModelConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the foundation model to use for reranking. This model processes
        # the query and search results to determine a more relevant ordering.

        @[JSON::Field(key: "modelArn")]
        getter model_arn : String

        # A list of additional fields to include in the model request during reranking. These fields provide
        # extra context or configuration options specific to the selected foundation model.

        @[JSON::Field(key: "additionalModelRequestFields")]
        getter additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)?

        def initialize(
          @model_arn : String,
          @additional_model_request_fields : Hash(String, Types::AdditionalModelRequestFieldsValue)? = nil
        )
        end
      end

      # Configuration for reranking vector search results to improve relevance. Reranking applies additional
      # relevance models to reorder the initial vector search results based on more sophisticated criteria.

      struct VectorSearchRerankingConfiguration
        include JSON::Serializable

        # The type of reranking to apply to vector search results. Currently, the only supported value is
        # BEDROCK, which uses Amazon Bedrock foundation models for reranking.

        @[JSON::Field(key: "type")]
        getter type : String

        # Configuration for using Amazon Bedrock foundation models to rerank search results. This is required
        # when the reranking type is set to BEDROCK.

        @[JSON::Field(key: "bedrockRerankingConfiguration")]
        getter bedrock_reranking_configuration : Types::VectorSearchBedrockRerankingConfiguration?

        def initialize(
          @type : String,
          @bedrock_reranking_configuration : Types::VectorSearchBedrockRerankingConfiguration? = nil
        )
        end
      end

      # The configuration of a virtual private cloud (VPC). For more information, see Protect your data
      # using Amazon Virtual Private Cloud and Amazon Web Services PrivateLink .

      struct VpcConfig
        include JSON::Serializable

        # An array of IDs for each security group in the VPC to use.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # An array of IDs for each subnet in the VPC to use.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String)
        )
        end
      end
    end
  end
end
