module AwsSdk
  module CostOptimizationHub
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

      # Returns a set of preferences for an account in order to add account-specific preferences into the
      # service. These preferences impact how the savings associated with recommendations are
      # presented—estimated savings after discounts or estimated savings before discounts, for example.
      def get_preferences : Types::GetPreferencesResponse
        input = Types::GetPreferencesRequest.new
        get_preferences(input)
      end
      def get_preferences(input : Types::GetPreferencesRequest) : Types::GetPreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPreferencesResponse, "GetPreferences")
      end

      # Returns both the current and recommended resource configuration and the estimated cost impact for a
      # recommendation. The recommendationId is only valid for up to a maximum of 24 hours as
      # recommendations are refreshed daily. To retrieve the recommendationId , use the ListRecommendations
      # API.
      def get_recommendation(
        recommendation_id : String
      ) : Types::GetRecommendationResponse
        input = Types::GetRecommendationRequest.new(recommendation_id: recommendation_id)
        get_recommendation(input)
      end
      def get_recommendation(input : Types::GetRecommendationRequest) : Types::GetRecommendationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RECOMMENDATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRecommendationResponse, "GetRecommendation")
      end

      # Returns cost efficiency metrics aggregated over time and optionally grouped by a specified
      # dimension. The metrics provide insights into your cost optimization progress by tracking estimated
      # savings, spending, and measures how effectively you're optimizing your Cloud resources. The
      # operation supports both daily and monthly time granularities and allows grouping results by account
      # ID, Amazon Web Services Region. Results are returned as time-series data, enabling you to analyze
      # trends in your cost optimization performance over the specified time period.
      def list_efficiency_metrics(
        granularity : String,
        time_period : Types::TimePeriod,
        group_by : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order_by : Types::OrderBy? = nil
      ) : Types::ListEfficiencyMetricsResponse
        input = Types::ListEfficiencyMetricsRequest.new(granularity: granularity, time_period: time_period, group_by: group_by, max_results: max_results, next_token: next_token, order_by: order_by)
        list_efficiency_metrics(input)
      end
      def list_efficiency_metrics(input : Types::ListEfficiencyMetricsRequest) : Types::ListEfficiencyMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EFFICIENCY_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEfficiencyMetricsResponse, "ListEfficiencyMetrics")
      end

      # Retrieves the enrollment status for an account. It can also return the list of accounts that are
      # enrolled under the organization.
      def list_enrollment_statuses(
        account_id : String? = nil,
        include_organization_info : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEnrollmentStatusesResponse
        input = Types::ListEnrollmentStatusesRequest.new(account_id: account_id, include_organization_info: include_organization_info, max_results: max_results, next_token: next_token)
        list_enrollment_statuses(input)
      end
      def list_enrollment_statuses(input : Types::ListEnrollmentStatusesRequest) : Types::ListEnrollmentStatusesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENROLLMENT_STATUSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnrollmentStatusesResponse, "ListEnrollmentStatuses")
      end

      # Returns a concise representation of savings estimates for resources. Also returns de-duped savings
      # across different types of recommendations. The following filters are not supported for this API:
      # recommendationIds , resourceArns , and resourceIds .
      def list_recommendation_summaries(
        group_by : String,
        filter : Types::Filter? = nil,
        max_results : Int32? = nil,
        metrics : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::ListRecommendationSummariesResponse
        input = Types::ListRecommendationSummariesRequest.new(group_by: group_by, filter: filter, max_results: max_results, metrics: metrics, next_token: next_token)
        list_recommendation_summaries(input)
      end
      def list_recommendation_summaries(input : Types::ListRecommendationSummariesRequest) : Types::ListRecommendationSummariesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECOMMENDATION_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRecommendationSummariesResponse, "ListRecommendationSummaries")
      end

      # Returns a list of recommendations.
      def list_recommendations(
        filter : Types::Filter? = nil,
        include_all_recommendations : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order_by : Types::OrderBy? = nil
      ) : Types::ListRecommendationsResponse
        input = Types::ListRecommendationsRequest.new(filter: filter, include_all_recommendations: include_all_recommendations, max_results: max_results, next_token: next_token, order_by: order_by)
        list_recommendations(input)
      end
      def list_recommendations(input : Types::ListRecommendationsRequest) : Types::ListRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRecommendationsResponse, "ListRecommendations")
      end

      # Updates the enrollment (opt in and opt out) status of an account to the Cost Optimization Hub
      # service. If the account is a management account of an organization, this action can also be used to
      # enroll member accounts of the organization. You must have the appropriate permissions to opt in to
      # Cost Optimization Hub and to view its recommendations. When you opt in, Cost Optimization Hub
      # automatically creates a service-linked role in your account to access its data.
      def update_enrollment_status(
        status : String,
        include_member_accounts : Bool? = nil
      ) : Types::UpdateEnrollmentStatusResponse
        input = Types::UpdateEnrollmentStatusRequest.new(status: status, include_member_accounts: include_member_accounts)
        update_enrollment_status(input)
      end
      def update_enrollment_status(input : Types::UpdateEnrollmentStatusRequest) : Types::UpdateEnrollmentStatusResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENROLLMENT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEnrollmentStatusResponse, "UpdateEnrollmentStatus")
      end

      # Updates a set of preferences for an account in order to add account-specific preferences into the
      # service. These preferences impact how the savings associated with recommendations are presented.
      def update_preferences(
        member_account_discount_visibility : String? = nil,
        preferred_commitment : Types::PreferredCommitment? = nil,
        savings_estimation_mode : String? = nil
      ) : Types::UpdatePreferencesResponse
        input = Types::UpdatePreferencesRequest.new(member_account_discount_visibility: member_account_discount_visibility, preferred_commitment: preferred_commitment, savings_estimation_mode: savings_estimation_mode)
        update_preferences(input)
      end
      def update_preferences(input : Types::UpdatePreferencesRequest) : Types::UpdatePreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePreferencesResponse, "UpdatePreferences")
      end
    end
  end
end
