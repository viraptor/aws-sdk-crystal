require "json"
require "time"

module AwsSdk
  module DevOpsGuru
    module Types

      # You don't have permissions to perform the requested operation. The user or role that is making the
      # request must have at least one IAM permissions policy attached that grants the required permissions.
      # For more information, see Access Management in the IAM User Guide .

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Returns the number of open reactive insights, the number of open proactive insights, and the number
      # of metrics analyzed in your Amazon Web Services account. Use these numbers to gauge the health of
      # operations in your Amazon Web Services account.

      struct AccountHealth
        include JSON::Serializable

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Information about the health of the Amazon Web Services resources in your account, including the
        # number of open proactive, open reactive insights, and the Mean Time to Recover (MTTR) of closed
        # insights.

        @[JSON::Field(key: "Insight")]
        getter insight : Types::AccountInsightHealth?

        def initialize(
          @account_id : String? = nil,
          @insight : Types::AccountInsightHealth? = nil
        )
        end
      end

      # Information about the number of open reactive and proactive insights that can be used to gauge the
      # health of your system.

      struct AccountInsightHealth
        include JSON::Serializable

        # An integer that specifies the number of open proactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "OpenProactiveInsights")]
        getter open_proactive_insights : Int32?

        # An integer that specifies the number of open reactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "OpenReactiveInsights")]
        getter open_reactive_insights : Int32?

        def initialize(
          @open_proactive_insights : Int32? = nil,
          @open_reactive_insights : Int32? = nil
        )
        end
      end


      struct AddNotificationChannelRequest
        include JSON::Serializable

        # A NotificationChannelConfig object that specifies what type of notification channel to add. The one
        # supported notification channel is Amazon Simple Notification Service (Amazon SNS).

        @[JSON::Field(key: "Config")]
        getter config : Types::NotificationChannelConfig

        def initialize(
          @config : Types::NotificationChannelConfig
        )
        end
      end


      struct AddNotificationChannelResponse
        include JSON::Serializable

        # The ID of the added notification channel.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Information about your account's integration with Amazon CodeGuru Profiler. This returns whether
      # DevOps Guru is configured to consume recommendations generated from Amazon CodeGuru Profiler.

      struct AmazonCodeGuruProfilerIntegration
        include JSON::Serializable

        # The status of the CodeGuru Profiler integration. Specifies if DevOps Guru is enabled to consume
        # recommendations that are generated from Amazon CodeGuru Profiler.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # An Amazon CloudWatch log group that contains log anomalies and is used to generate an insight.

      struct AnomalousLogGroup
        include JSON::Serializable

        # The time the anomalous log events stopped.

        @[JSON::Field(key: "ImpactEndTime")]
        getter impact_end_time : Time?

        # The time the anomalous log events began. The impact start time indicates the time of the first log
        # anomaly event that occurs.

        @[JSON::Field(key: "ImpactStartTime")]
        getter impact_start_time : Time?

        # The log anomalies in the log group. Each log anomaly displayed represents a cluster of similar
        # anomalous log events.

        @[JSON::Field(key: "LogAnomalyShowcases")]
        getter log_anomaly_showcases : Array(Types::LogAnomalyShowcase)?

        # The name of the CloudWatch log group.

        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String?

        # The number of log lines that were scanned for anomalous log events.

        @[JSON::Field(key: "NumberOfLogLinesScanned")]
        getter number_of_log_lines_scanned : Int32?

        def initialize(
          @impact_end_time : Time? = nil,
          @impact_start_time : Time? = nil,
          @log_anomaly_showcases : Array(Types::LogAnomalyShowcase)? = nil,
          @log_group_name : String? = nil,
          @number_of_log_lines_scanned : Int32? = nil
        )
        end
      end

      # A time range that specifies when DevOps Guru opens and then closes an anomaly. This is different
      # from AnomalyTimeRange , which specifies the time range when DevOps Guru actually observes the
      # anomalous behavior.

      struct AnomalyReportedTimeRange
        include JSON::Serializable

        # The time when an anomaly is opened.

        @[JSON::Field(key: "OpenTime")]
        getter open_time : Time

        # The time when an anomaly is closed.

        @[JSON::Field(key: "CloseTime")]
        getter close_time : Time?

        def initialize(
          @open_time : Time,
          @close_time : Time? = nil
        )
        end
      end

      # The Amazon Web Services resources in which DevOps Guru detected unusual behavior that resulted in
      # the generation of an anomaly. When DevOps Guru detects multiple related anomalies, it creates and
      # insight with details about the anomalous behavior and suggestions about how to correct the problem.

      struct AnomalyResource
        include JSON::Serializable

        # The name of the Amazon Web Services resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of the Amazon Web Services resource.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Details about the source of the anomalous operational data that triggered the anomaly.

      struct AnomalySourceDetails
        include JSON::Serializable

        # An array of CloudWatchMetricsDetail objects that contain information about analyzed CloudWatch
        # metrics that show anomalous behavior.

        @[JSON::Field(key: "CloudWatchMetrics")]
        getter cloud_watch_metrics : Array(Types::CloudWatchMetricsDetail)?

        # An array of PerformanceInsightsMetricsDetail objects that contain information about analyzed
        # Performance Insights metrics that show anomalous behavior.

        @[JSON::Field(key: "PerformanceInsightsMetrics")]
        getter performance_insights_metrics : Array(Types::PerformanceInsightsMetricsDetail)?

        def initialize(
          @cloud_watch_metrics : Array(Types::CloudWatchMetricsDetail)? = nil,
          @performance_insights_metrics : Array(Types::PerformanceInsightsMetricsDetail)? = nil
        )
        end
      end

      # Metadata about the detection source that generates proactive anomalies. The anomaly is detected
      # using analysis of the metric data&#x2028; over a period of time

      struct AnomalySourceMetadata
        include JSON::Serializable

        # The source of the anomaly.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The name of the anomaly's resource.

        @[JSON::Field(key: "SourceResourceName")]
        getter source_resource_name : String?

        # The anomaly's resource type.

        @[JSON::Field(key: "SourceResourceType")]
        getter source_resource_type : String?

        def initialize(
          @source : String? = nil,
          @source_resource_name : String? = nil,
          @source_resource_type : String? = nil
        )
        end
      end

      # A time range that specifies when the observed unusual behavior in an anomaly started and ended. This
      # is different from AnomalyReportedTimeRange , which specifies the time range when DevOps Guru opens
      # and then closes an anomaly.

      struct AnomalyTimeRange
        include JSON::Serializable

        # The time when the anomalous behavior started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The time when the anomalous behavior ended.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        def initialize(
          @start_time : Time,
          @end_time : Time? = nil
        )
        end
      end

      # Information about Amazon Web Services CloudFormation stacks. You can use up to 500 stacks to specify
      # which Amazon Web Services resources in your account to analyze. For more information, see Stacks in
      # the Amazon Web Services CloudFormation User Guide .

      struct CloudFormationCollection
        include JSON::Serializable

        # An array of CloudFormation stack names.

        @[JSON::Field(key: "StackNames")]
        getter stack_names : Array(String)?

        def initialize(
          @stack_names : Array(String)? = nil
        )
        end
      end

      # Information about Amazon Web Services CloudFormation stacks. You can use up to 500 stacks to specify
      # which Amazon Web Services resources in your account to analyze. For more information, see Stacks in
      # the Amazon Web Services CloudFormation User Guide .

      struct CloudFormationCollectionFilter
        include JSON::Serializable

        # An array of CloudFormation stack names.

        @[JSON::Field(key: "StackNames")]
        getter stack_names : Array(String)?

        def initialize(
          @stack_names : Array(String)? = nil
        )
        end
      end

      # Information about an Amazon Web Services CloudFormation stack used to create a monthly cost estimate
      # for DevOps Guru to analyze Amazon Web Services resources. The maximum number of stacks you can
      # specify for a cost estimate is one. The estimate created is for the cost to analyze the Amazon Web
      # Services resources defined by the stack. For more information, see Stacks in the Amazon Web Services
      # CloudFormation User Guide .

      struct CloudFormationCostEstimationResourceCollectionFilter
        include JSON::Serializable

        # An array of CloudFormation stack names. Its size is fixed at 1 item.

        @[JSON::Field(key: "StackNames")]
        getter stack_names : Array(String)?

        def initialize(
          @stack_names : Array(String)? = nil
        )
        end
      end

      # Information about the health of Amazon Web Services resources in your account that are specified by
      # an Amazon Web Services CloudFormation stack.

      struct CloudFormationHealth
        include JSON::Serializable

        # Number of resources that DevOps Guru is monitoring in your account that are specified by an Amazon
        # Web Services CloudFormation stack.

        @[JSON::Field(key: "AnalyzedResourceCount")]
        getter analyzed_resource_count : Int64?

        # Information about the health of the Amazon Web Services resources in your account that are specified
        # by an Amazon Web Services CloudFormation stack, including the number of open proactive, open
        # reactive insights, and the Mean Time to Recover (MTTR) of closed insights.

        @[JSON::Field(key: "Insight")]
        getter insight : Types::InsightHealth?

        # The name of the CloudFormation stack.

        @[JSON::Field(key: "StackName")]
        getter stack_name : String?

        def initialize(
          @analyzed_resource_count : Int64? = nil,
          @insight : Types::InsightHealth? = nil,
          @stack_name : String? = nil
        )
        end
      end

      # Contains information about the analyzed metrics that displayed anomalous behavior.

      struct CloudWatchMetricsDataSummary
        include JSON::Serializable

        # This is an enum of the status showing whether the metric value pair list has partial or complete
        # data, or if there was an error.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # This is a list of Amazon CloudWatch metric values at given timestamp.

        @[JSON::Field(key: "TimestampMetricValuePairList")]
        getter timestamp_metric_value_pair_list : Array(Types::TimestampMetricValuePair)?

        def initialize(
          @status_code : String? = nil,
          @timestamp_metric_value_pair_list : Array(Types::TimestampMetricValuePair)? = nil
        )
        end
      end

      # Information about an Amazon CloudWatch metric.

      struct CloudWatchMetricsDetail
        include JSON::Serializable

        # An array of CloudWatch dimensions associated with

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::CloudWatchMetricsDimension)?

        # This object returns anomaly metric data.

        @[JSON::Field(key: "MetricDataSummary")]
        getter metric_data_summary : Types::CloudWatchMetricsDataSummary?

        # The name of the CloudWatch metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The namespace of the CloudWatch metric. A namespace is a container for CloudWatch metrics.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The length of time associated with the CloudWatch metric in number of seconds.

        @[JSON::Field(key: "Period")]
        getter period : Int32?

        # The type of statistic associated with the CloudWatch metric. For more information, see Statistics in
        # the Amazon CloudWatch User Guide .

        @[JSON::Field(key: "Stat")]
        getter stat : String?

        # The unit of measure used for the CloudWatch metric. For example, Bytes , Seconds , Count , and
        # Percent .

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @dimensions : Array(Types::CloudWatchMetricsDimension)? = nil,
          @metric_data_summary : Types::CloudWatchMetricsDataSummary? = nil,
          @metric_name : String? = nil,
          @namespace : String? = nil,
          @period : Int32? = nil,
          @stat : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # The dimension of an Amazon CloudWatch metric that is used when DevOps Guru analyzes the resources in
      # your account for operational problems and anomalous behavior. A dimension is a name/value pair that
      # is part of the identity of a metric. A metric can have up to 10 dimensions. For more information,
      # see Dimensions in the Amazon CloudWatch User Guide .

      struct CloudWatchMetricsDimension
        include JSON::Serializable

        # The name of the CloudWatch dimension.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of the CloudWatch dimension.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # An exception that is thrown when a conflict occurs.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The ID of the Amazon Web Services resource in which a conflict occurred.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the Amazon Web Services resource in which a conflict occurred.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Information about a filter used to specify which Amazon Web Services resources are analyzed to
      # create a monthly DevOps Guru cost estimate. For more information, see Estimate your Amazon DevOps
      # Guru costs and Amazon DevOps Guru pricing .

      struct CostEstimationResourceCollectionFilter
        include JSON::Serializable

        # An object that specifies the CloudFormation stack that defines the Amazon Web Services resources
        # used to create a monthly estimate for DevOps Guru.

        @[JSON::Field(key: "CloudFormation")]
        getter cloud_formation : Types::CloudFormationCostEstimationResourceCollectionFilter?

        # The Amazon Web Services tags used to filter the resource collection that is used for a cost
        # estimate. Tags help you identify and organize your Amazon Web Services resources. Many Amazon Web
        # Services services support tagging, so you can assign the same tag to resources from different
        # services to indicate that the resources are related. For example, you can assign the same tag to an
        # Amazon DynamoDB table resource that you assign to an Lambda function. For more information about
        # using tags, see the Tagging best practices whitepaper. Each Amazon Web Services tag has two parts. A
        # tag key (for example, CostCenter , Environment , Project , or Secret ). Tag keys are case-sensitive.
        # An optional field known as a tag value (for example, 111122223333 , Production , or a team name).
        # Omitting the tag value is the same as using an empty string. Like tag keys , tag values are
        # case-sensitive. Together these are known as key - value pairs. The string used for a key in a tag
        # that you use to define your resource coverage must begin with the prefix Devops-guru- . The tag key
        # might be DevOps-Guru-deployment-application or devops-guru-rds-application . When you create a key ,
        # the case of characters in the key can be whatever you choose. After you create a key , it is
        # case-sensitive. For example, DevOps Guru works with a key named devops-guru-rds and a key named
        # DevOps-Guru-RDS , and these act as two different keys . Possible key / value pairs in your
        # application might be Devops-Guru-production-application/RDS or
        # Devops-Guru-production-application/containers .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::TagCostEstimationResourceCollectionFilter)?

        def initialize(
          @cloud_formation : Types::CloudFormationCostEstimationResourceCollectionFilter? = nil,
          @tags : Array(Types::TagCostEstimationResourceCollectionFilter)? = nil
        )
        end
      end

      # The time range of a cost estimation.

      struct CostEstimationTimeRange
        include JSON::Serializable

        # The end time of the cost estimation.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The start time of the cost estimation.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct DeleteInsightRequest
        include JSON::Serializable

        # The ID of the insight.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteInsightResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountHealthRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAccountHealthResponse
        include JSON::Serializable

        # An integer that specifies the number of metrics that have been analyzed in your Amazon Web Services
        # account.

        @[JSON::Field(key: "MetricsAnalyzed")]
        getter metrics_analyzed : Int32

        # An integer that specifies the number of open proactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "OpenProactiveInsights")]
        getter open_proactive_insights : Int32

        # An integer that specifies the number of open reactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "OpenReactiveInsights")]
        getter open_reactive_insights : Int32

        # The number of Amazon DevOps Guru resource analysis hours billed to the current Amazon Web Services
        # account in the last hour.

        @[JSON::Field(key: "ResourceHours")]
        getter resource_hours : Int64

        # Number of resources that DevOps Guru is monitoring in your Amazon Web Services account.

        @[JSON::Field(key: "AnalyzedResourceCount")]
        getter analyzed_resource_count : Int64?

        def initialize(
          @metrics_analyzed : Int32,
          @open_proactive_insights : Int32,
          @open_reactive_insights : Int32,
          @resource_hours : Int64,
          @analyzed_resource_count : Int64? = nil
        )
        end
      end


      struct DescribeAccountOverviewRequest
        include JSON::Serializable

        # The start of the time range passed in. The start time granularity is at the day level. The floor of
        # the start time is used. Returned information occurred after this day.

        @[JSON::Field(key: "FromTime")]
        getter from_time : Time

        # The end of the time range passed in. The start time granularity is at the day level. The floor of
        # the start time is used. Returned information occurred before this day. If this is not specified,
        # then the current day is used.

        @[JSON::Field(key: "ToTime")]
        getter to_time : Time?

        def initialize(
          @from_time : Time,
          @to_time : Time? = nil
        )
        end
      end


      struct DescribeAccountOverviewResponse
        include JSON::Serializable

        # The Mean Time to Recover (MTTR) for all closed insights that were created during the time range
        # passed in.

        @[JSON::Field(key: "MeanTimeToRecoverInMilliseconds")]
        getter mean_time_to_recover_in_milliseconds : Int64

        # An integer that specifies the number of open proactive insights in your Amazon Web Services account
        # that were created during the time range passed in.

        @[JSON::Field(key: "ProactiveInsights")]
        getter proactive_insights : Int32

        # An integer that specifies the number of open reactive insights in your Amazon Web Services account
        # that were created during the time range passed in.

        @[JSON::Field(key: "ReactiveInsights")]
        getter reactive_insights : Int32

        def initialize(
          @mean_time_to_recover_in_milliseconds : Int64,
          @proactive_insights : Int32,
          @reactive_insights : Int32
        )
        end
      end


      struct DescribeAnomalyRequest
        include JSON::Serializable

        # The ID of the anomaly.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The ID of the member account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeAnomalyResponse
        include JSON::Serializable

        # A ProactiveAnomaly object that represents the requested anomaly.

        @[JSON::Field(key: "ProactiveAnomaly")]
        getter proactive_anomaly : Types::ProactiveAnomaly?

        # A ReactiveAnomaly object that represents the requested anomaly.

        @[JSON::Field(key: "ReactiveAnomaly")]
        getter reactive_anomaly : Types::ReactiveAnomaly?

        def initialize(
          @proactive_anomaly : Types::ProactiveAnomaly? = nil,
          @reactive_anomaly : Types::ReactiveAnomaly? = nil
        )
        end
      end


      struct DescribeEventSourcesConfigRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeEventSourcesConfigResponse
        include JSON::Serializable

        # Lists the event sources in the configuration.

        @[JSON::Field(key: "EventSources")]
        getter event_sources : Types::EventSourcesConfig?

        def initialize(
          @event_sources : Types::EventSourcesConfig? = nil
        )
        end
      end


      struct DescribeFeedbackRequest
        include JSON::Serializable

        # The ID of the insight for which the feedback was provided.

        @[JSON::Field(key: "InsightId")]
        getter insight_id : String?

        def initialize(
          @insight_id : String? = nil
        )
        end
      end


      struct DescribeFeedbackResponse
        include JSON::Serializable


        @[JSON::Field(key: "InsightFeedback")]
        getter insight_feedback : Types::InsightFeedback?

        def initialize(
          @insight_feedback : Types::InsightFeedback? = nil
        )
        end
      end


      struct DescribeInsightRequest
        include JSON::Serializable

        # The ID of the insight.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The ID of the member account in the organization.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        def initialize(
          @id : String,
          @account_id : String? = nil
        )
        end
      end


      struct DescribeInsightResponse
        include JSON::Serializable

        # A ProactiveInsight object that represents the requested insight.

        @[JSON::Field(key: "ProactiveInsight")]
        getter proactive_insight : Types::ProactiveInsight?

        # A ReactiveInsight object that represents the requested insight.

        @[JSON::Field(key: "ReactiveInsight")]
        getter reactive_insight : Types::ReactiveInsight?

        def initialize(
          @proactive_insight : Types::ProactiveInsight? = nil,
          @reactive_insight : Types::ReactiveInsight? = nil
        )
        end
      end


      struct DescribeOrganizationHealthRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # The ID of the organizational unit.

        @[JSON::Field(key: "OrganizationalUnitIds")]
        getter organizational_unit_ids : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @organizational_unit_ids : Array(String)? = nil
        )
        end
      end


      struct DescribeOrganizationHealthResponse
        include JSON::Serializable

        # An integer that specifies the number of metrics that have been analyzed in your organization.

        @[JSON::Field(key: "MetricsAnalyzed")]
        getter metrics_analyzed : Int32

        # An integer that specifies the number of open proactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "OpenProactiveInsights")]
        getter open_proactive_insights : Int32

        # An integer that specifies the number of open reactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "OpenReactiveInsights")]
        getter open_reactive_insights : Int32

        # The number of Amazon DevOps Guru resource analysis hours billed to the current Amazon Web Services
        # account in the last hour.

        @[JSON::Field(key: "ResourceHours")]
        getter resource_hours : Int64

        def initialize(
          @metrics_analyzed : Int32,
          @open_proactive_insights : Int32,
          @open_reactive_insights : Int32,
          @resource_hours : Int64
        )
        end
      end


      struct DescribeOrganizationOverviewRequest
        include JSON::Serializable

        # The start of the time range passed in. The start time granularity is at the day level. The floor of
        # the start time is used. Returned information occurred after this day.

        @[JSON::Field(key: "FromTime")]
        getter from_time : Time

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # The ID of the organizational unit.

        @[JSON::Field(key: "OrganizationalUnitIds")]
        getter organizational_unit_ids : Array(String)?

        # The end of the time range passed in. The start time granularity is at the day level. The floor of
        # the start time is used. Returned information occurred before this day. If this is not specified,
        # then the current day is used.

        @[JSON::Field(key: "ToTime")]
        getter to_time : Time?

        def initialize(
          @from_time : Time,
          @account_ids : Array(String)? = nil,
          @organizational_unit_ids : Array(String)? = nil,
          @to_time : Time? = nil
        )
        end
      end


      struct DescribeOrganizationOverviewResponse
        include JSON::Serializable

        # An integer that specifies the number of open proactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "ProactiveInsights")]
        getter proactive_insights : Int32

        # An integer that specifies the number of open reactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "ReactiveInsights")]
        getter reactive_insights : Int32

        def initialize(
          @proactive_insights : Int32,
          @reactive_insights : Int32
        )
        end
      end


      struct DescribeOrganizationResourceCollectionHealthRequest
        include JSON::Serializable

        # An Amazon Web Services resource collection type. This type specifies how analyzed Amazon Web
        # Services resources are defined. The two types of Amazon Web Services resource collections supported
        # are Amazon Web Services CloudFormation stacks and Amazon Web Services resources that contain the
        # same Amazon Web Services tag. DevOps Guru can be configured to analyze the Amazon Web Services
        # resources that are defined in the stacks or that are tagged using the same tag key . You can specify
        # up to 500 Amazon Web Services CloudFormation stacks.

        @[JSON::Field(key: "OrganizationResourceCollectionType")]
        getter organization_resource_collection_type : String

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the organizational unit.

        @[JSON::Field(key: "OrganizationalUnitIds")]
        getter organizational_unit_ids : Array(String)?

        def initialize(
          @organization_resource_collection_type : String,
          @account_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @organizational_unit_ids : Array(String)? = nil
        )
        end
      end


      struct DescribeOrganizationResourceCollectionHealthResponse
        include JSON::Serializable

        # The name of the organization's account.

        @[JSON::Field(key: "Account")]
        getter account : Array(Types::AccountHealth)?

        # The returned CloudFormationHealthOverview object that contains an InsightHealthOverview object with
        # the requested system health information.

        @[JSON::Field(key: "CloudFormation")]
        getter cloud_formation : Array(Types::CloudFormationHealth)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ServiceHealth objects that describes the health of the Amazon Web Services services
        # associated with the resources in the collection.

        @[JSON::Field(key: "Service")]
        getter service : Array(Types::ServiceHealth)?

        # Tags help you identify and organize your Amazon Web Services resources. Many Amazon Web Services
        # services support tagging, so you can assign the same tag to resources from different services to
        # indicate that the resources are related. For example, you can assign the same tag to an Amazon
        # DynamoDB table resource that you assign to an Lambda function. For more information about using
        # tags, see the Tagging best practices whitepaper. Each Amazon Web Services tag has two parts. A tag
        # key (for example, CostCenter , Environment , Project , or Secret ). Tag keys are case-sensitive. An
        # optional field known as a tag value (for example, 111122223333 , Production , or a team name).
        # Omitting the tag value is the same as using an empty string. Like tag keys , tag values are
        # case-sensitive. Together these are known as key - value pairs. The string used for a key in a tag
        # that you use to define your resource coverage must begin with the prefix Devops-guru- . The tag key
        # might be DevOps-Guru-deployment-application or devops-guru-rds-application . When you create a key ,
        # the case of characters in the key can be whatever you choose. After you create a key , it is
        # case-sensitive. For example, DevOps Guru works with a key named devops-guru-rds and a key named
        # DevOps-Guru-RDS , and these act as two different keys . Possible key / value pairs in your
        # application might be Devops-Guru-production-application/RDS or
        # Devops-Guru-production-application/containers .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::TagHealth)?

        def initialize(
          @account : Array(Types::AccountHealth)? = nil,
          @cloud_formation : Array(Types::CloudFormationHealth)? = nil,
          @next_token : String? = nil,
          @service : Array(Types::ServiceHealth)? = nil,
          @tags : Array(Types::TagHealth)? = nil
        )
        end
      end


      struct DescribeResourceCollectionHealthRequest
        include JSON::Serializable

        # An Amazon Web Services resource collection type. This type specifies how analyzed Amazon Web
        # Services resources are defined. The two types of Amazon Web Services resource collections supported
        # are Amazon Web Services CloudFormation stacks and Amazon Web Services resources that contain the
        # same Amazon Web Services tag. DevOps Guru can be configured to analyze the Amazon Web Services
        # resources that are defined in the stacks or that are tagged using the same tag key . You can specify
        # up to 500 Amazon Web Services CloudFormation stacks.

        @[JSON::Field(key: "ResourceCollectionType")]
        getter resource_collection_type : String

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_collection_type : String,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeResourceCollectionHealthResponse
        include JSON::Serializable

        # The returned CloudFormationHealthOverview object that contains an InsightHealthOverview object with
        # the requested system health information.

        @[JSON::Field(key: "CloudFormation")]
        getter cloud_formation : Array(Types::CloudFormationHealth)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ServiceHealth objects that describes the health of the Amazon Web Services services
        # associated with the resources in the collection.

        @[JSON::Field(key: "Service")]
        getter service : Array(Types::ServiceHealth)?

        # The Amazon Web Services tags that are used by resources in the resource collection. Tags help you
        # identify and organize your Amazon Web Services resources. Many Amazon Web Services services support
        # tagging, so you can assign the same tag to resources from different services to indicate that the
        # resources are related. For example, you can assign the same tag to an Amazon DynamoDB table resource
        # that you assign to an Lambda function. For more information about using tags, see the Tagging best
        # practices whitepaper. Each Amazon Web Services tag has two parts. A tag key (for example, CostCenter
        # , Environment , Project , or Secret ). Tag keys are case-sensitive. An optional field known as a tag
        # value (for example, 111122223333 , Production , or a team name). Omitting the tag value is the same
        # as using an empty string. Like tag keys , tag values are case-sensitive. Together these are known as
        # key - value pairs. The string used for a key in a tag that you use to define your resource coverage
        # must begin with the prefix Devops-guru- . The tag key might be DevOps-Guru-deployment-application or
        # devops-guru-rds-application . When you create a key , the case of characters in the key can be
        # whatever you choose. After you create a key , it is case-sensitive. For example, DevOps Guru works
        # with a key named devops-guru-rds and a key named DevOps-Guru-RDS , and these act as two different
        # keys . Possible key / value pairs in your application might be
        # Devops-Guru-production-application/RDS or Devops-Guru-production-application/containers .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::TagHealth)?

        def initialize(
          @cloud_formation : Array(Types::CloudFormationHealth)? = nil,
          @next_token : String? = nil,
          @service : Array(Types::ServiceHealth)? = nil,
          @tags : Array(Types::TagHealth)? = nil
        )
        end
      end


      struct DescribeServiceIntegrationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeServiceIntegrationResponse
        include JSON::Serializable


        @[JSON::Field(key: "ServiceIntegration")]
        getter service_integration : Types::ServiceIntegrationConfig?

        def initialize(
          @service_integration : Types::ServiceIntegrationConfig? = nil
        )
        end
      end

      # A range of time that specifies when anomalous behavior in an anomaly or insight ended.

      struct EndTimeRange
        include JSON::Serializable

        # The earliest end time in the time range.

        @[JSON::Field(key: "FromTime")]
        getter from_time : Time?

        # The latest end time in the time range.

        @[JSON::Field(key: "ToTime")]
        getter to_time : Time?

        def initialize(
          @from_time : Time? = nil,
          @to_time : Time? = nil
        )
        end
      end

      # An Amazon Web Services resource event. Amazon Web Services resource events and metrics are analyzed
      # by DevOps Guru to find anomalous behavior and provide recommendations to improve your operational
      # solutions.

      struct Event
        include JSON::Serializable

        # The source, AWS_CLOUD_TRAIL or AWS_CODE_DEPLOY , where DevOps Guru analysis found the event.

        @[JSON::Field(key: "DataSource")]
        getter data_source : String?

        # The class of the event. The class specifies what the event is related to, such as an infrastructure
        # change, a deployment, or a schema change.

        @[JSON::Field(key: "EventClass")]
        getter event_class : String?

        # The Amazon Web Services source that emitted the event.

        @[JSON::Field(key: "EventSource")]
        getter event_source : String?

        # The ID of the event.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the event.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # An EventResource object that contains information about the resource that emitted the event.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::EventResource)?

        # A Timestamp that specifies the time the event occurred.

        @[JSON::Field(key: "Time")]
        getter time : Time?

        def initialize(
          @data_source : String? = nil,
          @event_class : String? = nil,
          @event_source : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @resources : Array(Types::EventResource)? = nil,
          @time : Time? = nil
        )
        end
      end

      # The Amazon Web Services resource that emitted an event. Amazon Web Services resource events and
      # metrics are analyzed by DevOps Guru to find anomalous behavior and provide recommendations to
      # improve your operational solutions.

      struct EventResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that emitted an event.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the resource that emitted an event.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of resource that emitted an event.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about the integration of DevOps Guru as consumer with another AWS service, such as AWS
      # CodeGuru Profiler via EventBridge.

      struct EventSourcesConfig
        include JSON::Serializable

        # Information about whether DevOps Guru is configured to consume recommendations which are generated
        # from AWS CodeGuru Profiler.

        @[JSON::Field(key: "AmazonCodeGuruProfiler")]
        getter amazon_code_guru_profiler : Types::AmazonCodeGuruProfilerIntegration?

        def initialize(
          @amazon_code_guru_profiler : Types::AmazonCodeGuruProfilerIntegration? = nil
        )
        end
      end

      # The time range during which an Amazon Web Services event occurred. Amazon Web Services resource
      # events and metrics are analyzed by DevOps Guru to find anomalous behavior and provide
      # recommendations to improve your operational solutions.

      struct EventTimeRange
        include JSON::Serializable

        # The time when the event started.

        @[JSON::Field(key: "FromTime")]
        getter from_time : Time

        # The time when the event ended.

        @[JSON::Field(key: "ToTime")]
        getter to_time : Time

        def initialize(
          @from_time : Time,
          @to_time : Time
        )
        end
      end


      struct GetCostEstimationRequest
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct GetCostEstimationResponse
        include JSON::Serializable

        # An array of ResourceCost objects that each contains details about the monthly cost estimate to
        # analyze one of your Amazon Web Services resources.

        @[JSON::Field(key: "Costs")]
        getter costs : Array(Types::ServiceResourceCost)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The collection of the Amazon Web Services resources used to create your monthly DevOps Guru cost
        # estimate.

        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::CostEstimationResourceCollectionFilter?

        # The status of creating this cost estimate. If it's still in progress, the status ONGOING is
        # returned. If it is finished, the status COMPLETED is returned.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The start and end time of the cost estimation.

        @[JSON::Field(key: "TimeRange")]
        getter time_range : Types::CostEstimationTimeRange?

        # The estimated monthly cost to analyze the Amazon Web Services resources. This value is the sum of
        # the estimated costs to analyze each resource in the Costs object in this response.

        @[JSON::Field(key: "TotalCost")]
        getter total_cost : Float64?

        def initialize(
          @costs : Array(Types::ServiceResourceCost)? = nil,
          @next_token : String? = nil,
          @resource_collection : Types::CostEstimationResourceCollectionFilter? = nil,
          @status : String? = nil,
          @time_range : Types::CostEstimationTimeRange? = nil,
          @total_cost : Float64? = nil
        )
        end
      end


      struct GetResourceCollectionRequest
        include JSON::Serializable

        # The type of Amazon Web Services resource collections to return. The one valid value is
        # CLOUD_FORMATION for Amazon Web Services CloudFormation stacks.

        @[JSON::Field(key: "ResourceCollectionType")]
        getter resource_collection_type : String

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_collection_type : String,
          @next_token : String? = nil
        )
        end
      end


      struct GetResourceCollectionResponse
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The requested list of Amazon Web Services resource collections. The two types of Amazon Web Services
        # resource collections supported are Amazon Web Services CloudFormation stacks and Amazon Web Services
        # resources that contain the same Amazon Web Services tag. DevOps Guru can be configured to analyze
        # the Amazon Web Services resources that are defined in the stacks or that are tagged using the same
        # tag key . You can specify up to 500 Amazon Web Services CloudFormation stacks.

        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollectionFilter?

        def initialize(
          @next_token : String? = nil,
          @resource_collection : Types::ResourceCollectionFilter? = nil
        )
        end
      end

      # Information about insight feedback received from a customer.

      struct InsightFeedback
        include JSON::Serializable

        # The feedback provided by the customer.

        @[JSON::Field(key: "Feedback")]
        getter feedback : String?

        # The insight feedback ID.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @feedback : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Information about the number of open reactive and proactive insights that can be used to gauge the
      # health of your system.

      struct InsightHealth
        include JSON::Serializable

        # The Meant Time to Recover (MTTR) for the insight.

        @[JSON::Field(key: "MeanTimeToRecoverInMilliseconds")]
        getter mean_time_to_recover_in_milliseconds : Int64?

        # The number of open proactive insights.

        @[JSON::Field(key: "OpenProactiveInsights")]
        getter open_proactive_insights : Int32?

        # The number of open reactive insights.

        @[JSON::Field(key: "OpenReactiveInsights")]
        getter open_reactive_insights : Int32?

        def initialize(
          @mean_time_to_recover_in_milliseconds : Int64? = nil,
          @open_proactive_insights : Int32? = nil,
          @open_reactive_insights : Int32? = nil
        )
        end
      end

      # A time ranged that specifies when the observed behavior in an insight started and ended.

      struct InsightTimeRange
        include JSON::Serializable

        # The time when the behavior described in an insight started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The time when the behavior described in an insight ended.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        def initialize(
          @start_time : Time,
          @end_time : Time? = nil
        )
        end
      end

      # An internal failure in an Amazon service occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The number of seconds after which the action that caused the internal server exception can be
        # retried.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Information about the KMS encryption used with DevOps Guru.

      struct KMSServerSideEncryptionIntegration
        include JSON::Serializable

        # Describes the specified KMS key. To specify a KMS key, use its key ID, key ARN, alias name, or alias
        # ARN. When using an alias name, prefix it with "alias/". If you specify a predefined Amazon Web
        # Services alias (an Amazon Web Services alias with no key ID), Amazon Web Services KMS associates the
        # alias with an Amazon Web Services managed key and returns its KeyId and Arn in the response. To
        # specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
        # For example: Key ID: 1234abcd-12ab-34cd-56ef-1234567890ab Key ARN:
        # arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab Alias name:
        # alias/ExampleAlias Alias ARN: arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias

        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        # Specifies if DevOps Guru is enabled for customer managed keys.

        @[JSON::Field(key: "OptInStatus")]
        getter opt_in_status : String?

        # The type of KMS key used. Customer managed keys are the KMS keys that you create. Amazon Web
        # Services owned keys are keys that are owned and managed by DevOps Guru.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @kms_key_id : String? = nil,
          @opt_in_status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about whether DevOps Guru is configured to encrypt server-side data using KMS.

      struct KMSServerSideEncryptionIntegrationConfig
        include JSON::Serializable

        # Describes the specified KMS key. To specify a KMS key, use its key ID, key ARN, alias name, or alias
        # ARN. When using an alias name, prefix it with "alias/". If you specify a predefined Amazon Web
        # Services alias (an Amazon Web Services alias with no key ID), Amazon Web Services KMS associates the
        # alias with an Amazon Web Services managed key and returns its KeyId and Arn in the response. To
        # specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.
        # For example: Key ID: 1234abcd-12ab-34cd-56ef-1234567890ab Key ARN:
        # arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab Alias name:
        # alias/ExampleAlias Alias ARN: arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias

        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        # Specifies if DevOps Guru is enabled for KMS integration.

        @[JSON::Field(key: "OptInStatus")]
        getter opt_in_status : String?

        # The type of KMS key used. Customer managed keys are the KMS keys that you create. Amazon Web
        # Services owned keys are keys that are owned and managed by DevOps Guru.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @kms_key_id : String? = nil,
          @opt_in_status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Specifies one or more service names that are used to list anomalies.

      struct ListAnomaliesForInsightFilters
        include JSON::Serializable


        @[JSON::Field(key: "ServiceCollection")]
        getter service_collection : Types::ServiceCollection?

        def initialize(
          @service_collection : Types::ServiceCollection? = nil
        )
        end
      end


      struct ListAnomaliesForInsightRequest
        include JSON::Serializable

        # The ID of the insight. The returned anomalies belong to this insight.

        @[JSON::Field(key: "InsightId")]
        getter insight_id : String

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Specifies one or more service names that are used to list anomalies.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListAnomaliesForInsightFilters?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A time range used to specify when the requested anomalies started. All returned anomalies started
        # during this time range.

        @[JSON::Field(key: "StartTimeRange")]
        getter start_time_range : Types::StartTimeRange?

        def initialize(
          @insight_id : String,
          @account_id : String? = nil,
          @filters : Types::ListAnomaliesForInsightFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time_range : Types::StartTimeRange? = nil
        )
        end
      end


      struct ListAnomaliesForInsightResponse
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ProactiveAnomalySummary objects that represent the requested anomalies

        @[JSON::Field(key: "ProactiveAnomalies")]
        getter proactive_anomalies : Array(Types::ProactiveAnomalySummary)?

        # An array of ReactiveAnomalySummary objects that represent the requested anomalies

        @[JSON::Field(key: "ReactiveAnomalies")]
        getter reactive_anomalies : Array(Types::ReactiveAnomalySummary)?

        def initialize(
          @next_token : String? = nil,
          @proactive_anomalies : Array(Types::ProactiveAnomalySummary)? = nil,
          @reactive_anomalies : Array(Types::ReactiveAnomalySummary)? = nil
        )
        end
      end


      struct ListAnomalousLogGroupsRequest
        include JSON::Serializable

        # The ID of the insight containing the log groups.

        @[JSON::Field(key: "InsightId")]
        getter insight_id : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @insight_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAnomalousLogGroupsResponse
        include JSON::Serializable

        # The list of Amazon CloudWatch log groups that are related to an insight.

        @[JSON::Field(key: "AnomalousLogGroups")]
        getter anomalous_log_groups : Array(Types::AnomalousLogGroup)

        # The ID of the insight containing the log groups.

        @[JSON::Field(key: "InsightId")]
        getter insight_id : String

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @anomalous_log_groups : Array(Types::AnomalousLogGroup),
          @insight_id : String,
          @next_token : String? = nil
        )
        end
      end

      # Filters you can use to specify which events are returned when ListEvents is called.

      struct ListEventsFilters
        include JSON::Serializable

        # The source, AWS_CLOUD_TRAIL or AWS_CODE_DEPLOY , of the events you want returned.

        @[JSON::Field(key: "DataSource")]
        getter data_source : String?

        # The class of the events you want to filter for, such as an infrastructure change, a deployment, or a
        # schema change.

        @[JSON::Field(key: "EventClass")]
        getter event_class : String?

        # The Amazon Web Services source that emitted the events you want to filter for.

        @[JSON::Field(key: "EventSource")]
        getter event_source : String?

        # A time range during which you want the filtered events to have occurred.

        @[JSON::Field(key: "EventTimeRange")]
        getter event_time_range : Types::EventTimeRange?

        # An ID of an insight that is related to the events you want to filter for.

        @[JSON::Field(key: "InsightId")]
        getter insight_id : String?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        def initialize(
          @data_source : String? = nil,
          @event_class : String? = nil,
          @event_source : String? = nil,
          @event_time_range : Types::EventTimeRange? = nil,
          @insight_id : String? = nil,
          @resource_collection : Types::ResourceCollection? = nil
        )
        end
      end


      struct ListEventsRequest
        include JSON::Serializable

        # A ListEventsFilters object used to specify which events to return.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListEventsFilters

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::ListEventsFilters,
          @account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventsResponse
        include JSON::Serializable

        # A list of the requested events.

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::Event),
          @next_token : String? = nil
        )
        end
      end

      # Used to filter for insights that have any status.

      struct ListInsightsAnyStatusFilter
        include JSON::Serializable

        # A time range used to specify when the behavior of the filtered insights started.

        @[JSON::Field(key: "StartTimeRange")]
        getter start_time_range : Types::StartTimeRange

        # Use to filter for either REACTIVE or PROACTIVE insights.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @start_time_range : Types::StartTimeRange,
          @type : String
        )
        end
      end

      # Used to filter for insights that have the status CLOSED .

      struct ListInsightsClosedStatusFilter
        include JSON::Serializable

        # A time range used to specify when the behavior of the filtered insights ended.

        @[JSON::Field(key: "EndTimeRange")]
        getter end_time_range : Types::EndTimeRange

        # Use to filter for either REACTIVE or PROACTIVE insights.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @end_time_range : Types::EndTimeRange,
          @type : String
        )
        end
      end

      # Used to filter for insights that have the status ONGOING .

      struct ListInsightsOngoingStatusFilter
        include JSON::Serializable

        # Use to filter for either REACTIVE or PROACTIVE insights.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end


      struct ListInsightsRequest
        include JSON::Serializable

        # A filter used to filter the returned insights by their status. You can specify one status filter.

        @[JSON::Field(key: "StatusFilter")]
        getter status_filter : Types::ListInsightsStatusFilter

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @status_filter : Types::ListInsightsStatusFilter,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInsightsResponse
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The returned list of proactive insights.

        @[JSON::Field(key: "ProactiveInsights")]
        getter proactive_insights : Array(Types::ProactiveInsightSummary)?

        # The returned list of reactive insights.

        @[JSON::Field(key: "ReactiveInsights")]
        getter reactive_insights : Array(Types::ReactiveInsightSummary)?

        def initialize(
          @next_token : String? = nil,
          @proactive_insights : Array(Types::ProactiveInsightSummary)? = nil,
          @reactive_insights : Array(Types::ReactiveInsightSummary)? = nil
        )
        end
      end

      # A filter used by ListInsights to specify which insights to return.

      struct ListInsightsStatusFilter
        include JSON::Serializable

        # A ListInsightsAnyStatusFilter that specifies insights of any status that are either REACTIVE or
        # PROACTIVE .

        @[JSON::Field(key: "Any")]
        getter any : Types::ListInsightsAnyStatusFilter?

        # A ListInsightsClosedStatusFilter that specifies closed insights that are either REACTIVE or
        # PROACTIVE .

        @[JSON::Field(key: "Closed")]
        getter closed : Types::ListInsightsClosedStatusFilter?

        # A ListInsightsAnyStatusFilter that specifies ongoing insights that are either REACTIVE or PROACTIVE
        # .

        @[JSON::Field(key: "Ongoing")]
        getter ongoing : Types::ListInsightsOngoingStatusFilter?

        def initialize(
          @any : Types::ListInsightsAnyStatusFilter? = nil,
          @closed : Types::ListInsightsClosedStatusFilter? = nil,
          @ongoing : Types::ListInsightsOngoingStatusFilter? = nil
        )
        end
      end

      # Filters to determine which monitored resources you want to retrieve. You can filter by resource type
      # or resource permission status.

      struct ListMonitoredResourcesFilters
        include JSON::Serializable

        # The permission status of a resource.

        @[JSON::Field(key: "ResourcePermission")]
        getter resource_permission : String

        # The type of resource that you wish to retrieve, such as log groups.

        @[JSON::Field(key: "ResourceTypeFilters")]
        getter resource_type_filters : Array(String)

        def initialize(
          @resource_permission : String,
          @resource_type_filters : Array(String)
        )
        end
      end


      struct ListMonitoredResourcesRequest
        include JSON::Serializable

        # Filters to determine which monitored resources you want to retrieve. You can filter by resource type
        # or resource permission status.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ListMonitoredResourcesFilters?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::ListMonitoredResourcesFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMonitoredResourcesResponse
        include JSON::Serializable

        # Information about the resource that is being monitored, including the name of the resource, the type
        # of resource, and whether or not permission is given to DevOps Guru to access that resource.

        @[JSON::Field(key: "MonitoredResourceIdentifiers")]
        getter monitored_resource_identifiers : Array(Types::MonitoredResourceIdentifier)

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @monitored_resource_identifiers : Array(Types::MonitoredResourceIdentifier),
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationChannelsRequest
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationChannelsResponse
        include JSON::Serializable

        # An array that contains the requested notification channels.

        @[JSON::Field(key: "Channels")]
        getter channels : Array(Types::NotificationChannel)?

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::NotificationChannel)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOrganizationInsightsRequest
        include JSON::Serializable


        @[JSON::Field(key: "StatusFilter")]
        getter status_filter : Types::ListInsightsStatusFilter

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the organizational unit.

        @[JSON::Field(key: "OrganizationalUnitIds")]
        getter organizational_unit_ids : Array(String)?

        def initialize(
          @status_filter : Types::ListInsightsStatusFilter,
          @account_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @organizational_unit_ids : Array(String)? = nil
        )
        end
      end


      struct ListOrganizationInsightsResponse
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An integer that specifies the number of open proactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "ProactiveInsights")]
        getter proactive_insights : Array(Types::ProactiveOrganizationInsightSummary)?

        # An integer that specifies the number of open reactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "ReactiveInsights")]
        getter reactive_insights : Array(Types::ReactiveOrganizationInsightSummary)?

        def initialize(
          @next_token : String? = nil,
          @proactive_insights : Array(Types::ProactiveOrganizationInsightSummary)? = nil,
          @reactive_insights : Array(Types::ReactiveOrganizationInsightSummary)? = nil
        )
        end
      end


      struct ListRecommendationsRequest
        include JSON::Serializable

        # The ID of the requested insight.

        @[JSON::Field(key: "InsightId")]
        getter insight_id : String

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # A locale that specifies the language to use for recommendations.

        @[JSON::Field(key: "Locale")]
        getter locale : String?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @insight_id : String,
          @account_id : String? = nil,
          @locale : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendationsResponse
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of the requested recommendations.

        @[JSON::Field(key: "Recommendations")]
        getter recommendations : Array(Types::Recommendation)?

        def initialize(
          @next_token : String? = nil,
          @recommendations : Array(Types::Recommendation)? = nil
        )
        end
      end

      # Information about an anomalous log event found within a log group.

      struct LogAnomalyClass
        include JSON::Serializable

        # The explanation for why the log event is considered an anomaly.

        @[JSON::Field(key: "Explanation")]
        getter explanation : String?

        # The token where the anomaly was detected. This may refer to an exception or another location, or it
        # may be blank for log anomalies such as format anomalies.

        @[JSON::Field(key: "LogAnomalyToken")]
        getter log_anomaly_token : String?

        # The type of log anomaly that has been detected.

        @[JSON::Field(key: "LogAnomalyType")]
        getter log_anomaly_type : String?

        # The ID of the log event.

        @[JSON::Field(key: "LogEventId")]
        getter log_event_id : String?

        # The time of the first occurrence of the anomalous log event.

        @[JSON::Field(key: "LogEventTimestamp")]
        getter log_event_timestamp : Time?

        # The name of the Amazon CloudWatch log stream that the anomalous log event belongs to. A log stream
        # is a sequence of log events that share the same source.

        @[JSON::Field(key: "LogStreamName")]
        getter log_stream_name : String?

        # The number of log lines where this anomalous log event occurs.

        @[JSON::Field(key: "NumberOfLogLinesOccurrences")]
        getter number_of_log_lines_occurrences : Int32?

        def initialize(
          @explanation : String? = nil,
          @log_anomaly_token : String? = nil,
          @log_anomaly_type : String? = nil,
          @log_event_id : String? = nil,
          @log_event_timestamp : Time? = nil,
          @log_stream_name : String? = nil,
          @number_of_log_lines_occurrences : Int32? = nil
        )
        end
      end

      # A cluster of similar anomalous log events found within a log group.

      struct LogAnomalyShowcase
        include JSON::Serializable

        # A list of anomalous log events that may be related.

        @[JSON::Field(key: "LogAnomalyClasses")]
        getter log_anomaly_classes : Array(Types::LogAnomalyClass)?

        def initialize(
          @log_anomaly_classes : Array(Types::LogAnomalyClass)? = nil
        )
        end
      end

      # Information about the integration of DevOps Guru with CloudWatch log groups for log anomaly
      # detection.

      struct LogsAnomalyDetectionIntegration
        include JSON::Serializable

        # Specifies if DevOps Guru is configured to perform log anomaly detection on CloudWatch log groups.

        @[JSON::Field(key: "OptInStatus")]
        getter opt_in_status : String?

        def initialize(
          @opt_in_status : String? = nil
        )
        end
      end

      # Information about the integration of DevOps Guru with CloudWatch log groups for log anomaly
      # detection. You can use this to update the configuration.

      struct LogsAnomalyDetectionIntegrationConfig
        include JSON::Serializable

        # Specifies if DevOps Guru is configured to perform log anomaly detection on CloudWatch log groups.

        @[JSON::Field(key: "OptInStatus")]
        getter opt_in_status : String?

        def initialize(
          @opt_in_status : String? = nil
        )
        end
      end

      # Information about the resource that is being monitored, including the name of the resource, the type
      # of resource, and whether or not permission is given to DevOps Guru to access that resource.

      struct MonitoredResourceIdentifier
        include JSON::Serializable

        # The time at which DevOps Guru last updated this resource.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : Time?

        # The name of the resource being monitored.

        @[JSON::Field(key: "MonitoredResourceName")]
        getter monitored_resource_name : String?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # The permission status of a resource.

        @[JSON::Field(key: "ResourcePermission")]
        getter resource_permission : String?

        # The type of resource being monitored.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @last_updated : Time? = nil,
          @monitored_resource_name : String? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @resource_permission : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about a notification channel. A notification channel is used to notify you when DevOps
      # Guru creates an insight. The one supported notification channel is Amazon Simple Notification
      # Service (Amazon SNS). If you use an Amazon SNS topic in another account, you must attach a policy to
      # it that grants DevOps Guru permission to send it notifications. DevOps Guru adds the required policy
      # on your behalf to send notifications using Amazon SNS in your account. DevOps Guru only supports
      # standard SNS topics. For more information, see Permissions for Amazon SNS topics . If you use an
      # Amazon SNS topic that is encrypted by an Amazon Web Services Key Management Service customer-managed
      # key (CMK), then you must add permissions to the CMK. For more information, see Permissions for
      # Amazon Web Services KMS–encrypted Amazon SNS topics .

      struct NotificationChannel
        include JSON::Serializable

        # A NotificationChannelConfig object that contains information about configured notification channels.

        @[JSON::Field(key: "Config")]
        getter config : Types::NotificationChannelConfig?

        # The ID of a notification channel.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @config : Types::NotificationChannelConfig? = nil,
          @id : String? = nil
        )
        end
      end

      # Information about notification channels you have configured with DevOps Guru. The one supported
      # notification channel is Amazon Simple Notification Service (Amazon SNS).

      struct NotificationChannelConfig
        include JSON::Serializable

        # Information about a notification channel configured in DevOps Guru to send notifications when
        # insights are created. If you use an Amazon SNS topic in another account, you must attach a policy to
        # it that grants DevOps Guru permission to send it notifications. DevOps Guru adds the required policy
        # on your behalf to send notifications using Amazon SNS in your account. DevOps Guru only supports
        # standard SNS topics. For more information, see Permissions for Amazon SNS topics . If you use an
        # Amazon SNS topic that is encrypted by an Amazon Web Services Key Management Service customer-managed
        # key (CMK), then you must add permissions to the CMK. For more information, see Permissions for
        # Amazon Web Services KMS–encrypted Amazon SNS topics .

        @[JSON::Field(key: "Sns")]
        getter sns : Types::SnsChannelConfig

        # The filter configurations for the Amazon SNS notification topic you use with DevOps Guru. If you do
        # not provide filter configurations, the default configurations are to receive notifications for all
        # message types of High or Medium severity.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::NotificationFilterConfig?

        def initialize(
          @sns : Types::SnsChannelConfig,
          @filters : Types::NotificationFilterConfig? = nil
        )
        end
      end

      # The filter configurations for the Amazon SNS notification topic you use with DevOps Guru. You can
      # choose to specify which events or message types to receive notifications for. You can also choose to
      # specify which severity levels to receive notifications for.

      struct NotificationFilterConfig
        include JSON::Serializable

        # The events that you want to receive notifications for. For example, you can choose to receive
        # notifications only when the severity level is upgraded or a new insight is created.

        @[JSON::Field(key: "MessageTypes")]
        getter message_types : Array(String)?

        # The severity levels that you want to receive notifications for. For example, you can choose to
        # receive notifications only for insights with HIGH and MEDIUM severity levels. For more information,
        # see Understanding insight severities .

        @[JSON::Field(key: "Severities")]
        getter severities : Array(String)?

        def initialize(
          @message_types : Array(String)? = nil,
          @severities : Array(String)? = nil
        )
        end
      end

      # Information about whether DevOps Guru is configured to create an OpsItem in Amazon Web Services
      # Systems Manager OpsCenter for each created insight.

      struct OpsCenterIntegration
        include JSON::Serializable

        # Specifies if DevOps Guru is enabled to create an Amazon Web Services Systems Manager OpsItem for
        # each created insight.

        @[JSON::Field(key: "OptInStatus")]
        getter opt_in_status : String?

        def initialize(
          @opt_in_status : String? = nil
        )
        end
      end

      # Information about whether DevOps Guru is configured to create an OpsItem in Amazon Web Services
      # Systems Manager OpsCenter for each created insight. You can use this to update the configuration.

      struct OpsCenterIntegrationConfig
        include JSON::Serializable

        # Specifies if DevOps Guru is enabled to create an Amazon Web Services Systems Manager OpsItem for
        # each created insight.

        @[JSON::Field(key: "OptInStatus")]
        getter opt_in_status : String?

        def initialize(
          @opt_in_status : String? = nil
        )
        end
      end

      # A logical grouping of Performance Insights metrics for a related subject area. For example, the
      # db.sql dimension group consists of the following dimensions: db.sql.id , db.sql.db_id ,
      # db.sql.statement , and db.sql.tokenized_id . Each response element returns a maximum of 500 bytes.
      # For larger elements, such as SQL statements, only the first 500 bytes are returned. Amazon RDS
      # Performance Insights enables you to monitor and explore different dimensions of database load based
      # on data captured from a running DB instance. DB load is measured as average active sessions.
      # Performance Insights provides the data to API consumers as a two-dimensional time-series dataset.
      # The time dimension provides DB load data for each time point in the queried time range. Each time
      # point decomposes overall load in relation to the requested dimensions, measured at that time point.
      # Examples include SQL, Wait event, User, and Host. To learn more about Performance Insights and
      # Amazon Aurora DB instances, go to the Amazon Aurora User Guide . To learn more about Performance
      # Insights and Amazon RDS DB instances, go to the Amazon RDS User Guide .

      struct PerformanceInsightsMetricDimensionGroup
        include JSON::Serializable

        # A list of specific dimensions from a dimension group. If this parameter is not present, then it
        # signifies that all of the dimensions in the group were requested or are present in the response.
        # Valid values for elements in the Dimensions array are: db.application.name - The name of the
        # application that is connected to the database (only Aurora PostgreSQL and RDS PostgreSQL) db.host.id
        # - The host ID of the connected client (all engines) db.host.name - The host name of the connected
        # client (all engines) db.name - The name of the database to which the client is connected (only
        # Aurora PostgreSQL, Amazon RDS PostgreSQL, Aurora MySQL, Amazon RDS MySQL, and MariaDB)
        # db.session_type.name - The type of the current session (only Aurora PostgreSQL and RDS PostgreSQL)
        # db.sql.id - The SQL ID generated by Performance Insights (all engines) db.sql.db_id - The SQL ID
        # generated by the database (all engines) db.sql.statement - The SQL text that is being executed (all
        # engines) db.sql.tokenized_id db.sql_tokenized.id - The SQL digest ID generated by Performance
        # Insights (all engines) db.sql_tokenized.db_id - SQL digest ID generated by the database (all
        # engines) db.sql_tokenized.statement - The SQL digest text (all engines) db.user.id - The ID of the
        # user logged in to the database (all engines) db.user.name - The name of the user logged in to the
        # database (all engines) db.wait_event.name - The event for which the backend is waiting (all engines)
        # db.wait_event.type - The type of event for which the backend is waiting (all engines)
        # db.wait_event_type.name - The name of the event type for which the backend is waiting (all engines)

        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(String)?

        # The name of the dimension group. Its valid values are: db - The name of the database to which the
        # client is connected (only Aurora PostgreSQL, Amazon RDS PostgreSQL, Aurora MySQL, Amazon RDS MySQL,
        # and MariaDB) db.application - The name of the application that is connected to the database (only
        # Aurora PostgreSQL and RDS PostgreSQL) db.host - The host name of the connected client (all engines)
        # db.session_type - The type of the current session (only Aurora PostgreSQL and RDS PostgreSQL) db.sql
        # - The SQL that is currently executing (all engines) db.sql_tokenized - The SQL digest (all engines)
        # db.wait_event - The event for which the database backend is waiting (all engines) db.wait_event_type
        # - The type of event for which the database backend is waiting (all engines) db.user - The user
        # logged in to the database (all engines)

        @[JSON::Field(key: "Group")]
        getter group : String?

        # The maximum number of items to fetch for this dimension group.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        def initialize(
          @dimensions : Array(String)? = nil,
          @group : String? = nil,
          @limit : Int32? = nil
        )
        end
      end

      # A single query to be processed. Use these parameters to query the Performance Insights
      # GetResourceMetrics API to retrieve the metrics for an anomaly. For more information, see
      # GetResourceMetrics in the Amazon RDS Performance Insights API Reference . Amazon RDS Performance
      # Insights enables you to monitor and explore different dimensions of database load based on data
      # captured from a running DB instance. DB load is measured as average active sessions. Performance
      # Insights provides the data to API consumers as a two-dimensional time-series dataset. The time
      # dimension provides DB load data for each time point in the queried time range. Each time point
      # decomposes overall load in relation to the requested dimensions, measured at that time point.
      # Examples include SQL, Wait event, User, and Host. To learn more about Performance Insights and
      # Amazon Aurora DB instances, go to the Amazon Aurora User Guide . To learn more about Performance
      # Insights and Amazon RDS DB instances, go to the Amazon RDS User Guide .

      struct PerformanceInsightsMetricQuery
        include JSON::Serializable

        # One or more filters to apply to a Performance Insights GetResourceMetrics API query. Restrictions:
        # Any number of filters by the same dimension, as specified in the GroupBy parameter. A single filter
        # for any other dimension in this dimension group.

        @[JSON::Field(key: "Filter")]
        getter filter : Hash(String, String)?

        # The specification for how to aggregate the data points from a Performance Insights
        # GetResourceMetrics API query. The Performance Insights query returns all of the dimensions within
        # that group, unless you provide the names of specific dimensions within that group. You can also
        # request that Performance Insights return a limited number of values for a dimension.

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Types::PerformanceInsightsMetricDimensionGroup?

        # The name of the meteric used used when querying an Performance Insights GetResourceMetrics API for
        # anomaly metrics. Valid values for Metric are: db.load.avg - a scaled representation of the number of
        # active sessions for the database engine. db.sampledload.avg - the raw number of active sessions for
        # the database engine. If the number of active sessions is less than an internal Performance Insights
        # threshold, db.load.avg and db.sampledload.avg are the same value. If the number of active sessions
        # is greater than the internal threshold, Performance Insights samples the active sessions, with
        # db.load.avg showing the scaled values, db.sampledload.avg showing the raw values, and
        # db.sampledload.avg less than db.load.avg . For most use cases, you can query db.load.avg only.

        @[JSON::Field(key: "Metric")]
        getter metric : String?

        def initialize(
          @filter : Hash(String, String)? = nil,
          @group_by : Types::PerformanceInsightsMetricDimensionGroup? = nil,
          @metric : String? = nil
        )
        end
      end

      # Details about Performance Insights metrics. Amazon RDS Performance Insights enables you to monitor
      # and explore different dimensions of database load based on data captured from a running DB instance.
      # DB load is measured as average active sessions. Performance Insights provides the data to API
      # consumers as a two-dimensional time-series dataset. The time dimension provides DB load data for
      # each time point in the queried time range. Each time point decomposes overall load in relation to
      # the requested dimensions, measured at that time point. Examples include SQL, Wait event, User, and
      # Host. To learn more about Performance Insights and Amazon Aurora DB instances, go to the Amazon
      # Aurora User Guide . To learn more about Performance Insights and Amazon RDS DB instances, go to the
      # Amazon RDS User Guide .

      struct PerformanceInsightsMetricsDetail
        include JSON::Serializable

        # The name used for a specific Performance Insights metric.

        @[JSON::Field(key: "MetricDisplayName")]
        getter metric_display_name : String?

        # A single query to be processed for the metric. For more information, see
        # PerformanceInsightsMetricQuery .

        @[JSON::Field(key: "MetricQuery")]
        getter metric_query : Types::PerformanceInsightsMetricQuery?

        # For more information, see PerformanceInsightsReferenceData .

        @[JSON::Field(key: "ReferenceData")]
        getter reference_data : Array(Types::PerformanceInsightsReferenceData)?

        # The metric statistics during the anomalous period detected by DevOps Guru;

        @[JSON::Field(key: "StatsAtAnomaly")]
        getter stats_at_anomaly : Array(Types::PerformanceInsightsStat)?

        # Typical metric statistics that are not considered anomalous. When DevOps Guru analyzes metrics, it
        # compares them to StatsAtBaseline to help determine if they are anomalous.

        @[JSON::Field(key: "StatsAtBaseline")]
        getter stats_at_baseline : Array(Types::PerformanceInsightsStat)?

        # The unit of measure for a metric. For example, a session or a process.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @metric_display_name : String? = nil,
          @metric_query : Types::PerformanceInsightsMetricQuery? = nil,
          @reference_data : Array(Types::PerformanceInsightsReferenceData)? = nil,
          @stats_at_anomaly : Array(Types::PerformanceInsightsStat)? = nil,
          @stats_at_baseline : Array(Types::PerformanceInsightsStat)? = nil,
          @unit : String? = nil
        )
        end
      end

      # Reference scalar values and other metrics that DevOps Guru displays on a graph in its console along
      # with the actual metrics it analyzed. Compare these reference values to your actual metrics to help
      # you understand anomalous behavior that DevOps Guru detected.

      struct PerformanceInsightsReferenceComparisonValues
        include JSON::Serializable

        # A metric that DevOps Guru compares to actual metric values. This reference metric is used to
        # determine if an actual metric should be considered anomalous.

        @[JSON::Field(key: "ReferenceMetric")]
        getter reference_metric : Types::PerformanceInsightsReferenceMetric?

        # A scalar value DevOps Guru for a metric that DevOps Guru compares to actual metric values. This
        # reference value is used to determine if an actual metric value should be considered anomalous.

        @[JSON::Field(key: "ReferenceScalar")]
        getter reference_scalar : Types::PerformanceInsightsReferenceScalar?

        def initialize(
          @reference_metric : Types::PerformanceInsightsReferenceMetric? = nil,
          @reference_scalar : Types::PerformanceInsightsReferenceScalar? = nil
        )
        end
      end

      # Reference data used to evaluate Performance Insights to determine if its performance is anomalous or
      # not.

      struct PerformanceInsightsReferenceData
        include JSON::Serializable

        # The specific reference values used to evaluate the Performance Insights. For more information, see
        # PerformanceInsightsReferenceComparisonValues .

        @[JSON::Field(key: "ComparisonValues")]
        getter comparison_values : Types::PerformanceInsightsReferenceComparisonValues?

        # The name of the reference data.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @comparison_values : Types::PerformanceInsightsReferenceComparisonValues? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about a reference metric used to evaluate Performance Insights.

      struct PerformanceInsightsReferenceMetric
        include JSON::Serializable

        # A query to be processed on the metric.

        @[JSON::Field(key: "MetricQuery")]
        getter metric_query : Types::PerformanceInsightsMetricQuery?

        def initialize(
          @metric_query : Types::PerformanceInsightsMetricQuery? = nil
        )
        end
      end

      # A reference value to compare Performance Insights metrics against to determine if the metrics
      # demonstrate anomalous behavior.

      struct PerformanceInsightsReferenceScalar
        include JSON::Serializable

        # The reference value.

        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @value : Float64? = nil
        )
        end
      end

      # A statistic in a Performance Insights collection.

      struct PerformanceInsightsStat
        include JSON::Serializable

        # The statistic type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The value of the statistic.

        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @type : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # The time range during which anomalous behavior in a proactive anomaly or an insight is expected to
      # occur.

      struct PredictionTimeRange
        include JSON::Serializable

        # The time range during which a metric limit is expected to be exceeded. This applies to proactive
        # insights only.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The time when the behavior in a proactive insight is expected to end.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        def initialize(
          @start_time : Time,
          @end_time : Time? = nil
        )
        end
      end

      # Information about an anomaly. This object is returned by ListAnomalies .

      struct ProactiveAnomaly
        include JSON::Serializable

        # An AnomalyReportedTimeRange object that specifies the time range between when the anomaly is opened
        # and the time when it is closed.

        @[JSON::Field(key: "AnomalyReportedTimeRange")]
        getter anomaly_reported_time_range : Types::AnomalyReportedTimeRange?

        # Information about a resource in which DevOps Guru detected anomalous behavior.

        @[JSON::Field(key: "AnomalyResources")]
        getter anomaly_resources : Array(Types::AnomalyResource)?


        @[JSON::Field(key: "AnomalyTimeRange")]
        getter anomaly_time_range : Types::AnomalyTimeRange?

        # The ID of the insight that contains this anomaly. An insight is composed of related anomalies.

        @[JSON::Field(key: "AssociatedInsightId")]
        getter associated_insight_id : String?

        # A description of the proactive anomaly.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of a proactive anomaly.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A threshold that was exceeded by behavior in analyzed resources. Exceeding this threshold is related
        # to the anomalous behavior that generated this anomaly.

        @[JSON::Field(key: "Limit")]
        getter limit : Float64?


        @[JSON::Field(key: "PredictionTimeRange")]
        getter prediction_time_range : Types::PredictionTimeRange?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # The severity of the anomaly. The severity of anomalies that generate an insight determine that
        # insight's severity. For more information, see Understanding insight severities in the Amazon DevOps
        # Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # Details about the source of the analyzed operational data that triggered the anomaly. The one
        # supported source is Amazon CloudWatch metrics.

        @[JSON::Field(key: "SourceDetails")]
        getter source_details : Types::AnomalySourceDetails?

        # The metadata for the anomaly.

        @[JSON::Field(key: "SourceMetadata")]
        getter source_metadata : Types::AnomalySourceMetadata?

        # The status of a proactive anomaly.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time of the anomaly's most recent update.

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time?

        def initialize(
          @anomaly_reported_time_range : Types::AnomalyReportedTimeRange? = nil,
          @anomaly_resources : Array(Types::AnomalyResource)? = nil,
          @anomaly_time_range : Types::AnomalyTimeRange? = nil,
          @associated_insight_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @limit : Float64? = nil,
          @prediction_time_range : Types::PredictionTimeRange? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @severity : String? = nil,
          @source_details : Types::AnomalySourceDetails? = nil,
          @source_metadata : Types::AnomalySourceMetadata? = nil,
          @status : String? = nil,
          @update_time : Time? = nil
        )
        end
      end

      # Details about a proactive anomaly. This object is returned by DescribeAnomaly.

      struct ProactiveAnomalySummary
        include JSON::Serializable

        # An AnomalyReportedTimeRange object that specifies the time range between when the anomaly is opened
        # and the time when it is closed.

        @[JSON::Field(key: "AnomalyReportedTimeRange")]
        getter anomaly_reported_time_range : Types::AnomalyReportedTimeRange?

        # Information about a resource in which DevOps Guru detected anomalous behavior.

        @[JSON::Field(key: "AnomalyResources")]
        getter anomaly_resources : Array(Types::AnomalyResource)?


        @[JSON::Field(key: "AnomalyTimeRange")]
        getter anomaly_time_range : Types::AnomalyTimeRange?

        # The ID of the insight that contains this anomaly. An insight is composed of related anomalies.

        @[JSON::Field(key: "AssociatedInsightId")]
        getter associated_insight_id : String?

        # A description of the proactive anomaly.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the anomaly.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A threshold that was exceeded by behavior in analyzed resources. Exceeding this threshold is related
        # to the anomalous behavior that generated this anomaly.

        @[JSON::Field(key: "Limit")]
        getter limit : Float64?


        @[JSON::Field(key: "PredictionTimeRange")]
        getter prediction_time_range : Types::PredictionTimeRange?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # The severity of the anomaly. The severity of anomalies that generate an insight determine that
        # insight's severity. For more information, see Understanding insight severities in the Amazon DevOps
        # Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # Details about the source of the analyzed operational data that triggered the anomaly. The one
        # supported source is Amazon CloudWatch metrics.

        @[JSON::Field(key: "SourceDetails")]
        getter source_details : Types::AnomalySourceDetails?

        # The metadata of the source which detects proactive anomalies.

        @[JSON::Field(key: "SourceMetadata")]
        getter source_metadata : Types::AnomalySourceMetadata?

        # The status of the anomaly.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time of the anomaly's most recent update.

        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time?

        def initialize(
          @anomaly_reported_time_range : Types::AnomalyReportedTimeRange? = nil,
          @anomaly_resources : Array(Types::AnomalyResource)? = nil,
          @anomaly_time_range : Types::AnomalyTimeRange? = nil,
          @associated_insight_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @limit : Float64? = nil,
          @prediction_time_range : Types::PredictionTimeRange? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @severity : String? = nil,
          @source_details : Types::AnomalySourceDetails? = nil,
          @source_metadata : Types::AnomalySourceMetadata? = nil,
          @status : String? = nil,
          @update_time : Time? = nil
        )
        end
      end

      # Details about a proactive insight. This object is returned by ListInsights .

      struct ProactiveInsight
        include JSON::Serializable

        # Describes the proactive insight.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the proactive insight.

        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "InsightTimeRange")]
        getter insight_time_range : Types::InsightTimeRange?

        # The name of the proactive insight.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "PredictionTimeRange")]
        getter prediction_time_range : Types::PredictionTimeRange?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # The severity of the insight. For more information, see Understanding insight severities in the
        # Amazon DevOps Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The ID of the Amazon Web Services System Manager OpsItem created for this insight. You must enable
        # the creation of OpstItems insights before they are created for each insight.

        @[JSON::Field(key: "SsmOpsItemId")]
        getter ssm_ops_item_id : String?

        # The status of the proactive insight.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @id : String? = nil,
          @insight_time_range : Types::InsightTimeRange? = nil,
          @name : String? = nil,
          @prediction_time_range : Types::PredictionTimeRange? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @severity : String? = nil,
          @ssm_ops_item_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about a proactive insight. This object is returned by DescribeInsight.

      struct ProactiveInsightSummary
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the Amazon Web Services resources that generated this insight.

        @[JSON::Field(key: "AssociatedResourceArns")]
        getter associated_resource_arns : Array(String)?

        # The ID of the proactive insight.

        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "InsightTimeRange")]
        getter insight_time_range : Types::InsightTimeRange?

        # The name of the proactive insight.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "PredictionTimeRange")]
        getter prediction_time_range : Types::PredictionTimeRange?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # A collection of the names of Amazon Web Services services.

        @[JSON::Field(key: "ServiceCollection")]
        getter service_collection : Types::ServiceCollection?

        # The severity of the insight. For more information, see Understanding insight severities in the
        # Amazon DevOps Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The status of the proactive insight.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @associated_resource_arns : Array(String)? = nil,
          @id : String? = nil,
          @insight_time_range : Types::InsightTimeRange? = nil,
          @name : String? = nil,
          @prediction_time_range : Types::PredictionTimeRange? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @service_collection : Types::ServiceCollection? = nil,
          @severity : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about a proactive insight. This object is returned by DescribeInsight .

      struct ProactiveOrganizationInsightSummary
        include JSON::Serializable

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The ID of the insight summary.

        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "InsightTimeRange")]
        getter insight_time_range : Types::InsightTimeRange?

        # The name of the insight summary.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the organizational unit.

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String?


        @[JSON::Field(key: "PredictionTimeRange")]
        getter prediction_time_range : Types::PredictionTimeRange?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?


        @[JSON::Field(key: "ServiceCollection")]
        getter service_collection : Types::ServiceCollection?

        # An array of severity values used to search for insights. For more information, see Understanding
        # insight severities in the Amazon DevOps Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # An array of status values used to search for insights.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @id : String? = nil,
          @insight_time_range : Types::InsightTimeRange? = nil,
          @name : String? = nil,
          @organizational_unit_id : String? = nil,
          @prediction_time_range : Types::PredictionTimeRange? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @service_collection : Types::ServiceCollection? = nil,
          @severity : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct PutFeedbackRequest
        include JSON::Serializable

        # The feedback from customers is about the recommendations in this insight.

        @[JSON::Field(key: "InsightFeedback")]
        getter insight_feedback : Types::InsightFeedback?

        def initialize(
          @insight_feedback : Types::InsightFeedback? = nil
        )
        end
      end


      struct PutFeedbackResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Details about a reactive anomaly. This object is returned by ListAnomalies .

      struct ReactiveAnomaly
        include JSON::Serializable

        # An AnomalyReportedTimeRange object that specifies the time range between when the anomaly is opened
        # and the time when it is closed.

        @[JSON::Field(key: "AnomalyReportedTimeRange")]
        getter anomaly_reported_time_range : Types::AnomalyReportedTimeRange?

        # The Amazon Web Services resources in which anomalous behavior was detected by DevOps Guru.

        @[JSON::Field(key: "AnomalyResources")]
        getter anomaly_resources : Array(Types::AnomalyResource)?


        @[JSON::Field(key: "AnomalyTimeRange")]
        getter anomaly_time_range : Types::AnomalyTimeRange?

        # The ID of the insight that contains this anomaly. An insight is composed of related anomalies.

        @[JSON::Field(key: "AssociatedInsightId")]
        getter associated_insight_id : String?

        # The ID of the causal anomaly that is associated with this reactive anomaly. The ID of a `CAUSAL`
        # anomaly is always `NULL`.

        @[JSON::Field(key: "CausalAnomalyId")]
        getter causal_anomaly_id : String?

        # A description of the reactive anomaly.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the reactive anomaly.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the reactive anomaly.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # The severity of the anomaly. The severity of anomalies that generate an insight determine that
        # insight's severity. For more information, see Understanding insight severities in the Amazon DevOps
        # Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # Details about the source of the analyzed operational data that triggered the anomaly. The one
        # supported source is Amazon CloudWatch metrics.

        @[JSON::Field(key: "SourceDetails")]
        getter source_details : Types::AnomalySourceDetails?

        # The status of the anomaly.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of the reactive anomaly. It can be one of the following types. CAUSAL - the anomaly can
        # cause a new insight. CONTEXTUAL - the anomaly contains additional information about an insight or
        # its causal anomaly.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @anomaly_reported_time_range : Types::AnomalyReportedTimeRange? = nil,
          @anomaly_resources : Array(Types::AnomalyResource)? = nil,
          @anomaly_time_range : Types::AnomalyTimeRange? = nil,
          @associated_insight_id : String? = nil,
          @causal_anomaly_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @severity : String? = nil,
          @source_details : Types::AnomalySourceDetails? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Details about a reactive anomaly. This object is returned by DescribeAnomaly.

      struct ReactiveAnomalySummary
        include JSON::Serializable

        # An AnomalyReportedTimeRange object that specifies the time range between when the anomaly is opened
        # and the time when it is closed.

        @[JSON::Field(key: "AnomalyReportedTimeRange")]
        getter anomaly_reported_time_range : Types::AnomalyReportedTimeRange?

        # The Amazon Web Services resources in which anomalous behavior was detected by DevOps Guru.

        @[JSON::Field(key: "AnomalyResources")]
        getter anomaly_resources : Array(Types::AnomalyResource)?


        @[JSON::Field(key: "AnomalyTimeRange")]
        getter anomaly_time_range : Types::AnomalyTimeRange?

        # The ID of the insight that contains this anomaly. An insight is composed of related anomalies.

        @[JSON::Field(key: "AssociatedInsightId")]
        getter associated_insight_id : String?

        # The ID of the causal anomaly that is associated with this reactive anomaly. The ID of a `CAUSAL`
        # anomaly is always `NULL`.

        @[JSON::Field(key: "CausalAnomalyId")]
        getter causal_anomaly_id : String?

        # A description of the reactive anomaly.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the reactive anomaly.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the reactive anomaly.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # The severity of the anomaly. The severity of anomalies that generate an insight determine that
        # insight's severity. For more information, see Understanding insight severities in the Amazon DevOps
        # Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # Details about the source of the analyzed operational data that triggered the anomaly. The one
        # supported source is Amazon CloudWatch metrics.

        @[JSON::Field(key: "SourceDetails")]
        getter source_details : Types::AnomalySourceDetails?

        # The status of the reactive anomaly.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of the reactive anomaly. It can be one of the following types. CAUSAL - the anomaly can
        # cause a new insight. CONTEXTUAL - the anomaly contains additional information about an insight or
        # its causal anomaly.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @anomaly_reported_time_range : Types::AnomalyReportedTimeRange? = nil,
          @anomaly_resources : Array(Types::AnomalyResource)? = nil,
          @anomaly_time_range : Types::AnomalyTimeRange? = nil,
          @associated_insight_id : String? = nil,
          @causal_anomaly_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @severity : String? = nil,
          @source_details : Types::AnomalySourceDetails? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about a reactive insight. This object is returned by ListInsights .

      struct ReactiveInsight
        include JSON::Serializable

        # Describes the reactive insight.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of a reactive insight.

        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "InsightTimeRange")]
        getter insight_time_range : Types::InsightTimeRange?

        # The name of a reactive insight.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # The severity of the insight. For more information, see Understanding insight severities in the
        # Amazon DevOps Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The ID of the Amazon Web Services System Manager OpsItem created for this insight. You must enable
        # the creation of OpstItems insights before they are created for each insight.

        @[JSON::Field(key: "SsmOpsItemId")]
        getter ssm_ops_item_id : String?

        # The status of a reactive insight.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @id : String? = nil,
          @insight_time_range : Types::InsightTimeRange? = nil,
          @name : String? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @severity : String? = nil,
          @ssm_ops_item_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about a reactive insight. This object is returned by DescribeInsight.

      struct ReactiveInsightSummary
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the Amazon Web Services resources that generated this insight.

        @[JSON::Field(key: "AssociatedResourceArns")]
        getter associated_resource_arns : Array(String)?

        # The ID of a reactive summary.

        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "InsightTimeRange")]
        getter insight_time_range : Types::InsightTimeRange?

        # The name of a reactive insight.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # A collection of the names of Amazon Web Services services.

        @[JSON::Field(key: "ServiceCollection")]
        getter service_collection : Types::ServiceCollection?

        # The severity of the insight. For more information, see Understanding insight severities in the
        # Amazon DevOps Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The status of a reactive insight.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @associated_resource_arns : Array(String)? = nil,
          @id : String? = nil,
          @insight_time_range : Types::InsightTimeRange? = nil,
          @name : String? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @service_collection : Types::ServiceCollection? = nil,
          @severity : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about a reactive insight. This object is returned by DescribeInsight .

      struct ReactiveOrganizationInsightSummary
        include JSON::Serializable

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The ID of the insight summary.

        @[JSON::Field(key: "Id")]
        getter id : String?


        @[JSON::Field(key: "InsightTimeRange")]
        getter insight_time_range : Types::InsightTimeRange?

        # The name of the insight summary.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the organizational unit.

        @[JSON::Field(key: "OrganizationalUnitId")]
        getter organizational_unit_id : String?


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?


        @[JSON::Field(key: "ServiceCollection")]
        getter service_collection : Types::ServiceCollection?

        # An array of severity values used to search for insights. For more information, see Understanding
        # insight severities in the Amazon DevOps Guru User Guide .

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # An array of status values used to search for insights.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @id : String? = nil,
          @insight_time_range : Types::InsightTimeRange? = nil,
          @name : String? = nil,
          @organizational_unit_id : String? = nil,
          @resource_collection : Types::ResourceCollection? = nil,
          @service_collection : Types::ServiceCollection? = nil,
          @severity : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Recommendation information to help you remediate detected anomalous behavior that generated an
      # insight.

      struct Recommendation
        include JSON::Serializable

        # The category type of the recommendation.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # A description of the problem.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A hyperlink to information to help you address the problem.

        @[JSON::Field(key: "Link")]
        getter link : String?

        # The name of the recommendation.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The reason DevOps Guru flagged the anomalous behavior as a problem.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # Anomalies that are related to the problem. Use these Anomalies to learn more about what's happening
        # and to help address the issue.

        @[JSON::Field(key: "RelatedAnomalies")]
        getter related_anomalies : Array(Types::RecommendationRelatedAnomaly)?

        # Events that are related to the problem. Use these events to learn more about what's happening and to
        # help address the issue.

        @[JSON::Field(key: "RelatedEvents")]
        getter related_events : Array(Types::RecommendationRelatedEvent)?

        def initialize(
          @category : String? = nil,
          @description : String? = nil,
          @link : String? = nil,
          @name : String? = nil,
          @reason : String? = nil,
          @related_anomalies : Array(Types::RecommendationRelatedAnomaly)? = nil,
          @related_events : Array(Types::RecommendationRelatedEvent)? = nil
        )
        end
      end

      # Information about an anomaly that is related to a recommendation.

      struct RecommendationRelatedAnomaly
        include JSON::Serializable

        # The ID of an anomaly that generated the insight with this recommendation.

        @[JSON::Field(key: "AnomalyId")]
        getter anomaly_id : String?

        # An array of objects that represent resources in which DevOps Guru detected anomalous behavior. Each
        # object contains the name and type of the resource.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::RecommendationRelatedAnomalyResource)?

        # Information about where the anomalous behavior related the recommendation was found. For example,
        # details in Amazon CloudWatch metrics.

        @[JSON::Field(key: "SourceDetails")]
        getter source_details : Array(Types::RecommendationRelatedAnomalySourceDetail)?

        def initialize(
          @anomaly_id : String? = nil,
          @resources : Array(Types::RecommendationRelatedAnomalyResource)? = nil,
          @source_details : Array(Types::RecommendationRelatedAnomalySourceDetail)? = nil
        )
        end
      end

      # Information about a resource in which DevOps Guru detected anomalous behavior.

      struct RecommendationRelatedAnomalyResource
        include JSON::Serializable

        # The name of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of the resource. Resource types take the same form that is used by Amazon Web Services
        # CloudFormation resource type identifiers, service-provider::service-name::data-type-name . For
        # example, AWS::RDS::DBCluster . For more information, see Amazon Web Services resource and property
        # types reference in the Amazon Web Services CloudFormation User Guide .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains an array of RecommendationRelatedCloudWatchMetricsSourceDetail objects that contain the
      # name and namespace of an Amazon CloudWatch metric.

      struct RecommendationRelatedAnomalySourceDetail
        include JSON::Serializable

        # An array of CloudWatchMetricsDetail objects that contains information about the analyzed metrics
        # that displayed anomalous behavior.

        @[JSON::Field(key: "CloudWatchMetrics")]
        getter cloud_watch_metrics : Array(Types::RecommendationRelatedCloudWatchMetricsSourceDetail)?

        def initialize(
          @cloud_watch_metrics : Array(Types::RecommendationRelatedCloudWatchMetricsSourceDetail)? = nil
        )
        end
      end

      # Information about an Amazon CloudWatch metric that is analyzed by DevOps Guru. It is one of many
      # analyzed metrics that are used to generate insights.

      struct RecommendationRelatedCloudWatchMetricsSourceDetail
        include JSON::Serializable

        # The name of the CloudWatch metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The namespace of the CloudWatch metric. A namespace is a container for CloudWatch metrics.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        def initialize(
          @metric_name : String? = nil,
          @namespace : String? = nil
        )
        end
      end

      # Information about an event that is related to a recommendation.

      struct RecommendationRelatedEvent
        include JSON::Serializable

        # The name of the event. This corresponds to the Name field in an Event object.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A ResourceCollection object that contains arrays of the names of Amazon Web Services CloudFormation
        # stacks. You can specify up to 500 Amazon Web Services CloudFormation stacks.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::RecommendationRelatedEventResource)?

        def initialize(
          @name : String? = nil,
          @resources : Array(Types::RecommendationRelatedEventResource)? = nil
        )
        end
      end

      # Information about an Amazon Web Services resource that emitted and event that is related to a
      # recommendation in an insight.

      struct RecommendationRelatedEventResource
        include JSON::Serializable

        # The name of the resource that emitted the event. This corresponds to the Name field in an
        # EventResource object.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of the resource that emitted the event. This corresponds to the Type field in an
        # EventResource object.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct RemoveNotificationChannelRequest
        include JSON::Serializable

        # The ID of the notification channel to be removed.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct RemoveNotificationChannelResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A collection of Amazon Web Services resources supported by DevOps Guru. The two types of Amazon Web
      # Services resource collections supported are Amazon Web Services CloudFormation stacks and Amazon Web
      # Services resources that contain the same Amazon Web Services tag. DevOps Guru can be configured to
      # analyze the Amazon Web Services resources that are defined in the stacks or that are tagged using
      # the same tag key . You can specify up to 500 Amazon Web Services CloudFormation stacks.

      struct ResourceCollection
        include JSON::Serializable

        # An array of the names of Amazon Web Services CloudFormation stacks. The stacks define Amazon Web
        # Services resources that DevOps Guru analyzes. You can specify up to 500 Amazon Web Services
        # CloudFormation stacks.

        @[JSON::Field(key: "CloudFormation")]
        getter cloud_formation : Types::CloudFormationCollection?

        # The Amazon Web Services tags that are used by resources in the resource collection. Tags help you
        # identify and organize your Amazon Web Services resources. Many Amazon Web Services services support
        # tagging, so you can assign the same tag to resources from different services to indicate that the
        # resources are related. For example, you can assign the same tag to an Amazon DynamoDB table resource
        # that you assign to an Lambda function. For more information about using tags, see the Tagging best
        # practices whitepaper. Each Amazon Web Services tag has two parts. A tag key (for example, CostCenter
        # , Environment , Project , or Secret ). Tag keys are case-sensitive. An optional field known as a tag
        # value (for example, 111122223333 , Production , or a team name). Omitting the tag value is the same
        # as using an empty string. Like tag keys , tag values are case-sensitive. Together these are known as
        # key - value pairs. The string used for a key in a tag that you use to define your resource coverage
        # must begin with the prefix Devops-guru- . The tag key might be DevOps-Guru-deployment-application or
        # devops-guru-rds-application . When you create a key , the case of characters in the key can be
        # whatever you choose. After you create a key , it is case-sensitive. For example, DevOps Guru works
        # with a key named devops-guru-rds and a key named DevOps-Guru-RDS , and these act as two different
        # keys . Possible key / value pairs in your application might be
        # Devops-Guru-production-application/RDS or Devops-Guru-production-application/containers .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::TagCollection)?

        def initialize(
          @cloud_formation : Types::CloudFormationCollection? = nil,
          @tags : Array(Types::TagCollection)? = nil
        )
        end
      end

      # Information about a filter used to specify which Amazon Web Services resources are analyzed for
      # anomalous behavior by DevOps Guru.

      struct ResourceCollectionFilter
        include JSON::Serializable

        # Information about Amazon Web Services CloudFormation stacks. You can use up to 500 stacks to specify
        # which Amazon Web Services resources in your account to analyze. For more information, see Stacks in
        # the Amazon Web Services CloudFormation User Guide .

        @[JSON::Field(key: "CloudFormation")]
        getter cloud_formation : Types::CloudFormationCollectionFilter?

        # The Amazon Web Services tags used to filter the resources in the resource collection. Tags help you
        # identify and organize your Amazon Web Services resources. Many Amazon Web Services services support
        # tagging, so you can assign the same tag to resources from different services to indicate that the
        # resources are related. For example, you can assign the same tag to an Amazon DynamoDB table resource
        # that you assign to an Lambda function. For more information about using tags, see the Tagging best
        # practices whitepaper. Each Amazon Web Services tag has two parts. A tag key (for example, CostCenter
        # , Environment , Project , or Secret ). Tag keys are case-sensitive. An optional field known as a tag
        # value (for example, 111122223333 , Production , or a team name). Omitting the tag value is the same
        # as using an empty string. Like tag keys , tag values are case-sensitive. Together these are known as
        # key - value pairs. The string used for a key in a tag that you use to define your resource coverage
        # must begin with the prefix Devops-guru- . The tag key might be DevOps-Guru-deployment-application or
        # devops-guru-rds-application . When you create a key , the case of characters in the key can be
        # whatever you choose. After you create a key , it is case-sensitive. For example, DevOps Guru works
        # with a key named devops-guru-rds and a key named DevOps-Guru-RDS , and these act as two different
        # keys . Possible key / value pairs in your application might be
        # Devops-Guru-production-application/RDS or Devops-Guru-production-application/containers .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::TagCollectionFilter)?

        def initialize(
          @cloud_formation : Types::CloudFormationCollectionFilter? = nil,
          @tags : Array(Types::TagCollectionFilter)? = nil
        )
        end
      end

      # A requested resource could not be found

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The ID of the Amazon Web Services resource that could not be found.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the Amazon Web Services resource that could not be found.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Specifies values used to filter responses when searching for insights. You can use a
      # ResourceCollection , ServiceCollection , array of severities, and an array of status values. Each
      # filter type contains one or more values to search for. If you specify multiple filter types, the
      # filter types are joined with an AND , and the request returns only results that match all of the
      # specified filters.

      struct SearchInsightsFilters
        include JSON::Serializable


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?

        # A collection of the names of Amazon Web Services services.

        @[JSON::Field(key: "ServiceCollection")]
        getter service_collection : Types::ServiceCollection?

        # An array of severity values used to search for insights.

        @[JSON::Field(key: "Severities")]
        getter severities : Array(String)?

        # An array of status values used to search for insights.

        @[JSON::Field(key: "Statuses")]
        getter statuses : Array(String)?

        def initialize(
          @resource_collection : Types::ResourceCollection? = nil,
          @service_collection : Types::ServiceCollection? = nil,
          @severities : Array(String)? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end


      struct SearchInsightsRequest
        include JSON::Serializable

        # The start of the time range passed in. Returned insights occurred after this time.

        @[JSON::Field(key: "StartTimeRange")]
        getter start_time_range : Types::StartTimeRange

        # The type of insights you are searching for ( REACTIVE or PROACTIVE ).

        @[JSON::Field(key: "Type")]
        getter type : String

        # A SearchInsightsFilters object that is used to set the severity and status filters on your insight
        # search.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::SearchInsightsFilters?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @start_time_range : Types::StartTimeRange,
          @type : String,
          @filters : Types::SearchInsightsFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchInsightsResponse
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The returned proactive insights.

        @[JSON::Field(key: "ProactiveInsights")]
        getter proactive_insights : Array(Types::ProactiveInsightSummary)?

        # The returned reactive insights.

        @[JSON::Field(key: "ReactiveInsights")]
        getter reactive_insights : Array(Types::ReactiveInsightSummary)?

        def initialize(
          @next_token : String? = nil,
          @proactive_insights : Array(Types::ProactiveInsightSummary)? = nil,
          @reactive_insights : Array(Types::ReactiveInsightSummary)? = nil
        )
        end
      end

      # Filters you can use to specify which events are returned when ListEvents is called.

      struct SearchOrganizationInsightsFilters
        include JSON::Serializable


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::ResourceCollection?


        @[JSON::Field(key: "ServiceCollection")]
        getter service_collection : Types::ServiceCollection?

        # An array of severity values used to search for insights.

        @[JSON::Field(key: "Severities")]
        getter severities : Array(String)?

        # An array of status values used to search for insights.

        @[JSON::Field(key: "Statuses")]
        getter statuses : Array(String)?

        def initialize(
          @resource_collection : Types::ResourceCollection? = nil,
          @service_collection : Types::ServiceCollection? = nil,
          @severities : Array(String)? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end


      struct SearchOrganizationInsightsRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)


        @[JSON::Field(key: "StartTimeRange")]
        getter start_time_range : Types::StartTimeRange

        # The type of insights you are searching for ( REACTIVE or PROACTIVE ).

        @[JSON::Field(key: "Type")]
        getter type : String

        # A SearchOrganizationInsightsFilters object that is used to set the severity and status filters on
        # your insight search.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::SearchOrganizationInsightsFilters?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to use to retrieve the next page of results for this operation. If this value
        # is null, it retrieves the first page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_ids : Array(String),
          @start_time_range : Types::StartTimeRange,
          @type : String,
          @filters : Types::SearchOrganizationInsightsFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchOrganizationInsightsResponse
        include JSON::Serializable

        # The pagination token to use to retrieve the next page of results for this operation. If there are no
        # more pages, this value is null.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An integer that specifies the number of open proactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "ProactiveInsights")]
        getter proactive_insights : Array(Types::ProactiveInsightSummary)?

        # An integer that specifies the number of open reactive insights in your Amazon Web Services account.

        @[JSON::Field(key: "ReactiveInsights")]
        getter reactive_insights : Array(Types::ReactiveInsightSummary)?

        def initialize(
          @next_token : String? = nil,
          @proactive_insights : Array(Types::ProactiveInsightSummary)? = nil,
          @reactive_insights : Array(Types::ReactiveInsightSummary)? = nil
        )
        end
      end

      # A collection of the names of Amazon Web Services services.

      struct ServiceCollection
        include JSON::Serializable

        # An array of strings that each specifies the name of an Amazon Web Services service.

        @[JSON::Field(key: "ServiceNames")]
        getter service_names : Array(String)?

        def initialize(
          @service_names : Array(String)? = nil
        )
        end
      end

      # Represents the health of an Amazon Web Services service.

      struct ServiceHealth
        include JSON::Serializable

        # Number of resources that DevOps Guru is monitoring in an analyzed Amazon Web Services service.

        @[JSON::Field(key: "AnalyzedResourceCount")]
        getter analyzed_resource_count : Int64?

        # Represents the health of an Amazon Web Services service. This is a ServiceInsightHealth that
        # contains the number of open proactive and reactive insights for this service.

        @[JSON::Field(key: "Insight")]
        getter insight : Types::ServiceInsightHealth?

        # The name of the Amazon Web Services service.

        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        def initialize(
          @analyzed_resource_count : Int64? = nil,
          @insight : Types::ServiceInsightHealth? = nil,
          @service_name : String? = nil
        )
        end
      end

      # Contains the number of open proactive and reactive insights in an analyzed Amazon Web Services
      # service.

      struct ServiceInsightHealth
        include JSON::Serializable

        # The number of open proactive insights in the Amazon Web Services service

        @[JSON::Field(key: "OpenProactiveInsights")]
        getter open_proactive_insights : Int32?

        # The number of open reactive insights in the Amazon Web Services service

        @[JSON::Field(key: "OpenReactiveInsights")]
        getter open_reactive_insights : Int32?

        def initialize(
          @open_proactive_insights : Int32? = nil,
          @open_reactive_insights : Int32? = nil
        )
        end
      end

      # Information about the integration of DevOps Guru with another Amazon Web Services service, such as
      # Amazon Web Services Systems Manager.

      struct ServiceIntegrationConfig
        include JSON::Serializable

        # Information about whether DevOps Guru is configured to encrypt server-side data using KMS.

        @[JSON::Field(key: "KMSServerSideEncryption")]
        getter kms_server_side_encryption : Types::KMSServerSideEncryptionIntegration?

        # Information about whether DevOps Guru is configured to perform log anomaly detection on Amazon
        # CloudWatch log groups.

        @[JSON::Field(key: "LogsAnomalyDetection")]
        getter logs_anomaly_detection : Types::LogsAnomalyDetectionIntegration?

        # Information about whether DevOps Guru is configured to create an OpsItem in Amazon Web Services
        # Systems Manager OpsCenter for each created insight.

        @[JSON::Field(key: "OpsCenter")]
        getter ops_center : Types::OpsCenterIntegration?

        def initialize(
          @kms_server_side_encryption : Types::KMSServerSideEncryptionIntegration? = nil,
          @logs_anomaly_detection : Types::LogsAnomalyDetectionIntegration? = nil,
          @ops_center : Types::OpsCenterIntegration? = nil
        )
        end
      end

      # The request contains a value that exceeds a maximum quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains information about the estimated monthly cost to analyze an Amazon Web
      # Services resource. For more information, see Estimate your Amazon DevOps Guru costs and Amazon
      # DevOps Guru pricing .

      struct ServiceResourceCost
        include JSON::Serializable

        # The total estimated monthly cost to analyze the active resources for this resource.

        @[JSON::Field(key: "Cost")]
        getter cost : Float64?

        # The number of active resources analyzed for this service to create a monthly cost estimate.

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The state of the resource. The resource is ACTIVE if it produces metrics, events, or logs within an
        # hour, otherwise it is INACTIVE . You pay for the number of active Amazon Web Services resource hours
        # analyzed for each resource. Inactive resources are not charged.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The type of the Amazon Web Services resource.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The price per hour to analyze the resources in the service. For more information, see Estimate your
        # Amazon DevOps Guru costs and Amazon DevOps Guru pricing .

        @[JSON::Field(key: "UnitCost")]
        getter unit_cost : Float64?

        def initialize(
          @cost : Float64? = nil,
          @count : Int32? = nil,
          @state : String? = nil,
          @type : String? = nil,
          @unit_cost : Float64? = nil
        )
        end
      end

      # Contains the Amazon Resource Name (ARN) of an Amazon Simple Notification Service topic. If you use
      # an Amazon SNS topic in another account, you must attach a policy to it that grants DevOps Guru
      # permission to send it notifications. DevOps Guru adds the required policy on your behalf to send
      # notifications using Amazon SNS in your account. DevOps Guru only supports standard SNS topics. For
      # more information, see Permissions for Amazon SNS topics . If you use an Amazon SNS topic that is
      # encrypted by an Amazon Web Services Key Management Service customer-managed key (CMK), then you must
      # add permissions to the CMK. For more information, see Permissions for Amazon Web Services
      # KMS–encrypted Amazon SNS topics .

      struct SnsChannelConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon Simple Notification Service topic.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        def initialize(
          @topic_arn : String? = nil
        )
        end
      end


      struct StartCostEstimationRequest
        include JSON::Serializable

        # The collection of Amazon Web Services resources used to create a monthly DevOps Guru cost estimate.

        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::CostEstimationResourceCollectionFilter

        # The idempotency token used to identify each cost estimate request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @resource_collection : Types::CostEstimationResourceCollectionFilter,
          @client_token : String? = nil
        )
        end
      end


      struct StartCostEstimationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A time range used to specify when the behavior of an insight or anomaly started.

      struct StartTimeRange
        include JSON::Serializable

        # The start time of the time range.

        @[JSON::Field(key: "FromTime")]
        getter from_time : Time?

        # The end time of the time range.

        @[JSON::Field(key: "ToTime")]
        getter to_time : Time?

        def initialize(
          @from_time : Time? = nil,
          @to_time : Time? = nil
        )
        end
      end

      # A collection of Amazon Web Services tags. Tags help you identify and organize your Amazon Web
      # Services resources. Many Amazon Web Services services support tagging, so you can assign the same
      # tag to resources from different services to indicate that the resources are related. For example,
      # you can assign the same tag to an Amazon DynamoDB table resource that you assign to an Lambda
      # function. For more information about using tags, see the Tagging best practices whitepaper. Each
      # Amazon Web Services tag has two parts. A tag key (for example, CostCenter , Environment , Project ,
      # or Secret ). Tag keys are case-sensitive. An optional field known as a tag value (for example,
      # 111122223333 , Production , or a team name). Omitting the tag value is the same as using an empty
      # string. Like tag keys , tag values are case-sensitive. Together these are known as key - value
      # pairs. The string used for a key in a tag that you use to define your resource coverage must begin
      # with the prefix Devops-guru- . The tag key might be DevOps-Guru-deployment-application or
      # devops-guru-rds-application . When you create a key , the case of characters in the key can be
      # whatever you choose. After you create a key , it is case-sensitive. For example, DevOps Guru works
      # with a key named devops-guru-rds and a key named DevOps-Guru-RDS , and these act as two different
      # keys . Possible key / value pairs in your application might be
      # Devops-Guru-production-application/RDS or Devops-Guru-production-application/containers .

      struct TagCollection
        include JSON::Serializable

        # An Amazon Web Services tag key that is used to identify the Amazon Web Services resources that
        # DevOps Guru analyzes. All Amazon Web Services resources in your account and Region tagged with this
        # key make up your DevOps Guru application and analysis boundary. The string used for a key in a tag
        # that you use to define your resource coverage must begin with the prefix Devops-guru- . The tag key
        # might be DevOps-Guru-deployment-application or devops-guru-rds-application . When you create a key ,
        # the case of characters in the key can be whatever you choose. After you create a key , it is
        # case-sensitive. For example, DevOps Guru works with a key named devops-guru-rds and a key named
        # DevOps-Guru-RDS , and these act as two different keys . Possible key / value pairs in your
        # application might be Devops-Guru-production-application/RDS or
        # Devops-Guru-production-application/containers .

        @[JSON::Field(key: "AppBoundaryKey")]
        getter app_boundary_key : String

        # The values in an Amazon Web Services tag collection. The tag's value is an optional field used to
        # associate a string with the tag key (for example, 111122223333 , Production , or a team name). The
        # key and value are the tag's key pair. Omitting the tag value is the same as using an empty string.
        # Like tag keys , tag values are case-sensitive. You can specify a maximum of 256 characters for a tag
        # value.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)

        def initialize(
          @app_boundary_key : String,
          @tag_values : Array(String)
        )
        end
      end

      # A collection of Amazon Web Services tags used to filter insights. This is used to return insights
      # generated from only resources that contain the tags in the tag collection.

      struct TagCollectionFilter
        include JSON::Serializable

        # An Amazon Web Services tag key that is used to identify the Amazon Web Services resources that
        # DevOps Guru analyzes. All Amazon Web Services resources in your account and Region tagged with this
        # key make up your DevOps Guru application and analysis boundary. The string used for a key in a tag
        # that you use to define your resource coverage must begin with the prefix Devops-guru- . The tag key
        # might be DevOps-Guru-deployment-application or devops-guru-rds-application . When you create a key ,
        # the case of characters in the key can be whatever you choose. After you create a key , it is
        # case-sensitive. For example, DevOps Guru works with a key named devops-guru-rds and a key named
        # DevOps-Guru-RDS , and these act as two different keys . Possible key / value pairs in your
        # application might be Devops-Guru-production-application/RDS or
        # Devops-Guru-production-application/containers .

        @[JSON::Field(key: "AppBoundaryKey")]
        getter app_boundary_key : String

        # The values in an Amazon Web Services tag collection. The tag's value is an optional field used to
        # associate a string with the tag key (for example, 111122223333 , Production , or a team name). The
        # key and value are the tag's key pair. Omitting the tag value is the same as using an empty string.
        # Like tag keys , tag values are case-sensitive. You can specify a maximum of 256 characters for a tag
        # value.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)

        def initialize(
          @app_boundary_key : String,
          @tag_values : Array(String)
        )
        end
      end

      # Information about a collection of Amazon Web Services resources that are identified by an Amazon Web
      # Services tag. This collection of resources is used to create a monthly cost estimate for DevOps Guru
      # to analyze Amazon Web Services resources. The maximum number of tags you can specify for a cost
      # estimate is one. The estimate created is for the cost to analyze the Amazon Web Services resources
      # defined by the tag. For more information, see Stacks in the Amazon Web Services CloudFormation User
      # Guide .

      struct TagCostEstimationResourceCollectionFilter
        include JSON::Serializable

        # An Amazon Web Services tag key that is used to identify the Amazon Web Services resources that
        # DevOps Guru analyzes. All Amazon Web Services resources in your account and Region tagged with this
        # key make up your DevOps Guru application and analysis boundary. The string used for a key in a tag
        # that you use to define your resource coverage must begin with the prefix Devops-guru- . The tag key
        # might be DevOps-Guru-deployment-application or devops-guru-rds-application . When you create a key ,
        # the case of characters in the key can be whatever you choose. After you create a key , it is
        # case-sensitive. For example, DevOps Guru works with a key named devops-guru-rds and a key named
        # DevOps-Guru-RDS , and these act as two different keys . Possible key / value pairs in your
        # application might be Devops-Guru-production-application/RDS or
        # Devops-Guru-production-application/containers .

        @[JSON::Field(key: "AppBoundaryKey")]
        getter app_boundary_key : String

        # The values in an Amazon Web Services tag collection. The tag's value is an optional field used to
        # associate a string with the tag key (for example, 111122223333 , Production , or a team name). The
        # key and value are the tag's key pair. Omitting the tag value is the same as using an empty string.
        # Like tag keys , tag values are case-sensitive. You can specify a maximum of 256 characters for a tag
        # value.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)

        def initialize(
          @app_boundary_key : String,
          @tag_values : Array(String)
        )
        end
      end

      # Information about the health of Amazon Web Services resources in your account that are specified by
      # an Amazon Web Services tag key .

      struct TagHealth
        include JSON::Serializable

        # Number of resources that DevOps Guru is monitoring in your account that are specified by an Amazon
        # Web Services tag.

        @[JSON::Field(key: "AnalyzedResourceCount")]
        getter analyzed_resource_count : Int64?

        # An Amazon Web Services tag key that is used to identify the Amazon Web Services resources that
        # DevOps Guru analyzes. All Amazon Web Services resources in your account and Region tagged with this
        # key make up your DevOps Guru application and analysis boundary. The string used for a key in a tag
        # that you use to define your resource coverage must begin with the prefix Devops-guru- . The tag key
        # might be DevOps-Guru-deployment-application or devops-guru-rds-application . When you create a key ,
        # the case of characters in the key can be whatever you choose. After you create a key , it is
        # case-sensitive. For example, DevOps Guru works with a key named devops-guru-rds and a key named
        # DevOps-Guru-RDS , and these act as two different keys . Possible key / value pairs in your
        # application might be Devops-Guru-production-application/RDS or
        # Devops-Guru-production-application/containers .

        @[JSON::Field(key: "AppBoundaryKey")]
        getter app_boundary_key : String?

        # Information about the health of the Amazon Web Services resources in your account that are specified
        # by an Amazon Web Services tag, including the number of open proactive, open reactive insights, and
        # the Mean Time to Recover (MTTR) of closed insights.

        @[JSON::Field(key: "Insight")]
        getter insight : Types::InsightHealth?

        # The value in an Amazon Web Services tag. The tag's value is an optional field used to associate a
        # string with the tag key (for example, 111122223333 , Production , or a team name). The key and value
        # are the tag's key pair. Omitting the tag value is the same as using an empty string. Like tag keys ,
        # tag values are case-sensitive. You can specify a maximum of 256 characters for a tag value.

        @[JSON::Field(key: "TagValue")]
        getter tag_value : String?

        def initialize(
          @analyzed_resource_count : Int64? = nil,
          @app_boundary_key : String? = nil,
          @insight : Types::InsightHealth? = nil,
          @tag_value : String? = nil
        )
        end
      end

      # The request was denied due to a request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The code of the quota that was exceeded, causing the throttling exception.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The number of seconds after which the action that caused the throttling exception can be retried.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The code of the service that caused the throttling exception.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      # A pair that contains metric values at the respective timestamp.

      struct TimestampMetricValuePair
        include JSON::Serializable

        # Value of the anomalous metric data point at respective Timestamp.

        @[JSON::Field(key: "MetricValue")]
        getter metric_value : Float64?

        # A Timestamp that specifies the time the event occurred.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        def initialize(
          @metric_value : Float64? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Contains the names of Amazon Web Services CloudFormation stacks used to update a collection of
      # stacks. You can specify up to 500 Amazon Web Services CloudFormation stacks.

      struct UpdateCloudFormationCollectionFilter
        include JSON::Serializable

        # An array of the names of the Amazon Web Services CloudFormation stacks to update. You can specify up
        # to 500 Amazon Web Services CloudFormation stacks.

        @[JSON::Field(key: "StackNames")]
        getter stack_names : Array(String)?

        def initialize(
          @stack_names : Array(String)? = nil
        )
        end
      end


      struct UpdateEventSourcesConfigRequest
        include JSON::Serializable

        # Configuration information about the integration of DevOps Guru as the Consumer via EventBridge with
        # another AWS Service.

        @[JSON::Field(key: "EventSources")]
        getter event_sources : Types::EventSourcesConfig?

        def initialize(
          @event_sources : Types::EventSourcesConfig? = nil
        )
        end
      end


      struct UpdateEventSourcesConfigResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information used to update a collection of Amazon Web Services resources.

      struct UpdateResourceCollectionFilter
        include JSON::Serializable

        # A collection of Amazon Web Services CloudFormation stacks. You can specify up to 500 Amazon Web
        # Services CloudFormation stacks.

        @[JSON::Field(key: "CloudFormation")]
        getter cloud_formation : Types::UpdateCloudFormationCollectionFilter?

        # The updated Amazon Web Services tags used to filter the resources in the resource collection. Tags
        # help you identify and organize your Amazon Web Services resources. Many Amazon Web Services services
        # support tagging, so you can assign the same tag to resources from different services to indicate
        # that the resources are related. For example, you can assign the same tag to an Amazon DynamoDB table
        # resource that you assign to an Lambda function. For more information about using tags, see the
        # Tagging best practices whitepaper. Each Amazon Web Services tag has two parts. A tag key (for
        # example, CostCenter , Environment , Project , or Secret ). Tag keys are case-sensitive. An optional
        # field known as a tag value (for example, 111122223333 , Production , or a team name). Omitting the
        # tag value is the same as using an empty string. Like tag keys , tag values are case-sensitive.
        # Together these are known as key - value pairs. The string used for a key in a tag that you use to
        # define your resource coverage must begin with the prefix Devops-guru- . The tag key might be
        # DevOps-Guru-deployment-application or devops-guru-rds-application . When you create a key , the case
        # of characters in the key can be whatever you choose. After you create a key , it is case-sensitive.
        # For example, DevOps Guru works with a key named devops-guru-rds and a key named DevOps-Guru-RDS ,
        # and these act as two different keys . Possible key / value pairs in your application might be
        # Devops-Guru-production-application/RDS or Devops-Guru-production-application/containers .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::UpdateTagCollectionFilter)?

        def initialize(
          @cloud_formation : Types::UpdateCloudFormationCollectionFilter? = nil,
          @tags : Array(Types::UpdateTagCollectionFilter)? = nil
        )
        end
      end


      struct UpdateResourceCollectionRequest
        include JSON::Serializable

        # Specifies if the resource collection in the request is added or deleted to the resource collection.

        @[JSON::Field(key: "Action")]
        getter action : String


        @[JSON::Field(key: "ResourceCollection")]
        getter resource_collection : Types::UpdateResourceCollectionFilter

        def initialize(
          @action : String,
          @resource_collection : Types::UpdateResourceCollectionFilter
        )
        end
      end


      struct UpdateResourceCollectionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about updating the integration status of an Amazon Web Services service, such as Amazon
      # Web Services Systems Manager, with DevOps Guru.

      struct UpdateServiceIntegrationConfig
        include JSON::Serializable

        # Information about whether DevOps Guru is configured to encrypt server-side data using KMS.

        @[JSON::Field(key: "KMSServerSideEncryption")]
        getter kms_server_side_encryption : Types::KMSServerSideEncryptionIntegrationConfig?

        # Information about whether DevOps Guru is configured to perform log anomaly detection on Amazon
        # CloudWatch log groups.

        @[JSON::Field(key: "LogsAnomalyDetection")]
        getter logs_anomaly_detection : Types::LogsAnomalyDetectionIntegrationConfig?


        @[JSON::Field(key: "OpsCenter")]
        getter ops_center : Types::OpsCenterIntegrationConfig?

        def initialize(
          @kms_server_side_encryption : Types::KMSServerSideEncryptionIntegrationConfig? = nil,
          @logs_anomaly_detection : Types::LogsAnomalyDetectionIntegrationConfig? = nil,
          @ops_center : Types::OpsCenterIntegrationConfig? = nil
        )
        end
      end


      struct UpdateServiceIntegrationRequest
        include JSON::Serializable

        # An IntegratedServiceConfig object used to specify the integrated service you want to update, and
        # whether you want to update it to enabled or disabled.

        @[JSON::Field(key: "ServiceIntegration")]
        getter service_integration : Types::UpdateServiceIntegrationConfig

        def initialize(
          @service_integration : Types::UpdateServiceIntegrationConfig
        )
        end
      end


      struct UpdateServiceIntegrationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A new collection of Amazon Web Services resources that are defined by an Amazon Web Services tag or
      # tag key / value pair.

      struct UpdateTagCollectionFilter
        include JSON::Serializable

        # An Amazon Web Services tag key that is used to identify the Amazon Web Services resources that
        # DevOps Guru analyzes. All Amazon Web Services resources in your account and Region tagged with this
        # key make up your DevOps Guru application and analysis boundary. The string used for a key in a tag
        # that you use to define your resource coverage must begin with the prefix Devops-guru- . The tag key
        # might be DevOps-Guru-deployment-application or devops-guru-rds-application . When you create a key ,
        # the case of characters in the key can be whatever you choose. After you create a key , it is
        # case-sensitive. For example, DevOps Guru works with a key named devops-guru-rds and a key named
        # DevOps-Guru-RDS , and these act as two different keys . Possible key / value pairs in your
        # application might be Devops-Guru-production-application/RDS or
        # Devops-Guru-production-application/containers .

        @[JSON::Field(key: "AppBoundaryKey")]
        getter app_boundary_key : String

        # The values in an Amazon Web Services tag collection. The tag's value is an optional field used to
        # associate a string with the tag key (for example, 111122223333 , Production , or a team name). The
        # key and value are the tag's key pair. Omitting the tag value is the same as using an empty string.
        # Like tag keys , tag values are case-sensitive. You can specify a maximum of 256 characters for a tag
        # value.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)

        def initialize(
          @app_boundary_key : String,
          @tag_values : Array(String)
        )
        end
      end

      # Contains information about data passed in to a field during a request that is not valid.

      struct ValidationException
        include JSON::Serializable

        # A message that describes the validation exception.

        @[JSON::Field(key: "Message")]
        getter message : String


        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        # The reason the validation exception was thrown.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # The field associated with the validation exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # The message associated with the validation exception with information to help determine its cause.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the field.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
