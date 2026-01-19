module AwsSdk
  module ControlCatalog
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

      # Returns details about a specific control, most notably a list of Amazon Web Services Regions where
      # this control is supported. Input a value for the ControlArn parameter, in ARN form. GetControl
      # accepts controltower or controlcatalog control ARNs as input. Returns a controlcatalog ARN format.
      # In the API response, controls that have the value GLOBAL in the Scope field do not show the
      # DeployableRegions field, because it does not apply. Controls that have the value REGIONAL in the
      # Scope field return a value for the DeployableRegions field, as shown in the example.
      def get_control(
        control_arn : String
      ) : Protocol::Request
        input = Types::GetControlRequest.new(control_arn: control_arn)
        get_control(input)
      end
      def get_control(input : Types::GetControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of common controls from the Amazon Web Services Control Catalog. You can
      # apply an optional filter to see common controls that have a specific objective. If you don’t provide
      # a filter, the operation returns all common controls.
      def list_common_controls(
        common_control_filter : Types::CommonControlFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCommonControlsRequest.new(common_control_filter: common_control_filter, max_results: max_results, next_token: next_token)
        list_common_controls(input)
      end
      def list_common_controls(input : Types::ListCommonControlsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMMON_CONTROLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of control mappings from the Control Catalog. Control mappings show
      # relationships between controls and other entities, such as common controls or compliance frameworks.
      def list_control_mappings(
        filter : Types::ControlMappingFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListControlMappingsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_control_mappings(input)
      end
      def list_control_mappings(input : Types::ListControlMappingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTROL_MAPPINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of all available controls in the Control Catalog library. Allows you to
      # discover available controls. The list of controls is given as structures of type controlSummary .
      # The ARN is returned in the global controlcatalog format, as shown in the examples.
      def list_controls(
        filter : Types::ControlFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListControlsRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        list_controls(input)
      end
      def list_controls(input : Types::ListControlsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTROLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of domains from the Control Catalog.
      def list_domains(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainsRequest.new(max_results: max_results, next_token: next_token)
        list_domains(input)
      end
      def list_domains(input : Types::ListDomainsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of objectives from the Control Catalog. You can apply an optional filter to
      # see the objectives that belong to a specific domain. If you don’t provide a filter, the operation
      # returns all objectives.
      def list_objectives(
        max_results : Int32? = nil,
        next_token : String? = nil,
        objective_filter : Types::ObjectiveFilter? = nil
      ) : Protocol::Request
        input = Types::ListObjectivesRequest.new(max_results: max_results, next_token: next_token, objective_filter: objective_filter)
        list_objectives(input)
      end
      def list_objectives(input : Types::ListObjectivesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OBJECTIVES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
