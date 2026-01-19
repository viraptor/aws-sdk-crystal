require "json"
require "time"

module AwsSdk
  module XRay
    module Types

      # An alias for an edge.
      struct Alias
        include JSON::Serializable

        # The canonical name of the alias.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of names for the alias, including the canonical name.
        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The type of the alias.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @names : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Value of a segment annotation. Has one of three value types: Number, Boolean, or String.
      struct AnnotationValue
        include JSON::Serializable

        # Value for a Boolean annotation.
        @[JSON::Field(key: "BooleanValue")]
        getter boolean_value : Bool?

        # Value for a Number annotation.
        @[JSON::Field(key: "NumberValue")]
        getter number_value : Float64?

        # Value for a String annotation.
        @[JSON::Field(key: "StringValue")]
        getter string_value : String?

        def initialize(
          @boolean_value : Bool? = nil,
          @number_value : Float64? = nil,
          @string_value : String? = nil
        )
        end
      end

      # The service within the service graph that has anomalously high fault rates.
      struct AnomalousService
        include JSON::Serializable

        @[JSON::Field(key: "ServiceId")]
        getter service_id : Types::ServiceId?

        def initialize(
          @service_id : Types::ServiceId? = nil
        )
        end
      end

      # A list of Availability Zones corresponding to the segments in a trace.
      struct AvailabilityZoneDetail
        include JSON::Serializable

        # The name of a corresponding Availability Zone.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      struct BackendConnectionErrors
        include JSON::Serializable

        @[JSON::Field(key: "ConnectionRefusedCount")]
        getter connection_refused_count : Int32?

        @[JSON::Field(key: "HTTPCode4XXCount")]
        getter http_code4_xx_count : Int32?

        @[JSON::Field(key: "HTTPCode5XXCount")]
        getter http_code5_xx_count : Int32?

        @[JSON::Field(key: "OtherCount")]
        getter other_count : Int32?

        @[JSON::Field(key: "TimeoutCount")]
        getter timeout_count : Int32?

        @[JSON::Field(key: "UnknownHostCount")]
        getter unknown_host_count : Int32?

        def initialize(
          @connection_refused_count : Int32? = nil,
          @http_code4_xx_count : Int32? = nil,
          @http_code5_xx_count : Int32? = nil,
          @other_count : Int32? = nil,
          @timeout_count : Int32? = nil,
          @unknown_host_count : Int32? = nil
        )
        end
      end

      struct BatchGetTracesRequest
        include JSON::Serializable

        # Specify the trace IDs of requests for which to retrieve segments.
        @[JSON::Field(key: "TraceIds")]
        getter trace_ids : Array(String)

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @trace_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct BatchGetTracesResult
        include JSON::Serializable

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Full traces for the specified requests.
        @[JSON::Field(key: "Traces")]
        getter traces : Array(Types::Trace)?

        # Trace IDs of requests that haven't been processed.
        @[JSON::Field(key: "UnprocessedTraceIds")]
        getter unprocessed_trace_ids : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @traces : Array(Types::Trace)? = nil,
          @unprocessed_trace_ids : Array(String)? = nil
        )
        end
      end

      struct CancelTraceRetrievalRequest
        include JSON::Serializable

        # Retrieval token.
        @[JSON::Field(key: "RetrievalToken")]
        getter retrieval_token : String

        def initialize(
          @retrieval_token : String
        )
        end
      end

      struct CancelTraceRetrievalResult
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateGroupRequest
        include JSON::Serializable

        # The case-sensitive name of the new group. Default is a reserved name and names must be unique.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The filter expression defining criteria by which to group traces.
        @[JSON::Field(key: "FilterExpression")]
        getter filter_expression : String?

        # The structure containing configurations related to insights. The InsightsEnabled boolean can be set
        # to true to enable insights for the new group or false to disable insights for the new group. The
        # NotificationsEnabled boolean can be set to true to enable insights notifications for the new group.
        # Notifications may only be enabled on a group with InsightsEnabled set to true.
        @[JSON::Field(key: "InsightsConfiguration")]
        getter insights_configuration : Types::InsightsConfiguration?

        # A map that contains one or more tag keys and tag values to attach to an X-Ray group. For more
        # information about ways to use tags, see Tagging Amazon Web Services resources in the Amazon Web
        # Services General Reference . The following restrictions apply to tags: Maximum number of
        # user-applied tags per resource: 50 Maximum tag key length: 128 Unicode characters Maximum tag value
        # length: 256 Unicode characters Valid values for key and value: a-z, A-Z, 0-9, space, and the
        # following characters: _ . : / = + - and @ Tag keys and values are case sensitive. Don't use aws: as
        # a prefix for keys; it's reserved for Amazon Web Services use.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @group_name : String,
          @filter_expression : String? = nil,
          @insights_configuration : Types::InsightsConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateGroupResult
        include JSON::Serializable

        # The group that was created. Contains the name of the group that was created, the Amazon Resource
        # Name (ARN) of the group that was generated based on the group name, the filter expression, and the
        # insight configuration that was assigned to the group.
        @[JSON::Field(key: "Group")]
        getter group : Types::Group?

        def initialize(
          @group : Types::Group? = nil
        )
        end
      end

      struct CreateSamplingRuleRequest
        include JSON::Serializable

        # The rule definition.
        @[JSON::Field(key: "SamplingRule")]
        getter sampling_rule : Types::SamplingRule

        # A map that contains one or more tag keys and tag values to attach to an X-Ray sampling rule. For
        # more information about ways to use tags, see Tagging Amazon Web Services resources in the Amazon Web
        # Services General Reference . The following restrictions apply to tags: Maximum number of
        # user-applied tags per resource: 50 Maximum tag key length: 128 Unicode characters Maximum tag value
        # length: 256 Unicode characters Valid values for key and value: a-z, A-Z, 0-9, space, and the
        # following characters: _ . : / = + - and @ Tag keys and values are case sensitive. Don't use aws: as
        # a prefix for keys; it's reserved for Amazon Web Services use.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @sampling_rule : Types::SamplingRule,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateSamplingRuleResult
        include JSON::Serializable

        # The saved rule definition and metadata.
        @[JSON::Field(key: "SamplingRuleRecord")]
        getter sampling_rule_record : Types::SamplingRuleRecord?

        def initialize(
          @sampling_rule_record : Types::SamplingRuleRecord? = nil
        )
        end
      end

      struct DeleteGroupRequest
        include JSON::Serializable

        # The ARN of the group that was generated on creation.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The case-sensitive name of the group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @group_arn : String? = nil,
          @group_name : String? = nil
        )
        end
      end

      struct DeleteGroupResult
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The name of the resource policy to delete.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # Specifies a specific policy revision to delete. Provide a PolicyRevisionId to ensure an atomic
        # delete operation. If the provided revision id does not match the latest policy revision id, an
        # InvalidPolicyRevisionIdException exception is returned.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @policy_name : String,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct DeleteResourcePolicyResult
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSamplingRuleRequest
        include JSON::Serializable

        # The ARN of the sampling rule. Specify a rule by either name or ARN, but not both.
        @[JSON::Field(key: "RuleARN")]
        getter rule_arn : String?

        # The name of the sampling rule. Specify a rule by either name or ARN, but not both.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        def initialize(
          @rule_arn : String? = nil,
          @rule_name : String? = nil
        )
        end
      end

      struct DeleteSamplingRuleResult
        include JSON::Serializable

        # The deleted rule definition and metadata.
        @[JSON::Field(key: "SamplingRuleRecord")]
        getter sampling_rule_record : Types::SamplingRuleRecord?

        def initialize(
          @sampling_rule_record : Types::SamplingRuleRecord? = nil
        )
        end
      end

      # Information about a connection between two services. An edge can be a synchronous connection, such
      # as typical call between client and service, or an asynchronous link, such as a Lambda function which
      # retrieves an event from an SNS queue.
      struct Edge
        include JSON::Serializable

        # Aliases for the edge.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(Types::Alias)?

        # Describes an asynchronous connection, with a value of link .
        @[JSON::Field(key: "EdgeType")]
        getter edge_type : String?

        # The end time of the last segment on the edge.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # A histogram that maps the spread of event age when received by consumers. Age is calculated each
        # time an event is received. Only populated when EdgeType is link .
        @[JSON::Field(key: "ReceivedEventAgeHistogram")]
        getter received_event_age_histogram : Array(Types::HistogramEntry)?

        # Identifier of the edge. Unique within a service map.
        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : Int32?

        # A histogram that maps the spread of client response times on an edge. Only populated for synchronous
        # edges.
        @[JSON::Field(key: "ResponseTimeHistogram")]
        getter response_time_histogram : Array(Types::HistogramEntry)?

        # The start time of the first segment on the edge.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # Response statistics for segments on the edge.
        @[JSON::Field(key: "SummaryStatistics")]
        getter summary_statistics : Types::EdgeStatistics?

        def initialize(
          @aliases : Array(Types::Alias)? = nil,
          @edge_type : String? = nil,
          @end_time : Time? = nil,
          @received_event_age_histogram : Array(Types::HistogramEntry)? = nil,
          @reference_id : Int32? = nil,
          @response_time_histogram : Array(Types::HistogramEntry)? = nil,
          @start_time : Time? = nil,
          @summary_statistics : Types::EdgeStatistics? = nil
        )
        end
      end

      # Response statistics for an edge.
      struct EdgeStatistics
        include JSON::Serializable

        # Information about requests that failed with a 4xx Client Error status code.
        @[JSON::Field(key: "ErrorStatistics")]
        getter error_statistics : Types::ErrorStatistics?

        # Information about requests that failed with a 5xx Server Error status code.
        @[JSON::Field(key: "FaultStatistics")]
        getter fault_statistics : Types::FaultStatistics?

        # The number of requests that completed with a 2xx Success status code.
        @[JSON::Field(key: "OkCount")]
        getter ok_count : Int64?

        # The total number of completed requests.
        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int64?

        # The aggregate response time of completed requests.
        @[JSON::Field(key: "TotalResponseTime")]
        getter total_response_time : Float64?

        def initialize(
          @error_statistics : Types::ErrorStatistics? = nil,
          @fault_statistics : Types::FaultStatistics? = nil,
          @ok_count : Int64? = nil,
          @total_count : Int64? = nil,
          @total_response_time : Float64? = nil
        )
        end
      end

      # A configuration document that specifies encryption configuration settings.
      struct EncryptionConfig
        include JSON::Serializable

        # The ID of the KMS key used for encryption, if applicable.
        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        # The encryption status. While the status is UPDATING , X-Ray may encrypt data with a combination of
        # the new and old settings.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of encryption. Set to KMS for encryption with KMS keys. Set to NONE for default encryption.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @key_id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The root cause of a trace summary error.
      struct ErrorRootCause
        include JSON::Serializable

        # A flag that denotes that the root cause impacts the trace client.
        @[JSON::Field(key: "ClientImpacting")]
        getter client_impacting : Bool?

        # A list of services corresponding to an error. A service identifies a segment and it contains a name,
        # account ID, type, and inferred flag.
        @[JSON::Field(key: "Services")]
        getter services : Array(Types::ErrorRootCauseService)?

        def initialize(
          @client_impacting : Bool? = nil,
          @services : Array(Types::ErrorRootCauseService)? = nil
        )
        end
      end

      # A collection of segments and corresponding subsegments associated to a trace summary error.
      struct ErrorRootCauseEntity
        include JSON::Serializable

        # The types and messages of the exceptions.
        @[JSON::Field(key: "Exceptions")]
        getter exceptions : Array(Types::RootCauseException)?

        # The name of the entity.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A flag that denotes a remote subsegment.
        @[JSON::Field(key: "Remote")]
        getter remote : Bool?

        def initialize(
          @exceptions : Array(Types::RootCauseException)? = nil,
          @name : String? = nil,
          @remote : Bool? = nil
        )
        end
      end

      # A collection of fields identifying the services in a trace summary error.
      struct ErrorRootCauseService
        include JSON::Serializable

        # The account ID associated to the service.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The path of root cause entities found on the service.
        @[JSON::Field(key: "EntityPath")]
        getter entity_path : Array(Types::ErrorRootCauseEntity)?

        # A Boolean value indicating if the service is inferred from the trace.
        @[JSON::Field(key: "Inferred")]
        getter inferred : Bool?

        # The service name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A collection of associated service names.
        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The type associated to the service.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @account_id : String? = nil,
          @entity_path : Array(Types::ErrorRootCauseEntity)? = nil,
          @inferred : Bool? = nil,
          @name : String? = nil,
          @names : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about requests that failed with a 4xx Client Error status code.
      struct ErrorStatistics
        include JSON::Serializable

        # The number of requests that failed with untracked 4xx Client Error status codes.
        @[JSON::Field(key: "OtherCount")]
        getter other_count : Int64?

        # The number of requests that failed with a 429 throttling status code.
        @[JSON::Field(key: "ThrottleCount")]
        getter throttle_count : Int64?

        # The total number of requests that failed with a 4xx Client Error status code.
        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int64?

        def initialize(
          @other_count : Int64? = nil,
          @throttle_count : Int64? = nil,
          @total_count : Int64? = nil
        )
        end
      end

      # The root cause information for a trace summary fault.
      struct FaultRootCause
        include JSON::Serializable

        # A flag that denotes that the root cause impacts the trace client.
        @[JSON::Field(key: "ClientImpacting")]
        getter client_impacting : Bool?

        # A list of corresponding services. A service identifies a segment and it contains a name, account ID,
        # type, and inferred flag.
        @[JSON::Field(key: "Services")]
        getter services : Array(Types::FaultRootCauseService)?

        def initialize(
          @client_impacting : Bool? = nil,
          @services : Array(Types::FaultRootCauseService)? = nil
        )
        end
      end

      # A collection of segments and corresponding subsegments associated to a trace summary fault error.
      struct FaultRootCauseEntity
        include JSON::Serializable

        # The types and messages of the exceptions.
        @[JSON::Field(key: "Exceptions")]
        getter exceptions : Array(Types::RootCauseException)?

        # The name of the entity.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A flag that denotes a remote subsegment.
        @[JSON::Field(key: "Remote")]
        getter remote : Bool?

        def initialize(
          @exceptions : Array(Types::RootCauseException)? = nil,
          @name : String? = nil,
          @remote : Bool? = nil
        )
        end
      end

      # A collection of fields identifying the services in a trace summary fault.
      struct FaultRootCauseService
        include JSON::Serializable

        # The account ID associated to the service.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The path of root cause entities found on the service.
        @[JSON::Field(key: "EntityPath")]
        getter entity_path : Array(Types::FaultRootCauseEntity)?

        # A Boolean value indicating if the service is inferred from the trace.
        @[JSON::Field(key: "Inferred")]
        getter inferred : Bool?

        # The service name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A collection of associated service names.
        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The type associated to the service.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @account_id : String? = nil,
          @entity_path : Array(Types::FaultRootCauseEntity)? = nil,
          @inferred : Bool? = nil,
          @name : String? = nil,
          @names : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about requests that failed with a 5xx Server Error status code.
      struct FaultStatistics
        include JSON::Serializable

        # The number of requests that failed with untracked 5xx Server Error status codes.
        @[JSON::Field(key: "OtherCount")]
        getter other_count : Int64?

        # The total number of requests that failed with a 5xx Server Error status code.
        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int64?

        def initialize(
          @other_count : Int64? = nil,
          @total_count : Int64? = nil
        )
        end
      end

      # The predicted high and low fault count. This is used to determine if a service has become anomalous
      # and if an insight should be created.
      struct ForecastStatistics
        include JSON::Serializable

        # The upper limit of fault counts for a service.
        @[JSON::Field(key: "FaultCountHigh")]
        getter fault_count_high : Int64?

        # The lower limit of fault counts for a service.
        @[JSON::Field(key: "FaultCountLow")]
        getter fault_count_low : Int64?

        def initialize(
          @fault_count_high : Int64? = nil,
          @fault_count_low : Int64? = nil
        )
        end
      end

      struct GetEncryptionConfigRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetEncryptionConfigResult
        include JSON::Serializable

        # The encryption configuration document.
        @[JSON::Field(key: "EncryptionConfig")]
        getter encryption_config : Types::EncryptionConfig?

        def initialize(
          @encryption_config : Types::EncryptionConfig? = nil
        )
        end
      end

      struct GetGroupRequest
        include JSON::Serializable

        # The ARN of the group that was generated on creation.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The case-sensitive name of the group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @group_arn : String? = nil,
          @group_name : String? = nil
        )
        end
      end

      struct GetGroupResult
        include JSON::Serializable

        # The group that was requested. Contains the name of the group, the ARN of the group, the filter
        # expression, and the insight configuration assigned to the group.
        @[JSON::Field(key: "Group")]
        getter group : Types::Group?

        def initialize(
          @group : Types::Group? = nil
        )
        end
      end

      struct GetGroupsRequest
        include JSON::Serializable

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      struct GetGroupsResult
        include JSON::Serializable

        # The collection of all active groups.
        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupSummary)?

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @groups : Array(Types::GroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetIndexingRulesRequest
        include JSON::Serializable

        # Specify the pagination token returned by a previous request to retrieve the next page of indexes.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      struct GetIndexingRulesResult
        include JSON::Serializable

        # Retrieves all indexing rules.
        @[JSON::Field(key: "IndexingRules")]
        getter indexing_rules : Array(Types::IndexingRule)?

        # Specify the pagination token returned by a previous request to retrieve the next page of indexes.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @indexing_rules : Array(Types::IndexingRule)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetInsightEventsRequest
        include JSON::Serializable

        # The insight's unique identifier. Use the GetInsightSummaries action to retrieve an InsightId.
        @[JSON::Field(key: "InsightId")]
        getter insight_id : String

        # Used to retrieve at most the specified value of events.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specify the pagination token returned by a previous request to retrieve the next page of events.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @insight_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetInsightEventsResult
        include JSON::Serializable

        # A detailed description of the event. This includes the time of the event, client and root cause
        # impact statistics, and the top anomalous service at the time of the event.
        @[JSON::Field(key: "InsightEvents")]
        getter insight_events : Array(Types::InsightEvent)?

        # Use this token to retrieve the next page of insight events.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @insight_events : Array(Types::InsightEvent)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetInsightImpactGraphRequest
        include JSON::Serializable

        # The estimated end time of the insight, in Unix time seconds. The EndTime is exclusive of the value
        # provided. The time range between the start time and end time can't be more than six hours.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The insight's unique identifier. Use the GetInsightSummaries action to retrieve an InsightId.
        @[JSON::Field(key: "InsightId")]
        getter insight_id : String

        # The estimated start time of the insight, in Unix time seconds. The StartTime is inclusive of the
        # value provided and can't be more than 30 days old.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Specify the pagination token returned by a previous request to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @insight_id : String,
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      struct GetInsightImpactGraphResult
        include JSON::Serializable

        # The provided end time.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The insight's unique identifier.
        @[JSON::Field(key: "InsightId")]
        getter insight_id : String?

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The time, in Unix seconds, at which the service graph ended.
        @[JSON::Field(key: "ServiceGraphEndTime")]
        getter service_graph_end_time : Time?

        # The time, in Unix seconds, at which the service graph started.
        @[JSON::Field(key: "ServiceGraphStartTime")]
        getter service_graph_start_time : Time?

        # The Amazon Web Services instrumented services related to the insight.
        @[JSON::Field(key: "Services")]
        getter services : Array(Types::InsightImpactGraphService)?

        # The provided start time.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @insight_id : String? = nil,
          @next_token : String? = nil,
          @service_graph_end_time : Time? = nil,
          @service_graph_start_time : Time? = nil,
          @services : Array(Types::InsightImpactGraphService)? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct GetInsightRequest
        include JSON::Serializable

        # The insight's unique identifier. Use the GetInsightSummaries action to retrieve an InsightId.
        @[JSON::Field(key: "InsightId")]
        getter insight_id : String

        def initialize(
          @insight_id : String
        )
        end
      end

      struct GetInsightResult
        include JSON::Serializable

        # The summary information of an insight.
        @[JSON::Field(key: "Insight")]
        getter insight : Types::Insight?

        def initialize(
          @insight : Types::Insight? = nil
        )
        end
      end

      struct GetInsightSummariesRequest
        include JSON::Serializable

        # The end of the time frame in which the insights ended. The end time can't be more than 30 days old.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The beginning of the time frame in which the insights started. The start time can't be more than 30
        # days old.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The Amazon Resource Name (ARN) of the group. Required if the GroupName isn't provided.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The name of the group. Required if the GroupARN isn't provided.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The maximum number of results to display.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of insight states.
        @[JSON::Field(key: "States")]
        getter states : Array(String)?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @states : Array(String)? = nil
        )
        end
      end

      struct GetInsightSummariesResult
        include JSON::Serializable

        # The summary of each insight within the group matching the provided filters. The summary contains the
        # InsightID, start and end time, the root cause service, the root cause and client impact statistics,
        # the top anomalous services, and the status of the insight.
        @[JSON::Field(key: "InsightSummaries")]
        getter insight_summaries : Array(Types::InsightSummary)?

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @insight_summaries : Array(Types::InsightSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetRetrievedTracesGraphRequest
        include JSON::Serializable

        # Retrieval token.
        @[JSON::Field(key: "RetrievalToken")]
        getter retrieval_token : String

        # Specify the pagination token returned by a previous request to retrieve the next page of indexes.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @retrieval_token : String,
          @next_token : String? = nil
        )
        end
      end

      struct GetRetrievedTracesGraphResult
        include JSON::Serializable

        # Specify the pagination token returned by a previous request to retrieve the next page of indexes.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Status of the retrieval.
        @[JSON::Field(key: "RetrievalStatus")]
        getter retrieval_status : String?

        # Retrieved services.
        @[JSON::Field(key: "Services")]
        getter services : Array(Types::RetrievedService)?

        def initialize(
          @next_token : String? = nil,
          @retrieval_status : String? = nil,
          @services : Array(Types::RetrievedService)? = nil
        )
        end
      end

      struct GetSamplingRulesRequest
        include JSON::Serializable

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      struct GetSamplingRulesResult
        include JSON::Serializable

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Rule definitions and metadata.
        @[JSON::Field(key: "SamplingRuleRecords")]
        getter sampling_rule_records : Array(Types::SamplingRuleRecord)?

        def initialize(
          @next_token : String? = nil,
          @sampling_rule_records : Array(Types::SamplingRuleRecord)? = nil
        )
        end
      end

      struct GetSamplingStatisticSummariesRequest
        include JSON::Serializable

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      struct GetSamplingStatisticSummariesResult
        include JSON::Serializable

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the number of requests instrumented for each sampling rule.
        @[JSON::Field(key: "SamplingStatisticSummaries")]
        getter sampling_statistic_summaries : Array(Types::SamplingStatisticSummary)?

        def initialize(
          @next_token : String? = nil,
          @sampling_statistic_summaries : Array(Types::SamplingStatisticSummary)? = nil
        )
        end
      end

      struct GetSamplingTargetsRequest
        include JSON::Serializable

        # Information about rules that the service is using to sample requests.
        @[JSON::Field(key: "SamplingStatisticsDocuments")]
        getter sampling_statistics_documents : Array(Types::SamplingStatisticsDocument)

        # Information about rules that the service is using to boost sampling rate.
        @[JSON::Field(key: "SamplingBoostStatisticsDocuments")]
        getter sampling_boost_statistics_documents : Array(Types::SamplingBoostStatisticsDocument)?

        def initialize(
          @sampling_statistics_documents : Array(Types::SamplingStatisticsDocument),
          @sampling_boost_statistics_documents : Array(Types::SamplingBoostStatisticsDocument)? = nil
        )
        end
      end

      struct GetSamplingTargetsResult
        include JSON::Serializable

        # The last time a user changed the sampling rule configuration. If the sampling rule configuration
        # changed since the service last retrieved it, the service should call GetSamplingRules to get the
        # latest version.
        @[JSON::Field(key: "LastRuleModification")]
        getter last_rule_modification : Time?

        # Updated rules that the service should use to sample requests.
        @[JSON::Field(key: "SamplingTargetDocuments")]
        getter sampling_target_documents : Array(Types::SamplingTargetDocument)?

        # Information about SamplingBoostStatisticsDocument that X-Ray could not process.
        @[JSON::Field(key: "UnprocessedBoostStatistics")]
        getter unprocessed_boost_statistics : Array(Types::UnprocessedStatistics)?

        # Information about SamplingStatisticsDocument that X-Ray could not process.
        @[JSON::Field(key: "UnprocessedStatistics")]
        getter unprocessed_statistics : Array(Types::UnprocessedStatistics)?

        def initialize(
          @last_rule_modification : Time? = nil,
          @sampling_target_documents : Array(Types::SamplingTargetDocument)? = nil,
          @unprocessed_boost_statistics : Array(Types::UnprocessedStatistics)? = nil,
          @unprocessed_statistics : Array(Types::UnprocessedStatistics)? = nil
        )
        end
      end

      struct GetServiceGraphRequest
        include JSON::Serializable

        # The end of the timeframe for which to generate a graph.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start of the time frame for which to generate a graph.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The Amazon Resource Name (ARN) of a group based on which you want to generate a graph.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The name of a group based on which you want to generate a graph.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetServiceGraphResult
        include JSON::Serializable

        # A flag indicating whether the group's filter expression has been consistent, or if the returned
        # service graph may show traces from an older version of the group's filter expression.
        @[JSON::Field(key: "ContainsOldGroupVersions")]
        getter contains_old_group_versions : Bool?

        # The end of the time frame for which the graph was generated.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The services that have processed a traced request during the specified time frame.
        @[JSON::Field(key: "Services")]
        getter services : Array(Types::Service)?

        # The start of the time frame for which the graph was generated.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @contains_old_group_versions : Bool? = nil,
          @end_time : Time? = nil,
          @next_token : String? = nil,
          @services : Array(Types::Service)? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct GetTimeSeriesServiceStatisticsRequest
        include JSON::Serializable

        # The end of the time frame for which to aggregate statistics.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start of the time frame for which to aggregate statistics.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # A filter expression defining entities that will be aggregated for statistics. Supports ID, service,
        # and edge functions. If no selector expression is specified, edge statistics are returned.
        @[JSON::Field(key: "EntitySelectorExpression")]
        getter entity_selector_expression : String?

        # The forecasted high and low fault count values. Forecast enabled requests require the
        # EntitySelectorExpression ID be provided.
        @[JSON::Field(key: "ForecastStatistics")]
        getter forecast_statistics : Bool?

        # The Amazon Resource Name (ARN) of the group for which to pull statistics from.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The case-sensitive name of the group for which to pull statistics from.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Aggregation period in seconds.
        @[JSON::Field(key: "Period")]
        getter period : Int32?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @entity_selector_expression : String? = nil,
          @forecast_statistics : Bool? = nil,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @next_token : String? = nil,
          @period : Int32? = nil
        )
        end
      end

      struct GetTimeSeriesServiceStatisticsResult
        include JSON::Serializable

        # A flag indicating whether or not a group's filter expression has been consistent, or if a returned
        # aggregation might show statistics from an older version of the group's filter expression.
        @[JSON::Field(key: "ContainsOldGroupVersions")]
        getter contains_old_group_versions : Bool?

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The collection of statistics.
        @[JSON::Field(key: "TimeSeriesServiceStatistics")]
        getter time_series_service_statistics : Array(Types::TimeSeriesServiceStatistics)?

        def initialize(
          @contains_old_group_versions : Bool? = nil,
          @next_token : String? = nil,
          @time_series_service_statistics : Array(Types::TimeSeriesServiceStatistics)? = nil
        )
        end
      end

      struct GetTraceGraphRequest
        include JSON::Serializable

        # Trace IDs of requests for which to generate a service graph.
        @[JSON::Field(key: "TraceIds")]
        getter trace_ids : Array(String)

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @trace_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct GetTraceGraphResult
        include JSON::Serializable

        # Pagination token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The services that have processed one of the specified requests.
        @[JSON::Field(key: "Services")]
        getter services : Array(Types::Service)?

        def initialize(
          @next_token : String? = nil,
          @services : Array(Types::Service)? = nil
        )
        end
      end

      struct GetTraceSegmentDestinationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetTraceSegmentDestinationResult
        include JSON::Serializable

        # Retrieves the current destination.
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # Status of the retrieval.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @destination : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetTraceSummariesRequest
        include JSON::Serializable

        # The end of the time frame for which to retrieve traces.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start of the time frame for which to retrieve traces.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Specify a filter expression to retrieve trace summaries for services or requests that meet certain
        # requirements.
        @[JSON::Field(key: "FilterExpression")]
        getter filter_expression : String?

        # Specify the pagination token returned by a previous request to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Set to true to get summaries for only a subset of available traces.
        @[JSON::Field(key: "Sampling")]
        getter sampling : Bool?

        # A parameter to indicate whether to enable sampling on trace summaries. Input parameters are Name and
        # Value.
        @[JSON::Field(key: "SamplingStrategy")]
        getter sampling_strategy : Types::SamplingStrategy?

        # Query trace summaries by TraceId (trace start time), Event (trace update time), or Service (trace
        # segment end time).
        @[JSON::Field(key: "TimeRangeType")]
        getter time_range_type : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @filter_expression : String? = nil,
          @next_token : String? = nil,
          @sampling : Bool? = nil,
          @sampling_strategy : Types::SamplingStrategy? = nil,
          @time_range_type : String? = nil
        )
        end
      end

      struct GetTraceSummariesResult
        include JSON::Serializable

        # The start time of this page of results.
        @[JSON::Field(key: "ApproximateTime")]
        getter approximate_time : Time?

        # If the requested time frame contained more than one page of results, you can use this token to
        # retrieve the next page. The first page contains the most recent results, closest to the end of the
        # time frame.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Trace IDs and annotations for traces that were found in the specified time frame.
        @[JSON::Field(key: "TraceSummaries")]
        getter trace_summaries : Array(Types::TraceSummary)?

        # The total number of traces processed, including traces that did not match the specified filter
        # expression.
        @[JSON::Field(key: "TracesProcessedCount")]
        getter traces_processed_count : Int64?

        def initialize(
          @approximate_time : Time? = nil,
          @next_token : String? = nil,
          @trace_summaries : Array(Types::TraceSummary)? = nil,
          @traces_processed_count : Int64? = nil
        )
        end
      end

      # The relation between two services.
      struct GraphLink
        include JSON::Serializable

        # Destination traces of a link relationship.
        @[JSON::Field(key: "DestinationTraceIds")]
        getter destination_trace_ids : Array(String)?

        # Relationship of a trace to the corresponding service.
        @[JSON::Field(key: "ReferenceType")]
        getter reference_type : String?

        # Source trace of a link relationship.
        @[JSON::Field(key: "SourceTraceId")]
        getter source_trace_id : String?

        def initialize(
          @destination_trace_ids : Array(String)? = nil,
          @reference_type : String? = nil,
          @source_trace_id : String? = nil
        )
        end
      end

      # Details and metadata for a group.
      struct Group
        include JSON::Serializable

        # The filter expression defining the parameters to include traces.
        @[JSON::Field(key: "FilterExpression")]
        getter filter_expression : String?

        # The Amazon Resource Name (ARN) of the group generated based on the GroupName.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The unique case-sensitive name of the group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The structure containing configurations related to insights. The InsightsEnabled boolean can be set
        # to true to enable insights for the group or false to disable insights for the group. The
        # NotificationsEnabled boolean can be set to true to enable insights notifications through Amazon
        # EventBridge for the group.
        @[JSON::Field(key: "InsightsConfiguration")]
        getter insights_configuration : Types::InsightsConfiguration?

        def initialize(
          @filter_expression : String? = nil,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @insights_configuration : Types::InsightsConfiguration? = nil
        )
        end
      end

      # Details for a group without metadata.
      struct GroupSummary
        include JSON::Serializable

        # The filter expression defining the parameters to include traces.
        @[JSON::Field(key: "FilterExpression")]
        getter filter_expression : String?

        # The ARN of the group generated based on the GroupName.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The unique case-sensitive name of the group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The structure containing configurations related to insights. The InsightsEnabled boolean can be set
        # to true to enable insights for the group or false to disable insights for the group. The
        # NotificationsEnabled boolean can be set to true to enable insights notifications. Notifications can
        # only be enabled on a group with InsightsEnabled set to true.
        @[JSON::Field(key: "InsightsConfiguration")]
        getter insights_configuration : Types::InsightsConfiguration?

        def initialize(
          @filter_expression : String? = nil,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @insights_configuration : Types::InsightsConfiguration? = nil
        )
        end
      end

      # An entry in a histogram for a statistic. A histogram maps the range of observed values on the X
      # axis, and the prevalence of each value on the Y axis.
      struct HistogramEntry
        include JSON::Serializable

        # The prevalence of the entry.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The value of the entry.
        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @count : Int32? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Information about an HTTP request.
      struct Http
        include JSON::Serializable

        # The IP address of the requestor.
        @[JSON::Field(key: "ClientIp")]
        getter client_ip : String?

        # The request method.
        @[JSON::Field(key: "HttpMethod")]
        getter http_method : String?

        # The response status.
        @[JSON::Field(key: "HttpStatus")]
        getter http_status : Int32?

        # The request URL.
        @[JSON::Field(key: "HttpURL")]
        getter http_url : String?

        # The request's user agent string.
        @[JSON::Field(key: "UserAgent")]
        getter user_agent : String?

        def initialize(
          @client_ip : String? = nil,
          @http_method : String? = nil,
          @http_status : Int32? = nil,
          @http_url : String? = nil,
          @user_agent : String? = nil
        )
        end
      end

      # Rule used to determine the server-side sampling rate for spans ingested through the CloudWatchLogs
      # destination and indexed by X-Ray.
      struct IndexingRule
        include JSON::Serializable

        # Displays when the rule was last modified, in Unix time seconds.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time?

        # The name of the indexing rule.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The indexing rule.
        @[JSON::Field(key: "Rule")]
        getter rule : Types::IndexingRuleValue?

        def initialize(
          @modified_at : Time? = nil,
          @name : String? = nil,
          @rule : Types::IndexingRuleValue? = nil
        )
        end
      end

      # The indexing rule configuration.
      struct IndexingRuleValue
        include JSON::Serializable

        # Indexing rule configuration that is used to probabilistically sample traceIds.
        @[JSON::Field(key: "Probabilistic")]
        getter probabilistic : Types::ProbabilisticRuleValue?

        def initialize(
          @probabilistic : Types::ProbabilisticRuleValue? = nil
        )
        end
      end

      # Update to an indexing rule.
      struct IndexingRuleValueUpdate
        include JSON::Serializable

        # Indexing rule configuration that is used to probabilistically sample traceIds.
        @[JSON::Field(key: "Probabilistic")]
        getter probabilistic : Types::ProbabilisticRuleValueUpdate?

        def initialize(
          @probabilistic : Types::ProbabilisticRuleValueUpdate? = nil
        )
        end
      end

      # When fault rates go outside of the expected range, X-Ray creates an insight. Insights tracks
      # emergent issues within your applications.
      struct Insight
        include JSON::Serializable

        # The categories that label and describe the type of insight.
        @[JSON::Field(key: "Categories")]
        getter categories : Array(String)?

        # The impact statistics of the client side service. This includes the number of requests to the client
        # service and whether the requests were faults or okay.
        @[JSON::Field(key: "ClientRequestImpactStatistics")]
        getter client_request_impact_statistics : Types::RequestImpactStatistics?

        # The time, in Unix seconds, at which the insight ended.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The Amazon Resource Name (ARN) of the group that the insight belongs to.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The name of the group that the insight belongs to.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The insights unique identifier.
        @[JSON::Field(key: "InsightId")]
        getter insight_id : String?

        @[JSON::Field(key: "RootCauseServiceId")]
        getter root_cause_service_id : Types::ServiceId?

        # The impact statistics of the root cause service. This includes the number of requests to the client
        # service and whether the requests were faults or okay.
        @[JSON::Field(key: "RootCauseServiceRequestImpactStatistics")]
        getter root_cause_service_request_impact_statistics : Types::RequestImpactStatistics?

        # The time, in Unix seconds, at which the insight began.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The current state of the insight.
        @[JSON::Field(key: "State")]
        getter state : String?

        # A brief description of the insight.
        @[JSON::Field(key: "Summary")]
        getter summary : String?

        # The service within the insight that is most impacted by the incident.
        @[JSON::Field(key: "TopAnomalousServices")]
        getter top_anomalous_services : Array(Types::AnomalousService)?

        def initialize(
          @categories : Array(String)? = nil,
          @client_request_impact_statistics : Types::RequestImpactStatistics? = nil,
          @end_time : Time? = nil,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @insight_id : String? = nil,
          @root_cause_service_id : Types::ServiceId? = nil,
          @root_cause_service_request_impact_statistics : Types::RequestImpactStatistics? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @summary : String? = nil,
          @top_anomalous_services : Array(Types::AnomalousService)? = nil
        )
        end
      end

      # X-Ray reevaluates insights periodically until they are resolved, and records each intermediate state
      # in an event. You can review incident events in the Impact Timeline on the Inspect page in the X-Ray
      # console.
      struct InsightEvent
        include JSON::Serializable

        # The impact statistics of the client side service. This includes the number of requests to the client
        # service and whether the requests were faults or okay.
        @[JSON::Field(key: "ClientRequestImpactStatistics")]
        getter client_request_impact_statistics : Types::RequestImpactStatistics?

        # The time, in Unix seconds, at which the event was recorded.
        @[JSON::Field(key: "EventTime")]
        getter event_time : Time?

        # The impact statistics of the root cause service. This includes the number of requests to the client
        # service and whether the requests were faults or okay.
        @[JSON::Field(key: "RootCauseServiceRequestImpactStatistics")]
        getter root_cause_service_request_impact_statistics : Types::RequestImpactStatistics?

        # A brief description of the event.
        @[JSON::Field(key: "Summary")]
        getter summary : String?

        # The service during the event that is most impacted by the incident.
        @[JSON::Field(key: "TopAnomalousServices")]
        getter top_anomalous_services : Array(Types::AnomalousService)?

        def initialize(
          @client_request_impact_statistics : Types::RequestImpactStatistics? = nil,
          @event_time : Time? = nil,
          @root_cause_service_request_impact_statistics : Types::RequestImpactStatistics? = nil,
          @summary : String? = nil,
          @top_anomalous_services : Array(Types::AnomalousService)? = nil
        )
        end
      end

      # The connection between two service in an insight impact graph.
      struct InsightImpactGraphEdge
        include JSON::Serializable

        # Identifier of the edge. Unique within a service map.
        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : Int32?

        def initialize(
          @reference_id : Int32? = nil
        )
        end
      end

      # Information about an application that processed requests, users that made requests, or downstream
      # services, resources, and applications that an application used.
      struct InsightImpactGraphService
        include JSON::Serializable

        # Identifier of the Amazon Web Services account in which the service runs.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Connections to downstream services.
        @[JSON::Field(key: "Edges")]
        getter edges : Array(Types::InsightImpactGraphEdge)?

        # The canonical name of the service.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of names for the service, including the canonical name.
        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # Identifier for the service. Unique within the service map.
        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : Int32?

        # Identifier for the service. Unique within the service map. Amazon Web Services Resource - The type
        # of an Amazon Web Services resource. For example, AWS::EC2::Instance for an application running on
        # Amazon EC2 or AWS::DynamoDB::Table for an Amazon DynamoDB table that the application used. Amazon
        # Web Services Service - The type of an Amazon Web Services service. For example, AWS::DynamoDB for
        # downstream calls to Amazon DynamoDB that didn't target a specific table. Amazon Web Services Service
        # - The type of an Amazon Web Services service. For example, AWS::DynamoDB for downstream calls to
        # Amazon DynamoDB that didn't target a specific table. remote - A downstream service of indeterminate
        # type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @account_id : String? = nil,
          @edges : Array(Types::InsightImpactGraphEdge)? = nil,
          @name : String? = nil,
          @names : Array(String)? = nil,
          @reference_id : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # Information that describes an insight.
      struct InsightSummary
        include JSON::Serializable

        # Categories The categories that label and describe the type of insight.
        @[JSON::Field(key: "Categories")]
        getter categories : Array(String)?

        # The impact statistics of the client side service. This includes the number of requests to the client
        # service and whether the requests were faults or okay.
        @[JSON::Field(key: "ClientRequestImpactStatistics")]
        getter client_request_impact_statistics : Types::RequestImpactStatistics?

        # The time, in Unix seconds, at which the insight ended.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The Amazon Resource Name (ARN) of the group that the insight belongs to.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The name of the group that the insight belongs to.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The insights unique identifier.
        @[JSON::Field(key: "InsightId")]
        getter insight_id : String?

        # The time, in Unix seconds, that the insight was last updated.
        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time?

        @[JSON::Field(key: "RootCauseServiceId")]
        getter root_cause_service_id : Types::ServiceId?

        # The impact statistics of the root cause service. This includes the number of requests to the client
        # service and whether the requests were faults or okay.
        @[JSON::Field(key: "RootCauseServiceRequestImpactStatistics")]
        getter root_cause_service_request_impact_statistics : Types::RequestImpactStatistics?

        # The time, in Unix seconds, at which the insight began.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The current state of the insight.
        @[JSON::Field(key: "State")]
        getter state : String?

        # A brief description of the insight.
        @[JSON::Field(key: "Summary")]
        getter summary : String?

        # The service within the insight that is most impacted by the incident.
        @[JSON::Field(key: "TopAnomalousServices")]
        getter top_anomalous_services : Array(Types::AnomalousService)?

        def initialize(
          @categories : Array(String)? = nil,
          @client_request_impact_statistics : Types::RequestImpactStatistics? = nil,
          @end_time : Time? = nil,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @insight_id : String? = nil,
          @last_update_time : Time? = nil,
          @root_cause_service_id : Types::ServiceId? = nil,
          @root_cause_service_request_impact_statistics : Types::RequestImpactStatistics? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @summary : String? = nil,
          @top_anomalous_services : Array(Types::AnomalousService)? = nil
        )
        end
      end

      # The structure containing configurations related to insights.
      struct InsightsConfiguration
        include JSON::Serializable

        # Set the InsightsEnabled value to true to enable insights or false to disable insights.
        @[JSON::Field(key: "InsightsEnabled")]
        getter insights_enabled : Bool?

        # Set the NotificationsEnabled value to true to enable insights notifications. Notifications can only
        # be enabled on a group with InsightsEnabled set to true.
        @[JSON::Field(key: "NotificationsEnabled")]
        getter notifications_enabled : Bool?

        def initialize(
          @insights_enabled : Bool? = nil,
          @notifications_enabled : Bool? = nil
        )
        end
      end

      # A list of EC2 instance IDs corresponding to the segments in a trace.
      struct InstanceIdDetail
        include JSON::Serializable

        # The ID of a corresponding EC2 instance.
        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # A policy revision id was provided which does not match the latest policy revision. This exception is
      # also if a policy revision id of 0 is provided via PutResourcePolicy and a policy with the same name
      # already exists.
      struct InvalidPolicyRevisionIdException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is missing required parameters or has invalid parameters.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListResourcePoliciesRequest
        include JSON::Serializable

        # Not currently supported.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      struct ListResourcePoliciesResult
        include JSON::Serializable

        # Pagination token. Not currently supported.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of resource policies in the target Amazon Web Services account.
        @[JSON::Field(key: "ResourcePolicies")]
        getter resource_policies : Array(Types::ResourcePolicy)?

        def initialize(
          @next_token : String? = nil,
          @resource_policies : Array(Types::ResourcePolicy)? = nil
        )
        end
      end

      struct ListRetrievedTracesRequest
        include JSON::Serializable

        # Retrieval token.
        @[JSON::Field(key: "RetrievalToken")]
        getter retrieval_token : String

        # Specify the pagination token returned by a previous request to retrieve the next page of indexes.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Format of the requested traces.
        @[JSON::Field(key: "TraceFormat")]
        getter trace_format : String?

        def initialize(
          @retrieval_token : String,
          @next_token : String? = nil,
          @trace_format : String? = nil
        )
        end
      end

      struct ListRetrievedTracesResult
        include JSON::Serializable

        # Specify the pagination token returned by a previous request to retrieve the next page of indexes.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Status of the retrieval.
        @[JSON::Field(key: "RetrievalStatus")]
        getter retrieval_status : String?

        # Format of the requested traces.
        @[JSON::Field(key: "TraceFormat")]
        getter trace_format : String?

        # Full traces for the specified requests.
        @[JSON::Field(key: "Traces")]
        getter traces : Array(Types::RetrievedTrace)?

        def initialize(
          @next_token : String? = nil,
          @retrieval_status : String? = nil,
          @trace_format : String? = nil,
          @traces : Array(Types::RetrievedTrace)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A pagination token. If multiple pages of results are returned, use the NextToken value returned with
        # the current page of results as the value of this parameter to get the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A pagination token. If multiple pages of results are returned, use the NextToken value returned with
        # the current page of results to get the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of tags, as key and value pairs, that is associated with the specified X-Ray group or
        # sampling rule.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The provided resource policy would prevent the caller of this request from calling PutResourcePolicy
      # in the future.
      struct LockoutPreventionException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Invalid policy document provided in request.
      struct MalformedPolicyDocumentException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exceeded the maximum number of resource policies for a target Amazon Web Services account.
      struct PolicyCountLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exceeded the maximum size for a resource policy.
      struct PolicySizeLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The indexing rule configuration for probabilistic sampling.
      struct ProbabilisticRuleValue
        include JSON::Serializable

        # Configured sampling percentage of traceIds. Note that sampling can be subject to limits to ensure
        # completeness of data.
        @[JSON::Field(key: "DesiredSamplingPercentage")]
        getter desired_sampling_percentage : Float64

        # Applied sampling percentage of traceIds.
        @[JSON::Field(key: "ActualSamplingPercentage")]
        getter actual_sampling_percentage : Float64?

        def initialize(
          @desired_sampling_percentage : Float64,
          @actual_sampling_percentage : Float64? = nil
        )
        end
      end

      # Update to the indexing rule configuration for probabilistic sampling.
      struct ProbabilisticRuleValueUpdate
        include JSON::Serializable

        # Configured sampling percentage of traceIds. Note that sampling can be subject to limits to ensure
        # completeness of data.
        @[JSON::Field(key: "DesiredSamplingPercentage")]
        getter desired_sampling_percentage : Float64

        def initialize(
          @desired_sampling_percentage : Float64
        )
        end
      end

      struct PutEncryptionConfigRequest
        include JSON::Serializable

        # The type of encryption. Set to KMS to use your own key for encryption. Set to NONE for default
        # encryption.
        @[JSON::Field(key: "Type")]
        getter type : String

        # An Amazon Web Services KMS key in one of the following formats: Alias - The name of the key. For
        # example, alias/MyKey . Key ID - The KMS key ID of the key. For example,
        # ae4aa6d49-a4d8-9df9-a475-4ff6d7898456 . Amazon Web Services X-Ray does not support asymmetric KMS
        # keys. ARN - The full Amazon Resource Name of the key ID or alias. For example,
        # arn:aws:kms:us-east-2:123456789012:key/ae4aa6d49-a4d8-9df9-a475-4ff6d7898456 . Use this format to
        # specify a key in a different account. Omit this key if you set Type to NONE .
        @[JSON::Field(key: "KeyId")]
        getter key_id : String?

        def initialize(
          @type : String,
          @key_id : String? = nil
        )
        end
      end

      struct PutEncryptionConfigResult
        include JSON::Serializable

        # The new encryption configuration.
        @[JSON::Field(key: "EncryptionConfig")]
        getter encryption_config : Types::EncryptionConfig?

        def initialize(
          @encryption_config : Types::EncryptionConfig? = nil
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The resource policy document, which can be up to 5kb in size.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # The name of the resource policy. Must be unique within a specific Amazon Web Services account.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # A flag to indicate whether to bypass the resource policy lockout safety check. Setting this value to
        # true increases the risk that the policy becomes unmanageable. Do not set this value to true
        # indiscriminately. Use this parameter only when you include a policy in the request and you intend to
        # prevent the principal that is making the request from making a subsequent PutResourcePolicy request.
        # The default value is false.
        @[JSON::Field(key: "BypassPolicyLockoutCheck")]
        getter bypass_policy_lockout_check : Bool?

        # Specifies a specific policy revision, to ensure an atomic create operation. By default the resource
        # policy is created if it does not exist, or updated with an incremented revision id. The revision id
        # is unique to each policy in the account. If the policy revision id does not match the latest
        # revision id, the operation will fail with an InvalidPolicyRevisionIdException exception. You can
        # also provide a PolicyRevisionId of 0. In this case, the operation will fail with an
        # InvalidPolicyRevisionIdException exception if a resource policy with the same name already exists.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @bypass_policy_lockout_check : Bool? = nil,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct PutResourcePolicyResult
        include JSON::Serializable

        # The resource policy document, as provided in the PutResourcePolicyRequest .
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : Types::ResourcePolicy?

        def initialize(
          @resource_policy : Types::ResourcePolicy? = nil
        )
        end
      end

      struct PutTelemetryRecordsRequest
        include JSON::Serializable

        @[JSON::Field(key: "TelemetryRecords")]
        getter telemetry_records : Array(Types::TelemetryRecord)

        @[JSON::Field(key: "EC2InstanceId")]
        getter ec2_instance_id : String?

        @[JSON::Field(key: "Hostname")]
        getter hostname : String?

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        def initialize(
          @telemetry_records : Array(Types::TelemetryRecord),
          @ec2_instance_id : String? = nil,
          @hostname : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct PutTelemetryRecordsResult
        include JSON::Serializable

        def initialize
        end
      end

      struct PutTraceSegmentsRequest
        include JSON::Serializable

        # A string containing a JSON document defining one or more segments or subsegments.
        @[JSON::Field(key: "TraceSegmentDocuments")]
        getter trace_segment_documents : Array(String)

        def initialize(
          @trace_segment_documents : Array(String)
        )
        end
      end

      struct PutTraceSegmentsResult
        include JSON::Serializable

        # Segments that failed processing.
        @[JSON::Field(key: "UnprocessedTraceSegments")]
        getter unprocessed_trace_segments : Array(Types::UnprocessedTraceSegment)?

        def initialize(
          @unprocessed_trace_segments : Array(Types::UnprocessedTraceSegment)? = nil
        )
        end
      end

      # Statistics that describe how the incident has impacted a service.
      struct RequestImpactStatistics
        include JSON::Serializable

        # The number of requests that have resulted in a fault,
        @[JSON::Field(key: "FaultCount")]
        getter fault_count : Int64?

        # The number of successful requests.
        @[JSON::Field(key: "OkCount")]
        getter ok_count : Int64?

        # The total number of requests to the service.
        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int64?

        def initialize(
          @fault_count : Int64? = nil,
          @ok_count : Int64? = nil,
          @total_count : Int64? = nil
        )
        end
      end

      # A list of resources ARNs corresponding to the segments in a trace.
      struct ResourceARNDetail
        include JSON::Serializable

        # The ARN of a corresponding resource.
        @[JSON::Field(key: "ARN")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # The resource was not found. Verify that the name or Amazon Resource Name (ARN) of the resource is
      # correct.
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

      # A resource policy grants one or more Amazon Web Services services and accounts permissions to access
      # X-Ray. Each resource policy is associated with a specific Amazon Web Services account.
      struct ResourcePolicy
        include JSON::Serializable

        # When the policy was last updated, in Unix time seconds.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The resource policy document, which can be up to 5kb in size.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String?

        # The name of the resource policy. Must be unique within a specific Amazon Web Services account.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # Returns the current policy revision id for this policy name.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @last_updated_time : Time? = nil,
          @policy_document : String? = nil,
          @policy_name : String? = nil,
          @policy_revision_id : String? = nil
        )
        end
      end

      # The root cause information for a response time warning.
      struct ResponseTimeRootCause
        include JSON::Serializable

        # A flag that denotes that the root cause impacts the trace client.
        @[JSON::Field(key: "ClientImpacting")]
        getter client_impacting : Bool?

        # A list of corresponding services. A service identifies a segment and contains a name, account ID,
        # type, and inferred flag.
        @[JSON::Field(key: "Services")]
        getter services : Array(Types::ResponseTimeRootCauseService)?

        def initialize(
          @client_impacting : Bool? = nil,
          @services : Array(Types::ResponseTimeRootCauseService)? = nil
        )
        end
      end

      # A collection of segments and corresponding subsegments associated to a response time warning.
      struct ResponseTimeRootCauseEntity
        include JSON::Serializable

        # The type and messages of the exceptions.
        @[JSON::Field(key: "Coverage")]
        getter coverage : Float64?

        # The name of the entity.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A flag that denotes a remote subsegment.
        @[JSON::Field(key: "Remote")]
        getter remote : Bool?

        def initialize(
          @coverage : Float64? = nil,
          @name : String? = nil,
          @remote : Bool? = nil
        )
        end
      end

      # A collection of fields identifying the service in a response time warning.
      struct ResponseTimeRootCauseService
        include JSON::Serializable

        # The account ID associated to the service.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The path of root cause entities found on the service.
        @[JSON::Field(key: "EntityPath")]
        getter entity_path : Array(Types::ResponseTimeRootCauseEntity)?

        # A Boolean value indicating if the service is inferred from the trace.
        @[JSON::Field(key: "Inferred")]
        getter inferred : Bool?

        # The service name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A collection of associated service names.
        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # The type associated to the service.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @account_id : String? = nil,
          @entity_path : Array(Types::ResponseTimeRootCauseEntity)? = nil,
          @inferred : Bool? = nil,
          @name : String? = nil,
          @names : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Retrieved information about an application that processed requests, users that made requests, or
      # downstream services, resources, and applications that an application used.
      struct RetrievedService
        include JSON::Serializable

        # Relation between two 2 services.
        @[JSON::Field(key: "Links")]
        getter links : Array(Types::GraphLink)?

        @[JSON::Field(key: "Service")]
        getter service : Types::Service?

        def initialize(
          @links : Array(Types::GraphLink)? = nil,
          @service : Types::Service? = nil
        )
        end
      end

      # Retrieved collection of spans with matching trace IDs.
      struct RetrievedTrace
        include JSON::Serializable

        # The length of time in seconds between the start time of the root span and the end time of the last
        # span that completed.
        @[JSON::Field(key: "Duration")]
        getter duration : Float64?

        # The unique identifier for the span.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Spans that comprise the trace.
        @[JSON::Field(key: "Spans")]
        getter spans : Array(Types::Span)?

        def initialize(
          @duration : Float64? = nil,
          @id : String? = nil,
          @spans : Array(Types::Span)? = nil
        )
        end
      end

      # The exception associated with a root cause.
      struct RootCauseException
        include JSON::Serializable

        # The message of the exception.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the exception.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @message : String? = nil,
          @name : String? = nil
        )
        end
      end

      # You have reached the maximum number of sampling rules.
      struct RuleLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Temporary boost sampling rate. X-Ray calculates sampling boost for each service based on the recent
      # sampling boost stats of all services that called GetSamplingTargets .
      struct SamplingBoost
        include JSON::Serializable

        # The calculated sampling boost rate for this service
        @[JSON::Field(key: "BoostRate")]
        getter boost_rate : Float64

        # When the sampling boost expires.
        @[JSON::Field(key: "BoostRateTTL")]
        getter boost_rate_ttl : Time

        def initialize(
          @boost_rate : Float64,
          @boost_rate_ttl : Time
        )
        end
      end

      # Request anomaly stats for a single rule from a service. Results are for the last 10 seconds unless
      # the service has been assigned a longer reporting interval after a previous call to
      # GetSamplingTargets .
      struct SamplingBoostStatisticsDocument
        include JSON::Serializable

        # The number of requests with anomaly.
        @[JSON::Field(key: "AnomalyCount")]
        getter anomaly_count : Int32

        # The name of the sampling rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The number of requests with anomaly recorded.
        @[JSON::Field(key: "SampledAnomalyCount")]
        getter sampled_anomaly_count : Int32

        # Matches the name that the service uses to identify itself in segments.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The current time.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # The number of requests that associated to the rule.
        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int32

        def initialize(
          @anomaly_count : Int32,
          @rule_name : String,
          @sampled_anomaly_count : Int32,
          @service_name : String,
          @timestamp : Time,
          @total_count : Int32
        )
        end
      end

      # Enable temporary sampling rate increases when you detect anomalies to improve visibility.
      struct SamplingRateBoost
        include JSON::Serializable

        # Sets the time window (in minutes) in which only one sampling rate boost can be triggered. After a
        # boost occurs, no further boosts are allowed until the next window.
        @[JSON::Field(key: "CooldownWindowMinutes")]
        getter cooldown_window_minutes : Int32

        # Defines max temporary sampling rate to apply when a boost is triggered. Calculated boost rate by
        # X-Ray will be less than or equal to this max rate.
        @[JSON::Field(key: "MaxRate")]
        getter max_rate : Float64

        def initialize(
          @cooldown_window_minutes : Int32,
          @max_rate : Float64
        )
        end
      end

      # A sampling rule that services use to decide whether to instrument a request. Rule fields can match
      # properties of the service, or properties of a request. The service can ignore rules that don't match
      # its properties.
      struct SamplingRule
        include JSON::Serializable

        # The percentage of matching requests to instrument, after the reservoir is exhausted.
        @[JSON::Field(key: "FixedRate")]
        getter fixed_rate : Float64

        # Matches the HTTP method of a request.
        @[JSON::Field(key: "HTTPMethod")]
        getter http_method : String

        # Matches the hostname from a request URL.
        @[JSON::Field(key: "Host")]
        getter host : String

        # The priority of the sampling rule.
        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # A fixed number of matching requests to instrument per second, prior to applying the fixed rate. The
        # reservoir is not used directly by services, but applies to all services using the rule collectively.
        @[JSON::Field(key: "ReservoirSize")]
        getter reservoir_size : Int32

        # Matches the ARN of the Amazon Web Services resource on which the service runs.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # Matches the name that the service uses to identify itself in segments.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # Matches the origin that the service uses to identify its type in segments.
        @[JSON::Field(key: "ServiceType")]
        getter service_type : String

        # Matches the path from a request URL.
        @[JSON::Field(key: "URLPath")]
        getter url_path : String

        # The version of the sampling rule format ( 1 ).
        @[JSON::Field(key: "Version")]
        getter version : Int32

        # Matches attributes derived from the request.
        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The ARN of the sampling rule. Specify a rule by either name or ARN, but not both.
        @[JSON::Field(key: "RuleARN")]
        getter rule_arn : String?

        # The name of the sampling rule. Specify a rule by either name or ARN, but not both.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        # Specifies the multiplier applied to the base sampling rate. This boost allows you to temporarily
        # increase sampling without changing the rule's configuration.
        @[JSON::Field(key: "SamplingRateBoost")]
        getter sampling_rate_boost : Types::SamplingRateBoost?

        def initialize(
          @fixed_rate : Float64,
          @http_method : String,
          @host : String,
          @priority : Int32,
          @reservoir_size : Int32,
          @resource_arn : String,
          @service_name : String,
          @service_type : String,
          @url_path : String,
          @version : Int32,
          @attributes : Hash(String, String)? = nil,
          @rule_arn : String? = nil,
          @rule_name : String? = nil,
          @sampling_rate_boost : Types::SamplingRateBoost? = nil
        )
        end
      end

      # A SamplingRule and its metadata.
      struct SamplingRuleRecord
        include JSON::Serializable

        # When the rule was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # When the rule was last modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time?

        # The sampling rule.
        @[JSON::Field(key: "SamplingRule")]
        getter sampling_rule : Types::SamplingRule?

        def initialize(
          @created_at : Time? = nil,
          @modified_at : Time? = nil,
          @sampling_rule : Types::SamplingRule? = nil
        )
        end
      end

      # A document specifying changes to a sampling rule's configuration.
      struct SamplingRuleUpdate
        include JSON::Serializable

        # Matches attributes derived from the request.
        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The percentage of matching requests to instrument, after the reservoir is exhausted.
        @[JSON::Field(key: "FixedRate")]
        getter fixed_rate : Float64?

        # Matches the HTTP method of a request.
        @[JSON::Field(key: "HTTPMethod")]
        getter http_method : String?

        # Matches the hostname from a request URL.
        @[JSON::Field(key: "Host")]
        getter host : String?

        # The priority of the sampling rule.
        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # A fixed number of matching requests to instrument per second, prior to applying the fixed rate. The
        # reservoir is not used directly by services, but applies to all services using the rule collectively.
        @[JSON::Field(key: "ReservoirSize")]
        getter reservoir_size : Int32?

        # Matches the ARN of the Amazon Web Services resource on which the service runs.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The ARN of the sampling rule. Specify a rule by either name or ARN, but not both.
        @[JSON::Field(key: "RuleARN")]
        getter rule_arn : String?

        # The name of the sampling rule. Specify a rule by either name or ARN, but not both.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        # Specifies the multiplier applied to the base sampling rate. This boost allows you to temporarily
        # increase sampling without changing the rule's configuration.
        @[JSON::Field(key: "SamplingRateBoost")]
        getter sampling_rate_boost : Types::SamplingRateBoost?

        # Matches the name that the service uses to identify itself in segments.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # Matches the origin that the service uses to identify its type in segments.
        @[JSON::Field(key: "ServiceType")]
        getter service_type : String?

        # Matches the path from a request URL.
        @[JSON::Field(key: "URLPath")]
        getter url_path : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @fixed_rate : Float64? = nil,
          @http_method : String? = nil,
          @host : String? = nil,
          @priority : Int32? = nil,
          @reservoir_size : Int32? = nil,
          @resource_arn : String? = nil,
          @rule_arn : String? = nil,
          @rule_name : String? = nil,
          @sampling_rate_boost : Types::SamplingRateBoost? = nil,
          @service_name : String? = nil,
          @service_type : String? = nil,
          @url_path : String? = nil
        )
        end
      end

      # Aggregated request sampling data for a sampling rule across all services for a 10-second window.
      struct SamplingStatisticSummary
        include JSON::Serializable

        # The number of requests recorded with borrowed reservoir quota.
        @[JSON::Field(key: "BorrowCount")]
        getter borrow_count : Int32?

        # The number of requests that matched the rule.
        @[JSON::Field(key: "RequestCount")]
        getter request_count : Int32?

        # The name of the sampling rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        # The number of requests recorded.
        @[JSON::Field(key: "SampledCount")]
        getter sampled_count : Int32?

        # The start time of the reporting window.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        def initialize(
          @borrow_count : Int32? = nil,
          @request_count : Int32? = nil,
          @rule_name : String? = nil,
          @sampled_count : Int32? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Request sampling results for a single rule from a service. Results are for the last 10 seconds
      # unless the service has been assigned a longer reporting interval after a previous call to
      # GetSamplingTargets .
      struct SamplingStatisticsDocument
        include JSON::Serializable

        # A unique identifier for the service in hexadecimal.
        @[JSON::Field(key: "ClientID")]
        getter client_id : String

        # The number of requests that matched the rule.
        @[JSON::Field(key: "RequestCount")]
        getter request_count : Int32

        # The name of the sampling rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The number of requests recorded.
        @[JSON::Field(key: "SampledCount")]
        getter sampled_count : Int32

        # The current time.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # The number of requests recorded with borrowed reservoir quota.
        @[JSON::Field(key: "BorrowCount")]
        getter borrow_count : Int32?

        def initialize(
          @client_id : String,
          @request_count : Int32,
          @rule_name : String,
          @sampled_count : Int32,
          @timestamp : Time,
          @borrow_count : Int32? = nil
        )
        end
      end

      # The name and value of a sampling rule to apply to a trace summary.
      struct SamplingStrategy
        include JSON::Serializable

        # The name of a sampling rule.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of a sampling rule.
        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @name : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Temporary changes to a sampling rule configuration. To meet the global sampling target for a rule,
      # X-Ray calculates a new reservoir for each service based on the recent sampling results of all
      # services that called GetSamplingTargets .
      struct SamplingTargetDocument
        include JSON::Serializable

        # The percentage of matching requests to instrument, after the reservoir is exhausted.
        @[JSON::Field(key: "FixedRate")]
        getter fixed_rate : Float64?

        # The number of seconds for the service to wait before getting sampling targets again.
        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The number of requests per second that X-Ray allocated for this service.
        @[JSON::Field(key: "ReservoirQuota")]
        getter reservoir_quota : Int32?

        # When the reservoir quota expires.
        @[JSON::Field(key: "ReservoirQuotaTTL")]
        getter reservoir_quota_ttl : Time?

        # The name of the sampling rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        # The sampling boost that X-Ray allocated for this service.
        @[JSON::Field(key: "SamplingBoost")]
        getter sampling_boost : Types::SamplingBoost?

        def initialize(
          @fixed_rate : Float64? = nil,
          @interval : Int32? = nil,
          @reservoir_quota : Int32? = nil,
          @reservoir_quota_ttl : Time? = nil,
          @rule_name : String? = nil,
          @sampling_boost : Types::SamplingBoost? = nil
        )
        end
      end

      # A segment from a trace that has been ingested by the X-Ray service. The segment can be compiled from
      # documents uploaded with PutTraceSegments , or an inferred segment for a downstream service,
      # generated from a subsegment sent by the service that called it. For the full segment document
      # schema, see Amazon Web Services X-Ray segment documents in the Amazon Web Services X-Ray Developer
      # Guide .
      struct Segment
        include JSON::Serializable

        # The segment document.
        @[JSON::Field(key: "Document")]
        getter document : String?

        # The segment's ID.
        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @document : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Information about an application that processed requests, users that made requests, or downstream
      # services, resources, and applications that an application used.
      struct Service
        include JSON::Serializable

        # Identifier of the Amazon Web Services account in which the service runs.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # A histogram that maps the spread of service durations.
        @[JSON::Field(key: "DurationHistogram")]
        getter duration_histogram : Array(Types::HistogramEntry)?

        # Connections to downstream services.
        @[JSON::Field(key: "Edges")]
        getter edges : Array(Types::Edge)?

        # The end time of the last segment that the service generated.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The canonical name of the service.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of names for the service, including the canonical name.
        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # Identifier for the service. Unique within the service map.
        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : Int32?

        # A histogram that maps the spread of service response times.
        @[JSON::Field(key: "ResponseTimeHistogram")]
        getter response_time_histogram : Array(Types::HistogramEntry)?

        # Indicates that the service was the first service to process a request.
        @[JSON::Field(key: "Root")]
        getter root : Bool?

        # The start time of the first segment that the service generated.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The service's state.
        @[JSON::Field(key: "State")]
        getter state : String?

        # Aggregated statistics for the service.
        @[JSON::Field(key: "SummaryStatistics")]
        getter summary_statistics : Types::ServiceStatistics?

        # The type of service. Amazon Web Services Resource - The type of an Amazon Web Services resource. For
        # example, AWS::EC2::Instance for an application running on Amazon EC2 or AWS::DynamoDB::Table for an
        # Amazon DynamoDB table that the application used. Amazon Web Services Service - The type of an Amazon
        # Web Services service. For example, AWS::DynamoDB for downstream calls to Amazon DynamoDB that didn't
        # target a specific table. client - Represents the clients that sent requests to a root service.
        # remote - A downstream service of indeterminate type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @account_id : String? = nil,
          @duration_histogram : Array(Types::HistogramEntry)? = nil,
          @edges : Array(Types::Edge)? = nil,
          @end_time : Time? = nil,
          @name : String? = nil,
          @names : Array(String)? = nil,
          @reference_id : Int32? = nil,
          @response_time_histogram : Array(Types::HistogramEntry)? = nil,
          @root : Bool? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @summary_statistics : Types::ServiceStatistics? = nil,
          @type : String? = nil
        )
        end
      end

      struct ServiceId
        include JSON::Serializable

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        @[JSON::Field(key: "Name")]
        getter name : String?

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @account_id : String? = nil,
          @name : String? = nil,
          @names : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Response statistics for a service.
      struct ServiceStatistics
        include JSON::Serializable

        # Information about requests that failed with a 4xx Client Error status code.
        @[JSON::Field(key: "ErrorStatistics")]
        getter error_statistics : Types::ErrorStatistics?

        # Information about requests that failed with a 5xx Server Error status code.
        @[JSON::Field(key: "FaultStatistics")]
        getter fault_statistics : Types::FaultStatistics?

        # The number of requests that completed with a 2xx Success status code.
        @[JSON::Field(key: "OkCount")]
        getter ok_count : Int64?

        # The total number of completed requests.
        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int64?

        # The aggregate response time of completed requests.
        @[JSON::Field(key: "TotalResponseTime")]
        getter total_response_time : Float64?

        def initialize(
          @error_statistics : Types::ErrorStatistics? = nil,
          @fault_statistics : Types::FaultStatistics? = nil,
          @ok_count : Int64? = nil,
          @total_count : Int64? = nil,
          @total_response_time : Float64? = nil
        )
        end
      end

      # A span from a trace that has been ingested by the X-Ray service. A span represents a unit of work or
      # an operation performed by a service.
      struct Span
        include JSON::Serializable

        # The span document.
        @[JSON::Field(key: "Document")]
        getter document : String?

        # The span ID.
        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @document : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct StartTraceRetrievalRequest
        include JSON::Serializable

        # The end of the time range to retrieve traces. The range is inclusive, so the specified end time is
        # included in the query. Specified as epoch time, the number of seconds since January 1, 1970,
        # 00:00:00 UTC.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start of the time range to retrieve traces. The range is inclusive, so the specified start time
        # is included in the query. Specified as epoch time, the number of seconds since January 1, 1970,
        # 00:00:00 UTC.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Specify the trace IDs of the traces to be retrieved.
        @[JSON::Field(key: "TraceIds")]
        getter trace_ids : Array(String)

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @trace_ids : Array(String)
        )
        end
      end

      struct StartTraceRetrievalResult
        include JSON::Serializable

        # Retrieval token.
        @[JSON::Field(key: "RetrievalToken")]
        getter retrieval_token : String?

        def initialize(
          @retrieval_token : String? = nil
        )
        end
      end

      # A map that contains tag keys and tag values to attach to an Amazon Web Services X-Ray group or
      # sampling rule. For more information about ways to use tags, see Tagging Amazon Web Services
      # resources in the Amazon Web Services General Reference . The following restrictions apply to tags:
      # Maximum number of user-applied tags per resource: 50 Tag keys and values are case sensitive. Don't
      # use aws: as a prefix for keys; it's reserved for Amazon Web Services use. You cannot edit or delete
      # system tags.
      struct Tag
        include JSON::Serializable

        # A tag key, such as Stage or Name . A tag key cannot be empty. The key can be a maximum of 128
        # characters, and can contain only Unicode letters, numbers, or separators, or the following special
        # characters: + - = . _ : /
        @[JSON::Field(key: "Key")]
        getter key : String

        # An optional tag value, such as Production or test-only . The value can be a maximum of 255
        # characters, and contain only Unicode letters, numbers, or separators, or the following special
        # characters: + - = . _ : /
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A map that contains one or more tag keys and tag values to attach to an X-Ray group or sampling
        # rule. For more information about ways to use tags, see Tagging Amazon Web Services resources in the
        # Amazon Web Services General Reference . The following restrictions apply to tags: Maximum number of
        # user-applied tags per resource: 50 Maximum tag key length: 128 Unicode characters Maximum tag value
        # length: 256 Unicode characters Valid values for key and value: a-z, A-Z, 0-9, space, and the
        # following characters: _ . : / = + - and @ Tag keys and values are case sensitive. Don't use aws: as
        # a prefix for keys; it's reserved for Amazon Web Services use. You cannot edit or delete system tags.
        @[JSON::Field(key: "Tags")]
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

      struct TelemetryRecord
        include JSON::Serializable

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        @[JSON::Field(key: "BackendConnectionErrors")]
        getter backend_connection_errors : Types::BackendConnectionErrors?

        @[JSON::Field(key: "SegmentsReceivedCount")]
        getter segments_received_count : Int32?

        @[JSON::Field(key: "SegmentsRejectedCount")]
        getter segments_rejected_count : Int32?

        @[JSON::Field(key: "SegmentsSentCount")]
        getter segments_sent_count : Int32?

        @[JSON::Field(key: "SegmentsSpilloverCount")]
        getter segments_spillover_count : Int32?

        def initialize(
          @timestamp : Time,
          @backend_connection_errors : Types::BackendConnectionErrors? = nil,
          @segments_received_count : Int32? = nil,
          @segments_rejected_count : Int32? = nil,
          @segments_sent_count : Int32? = nil,
          @segments_spillover_count : Int32? = nil
        )
        end
      end

      # The request exceeds the maximum number of requests per second.
      struct ThrottledException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A list of TimeSeriesStatistic structures.
      struct TimeSeriesServiceStatistics
        include JSON::Serializable

        @[JSON::Field(key: "EdgeSummaryStatistics")]
        getter edge_summary_statistics : Types::EdgeStatistics?

        # The response time histogram for the selected entities.
        @[JSON::Field(key: "ResponseTimeHistogram")]
        getter response_time_histogram : Array(Types::HistogramEntry)?

        # The forecasted high and low fault count values.
        @[JSON::Field(key: "ServiceForecastStatistics")]
        getter service_forecast_statistics : Types::ForecastStatistics?

        @[JSON::Field(key: "ServiceSummaryStatistics")]
        getter service_summary_statistics : Types::ServiceStatistics?

        # Timestamp of the window for which statistics are aggregated.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        def initialize(
          @edge_summary_statistics : Types::EdgeStatistics? = nil,
          @response_time_histogram : Array(Types::HistogramEntry)? = nil,
          @service_forecast_statistics : Types::ForecastStatistics? = nil,
          @service_summary_statistics : Types::ServiceStatistics? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # You have exceeded the maximum number of tags you can apply to this resource.
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

      # A collection of segment documents with matching trace IDs.
      struct Trace
        include JSON::Serializable

        # The length of time in seconds between the start time of the earliest segment that started and the
        # end time of the last segment that completed.
        @[JSON::Field(key: "Duration")]
        getter duration : Float64?

        # The unique identifier for the request that generated the trace's segments and subsegments.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # LimitExceeded is set to true when the trace has exceeded the Trace document size limit. For more
        # information about this limit and other X-Ray limits and quotas, see Amazon Web Services X-Ray
        # endpoints and quotas .
        @[JSON::Field(key: "LimitExceeded")]
        getter limit_exceeded : Bool?

        # Segment documents for the segments and subsegments that comprise the trace.
        @[JSON::Field(key: "Segments")]
        getter segments : Array(Types::Segment)?

        def initialize(
          @duration : Float64? = nil,
          @id : String? = nil,
          @limit_exceeded : Bool? = nil,
          @segments : Array(Types::Segment)? = nil
        )
        end
      end

      # Metadata generated from the segment documents in a trace.
      struct TraceSummary
        include JSON::Serializable

        # Annotations from the trace's segment documents.
        @[JSON::Field(key: "Annotations")]
        getter annotations : Hash(String, Array(Types::ValueWithServiceIds))?

        # A list of Availability Zones for any zone corresponding to the trace segments.
        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(Types::AvailabilityZoneDetail)?

        # The length of time in seconds between the start time of the earliest segment that started and the
        # end time of the last segment that completed.
        @[JSON::Field(key: "Duration")]
        getter duration : Float64?

        # The root of a trace.
        @[JSON::Field(key: "EntryPoint")]
        getter entry_point : Types::ServiceId?

        # A collection of ErrorRootCause structures corresponding to the trace segments.
        @[JSON::Field(key: "ErrorRootCauses")]
        getter error_root_causes : Array(Types::ErrorRootCause)?

        # A collection of FaultRootCause structures corresponding to the trace segments.
        @[JSON::Field(key: "FaultRootCauses")]
        getter fault_root_causes : Array(Types::FaultRootCause)?

        # The root segment document has a 400 series error.
        @[JSON::Field(key: "HasError")]
        getter has_error : Bool?

        # The root segment document has a 500 series error.
        @[JSON::Field(key: "HasFault")]
        getter has_fault : Bool?

        # One or more of the segment documents has a 429 throttling error.
        @[JSON::Field(key: "HasThrottle")]
        getter has_throttle : Bool?

        # Information about the HTTP request served by the trace.
        @[JSON::Field(key: "Http")]
        getter http : Types::Http?

        # The unique identifier for the request that generated the trace's segments and subsegments.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # A list of EC2 instance IDs for any instance corresponding to the trace segments.
        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(Types::InstanceIdDetail)?

        # One or more of the segment documents is in progress.
        @[JSON::Field(key: "IsPartial")]
        getter is_partial : Bool?

        # The matched time stamp of a defined event.
        @[JSON::Field(key: "MatchedEventTime")]
        getter matched_event_time : Time?

        # A list of resource ARNs for any resource corresponding to the trace segments.
        @[JSON::Field(key: "ResourceARNs")]
        getter resource_ar_ns : Array(Types::ResourceARNDetail)?

        # The length of time in seconds between the start and end times of the root segment. If the service
        # performs work asynchronously, the response time measures the time before the response is sent to the
        # user, while the duration measures the amount of time before the last traced activity completes.
        @[JSON::Field(key: "ResponseTime")]
        getter response_time : Float64?

        # A collection of ResponseTimeRootCause structures corresponding to the trace segments.
        @[JSON::Field(key: "ResponseTimeRootCauses")]
        getter response_time_root_causes : Array(Types::ResponseTimeRootCause)?

        # The revision number of a trace.
        @[JSON::Field(key: "Revision")]
        getter revision : Int32?

        # Service IDs from the trace's segment documents.
        @[JSON::Field(key: "ServiceIds")]
        getter service_ids : Array(Types::ServiceId)?

        # The start time of a trace, based on the earliest trace segment start time.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # Users from the trace's segment documents.
        @[JSON::Field(key: "Users")]
        getter users : Array(Types::TraceUser)?

        def initialize(
          @annotations : Hash(String, Array(Types::ValueWithServiceIds))? = nil,
          @availability_zones : Array(Types::AvailabilityZoneDetail)? = nil,
          @duration : Float64? = nil,
          @entry_point : Types::ServiceId? = nil,
          @error_root_causes : Array(Types::ErrorRootCause)? = nil,
          @fault_root_causes : Array(Types::FaultRootCause)? = nil,
          @has_error : Bool? = nil,
          @has_fault : Bool? = nil,
          @has_throttle : Bool? = nil,
          @http : Types::Http? = nil,
          @id : String? = nil,
          @instance_ids : Array(Types::InstanceIdDetail)? = nil,
          @is_partial : Bool? = nil,
          @matched_event_time : Time? = nil,
          @resource_ar_ns : Array(Types::ResourceARNDetail)? = nil,
          @response_time : Float64? = nil,
          @response_time_root_causes : Array(Types::ResponseTimeRootCause)? = nil,
          @revision : Int32? = nil,
          @service_ids : Array(Types::ServiceId)? = nil,
          @start_time : Time? = nil,
          @users : Array(Types::TraceUser)? = nil
        )
        end
      end

      # Information about a user recorded in segment documents.
      struct TraceUser
        include JSON::Serializable

        # Services that the user's request hit.
        @[JSON::Field(key: "ServiceIds")]
        getter service_ids : Array(Types::ServiceId)?

        # The user's name.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @service_ids : Array(Types::ServiceId)? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Sampling statistics from a call to GetSamplingTargets that X-Ray could not process.
      struct UnprocessedStatistics
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the sampling rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil,
          @rule_name : String? = nil
        )
        end
      end

      # Information about a segment that failed processing.
      struct UnprocessedTraceSegment
        include JSON::Serializable

        # The error that caused processing to fail.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The segment's ID.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @id : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # Keys for one or more tags that you want to remove from an X-Ray group or sampling rule.
        @[JSON::Field(key: "TagKeys")]
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

      struct UpdateGroupRequest
        include JSON::Serializable

        # The updated filter expression defining criteria by which to group traces.
        @[JSON::Field(key: "FilterExpression")]
        getter filter_expression : String?

        # The ARN that was generated upon creation.
        @[JSON::Field(key: "GroupARN")]
        getter group_arn : String?

        # The case-sensitive name of the group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The structure containing configurations related to insights. The InsightsEnabled boolean can be set
        # to true to enable insights for the group or false to disable insights for the group. The
        # NotificationsEnabled boolean can be set to true to enable insights notifications for the group.
        # Notifications can only be enabled on a group with InsightsEnabled set to true.
        @[JSON::Field(key: "InsightsConfiguration")]
        getter insights_configuration : Types::InsightsConfiguration?

        def initialize(
          @filter_expression : String? = nil,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @insights_configuration : Types::InsightsConfiguration? = nil
        )
        end
      end

      struct UpdateGroupResult
        include JSON::Serializable

        # The group that was updated. Contains the name of the group that was updated, the ARN of the group
        # that was updated, the updated filter expression, and the updated insight configuration assigned to
        # the group.
        @[JSON::Field(key: "Group")]
        getter group : Types::Group?

        def initialize(
          @group : Types::Group? = nil
        )
        end
      end

      struct UpdateIndexingRuleRequest
        include JSON::Serializable

        # Name of the indexing rule to be updated.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Rule configuration to be updated.
        @[JSON::Field(key: "Rule")]
        getter rule : Types::IndexingRuleValueUpdate

        def initialize(
          @name : String,
          @rule : Types::IndexingRuleValueUpdate
        )
        end
      end

      struct UpdateIndexingRuleResult
        include JSON::Serializable

        # Updated indexing rule.
        @[JSON::Field(key: "IndexingRule")]
        getter indexing_rule : Types::IndexingRule?

        def initialize(
          @indexing_rule : Types::IndexingRule? = nil
        )
        end
      end

      struct UpdateSamplingRuleRequest
        include JSON::Serializable

        # The rule and fields to change.
        @[JSON::Field(key: "SamplingRuleUpdate")]
        getter sampling_rule_update : Types::SamplingRuleUpdate

        def initialize(
          @sampling_rule_update : Types::SamplingRuleUpdate
        )
        end
      end

      struct UpdateSamplingRuleResult
        include JSON::Serializable

        # The updated rule definition and metadata.
        @[JSON::Field(key: "SamplingRuleRecord")]
        getter sampling_rule_record : Types::SamplingRuleRecord?

        def initialize(
          @sampling_rule_record : Types::SamplingRuleRecord? = nil
        )
        end
      end

      struct UpdateTraceSegmentDestinationRequest
        include JSON::Serializable

        # The configured destination of trace segments.
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        def initialize(
          @destination : String? = nil
        )
        end
      end

      struct UpdateTraceSegmentDestinationResult
        include JSON::Serializable

        # The destination of the trace segments.
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # The status of the update.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @destination : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about a segment annotation.
      struct ValueWithServiceIds
        include JSON::Serializable

        # Values of the annotation.
        @[JSON::Field(key: "AnnotationValue")]
        getter annotation_value : Types::AnnotationValue?

        # Services to which the annotation applies.
        @[JSON::Field(key: "ServiceIds")]
        getter service_ids : Array(Types::ServiceId)?

        def initialize(
          @annotation_value : Types::AnnotationValue? = nil,
          @service_ids : Array(Types::ServiceId)? = nil
        )
        end
      end
    end
  end
end
