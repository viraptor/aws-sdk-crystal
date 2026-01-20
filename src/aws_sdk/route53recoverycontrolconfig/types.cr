require "json"
require "time"

module AwsSdk
  module Route53RecoveryControlConfig
    module Types

      # 403 response - You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An assertion rule enforces that, when you change a routing control state, that the criteria that you
      # set in the rule configuration is met. Otherwise, the change to the routing control is not accepted.
      # For example, the criteria might be that at least one routing control state is On after the
      # transaction so that traffic continues to flow to at least one cell for the application. This ensures
      # that you avoid a fail-open scenario.

      struct AssertionRule
        include JSON::Serializable

        # The routing controls that are part of transactions that are evaluated to determine if a request to
        # change a routing control state is allowed. For example, you might include three routing controls,
        # one for each of three Amazon Web Services Regions.

        @[JSON::Field(key: "AssertedControls")]
        getter asserted_controls : Array(String)

        # The Amazon Resource Name (ARN) of the control panel.

        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String

        # Name of the assertion rule. You can use any non-white space character in the name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The criteria that you set for specific assertion routing controls (AssertedControls) that designate
        # how many routing control states must be ON as the result of a transaction. For example, if you have
        # three assertion routing controls, you might specify ATLEAST 2 for your rule configuration. This
        # means that at least two assertion routing control states must be ON, so that at least two Amazon Web
        # Services Regions have traffic flowing to them.

        @[JSON::Field(key: "RuleConfig")]
        getter rule_config : Types::RuleConfig

        # The Amazon Resource Name (ARN) of the assertion rule.

        @[JSON::Field(key: "SafetyRuleArn")]
        getter safety_rule_arn : String

        # The deployment status of an assertion rule. Status can be one of the following: PENDING, DEPLOYED,
        # PENDING_DELETION.

        @[JSON::Field(key: "Status")]
        getter status : String

        # An evaluation period, in milliseconds (ms), during which any request against the target routing
        # controls will fail. This helps prevent "flapping" of state. The wait period is 5000 ms by default,
        # but you can choose a custom value.

        @[JSON::Field(key: "WaitPeriodMs")]
        getter wait_period_ms : Int32

        # The Amazon Web Services account ID of the assertion rule owner.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        def initialize(
          @asserted_controls : Array(String),
          @control_panel_arn : String,
          @name : String,
          @rule_config : Types::RuleConfig,
          @safety_rule_arn : String,
          @status : String,
          @wait_period_ms : Int32,
          @owner : String? = nil
        )
        end
      end

      # An update to an assertion rule. You can update the name or the evaluation period (wait period). If
      # you don't specify one of the items to update, the item is unchanged.

      struct AssertionRuleUpdate
        include JSON::Serializable

        # The name of the assertion rule. You can use any non-white space character in the name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the assertion rule.

        @[JSON::Field(key: "SafetyRuleArn")]
        getter safety_rule_arn : String

        # An evaluation period, in milliseconds (ms), during which any request against the target routing
        # controls will fail. This helps prevent "flapping" of state. The wait period is 5000 ms by default,
        # but you can choose a custom value.

        @[JSON::Field(key: "WaitPeriodMs")]
        getter wait_period_ms : Int32

        def initialize(
          @name : String,
          @safety_rule_arn : String,
          @wait_period_ms : Int32
        )
        end
      end

      # A set of five redundant Regional endpoints against which you can execute API calls to update or get
      # the state of routing controls. You can host multiple control panels and routing controls on one
      # cluster.

      struct Cluster
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?

        # Endpoints for a cluster. Specify one of these endpoints when you want to set or retrieve a routing
        # control state in the cluster. To get or update the routing control state, see the Amazon Route 53
        # Application Recovery Controller Routing Control Actions.

        @[JSON::Field(key: "ClusterEndpoints")]
        getter cluster_endpoints : Array(Types::ClusterEndpoint)?

        # The name of the cluster.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The network-type can either be IPV4 or DUALSTACK.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The Amazon Web Services account ID of the cluster owner.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # Deployment status of a resource. Status can be one of the following: PENDING, DEPLOYED,
        # PENDING_DELETION.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @cluster_arn : String? = nil,
          @cluster_endpoints : Array(Types::ClusterEndpoint)? = nil,
          @name : String? = nil,
          @network_type : String? = nil,
          @owner : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A cluster endpoint. Specify an endpoint when you want to set or retrieve a routing control state in
      # the cluster.

      struct ClusterEndpoint
        include JSON::Serializable

        # A cluster endpoint. Specify an endpoint and Amazon Web Services Region when you want to set or
        # retrieve a routing control state in the cluster. To get or update the routing control state, see the
        # Amazon Route 53 Application Recovery Controller Routing Control Actions.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The Amazon Web Services Region for a cluster endpoint.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @endpoint : String? = nil,
          @region : String? = nil
        )
        end
      end

      # 409 response - ConflictException. You might be using a predefined variable.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A control panel represents a group of routing controls that can be changed together in a single
      # transaction.

      struct ControlPanel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster that includes the control panel.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the control panel.

        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String?

        # A flag that Amazon Route 53 Application Recovery Controller sets to true to designate the default
        # control panel for a cluster. When you create a cluster, Amazon Route 53 Application Recovery
        # Controller creates a control panel, and sets this flag for that control panel. If you create a
        # control panel yourself, this flag is set to false.

        @[JSON::Field(key: "DefaultControlPanel")]
        getter default_control_panel : Bool?

        # The name of the control panel. You can use any non-white space character in the name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID of the control panel owner.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The number of routing controls in the control panel.

        @[JSON::Field(key: "RoutingControlCount")]
        getter routing_control_count : Int32?

        # The deployment status of control panel. Status can be one of the following: PENDING, DEPLOYED,
        # PENDING_DELETION.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @cluster_arn : String? = nil,
          @control_panel_arn : String? = nil,
          @default_control_panel : Bool? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @routing_control_count : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # The properties of a request to create a cluster.

      struct CreateClusterRequest
        include JSON::Serializable

        # The name of the cluster.

        @[JSON::Field(key: "ClusterName")]
        getter cluster_name : String

        # A unique, case-sensitive string of up to 64 ASCII characters. To make an idempotent API request with
        # an action, specify a client token in the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The network-type is optional, and can either be IPV4 or DUALSTACK. The default is IPV4.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The tags associated with the cluster.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_name : String,
          @client_token : String? = nil,
          @network_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The result of a successful CreateCluster request.

      struct CreateClusterResponse
        include JSON::Serializable

        # The cluster that was created.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # A request to create a control panel.

      struct CreateControlPanelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster for the control panel.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String

        # The name of the control panel.

        @[JSON::Field(key: "ControlPanelName")]
        getter control_panel_name : String

        # A unique, case-sensitive string of up to 64 ASCII characters. To make an idempotent API request with
        # an action, specify a client token in the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The tags associated with the control panel.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cluster_arn : String,
          @control_panel_name : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The result of a successful CreateControlPanel request.

      struct CreateControlPanelResponse
        include JSON::Serializable

        # Information about a control panel.

        @[JSON::Field(key: "ControlPanel")]
        getter control_panel : Types::ControlPanel?

        def initialize(
          @control_panel : Types::ControlPanel? = nil
        )
        end
      end

      # A request to create a routing control. If you don't specify ControlPanelArn, Amazon Route 53
      # Application Recovery Controller creates the routing control in DefaultControlPanel.

      struct CreateRoutingControlRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster that includes the routing control.

        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String

        # The name of the routing control.

        @[JSON::Field(key: "RoutingControlName")]
        getter routing_control_name : String

        # A unique, case-sensitive string of up to 64 ASCII characters. To make an idempotent API request with
        # an action, specify a client token in the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the control panel that includes the routing control.

        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String?

        def initialize(
          @cluster_arn : String,
          @routing_control_name : String,
          @client_token : String? = nil,
          @control_panel_arn : String? = nil
        )
        end
      end

      # The result of a successful CreateRoutingControl request.

      struct CreateRoutingControlResponse
        include JSON::Serializable

        # The routing control that is created.

        @[JSON::Field(key: "RoutingControl")]
        getter routing_control : Types::RoutingControl?

        def initialize(
          @routing_control : Types::RoutingControl? = nil
        )
        end
      end

      # Request to create a safety rule. You can create either an assertion rule or a gating rule with a
      # CreateSafetyRuleRequest call.

      struct CreateSafetyRuleRequest
        include JSON::Serializable

        # The assertion rule requested.

        @[JSON::Field(key: "AssertionRule")]
        getter assertion_rule : Types::NewAssertionRule?

        # A unique, case-sensitive string of up to 64 ASCII characters. To make an idempotent API request with
        # an action, specify a client token in the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The gating rule requested.

        @[JSON::Field(key: "GatingRule")]
        getter gating_rule : Types::NewGatingRule?

        # The tags associated with the safety rule.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assertion_rule : Types::NewAssertionRule? = nil,
          @client_token : String? = nil,
          @gating_rule : Types::NewGatingRule? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The result of a successful CreateSafetyRule request.

      struct CreateSafetyRuleResponse
        include JSON::Serializable

        # The assertion rule created.

        @[JSON::Field(key: "AssertionRule")]
        getter assertion_rule : Types::AssertionRule?

        # The gating rule created.

        @[JSON::Field(key: "GatingRule")]
        getter gating_rule : Types::GatingRule?

        def initialize(
          @assertion_rule : Types::AssertionRule? = nil,
          @gating_rule : Types::GatingRule? = nil
        )
        end
      end


      struct DeleteClusterRequest
        include JSON::Serializable


        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end

      # A successful DeleteCluster request returns no response.

      struct DeleteClusterResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteControlPanelRequest
        include JSON::Serializable


        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String

        def initialize(
          @control_panel_arn : String
        )
        end
      end

      # A successful DeleteControlPanel request returns no response.

      struct DeleteControlPanelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRoutingControlRequest
        include JSON::Serializable


        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String

        def initialize(
          @routing_control_arn : String
        )
        end
      end

      # A successful DeleteRoutingControl request returns no response.

      struct DeleteRoutingControlResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSafetyRuleRequest
        include JSON::Serializable


        @[JSON::Field(key: "SafetyRuleArn")]
        getter safety_rule_arn : String

        def initialize(
          @safety_rule_arn : String
        )
        end
      end

      # There is an empty response when you delete a safety rule. /&gt;

      struct DeleteSafetyRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeClusterRequest
        include JSON::Serializable


        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String

        def initialize(
          @cluster_arn : String
        )
        end
      end

      # The result of a successful DescribeCluster request.

      struct DescribeClusterResponse
        include JSON::Serializable

        # The cluster for the DescribeCluster request.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end


      struct DescribeControlPanelRequest
        include JSON::Serializable


        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String

        def initialize(
          @control_panel_arn : String
        )
        end
      end

      # The result of a successful DescribeControlPanel request.

      struct DescribeControlPanelResponse
        include JSON::Serializable

        # Information about the control panel.

        @[JSON::Field(key: "ControlPanel")]
        getter control_panel : Types::ControlPanel?

        def initialize(
          @control_panel : Types::ControlPanel? = nil
        )
        end
      end


      struct DescribeRoutingControlRequest
        include JSON::Serializable


        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String

        def initialize(
          @routing_control_arn : String
        )
        end
      end

      # The result of a successful DescribeRoutingControl request.

      struct DescribeRoutingControlResponse
        include JSON::Serializable

        # Information about the routing control.

        @[JSON::Field(key: "RoutingControl")]
        getter routing_control : Types::RoutingControl?

        def initialize(
          @routing_control : Types::RoutingControl? = nil
        )
        end
      end


      struct DescribeSafetyRuleRequest
        include JSON::Serializable


        @[JSON::Field(key: "SafetyRuleArn")]
        getter safety_rule_arn : String

        def initialize(
          @safety_rule_arn : String
        )
        end
      end

      # The response when you send a DescribeSafetyRuleResponse request.

      struct DescribeSafetyRuleResponse
        include JSON::Serializable

        # The assertion rule in the response.

        @[JSON::Field(key: "AssertionRule")]
        getter assertion_rule : Types::AssertionRule?

        # The gating rule in the response.

        @[JSON::Field(key: "GatingRule")]
        getter gating_rule : Types::GatingRule?

        def initialize(
          @assertion_rule : Types::AssertionRule? = nil,
          @gating_rule : Types::GatingRule? = nil
        )
        end
      end

      # A gating rule verifies that a gating routing control or set of gating routing controls, evaluates as
      # true, based on a rule configuration that you specify, which allows a set of routing control state
      # changes to complete. For example, if you specify one gating routing control and you set the Type in
      # the rule configuration to OR, that indicates that you must set the gating routing control to On for
      # the rule to evaluate as true; that is, for the gating control "switch" to be "On". When you do that,
      # then you can update the routing control states for the target routing controls that you specify in
      # the gating rule.

      struct GatingRule
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control panel.

        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String

        # An array of gating routing control Amazon Resource Names (ARNs). For a simple "on/off" switch,
        # specify the ARN for one routing control. The gating routing controls are evaluated by the rule
        # configuration that you specify to determine if the target routing control states can be changed.

        @[JSON::Field(key: "GatingControls")]
        getter gating_controls : Array(String)

        # The name for the gating rule. You can use any non-white space character in the name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The criteria that you set for gating routing controls that designate how many of the routing control
        # states must be ON to allow you to update target routing control states.

        @[JSON::Field(key: "RuleConfig")]
        getter rule_config : Types::RuleConfig

        # The Amazon Resource Name (ARN) of the gating rule.

        @[JSON::Field(key: "SafetyRuleArn")]
        getter safety_rule_arn : String

        # The deployment status of a gating rule. Status can be one of the following: PENDING, DEPLOYED,
        # PENDING_DELETION.

        @[JSON::Field(key: "Status")]
        getter status : String

        # An array of target routing control Amazon Resource Names (ARNs) for which the states can only be
        # updated if the rule configuration that you specify evaluates to true for the gating routing control.
        # As a simple example, if you have a single gating control, it acts as an overall "on/off" switch for
        # a set of target routing controls. You can use this to manually override automated failover, for
        # example.

        @[JSON::Field(key: "TargetControls")]
        getter target_controls : Array(String)

        # An evaluation period, in milliseconds (ms), during which any request against the target routing
        # controls will fail. This helps prevent "flapping" of state. The wait period is 5000 ms by default,
        # but you can choose a custom value.

        @[JSON::Field(key: "WaitPeriodMs")]
        getter wait_period_ms : Int32

        # The Amazon Web Services account ID of the gating rule owner.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        def initialize(
          @control_panel_arn : String,
          @gating_controls : Array(String),
          @name : String,
          @rule_config : Types::RuleConfig,
          @safety_rule_arn : String,
          @status : String,
          @target_controls : Array(String),
          @wait_period_ms : Int32,
          @owner : String? = nil
        )
        end
      end

      # Update to a gating rule. You can update the name or the evaluation period (wait period). If you
      # don't specify one of the items to update, the item is unchanged.

      struct GatingRuleUpdate
        include JSON::Serializable

        # The name for the gating rule. You can use any non-white space character in the name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the gating rule.

        @[JSON::Field(key: "SafetyRuleArn")]
        getter safety_rule_arn : String

        # An evaluation period, in milliseconds (ms), during which any request against the target routing
        # controls will fail. This helps prevent "flapping" of state. The wait period is 5000 ms by default,
        # but you can choose a custom value.

        @[JSON::Field(key: "WaitPeriodMs")]
        getter wait_period_ms : Int32

        def initialize(
          @name : String,
          @safety_rule_arn : String,
          @wait_period_ms : Int32
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # Returns the current Amazon Resource Access Manager resource policy for a cluster.

      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The resource policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      # 500 response - InternalServiceError. Temporary service error. Retry the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListAssociatedRoute53HealthChecksRequest
        include JSON::Serializable


        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @routing_control_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a successful ListAssociatedRoute53HealthChecks request.

      struct ListAssociatedRoute53HealthChecksResponse
        include JSON::Serializable

        # Identifiers for the health checks.

        @[JSON::Field(key: "HealthCheckIds")]
        getter health_check_ids : Array(String)?

        # Next token for listing health checks.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @health_check_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClustersRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a successful ListClusters request.

      struct ListClustersResponse
        include JSON::Serializable

        # An array of the clusters in an account.

        @[JSON::Field(key: "Clusters")]
        getter clusters : Array(Types::Cluster)?

        # The token that identifies which batch of results you want to see.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(Types::Cluster)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlPanelsRequest
        include JSON::Serializable


        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cluster_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a successful ListControlPanel request.

      struct ListControlPanelsResponse
        include JSON::Serializable

        # The result of a successful ListControlPanel request.

        @[JSON::Field(key: "ControlPanels")]
        getter control_panels : Array(Types::ControlPanel)?

        # The token that identifies which batch of results you want to see.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @control_panels : Array(Types::ControlPanel)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRoutingControlsRequest
        include JSON::Serializable


        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @control_panel_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The result of a successful ListRoutingControl request.

      struct ListRoutingControlsResponse
        include JSON::Serializable

        # The token that identifies which batch of results you want to see.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of routing controls.

        @[JSON::Field(key: "RoutingControls")]
        getter routing_controls : Array(Types::RoutingControl)?

        def initialize(
          @next_token : String? = nil,
          @routing_controls : Array(Types::RoutingControl)? = nil
        )
        end
      end


      struct ListSafetyRulesRequest
        include JSON::Serializable


        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @control_panel_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response to a ListSafetyRulesRequest.

      struct ListSafetyRulesResponse
        include JSON::Serializable

        # The token that identifies which batch of results you want to see.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of safety rules in a control panel.

        @[JSON::Field(key: "SafetyRules")]
        getter safety_rules : Array(Types::Rule)?

        def initialize(
          @next_token : String? = nil,
          @safety_rules : Array(Types::Rule)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # The result of a successful ListTagsForResource request.

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A new assertion rule for a control panel.

      struct NewAssertionRule
        include JSON::Serializable

        # The routing controls that are part of transactions that are evaluated to determine if a request to
        # change a routing control state is allowed. For example, you might include three routing controls,
        # one for each of three Amazon Web Services Regions.

        @[JSON::Field(key: "AssertedControls")]
        getter asserted_controls : Array(String)

        # The Amazon Resource Name (ARN) for the control panel.

        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String

        # The name of the assertion rule. You can use any non-white space character in the name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The criteria that you set for specific assertion controls (routing controls) that designate how many
        # control states must be ON as the result of a transaction. For example, if you have three assertion
        # controls, you might specify ATLEAST 2 for your rule configuration. This means that at least two
        # assertion controls must be ON, so that at least two Amazon Web Services Regions have traffic flowing
        # to them.

        @[JSON::Field(key: "RuleConfig")]
        getter rule_config : Types::RuleConfig

        # An evaluation period, in milliseconds (ms), during which any request against the target routing
        # controls will fail. This helps prevent "flapping" of state. The wait period is 5000 ms by default,
        # but you can choose a custom value.

        @[JSON::Field(key: "WaitPeriodMs")]
        getter wait_period_ms : Int32

        def initialize(
          @asserted_controls : Array(String),
          @control_panel_arn : String,
          @name : String,
          @rule_config : Types::RuleConfig,
          @wait_period_ms : Int32
        )
        end
      end

      # A new gating rule for a control panel.

      struct NewGatingRule
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control panel.

        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String

        # The gating controls for the new gating rule. That is, routing controls that are evaluated by the
        # rule configuration that you specify.

        @[JSON::Field(key: "GatingControls")]
        getter gating_controls : Array(String)

        # The name for the new gating rule.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The criteria that you set for specific gating controls (routing controls) that designate how many
        # control states must be ON to allow you to change (set or unset) the target control states.

        @[JSON::Field(key: "RuleConfig")]
        getter rule_config : Types::RuleConfig

        # Routing controls that can only be set or unset if the specified RuleConfig evaluates to true for the
        # specified GatingControls. For example, say you have three gating controls, one for each of three
        # Amazon Web Services Regions. Now you specify ATLEAST 2 as your RuleConfig. With these settings, you
        # can only change (set or unset) the routing controls that you have specified as TargetControls if
        # that rule evaluates to true. In other words, your ability to change the routing controls that you
        # have specified as TargetControls is gated by the rule that you set for the routing controls in
        # GatingControls.

        @[JSON::Field(key: "TargetControls")]
        getter target_controls : Array(String)

        # An evaluation period, in milliseconds (ms), during which any request against the target routing
        # controls will fail. This helps prevent "flapping" of state. The wait period is 5000 ms by default,
        # but you can choose a custom value.

        @[JSON::Field(key: "WaitPeriodMs")]
        getter wait_period_ms : Int32

        def initialize(
          @control_panel_arn : String,
          @gating_controls : Array(String),
          @name : String,
          @rule_config : Types::RuleConfig,
          @target_controls : Array(String),
          @wait_period_ms : Int32
        )
        end
      end

      # 404 response - MalformedQueryString. The query string contains a syntax error or resource not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A routing control has one of two states: ON and OFF. You can map the routing control state to the
      # state of an Amazon Route 53 health check, which can be used to control traffic routing.

      struct RoutingControl
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control panel that includes the routing control.

        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String?

        # The name of the routing control.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID of the routing control owner.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The Amazon Resource Name (ARN) of the routing control.

        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String?

        # The deployment status of a routing control. Status can be one of the following: PENDING, DEPLOYED,
        # PENDING_DELETION.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @control_panel_arn : String? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @routing_control_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A safety rule. A safety rule can be an assertion rule or a gating rule.

      struct Rule
        include JSON::Serializable

        # An assertion rule enforces that, when a routing control state is changed, the criteria set by the
        # rule configuration is met. Otherwise, the change to the routing control state is not accepted. For
        # example, the criteria might be that at least one routing control state is On after the transaction
        # so that traffic continues to flow to at least one cell for the application. This ensures that you
        # avoid a fail-open scenario.

        @[JSON::Field(key: "ASSERTION")]
        getter assertion : Types::AssertionRule?

        # A gating rule verifies that a gating routing control or set of gating routing controls, evaluates as
        # true, based on a rule configuration that you specify, which allows a set of routing control state
        # changes to complete. For example, if you specify one gating routing control and you set the Type in
        # the rule configuration to OR, that indicates that you must set the gating routing control to On for
        # the rule to evaluate as true; that is, for the gating control "switch" to be "On". When you do that,
        # then you can update the routing control states for the target routing controls that you specify in
        # the gating rule.

        @[JSON::Field(key: "GATING")]
        getter gating : Types::GatingRule?

        def initialize(
          @assertion : Types::AssertionRule? = nil,
          @gating : Types::GatingRule? = nil
        )
        end
      end

      # The rule configuration for an assertion rule. That is, the criteria that you set for specific
      # assertion controls (routing controls) that specify how many control states must be ON after a
      # transaction completes.

      struct RuleConfig
        include JSON::Serializable

        # Logical negation of the rule. If the rule would usually evaluate true, it's evaluated as false, and
        # vice versa.

        @[JSON::Field(key: "Inverted")]
        getter inverted : Bool

        # The value of N, when you specify an ATLEAST rule type. That is, Threshold is the number of controls
        # that must be set when you specify an ATLEAST type.

        @[JSON::Field(key: "Threshold")]
        getter threshold : Int32

        # A rule can be one of the following: ATLEAST, AND, or OR.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @inverted : Bool,
          @threshold : Int32,
          @type : String
        )
        end
      end

      # 402 response - You attempted to create more resources than the service allows based on service
      # quotas.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Request to tag a resource.

      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags associated with the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The result of a successful TagResource request.

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # 429 response - LimitExceededException or TooManyRequestsException.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String


        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # The result of a successful UntagResource request.

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Updates an existing cluster.

      struct UpdateClusterRequest
        include JSON::Serializable


        @[JSON::Field(key: "ClusterArn")]
        getter cluster_arn : String

        # The network-type is required, and can either be IPV4 or DUALSTACK.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String

        def initialize(
          @cluster_arn : String,
          @network_type : String
        )
        end
      end

      # The result of a successful UpdateCluster request.

      struct UpdateClusterResponse
        include JSON::Serializable

        # The cluster that was updated.

        @[JSON::Field(key: "Cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      # Updates an existing control panel.

      struct UpdateControlPanelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control panel.

        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String

        # The name of the control panel.

        @[JSON::Field(key: "ControlPanelName")]
        getter control_panel_name : String

        def initialize(
          @control_panel_arn : String,
          @control_panel_name : String
        )
        end
      end

      # The result of a successful UpdateControlPanel request.

      struct UpdateControlPanelResponse
        include JSON::Serializable

        # The control panel to update.

        @[JSON::Field(key: "ControlPanel")]
        getter control_panel : Types::ControlPanel?

        def initialize(
          @control_panel : Types::ControlPanel? = nil
        )
        end
      end

      # A request to update a routing control.

      struct UpdateRoutingControlRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the routing control.

        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String

        # The name of the routing control.

        @[JSON::Field(key: "RoutingControlName")]
        getter routing_control_name : String

        def initialize(
          @routing_control_arn : String,
          @routing_control_name : String
        )
        end
      end

      # The result of a successful UpdateRoutingControl request.

      struct UpdateRoutingControlResponse
        include JSON::Serializable

        # The routing control that was updated.

        @[JSON::Field(key: "RoutingControl")]
        getter routing_control : Types::RoutingControl?

        def initialize(
          @routing_control : Types::RoutingControl? = nil
        )
        end
      end

      # Request to update a safety rule. A safety rule can be an assertion rule or a gating rule.

      struct UpdateSafetyRuleRequest
        include JSON::Serializable

        # The assertion rule to update.

        @[JSON::Field(key: "AssertionRuleUpdate")]
        getter assertion_rule_update : Types::AssertionRuleUpdate?

        # The gating rule to update.

        @[JSON::Field(key: "GatingRuleUpdate")]
        getter gating_rule_update : Types::GatingRuleUpdate?

        def initialize(
          @assertion_rule_update : Types::AssertionRuleUpdate? = nil,
          @gating_rule_update : Types::GatingRuleUpdate? = nil
        )
        end
      end

      # The result of a successful UpdateSafetyRule request.

      struct UpdateSafetyRuleResponse
        include JSON::Serializable

        # The assertion rule updated.

        @[JSON::Field(key: "AssertionRule")]
        getter assertion_rule : Types::AssertionRule?

        # The gating rule updated.

        @[JSON::Field(key: "GatingRule")]
        getter gating_rule : Types::GatingRule?

        def initialize(
          @assertion_rule : Types::AssertionRule? = nil,
          @gating_rule : Types::GatingRule? = nil
        )
        end
      end

      # 400 response - Multiple causes. For example, you might have a malformed query string and input
      # parameter might be out of range, or you might have used parameters together incorrectly.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
