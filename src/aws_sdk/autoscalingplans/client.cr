module AwsSdk
  module AutoScalingPlans
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

      # Creates a scaling plan.

      def create_scaling_plan(
        application_source : Types::ApplicationSource,
        scaling_instructions : Array(Types::ScalingInstruction),
        scaling_plan_name : String
      ) : Types::CreateScalingPlanResponse

        input = Types::CreateScalingPlanRequest.new(application_source: application_source, scaling_instructions: scaling_instructions, scaling_plan_name: scaling_plan_name)
        create_scaling_plan(input)
      end

      def create_scaling_plan(input : Types::CreateScalingPlanRequest) : Types::CreateScalingPlanResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SCALING_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateScalingPlanResponse, "CreateScalingPlan")
      end

      # Deletes the specified scaling plan. Deleting a scaling plan deletes the underlying
      # ScalingInstruction for all of the scalable resources that are covered by the plan. If the plan has
      # launched resources or has scaling activities in progress, you must delete those resources
      # separately.

      def delete_scaling_plan(
        scaling_plan_name : String,
        scaling_plan_version : Int64
      ) : Types::DeleteScalingPlanResponse

        input = Types::DeleteScalingPlanRequest.new(scaling_plan_name: scaling_plan_name, scaling_plan_version: scaling_plan_version)
        delete_scaling_plan(input)
      end

      def delete_scaling_plan(input : Types::DeleteScalingPlanRequest) : Types::DeleteScalingPlanResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCALING_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteScalingPlanResponse, "DeleteScalingPlan")
      end

      # Describes the scalable resources in the specified scaling plan.

      def describe_scaling_plan_resources(
        scaling_plan_name : String,
        scaling_plan_version : Int64,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeScalingPlanResourcesResponse

        input = Types::DescribeScalingPlanResourcesRequest.new(scaling_plan_name: scaling_plan_name, scaling_plan_version: scaling_plan_version, max_results: max_results, next_token: next_token)
        describe_scaling_plan_resources(input)
      end

      def describe_scaling_plan_resources(input : Types::DescribeScalingPlanResourcesRequest) : Types::DescribeScalingPlanResourcesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCALING_PLAN_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeScalingPlanResourcesResponse, "DescribeScalingPlanResources")
      end

      # Describes one or more of your scaling plans.

      def describe_scaling_plans(
        application_sources : Array(Types::ApplicationSource)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        scaling_plan_names : Array(String)? = nil,
        scaling_plan_version : Int64? = nil
      ) : Types::DescribeScalingPlansResponse

        input = Types::DescribeScalingPlansRequest.new(application_sources: application_sources, max_results: max_results, next_token: next_token, scaling_plan_names: scaling_plan_names, scaling_plan_version: scaling_plan_version)
        describe_scaling_plans(input)
      end

      def describe_scaling_plans(input : Types::DescribeScalingPlansRequest) : Types::DescribeScalingPlansResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCALING_PLANS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeScalingPlansResponse, "DescribeScalingPlans")
      end

      # Retrieves the forecast data for a scalable resource. Capacity forecasts are represented as predicted
      # values, or data points, that are calculated using historical data points from a specified CloudWatch
      # load metric. Data points are available for up to 56 days.

      def get_scaling_plan_resource_forecast_data(
        end_time : Time,
        forecast_data_type : String,
        resource_id : String,
        scalable_dimension : String,
        scaling_plan_name : String,
        scaling_plan_version : Int64,
        service_namespace : String,
        start_time : Time
      ) : Types::GetScalingPlanResourceForecastDataResponse

        input = Types::GetScalingPlanResourceForecastDataRequest.new(end_time: end_time, forecast_data_type: forecast_data_type, resource_id: resource_id, scalable_dimension: scalable_dimension, scaling_plan_name: scaling_plan_name, scaling_plan_version: scaling_plan_version, service_namespace: service_namespace, start_time: start_time)
        get_scaling_plan_resource_forecast_data(input)
      end

      def get_scaling_plan_resource_forecast_data(input : Types::GetScalingPlanResourceForecastDataRequest) : Types::GetScalingPlanResourceForecastDataResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SCALING_PLAN_RESOURCE_FORECAST_DATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetScalingPlanResourceForecastDataResponse, "GetScalingPlanResourceForecastData")
      end

      # Updates the specified scaling plan. You cannot update a scaling plan if it is in the process of
      # being created, updated, or deleted.

      def update_scaling_plan(
        scaling_plan_name : String,
        scaling_plan_version : Int64,
        application_source : Types::ApplicationSource? = nil,
        scaling_instructions : Array(Types::ScalingInstruction)? = nil
      ) : Types::UpdateScalingPlanResponse

        input = Types::UpdateScalingPlanRequest.new(scaling_plan_name: scaling_plan_name, scaling_plan_version: scaling_plan_version, application_source: application_source, scaling_instructions: scaling_instructions)
        update_scaling_plan(input)
      end

      def update_scaling_plan(input : Types::UpdateScalingPlanRequest) : Types::UpdateScalingPlanResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SCALING_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateScalingPlanResponse, "UpdateScalingPlan")
      end
    end
  end
end
