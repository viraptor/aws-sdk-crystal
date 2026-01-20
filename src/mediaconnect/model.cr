module Aws
  module MediaConnect
    module Model
      API_VERSION = "2018-11-14"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mediaconnect"
      ENDPOINT_PREFIX = "mediaconnect"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediaconnect-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediaconnect-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediaconnect.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://mediaconnect.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_BRIDGE_OUTPUTS = OperationModel.new(
        name: "AddBridgeOutputs",
        http_method: "POST",
        request_uri: "/v1/bridges/{BridgeArn}/outputs"
      )

      ADD_BRIDGE_SOURCES = OperationModel.new(
        name: "AddBridgeSources",
        http_method: "POST",
        request_uri: "/v1/bridges/{BridgeArn}/sources"
      )

      ADD_FLOW_MEDIA_STREAMS = OperationModel.new(
        name: "AddFlowMediaStreams",
        http_method: "POST",
        request_uri: "/v1/flows/{FlowArn}/mediaStreams"
      )

      ADD_FLOW_OUTPUTS = OperationModel.new(
        name: "AddFlowOutputs",
        http_method: "POST",
        request_uri: "/v1/flows/{FlowArn}/outputs"
      )

      ADD_FLOW_SOURCES = OperationModel.new(
        name: "AddFlowSources",
        http_method: "POST",
        request_uri: "/v1/flows/{FlowArn}/source"
      )

      ADD_FLOW_VPC_INTERFACES = OperationModel.new(
        name: "AddFlowVpcInterfaces",
        http_method: "POST",
        request_uri: "/v1/flows/{FlowArn}/vpcInterfaces"
      )

      BATCH_GET_ROUTER_INPUT = OperationModel.new(
        name: "BatchGetRouterInput",
        http_method: "GET",
        request_uri: "/v1/routerInputs"
      )

      BATCH_GET_ROUTER_NETWORK_INTERFACE = OperationModel.new(
        name: "BatchGetRouterNetworkInterface",
        http_method: "GET",
        request_uri: "/v1/routerNetworkInterfaces"
      )

      BATCH_GET_ROUTER_OUTPUT = OperationModel.new(
        name: "BatchGetRouterOutput",
        http_method: "GET",
        request_uri: "/v1/routerOutputs"
      )

      CREATE_BRIDGE = OperationModel.new(
        name: "CreateBridge",
        http_method: "POST",
        request_uri: "/v1/bridges"
      )

      CREATE_FLOW = OperationModel.new(
        name: "CreateFlow",
        http_method: "POST",
        request_uri: "/v1/flows"
      )

      CREATE_GATEWAY = OperationModel.new(
        name: "CreateGateway",
        http_method: "POST",
        request_uri: "/v1/gateways"
      )

      CREATE_ROUTER_INPUT = OperationModel.new(
        name: "CreateRouterInput",
        http_method: "POST",
        request_uri: "/v1/routerInput"
      )

      CREATE_ROUTER_NETWORK_INTERFACE = OperationModel.new(
        name: "CreateRouterNetworkInterface",
        http_method: "POST",
        request_uri: "/v1/routerNetworkInterface"
      )

      CREATE_ROUTER_OUTPUT = OperationModel.new(
        name: "CreateRouterOutput",
        http_method: "POST",
        request_uri: "/v1/routerOutput"
      )

      DELETE_BRIDGE = OperationModel.new(
        name: "DeleteBridge",
        http_method: "DELETE",
        request_uri: "/v1/bridges/{BridgeArn}"
      )

      DELETE_FLOW = OperationModel.new(
        name: "DeleteFlow",
        http_method: "DELETE",
        request_uri: "/v1/flows/{FlowArn}"
      )

      DELETE_GATEWAY = OperationModel.new(
        name: "DeleteGateway",
        http_method: "DELETE",
        request_uri: "/v1/gateways/{GatewayArn}"
      )

      DELETE_ROUTER_INPUT = OperationModel.new(
        name: "DeleteRouterInput",
        http_method: "DELETE",
        request_uri: "/v1/routerInput/{Arn}"
      )

      DELETE_ROUTER_NETWORK_INTERFACE = OperationModel.new(
        name: "DeleteRouterNetworkInterface",
        http_method: "DELETE",
        request_uri: "/v1/routerNetworkInterface/{Arn}"
      )

      DELETE_ROUTER_OUTPUT = OperationModel.new(
        name: "DeleteRouterOutput",
        http_method: "DELETE",
        request_uri: "/v1/routerOutput/{Arn}"
      )

      DEREGISTER_GATEWAY_INSTANCE = OperationModel.new(
        name: "DeregisterGatewayInstance",
        http_method: "DELETE",
        request_uri: "/v1/gateway-instances/{GatewayInstanceArn}"
      )

      DESCRIBE_BRIDGE = OperationModel.new(
        name: "DescribeBridge",
        http_method: "GET",
        request_uri: "/v1/bridges/{BridgeArn}"
      )

      DESCRIBE_FLOW = OperationModel.new(
        name: "DescribeFlow",
        http_method: "GET",
        request_uri: "/v1/flows/{FlowArn}"
      )

      DESCRIBE_FLOW_SOURCE_METADATA = OperationModel.new(
        name: "DescribeFlowSourceMetadata",
        http_method: "GET",
        request_uri: "/v1/flows/{FlowArn}/source-metadata"
      )

      DESCRIBE_FLOW_SOURCE_THUMBNAIL = OperationModel.new(
        name: "DescribeFlowSourceThumbnail",
        http_method: "GET",
        request_uri: "/v1/flows/{FlowArn}/source-thumbnail"
      )

      DESCRIBE_GATEWAY = OperationModel.new(
        name: "DescribeGateway",
        http_method: "GET",
        request_uri: "/v1/gateways/{GatewayArn}"
      )

      DESCRIBE_GATEWAY_INSTANCE = OperationModel.new(
        name: "DescribeGatewayInstance",
        http_method: "GET",
        request_uri: "/v1/gateway-instances/{GatewayInstanceArn}"
      )

      DESCRIBE_OFFERING = OperationModel.new(
        name: "DescribeOffering",
        http_method: "GET",
        request_uri: "/v1/offerings/{OfferingArn}"
      )

      DESCRIBE_RESERVATION = OperationModel.new(
        name: "DescribeReservation",
        http_method: "GET",
        request_uri: "/v1/reservations/{ReservationArn}"
      )

      GET_ROUTER_INPUT = OperationModel.new(
        name: "GetRouterInput",
        http_method: "GET",
        request_uri: "/v1/routerInput/{Arn}"
      )

      GET_ROUTER_INPUT_SOURCE_METADATA = OperationModel.new(
        name: "GetRouterInputSourceMetadata",
        http_method: "GET",
        request_uri: "/v1/routerInput/{Arn}/source-metadata"
      )

      GET_ROUTER_INPUT_THUMBNAIL = OperationModel.new(
        name: "GetRouterInputThumbnail",
        http_method: "GET",
        request_uri: "/v1/routerInput/{Arn}/thumbnail"
      )

      GET_ROUTER_NETWORK_INTERFACE = OperationModel.new(
        name: "GetRouterNetworkInterface",
        http_method: "GET",
        request_uri: "/v1/routerNetworkInterface/{Arn}"
      )

      GET_ROUTER_OUTPUT = OperationModel.new(
        name: "GetRouterOutput",
        http_method: "GET",
        request_uri: "/v1/routerOutput/{Arn}"
      )

      GRANT_FLOW_ENTITLEMENTS = OperationModel.new(
        name: "GrantFlowEntitlements",
        http_method: "POST",
        request_uri: "/v1/flows/{FlowArn}/entitlements"
      )

      LIST_BRIDGES = OperationModel.new(
        name: "ListBridges",
        http_method: "GET",
        request_uri: "/v1/bridges"
      )

      LIST_ENTITLEMENTS = OperationModel.new(
        name: "ListEntitlements",
        http_method: "GET",
        request_uri: "/v1/entitlements"
      )

      LIST_FLOWS = OperationModel.new(
        name: "ListFlows",
        http_method: "GET",
        request_uri: "/v1/flows"
      )

      LIST_GATEWAY_INSTANCES = OperationModel.new(
        name: "ListGatewayInstances",
        http_method: "GET",
        request_uri: "/v1/gateway-instances"
      )

      LIST_GATEWAYS = OperationModel.new(
        name: "ListGateways",
        http_method: "GET",
        request_uri: "/v1/gateways"
      )

      LIST_OFFERINGS = OperationModel.new(
        name: "ListOfferings",
        http_method: "GET",
        request_uri: "/v1/offerings"
      )

      LIST_RESERVATIONS = OperationModel.new(
        name: "ListReservations",
        http_method: "GET",
        request_uri: "/v1/reservations"
      )

      LIST_ROUTER_INPUTS = OperationModel.new(
        name: "ListRouterInputs",
        http_method: "POST",
        request_uri: "/v1/routerInputs"
      )

      LIST_ROUTER_NETWORK_INTERFACES = OperationModel.new(
        name: "ListRouterNetworkInterfaces",
        http_method: "POST",
        request_uri: "/v1/routerNetworkInterfaces"
      )

      LIST_ROUTER_OUTPUTS = OperationModel.new(
        name: "ListRouterOutputs",
        http_method: "POST",
        request_uri: "/v1/routerOutputs"
      )

      LIST_TAGS_FOR_GLOBAL_RESOURCE = OperationModel.new(
        name: "ListTagsForGlobalResource",
        http_method: "GET",
        request_uri: "/tags/global/{ResourceArn}"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      PURCHASE_OFFERING = OperationModel.new(
        name: "PurchaseOffering",
        http_method: "POST",
        request_uri: "/v1/offerings/{OfferingArn}"
      )

      REMOVE_BRIDGE_OUTPUT = OperationModel.new(
        name: "RemoveBridgeOutput",
        http_method: "DELETE",
        request_uri: "/v1/bridges/{BridgeArn}/outputs/{OutputName}"
      )

      REMOVE_BRIDGE_SOURCE = OperationModel.new(
        name: "RemoveBridgeSource",
        http_method: "DELETE",
        request_uri: "/v1/bridges/{BridgeArn}/sources/{SourceName}"
      )

      REMOVE_FLOW_MEDIA_STREAM = OperationModel.new(
        name: "RemoveFlowMediaStream",
        http_method: "DELETE",
        request_uri: "/v1/flows/{FlowArn}/mediaStreams/{MediaStreamName}"
      )

      REMOVE_FLOW_OUTPUT = OperationModel.new(
        name: "RemoveFlowOutput",
        http_method: "DELETE",
        request_uri: "/v1/flows/{FlowArn}/outputs/{OutputArn}"
      )

      REMOVE_FLOW_SOURCE = OperationModel.new(
        name: "RemoveFlowSource",
        http_method: "DELETE",
        request_uri: "/v1/flows/{FlowArn}/source/{SourceArn}"
      )

      REMOVE_FLOW_VPC_INTERFACE = OperationModel.new(
        name: "RemoveFlowVpcInterface",
        http_method: "DELETE",
        request_uri: "/v1/flows/{FlowArn}/vpcInterfaces/{VpcInterfaceName}"
      )

      RESTART_ROUTER_INPUT = OperationModel.new(
        name: "RestartRouterInput",
        http_method: "POST",
        request_uri: "/v1/routerInput/restart/{Arn}"
      )

      RESTART_ROUTER_OUTPUT = OperationModel.new(
        name: "RestartRouterOutput",
        http_method: "POST",
        request_uri: "/v1/routerOutput/restart/{Arn}"
      )

      REVOKE_FLOW_ENTITLEMENT = OperationModel.new(
        name: "RevokeFlowEntitlement",
        http_method: "DELETE",
        request_uri: "/v1/flows/{FlowArn}/entitlements/{EntitlementArn}"
      )

      START_FLOW = OperationModel.new(
        name: "StartFlow",
        http_method: "POST",
        request_uri: "/v1/flows/start/{FlowArn}"
      )

      START_ROUTER_INPUT = OperationModel.new(
        name: "StartRouterInput",
        http_method: "POST",
        request_uri: "/v1/routerInput/start/{Arn}"
      )

      START_ROUTER_OUTPUT = OperationModel.new(
        name: "StartRouterOutput",
        http_method: "POST",
        request_uri: "/v1/routerOutput/start/{Arn}"
      )

      STOP_FLOW = OperationModel.new(
        name: "StopFlow",
        http_method: "POST",
        request_uri: "/v1/flows/stop/{FlowArn}"
      )

      STOP_ROUTER_INPUT = OperationModel.new(
        name: "StopRouterInput",
        http_method: "POST",
        request_uri: "/v1/routerInput/stop/{Arn}"
      )

      STOP_ROUTER_OUTPUT = OperationModel.new(
        name: "StopRouterOutput",
        http_method: "POST",
        request_uri: "/v1/routerOutput/stop/{Arn}"
      )

      TAG_GLOBAL_RESOURCE = OperationModel.new(
        name: "TagGlobalResource",
        http_method: "POST",
        request_uri: "/tags/global/{ResourceArn}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      TAKE_ROUTER_INPUT = OperationModel.new(
        name: "TakeRouterInput",
        http_method: "PUT",
        request_uri: "/v1/routerOutput/takeRouterInput/{RouterOutputArn}"
      )

      UNTAG_GLOBAL_RESOURCE = OperationModel.new(
        name: "UntagGlobalResource",
        http_method: "DELETE",
        request_uri: "/tags/global/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_BRIDGE = OperationModel.new(
        name: "UpdateBridge",
        http_method: "PUT",
        request_uri: "/v1/bridges/{BridgeArn}"
      )

      UPDATE_BRIDGE_OUTPUT = OperationModel.new(
        name: "UpdateBridgeOutput",
        http_method: "PUT",
        request_uri: "/v1/bridges/{BridgeArn}/outputs/{OutputName}"
      )

      UPDATE_BRIDGE_SOURCE = OperationModel.new(
        name: "UpdateBridgeSource",
        http_method: "PUT",
        request_uri: "/v1/bridges/{BridgeArn}/sources/{SourceName}"
      )

      UPDATE_BRIDGE_STATE = OperationModel.new(
        name: "UpdateBridgeState",
        http_method: "PUT",
        request_uri: "/v1/bridges/{BridgeArn}/state"
      )

      UPDATE_FLOW = OperationModel.new(
        name: "UpdateFlow",
        http_method: "PUT",
        request_uri: "/v1/flows/{FlowArn}"
      )

      UPDATE_FLOW_ENTITLEMENT = OperationModel.new(
        name: "UpdateFlowEntitlement",
        http_method: "PUT",
        request_uri: "/v1/flows/{FlowArn}/entitlements/{EntitlementArn}"
      )

      UPDATE_FLOW_MEDIA_STREAM = OperationModel.new(
        name: "UpdateFlowMediaStream",
        http_method: "PUT",
        request_uri: "/v1/flows/{FlowArn}/mediaStreams/{MediaStreamName}"
      )

      UPDATE_FLOW_OUTPUT = OperationModel.new(
        name: "UpdateFlowOutput",
        http_method: "PUT",
        request_uri: "/v1/flows/{FlowArn}/outputs/{OutputArn}"
      )

      UPDATE_FLOW_SOURCE = OperationModel.new(
        name: "UpdateFlowSource",
        http_method: "PUT",
        request_uri: "/v1/flows/{FlowArn}/source/{SourceArn}"
      )

      UPDATE_GATEWAY_INSTANCE = OperationModel.new(
        name: "UpdateGatewayInstance",
        http_method: "PUT",
        request_uri: "/v1/gateway-instances/{GatewayInstanceArn}"
      )

      UPDATE_ROUTER_INPUT = OperationModel.new(
        name: "UpdateRouterInput",
        http_method: "PUT",
        request_uri: "/v1/routerInput/{Arn}"
      )

      UPDATE_ROUTER_NETWORK_INTERFACE = OperationModel.new(
        name: "UpdateRouterNetworkInterface",
        http_method: "PUT",
        request_uri: "/v1/routerNetworkInterface/{Arn}"
      )

      UPDATE_ROUTER_OUTPUT = OperationModel.new(
        name: "UpdateRouterOutput",
        http_method: "PUT",
        request_uri: "/v1/routerOutput/{Arn}"
      )
    end
  end
end
