module AwsSdk
  module Route53RecoveryControlConfig
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

      # Create a new cluster. A cluster is a set of redundant Regional endpoints against which you can run
      # API calls to update or get the state of one or more routing controls. Each cluster has a name,
      # status, Amazon Resource Name (ARN), and an array of the five cluster endpoints (one for each
      # supported Amazon Web Services Region) that you can use with API calls to the cluster data plane.

      def create_cluster(
        cluster_name : String,
        client_token : String? = nil,
        network_type : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateClusterRequest.new(cluster_name: cluster_name, client_token: client_token, network_type: network_type, tags: tags)
        create_cluster(input)
      end

      def create_cluster(input : Types::CreateClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new control panel. A control panel represents a group of routing controls that can be
      # changed together in a single transaction. You can use a control panel to centrally view the
      # operational status of applications across your organization, and trigger multi-app failovers in a
      # single transaction, for example, to fail over an Availability Zone or Amazon Web Services Region.

      def create_control_panel(
        cluster_arn : String,
        control_panel_name : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateControlPanelRequest.new(cluster_arn: cluster_arn, control_panel_name: control_panel_name, client_token: client_token, tags: tags)
        create_control_panel(input)
      end

      def create_control_panel(input : Types::CreateControlPanelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTROL_PANEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new routing control. A routing control has one of two states: ON and OFF. You can map the
      # routing control state to the state of an Amazon Route 53 health check, which can be used to control
      # traffic routing. To get or update the routing control state, see the Recovery Cluster (data plane)
      # API actions for Amazon Route 53 Application Recovery Controller.

      def create_routing_control(
        cluster_arn : String,
        routing_control_name : String,
        client_token : String? = nil,
        control_panel_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateRoutingControlRequest.new(cluster_arn: cluster_arn, routing_control_name: routing_control_name, client_token: client_token, control_panel_arn: control_panel_arn)
        create_routing_control(input)
      end

      def create_routing_control(input : Types::CreateRoutingControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTING_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a safety rule in a control panel. Safety rules let you add safeguards around changing
      # routing control states, and for enabling and disabling routing controls, to help prevent unexpected
      # outcomes. There are two types of safety rules: assertion rules and gating rules. Assertion rule: An
      # assertion rule enforces that, when you change a routing control state, that a certain criteria is
      # met. For example, the criteria might be that at least one routing control state is On after the
      # transaction so that traffic continues to flow to at least one cell for the application. This ensures
      # that you avoid a fail-open scenario. Gating rule: A gating rule lets you configure a gating routing
      # control as an overall "on/off" switch for a group of routing controls. Or, you can configure more
      # complex gating scenarios, for example by configuring multiple gating routing controls. For more
      # information, see Safety rules in the Amazon Route 53 Application Recovery Controller Developer
      # Guide.

      def create_safety_rule(
        assertion_rule : Types::NewAssertionRule? = nil,
        client_token : String? = nil,
        gating_rule : Types::NewGatingRule? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSafetyRuleRequest.new(assertion_rule: assertion_rule, client_token: client_token, gating_rule: gating_rule, tags: tags)
        create_safety_rule(input)
      end

      def create_safety_rule(input : Types::CreateSafetyRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SAFETY_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a cluster.

      def delete_cluster(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::DeleteClusterRequest.new(cluster_arn: cluster_arn)
        delete_cluster(input)
      end

      def delete_cluster(input : Types::DeleteClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a control panel.

      def delete_control_panel(
        control_panel_arn : String
      ) : Protocol::Request
        input = Types::DeleteControlPanelRequest.new(control_panel_arn: control_panel_arn)
        delete_control_panel(input)
      end

      def delete_control_panel(input : Types::DeleteControlPanelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTROL_PANEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a routing control.

      def delete_routing_control(
        routing_control_arn : String
      ) : Protocol::Request
        input = Types::DeleteRoutingControlRequest.new(routing_control_arn: routing_control_arn)
        delete_routing_control(input)
      end

      def delete_routing_control(input : Types::DeleteRoutingControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTING_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a safety rule. /&gt;

      def delete_safety_rule(
        safety_rule_arn : String
      ) : Protocol::Request
        input = Types::DeleteSafetyRuleRequest.new(safety_rule_arn: safety_rule_arn)
        delete_safety_rule(input)
      end

      def delete_safety_rule(input : Types::DeleteSafetyRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SAFETY_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Display the details about a cluster. The response includes the cluster name, endpoints, status, and
      # Amazon Resource Name (ARN).

      def describe_cluster(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::DescribeClusterRequest.new(cluster_arn: cluster_arn)
        describe_cluster(input)
      end

      def describe_cluster(input : Types::DescribeClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays details about a control panel.

      def describe_control_panel(
        control_panel_arn : String
      ) : Protocol::Request
        input = Types::DescribeControlPanelRequest.new(control_panel_arn: control_panel_arn)
        describe_control_panel(input)
      end

      def describe_control_panel(input : Types::DescribeControlPanelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONTROL_PANEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays details about a routing control. A routing control has one of two states: ON and OFF. You
      # can map the routing control state to the state of an Amazon Route 53 health check, which can be used
      # to control routing. To get or update the routing control state, see the Recovery Cluster (data
      # plane) API actions for Amazon Route 53 Application Recovery Controller.

      def describe_routing_control(
        routing_control_arn : String
      ) : Protocol::Request
        input = Types::DescribeRoutingControlRequest.new(routing_control_arn: routing_control_arn)
        describe_routing_control(input)
      end

      def describe_routing_control(input : Types::DescribeRoutingControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ROUTING_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a safety rule.

      def describe_safety_rule(
        safety_rule_arn : String
      ) : Protocol::Request
        input = Types::DescribeSafetyRuleRequest.new(safety_rule_arn: safety_rule_arn)
        describe_safety_rule(input)
      end

      def describe_safety_rule(input : Types::DescribeSafetyRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SAFETY_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about the resource policy for a cluster.

      def get_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array of all Amazon Route 53 health checks associated with a specific routing control.

      def list_associated_route53_health_checks(
        routing_control_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssociatedRoute53HealthChecksRequest.new(routing_control_arn: routing_control_arn, max_results: max_results, next_token: next_token)
        list_associated_route53_health_checks(input)
      end

      def list_associated_route53_health_checks(input : Types::ListAssociatedRoute53HealthChecksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSOCIATED_ROUTE53_HEALTH_CHECKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array of all the clusters in an account.

      def list_clusters(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClustersRequest.new(max_results: max_results, next_token: next_token)
        list_clusters(input)
      end

      def list_clusters(input : Types::ListClustersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array of control panels in an account or in a cluster.

      def list_control_panels(
        cluster_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListControlPanelsRequest.new(cluster_arn: cluster_arn, max_results: max_results, next_token: next_token)
        list_control_panels(input)
      end

      def list_control_panels(input : Types::ListControlPanelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTROL_PANELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array of routing controls for a control panel. A routing control is an Amazon Route 53
      # Application Recovery Controller construct that has one of two states: ON and OFF. You can map the
      # routing control state to the state of an Amazon Route 53 health check, which can be used to control
      # routing.

      def list_routing_controls(
        control_panel_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoutingControlsRequest.new(control_panel_arn: control_panel_arn, max_results: max_results, next_token: next_token)
        list_routing_controls(input)
      end

      def list_routing_controls(input : Types::ListRoutingControlsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTING_CONTROLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the safety rules (the assertion rules and gating rules) that you've defined for the routing
      # controls in a control panel.

      def list_safety_rules(
        control_panel_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSafetyRulesRequest.new(control_panel_arn: control_panel_arn, max_results: max_results, next_token: next_token)
        list_safety_rules(input)
      end

      def list_safety_rules(input : Types::ListSafetyRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SAFETY_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for a resource.

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

      # Adds a tag to a resource.

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

      # Removes a tag from a resource.

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

      # Updates a cluster. You can only update the network-type of a cluster.

      def update_cluster(
        cluster_arn : String,
        network_type : String
      ) : Protocol::Request
        input = Types::UpdateClusterRequest.new(cluster_arn: cluster_arn, network_type: network_type)
        update_cluster(input)
      end

      def update_cluster(input : Types::UpdateClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a control panel. The only update you can make to a control panel is to change the name of
      # the control panel.

      def update_control_panel(
        control_panel_arn : String,
        control_panel_name : String
      ) : Protocol::Request
        input = Types::UpdateControlPanelRequest.new(control_panel_arn: control_panel_arn, control_panel_name: control_panel_name)
        update_control_panel(input)
      end

      def update_control_panel(input : Types::UpdateControlPanelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTROL_PANEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a routing control. You can only update the name of the routing control. To get or update the
      # routing control state, see the Recovery Cluster (data plane) API actions for Amazon Route 53
      # Application Recovery Controller.

      def update_routing_control(
        routing_control_arn : String,
        routing_control_name : String
      ) : Protocol::Request
        input = Types::UpdateRoutingControlRequest.new(routing_control_arn: routing_control_arn, routing_control_name: routing_control_name)
        update_routing_control(input)
      end

      def update_routing_control(input : Types::UpdateRoutingControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTING_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a safety rule (an assertion rule or gating rule). You can only update the name and the
      # waiting period for a safety rule. To make other updates, delete the safety rule and create a new
      # one.

      def update_safety_rule(
        assertion_rule_update : Types::AssertionRuleUpdate? = nil,
        gating_rule_update : Types::GatingRuleUpdate? = nil
      ) : Protocol::Request
        input = Types::UpdateSafetyRuleRequest.new(assertion_rule_update: assertion_rule_update, gating_rule_update: gating_rule_update)
        update_safety_rule(input)
      end

      def update_safety_rule(input : Types::UpdateSafetyRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SAFETY_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
