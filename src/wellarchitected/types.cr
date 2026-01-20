require "json"
require "time"

module Aws
  module WellArchitected
    module Types

      # User does not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Account-level: Input for the Jira configuration.

      struct AccountJiraConfigurationInput
        include JSON::Serializable

        # Account-level: Configuration status of the Jira integration.

        @[JSON::Field(key: "IntegrationStatus")]
        getter integration_status : String?

        # Account-level: Jira issue management status.

        @[JSON::Field(key: "IssueManagementStatus")]
        getter issue_management_status : String?

        # Account-level: Jira issue management type.

        @[JSON::Field(key: "IssueManagementType")]
        getter issue_management_type : String?

        # Account-level: Jira project key to sync workloads to.

        @[JSON::Field(key: "JiraProjectKey")]
        getter jira_project_key : String?

        def initialize(
          @integration_status : String? = nil,
          @issue_management_status : String? = nil,
          @issue_management_type : String? = nil,
          @jira_project_key : String? = nil
        )
        end
      end

      # Account-level: Output configuration of the Jira integration.

      struct AccountJiraConfigurationOutput
        include JSON::Serializable

        # Account-level: Configuration status of the Jira integration.

        @[JSON::Field(key: "IntegrationStatus")]
        getter integration_status : String?

        # Account-level: Jira issue management status.

        @[JSON::Field(key: "IssueManagementStatus")]
        getter issue_management_status : String?

        # Account-level: Jira issue management type.

        @[JSON::Field(key: "IssueManagementType")]
        getter issue_management_type : String?

        # Account-level: Jira project key to sync workloads to.

        @[JSON::Field(key: "JiraProjectKey")]
        getter jira_project_key : String?

        # Account-level: Status message on configuration of the Jira integration.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # Account-level: Jira subdomain URL.

        @[JSON::Field(key: "Subdomain")]
        getter subdomain : String?

        def initialize(
          @integration_status : String? = nil,
          @issue_management_status : String? = nil,
          @issue_management_type : String? = nil,
          @jira_project_key : String? = nil,
          @status_message : String? = nil,
          @subdomain : String? = nil
        )
        end
      end

      # The choice level additional resources for a custom lens. This field does not apply to Amazon Web
      # Services official lenses.

      struct AdditionalResources
        include JSON::Serializable

        # The URLs for additional resources, either helpful resources or improvement plans, for a custom lens.
        # Up to five additional URLs can be specified.

        @[JSON::Field(key: "Content")]
        getter content : Array(Types::ChoiceContent)?

        # Type of additional resource for a custom lens.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @content : Array(Types::ChoiceContent)? = nil,
          @type : String? = nil
        )
        end
      end

      # An answer of the question.

      struct Answer
        include JSON::Serializable

        # A list of selected choices to a question in your workload.

        @[JSON::Field(key: "ChoiceAnswers")]
        getter choice_answers : Array(Types::ChoiceAnswer)?


        @[JSON::Field(key: "Choices")]
        getter choices : Array(Types::Choice)?

        # The helpful resource text to be displayed for a custom lens. This field does not apply to Amazon Web
        # Services official lenses.

        @[JSON::Field(key: "HelpfulResourceDisplayText")]
        getter helpful_resource_display_text : String?


        @[JSON::Field(key: "HelpfulResourceUrl")]
        getter helpful_resource_url : String?


        @[JSON::Field(key: "ImprovementPlanUrl")]
        getter improvement_plan_url : String?


        @[JSON::Field(key: "IsApplicable")]
        getter is_applicable : Bool?

        # Configuration of the Jira integration.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::JiraConfiguration?


        @[JSON::Field(key: "Notes")]
        getter notes : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?


        @[JSON::Field(key: "QuestionDescription")]
        getter question_description : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?


        @[JSON::Field(key: "QuestionTitle")]
        getter question_title : String?

        # The reason why the question is not applicable to your workload.

        @[JSON::Field(key: "Reason")]
        getter reason : String?


        @[JSON::Field(key: "Risk")]
        getter risk : String?


        @[JSON::Field(key: "SelectedChoices")]
        getter selected_choices : Array(String)?

        def initialize(
          @choice_answers : Array(Types::ChoiceAnswer)? = nil,
          @choices : Array(Types::Choice)? = nil,
          @helpful_resource_display_text : String? = nil,
          @helpful_resource_url : String? = nil,
          @improvement_plan_url : String? = nil,
          @is_applicable : Bool? = nil,
          @jira_configuration : Types::JiraConfiguration? = nil,
          @notes : String? = nil,
          @pillar_id : String? = nil,
          @question_description : String? = nil,
          @question_id : String? = nil,
          @question_title : String? = nil,
          @reason : String? = nil,
          @risk : String? = nil,
          @selected_choices : Array(String)? = nil
        )
        end
      end

      # An answer summary of a lens review in a workload.

      struct AnswerSummary
        include JSON::Serializable

        # A list of selected choices to a question in your workload.

        @[JSON::Field(key: "ChoiceAnswerSummaries")]
        getter choice_answer_summaries : Array(Types::ChoiceAnswerSummary)?


        @[JSON::Field(key: "Choices")]
        getter choices : Array(Types::Choice)?


        @[JSON::Field(key: "IsApplicable")]
        getter is_applicable : Bool?

        # Configuration of the Jira integration.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::JiraConfiguration?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?


        @[JSON::Field(key: "QuestionTitle")]
        getter question_title : String?

        # The type of the question.

        @[JSON::Field(key: "QuestionType")]
        getter question_type : String?

        # The reason why a choice is non-applicable to a question in your workload.

        @[JSON::Field(key: "Reason")]
        getter reason : String?


        @[JSON::Field(key: "Risk")]
        getter risk : String?


        @[JSON::Field(key: "SelectedChoices")]
        getter selected_choices : Array(String)?

        def initialize(
          @choice_answer_summaries : Array(Types::ChoiceAnswerSummary)? = nil,
          @choices : Array(Types::Choice)? = nil,
          @is_applicable : Bool? = nil,
          @jira_configuration : Types::JiraConfiguration? = nil,
          @pillar_id : String? = nil,
          @question_id : String? = nil,
          @question_title : String? = nil,
          @question_type : String? = nil,
          @reason : String? = nil,
          @risk : String? = nil,
          @selected_choices : Array(String)? = nil
        )
        end
      end

      # Input to associate lens reviews.

      struct AssociateLensesInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAliases")]
        getter lens_aliases : Array(String)


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @lens_aliases : Array(String),
          @workload_id : String
        )
        end
      end


      struct AssociateProfilesInput
        include JSON::Serializable

        # The list of profile ARNs to associate with the workload.

        @[JSON::Field(key: "ProfileArns")]
        getter profile_arns : Array(String)


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @profile_arns : Array(String),
          @workload_id : String
        )
        end
      end

      # A best practice, or question choice, that has been identified as a risk in this question.

      struct BestPractice
        include JSON::Serializable


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String?


        @[JSON::Field(key: "ChoiceTitle")]
        getter choice_title : String?

        def initialize(
          @choice_id : String? = nil,
          @choice_title : String? = nil
        )
        end
      end

      # Account details for a Well-Architected best practice in relation to Trusted Advisor checks.

      struct CheckDetail
        include JSON::Serializable


        @[JSON::Field(key: "AccountId")]
        getter account_id : String?


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String?

        # Trusted Advisor check description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Count of flagged resources associated to the check.

        @[JSON::Field(key: "FlaggedResources")]
        getter flagged_resources : Int32?

        # Trusted Advisor check ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Well-Architected Lens ARN associated to the check.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        # Trusted Advisor check name.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?

        # Provider of the check related to the best practice.

        @[JSON::Field(key: "Provider")]
        getter provider : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?

        # Reason associated to the check.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # Status associated to the check.

        @[JSON::Field(key: "Status")]
        getter status : String?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @account_id : String? = nil,
          @choice_id : String? = nil,
          @description : String? = nil,
          @flagged_resources : Int32? = nil,
          @id : String? = nil,
          @lens_arn : String? = nil,
          @name : String? = nil,
          @pillar_id : String? = nil,
          @provider : String? = nil,
          @question_id : String? = nil,
          @reason : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Trusted Advisor check summary.

      struct CheckSummary
        include JSON::Serializable

        # Account summary associated to the check.

        @[JSON::Field(key: "AccountSummary")]
        getter account_summary : Hash(String, Int32)?


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String?

        # Trusted Advisor check description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Trusted Advisor check ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Well-Architected Lens ARN associated to the check.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        # Trusted Advisor check name.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?

        # Provider of the check related to the best practice.

        @[JSON::Field(key: "Provider")]
        getter provider : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?

        # Status associated to the check.

        @[JSON::Field(key: "Status")]
        getter status : String?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @account_summary : Hash(String, Int32)? = nil,
          @choice_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @lens_arn : String? = nil,
          @name : String? = nil,
          @pillar_id : String? = nil,
          @provider : String? = nil,
          @question_id : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # A choice available to answer question.

      struct Choice
        include JSON::Serializable

        # The additional resources for a choice in a custom lens. A choice can have up to two additional
        # resources: one of type HELPFUL_RESOURCE , one of type IMPROVEMENT_PLAN , or both.

        @[JSON::Field(key: "AdditionalResources")]
        getter additional_resources : Array(Types::AdditionalResources)?


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String?


        @[JSON::Field(key: "Description")]
        getter description : String?

        # The helpful resource (both text and URL) for a particular choice. This field only applies to custom
        # lenses. Each choice can have only one helpful resource.

        @[JSON::Field(key: "HelpfulResource")]
        getter helpful_resource : Types::ChoiceContent?

        # The improvement plan (both text and URL) for a particular choice. This field only applies to custom
        # lenses. Each choice can have only one improvement plan.

        @[JSON::Field(key: "ImprovementPlan")]
        getter improvement_plan : Types::ChoiceContent?


        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @additional_resources : Array(Types::AdditionalResources)? = nil,
          @choice_id : String? = nil,
          @description : String? = nil,
          @helpful_resource : Types::ChoiceContent? = nil,
          @improvement_plan : Types::ChoiceContent? = nil,
          @title : String? = nil
        )
        end
      end

      # A choice that has been answered on a question in your workload.

      struct ChoiceAnswer
        include JSON::Serializable


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String?

        # The notes associated with a choice.

        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # The reason why a choice is non-applicable to a question in your workload.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The status of a choice.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @choice_id : String? = nil,
          @notes : String? = nil,
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A choice summary that has been answered on a question in your workload.

      struct ChoiceAnswerSummary
        include JSON::Serializable


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String?

        # The reason why a choice is non-applicable to a question in your workload.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The status of a choice.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @choice_id : String? = nil,
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The choice content.

      struct ChoiceContent
        include JSON::Serializable

        # The display text for the choice content.

        @[JSON::Field(key: "DisplayText")]
        getter display_text : String?

        # The URL for the choice content.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @display_text : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The choice level improvement plan.

      struct ChoiceImprovementPlan
        include JSON::Serializable


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String?

        # The display text for the improvement plan.

        @[JSON::Field(key: "DisplayText")]
        getter display_text : String?


        @[JSON::Field(key: "ImprovementPlanUrl")]
        getter improvement_plan_url : String?

        def initialize(
          @choice_id : String? = nil,
          @display_text : String? = nil,
          @improvement_plan_url : String? = nil
        )
        end
      end

      # A list of choices to be updated.

      struct ChoiceUpdate
        include JSON::Serializable

        # The status of a choice.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The notes associated with a choice.

        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # The reason why a choice is non-applicable to a question in your workload.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @status : String,
          @notes : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The resource has already been processed, was deleted, or is too large.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String


        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String


        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # A metric that contributes to the consolidated report.

      struct ConsolidatedReportMetric
        include JSON::Serializable

        # The metrics for the lenses in the workload.

        @[JSON::Field(key: "Lenses")]
        getter lenses : Array(Types::LensMetric)?

        # The total number of lenses applied to the workload.

        @[JSON::Field(key: "LensesAppliedCount")]
        getter lenses_applied_count : Int32?

        # The metric type of a metric in the consolidated report. Currently only WORKLOAD metric types are
        # supported.

        @[JSON::Field(key: "MetricType")]
        getter metric_type : String?


        @[JSON::Field(key: "RiskCounts")]
        getter risk_counts : Hash(String, Int32)?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?


        @[JSON::Field(key: "WorkloadArn")]
        getter workload_arn : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?


        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @lenses : Array(Types::LensMetric)? = nil,
          @lenses_applied_count : Int32? = nil,
          @metric_type : String? = nil,
          @risk_counts : Hash(String, Int32)? = nil,
          @updated_at : Time? = nil,
          @workload_arn : String? = nil,
          @workload_id : String? = nil,
          @workload_name : String? = nil
        )
        end
      end


      struct CreateLensShareInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String

        def initialize(
          @client_request_token : String,
          @lens_alias : String,
          @shared_with : String
        )
        end
      end


      struct CreateLensShareOutput
        include JSON::Serializable


        @[JSON::Field(key: "ShareId")]
        getter share_id : String?

        def initialize(
          @share_id : String? = nil
        )
        end
      end


      struct CreateLensVersionInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The version of the lens being created.

        @[JSON::Field(key: "LensVersion")]
        getter lens_version : String

        # Set to true if this new major lens version.

        @[JSON::Field(key: "IsMajorVersion")]
        getter is_major_version : Bool?

        def initialize(
          @client_request_token : String,
          @lens_alias : String,
          @lens_version : String,
          @is_major_version : Bool? = nil
        )
        end
      end


      struct CreateLensVersionOutput
        include JSON::Serializable

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        # The version of the lens.

        @[JSON::Field(key: "LensVersion")]
        getter lens_version : String?

        def initialize(
          @lens_arn : String? = nil,
          @lens_version : String? = nil
        )
        end
      end

      # Input for milestone creation.

      struct CreateMilestoneInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "MilestoneName")]
        getter milestone_name : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @client_request_token : String,
          @milestone_name : String,
          @workload_id : String
        )
        end
      end

      # Output of a create milestone call.

      struct CreateMilestoneOutput
        include JSON::Serializable


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @milestone_number : Int32? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct CreateProfileInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The profile description.

        @[JSON::Field(key: "ProfileDescription")]
        getter profile_description : String

        # Name of the profile.

        @[JSON::Field(key: "ProfileName")]
        getter profile_name : String

        # The profile questions.

        @[JSON::Field(key: "ProfileQuestions")]
        getter profile_questions : Array(Types::ProfileQuestionUpdate)

        # The tags assigned to the profile.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_request_token : String,
          @profile_description : String,
          @profile_name : String,
          @profile_questions : Array(Types::ProfileQuestionUpdate),
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateProfileOutput
        include JSON::Serializable

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String?

        # Version of the profile.

        @[JSON::Field(key: "ProfileVersion")]
        getter profile_version : String?

        def initialize(
          @profile_arn : String? = nil,
          @profile_version : String? = nil
        )
        end
      end


      struct CreateProfileShareInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String

        def initialize(
          @client_request_token : String,
          @profile_arn : String,
          @shared_with : String
        )
        end
      end


      struct CreateProfileShareOutput
        include JSON::Serializable

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String?


        @[JSON::Field(key: "ShareId")]
        getter share_id : String?

        def initialize(
          @profile_arn : String? = nil,
          @share_id : String? = nil
        )
        end
      end


      struct CreateReviewTemplateInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The review template description.

        @[JSON::Field(key: "Description")]
        getter description : String

        # Lenses applied to the review template.

        @[JSON::Field(key: "Lenses")]
        getter lenses : Array(String)

        # Name of the review template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String


        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # The tags assigned to the review template.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_request_token : String,
          @description : String,
          @lenses : Array(String),
          @template_name : String,
          @notes : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateReviewTemplateOutput
        include JSON::Serializable

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @template_arn : String? = nil
        )
        end
      end


      struct CreateTemplateShareInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @client_request_token : String,
          @shared_with : String,
          @template_arn : String
        )
        end
      end


      struct CreateTemplateShareOutput
        include JSON::Serializable


        @[JSON::Field(key: "ShareId")]
        getter share_id : String?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @share_id : String? = nil,
          @template_arn : String? = nil
        )
        end
      end

      # Input for workload creation.

      struct CreateWorkloadInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "Description")]
        getter description : String


        @[JSON::Field(key: "Environment")]
        getter environment : String


        @[JSON::Field(key: "Lenses")]
        getter lenses : Array(String)


        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String


        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # List of AppRegistry application ARNs associated to the workload.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(String)?


        @[JSON::Field(key: "ArchitecturalDesign")]
        getter architectural_design : String?


        @[JSON::Field(key: "AwsRegions")]
        getter aws_regions : Array(String)?

        # Well-Architected discovery configuration settings associated to the workload.

        @[JSON::Field(key: "DiscoveryConfig")]
        getter discovery_config : Types::WorkloadDiscoveryConfig?


        @[JSON::Field(key: "Industry")]
        getter industry : String?


        @[JSON::Field(key: "IndustryType")]
        getter industry_type : String?

        # Jira configuration settings when creating a workload.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::WorkloadJiraConfigurationInput?


        @[JSON::Field(key: "NonAwsRegions")]
        getter non_aws_regions : Array(String)?


        @[JSON::Field(key: "Notes")]
        getter notes : String?


        @[JSON::Field(key: "PillarPriorities")]
        getter pillar_priorities : Array(String)?

        # The list of profile ARNs associated with the workload.

        @[JSON::Field(key: "ProfileArns")]
        getter profile_arns : Array(String)?


        @[JSON::Field(key: "ReviewOwner")]
        getter review_owner : String?

        # The list of review template ARNs to associate with the workload.

        @[JSON::Field(key: "ReviewTemplateArns")]
        getter review_template_arns : Array(String)?

        # The tags to be associated with the workload.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_request_token : String,
          @description : String,
          @environment : String,
          @lenses : Array(String),
          @workload_name : String,
          @account_ids : Array(String)? = nil,
          @applications : Array(String)? = nil,
          @architectural_design : String? = nil,
          @aws_regions : Array(String)? = nil,
          @discovery_config : Types::WorkloadDiscoveryConfig? = nil,
          @industry : String? = nil,
          @industry_type : String? = nil,
          @jira_configuration : Types::WorkloadJiraConfigurationInput? = nil,
          @non_aws_regions : Array(String)? = nil,
          @notes : String? = nil,
          @pillar_priorities : Array(String)? = nil,
          @profile_arns : Array(String)? = nil,
          @review_owner : String? = nil,
          @review_template_arns : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Output of a create workload call.

      struct CreateWorkloadOutput
        include JSON::Serializable


        @[JSON::Field(key: "WorkloadArn")]
        getter workload_arn : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @workload_arn : String? = nil,
          @workload_id : String? = nil
        )
        end
      end

      # Input for Create Workload Share

      struct CreateWorkloadShareInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "PermissionType")]
        getter permission_type : String


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @client_request_token : String,
          @permission_type : String,
          @shared_with : String,
          @workload_id : String
        )
        end
      end

      # Input for Create Workload Share

      struct CreateWorkloadShareOutput
        include JSON::Serializable


        @[JSON::Field(key: "ShareId")]
        getter share_id : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @share_id : String? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct DeleteLensInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The status of the lens to be deleted.

        @[JSON::Field(key: "LensStatus")]
        getter lens_status : String

        def initialize(
          @client_request_token : String,
          @lens_alias : String,
          @lens_status : String
        )
        end
      end


      struct DeleteLensShareInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "ShareId")]
        getter share_id : String

        def initialize(
          @client_request_token : String,
          @lens_alias : String,
          @share_id : String
        )
        end
      end


      struct DeleteProfileInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String

        def initialize(
          @client_request_token : String,
          @profile_arn : String
        )
        end
      end


      struct DeleteProfileShareInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String


        @[JSON::Field(key: "ShareId")]
        getter share_id : String

        def initialize(
          @client_request_token : String,
          @profile_arn : String,
          @share_id : String
        )
        end
      end


      struct DeleteReviewTemplateInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @client_request_token : String,
          @template_arn : String
        )
        end
      end


      struct DeleteTemplateShareInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "ShareId")]
        getter share_id : String

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @client_request_token : String,
          @share_id : String,
          @template_arn : String
        )
        end
      end

      # Input for workload deletion.

      struct DeleteWorkloadInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @client_request_token : String,
          @workload_id : String
        )
        end
      end

      # Input for Delete Workload Share

      struct DeleteWorkloadShareInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String


        @[JSON::Field(key: "ShareId")]
        getter share_id : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @client_request_token : String,
          @share_id : String,
          @workload_id : String
        )
        end
      end

      # Input to disassociate lens reviews.

      struct DisassociateLensesInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAliases")]
        getter lens_aliases : Array(String)


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @lens_aliases : Array(String),
          @workload_id : String
        )
        end
      end


      struct DisassociateProfilesInput
        include JSON::Serializable

        # The list of profile ARNs to disassociate from the workload.

        @[JSON::Field(key: "ProfileArns")]
        getter profile_arns : Array(String)


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @profile_arns : Array(String),
          @workload_id : String
        )
        end
      end


      struct ExportLensInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The lens version to be exported.

        @[JSON::Field(key: "LensVersion")]
        getter lens_version : String?

        def initialize(
          @lens_alias : String,
          @lens_version : String? = nil
        )
        end
      end


      struct ExportLensOutput
        include JSON::Serializable

        # The JSON representation of a lens.

        @[JSON::Field(key: "LensJSON")]
        getter lens_json : String?

        def initialize(
          @lens_json : String? = nil
        )
        end
      end

      # Input to get answer.

      struct GetAnswerInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?

        def initialize(
          @lens_alias : String,
          @question_id : String,
          @workload_id : String,
          @milestone_number : Int32? = nil
        )
        end
      end

      # Output of a get answer call.

      struct GetAnswerOutput
        include JSON::Serializable


        @[JSON::Field(key: "Answer")]
        getter answer : Types::Answer?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @answer : Types::Answer? = nil,
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @milestone_number : Int32? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct GetConsolidatedReportInput
        include JSON::Serializable

        # The format of the consolidated report. For PDF , Base64String is returned. For JSON , Metrics is
        # returned.

        @[JSON::Field(key: "Format")]
        getter format : String

        # Set to true to have shared resources included in the report.

        @[JSON::Field(key: "IncludeSharedResources")]
        getter include_shared_resources : Bool?

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @format : String,
          @include_shared_resources : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetConsolidatedReportOutput
        include JSON::Serializable


        @[JSON::Field(key: "Base64String")]
        getter base64_string : String?

        # The metrics that make up the consolidated report. Only returned when JSON format is requested.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(Types::ConsolidatedReportMetric)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @base64_string : String? = nil,
          @metrics : Array(Types::ConsolidatedReportMetric)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetGlobalSettingsOutput
        include JSON::Serializable

        # Discovery integration status.

        @[JSON::Field(key: "DiscoveryIntegrationStatus")]
        getter discovery_integration_status : String?

        # Jira configuration status.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::AccountJiraConfigurationOutput?

        # Amazon Web Services Organizations sharing status.

        @[JSON::Field(key: "OrganizationSharingStatus")]
        getter organization_sharing_status : String?

        def initialize(
          @discovery_integration_status : String? = nil,
          @jira_configuration : Types::AccountJiraConfigurationOutput? = nil,
          @organization_sharing_status : String? = nil
        )
        end
      end


      struct GetLensInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The lens version to be retrieved.

        @[JSON::Field(key: "LensVersion")]
        getter lens_version : String?

        def initialize(
          @lens_alias : String,
          @lens_version : String? = nil
        )
        end
      end


      struct GetLensOutput
        include JSON::Serializable

        # A lens return object.

        @[JSON::Field(key: "Lens")]
        getter lens : Types::Lens?

        def initialize(
          @lens : Types::Lens? = nil
        )
        end
      end

      # Input to get lens review.

      struct GetLensReviewInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?

        def initialize(
          @lens_alias : String,
          @workload_id : String,
          @milestone_number : Int32? = nil
        )
        end
      end

      # Output of a get lens review call.

      struct GetLensReviewOutput
        include JSON::Serializable


        @[JSON::Field(key: "LensReview")]
        getter lens_review : Types::LensReview?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @lens_review : Types::LensReview? = nil,
          @milestone_number : Int32? = nil,
          @workload_id : String? = nil
        )
        end
      end

      # Input to get lens review report.

      struct GetLensReviewReportInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?

        def initialize(
          @lens_alias : String,
          @workload_id : String,
          @milestone_number : Int32? = nil
        )
        end
      end

      # Output of a get lens review report call.

      struct GetLensReviewReportOutput
        include JSON::Serializable


        @[JSON::Field(key: "LensReviewReport")]
        getter lens_review_report : Types::LensReviewReport?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @lens_review_report : Types::LensReviewReport? = nil,
          @milestone_number : Int32? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct GetLensVersionDifferenceInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The base version of the lens.

        @[JSON::Field(key: "BaseLensVersion")]
        getter base_lens_version : String?

        # The lens version to target a difference for.

        @[JSON::Field(key: "TargetLensVersion")]
        getter target_lens_version : String?

        def initialize(
          @lens_alias : String,
          @base_lens_version : String? = nil,
          @target_lens_version : String? = nil
        )
        end
      end


      struct GetLensVersionDifferenceOutput
        include JSON::Serializable

        # The base version of the lens.

        @[JSON::Field(key: "BaseLensVersion")]
        getter base_lens_version : String?

        # The latest version of the lens.

        @[JSON::Field(key: "LatestLensVersion")]
        getter latest_lens_version : String?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        # The target lens version for the lens.

        @[JSON::Field(key: "TargetLensVersion")]
        getter target_lens_version : String?


        @[JSON::Field(key: "VersionDifferences")]
        getter version_differences : Types::VersionDifferences?

        def initialize(
          @base_lens_version : String? = nil,
          @latest_lens_version : String? = nil,
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @target_lens_version : String? = nil,
          @version_differences : Types::VersionDifferences? = nil
        )
        end
      end

      # Input to get a milestone.

      struct GetMilestoneInput
        include JSON::Serializable


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @milestone_number : Int32,
          @workload_id : String
        )
        end
      end

      # Output of a get milestone call.

      struct GetMilestoneOutput
        include JSON::Serializable


        @[JSON::Field(key: "Milestone")]
        getter milestone : Types::Milestone?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @milestone : Types::Milestone? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct GetProfileInput
        include JSON::Serializable

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String

        # The profile version.

        @[JSON::Field(key: "ProfileVersion")]
        getter profile_version : String?

        def initialize(
          @profile_arn : String,
          @profile_version : String? = nil
        )
        end
      end


      struct GetProfileOutput
        include JSON::Serializable

        # The profile.

        @[JSON::Field(key: "Profile")]
        getter profile : Types::Profile?

        def initialize(
          @profile : Types::Profile? = nil
        )
        end
      end


      struct GetProfileTemplateInput
        include JSON::Serializable

        def initialize
        end
      end


      struct GetProfileTemplateOutput
        include JSON::Serializable

        # The profile template.

        @[JSON::Field(key: "ProfileTemplate")]
        getter profile_template : Types::ProfileTemplate?

        def initialize(
          @profile_template : Types::ProfileTemplate? = nil
        )
        end
      end


      struct GetReviewTemplateAnswerInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @lens_alias : String,
          @question_id : String,
          @template_arn : String
        )
        end
      end


      struct GetReviewTemplateAnswerOutput
        include JSON::Serializable

        # An answer of the question.

        @[JSON::Field(key: "Answer")]
        getter answer : Types::ReviewTemplateAnswer?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @answer : Types::ReviewTemplateAnswer? = nil,
          @lens_alias : String? = nil,
          @template_arn : String? = nil
        )
        end
      end


      struct GetReviewTemplateInput
        include JSON::Serializable

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @template_arn : String
        )
        end
      end


      struct GetReviewTemplateLensReviewInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @lens_alias : String,
          @template_arn : String
        )
        end
      end


      struct GetReviewTemplateLensReviewOutput
        include JSON::Serializable

        # A lens review of a question.

        @[JSON::Field(key: "LensReview")]
        getter lens_review : Types::ReviewTemplateLensReview?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @lens_review : Types::ReviewTemplateLensReview? = nil,
          @template_arn : String? = nil
        )
        end
      end


      struct GetReviewTemplateOutput
        include JSON::Serializable

        # The review template.

        @[JSON::Field(key: "ReviewTemplate")]
        getter review_template : Types::ReviewTemplate?

        def initialize(
          @review_template : Types::ReviewTemplate? = nil
        )
        end
      end

      # Input to get a workload.

      struct GetWorkloadInput
        include JSON::Serializable


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @workload_id : String
        )
        end
      end

      # Output of a get workload call.

      struct GetWorkloadOutput
        include JSON::Serializable


        @[JSON::Field(key: "Workload")]
        getter workload : Types::Workload?

        def initialize(
          @workload : Types::Workload? = nil
        )
        end
      end


      struct ImportLensInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The JSON representation of a lens.

        @[JSON::Field(key: "JSONString")]
        getter json_string : String


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # Tags to associate to a lens.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_request_token : String,
          @json_string : String,
          @lens_alias : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ImportLensOutput
        include JSON::Serializable

        # The ARN for the lens that was created or updated.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        # The status of the imported lens.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @lens_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # An improvement summary of a lens review in a workload.

      struct ImprovementSummary
        include JSON::Serializable


        @[JSON::Field(key: "ImprovementPlanUrl")]
        getter improvement_plan_url : String?

        # The improvement plan details.

        @[JSON::Field(key: "ImprovementPlans")]
        getter improvement_plans : Array(Types::ChoiceImprovementPlan)?

        # Configuration of the Jira integration.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::JiraConfiguration?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?


        @[JSON::Field(key: "QuestionTitle")]
        getter question_title : String?


        @[JSON::Field(key: "Risk")]
        getter risk : String?

        def initialize(
          @improvement_plan_url : String? = nil,
          @improvement_plans : Array(Types::ChoiceImprovementPlan)? = nil,
          @jira_configuration : Types::JiraConfiguration? = nil,
          @pillar_id : String? = nil,
          @question_id : String? = nil,
          @question_title : String? = nil,
          @risk : String? = nil
        )
        end
      end

      # There is a problem with the Well-Architected Tool API service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Configuration of the Jira integration.

      struct JiraConfiguration
        include JSON::Serializable

        # The URL of the associated Jira issue.

        @[JSON::Field(key: "JiraIssueUrl")]
        getter jira_issue_url : String?


        @[JSON::Field(key: "LastSyncedTime")]
        getter last_synced_time : Time?

        def initialize(
          @jira_issue_url : String? = nil,
          @last_synced_time : Time? = nil
        )
        end
      end

      # Selected questions in the workload.

      struct JiraSelectedQuestionConfiguration
        include JSON::Serializable

        # Selected pillars in the workload.

        @[JSON::Field(key: "SelectedPillars")]
        getter selected_pillars : Array(Types::SelectedPillar)?

        def initialize(
          @selected_pillars : Array(Types::SelectedPillar)? = nil
        )
        end
      end

      # A lens return object.

      struct Lens
        include JSON::Serializable


        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of a lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        # The version of a lens.

        @[JSON::Field(key: "LensVersion")]
        getter lens_version : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID that owns the lens.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The ID assigned to the share invitation.

        @[JSON::Field(key: "ShareInvitationId")]
        getter share_invitation_id : String?

        # The tags assigned to the lens.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @lens_arn : String? = nil,
          @lens_version : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @share_invitation_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A metric for a particular lens in a workload.

      struct LensMetric
        include JSON::Serializable

        # The lens ARN.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        # The metrics for the pillars in a lens.

        @[JSON::Field(key: "Pillars")]
        getter pillars : Array(Types::PillarMetric)?


        @[JSON::Field(key: "RiskCounts")]
        getter risk_counts : Hash(String, Int32)?

        def initialize(
          @lens_arn : String? = nil,
          @pillars : Array(Types::PillarMetric)? = nil,
          @risk_counts : Hash(String, Int32)? = nil
        )
        end
      end

      # A lens review of a question.

      struct LensReview
        include JSON::Serializable

        # Jira configuration status of the Lens review.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::JiraSelectedQuestionConfiguration?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?


        @[JSON::Field(key: "LensName")]
        getter lens_name : String?

        # The status of the lens.

        @[JSON::Field(key: "LensStatus")]
        getter lens_status : String?

        # The version of the lens.

        @[JSON::Field(key: "LensVersion")]
        getter lens_version : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Notes")]
        getter notes : String?


        @[JSON::Field(key: "PillarReviewSummaries")]
        getter pillar_review_summaries : Array(Types::PillarReviewSummary)?


        @[JSON::Field(key: "PrioritizedRiskCounts")]
        getter prioritized_risk_counts : Hash(String, Int32)?

        # The profiles associated with the workload.

        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(Types::WorkloadProfile)?


        @[JSON::Field(key: "RiskCounts")]
        getter risk_counts : Hash(String, Int32)?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @jira_configuration : Types::JiraSelectedQuestionConfiguration? = nil,
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @lens_name : String? = nil,
          @lens_status : String? = nil,
          @lens_version : String? = nil,
          @next_token : String? = nil,
          @notes : String? = nil,
          @pillar_review_summaries : Array(Types::PillarReviewSummary)? = nil,
          @prioritized_risk_counts : Hash(String, Int32)? = nil,
          @profiles : Array(Types::WorkloadProfile)? = nil,
          @risk_counts : Hash(String, Int32)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # A report of a lens review.

      struct LensReviewReport
        include JSON::Serializable


        @[JSON::Field(key: "Base64String")]
        getter base64_string : String?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        def initialize(
          @base64_string : String? = nil,
          @lens_alias : String? = nil,
          @lens_arn : String? = nil
        )
        end
      end

      # A lens review summary of a workload.

      struct LensReviewSummary
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?


        @[JSON::Field(key: "LensName")]
        getter lens_name : String?

        # The status of the lens.

        @[JSON::Field(key: "LensStatus")]
        getter lens_status : String?

        # The version of the lens.

        @[JSON::Field(key: "LensVersion")]
        getter lens_version : String?


        @[JSON::Field(key: "PrioritizedRiskCounts")]
        getter prioritized_risk_counts : Hash(String, Int32)?

        # The profiles associated with the workload.

        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(Types::WorkloadProfile)?


        @[JSON::Field(key: "RiskCounts")]
        getter risk_counts : Hash(String, Int32)?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @lens_name : String? = nil,
          @lens_status : String? = nil,
          @lens_version : String? = nil,
          @prioritized_risk_counts : Hash(String, Int32)? = nil,
          @profiles : Array(Types::WorkloadProfile)? = nil,
          @risk_counts : Hash(String, Int32)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # A lens share summary return object.

      struct LensShareSummary
        include JSON::Serializable


        @[JSON::Field(key: "ShareId")]
        getter share_id : String?


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        # Optional message to compliment the Status field.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @share_id : String? = nil,
          @shared_with : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # A lens summary of a lens.

      struct LensSummary
        include JSON::Serializable


        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN of the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?


        @[JSON::Field(key: "LensName")]
        getter lens_name : String?

        # The status of the lens.

        @[JSON::Field(key: "LensStatus")]
        getter lens_status : String?

        # The type of the lens.

        @[JSON::Field(key: "LensType")]
        getter lens_type : String?

        # The version of the lens.

        @[JSON::Field(key: "LensVersion")]
        getter lens_version : String?


        @[JSON::Field(key: "Owner")]
        getter owner : String?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @lens_name : String? = nil,
          @lens_status : String? = nil,
          @lens_type : String? = nil,
          @lens_version : String? = nil,
          @owner : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Lens upgrade summary return object.

      struct LensUpgradeSummary
        include JSON::Serializable

        # The current version of the lens.

        @[JSON::Field(key: "CurrentLensVersion")]
        getter current_lens_version : String?

        # The latest version of the lens.

        @[JSON::Field(key: "LatestLensVersion")]
        getter latest_lens_version : String?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        # ResourceArn of the lens being upgraded

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?


        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?


        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @current_lens_version : String? = nil,
          @latest_lens_version : String? = nil,
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_name : String? = nil,
          @workload_id : String? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # Input to list answers.

      struct ListAnswersInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?

        # The priority of the question.

        @[JSON::Field(key: "QuestionPriority")]
        getter question_priority : String?

        def initialize(
          @lens_alias : String,
          @workload_id : String,
          @max_results : Int32? = nil,
          @milestone_number : Int32? = nil,
          @next_token : String? = nil,
          @pillar_id : String? = nil,
          @question_priority : String? = nil
        )
        end
      end

      # Output of a list answers call.

      struct ListAnswersOutput
        include JSON::Serializable


        @[JSON::Field(key: "AnswerSummaries")]
        getter answer_summaries : Array(Types::AnswerSummary)?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @answer_summaries : Array(Types::AnswerSummary)? = nil,
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @milestone_number : Int32? = nil,
          @next_token : String? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct ListCheckDetailsInput
        include JSON::Serializable


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String

        # Well-Architected Lens ARN.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @choice_id : String,
          @lens_arn : String,
          @pillar_id : String,
          @question_id : String,
          @workload_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCheckDetailsOutput
        include JSON::Serializable

        # The details about the Trusted Advisor checks related to the Well-Architected best practice.

        @[JSON::Field(key: "CheckDetails")]
        getter check_details : Array(Types::CheckDetail)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @check_details : Array(Types::CheckDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCheckSummariesInput
        include JSON::Serializable


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String

        # Well-Architected Lens ARN.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @choice_id : String,
          @lens_arn : String,
          @pillar_id : String,
          @question_id : String,
          @workload_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCheckSummariesOutput
        include JSON::Serializable

        # List of Trusted Advisor summaries related to the Well-Architected best practice.

        @[JSON::Field(key: "CheckSummaries")]
        getter check_summaries : Array(Types::CheckSummary)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @check_summaries : Array(Types::CheckSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Input to list lens review improvements.

      struct ListLensReviewImprovementsInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?

        # The priority of the question.

        @[JSON::Field(key: "QuestionPriority")]
        getter question_priority : String?

        def initialize(
          @lens_alias : String,
          @workload_id : String,
          @max_results : Int32? = nil,
          @milestone_number : Int32? = nil,
          @next_token : String? = nil,
          @pillar_id : String? = nil,
          @question_priority : String? = nil
        )
        end
      end

      # Output of a list lens review improvements call.

      struct ListLensReviewImprovementsOutput
        include JSON::Serializable


        @[JSON::Field(key: "ImprovementSummaries")]
        getter improvement_summaries : Array(Types::ImprovementSummary)?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @improvement_summaries : Array(Types::ImprovementSummary)? = nil,
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @milestone_number : Int32? = nil,
          @next_token : String? = nil,
          @workload_id : String? = nil
        )
        end
      end

      # Input to list lens reviews.

      struct ListLensReviewsInput
        include JSON::Serializable


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @workload_id : String,
          @max_results : Int32? = nil,
          @milestone_number : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Output of a list lens reviews call.

      struct ListLensReviewsOutput
        include JSON::Serializable


        @[JSON::Field(key: "LensReviewSummaries")]
        getter lens_review_summaries : Array(Types::LensReviewSummary)?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @lens_review_summaries : Array(Types::LensReviewSummary)? = nil,
          @milestone_number : Int32? = nil,
          @next_token : String? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct ListLensSharesInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID, organization ID, or organizational unit (OU) ID with which the
        # lens is shared.

        @[JSON::Field(key: "SharedWithPrefix")]
        getter shared_with_prefix : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @lens_alias : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @shared_with_prefix : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListLensSharesOutput
        include JSON::Serializable

        # A list of lens share summaries.

        @[JSON::Field(key: "LensShareSummaries")]
        getter lens_share_summaries : Array(Types::LensShareSummary)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @lens_share_summaries : Array(Types::LensShareSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Input to list lenses.

      struct ListLensesInput
        include JSON::Serializable


        @[JSON::Field(key: "LensName")]
        getter lens_name : String?

        # The status of lenses to be returned.

        @[JSON::Field(key: "LensStatus")]
        getter lens_status : String?

        # The type of lenses to be returned.

        @[JSON::Field(key: "LensType")]
        getter lens_type : String?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @lens_name : String? = nil,
          @lens_status : String? = nil,
          @lens_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Output of a list lenses call.

      struct ListLensesOutput
        include JSON::Serializable


        @[JSON::Field(key: "LensSummaries")]
        getter lens_summaries : Array(Types::LensSummary)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @lens_summaries : Array(Types::LensSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Input to list all milestones for a workload.

      struct ListMilestonesInput
        include JSON::Serializable


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @workload_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Output of a list milestones call.

      struct ListMilestonesOutput
        include JSON::Serializable


        @[JSON::Field(key: "MilestoneSummaries")]
        getter milestone_summaries : Array(Types::MilestoneSummary)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @milestone_summaries : Array(Types::MilestoneSummary)? = nil,
          @next_token : String? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct ListNotificationsInput
        include JSON::Serializable

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARN for the related resource for the notification. Only one of WorkloadID or ResourceARN should
        # be specified.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_arn : String? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct ListNotificationsOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of lens notification summaries in a workload.

        @[JSON::Field(key: "NotificationSummaries")]
        getter notification_summaries : Array(Types::NotificationSummary)?

        def initialize(
          @next_token : String? = nil,
          @notification_summaries : Array(Types::NotificationSummary)? = nil
        )
        end
      end


      struct ListProfileNotificationsInput
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct ListProfileNotificationsOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Notification summaries.

        @[JSON::Field(key: "NotificationSummaries")]
        getter notification_summaries : Array(Types::ProfileNotificationSummary)?

        def initialize(
          @next_token : String? = nil,
          @notification_summaries : Array(Types::ProfileNotificationSummary)? = nil
        )
        end
      end


      struct ListProfileSharesInput
        include JSON::Serializable

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID, organization ID, or organizational unit (OU) ID with which the
        # profile is shared.

        @[JSON::Field(key: "SharedWithPrefix")]
        getter shared_with_prefix : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @profile_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @shared_with_prefix : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListProfileSharesOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Profile share summaries.

        @[JSON::Field(key: "ProfileShareSummaries")]
        getter profile_share_summaries : Array(Types::ProfileShareSummary)?

        def initialize(
          @next_token : String? = nil,
          @profile_share_summaries : Array(Types::ProfileShareSummary)? = nil
        )
        end
      end


      struct ListProfilesInput
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An optional string added to the beginning of each profile name returned in the results.

        @[JSON::Field(key: "ProfileNamePrefix")]
        getter profile_name_prefix : String?

        # Profile owner type.

        @[JSON::Field(key: "ProfileOwnerType")]
        getter profile_owner_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @profile_name_prefix : String? = nil,
          @profile_owner_type : String? = nil
        )
        end
      end


      struct ListProfilesOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Profile summaries.

        @[JSON::Field(key: "ProfileSummaries")]
        getter profile_summaries : Array(Types::ProfileSummary)?

        def initialize(
          @next_token : String? = nil,
          @profile_summaries : Array(Types::ProfileSummary)? = nil
        )
        end
      end


      struct ListReviewTemplateAnswersInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The ARN of the review template.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?

        def initialize(
          @lens_alias : String,
          @template_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @pillar_id : String? = nil
        )
        end
      end


      struct ListReviewTemplateAnswersOutput
        include JSON::Serializable

        # List of answer summaries of a lens review in a review template.

        @[JSON::Field(key: "AnswerSummaries")]
        getter answer_summaries : Array(Types::ReviewTemplateAnswerSummary)?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARN of the review template.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @answer_summaries : Array(Types::ReviewTemplateAnswerSummary)? = nil,
          @lens_alias : String? = nil,
          @next_token : String? = nil,
          @template_arn : String? = nil
        )
        end
      end


      struct ListReviewTemplatesInput
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReviewTemplatesOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of review templates.

        @[JSON::Field(key: "ReviewTemplates")]
        getter review_templates : Array(Types::ReviewTemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @review_templates : Array(Types::ReviewTemplateSummary)? = nil
        )
        end
      end

      # Input for List Share Invitations

      struct ListShareInvitationsInput
        include JSON::Serializable

        # An optional string added to the beginning of each lens name returned in the results.

        @[JSON::Field(key: "LensNamePrefix")]
        getter lens_name_prefix : String?

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An optional string added to the beginning of each profile name returned in the results.

        @[JSON::Field(key: "ProfileNamePrefix")]
        getter profile_name_prefix : String?

        # The type of share invitations to be returned.

        @[JSON::Field(key: "ShareResourceType")]
        getter share_resource_type : String?

        # An optional string added to the beginning of each review template name returned in the results.

        @[JSON::Field(key: "TemplateNamePrefix")]
        getter template_name_prefix : String?


        @[JSON::Field(key: "WorkloadNamePrefix")]
        getter workload_name_prefix : String?

        def initialize(
          @lens_name_prefix : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @profile_name_prefix : String? = nil,
          @share_resource_type : String? = nil,
          @template_name_prefix : String? = nil,
          @workload_name_prefix : String? = nil
        )
        end
      end

      # Input for List Share Invitations

      struct ListShareInvitationsOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of share invitation summaries in a workload.

        @[JSON::Field(key: "ShareInvitationSummaries")]
        getter share_invitation_summaries : Array(Types::ShareInvitationSummary)?

        def initialize(
          @next_token : String? = nil,
          @share_invitation_summaries : Array(Types::ShareInvitationSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable


        @[JSON::Field(key: "WorkloadArn")]
        getter workload_arn : String

        def initialize(
          @workload_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The tags for the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTemplateSharesInput
        include JSON::Serializable

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID, organization ID, or organizational unit (OU) ID with which the
        # profile is shared.

        @[JSON::Field(key: "SharedWithPrefix")]
        getter shared_with_prefix : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @template_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @shared_with_prefix : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListTemplateSharesOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        # A review template share summary return object.

        @[JSON::Field(key: "TemplateShareSummaries")]
        getter template_share_summaries : Array(Types::TemplateShareSummary)?

        def initialize(
          @next_token : String? = nil,
          @template_arn : String? = nil,
          @template_share_summaries : Array(Types::TemplateShareSummary)? = nil
        )
        end
      end

      # Input for List Workload Share

      struct ListWorkloadSharesInput
        include JSON::Serializable


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Web Services account ID, organization ID, or organizational unit (OU) ID with which the
        # workload is shared.

        @[JSON::Field(key: "SharedWithPrefix")]
        getter shared_with_prefix : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @workload_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @shared_with_prefix : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Input for List Workload Share

      struct ListWorkloadSharesOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?


        @[JSON::Field(key: "WorkloadShareSummaries")]
        getter workload_share_summaries : Array(Types::WorkloadShareSummary)?

        def initialize(
          @next_token : String? = nil,
          @workload_id : String? = nil,
          @workload_share_summaries : Array(Types::WorkloadShareSummary)? = nil
        )
        end
      end

      # Input to list all workloads.

      struct ListWorkloadsInput
        include JSON::Serializable

        # The maximum number of results to return for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "WorkloadNamePrefix")]
        getter workload_name_prefix : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @workload_name_prefix : String? = nil
        )
        end
      end

      # Output of a list workloads call.

      struct ListWorkloadsOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "WorkloadSummaries")]
        getter workload_summaries : Array(Types::WorkloadSummary)?

        def initialize(
          @next_token : String? = nil,
          @workload_summaries : Array(Types::WorkloadSummary)? = nil
        )
        end
      end

      # A milestone return object.

      struct Milestone
        include JSON::Serializable


        @[JSON::Field(key: "MilestoneName")]
        getter milestone_name : String?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "RecordedAt")]
        getter recorded_at : Time?


        @[JSON::Field(key: "Workload")]
        getter workload : Types::Workload?

        def initialize(
          @milestone_name : String? = nil,
          @milestone_number : Int32? = nil,
          @recorded_at : Time? = nil,
          @workload : Types::Workload? = nil
        )
        end
      end

      # A milestone summary return object.

      struct MilestoneSummary
        include JSON::Serializable


        @[JSON::Field(key: "MilestoneName")]
        getter milestone_name : String?


        @[JSON::Field(key: "MilestoneNumber")]
        getter milestone_number : Int32?


        @[JSON::Field(key: "RecordedAt")]
        getter recorded_at : Time?


        @[JSON::Field(key: "WorkloadSummary")]
        getter workload_summary : Types::WorkloadSummary?

        def initialize(
          @milestone_name : String? = nil,
          @milestone_number : Int32? = nil,
          @recorded_at : Time? = nil,
          @workload_summary : Types::WorkloadSummary? = nil
        )
        end
      end

      # A notification summary return object.

      struct NotificationSummary
        include JSON::Serializable

        # Summary of lens upgrade.

        @[JSON::Field(key: "LensUpgradeSummary")]
        getter lens_upgrade_summary : Types::LensUpgradeSummary?

        # The type of notification.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @lens_upgrade_summary : Types::LensUpgradeSummary? = nil,
          @type : String? = nil
        )
        end
      end

      # A pillar difference return object.

      struct PillarDifference
        include JSON::Serializable

        # Indicates the type of change to the pillar.

        @[JSON::Field(key: "DifferenceStatus")]
        getter difference_status : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?


        @[JSON::Field(key: "PillarName")]
        getter pillar_name : String?

        # List of question differences.

        @[JSON::Field(key: "QuestionDifferences")]
        getter question_differences : Array(Types::QuestionDifference)?

        def initialize(
          @difference_status : String? = nil,
          @pillar_id : String? = nil,
          @pillar_name : String? = nil,
          @question_differences : Array(Types::QuestionDifference)? = nil
        )
        end
      end

      # A metric for a particular pillar in a lens.

      struct PillarMetric
        include JSON::Serializable


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?

        # The questions that have been identified as risks in the pillar.

        @[JSON::Field(key: "Questions")]
        getter questions : Array(Types::QuestionMetric)?


        @[JSON::Field(key: "RiskCounts")]
        getter risk_counts : Hash(String, Int32)?

        def initialize(
          @pillar_id : String? = nil,
          @questions : Array(Types::QuestionMetric)? = nil,
          @risk_counts : Hash(String, Int32)? = nil
        )
        end
      end

      # A pillar review summary of a lens review.

      struct PillarReviewSummary
        include JSON::Serializable


        @[JSON::Field(key: "Notes")]
        getter notes : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?


        @[JSON::Field(key: "PillarName")]
        getter pillar_name : String?


        @[JSON::Field(key: "PrioritizedRiskCounts")]
        getter prioritized_risk_counts : Hash(String, Int32)?


        @[JSON::Field(key: "RiskCounts")]
        getter risk_counts : Hash(String, Int32)?

        def initialize(
          @notes : String? = nil,
          @pillar_id : String? = nil,
          @pillar_name : String? = nil,
          @prioritized_risk_counts : Hash(String, Int32)? = nil,
          @risk_counts : Hash(String, Int32)? = nil
        )
        end
      end

      # A profile.

      struct Profile
        include JSON::Serializable


        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?


        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String?

        # The profile description.

        @[JSON::Field(key: "ProfileDescription")]
        getter profile_description : String?

        # The profile name.

        @[JSON::Field(key: "ProfileName")]
        getter profile_name : String?

        # Profile questions.

        @[JSON::Field(key: "ProfileQuestions")]
        getter profile_questions : Array(Types::ProfileQuestion)?

        # The profile version.

        @[JSON::Field(key: "ProfileVersion")]
        getter profile_version : String?

        # The ID assigned to the share invitation.

        @[JSON::Field(key: "ShareInvitationId")]
        getter share_invitation_id : String?

        # The tags assigned to the profile.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @owner : String? = nil,
          @profile_arn : String? = nil,
          @profile_description : String? = nil,
          @profile_name : String? = nil,
          @profile_questions : Array(Types::ProfileQuestion)? = nil,
          @profile_version : String? = nil,
          @share_invitation_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The profile choice.

      struct ProfileChoice
        include JSON::Serializable


        @[JSON::Field(key: "ChoiceDescription")]
        getter choice_description : String?


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String?


        @[JSON::Field(key: "ChoiceTitle")]
        getter choice_title : String?

        def initialize(
          @choice_description : String? = nil,
          @choice_id : String? = nil,
          @choice_title : String? = nil
        )
        end
      end

      # The profile notification summary.

      struct ProfileNotificationSummary
        include JSON::Serializable

        # The current profile version.

        @[JSON::Field(key: "CurrentProfileVersion")]
        getter current_profile_version : String?

        # The latest profile version.

        @[JSON::Field(key: "LatestProfileVersion")]
        getter latest_profile_version : String?

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String?

        # The profile name.

        @[JSON::Field(key: "ProfileName")]
        getter profile_name : String?

        # Type of notification.

        @[JSON::Field(key: "Type")]
        getter type : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?


        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @current_profile_version : String? = nil,
          @latest_profile_version : String? = nil,
          @profile_arn : String? = nil,
          @profile_name : String? = nil,
          @type : String? = nil,
          @workload_id : String? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # A profile question.

      struct ProfileQuestion
        include JSON::Serializable

        # The maximum number of selected choices.

        @[JSON::Field(key: "MaxSelectedChoices")]
        getter max_selected_choices : Int32?

        # The minimum number of selected choices.

        @[JSON::Field(key: "MinSelectedChoices")]
        getter min_selected_choices : Int32?

        # The question choices.

        @[JSON::Field(key: "QuestionChoices")]
        getter question_choices : Array(Types::ProfileChoice)?


        @[JSON::Field(key: "QuestionDescription")]
        getter question_description : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?


        @[JSON::Field(key: "QuestionTitle")]
        getter question_title : String?

        # The selected choices.

        @[JSON::Field(key: "SelectedChoiceIds")]
        getter selected_choice_ids : Array(String)?

        def initialize(
          @max_selected_choices : Int32? = nil,
          @min_selected_choices : Int32? = nil,
          @question_choices : Array(Types::ProfileChoice)? = nil,
          @question_description : String? = nil,
          @question_id : String? = nil,
          @question_title : String? = nil,
          @selected_choice_ids : Array(String)? = nil
        )
        end
      end

      # An update to a profile question.

      struct ProfileQuestionUpdate
        include JSON::Serializable


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?

        # The selected choices.

        @[JSON::Field(key: "SelectedChoiceIds")]
        getter selected_choice_ids : Array(String)?

        def initialize(
          @question_id : String? = nil,
          @selected_choice_ids : Array(String)? = nil
        )
        end
      end

      # Summary of a profile share.

      struct ProfileShareSummary
        include JSON::Serializable


        @[JSON::Field(key: "ShareId")]
        getter share_id : String?


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        # Profile share invitation status message.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @share_id : String? = nil,
          @shared_with : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Summary of a profile.

      struct ProfileSummary
        include JSON::Serializable


        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?


        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String?

        # The profile description.

        @[JSON::Field(key: "ProfileDescription")]
        getter profile_description : String?

        # The profile name.

        @[JSON::Field(key: "ProfileName")]
        getter profile_name : String?

        # The profile version.

        @[JSON::Field(key: "ProfileVersion")]
        getter profile_version : String?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @owner : String? = nil,
          @profile_arn : String? = nil,
          @profile_description : String? = nil,
          @profile_name : String? = nil,
          @profile_version : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The profile template.

      struct ProfileTemplate
        include JSON::Serializable


        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The name of the profile template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # Profile template questions.

        @[JSON::Field(key: "TemplateQuestions")]
        getter template_questions : Array(Types::ProfileTemplateQuestion)?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @template_name : String? = nil,
          @template_questions : Array(Types::ProfileTemplateQuestion)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # A profile template choice.

      struct ProfileTemplateChoice
        include JSON::Serializable


        @[JSON::Field(key: "ChoiceDescription")]
        getter choice_description : String?


        @[JSON::Field(key: "ChoiceId")]
        getter choice_id : String?


        @[JSON::Field(key: "ChoiceTitle")]
        getter choice_title : String?

        def initialize(
          @choice_description : String? = nil,
          @choice_id : String? = nil,
          @choice_title : String? = nil
        )
        end
      end

      # A profile template question.

      struct ProfileTemplateQuestion
        include JSON::Serializable

        # The maximum number of choices selected.

        @[JSON::Field(key: "MaxSelectedChoices")]
        getter max_selected_choices : Int32?

        # The minimum number of choices selected.

        @[JSON::Field(key: "MinSelectedChoices")]
        getter min_selected_choices : Int32?

        # The question choices.

        @[JSON::Field(key: "QuestionChoices")]
        getter question_choices : Array(Types::ProfileTemplateChoice)?


        @[JSON::Field(key: "QuestionDescription")]
        getter question_description : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?


        @[JSON::Field(key: "QuestionTitle")]
        getter question_title : String?

        def initialize(
          @max_selected_choices : Int32? = nil,
          @min_selected_choices : Int32? = nil,
          @question_choices : Array(Types::ProfileTemplateChoice)? = nil,
          @question_description : String? = nil,
          @question_id : String? = nil,
          @question_title : String? = nil
        )
        end
      end

      # A question difference return object.

      struct QuestionDifference
        include JSON::Serializable

        # Indicates the type of change to the question.

        @[JSON::Field(key: "DifferenceStatus")]
        getter difference_status : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?


        @[JSON::Field(key: "QuestionTitle")]
        getter question_title : String?

        def initialize(
          @difference_status : String? = nil,
          @question_id : String? = nil,
          @question_title : String? = nil
        )
        end
      end

      # A metric for a particular question in the pillar.

      struct QuestionMetric
        include JSON::Serializable

        # The best practices, or choices, that have been identified as contributing to risk in a question.

        @[JSON::Field(key: "BestPractices")]
        getter best_practices : Array(Types::BestPractice)?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?


        @[JSON::Field(key: "Risk")]
        getter risk : String?

        def initialize(
          @best_practices : Array(Types::BestPractice)? = nil,
          @question_id : String? = nil,
          @risk : String? = nil
        )
        end
      end

      # The requested resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String


        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String


        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # A review template.

      struct ReviewTemplate
        include JSON::Serializable

        # The review template description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The lenses applied to the review template.

        @[JSON::Field(key: "Lenses")]
        getter lenses : Array(String)?


        @[JSON::Field(key: "Notes")]
        getter notes : String?


        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # A count of how many total questions are answered and unanswered in the review template.

        @[JSON::Field(key: "QuestionCounts")]
        getter question_counts : Hash(String, Int32)?

        # The ID assigned to the template share invitation.

        @[JSON::Field(key: "ShareInvitationId")]
        getter share_invitation_id : String?

        # The tags assigned to the review template.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        # The name of the review template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # The latest status of a review template.

        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : String?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @description : String? = nil,
          @lenses : Array(String)? = nil,
          @notes : String? = nil,
          @owner : String? = nil,
          @question_counts : Hash(String, Int32)? = nil,
          @share_invitation_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @template_arn : String? = nil,
          @template_name : String? = nil,
          @update_status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # An answer of the question.

      struct ReviewTemplateAnswer
        include JSON::Serializable

        # The status of whether or not this question has been answered.

        @[JSON::Field(key: "AnswerStatus")]
        getter answer_status : String?

        # A list of selected choices to a question in your review template.

        @[JSON::Field(key: "ChoiceAnswers")]
        getter choice_answers : Array(Types::ChoiceAnswer)?


        @[JSON::Field(key: "Choices")]
        getter choices : Array(Types::Choice)?

        # The helpful resource text to be displayed for a custom lens. This field does not apply to Amazon Web
        # Services official lenses.

        @[JSON::Field(key: "HelpfulResourceDisplayText")]
        getter helpful_resource_display_text : String?


        @[JSON::Field(key: "HelpfulResourceUrl")]
        getter helpful_resource_url : String?


        @[JSON::Field(key: "ImprovementPlanUrl")]
        getter improvement_plan_url : String?


        @[JSON::Field(key: "IsApplicable")]
        getter is_applicable : Bool?


        @[JSON::Field(key: "Notes")]
        getter notes : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?


        @[JSON::Field(key: "QuestionDescription")]
        getter question_description : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?


        @[JSON::Field(key: "QuestionTitle")]
        getter question_title : String?

        # The reason why the question is not applicable to your review template.

        @[JSON::Field(key: "Reason")]
        getter reason : String?


        @[JSON::Field(key: "SelectedChoices")]
        getter selected_choices : Array(String)?

        def initialize(
          @answer_status : String? = nil,
          @choice_answers : Array(Types::ChoiceAnswer)? = nil,
          @choices : Array(Types::Choice)? = nil,
          @helpful_resource_display_text : String? = nil,
          @helpful_resource_url : String? = nil,
          @improvement_plan_url : String? = nil,
          @is_applicable : Bool? = nil,
          @notes : String? = nil,
          @pillar_id : String? = nil,
          @question_description : String? = nil,
          @question_id : String? = nil,
          @question_title : String? = nil,
          @reason : String? = nil,
          @selected_choices : Array(String)? = nil
        )
        end
      end

      # The summary of review template answers.

      struct ReviewTemplateAnswerSummary
        include JSON::Serializable

        # The status of whether or not this question has been answered.

        @[JSON::Field(key: "AnswerStatus")]
        getter answer_status : String?

        # A list of selected choices to a question in the review template.

        @[JSON::Field(key: "ChoiceAnswerSummaries")]
        getter choice_answer_summaries : Array(Types::ChoiceAnswerSummary)?


        @[JSON::Field(key: "Choices")]
        getter choices : Array(Types::Choice)?


        @[JSON::Field(key: "IsApplicable")]
        getter is_applicable : Bool?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?


        @[JSON::Field(key: "QuestionTitle")]
        getter question_title : String?

        # The type of question.

        @[JSON::Field(key: "QuestionType")]
        getter question_type : String?

        # The reason why a choice is not-applicable to a question in the review template.

        @[JSON::Field(key: "Reason")]
        getter reason : String?


        @[JSON::Field(key: "SelectedChoices")]
        getter selected_choices : Array(String)?

        def initialize(
          @answer_status : String? = nil,
          @choice_answer_summaries : Array(Types::ChoiceAnswerSummary)? = nil,
          @choices : Array(Types::Choice)? = nil,
          @is_applicable : Bool? = nil,
          @pillar_id : String? = nil,
          @question_id : String? = nil,
          @question_title : String? = nil,
          @question_type : String? = nil,
          @reason : String? = nil,
          @selected_choices : Array(String)? = nil
        )
        end
      end

      # The lens review of a review template.

      struct ReviewTemplateLensReview
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The lens ARN.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?


        @[JSON::Field(key: "LensName")]
        getter lens_name : String?

        # The status of the lens.

        @[JSON::Field(key: "LensStatus")]
        getter lens_status : String?

        # The version of the lens.

        @[JSON::Field(key: "LensVersion")]
        getter lens_version : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # Pillar review summaries of a lens review.

        @[JSON::Field(key: "PillarReviewSummaries")]
        getter pillar_review_summaries : Array(Types::ReviewTemplatePillarReviewSummary)?

        # A count of how many questions are answered and unanswered in the lens review.

        @[JSON::Field(key: "QuestionCounts")]
        getter question_counts : Hash(String, Int32)?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @lens_name : String? = nil,
          @lens_status : String? = nil,
          @lens_version : String? = nil,
          @next_token : String? = nil,
          @notes : String? = nil,
          @pillar_review_summaries : Array(Types::ReviewTemplatePillarReviewSummary)? = nil,
          @question_counts : Hash(String, Int32)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Summary of a review template.

      struct ReviewTemplatePillarReviewSummary
        include JSON::Serializable


        @[JSON::Field(key: "Notes")]
        getter notes : String?


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?


        @[JSON::Field(key: "PillarName")]
        getter pillar_name : String?

        # A count of how many questions are answered and unanswered in the requested pillar of the lens
        # review.

        @[JSON::Field(key: "QuestionCounts")]
        getter question_counts : Hash(String, Int32)?

        def initialize(
          @notes : String? = nil,
          @pillar_id : String? = nil,
          @pillar_name : String? = nil,
          @question_counts : Hash(String, Int32)? = nil
        )
        end
      end

      # Summary of a review template.

      struct ReviewTemplateSummary
        include JSON::Serializable

        # Description of the review template.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Lenses associated with the review template.

        @[JSON::Field(key: "Lenses")]
        getter lenses : Array(String)?


        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        # The name of the review template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # The latest status of a review template.

        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : String?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @description : String? = nil,
          @lenses : Array(String)? = nil,
          @owner : String? = nil,
          @template_arn : String? = nil,
          @template_name : String? = nil,
          @update_status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The selected pillar.

      struct SelectedPillar
        include JSON::Serializable


        @[JSON::Field(key: "PillarId")]
        getter pillar_id : String?

        # Selected question IDs in the selected pillar.

        @[JSON::Field(key: "SelectedQuestionIds")]
        getter selected_question_ids : Array(String)?

        def initialize(
          @pillar_id : String? = nil,
          @selected_question_ids : Array(String)? = nil
        )
        end
      end

      # The user has reached their resource quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String


        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String


        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String


        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?


        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The share invitation.

      struct ShareInvitation
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String?

        # The ID assigned to the share invitation.

        @[JSON::Field(key: "ShareInvitationId")]
        getter share_invitation_id : String?

        # The resource type of the share invitation.

        @[JSON::Field(key: "ShareResourceType")]
        getter share_resource_type : String?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @profile_arn : String? = nil,
          @share_invitation_id : String? = nil,
          @share_resource_type : String? = nil,
          @template_arn : String? = nil,
          @workload_id : String? = nil
        )
        end
      end

      # A share invitation summary return object.

      struct ShareInvitationSummary
        include JSON::Serializable

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?


        @[JSON::Field(key: "LensName")]
        getter lens_name : String?


        @[JSON::Field(key: "PermissionType")]
        getter permission_type : String?

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String?

        # The profile name.

        @[JSON::Field(key: "ProfileName")]
        getter profile_name : String?

        # The ID assigned to the share invitation.

        @[JSON::Field(key: "ShareInvitationId")]
        getter share_invitation_id : String?

        # The resource type of the share invitation.

        @[JSON::Field(key: "ShareResourceType")]
        getter share_resource_type : String?


        @[JSON::Field(key: "SharedBy")]
        getter shared_by : String?


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        # The name of the review template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?


        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @lens_arn : String? = nil,
          @lens_name : String? = nil,
          @permission_type : String? = nil,
          @profile_arn : String? = nil,
          @profile_name : String? = nil,
          @share_invitation_id : String? = nil,
          @share_resource_type : String? = nil,
          @shared_by : String? = nil,
          @shared_with : String? = nil,
          @template_arn : String? = nil,
          @template_name : String? = nil,
          @workload_id : String? = nil,
          @workload_name : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The tags for the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)


        @[JSON::Field(key: "WorkloadArn")]
        getter workload_arn : String

        def initialize(
          @tags : Hash(String, String),
          @workload_arn : String
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Summary of a review template share.

      struct TemplateShareSummary
        include JSON::Serializable


        @[JSON::Field(key: "ShareId")]
        getter share_id : String?


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        # Review template share invitation status message.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @share_id : String? = nil,
          @shared_with : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String


        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?


        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # A list of tag keys. Existing tags of the resource whose keys are members of this list are removed
        # from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)


        @[JSON::Field(key: "WorkloadArn")]
        getter workload_arn : String

        def initialize(
          @tag_keys : Array(String),
          @workload_arn : String
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Input to update answer.

      struct UpdateAnswerInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        # A list of choices to update on a question in your workload. The String key corresponds to the choice
        # ID to be updated.

        @[JSON::Field(key: "ChoiceUpdates")]
        getter choice_updates : Hash(String, Types::ChoiceUpdate)?


        @[JSON::Field(key: "IsApplicable")]
        getter is_applicable : Bool?


        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # The reason why a question is not applicable to your workload.

        @[JSON::Field(key: "Reason")]
        getter reason : String?


        @[JSON::Field(key: "SelectedChoices")]
        getter selected_choices : Array(String)?

        def initialize(
          @lens_alias : String,
          @question_id : String,
          @workload_id : String,
          @choice_updates : Hash(String, Types::ChoiceUpdate)? = nil,
          @is_applicable : Bool? = nil,
          @notes : String? = nil,
          @reason : String? = nil,
          @selected_choices : Array(String)? = nil
        )
        end
      end

      # Output of a update answer call.

      struct UpdateAnswerOutput
        include JSON::Serializable


        @[JSON::Field(key: "Answer")]
        getter answer : Types::Answer?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The ARN for the lens.

        @[JSON::Field(key: "LensArn")]
        getter lens_arn : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @answer : Types::Answer? = nil,
          @lens_alias : String? = nil,
          @lens_arn : String? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct UpdateGlobalSettingsInput
        include JSON::Serializable

        # The status of discovery support settings.

        @[JSON::Field(key: "DiscoveryIntegrationStatus")]
        getter discovery_integration_status : String?

        # The status of Jira integration settings.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::AccountJiraConfigurationInput?

        # The status of organization sharing settings.

        @[JSON::Field(key: "OrganizationSharingStatus")]
        getter organization_sharing_status : String?

        def initialize(
          @discovery_integration_status : String? = nil,
          @jira_configuration : Types::AccountJiraConfigurationInput? = nil,
          @organization_sharing_status : String? = nil
        )
        end
      end


      struct UpdateIntegrationInput
        include JSON::Serializable


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # Which integrated service to update.

        @[JSON::Field(key: "IntegratingService")]
        getter integrating_service : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @client_request_token : String,
          @integrating_service : String,
          @workload_id : String
        )
        end
      end

      # Input for update lens review.

      struct UpdateLensReviewInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        # Configuration of the Jira integration.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::JiraSelectedQuestionConfiguration?


        @[JSON::Field(key: "LensNotes")]
        getter lens_notes : String?


        @[JSON::Field(key: "PillarNotes")]
        getter pillar_notes : Hash(String, String)?

        def initialize(
          @lens_alias : String,
          @workload_id : String,
          @jira_configuration : Types::JiraSelectedQuestionConfiguration? = nil,
          @lens_notes : String? = nil,
          @pillar_notes : Hash(String, String)? = nil
        )
        end
      end

      # Output of a update lens review call.

      struct UpdateLensReviewOutput
        include JSON::Serializable


        @[JSON::Field(key: "LensReview")]
        getter lens_review : Types::LensReview?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?

        def initialize(
          @lens_review : Types::LensReview? = nil,
          @workload_id : String? = nil
        )
        end
      end


      struct UpdateProfileInput
        include JSON::Serializable

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String

        # The profile description.

        @[JSON::Field(key: "ProfileDescription")]
        getter profile_description : String?

        # Profile questions.

        @[JSON::Field(key: "ProfileQuestions")]
        getter profile_questions : Array(Types::ProfileQuestionUpdate)?

        def initialize(
          @profile_arn : String,
          @profile_description : String? = nil,
          @profile_questions : Array(Types::ProfileQuestionUpdate)? = nil
        )
        end
      end


      struct UpdateProfileOutput
        include JSON::Serializable

        # The profile.

        @[JSON::Field(key: "Profile")]
        getter profile : Types::Profile?

        def initialize(
          @profile : Types::Profile? = nil
        )
        end
      end


      struct UpdateReviewTemplateAnswerInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "QuestionId")]
        getter question_id : String

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        # A list of choices to be updated.

        @[JSON::Field(key: "ChoiceUpdates")]
        getter choice_updates : Hash(String, Types::ChoiceUpdate)?


        @[JSON::Field(key: "IsApplicable")]
        getter is_applicable : Bool?


        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # The update reason.

        @[JSON::Field(key: "Reason")]
        getter reason : String?


        @[JSON::Field(key: "SelectedChoices")]
        getter selected_choices : Array(String)?

        def initialize(
          @lens_alias : String,
          @question_id : String,
          @template_arn : String,
          @choice_updates : Hash(String, Types::ChoiceUpdate)? = nil,
          @is_applicable : Bool? = nil,
          @notes : String? = nil,
          @reason : String? = nil,
          @selected_choices : Array(String)? = nil
        )
        end
      end


      struct UpdateReviewTemplateAnswerOutput
        include JSON::Serializable

        # An answer of the question.

        @[JSON::Field(key: "Answer")]
        getter answer : Types::ReviewTemplateAnswer?


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @answer : Types::ReviewTemplateAnswer? = nil,
          @lens_alias : String? = nil,
          @template_arn : String? = nil
        )
        end
      end


      struct UpdateReviewTemplateInput
        include JSON::Serializable

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        # The review template description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of lens aliases or ARNs to apply to the review template.

        @[JSON::Field(key: "LensesToAssociate")]
        getter lenses_to_associate : Array(String)?

        # A list of lens aliases or ARNs to unapply to the review template. The wellarchitected lens cannot be
        # unapplied.

        @[JSON::Field(key: "LensesToDisassociate")]
        getter lenses_to_disassociate : Array(String)?


        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # The review template name.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @template_arn : String,
          @description : String? = nil,
          @lenses_to_associate : Array(String)? = nil,
          @lenses_to_disassociate : Array(String)? = nil,
          @notes : String? = nil,
          @template_name : String? = nil
        )
        end
      end


      struct UpdateReviewTemplateLensReviewInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String


        @[JSON::Field(key: "LensNotes")]
        getter lens_notes : String?


        @[JSON::Field(key: "PillarNotes")]
        getter pillar_notes : Hash(String, String)?

        def initialize(
          @lens_alias : String,
          @template_arn : String,
          @lens_notes : String? = nil,
          @pillar_notes : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateReviewTemplateLensReviewOutput
        include JSON::Serializable

        # A lens review of a question.

        @[JSON::Field(key: "LensReview")]
        getter lens_review : Types::ReviewTemplateLensReview?

        # The review template ARN.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @lens_review : Types::ReviewTemplateLensReview? = nil,
          @template_arn : String? = nil
        )
        end
      end


      struct UpdateReviewTemplateOutput
        include JSON::Serializable

        # A review template.

        @[JSON::Field(key: "ReviewTemplate")]
        getter review_template : Types::ReviewTemplate?

        def initialize(
          @review_template : Types::ReviewTemplate? = nil
        )
        end
      end

      # Input for Update Share Invitation

      struct UpdateShareInvitationInput
        include JSON::Serializable


        @[JSON::Field(key: "ShareInvitationAction")]
        getter share_invitation_action : String

        # The ID assigned to the share invitation.

        @[JSON::Field(key: "ShareInvitationId")]
        getter share_invitation_id : String

        def initialize(
          @share_invitation_action : String,
          @share_invitation_id : String
        )
        end
      end


      struct UpdateShareInvitationOutput
        include JSON::Serializable

        # The updated workload or custom lens share invitation.

        @[JSON::Field(key: "ShareInvitation")]
        getter share_invitation : Types::ShareInvitation?

        def initialize(
          @share_invitation : Types::ShareInvitation? = nil
        )
        end
      end

      # Input to update a workload.

      struct UpdateWorkloadInput
        include JSON::Serializable


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # List of AppRegistry application ARNs to associate to the workload.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(String)?


        @[JSON::Field(key: "ArchitecturalDesign")]
        getter architectural_design : String?


        @[JSON::Field(key: "AwsRegions")]
        getter aws_regions : Array(String)?


        @[JSON::Field(key: "Description")]
        getter description : String?

        # Well-Architected discovery configuration settings to associate to the workload.

        @[JSON::Field(key: "DiscoveryConfig")]
        getter discovery_config : Types::WorkloadDiscoveryConfig?


        @[JSON::Field(key: "Environment")]
        getter environment : String?


        @[JSON::Field(key: "ImprovementStatus")]
        getter improvement_status : String?


        @[JSON::Field(key: "Industry")]
        getter industry : String?


        @[JSON::Field(key: "IndustryType")]
        getter industry_type : String?

        # Flag indicating whether the workload owner has acknowledged that the Review owner field is required.
        # If a Review owner is not added to the workload within 60 days of acknowledgement, access to the
        # workload is restricted until an owner is added.

        @[JSON::Field(key: "IsReviewOwnerUpdateAcknowledged")]
        getter is_review_owner_update_acknowledged : Bool?

        # Configuration of the Jira integration.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::WorkloadJiraConfigurationInput?


        @[JSON::Field(key: "NonAwsRegions")]
        getter non_aws_regions : Array(String)?


        @[JSON::Field(key: "Notes")]
        getter notes : String?


        @[JSON::Field(key: "PillarPriorities")]
        getter pillar_priorities : Array(String)?


        @[JSON::Field(key: "ReviewOwner")]
        getter review_owner : String?


        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @workload_id : String,
          @account_ids : Array(String)? = nil,
          @applications : Array(String)? = nil,
          @architectural_design : String? = nil,
          @aws_regions : Array(String)? = nil,
          @description : String? = nil,
          @discovery_config : Types::WorkloadDiscoveryConfig? = nil,
          @environment : String? = nil,
          @improvement_status : String? = nil,
          @industry : String? = nil,
          @industry_type : String? = nil,
          @is_review_owner_update_acknowledged : Bool? = nil,
          @jira_configuration : Types::WorkloadJiraConfigurationInput? = nil,
          @non_aws_regions : Array(String)? = nil,
          @notes : String? = nil,
          @pillar_priorities : Array(String)? = nil,
          @review_owner : String? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # Output of an update workload call.

      struct UpdateWorkloadOutput
        include JSON::Serializable


        @[JSON::Field(key: "Workload")]
        getter workload : Types::Workload?

        def initialize(
          @workload : Types::Workload? = nil
        )
        end
      end

      # Input for Update Workload Share

      struct UpdateWorkloadShareInput
        include JSON::Serializable


        @[JSON::Field(key: "PermissionType")]
        getter permission_type : String


        @[JSON::Field(key: "ShareId")]
        getter share_id : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String

        def initialize(
          @permission_type : String,
          @share_id : String,
          @workload_id : String
        )
        end
      end

      # Input for Update Workload Share

      struct UpdateWorkloadShareOutput
        include JSON::Serializable


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?


        @[JSON::Field(key: "WorkloadShare")]
        getter workload_share : Types::WorkloadShare?

        def initialize(
          @workload_id : String? = nil,
          @workload_share : Types::WorkloadShare? = nil
        )
        end
      end


      struct UpgradeLensReviewInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String


        @[JSON::Field(key: "MilestoneName")]
        getter milestone_name : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @lens_alias : String,
          @milestone_name : String,
          @workload_id : String,
          @client_request_token : String? = nil
        )
        end
      end


      struct UpgradeProfileVersionInput
        include JSON::Serializable

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?


        @[JSON::Field(key: "MilestoneName")]
        getter milestone_name : String?

        def initialize(
          @profile_arn : String,
          @workload_id : String,
          @client_request_token : String? = nil,
          @milestone_name : String? = nil
        )
        end
      end


      struct UpgradeReviewTemplateLensReviewInput
        include JSON::Serializable


        @[JSON::Field(key: "LensAlias")]
        getter lens_alias : String

        # The ARN of the review template.

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String


        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @lens_alias : String,
          @template_arn : String,
          @client_request_token : String? = nil
        )
        end
      end

      # The user input is not valid.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String


        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::ValidationExceptionField)?


        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # Stores information about a field passed inside a request that resulted in an exception.

      struct ValidationExceptionField
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String


        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The differences between the base and latest versions of the lens.

      struct VersionDifferences
        include JSON::Serializable

        # The differences between the base and latest versions of the lens.

        @[JSON::Field(key: "PillarDifferences")]
        getter pillar_differences : Array(Types::PillarDifference)?

        def initialize(
          @pillar_differences : Array(Types::PillarDifference)? = nil
        )
        end
      end

      # A workload return object.

      struct Workload
        include JSON::Serializable


        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # List of AppRegistry application ARNs associated to the workload.

        @[JSON::Field(key: "Applications")]
        getter applications : Array(String)?


        @[JSON::Field(key: "ArchitecturalDesign")]
        getter architectural_design : String?


        @[JSON::Field(key: "AwsRegions")]
        getter aws_regions : Array(String)?


        @[JSON::Field(key: "Description")]
        getter description : String?

        # Discovery configuration associated to the workload.

        @[JSON::Field(key: "DiscoveryConfig")]
        getter discovery_config : Types::WorkloadDiscoveryConfig?


        @[JSON::Field(key: "Environment")]
        getter environment : String?


        @[JSON::Field(key: "ImprovementStatus")]
        getter improvement_status : String?


        @[JSON::Field(key: "Industry")]
        getter industry : String?


        @[JSON::Field(key: "IndustryType")]
        getter industry_type : String?

        # Flag indicating whether the workload owner has acknowledged that the Review owner field is required.
        # If a Review owner is not added to the workload within 60 days of acknowledgement, access to the
        # workload is restricted until an owner is added.

        @[JSON::Field(key: "IsReviewOwnerUpdateAcknowledged")]
        getter is_review_owner_update_acknowledged : Bool?

        # Jira configuration for a specific workload.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::WorkloadJiraConfigurationOutput?


        @[JSON::Field(key: "Lenses")]
        getter lenses : Array(String)?


        @[JSON::Field(key: "NonAwsRegions")]
        getter non_aws_regions : Array(String)?


        @[JSON::Field(key: "Notes")]
        getter notes : String?


        @[JSON::Field(key: "Owner")]
        getter owner : String?


        @[JSON::Field(key: "PillarPriorities")]
        getter pillar_priorities : Array(String)?


        @[JSON::Field(key: "PrioritizedRiskCounts")]
        getter prioritized_risk_counts : Hash(String, Int32)?

        # Profile associated with a workload.

        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(Types::WorkloadProfile)?


        @[JSON::Field(key: "ReviewOwner")]
        getter review_owner : String?


        @[JSON::Field(key: "ReviewRestrictionDate")]
        getter review_restriction_date : Time?


        @[JSON::Field(key: "RiskCounts")]
        getter risk_counts : Hash(String, Int32)?

        # The ID assigned to the share invitation.

        @[JSON::Field(key: "ShareInvitationId")]
        getter share_invitation_id : String?

        # The tags associated with the workload.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?


        @[JSON::Field(key: "WorkloadArn")]
        getter workload_arn : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?


        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @account_ids : Array(String)? = nil,
          @applications : Array(String)? = nil,
          @architectural_design : String? = nil,
          @aws_regions : Array(String)? = nil,
          @description : String? = nil,
          @discovery_config : Types::WorkloadDiscoveryConfig? = nil,
          @environment : String? = nil,
          @improvement_status : String? = nil,
          @industry : String? = nil,
          @industry_type : String? = nil,
          @is_review_owner_update_acknowledged : Bool? = nil,
          @jira_configuration : Types::WorkloadJiraConfigurationOutput? = nil,
          @lenses : Array(String)? = nil,
          @non_aws_regions : Array(String)? = nil,
          @notes : String? = nil,
          @owner : String? = nil,
          @pillar_priorities : Array(String)? = nil,
          @prioritized_risk_counts : Hash(String, Int32)? = nil,
          @profiles : Array(Types::WorkloadProfile)? = nil,
          @review_owner : String? = nil,
          @review_restriction_date : Time? = nil,
          @risk_counts : Hash(String, Int32)? = nil,
          @share_invitation_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil,
          @workload_arn : String? = nil,
          @workload_id : String? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # Discovery configuration associated to the workload.

      struct WorkloadDiscoveryConfig
        include JSON::Serializable

        # Discovery integration status in respect to Trusted Advisor for the workload.

        @[JSON::Field(key: "TrustedAdvisorIntegrationStatus")]
        getter trusted_advisor_integration_status : String?

        # The mode to use for identifying resources associated with the workload. You can specify
        # WORKLOAD_METADATA , APP_REGISTRY , or both.

        @[JSON::Field(key: "WorkloadResourceDefinition")]
        getter workload_resource_definition : Array(String)?

        def initialize(
          @trusted_advisor_integration_status : String? = nil,
          @workload_resource_definition : Array(String)? = nil
        )
        end
      end

      # Workload-level: Input for the Jira configuration.

      struct WorkloadJiraConfigurationInput
        include JSON::Serializable

        # Workload-level: Jira issue management status.

        @[JSON::Field(key: "IssueManagementStatus")]
        getter issue_management_status : String?

        # Workload-level: Jira issue management type.

        @[JSON::Field(key: "IssueManagementType")]
        getter issue_management_type : String?

        # Workload-level: Jira project key to sync workloads to.

        @[JSON::Field(key: "JiraProjectKey")]
        getter jira_project_key : String?

        def initialize(
          @issue_management_status : String? = nil,
          @issue_management_type : String? = nil,
          @jira_project_key : String? = nil
        )
        end
      end

      # Workload-level: Output configuration of the Jira integration.

      struct WorkloadJiraConfigurationOutput
        include JSON::Serializable

        # Workload-level: Jira issue management status.

        @[JSON::Field(key: "IssueManagementStatus")]
        getter issue_management_status : String?

        # Workload-level: Jira issue management type.

        @[JSON::Field(key: "IssueManagementType")]
        getter issue_management_type : String?

        # Workload-level: Jira project key to sync workloads to.

        @[JSON::Field(key: "JiraProjectKey")]
        getter jira_project_key : String?

        # Workload-level: Status message on configuration of the Jira integration.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @issue_management_status : String? = nil,
          @issue_management_type : String? = nil,
          @jira_project_key : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # The profile associated with a workload.

      struct WorkloadProfile
        include JSON::Serializable

        # The profile ARN.

        @[JSON::Field(key: "ProfileArn")]
        getter profile_arn : String?

        # The profile version.

        @[JSON::Field(key: "ProfileVersion")]
        getter profile_version : String?

        def initialize(
          @profile_arn : String? = nil,
          @profile_version : String? = nil
        )
        end
      end

      # A workload share return object.

      struct WorkloadShare
        include JSON::Serializable


        @[JSON::Field(key: "PermissionType")]
        getter permission_type : String?


        @[JSON::Field(key: "ShareId")]
        getter share_id : String?


        @[JSON::Field(key: "SharedBy")]
        getter shared_by : String?


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String?


        @[JSON::Field(key: "Status")]
        getter status : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?


        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @permission_type : String? = nil,
          @share_id : String? = nil,
          @shared_by : String? = nil,
          @shared_with : String? = nil,
          @status : String? = nil,
          @workload_id : String? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # A workload share summary return object.

      struct WorkloadShareSummary
        include JSON::Serializable


        @[JSON::Field(key: "PermissionType")]
        getter permission_type : String?


        @[JSON::Field(key: "ShareId")]
        getter share_id : String?


        @[JSON::Field(key: "SharedWith")]
        getter shared_with : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        # Optional message to compliment the Status field.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @permission_type : String? = nil,
          @share_id : String? = nil,
          @shared_with : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # A workload summary return object.

      struct WorkloadSummary
        include JSON::Serializable


        @[JSON::Field(key: "ImprovementStatus")]
        getter improvement_status : String?


        @[JSON::Field(key: "Lenses")]
        getter lenses : Array(String)?


        @[JSON::Field(key: "Owner")]
        getter owner : String?


        @[JSON::Field(key: "PrioritizedRiskCounts")]
        getter prioritized_risk_counts : Hash(String, Int32)?

        # Profile associated with a workload.

        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(Types::WorkloadProfile)?


        @[JSON::Field(key: "RiskCounts")]
        getter risk_counts : Hash(String, Int32)?


        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?


        @[JSON::Field(key: "WorkloadArn")]
        getter workload_arn : String?


        @[JSON::Field(key: "WorkloadId")]
        getter workload_id : String?


        @[JSON::Field(key: "WorkloadName")]
        getter workload_name : String?

        def initialize(
          @improvement_status : String? = nil,
          @lenses : Array(String)? = nil,
          @owner : String? = nil,
          @prioritized_risk_counts : Hash(String, Int32)? = nil,
          @profiles : Array(Types::WorkloadProfile)? = nil,
          @risk_counts : Hash(String, Int32)? = nil,
          @updated_at : Time? = nil,
          @workload_arn : String? = nil,
          @workload_id : String? = nil,
          @workload_name : String? = nil
        )
        end
      end
    end
  end
end
