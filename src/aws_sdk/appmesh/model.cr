module AwsSdk
  module AppMesh
    module Model
      API_VERSION = "2019-01-25"
      TARGET_PREFIX = ""
      SIGNING_NAME = "appmesh"
      ENDPOINT_PREFIX = "appmesh"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appmesh-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appmesh-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appmesh.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://appmesh.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_GATEWAY_ROUTE = OperationModel.new(
        name: "CreateGatewayRoute",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateway/{virtualGatewayName}/gatewayRoutes"
      )

      CREATE_MESH = OperationModel.new(
        name: "CreateMesh",
        http_method: "PUT",
        request_uri: "/v20190125/meshes"
      )

      CREATE_ROUTE = OperationModel.new(
        name: "CreateRoute",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes"
      )

      CREATE_VIRTUAL_GATEWAY = OperationModel.new(
        name: "CreateVirtualGateway",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateways"
      )

      CREATE_VIRTUAL_NODE = OperationModel.new(
        name: "CreateVirtualNode",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualNodes"
      )

      CREATE_VIRTUAL_ROUTER = OperationModel.new(
        name: "CreateVirtualRouter",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouters"
      )

      CREATE_VIRTUAL_SERVICE = OperationModel.new(
        name: "CreateVirtualService",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualServices"
      )

      DELETE_GATEWAY_ROUTE = OperationModel.new(
        name: "DeleteGatewayRoute",
        http_method: "DELETE",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateway/{virtualGatewayName}/gatewayRoutes/{gatewayRouteName}"
      )

      DELETE_MESH = OperationModel.new(
        name: "DeleteMesh",
        http_method: "DELETE",
        request_uri: "/v20190125/meshes/{meshName}"
      )

      DELETE_ROUTE = OperationModel.new(
        name: "DeleteRoute",
        http_method: "DELETE",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}"
      )

      DELETE_VIRTUAL_GATEWAY = OperationModel.new(
        name: "DeleteVirtualGateway",
        http_method: "DELETE",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateways/{virtualGatewayName}"
      )

      DELETE_VIRTUAL_NODE = OperationModel.new(
        name: "DeleteVirtualNode",
        http_method: "DELETE",
        request_uri: "/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}"
      )

      DELETE_VIRTUAL_ROUTER = OperationModel.new(
        name: "DeleteVirtualRouter",
        http_method: "DELETE",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}"
      )

      DELETE_VIRTUAL_SERVICE = OperationModel.new(
        name: "DeleteVirtualService",
        http_method: "DELETE",
        request_uri: "/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}"
      )

      DESCRIBE_GATEWAY_ROUTE = OperationModel.new(
        name: "DescribeGatewayRoute",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateway/{virtualGatewayName}/gatewayRoutes/{gatewayRouteName}"
      )

      DESCRIBE_MESH = OperationModel.new(
        name: "DescribeMesh",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}"
      )

      DESCRIBE_ROUTE = OperationModel.new(
        name: "DescribeRoute",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}"
      )

      DESCRIBE_VIRTUAL_GATEWAY = OperationModel.new(
        name: "DescribeVirtualGateway",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateways/{virtualGatewayName}"
      )

      DESCRIBE_VIRTUAL_NODE = OperationModel.new(
        name: "DescribeVirtualNode",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}"
      )

      DESCRIBE_VIRTUAL_ROUTER = OperationModel.new(
        name: "DescribeVirtualRouter",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}"
      )

      DESCRIBE_VIRTUAL_SERVICE = OperationModel.new(
        name: "DescribeVirtualService",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}"
      )

      LIST_GATEWAY_ROUTES = OperationModel.new(
        name: "ListGatewayRoutes",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateway/{virtualGatewayName}/gatewayRoutes"
      )

      LIST_MESHES = OperationModel.new(
        name: "ListMeshes",
        http_method: "GET",
        request_uri: "/v20190125/meshes"
      )

      LIST_ROUTES = OperationModel.new(
        name: "ListRoutes",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v20190125/tags"
      )

      LIST_VIRTUAL_GATEWAYS = OperationModel.new(
        name: "ListVirtualGateways",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateways"
      )

      LIST_VIRTUAL_NODES = OperationModel.new(
        name: "ListVirtualNodes",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualNodes"
      )

      LIST_VIRTUAL_ROUTERS = OperationModel.new(
        name: "ListVirtualRouters",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouters"
      )

      LIST_VIRTUAL_SERVICES = OperationModel.new(
        name: "ListVirtualServices",
        http_method: "GET",
        request_uri: "/v20190125/meshes/{meshName}/virtualServices"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "PUT",
        request_uri: "/v20190125/tag"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "PUT",
        request_uri: "/v20190125/untag"
      )

      UPDATE_GATEWAY_ROUTE = OperationModel.new(
        name: "UpdateGatewayRoute",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateway/{virtualGatewayName}/gatewayRoutes/{gatewayRouteName}"
      )

      UPDATE_MESH = OperationModel.new(
        name: "UpdateMesh",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}"
      )

      UPDATE_ROUTE = OperationModel.new(
        name: "UpdateRoute",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}"
      )

      UPDATE_VIRTUAL_GATEWAY = OperationModel.new(
        name: "UpdateVirtualGateway",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualGateways/{virtualGatewayName}"
      )

      UPDATE_VIRTUAL_NODE = OperationModel.new(
        name: "UpdateVirtualNode",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}"
      )

      UPDATE_VIRTUAL_ROUTER = OperationModel.new(
        name: "UpdateVirtualRouter",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}"
      )

      UPDATE_VIRTUAL_SERVICE = OperationModel.new(
        name: "UpdateVirtualService",
        http_method: "PUT",
        request_uri: "/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}"
      )
    end
  end
end
