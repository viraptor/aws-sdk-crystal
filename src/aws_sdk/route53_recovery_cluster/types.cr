require "json"

module AwsSdk
  module Route53RecoveryCluster
    module Types

      # You don't have sufficient permissions to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # There was a conflict with this request. Try again.
      struct ConflictException
        include JSON::Serializable

        # Description of the ConflictException error
        @[JSON::Field(key: "message")]
        getter message : String

        # Identifier of the resource in use
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of the resource in use
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The cluster endpoint isn't available. Try another cluster endpoint.
      struct EndpointTemporarilyUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct GetRoutingControlStateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the routing control that you want to get the state for.
        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String

        def initialize(
          @routing_control_arn : String
        )
        end
      end

      struct GetRoutingControlStateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the response.
        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String

        # The state of the routing control.
        @[JSON::Field(key: "RoutingControlState")]
        getter routing_control_state : String

        # The routing control name.
        @[JSON::Field(key: "RoutingControlName")]
        getter routing_control_name : String?

        def initialize(
          @routing_control_arn : String,
          @routing_control_state : String,
          @routing_control_name : String? = nil
        )
        end
      end

      # There was an unexpected error during processing of the request.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct ListRoutingControlsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control panel of the routing controls to list.
        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String?

        # The number of routing controls objects that you want to return with this call. The default value is
        # 500.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @control_panel_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRoutingControlsResponse
        include JSON::Serializable

        # The list of routing controls.
        @[JSON::Field(key: "RoutingControls")]
        getter routing_controls : Array(Types::RoutingControl)

        # The token for the next set of results. You receive this token from a previous call.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @routing_controls : Array(Types::RoutingControl),
          @next_token : String? = nil
        )
        end
      end

      # The request references a routing control or control panel that was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # Hypothetical resource identifier that was not found
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Hypothetical resource type that was not found
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # A routing control, which is a simple on/off switch that you can use to route traffic to cells. When
      # a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic
      # does not flow.
      struct RoutingControl
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control panel where the routing control is located.
        @[JSON::Field(key: "ControlPanelArn")]
        getter control_panel_arn : String?

        # The name of the control panel where the routing control is located. Only ASCII characters are
        # supported for control panel names.
        @[JSON::Field(key: "ControlPanelName")]
        getter control_panel_name : String?

        # The Amazon Web Services account ID of the routing control owner.
        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The Amazon Resource Name (ARN) of the routing control.
        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String?

        # The name of the routing control.
        @[JSON::Field(key: "RoutingControlName")]
        getter routing_control_name : String?

        # The current state of the routing control. When a routing control state is set to ON, traffic flows
        # to a cell. When the state is set to OFF, traffic does not flow.
        @[JSON::Field(key: "RoutingControlState")]
        getter routing_control_state : String?

        def initialize(
          @control_panel_arn : String? = nil,
          @control_panel_name : String? = nil,
          @owner : String? = nil,
          @routing_control_arn : String? = nil,
          @routing_control_name : String? = nil,
          @routing_control_state : String? = nil
        )
        end
      end

      # The request can't update that many routing control states at the same time. Try again with fewer
      # routing control states.
      struct ServiceLimitExceededException
        include JSON::Serializable

        # The code of the limit that was exceeded.
        @[JSON::Field(key: "limitCode")]
        getter limit_code : String

        @[JSON::Field(key: "message")]
        getter message : String

        # The service code of the limit that was exceeded.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The resource identifier of the limit that was exceeded.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The resource type of the limit that was exceeded.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @limit_code : String,
          @message : String,
          @service_code : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The request was denied because of request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # A routing control state entry.
      struct UpdateRoutingControlStateEntry
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for a routing control state entry.
        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String

        # The routing control state in a set of routing control state entries.
        @[JSON::Field(key: "RoutingControlState")]
        getter routing_control_state : String

        def initialize(
          @routing_control_arn : String,
          @routing_control_state : String
        )
        end
      end

      struct UpdateRoutingControlStateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the routing control that you want to update the state for.
        @[JSON::Field(key: "RoutingControlArn")]
        getter routing_control_arn : String

        # The state of the routing control. You can set the value to ON or OFF.
        @[JSON::Field(key: "RoutingControlState")]
        getter routing_control_state : String

        # The Amazon Resource Names (ARNs) for the safety rules that you want to override when you're updating
        # the state of a routing control. You can override one safety rule or multiple safety rules by
        # including one or more ARNs, separated by commas. For more information, see Override safety rules to
        # reroute traffic in the Amazon Route 53 Application Recovery Controller Developer Guide.
        @[JSON::Field(key: "SafetyRulesToOverride")]
        getter safety_rules_to_override : Array(String)?

        def initialize(
          @routing_control_arn : String,
          @routing_control_state : String,
          @safety_rules_to_override : Array(String)? = nil
        )
        end
      end

      struct UpdateRoutingControlStateResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateRoutingControlStatesRequest
        include JSON::Serializable

        # A set of routing control entries that you want to update.
        @[JSON::Field(key: "UpdateRoutingControlStateEntries")]
        getter update_routing_control_state_entries : Array(Types::UpdateRoutingControlStateEntry)

        # The Amazon Resource Names (ARNs) for the safety rules that you want to override when you're updating
        # routing control states. You can override one safety rule or multiple safety rules by including one
        # or more ARNs, separated by commas. For more information, see Override safety rules to reroute
        # traffic in the Amazon Route 53 Application Recovery Controller Developer Guide.
        @[JSON::Field(key: "SafetyRulesToOverride")]
        getter safety_rules_to_override : Array(String)?

        def initialize(
          @update_routing_control_state_entries : Array(Types::UpdateRoutingControlStateEntry),
          @safety_rules_to_override : Array(String)? = nil
        )
        end
      end

      struct UpdateRoutingControlStatesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # There was a validation error on the request.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # There was a validation error on the request.
      struct ValidationExceptionField
        include JSON::Serializable

        # Information about the validation exception.
        @[JSON::Field(key: "message")]
        getter message : String

        # The field that had the validation exception.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
