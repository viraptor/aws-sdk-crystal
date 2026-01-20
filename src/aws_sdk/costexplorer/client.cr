module AwsSdk
  module CostExplorer
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a new cost anomaly detection monitor with the requested type and monitor specification.

      def create_anomaly_monitor(
        anomaly_monitor : Types::AnomalyMonitor,
        resource_tags : Array(Types::ResourceTag)? = nil
      ) : Types::CreateAnomalyMonitorResponse

        input = Types::CreateAnomalyMonitorRequest.new(anomaly_monitor: anomaly_monitor, resource_tags: resource_tags)
        create_anomaly_monitor(input)
      end

      def create_anomaly_monitor(input : Types::CreateAnomalyMonitorRequest) : Types::CreateAnomalyMonitorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ANOMALY_MONITOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAnomalyMonitorResponse, "CreateAnomalyMonitor")
      end

      # Adds an alert subscription to a cost anomaly detection monitor. You can use each subscription to
      # define subscribers with email or SNS notifications. Email subscribers can set an absolute or
      # percentage threshold and a time frequency for receiving notifications.

      def create_anomaly_subscription(
        anomaly_subscription : Types::AnomalySubscription,
        resource_tags : Array(Types::ResourceTag)? = nil
      ) : Types::CreateAnomalySubscriptionResponse

        input = Types::CreateAnomalySubscriptionRequest.new(anomaly_subscription: anomaly_subscription, resource_tags: resource_tags)
        create_anomaly_subscription(input)
      end

      def create_anomaly_subscription(input : Types::CreateAnomalySubscriptionRequest) : Types::CreateAnomalySubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ANOMALY_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAnomalySubscriptionResponse, "CreateAnomalySubscription")
      end

      # Creates a new cost category with the requested name and rules.

      def create_cost_category_definition(
        name : String,
        rule_version : String,
        rules : Array(Types::CostCategoryRule),
        default_value : String? = nil,
        effective_start : String? = nil,
        resource_tags : Array(Types::ResourceTag)? = nil,
        split_charge_rules : Array(Types::CostCategorySplitChargeRule)? = nil
      ) : Types::CreateCostCategoryDefinitionResponse

        input = Types::CreateCostCategoryDefinitionRequest.new(name: name, rule_version: rule_version, rules: rules, default_value: default_value, effective_start: effective_start, resource_tags: resource_tags, split_charge_rules: split_charge_rules)
        create_cost_category_definition(input)
      end

      def create_cost_category_definition(input : Types::CreateCostCategoryDefinitionRequest) : Types::CreateCostCategoryDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_COST_CATEGORY_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCostCategoryDefinitionResponse, "CreateCostCategoryDefinition")
      end

      # Deletes a cost anomaly monitor.

      def delete_anomaly_monitor(
        monitor_arn : String
      ) : Types::DeleteAnomalyMonitorResponse

        input = Types::DeleteAnomalyMonitorRequest.new(monitor_arn: monitor_arn)
        delete_anomaly_monitor(input)
      end

      def delete_anomaly_monitor(input : Types::DeleteAnomalyMonitorRequest) : Types::DeleteAnomalyMonitorResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ANOMALY_MONITOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAnomalyMonitorResponse, "DeleteAnomalyMonitor")
      end

      # Deletes a cost anomaly subscription.

      def delete_anomaly_subscription(
        subscription_arn : String
      ) : Types::DeleteAnomalySubscriptionResponse

        input = Types::DeleteAnomalySubscriptionRequest.new(subscription_arn: subscription_arn)
        delete_anomaly_subscription(input)
      end

      def delete_anomaly_subscription(input : Types::DeleteAnomalySubscriptionRequest) : Types::DeleteAnomalySubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ANOMALY_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAnomalySubscriptionResponse, "DeleteAnomalySubscription")
      end

      # Deletes a cost category. Expenses from this month going forward will no longer be categorized with
      # this cost category.

      def delete_cost_category_definition(
        cost_category_arn : String
      ) : Types::DeleteCostCategoryDefinitionResponse

        input = Types::DeleteCostCategoryDefinitionRequest.new(cost_category_arn: cost_category_arn)
        delete_cost_category_definition(input)
      end

      def delete_cost_category_definition(input : Types::DeleteCostCategoryDefinitionRequest) : Types::DeleteCostCategoryDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_COST_CATEGORY_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCostCategoryDefinitionResponse, "DeleteCostCategoryDefinition")
      end

      # Returns the name, Amazon Resource Name (ARN), rules, definition, and effective dates of a cost
      # category that's defined in the account. You have the option to use EffectiveOn to return a cost
      # category that's active on a specific date. If there's no EffectiveOn specified, you see a Cost
      # Category that's effective on the current date. If cost category is still effective, EffectiveEnd is
      # omitted in the response.

      def describe_cost_category_definition(
        cost_category_arn : String,
        effective_on : String? = nil
      ) : Types::DescribeCostCategoryDefinitionResponse

        input = Types::DescribeCostCategoryDefinitionRequest.new(cost_category_arn: cost_category_arn, effective_on: effective_on)
        describe_cost_category_definition(input)
      end

      def describe_cost_category_definition(input : Types::DescribeCostCategoryDefinitionRequest) : Types::DescribeCostCategoryDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COST_CATEGORY_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCostCategoryDefinitionResponse, "DescribeCostCategoryDefinition")
      end

      # Retrieves all of the cost anomalies detected on your account during the time period that's specified
      # by the DateInterval object. Anomalies are available for up to 90 days.

      def get_anomalies(
        date_interval : Types::AnomalyDateInterval,
        feedback : String? = nil,
        max_results : Int32? = nil,
        monitor_arn : String? = nil,
        next_page_token : String? = nil,
        total_impact : Types::TotalImpactFilter? = nil
      ) : Types::GetAnomaliesResponse

        input = Types::GetAnomaliesRequest.new(date_interval: date_interval, feedback: feedback, max_results: max_results, monitor_arn: monitor_arn, next_page_token: next_page_token, total_impact: total_impact)
        get_anomalies(input)
      end

      def get_anomalies(input : Types::GetAnomaliesRequest) : Types::GetAnomaliesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ANOMALIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAnomaliesResponse, "GetAnomalies")
      end

      # Retrieves the cost anomaly monitor definitions for your account. You can filter using a list of cost
      # anomaly monitor Amazon Resource Names (ARNs).

      def get_anomaly_monitors(
        max_results : Int32? = nil,
        monitor_arn_list : Array(String)? = nil,
        next_page_token : String? = nil
      ) : Types::GetAnomalyMonitorsResponse

        input = Types::GetAnomalyMonitorsRequest.new(max_results: max_results, monitor_arn_list: monitor_arn_list, next_page_token: next_page_token)
        get_anomaly_monitors(input)
      end

      def get_anomaly_monitors(input : Types::GetAnomalyMonitorsRequest) : Types::GetAnomalyMonitorsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ANOMALY_MONITORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAnomalyMonitorsResponse, "GetAnomalyMonitors")
      end

      # Retrieves the cost anomaly subscription objects for your account. You can filter using a list of
      # cost anomaly monitor Amazon Resource Names (ARNs).

      def get_anomaly_subscriptions(
        max_results : Int32? = nil,
        monitor_arn : String? = nil,
        next_page_token : String? = nil,
        subscription_arn_list : Array(String)? = nil
      ) : Types::GetAnomalySubscriptionsResponse

        input = Types::GetAnomalySubscriptionsRequest.new(max_results: max_results, monitor_arn: monitor_arn, next_page_token: next_page_token, subscription_arn_list: subscription_arn_list)
        get_anomaly_subscriptions(input)
      end

      def get_anomaly_subscriptions(input : Types::GetAnomalySubscriptionsRequest) : Types::GetAnomalySubscriptionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ANOMALY_SUBSCRIPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAnomalySubscriptionsResponse, "GetAnomalySubscriptions")
      end

      # Retrieves estimated usage records for hourly granularity or resource-level data at daily
      # granularity.

      def get_approximate_usage_records(
        approximation_dimension : String,
        granularity : String,
        services : Array(String)? = nil
      ) : Types::GetApproximateUsageRecordsResponse

        input = Types::GetApproximateUsageRecordsRequest.new(approximation_dimension: approximation_dimension, granularity: granularity, services: services)
        get_approximate_usage_records(input)
      end

      def get_approximate_usage_records(input : Types::GetApproximateUsageRecordsRequest) : Types::GetApproximateUsageRecordsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_APPROXIMATE_USAGE_RECORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetApproximateUsageRecordsResponse, "GetApproximateUsageRecords")
      end

      # Retrieves a commitment purchase analysis result based on the AnalysisId .

      def get_commitment_purchase_analysis(
        analysis_id : String
      ) : Types::GetCommitmentPurchaseAnalysisResponse

        input = Types::GetCommitmentPurchaseAnalysisRequest.new(analysis_id: analysis_id)
        get_commitment_purchase_analysis(input)
      end

      def get_commitment_purchase_analysis(input : Types::GetCommitmentPurchaseAnalysisRequest) : Types::GetCommitmentPurchaseAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COMMITMENT_PURCHASE_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCommitmentPurchaseAnalysisResponse, "GetCommitmentPurchaseAnalysis")
      end

      # Retrieves cost and usage metrics for your account. You can specify which cost and usage-related
      # metric that you want the request to return. For example, you can specify BlendedCosts or
      # UsageQuantity . You can also filter and group your data by various dimensions, such as SERVICE or AZ
      # , in a specific time range. For a complete list of valid dimensions, see the GetDimensionValues
      # operation. Management account in an organization in Organizations have access to all member
      # accounts. For information about filter limitations, see Quotas and restrictions in the Billing and
      # Cost Management User Guide .

      def get_cost_and_usage(
        granularity : String,
        metrics : Array(String),
        time_period : Types::DateInterval,
        billing_view_arn : String? = nil,
        filter : Types::Expression? = nil,
        group_by : Array(Types::GroupDefinition)? = nil,
        next_page_token : String? = nil
      ) : Types::GetCostAndUsageResponse

        input = Types::GetCostAndUsageRequest.new(granularity: granularity, metrics: metrics, time_period: time_period, billing_view_arn: billing_view_arn, filter: filter, group_by: group_by, next_page_token: next_page_token)
        get_cost_and_usage(input)
      end

      def get_cost_and_usage(input : Types::GetCostAndUsageRequest) : Types::GetCostAndUsageResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COST_AND_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCostAndUsageResponse, "GetCostAndUsage")
      end

      # Retrieves cost and usage comparisons for your account between two periods within the last 13 months.
      # If you have enabled multi-year data at monthly granularity, you can go back up to 38 months.

      def get_cost_and_usage_comparisons(
        baseline_time_period : Types::DateInterval,
        comparison_time_period : Types::DateInterval,
        metric_for_comparison : String,
        billing_view_arn : String? = nil,
        filter : Types::Expression? = nil,
        group_by : Array(Types::GroupDefinition)? = nil,
        max_results : Int32? = nil,
        next_page_token : String? = nil
      ) : Types::GetCostAndUsageComparisonsResponse

        input = Types::GetCostAndUsageComparisonsRequest.new(baseline_time_period: baseline_time_period, comparison_time_period: comparison_time_period, metric_for_comparison: metric_for_comparison, billing_view_arn: billing_view_arn, filter: filter, group_by: group_by, max_results: max_results, next_page_token: next_page_token)
        get_cost_and_usage_comparisons(input)
      end

      def get_cost_and_usage_comparisons(input : Types::GetCostAndUsageComparisonsRequest) : Types::GetCostAndUsageComparisonsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COST_AND_USAGE_COMPARISONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCostAndUsageComparisonsResponse, "GetCostAndUsageComparisons")
      end

      # Retrieves cost and usage metrics with resources for your account. You can specify which cost and
      # usage-related metric, such as BlendedCosts or UsageQuantity , that you want the request to return.
      # You can also filter and group your data by various dimensions, such as SERVICE or AZ , in a specific
      # time range. For a complete list of valid dimensions, see the GetDimensionValues operation.
      # Management account in an organization in Organizations have access to all member accounts. Hourly
      # granularity is only available for EC2-Instances (Elastic Compute Cloud) resource-level data. All
      # other resource-level data is available at daily granularity. This is an opt-in only feature. You can
      # enable this feature from the Cost Explorer Settings page. For information about how to access the
      # Settings page, see Controlling Access for Cost Explorer in the Billing and Cost Management User
      # Guide .

      def get_cost_and_usage_with_resources(
        filter : Types::Expression,
        granularity : String,
        time_period : Types::DateInterval,
        billing_view_arn : String? = nil,
        group_by : Array(Types::GroupDefinition)? = nil,
        metrics : Array(String)? = nil,
        next_page_token : String? = nil
      ) : Types::GetCostAndUsageWithResourcesResponse

        input = Types::GetCostAndUsageWithResourcesRequest.new(filter: filter, granularity: granularity, time_period: time_period, billing_view_arn: billing_view_arn, group_by: group_by, metrics: metrics, next_page_token: next_page_token)
        get_cost_and_usage_with_resources(input)
      end

      def get_cost_and_usage_with_resources(input : Types::GetCostAndUsageWithResourcesRequest) : Types::GetCostAndUsageWithResourcesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COST_AND_USAGE_WITH_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCostAndUsageWithResourcesResponse, "GetCostAndUsageWithResources")
      end

      # Retrieves an array of cost category names and values incurred cost. If some cost category names and
      # values are not associated with any cost, they will not be returned by this API.

      def get_cost_categories(
        time_period : Types::DateInterval,
        billing_view_arn : String? = nil,
        cost_category_name : String? = nil,
        filter : Types::Expression? = nil,
        max_results : Int32? = nil,
        next_page_token : String? = nil,
        search_string : String? = nil,
        sort_by : Array(Types::SortDefinition)? = nil
      ) : Types::GetCostCategoriesResponse

        input = Types::GetCostCategoriesRequest.new(time_period: time_period, billing_view_arn: billing_view_arn, cost_category_name: cost_category_name, filter: filter, max_results: max_results, next_page_token: next_page_token, search_string: search_string, sort_by: sort_by)
        get_cost_categories(input)
      end

      def get_cost_categories(input : Types::GetCostCategoriesRequest) : Types::GetCostCategoriesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COST_CATEGORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCostCategoriesResponse, "GetCostCategories")
      end

      # Retrieves key factors driving cost changes between two time periods within the last 13 months, such
      # as usage changes, discount changes, and commitment-based savings. If you have enabled multi-year
      # data at monthly granularity, you can go back up to 38 months.

      def get_cost_comparison_drivers(
        baseline_time_period : Types::DateInterval,
        comparison_time_period : Types::DateInterval,
        metric_for_comparison : String,
        billing_view_arn : String? = nil,
        filter : Types::Expression? = nil,
        group_by : Array(Types::GroupDefinition)? = nil,
        max_results : Int32? = nil,
        next_page_token : String? = nil
      ) : Types::GetCostComparisonDriversResponse

        input = Types::GetCostComparisonDriversRequest.new(baseline_time_period: baseline_time_period, comparison_time_period: comparison_time_period, metric_for_comparison: metric_for_comparison, billing_view_arn: billing_view_arn, filter: filter, group_by: group_by, max_results: max_results, next_page_token: next_page_token)
        get_cost_comparison_drivers(input)
      end

      def get_cost_comparison_drivers(input : Types::GetCostComparisonDriversRequest) : Types::GetCostComparisonDriversResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COST_COMPARISON_DRIVERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCostComparisonDriversResponse, "GetCostComparisonDrivers")
      end

      # Retrieves a forecast for how much Amazon Web Services predicts that you will spend over the forecast
      # time period that you select, based on your past costs.

      def get_cost_forecast(
        granularity : String,
        metric : String,
        time_period : Types::DateInterval,
        billing_view_arn : String? = nil,
        filter : Types::Expression? = nil,
        prediction_interval_level : Int32? = nil
      ) : Types::GetCostForecastResponse

        input = Types::GetCostForecastRequest.new(granularity: granularity, metric: metric, time_period: time_period, billing_view_arn: billing_view_arn, filter: filter, prediction_interval_level: prediction_interval_level)
        get_cost_forecast(input)
      end

      def get_cost_forecast(input : Types::GetCostForecastRequest) : Types::GetCostForecastResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COST_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCostForecastResponse, "GetCostForecast")
      end

      # Retrieves all available filter values for a specified filter over a period of time. You can search
      # the dimension values for an arbitrary string.

      def get_dimension_values(
        dimension : String,
        time_period : Types::DateInterval,
        billing_view_arn : String? = nil,
        context : String? = nil,
        filter : Types::Expression? = nil,
        max_results : Int32? = nil,
        next_page_token : String? = nil,
        search_string : String? = nil,
        sort_by : Array(Types::SortDefinition)? = nil
      ) : Types::GetDimensionValuesResponse

        input = Types::GetDimensionValuesRequest.new(dimension: dimension, time_period: time_period, billing_view_arn: billing_view_arn, context: context, filter: filter, max_results: max_results, next_page_token: next_page_token, search_string: search_string, sort_by: sort_by)
        get_dimension_values(input)
      end

      def get_dimension_values(input : Types::GetDimensionValuesRequest) : Types::GetDimensionValuesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DIMENSION_VALUES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDimensionValuesResponse, "GetDimensionValues")
      end

      # Retrieves the reservation coverage for your account, which you can use to see how much of your
      # Amazon Elastic Compute Cloud, Amazon ElastiCache, Amazon Relational Database Service, or Amazon
      # Redshift usage is covered by a reservation. An organization's management account can see the
      # coverage of the associated member accounts. This supports dimensions, cost categories, and nested
      # expressions. For any time period, you can filter data about reservation usage by the following
      # dimensions: AZ CACHE_ENGINE DATABASE_ENGINE DEPLOYMENT_OPTION INSTANCE_TYPE LINKED_ACCOUNT
      # OPERATING_SYSTEM PLATFORM REGION SERVICE TAG TENANCY To determine valid values for a dimension, use
      # the GetDimensionValues operation.

      def get_reservation_coverage(
        time_period : Types::DateInterval,
        filter : Types::Expression? = nil,
        granularity : String? = nil,
        group_by : Array(Types::GroupDefinition)? = nil,
        max_results : Int32? = nil,
        metrics : Array(String)? = nil,
        next_page_token : String? = nil,
        sort_by : Types::SortDefinition? = nil
      ) : Types::GetReservationCoverageResponse

        input = Types::GetReservationCoverageRequest.new(time_period: time_period, filter: filter, granularity: granularity, group_by: group_by, max_results: max_results, metrics: metrics, next_page_token: next_page_token, sort_by: sort_by)
        get_reservation_coverage(input)
      end

      def get_reservation_coverage(input : Types::GetReservationCoverageRequest) : Types::GetReservationCoverageResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESERVATION_COVERAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetReservationCoverageResponse, "GetReservationCoverage")
      end

      # Gets recommendations for reservation purchases. These recommendations might help you to reduce your
      # costs. Reservations provide a discounted hourly rate (up to 75%) compared to On-Demand pricing.
      # Amazon Web Services generates your recommendations by identifying your On-Demand usage during a
      # specific time period and collecting your usage into categories that are eligible for a reservation.
      # After Amazon Web Services has these categories, it simulates every combination of reservations in
      # each category of usage to identify the best number of each type of Reserved Instance (RI) to
      # purchase to maximize your estimated savings. For example, Amazon Web Services automatically
      # aggregates your Amazon EC2 Linux, shared tenancy, and c4 family usage in the US West (Oregon) Region
      # and recommends that you buy size-flexible regional reservations to apply to the c4 family usage.
      # Amazon Web Services recommends the smallest size instance in an instance family. This makes it
      # easier to purchase a size-flexible Reserved Instance (RI). Amazon Web Services also shows the equal
      # number of normalized units. This way, you can purchase any instance size that you want. For this
      # example, your RI recommendation is for c4.large because that is the smallest size instance in the c4
      # instance family.

      def get_reservation_purchase_recommendation(
        service : String,
        account_id : String? = nil,
        account_scope : String? = nil,
        filter : Types::Expression? = nil,
        lookback_period_in_days : String? = nil,
        next_page_token : String? = nil,
        page_size : Int32? = nil,
        payment_option : String? = nil,
        service_specification : Types::ServiceSpecification? = nil,
        term_in_years : String? = nil
      ) : Types::GetReservationPurchaseRecommendationResponse

        input = Types::GetReservationPurchaseRecommendationRequest.new(service: service, account_id: account_id, account_scope: account_scope, filter: filter, lookback_period_in_days: lookback_period_in_days, next_page_token: next_page_token, page_size: page_size, payment_option: payment_option, service_specification: service_specification, term_in_years: term_in_years)
        get_reservation_purchase_recommendation(input)
      end

      def get_reservation_purchase_recommendation(input : Types::GetReservationPurchaseRecommendationRequest) : Types::GetReservationPurchaseRecommendationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESERVATION_PURCHASE_RECOMMENDATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetReservationPurchaseRecommendationResponse, "GetReservationPurchaseRecommendation")
      end

      # Retrieves the reservation utilization for your account. Management account in an organization have
      # access to member accounts. You can filter data by dimensions in a time period. You can use
      # GetDimensionValues to determine the possible dimension values. Currently, you can group only by
      # SUBSCRIPTION_ID .

      def get_reservation_utilization(
        time_period : Types::DateInterval,
        filter : Types::Expression? = nil,
        granularity : String? = nil,
        group_by : Array(Types::GroupDefinition)? = nil,
        max_results : Int32? = nil,
        next_page_token : String? = nil,
        sort_by : Types::SortDefinition? = nil
      ) : Types::GetReservationUtilizationResponse

        input = Types::GetReservationUtilizationRequest.new(time_period: time_period, filter: filter, granularity: granularity, group_by: group_by, max_results: max_results, next_page_token: next_page_token, sort_by: sort_by)
        get_reservation_utilization(input)
      end

      def get_reservation_utilization(input : Types::GetReservationUtilizationRequest) : Types::GetReservationUtilizationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESERVATION_UTILIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetReservationUtilizationResponse, "GetReservationUtilization")
      end

      # Creates recommendations that help you save cost by identifying idle and underutilized Amazon EC2
      # instances. Recommendations are generated to either downsize or terminate instances, along with
      # providing savings detail and metrics. For more information about calculation and function, see
      # Optimizing Your Cost with Rightsizing Recommendations in the Billing and Cost Management User Guide
      # .

      def get_rightsizing_recommendation(
        service : String,
        configuration : Types::RightsizingRecommendationConfiguration? = nil,
        filter : Types::Expression? = nil,
        next_page_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::GetRightsizingRecommendationResponse

        input = Types::GetRightsizingRecommendationRequest.new(service: service, configuration: configuration, filter: filter, next_page_token: next_page_token, page_size: page_size)
        get_rightsizing_recommendation(input)
      end

      def get_rightsizing_recommendation(input : Types::GetRightsizingRecommendationRequest) : Types::GetRightsizingRecommendationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RIGHTSIZING_RECOMMENDATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRightsizingRecommendationResponse, "GetRightsizingRecommendation")
      end

      # Retrieves the details for a Savings Plan recommendation. These details include the hourly
      # data-points that construct the cost, coverage, and utilization charts.

      def get_savings_plan_purchase_recommendation_details(
        recommendation_detail_id : String
      ) : Types::GetSavingsPlanPurchaseRecommendationDetailsResponse

        input = Types::GetSavingsPlanPurchaseRecommendationDetailsRequest.new(recommendation_detail_id: recommendation_detail_id)
        get_savings_plan_purchase_recommendation_details(input)
      end

      def get_savings_plan_purchase_recommendation_details(input : Types::GetSavingsPlanPurchaseRecommendationDetailsRequest) : Types::GetSavingsPlanPurchaseRecommendationDetailsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SAVINGS_PLAN_PURCHASE_RECOMMENDATION_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSavingsPlanPurchaseRecommendationDetailsResponse, "GetSavingsPlanPurchaseRecommendationDetails")
      end

      # Retrieves the Savings Plans covered for your account. This enables you to see how much of your cost
      # is covered by a Savings Plan. An organization’s management account can see the coverage of the
      # associated member accounts. This supports dimensions, cost categories, and nested expressions. For
      # any time period, you can filter data for Savings Plans usage with the following dimensions:
      # LINKED_ACCOUNT REGION SERVICE INSTANCE_FAMILY To determine valid values for a dimension, use the
      # GetDimensionValues operation.

      def get_savings_plans_coverage(
        time_period : Types::DateInterval,
        filter : Types::Expression? = nil,
        granularity : String? = nil,
        group_by : Array(Types::GroupDefinition)? = nil,
        max_results : Int32? = nil,
        metrics : Array(String)? = nil,
        next_token : String? = nil,
        sort_by : Types::SortDefinition? = nil
      ) : Types::GetSavingsPlansCoverageResponse

        input = Types::GetSavingsPlansCoverageRequest.new(time_period: time_period, filter: filter, granularity: granularity, group_by: group_by, max_results: max_results, metrics: metrics, next_token: next_token, sort_by: sort_by)
        get_savings_plans_coverage(input)
      end

      def get_savings_plans_coverage(input : Types::GetSavingsPlansCoverageRequest) : Types::GetSavingsPlansCoverageResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SAVINGS_PLANS_COVERAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSavingsPlansCoverageResponse, "GetSavingsPlansCoverage")
      end

      # Retrieves the Savings Plans recommendations for your account. First use
      # StartSavingsPlansPurchaseRecommendationGeneration to generate a new set of recommendations, and then
      # use GetSavingsPlansPurchaseRecommendation to retrieve them.

      def get_savings_plans_purchase_recommendation(
        lookback_period_in_days : String,
        payment_option : String,
        savings_plans_type : String,
        term_in_years : String,
        account_scope : String? = nil,
        filter : Types::Expression? = nil,
        next_page_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::GetSavingsPlansPurchaseRecommendationResponse

        input = Types::GetSavingsPlansPurchaseRecommendationRequest.new(lookback_period_in_days: lookback_period_in_days, payment_option: payment_option, savings_plans_type: savings_plans_type, term_in_years: term_in_years, account_scope: account_scope, filter: filter, next_page_token: next_page_token, page_size: page_size)
        get_savings_plans_purchase_recommendation(input)
      end

      def get_savings_plans_purchase_recommendation(input : Types::GetSavingsPlansPurchaseRecommendationRequest) : Types::GetSavingsPlansPurchaseRecommendationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SAVINGS_PLANS_PURCHASE_RECOMMENDATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSavingsPlansPurchaseRecommendationResponse, "GetSavingsPlansPurchaseRecommendation")
      end

      # Retrieves the Savings Plans utilization for your account across date ranges with daily or monthly
      # granularity. Management account in an organization have access to member accounts. You can use
      # GetDimensionValues in SAVINGS_PLANS to determine the possible dimension values. You can't group by
      # any dimension values for GetSavingsPlansUtilization .

      def get_savings_plans_utilization(
        time_period : Types::DateInterval,
        filter : Types::Expression? = nil,
        granularity : String? = nil,
        sort_by : Types::SortDefinition? = nil
      ) : Types::GetSavingsPlansUtilizationResponse

        input = Types::GetSavingsPlansUtilizationRequest.new(time_period: time_period, filter: filter, granularity: granularity, sort_by: sort_by)
        get_savings_plans_utilization(input)
      end

      def get_savings_plans_utilization(input : Types::GetSavingsPlansUtilizationRequest) : Types::GetSavingsPlansUtilizationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SAVINGS_PLANS_UTILIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSavingsPlansUtilizationResponse, "GetSavingsPlansUtilization")
      end

      # Retrieves attribute data along with aggregate utilization and savings data for a given time period.
      # This doesn't support granular or grouped data (daily/monthly) in response. You can't retrieve data
      # by dates in a single response similar to GetSavingsPlanUtilization , but you have the option to make
      # multiple calls to GetSavingsPlanUtilizationDetails by providing individual dates. You can use
      # GetDimensionValues in SAVINGS_PLANS to determine the possible dimension values.
      # GetSavingsPlanUtilizationDetails internally groups data by SavingsPlansArn .

      def get_savings_plans_utilization_details(
        time_period : Types::DateInterval,
        data_type : Array(String)? = nil,
        filter : Types::Expression? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::SortDefinition? = nil
      ) : Types::GetSavingsPlansUtilizationDetailsResponse

        input = Types::GetSavingsPlansUtilizationDetailsRequest.new(time_period: time_period, data_type: data_type, filter: filter, max_results: max_results, next_token: next_token, sort_by: sort_by)
        get_savings_plans_utilization_details(input)
      end

      def get_savings_plans_utilization_details(input : Types::GetSavingsPlansUtilizationDetailsRequest) : Types::GetSavingsPlansUtilizationDetailsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SAVINGS_PLANS_UTILIZATION_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSavingsPlansUtilizationDetailsResponse, "GetSavingsPlansUtilizationDetails")
      end

      # Queries for available tag keys and tag values for a specified period. You can search the tag values
      # for an arbitrary string.

      def get_tags(
        time_period : Types::DateInterval,
        billing_view_arn : String? = nil,
        filter : Types::Expression? = nil,
        max_results : Int32? = nil,
        next_page_token : String? = nil,
        search_string : String? = nil,
        sort_by : Array(Types::SortDefinition)? = nil,
        tag_key : String? = nil
      ) : Types::GetTagsResponse

        input = Types::GetTagsRequest.new(time_period: time_period, billing_view_arn: billing_view_arn, filter: filter, max_results: max_results, next_page_token: next_page_token, search_string: search_string, sort_by: sort_by, tag_key: tag_key)
        get_tags(input)
      end

      def get_tags(input : Types::GetTagsRequest) : Types::GetTagsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTagsResponse, "GetTags")
      end

      # Retrieves a forecast for how much Amazon Web Services predicts that you will use over the forecast
      # time period that you select, based on your past usage.

      def get_usage_forecast(
        granularity : String,
        metric : String,
        time_period : Types::DateInterval,
        billing_view_arn : String? = nil,
        filter : Types::Expression? = nil,
        prediction_interval_level : Int32? = nil
      ) : Types::GetUsageForecastResponse

        input = Types::GetUsageForecastRequest.new(granularity: granularity, metric: metric, time_period: time_period, billing_view_arn: billing_view_arn, filter: filter, prediction_interval_level: prediction_interval_level)
        get_usage_forecast(input)
      end

      def get_usage_forecast(input : Types::GetUsageForecastRequest) : Types::GetUsageForecastResponse
        request = Protocol::JsonRpc.build_request(Model::GET_USAGE_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUsageForecastResponse, "GetUsageForecast")
      end

      # Lists the commitment purchase analyses for your account.

      def list_commitment_purchase_analyses(
        analysis_ids : Array(String)? = nil,
        analysis_status : String? = nil,
        next_page_token : String? = nil,
        page_size : Int32? = nil
      ) : Types::ListCommitmentPurchaseAnalysesResponse

        input = Types::ListCommitmentPurchaseAnalysesRequest.new(analysis_ids: analysis_ids, analysis_status: analysis_status, next_page_token: next_page_token, page_size: page_size)
        list_commitment_purchase_analyses(input)
      end

      def list_commitment_purchase_analyses(input : Types::ListCommitmentPurchaseAnalysesRequest) : Types::ListCommitmentPurchaseAnalysesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COMMITMENT_PURCHASE_ANALYSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCommitmentPurchaseAnalysesResponse, "ListCommitmentPurchaseAnalyses")
      end

      # Retrieves a list of your historical cost allocation tag backfill requests.

      def list_cost_allocation_tag_backfill_history(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCostAllocationTagBackfillHistoryResponse

        input = Types::ListCostAllocationTagBackfillHistoryRequest.new(max_results: max_results, next_token: next_token)
        list_cost_allocation_tag_backfill_history(input)
      end

      def list_cost_allocation_tag_backfill_history(input : Types::ListCostAllocationTagBackfillHistoryRequest) : Types::ListCostAllocationTagBackfillHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COST_ALLOCATION_TAG_BACKFILL_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCostAllocationTagBackfillHistoryResponse, "ListCostAllocationTagBackfillHistory")
      end

      # Get a list of cost allocation tags. All inputs in the API are optional and serve as filters. By
      # default, all cost allocation tags are returned.

      def list_cost_allocation_tags(
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil,
        tag_keys : Array(String)? = nil,
        type : String? = nil
      ) : Types::ListCostAllocationTagsResponse

        input = Types::ListCostAllocationTagsRequest.new(max_results: max_results, next_token: next_token, status: status, tag_keys: tag_keys, type: type)
        list_cost_allocation_tags(input)
      end

      def list_cost_allocation_tags(input : Types::ListCostAllocationTagsRequest) : Types::ListCostAllocationTagsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COST_ALLOCATION_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCostAllocationTagsResponse, "ListCostAllocationTags")
      end

      # Returns the name, Amazon Resource Name (ARN), NumberOfRules and effective dates of all cost
      # categories defined in the account. You have the option to use EffectiveOn and SupportedResourceTypes
      # to return a list of cost categories that were active on a specific date. If there is no EffectiveOn
      # specified, you’ll see cost categories that are effective on the current date. If cost category is
      # still effective, EffectiveEnd is omitted in the response. ListCostCategoryDefinitions supports
      # pagination. The request can have a MaxResults range up to 100.

      def list_cost_category_definitions(
        effective_on : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        supported_resource_types : Array(String)? = nil
      ) : Types::ListCostCategoryDefinitionsResponse

        input = Types::ListCostCategoryDefinitionsRequest.new(effective_on: effective_on, max_results: max_results, next_token: next_token, supported_resource_types: supported_resource_types)
        list_cost_category_definitions(input)
      end

      def list_cost_category_definitions(input : Types::ListCostCategoryDefinitionsRequest) : Types::ListCostCategoryDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COST_CATEGORY_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCostCategoryDefinitionsResponse, "ListCostCategoryDefinitions")
      end

      # Returns resource associations of all cost categories defined in the account. You have the option to
      # use CostCategoryArn to get the association for a specific cost category.
      # ListCostCategoryResourceAssociations supports pagination. The request can have a MaxResults range up
      # to 100.

      def list_cost_category_resource_associations(
        cost_category_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCostCategoryResourceAssociationsResponse

        input = Types::ListCostCategoryResourceAssociationsRequest.new(cost_category_arn: cost_category_arn, max_results: max_results, next_token: next_token)
        list_cost_category_resource_associations(input)
      end

      def list_cost_category_resource_associations(input : Types::ListCostCategoryResourceAssociationsRequest) : Types::ListCostCategoryResourceAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COST_CATEGORY_RESOURCE_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCostCategoryResourceAssociationsResponse, "ListCostCategoryResourceAssociations")
      end

      # Retrieves a list of your historical recommendation generations within the past 30 days.

      def list_savings_plans_purchase_recommendation_generation(
        generation_status : String? = nil,
        next_page_token : String? = nil,
        page_size : Int32? = nil,
        recommendation_ids : Array(String)? = nil
      ) : Types::ListSavingsPlansPurchaseRecommendationGenerationResponse

        input = Types::ListSavingsPlansPurchaseRecommendationGenerationRequest.new(generation_status: generation_status, next_page_token: next_page_token, page_size: page_size, recommendation_ids: recommendation_ids)
        list_savings_plans_purchase_recommendation_generation(input)
      end

      def list_savings_plans_purchase_recommendation_generation(input : Types::ListSavingsPlansPurchaseRecommendationGenerationRequest) : Types::ListSavingsPlansPurchaseRecommendationGenerationResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SAVINGS_PLANS_PURCHASE_RECOMMENDATION_GENERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSavingsPlansPurchaseRecommendationGenerationResponse, "ListSavingsPlansPurchaseRecommendationGeneration")
      end

      # Returns a list of resource tags associated with the resource specified by the Amazon Resource Name
      # (ARN).

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Modifies the feedback property of a given cost anomaly.

      def provide_anomaly_feedback(
        anomaly_id : String,
        feedback : String
      ) : Types::ProvideAnomalyFeedbackResponse

        input = Types::ProvideAnomalyFeedbackRequest.new(anomaly_id: anomaly_id, feedback: feedback)
        provide_anomaly_feedback(input)
      end

      def provide_anomaly_feedback(input : Types::ProvideAnomalyFeedbackRequest) : Types::ProvideAnomalyFeedbackResponse
        request = Protocol::JsonRpc.build_request(Model::PROVIDE_ANOMALY_FEEDBACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ProvideAnomalyFeedbackResponse, "ProvideAnomalyFeedback")
      end

      # Specifies the parameters of a planned commitment purchase and starts the generation of the analysis.
      # This enables you to estimate the cost, coverage, and utilization impact of your planned commitment
      # purchases.

      def start_commitment_purchase_analysis(
        commitment_purchase_analysis_configuration : Types::CommitmentPurchaseAnalysisConfiguration
      ) : Types::StartCommitmentPurchaseAnalysisResponse

        input = Types::StartCommitmentPurchaseAnalysisRequest.new(commitment_purchase_analysis_configuration: commitment_purchase_analysis_configuration)
        start_commitment_purchase_analysis(input)
      end

      def start_commitment_purchase_analysis(input : Types::StartCommitmentPurchaseAnalysisRequest) : Types::StartCommitmentPurchaseAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::START_COMMITMENT_PURCHASE_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartCommitmentPurchaseAnalysisResponse, "StartCommitmentPurchaseAnalysis")
      end

      # Request a cost allocation tag backfill. This will backfill the activation status (either active or
      # inactive ) for all tag keys from para:BackfillFrom up to the time this request is made. You can
      # request a backfill once every 24 hours.

      def start_cost_allocation_tag_backfill(
        backfill_from : String
      ) : Types::StartCostAllocationTagBackfillResponse

        input = Types::StartCostAllocationTagBackfillRequest.new(backfill_from: backfill_from)
        start_cost_allocation_tag_backfill(input)
      end

      def start_cost_allocation_tag_backfill(input : Types::StartCostAllocationTagBackfillRequest) : Types::StartCostAllocationTagBackfillResponse
        request = Protocol::JsonRpc.build_request(Model::START_COST_ALLOCATION_TAG_BACKFILL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartCostAllocationTagBackfillResponse, "StartCostAllocationTagBackfill")
      end

      # Requests a Savings Plans recommendation generation. This enables you to calculate a fresh set of
      # Savings Plans recommendations that takes your latest usage data and current Savings Plans inventory
      # into account. You can refresh Savings Plans recommendations up to three times daily for a
      # consolidated billing family. StartSavingsPlansPurchaseRecommendationGeneration has no request syntax
      # because no input parameters are needed to support this operation.

      def start_savings_plans_purchase_recommendation_generation : Types::StartSavingsPlansPurchaseRecommendationGenerationResponse
        input = Types::StartSavingsPlansPurchaseRecommendationGenerationRequest.new
        start_savings_plans_purchase_recommendation_generation(input)
      end

      def start_savings_plans_purchase_recommendation_generation(input : Types::StartSavingsPlansPurchaseRecommendationGenerationRequest) : Types::StartSavingsPlansPurchaseRecommendationGenerationResponse
        request = Protocol::JsonRpc.build_request(Model::START_SAVINGS_PLANS_PURCHASE_RECOMMENDATION_GENERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSavingsPlansPurchaseRecommendationGenerationResponse, "StartSavingsPlansPurchaseRecommendationGeneration")
      end

      # An API operation for adding one or more tags (key-value pairs) to a resource. You can use the
      # TagResource operation with a resource that already has tags. If you specify a new tag key for the
      # resource, this tag is appended to the list of tags associated with the resource. If you specify a
      # tag key that is already associated with the resource, the new tag value you specify replaces the
      # previous value for that tag. Although the maximum number of array members is 200, user-tag maximum
      # is 50. The remaining are reserved for Amazon Web Services use.

      def tag_resource(
        resource_arn : String,
        resource_tags : Array(Types::ResourceTag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, resource_tags: resource_tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes one or more tags from a resource. Specify only tag keys in your request. Don't specify the
      # value.

      def untag_resource(
        resource_arn : String,
        resource_tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, resource_tag_keys: resource_tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates an existing cost anomaly monitor. The changes made are applied going forward, and doesn't
      # change anomalies detected in the past.

      def update_anomaly_monitor(
        monitor_arn : String,
        monitor_name : String? = nil
      ) : Types::UpdateAnomalyMonitorResponse

        input = Types::UpdateAnomalyMonitorRequest.new(monitor_arn: monitor_arn, monitor_name: monitor_name)
        update_anomaly_monitor(input)
      end

      def update_anomaly_monitor(input : Types::UpdateAnomalyMonitorRequest) : Types::UpdateAnomalyMonitorResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ANOMALY_MONITOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAnomalyMonitorResponse, "UpdateAnomalyMonitor")
      end

      # Updates an existing cost anomaly subscription. Specify the fields that you want to update. Omitted
      # fields are unchanged. The JSON below describes the generic construct for each type. See Request
      # Parameters for possible values as they apply to AnomalySubscription .

      def update_anomaly_subscription(
        subscription_arn : String,
        frequency : String? = nil,
        monitor_arn_list : Array(String)? = nil,
        subscribers : Array(Types::Subscriber)? = nil,
        subscription_name : String? = nil,
        threshold : Float64? = nil,
        threshold_expression : Types::Expression? = nil
      ) : Types::UpdateAnomalySubscriptionResponse

        input = Types::UpdateAnomalySubscriptionRequest.new(subscription_arn: subscription_arn, frequency: frequency, monitor_arn_list: monitor_arn_list, subscribers: subscribers, subscription_name: subscription_name, threshold: threshold, threshold_expression: threshold_expression)
        update_anomaly_subscription(input)
      end

      def update_anomaly_subscription(input : Types::UpdateAnomalySubscriptionRequest) : Types::UpdateAnomalySubscriptionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ANOMALY_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAnomalySubscriptionResponse, "UpdateAnomalySubscription")
      end

      # Updates status for cost allocation tags in bulk, with maximum batch size of 20. If the tag status
      # that's updated is the same as the existing tag status, the request doesn't fail. Instead, it doesn't
      # have any effect on the tag status (for example, activating the active tag).

      def update_cost_allocation_tags_status(
        cost_allocation_tags_status : Array(Types::CostAllocationTagStatusEntry)
      ) : Types::UpdateCostAllocationTagsStatusResponse

        input = Types::UpdateCostAllocationTagsStatusRequest.new(cost_allocation_tags_status: cost_allocation_tags_status)
        update_cost_allocation_tags_status(input)
      end

      def update_cost_allocation_tags_status(input : Types::UpdateCostAllocationTagsStatusRequest) : Types::UpdateCostAllocationTagsStatusResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COST_ALLOCATION_TAGS_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCostAllocationTagsStatusResponse, "UpdateCostAllocationTagsStatus")
      end

      # Updates an existing cost category. Changes made to the cost category rules will be used to
      # categorize the current month’s expenses and future expenses. This won’t change categorization for
      # the previous months.

      def update_cost_category_definition(
        cost_category_arn : String,
        rule_version : String,
        rules : Array(Types::CostCategoryRule),
        default_value : String? = nil,
        effective_start : String? = nil,
        split_charge_rules : Array(Types::CostCategorySplitChargeRule)? = nil
      ) : Types::UpdateCostCategoryDefinitionResponse

        input = Types::UpdateCostCategoryDefinitionRequest.new(cost_category_arn: cost_category_arn, rule_version: rule_version, rules: rules, default_value: default_value, effective_start: effective_start, split_charge_rules: split_charge_rules)
        update_cost_category_definition(input)
      end

      def update_cost_category_definition(input : Types::UpdateCostCategoryDefinitionRequest) : Types::UpdateCostCategoryDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COST_CATEGORY_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCostCategoryDefinitionResponse, "UpdateCostCategoryDefinition")
      end
    end
  end
end
