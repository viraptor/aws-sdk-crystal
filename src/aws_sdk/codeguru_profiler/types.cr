require "json"
require "time"

module AwsSdk
  module CodeGuruProfiler
    module Types

      # The structure representing the AddNotificationChannelsRequest.
      struct AddNotificationChannelsRequest
        include JSON::Serializable

        # One or 2 channels to report to when anomalies are detected.
        @[JSON::Field(key: "channels")]
        getter channels : Array(Types::Channel)

        # The name of the profiling group that we are setting up notifications for.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        def initialize(
          @channels : Array(Types::Channel),
          @profiling_group_name : String
        )
        end
      end

      # The structure representing the AddNotificationChannelsResponse.
      struct AddNotificationChannelsResponse
        include JSON::Serializable

        # The new notification configuration for this profiling group.
        @[JSON::Field(key: "notificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration?

        def initialize(
          @notification_configuration : Types::NotificationConfiguration? = nil
        )
        end
      end

      # The response of ConfigureAgent that specifies if an agent profiles or not and for how long to return
      # profiling data.
      struct AgentConfiguration
        include JSON::Serializable

        # How long a profiling agent should send profiling data using ConfigureAgent . For example, if this is
        # set to 300, the profiling agent calls ConfigureAgent every 5 minutes to submit the profiled data
        # collected during that period.
        @[JSON::Field(key: "periodInSeconds")]
        getter period_in_seconds : Int32

        # A Boolean that specifies whether the profiling agent collects profiling data or not. Set to true to
        # enable profiling.
        @[JSON::Field(key: "shouldProfile")]
        getter should_profile : Bool

        # Parameters used by the profiler. The valid parameters are: MaxStackDepth - The maximum depth of the
        # stacks in the code that is represented in the profile. For example, if CodeGuru Profiler finds a
        # method A , which calls method B , which calls method C , which calls method D , then the depth is 4.
        # If the maxDepth is set to 2, then the profiler evaluates A and B . MemoryUsageLimitPercent - The
        # percentage of memory that is used by the profiler. MinimumTimeForReportingInMilliseconds - The
        # minimum time in milliseconds between sending reports. ReportingIntervalInMilliseconds - The
        # reporting interval in milliseconds used to report profiles. SamplingIntervalInMilliseconds - The
        # sampling interval in milliseconds that is used to profile samples.
        @[JSON::Field(key: "agentParameters")]
        getter agent_parameters : Hash(String, String)?

        def initialize(
          @period_in_seconds : Int32,
          @should_profile : Bool,
          @agent_parameters : Hash(String, String)? = nil
        )
        end
      end

      # Specifies whether profiling is enabled or disabled for a profiling group. It is used by
      # ConfigureAgent to enable or disable profiling for a profiling group.
      struct AgentOrchestrationConfig
        include JSON::Serializable

        # A Boolean that specifies whether the profiling agent collects profiling data or not. Set to true to
        # enable profiling.
        @[JSON::Field(key: "profilingEnabled")]
        getter profiling_enabled : Bool

        def initialize(
          @profiling_enabled : Bool
        )
        end
      end

      # Specifies the aggregation period and aggregation start time for an aggregated profile. An aggregated
      # profile is used to collect posted agent profiles during an aggregation period. There are three
      # possible aggregation periods (1 day, 1 hour, or 5 minutes).
      struct AggregatedProfileTime
        include JSON::Serializable

        # The aggregation period. This indicates the period during which an aggregation profile collects
        # posted agent profiles for a profiling group. Use one of three valid durations that are specified
        # using the ISO 8601 format. P1D — 1 day PT1H — 1 hour PT5M — 5 minutes
        @[JSON::Field(key: "period")]
        getter period : String?

        # The time that aggregation of posted agent profiles for a profiling group starts. The aggregation
        # profile contains profiles posted by the agent starting at this time for an aggregation period
        # specified by the period property of the AggregatedProfileTime object. Specify start using the ISO
        # 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020
        # 1:15:02 PM UTC.
        @[JSON::Field(key: "start")]
        getter start : Time?

        def initialize(
          @period : String? = nil,
          @start : Time? = nil
        )
        end
      end

      # Details about an anomaly in a specific metric of application profile. The anomaly is detected using
      # analysis of the metric data over a period of time.
      struct Anomaly
        include JSON::Serializable

        # A list of the instances of the detected anomalies during the requested period.
        @[JSON::Field(key: "instances")]
        getter instances : Array(Types::AnomalyInstance)

        # Details about the metric that the analysis used when it detected the anomaly. The metric includes
        # the name of the frame that was analyzed with the type and thread states used to derive the metric
        # value for that frame.
        @[JSON::Field(key: "metric")]
        getter metric : Types::Metric

        # The reason for which metric was flagged as anomalous.
        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @instances : Array(Types::AnomalyInstance),
          @metric : Types::Metric,
          @reason : String
        )
        end
      end

      # The specific duration in which the metric is flagged as anomalous.
      struct AnomalyInstance
        include JSON::Serializable

        # The universally unique identifier (UUID) of an instance of an anomaly in a metric.
        @[JSON::Field(key: "id")]
        getter id : String

        # The start time of the period during which the metric is flagged as anomalous. This is specified
        # using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June
        # 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The end time of the period during which the metric is flagged as anomalous. This is specified using
        # the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1,
        # 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Feedback type on a specific instance of anomaly submitted by the user.
        @[JSON::Field(key: "userFeedback")]
        getter user_feedback : Types::UserFeedback?

        def initialize(
          @id : String,
          @start_time : Time,
          @end_time : Time? = nil,
          @user_feedback : Types::UserFeedback? = nil
        )
        end
      end

      # The structure representing the BatchGetFrameMetricDataRequest.
      struct BatchGetFrameMetricDataRequest
        include JSON::Serializable

        # The name of the profiling group associated with the the frame metrics used to return the time series
        # values.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # The end time of the time period for the returned time series values. This is specified using the ISO
        # 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020
        # 1:15:02 PM UTC.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The details of the metrics that are used to request a time series of values. The metric includes the
        # name of the frame, the aggregation type to calculate the metric value for the frame, and the thread
        # states to use to get the count for the metric value of the frame.
        @[JSON::Field(key: "frameMetrics")]
        getter frame_metrics : Array(Types::FrameMetric)?

        # The duration of the frame metrics used to return the time series values. Specify using the ISO 8601
        # format. The maximum period duration is one day ( PT24H or P1D ).
        @[JSON::Field(key: "period")]
        getter period : String?

        # The start time of the time period for the frame metrics used to return the time series values. This
        # is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
        # millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The requested resolution of time steps for the returned time series of values. If the requested
        # target resolution is not available due to data not being retained we provide a best effort result by
        # falling back to the most granular available resolution after the target resolution. There are 3
        # valid values. P1D — 1 day PT1H — 1 hour PT5M — 5 minutes
        @[JSON::Field(key: "targetResolution")]
        getter target_resolution : String?

        def initialize(
          @profiling_group_name : String,
          @end_time : Time? = nil,
          @frame_metrics : Array(Types::FrameMetric)? = nil,
          @period : String? = nil,
          @start_time : Time? = nil,
          @target_resolution : String? = nil
        )
        end
      end

      # The structure representing the BatchGetFrameMetricDataResponse.
      struct BatchGetFrameMetricDataResponse
        include JSON::Serializable

        # The end time of the time period for the returned time series values. This is specified using the ISO
        # 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020
        # 1:15:02 PM UTC.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # List of instances, or time steps, in the time series. For example, if the period is one day ( PT24H)
        # ), and the resolution is five minutes ( PT5M ), then there are 288 endTimes in the list that are
        # each five minutes appart.
        @[JSON::Field(key: "endTimes")]
        getter end_times : Array(Types::TimestampStructure)

        # Details of the metrics to request a time series of values. The metric includes the name of the
        # frame, the aggregation type to calculate the metric value for the frame, and the thread states to
        # use to get the count for the metric value of the frame.
        @[JSON::Field(key: "frameMetricData")]
        getter frame_metric_data : Array(Types::FrameMetricDatum)

        # Resolution or granularity of the profile data used to generate the time series. This is the value
        # used to jump through time steps in a time series. There are 3 valid values. P1D — 1 day PT1H — 1
        # hour PT5M — 5 minutes
        @[JSON::Field(key: "resolution")]
        getter resolution : String

        # The start time of the time period for the returned time series values. This is specified using the
        # ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020
        # 1:15:02 PM UTC.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # List of instances which remained unprocessed. This will create a missing time step in the list of
        # end times.
        @[JSON::Field(key: "unprocessedEndTimes")]
        getter unprocessed_end_times : Hash(String, Array(Types::TimestampStructure))

        def initialize(
          @end_time : Time,
          @end_times : Array(Types::TimestampStructure),
          @frame_metric_data : Array(Types::FrameMetricDatum),
          @resolution : String,
          @start_time : Time,
          @unprocessed_end_times : Hash(String, Array(Types::TimestampStructure))
        )
        end
      end

      # Notification medium for users to get alerted for events that occur in application profile. We
      # support SNS topic as a notification channel.
      struct Channel
        include JSON::Serializable

        # List of publishers for different type of events that may be detected in an application from the
        # profile. Anomaly detection is the only event publisher in Profiler.
        @[JSON::Field(key: "eventPublishers")]
        getter event_publishers : Array(String)

        # Unique arn of the resource to be used for notifications. We support a valid SNS topic arn as a
        # channel uri.
        @[JSON::Field(key: "uri")]
        getter uri : String

        # Unique identifier for each Channel in the notification configuration of a Profiling Group. A random
        # UUID for channelId is used when adding a channel to the notification configuration if not specified
        # in the request.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @event_publishers : Array(String),
          @uri : String,
          @id : String? = nil
        )
        end
      end

      # The structure representing the configureAgentRequest.
      struct ConfigureAgentRequest
        include JSON::Serializable

        # The name of the profiling group for which the configured agent is collecting profiling data.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # A universally unique identifier (UUID) for a profiling instance. For example, if the profiling
        # instance is an Amazon EC2 instance, it is the instance ID. If it is an AWS Fargate container, it is
        # the container's task ID.
        @[JSON::Field(key: "fleetInstanceId")]
        getter fleet_instance_id : String?

        # Metadata captured about the compute platform the agent is running on. It includes information about
        # sampling and reporting. The valid fields are: COMPUTE_PLATFORM - The compute platform on which the
        # agent is running AGENT_ID - The ID for an agent instance. AWS_REQUEST_ID - The AWS request ID of a
        # Lambda invocation. EXECUTION_ENVIRONMENT - The execution environment a Lambda function is running
        # on. LAMBDA_FUNCTION_ARN - The Amazon Resource Name (ARN) that is used to invoke a Lambda function.
        # LAMBDA_MEMORY_LIMIT_IN_MB - The memory allocated to a Lambda function.
        # LAMBDA_REMAINING_TIME_IN_MILLISECONDS - The time in milliseconds before execution of a Lambda
        # function times out. LAMBDA_TIME_GAP_BETWEEN_INVOKES_IN_MILLISECONDS - The time in milliseconds
        # between two invocations of a Lambda function. LAMBDA_PREVIOUS_EXECUTION_TIME_IN_MILLISECONDS - The
        # time in milliseconds for the previous Lambda invocation.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        def initialize(
          @profiling_group_name : String,
          @fleet_instance_id : String? = nil,
          @metadata : Hash(String, String)? = nil
        )
        end
      end

      # The structure representing the configureAgentResponse.
      struct ConfigureAgentResponse
        include JSON::Serializable

        # An AgentConfiguration object that specifies if an agent profiles or not and for how long to return
        # profiling data.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AgentConfiguration

        def initialize(
          @configuration : Types::AgentConfiguration
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The structure representing the createProfiliingGroupRequest.
      struct CreateProfilingGroupRequest
        include JSON::Serializable

        # Amazon CodeGuru Profiler uses this universally unique identifier (UUID) to prevent the accidental
        # creation of duplicate profiling groups if there are failures and retries.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The name of the profiling group to create.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # Specifies whether profiling is enabled or disabled for the created profiling group.
        @[JSON::Field(key: "agentOrchestrationConfig")]
        getter agent_orchestration_config : Types::AgentOrchestrationConfig?

        # The compute platform of the profiling group. Use AWSLambda if your application runs on AWS Lambda.
        # Use Default if your application runs on a compute platform that is not AWS Lambda, such an Amazon
        # EC2 instance, an on-premises server, or a different platform. If not specified, Default is used.
        @[JSON::Field(key: "computePlatform")]
        getter compute_platform : String?

        # A list of tags to add to the created profiling group.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @profiling_group_name : String,
          @agent_orchestration_config : Types::AgentOrchestrationConfig? = nil,
          @compute_platform : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The structure representing the createProfilingGroupResponse.
      struct CreateProfilingGroupResponse
        include JSON::Serializable

        # The returned ProfilingGroupDescription object that contains information about the created profiling
        # group.
        @[JSON::Field(key: "profilingGroup")]
        getter profiling_group : Types::ProfilingGroupDescription

        def initialize(
          @profiling_group : Types::ProfilingGroupDescription
        )
        end
      end

      # The structure representing the deleteProfilingGroupRequest.
      struct DeleteProfilingGroupRequest
        include JSON::Serializable

        # The name of the profiling group to delete.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        def initialize(
          @profiling_group_name : String
        )
        end
      end

      # The structure representing the deleteProfilingGroupResponse.
      struct DeleteProfilingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The structure representing the describeProfilingGroupRequest.
      struct DescribeProfilingGroupRequest
        include JSON::Serializable

        # The name of the profiling group to get information about.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        def initialize(
          @profiling_group_name : String
        )
        end
      end

      # The structure representing the describeProfilingGroupResponse.
      struct DescribeProfilingGroupResponse
        include JSON::Serializable

        # The returned ProfilingGroupDescription object that contains information about the requested
        # profiling group.
        @[JSON::Field(key: "profilingGroup")]
        getter profiling_group : Types::ProfilingGroupDescription

        def initialize(
          @profiling_group : Types::ProfilingGroupDescription
        )
        end
      end

      # Information about potential recommendations that might be created from the analysis of profiling
      # data.
      struct FindingsReportSummary
        include JSON::Serializable

        # The universally unique identifier (UUID) of the recommendation report.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The end time of the period during which the metric is flagged as anomalous. This is specified using
        # the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1,
        # 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "profileEndTime")]
        getter profile_end_time : Time?

        # The start time of the profile the analysis data is about. This is specified using the ISO 8601
        # format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM
        # UTC.
        @[JSON::Field(key: "profileStartTime")]
        getter profile_start_time : Time?

        # The name of the profiling group that is associated with the analysis data.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String?

        # The total number of different recommendations that were found by the analysis.
        @[JSON::Field(key: "totalNumberOfFindings")]
        getter total_number_of_findings : Int32?

        def initialize(
          @id : String? = nil,
          @profile_end_time : Time? = nil,
          @profile_start_time : Time? = nil,
          @profiling_group_name : String? = nil,
          @total_number_of_findings : Int32? = nil
        )
        end
      end

      # The frame name, metric type, and thread states. These are used to derive the value of the metric for
      # the frame.
      struct FrameMetric
        include JSON::Serializable

        # Name of the method common across the multiple occurrences of a frame in an application profile.
        @[JSON::Field(key: "frameName")]
        getter frame_name : String

        # List of application runtime thread states used to get the counts for a frame a derive a metric
        # value.
        @[JSON::Field(key: "threadStates")]
        getter thread_states : Array(String)

        # A type of aggregation that specifies how a metric for a frame is analyzed. The supported value
        # AggregatedRelativeTotalTime is an aggregation of the metric value for one frame that is calculated
        # across the occurrences of all frames in a profile.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @frame_name : String,
          @thread_states : Array(String),
          @type : String
        )
        end
      end

      # Information about a frame metric and its values.
      struct FrameMetricDatum
        include JSON::Serializable

        @[JSON::Field(key: "frameMetric")]
        getter frame_metric : Types::FrameMetric

        # A list of values that are associated with a frame metric.
        @[JSON::Field(key: "values")]
        getter values : Array(Float64)

        def initialize(
          @frame_metric : Types::FrameMetric,
          @values : Array(Float64)
        )
        end
      end

      # The structure representing the GetFindingsReportAccountSummaryRequest.
      struct GetFindingsReportAccountSummaryRequest
        include JSON::Serializable

        # A Boolean value indicating whether to only return reports from daily profiles. If set to True , only
        # analysis data from daily profiles is returned. If set to False , analysis data is returned from
        # smaller time windows (for example, one hour).
        @[JSON::Field(key: "dailyReportsOnly")]
        getter daily_reports_only : Bool?

        # The maximum number of results returned by GetFindingsReportAccountSummary in paginated output. When
        # this parameter is used, GetFindingsReportAccountSummary only returns maxResults results in a single
        # page along with a nextToken response element. The remaining results of the initial request can be
        # seen by sending another GetFindingsReportAccountSummary request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated GetFindingsReportAccountSummary request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This token should be treated as
        # an opaque identifier that is only used to retrieve the next items in a list and not for other
        # programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @daily_reports_only : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The structure representing the GetFindingsReportAccountSummaryResponse.
      struct GetFindingsReportAccountSummaryResponse
        include JSON::Serializable

        # The return list of FindingsReportSummary objects taht contain summaries of analysis results for all
        # profiling groups in your AWS account.
        @[JSON::Field(key: "reportSummaries")]
        getter report_summaries : Array(Types::FindingsReportSummary)

        # The nextToken value to include in a future GetFindingsReportAccountSummary request. When the results
        # of a GetFindingsReportAccountSummary request exceed maxResults , this value can be used to retrieve
        # the next page of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @report_summaries : Array(Types::FindingsReportSummary),
          @next_token : String? = nil
        )
        end
      end

      # The structure representing the GetNotificationConfigurationRequest.
      struct GetNotificationConfigurationRequest
        include JSON::Serializable

        # The name of the profiling group we want to get the notification configuration for.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        def initialize(
          @profiling_group_name : String
        )
        end
      end

      # The structure representing the GetNotificationConfigurationResponse.
      struct GetNotificationConfigurationResponse
        include JSON::Serializable

        # The current notification configuration for this profiling group.
        @[JSON::Field(key: "notificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration

        def initialize(
          @notification_configuration : Types::NotificationConfiguration
        )
        end
      end

      # The structure representing the getPolicyRequest .
      struct GetPolicyRequest
        include JSON::Serializable

        # The name of the profiling group.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        def initialize(
          @profiling_group_name : String
        )
        end
      end

      # The structure representing the getPolicyResponse .
      struct GetPolicyResponse
        include JSON::Serializable

        # The JSON-formatted resource-based policy attached to the ProfilingGroup .
        @[JSON::Field(key: "policy")]
        getter policy : String

        # A unique identifier for the current revision of the returned policy.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @policy : String,
          @revision_id : String
        )
        end
      end

      # The structure representing the getProfileRequest.
      struct GetProfileRequest
        include JSON::Serializable

        # The name of the profiling group to get.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # The format of the returned profiling data. The format maps to the Accept and Content-Type headers of
        # the HTTP request. You can specify one of the following: or the default . &lt;ul&gt; &lt;li&gt;
        # &lt;p&gt; &lt;code&gt;application/json&lt;/code&gt; — standard JSON format &lt;/p&gt; &lt;/li&gt;
        # &lt;li&gt; &lt;p&gt; &lt;code&gt;application/x-amzn-ion&lt;/code&gt; — the Amazon Ion data format.
        # For more information, see &lt;a href=&quot;http://amzn.github.io/ion-docs/&quot;&gt;Amazon
        # Ion&lt;/a&gt;. &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt;
        @[JSON::Field(key: "Accept")]
        getter accept : String?

        # The end time of the requested profile. Specify using the ISO 8601 format. For example,
        # 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC. If you specify
        # endTime , then you must also specify period or startTime , but not both.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The maximum depth of the stacks in the code that is represented in the aggregated profile. For
        # example, if CodeGuru Profiler finds a method A , which calls method B , which calls method C , which
        # calls method D , then the depth is 4. If the maxDepth is set to 2, then the aggregated profile
        # contains representations of methods A and B .
        @[JSON::Field(key: "maxDepth")]
        getter max_depth : Int32?

        # Used with startTime or endTime to specify the time range for the returned aggregated profile.
        # Specify using the ISO 8601 format. For example, P1DT1H1M1S . &lt;p&gt; To get the latest aggregated
        # profile, specify only &lt;code&gt;period&lt;/code&gt;. &lt;/p&gt;
        @[JSON::Field(key: "period")]
        getter period : String?

        # The start time of the profile to get. Specify using the ISO 8601 format. For example,
        # 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC. &lt;p&gt; If you
        # specify &lt;code&gt;startTime&lt;/code&gt;, then you must also specify
        # &lt;code&gt;period&lt;/code&gt; or &lt;code&gt;endTime&lt;/code&gt;, but not both. &lt;/p&gt;
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @profiling_group_name : String,
          @accept : String? = nil,
          @end_time : Time? = nil,
          @max_depth : Int32? = nil,
          @period : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # The structure representing the getProfileResponse.
      struct GetProfileResponse
        include JSON::Serializable

        # The content type of the profile in the payload. It is either application/json or the default
        # application/x-amzn-ion .
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String

        # Information about the profile.
        @[JSON::Field(key: "profile")]
        getter profile : Bytes

        # The content encoding of the profile.
        @[JSON::Field(key: "Content-Encoding")]
        getter content_encoding : String?

        def initialize(
          @content_type : String,
          @profile : Bytes,
          @content_encoding : String? = nil
        )
        end
      end

      # The structure representing the GetRecommendationsRequest.
      struct GetRecommendationsRequest
        include JSON::Serializable

        # The start time of the profile to get analysis data about. You must specify startTime and endTime .
        # This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
        # millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The name of the profiling group to get analysis data about.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # The end time of the profile to get analysis data about. You must specify startTime and endTime .
        # This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
        # millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The language used to provide analysis. Specify using a string that is one of the following BCP 47
        # language codes. de-DE - German, Germany en-GB - English, United Kingdom en-US - English, United
        # States es-ES - Spanish, Spain fr-FR - French, France it-IT - Italian, Italy ja-JP - Japanese, Japan
        # ko-KR - Korean, Republic of Korea pt-BR - Portugese, Brazil zh-CN - Chinese, China zh-TW - Chinese,
        # Taiwan
        @[JSON::Field(key: "locale")]
        getter locale : String?

        def initialize(
          @end_time : Time,
          @profiling_group_name : String,
          @start_time : Time,
          @locale : String? = nil
        )
        end
      end

      # The structure representing the GetRecommendationsResponse.
      struct GetRecommendationsResponse
        include JSON::Serializable

        # The list of anomalies that the analysis has found for this profile.
        @[JSON::Field(key: "anomalies")]
        getter anomalies : Array(Types::Anomaly)

        # The end time of the profile the analysis data is about. This is specified using the ISO 8601 format.
        # For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "profileEndTime")]
        getter profile_end_time : Time

        # The start time of the profile the analysis data is about. This is specified using the ISO 8601
        # format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM
        # UTC.
        @[JSON::Field(key: "profileStartTime")]
        getter profile_start_time : Time

        # The name of the profiling group the analysis data is about.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # The list of recommendations that the analysis found for this profile.
        @[JSON::Field(key: "recommendations")]
        getter recommendations : Array(Types::Recommendation)

        def initialize(
          @anomalies : Array(Types::Anomaly),
          @profile_end_time : Time,
          @profile_start_time : Time,
          @profiling_group_name : String,
          @recommendations : Array(Types::Recommendation)
        )
        end
      end

      # The server encountered an internal error and is unable to complete the request.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The structure representing the ListFindingsReportsRequest.
      struct ListFindingsReportsRequest
        include JSON::Serializable

        # The end time of the profile to get analysis data about. You must specify startTime and endTime .
        # This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
        # millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The name of the profiling group from which to search for analysis data.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # The start time of the profile to get analysis data about. You must specify startTime and endTime .
        # This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
        # millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # A Boolean value indicating whether to only return reports from daily profiles. If set to True , only
        # analysis data from daily profiles is returned. If set to False , analysis data is returned from
        # smaller time windows (for example, one hour).
        @[JSON::Field(key: "dailyReportsOnly")]
        getter daily_reports_only : Bool?

        # The maximum number of report results returned by ListFindingsReports in paginated output. When this
        # parameter is used, ListFindingsReports only returns maxResults results in a single page along with a
        # nextToken response element. The remaining results of the initial request can be seen by sending
        # another ListFindingsReports request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListFindingsReportsRequest request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This token should be treated as
        # an opaque identifier that is only used to retrieve the next items in a list and not for other
        # programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @profiling_group_name : String,
          @start_time : Time,
          @daily_reports_only : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The structure representing the ListFindingsReportsResponse.
      struct ListFindingsReportsResponse
        include JSON::Serializable

        # The list of analysis results summaries.
        @[JSON::Field(key: "findingsReportSummaries")]
        getter findings_report_summaries : Array(Types::FindingsReportSummary)

        # The nextToken value to include in a future ListFindingsReports request. When the results of a
        # ListFindingsReports request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @findings_report_summaries : Array(Types::FindingsReportSummary),
          @next_token : String? = nil
        )
        end
      end

      # The structure representing the listProfileTimesRequest.
      struct ListProfileTimesRequest
        include JSON::Serializable

        # The end time of the time range from which to list the profiles.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The aggregation period. This specifies the period during which an aggregation profile collects
        # posted agent profiles for a profiling group. There are 3 valid values. P1D — 1 day PT1H — 1 hour
        # PT5M — 5 minutes
        @[JSON::Field(key: "period")]
        getter period : String

        # The name of the profiling group.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # The start time of the time range from which to list the profiles.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The maximum number of profile time results returned by ListProfileTimes in paginated output. When
        # this parameter is used, ListProfileTimes only returns maxResults results in a single page with a
        # nextToken response element. The remaining results of the initial request can be seen by sending
        # another ListProfileTimes request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListProfileTimes request where maxResults was
        # used and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value. This token should be treated as an opaque
        # identifier that is only used to retrieve the next items in a list and not for other programmatic
        # purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order (ascending or descending by start time of the profile) to use when listing profiles.
        # Defaults to TIMESTAMP_DESCENDING .
        @[JSON::Field(key: "orderBy")]
        getter order_by : String?

        def initialize(
          @end_time : Time,
          @period : String,
          @profiling_group_name : String,
          @start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order_by : String? = nil
        )
        end
      end

      # The structure representing the listProfileTimesResponse.
      struct ListProfileTimesResponse
        include JSON::Serializable

        # The list of start times of the available profiles for the aggregation period in the specified time
        # range.
        @[JSON::Field(key: "profileTimes")]
        getter profile_times : Array(Types::ProfileTime)

        # The nextToken value to include in a future ListProfileTimes request. When the results of a
        # ListProfileTimes request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @profile_times : Array(Types::ProfileTime),
          @next_token : String? = nil
        )
        end
      end

      # The structure representing the listProfilingGroupsRequest.
      struct ListProfilingGroupsRequest
        include JSON::Serializable

        # A Boolean value indicating whether to include a description. If true , then a list of
        # ProfilingGroupDescription objects that contain detailed information about profiling groups is
        # returned. If false , then a list of profiling group names is returned.
        @[JSON::Field(key: "includeDescription")]
        getter include_description : Bool?

        # The maximum number of profiling groups results returned by ListProfilingGroups in paginated output.
        # When this parameter is used, ListProfilingGroups only returns maxResults results in a single page
        # along with a nextToken response element. The remaining results of the initial request can be seen by
        # sending another ListProfilingGroups request with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListProfilingGroups request where maxResults
        # was used and the results exceeded the value of that parameter. Pagination continues from the end of
        # the previous results that returned the nextToken value. This token should be treated as an opaque
        # identifier that is only used to retrieve the next items in a list and not for other programmatic
        # purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @include_description : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The structure representing the listProfilingGroupsResponse.
      struct ListProfilingGroupsResponse
        include JSON::Serializable

        # A returned list of profiling group names. A list of the names is returned only if includeDescription
        # is false , otherwise a list of ProfilingGroupDescription objects is returned.
        @[JSON::Field(key: "profilingGroupNames")]
        getter profiling_group_names : Array(String)

        # The nextToken value to include in a future ListProfilingGroups request. When the results of a
        # ListProfilingGroups request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A returned list ProfilingGroupDescription objects. A list of ProfilingGroupDescription objects is
        # returned only if includeDescription is true , otherwise a list of profiling group names is returned.
        @[JSON::Field(key: "profilingGroups")]
        getter profiling_groups : Array(Types::ProfilingGroupDescription)?

        def initialize(
          @profiling_group_names : Array(String),
          @next_token : String? = nil,
          @profiling_groups : Array(Types::ProfilingGroupDescription)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that contains the tags to return.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags assigned to the specified resource. This is the list of tags returned in the
        # response.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The part of a profile that contains a recommendation found during analysis.
      struct Match
        include JSON::Serializable

        # The location in the profiling graph that contains a recommendation found during analysis.
        @[JSON::Field(key: "frameAddress")]
        getter frame_address : String?

        # The target frame that triggered a match.
        @[JSON::Field(key: "targetFramesIndex")]
        getter target_frames_index : Int32?

        # The value in the profile data that exceeded the recommendation threshold.
        @[JSON::Field(key: "thresholdBreachValue")]
        getter threshold_breach_value : Float64?

        def initialize(
          @frame_address : String? = nil,
          @target_frames_index : Int32? = nil,
          @threshold_breach_value : Float64? = nil
        )
        end
      end

      # Details about the metric that the analysis used when it detected the anomaly. The metric what is
      # analyzed to create recommendations. It includes the name of the frame that was analyzed and the type
      # and thread states used to derive the metric value for that frame.
      struct Metric
        include JSON::Serializable

        # The name of the method that appears as a frame in any stack in a profile.
        @[JSON::Field(key: "frameName")]
        getter frame_name : String

        # The list of application runtime thread states that is used to calculate the metric value for the
        # frame.
        @[JSON::Field(key: "threadStates")]
        getter thread_states : Array(String)

        # A type that specifies how a metric for a frame is analyzed. The supported value
        # AggregatedRelativeTotalTime is an aggregation of the metric value for one frame that is calculated
        # across the occurences of all frames in a profile.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @frame_name : String,
          @thread_states : Array(String),
          @type : String
        )
        end
      end

      # The configuration for notifications stored for each profiling group. This includes up to to two
      # channels and a list of event publishers associated with each channel.
      struct NotificationConfiguration
        include JSON::Serializable

        # List of up to two channels to be used for sending notifications for events detected from the
        # application profile.
        @[JSON::Field(key: "channels")]
        getter channels : Array(Types::Channel)?

        def initialize(
          @channels : Array(Types::Channel)? = nil
        )
        end
      end

      # A set of rules used to make a recommendation during an analysis.
      struct Pattern
        include JSON::Serializable

        # A list of the different counters used to determine if there is a match.
        @[JSON::Field(key: "countersToAggregate")]
        getter counters_to_aggregate : Array(String)?

        # The description of the recommendation. This explains a potential inefficiency in a profiled
        # application.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The universally unique identifier (UUID) of this pattern.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name for this pattern.
        @[JSON::Field(key: "name")]
        getter name : String?

        # A string that contains the steps recommended to address the potential inefficiency.
        @[JSON::Field(key: "resolutionSteps")]
        getter resolution_steps : String?

        # A list of frame names that were searched during the analysis that generated a recommendation.
        @[JSON::Field(key: "targetFrames")]
        getter target_frames : Array(Array(String))?

        # The percentage of time an application spends in one method that triggers a recommendation. The
        # percentage of time is the same as the percentage of the total gathered sample counts during
        # analysis.
        @[JSON::Field(key: "thresholdPercent")]
        getter threshold_percent : Float64?

        def initialize(
          @counters_to_aggregate : Array(String)? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @resolution_steps : String? = nil,
          @target_frames : Array(Array(String))? = nil,
          @threshold_percent : Float64? = nil
        )
        end
      end

      # The structure representing the postAgentProfileRequest.
      struct PostAgentProfileRequest
        include JSON::Serializable

        # The submitted profiling data.
        @[JSON::Field(key: "agentProfile")]
        getter agent_profile : Bytes

        # The format of the submitted profiling data. The format maps to the Accept and Content-Type headers
        # of the HTTP request. You can specify one of the following: or the default . &lt;ul&gt; &lt;li&gt;
        # &lt;p&gt; &lt;code&gt;application/json&lt;/code&gt; — standard JSON format &lt;/p&gt; &lt;/li&gt;
        # &lt;li&gt; &lt;p&gt; &lt;code&gt;application/x-amzn-ion&lt;/code&gt; — the Amazon Ion data format.
        # For more information, see &lt;a href=&quot;http://amzn.github.io/ion-docs/&quot;&gt;Amazon
        # Ion&lt;/a&gt;. &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt;
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String

        # The name of the profiling group with the aggregated profile that receives the submitted profiling
        # data.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # Amazon CodeGuru Profiler uses this universally unique identifier (UUID) to prevent the accidental
        # submission of duplicate profiling data if there are failures and retries.
        @[JSON::Field(key: "profileToken")]
        getter profile_token : String?

        def initialize(
          @agent_profile : Bytes,
          @content_type : String,
          @profiling_group_name : String,
          @profile_token : String? = nil
        )
        end
      end

      # The structure representing the postAgentProfileResponse.
      struct PostAgentProfileResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the start time of a profile.
      struct ProfileTime
        include JSON::Serializable

        # The start time of a profile. It is specified using the ISO 8601 format. For example,
        # 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "start")]
        getter start : Time?

        def initialize(
          @start : Time? = nil
        )
        end
      end

      # Contains information about a profiling group.
      struct ProfilingGroupDescription
        include JSON::Serializable

        # An AgentOrchestrationConfig object that indicates if the profiling group is enabled for profiled or
        # not.
        @[JSON::Field(key: "agentOrchestrationConfig")]
        getter agent_orchestration_config : Types::AgentOrchestrationConfig?

        # The Amazon Resource Name (ARN) identifying the profiling group resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The compute platform of the profiling group. If it is set to AWSLambda , then the profiled
        # application runs on AWS Lambda. If it is set to Default , then the profiled application runs on a
        # compute platform that is not AWS Lambda, such an Amazon EC2 instance, an on-premises server, or a
        # different platform. The default is Default .
        @[JSON::Field(key: "computePlatform")]
        getter compute_platform : String?

        # The time when the profiling group was created. Specify using the ISO 8601 format. For example,
        # 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The name of the profiling group.
        @[JSON::Field(key: "name")]
        getter name : String?

        # A ProfilingStatus object that includes information about the last time a profile agent pinged back,
        # the last time a profile was received, and the aggregation period and start time for the most recent
        # aggregated profile.
        @[JSON::Field(key: "profilingStatus")]
        getter profiling_status : Types::ProfilingStatus?

        # A list of the tags that belong to this profiling group.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The date and time when the profiling group was last updated. Specify using the ISO 8601 format. For
        # example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @agent_orchestration_config : Types::AgentOrchestrationConfig? = nil,
          @arn : String? = nil,
          @compute_platform : String? = nil,
          @created_at : Time? = nil,
          @name : String? = nil,
          @profiling_status : Types::ProfilingStatus? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Profiling status includes information about the last time a profile agent pinged back, the last time
      # a profile was received, and the aggregation period and start time for the most recent aggregated
      # profile.
      struct ProfilingStatus
        include JSON::Serializable

        # The date and time when the profiling agent most recently pinged back. Specify using the ISO 8601
        # format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM
        # UTC.
        @[JSON::Field(key: "latestAgentOrchestratedAt")]
        getter latest_agent_orchestrated_at : Time?

        # The date and time when the most recent profile was received. Specify using the ISO 8601 format. For
        # example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "latestAgentProfileReportedAt")]
        getter latest_agent_profile_reported_at : Time?

        # An AggregatedProfileTime object that contains the aggregation period and start time for an
        # aggregated profile.
        @[JSON::Field(key: "latestAggregatedProfile")]
        getter latest_aggregated_profile : Types::AggregatedProfileTime?

        def initialize(
          @latest_agent_orchestrated_at : Time? = nil,
          @latest_agent_profile_reported_at : Time? = nil,
          @latest_aggregated_profile : Types::AggregatedProfileTime? = nil
        )
        end
      end

      # The structure representing the putPermissionRequest .
      struct PutPermissionRequest
        include JSON::Serializable

        # Specifies an action group that contains permissions to add to a profiling group resource. One action
        # group is supported, agentPermissions , which grants permission to perform actions required by the
        # profiling agent, ConfigureAgent and PostAgentProfile permissions.
        @[JSON::Field(key: "actionGroup")]
        getter action_group : String

        # A list ARNs for the roles and users you want to grant access to the profiling group. Wildcards are
        # not are supported in the ARNs.
        @[JSON::Field(key: "principals")]
        getter principals : Array(String)

        # The name of the profiling group to grant access to.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # A universally unique identifier (UUID) for the revision of the policy you are adding to the
        # profiling group. Do not specify this when you add permissions to a profiling group for the first
        # time. If a policy already exists on the profiling group, you must specify the revisionId .
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @action_group : String,
          @principals : Array(String),
          @profiling_group_name : String,
          @revision_id : String? = nil
        )
        end
      end

      # The structure representing the putPermissionResponse .
      struct PutPermissionResponse
        include JSON::Serializable

        # The JSON-formatted resource-based policy on the profiling group that includes the added permissions.
        @[JSON::Field(key: "policy")]
        getter policy : String

        # A universally unique identifier (UUID) for the revision of the resource-based policy that includes
        # the added permissions. The JSON-formatted policy is in the policy element of the response.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @policy : String,
          @revision_id : String
        )
        end
      end

      # A potential improvement that was found from analyzing the profiling data.
      struct Recommendation
        include JSON::Serializable

        # How many different places in the profile graph triggered a match.
        @[JSON::Field(key: "allMatchesCount")]
        getter all_matches_count : Int32

        # How much of the total sample count is potentially affected.
        @[JSON::Field(key: "allMatchesSum")]
        getter all_matches_sum : Float64

        # End time of the profile that was used by this analysis. This is specified using the ISO 8601 format.
        # For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The pattern that analysis recognized in the profile to make this recommendation.
        @[JSON::Field(key: "pattern")]
        getter pattern : Types::Pattern

        # The start time of the profile that was used by this analysis. This is specified using the ISO 8601
        # format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM
        # UTC.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # List of the matches with most impact.
        @[JSON::Field(key: "topMatches")]
        getter top_matches : Array(Types::Match)

        def initialize(
          @all_matches_count : Int32,
          @all_matches_sum : Float64,
          @end_time : Time,
          @pattern : Types::Pattern,
          @start_time : Time,
          @top_matches : Array(Types::Match)
        )
        end
      end

      # The structure representing the RemoveNotificationChannelRequest.
      struct RemoveNotificationChannelRequest
        include JSON::Serializable

        # The id of the channel that we want to stop receiving notifications.
        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The name of the profiling group we want to change notification configuration for.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        def initialize(
          @channel_id : String,
          @profiling_group_name : String
        )
        end
      end

      # The structure representing the RemoveNotificationChannelResponse.
      struct RemoveNotificationChannelResponse
        include JSON::Serializable

        # The new notification configuration for this profiling group.
        @[JSON::Field(key: "notificationConfiguration")]
        getter notification_configuration : Types::NotificationConfiguration?

        def initialize(
          @notification_configuration : Types::NotificationConfiguration? = nil
        )
        end
      end

      # The structure representing the &lt;code&gt;removePermissionRequest&lt;/code&gt;.&lt;/p&gt;
      struct RemovePermissionRequest
        include JSON::Serializable

        # Specifies an action group that contains the permissions to remove from a profiling group's
        # resource-based policy. One action group is supported, agentPermissions , which grants ConfigureAgent
        # and PostAgentProfile permissions.
        @[JSON::Field(key: "actionGroup")]
        getter action_group : String

        # The name of the profiling group.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # A universally unique identifier (UUID) for the revision of the resource-based policy from which you
        # want to remove permissions.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @action_group : String,
          @profiling_group_name : String,
          @revision_id : String
        )
        end
      end

      # The structure representing the removePermissionResponse .
      struct RemovePermissionResponse
        include JSON::Serializable

        # The JSON-formatted resource-based policy on the profiling group after the specified permissions were
        # removed.
        @[JSON::Field(key: "policy")]
        getter policy : String

        # A universally unique identifier (UUID) for the revision of the resource-based policy after the
        # specified permissions were removed. The updated JSON-formatted policy is in the policy element of
        # the response.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @policy : String,
          @revision_id : String
        )
        end
      end

      # The resource specified in the request does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # You have exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use Service Quotas to request a service quota increase.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The structure representing the SubmitFeedbackRequest.
      struct SubmitFeedbackRequest
        include JSON::Serializable

        # The universally unique identifier (UUID) of the AnomalyInstance object that is included in the
        # analysis data.
        @[JSON::Field(key: "anomalyInstanceId")]
        getter anomaly_instance_id : String

        # The name of the profiling group that is associated with the analysis data.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        # The feedback tpye. Thee are two valid values, Positive and Negative .
        @[JSON::Field(key: "type")]
        getter type : String

        # Optional feedback about this anomaly.
        @[JSON::Field(key: "comment")]
        getter comment : String?

        def initialize(
          @anomaly_instance_id : String,
          @profiling_group_name : String,
          @type : String,
          @comment : String? = nil
        )
        end
      end

      # The structure representing the SubmitFeedbackResponse.
      struct SubmitFeedbackResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that the tags are added to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tags that are added to the specified resource.
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

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A data type that contains a Timestamp object. This is specified using the ISO 8601 format. For
      # example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
      struct TimestampStructure
        include JSON::Serializable

        # A Timestamp . This is specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z
        # represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
        @[JSON::Field(key: "value")]
        getter value : Time

        def initialize(
          @value : Time
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that contains the tags to remove.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag keys. Existing tags of resources with keys in this list are removed from the specified
        # resource.
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

      # The structure representing the updateProfilingGroupRequest.
      struct UpdateProfilingGroupRequest
        include JSON::Serializable

        # Specifies whether profiling is enabled or disabled for a profiling group.
        @[JSON::Field(key: "agentOrchestrationConfig")]
        getter agent_orchestration_config : Types::AgentOrchestrationConfig

        # The name of the profiling group to update.
        @[JSON::Field(key: "profilingGroupName")]
        getter profiling_group_name : String

        def initialize(
          @agent_orchestration_config : Types::AgentOrchestrationConfig,
          @profiling_group_name : String
        )
        end
      end

      # The structure representing the updateProfilingGroupResponse.
      struct UpdateProfilingGroupResponse
        include JSON::Serializable

        # A ProfilingGroupDescription that contains information about the returned updated profiling group.
        @[JSON::Field(key: "profilingGroup")]
        getter profiling_group : Types::ProfilingGroupDescription

        def initialize(
          @profiling_group : Types::ProfilingGroupDescription
        )
        end
      end

      # Feedback that can be submitted for each instance of an anomaly by the user. Feedback is be used for
      # improvements in generating recommendations for the application.
      struct UserFeedback
        include JSON::Serializable

        # Optional Positive or Negative feedback submitted by the user about whether the recommendation is
        # useful or not.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # The parameter is not valid.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
