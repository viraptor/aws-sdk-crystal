require "json"

module Aws
  module CostExplorer
    module Types

      # Details about the analysis.

      struct AnalysisDetails
        include JSON::Serializable

        # Details about the Savings Plans purchase analysis.

        @[JSON::Field(key: "SavingsPlansPurchaseAnalysisDetails")]
        getter savings_plans_purchase_analysis_details : Types::SavingsPlansPurchaseAnalysisDetails?

        def initialize(
          @savings_plans_purchase_analysis_details : Types::SavingsPlansPurchaseAnalysisDetails? = nil
        )
        end
      end

      # The requested analysis can't be found.

      struct AnalysisNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A summary of the analysis.

      struct AnalysisSummary
        include JSON::Serializable

        # The completion time of the analysis.

        @[JSON::Field(key: "AnalysisCompletionTime")]
        getter analysis_completion_time : String?

        # The analysis ID that's associated with the commitment purchase analysis.

        @[JSON::Field(key: "AnalysisId")]
        getter analysis_id : String?

        # The start time of the analysis.

        @[JSON::Field(key: "AnalysisStartedTime")]
        getter analysis_started_time : String?

        # The status of the analysis.

        @[JSON::Field(key: "AnalysisStatus")]
        getter analysis_status : String?

        # The configuration for the commitment purchase analysis.

        @[JSON::Field(key: "CommitmentPurchaseAnalysisConfiguration")]
        getter commitment_purchase_analysis_configuration : Types::CommitmentPurchaseAnalysisConfiguration?

        # The error code used for the analysis.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The estimated time for when the analysis will complete.

        @[JSON::Field(key: "EstimatedCompletionTime")]
        getter estimated_completion_time : String?

        def initialize(
          @analysis_completion_time : String? = nil,
          @analysis_id : String? = nil,
          @analysis_started_time : String? = nil,
          @analysis_status : String? = nil,
          @commitment_purchase_analysis_configuration : Types::CommitmentPurchaseAnalysisConfiguration? = nil,
          @error_code : String? = nil,
          @estimated_completion_time : String? = nil
        )
        end
      end

      # An unusual cost pattern. This consists of the detailed metadata and the current status of the
      # anomaly object.

      struct Anomaly
        include JSON::Serializable

        # The unique identifier for the anomaly.

        @[JSON::Field(key: "AnomalyId")]
        getter anomaly_id : String

        # The latest and maximum score for the anomaly.

        @[JSON::Field(key: "AnomalyScore")]
        getter anomaly_score : Types::AnomalyScore

        # The dollar impact for the anomaly.

        @[JSON::Field(key: "Impact")]
        getter impact : Types::Impact

        # The Amazon Resource Name (ARN) for the cost monitor that generated this anomaly.

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        # The last day the anomaly is detected.

        @[JSON::Field(key: "AnomalyEndDate")]
        getter anomaly_end_date : String?

        # The first day the anomaly is detected.

        @[JSON::Field(key: "AnomalyStartDate")]
        getter anomaly_start_date : String?

        # The dimension for the anomaly (for example, an Amazon Web Services service in a service monitor).

        @[JSON::Field(key: "DimensionValue")]
        getter dimension_value : String?

        # The feedback value.

        @[JSON::Field(key: "Feedback")]
        getter feedback : String?

        # The list of identified root causes for the anomaly.

        @[JSON::Field(key: "RootCauses")]
        getter root_causes : Array(Types::RootCause)?

        def initialize(
          @anomaly_id : String,
          @anomaly_score : Types::AnomalyScore,
          @impact : Types::Impact,
          @monitor_arn : String,
          @anomaly_end_date : String? = nil,
          @anomaly_start_date : String? = nil,
          @dimension_value : String? = nil,
          @feedback : String? = nil,
          @root_causes : Array(Types::RootCause)? = nil
        )
        end
      end

      # The time period for an anomaly.

      struct AnomalyDateInterval
        include JSON::Serializable

        # The first date an anomaly was observed.

        @[JSON::Field(key: "StartDate")]
        getter start_date : String

        # The last date an anomaly was observed.

        @[JSON::Field(key: "EndDate")]
        getter end_date : String?

        def initialize(
          @start_date : String,
          @end_date : String? = nil
        )
        end
      end

      # This object continuously inspects your account's cost data for anomalies. It's based on MonitorType
      # and MonitorSpecification . The content consists of detailed metadata and the current status of the
      # monitor object.

      struct AnomalyMonitor
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The type of the monitor. Set this to DIMENSIONAL for an Amazon Web Services managed monitor. Amazon
        # Web Services managed monitors automatically track up to the top 5,000 values by cost within a
        # dimension of your choosing. Each dimension value is evaluated independently. If you start incurring
        # cost in a new value of your chosen dimension, it will automatically be analyzed by an Amazon Web
        # Services managed monitor. Set this to CUSTOM for a customer managed monitor. Customer managed
        # monitors let you select specific dimension values that get monitored in aggregate. For more
        # information about monitor types, see Monitor types in the Billing and Cost Management User Guide .

        @[JSON::Field(key: "MonitorType")]
        getter monitor_type : String

        # The date when the monitor was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : String?

        # The value for evaluated dimensions.

        @[JSON::Field(key: "DimensionalValueCount")]
        getter dimensional_value_count : Int32?

        # The date when the monitor last evaluated for anomalies.

        @[JSON::Field(key: "LastEvaluatedDate")]
        getter last_evaluated_date : String?

        # The date when the monitor was last updated.

        @[JSON::Field(key: "LastUpdatedDate")]
        getter last_updated_date : String?

        # The Amazon Resource Name (ARN) value.

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String?

        # For customer managed monitors, do not specify this field. For Amazon Web Services managed monitors,
        # this field controls which cost dimension is automatically analyzed by the monitor. For TAG and
        # COST_CATEGORY dimensions, you must also specify MonitorSpecification to configure the specific tag
        # or cost category key to analyze.

        @[JSON::Field(key: "MonitorDimension")]
        getter monitor_dimension : String?

        # An Expression object used to control what costs the monitor analyzes for anomalies. For Amazon Web
        # Services managed monitors: If MonitorDimension is SERVICE or LINKED_ACCOUNT , do not specify this
        # field If MonitorDimension is TAG , set this field to { "Tags": { "Key": "your tag key" } } If
        # MonitorDimension is COST_CATEGORY , set this field to { "CostCategories": { "Key": "your cost
        # category key" } } For customer managed monitors: To track linked accounts, set this field to {
        # "Dimensions": { "Key": "LINKED_ACCOUNT", "Values": [ "your list of up to 10 account IDs" ] } } To
        # track cost allocation tags, set this field to { "Tags": { "Key": "your tag key", "Values": [ "your
        # list of up to 10 tag values" ] } } To track cost categories, set this field to { "CostCategories": {
        # "Key": "your cost category key", "Values": [ "your cost category value" ] } }

        @[JSON::Field(key: "MonitorSpecification")]
        getter monitor_specification : Types::Expression?

        def initialize(
          @monitor_name : String,
          @monitor_type : String,
          @creation_date : String? = nil,
          @dimensional_value_count : Int32? = nil,
          @last_evaluated_date : String? = nil,
          @last_updated_date : String? = nil,
          @monitor_arn : String? = nil,
          @monitor_dimension : String? = nil,
          @monitor_specification : Types::Expression? = nil
        )
        end
      end

      # Quantifies the anomaly. The higher score means that it's more anomalous.

      struct AnomalyScore
        include JSON::Serializable

        # The last observed score.

        @[JSON::Field(key: "CurrentScore")]
        getter current_score : Float64

        # The maximum score that's observed during the AnomalyDateInterval .

        @[JSON::Field(key: "MaxScore")]
        getter max_score : Float64

        def initialize(
          @current_score : Float64,
          @max_score : Float64
        )
        end
      end

      # An AnomalySubscription resource (also referred to as an alert subscription) sends notifications
      # about specific anomalies that meet an alerting criteria defined by you. You can specify the
      # frequency of the alerts and the subscribers to notify. Anomaly subscriptions can be associated with
      # one or more AnomalyMonitor resources, and they only send notifications about anomalies detected by
      # those associated monitors. You can also configure a threshold to further control which anomalies are
      # included in the notifications. Anomalies that don’t exceed the chosen threshold and therefore don’t
      # trigger notifications from an anomaly subscription will still be available on the console and from
      # the GetAnomalies API.

      struct AnomalySubscription
        include JSON::Serializable

        # The frequency that anomaly notifications are sent. Notifications are sent either over email (for
        # DAILY and WEEKLY frequencies) or SNS (for IMMEDIATE frequency). For more information, see Creating
        # an Amazon SNS topic for anomaly notifications .

        @[JSON::Field(key: "Frequency")]
        getter frequency : String

        # A list of cost anomaly monitors.

        @[JSON::Field(key: "MonitorArnList")]
        getter monitor_arn_list : Array(String)

        # A list of subscribers to notify.

        @[JSON::Field(key: "Subscribers")]
        getter subscribers : Array(Types::Subscriber)

        # The name for the subscription.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String

        # Your unique account identifier.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The AnomalySubscription Amazon Resource Name (ARN).

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String?

        # (deprecated) An absolute dollar value that must be exceeded by the anomaly's total impact (see
        # Impact for more details) for an anomaly notification to be generated. This field has been
        # deprecated. To specify a threshold, use ThresholdExpression. Continued use of Threshold will be
        # treated as shorthand syntax for a ThresholdExpression. One of Threshold or ThresholdExpression is
        # required for this resource. You cannot specify both.

        @[JSON::Field(key: "Threshold")]
        getter threshold : Float64?

        # An Expression object used to specify the anomalies that you want to generate alerts for. This
        # supports dimensions and nested expressions. The supported dimensions are
        # ANOMALY_TOTAL_IMPACT_ABSOLUTE and ANOMALY_TOTAL_IMPACT_PERCENTAGE , corresponding to an anomaly’s
        # TotalImpact and TotalImpactPercentage, respectively (see Impact for more details). The supported
        # nested expression types are AND and OR . The match option GREATER_THAN_OR_EQUAL is required. Values
        # must be numbers between 0 and 10,000,000,000 in string format. One of Threshold or
        # ThresholdExpression is required for this resource. You cannot specify both. The following are
        # examples of valid ThresholdExpressions: Absolute threshold: { "Dimensions": { "Key":
        # "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] }
        # } Percentage threshold: { "Dimensions": { "Key": "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions":
        # [ "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } } AND two thresholds together: { "And": [ {
        # "Dimensions": { "Key": "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL" ],
        # "Values": [ "100" ] } }, { "Dimensions": { "Key": "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions":
        # [ "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } } ] } OR two thresholds together: { "Or": [ {
        # "Dimensions": { "Key": "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL" ],
        # "Values": [ "100" ] } }, { "Dimensions": { "Key": "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions":
        # [ "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } } ] }

        @[JSON::Field(key: "ThresholdExpression")]
        getter threshold_expression : Types::Expression?

        def initialize(
          @frequency : String,
          @monitor_arn_list : Array(String),
          @subscribers : Array(Types::Subscriber),
          @subscription_name : String,
          @account_id : String? = nil,
          @subscription_arn : String? = nil,
          @threshold : Float64? = nil,
          @threshold_expression : Types::Expression? = nil
        )
        end
      end

      # A request to backfill is already in progress. Once the previous request is complete, you can create
      # another request.

      struct BackfillLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested report expired. Update the date interval and try again.

      struct BillExpirationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The billing view status must be HEALTHY to perform this action. Try again when the status is HEALTHY
      # .

      struct BillingViewHealthStatusException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration for the commitment purchase analysis.

      struct CommitmentPurchaseAnalysisConfiguration
        include JSON::Serializable

        # The configuration for the Savings Plans purchase analysis.

        @[JSON::Field(key: "SavingsPlansPurchaseAnalysisConfiguration")]
        getter savings_plans_purchase_analysis_configuration : Types::SavingsPlansPurchaseAnalysisConfiguration?

        def initialize(
          @savings_plans_purchase_analysis_configuration : Types::SavingsPlansPurchaseAnalysisConfiguration? = nil
        )
        end
      end

      # Contains cost or usage metric values for comparing two time periods. Each value includes amounts for
      # the baseline and comparison time periods, their difference, and the unit of measurement.

      struct ComparisonMetricValue
        include JSON::Serializable

        # The numeric value for the baseline time period measurement.

        @[JSON::Field(key: "BaselineTimePeriodAmount")]
        getter baseline_time_period_amount : String?

        # The numeric value for the comparison time period measurement.

        @[JSON::Field(key: "ComparisonTimePeriodAmount")]
        getter comparison_time_period_amount : String?

        # The calculated difference between ComparisonTimePeriodAmount and BaselineTimePeriodAmount .

        @[JSON::Field(key: "Difference")]
        getter difference : String?

        # The unit of measurement applicable to all numeric values in this comparison.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @baseline_time_period_amount : String? = nil,
          @comparison_time_period_amount : String? = nil,
          @difference : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # The cost allocation tag structure. This includes detailed metadata for the CostAllocationTag object.

      struct CostAllocationTag
        include JSON::Serializable

        # The status of a cost allocation tag.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The key for the cost allocation tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        # The type of cost allocation tag. You can use AWSGenerated or UserDefined type tags. AWSGenerated
        # type tags are tags that Amazon Web Services defines and applies to support Amazon Web Services
        # resources for cost allocation purposes. UserDefined type tags are tags that you define, create, and
        # apply to resources.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The last date that the tag was either activated or deactivated.

        @[JSON::Field(key: "LastUpdatedDate")]
        getter last_updated_date : String?

        # The last month that the tag was used on an Amazon Web Services resource.

        @[JSON::Field(key: "LastUsedDate")]
        getter last_used_date : String?

        def initialize(
          @status : String,
          @tag_key : String,
          @type : String,
          @last_updated_date : String? = nil,
          @last_used_date : String? = nil
        )
        end
      end

      # The cost allocation tag backfill request structure that contains metadata and details of a certain
      # backfill.

      struct CostAllocationTagBackfillRequest
        include JSON::Serializable

        # The date the backfill starts from.

        @[JSON::Field(key: "BackfillFrom")]
        getter backfill_from : String?

        # The status of the cost allocation tag backfill request.

        @[JSON::Field(key: "BackfillStatus")]
        getter backfill_status : String?

        # The backfill completion time.

        @[JSON::Field(key: "CompletedAt")]
        getter completed_at : String?

        # The time when the backfill status was last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : String?

        # The time when the backfill was requested.

        @[JSON::Field(key: "RequestedAt")]
        getter requested_at : String?

        def initialize(
          @backfill_from : String? = nil,
          @backfill_status : String? = nil,
          @completed_at : String? = nil,
          @last_updated_at : String? = nil,
          @requested_at : String? = nil
        )
        end
      end

      # The cost allocation tag status. The status of a key can either be active or inactive.

      struct CostAllocationTagStatusEntry
        include JSON::Serializable

        # The status of a cost allocation tag.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The key for the cost allocation tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String

        def initialize(
          @status : String,
          @tag_key : String
        )
        end
      end

      # Represents a comparison of cost and usage metrics between two time periods.

      struct CostAndUsageComparison
        include JSON::Serializable


        @[JSON::Field(key: "CostAndUsageSelector")]
        getter cost_and_usage_selector : Types::Expression?

        # A mapping of metric names to their comparison values.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Types::ComparisonMetricValue)?

        def initialize(
          @cost_and_usage_selector : Types::Expression? = nil,
          @metrics : Hash(String, Types::ComparisonMetricValue)? = nil
        )
        end
      end

      # The structure of Cost Categories. This includes detailed metadata and the set of rules for the
      # CostCategory object.

      struct CostCategory
        include JSON::Serializable

        # The unique identifier for your cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String

        # The effective start date of your cost category.

        @[JSON::Field(key: "EffectiveStart")]
        getter effective_start : String


        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "RuleVersion")]
        getter rule_version : String

        # The rules are processed in order. If there are multiple rules that match the line item, then the
        # first rule to match is used to determine that cost category value.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::CostCategoryRule)


        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # The effective end date of your cost category.

        @[JSON::Field(key: "EffectiveEnd")]
        getter effective_end : String?

        # The list of processing statuses for Cost Management products for a specific cost category.

        @[JSON::Field(key: "ProcessingStatus")]
        getter processing_status : Array(Types::CostCategoryProcessingStatus)?

        # The split charge rules that are used to allocate your charges between your cost category values.

        @[JSON::Field(key: "SplitChargeRules")]
        getter split_charge_rules : Array(Types::CostCategorySplitChargeRule)?

        def initialize(
          @cost_category_arn : String,
          @effective_start : String,
          @name : String,
          @rule_version : String,
          @rules : Array(Types::CostCategoryRule),
          @default_value : String? = nil,
          @effective_end : String? = nil,
          @processing_status : Array(Types::CostCategoryProcessingStatus)? = nil,
          @split_charge_rules : Array(Types::CostCategorySplitChargeRule)? = nil
        )
        end
      end

      # When you create or update a cost category, you can define the CostCategoryRule rule type as
      # INHERITED_VALUE . This rule type adds the flexibility to define a rule that dynamically inherits the
      # cost category value from the dimension value that's defined by CostCategoryInheritedValueDimension .
      # For example, suppose that you want to dynamically group costs that are based on the value of a
      # specific tag key. First, choose an inherited value rule type, and then choose the tag dimension and
      # specify the tag key to use.

      struct CostCategoryInheritedValueDimension
        include JSON::Serializable

        # The key to extract cost category values.

        @[JSON::Field(key: "DimensionKey")]
        getter dimension_key : String?

        # The name of the dimension that's used to group costs. If you specify LINKED_ACCOUNT_NAME , the cost
        # category value is based on account name. If you specify TAG , the cost category value is based on
        # the value of the specified tag key.

        @[JSON::Field(key: "DimensionName")]
        getter dimension_name : String?

        def initialize(
          @dimension_key : String? = nil,
          @dimension_name : String? = nil
        )
        end
      end

      # The list of processing statuses for Cost Management products for a specific cost category.

      struct CostCategoryProcessingStatus
        include JSON::Serializable

        # The Cost Management product name of the applied status.

        @[JSON::Field(key: "Component")]
        getter component : String?

        # The process status for a specific cost category.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @component : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A reference to a cost category containing only enough information to identify the Cost Category. You
      # can use this information to retrieve the full cost category information using DescribeCostCategory .

      struct CostCategoryReference
        include JSON::Serializable

        # The unique identifier for your cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String?


        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # The cost category's effective end date.

        @[JSON::Field(key: "EffectiveEnd")]
        getter effective_end : String?

        # The cost category's effective start date.

        @[JSON::Field(key: "EffectiveStart")]
        getter effective_start : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        # The number of rules that are associated with a specific cost category.

        @[JSON::Field(key: "NumberOfRules")]
        getter number_of_rules : Int32?

        # The list of processing statuses for Cost Management products for a specific cost category.

        @[JSON::Field(key: "ProcessingStatus")]
        getter processing_status : Array(Types::CostCategoryProcessingStatus)?

        # The resource types supported by a specific cost category.

        @[JSON::Field(key: "SupportedResourceTypes")]
        getter supported_resource_types : Array(String)?

        # A list of unique cost category values in a specific cost category.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @cost_category_arn : String? = nil,
          @default_value : String? = nil,
          @effective_end : String? = nil,
          @effective_start : String? = nil,
          @name : String? = nil,
          @number_of_rules : Int32? = nil,
          @processing_status : Array(Types::CostCategoryProcessingStatus)? = nil,
          @supported_resource_types : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # A reference to a cost category association that contains information on an associated resource.

      struct CostCategoryResourceAssociation
        include JSON::Serializable

        # The unique identifier for your cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String?


        @[JSON::Field(key: "CostCategoryName")]
        getter cost_category_name : String?

        # The unique identifier for an associated resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @cost_category_arn : String? = nil,
          @cost_category_name : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Rules are processed in order. If there are multiple rules that match the line item, then the first
      # rule to match is used to determine that cost category value.

      struct CostCategoryRule
        include JSON::Serializable

        # The value the line item is categorized as if the line item contains the matched dimension.

        @[JSON::Field(key: "InheritedValue")]
        getter inherited_value : Types::CostCategoryInheritedValueDimension?

        # An Expression object used to categorize costs. This supports dimensions, tags, and nested
        # expressions. Currently the only dimensions supported are LINKED_ACCOUNT , SERVICE_CODE , RECORD_TYPE
        # , LINKED_ACCOUNT_NAME , REGION , and USAGE_TYPE . RECORD_TYPE is a dimension used for Cost Explorer
        # APIs, and is also supported for cost category expressions. This dimension uses different terms,
        # depending on whether you're using the console or API/JSON editor. For a detailed comparison, see
        # Term Comparisons in the Billing and Cost Management User Guide .

        @[JSON::Field(key: "Rule")]
        getter rule : Types::Expression?

        # You can define the CostCategoryRule rule type as either REGULAR or INHERITED_VALUE . The
        # INHERITED_VALUE rule type adds the flexibility to define a rule that dynamically inherits the cost
        # category value. This value is from the dimension value that's defined by
        # CostCategoryInheritedValueDimension . For example, suppose that you want to costs to be dynamically
        # grouped based on the value of a specific tag key. First, choose an inherited value rule type, and
        # then choose the tag dimension and specify the tag key to use.

        @[JSON::Field(key: "Type")]
        getter type : String?


        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @inherited_value : Types::CostCategoryInheritedValueDimension? = nil,
          @rule : Types::Expression? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Use the split charge rule to split the cost of one cost category value across several other target
      # values.

      struct CostCategorySplitChargeRule
        include JSON::Serializable

        # The method that's used to define how to split your source costs across your targets. Proportional -
        # Allocates charges across your targets based on the proportional weighted cost of each target. Fixed
        # - Allocates charges across your targets based on your defined allocation percentage. &gt; Even -
        # Allocates costs evenly across all targets.

        @[JSON::Field(key: "Method")]
        getter method : String

        # The cost category value that you want to split. That value can't be used as a source or a target in
        # other split charge rules. To indicate uncategorized costs, you can use an empty string as the
        # source.

        @[JSON::Field(key: "Source")]
        getter source : String

        # The cost category values that you want to split costs across. These values can't be used as a source
        # in other split charge rules.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(String)

        # The parameters for a split charge method. This is only required for the FIXED method.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::CostCategorySplitChargeRuleParameter)?

        def initialize(
          @method : String,
          @source : String,
          @targets : Array(String),
          @parameters : Array(Types::CostCategorySplitChargeRuleParameter)? = nil
        )
        end
      end

      # The parameters for a split charge method.

      struct CostCategorySplitChargeRuleParameter
        include JSON::Serializable

        # The parameter type.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The parameter values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @type : String,
          @values : Array(String)
        )
        end
      end

      # The Cost Categories values used for filtering the costs. If Values and Key are not specified, the
      # ABSENT MatchOption is applied to all Cost Categories. That is, it filters on resources that aren't
      # mapped to any Cost Categories. If Values is provided and Key isn't specified, the ABSENT MatchOption
      # is applied to the Cost Categories Key only. That is, it filters on resources without the given Cost
      # Categories key.

      struct CostCategoryValues
        include JSON::Serializable


        @[JSON::Field(key: "Key")]
        getter key : String?

        # The match options that you can use to filter your results. MatchOptions is only applicable for
        # actions related to cost category. The default values for MatchOptions is EQUALS and CASE_SENSITIVE .

        @[JSON::Field(key: "MatchOptions")]
        getter match_options : Array(String)?

        # The specific value of the cost category.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @match_options : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Represents a collection of cost drivers and their associated metrics for cost comparison analysis.

      struct CostComparisonDriver
        include JSON::Serializable

        # An array of cost drivers, each representing a cost difference between the baseline and comparison
        # time periods. Each entry also includes a metric delta (for example, usage change) that contributed
        # to the cost variance, along with the identifier and type of change.

        @[JSON::Field(key: "CostDrivers")]
        getter cost_drivers : Array(Types::CostDriver)?


        @[JSON::Field(key: "CostSelector")]
        getter cost_selector : Types::Expression?

        # A mapping of metric names to their comparison values.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Types::ComparisonMetricValue)?

        def initialize(
          @cost_drivers : Array(Types::CostDriver)? = nil,
          @cost_selector : Types::Expression? = nil,
          @metrics : Hash(String, Types::ComparisonMetricValue)? = nil
        )
        end
      end

      # Represents factors that contribute to cost variations between the baseline and comparison time
      # periods, including the type of driver, an identifier of the driver, and associated metrics.

      struct CostDriver
        include JSON::Serializable

        # A mapping of metric names to their comparison values, measuring the impact of this cost driver.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Types::ComparisonMetricValue)?

        # The specific identifier of the cost driver.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The category or classification of the cost driver. Values include: BUNDLED_DISCOUNT, CREDIT,
        # OUT_OF_CYCLE_CHARGE, REFUND, RECURRING_RESERVATION_FEE, RESERVATION_USAGE, RI_VOLUME_DISCOUNT,
        # SAVINGS_PLAN_USAGE, SAVINGS_PLAN_RECURRING_FEE, SUPPORT_FEE, TAX, UPFRONT_RESERVATION_FEE,
        # USAGE_CHANGE, COMMITMENT

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @metrics : Hash(String, Types::ComparisonMetricValue)? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The amount of instance usage that a reservation covered.

      struct Coverage
        include JSON::Serializable

        # The amount of cost that the reservation covered.

        @[JSON::Field(key: "CoverageCost")]
        getter coverage_cost : Types::CoverageCost?

        # The amount of instance usage that the reservation covered, in hours.

        @[JSON::Field(key: "CoverageHours")]
        getter coverage_hours : Types::CoverageHours?

        # The amount of instance usage that the reservation covered, in normalized units.

        @[JSON::Field(key: "CoverageNormalizedUnits")]
        getter coverage_normalized_units : Types::CoverageNormalizedUnits?

        def initialize(
          @coverage_cost : Types::CoverageCost? = nil,
          @coverage_hours : Types::CoverageHours? = nil,
          @coverage_normalized_units : Types::CoverageNormalizedUnits? = nil
        )
        end
      end

      # Reservation coverage for a specified period, in hours.

      struct CoverageByTime
        include JSON::Serializable

        # The groups of instances that the reservation covered.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::ReservationCoverageGroup)?

        # The period that this coverage was used over.

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval?

        # The total reservation coverage, in hours.

        @[JSON::Field(key: "Total")]
        getter total : Types::Coverage?

        def initialize(
          @groups : Array(Types::ReservationCoverageGroup)? = nil,
          @time_period : Types::DateInterval? = nil,
          @total : Types::Coverage? = nil
        )
        end
      end

      # How much it costs to run an instance.

      struct CoverageCost
        include JSON::Serializable

        # How much an On-Demand Instance costs.

        @[JSON::Field(key: "OnDemandCost")]
        getter on_demand_cost : String?

        def initialize(
          @on_demand_cost : String? = nil
        )
        end
      end

      # How long a running instance either used a reservation or was On-Demand.

      struct CoverageHours
        include JSON::Serializable

        # The percentage of instance hours that a reservation covered.

        @[JSON::Field(key: "CoverageHoursPercentage")]
        getter coverage_hours_percentage : String?

        # The number of instance running hours that On-Demand Instances covered.

        @[JSON::Field(key: "OnDemandHours")]
        getter on_demand_hours : String?

        # The number of instance running hours that reservations covered.

        @[JSON::Field(key: "ReservedHours")]
        getter reserved_hours : String?

        # The total instance usage, in hours.

        @[JSON::Field(key: "TotalRunningHours")]
        getter total_running_hours : String?

        def initialize(
          @coverage_hours_percentage : String? = nil,
          @on_demand_hours : String? = nil,
          @reserved_hours : String? = nil,
          @total_running_hours : String? = nil
        )
        end
      end

      # The amount of instance usage, in normalized units. You can use normalized units to see your EC2
      # usage for multiple sizes of instances in a uniform way. For example, suppose that you run an xlarge
      # instance and a 2xlarge instance. If you run both instances for the same amount of time, the 2xlarge
      # instance uses twice as much of your reservation as the xlarge instance, even though both instances
      # show only one instance-hour. When you use normalized units instead of instance-hours, the xlarge
      # instance used 8 normalized units, and the 2xlarge instance used 16 normalized units. For more
      # information, see Modifying Reserved Instances in the Amazon Elastic Compute Cloud User Guide for
      # Linux Instances .

      struct CoverageNormalizedUnits
        include JSON::Serializable

        # The percentage of your used instance normalized units that a reservation covers.

        @[JSON::Field(key: "CoverageNormalizedUnitsPercentage")]
        getter coverage_normalized_units_percentage : String?

        # The number of normalized units that are covered by On-Demand Instances instead of a reservation.

        @[JSON::Field(key: "OnDemandNormalizedUnits")]
        getter on_demand_normalized_units : String?

        # The number of normalized units that a reservation covers.

        @[JSON::Field(key: "ReservedNormalizedUnits")]
        getter reserved_normalized_units : String?

        # The total number of normalized units that you used.

        @[JSON::Field(key: "TotalRunningNormalizedUnits")]
        getter total_running_normalized_units : String?

        def initialize(
          @coverage_normalized_units_percentage : String? = nil,
          @on_demand_normalized_units : String? = nil,
          @reserved_normalized_units : String? = nil,
          @total_running_normalized_units : String? = nil
        )
        end
      end


      struct CreateAnomalyMonitorRequest
        include JSON::Serializable

        # The cost anomaly detection monitor object that you want to create.

        @[JSON::Field(key: "AnomalyMonitor")]
        getter anomaly_monitor : Types::AnomalyMonitor

        # An optional list of tags to associate with the specified AnomalyMonitor . You can use resource tags
        # to control access to your monitor using IAM policies. Each tag consists of a key and a value, and
        # each key must be unique for the resource. The following restrictions apply to resource tags:
        # Although the maximum number of array members is 200, you can assign a maximum of 50 user-tags to one
        # resource. The remaining are reserved for Amazon Web Services use The maximum length of a key is 128
        # characters The maximum length of a value is 256 characters Keys and values can only contain
        # alphanumeric characters, spaces, and any of the following: _.:/=+@- Keys and values are case
        # sensitive Keys and values are trimmed for any leading or trailing whitespaces Don’t use aws: as a
        # prefix for your keys. This prefix is reserved for Amazon Web Services use

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @anomaly_monitor : Types::AnomalyMonitor,
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end


      struct CreateAnomalyMonitorResponse
        include JSON::Serializable

        # The unique identifier of your newly created cost anomaly detection monitor.

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        def initialize(
          @monitor_arn : String
        )
        end
      end


      struct CreateAnomalySubscriptionRequest
        include JSON::Serializable

        # The cost anomaly subscription object that you want to create.

        @[JSON::Field(key: "AnomalySubscription")]
        getter anomaly_subscription : Types::AnomalySubscription

        # An optional list of tags to associate with the specified AnomalySubscription . You can use resource
        # tags to control access to your subscription using IAM policies. Each tag consists of a key and a
        # value, and each key must be unique for the resource. The following restrictions apply to resource
        # tags: Although the maximum number of array members is 200, you can assign a maximum of 50 user-tags
        # to one resource. The remaining are reserved for Amazon Web Services use The maximum length of a key
        # is 128 characters The maximum length of a value is 256 characters Keys and values can only contain
        # alphanumeric characters, spaces, and any of the following: _.:/=+@- Keys and values are case
        # sensitive Keys and values are trimmed for any leading or trailing whitespaces Don’t use aws: as a
        # prefix for your keys. This prefix is reserved for Amazon Web Services use

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @anomaly_subscription : Types::AnomalySubscription,
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end


      struct CreateAnomalySubscriptionResponse
        include JSON::Serializable

        # The unique identifier of your newly created cost anomaly subscription.

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String

        def initialize(
          @subscription_arn : String
        )
        end
      end


      struct CreateCostCategoryDefinitionRequest
        include JSON::Serializable


        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "RuleVersion")]
        getter rule_version : String

        # The cost category rules used to categorize costs. For more information, see CostCategoryRule .

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::CostCategoryRule)


        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # The cost category's effective start date. It can only be a billing start date (first day of the
        # month). If the date isn't provided, it's the first day of the current month. Dates can't be before
        # the previous twelve months, or in the future.

        @[JSON::Field(key: "EffectiveStart")]
        getter effective_start : String?

        # An optional list of tags to associate with the specified CostCategory . You can use resource tags to
        # control access to your cost category using IAM policies. Each tag consists of a key and a value, and
        # each key must be unique for the resource. The following restrictions apply to resource tags:
        # Although the maximum number of array members is 200, you can assign a maximum of 50 user-tags to one
        # resource. The remaining are reserved for Amazon Web Services use The maximum length of a key is 128
        # characters The maximum length of a value is 256 characters Keys and values can only contain
        # alphanumeric characters, spaces, and any of the following: _.:/=+@- Keys and values are case
        # sensitive Keys and values are trimmed for any leading or trailing whitespaces Don’t use aws: as a
        # prefix for your keys. This prefix is reserved for Amazon Web Services use

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # The split charge rules used to allocate your charges between your cost category values.

        @[JSON::Field(key: "SplitChargeRules")]
        getter split_charge_rules : Array(Types::CostCategorySplitChargeRule)?

        def initialize(
          @name : String,
          @rule_version : String,
          @rules : Array(Types::CostCategoryRule),
          @default_value : String? = nil,
          @effective_start : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @split_charge_rules : Array(Types::CostCategorySplitChargeRule)? = nil
        )
        end
      end


      struct CreateCostCategoryDefinitionResponse
        include JSON::Serializable

        # The unique identifier for your newly created cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String?

        # The cost category's effective start date. It can only be a billing start date (first day of the
        # month).

        @[JSON::Field(key: "EffectiveStart")]
        getter effective_start : String?

        def initialize(
          @cost_category_arn : String? = nil,
          @effective_start : String? = nil
        )
        end
      end

      # Context about the current instance.

      struct CurrentInstance
        include JSON::Serializable

        # The currency code that Amazon Web Services used to calculate the costs for this instance.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The name that you given an instance. This field shows as blank if you haven't given the instance a
        # name.

        @[JSON::Field(key: "InstanceName")]
        getter instance_name : String?

        # The current On-Demand cost of operating this instance on a monthly basis.

        @[JSON::Field(key: "MonthlyCost")]
        getter monthly_cost : String?

        # The number of hours during the lookback period that's billed at On-Demand rates.

        @[JSON::Field(key: "OnDemandHoursInLookbackPeriod")]
        getter on_demand_hours_in_lookback_period : String?

        # The number of hours during the lookback period that's covered by reservations.

        @[JSON::Field(key: "ReservationCoveredHoursInLookbackPeriod")]
        getter reservation_covered_hours_in_lookback_period : String?

        # Details about the resource and utilization.

        @[JSON::Field(key: "ResourceDetails")]
        getter resource_details : Types::ResourceDetails?

        # Resource ID of the current instance.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # Utilization information of the current instance during the lookback period.

        @[JSON::Field(key: "ResourceUtilization")]
        getter resource_utilization : Types::ResourceUtilization?

        # The number of hours during the lookback period that's covered by Savings Plans.

        @[JSON::Field(key: "SavingsPlansCoveredHoursInLookbackPeriod")]
        getter savings_plans_covered_hours_in_lookback_period : String?

        # Cost allocation resource tags that are applied to the instance.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::TagValues)?

        # The total number of hours that the instance ran during the lookback period.

        @[JSON::Field(key: "TotalRunningHoursInLookbackPeriod")]
        getter total_running_hours_in_lookback_period : String?

        def initialize(
          @currency_code : String? = nil,
          @instance_name : String? = nil,
          @monthly_cost : String? = nil,
          @on_demand_hours_in_lookback_period : String? = nil,
          @reservation_covered_hours_in_lookback_period : String? = nil,
          @resource_details : Types::ResourceDetails? = nil,
          @resource_id : String? = nil,
          @resource_utilization : Types::ResourceUtilization? = nil,
          @savings_plans_covered_hours_in_lookback_period : String? = nil,
          @tags : Array(Types::TagValues)? = nil,
          @total_running_hours_in_lookback_period : String? = nil
        )
        end
      end

      # The requested data is unavailable.

      struct DataUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The time period of the request.

      struct DateInterval
        include JSON::Serializable

        # The end of the time period. The end date is exclusive. For example, if end is 2017-05-01 , Amazon
        # Web Services retrieves cost and usage data from the start date up to, but not including, 2017-05-01
        # .

        @[JSON::Field(key: "End")]
        getter end : String

        # The beginning of the time period. The start date is inclusive. For example, if start is 2017-01-01 ,
        # Amazon Web Services retrieves cost and usage data starting at 2017-01-01 up to the end date. The
        # start date must be equal to or no later than the current date to avoid a validation error.

        @[JSON::Field(key: "Start")]
        getter start : String

        def initialize(
          @end : String,
          @start : String
        )
        end
      end


      struct DeleteAnomalyMonitorRequest
        include JSON::Serializable

        # The unique identifier of the cost anomaly monitor that you want to delete.

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        def initialize(
          @monitor_arn : String
        )
        end
      end


      struct DeleteAnomalyMonitorResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAnomalySubscriptionRequest
        include JSON::Serializable

        # The unique identifier of the cost anomaly subscription that you want to delete.

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String

        def initialize(
          @subscription_arn : String
        )
        end
      end


      struct DeleteAnomalySubscriptionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCostCategoryDefinitionRequest
        include JSON::Serializable

        # The unique identifier for your cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String

        def initialize(
          @cost_category_arn : String
        )
        end
      end


      struct DeleteCostCategoryDefinitionResponse
        include JSON::Serializable

        # The unique identifier for your cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String?

        # The effective end date of the cost category as a result of deleting it. No costs after this date is
        # categorized by the deleted cost category.

        @[JSON::Field(key: "EffectiveEnd")]
        getter effective_end : String?

        def initialize(
          @cost_category_arn : String? = nil,
          @effective_end : String? = nil
        )
        end
      end


      struct DescribeCostCategoryDefinitionRequest
        include JSON::Serializable

        # The unique identifier for your cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String

        # The date when the cost category was effective.

        @[JSON::Field(key: "EffectiveOn")]
        getter effective_on : String?

        def initialize(
          @cost_category_arn : String,
          @effective_on : String? = nil
        )
        end
      end


      struct DescribeCostCategoryDefinitionResponse
        include JSON::Serializable


        @[JSON::Field(key: "CostCategory")]
        getter cost_category : Types::CostCategory?

        def initialize(
          @cost_category : Types::CostCategory? = nil
        )
        end
      end

      # The metadata that you can use to filter and group your results. You can use GetDimensionValues to
      # find specific values.

      struct DimensionValues
        include JSON::Serializable

        # The names of the metadata types that you can use to filter and group your results. For example, AZ
        # returns a list of Availability Zones. Not all dimensions are supported in each API. Refer to the
        # documentation for each specific API to see what is supported. LINKED_ACCOUNT_NAME and SERVICE_CODE
        # can only be used in CostCategoryRule . ANOMALY_TOTAL_IMPACT_ABSOLUTE and
        # ANOMALY_TOTAL_IMPACT_PERCENTAGE can only be used in AnomalySubscriptions .

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The match options that you can use to filter your results. MatchOptions is only applicable for
        # actions related to cost category and Anomaly Subscriptions. Refer to the documentation for each
        # specific API to see what is supported. The default values for MatchOptions are EQUALS and
        # CASE_SENSITIVE .

        @[JSON::Field(key: "MatchOptions")]
        getter match_options : Array(String)?

        # The metadata values that you can use to filter and group your results. You can use
        # GetDimensionValues to find specific values.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @match_options : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The metadata of a specific type that you can use to filter and group your results. You can use
      # GetDimensionValues to find specific values.

      struct DimensionValuesWithAttributes
        include JSON::Serializable

        # The attribute that applies to a specific Dimension .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The value of a dimension with a specific attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @value : String? = nil
        )
        end
      end

      # The field that contains a list of disk (local storage) metrics that are associated with the current
      # instance.

      struct DiskResourceUtilization
        include JSON::Serializable

        # The maximum read throughput operations per second.

        @[JSON::Field(key: "DiskReadBytesPerSecond")]
        getter disk_read_bytes_per_second : String?

        # The maximum number of read operations per second.

        @[JSON::Field(key: "DiskReadOpsPerSecond")]
        getter disk_read_ops_per_second : String?

        # The maximum write throughput operations per second.

        @[JSON::Field(key: "DiskWriteBytesPerSecond")]
        getter disk_write_bytes_per_second : String?

        # The maximum number of write operations per second.

        @[JSON::Field(key: "DiskWriteOpsPerSecond")]
        getter disk_write_ops_per_second : String?

        def initialize(
          @disk_read_bytes_per_second : String? = nil,
          @disk_read_ops_per_second : String? = nil,
          @disk_write_bytes_per_second : String? = nil,
          @disk_write_ops_per_second : String? = nil
        )
        end
      end

      # The DynamoDB reservations that Amazon Web Services recommends that you purchase.

      struct DynamoDBCapacityDetails
        include JSON::Serializable

        # The capacity unit of the recommended reservation.

        @[JSON::Field(key: "CapacityUnits")]
        getter capacity_units : String?

        # The Amazon Web Services Region of the recommended reservation.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @capacity_units : String? = nil,
          @region : String? = nil
        )
        end
      end

      # The EBS field that contains a list of EBS metrics that are associated with the current instance.

      struct EBSResourceUtilization
        include JSON::Serializable

        # The maximum size of read operations per second

        @[JSON::Field(key: "EbsReadBytesPerSecond")]
        getter ebs_read_bytes_per_second : String?

        # The maximum number of read operations per second.

        @[JSON::Field(key: "EbsReadOpsPerSecond")]
        getter ebs_read_ops_per_second : String?

        # The maximum size of write operations per second.

        @[JSON::Field(key: "EbsWriteBytesPerSecond")]
        getter ebs_write_bytes_per_second : String?

        # The maximum number of write operations per second.

        @[JSON::Field(key: "EbsWriteOpsPerSecond")]
        getter ebs_write_ops_per_second : String?

        def initialize(
          @ebs_read_bytes_per_second : String? = nil,
          @ebs_read_ops_per_second : String? = nil,
          @ebs_write_bytes_per_second : String? = nil,
          @ebs_write_ops_per_second : String? = nil
        )
        end
      end

      # Details about the Amazon EC2 reservations that Amazon Web Services recommends that you purchase.

      struct EC2InstanceDetails
        include JSON::Serializable

        # The Availability Zone of the recommended reservation.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # Determines whether the recommendation is for a current-generation instance.

        @[JSON::Field(key: "CurrentGeneration")]
        getter current_generation : Bool?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "Family")]
        getter family : String?

        # The type of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The platform of the recommended reservation. The platform is the specific combination of operating
        # system, license model, and software on an instance.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The Amazon Web Services Region of the recommended reservation.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Determines whether the recommended reservation is size flexible.

        @[JSON::Field(key: "SizeFlexEligible")]
        getter size_flex_eligible : Bool?

        # Determines whether the recommended reservation is dedicated or shared.

        @[JSON::Field(key: "Tenancy")]
        getter tenancy : String?

        def initialize(
          @availability_zone : String? = nil,
          @current_generation : Bool? = nil,
          @family : String? = nil,
          @instance_type : String? = nil,
          @platform : String? = nil,
          @region : String? = nil,
          @size_flex_eligible : Bool? = nil,
          @tenancy : String? = nil
        )
        end
      end

      # Details on the Amazon EC2 Resource.

      struct EC2ResourceDetails
        include JSON::Serializable

        # The hourly public On-Demand rate for the instance type.

        @[JSON::Field(key: "HourlyOnDemandRate")]
        getter hourly_on_demand_rate : String?

        # The type of Amazon Web Services instance.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The memory capacity of the Amazon Web Services instance.

        @[JSON::Field(key: "Memory")]
        getter memory : String?

        # The network performance capacity of the Amazon Web Services instance.

        @[JSON::Field(key: "NetworkPerformance")]
        getter network_performance : String?

        # The platform of the Amazon Web Services instance. The platform is the specific combination of
        # operating system, license model, and software on an instance.

        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The Amazon Web Services Region of the instance.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The SKU of the product.

        @[JSON::Field(key: "Sku")]
        getter sku : String?

        # The disk storage of the Amazon Web Services instance. This doesn't include EBS storage.

        @[JSON::Field(key: "Storage")]
        getter storage : String?

        # The number of VCPU cores in the Amazon Web Services instance type.

        @[JSON::Field(key: "Vcpu")]
        getter vcpu : String?

        def initialize(
          @hourly_on_demand_rate : String? = nil,
          @instance_type : String? = nil,
          @memory : String? = nil,
          @network_performance : String? = nil,
          @platform : String? = nil,
          @region : String? = nil,
          @sku : String? = nil,
          @storage : String? = nil,
          @vcpu : String? = nil
        )
        end
      end

      # Utilization metrics for the instance.

      struct EC2ResourceUtilization
        include JSON::Serializable

        # The field that contains a list of disk (local storage) metrics that are associated with the current
        # instance.

        @[JSON::Field(key: "DiskResourceUtilization")]
        getter disk_resource_utilization : Types::DiskResourceUtilization?

        # The EBS field that contains a list of EBS metrics that are associated with the current instance.

        @[JSON::Field(key: "EBSResourceUtilization")]
        getter ebs_resource_utilization : Types::EBSResourceUtilization?

        # The maximum observed or expected CPU utilization of the instance.

        @[JSON::Field(key: "MaxCpuUtilizationPercentage")]
        getter max_cpu_utilization_percentage : String?

        # The maximum observed or expected memory utilization of the instance.

        @[JSON::Field(key: "MaxMemoryUtilizationPercentage")]
        getter max_memory_utilization_percentage : String?

        # The maximum observed or expected storage utilization of the instance. This doesn't include EBS
        # storage.

        @[JSON::Field(key: "MaxStorageUtilizationPercentage")]
        getter max_storage_utilization_percentage : String?

        # The network field that contains a list of network metrics that are associated with the current
        # instance.

        @[JSON::Field(key: "NetworkResourceUtilization")]
        getter network_resource_utilization : Types::NetworkResourceUtilization?

        def initialize(
          @disk_resource_utilization : Types::DiskResourceUtilization? = nil,
          @ebs_resource_utilization : Types::EBSResourceUtilization? = nil,
          @max_cpu_utilization_percentage : String? = nil,
          @max_memory_utilization_percentage : String? = nil,
          @max_storage_utilization_percentage : String? = nil,
          @network_resource_utilization : Types::NetworkResourceUtilization? = nil
        )
        end
      end

      # The Amazon EC2 hardware specifications that you want Amazon Web Services to provide recommendations
      # for.

      struct EC2Specification
        include JSON::Serializable

        # Indicates whether you want a recommendation for standard or convertible reservations.

        @[JSON::Field(key: "OfferingClass")]
        getter offering_class : String?

        def initialize(
          @offering_class : String? = nil
        )
        end
      end

      # Details about the Amazon OpenSearch Service reservations that Amazon Web Services recommends that
      # you purchase.

      struct ESInstanceDetails
        include JSON::Serializable

        # Determines whether the recommendation is for a current-generation instance.

        @[JSON::Field(key: "CurrentGeneration")]
        getter current_generation : Bool?

        # The class of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "InstanceClass")]
        getter instance_class : String?

        # The size of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "InstanceSize")]
        getter instance_size : String?

        # The Amazon Web Services Region of the recommended reservation.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Determines whether the recommended reservation is size flexible.

        @[JSON::Field(key: "SizeFlexEligible")]
        getter size_flex_eligible : Bool?

        def initialize(
          @current_generation : Bool? = nil,
          @instance_class : String? = nil,
          @instance_size : String? = nil,
          @region : String? = nil,
          @size_flex_eligible : Bool? = nil
        )
        end
      end

      # Details about the Amazon ElastiCache reservations that Amazon Web Services recommends that you
      # purchase.

      struct ElastiCacheInstanceDetails
        include JSON::Serializable

        # Determines whether the recommendation is for a current generation instance.

        @[JSON::Field(key: "CurrentGeneration")]
        getter current_generation : Bool?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "Family")]
        getter family : String?

        # The type of node that Amazon Web Services recommends.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The description of the recommended reservation.

        @[JSON::Field(key: "ProductDescription")]
        getter product_description : String?

        # The Amazon Web Services Region of the recommended reservation.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Determines whether the recommended reservation is size flexible.

        @[JSON::Field(key: "SizeFlexEligible")]
        getter size_flex_eligible : Bool?

        def initialize(
          @current_generation : Bool? = nil,
          @family : String? = nil,
          @node_type : String? = nil,
          @product_description : String? = nil,
          @region : String? = nil,
          @size_flex_eligible : Bool? = nil
        )
        end
      end

      # Use Expression to filter in various Cost Explorer APIs. Not all Expression types are supported in
      # each API. Refer to the documentation for each specific API to see what is supported. There are two
      # patterns: Simple dimension values. There are three types of simple dimension values: CostCategories
      # , Tags , and Dimensions . Specify the CostCategories field to define a filter that acts on Cost
      # Categories. Specify the Tags field to define a filter that acts on Cost Allocation Tags. Specify the
      # Dimensions field to define a filter that acts on the DimensionValues . For each filter type, you can
      # set the dimension name and values for the filters that you plan to use. For example, you can filter
      # for REGION==us-east-1 OR REGION==us-west-1 . For GetRightsizingRecommendation , the Region is a full
      # name (for example, REGION==US East (N. Virginia) . The corresponding Expression for this example is
      # as follows: { "Dimensions": { "Key": "REGION", "Values": [ "us-east-1", "us-west-1" ] } } As shown
      # in the previous example, lists of dimension values are combined with OR when applying the filter.
      # You can also set different match options to further control how the filter behaves. Not all APIs
      # support match options. Refer to the documentation for each specific API to see what is supported.
      # For example, you can filter for linked account names that start with "a". The corresponding
      # Expression for this example is as follows: { "Dimensions": { "Key": "LINKED_ACCOUNT_NAME",
      # "MatchOptions": [ "STARTS_WITH" ], "Values": [ "a" ] } } Compound Expression types with logical
      # operations. You can use multiple Expression types and the logical operators AND/OR/NOT to create a
      # list of one or more Expression objects. By doing this, you can filter by more advanced options. For
      # example, you can filter by ((REGION == us-east-1 OR REGION == us-west-1) OR (TAG.Type == Type1)) AND
      # (USAGE_TYPE != DataTransfer) . The corresponding Expression for this example is as follows: { "And":
      # [ {"Or": [ {"Dimensions": { "Key": "REGION", "Values": [ "us-east-1", "us-west-1" ] }}, {"Tags": {
      # "Key": "TagName", "Values": ["Value1"] } } ]}, {"Not": {"Dimensions": { "Key": "USAGE_TYPE",
      # "Values": ["DataTransfer"] }}} ] } Because each Expression can have only one operator, the service
      # returns an error if more than one is specified. The following example shows an Expression object
      # that creates an error: { "And": [ ... ], "Dimensions": { "Key": "USAGE_TYPE", "Values": [
      # "DataTransfer" ] } } The following is an example of the corresponding error message: "Expression has
      # more than one roots. Only one root operator is allowed for each expression: And, Or, Not,
      # Dimensions, Tags, CostCategories" For the GetRightsizingRecommendation action, a combination of OR
      # and NOT isn't supported. OR isn't supported between different dimensions, or dimensions and tags.
      # NOT operators aren't supported. Dimensions are also limited to LINKED_ACCOUNT , REGION , or
      # RIGHTSIZING_TYPE . For the GetReservationPurchaseRecommendation action, only NOT is supported. AND
      # and OR aren't supported. Dimensions are limited to LINKED_ACCOUNT .

      struct Expression
        include JSON::Serializable

        # Return results that match both Dimension objects.

        @[JSON::Field(key: "And")]
        getter and : Array(Types::Expression)?

        # The filter that's based on CostCategory values.

        @[JSON::Field(key: "CostCategories")]
        getter cost_categories : Types::CostCategoryValues?

        # The specific Dimension to use for Expression .

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Types::DimensionValues?

        # Return results that don't match a Dimension object.

        @[JSON::Field(key: "Not")]
        getter not : Types::Expression?

        # Return results that match either Dimension object.

        @[JSON::Field(key: "Or")]
        getter or : Array(Types::Expression)?

        # The specific Tag to use for Expression .

        @[JSON::Field(key: "Tags")]
        getter tags : Types::TagValues?

        def initialize(
          @and : Array(Types::Expression)? = nil,
          @cost_categories : Types::CostCategoryValues? = nil,
          @dimensions : Types::DimensionValues? = nil,
          @not : Types::Expression? = nil,
          @or : Array(Types::Expression)? = nil,
          @tags : Types::TagValues? = nil
        )
        end
      end

      # The forecast that's created for your query.

      struct ForecastResult
        include JSON::Serializable

        # The mean value of the forecast.

        @[JSON::Field(key: "MeanValue")]
        getter mean_value : String?

        # The lower limit for the prediction interval.

        @[JSON::Field(key: "PredictionIntervalLowerBound")]
        getter prediction_interval_lower_bound : String?

        # The upper limit for the prediction interval.

        @[JSON::Field(key: "PredictionIntervalUpperBound")]
        getter prediction_interval_upper_bound : String?

        # The period of time that the forecast covers.

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval?

        def initialize(
          @mean_value : String? = nil,
          @prediction_interval_lower_bound : String? = nil,
          @prediction_interval_upper_bound : String? = nil,
          @time_period : Types::DateInterval? = nil
        )
        end
      end

      # A request to generate a recommendation or analysis is already in progress.

      struct GenerationExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The summary of the Savings Plans recommendation generation.

      struct GenerationSummary
        include JSON::Serializable

        # Indicates the estimated time for when the recommendation generation will complete.

        @[JSON::Field(key: "EstimatedCompletionTime")]
        getter estimated_completion_time : String?

        # Indicates the completion time of the recommendation generation.

        @[JSON::Field(key: "GenerationCompletionTime")]
        getter generation_completion_time : String?

        # Indicates the start time of the recommendation generation.

        @[JSON::Field(key: "GenerationStartedTime")]
        getter generation_started_time : String?

        # Indicates whether the recommendation generation succeeded, is processing, or failed.

        @[JSON::Field(key: "GenerationStatus")]
        getter generation_status : String?

        # Indicates the ID for this specific recommendation.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String?

        def initialize(
          @estimated_completion_time : String? = nil,
          @generation_completion_time : String? = nil,
          @generation_started_time : String? = nil,
          @generation_status : String? = nil,
          @recommendation_id : String? = nil
        )
        end
      end


      struct GetAnomaliesRequest
        include JSON::Serializable

        # Assigns the start and end dates for retrieving cost anomalies. The returned anomaly object will have
        # an AnomalyEndDate in the specified time range.

        @[JSON::Field(key: "DateInterval")]
        getter date_interval : Types::AnomalyDateInterval

        # Filters anomaly results by the feedback field on the anomaly object.

        @[JSON::Field(key: "Feedback")]
        getter feedback : String?

        # The number of entries a paginated response contains.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Retrieves all of the cost anomalies detected for a specific cost anomaly monitor Amazon Resource
        # Name (ARN).

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Filters anomaly results by the total impact field on the anomaly object. For example, you can filter
        # anomalies GREATER_THAN 200.00 to retrieve anomalies, with an estimated dollar impact greater than
        # 200.

        @[JSON::Field(key: "TotalImpact")]
        getter total_impact : Types::TotalImpactFilter?

        def initialize(
          @date_interval : Types::AnomalyDateInterval,
          @feedback : String? = nil,
          @max_results : Int32? = nil,
          @monitor_arn : String? = nil,
          @next_page_token : String? = nil,
          @total_impact : Types::TotalImpactFilter? = nil
        )
        end
      end


      struct GetAnomaliesResponse
        include JSON::Serializable

        # A list of cost anomalies.

        @[JSON::Field(key: "Anomalies")]
        getter anomalies : Array(Types::Anomaly)

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @anomalies : Array(Types::Anomaly),
          @next_page_token : String? = nil
        )
        end
      end


      struct GetAnomalyMonitorsRequest
        include JSON::Serializable

        # The number of entries that a paginated response contains.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A list of cost anomaly monitor ARNs.

        @[JSON::Field(key: "MonitorArnList")]
        getter monitor_arn_list : Array(String)?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @monitor_arn_list : Array(String)? = nil,
          @next_page_token : String? = nil
        )
        end
      end


      struct GetAnomalyMonitorsResponse
        include JSON::Serializable

        # A list of cost anomaly monitors that includes the detailed metadata for each monitor.

        @[JSON::Field(key: "AnomalyMonitors")]
        getter anomaly_monitors : Array(Types::AnomalyMonitor)

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @anomaly_monitors : Array(Types::AnomalyMonitor),
          @next_page_token : String? = nil
        )
        end
      end


      struct GetAnomalySubscriptionsRequest
        include JSON::Serializable

        # The number of entries a paginated response contains.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Cost anomaly monitor ARNs.

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # A list of cost anomaly subscription ARNs.

        @[JSON::Field(key: "SubscriptionArnList")]
        getter subscription_arn_list : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @monitor_arn : String? = nil,
          @next_page_token : String? = nil,
          @subscription_arn_list : Array(String)? = nil
        )
        end
      end


      struct GetAnomalySubscriptionsResponse
        include JSON::Serializable

        # A list of cost anomaly subscriptions that includes the detailed metadata for each one.

        @[JSON::Field(key: "AnomalySubscriptions")]
        getter anomaly_subscriptions : Array(Types::AnomalySubscription)

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @anomaly_subscriptions : Array(Types::AnomalySubscription),
          @next_page_token : String? = nil
        )
        end
      end


      struct GetApproximateUsageRecordsRequest
        include JSON::Serializable

        # The service to evaluate for the usage records. You can choose resource-level data at daily
        # granularity, or hourly granularity with or without resource-level data.

        @[JSON::Field(key: "ApproximationDimension")]
        getter approximation_dimension : String

        # How granular you want the data to be. You can enable data at hourly or daily granularity.

        @[JSON::Field(key: "Granularity")]
        getter granularity : String

        # The service metadata for the service or services you want to query. If not specified, all elements
        # are returned.

        @[JSON::Field(key: "Services")]
        getter services : Array(String)?

        def initialize(
          @approximation_dimension : String,
          @granularity : String,
          @services : Array(String)? = nil
        )
        end
      end


      struct GetApproximateUsageRecordsResponse
        include JSON::Serializable

        # The lookback period that's used for the estimation.

        @[JSON::Field(key: "LookbackPeriod")]
        getter lookback_period : Types::DateInterval?

        # The service metadata for the service or services in the response.

        @[JSON::Field(key: "Services")]
        getter services : Hash(String, Int64)?

        # The total number of usage records for all services in the services list.

        @[JSON::Field(key: "TotalRecords")]
        getter total_records : Int64?

        def initialize(
          @lookback_period : Types::DateInterval? = nil,
          @services : Hash(String, Int64)? = nil,
          @total_records : Int64? = nil
        )
        end
      end


      struct GetCommitmentPurchaseAnalysisRequest
        include JSON::Serializable

        # The analysis ID that's associated with the commitment purchase analysis.

        @[JSON::Field(key: "AnalysisId")]
        getter analysis_id : String

        def initialize(
          @analysis_id : String
        )
        end
      end


      struct GetCommitmentPurchaseAnalysisResponse
        include JSON::Serializable

        # The analysis ID that's associated with the commitment purchase analysis.

        @[JSON::Field(key: "AnalysisId")]
        getter analysis_id : String

        # The start time of the analysis.

        @[JSON::Field(key: "AnalysisStartedTime")]
        getter analysis_started_time : String

        # The status of the analysis.

        @[JSON::Field(key: "AnalysisStatus")]
        getter analysis_status : String

        # The configuration for the commitment purchase analysis.

        @[JSON::Field(key: "CommitmentPurchaseAnalysisConfiguration")]
        getter commitment_purchase_analysis_configuration : Types::CommitmentPurchaseAnalysisConfiguration

        # The estimated time for when the analysis will complete.

        @[JSON::Field(key: "EstimatedCompletionTime")]
        getter estimated_completion_time : String

        # The completion time of the analysis.

        @[JSON::Field(key: "AnalysisCompletionTime")]
        getter analysis_completion_time : String?

        # Details about the analysis.

        @[JSON::Field(key: "AnalysisDetails")]
        getter analysis_details : Types::AnalysisDetails?

        # The error code used for the analysis.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        def initialize(
          @analysis_id : String,
          @analysis_started_time : String,
          @analysis_status : String,
          @commitment_purchase_analysis_configuration : Types::CommitmentPurchaseAnalysisConfiguration,
          @estimated_completion_time : String,
          @analysis_completion_time : String? = nil,
          @analysis_details : Types::AnalysisDetails? = nil,
          @error_code : String? = nil
        )
        end
      end


      struct GetCostAndUsageComparisonsRequest
        include JSON::Serializable

        # The reference time period for comparison. This time period serves as the baseline against which
        # other cost and usage data will be compared. The interval must start and end on the first day of a
        # month, with a duration of exactly one month.

        @[JSON::Field(key: "BaselineTimePeriod")]
        getter baseline_time_period : Types::DateInterval

        # The comparison time period for analysis. This time period's cost and usage data will be compared
        # against the baseline time period. The interval must start and end on the first day of a month, with
        # a duration of exactly one month.

        @[JSON::Field(key: "ComparisonTimePeriod")]
        getter comparison_time_period : Types::DateInterval

        # The cost and usage metric to compare. Valid values are AmortizedCost , BlendedCost ,
        # NetAmortizedCost , NetUnblendedCost , NormalizedUsageAmount , UnblendedCost , and UsageQuantity .

        @[JSON::Field(key: "MetricForComparison")]
        getter metric_for_comparison : String

        # The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN is used to
        # specify which particular billing view you want to interact with or retrieve information from when
        # making API calls related to Amazon Web Services Billing and Cost Management features. The
        # BillingViewArn can be retrieved by calling the ListBillingViews API.

        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?


        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # You can group results using the attributes DIMENSION , TAG , and COST_CATEGORY .

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        # The maximum number of results that are returned for the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of paginated results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @baseline_time_period : Types::DateInterval,
          @comparison_time_period : Types::DateInterval,
          @metric_for_comparison : String,
          @billing_view_arn : String? = nil,
          @filter : Types::Expression? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil,
          @max_results : Int32? = nil,
          @next_page_token : String? = nil
        )
        end
      end


      struct GetCostAndUsageComparisonsResponse
        include JSON::Serializable

        # An array of comparison results showing cost and usage metrics between BaselineTimePeriod and
        # ComparisonTimePeriod .

        @[JSON::Field(key: "CostAndUsageComparisons")]
        getter cost_and_usage_comparisons : Array(Types::CostAndUsageComparison)?

        # The token to retrieve the next set of paginated results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # A summary of the total cost and usage, comparing amounts between BaselineTimePeriod and
        # ComparisonTimePeriod and their differences. This total represents the aggregate total across all
        # paginated results, if the response spans multiple pages.

        @[JSON::Field(key: "TotalCostAndUsage")]
        getter total_cost_and_usage : Hash(String, Types::ComparisonMetricValue)?

        def initialize(
          @cost_and_usage_comparisons : Array(Types::CostAndUsageComparison)? = nil,
          @next_page_token : String? = nil,
          @total_cost_and_usage : Hash(String, Types::ComparisonMetricValue)? = nil
        )
        end
      end


      struct GetCostAndUsageRequest
        include JSON::Serializable

        # Sets the Amazon Web Services cost granularity to MONTHLY or DAILY , or HOURLY . If Granularity isn't
        # set, the response object doesn't include the Granularity , either MONTHLY or DAILY , or HOURLY .

        @[JSON::Field(key: "Granularity")]
        getter granularity : String

        # Which metrics are returned in the query. For more information about blended and unblended rates, see
        # Why does the "blended" annotation appear on some line items in my bill? . Valid values are
        # AmortizedCost , BlendedCost , NetAmortizedCost , NetUnblendedCost , NormalizedUsageAmount ,
        # UnblendedCost , and UsageQuantity . If you return the UsageQuantity metric, the service aggregates
        # all usage numbers without taking into account the units. For example, if you aggregate usageQuantity
        # across all of Amazon EC2, the results aren't meaningful because Amazon EC2 compute hours and data
        # transfer are measured in different units (for example, hours and GB). To get more meaningful
        # UsageQuantity metrics, filter by UsageType or UsageTypeGroups . Metrics is required for
        # GetCostAndUsage requests.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(String)

        # Sets the start date and end date for retrieving Amazon Web Services costs. The start date is
        # inclusive, but the end date is exclusive. For example, if start is 2017-01-01 and end is 2017-05-01
        # , then the cost and usage data is retrieved from 2017-01-01 up to and including 2017-04-30 but not
        # including 2017-05-01 .

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN is used to
        # specify which particular billing view you want to interact with or retrieve information from when
        # making API calls related to Amazon Web Services Billing and Cost Management features. The
        # BillingViewArn can be retrieved by calling the ListBillingViews API.

        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?

        # Filters Amazon Web Services costs by different dimensions. For example, you can specify SERVICE and
        # LINKED_ACCOUNT and get the costs that are associated with that account's usage of that service. You
        # can nest Expression objects to define any combination of dimension filters. For more information,
        # see Expression . Valid values for MatchOptions for Dimensions are EQUALS and CASE_SENSITIVE . Valid
        # values for MatchOptions for CostCategories and Tags are EQUALS , ABSENT , and CASE_SENSITIVE .
        # Default values are EQUALS and CASE_SENSITIVE .

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # You can group Amazon Web Services costs using up to two different groups, either dimensions, tag
        # keys, cost categories, or any two group by types. Valid values for the DIMENSION type are AZ ,
        # INSTANCE_TYPE , LEGAL_ENTITY_NAME , INVOICING_ENTITY , LINKED_ACCOUNT , OPERATION , PLATFORM ,
        # PURCHASE_TYPE , SERVICE , TENANCY , RECORD_TYPE , and USAGE_TYPE . When you group by the TAG type
        # and include a valid tag key, you get all tag values, including empty strings.

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @granularity : String,
          @metrics : Array(String),
          @time_period : Types::DateInterval,
          @billing_view_arn : String? = nil,
          @filter : Types::Expression? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil,
          @next_page_token : String? = nil
        )
        end
      end


      struct GetCostAndUsageResponse
        include JSON::Serializable

        # The attributes that apply to a specific dimension value. For example, if the value is a linked
        # account, the attribute is that account name.

        @[JSON::Field(key: "DimensionValueAttributes")]
        getter dimension_value_attributes : Array(Types::DimensionValuesWithAttributes)?

        # The groups that are specified by the Filter or GroupBy parameters in the request.

        @[JSON::Field(key: "GroupDefinitions")]
        getter group_definitions : Array(Types::GroupDefinition)?

        # The token for the next set of retrievable results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The time period that's covered by the results in the response.

        @[JSON::Field(key: "ResultsByTime")]
        getter results_by_time : Array(Types::ResultByTime)?

        def initialize(
          @dimension_value_attributes : Array(Types::DimensionValuesWithAttributes)? = nil,
          @group_definitions : Array(Types::GroupDefinition)? = nil,
          @next_page_token : String? = nil,
          @results_by_time : Array(Types::ResultByTime)? = nil
        )
        end
      end


      struct GetCostAndUsageWithResourcesRequest
        include JSON::Serializable

        # Filters Amazon Web Services costs by different dimensions. For example, you can specify SERVICE and
        # LINKED_ACCOUNT and get the costs that are associated with that account's usage of that service. You
        # can nest Expression objects to define any combination of dimension filters. For more information,
        # see Expression . The GetCostAndUsageWithResources operation requires that you either group by or
        # filter by a ResourceId . It requires the Expression "SERVICE = Amazon Elastic Compute Cloud -
        # Compute" in the filter. Valid values for MatchOptions for Dimensions are EQUALS and CASE_SENSITIVE .
        # Valid values for MatchOptions for CostCategories and Tags are EQUALS , ABSENT , and CASE_SENSITIVE .
        # Default values are EQUALS and CASE_SENSITIVE .

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression

        # Sets the Amazon Web Services cost granularity to MONTHLY , DAILY , or HOURLY . If Granularity isn't
        # set, the response object doesn't include the Granularity , MONTHLY , DAILY , or HOURLY .

        @[JSON::Field(key: "Granularity")]
        getter granularity : String

        # Sets the start and end dates for retrieving Amazon Web Services costs. The range must be within the
        # last 14 days (the start date cannot be earlier than 14 days ago). The start date is inclusive, but
        # the end date is exclusive. For example, if start is 2017-01-01 and end is 2017-05-01 , then the cost
        # and usage data is retrieved from 2017-01-01 up to and including 2017-04-30 but not including
        # 2017-05-01 .

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN is used to
        # specify which particular billing view you want to interact with or retrieve information from when
        # making API calls related to Amazon Web Services Billing and Cost Management features. The
        # BillingViewArn can be retrieved by calling the ListBillingViews API.

        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?

        # You can group Amazon Web Services costs using up to two different groups: DIMENSION , TAG ,
        # COST_CATEGORY .

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        # Which metrics are returned in the query. For more information about blended and unblended rates, see
        # Why does the "blended" annotation appear on some line items in my bill? . Valid values are
        # AmortizedCost , BlendedCost , NetAmortizedCost , NetUnblendedCost , NormalizedUsageAmount ,
        # UnblendedCost , and UsageQuantity . If you return the UsageQuantity metric, the service aggregates
        # all usage numbers without taking the units into account. For example, if you aggregate usageQuantity
        # across all of Amazon EC2, the results aren't meaningful because Amazon EC2 compute hours and data
        # transfer are measured in different units (for example, hour or GB). To get more meaningful
        # UsageQuantity metrics, filter by UsageType or UsageTypeGroups . Metrics is required for
        # GetCostAndUsageWithResources requests.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(String)?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @filter : Types::Expression,
          @granularity : String,
          @time_period : Types::DateInterval,
          @billing_view_arn : String? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil,
          @metrics : Array(String)? = nil,
          @next_page_token : String? = nil
        )
        end
      end


      struct GetCostAndUsageWithResourcesResponse
        include JSON::Serializable

        # The attributes that apply to a specific dimension value. For example, if the value is a linked
        # account, the attribute is that account name.

        @[JSON::Field(key: "DimensionValueAttributes")]
        getter dimension_value_attributes : Array(Types::DimensionValuesWithAttributes)?

        # The groups that are specified by the Filter or GroupBy parameters in the request.

        @[JSON::Field(key: "GroupDefinitions")]
        getter group_definitions : Array(Types::GroupDefinition)?

        # The token for the next set of retrievable results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The time period that's covered by the results in the response.

        @[JSON::Field(key: "ResultsByTime")]
        getter results_by_time : Array(Types::ResultByTime)?

        def initialize(
          @dimension_value_attributes : Array(Types::DimensionValuesWithAttributes)? = nil,
          @group_definitions : Array(Types::GroupDefinition)? = nil,
          @next_page_token : String? = nil,
          @results_by_time : Array(Types::ResultByTime)? = nil
        )
        end
      end


      struct GetCostCategoriesRequest
        include JSON::Serializable


        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN is used to
        # specify which particular billing view you want to interact with or retrieve information from when
        # making API calls related to Amazon Web Services Billing and Cost Management features. The
        # BillingViewArn can be retrieved by calling the ListBillingViews API.

        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?


        @[JSON::Field(key: "CostCategoryName")]
        getter cost_category_name : String?


        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # This field is only used when the SortBy value is provided in the request. The maximum number of
        # objects that are returned for this request. If MaxResults isn't specified with the SortBy value, the
        # request returns 1000 results as the default value for this parameter. For GetCostCategories ,
        # MaxResults has an upper quota of 1000.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the number of objects that are still available for retrieval exceeds the quota, Amazon Web
        # Services returns a NextPageToken value in the response. To retrieve the next batch of objects,
        # provide the NextPageToken from the previous call in your next request.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The value that you want to search the filter values for. If you don't specify a CostCategoryName ,
        # SearchString is used to filter cost category names that match the SearchString pattern. If you
        # specify a CostCategoryName , SearchString is used to filter cost category values that match the
        # SearchString pattern.

        @[JSON::Field(key: "SearchString")]
        getter search_string : String?

        # The value that you sort the data by. The key represents the cost and usage metrics. The following
        # values are supported: BlendedCost UnblendedCost AmortizedCost NetAmortizedCost NetUnblendedCost
        # UsageQuantity NormalizedUsageAmount The supported key values for the SortOrder value are ASCENDING
        # and DESCENDING . When you use the SortBy value, the NextPageToken and SearchString key values aren't
        # supported.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : Array(Types::SortDefinition)?

        def initialize(
          @time_period : Types::DateInterval,
          @billing_view_arn : String? = nil,
          @cost_category_name : String? = nil,
          @filter : Types::Expression? = nil,
          @max_results : Int32? = nil,
          @next_page_token : String? = nil,
          @search_string : String? = nil,
          @sort_by : Array(Types::SortDefinition)? = nil
        )
        end
      end


      struct GetCostCategoriesResponse
        include JSON::Serializable

        # The number of objects that are returned.

        @[JSON::Field(key: "ReturnSize")]
        getter return_size : Int32

        # The total number of objects.

        @[JSON::Field(key: "TotalSize")]
        getter total_size : Int32

        # The names of the cost categories.

        @[JSON::Field(key: "CostCategoryNames")]
        getter cost_category_names : Array(String)?

        # The cost category values. If the CostCategoryName key isn't specified in the request, the
        # CostCategoryValues fields aren't returned.

        @[JSON::Field(key: "CostCategoryValues")]
        getter cost_category_values : Array(String)?

        # If the number of objects that are still available for retrieval exceeds the quota, Amazon Web
        # Services returns a NextPageToken value in the response. To retrieve the next batch of objects,
        # provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @return_size : Int32,
          @total_size : Int32,
          @cost_category_names : Array(String)? = nil,
          @cost_category_values : Array(String)? = nil,
          @next_page_token : String? = nil
        )
        end
      end


      struct GetCostComparisonDriversRequest
        include JSON::Serializable

        # The reference time period for comparison. This time period serves as the baseline against which
        # other cost and usage data will be compared. The interval must start and end on the first day of a
        # month, with a duration of exactly one month.

        @[JSON::Field(key: "BaselineTimePeriod")]
        getter baseline_time_period : Types::DateInterval

        # The comparison time period for analysis. This time period's cost and usage data will be compared
        # against the baseline time period. The interval must start and end on the first day of a month, with
        # a duration of exactly one month.

        @[JSON::Field(key: "ComparisonTimePeriod")]
        getter comparison_time_period : Types::DateInterval

        # The cost and usage metric to compare. Valid values are AmortizedCost , BlendedCost ,
        # NetAmortizedCost , NetUnblendedCost , NormalizedUsageAmount , UnblendedCost , and UsageQuantity .

        @[JSON::Field(key: "MetricForComparison")]
        getter metric_for_comparison : String

        # The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN is used to
        # specify which particular billing view you want to interact with or retrieve information from when
        # making API calls related to Amazon Web Services Billing and Cost Management features. The
        # BillingViewArn can be retrieved by calling the ListBillingViews API.

        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?


        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # You can group results using the attributes DIMENSION , TAG , and COST_CATEGORY . Note that SERVICE
        # and USAGE_TYPE dimensions are automatically included in the cost comparison drivers analysis.

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        # The maximum number of results that are returned for the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of paginated results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @baseline_time_period : Types::DateInterval,
          @comparison_time_period : Types::DateInterval,
          @metric_for_comparison : String,
          @billing_view_arn : String? = nil,
          @filter : Types::Expression? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil,
          @max_results : Int32? = nil,
          @next_page_token : String? = nil
        )
        end
      end


      struct GetCostComparisonDriversResponse
        include JSON::Serializable

        # An array of comparison results showing factors that drive significant cost differences between
        # BaselineTimePeriod and ComparisonTimePeriod .

        @[JSON::Field(key: "CostComparisonDrivers")]
        getter cost_comparison_drivers : Array(Types::CostComparisonDriver)?

        # The token to retrieve the next set of paginated results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @cost_comparison_drivers : Array(Types::CostComparisonDriver)? = nil,
          @next_page_token : String? = nil
        )
        end
      end


      struct GetCostForecastRequest
        include JSON::Serializable

        # How granular you want the forecast to be. You can get 3 months of DAILY forecasts or 18 months of
        # MONTHLY forecasts. The GetCostForecast operation supports only DAILY and MONTHLY granularities.

        @[JSON::Field(key: "Granularity")]
        getter granularity : String

        # Which metric Cost Explorer uses to create your forecast. For more information about blended and
        # unblended rates, see Why does the "blended" annotation appear on some line items in my bill? . Valid
        # values for a GetCostForecast call are the following: AMORTIZED_COST BLENDED_COST NET_AMORTIZED_COST
        # NET_UNBLENDED_COST UNBLENDED_COST

        @[JSON::Field(key: "Metric")]
        getter metric : String

        # The period of time that you want the forecast to cover. The start date must be equal to or no later
        # than the current date to avoid a validation error.

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN is used to
        # specify which particular billing view you want to interact with or retrieve information from when
        # making API calls related to Amazon Web Services Billing and Cost Management features. The
        # BillingViewArn can be retrieved by calling the ListBillingViews API.

        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?

        # The filters that you want to use to filter your forecast. The GetCostForecast API supports filtering
        # by the following dimensions: AZ INSTANCE_TYPE LINKED_ACCOUNT OPERATION PURCHASE_TYPE REGION SERVICE
        # USAGE_TYPE USAGE_TYPE_GROUP RECORD_TYPE OPERATING_SYSTEM TENANCY SCOPE PLATFORM SUBSCRIPTION_ID
        # LEGAL_ENTITY_NAME DEPLOYMENT_OPTION DATABASE_ENGINE INSTANCE_TYPE_FAMILY BILLING_ENTITY
        # RESERVATION_ID SAVINGS_PLAN_ARN

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # Cost Explorer always returns the mean forecast as a single point. You can request a prediction
        # interval around the mean by specifying a confidence level. The higher the confidence level, the more
        # confident Cost Explorer is about the actual value falling in the prediction interval. Higher
        # confidence levels result in wider prediction intervals.

        @[JSON::Field(key: "PredictionIntervalLevel")]
        getter prediction_interval_level : Int32?

        def initialize(
          @granularity : String,
          @metric : String,
          @time_period : Types::DateInterval,
          @billing_view_arn : String? = nil,
          @filter : Types::Expression? = nil,
          @prediction_interval_level : Int32? = nil
        )
        end
      end


      struct GetCostForecastResponse
        include JSON::Serializable

        # The forecasts for your query, in order. For DAILY forecasts, this is a list of days. For MONTHLY
        # forecasts, this is a list of months.

        @[JSON::Field(key: "ForecastResultsByTime")]
        getter forecast_results_by_time : Array(Types::ForecastResult)?

        # How much you are forecasted to spend over the forecast period, in USD .

        @[JSON::Field(key: "Total")]
        getter total : Types::MetricValue?

        def initialize(
          @forecast_results_by_time : Array(Types::ForecastResult)? = nil,
          @total : Types::MetricValue? = nil
        )
        end
      end


      struct GetDimensionValuesRequest
        include JSON::Serializable

        # The name of the dimension. Each Dimension is available for a different Context . For more
        # information, see Context . LINK_ACCOUNT_NAME and SERVICE_CODE can only be used in CostCategoryRule .

        @[JSON::Field(key: "Dimension")]
        getter dimension : String

        # The start date and end date for retrieving the dimension values. The start date is inclusive, but
        # the end date is exclusive. For example, if start is 2017-01-01 and end is 2017-05-01 , then the cost
        # and usage data is retrieved from 2017-01-01 up to and including 2017-04-30 but not including
        # 2017-05-01 .

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN is used to
        # specify which particular billing view you want to interact with or retrieve information from when
        # making API calls related to Amazon Web Services Billing and Cost Management features. The
        # BillingViewArn can be retrieved by calling the ListBillingViews API.

        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?

        # The context for the call to GetDimensionValues . This can be RESERVATIONS or COST_AND_USAGE . The
        # default value is COST_AND_USAGE . If the context is set to RESERVATIONS , the resulting dimension
        # values can be used in the GetReservationUtilization operation. If the context is set to
        # COST_AND_USAGE , the resulting dimension values can be used in the GetCostAndUsage operation. If you
        # set the context to COST_AND_USAGE , you can use the following dimensions for searching: AZ - The
        # Availability Zone. An example is us-east-1a . BILLING_ENTITY - The Amazon Web Services seller that
        # your account is with. Possible values are the following: - Amazon Web Services(Amazon Web Services):
        # The entity that sells Amazon Web Services services. - AISPL (Amazon Internet Services Pvt. Ltd.):
        # The local Indian entity that's an acting reseller for Amazon Web Services services in India. -
        # Amazon Web Services Marketplace: The entity that supports the sale of solutions that are built on
        # Amazon Web Services by third-party software providers. CACHE_ENGINE - The Amazon ElastiCache
        # operating system. Examples are Windows or Linux. DEPLOYMENT_OPTION - The scope of Amazon Relational
        # Database Service deployments. Valid values are SingleAZ and MultiAZ . DATABASE_ENGINE - The Amazon
        # Relational Database Service database. Examples are Aurora or MySQL. INSTANCE_TYPE - The type of
        # Amazon EC2 instance. An example is m4.xlarge . INSTANCE_TYPE_FAMILY - A family of instance types
        # optimized to fit different use cases. Examples are Compute Optimized (for example, C4 , C5 , C6g ,
        # and C7g ), Memory Optimization (for example, R4 , R5n , R5b , and R6g ). INVOICING_ENTITY - The name
        # of the entity that issues the Amazon Web Services invoice. LEGAL_ENTITY_NAME - The name of the
        # organization that sells you Amazon Web Services services, such as Amazon Web Services.
        # LINKED_ACCOUNT - The description in the attribute map that includes the full name of the member
        # account. The value field contains the Amazon Web Services ID of the member account. OPERATING_SYSTEM
        # - The operating system. Examples are Windows or Linux. OPERATION - The action performed. Examples
        # include RunInstance and CreateBucket . PLATFORM - The Amazon EC2 operating system. Examples are
        # Windows or Linux. PURCHASE_TYPE - The reservation type of the purchase that this usage is related
        # to. Examples include On-Demand Instances and Standard Reserved Instances. RESERVATION_ID - The
        # unique identifier for an Amazon Web Services Reservation Instance. SAVINGS_PLAN_ARN - The unique
        # identifier for your Savings Plans. SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or
        # Compute). SERVICE - The Amazon Web Services service such as Amazon DynamoDB. TENANCY - The tenancy
        # of a resource. Examples are shared or dedicated. USAGE_TYPE - The type of usage. An example is
        # DataTransfer-In-Bytes. The response for the GetDimensionValues operation includes a unit attribute.
        # Examples include GB and Hrs. USAGE_TYPE_GROUP - The grouping of common usage types. An example is
        # Amazon EC2: CloudWatch – Alarms. The response for this operation includes a unit attribute. REGION -
        # The Amazon Web Services Region. RECORD_TYPE - The different types of charges such as Reserved
        # Instance (RI) fees, usage costs, tax refunds, and credits. RESOURCE_ID - The unique identifier of
        # the resource. ResourceId is an opt-in feature only available for last 14 days for EC2-Compute
        # Service. If you set the context to RESERVATIONS , you can use the following dimensions for
        # searching: AZ - The Availability Zone. An example is us-east-1a . CACHE_ENGINE - The Amazon
        # ElastiCache operating system. Examples are Windows or Linux. DEPLOYMENT_OPTION - The scope of Amazon
        # Relational Database Service deployments. Valid values are SingleAZ and MultiAZ . INSTANCE_TYPE - The
        # type of Amazon EC2 instance. An example is m4.xlarge . LINKED_ACCOUNT - The description in the
        # attribute map that includes the full name of the member account. The value field contains the Amazon
        # Web Services ID of the member account. PLATFORM - The Amazon EC2 operating system. Examples are
        # Windows or Linux. REGION - The Amazon Web Services Region. SCOPE (Utilization only) - The scope of a
        # Reserved Instance (RI). Values are regional or a single Availability Zone. TAG (Coverage only) - The
        # tags that are associated with a Reserved Instance (RI). TENANCY - The tenancy of a resource.
        # Examples are shared or dedicated. If you set the context to SAVINGS_PLANS , you can use the
        # following dimensions for searching: SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or
        # Compute) PAYMENT_OPTION - The payment option for the given Savings Plans (for example, All Upfront)
        # REGION - The Amazon Web Services Region. INSTANCE_TYPE_FAMILY - The family of instances (For
        # example, m5 ) LINKED_ACCOUNT - The description in the attribute map that includes the full name of
        # the member account. The value field contains the Amazon Web Services ID of the member account.
        # SAVINGS_PLAN_ARN - The unique identifier for your Savings Plans.

        @[JSON::Field(key: "Context")]
        getter context : String?


        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # This field is only used when SortBy is provided in the request. The maximum number of objects that
        # are returned for this request. If MaxResults isn't specified with SortBy, the request returns 1000
        # results as the default value for this parameter. For GetDimensionValues , MaxResults has an upper
        # limit of 1000.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The value that you want to search the filter values for.

        @[JSON::Field(key: "SearchString")]
        getter search_string : String?

        # The value that you want to sort the data by. The key represents cost and usage metrics. The
        # following values are supported: BlendedCost UnblendedCost AmortizedCost NetAmortizedCost
        # NetUnblendedCost UsageQuantity NormalizedUsageAmount The supported values for the SortOrder key are
        # ASCENDING or DESCENDING . When you specify a SortBy paramater, the context must be COST_AND_USAGE .
        # Further, when using SortBy , NextPageToken and SearchString aren't supported.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : Array(Types::SortDefinition)?

        def initialize(
          @dimension : String,
          @time_period : Types::DateInterval,
          @billing_view_arn : String? = nil,
          @context : String? = nil,
          @filter : Types::Expression? = nil,
          @max_results : Int32? = nil,
          @next_page_token : String? = nil,
          @search_string : String? = nil,
          @sort_by : Array(Types::SortDefinition)? = nil
        )
        end
      end


      struct GetDimensionValuesResponse
        include JSON::Serializable

        # The filters that you used to filter your request. Some dimensions are available only for a specific
        # context. If you set the context to COST_AND_USAGE , you can use the following dimensions for
        # searching: AZ - The Availability Zone. An example is us-east-1a . DATABASE_ENGINE - The Amazon
        # Relational Database Service database. Examples are Aurora or MySQL. INSTANCE_TYPE - The type of
        # Amazon EC2 instance. An example is m4.xlarge . LEGAL_ENTITY_NAME - The name of the organization that
        # sells you Amazon Web Services services, such as Amazon Web Services. LINKED_ACCOUNT - The
        # description in the attribute map that includes the full name of the member account. The value field
        # contains the Amazon Web Services ID of the member account. OPERATING_SYSTEM - The operating system.
        # Examples are Windows or Linux. OPERATION - The action performed. Examples include RunInstance and
        # CreateBucket . PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.
        # PURCHASE_TYPE - The reservation type of the purchase to which this usage is related. Examples
        # include On-Demand Instances and Standard Reserved Instances. SERVICE - The Amazon Web Services
        # service such as Amazon DynamoDB. USAGE_TYPE - The type of usage. An example is
        # DataTransfer-In-Bytes. The response for the GetDimensionValues operation includes a unit attribute.
        # Examples include GB and Hrs. USAGE_TYPE_GROUP - The grouping of common usage types. An example is
        # Amazon EC2: CloudWatch – Alarms. The response for this operation includes a unit attribute.
        # RECORD_TYPE - The different types of charges such as RI fees, usage costs, tax refunds, and credits.
        # RESOURCE_ID - The unique identifier of the resource. ResourceId is an opt-in feature only available
        # for last 14 days for EC2-Compute Service. You can opt-in by enabling Hourly and Resource Level Data
        # in Cost Management Console preferences. If you set the context to RESERVATIONS , you can use the
        # following dimensions for searching: AZ - The Availability Zone. An example is us-east-1a .
        # CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are Windows or Linux.
        # DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service deployments. Valid values are
        # SingleAZ and MultiAZ . INSTANCE_TYPE - The type of Amazon EC2 instance. An example is m4.xlarge .
        # LINKED_ACCOUNT - The description in the attribute map that includes the full name of the member
        # account. The value field contains the Amazon Web Services ID of the member account. PLATFORM - The
        # Amazon EC2 operating system. Examples are Windows or Linux. REGION - The Amazon Web Services Region.
        # SCOPE (Utilization only) - The scope of a Reserved Instance (RI). Values are regional or a single
        # Availability Zone. TAG (Coverage only) - The tags that are associated with a Reserved Instance (RI).
        # TENANCY - The tenancy of a resource. Examples are shared or dedicated. If you set the context to
        # SAVINGS_PLANS , you can use the following dimensions for searching: SAVINGS_PLANS_TYPE - Type of
        # Savings Plans (EC2 Instance or Compute) PAYMENT_OPTION - Payment option for the given Savings Plans
        # (for example, All Upfront) REGION - The Amazon Web Services Region. INSTANCE_TYPE_FAMILY - The
        # family of instances (For example, m5 ) LINKED_ACCOUNT - The description in the attribute map that
        # includes the full name of the member account. The value field contains the Amazon Web Services ID of
        # the member account. SAVINGS_PLAN_ARN - The unique identifier for your Savings Plan

        @[JSON::Field(key: "DimensionValues")]
        getter dimension_values : Array(Types::DimensionValuesWithAttributes)

        # The number of results that Amazon Web Services returned at one time.

        @[JSON::Field(key: "ReturnSize")]
        getter return_size : Int32

        # The total number of search results.

        @[JSON::Field(key: "TotalSize")]
        getter total_size : Int32

        # The token for the next set of retrievable results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @dimension_values : Array(Types::DimensionValuesWithAttributes),
          @return_size : Int32,
          @total_size : Int32,
          @next_page_token : String? = nil
        )
        end
      end

      # You can use the following request parameters to query for how much of your instance usage a
      # reservation covered.

      struct GetReservationCoverageRequest
        include JSON::Serializable

        # The start and end dates of the period that you want to retrieve data about reservation coverage for.
        # You can retrieve data for a maximum of 13 months: the last 12 months and the current month. The
        # start date is inclusive, but the end date is exclusive. For example, if start is 2017-01-01 and end
        # is 2017-05-01 , then the cost and usage data is retrieved from 2017-01-01 up to and including
        # 2017-04-30 but not including 2017-05-01 .

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # Filters utilization data by dimensions. You can filter by the following dimensions: AZ CACHE_ENGINE
        # DATABASE_ENGINE DEPLOYMENT_OPTION INSTANCE_TYPE LINKED_ACCOUNT OPERATING_SYSTEM PLATFORM REGION
        # SERVICE TAG TENANCY GetReservationCoverage uses the same Expression object as the other operations,
        # but only AND is supported among each dimension. You can nest only one level deep. If there are
        # multiple values for a dimension, they are OR'd together. If you don't provide a SERVICE filter, Cost
        # Explorer defaults to EC2. Cost category is also supported.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # The granularity of the Amazon Web Services cost data for the reservation. Valid values are MONTHLY
        # and DAILY . If GroupBy is set, Granularity can't be set. If Granularity isn't set, the response
        # object doesn't include Granularity , either MONTHLY or DAILY . The GetReservationCoverage operation
        # supports only DAILY and MONTHLY granularities.

        @[JSON::Field(key: "Granularity")]
        getter granularity : String?

        # You can group the data by the following attributes: AZ CACHE_ENGINE DATABASE_ENGINE
        # DEPLOYMENT_OPTION INSTANCE_TYPE INVOICING_ENTITY LINKED_ACCOUNT OPERATING_SYSTEM PLATFORM REGION
        # TENANCY

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        # The maximum number of objects that you returned for this request. If more objects are available, in
        # the response, Amazon Web Services provides a NextPageToken value that you can use in a subsequent
        # call to get the next batch of objects.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The measurement that you want your reservation coverage reported in. Valid values are Hour , Unit ,
        # and Cost . You can use multiple values in a request.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(String)?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The value by which you want to sort the data. The following values are supported for Key :
        # OnDemandCost CoverageHoursPercentage OnDemandHours ReservedHours TotalRunningHours
        # CoverageNormalizedUnitsPercentage OnDemandNormalizedUnits ReservedNormalizedUnits
        # TotalRunningNormalizedUnits Time Supported values for SortOrder are ASCENDING or DESCENDING .

        @[JSON::Field(key: "SortBy")]
        getter sort_by : Types::SortDefinition?

        def initialize(
          @time_period : Types::DateInterval,
          @filter : Types::Expression? = nil,
          @granularity : String? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil,
          @max_results : Int32? = nil,
          @metrics : Array(String)? = nil,
          @next_page_token : String? = nil,
          @sort_by : Types::SortDefinition? = nil
        )
        end
      end


      struct GetReservationCoverageResponse
        include JSON::Serializable

        # The amount of time that your reservations covered.

        @[JSON::Field(key: "CoveragesByTime")]
        getter coverages_by_time : Array(Types::CoverageByTime)

        # The token for the next set of retrievable results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The total amount of instance usage that a reservation covered.

        @[JSON::Field(key: "Total")]
        getter total : Types::Coverage?

        def initialize(
          @coverages_by_time : Array(Types::CoverageByTime),
          @next_page_token : String? = nil,
          @total : Types::Coverage? = nil
        )
        end
      end


      struct GetReservationPurchaseRecommendationRequest
        include JSON::Serializable

        # The specific service that you want recommendations for.

        @[JSON::Field(key: "Service")]
        getter service : String

        # The account ID that's associated with the recommendation.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The account scope that you want your recommendations for. Amazon Web Services calculates
        # recommendations including the management account and member accounts if the value is set to PAYER .
        # If the value is LINKED , recommendations are calculated for individual member accounts only.

        @[JSON::Field(key: "AccountScope")]
        getter account_scope : String?


        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # The number of previous days that you want Amazon Web Services to consider when it calculates your
        # recommendations.

        @[JSON::Field(key: "LookbackPeriodInDays")]
        getter lookback_period_in_days : String?

        # The pagination token that indicates the next set of results that you want to retrieve.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The number of recommendations that you want returned in a single response object.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The reservation purchase option that you want recommendations for.

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # The hardware specifications for the service instances that you want recommendations for, such as
        # standard or convertible Amazon EC2 instances.

        @[JSON::Field(key: "ServiceSpecification")]
        getter service_specification : Types::ServiceSpecification?

        # The reservation term that you want recommendations for.

        @[JSON::Field(key: "TermInYears")]
        getter term_in_years : String?

        def initialize(
          @service : String,
          @account_id : String? = nil,
          @account_scope : String? = nil,
          @filter : Types::Expression? = nil,
          @lookback_period_in_days : String? = nil,
          @next_page_token : String? = nil,
          @page_size : Int32? = nil,
          @payment_option : String? = nil,
          @service_specification : Types::ServiceSpecification? = nil,
          @term_in_years : String? = nil
        )
        end
      end


      struct GetReservationPurchaseRecommendationResponse
        include JSON::Serializable

        # Information about this specific recommendation call, such as the time stamp for when Cost Explorer
        # generated this recommendation.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::ReservationPurchaseRecommendationMetadata?

        # The pagination token for the next set of retrievable results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Recommendations for reservations to purchase.

        @[JSON::Field(key: "Recommendations")]
        getter recommendations : Array(Types::ReservationPurchaseRecommendation)?

        def initialize(
          @metadata : Types::ReservationPurchaseRecommendationMetadata? = nil,
          @next_page_token : String? = nil,
          @recommendations : Array(Types::ReservationPurchaseRecommendation)? = nil
        )
        end
      end


      struct GetReservationUtilizationRequest
        include JSON::Serializable

        # Sets the start and end dates for retrieving Reserved Instance (RI) utilization. The start date is
        # inclusive, but the end date is exclusive. For example, if start is 2017-01-01 and end is 2017-05-01
        # , then the cost and usage data is retrieved from 2017-01-01 up to and including 2017-04-30 but not
        # including 2017-05-01 .

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # Filters utilization data by dimensions. You can filter by the following dimensions: AZ CACHE_ENGINE
        # DEPLOYMENT_OPTION INSTANCE_TYPE LINKED_ACCOUNT OPERATING_SYSTEM PLATFORM REGION SERVICE If not
        # specified, the SERVICE filter defaults to Amazon Elastic Compute Cloud - Compute. Supported values
        # for SERVICE are Amazon Elastic Compute Cloud - Compute, Amazon Relational Database Service, Amazon
        # ElastiCache, Amazon Redshift, and Amazon Elasticsearch Service. The value for the SERVICE filter
        # should not exceed "1". SCOPE TENANCY GetReservationUtilization uses the same Expression object as
        # the other operations, but only AND is supported among each dimension, and nesting is supported up to
        # only one level deep. If there are multiple values for a dimension, they are OR'd together.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # If GroupBy is set, Granularity can't be set. If Granularity isn't set, the response object doesn't
        # include Granularity , either MONTHLY or DAILY . If both GroupBy and Granularity aren't set,
        # GetReservationUtilization defaults to DAILY . The GetReservationUtilization operation supports only
        # DAILY and MONTHLY granularities.

        @[JSON::Field(key: "Granularity")]
        getter granularity : String?

        # Groups only by SUBSCRIPTION_ID . Metadata is included.

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        # The maximum number of objects that you returned for this request. If more objects are available, in
        # the response, Amazon Web Services provides a NextPageToken value that you can use in a subsequent
        # call to get the next batch of objects.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The value that you want to sort the data by. The following values are supported for Key :
        # UtilizationPercentage UtilizationPercentageInUnits PurchasedHours PurchasedUnits TotalActualHours
        # TotalActualUnits UnusedHours UnusedUnits OnDemandCostOfRIHoursUsed NetRISavings
        # TotalPotentialRISavings AmortizedUpfrontFee AmortizedRecurringFee TotalAmortizedFee
        # RICostForUnusedHours RealizedSavings UnrealizedSavings The supported values for SortOrder are
        # ASCENDING and DESCENDING .

        @[JSON::Field(key: "SortBy")]
        getter sort_by : Types::SortDefinition?

        def initialize(
          @time_period : Types::DateInterval,
          @filter : Types::Expression? = nil,
          @granularity : String? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil,
          @max_results : Int32? = nil,
          @next_page_token : String? = nil,
          @sort_by : Types::SortDefinition? = nil
        )
        end
      end


      struct GetReservationUtilizationResponse
        include JSON::Serializable

        # The amount of time that you used your Reserved Instances (RIs).

        @[JSON::Field(key: "UtilizationsByTime")]
        getter utilizations_by_time : Array(Types::UtilizationByTime)

        # The token for the next set of retrievable results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The total amount of time that you used your Reserved Instances (RIs).

        @[JSON::Field(key: "Total")]
        getter total : Types::ReservationAggregates?

        def initialize(
          @utilizations_by_time : Array(Types::UtilizationByTime),
          @next_page_token : String? = nil,
          @total : Types::ReservationAggregates? = nil
        )
        end
      end


      struct GetRightsizingRecommendationRequest
        include JSON::Serializable

        # The specific service that you want recommendations for. The only valid value for
        # GetRightsizingRecommendation is " AmazonEC2 ".

        @[JSON::Field(key: "Service")]
        getter service : String

        # You can use Configuration to customize recommendations across two attributes. You can choose to view
        # recommendations for instances within the same instance families or across different instance
        # families. You can also choose to view your estimated savings that are associated with
        # recommendations with consideration of existing Savings Plans or RI benefits, or neither.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::RightsizingRecommendationConfiguration?


        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # The pagination token that indicates the next set of results that you want to retrieve.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The number of recommendations that you want returned in a single response object.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @service : String,
          @configuration : Types::RightsizingRecommendationConfiguration? = nil,
          @filter : Types::Expression? = nil,
          @next_page_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct GetRightsizingRecommendationResponse
        include JSON::Serializable

        # You can use Configuration to customize recommendations across two attributes. You can choose to view
        # recommendations for instances within the same instance families or across different instance
        # families. You can also choose to view your estimated savings that are associated with
        # recommendations with consideration of existing Savings Plans or RI benefits, or neither.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::RightsizingRecommendationConfiguration?

        # Information regarding this specific recommendation set.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::RightsizingRecommendationMetadata?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Recommendations to rightsize resources.

        @[JSON::Field(key: "RightsizingRecommendations")]
        getter rightsizing_recommendations : Array(Types::RightsizingRecommendation)?

        # Summary of this recommendation set.

        @[JSON::Field(key: "Summary")]
        getter summary : Types::RightsizingRecommendationSummary?

        def initialize(
          @configuration : Types::RightsizingRecommendationConfiguration? = nil,
          @metadata : Types::RightsizingRecommendationMetadata? = nil,
          @next_page_token : String? = nil,
          @rightsizing_recommendations : Array(Types::RightsizingRecommendation)? = nil,
          @summary : Types::RightsizingRecommendationSummary? = nil
        )
        end
      end


      struct GetSavingsPlanPurchaseRecommendationDetailsRequest
        include JSON::Serializable

        # The ID that is associated with the Savings Plan recommendation.

        @[JSON::Field(key: "RecommendationDetailId")]
        getter recommendation_detail_id : String

        def initialize(
          @recommendation_detail_id : String
        )
        end
      end


      struct GetSavingsPlanPurchaseRecommendationDetailsResponse
        include JSON::Serializable

        # Contains detailed information about a specific Savings Plan recommendation.

        @[JSON::Field(key: "RecommendationDetailData")]
        getter recommendation_detail_data : Types::RecommendationDetailData?

        # The ID that is associated with the Savings Plan recommendation.

        @[JSON::Field(key: "RecommendationDetailId")]
        getter recommendation_detail_id : String?

        def initialize(
          @recommendation_detail_data : Types::RecommendationDetailData? = nil,
          @recommendation_detail_id : String? = nil
        )
        end
      end


      struct GetSavingsPlansCoverageRequest
        include JSON::Serializable

        # The time period that you want the usage and costs for. The Start date must be within 13 months. The
        # End date must be after the Start date, and before the current date. Future dates can't be used as an
        # End date.

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # Filters Savings Plans coverage data by dimensions. You can filter data for Savings Plans usage with
        # the following dimensions: LINKED_ACCOUNT REGION SERVICE INSTANCE_FAMILY GetSavingsPlansCoverage uses
        # the same Expression object as the other operations, but only AND is supported among each dimension.
        # If there are multiple values for a dimension, they are OR'd together. Cost category is also
        # supported.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # The granularity of the Amazon Web Services cost data for your Savings Plans. Granularity can't be
        # set if GroupBy is set. The GetSavingsPlansCoverage operation supports only DAILY and MONTHLY
        # granularities.

        @[JSON::Field(key: "Granularity")]
        getter granularity : String?

        # You can group the data using the attributes INSTANCE_FAMILY , REGION , or SERVICE .

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Array(Types::GroupDefinition)?

        # The number of items to be returned in a response. The default is 20 , with a minimum value of 1 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The measurement that you want your Savings Plans coverage reported in. The only valid value is
        # SpendCoveredBySavingsPlans .

        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(String)?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The value that you want to sort the data by. The following values are supported for Key :
        # SpendCoveredBySavingsPlan OnDemandCost CoveragePercentage TotalCost InstanceFamily Region Service
        # The supported values for SortOrder are ASCENDING and DESCENDING .

        @[JSON::Field(key: "SortBy")]
        getter sort_by : Types::SortDefinition?

        def initialize(
          @time_period : Types::DateInterval,
          @filter : Types::Expression? = nil,
          @granularity : String? = nil,
          @group_by : Array(Types::GroupDefinition)? = nil,
          @max_results : Int32? = nil,
          @metrics : Array(String)? = nil,
          @next_token : String? = nil,
          @sort_by : Types::SortDefinition? = nil
        )
        end
      end


      struct GetSavingsPlansCoverageResponse
        include JSON::Serializable

        # The amount of spend that your Savings Plans covered.

        @[JSON::Field(key: "SavingsPlansCoverages")]
        getter savings_plans_coverages : Array(Types::SavingsPlansCoverage)

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @savings_plans_coverages : Array(Types::SavingsPlansCoverage),
          @next_token : String? = nil
        )
        end
      end


      struct GetSavingsPlansPurchaseRecommendationRequest
        include JSON::Serializable

        # The lookback period that's used to generate the recommendation.

        @[JSON::Field(key: "LookbackPeriodInDays")]
        getter lookback_period_in_days : String

        # The payment option that's used to generate these recommendations.

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String

        # The Savings Plans recommendation type that's requested.

        @[JSON::Field(key: "SavingsPlansType")]
        getter savings_plans_type : String

        # The savings plan recommendation term that's used to generate these recommendations.

        @[JSON::Field(key: "TermInYears")]
        getter term_in_years : String

        # The account scope that you want your recommendations for. Amazon Web Services calculates
        # recommendations including the management account and member accounts if the value is set to PAYER .
        # If the value is LINKED , recommendations are calculated for individual member accounts only.

        @[JSON::Field(key: "AccountScope")]
        getter account_scope : String?

        # You can filter your recommendations by Account ID with the LINKED_ACCOUNT dimension. To filter your
        # recommendations by Account ID, specify Key as LINKED_ACCOUNT and Value as the comma-separated Acount
        # ID(s) that you want to see Savings Plans purchase recommendations for. For
        # GetSavingsPlansPurchaseRecommendation, the Filter doesn't include CostCategories or Tags . It only
        # includes Dimensions . With Dimensions , Key must be LINKED_ACCOUNT and Value can be a single Account
        # ID or multiple comma-separated Account IDs that you want to see Savings Plans Purchase
        # Recommendations for. AND and OR operators are not supported.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The number of recommendations that you want returned in a single response object.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @lookback_period_in_days : String,
          @payment_option : String,
          @savings_plans_type : String,
          @term_in_years : String,
          @account_scope : String? = nil,
          @filter : Types::Expression? = nil,
          @next_page_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct GetSavingsPlansPurchaseRecommendationResponse
        include JSON::Serializable

        # Information that regards this specific recommendation set.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::SavingsPlansPurchaseRecommendationMetadata?

        # The token for the next set of retrievable results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # Contains your request parameters, Savings Plan Recommendations Summary, and Details.

        @[JSON::Field(key: "SavingsPlansPurchaseRecommendation")]
        getter savings_plans_purchase_recommendation : Types::SavingsPlansPurchaseRecommendation?

        def initialize(
          @metadata : Types::SavingsPlansPurchaseRecommendationMetadata? = nil,
          @next_page_token : String? = nil,
          @savings_plans_purchase_recommendation : Types::SavingsPlansPurchaseRecommendation? = nil
        )
        end
      end


      struct GetSavingsPlansUtilizationDetailsRequest
        include JSON::Serializable

        # The time period that you want the usage and costs for. The Start date must be within 13 months. The
        # End date must be after the Start date, and before the current date. Future dates can't be used as an
        # End date.

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # The data type.

        @[JSON::Field(key: "DataType")]
        getter data_type : Array(String)?

        # Filters Savings Plans utilization coverage data for active Savings Plans dimensions. You can filter
        # data with the following dimensions: LINKED_ACCOUNT SAVINGS_PLAN_ARN REGION PAYMENT_OPTION
        # INSTANCE_TYPE_FAMILY GetSavingsPlansUtilizationDetails uses the same Expression object as the other
        # operations, but only AND is supported among each dimension.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # The number of items to be returned in a response. The default is 20 , with a minimum value of 1 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The value that you want to sort the data by. The following values are supported for Key :
        # UtilizationPercentage TotalCommitment UsedCommitment UnusedCommitment NetSavings
        # AmortizedRecurringCommitment AmortizedUpfrontCommitment The supported values for SortOrder are
        # ASCENDING and DESCENDING .

        @[JSON::Field(key: "SortBy")]
        getter sort_by : Types::SortDefinition?

        def initialize(
          @time_period : Types::DateInterval,
          @data_type : Array(String)? = nil,
          @filter : Types::Expression? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : Types::SortDefinition? = nil
        )
        end
      end


      struct GetSavingsPlansUtilizationDetailsResponse
        include JSON::Serializable

        # Retrieves a single daily or monthly Savings Plans utilization rate and details for your account.

        @[JSON::Field(key: "SavingsPlansUtilizationDetails")]
        getter savings_plans_utilization_details : Array(Types::SavingsPlansUtilizationDetail)


        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The total Savings Plans utilization, regardless of time period.

        @[JSON::Field(key: "Total")]
        getter total : Types::SavingsPlansUtilizationAggregates?

        def initialize(
          @savings_plans_utilization_details : Array(Types::SavingsPlansUtilizationDetail),
          @time_period : Types::DateInterval,
          @next_token : String? = nil,
          @total : Types::SavingsPlansUtilizationAggregates? = nil
        )
        end
      end


      struct GetSavingsPlansUtilizationRequest
        include JSON::Serializable

        # The time period that you want the usage and costs for. The Start date must be within 13 months. The
        # End date must be after the Start date, and before the current date. Future dates can't be used as an
        # End date.

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # Filters Savings Plans utilization coverage data for active Savings Plans dimensions. You can filter
        # data with the following dimensions: LINKED_ACCOUNT SAVINGS_PLAN_ARN SAVINGS_PLANS_TYPE REGION
        # PAYMENT_OPTION INSTANCE_TYPE_FAMILY GetSavingsPlansUtilization uses the same Expression object as
        # the other operations, but only AND is supported among each dimension.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # The granularity of the Amazon Web Services utillization data for your Savings Plans. The
        # GetSavingsPlansUtilization operation supports only DAILY and MONTHLY granularities.

        @[JSON::Field(key: "Granularity")]
        getter granularity : String?

        # The value that you want to sort the data by. The following values are supported for Key :
        # UtilizationPercentage TotalCommitment UsedCommitment UnusedCommitment NetSavings The supported
        # values for SortOrder are ASCENDING and DESCENDING .

        @[JSON::Field(key: "SortBy")]
        getter sort_by : Types::SortDefinition?

        def initialize(
          @time_period : Types::DateInterval,
          @filter : Types::Expression? = nil,
          @granularity : String? = nil,
          @sort_by : Types::SortDefinition? = nil
        )
        end
      end


      struct GetSavingsPlansUtilizationResponse
        include JSON::Serializable

        # The total amount of cost/commitment that you used your Savings Plans, regardless of date ranges.

        @[JSON::Field(key: "Total")]
        getter total : Types::SavingsPlansUtilizationAggregates

        # The amount of cost/commitment that you used your Savings Plans. You can use it to specify date
        # ranges.

        @[JSON::Field(key: "SavingsPlansUtilizationsByTime")]
        getter savings_plans_utilizations_by_time : Array(Types::SavingsPlansUtilizationByTime)?

        def initialize(
          @total : Types::SavingsPlansUtilizationAggregates,
          @savings_plans_utilizations_by_time : Array(Types::SavingsPlansUtilizationByTime)? = nil
        )
        end
      end


      struct GetTagsRequest
        include JSON::Serializable

        # The start and end dates for retrieving the dimension values. The start date is inclusive, but the
        # end date is exclusive. For example, if start is 2017-01-01 and end is 2017-05-01 , then the cost and
        # usage data is retrieved from 2017-01-01 up to and including 2017-04-30 but not including 2017-05-01
        # .

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN is used to
        # specify which particular billing view you want to interact with or retrieve information from when
        # making API calls related to Amazon Web Services Billing and Cost Management features. The
        # BillingViewArn can be retrieved by calling the ListBillingViews API.

        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?


        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # This field is only used when SortBy is provided in the request. The maximum number of objects that
        # are returned for this request. If MaxResults isn't specified with SortBy, the request returns 1000
        # results as the default value for this parameter. For GetTags , MaxResults has an upper quota of
        # 1000.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The value that you want to search for.

        @[JSON::Field(key: "SearchString")]
        getter search_string : String?

        # The value that you want to sort the data by. The key represents cost and usage metrics. The
        # following values are supported: BlendedCost UnblendedCost AmortizedCost NetAmortizedCost
        # NetUnblendedCost UsageQuantity NormalizedUsageAmount The supported values for SortOrder are
        # ASCENDING and DESCENDING . When you use SortBy , NextPageToken and SearchString aren't supported.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : Array(Types::SortDefinition)?

        # The key of the tag that you want to return values for.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String?

        def initialize(
          @time_period : Types::DateInterval,
          @billing_view_arn : String? = nil,
          @filter : Types::Expression? = nil,
          @max_results : Int32? = nil,
          @next_page_token : String? = nil,
          @search_string : String? = nil,
          @sort_by : Array(Types::SortDefinition)? = nil,
          @tag_key : String? = nil
        )
        end
      end


      struct GetTagsResponse
        include JSON::Serializable

        # The number of query results that Amazon Web Services returns at a time.

        @[JSON::Field(key: "ReturnSize")]
        getter return_size : Int32

        # The tags that match your request.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(String)

        # The total number of query results.

        @[JSON::Field(key: "TotalSize")]
        getter total_size : Int32

        # The token for the next set of retrievable results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @return_size : Int32,
          @tags : Array(String),
          @total_size : Int32,
          @next_page_token : String? = nil
        )
        end
      end


      struct GetUsageForecastRequest
        include JSON::Serializable

        # How granular you want the forecast to be. You can get 3 months of DAILY forecasts or 18 months of
        # MONTHLY forecasts. The GetUsageForecast operation supports only DAILY and MONTHLY granularities.

        @[JSON::Field(key: "Granularity")]
        getter granularity : String

        # Which metric Cost Explorer uses to create your forecast. Valid values for a GetUsageForecast call
        # are the following: USAGE_QUANTITY NORMALIZED_USAGE_AMOUNT

        @[JSON::Field(key: "Metric")]
        getter metric : String

        # The start and end dates of the period that you want to retrieve usage forecast for. The start date
        # is included in the period, but the end date isn't included in the period. For example, if start is
        # 2017-01-01 and end is 2017-05-01 , then the cost and usage data is retrieved from 2017-01-01 up to
        # and including 2017-04-30 but not including 2017-05-01 . The start date must be equal to or later
        # than the current date to avoid a validation error.

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN is used to
        # specify which particular billing view you want to interact with or retrieve information from when
        # making API calls related to Amazon Web Services Billing and Cost Management features. The
        # BillingViewArn can be retrieved by calling the ListBillingViews API.

        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?

        # The filters that you want to use to filter your forecast. The GetUsageForecast API supports
        # filtering by the following dimensions: AZ INSTANCE_TYPE LINKED_ACCOUNT LINKED_ACCOUNT_NAME OPERATION
        # PURCHASE_TYPE REGION SERVICE USAGE_TYPE USAGE_TYPE_GROUP RECORD_TYPE OPERATING_SYSTEM TENANCY SCOPE
        # PLATFORM SUBSCRIPTION_ID LEGAL_ENTITY_NAME DEPLOYMENT_OPTION DATABASE_ENGINE INSTANCE_TYPE_FAMILY
        # BILLING_ENTITY RESERVATION_ID SAVINGS_PLAN_ARN

        @[JSON::Field(key: "Filter")]
        getter filter : Types::Expression?

        # Amazon Web Services Cost Explorer always returns the mean forecast as a single point. You can
        # request a prediction interval around the mean by specifying a confidence level. The higher the
        # confidence level, the more confident Cost Explorer is about the actual value falling in the
        # prediction interval. Higher confidence levels result in wider prediction intervals.

        @[JSON::Field(key: "PredictionIntervalLevel")]
        getter prediction_interval_level : Int32?

        def initialize(
          @granularity : String,
          @metric : String,
          @time_period : Types::DateInterval,
          @billing_view_arn : String? = nil,
          @filter : Types::Expression? = nil,
          @prediction_interval_level : Int32? = nil
        )
        end
      end


      struct GetUsageForecastResponse
        include JSON::Serializable

        # The forecasts for your query, in order. For DAILY forecasts, this is a list of days. For MONTHLY
        # forecasts, this is a list of months.

        @[JSON::Field(key: "ForecastResultsByTime")]
        getter forecast_results_by_time : Array(Types::ForecastResult)?

        # How much you're forecasted to use over the forecast period.

        @[JSON::Field(key: "Total")]
        getter total : Types::MetricValue?

        def initialize(
          @forecast_results_by_time : Array(Types::ForecastResult)? = nil,
          @total : Types::MetricValue? = nil
        )
        end
      end

      # One level of grouped data in the results.

      struct Group
        include JSON::Serializable

        # The keys that are included in this group.

        @[JSON::Field(key: "Keys")]
        getter keys : Array(String)?

        # The metrics that are included in this group.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Hash(String, Types::MetricValue)?

        def initialize(
          @keys : Array(String)? = nil,
          @metrics : Hash(String, Types::MetricValue)? = nil
        )
        end
      end

      # Represents a group when you specify a group by criteria or in the response to a query with a
      # specific grouping.

      struct GroupDefinition
        include JSON::Serializable

        # The string that represents a key for a specified group.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The string that represents the type of group.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @key : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The dollar value of the anomaly.

      struct Impact
        include JSON::Serializable

        # The maximum dollar value that's observed for an anomaly.

        @[JSON::Field(key: "MaxImpact")]
        getter max_impact : Float64

        # The cumulative dollar amount that was actually spent during the anomaly.

        @[JSON::Field(key: "TotalActualSpend")]
        getter total_actual_spend : Float64?

        # The cumulative dollar amount that was expected to be spent during the anomaly. It is calculated
        # using advanced machine learning models to determine the typical spending pattern based on historical
        # data for a customer.

        @[JSON::Field(key: "TotalExpectedSpend")]
        getter total_expected_spend : Float64?

        # The cumulative dollar difference between the total actual spend and total expected spend. It is
        # calculated as TotalActualSpend - TotalExpectedSpend .

        @[JSON::Field(key: "TotalImpact")]
        getter total_impact : Float64?

        # The cumulative percentage difference between the total actual spend and total expected spend. It is
        # calculated as (TotalImpact / TotalExpectedSpend) * 100 . When TotalExpectedSpend is zero, this field
        # is omitted. Expected spend can be zero in situations such as when you start to use a service for the
        # first time.

        @[JSON::Field(key: "TotalImpactPercentage")]
        getter total_impact_percentage : Float64?

        def initialize(
          @max_impact : Float64,
          @total_actual_spend : Float64? = nil,
          @total_expected_spend : Float64? = nil,
          @total_impact : Float64? = nil,
          @total_impact_percentage : Float64? = nil
        )
        end
      end

      # Details about the reservations that Amazon Web Services recommends that you purchase.

      struct InstanceDetails
        include JSON::Serializable

        # The Amazon EC2 reservations that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "EC2InstanceDetails")]
        getter ec2_instance_details : Types::EC2InstanceDetails?

        # The Amazon OpenSearch Service reservations that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "ESInstanceDetails")]
        getter es_instance_details : Types::ESInstanceDetails?

        # The ElastiCache reservations that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "ElastiCacheInstanceDetails")]
        getter elasti_cache_instance_details : Types::ElastiCacheInstanceDetails?

        # The MemoryDB reservations that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "MemoryDBInstanceDetails")]
        getter memory_db_instance_details : Types::MemoryDBInstanceDetails?

        # The Amazon RDS reservations that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "RDSInstanceDetails")]
        getter rds_instance_details : Types::RDSInstanceDetails?

        # The Amazon Redshift reservations that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "RedshiftInstanceDetails")]
        getter redshift_instance_details : Types::RedshiftInstanceDetails?

        def initialize(
          @ec2_instance_details : Types::EC2InstanceDetails? = nil,
          @es_instance_details : Types::ESInstanceDetails? = nil,
          @elasti_cache_instance_details : Types::ElastiCacheInstanceDetails? = nil,
          @memory_db_instance_details : Types::MemoryDBInstanceDetails? = nil,
          @rds_instance_details : Types::RDSInstanceDetails? = nil,
          @redshift_instance_details : Types::RedshiftInstanceDetails? = nil
        )
        end
      end

      # The pagination token is invalid. Try again without a pagination token.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You made too many calls in a short period of time. Try again later.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListCommitmentPurchaseAnalysesRequest
        include JSON::Serializable

        # The analysis IDs associated with the commitment purchase analyses.

        @[JSON::Field(key: "AnalysisIds")]
        getter analysis_ids : Array(String)?

        # The status of the analysis.

        @[JSON::Field(key: "AnalysisStatus")]
        getter analysis_status : String?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The number of analyses that you want returned in a single response object.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @analysis_ids : Array(String)? = nil,
          @analysis_status : String? = nil,
          @next_page_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListCommitmentPurchaseAnalysesResponse
        include JSON::Serializable

        # The list of analyses.

        @[JSON::Field(key: "AnalysisSummaryList")]
        getter analysis_summary_list : Array(Types::AnalysisSummary)?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @analysis_summary_list : Array(Types::AnalysisSummary)? = nil,
          @next_page_token : String? = nil
        )
        end
      end


      struct ListCostAllocationTagBackfillHistoryRequest
        include JSON::Serializable

        # The maximum number of objects that are returned for this request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCostAllocationTagBackfillHistoryResponse
        include JSON::Serializable

        # The list of historical cost allocation tag backfill requests.

        @[JSON::Field(key: "BackfillRequests")]
        getter backfill_requests : Array(Types::CostAllocationTagBackfillRequest)?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backfill_requests : Array(Types::CostAllocationTagBackfillRequest)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCostAllocationTagsRequest
        include JSON::Serializable

        # The maximum number of objects that are returned for this request. By default, the request returns
        # 100 results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status of cost allocation tag keys that are returned for this request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The list of cost allocation tag keys that are returned for this request.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        # The type of CostAllocationTag object that are returned for this request. The AWSGenerated type tags
        # are tags that Amazon Web Services defines and applies to support Amazon Web Services resources for
        # cost allocation purposes. The UserDefined type tags are tags that you define, create, and apply to
        # resources.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil,
          @tag_keys : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListCostAllocationTagsResponse
        include JSON::Serializable

        # A list of cost allocation tags that includes the detailed metadata for each one.

        @[JSON::Field(key: "CostAllocationTags")]
        getter cost_allocation_tags : Array(Types::CostAllocationTag)?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cost_allocation_tags : Array(Types::CostAllocationTag)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCostCategoryDefinitionsRequest
        include JSON::Serializable

        # The date when the cost category was effective.

        @[JSON::Field(key: "EffectiveOn")]
        getter effective_on : String?

        # The number of entries a paginated response contains.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter cost category definitions that are supported by given resource types based on the latest
        # version. If the filter is present, the result only includes Cost Categories that supports input
        # resource type. If the filter isn't provided, no filtering is applied. The valid values are
        # billing:rispgroupsharing and billing:billingview .

        @[JSON::Field(key: "SupportedResourceTypes")]
        getter supported_resource_types : Array(String)?

        def initialize(
          @effective_on : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @supported_resource_types : Array(String)? = nil
        )
        end
      end


      struct ListCostCategoryDefinitionsResponse
        include JSON::Serializable

        # A reference to a cost category that contains enough information to identify the Cost Category.

        @[JSON::Field(key: "CostCategoryReferences")]
        getter cost_category_references : Array(Types::CostCategoryReference)?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cost_category_references : Array(Types::CostCategoryReference)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCostCategoryResourceAssociationsRequest
        include JSON::Serializable

        # The unique identifier for your cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String?

        # The number of entries a paginated response contains.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cost_category_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCostCategoryResourceAssociationsResponse
        include JSON::Serializable

        # A reference to a cost category association that contains information on an associated resource.

        @[JSON::Field(key: "CostCategoryResourceAssociations")]
        getter cost_category_resource_associations : Array(Types::CostCategoryResourceAssociation)?

        # The token to retrieve the next set of results. Amazon Web Services provides the token when the
        # response from a previous call has more results than the maximum page size.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cost_category_resource_associations : Array(Types::CostCategoryResourceAssociation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSavingsPlansPurchaseRecommendationGenerationRequest
        include JSON::Serializable

        # The status of the recommendation generation.

        @[JSON::Field(key: "GenerationStatus")]
        getter generation_status : String?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        # The number of recommendations that you want returned in a single response object.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The IDs for each specific recommendation.

        @[JSON::Field(key: "RecommendationIds")]
        getter recommendation_ids : Array(String)?

        def initialize(
          @generation_status : String? = nil,
          @next_page_token : String? = nil,
          @page_size : Int32? = nil,
          @recommendation_ids : Array(String)? = nil
        )
        end
      end


      struct ListSavingsPlansPurchaseRecommendationGenerationResponse
        include JSON::Serializable

        # The list of historical recommendation generations.

        @[JSON::Field(key: "GenerationSummaryList")]
        getter generation_summary_list : Array(Types::GenerationSummary)?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextPageToken")]
        getter next_page_token : String?

        def initialize(
          @generation_summary_list : Array(Types::GenerationSummary)? = nil,
          @next_page_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. For a list of supported resources, see ResourceTag .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tag key value pairs that are associated with the resource.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end

      # Details about the MemoryDB reservations that Amazon Web Services recommends that you purchase.

      struct MemoryDBInstanceDetails
        include JSON::Serializable

        # Determines whether the recommendation is for a current generation instance.

        @[JSON::Field(key: "CurrentGeneration")]
        getter current_generation : Bool?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "Family")]
        getter family : String?

        # The node type of the recommended reservation.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The Amazon Web Services Region of the recommended reservation.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Determines whether the recommended reservation is size flexible.

        @[JSON::Field(key: "SizeFlexEligible")]
        getter size_flex_eligible : Bool?

        def initialize(
          @current_generation : Bool? = nil,
          @family : String? = nil,
          @node_type : String? = nil,
          @region : String? = nil,
          @size_flex_eligible : Bool? = nil
        )
        end
      end

      # The aggregated value for a metric.

      struct MetricValue
        include JSON::Serializable

        # The actual number that represents the metric.

        @[JSON::Field(key: "Amount")]
        getter amount : String?

        # The unit that the metric is given in.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @amount : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # Details for the modification recommendation.

      struct ModifyRecommendationDetail
        include JSON::Serializable

        # Determines whether this instance type is the Amazon Web Services default recommendation.

        @[JSON::Field(key: "TargetInstances")]
        getter target_instances : Array(Types::TargetInstance)?

        def initialize(
          @target_instances : Array(Types::TargetInstance)? = nil
        )
        end
      end

      # The network field that contains a list of network metrics that are associated with the current
      # instance.

      struct NetworkResourceUtilization
        include JSON::Serializable

        # The network inbound throughput utilization measured in Bytes per second (Bps).

        @[JSON::Field(key: "NetworkInBytesPerSecond")]
        getter network_in_bytes_per_second : String?

        # The network outbound throughput utilization measured in Bytes per second (Bps).

        @[JSON::Field(key: "NetworkOutBytesPerSecond")]
        getter network_out_bytes_per_second : String?

        # The network inbound packets that are measured in packets per second.

        @[JSON::Field(key: "NetworkPacketsInPerSecond")]
        getter network_packets_in_per_second : String?

        # The network outbound packets that are measured in packets per second.

        @[JSON::Field(key: "NetworkPacketsOutPerSecond")]
        getter network_packets_out_per_second : String?

        def initialize(
          @network_in_bytes_per_second : String? = nil,
          @network_out_bytes_per_second : String? = nil,
          @network_packets_in_per_second : String? = nil,
          @network_packets_out_per_second : String? = nil
        )
        end
      end


      struct ProvideAnomalyFeedbackRequest
        include JSON::Serializable

        # A cost anomaly ID.

        @[JSON::Field(key: "AnomalyId")]
        getter anomaly_id : String

        # Describes whether the cost anomaly was a planned activity or you considered it an anomaly.

        @[JSON::Field(key: "Feedback")]
        getter feedback : String

        def initialize(
          @anomaly_id : String,
          @feedback : String
        )
        end
      end


      struct ProvideAnomalyFeedbackResponse
        include JSON::Serializable

        # The ID of the modified cost anomaly.

        @[JSON::Field(key: "AnomalyId")]
        getter anomaly_id : String

        def initialize(
          @anomaly_id : String
        )
        end
      end

      # Details about the Amazon RDS reservations that Amazon Web Services recommends that you purchase.

      struct RDSInstanceDetails
        include JSON::Serializable

        # Determines whether the recommendation is for a current-generation instance.

        @[JSON::Field(key: "CurrentGeneration")]
        getter current_generation : Bool?

        # The database edition that the recommended reservation supports.

        @[JSON::Field(key: "DatabaseEdition")]
        getter database_edition : String?

        # The database engine that the recommended reservation supports.

        @[JSON::Field(key: "DatabaseEngine")]
        getter database_engine : String?

        # Determines whether the recommendation is for a reservation for RDS Custom.

        @[JSON::Field(key: "DeploymentModel")]
        getter deployment_model : String?

        # Determines whether the recommendation is for a reservation in a single Availability Zone or a
        # reservation with a backup in a second Availability Zone.

        @[JSON::Field(key: "DeploymentOption")]
        getter deployment_option : String?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "Family")]
        getter family : String?

        # The type of instance that Amazon Web Services recommends.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The license model that the recommended reservation supports.

        @[JSON::Field(key: "LicenseModel")]
        getter license_model : String?

        # The Amazon Web Services Region of the recommended reservation.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Determines whether the recommended reservation is size flexible.

        @[JSON::Field(key: "SizeFlexEligible")]
        getter size_flex_eligible : Bool?

        def initialize(
          @current_generation : Bool? = nil,
          @database_edition : String? = nil,
          @database_engine : String? = nil,
          @deployment_model : String? = nil,
          @deployment_option : String? = nil,
          @family : String? = nil,
          @instance_type : String? = nil,
          @license_model : String? = nil,
          @region : String? = nil,
          @size_flex_eligible : Bool? = nil
        )
        end
      end

      # The details and metrics for the given recommendation.

      struct RecommendationDetailData
        include JSON::Serializable

        # The AccountID that the recommendation is generated for.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The account scope that you want your recommendations for. Amazon Web Services calculates
        # recommendations including the management account and member accounts if the value is set to PAYER.
        # If the value is LINKED, recommendations are calculated for individual member accounts only.

        @[JSON::Field(key: "AccountScope")]
        getter account_scope : String?

        # The currency code that Amazon Web Services used to generate the recommendation and present potential
        # savings.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The average value of hourly coverage over the lookback period.

        @[JSON::Field(key: "CurrentAverageCoverage")]
        getter current_average_coverage : String?

        # The average value of hourly On-Demand spend over the lookback period of the applicable usage type.

        @[JSON::Field(key: "CurrentAverageHourlyOnDemandSpend")]
        getter current_average_hourly_on_demand_spend : String?

        # The highest value of hourly On-Demand spend over the lookback period of the applicable usage type.

        @[JSON::Field(key: "CurrentMaximumHourlyOnDemandSpend")]
        getter current_maximum_hourly_on_demand_spend : String?

        # The lowest value of hourly On-Demand spend over the lookback period of the applicable usage type.

        @[JSON::Field(key: "CurrentMinimumHourlyOnDemandSpend")]
        getter current_minimum_hourly_on_demand_spend : String?

        # The estimated coverage of the recommended Savings Plan.

        @[JSON::Field(key: "EstimatedAverageCoverage")]
        getter estimated_average_coverage : String?

        # The estimated utilization of the recommended Savings Plan.

        @[JSON::Field(key: "EstimatedAverageUtilization")]
        getter estimated_average_utilization : String?

        # The estimated monthly savings amount based on the recommended Savings Plan.

        @[JSON::Field(key: "EstimatedMonthlySavingsAmount")]
        getter estimated_monthly_savings_amount : String?

        # The remaining On-Demand cost estimated to not be covered by the recommended Savings Plan, over the
        # length of the lookback period.

        @[JSON::Field(key: "EstimatedOnDemandCost")]
        getter estimated_on_demand_cost : String?

        # The estimated On-Demand costs you expect with no additional commitment, based on your usage of the
        # selected time period and the Savings Plan you own.

        @[JSON::Field(key: "EstimatedOnDemandCostWithCurrentCommitment")]
        getter estimated_on_demand_cost_with_current_commitment : String?

        # The estimated return on investment that's based on the recommended Savings Plan that you purchased.
        # This is calculated as estimatedSavingsAmount/estimatedSPCost*100.

        @[JSON::Field(key: "EstimatedROI")]
        getter estimated_roi : String?

        # The cost of the recommended Savings Plan over the length of the lookback period.

        @[JSON::Field(key: "EstimatedSPCost")]
        getter estimated_sp_cost : String?

        # The estimated savings amount that's based on the recommended Savings Plan over the length of the
        # lookback period.

        @[JSON::Field(key: "EstimatedSavingsAmount")]
        getter estimated_savings_amount : String?

        # The estimated savings percentage relative to the total cost of applicable On-Demand usage over the
        # lookback period.

        @[JSON::Field(key: "EstimatedSavingsPercentage")]
        getter estimated_savings_percentage : String?

        # The existing hourly commitment for the Savings Plan type.

        @[JSON::Field(key: "ExistingHourlyCommitment")]
        getter existing_hourly_commitment : String?


        @[JSON::Field(key: "GenerationTimestamp")]
        getter generation_timestamp : String?

        # The recommended hourly commitment level for the Savings Plan type and the configuration that's based
        # on the usage during the lookback period.

        @[JSON::Field(key: "HourlyCommitmentToPurchase")]
        getter hourly_commitment_to_purchase : String?

        # The instance family of the recommended Savings Plan.

        @[JSON::Field(key: "InstanceFamily")]
        getter instance_family : String?


        @[JSON::Field(key: "LatestUsageTimestamp")]
        getter latest_usage_timestamp : String?

        # How many days of previous usage that Amazon Web Services considers when making this recommendation.

        @[JSON::Field(key: "LookbackPeriodInDays")]
        getter lookback_period_in_days : String?

        # The related hourly cost, coverage, and utilization metrics over the lookback period.

        @[JSON::Field(key: "MetricsOverLookbackPeriod")]
        getter metrics_over_lookback_period : Array(Types::RecommendationDetailHourlyMetrics)?

        # The unique ID that's used to distinguish Savings Plans from one another.

        @[JSON::Field(key: "OfferingId")]
        getter offering_id : String?

        # The payment option for the commitment (for example, All Upfront or No Upfront).

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # The region the recommendation is generated for.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The requested Savings Plan recommendation type.

        @[JSON::Field(key: "SavingsPlansType")]
        getter savings_plans_type : String?

        # The term of the commitment in years.

        @[JSON::Field(key: "TermInYears")]
        getter term_in_years : String?

        # The upfront cost of the recommended Savings Plan, based on the selected payment option.

        @[JSON::Field(key: "UpfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_id : String? = nil,
          @account_scope : String? = nil,
          @currency_code : String? = nil,
          @current_average_coverage : String? = nil,
          @current_average_hourly_on_demand_spend : String? = nil,
          @current_maximum_hourly_on_demand_spend : String? = nil,
          @current_minimum_hourly_on_demand_spend : String? = nil,
          @estimated_average_coverage : String? = nil,
          @estimated_average_utilization : String? = nil,
          @estimated_monthly_savings_amount : String? = nil,
          @estimated_on_demand_cost : String? = nil,
          @estimated_on_demand_cost_with_current_commitment : String? = nil,
          @estimated_roi : String? = nil,
          @estimated_sp_cost : String? = nil,
          @estimated_savings_amount : String? = nil,
          @estimated_savings_percentage : String? = nil,
          @existing_hourly_commitment : String? = nil,
          @generation_timestamp : String? = nil,
          @hourly_commitment_to_purchase : String? = nil,
          @instance_family : String? = nil,
          @latest_usage_timestamp : String? = nil,
          @lookback_period_in_days : String? = nil,
          @metrics_over_lookback_period : Array(Types::RecommendationDetailHourlyMetrics)? = nil,
          @offering_id : String? = nil,
          @payment_option : String? = nil,
          @region : String? = nil,
          @savings_plans_type : String? = nil,
          @term_in_years : String? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Contains the hourly metrics for the given recommendation over the lookback period.

      struct RecommendationDetailHourlyMetrics
        include JSON::Serializable

        # The current amount of Savings Plans eligible usage that the Savings Plan covered.

        @[JSON::Field(key: "CurrentCoverage")]
        getter current_coverage : String?

        # The estimated coverage amount based on the recommended Savings Plan.

        @[JSON::Field(key: "EstimatedCoverage")]
        getter estimated_coverage : String?

        # The estimated utilization for the recommended Savings Plan.

        @[JSON::Field(key: "EstimatedNewCommitmentUtilization")]
        getter estimated_new_commitment_utilization : String?

        # The remaining On-Demand cost estimated to not be covered by the recommended Savings Plan, over the
        # length of the lookback period.

        @[JSON::Field(key: "EstimatedOnDemandCost")]
        getter estimated_on_demand_cost : String?


        @[JSON::Field(key: "StartTime")]
        getter start_time : String?

        def initialize(
          @current_coverage : String? = nil,
          @estimated_coverage : String? = nil,
          @estimated_new_commitment_utilization : String? = nil,
          @estimated_on_demand_cost : String? = nil,
          @start_time : String? = nil
        )
        end
      end

      # Details about the Amazon Redshift reservations that Amazon Web Services recommends that you
      # purchase.

      struct RedshiftInstanceDetails
        include JSON::Serializable

        # Determines whether the recommendation is for a current-generation instance.

        @[JSON::Field(key: "CurrentGeneration")]
        getter current_generation : Bool?

        # The instance family of the recommended reservation.

        @[JSON::Field(key: "Family")]
        getter family : String?

        # The type of node that Amazon Web Services recommends.

        @[JSON::Field(key: "NodeType")]
        getter node_type : String?

        # The Amazon Web Services Region of the recommended reservation.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Determines whether the recommended reservation is size flexible.

        @[JSON::Field(key: "SizeFlexEligible")]
        getter size_flex_eligible : Bool?

        def initialize(
          @current_generation : Bool? = nil,
          @family : String? = nil,
          @node_type : String? = nil,
          @region : String? = nil,
          @size_flex_eligible : Bool? = nil
        )
        end
      end

      # Your request parameters changed between pages. Try again with the old parameters or without a
      # pagination token.

      struct RequestChangedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The aggregated numbers for your reservation usage.

      struct ReservationAggregates
        include JSON::Serializable

        # The monthly cost of your reservation. It's amortized over the reservation period.

        @[JSON::Field(key: "AmortizedRecurringFee")]
        getter amortized_recurring_fee : String?

        # The upfront cost of your reservation. It's amortized over the reservation period.

        @[JSON::Field(key: "AmortizedUpfrontFee")]
        getter amortized_upfront_fee : String?

        # How much you saved due to purchasing and utilizing reservation. Amazon Web Services calculates this
        # by subtracting TotalAmortizedFee from OnDemandCostOfRIHoursUsed .

        @[JSON::Field(key: "NetRISavings")]
        getter net_ri_savings : String?

        # How much your reservation costs if charged On-Demand rates.

        @[JSON::Field(key: "OnDemandCostOfRIHoursUsed")]
        getter on_demand_cost_of_ri_hours_used : String?

        # How many reservation hours that you purchased.

        @[JSON::Field(key: "PurchasedHours")]
        getter purchased_hours : String?

        # The number of Amazon EC2 reservation hours that you purchased. It's converted to normalized units.
        # Normalized units are available only for Amazon EC2 usage after November 11, 2017.

        @[JSON::Field(key: "PurchasedUnits")]
        getter purchased_units : String?

        # The cost of unused hours for your reservation.

        @[JSON::Field(key: "RICostForUnusedHours")]
        getter ri_cost_for_unused_hours : String?

        # The realized savings because of purchasing and using a reservation.

        @[JSON::Field(key: "RealizedSavings")]
        getter realized_savings : String?

        # The total number of reservation hours that you used.

        @[JSON::Field(key: "TotalActualHours")]
        getter total_actual_hours : String?

        # The total number of Amazon EC2 reservation hours that you used. It's converted to normalized units.
        # Normalized units are available only for Amazon EC2 usage after November 11, 2017.

        @[JSON::Field(key: "TotalActualUnits")]
        getter total_actual_units : String?

        # The total cost of your reservation. It's amortized over the reservation period.

        @[JSON::Field(key: "TotalAmortizedFee")]
        getter total_amortized_fee : String?

        # How much you might save if you use your entire reservation.

        @[JSON::Field(key: "TotalPotentialRISavings")]
        getter total_potential_ri_savings : String?

        # The unrealized savings because of purchasing and using a reservation.

        @[JSON::Field(key: "UnrealizedSavings")]
        getter unrealized_savings : String?

        # The number of reservation hours that you didn't use.

        @[JSON::Field(key: "UnusedHours")]
        getter unused_hours : String?

        # The number of Amazon EC2 reservation hours that you didn't use. It's converted to normalized units.
        # Normalized units are available only for Amazon EC2 usage after November 11, 2017.

        @[JSON::Field(key: "UnusedUnits")]
        getter unused_units : String?

        # The percentage of reservation time that you used.

        @[JSON::Field(key: "UtilizationPercentage")]
        getter utilization_percentage : String?

        # The percentage of Amazon EC2 reservation time that you used. It's converted to normalized units.
        # Normalized units are available only for Amazon EC2 usage after November 11, 2017.

        @[JSON::Field(key: "UtilizationPercentageInUnits")]
        getter utilization_percentage_in_units : String?

        def initialize(
          @amortized_recurring_fee : String? = nil,
          @amortized_upfront_fee : String? = nil,
          @net_ri_savings : String? = nil,
          @on_demand_cost_of_ri_hours_used : String? = nil,
          @purchased_hours : String? = nil,
          @purchased_units : String? = nil,
          @ri_cost_for_unused_hours : String? = nil,
          @realized_savings : String? = nil,
          @total_actual_hours : String? = nil,
          @total_actual_units : String? = nil,
          @total_amortized_fee : String? = nil,
          @total_potential_ri_savings : String? = nil,
          @unrealized_savings : String? = nil,
          @unused_hours : String? = nil,
          @unused_units : String? = nil,
          @utilization_percentage : String? = nil,
          @utilization_percentage_in_units : String? = nil
        )
        end
      end

      # A group of reservations that share a set of attributes.

      struct ReservationCoverageGroup
        include JSON::Serializable

        # The attributes for this group of reservations.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # How much instance usage this group of reservations covered.

        @[JSON::Field(key: "Coverage")]
        getter coverage : Types::Coverage?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @coverage : Types::Coverage? = nil
        )
        end
      end

      # A specific reservation that Amazon Web Services recommends for purchase.

      struct ReservationPurchaseRecommendation
        include JSON::Serializable

        # The account scope that Amazon Web Services recommends that you purchase this instance for. For
        # example, you can purchase this reservation for an entire organization in Amazon Web Services
        # Organizations.

        @[JSON::Field(key: "AccountScope")]
        getter account_scope : String?

        # How many days of previous usage that Amazon Web Services considers when making this recommendation.

        @[JSON::Field(key: "LookbackPeriodInDays")]
        getter lookback_period_in_days : String?

        # The payment option for the reservation (for example, AllUpfront or NoUpfront ).

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # Details about the recommended purchases.

        @[JSON::Field(key: "RecommendationDetails")]
        getter recommendation_details : Array(Types::ReservationPurchaseRecommendationDetail)?

        # A summary about the recommended purchase.

        @[JSON::Field(key: "RecommendationSummary")]
        getter recommendation_summary : Types::ReservationPurchaseRecommendationSummary?

        # Hardware specifications for the service that you want recommendations for.

        @[JSON::Field(key: "ServiceSpecification")]
        getter service_specification : Types::ServiceSpecification?

        # The term of the reservation that you want recommendations for, in years.

        @[JSON::Field(key: "TermInYears")]
        getter term_in_years : String?

        def initialize(
          @account_scope : String? = nil,
          @lookback_period_in_days : String? = nil,
          @payment_option : String? = nil,
          @recommendation_details : Array(Types::ReservationPurchaseRecommendationDetail)? = nil,
          @recommendation_summary : Types::ReservationPurchaseRecommendationSummary? = nil,
          @service_specification : Types::ServiceSpecification? = nil,
          @term_in_years : String? = nil
        )
        end
      end

      # Details about your recommended reservation purchase.

      struct ReservationPurchaseRecommendationDetail
        include JSON::Serializable

        # The account that this Reserved Instance (RI) recommendation is for.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The average number of normalized units that you used in an hour during the historical period. Amazon
        # Web Services uses this to calculate your recommended reservation purchases.

        @[JSON::Field(key: "AverageNormalizedUnitsUsedPerHour")]
        getter average_normalized_units_used_per_hour : String?

        # The average number of provisioned capacity units that you used in an hour during the historical
        # period. Amazon Web Services uses this to calculate your recommended reservation purchases.

        @[JSON::Field(key: "AverageNumberOfCapacityUnitsUsedPerHour")]
        getter average_number_of_capacity_units_used_per_hour : String?

        # The average number of instances that you used in an hour during the historical period. Amazon Web
        # Services uses this to calculate your recommended reservation purchases.

        @[JSON::Field(key: "AverageNumberOfInstancesUsedPerHour")]
        getter average_number_of_instances_used_per_hour : String?

        # The average utilization of your instances. Amazon Web Services uses this to calculate your
        # recommended reservation purchases.

        @[JSON::Field(key: "AverageUtilization")]
        getter average_utilization : String?

        # The currency code that Amazon Web Services used to calculate the costs for this instance.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # How long Amazon Web Services estimates that it takes for this instance to start saving you money, in
        # months.

        @[JSON::Field(key: "EstimatedBreakEvenInMonths")]
        getter estimated_break_even_in_months : String?

        # How much Amazon Web Services estimates that you spend on On-Demand Instances in a month.

        @[JSON::Field(key: "EstimatedMonthlyOnDemandCost")]
        getter estimated_monthly_on_demand_cost : String?

        # How much Amazon Web Services estimates that this specific recommendation might save you in a month.

        @[JSON::Field(key: "EstimatedMonthlySavingsAmount")]
        getter estimated_monthly_savings_amount : String?

        # How much Amazon Web Services estimates that this specific recommendation might save you in a month,
        # as a percentage of your overall costs.

        @[JSON::Field(key: "EstimatedMonthlySavingsPercentage")]
        getter estimated_monthly_savings_percentage : String?

        # How much Amazon Web Services estimates that you might spend for all usage during the specified
        # historical period if you had a reservation.

        @[JSON::Field(key: "EstimatedReservationCostForLookbackPeriod")]
        getter estimated_reservation_cost_for_lookback_period : String?

        # Details about the reservations that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "InstanceDetails")]
        getter instance_details : Types::InstanceDetails?

        # The maximum number of normalized units that you used in an hour during the historical period. Amazon
        # Web Services uses this to calculate your recommended reservation purchases.

        @[JSON::Field(key: "MaximumNormalizedUnitsUsedPerHour")]
        getter maximum_normalized_units_used_per_hour : String?

        # The maximum number of provisioned capacity units that you used in an hour during the historical
        # period. Amazon Web Services uses this to calculate your recommended reservation purchases.

        @[JSON::Field(key: "MaximumNumberOfCapacityUnitsUsedPerHour")]
        getter maximum_number_of_capacity_units_used_per_hour : String?

        # The maximum number of instances that you used in an hour during the historical period. Amazon Web
        # Services uses this to calculate your recommended reservation purchases.

        @[JSON::Field(key: "MaximumNumberOfInstancesUsedPerHour")]
        getter maximum_number_of_instances_used_per_hour : String?

        # The minimum number of normalized units that you used in an hour during the historical period. Amazon
        # Web Services uses this to calculate your recommended reservation purchases.

        @[JSON::Field(key: "MinimumNormalizedUnitsUsedPerHour")]
        getter minimum_normalized_units_used_per_hour : String?

        # The minimum number of provisioned capacity units that you used in an hour during the historical
        # period. Amazon Web Services uses this to calculate your recommended reservation purchases.

        @[JSON::Field(key: "MinimumNumberOfCapacityUnitsUsedPerHour")]
        getter minimum_number_of_capacity_units_used_per_hour : String?

        # The minimum number of instances that you used in an hour during the historical period. Amazon Web
        # Services uses this to calculate your recommended reservation purchases.

        @[JSON::Field(key: "MinimumNumberOfInstancesUsedPerHour")]
        getter minimum_number_of_instances_used_per_hour : String?

        # The number of normalized units that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "RecommendedNormalizedUnitsToPurchase")]
        getter recommended_normalized_units_to_purchase : String?

        # The number of reserved capacity units that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "RecommendedNumberOfCapacityUnitsToPurchase")]
        getter recommended_number_of_capacity_units_to_purchase : String?

        # The number of instances that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "RecommendedNumberOfInstancesToPurchase")]
        getter recommended_number_of_instances_to_purchase : String?

        # How much purchasing this instance costs you on a monthly basis.

        @[JSON::Field(key: "RecurringStandardMonthlyCost")]
        getter recurring_standard_monthly_cost : String?

        # Details about the reservations that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "ReservedCapacityDetails")]
        getter reserved_capacity_details : Types::ReservedCapacityDetails?

        # How much purchasing this instance costs you upfront.

        @[JSON::Field(key: "UpfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_id : String? = nil,
          @average_normalized_units_used_per_hour : String? = nil,
          @average_number_of_capacity_units_used_per_hour : String? = nil,
          @average_number_of_instances_used_per_hour : String? = nil,
          @average_utilization : String? = nil,
          @currency_code : String? = nil,
          @estimated_break_even_in_months : String? = nil,
          @estimated_monthly_on_demand_cost : String? = nil,
          @estimated_monthly_savings_amount : String? = nil,
          @estimated_monthly_savings_percentage : String? = nil,
          @estimated_reservation_cost_for_lookback_period : String? = nil,
          @instance_details : Types::InstanceDetails? = nil,
          @maximum_normalized_units_used_per_hour : String? = nil,
          @maximum_number_of_capacity_units_used_per_hour : String? = nil,
          @maximum_number_of_instances_used_per_hour : String? = nil,
          @minimum_normalized_units_used_per_hour : String? = nil,
          @minimum_number_of_capacity_units_used_per_hour : String? = nil,
          @minimum_number_of_instances_used_per_hour : String? = nil,
          @recommended_normalized_units_to_purchase : String? = nil,
          @recommended_number_of_capacity_units_to_purchase : String? = nil,
          @recommended_number_of_instances_to_purchase : String? = nil,
          @recurring_standard_monthly_cost : String? = nil,
          @reserved_capacity_details : Types::ReservedCapacityDetails? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Information about a recommendation, such as the timestamp for when Amazon Web Services made a
      # specific recommendation.

      struct ReservationPurchaseRecommendationMetadata
        include JSON::Serializable

        # Additional metadata that might be applicable to the recommendation.

        @[JSON::Field(key: "AdditionalMetadata")]
        getter additional_metadata : String?

        # The timestamp for when Amazon Web Services made the recommendation.

        @[JSON::Field(key: "GenerationTimestamp")]
        getter generation_timestamp : String?

        # The ID for the recommendation.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String?

        def initialize(
          @additional_metadata : String? = nil,
          @generation_timestamp : String? = nil,
          @recommendation_id : String? = nil
        )
        end
      end

      # A summary about this recommendation, such as the currency code, the amount that Amazon Web Services
      # estimates that you could save, and the total amount of reservation to purchase.

      struct ReservationPurchaseRecommendationSummary
        include JSON::Serializable

        # The currency code used for this recommendation.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The total amount that Amazon Web Services estimates that this recommendation could save you in a
        # month.

        @[JSON::Field(key: "TotalEstimatedMonthlySavingsAmount")]
        getter total_estimated_monthly_savings_amount : String?

        # The total amount that Amazon Web Services estimates that this recommendation could save you in a
        # month, as a percentage of your costs.

        @[JSON::Field(key: "TotalEstimatedMonthlySavingsPercentage")]
        getter total_estimated_monthly_savings_percentage : String?

        def initialize(
          @currency_code : String? = nil,
          @total_estimated_monthly_savings_amount : String? = nil,
          @total_estimated_monthly_savings_percentage : String? = nil
        )
        end
      end

      # A group of reservations that share a set of attributes.

      struct ReservationUtilizationGroup
        include JSON::Serializable

        # The attributes for this group of reservations.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The key for a specific reservation attribute.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # How much you used this group of reservations.

        @[JSON::Field(key: "Utilization")]
        getter utilization : Types::ReservationAggregates?

        # The value of a specific reservation attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @key : String? = nil,
          @utilization : Types::ReservationAggregates? = nil,
          @value : String? = nil
        )
        end
      end

      # Details about the reservations that Amazon Web Services recommends that you purchase.

      struct ReservedCapacityDetails
        include JSON::Serializable

        # The DynamoDB reservations that Amazon Web Services recommends that you purchase.

        @[JSON::Field(key: "DynamoDBCapacityDetails")]
        getter dynamo_db_capacity_details : Types::DynamoDBCapacityDetails?

        def initialize(
          @dynamo_db_capacity_details : Types::DynamoDBCapacityDetails? = nil
        )
        end
      end

      # Details for the resource.

      struct ResourceDetails
        include JSON::Serializable

        # Details for the Amazon EC2 resource.

        @[JSON::Field(key: "EC2ResourceDetails")]
        getter ec2_resource_details : Types::EC2ResourceDetails?

        def initialize(
          @ec2_resource_details : Types::EC2ResourceDetails? = nil
        )
        end
      end

      # The specified ARN in the request doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The tag structure that contains a tag key and value. Tagging is supported only for the following
      # Cost Explorer resource types: AnomalyMonitor , AnomalySubscription , CostCategory .

      struct ResourceTag
        include JSON::Serializable

        # The key that's associated with the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value that's associated with the tag.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Resource utilization of current resource.

      struct ResourceUtilization
        include JSON::Serializable

        # The utilization of current Amazon EC2 instance.

        @[JSON::Field(key: "EC2ResourceUtilization")]
        getter ec2_resource_utilization : Types::EC2ResourceUtilization?

        def initialize(
          @ec2_resource_utilization : Types::EC2ResourceUtilization? = nil
        )
        end
      end

      # The result that's associated with a time period.

      struct ResultByTime
        include JSON::Serializable

        # Determines whether the result is estimated.

        @[JSON::Field(key: "Estimated")]
        getter estimated : Bool?

        # The groups that this time period includes.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::Group)?

        # The time period that the result covers.

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval?

        # The total amount of cost or usage accrued during the time period.

        @[JSON::Field(key: "Total")]
        getter total : Hash(String, Types::MetricValue)?

        def initialize(
          @estimated : Bool? = nil,
          @groups : Array(Types::Group)? = nil,
          @time_period : Types::DateInterval? = nil,
          @total : Hash(String, Types::MetricValue)? = nil
        )
        end
      end

      # Recommendations to rightsize resources.

      struct RightsizingRecommendation
        include JSON::Serializable

        # The account that this recommendation is for.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Context regarding the current instance.

        @[JSON::Field(key: "CurrentInstance")]
        getter current_instance : Types::CurrentInstance?

        # The list of possible reasons why the recommendation is generated, such as under- or over-utilization
        # of specific metrics (for example, CPU, Memory, Network).

        @[JSON::Field(key: "FindingReasonCodes")]
        getter finding_reason_codes : Array(String)?

        # The details for the modification recommendations.

        @[JSON::Field(key: "ModifyRecommendationDetail")]
        getter modify_recommendation_detail : Types::ModifyRecommendationDetail?

        # A recommendation to either terminate or modify the resource.

        @[JSON::Field(key: "RightsizingType")]
        getter rightsizing_type : String?

        # The details for termination recommendations.

        @[JSON::Field(key: "TerminateRecommendationDetail")]
        getter terminate_recommendation_detail : Types::TerminateRecommendationDetail?

        def initialize(
          @account_id : String? = nil,
          @current_instance : Types::CurrentInstance? = nil,
          @finding_reason_codes : Array(String)? = nil,
          @modify_recommendation_detail : Types::ModifyRecommendationDetail? = nil,
          @rightsizing_type : String? = nil,
          @terminate_recommendation_detail : Types::TerminateRecommendationDetail? = nil
        )
        end
      end

      # You can use RightsizingRecommendationConfiguration to customize recommendations across two
      # attributes. You can choose to view recommendations for instances within the same instance families
      # or across different instance families. You can also choose to view your estimated savings that are
      # associated with recommendations with consideration of existing Savings Plans or Reserved Instance
      # (RI) benefits, or neither.

      struct RightsizingRecommendationConfiguration
        include JSON::Serializable

        # The option to consider RI or Savings Plans discount benefits in your savings calculation. The
        # default value is TRUE .

        @[JSON::Field(key: "BenefitsConsidered")]
        getter benefits_considered : Bool

        # The option to see recommendations within the same instance family or recommendations for instances
        # across other families. The default value is SAME_INSTANCE_FAMILY .

        @[JSON::Field(key: "RecommendationTarget")]
        getter recommendation_target : String

        def initialize(
          @benefits_considered : Bool,
          @recommendation_target : String
        )
        end
      end

      # Metadata for a recommendation set.

      struct RightsizingRecommendationMetadata
        include JSON::Serializable

        # Additional metadata that might be applicable to the recommendation.

        @[JSON::Field(key: "AdditionalMetadata")]
        getter additional_metadata : String?

        # The timestamp for when Amazon Web Services made the recommendation.

        @[JSON::Field(key: "GenerationTimestamp")]
        getter generation_timestamp : String?

        # The number of days of previous usage that Amazon Web Services considers when making the
        # recommendation.

        @[JSON::Field(key: "LookbackPeriodInDays")]
        getter lookback_period_in_days : String?

        # The ID for the recommendation.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String?

        def initialize(
          @additional_metadata : String? = nil,
          @generation_timestamp : String? = nil,
          @lookback_period_in_days : String? = nil,
          @recommendation_id : String? = nil
        )
        end
      end

      # The summary of rightsizing recommendations

      struct RightsizingRecommendationSummary
        include JSON::Serializable

        # The estimated total savings resulting from modifications, on a monthly basis.

        @[JSON::Field(key: "EstimatedTotalMonthlySavingsAmount")]
        getter estimated_total_monthly_savings_amount : String?

        # The currency code that Amazon Web Services used to calculate the savings.

        @[JSON::Field(key: "SavingsCurrencyCode")]
        getter savings_currency_code : String?

        # The savings percentage based on the recommended modifications. It's relative to the total On-Demand
        # costs that are associated with these instances.

        @[JSON::Field(key: "SavingsPercentage")]
        getter savings_percentage : String?

        # The total number of instance recommendations.

        @[JSON::Field(key: "TotalRecommendationCount")]
        getter total_recommendation_count : String?

        def initialize(
          @estimated_total_monthly_savings_amount : String? = nil,
          @savings_currency_code : String? = nil,
          @savings_percentage : String? = nil,
          @total_recommendation_count : String? = nil
        )
        end
      end

      # The combination of Amazon Web Services service, linked account, linked account name, Region, and
      # usage type where a cost anomaly is observed, along with the dollar and percentage amount of the
      # anomaly impact. The linked account name will only be available when the account name can be
      # identified.

      struct RootCause
        include JSON::Serializable

        # The dollar impact for the root cause.

        @[JSON::Field(key: "Impact")]
        getter impact : Types::RootCauseImpact?

        # The member account value that's associated with the cost anomaly.

        @[JSON::Field(key: "LinkedAccount")]
        getter linked_account : String?

        # The member account name value that's associated with the cost anomaly.

        @[JSON::Field(key: "LinkedAccountName")]
        getter linked_account_name : String?

        # The Amazon Web Services Region that's associated with the cost anomaly.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The Amazon Web Services service name that's associated with the cost anomaly.

        @[JSON::Field(key: "Service")]
        getter service : String?

        # The UsageType value that's associated with the cost anomaly.

        @[JSON::Field(key: "UsageType")]
        getter usage_type : String?

        def initialize(
          @impact : Types::RootCauseImpact? = nil,
          @linked_account : String? = nil,
          @linked_account_name : String? = nil,
          @region : String? = nil,
          @service : String? = nil,
          @usage_type : String? = nil
        )
        end
      end

      # The dollar value of the root cause.

      struct RootCauseImpact
        include JSON::Serializable

        # The dollar amount that this root cause contributed to the anomaly's TotalImpact.

        @[JSON::Field(key: "Contribution")]
        getter contribution : Float64

        def initialize(
          @contribution : Float64
        )
        end
      end

      # The Savings Plans commitment details.

      struct SavingsPlans
        include JSON::Serializable

        # The instance family of the Savings Plans commitment.

        @[JSON::Field(key: "InstanceFamily")]
        getter instance_family : String?

        # The unique ID that's used to distinguish Savings Plans commitments from one another.

        @[JSON::Field(key: "OfferingId")]
        getter offering_id : String?

        # The payment option for the Savings Plans commitment.

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # The Region associated with the Savings Plans commitment.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The Savings Plans commitment.

        @[JSON::Field(key: "SavingsPlansCommitment")]
        getter savings_plans_commitment : Float64?

        # The Savings Plans type.

        @[JSON::Field(key: "SavingsPlansType")]
        getter savings_plans_type : String?

        # The term that you want the Savings Plans commitment for.

        @[JSON::Field(key: "TermInYears")]
        getter term_in_years : String?

        def initialize(
          @instance_family : String? = nil,
          @offering_id : String? = nil,
          @payment_option : String? = nil,
          @region : String? = nil,
          @savings_plans_commitment : Float64? = nil,
          @savings_plans_type : String? = nil,
          @term_in_years : String? = nil
        )
        end
      end

      # The amortized amount of Savings Plans purchased in a specific account during a specific time
      # interval.

      struct SavingsPlansAmortizedCommitment
        include JSON::Serializable

        # The amortized amount of your Savings Plans commitment that was purchased with either a Partial or a
        # NoUpfront .

        @[JSON::Field(key: "AmortizedRecurringCommitment")]
        getter amortized_recurring_commitment : String?

        # The amortized amount of your Savings Plans commitment that was purchased with an Upfront or
        # PartialUpfront Savings Plans.

        @[JSON::Field(key: "AmortizedUpfrontCommitment")]
        getter amortized_upfront_commitment : String?

        # The total amortized amount of your Savings Plans commitment, regardless of your Savings Plans
        # purchase method.

        @[JSON::Field(key: "TotalAmortizedCommitment")]
        getter total_amortized_commitment : String?

        def initialize(
          @amortized_recurring_commitment : String? = nil,
          @amortized_upfront_commitment : String? = nil,
          @total_amortized_commitment : String? = nil
        )
        end
      end

      # The amount of Savings Plans eligible usage that's covered by Savings Plans. All calculations
      # consider the On-Demand equivalent of your Savings Plans usage.

      struct SavingsPlansCoverage
        include JSON::Serializable

        # The attribute that applies to a specific Dimension .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The amount of Savings Plans eligible usage that the Savings Plans covered.

        @[JSON::Field(key: "Coverage")]
        getter coverage : Types::SavingsPlansCoverageData?


        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @coverage : Types::SavingsPlansCoverageData? = nil,
          @time_period : Types::DateInterval? = nil
        )
        end
      end

      # Specific coverage percentage, On-Demand costs, and spend covered by Savings Plans, and total Savings
      # Plans costs for an account.

      struct SavingsPlansCoverageData
        include JSON::Serializable

        # The percentage of your existing Savings Plans covered usage, divided by all of your eligible Savings
        # Plans usage in an account (or set of accounts).

        @[JSON::Field(key: "CoveragePercentage")]
        getter coverage_percentage : String?

        # The cost of your Amazon Web Services usage at the public On-Demand rate.

        @[JSON::Field(key: "OnDemandCost")]
        getter on_demand_cost : String?

        # The amount of your Amazon Web Services usage that's covered by a Savings Plans.

        @[JSON::Field(key: "SpendCoveredBySavingsPlans")]
        getter spend_covered_by_savings_plans : String?

        # The total cost of your Amazon Web Services usage, regardless of your purchase option.

        @[JSON::Field(key: "TotalCost")]
        getter total_cost : String?

        def initialize(
          @coverage_percentage : String? = nil,
          @on_demand_cost : String? = nil,
          @spend_covered_by_savings_plans : String? = nil,
          @total_cost : String? = nil
        )
        end
      end

      # The attribute details on a specific Savings Plan.

      struct SavingsPlansDetails
        include JSON::Serializable

        # A group of instance types that Savings Plans applies to.

        @[JSON::Field(key: "InstanceFamily")]
        getter instance_family : String?

        # The unique ID that's used to distinguish Savings Plans from one another.

        @[JSON::Field(key: "OfferingId")]
        getter offering_id : String?

        # A collection of Amazon Web Services resources in a geographic area. Each Amazon Web Services Region
        # is isolated and independent of the other Regions.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @instance_family : String? = nil,
          @offering_id : String? = nil,
          @region : String? = nil
        )
        end
      end

      # The configuration for the Savings Plans purchase analysis.

      struct SavingsPlansPurchaseAnalysisConfiguration
        include JSON::Serializable

        # The type of analysis.

        @[JSON::Field(key: "AnalysisType")]
        getter analysis_type : String

        # The time period associated with the analysis.

        @[JSON::Field(key: "LookBackTimePeriod")]
        getter look_back_time_period : Types::DateInterval

        # Savings Plans to include in the analysis.

        @[JSON::Field(key: "SavingsPlansToAdd")]
        getter savings_plans_to_add : Array(Types::SavingsPlans)

        # The account that the analysis is for.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The account scope that you want your analysis for.

        @[JSON::Field(key: "AccountScope")]
        getter account_scope : String?

        # Savings Plans to exclude from the analysis.

        @[JSON::Field(key: "SavingsPlansToExclude")]
        getter savings_plans_to_exclude : Array(String)?

        def initialize(
          @analysis_type : String,
          @look_back_time_period : Types::DateInterval,
          @savings_plans_to_add : Array(Types::SavingsPlans),
          @account_id : String? = nil,
          @account_scope : String? = nil,
          @savings_plans_to_exclude : Array(String)? = nil
        )
        end
      end

      # Details about the Savings Plans purchase analysis.

      struct SavingsPlansPurchaseAnalysisDetails
        include JSON::Serializable

        # Additional metadata that might be applicable to the commitment.

        @[JSON::Field(key: "AdditionalMetadata")]
        getter additional_metadata : String?

        # The currency code used for the analysis.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The average value of hourly coverage over the lookback period.

        @[JSON::Field(key: "CurrentAverageCoverage")]
        getter current_average_coverage : String?

        # The average value of hourly On-Demand spend over the lookback period.

        @[JSON::Field(key: "CurrentAverageHourlyOnDemandSpend")]
        getter current_average_hourly_on_demand_spend : String?

        # The highest value of hourly On-Demand spend over the lookback period.

        @[JSON::Field(key: "CurrentMaximumHourlyOnDemandSpend")]
        getter current_maximum_hourly_on_demand_spend : String?

        # The lowest value of hourly On-Demand spend over the lookback period.

        @[JSON::Field(key: "CurrentMinimumHourlyOnDemandSpend")]
        getter current_minimum_hourly_on_demand_spend : String?

        # The current total On-Demand spend over the lookback period.

        @[JSON::Field(key: "CurrentOnDemandSpend")]
        getter current_on_demand_spend : String?

        # The estimated coverage of the Savings Plan.

        @[JSON::Field(key: "EstimatedAverageCoverage")]
        getter estimated_average_coverage : String?

        # The estimated utilization of the Savings Plan.

        @[JSON::Field(key: "EstimatedAverageUtilization")]
        getter estimated_average_utilization : String?

        # The estimated cost of the Savings Plan over the length of the lookback period.

        @[JSON::Field(key: "EstimatedCommitmentCost")]
        getter estimated_commitment_cost : String?

        # The estimated monthly savings amount based on the Savings Plan.

        @[JSON::Field(key: "EstimatedMonthlySavingsAmount")]
        getter estimated_monthly_savings_amount : String?

        # The remaining On-Demand cost estimated to not be covered by the Savings Plan over the length of the
        # lookback period.

        @[JSON::Field(key: "EstimatedOnDemandCost")]
        getter estimated_on_demand_cost : String?

        # The estimated On-Demand cost you expect with no additional commitment based on your usage of the
        # selected time period and the Savings Plan you own.

        @[JSON::Field(key: "EstimatedOnDemandCostWithCurrentCommitment")]
        getter estimated_on_demand_cost_with_current_commitment : String?

        # The estimated return on investment that's based on the Savings Plan and estimated savings. This is
        # calculated as estimatedSavingsAmount/estimatedSPCost*100.

        @[JSON::Field(key: "EstimatedROI")]
        getter estimated_roi : String?

        # The estimated savings amount that's based on the Savings Plan over the length of the lookback
        # period.

        @[JSON::Field(key: "EstimatedSavingsAmount")]
        getter estimated_savings_amount : String?

        # The estimated savings percentage relative to the total cost over the cost calculation lookback
        # period.

        @[JSON::Field(key: "EstimatedSavingsPercentage")]
        getter estimated_savings_percentage : String?

        # The existing hourly commitment for the Savings Plan type.

        @[JSON::Field(key: "ExistingHourlyCommitment")]
        getter existing_hourly_commitment : String?

        # The recommended or custom hourly commitment.

        @[JSON::Field(key: "HourlyCommitmentToPurchase")]
        getter hourly_commitment_to_purchase : String?

        # The date and time of the last hour that went into the analysis.

        @[JSON::Field(key: "LatestUsageTimestamp")]
        getter latest_usage_timestamp : String?

        # The lookback period in hours that's used to generate the analysis.

        @[JSON::Field(key: "LookbackPeriodInHours")]
        getter lookback_period_in_hours : String?

        # The related hourly cost, coverage, and utilization metrics over the lookback period.

        @[JSON::Field(key: "MetricsOverLookbackPeriod")]
        getter metrics_over_lookback_period : Array(Types::RecommendationDetailHourlyMetrics)?

        # The upfront cost of the Savings Plan based on the selected payment option.

        @[JSON::Field(key: "UpfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @additional_metadata : String? = nil,
          @currency_code : String? = nil,
          @current_average_coverage : String? = nil,
          @current_average_hourly_on_demand_spend : String? = nil,
          @current_maximum_hourly_on_demand_spend : String? = nil,
          @current_minimum_hourly_on_demand_spend : String? = nil,
          @current_on_demand_spend : String? = nil,
          @estimated_average_coverage : String? = nil,
          @estimated_average_utilization : String? = nil,
          @estimated_commitment_cost : String? = nil,
          @estimated_monthly_savings_amount : String? = nil,
          @estimated_on_demand_cost : String? = nil,
          @estimated_on_demand_cost_with_current_commitment : String? = nil,
          @estimated_roi : String? = nil,
          @estimated_savings_amount : String? = nil,
          @estimated_savings_percentage : String? = nil,
          @existing_hourly_commitment : String? = nil,
          @hourly_commitment_to_purchase : String? = nil,
          @latest_usage_timestamp : String? = nil,
          @lookback_period_in_hours : String? = nil,
          @metrics_over_lookback_period : Array(Types::RecommendationDetailHourlyMetrics)? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Contains your request parameters, Savings Plan Recommendations Summary, and Details.

      struct SavingsPlansPurchaseRecommendation
        include JSON::Serializable

        # The account scope that you want your recommendations for. Amazon Web Services calculates
        # recommendations that include the management account and member accounts if the value is set to PAYER
        # . If the value is LINKED , recommendations are calculated for individual member accounts only.

        @[JSON::Field(key: "AccountScope")]
        getter account_scope : String?

        # The lookback period in days that's used to generate the recommendation.

        @[JSON::Field(key: "LookbackPeriodInDays")]
        getter lookback_period_in_days : String?

        # The payment option that's used to generate the recommendation.

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # Details for the Savings Plans that we recommend that you purchase to cover existing Savings Plans
        # eligible workloads.

        @[JSON::Field(key: "SavingsPlansPurchaseRecommendationDetails")]
        getter savings_plans_purchase_recommendation_details : Array(Types::SavingsPlansPurchaseRecommendationDetail)?

        # Summary metrics for your Savings Plans Recommendations.

        @[JSON::Field(key: "SavingsPlansPurchaseRecommendationSummary")]
        getter savings_plans_purchase_recommendation_summary : Types::SavingsPlansPurchaseRecommendationSummary?

        # The requested Savings Plans recommendation type.

        @[JSON::Field(key: "SavingsPlansType")]
        getter savings_plans_type : String?

        # The Savings Plans recommendation term in years. It's used to generate the recommendation.

        @[JSON::Field(key: "TermInYears")]
        getter term_in_years : String?

        def initialize(
          @account_scope : String? = nil,
          @lookback_period_in_days : String? = nil,
          @payment_option : String? = nil,
          @savings_plans_purchase_recommendation_details : Array(Types::SavingsPlansPurchaseRecommendationDetail)? = nil,
          @savings_plans_purchase_recommendation_summary : Types::SavingsPlansPurchaseRecommendationSummary? = nil,
          @savings_plans_type : String? = nil,
          @term_in_years : String? = nil
        )
        end
      end

      # Details for your recommended Savings Plans.

      struct SavingsPlansPurchaseRecommendationDetail
        include JSON::Serializable

        # The AccountID the recommendation is generated for.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The currency code that Amazon Web Services used to generate the recommendations and present
        # potential savings.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The average value of hourly On-Demand spend over the lookback period of the applicable usage type.

        @[JSON::Field(key: "CurrentAverageHourlyOnDemandSpend")]
        getter current_average_hourly_on_demand_spend : String?

        # The highest value of hourly On-Demand spend over the lookback period of the applicable usage type.

        @[JSON::Field(key: "CurrentMaximumHourlyOnDemandSpend")]
        getter current_maximum_hourly_on_demand_spend : String?

        # The lowest value of hourly On-Demand spend over the lookback period of the applicable usage type.

        @[JSON::Field(key: "CurrentMinimumHourlyOnDemandSpend")]
        getter current_minimum_hourly_on_demand_spend : String?

        # The estimated utilization of the recommended Savings Plans.

        @[JSON::Field(key: "EstimatedAverageUtilization")]
        getter estimated_average_utilization : String?

        # The estimated monthly savings amount based on the recommended Savings Plans.

        @[JSON::Field(key: "EstimatedMonthlySavingsAmount")]
        getter estimated_monthly_savings_amount : String?

        # The remaining On-Demand cost estimated to not be covered by the recommended Savings Plans, over the
        # length of the lookback period.

        @[JSON::Field(key: "EstimatedOnDemandCost")]
        getter estimated_on_demand_cost : String?

        # The estimated On-Demand costs you expect with no additional commitment, based on your usage of the
        # selected time period and the Savings Plans you own.

        @[JSON::Field(key: "EstimatedOnDemandCostWithCurrentCommitment")]
        getter estimated_on_demand_cost_with_current_commitment : String?

        # The estimated return on investment that's based on the recommended Savings Plans that you purchased.
        # This is calculated as estimatedSavingsAmount / estimatedSPCost *100.

        @[JSON::Field(key: "EstimatedROI")]
        getter estimated_roi : String?

        # The cost of the recommended Savings Plans over the length of the lookback period.

        @[JSON::Field(key: "EstimatedSPCost")]
        getter estimated_sp_cost : String?

        # The estimated savings amount that's based on the recommended Savings Plans over the length of the
        # lookback period.

        @[JSON::Field(key: "EstimatedSavingsAmount")]
        getter estimated_savings_amount : String?

        # The estimated savings percentage relative to the total cost of applicable On-Demand usage over the
        # lookback period.

        @[JSON::Field(key: "EstimatedSavingsPercentage")]
        getter estimated_savings_percentage : String?

        # The recommended hourly commitment level for the Savings Plans type and the configuration that's
        # based on the usage during the lookback period.

        @[JSON::Field(key: "HourlyCommitmentToPurchase")]
        getter hourly_commitment_to_purchase : String?

        # Contains detailed information about a specific Savings Plan recommendation.

        @[JSON::Field(key: "RecommendationDetailId")]
        getter recommendation_detail_id : String?

        # Details for your recommended Savings Plans.

        @[JSON::Field(key: "SavingsPlansDetails")]
        getter savings_plans_details : Types::SavingsPlansDetails?

        # The upfront cost of the recommended Savings Plans, based on the selected payment option.

        @[JSON::Field(key: "UpfrontCost")]
        getter upfront_cost : String?

        def initialize(
          @account_id : String? = nil,
          @currency_code : String? = nil,
          @current_average_hourly_on_demand_spend : String? = nil,
          @current_maximum_hourly_on_demand_spend : String? = nil,
          @current_minimum_hourly_on_demand_spend : String? = nil,
          @estimated_average_utilization : String? = nil,
          @estimated_monthly_savings_amount : String? = nil,
          @estimated_on_demand_cost : String? = nil,
          @estimated_on_demand_cost_with_current_commitment : String? = nil,
          @estimated_roi : String? = nil,
          @estimated_sp_cost : String? = nil,
          @estimated_savings_amount : String? = nil,
          @estimated_savings_percentage : String? = nil,
          @hourly_commitment_to_purchase : String? = nil,
          @recommendation_detail_id : String? = nil,
          @savings_plans_details : Types::SavingsPlansDetails? = nil,
          @upfront_cost : String? = nil
        )
        end
      end

      # Metadata about your Savings Plans Purchase Recommendations.

      struct SavingsPlansPurchaseRecommendationMetadata
        include JSON::Serializable

        # Additional metadata that might be applicable to the recommendation.

        @[JSON::Field(key: "AdditionalMetadata")]
        getter additional_metadata : String?

        # The timestamp that shows when the recommendations were generated.

        @[JSON::Field(key: "GenerationTimestamp")]
        getter generation_timestamp : String?

        # The unique identifier for the recommendation set.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String?

        def initialize(
          @additional_metadata : String? = nil,
          @generation_timestamp : String? = nil,
          @recommendation_id : String? = nil
        )
        end
      end

      # Summary metrics for your Savings Plans Purchase Recommendations.

      struct SavingsPlansPurchaseRecommendationSummary
        include JSON::Serializable

        # The currency code that Amazon Web Services used to generate the recommendations and present
        # potential savings.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The current total on demand spend of the applicable usage types over the lookback period.

        @[JSON::Field(key: "CurrentOnDemandSpend")]
        getter current_on_demand_spend : String?

        # The recommended Savings Plans cost on a daily (24 hourly) basis.

        @[JSON::Field(key: "DailyCommitmentToPurchase")]
        getter daily_commitment_to_purchase : String?

        # The estimated monthly savings amount that's based on the recommended Savings Plans purchase.

        @[JSON::Field(key: "EstimatedMonthlySavingsAmount")]
        getter estimated_monthly_savings_amount : String?

        # The estimated On-Demand costs you expect with no additional commitment. It's based on your usage of
        # the selected time period and the Savings Plans you own.

        @[JSON::Field(key: "EstimatedOnDemandCostWithCurrentCommitment")]
        getter estimated_on_demand_cost_with_current_commitment : String?

        # The estimated return on investment that's based on the recommended Savings Plans and estimated
        # savings.

        @[JSON::Field(key: "EstimatedROI")]
        getter estimated_roi : String?

        # The estimated total savings over the lookback period, based on the purchase of the recommended
        # Savings Plans.

        @[JSON::Field(key: "EstimatedSavingsAmount")]
        getter estimated_savings_amount : String?

        # The estimated savings relative to the total cost of On-Demand usage, over the lookback period. This
        # is calculated as estimatedSavingsAmount / CurrentOnDemandSpend *100.

        @[JSON::Field(key: "EstimatedSavingsPercentage")]
        getter estimated_savings_percentage : String?

        # The estimated total cost of the usage after purchasing the recommended Savings Plans. This is a sum
        # of the cost of Savings Plans during this term, and the remaining On-Demand usage.

        @[JSON::Field(key: "EstimatedTotalCost")]
        getter estimated_total_cost : String?

        # The recommended hourly commitment that's based on the recommendation parameters.

        @[JSON::Field(key: "HourlyCommitmentToPurchase")]
        getter hourly_commitment_to_purchase : String?

        # The aggregate number of Savings Plans recommendations that exist for your account.

        @[JSON::Field(key: "TotalRecommendationCount")]
        getter total_recommendation_count : String?

        def initialize(
          @currency_code : String? = nil,
          @current_on_demand_spend : String? = nil,
          @daily_commitment_to_purchase : String? = nil,
          @estimated_monthly_savings_amount : String? = nil,
          @estimated_on_demand_cost_with_current_commitment : String? = nil,
          @estimated_roi : String? = nil,
          @estimated_savings_amount : String? = nil,
          @estimated_savings_percentage : String? = nil,
          @estimated_total_cost : String? = nil,
          @hourly_commitment_to_purchase : String? = nil,
          @total_recommendation_count : String? = nil
        )
        end
      end

      # The amount of savings that you're accumulating, against the public On-Demand rate of the usage
      # accrued in an account.

      struct SavingsPlansSavings
        include JSON::Serializable

        # The savings amount that you're accumulating for the usage that's covered by a Savings Plans, when
        # compared to the On-Demand equivalent of the same usage.

        @[JSON::Field(key: "NetSavings")]
        getter net_savings : String?

        # How much the amount that the usage would have cost if it was accrued at the On-Demand rate.

        @[JSON::Field(key: "OnDemandCostEquivalent")]
        getter on_demand_cost_equivalent : String?

        def initialize(
          @net_savings : String? = nil,
          @on_demand_cost_equivalent : String? = nil
        )
        end
      end

      # The measurement of how well you're using your existing Savings Plans.

      struct SavingsPlansUtilization
        include JSON::Serializable

        # The total amount of Savings Plans commitment that's been purchased in an account (or set of
        # accounts).

        @[JSON::Field(key: "TotalCommitment")]
        getter total_commitment : String?

        # The amount of your Savings Plans commitment that wasn't consumed from Savings Plans eligible usage
        # in a specific period.

        @[JSON::Field(key: "UnusedCommitment")]
        getter unused_commitment : String?

        # The amount of your Savings Plans commitment that was consumed from Savings Plans eligible usage in a
        # specific period.

        @[JSON::Field(key: "UsedCommitment")]
        getter used_commitment : String?

        # The amount of UsedCommitment divided by the TotalCommitment for your Savings Plans.

        @[JSON::Field(key: "UtilizationPercentage")]
        getter utilization_percentage : String?

        def initialize(
          @total_commitment : String? = nil,
          @unused_commitment : String? = nil,
          @used_commitment : String? = nil,
          @utilization_percentage : String? = nil
        )
        end
      end

      # The aggregated utilization metrics for your Savings Plans usage.

      struct SavingsPlansUtilizationAggregates
        include JSON::Serializable

        # A ratio of your effectiveness of using existing Savings Plans to apply to workloads that are Savings
        # Plans eligible.

        @[JSON::Field(key: "Utilization")]
        getter utilization : Types::SavingsPlansUtilization

        # The total amortized commitment for a Savings Plans. This includes the sum of the upfront and
        # recurring Savings Plans fees.

        @[JSON::Field(key: "AmortizedCommitment")]
        getter amortized_commitment : Types::SavingsPlansAmortizedCommitment?

        # The amount that's saved by using existing Savings Plans. Savings returns both net savings from
        # Savings Plans and also the onDemandCostEquivalent of the Savings Plans when considering the
        # utilization rate.

        @[JSON::Field(key: "Savings")]
        getter savings : Types::SavingsPlansSavings?

        def initialize(
          @utilization : Types::SavingsPlansUtilization,
          @amortized_commitment : Types::SavingsPlansAmortizedCommitment? = nil,
          @savings : Types::SavingsPlansSavings? = nil
        )
        end
      end

      # The amount of Savings Plans utilization (in hours).

      struct SavingsPlansUtilizationByTime
        include JSON::Serializable


        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval

        # A ratio of your effectiveness of using existing Savings Plans to apply to workloads that are Savings
        # Plans eligible.

        @[JSON::Field(key: "Utilization")]
        getter utilization : Types::SavingsPlansUtilization

        # The total amortized commitment for a Savings Plans. This includes the sum of the upfront and
        # recurring Savings Plans fees.

        @[JSON::Field(key: "AmortizedCommitment")]
        getter amortized_commitment : Types::SavingsPlansAmortizedCommitment?

        # The amount that's saved by using existing Savings Plans. Savings returns both net savings from
        # Savings Plans and also the onDemandCostEquivalent of the Savings Plans when considering the
        # utilization rate.

        @[JSON::Field(key: "Savings")]
        getter savings : Types::SavingsPlansSavings?

        def initialize(
          @time_period : Types::DateInterval,
          @utilization : Types::SavingsPlansUtilization,
          @amortized_commitment : Types::SavingsPlansAmortizedCommitment? = nil,
          @savings : Types::SavingsPlansSavings? = nil
        )
        end
      end

      # A single daily or monthly Savings Plans utilization rate and details for your account. A management
      # account in an organization have access to member accounts. You can use GetDimensionValues to
      # determine the possible dimension values.

      struct SavingsPlansUtilizationDetail
        include JSON::Serializable

        # The total amortized commitment for a Savings Plans. Includes the sum of the upfront and recurring
        # Savings Plans fees.

        @[JSON::Field(key: "AmortizedCommitment")]
        getter amortized_commitment : Types::SavingsPlansAmortizedCommitment?

        # The attribute that applies to a specific Dimension .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The amount saved by using existing Savings Plans. Savings returns both net savings from savings
        # plans and also the onDemandCostEquivalent of the Savings Plans when considering the utilization
        # rate.

        @[JSON::Field(key: "Savings")]
        getter savings : Types::SavingsPlansSavings?

        # The unique Amazon Resource Name (ARN) for a particular Savings Plan.

        @[JSON::Field(key: "SavingsPlanArn")]
        getter savings_plan_arn : String?

        # A ratio of your effectiveness of using existing Savings Plans to apply to workloads that are Savings
        # Plans eligible.

        @[JSON::Field(key: "Utilization")]
        getter utilization : Types::SavingsPlansUtilization?

        def initialize(
          @amortized_commitment : Types::SavingsPlansAmortizedCommitment? = nil,
          @attributes : Hash(String, String)? = nil,
          @savings : Types::SavingsPlansSavings? = nil,
          @savings_plan_arn : String? = nil,
          @utilization : Types::SavingsPlansUtilization? = nil
        )
        end
      end

      # You've reached the limit on the number of resources you can create, or exceeded the size of an
      # individual resource.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Hardware specifications for the service that you want recommendations for.

      struct ServiceSpecification
        include JSON::Serializable

        # The Amazon EC2 hardware specifications that you want Amazon Web Services to provide recommendations
        # for.

        @[JSON::Field(key: "EC2Specification")]
        getter ec2_specification : Types::EC2Specification?

        def initialize(
          @ec2_specification : Types::EC2Specification? = nil
        )
        end
      end

      # The details for how to sort the data.

      struct SortDefinition
        include JSON::Serializable

        # The key that's used to sort the data.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The order that's used to sort the data.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @key : String,
          @sort_order : String? = nil
        )
        end
      end


      struct StartCommitmentPurchaseAnalysisRequest
        include JSON::Serializable

        # The configuration for the commitment purchase analysis.

        @[JSON::Field(key: "CommitmentPurchaseAnalysisConfiguration")]
        getter commitment_purchase_analysis_configuration : Types::CommitmentPurchaseAnalysisConfiguration

        def initialize(
          @commitment_purchase_analysis_configuration : Types::CommitmentPurchaseAnalysisConfiguration
        )
        end
      end


      struct StartCommitmentPurchaseAnalysisResponse
        include JSON::Serializable

        # The analysis ID that's associated with the commitment purchase analysis.

        @[JSON::Field(key: "AnalysisId")]
        getter analysis_id : String

        # The start time of the analysis.

        @[JSON::Field(key: "AnalysisStartedTime")]
        getter analysis_started_time : String

        # The estimated time for when the analysis will complete.

        @[JSON::Field(key: "EstimatedCompletionTime")]
        getter estimated_completion_time : String

        def initialize(
          @analysis_id : String,
          @analysis_started_time : String,
          @estimated_completion_time : String
        )
        end
      end


      struct StartCostAllocationTagBackfillRequest
        include JSON::Serializable

        # The date you want the backfill to start from. The date can only be a first day of the month (a
        # billing start date). Dates can't precede the previous twelve months, or in the future.

        @[JSON::Field(key: "BackfillFrom")]
        getter backfill_from : String

        def initialize(
          @backfill_from : String
        )
        end
      end


      struct StartCostAllocationTagBackfillResponse
        include JSON::Serializable

        # An object containing detailed metadata of your new backfill request.

        @[JSON::Field(key: "BackfillRequest")]
        getter backfill_request : Types::CostAllocationTagBackfillRequest?

        def initialize(
          @backfill_request : Types::CostAllocationTagBackfillRequest? = nil
        )
        end
      end


      struct StartSavingsPlansPurchaseRecommendationGenerationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct StartSavingsPlansPurchaseRecommendationGenerationResponse
        include JSON::Serializable

        # The estimated time for when the recommendation generation will complete.

        @[JSON::Field(key: "EstimatedCompletionTime")]
        getter estimated_completion_time : String?

        # The start time of the recommendation generation.

        @[JSON::Field(key: "GenerationStartedTime")]
        getter generation_started_time : String?

        # The ID for this specific recommendation.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String?

        def initialize(
          @estimated_completion_time : String? = nil,
          @generation_started_time : String? = nil,
          @recommendation_id : String? = nil
        )
        end
      end

      # The recipient of AnomalySubscription notifications.

      struct Subscriber
        include JSON::Serializable

        # The email address or SNS Amazon Resource Name (ARN). This depends on the Type .

        @[JSON::Field(key: "Address")]
        getter address : String?

        # Indicates if the subscriber accepts the notifications.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The notification delivery channel.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @address : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. For a list of supported resources, see ResourceTag .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag key-value pairs to be added to the resource. Each tag consists of a key and a value,
        # and each key must be unique for the resource. The following restrictions apply to resource tags:
        # Although the maximum number of array members is 200, you can assign a maximum of 50 user-tags to one
        # resource. The remaining are reserved for Amazon Web Services use The maximum length of a key is 128
        # characters The maximum length of a value is 256 characters Keys and values can only contain
        # alphanumeric characters, spaces, and any of the following: _.:/=+@- Keys and values are case
        # sensitive Keys and values are trimmed for any leading or trailing whitespaces Don’t use aws: as a
        # prefix for your keys. This prefix is reserved for Amazon Web Services use

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)

        def initialize(
          @resource_arn : String,
          @resource_tags : Array(Types::ResourceTag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The values that are available for a tag. If Values and Key aren't specified, the ABSENT MatchOption
      # is applied to all tags. That is, it's filtered on resources with no tags. If Key is provided and
      # Values isn't specified, the ABSENT MatchOption is applied to the tag Key only. That is, it's
      # filtered on resources without the given tag key.

      struct TagValues
        include JSON::Serializable

        # The key for the tag.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The match options that you can use to filter your results. MatchOptions is only applicable for
        # actions related to cost category. The default values for MatchOptions are EQUALS and CASE_SENSITIVE
        # .

        @[JSON::Field(key: "MatchOptions")]
        getter match_options : Array(String)?

        # The specific value of the tag.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @match_options : Array(String)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Details on recommended instance.

      struct TargetInstance
        include JSON::Serializable

        # The currency code that Amazon Web Services used to calculate the costs for this instance.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # Determines whether this recommendation is the defaulted Amazon Web Services recommendation.

        @[JSON::Field(key: "DefaultTargetInstance")]
        getter default_target_instance : Bool?

        # The expected cost to operate this instance type on a monthly basis.

        @[JSON::Field(key: "EstimatedMonthlyCost")]
        getter estimated_monthly_cost : String?

        # The estimated savings that result from modification, on a monthly basis.

        @[JSON::Field(key: "EstimatedMonthlySavings")]
        getter estimated_monthly_savings : String?

        # The expected utilization metrics for target instance type.

        @[JSON::Field(key: "ExpectedResourceUtilization")]
        getter expected_resource_utilization : Types::ResourceUtilization?

        # Explains the actions that you might need to take to successfully migrate your workloads from the
        # current instance type to the recommended instance type.

        @[JSON::Field(key: "PlatformDifferences")]
        getter platform_differences : Array(String)?

        # Details on the target instance type.

        @[JSON::Field(key: "ResourceDetails")]
        getter resource_details : Types::ResourceDetails?

        def initialize(
          @currency_code : String? = nil,
          @default_target_instance : Bool? = nil,
          @estimated_monthly_cost : String? = nil,
          @estimated_monthly_savings : String? = nil,
          @expected_resource_utilization : Types::ResourceUtilization? = nil,
          @platform_differences : Array(String)? = nil,
          @resource_details : Types::ResourceDetails? = nil
        )
        end
      end

      # Details on termination recommendation.

      struct TerminateRecommendationDetail
        include JSON::Serializable

        # The currency code that Amazon Web Services used to calculate the costs for this instance.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String?

        # The estimated savings that result from modification, on a monthly basis.

        @[JSON::Field(key: "EstimatedMonthlySavings")]
        getter estimated_monthly_savings : String?

        def initialize(
          @currency_code : String? = nil,
          @estimated_monthly_savings : String? = nil
        )
        end
      end

      # Can occur if you specify a number of tags for a resource greater than the maximum 50 user tags per
      # resource.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Filters cost anomalies based on the total impact.

      struct TotalImpactFilter
        include JSON::Serializable

        # The comparing value that's used in the filter.

        @[JSON::Field(key: "NumericOperator")]
        getter numeric_operator : String

        # The lower bound dollar value that's used in the filter.

        @[JSON::Field(key: "StartValue")]
        getter start_value : Float64

        # The upper bound dollar value that's used in the filter.

        @[JSON::Field(key: "EndValue")]
        getter end_value : Float64?

        def initialize(
          @numeric_operator : String,
          @start_value : Float64,
          @end_value : Float64? = nil
        )
        end
      end

      # The cost anomaly monitor does not exist for the account.

      struct UnknownMonitorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The cost anomaly subscription does not exist for the account.

      struct UnknownSubscriptionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Cost Explorer was unable to identify the usage unit. Provide UsageType/UsageTypeGroup filter
      # selections that contain matching units, for example: hours .

      struct UnresolvableUsageUnitException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. For a list of supported resources, see ResourceTag .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag keys associated with tags that need to be removed from the resource. If you specify a
        # tag key that doesn't exist, it's ignored. Although the maximum number of array members is 200,
        # user-tag maximum is 50. The remaining are reserved for Amazon Web Services use.

        @[JSON::Field(key: "ResourceTagKeys")]
        getter resource_tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @resource_tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAnomalyMonitorRequest
        include JSON::Serializable

        # Cost anomaly monitor Amazon Resource Names (ARNs).

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        # The new name for the cost anomaly monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String?

        def initialize(
          @monitor_arn : String,
          @monitor_name : String? = nil
        )
        end
      end


      struct UpdateAnomalyMonitorResponse
        include JSON::Serializable

        # A cost anomaly monitor ARN.

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        def initialize(
          @monitor_arn : String
        )
        end
      end


      struct UpdateAnomalySubscriptionRequest
        include JSON::Serializable

        # A cost anomaly subscription Amazon Resource Name (ARN).

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String

        # The update to the frequency value that subscribers receive notifications.

        @[JSON::Field(key: "Frequency")]
        getter frequency : String?

        # A list of cost anomaly monitor ARNs.

        @[JSON::Field(key: "MonitorArnList")]
        getter monitor_arn_list : Array(String)?

        # The update to the subscriber list.

        @[JSON::Field(key: "Subscribers")]
        getter subscribers : Array(Types::Subscriber)?

        # The new name of the subscription.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String?

        # (deprecated) The update to the threshold value for receiving notifications. This field has been
        # deprecated. To update a threshold, use ThresholdExpression. Continued use of Threshold will be
        # treated as shorthand syntax for a ThresholdExpression. You can specify either Threshold or
        # ThresholdExpression, but not both.

        @[JSON::Field(key: "Threshold")]
        getter threshold : Float64?

        # The update to the Expression object used to specify the anomalies that you want to generate alerts
        # for. This supports dimensions and nested expressions. The supported dimensions are
        # ANOMALY_TOTAL_IMPACT_ABSOLUTE and ANOMALY_TOTAL_IMPACT_PERCENTAGE , corresponding to an anomaly’s
        # TotalImpact and TotalImpactPercentage, respectively (see Impact for more details). The supported
        # nested expression types are AND and OR . The match option GREATER_THAN_OR_EQUAL is required. Values
        # must be numbers between 0 and 10,000,000,000 in string format. You can specify either Threshold or
        # ThresholdExpression, but not both. The following are examples of valid ThresholdExpressions:
        # Absolute threshold: { "Dimensions": { "Key": "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [
        # "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } } Percentage threshold: { "Dimensions": { "Key":
        # "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ]
        # } } AND two thresholds together: { "And": [ { "Dimensions": { "Key":
        # "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] }
        # }, { "Dimensions": { "Key": "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions": [
        # "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } } ] } OR two thresholds together: { "Or": [ {
        # "Dimensions": { "Key": "ANOMALY_TOTAL_IMPACT_ABSOLUTE", "MatchOptions": [ "GREATER_THAN_OR_EQUAL" ],
        # "Values": [ "100" ] } }, { "Dimensions": { "Key": "ANOMALY_TOTAL_IMPACT_PERCENTAGE", "MatchOptions":
        # [ "GREATER_THAN_OR_EQUAL" ], "Values": [ "100" ] } } ] }

        @[JSON::Field(key: "ThresholdExpression")]
        getter threshold_expression : Types::Expression?

        def initialize(
          @subscription_arn : String,
          @frequency : String? = nil,
          @monitor_arn_list : Array(String)? = nil,
          @subscribers : Array(Types::Subscriber)? = nil,
          @subscription_name : String? = nil,
          @threshold : Float64? = nil,
          @threshold_expression : Types::Expression? = nil
        )
        end
      end


      struct UpdateAnomalySubscriptionResponse
        include JSON::Serializable

        # A cost anomaly subscription ARN.

        @[JSON::Field(key: "SubscriptionArn")]
        getter subscription_arn : String

        def initialize(
          @subscription_arn : String
        )
        end
      end

      # Gives a detailed description of the result of an action. It's on each cost allocation tag entry in
      # the request.

      struct UpdateCostAllocationTagsStatusError
        include JSON::Serializable

        # An error code representing why the action failed on this entry.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # A message explaining why the action failed on this entry.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The key for the cost allocation tag.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @tag_key : String? = nil
        )
        end
      end


      struct UpdateCostAllocationTagsStatusRequest
        include JSON::Serializable

        # The list of CostAllocationTagStatusEntry objects that are used to update cost allocation tags status
        # for this request.

        @[JSON::Field(key: "CostAllocationTagsStatus")]
        getter cost_allocation_tags_status : Array(Types::CostAllocationTagStatusEntry)

        def initialize(
          @cost_allocation_tags_status : Array(Types::CostAllocationTagStatusEntry)
        )
        end
      end


      struct UpdateCostAllocationTagsStatusResponse
        include JSON::Serializable

        # A list of UpdateCostAllocationTagsStatusError objects with error details about each cost allocation
        # tag that can't be updated. If there's no failure, an empty array returns.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::UpdateCostAllocationTagsStatusError)?

        def initialize(
          @errors : Array(Types::UpdateCostAllocationTagsStatusError)? = nil
        )
        end
      end


      struct UpdateCostCategoryDefinitionRequest
        include JSON::Serializable

        # The unique identifier for your cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String


        @[JSON::Field(key: "RuleVersion")]
        getter rule_version : String

        # The Expression object used to categorize costs. For more information, see CostCategoryRule .

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::CostCategoryRule)


        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # The cost category's effective start date. It can only be a billing start date (first day of the
        # month). If the date isn't provided, it's the first day of the current month. Dates can't be before
        # the previous twelve months, or in the future.

        @[JSON::Field(key: "EffectiveStart")]
        getter effective_start : String?

        # The split charge rules used to allocate your charges between your cost category values.

        @[JSON::Field(key: "SplitChargeRules")]
        getter split_charge_rules : Array(Types::CostCategorySplitChargeRule)?

        def initialize(
          @cost_category_arn : String,
          @rule_version : String,
          @rules : Array(Types::CostCategoryRule),
          @default_value : String? = nil,
          @effective_start : String? = nil,
          @split_charge_rules : Array(Types::CostCategorySplitChargeRule)? = nil
        )
        end
      end


      struct UpdateCostCategoryDefinitionResponse
        include JSON::Serializable

        # The unique identifier for your cost category.

        @[JSON::Field(key: "CostCategoryArn")]
        getter cost_category_arn : String?

        # The cost category's effective start date. It can only be a billing start date (first day of the
        # month).

        @[JSON::Field(key: "EffectiveStart")]
        getter effective_start : String?

        def initialize(
          @cost_category_arn : String? = nil,
          @effective_start : String? = nil
        )
        end
      end

      # The amount of utilization, in hours.

      struct UtilizationByTime
        include JSON::Serializable

        # The groups that this utilization result uses.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::ReservationUtilizationGroup)?

        # The period of time that this utilization was used for.

        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Types::DateInterval?

        # The total number of reservation hours that were used.

        @[JSON::Field(key: "Total")]
        getter total : Types::ReservationAggregates?

        def initialize(
          @groups : Array(Types::ReservationUtilizationGroup)? = nil,
          @time_period : Types::DateInterval? = nil,
          @total : Types::ReservationAggregates? = nil
        )
        end
      end
    end
  end
end
