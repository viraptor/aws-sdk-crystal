module AwsSdk
  module DevOpsGuru
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

      # Adds a notification channel to DevOps Guru. A notification channel is used to notify you about
      # important DevOps Guru events, such as when an insight is generated. If you use an Amazon SNS topic
      # in another account, you must attach a policy to it that grants DevOps Guru permission to send it
      # notifications. DevOps Guru adds the required policy on your behalf to send notifications using
      # Amazon SNS in your account. DevOps Guru only supports standard SNS topics. For more information, see
      # Permissions for Amazon SNS topics . If you use an Amazon SNS topic that is encrypted by an Amazon
      # Web Services Key Management Service customer-managed key (CMK), then you must add permissions to the
      # CMK. For more information, see Permissions for Amazon Web Services KMS–encrypted Amazon SNS topics .

      def add_notification_channel(
        config : Types::NotificationChannelConfig
      ) : Protocol::Request
        input = Types::AddNotificationChannelRequest.new(config: config)
        add_notification_channel(input)
      end

      def add_notification_channel(input : Types::AddNotificationChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_NOTIFICATION_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the insight along with the associated anomalies, events and recommendations.

      def delete_insight(
        id : String
      ) : Protocol::Request
        input = Types::DeleteInsightRequest.new(id: id)
        delete_insight(input)
      end

      def delete_insight(input : Types::DeleteInsightRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INSIGHT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the number of open reactive insights, the number of open proactive insights, and the number
      # of metrics analyzed in your Amazon Web Services account. Use these numbers to gauge the health of
      # operations in your Amazon Web Services account.

      def describe_account_health : Protocol::Request
        input = Types::DescribeAccountHealthRequest.new
        describe_account_health(input)
      end

      def describe_account_health(input : Types::DescribeAccountHealthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCOUNT_HEALTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # For the time range passed in, returns the number of open reactive insight that were created, the
      # number of open proactive insights that were created, and the Mean Time to Recover (MTTR) for all
      # closed reactive insights.

      def describe_account_overview(
        from_time : Time,
        to_time : Time? = nil
      ) : Protocol::Request
        input = Types::DescribeAccountOverviewRequest.new(from_time: from_time, to_time: to_time)
        describe_account_overview(input)
      end

      def describe_account_overview(input : Types::DescribeAccountOverviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCOUNT_OVERVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about an anomaly that you specify using its ID.

      def describe_anomaly(
        id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeAnomalyRequest.new(id: id, account_id: account_id)
        describe_anomaly(input)
      end

      def describe_anomaly(input : Types::DescribeAnomalyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ANOMALY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the integration status of services that are integrated with DevOps Guru as Consumer via
      # EventBridge. The one service that can be integrated with DevOps Guru is Amazon CodeGuru Profiler,
      # which can produce proactive recommendations which can be stored and viewed in DevOps Guru.

      def describe_event_sources_config : Protocol::Request
        input = Types::DescribeEventSourcesConfigRequest.new
        describe_event_sources_config(input)
      end

      def describe_event_sources_config(input : Types::DescribeEventSourcesConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EVENT_SOURCES_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the most recent feedback submitted in the current Amazon Web Services account and Region.

      def describe_feedback(
        insight_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeFeedbackRequest.new(insight_id: insight_id)
        describe_feedback(input)
      end

      def describe_feedback(input : Types::DescribeFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about an insight that you specify using its ID.

      def describe_insight(
        id : String,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeInsightRequest.new(id: id, account_id: account_id)
        describe_insight(input)
      end

      def describe_insight(input : Types::DescribeInsightRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INSIGHT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns active insights, predictive insights, and resource hours analyzed in last hour.

      def describe_organization_health(
        account_ids : Array(String)? = nil,
        organizational_unit_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DescribeOrganizationHealthRequest.new(account_ids: account_ids, organizational_unit_ids: organizational_unit_ids)
        describe_organization_health(input)
      end

      def describe_organization_health(input : Types::DescribeOrganizationHealthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ORGANIZATION_HEALTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an overview of your organization's history based on the specified time range. The overview
      # includes the total reactive and proactive insights.

      def describe_organization_overview(
        from_time : Time,
        account_ids : Array(String)? = nil,
        organizational_unit_ids : Array(String)? = nil,
        to_time : Time? = nil
      ) : Protocol::Request
        input = Types::DescribeOrganizationOverviewRequest.new(from_time: from_time, account_ids: account_ids, organizational_unit_ids: organizational_unit_ids, to_time: to_time)
        describe_organization_overview(input)
      end

      def describe_organization_overview(input : Types::DescribeOrganizationOverviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ORGANIZATION_OVERVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides an overview of your system's health. If additional member accounts are part of your
      # organization, you can filter those accounts using the AccountIds field.

      def describe_organization_resource_collection_health(
        organization_resource_collection_type : String,
        account_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        organizational_unit_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DescribeOrganizationResourceCollectionHealthRequest.new(organization_resource_collection_type: organization_resource_collection_type, account_ids: account_ids, max_results: max_results, next_token: next_token, organizational_unit_ids: organizational_unit_ids)
        describe_organization_resource_collection_health(input)
      end

      def describe_organization_resource_collection_health(input : Types::DescribeOrganizationResourceCollectionHealthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ORGANIZATION_RESOURCE_COLLECTION_HEALTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the number of open proactive insights, open reactive insights, and the Mean Time to Recover
      # (MTTR) for all closed insights in resource collections in your account. You specify the type of
      # Amazon Web Services resources collection. The two types of Amazon Web Services resource collections
      # supported are Amazon Web Services CloudFormation stacks and Amazon Web Services resources that
      # contain the same Amazon Web Services tag. DevOps Guru can be configured to analyze the Amazon Web
      # Services resources that are defined in the stacks or that are tagged using the same tag key . You
      # can specify up to 500 Amazon Web Services CloudFormation stacks.

      def describe_resource_collection_health(
        resource_collection_type : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeResourceCollectionHealthRequest.new(resource_collection_type: resource_collection_type, next_token: next_token)
        describe_resource_collection_health(input)
      end

      def describe_resource_collection_health(input : Types::DescribeResourceCollectionHealthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESOURCE_COLLECTION_HEALTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the integration status of services that are integrated with DevOps Guru. The one service
      # that can be integrated with DevOps Guru is Amazon Web Services Systems Manager, which can be used to
      # create an OpsItem for each generated insight.

      def describe_service_integration : Protocol::Request
        input = Types::DescribeServiceIntegrationRequest.new
        describe_service_integration(input)
      end

      def describe_service_integration(input : Types::DescribeServiceIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SERVICE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an estimate of the monthly cost for DevOps Guru to analyze your Amazon Web Services
      # resources. For more information, see Estimate your Amazon DevOps Guru costs and Amazon DevOps Guru
      # pricing .

      def get_cost_estimation(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetCostEstimationRequest.new(next_token: next_token)
        get_cost_estimation(input)
      end

      def get_cost_estimation(input : Types::GetCostEstimationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COST_ESTIMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns lists Amazon Web Services resources that are of the specified resource collection type. The
      # two types of Amazon Web Services resource collections supported are Amazon Web Services
      # CloudFormation stacks and Amazon Web Services resources that contain the same Amazon Web Services
      # tag. DevOps Guru can be configured to analyze the Amazon Web Services resources that are defined in
      # the stacks or that are tagged using the same tag key . You can specify up to 500 Amazon Web Services
      # CloudFormation stacks.

      def get_resource_collection(
        resource_collection_type : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetResourceCollectionRequest.new(resource_collection_type: resource_collection_type, next_token: next_token)
        get_resource_collection(input)
      end

      def get_resource_collection(input : Types::GetResourceCollectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_COLLECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the anomalies that belong to an insight that you specify using its ID.

      def list_anomalies_for_insight(
        insight_id : String,
        account_id : String? = nil,
        filters : Types::ListAnomaliesForInsightFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time_range : Types::StartTimeRange? = nil
      ) : Protocol::Request
        input = Types::ListAnomaliesForInsightRequest.new(insight_id: insight_id, account_id: account_id, filters: filters, max_results: max_results, next_token: next_token, start_time_range: start_time_range)
        list_anomalies_for_insight(input)
      end

      def list_anomalies_for_insight(input : Types::ListAnomaliesForInsightRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANOMALIES_FOR_INSIGHT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of log groups that contain log anomalies.

      def list_anomalous_log_groups(
        insight_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAnomalousLogGroupsRequest.new(insight_id: insight_id, max_results: max_results, next_token: next_token)
        list_anomalous_log_groups(input)
      end

      def list_anomalous_log_groups(input : Types::ListAnomalousLogGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANOMALOUS_LOG_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the events emitted by the resources that are evaluated by DevOps Guru. You can use
      # filters to specify which events are returned.

      def list_events(
        filters : Types::ListEventsFilters,
        account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventsRequest.new(filters: filters, account_id: account_id, max_results: max_results, next_token: next_token)
        list_events(input)
      end

      def list_events(input : Types::ListEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of insights in your Amazon Web Services account. You can specify which insights are
      # returned by their start time and status ( ONGOING , CLOSED , or ANY ).

      def list_insights(
        status_filter : Types::ListInsightsStatusFilter,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInsightsRequest.new(status_filter: status_filter, max_results: max_results, next_token: next_token)
        list_insights(input)
      end

      def list_insights(input : Types::ListInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of all log groups that are being monitored and tagged by DevOps Guru.

      def list_monitored_resources(
        filters : Types::ListMonitoredResourcesFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMonitoredResourcesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_monitored_resources(input)
      end

      def list_monitored_resources(input : Types::ListMonitoredResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MONITORED_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of notification channels configured for DevOps Guru. Each notification channel is
      # used to notify you when DevOps Guru generates an insight that contains information about how to
      # improve your operations. The one supported notification channel is Amazon Simple Notification
      # Service (Amazon SNS).

      def list_notification_channels(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNotificationChannelsRequest.new(next_token: next_token)
        list_notification_channels(input)
      end

      def list_notification_channels(input : Types::ListNotificationChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NOTIFICATION_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of insights associated with the account or OU Id.

      def list_organization_insights(
        status_filter : Types::ListInsightsStatusFilter,
        account_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        organizational_unit_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListOrganizationInsightsRequest.new(status_filter: status_filter, account_ids: account_ids, max_results: max_results, next_token: next_token, organizational_unit_ids: organizational_unit_ids)
        list_organization_insights(input)
      end

      def list_organization_insights(input : Types::ListOrganizationInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORGANIZATION_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of a specified insight's recommendations. Each recommendation includes a list of
      # related metrics and a list of related events.

      def list_recommendations(
        insight_id : String,
        account_id : String? = nil,
        locale : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecommendationsRequest.new(insight_id: insight_id, account_id: account_id, locale: locale, next_token: next_token)
        list_recommendations(input)
      end

      def list_recommendations(input : Types::ListRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Collects customer feedback about the specified insight.

      def put_feedback(
        insight_feedback : Types::InsightFeedback? = nil
      ) : Protocol::Request
        input = Types::PutFeedbackRequest.new(insight_feedback: insight_feedback)
        put_feedback(input)
      end

      def put_feedback(input : Types::PutFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a notification channel from DevOps Guru. A notification channel is used to notify you when
      # DevOps Guru generates an insight that contains information about how to improve your operations.

      def remove_notification_channel(
        id : String
      ) : Protocol::Request
        input = Types::RemoveNotificationChannelRequest.new(id: id)
        remove_notification_channel(input)
      end

      def remove_notification_channel(input : Types::RemoveNotificationChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_NOTIFICATION_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of insights in your Amazon Web Services account. You can specify which insights are
      # returned by their start time, one or more statuses ( ONGOING or CLOSED ), one or more severities (
      # LOW , MEDIUM , and HIGH ), and type ( REACTIVE or PROACTIVE ). Use the Filters parameter to specify
      # status and severity search parameters. Use the Type parameter to specify REACTIVE or PROACTIVE in
      # your search.

      def search_insights(
        start_time_range : Types::StartTimeRange,
        type : String,
        filters : Types::SearchInsightsFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchInsightsRequest.new(start_time_range: start_time_range, type: type, filters: filters, max_results: max_results, next_token: next_token)
        search_insights(input)
      end

      def search_insights(input : Types::SearchInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of insights in your organization. You can specify which insights are returned by
      # their start time, one or more statuses ( ONGOING , CLOSED , and CLOSED ), one or more severities (
      # LOW , MEDIUM , and HIGH ), and type ( REACTIVE or PROACTIVE ). Use the Filters parameter to specify
      # status and severity search parameters. Use the Type parameter to specify REACTIVE or PROACTIVE in
      # your search.

      def search_organization_insights(
        account_ids : Array(String),
        start_time_range : Types::StartTimeRange,
        type : String,
        filters : Types::SearchOrganizationInsightsFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchOrganizationInsightsRequest.new(account_ids: account_ids, start_time_range: start_time_range, type: type, filters: filters, max_results: max_results, next_token: next_token)
        search_organization_insights(input)
      end

      def search_organization_insights(input : Types::SearchOrganizationInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_ORGANIZATION_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the creation of an estimate of the monthly cost to analyze your Amazon Web Services
      # resources.

      def start_cost_estimation(
        resource_collection : Types::CostEstimationResourceCollectionFilter,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartCostEstimationRequest.new(resource_collection: resource_collection, client_token: client_token)
        start_cost_estimation(input)
      end

      def start_cost_estimation(input : Types::StartCostEstimationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_COST_ESTIMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables or disables integration with a service that can be integrated with DevOps Guru. The one
      # service that can be integrated with DevOps Guru is Amazon CodeGuru Profiler, which can produce
      # proactive recommendations which can be stored and viewed in DevOps Guru.

      def update_event_sources_config(
        event_sources : Types::EventSourcesConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateEventSourcesConfigRequest.new(event_sources: event_sources)
        update_event_sources_config(input)
      end

      def update_event_sources_config(input : Types::UpdateEventSourcesConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_SOURCES_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the collection of resources that DevOps Guru analyzes. The two types of Amazon Web Services
      # resource collections supported are Amazon Web Services CloudFormation stacks and Amazon Web Services
      # resources that contain the same Amazon Web Services tag. DevOps Guru can be configured to analyze
      # the Amazon Web Services resources that are defined in the stacks or that are tagged using the same
      # tag key . You can specify up to 500 Amazon Web Services CloudFormation stacks. This method also
      # creates the IAM role required for you to use DevOps Guru.

      def update_resource_collection(
        action : String,
        resource_collection : Types::UpdateResourceCollectionFilter
      ) : Protocol::Request
        input = Types::UpdateResourceCollectionRequest.new(action: action, resource_collection: resource_collection)
        update_resource_collection(input)
      end

      def update_resource_collection(input : Types::UpdateResourceCollectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_COLLECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables or disables integration with a service that can be integrated with DevOps Guru. The one
      # service that can be integrated with DevOps Guru is Amazon Web Services Systems Manager, which can be
      # used to create an OpsItem for each generated insight.

      def update_service_integration(
        service_integration : Types::UpdateServiceIntegrationConfig
      ) : Protocol::Request
        input = Types::UpdateServiceIntegrationRequest.new(service_integration: service_integration)
        update_service_integration(input)
      end

      def update_service_integration(input : Types::UpdateServiceIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SERVICE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
