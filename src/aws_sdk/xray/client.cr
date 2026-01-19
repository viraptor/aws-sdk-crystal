module AwsSdk
  module XRay
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # You cannot find traces through this API if Transaction Search is enabled since trace is not indexed
      # in X-Ray. Retrieves a list of traces specified by ID. Each trace is a collection of segment
      # documents that originates from a single request. Use GetTraceSummaries to get a list of trace IDs.
      def batch_get_traces(
        trace_ids : Array(String),
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchGetTracesRequest.new(trace_ids: trace_ids, next_token: next_token)
        batch_get_traces(input)
      end
      def batch_get_traces(input : Types::BatchGetTracesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_TRACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels an ongoing trace retrieval job initiated by StartTraceRetrieval using the provided
      # RetrievalToken . A successful cancellation will return an HTTP 200 response.
      def cancel_trace_retrieval(
        retrieval_token : String
      ) : Protocol::Request
        input = Types::CancelTraceRetrievalRequest.new(retrieval_token: retrieval_token)
        cancel_trace_retrieval(input)
      end
      def cancel_trace_retrieval(input : Types::CancelTraceRetrievalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_TRACE_RETRIEVAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a group resource with a name and a filter expression.
      def create_group(
        group_name : String,
        filter_expression : String? = nil,
        insights_configuration : Types::InsightsConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateGroupRequest.new(group_name: group_name, filter_expression: filter_expression, insights_configuration: insights_configuration, tags: tags)
        create_group(input)
      end
      def create_group(input : Types::CreateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a rule to control sampling behavior for instrumented applications. Services retrieve rules
      # with GetSamplingRules , and evaluate each rule in ascending order of priority for each request. If a
      # rule matches, the service records a trace, borrowing it from the reservoir size. After 10 seconds,
      # the service reports back to X-Ray with GetSamplingTargets to get updated versions of each in-use
      # rule. The updated rule contains a trace quota that the service can use instead of borrowing from the
      # reservoir.
      def create_sampling_rule(
        sampling_rule : Types::SamplingRule,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateSamplingRuleRequest.new(sampling_rule: sampling_rule, tags: tags)
        create_sampling_rule(input)
      end
      def create_sampling_rule(input : Types::CreateSamplingRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SAMPLING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a group resource.
      def delete_group(
        group_arn : String? = nil,
        group_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteGroupRequest.new(group_arn: group_arn, group_name: group_name)
        delete_group(input)
      end
      def delete_group(input : Types::DeleteGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resource policy from the target Amazon Web Services account.
      def delete_resource_policy(
        policy_name : String,
        policy_revision_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(policy_name: policy_name, policy_revision_id: policy_revision_id)
        delete_resource_policy(input)
      end
      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a sampling rule.
      def delete_sampling_rule(
        rule_arn : String? = nil,
        rule_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteSamplingRuleRequest.new(rule_arn: rule_arn, rule_name: rule_name)
        delete_sampling_rule(input)
      end
      def delete_sampling_rule(input : Types::DeleteSamplingRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SAMPLING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current encryption configuration for X-Ray data.
      def get_encryption_config : Protocol::Request
        input = Types::GetEncryptionConfigRequest.new
        get_encryption_config(input)
      end
      def get_encryption_config(input : Types::GetEncryptionConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENCRYPTION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves group resource details.
      def get_group(
        group_arn : String? = nil,
        group_name : String? = nil
      ) : Protocol::Request
        input = Types::GetGroupRequest.new(group_arn: group_arn, group_name: group_name)
        get_group(input)
      end
      def get_group(input : Types::GetGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all active group details.
      def get_groups(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetGroupsRequest.new(next_token: next_token)
        get_groups(input)
      end
      def get_groups(input : Types::GetGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all indexing rules. Indexing rules are used to determine the server-side sampling rate for
      # spans ingested through the CloudWatchLogs destination and indexed by X-Ray. For more information,
      # see Transaction Search .
      def get_indexing_rules(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetIndexingRulesRequest.new(next_token: next_token)
        get_indexing_rules(input)
      end
      def get_indexing_rules(input : Types::GetIndexingRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INDEXING_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the summary information of an insight. This includes impact to clients and root cause
      # services, the top anomalous services, the category, the state of the insight, and the start and end
      # time of the insight.
      def get_insight(
        insight_id : String
      ) : Protocol::Request
        input = Types::GetInsightRequest.new(insight_id: insight_id)
        get_insight(input)
      end
      def get_insight(input : Types::GetInsightRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSIGHT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # X-Ray reevaluates insights periodically until they're resolved, and records each intermediate state
      # as an event. You can review an insight's events in the Impact Timeline on the Inspect page in the
      # X-Ray console.
      def get_insight_events(
        insight_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetInsightEventsRequest.new(insight_id: insight_id, max_results: max_results, next_token: next_token)
        get_insight_events(input)
      end
      def get_insight_events(input : Types::GetInsightEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSIGHT_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a service graph structure filtered by the specified insight. The service graph is limited
      # to only structural information. For a complete service graph, use this API with the GetServiceGraph
      # API.
      def get_insight_impact_graph(
        end_time : Time,
        insight_id : String,
        start_time : Time,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetInsightImpactGraphRequest.new(end_time: end_time, insight_id: insight_id, start_time: start_time, next_token: next_token)
        get_insight_impact_graph(input)
      end
      def get_insight_impact_graph(input : Types::GetInsightImpactGraphRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSIGHT_IMPACT_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the summaries of all insights in the specified group matching the provided filter values.
      def get_insight_summaries(
        end_time : Time,
        start_time : Time,
        group_arn : String? = nil,
        group_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        states : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetInsightSummariesRequest.new(end_time: end_time, start_time: start_time, group_arn: group_arn, group_name: group_name, max_results: max_results, next_token: next_token, states: states)
        get_insight_summaries(input)
      end
      def get_insight_summaries(input : Types::GetInsightSummariesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSIGHT_SUMMARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a service graph for traces based on the specified RetrievalToken from the CloudWatch log
      # group generated by Transaction Search. This API does not initiate a retrieval job. You must first
      # execute StartTraceRetrieval to obtain the required RetrievalToken . The trace graph describes
      # services that process incoming requests and any downstream services they call, which may include
      # Amazon Web Services resources, external APIs, or databases. The response is empty until the
      # RetrievalStatus is COMPLETE . Retry the request after the status changes from RUNNING or SCHEDULED
      # to COMPLETE to access the full service graph. When CloudWatch log is the destination, this API can
      # support cross-account observability and service graph retrieval across linked accounts. For
      # retrieving graphs from X-Ray directly as opposed to the Transaction-Search Log group, see
      # GetTraceGraph .
      def get_retrieved_traces_graph(
        retrieval_token : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetRetrievedTracesGraphRequest.new(retrieval_token: retrieval_token, next_token: next_token)
        get_retrieved_traces_graph(input)
      end
      def get_retrieved_traces_graph(input : Types::GetRetrievedTracesGraphRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RETRIEVED_TRACES_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all sampling rules.
      def get_sampling_rules(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetSamplingRulesRequest.new(next_token: next_token)
        get_sampling_rules(input)
      end
      def get_sampling_rules(input : Types::GetSamplingRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SAMPLING_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about recent sampling results for all sampling rules.
      def get_sampling_statistic_summaries(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetSamplingStatisticSummariesRequest.new(next_token: next_token)
        get_sampling_statistic_summaries(input)
      end
      def get_sampling_statistic_summaries(input : Types::GetSamplingStatisticSummariesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SAMPLING_STATISTIC_SUMMARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Requests a sampling quota for rules that the service is using to sample requests.
      def get_sampling_targets(
        sampling_statistics_documents : Array(Types::SamplingStatisticsDocument),
        sampling_boost_statistics_documents : Array(Types::SamplingBoostStatisticsDocument)? = nil
      ) : Protocol::Request
        input = Types::GetSamplingTargetsRequest.new(sampling_statistics_documents: sampling_statistics_documents, sampling_boost_statistics_documents: sampling_boost_statistics_documents)
        get_sampling_targets(input)
      end
      def get_sampling_targets(input : Types::GetSamplingTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SAMPLING_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a document that describes services that process incoming requests, and downstream services
      # that they call as a result. Root services process incoming requests and make calls to downstream
      # services. Root services are applications that use the Amazon Web Services X-Ray SDK . Downstream
      # services can be other applications, Amazon Web Services resources, HTTP web APIs, or SQL databases.
      def get_service_graph(
        end_time : Time,
        start_time : Time,
        group_arn : String? = nil,
        group_name : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetServiceGraphRequest.new(end_time: end_time, start_time: start_time, group_arn: group_arn, group_name: group_name, next_token: next_token)
        get_service_graph(input)
      end
      def get_service_graph(input : Types::GetServiceGraphRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get an aggregation of service statistics defined by a specific time range.
      def get_time_series_service_statistics(
        end_time : Time,
        start_time : Time,
        entity_selector_expression : String? = nil,
        forecast_statistics : Bool? = nil,
        group_arn : String? = nil,
        group_name : String? = nil,
        next_token : String? = nil,
        period : Int32? = nil
      ) : Protocol::Request
        input = Types::GetTimeSeriesServiceStatisticsRequest.new(end_time: end_time, start_time: start_time, entity_selector_expression: entity_selector_expression, forecast_statistics: forecast_statistics, group_arn: group_arn, group_name: group_name, next_token: next_token, period: period)
        get_time_series_service_statistics(input)
      end
      def get_time_series_service_statistics(input : Types::GetTimeSeriesServiceStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TIME_SERIES_SERVICE_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a service graph for one or more specific trace IDs.
      def get_trace_graph(
        trace_ids : Array(String),
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetTraceGraphRequest.new(trace_ids: trace_ids, next_token: next_token)
        get_trace_graph(input)
      end
      def get_trace_graph(input : Types::GetTraceGraphRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRACE_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current destination of data sent to PutTraceSegments and OpenTelemetry protocol (OTLP)
      # endpoint. The Transaction Search feature requires a CloudWatchLogs destination. For more
      # information, see Transaction Search and OpenTelemetry .
      def get_trace_segment_destination : Protocol::Request
        input = Types::GetTraceSegmentDestinationRequest.new
        get_trace_segment_destination(input)
      end
      def get_trace_segment_destination(input : Types::GetTraceSegmentDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRACE_SEGMENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves IDs and annotations for traces available for a specified time frame using an optional
      # filter. To get the full traces, pass the trace IDs to BatchGetTraces . A filter expression can
      # target traced requests that hit specific service nodes or edges, have errors, or come from a known
      # user. For example, the following filter expression targets traces that pass through api.example.com
      # : service("api.example.com") This filter expression finds traces that have an annotation named
      # account with the value 12345 : annotation.account = "12345" For a full list of indexed fields and
      # keywords that you can use in filter expressions, see Use filter expressions in the Amazon Web
      # Services X-Ray Developer Guide .
      def get_trace_summaries(
        end_time : Time,
        start_time : Time,
        filter_expression : String? = nil,
        next_token : String? = nil,
        sampling : Bool? = nil,
        sampling_strategy : Types::SamplingStrategy? = nil,
        time_range_type : String? = nil
      ) : Protocol::Request
        input = Types::GetTraceSummariesRequest.new(end_time: end_time, start_time: start_time, filter_expression: filter_expression, next_token: next_token, sampling: sampling, sampling_strategy: sampling_strategy, time_range_type: time_range_type)
        get_trace_summaries(input)
      end
      def get_trace_summaries(input : Types::GetTraceSummariesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRACE_SUMMARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of resource policies in the target Amazon Web Services account.
      def list_resource_policies(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourcePoliciesRequest.new(next_token: next_token)
        list_resource_policies(input)
      end
      def list_resource_policies(input : Types::ListResourcePoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of traces for a given RetrievalToken from the CloudWatch log group generated by
      # Transaction Search. For information on what each trace returns, see BatchGetTraces . This API does
      # not initiate a retrieval process. To start a trace retrieval, use StartTraceRetrieval , which
      # generates the required RetrievalToken . When the RetrievalStatus is not COMPLETE , the API will
      # return an empty response. Retry the request once the retrieval has completed to access the full list
      # of traces. For cross-account observability, this API can retrieve traces from linked accounts when
      # CloudWatch log is set as the destination across relevant accounts. For more details, see CloudWatch
      # cross-account observability . For retrieving data from X-Ray directly as opposed to the Transaction
      # Search generated log group, see BatchGetTraces .
      def list_retrieved_traces(
        retrieval_token : String,
        next_token : String? = nil,
        trace_format : String? = nil
      ) : Protocol::Request
        input = Types::ListRetrievedTracesRequest.new(retrieval_token: retrieval_token, next_token: next_token, trace_format: trace_format)
        list_retrieved_traces(input)
      end
      def list_retrieved_traces(input : Types::ListRetrievedTracesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RETRIEVED_TRACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags that are applied to the specified Amazon Web Services X-Ray group or sampling
      # rule.
      def list_tags_for_resource(
        resource_arn : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, next_token: next_token)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the encryption configuration for X-Ray data.
      def put_encryption_config(
        type : String,
        key_id : String? = nil
      ) : Protocol::Request
        input = Types::PutEncryptionConfigRequest.new(type: type, key_id: key_id)
        put_encryption_config(input)
      end
      def put_encryption_config(input : Types::PutEncryptionConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ENCRYPTION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the resource policy to grant one or more Amazon Web Services services and accounts permissions
      # to access X-Ray. Each resource policy will be associated with a specific Amazon Web Services
      # account. Each Amazon Web Services account can have a maximum of 5 resource policies, and each policy
      # name must be unique within that account. The maximum size of each resource policy is 5KB.
      def put_resource_policy(
        policy_document : String,
        policy_name : String,
        bypass_policy_lockout_check : Bool? = nil,
        policy_revision_id : String? = nil
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(policy_document: policy_document, policy_name: policy_name, bypass_policy_lockout_check: bypass_policy_lockout_check, policy_revision_id: policy_revision_id)
        put_resource_policy(input)
      end
      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used by the Amazon Web Services X-Ray daemon to upload telemetry.
      def put_telemetry_records(
        telemetry_records : Array(Types::TelemetryRecord),
        ec2_instance_id : String? = nil,
        hostname : String? = nil,
        resource_arn : String? = nil
      ) : Protocol::Request
        input = Types::PutTelemetryRecordsRequest.new(telemetry_records: telemetry_records, ec2_instance_id: ec2_instance_id, hostname: hostname, resource_arn: resource_arn)
        put_telemetry_records(input)
      end
      def put_telemetry_records(input : Types::PutTelemetryRecordsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TELEMETRY_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uploads segment documents to Amazon Web Services X-Ray. A segment document can be a completed
      # segment, an in-progress segment, or an array of subsegments. Segments must include the following
      # fields. For the full segment document schema, see Amazon Web Services X-Ray Segment Documents in the
      # Amazon Web Services X-Ray Developer Guide . Required segment document fields name - The name of the
      # service that handled the request. id - A 64-bit identifier for the segment, unique among segments in
      # the same trace, in 16 hexadecimal digits. trace_id - A unique identifier that connects all segments
      # and subsegments originating from a single client request. start_time - Time the segment or
      # subsegment was created, in floating point seconds in epoch time, accurate to milliseconds. For
      # example, 1480615200.010 or 1.480615200010E9 . end_time - Time the segment or subsegment was closed.
      # For example, 1480615200.090 or 1.480615200090E9 . Specify either an end_time or in_progress .
      # in_progress - Set to true instead of specifying an end_time to record that a segment has been
      # started, but is not complete. Send an in-progress segment when your application receives a request
      # that will take a long time to serve, to trace that the request was received. When the response is
      # sent, send the complete segment to overwrite the in-progress segment. A trace_id consists of three
      # numbers separated by hyphens. For example, 1-58406520-a006649127e371903a2de979. For trace IDs
      # created by an X-Ray SDK, or by Amazon Web Services services integrated with X-Ray, a trace ID
      # includes: Trace ID Format The version number, for instance, 1 . The time of the original request, in
      # Unix epoch time, in 8 hexadecimal digits. For example, 10:00AM December 2nd, 2016 PST in epoch time
      # is 1480615200 seconds, or 58406520 in hexadecimal. A 96-bit identifier for the trace, globally
      # unique, in 24 hexadecimal digits. Trace IDs created via OpenTelemetry have a different format based
      # on the W3C Trace Context specification . A W3C trace ID must be formatted in the X-Ray trace ID
      # format when sending to X-Ray. For example, a W3C trace ID 4efaaf4d1e8720b39541901950019ee5 should be
      # formatted as 1-4efaaf4d-1e8720b39541901950019ee5 when sending to X-Ray. While X-Ray trace IDs
      # include the original request timestamp in Unix epoch time, this is not required or validated.
      def put_trace_segments(
        trace_segment_documents : Array(String)
      ) : Protocol::Request
        input = Types::PutTraceSegmentsRequest.new(trace_segment_documents: trace_segment_documents)
        put_trace_segments(input)
      end
      def put_trace_segments(input : Types::PutTraceSegmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TRACE_SEGMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a trace retrieval process using the specified time range and for the given trace IDs in
      # the Transaction Search generated CloudWatch log group. For more information, see Transaction Search
      # . API returns a RetrievalToken , which can be used with ListRetrievedTraces or
      # GetRetrievedTracesGraph to fetch results. Retrievals will time out after 60 minutes. To execute long
      # time ranges, consider segmenting into multiple retrievals. If you are using CloudWatch cross-account
      # observability , you can use this operation in a monitoring account to retrieve data from a linked
      # source account, as long as both accounts have transaction search enabled. For retrieving data from
      # X-Ray directly as opposed to the Transaction-Search Log group, see BatchGetTraces .
      def start_trace_retrieval(
        end_time : Time,
        start_time : Time,
        trace_ids : Array(String)
      ) : Protocol::Request
        input = Types::StartTraceRetrievalRequest.new(end_time: end_time, start_time: start_time, trace_ids: trace_ids)
        start_trace_retrieval(input)
      end
      def start_trace_retrieval(input : Types::StartTraceRetrievalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TRACE_RETRIEVAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies tags to an existing Amazon Web Services X-Ray group or sampling rule.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from an Amazon Web Services X-Ray group or sampling rule. You cannot edit or delete
      # system tags (those with an aws: prefix).
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a group resource.
      def update_group(
        filter_expression : String? = nil,
        group_arn : String? = nil,
        group_name : String? = nil,
        insights_configuration : Types::InsightsConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateGroupRequest.new(filter_expression: filter_expression, group_arn: group_arn, group_name: group_name, insights_configuration: insights_configuration)
        update_group(input)
      end
      def update_group(input : Types::UpdateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies an indexing rule’s configuration. Indexing rules are used for determining the sampling rate
      # for spans indexed from CloudWatch Logs. For more information, see Transaction Search .
      def update_indexing_rule(
        name : String,
        rule : Types::IndexingRuleValueUpdate
      ) : Protocol::Request
        input = Types::UpdateIndexingRuleRequest.new(name: name, rule: rule)
        update_indexing_rule(input)
      end
      def update_indexing_rule(input : Types::UpdateIndexingRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INDEXING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies a sampling rule's configuration.
      def update_sampling_rule(
        sampling_rule_update : Types::SamplingRuleUpdate
      ) : Protocol::Request
        input = Types::UpdateSamplingRuleRequest.new(sampling_rule_update: sampling_rule_update)
        update_sampling_rule(input)
      end
      def update_sampling_rule(input : Types::UpdateSamplingRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SAMPLING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the destination of data sent to PutTraceSegments . The Transaction Search feature requires
      # the CloudWatchLogs destination. For more information, see Transaction Search .
      def update_trace_segment_destination(
        destination : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTraceSegmentDestinationRequest.new(destination: destination)
        update_trace_segment_destination(input)
      end
      def update_trace_segment_destination(input : Types::UpdateTraceSegmentDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TRACE_SEGMENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
