module AwsSdk
  module FreeTier
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

      # Returns a specific activity record that is available to the customer.

      def get_account_activity(
        activity_id : String,
        language_code : String? = nil
      ) : Types::GetAccountActivityResponse

        input = Types::GetAccountActivityRequest.new(activity_id: activity_id, language_code: language_code)
        get_account_activity(input)
      end

      def get_account_activity(input : Types::GetAccountActivityRequest) : Types::GetAccountActivityResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCOUNT_ACTIVITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccountActivityResponse, "GetAccountActivity")
      end

      # This returns all of the information related to the state of the account plan related to Free Tier.

      def get_account_plan_state : Types::GetAccountPlanStateResponse
        input = Types::GetAccountPlanStateRequest.new
        get_account_plan_state(input)
      end

      def get_account_plan_state(input : Types::GetAccountPlanStateRequest) : Types::GetAccountPlanStateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCOUNT_PLAN_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccountPlanStateResponse, "GetAccountPlanState")
      end

      # Returns a list of all Free Tier usage objects that match your filters.

      def get_free_tier_usage(
        filter : Types::Expression? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetFreeTierUsageResponse

        input = Types::GetFreeTierUsageRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        get_free_tier_usage(input)
      end

      def get_free_tier_usage(input : Types::GetFreeTierUsageRequest) : Types::GetFreeTierUsageResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FREE_TIER_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFreeTierUsageResponse, "GetFreeTierUsage")
      end

      # Returns a list of activities that are available. This operation supports pagination and filtering by
      # status.

      def list_account_activities(
        filter_activity_statuses : Array(String)? = nil,
        language_code : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccountActivitiesResponse

        input = Types::ListAccountActivitiesRequest.new(filter_activity_statuses: filter_activity_statuses, language_code: language_code, max_results: max_results, next_token: next_token)
        list_account_activities(input)
      end

      def list_account_activities(input : Types::ListAccountActivitiesRequest) : Types::ListAccountActivitiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCOUNT_ACTIVITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccountActivitiesResponse, "ListAccountActivities")
      end

      # The account plan type for the Amazon Web Services account.

      def upgrade_account_plan(
        account_plan_type : String
      ) : Types::UpgradeAccountPlanResponse

        input = Types::UpgradeAccountPlanRequest.new(account_plan_type: account_plan_type)
        upgrade_account_plan(input)
      end

      def upgrade_account_plan(input : Types::UpgradeAccountPlanRequest) : Types::UpgradeAccountPlanResponse
        request = Protocol::JsonRpc.build_request(Model::UPGRADE_ACCOUNT_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpgradeAccountPlanResponse, "UpgradeAccountPlan")
      end
    end
  end
end
