require "json"
require "time"

module AwsSdk
  module ComputeOptimizerAutomation
    module Types

      # You do not have sufficient permissions to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about an Amazon Web Services account's enrollment and association status with
      # Compute Optimizer Automation.

      struct AccountInfo
        include JSON::Serializable

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The timestamp when the account's Automation enrollment status was last updated.

        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time

        # Specifies whether the management account can create Automation rules that implement optimization
        # actions for this account.

        @[JSON::Field(key: "organizationRuleMode")]
        getter organization_rule_mode : String

        # The enrollment status of the account: Active, Inactive, Pending, or Failed.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the current Automation enrollment status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @account_id : String,
          @last_updated_timestamp : Time,
          @organization_rule_mode : String,
          @status : String,
          @status_reason : String? = nil
        )
        end
      end


      struct AssociateAccountsRequest
        include JSON::Serializable

        # The IDs of the member accounts to associate. You can specify up to 50 account IDs.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # A unique identifier to ensure idempotency of the request. Valid for 24 hours after creation.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @account_ids : Array(String),
          @client_token : String? = nil
        )
        end
      end


      struct AssociateAccountsResponse
        include JSON::Serializable

        # The IDs of the member accounts that were successfully associated.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # Any errors that occurred during the association process.

        @[JSON::Field(key: "errors")]
        getter errors : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @errors : Array(String)? = nil
        )
        end
      end

      # Contains information about an automation event.

      struct AutomationEvent
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the automation event.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The timestamp when the automation event completed.

        @[JSON::Field(key: "completedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_timestamp : Time?

        # The timestamp when the automation event was created.

        @[JSON::Field(key: "createdTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The estimated monthly cost savings associated with this automation event.

        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings?

        # A description of the automation event.

        @[JSON::Field(key: "eventDescription")]
        getter event_description : String?

        # The unique identifier for the automation event.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The current status of the automation event.

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String?

        # The reason for the current event status.

        @[JSON::Field(key: "eventStatusReason")]
        getter event_status_reason : String?

        # The type of automation event.

        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # The ID of the recommended action associated with this automation event.

        @[JSON::Field(key: "recommendedActionId")]
        getter recommended_action_id : String?

        # The Amazon Web Services Region where the automation event occurred.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Resource Name (ARN) of the resource affected by the automation event.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The ID of the resource affected by the automation event.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource affected by the automation event.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The ID of the automation rule that triggered this event.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        def initialize(
          @account_id : String? = nil,
          @completed_timestamp : Time? = nil,
          @created_timestamp : Time? = nil,
          @estimated_monthly_savings : Types::EstimatedMonthlySavings? = nil,
          @event_description : String? = nil,
          @event_id : String? = nil,
          @event_status : String? = nil,
          @event_status_reason : String? = nil,
          @event_type : String? = nil,
          @recommended_action_id : String? = nil,
          @region : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @rule_id : String? = nil
        )
        end
      end

      # A filter to apply when listing automation events.

      struct AutomationEventFilter
        include JSON::Serializable

        # The name of the filter to apply.

        @[JSON::Field(key: "name")]
        getter name : String

        # The values to use for the specified filter.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Contains information about a step in an automation event.

      struct AutomationEventStep
        include JSON::Serializable

        # The timestamp when this automation event step completed execution.

        @[JSON::Field(key: "completedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_timestamp : Time?


        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings?

        # The ID of the automation event this step belongs to.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The unique identifier of the resource being acted upon in this step.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The timestamp when this automation event step started execution.

        @[JSON::Field(key: "startTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_timestamp : Time?

        # The unique identifier for this step.

        @[JSON::Field(key: "stepId")]
        getter step_id : String?

        # The current status of the step.

        @[JSON::Field(key: "stepStatus")]
        getter step_status : String?

        # The type of step.

        @[JSON::Field(key: "stepType")]
        getter step_type : String?

        def initialize(
          @completed_timestamp : Time? = nil,
          @estimated_monthly_savings : Types::EstimatedMonthlySavings? = nil,
          @event_id : String? = nil,
          @resource_id : String? = nil,
          @start_timestamp : Time? = nil,
          @step_id : String? = nil,
          @step_status : String? = nil,
          @step_type : String? = nil
        )
        end
      end

      # A summary of automation events grouped by specified dimensions.

      struct AutomationEventSummary
        include JSON::Serializable

        # The dimensions used to group this summary, such as event status.

        @[JSON::Field(key: "dimensions")]
        getter dimensions : Array(Types::SummaryDimension)?

        # The key identifier for this summary grouping.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The time period covered by this summary, with inclusive start time and exclusive end time.

        @[JSON::Field(key: "timePeriod")]
        getter time_period : Types::TimePeriod?

        # The aggregated totals for this summary, including event count and estimated savings.

        @[JSON::Field(key: "total")]
        getter total : Types::SummaryTotals?

        def initialize(
          @dimensions : Array(Types::SummaryDimension)? = nil,
          @key : String? = nil,
          @time_period : Types::TimePeriod? = nil,
          @total : Types::SummaryTotals? = nil
        )
        end
      end

      # Represents a complete automation rule configuration including criteria, schedule, and execution
      # settings.

      struct AutomationRule
        include JSON::Serializable

        # The 12-digit Amazon Web Services account ID that owns this automation rule.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The timestamp when the automation rule was created.

        @[JSON::Field(key: "createdTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # A description of the automation rule.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp when the automation rule was last updated.

        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The name of the automation rule.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Configuration settings for organization-wide rules.

        @[JSON::Field(key: "organizationConfiguration")]
        getter organization_configuration : Types::OrganizationConfiguration?

        # A string representation of a decimal number between 0 and 1 (having up to 30 digits after the
        # decimal point) that determines the priority of the rule. When multiple rules match the same
        # recommended action, Compute Optimizer assigns the action to the rule with the lowest priority value
        # (highest priority), even if that rule is scheduled to run later than other matching rules.

        @[JSON::Field(key: "priority")]
        getter priority : String?

        # List of recommended action types that this rule can execute.

        @[JSON::Field(key: "recommendedActionTypes")]
        getter recommended_action_types : Array(String)?

        # The Amazon Resource Name (ARN) of the automation rule.

        @[JSON::Field(key: "ruleArn")]
        getter rule_arn : String?

        # The unique identifier of the automation rule.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        # The revision number of the automation rule.

        @[JSON::Field(key: "ruleRevision")]
        getter rule_revision : Int64?

        # The type of automation rule (OrganizationRule or AccountRule).

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String?

        # The schedule configuration for when the automation rule should execute.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The current status of the automation rule (Active or Inactive).

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @created_timestamp : Time? = nil,
          @description : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @name : String? = nil,
          @organization_configuration : Types::OrganizationConfiguration? = nil,
          @priority : String? = nil,
          @recommended_action_types : Array(String)? = nil,
          @rule_arn : String? = nil,
          @rule_id : String? = nil,
          @rule_revision : Int64? = nil,
          @rule_type : String? = nil,
          @schedule : Types::Schedule? = nil,
          @status : String? = nil
        )
        end
      end


      struct CreateAutomationRuleRequest
        include JSON::Serializable

        # The name of the automation rule.

        @[JSON::Field(key: "name")]
        getter name : String

        # The types of recommended actions this rule will automate.

        @[JSON::Field(key: "recommendedActionTypes")]
        getter recommended_action_types : Array(String)

        # The type of rule. Only the management account or a delegated administrator can set the ruleType to
        # be OrganizationRule.

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String

        # The schedule for when the rule should run.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule

        # The status of the rule

        @[JSON::Field(key: "status")]
        getter status : String

        # A unique identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A set of conditions that specify which recommended action qualify for implementation. When a rule is
        # active and a recommended action matches these criteria, Compute Optimizer implements the action at
        # the scheduled run time.

        @[JSON::Field(key: "criteria")]
        getter criteria : Types::Criteria?

        # A description of the automation rule.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Configuration for organization-level rules. Required for OrganizationRule type.

        @[JSON::Field(key: "organizationConfiguration")]
        getter organization_configuration : Types::OrganizationConfiguration?

        # A string representation of a decimal number between 0 and 1 (having up to 30 digits after the
        # decimal point) that determines the priority of the rule. When multiple rules match the same
        # recommended action, Compute Optimizer assigns the action to the rule with the lowest priority value
        # (highest priority), even if that rule is scheduled to run later than other matching rules.

        @[JSON::Field(key: "priority")]
        getter priority : String?

        # The tags to associate with the rule.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @recommended_action_types : Array(String),
          @rule_type : String,
          @schedule : Types::Schedule,
          @status : String,
          @client_token : String? = nil,
          @criteria : Types::Criteria? = nil,
          @description : String? = nil,
          @organization_configuration : Types::OrganizationConfiguration? = nil,
          @priority : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAutomationRuleResponse
        include JSON::Serializable

        # The timestamp when the automation rule was created.

        @[JSON::Field(key: "createdTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?


        @[JSON::Field(key: "criteria")]
        getter criteria : Types::Criteria?

        # A description of the automation rule. Can be up to 1024 characters long and contain alphanumeric
        # characters, underscores, hyphens, spaces, and certain special characters.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the automation rule. Must be 1-128 characters long and contain only alphanumeric
        # characters, underscores, and hyphens.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Configuration settings for organization-wide rules, including rule application order and target
        # account IDs.

        @[JSON::Field(key: "organizationConfiguration")]
        getter organization_configuration : Types::OrganizationConfiguration?

        # The priority level of the automation rule, used to determine execution order when multiple rules
        # apply to the same resource.

        @[JSON::Field(key: "priority")]
        getter priority : String?

        # List of recommended action types that this rule can execute, such as
        # SnapshotAndDeleteUnattachedEbsVolume or UpgradeEbsVolumeType.

        @[JSON::Field(key: "recommendedActionTypes")]
        getter recommended_action_types : Array(String)?

        # The Amazon Resource Name (ARN) of the created rule.

        @[JSON::Field(key: "ruleArn")]
        getter rule_arn : String?

        # The unique identifier of the created rule.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        # The revision number of the automation rule. This is incremented each time the rule is updated.

        @[JSON::Field(key: "ruleRevision")]
        getter rule_revision : Int64?

        # The type of automation rule. Can be either OrganizationRule for organization-wide rules or
        # AccountRule for account-specific rules.

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String?

        # The schedule configuration for when the automation rule should execute, including cron expression,
        # timezone, and execution window.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The current status of the automation rule. Can be Active or Inactive.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of key-value pairs used to categorize and organize the automation rule. Maximum of 200 tags
        # allowed.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @created_timestamp : Time? = nil,
          @criteria : Types::Criteria? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @organization_configuration : Types::OrganizationConfiguration? = nil,
          @priority : String? = nil,
          @recommended_action_types : Array(String)? = nil,
          @rule_arn : String? = nil,
          @rule_id : String? = nil,
          @rule_revision : Int64? = nil,
          @rule_type : String? = nil,
          @schedule : Types::Schedule? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A set of conditions that specify which recommended action qualify for implementation. When a rule is
      # active and a recommended action matches these criteria, Compute Optimizer implements the action at
      # the scheduled run time. You can specify up to 20 conditions per filter criteria and 20 values per
      # condition.

      struct Criteria
        include JSON::Serializable

        # Filter criteria for EBS volume sizes in gibibytes (GiB).

        @[JSON::Field(key: "ebsVolumeSizeInGib")]
        getter ebs_volume_size_in_gib : Array(Types::IntegerCriteriaCondition)?

        # Filter criteria for EBS volume types, such as gp2, gp3, io1, io2, st1, or sc1.

        @[JSON::Field(key: "ebsVolumeType")]
        getter ebs_volume_type : Array(Types::StringCriteriaCondition)?

        # Filter criteria for estimated monthly cost savings from the recommended action.

        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Array(Types::DoubleCriteriaCondition)?

        # Filter criteria for the lookback period in days used to analyze resource utilization.

        @[JSON::Field(key: "lookBackPeriodInDays")]
        getter look_back_period_in_days : Array(Types::IntegerCriteriaCondition)?

        # Filter criteria for Amazon Web Services regions where resources must be located.

        @[JSON::Field(key: "region")]
        getter region : Array(Types::StringCriteriaCondition)?

        # Filter criteria for specific resource ARNs to include or exclude.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : Array(Types::StringCriteriaCondition)?

        # Filter criteria for resource tags, allowing filtering by tag key and value combinations.

        @[JSON::Field(key: "resourceTag")]
        getter resource_tag : Array(Types::ResourceTagsCriteriaCondition)?

        # Filter criteria indicating whether the recommended action requires a resource restart.

        @[JSON::Field(key: "restartNeeded")]
        getter restart_needed : Array(Types::StringCriteriaCondition)?

        def initialize(
          @ebs_volume_size_in_gib : Array(Types::IntegerCriteriaCondition)? = nil,
          @ebs_volume_type : Array(Types::StringCriteriaCondition)? = nil,
          @estimated_monthly_savings : Array(Types::DoubleCriteriaCondition)? = nil,
          @look_back_period_in_days : Array(Types::IntegerCriteriaCondition)? = nil,
          @region : Array(Types::StringCriteriaCondition)? = nil,
          @resource_arn : Array(Types::StringCriteriaCondition)? = nil,
          @resource_tag : Array(Types::ResourceTagsCriteriaCondition)? = nil,
          @restart_needed : Array(Types::StringCriteriaCondition)? = nil
        )
        end
      end


      struct DeleteAutomationRuleRequest
        include JSON::Serializable

        # The ARN of the rule to delete.

        @[JSON::Field(key: "ruleArn")]
        getter rule_arn : String

        # The revision number of the rule to delete.

        @[JSON::Field(key: "ruleRevision")]
        getter rule_revision : Int64

        # A unique identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @rule_arn : String,
          @rule_revision : Int64,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteAutomationRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateAccountsRequest
        include JSON::Serializable

        # The IDs of the member accounts to disassociate.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # A unique identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @account_ids : Array(String),
          @client_token : String? = nil
        )
        end
      end


      struct DisassociateAccountsResponse
        include JSON::Serializable

        # The IDs of the member accounts that were successfully disassociated.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # Any errors that occurred during the disassociation process.

        @[JSON::Field(key: "errors")]
        getter errors : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @errors : Array(String)? = nil
        )
        end
      end

      # Defines a condition for filtering based on double/floating-point numeric values with comparison
      # operators.

      struct DoubleCriteriaCondition
        include JSON::Serializable

        # The comparison operator to use, such as equals, greater than, less than, etc.

        @[JSON::Field(key: "comparison")]
        getter comparison : String?

        # The list of double values to compare against using the specified comparison operator.

        @[JSON::Field(key: "values")]
        getter values : Array(Float64)?

        def initialize(
          @comparison : String? = nil,
          @values : Array(Float64)? = nil
        )
        end
      end

      # Represents an Amazon EBS volume with its configuration and snapshot usage information.

      struct EbsVolume
        include JSON::Serializable

        # The configuration details of the EBS volume, including type, size, IOPS, and throughput.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::EbsVolumeConfiguration?

        def initialize(
          @configuration : Types::EbsVolumeConfiguration? = nil
        )
        end
      end

      # Configuration details for an Amazon EBS volume.

      struct EbsVolumeConfiguration
        include JSON::Serializable

        # The number of I/O operations per second (IOPS) provisioned for the volume.

        @[JSON::Field(key: "iops")]
        getter iops : Int32?

        # The size of the EBS volume in gibibytes (GiB).

        @[JSON::Field(key: "sizeInGib")]
        getter size_in_gib : Int32?

        # The throughput in MiB/s provisioned for the volume (applicable to gp3, io1, and io2bx volumes).

        @[JSON::Field(key: "throughput")]
        getter throughput : Int32?

        # The EBS volume type, such as gp2, gp3, io1, io2, st1, or sc1.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @iops : Int32? = nil,
          @size_in_gib : Int32? = nil,
          @throughput : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information about estimated monthly cost savings.

      struct EstimatedMonthlySavings
        include JSON::Serializable

        # The estimated monthly savings after applying any discounts.

        @[JSON::Field(key: "afterDiscountSavings")]
        getter after_discount_savings : Float64

        # The estimated monthly savings before applying any discounts.

        @[JSON::Field(key: "beforeDiscountSavings")]
        getter before_discount_savings : Float64

        # The currency of the estimated savings.

        @[JSON::Field(key: "currency")]
        getter currency : String

        # The mode used to calculate savings, either BeforeDiscount or AfterDiscount.

        @[JSON::Field(key: "savingsEstimationMode")]
        getter savings_estimation_mode : String

        def initialize(
          @after_discount_savings : Float64,
          @before_discount_savings : Float64,
          @currency : String,
          @savings_estimation_mode : String
        )
        end
      end

      # A filter used to narrow down results based on specific criteria.

      struct Filter
        include JSON::Serializable

        # The name of the filter field to apply.

        @[JSON::Field(key: "name")]
        getter name : String

        # The list of values to filter by for the specified filter field.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # You are not authorized to perform this action.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetAutomationEventRequest
        include JSON::Serializable

        # The ID of the automation event to retrieve.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        def initialize(
          @event_id : String
        )
        end
      end


      struct GetAutomationEventResponse
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the automation event.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The timestamp when the automation event completed.

        @[JSON::Field(key: "completedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_timestamp : Time?

        # The timestamp when the automation event was created.

        @[JSON::Field(key: "createdTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?


        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings?

        # A description of the automation event.

        @[JSON::Field(key: "eventDescription")]
        getter event_description : String?

        # The ID of the automation event to retrieve.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The current status of the automation event.

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String?

        # The reason for the current event status.

        @[JSON::Field(key: "eventStatusReason")]
        getter event_status_reason : String?

        # The type of automation event.

        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # The ID of the recommended action associated with this automation event.

        @[JSON::Field(key: "recommendedActionId")]
        getter recommended_action_id : String?

        # The Amazon Web Services Region where the automation event occurred.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Resource Name (ARN) of the resource affected by the automation event.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The ID of the resource affected by the automation event.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource affected by the automation event.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The ID of the automation rule that triggered this event.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        def initialize(
          @account_id : String? = nil,
          @completed_timestamp : Time? = nil,
          @created_timestamp : Time? = nil,
          @estimated_monthly_savings : Types::EstimatedMonthlySavings? = nil,
          @event_description : String? = nil,
          @event_id : String? = nil,
          @event_status : String? = nil,
          @event_status_reason : String? = nil,
          @event_type : String? = nil,
          @recommended_action_id : String? = nil,
          @region : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @rule_id : String? = nil
        )
        end
      end


      struct GetAutomationRuleRequest
        include JSON::Serializable

        # The ARN of the rule to retrieve.

        @[JSON::Field(key: "ruleArn")]
        getter rule_arn : String

        def initialize(
          @rule_arn : String
        )
        end
      end


      struct GetAutomationRuleResponse
        include JSON::Serializable

        # The 12-digit Amazon Web Services account ID that owns this automation rule.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The timestamp when the automation rule was created.

        @[JSON::Field(key: "createdTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?


        @[JSON::Field(key: "criteria")]
        getter criteria : Types::Criteria?

        # A description of the automation rule.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp when the automation rule was last updated.

        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The name of the automation rule.

        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "organizationConfiguration")]
        getter organization_configuration : Types::OrganizationConfiguration?

        # A string representation of a decimal number between 0 and 1 (having up to 30 digits after the
        # decimal point) that determines the priority of the rule.

        @[JSON::Field(key: "priority")]
        getter priority : String?

        # List of recommended action types that this rule can execute.

        @[JSON::Field(key: "recommendedActionTypes")]
        getter recommended_action_types : Array(String)?

        # The Amazon Resource Name (ARN) of the automation rule.

        @[JSON::Field(key: "ruleArn")]
        getter rule_arn : String?

        # The unique identifier of the automation rule.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        # The revision number of the automation rule.

        @[JSON::Field(key: "ruleRevision")]
        getter rule_revision : Int64?

        # The type of automation rule.

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String?


        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The current status of the automation rule (Active or Inactive).

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags associated with the automation rule.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_id : String? = nil,
          @created_timestamp : Time? = nil,
          @criteria : Types::Criteria? = nil,
          @description : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @name : String? = nil,
          @organization_configuration : Types::OrganizationConfiguration? = nil,
          @priority : String? = nil,
          @recommended_action_types : Array(String)? = nil,
          @rule_arn : String? = nil,
          @rule_id : String? = nil,
          @rule_revision : Int64? = nil,
          @rule_type : String? = nil,
          @schedule : Types::Schedule? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct GetEnrollmentConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetEnrollmentConfigurationResponse
        include JSON::Serializable

        # The current enrollment status.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of the last update to the enrollment configuration.

        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # Specifies whether the management account can create Automation rules that implement optimization
        # actions for this account.

        @[JSON::Field(key: "organizationRuleMode")]
        getter organization_rule_mode : String?

        # The reason for the current enrollment status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status : String,
          @last_updated_timestamp : Time? = nil,
          @organization_rule_mode : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The specified client token is already in use.

      struct IdempotencyTokenInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception thrown when the same client token is used with different parameters, indicating a mismatch
      # in idempotent request parameters.

      struct IdempotentParameterMismatchException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines a condition for filtering based on integer values with comparison operators.

      struct IntegerCriteriaCondition
        include JSON::Serializable

        # The comparison operator to use, such as equals, greater than, less than, etc.

        @[JSON::Field(key: "comparison")]
        getter comparison : String?

        # The list of integer values to compare against using the specified comparison operator.

        @[JSON::Field(key: "values")]
        getter values : Array(Int32)?

        def initialize(
          @comparison : String? = nil,
          @values : Array(Int32)? = nil
        )
        end
      end

      # An internal error occurred while processing the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameter values are not valid.

      struct InvalidParameterValueException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAccountsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccountsResponse
        include JSON::Serializable

        # The list of accounts in your organization enrolled in Compute Optimizer

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::AccountInfo)

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @accounts : Array(Types::AccountInfo),
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomationEventStepsRequest
        include JSON::Serializable

        # The ID of the automation event.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # The maximum number of automation event steps to return in a single response. Valid range is 1-1000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination to retrieve the next set of results when the response is truncated.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @event_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomationEventStepsResponse
        include JSON::Serializable

        # The list of steps for the specified automation event.

        @[JSON::Field(key: "automationEventSteps")]
        getter automation_event_steps : Array(Types::AutomationEventStep)?

        # A token used for pagination. If present, indicates there are more results available and can be used
        # in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @automation_event_steps : Array(Types::AutomationEventStep)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomationEventSummariesRequest
        include JSON::Serializable

        # The end date for filtering automation event summaries, exclusive. Events created before this date
        # will be included.

        @[JSON::Field(key: "endDateExclusive")]
        getter end_date_exclusive : String?

        # The filters to apply to the list of automation event summaries.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AutomationEventFilter)?

        # The maximum number of automation event summaries to return in a single response. Valid range is
        # 1-1000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination to retrieve the next set of results when the response is truncated.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The start date for filtering automation event summaries, inclusive. Events created on or after this
        # date will be included.

        @[JSON::Field(key: "startDateInclusive")]
        getter start_date_inclusive : String?

        def initialize(
          @end_date_exclusive : String? = nil,
          @filters : Array(Types::AutomationEventFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_date_inclusive : String? = nil
        )
        end
      end


      struct ListAutomationEventSummariesResponse
        include JSON::Serializable

        # The list of automation event summaries that match the specified criteria.

        @[JSON::Field(key: "automationEventSummaries")]
        getter automation_event_summaries : Array(Types::AutomationEventSummary)?

        # A token used for pagination. If present, indicates there are more results available and can be used
        # in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @automation_event_summaries : Array(Types::AutomationEventSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomationEventsRequest
        include JSON::Serializable

        # The end of the time range to query for events.

        @[JSON::Field(key: "endTimeExclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time_exclusive : Time?

        # The filters to apply to the list of automation events.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::AutomationEventFilter)?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The start of the time range to query for events.

        @[JSON::Field(key: "startTimeInclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time_inclusive : Time?

        def initialize(
          @end_time_exclusive : Time? = nil,
          @filters : Array(Types::AutomationEventFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time_inclusive : Time? = nil
        )
        end
      end


      struct ListAutomationEventsResponse
        include JSON::Serializable

        # The list of automation events that match the specified criteria.

        @[JSON::Field(key: "automationEvents")]
        getter automation_events : Array(Types::AutomationEvent)?

        # The token to use to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @automation_events : Array(Types::AutomationEvent)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomationRulePreviewRequest
        include JSON::Serializable

        # The types of recommended actions to include in the preview.

        @[JSON::Field(key: "recommendedActionTypes")]
        getter recommended_action_types : Array(String)

        # The type of rule. Only the management account or a delegated administrator can set the ruleType to
        # be OrganizationRule.

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String

        # A set of conditions that specify which recommended action qualify for implementation. When a rule is
        # active and a recommended action matches these criteria, Compute Optimizer implements the action at
        # the scheduled run time.

        @[JSON::Field(key: "criteria")]
        getter criteria : Types::Criteria?

        # The maximum number of automation rule preview results to return in a single response. Valid range is
        # 1-1000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination to retrieve the next set of results when the response is truncated.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The organizational scope for the rule preview.

        @[JSON::Field(key: "organizationScope")]
        getter organization_scope : Types::OrganizationScope?

        def initialize(
          @recommended_action_types : Array(String),
          @rule_type : String,
          @criteria : Types::Criteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @organization_scope : Types::OrganizationScope? = nil
        )
        end
      end


      struct ListAutomationRulePreviewResponse
        include JSON::Serializable

        # A token used for pagination. If present, indicates there are more results available and can be used
        # in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of actions that would be taken based on the specified criteria.

        @[JSON::Field(key: "previewResults")]
        getter preview_results : Array(Types::PreviewResult)?

        def initialize(
          @next_token : String? = nil,
          @preview_results : Array(Types::PreviewResult)? = nil
        )
        end
      end


      struct ListAutomationRulePreviewSummariesRequest
        include JSON::Serializable

        # The types of recommended actions to include in the preview.

        @[JSON::Field(key: "recommendedActionTypes")]
        getter recommended_action_types : Array(String)

        # The type of rule.

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String


        @[JSON::Field(key: "criteria")]
        getter criteria : Types::Criteria?

        # The maximum number of automation rule preview summaries to return in a single response. Valid range
        # is 1-1000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination to retrieve the next set of results when the response is truncated.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The organizational scope for the rule preview.

        @[JSON::Field(key: "organizationScope")]
        getter organization_scope : Types::OrganizationScope?

        def initialize(
          @recommended_action_types : Array(String),
          @rule_type : String,
          @criteria : Types::Criteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @organization_scope : Types::OrganizationScope? = nil
        )
        end
      end


      struct ListAutomationRulePreviewSummariesResponse
        include JSON::Serializable

        # A token used for pagination. If present, indicates there are more results available and can be used
        # in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of automation rule preview summaries that match the specified criteria.

        @[JSON::Field(key: "previewResultSummaries")]
        getter preview_result_summaries : Array(Types::PreviewResultSummary)?

        def initialize(
          @next_token : String? = nil,
          @preview_result_summaries : Array(Types::PreviewResultSummary)? = nil
        )
        end
      end


      struct ListAutomationRulesRequest
        include JSON::Serializable

        # The filters to apply to the list of automation rules.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of automation rules to return in a single response. Valid range is 1-1000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination to retrieve the next set of results when the response is truncated.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAutomationRulesResponse
        include JSON::Serializable

        # The list of automation rules that match the specified criteria.

        @[JSON::Field(key: "automationRules")]
        getter automation_rules : Array(Types::AutomationRule)?

        # A token used for pagination. If present, indicates there are more results available and can be used
        # in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @automation_rules : Array(Types::AutomationRule)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendedActionSummariesRequest
        include JSON::Serializable

        # A list of filters to apply when retrieving recommended action summaries. Filters can be based on
        # resource type, action type, account ID, and other criteria.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::RecommendedActionFilter)?

        # The maximum number of recommended action summaries to return in a single response. Valid range is
        # 1-1000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination to retrieve the next set of results when the response is truncated.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::RecommendedActionFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendedActionSummariesResponse
        include JSON::Serializable

        # A token used for pagination. If present, indicates there are more results available and can be used
        # in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The summary of recommended actions that match the specified criteria.

        @[JSON::Field(key: "recommendedActionSummaries")]
        getter recommended_action_summaries : Array(Types::RecommendedActionSummary)?

        def initialize(
          @next_token : String? = nil,
          @recommended_action_summaries : Array(Types::RecommendedActionSummary)? = nil
        )
        end
      end


      struct ListRecommendedActionsRequest
        include JSON::Serializable

        # The filters to apply to the list of recommended actions.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::RecommendedActionFilter)?

        # The maximum number of recommended actions to return in a single response. Valid range is 1-1000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination to retrieve the next set of results when the response is truncated.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::RecommendedActionFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendedActionsResponse
        include JSON::Serializable

        # A token used for pagination. If present, indicates there are more results available and can be used
        # in subsequent requests.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of recommended actions that match the specified criteria.

        @[JSON::Field(key: "recommendedActions")]
        getter recommended_actions : Array(Types::RecommendedAction)?

        def initialize(
          @next_token : String? = nil,
          @recommended_actions : Array(Types::RecommendedAction)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource to list tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags associated with the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The operation can only be performed by a management account.

      struct NotManagementAccountException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The account must be opted in to Compute Optimizer Automation before performing this action.

      struct OptInRequiredException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration settings for organization-wide automation rules.

      struct OrganizationConfiguration
        include JSON::Serializable

        # List of specific Amazon Web Services account IDs where the organization rule should be applied.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # Specifies when organization rules should be applied relative to account rules.

        @[JSON::Field(key: "ruleApplyOrder")]
        getter rule_apply_order : String?

        def initialize(
          @account_ids : Array(String)? = nil,
          @rule_apply_order : String? = nil
        )
        end
      end

      # Defines the scope for organization-level rules when previewing matching actions.

      struct OrganizationScope
        include JSON::Serializable

        # List of Amazon Web Services account IDs to include in the organization scope.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil
        )
        end
      end

      # Contains the results of previewing an automation rule against available recommendations.

      struct PreviewResult
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the resource.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "currentResourceDetails")]
        getter current_resource_details : Types::ResourceDetails?

        # A summary of the resource's current configuration.

        @[JSON::Field(key: "currentResourceSummary")]
        getter current_resource_summary : String?


        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings?

        # The number of days of historical data used to analyze the resource.

        @[JSON::Field(key: "lookBackPeriodInDays")]
        getter look_back_period_in_days : Int32?

        # The ID of the recommended action being previewed.

        @[JSON::Field(key: "recommendedActionId")]
        getter recommended_action_id : String?

        # The type of recommended action being previewed.

        @[JSON::Field(key: "recommendedActionType")]
        getter recommended_action_type : String?


        @[JSON::Field(key: "recommendedResourceDetails")]
        getter recommended_resource_details : Types::ResourceDetails?

        # A summary of the resource's recommended configuration.

        @[JSON::Field(key: "recommendedResourceSummary")]
        getter recommended_resource_summary : String?

        # The Amazon Web Services Region where the resource is located.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Resource Name (ARN) of the resource affected by the recommended action.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The ID of the resource affected by the recommended action.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The tags associated with the resource.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::Tag)?

        # The type of resource being evaluated.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Indicates whether implementing the recommended action requires a resource restart.

        @[JSON::Field(key: "restartNeeded")]
        getter restart_needed : Bool?

        def initialize(
          @account_id : String? = nil,
          @current_resource_details : Types::ResourceDetails? = nil,
          @current_resource_summary : String? = nil,
          @estimated_monthly_savings : Types::EstimatedMonthlySavings? = nil,
          @look_back_period_in_days : Int32? = nil,
          @recommended_action_id : String? = nil,
          @recommended_action_type : String? = nil,
          @recommended_resource_details : Types::ResourceDetails? = nil,
          @recommended_resource_summary : String? = nil,
          @region : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_tags : Array(Types::Tag)? = nil,
          @resource_type : String? = nil,
          @restart_needed : Bool? = nil
        )
        end
      end

      # Contains a summary of preview results for an automation rule.

      struct PreviewResultSummary
        include JSON::Serializable

        # The key identifier for this preview result summary.

        @[JSON::Field(key: "key")]
        getter key : String


        @[JSON::Field(key: "total")]
        getter total : Types::RulePreviewTotal

        def initialize(
          @key : String,
          @total : Types::RulePreviewTotal
        )
        end
      end

      # Contains information about a recommended action that can be applied to optimize an Amazon Web
      # Services resource.

      struct RecommendedAction
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the resource.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?


        @[JSON::Field(key: "currentResourceDetails")]
        getter current_resource_details : Types::ResourceDetails?

        # A summary of the resource's current configuration.

        @[JSON::Field(key: "currentResourceSummary")]
        getter current_resource_summary : String?


        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings?

        # The number of days of historical data used to generate the recommendation.

        @[JSON::Field(key: "lookBackPeriodInDays")]
        getter look_back_period_in_days : Int32?

        # The unique identifier of the recommended action.

        @[JSON::Field(key: "recommendedActionId")]
        getter recommended_action_id : String?

        # The type of action being recommended.

        @[JSON::Field(key: "recommendedActionType")]
        getter recommended_action_type : String?


        @[JSON::Field(key: "recommendedResourceDetails")]
        getter recommended_resource_details : Types::ResourceDetails?

        # A summary of the resource's recommended configuration.

        @[JSON::Field(key: "recommendedResourceSummary")]
        getter recommended_resource_summary : String?

        # The Amazon Web Services Region where the resource is located.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The Amazon Resource Name (ARN) of the resource that the recommendation applies to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        # The ID of the resource that the recommendation applies to.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The tags associated with the resource.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::Tag)?

        # The type of resource being evaluated.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Indicates whether implementing the recommended action requires a resource restart.

        @[JSON::Field(key: "restartNeeded")]
        getter restart_needed : Bool?

        def initialize(
          @account_id : String? = nil,
          @current_resource_details : Types::ResourceDetails? = nil,
          @current_resource_summary : String? = nil,
          @estimated_monthly_savings : Types::EstimatedMonthlySavings? = nil,
          @look_back_period_in_days : Int32? = nil,
          @recommended_action_id : String? = nil,
          @recommended_action_type : String? = nil,
          @recommended_resource_details : Types::ResourceDetails? = nil,
          @recommended_resource_summary : String? = nil,
          @region : String? = nil,
          @resource_arn : String? = nil,
          @resource_id : String? = nil,
          @resource_tags : Array(Types::Tag)? = nil,
          @resource_type : String? = nil,
          @restart_needed : Bool? = nil
        )
        end
      end

      # A filter used to narrow down recommended action results based on specific criteria.

      struct RecommendedActionFilter
        include JSON::Serializable

        # The name of the filter field to apply.

        @[JSON::Field(key: "name")]
        getter name : String

        # List of filter values to match against the specified filter name. Used to narrow down recommended
        # actions based on specific criteria.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # Summary information about recommended actions, grouped by specific criteria with totals and counts.

      struct RecommendedActionSummary
        include JSON::Serializable

        # The grouping key used to categorize the recommended actions in this summary.

        @[JSON::Field(key: "key")]
        getter key : String

        # Aggregate totals for the recommended actions in this group, including count and estimated savings.

        @[JSON::Field(key: "total")]
        getter total : Types::RecommendedActionTotal

        def initialize(
          @key : String,
          @total : Types::RecommendedActionTotal
        )
        end
      end

      # Aggregate totals for a group of recommended actions, including count and estimated monthly savings.

      struct RecommendedActionTotal
        include JSON::Serializable


        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings

        # The total number of recommended actions in this group.

        @[JSON::Field(key: "recommendedActionCount")]
        getter recommended_action_count : Int32

        def initialize(
          @estimated_monthly_savings : Types::EstimatedMonthlySavings,
          @recommended_action_count : Int32
        )
        end
      end

      # Detailed configuration information for a specific Amazon Web Services resource, with type-specific
      # details.

      struct ResourceDetails
        include JSON::Serializable

        # Detailed configuration information specific to EBS volumes, including volume type, size, IOPS, and
        # throughput settings.

        @[JSON::Field(key: "ebsVolume")]
        getter ebs_volume : Types::EbsVolume?

        def initialize(
          @ebs_volume : Types::EbsVolume? = nil
        )
        end
      end

      # The specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Criteria condition for filtering resources based on their tags, including comparison operators and
      # values.

      struct ResourceTagsCriteriaCondition
        include JSON::Serializable

        # The comparison operator used to evaluate the tag criteria, such as equals, not equals, or contains.

        @[JSON::Field(key: "comparison")]
        getter comparison : String?

        # The tag key to use for comparison when filtering resources.

        @[JSON::Field(key: "key")]
        getter key : String?

        # List of tag values to compare against when filtering resources.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @comparison : String? = nil,
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct RollbackAutomationEventRequest
        include JSON::Serializable

        # The ID of the automation event to roll back.

        @[JSON::Field(key: "eventId")]
        getter event_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Must
        # be 1-64 characters long and contain only alphanumeric characters, underscores, and hyphens.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @event_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct RollbackAutomationEventResponse
        include JSON::Serializable

        # The ID of the automation event being rolled back.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The current status of the rollback operation.

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String?

        def initialize(
          @event_id : String? = nil,
          @event_status : String? = nil
        )
        end
      end

      # Aggregate totals for automation rule preview results, including count and estimated savings.

      struct RulePreviewTotal
        include JSON::Serializable


        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings

        # The total number of recommended actions matching the rule preview configuration.

        @[JSON::Field(key: "recommendedActionCount")]
        getter recommended_action_count : Int32

        def initialize(
          @estimated_monthly_savings : Types::EstimatedMonthlySavings,
          @recommended_action_count : Int32
        )
        end
      end

      # Configuration for scheduling when automation rules should execute, including timing and execution
      # windows.

      struct Schedule
        include JSON::Serializable

        # The time window in minutes during which the automation rule can start implementing recommended
        # actions.

        @[JSON::Field(key: "executionWindowInMinutes")]
        getter execution_window_in_minutes : Int32?

        # The expression that defines when the schedule runs. cron expression is supported. A cron expression
        # consists of six fields separated by white spaces: ( minutes hours day_of_month month day_of_week
        # year ) You can schedule rules to run at most once per day. Your cron expression must use specific
        # values (not wildcards) for the minutes and hours fields. For example: ( 30 12 * * * ) runs daily at
        # 12:30 PM UTC.

        @[JSON::Field(key: "scheduleExpression")]
        getter schedule_expression : String?

        # The timezone to use when interpreting the schedule expression.

        @[JSON::Field(key: "scheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        def initialize(
          @execution_window_in_minutes : Int32? = nil,
          @schedule_expression : String? = nil,
          @schedule_expression_timezone : String? = nil
        )
        end
      end

      # The request would exceed service quotas.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service is temporarily unavailable.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartAutomationEventRequest
        include JSON::Serializable

        # The ID of the recommended action to automate.

        @[JSON::Field(key: "recommendedActionId")]
        getter recommended_action_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Must
        # be 1-64 characters long and contain only alphanumeric characters, underscores, and hyphens.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @recommended_action_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct StartAutomationEventResponse
        include JSON::Serializable

        # The ID of the automation event.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The current status of the automation event.

        @[JSON::Field(key: "eventStatus")]
        getter event_status : String?

        # The ID of the recommended action being automated.

        @[JSON::Field(key: "recommendedActionId")]
        getter recommended_action_id : String?

        def initialize(
          @event_id : String? = nil,
          @event_status : String? = nil,
          @recommended_action_id : String? = nil
        )
        end
      end

      # Criteria condition for filtering based on string values, including comparison operators and target
      # values.

      struct StringCriteriaCondition
        include JSON::Serializable

        # The comparison operator used to evaluate the string criteria, such as equals, not equals, or
        # contains.

        @[JSON::Field(key: "comparison")]
        getter comparison : String?

        # List of string values to compare against when applying the criteria condition.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @comparison : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # A key-value pair used to categorize and group summary data for analysis and reporting.

      struct SummaryDimension
        include JSON::Serializable

        # The dimension key used for categorizing summary data.

        @[JSON::Field(key: "key")]
        getter key : String

        # The specific value for this dimension key used in the summary grouping.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Aggregate totals for automation events, including counts and estimated savings.

      struct SummaryTotals
        include JSON::Serializable

        # The total number of automation events in this summary group.

        @[JSON::Field(key: "automationEventCount")]
        getter automation_event_count : Int32?


        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Types::EstimatedMonthlySavings?

        def initialize(
          @automation_event_count : Int32? = nil,
          @estimated_monthly_savings : Types::EstimatedMonthlySavings? = nil
        )
        end
      end

      # A key-value pair used to categorize and organize Amazon Web Services resources and automation rules.

      struct Tag
        include JSON::Serializable

        # The tag key, which can be up to 128 characters long.

        @[JSON::Field(key: "key")]
        getter key : String

        # The tag value, which can be up to 256 characters long.

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

        # The ARN of the resource to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The revision number of the automation rule to tag. This ensures you're tagging the correct version
        # of the rule.

        @[JSON::Field(key: "ruleRevision")]
        getter rule_revision : Int64

        # The tags to add to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Must
        # be 1-64 characters long and contain only alphanumeric characters, underscores, and hyphens.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @resource_arn : String,
          @rule_revision : Int64,
          @tags : Array(Types::Tag),
          @client_token : String? = nil
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines a time range with inclusive start time and exclusive end time for filtering and analysis.

      struct TimePeriod
        include JSON::Serializable

        # The end time of the period, exclusive. Events before this time are included.

        @[JSON::Field(key: "endTimeExclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time_exclusive : Time?

        # The start time of the period, inclusive. Events at or after this time are included.

        @[JSON::Field(key: "startTimeInclusive", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time_inclusive : Time?

        def initialize(
          @end_time_exclusive : Time? = nil,
          @start_time_inclusive : Time? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to untag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The revision number of the automation rule to untag. This ensures you're untagging the correct
        # version of the rule.

        @[JSON::Field(key: "ruleRevision")]
        getter rule_revision : Int64

        # The keys of the tags to remove from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Must
        # be 1-64 characters long and contain only alphanumeric characters, underscores, and hyphens.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @resource_arn : String,
          @rule_revision : Int64,
          @tag_keys : Array(String),
          @client_token : String? = nil
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAutomationRuleRequest
        include JSON::Serializable

        # The ARN of the rule to update.

        @[JSON::Field(key: "ruleArn")]
        getter rule_arn : String

        # The revision number of the rule to update.

        @[JSON::Field(key: "ruleRevision")]
        getter rule_revision : Int64

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Must
        # be 1-64 characters long and contain only alphanumeric characters, underscores, and hyphens.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "criteria")]
        getter criteria : Types::Criteria?

        # The updated description of the automation rule. Can be up to 1024 characters long and contain
        # alphanumeric characters, underscores, hyphens, spaces, and certain special characters.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated name of the automation rule. Must be 1-128 characters long and contain only alphanumeric
        # characters, underscores, and hyphens.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Updated configuration settings for organization-wide rules, including rule application order and
        # target account IDs.

        @[JSON::Field(key: "organizationConfiguration")]
        getter organization_configuration : Types::OrganizationConfiguration?

        # The updated priority level of the automation rule, used to determine execution order when multiple
        # rules apply to the same resource.

        @[JSON::Field(key: "priority")]
        getter priority : String?

        # Updated list of recommended action types that this rule can execute, such as
        # SnapshotAndDeleteUnattachedEbsVolume or UpgradeEbsVolumeType.

        @[JSON::Field(key: "recommendedActionTypes")]
        getter recommended_action_types : Array(String)?

        # The updated type of automation rule. Can be either OrganizationRule for organization-wide rules or
        # AccountRule for account-specific rules.

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String?

        # The updated schedule configuration for when the automation rule should execute, including cron
        # expression, timezone, and execution window.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The updated status of the automation rule. Can be Active or Inactive.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @rule_arn : String,
          @rule_revision : Int64,
          @client_token : String? = nil,
          @criteria : Types::Criteria? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @organization_configuration : Types::OrganizationConfiguration? = nil,
          @priority : String? = nil,
          @recommended_action_types : Array(String)? = nil,
          @rule_type : String? = nil,
          @schedule : Types::Schedule? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateAutomationRuleResponse
        include JSON::Serializable

        # The timestamp when the automation rule was originally created.

        @[JSON::Field(key: "createdTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?


        @[JSON::Field(key: "criteria")]
        getter criteria : Types::Criteria?

        # The updated description of the automation rule.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp when the automation rule was last updated.

        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The updated name of the automation rule.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The updated organization configuration settings.

        @[JSON::Field(key: "organizationConfiguration")]
        getter organization_configuration : Types::OrganizationConfiguration?

        # The updated priority level of the automation rule.

        @[JSON::Field(key: "priority")]
        getter priority : String?

        # The updated list of recommended action types.

        @[JSON::Field(key: "recommendedActionTypes")]
        getter recommended_action_types : Array(String)?

        # The ARN of the updated rule.

        @[JSON::Field(key: "ruleArn")]
        getter rule_arn : String?

        # The new revision number of the updated rule.

        @[JSON::Field(key: "ruleRevision")]
        getter rule_revision : Int64?

        # The updated type of automation rule.

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String?

        # The updated schedule configuration.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The updated status of the automation rule.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @criteria : Types::Criteria? = nil,
          @description : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @name : String? = nil,
          @organization_configuration : Types::OrganizationConfiguration? = nil,
          @priority : String? = nil,
          @recommended_action_types : Array(String)? = nil,
          @rule_arn : String? = nil,
          @rule_revision : Int64? = nil,
          @rule_type : String? = nil,
          @schedule : Types::Schedule? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateEnrollmentConfigurationRequest
        include JSON::Serializable

        # The desired enrollment status. Active - Enables the Automation feature for your account. Inactive -
        # Disables the Automation feature for your account and stops all of your automation rules. If you opt
        # in again later, all rules will be inactive, and you must enable the rules you want to run. You must
        # wait at least 24 hours after opting out to opt in again. The Pending and Failed options cannot be
        # used to update the enrollment status of an account. They are returned in the response of a request
        # to update the enrollment status of an account. If you are a member account, your account must be
        # disassociated from your organization’s management account before you can disable Automation. Contact
        # your administrator to make this change.

        @[JSON::Field(key: "status")]
        getter status : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Must
        # be 1-64 characters long and contain only alphanumeric characters, underscores, and hyphens.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @status : String,
          @client_token : String? = nil
        )
        end
      end


      struct UpdateEnrollmentConfigurationResponse
        include JSON::Serializable

        # The timestamp when the enrollment configuration was last updated.

        @[JSON::Field(key: "lastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time

        # The updated enrollment status.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the updated enrollment status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @last_updated_timestamp : Time,
          @status : String,
          @status_reason : String? = nil
        )
        end
      end
    end
  end
end
