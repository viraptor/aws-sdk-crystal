module Aws
  module BCMDashboards
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a new dashboard that can contain multiple widgets displaying cost and usage data. You can
      # add custom widgets or use predefined widgets, arranging them in your preferred layout.

      def create_dashboard(
        name : String,
        widgets : Array(Types::Widget),
        description : String? = nil,
        resource_tags : Array(Types::ResourceTag)? = nil
      ) : Types::CreateDashboardResponse

        input = Types::CreateDashboardRequest.new(name: name, widgets: widgets, description: description, resource_tags: resource_tags)
        create_dashboard(input)
      end

      def create_dashboard(input : Types::CreateDashboardRequest) : Types::CreateDashboardResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DASHBOARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDashboardResponse, "CreateDashboard")
      end

      # Deletes a specified dashboard. This action cannot be undone.

      def delete_dashboard(
        arn : String
      ) : Types::DeleteDashboardResponse

        input = Types::DeleteDashboardRequest.new(arn: arn)
        delete_dashboard(input)
      end

      def delete_dashboard(input : Types::DeleteDashboardRequest) : Types::DeleteDashboardResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DASHBOARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDashboardResponse, "DeleteDashboard")
      end

      # Retrieves the configuration and metadata of a specified dashboard, including its widgets and layout
      # settings.

      def get_dashboard(
        arn : String
      ) : Types::GetDashboardResponse

        input = Types::GetDashboardRequest.new(arn: arn)
        get_dashboard(input)
      end

      def get_dashboard(input : Types::GetDashboardRequest) : Types::GetDashboardResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DASHBOARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDashboardResponse, "GetDashboard")
      end

      # Retrieves the resource-based policy attached to a dashboard, showing sharing configurations and
      # permissions.

      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyResponse

        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Types::GetResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePolicyResponse, "GetResourcePolicy")
      end

      # Returns a list of all dashboards in your account.

      def list_dashboards(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDashboardsResponse

        input = Types::ListDashboardsRequest.new(max_results: max_results, next_token: next_token)
        list_dashboards(input)
      end

      def list_dashboards(input : Types::ListDashboardsRequest) : Types::ListDashboardsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DASHBOARDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDashboardsResponse, "ListDashboards")
      end

      # Returns a list of all tags associated with a specified dashboard resource.

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

      # Adds or updates tags for a specified dashboard resource.

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

      # Removes specified tags from a dashboard resource.

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

      # Updates an existing dashboard's properties, including its name, description, and widget
      # configurations.

      def update_dashboard(
        arn : String,
        description : String? = nil,
        name : String? = nil,
        widgets : Array(Types::Widget)? = nil
      ) : Types::UpdateDashboardResponse

        input = Types::UpdateDashboardRequest.new(arn: arn, description: description, name: name, widgets: widgets)
        update_dashboard(input)
      end

      def update_dashboard(input : Types::UpdateDashboardRequest) : Types::UpdateDashboardResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DASHBOARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDashboardResponse, "UpdateDashboard")
      end
    end
  end
end
