module AwsSdk
  module MigrationHubConfig
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

      # This API sets up the home region for the calling account only.
      def create_home_region_control(
        home_region : String,
        target : Types::Target,
        dry_run : Bool? = nil
      ) : Types::CreateHomeRegionControlResult
        input = Types::CreateHomeRegionControlRequest.new(home_region: home_region, target: target, dry_run: dry_run)
        create_home_region_control(input)
      end
      def create_home_region_control(input : Types::CreateHomeRegionControlRequest) : Types::CreateHomeRegionControlResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_HOME_REGION_CONTROL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHomeRegionControlResult, "CreateHomeRegionControl")
      end

      # This operation deletes the home region configuration for the calling account. The operation does not
      # delete discovery or migration tracking data in the home region.
      def delete_home_region_control(
        control_id : String
      ) : Types::DeleteHomeRegionControlResult
        input = Types::DeleteHomeRegionControlRequest.new(control_id: control_id)
        delete_home_region_control(input)
      end
      def delete_home_region_control(input : Types::DeleteHomeRegionControlRequest) : Types::DeleteHomeRegionControlResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_HOME_REGION_CONTROL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteHomeRegionControlResult, "DeleteHomeRegionControl")
      end

      # This API permits filtering on the ControlId and HomeRegion fields.
      def describe_home_region_controls(
        control_id : String? = nil,
        home_region : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        target : Types::Target? = nil
      ) : Types::DescribeHomeRegionControlsResult
        input = Types::DescribeHomeRegionControlsRequest.new(control_id: control_id, home_region: home_region, max_results: max_results, next_token: next_token, target: target)
        describe_home_region_controls(input)
      end
      def describe_home_region_controls(input : Types::DescribeHomeRegionControlsRequest) : Types::DescribeHomeRegionControlsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HOME_REGION_CONTROLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHomeRegionControlsResult, "DescribeHomeRegionControls")
      end

      # Returns the calling account’s home region, if configured. This API is used by other AWS services to
      # determine the regional endpoint for calling AWS Application Discovery Service and Migration Hub. You
      # must call GetHomeRegion at least once before you call any other AWS Application Discovery Service
      # and AWS Migration Hub APIs, to obtain the account's Migration Hub home region.
      def get_home_region : Types::GetHomeRegionResult
        input = Types::GetHomeRegionRequest.new
        get_home_region(input)
      end
      def get_home_region(input : Types::GetHomeRegionRequest) : Types::GetHomeRegionResult
        request = Protocol::JsonRpc.build_request(Model::GET_HOME_REGION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetHomeRegionResult, "GetHomeRegion")
      end
    end
  end
end
