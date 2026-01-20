module Aws
  module Route53RecoveryCluster
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

      # Get the state for a routing control. A routing control is a simple on/off switch that you can use to
      # route traffic to cells. When a routing control state is set to ON, traffic flows to a cell. When the
      # state is set to OFF, traffic does not flow. Before you can create a routing control, you must first
      # create a cluster, and then host the control in a control panel on the cluster. For more information,
      # see Create routing control structures in the Amazon Route 53 Application Recovery Controller
      # Developer Guide. You access one of the endpoints for the cluster to get or update the routing
      # control state to redirect traffic for your application. You must specify Regional endpoints when you
      # work with API cluster operations to get or update routing control states in Route 53 ARC. To see a
      # code example for getting a routing control state, including accessing Regional cluster endpoints in
      # sequence, see API examples in the Amazon Route 53 Application Recovery Controller Developer Guide.
      # Learn more about working with routing controls in the following topics in the Amazon Route 53
      # Application Recovery Controller Developer Guide: Viewing and updating routing control states Working
      # with routing controls in Route 53 ARC

      def get_routing_control_state(
        routing_control_arn : String
      ) : Types::GetRoutingControlStateResponse

        input = Types::GetRoutingControlStateRequest.new(routing_control_arn: routing_control_arn)
        get_routing_control_state(input)
      end

      def get_routing_control_state(input : Types::GetRoutingControlStateRequest) : Types::GetRoutingControlStateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ROUTING_CONTROL_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRoutingControlStateResponse, "GetRoutingControlState")
      end

      # List routing control names and Amazon Resource Names (ARNs), as well as the routing control state
      # for each routing control, along with the control panel name and control panel ARN for the routing
      # controls. If you specify a control panel ARN, this call lists the routing controls in the control
      # panel. Otherwise, it lists all the routing controls in the cluster. A routing control is a simple
      # on/off switch in Route 53 ARC that you can use to route traffic to cells. When a routing control
      # state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow.
      # Before you can create a routing control, you must first create a cluster, and then host the control
      # in a control panel on the cluster. For more information, see Create routing control structures in
      # the Amazon Route 53 Application Recovery Controller Developer Guide. You access one of the endpoints
      # for the cluster to get or update the routing control state to redirect traffic for your application.
      # You must specify Regional endpoints when you work with API cluster operations to use this API
      # operation to list routing controls in Route 53 ARC. Learn more about working with routing controls
      # in the following topics in the Amazon Route 53 Application Recovery Controller Developer Guide:
      # Viewing and updating routing control states Working with routing controls in Route 53 ARC

      def list_routing_controls(
        control_panel_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRoutingControlsResponse

        input = Types::ListRoutingControlsRequest.new(control_panel_arn: control_panel_arn, max_results: max_results, next_token: next_token)
        list_routing_controls(input)
      end

      def list_routing_controls(input : Types::ListRoutingControlsRequest) : Types::ListRoutingControlsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ROUTING_CONTROLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRoutingControlsResponse, "ListRoutingControls")
      end

      # Set the state of the routing control to reroute traffic. You can set the value to ON or OFF. When
      # the state is ON, traffic flows to a cell. When the state is OFF, traffic does not flow. With Route
      # 53 ARC, you can add safety rules for routing controls, which are safeguards for routing control
      # state updates that help prevent unexpected outcomes, like fail open traffic routing. However, there
      # are scenarios when you might want to bypass the routing control safeguards that are enforced with
      # safety rules that you've configured. For example, you might want to fail over quickly for disaster
      # recovery, and one or more safety rules might be unexpectedly preventing you from updating a routing
      # control state to reroute traffic. In a "break glass" scenario like this, you can override one or
      # more safety rules to change a routing control state and fail over your application. The
      # SafetyRulesToOverride property enables you override one or more safety rules and update routing
      # control states. For more information, see Override safety rules to reroute traffic in the Amazon
      # Route 53 Application Recovery Controller Developer Guide. You must specify Regional endpoints when
      # you work with API cluster operations to get or update routing control states in Route 53 ARC. To see
      # a code example for getting a routing control state, including accessing Regional cluster endpoints
      # in sequence, see API examples in the Amazon Route 53 Application Recovery Controller Developer
      # Guide. Viewing and updating routing control states Working with routing controls overall

      def update_routing_control_state(
        routing_control_arn : String,
        routing_control_state : String,
        safety_rules_to_override : Array(String)? = nil
      ) : Types::UpdateRoutingControlStateResponse

        input = Types::UpdateRoutingControlStateRequest.new(routing_control_arn: routing_control_arn, routing_control_state: routing_control_state, safety_rules_to_override: safety_rules_to_override)
        update_routing_control_state(input)
      end

      def update_routing_control_state(input : Types::UpdateRoutingControlStateRequest) : Types::UpdateRoutingControlStateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ROUTING_CONTROL_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRoutingControlStateResponse, "UpdateRoutingControlState")
      end

      # Set multiple routing control states. You can set the value for each state to be ON or OFF. When the
      # state is ON, traffic flows to a cell. When it's OFF, traffic does not flow. With Route 53 ARC, you
      # can add safety rules for routing controls, which are safeguards for routing control state updates
      # that help prevent unexpected outcomes, like fail open traffic routing. However, there are scenarios
      # when you might want to bypass the routing control safeguards that are enforced with safety rules
      # that you've configured. For example, you might want to fail over quickly for disaster recovery, and
      # one or more safety rules might be unexpectedly preventing you from updating a routing control state
      # to reroute traffic. In a "break glass" scenario like this, you can override one or more safety rules
      # to change a routing control state and fail over your application. The SafetyRulesToOverride property
      # enables you override one or more safety rules and update routing control states. For more
      # information, see Override safety rules to reroute traffic in the Amazon Route 53 Application
      # Recovery Controller Developer Guide. You must specify Regional endpoints when you work with API
      # cluster operations to get or update routing control states in Route 53 ARC. To see a code example
      # for getting a routing control state, including accessing Regional cluster endpoints in sequence, see
      # API examples in the Amazon Route 53 Application Recovery Controller Developer Guide. Viewing and
      # updating routing control states Working with routing controls overall

      def update_routing_control_states(
        update_routing_control_state_entries : Array(Types::UpdateRoutingControlStateEntry),
        safety_rules_to_override : Array(String)? = nil
      ) : Types::UpdateRoutingControlStatesResponse

        input = Types::UpdateRoutingControlStatesRequest.new(update_routing_control_state_entries: update_routing_control_state_entries, safety_rules_to_override: safety_rules_to_override)
        update_routing_control_states(input)
      end

      def update_routing_control_states(input : Types::UpdateRoutingControlStatesRequest) : Types::UpdateRoutingControlStatesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ROUTING_CONTROL_STATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRoutingControlStatesResponse, "UpdateRoutingControlStates")
      end
    end
  end
end
