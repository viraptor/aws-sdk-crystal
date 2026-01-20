module AwsSdk
  module CodeGuruProfiler
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

      # Add up to 2 anomaly notifications channels for a profiling group.

      def add_notification_channels(
        channels : Array(Types::Channel),
        profiling_group_name : String
      ) : Protocol::Request
        input = Types::AddNotificationChannelsRequest.new(channels: channels, profiling_group_name: profiling_group_name)
        add_notification_channels(input)
      end

      def add_notification_channels(input : Types::AddNotificationChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_NOTIFICATION_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the time series of values for a requested list of frame metrics from a time period.

      def batch_get_frame_metric_data(
        profiling_group_name : String,
        end_time : Time? = nil,
        frame_metrics : Array(Types::FrameMetric)? = nil,
        period : String? = nil,
        start_time : Time? = nil,
        target_resolution : String? = nil
      ) : Protocol::Request
        input = Types::BatchGetFrameMetricDataRequest.new(profiling_group_name: profiling_group_name, end_time: end_time, frame_metrics: frame_metrics, period: period, start_time: start_time, target_resolution: target_resolution)
        batch_get_frame_metric_data(input)
      end

      def batch_get_frame_metric_data(input : Types::BatchGetFrameMetricDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_FRAME_METRIC_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used by profiler agents to report their current state and to receive remote configuration updates.
      # For example, ConfigureAgent can be used to tell an agent whether to profile or not and for how long
      # to return profiling data.

      def configure_agent(
        profiling_group_name : String,
        fleet_instance_id : String? = nil,
        metadata : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ConfigureAgentRequest.new(profiling_group_name: profiling_group_name, fleet_instance_id: fleet_instance_id, metadata: metadata)
        configure_agent(input)
      end

      def configure_agent(input : Types::ConfigureAgentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CONFIGURE_AGENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a profiling group.

      def create_profiling_group(
        client_token : String,
        profiling_group_name : String,
        agent_orchestration_config : Types::AgentOrchestrationConfig? = nil,
        compute_platform : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateProfilingGroupRequest.new(client_token: client_token, profiling_group_name: profiling_group_name, agent_orchestration_config: agent_orchestration_config, compute_platform: compute_platform, tags: tags)
        create_profiling_group(input)
      end

      def create_profiling_group(input : Types::CreateProfilingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROFILING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a profiling group.

      def delete_profiling_group(
        profiling_group_name : String
      ) : Protocol::Request
        input = Types::DeleteProfilingGroupRequest.new(profiling_group_name: profiling_group_name)
        delete_profiling_group(input)
      end

      def delete_profiling_group(input : Types::DeleteProfilingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROFILING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a ProfilingGroupDescription object that contains information about the requested profiling
      # group.

      def describe_profiling_group(
        profiling_group_name : String
      ) : Protocol::Request
        input = Types::DescribeProfilingGroupRequest.new(profiling_group_name: profiling_group_name)
        describe_profiling_group(input)
      end

      def describe_profiling_group(input : Types::DescribeProfilingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PROFILING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of FindingsReportSummary objects that contain analysis results for all profiling
      # groups in your AWS account.

      def get_findings_report_account_summary(
        daily_reports_only : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetFindingsReportAccountSummaryRequest.new(daily_reports_only: daily_reports_only, max_results: max_results, next_token: next_token)
        get_findings_report_account_summary(input)
      end

      def get_findings_report_account_summary(input : Types::GetFindingsReportAccountSummaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS_REPORT_ACCOUNT_SUMMARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the current configuration for anomaly notifications for a profiling group.

      def get_notification_configuration(
        profiling_group_name : String
      ) : Protocol::Request
        input = Types::GetNotificationConfigurationRequest.new(profiling_group_name: profiling_group_name)
        get_notification_configuration(input)
      end

      def get_notification_configuration(input : Types::GetNotificationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_NOTIFICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the JSON-formatted resource-based policy on a profiling group.

      def get_policy(
        profiling_group_name : String
      ) : Protocol::Request
        input = Types::GetPolicyRequest.new(profiling_group_name: profiling_group_name)
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the aggregated profile of a profiling group for a specified time range. Amazon CodeGuru
      # Profiler collects posted agent profiles for a profiling group into aggregated profiles. &lt;note&gt;
      # &lt;p&gt; Because aggregated profiles expire over time &lt;code&gt;GetProfile&lt;/code&gt; is not
      # idempotent. &lt;/p&gt; &lt;/note&gt; &lt;p&gt; Specify the time range for the requested aggregated
      # profile using 1 or 2 of the following parameters: &lt;code&gt;startTime&lt;/code&gt;,
      # &lt;code&gt;endTime&lt;/code&gt;, &lt;code&gt;period&lt;/code&gt;. The maximum time range allowed is
      # 7 days. If you specify all 3 parameters, an exception is thrown. If you specify only
      # &lt;code&gt;period&lt;/code&gt;, the latest aggregated profile is returned. &lt;/p&gt; &lt;p&gt;
      # Aggregated profiles are available with aggregation periods of 5 minutes, 1 hour, and 1 day, aligned
      # to UTC. The aggregation period of an aggregated profile determines how long it is retained. For more
      # information, see &lt;a
      # href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AggregatedProfileTime.html&quot;&gt;
      # &lt;code&gt;AggregatedProfileTime&lt;/code&gt; &lt;/a&gt;. The aggregated profile's aggregation
      # period determines how long it is retained by CodeGuru Profiler. &lt;/p&gt; &lt;ul&gt; &lt;li&gt;
      # &lt;p&gt; If the aggregation period is 5 minutes, the aggregated profile is retained for 15 days.
      # &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If the aggregation period is 1 hour, the aggregated
      # profile is retained for 60 days. &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If the aggregation
      # period is 1 day, the aggregated profile is retained for 3 years. &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt;
      # &lt;p&gt;There are two use cases for calling &lt;code&gt;GetProfile&lt;/code&gt;.&lt;/p&gt;
      # &lt;ol&gt; &lt;li&gt; &lt;p&gt; If you want to return an aggregated profile that already exists, use
      # &lt;a
      # href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ListProfileTimes.html&quot;&gt;
      # &lt;code&gt;ListProfileTimes&lt;/code&gt; &lt;/a&gt; to view the time ranges of existing aggregated
      # profiles. Use them in a &lt;code&gt;GetProfile&lt;/code&gt; request to return a specific, existing
      # aggregated profile. &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If you want to return an aggregated
      # profile for a time range that doesn't align with an existing aggregated profile, then CodeGuru
      # Profiler makes a best effort to combine existing aggregated profiles from the requested time range
      # and return them as one aggregated profile. &lt;/p&gt; &lt;p&gt; If aggregated profiles do not exist
      # for the full time range requested, then aggregated profiles for a smaller time range are returned.
      # For example, if the requested time range is from 00:00 to 00:20, and the existing aggregated
      # profiles are from 00:15 and 00:25, then the aggregated profiles from 00:15 to 00:20 are returned.
      # &lt;/p&gt; &lt;/li&gt; &lt;/ol&gt;

      def get_profile(
        profiling_group_name : String,
        accept : String? = nil,
        end_time : Time? = nil,
        max_depth : Int32? = nil,
        period : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::GetProfileRequest.new(profiling_group_name: profiling_group_name, accept: accept, end_time: end_time, max_depth: max_depth, period: period, start_time: start_time)
        get_profile(input)
      end

      def get_profile(input : Types::GetProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Recommendation objects that contain recommendations for a profiling group for a
      # given time period. A list of Anomaly objects that contains details about anomalies detected in the
      # profiling group for the same time period is also returned.

      def get_recommendations(
        end_time : Time,
        profiling_group_name : String,
        start_time : Time,
        locale : String? = nil
      ) : Protocol::Request
        input = Types::GetRecommendationsRequest.new(end_time: end_time, profiling_group_name: profiling_group_name, start_time: start_time, locale: locale)
        get_recommendations(input)
      end

      def get_recommendations(input : Types::GetRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the available reports for a given profiling group and time range.

      def list_findings_reports(
        end_time : Time,
        profiling_group_name : String,
        start_time : Time,
        daily_reports_only : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFindingsReportsRequest.new(end_time: end_time, profiling_group_name: profiling_group_name, start_time: start_time, daily_reports_only: daily_reports_only, max_results: max_results, next_token: next_token)
        list_findings_reports(input)
      end

      def list_findings_reports(input : Types::ListFindingsReportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FINDINGS_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the start times of the available aggregated profiles of a profiling group for an aggregation
      # period within the specified time range.

      def list_profile_times(
        end_time : Time,
        period : String,
        profiling_group_name : String,
        start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order_by : String? = nil
      ) : Protocol::Request
        input = Types::ListProfileTimesRequest.new(end_time: end_time, period: period, profiling_group_name: profiling_group_name, start_time: start_time, max_results: max_results, next_token: next_token, order_by: order_by)
        list_profile_times(input)
      end

      def list_profile_times(input : Types::ListProfileTimesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_TIMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of profiling groups. The profiling groups are returned as ProfilingGroupDescription
      # objects.

      def list_profiling_groups(
        include_description : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProfilingGroupsRequest.new(include_description: include_description, max_results: max_results, next_token: next_token)
        list_profiling_groups(input)
      end

      def list_profiling_groups(input : Types::ListProfilingGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILING_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the tags that are assigned to a specified resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Submits profiling data to an aggregated profile of a profiling group. To get an aggregated profile
      # that is created with this profiling data, use GetProfile .

      def post_agent_profile(
        agent_profile : Bytes,
        content_type : String,
        profiling_group_name : String,
        profile_token : String? = nil
      ) : Protocol::Request
        input = Types::PostAgentProfileRequest.new(agent_profile: agent_profile, content_type: content_type, profiling_group_name: profiling_group_name, profile_token: profile_token)
        post_agent_profile(input)
      end

      def post_agent_profile(input : Types::PostAgentProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::POST_AGENT_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds permissions to a profiling group's resource-based policy that are provided using an action
      # group. If a profiling group doesn't have a resource-based policy, one is created for it using the
      # permissions in the action group and the roles and users in the principals parameter. &lt;p&gt; The
      # one supported action group that can be added is &lt;code&gt;agentPermission&lt;/code&gt; which
      # grants &lt;code&gt;ConfigureAgent&lt;/code&gt; and &lt;code&gt;PostAgent&lt;/code&gt; permissions.
      # For more information, see &lt;a
      # href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-ug/resource-based-policies.html&quot;&gt;Resource-based
      # policies in CodeGuru Profiler&lt;/a&gt; in the &lt;i&gt;Amazon CodeGuru Profiler User
      # Guide&lt;/i&gt;, &lt;a
      # href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html&quot;&gt;
      # &lt;code&gt;ConfigureAgent&lt;/code&gt; &lt;/a&gt;, and &lt;a
      # href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_PostAgentProfile.html&quot;&gt;
      # &lt;code&gt;PostAgentProfile&lt;/code&gt; &lt;/a&gt;. &lt;/p&gt; &lt;p&gt; The first time you call
      # &lt;code&gt;PutPermission&lt;/code&gt; on a profiling group, do not specify a
      # &lt;code&gt;revisionId&lt;/code&gt; because it doesn't have a resource-based policy. Subsequent
      # calls must provide a &lt;code&gt;revisionId&lt;/code&gt; to specify which revision of the
      # resource-based policy to add the permissions to. &lt;/p&gt; &lt;p&gt; The response contains the
      # profiling group's JSON-formatted resource policy. &lt;/p&gt;

      def put_permission(
        action_group : String,
        principals : Array(String),
        profiling_group_name : String,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::PutPermissionRequest.new(action_group: action_group, principals: principals, profiling_group_name: profiling_group_name, revision_id: revision_id)
        put_permission(input)
      end

      def put_permission(input : Types::PutPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove one anomaly notifications channel for a profiling group.

      def remove_notification_channel(
        channel_id : String,
        profiling_group_name : String
      ) : Protocol::Request
        input = Types::RemoveNotificationChannelRequest.new(channel_id: channel_id, profiling_group_name: profiling_group_name)
        remove_notification_channel(input)
      end

      def remove_notification_channel(input : Types::RemoveNotificationChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_NOTIFICATION_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes permissions from a profiling group's resource-based policy that are provided using an action
      # group. The one supported action group that can be removed is agentPermission which grants
      # ConfigureAgent and PostAgent permissions. For more information, see Resource-based policies in
      # CodeGuru Profiler in the Amazon CodeGuru Profiler User Guide , ConfigureAgent , and PostAgentProfile
      # .

      def remove_permission(
        action_group : String,
        profiling_group_name : String,
        revision_id : String
      ) : Protocol::Request
        input = Types::RemovePermissionRequest.new(action_group: action_group, profiling_group_name: profiling_group_name, revision_id: revision_id)
        remove_permission(input)
      end

      def remove_permission(input : Types::RemovePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends feedback to CodeGuru Profiler about whether the anomaly detected by the analysis is useful or
      # not.

      def submit_feedback(
        anomaly_instance_id : String,
        profiling_group_name : String,
        type : String,
        comment : String? = nil
      ) : Protocol::Request
        input = Types::SubmitFeedbackRequest.new(anomaly_instance_id: anomaly_instance_id, profiling_group_name: profiling_group_name, type: type, comment: comment)
        submit_feedback(input)
      end

      def submit_feedback(input : Types::SubmitFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SUBMIT_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use to assign one or more tags to a resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use to remove one or more tags from a resource.

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

      # Updates a profiling group.

      def update_profiling_group(
        agent_orchestration_config : Types::AgentOrchestrationConfig,
        profiling_group_name : String
      ) : Protocol::Request
        input = Types::UpdateProfilingGroupRequest.new(agent_orchestration_config: agent_orchestration_config, profiling_group_name: profiling_group_name)
        update_profiling_group(input)
      end

      def update_profiling_group(input : Types::UpdateProfilingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROFILING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
