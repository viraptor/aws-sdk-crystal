module Aws
  module RTBFabric
    module Model
      API_VERSION = "2023-05-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "rtbfabric"
      ENDPOINT_PREFIX = "rtbfabric"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rtbfabric-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rtbfabric-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rtbfabric.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://rtbfabric.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_LINK = OperationModel.new(
        name: "AcceptLink",
        http_method: "POST",
        request_uri: "/gateway/{gatewayId}/link/{linkId}/accept"
      )

      CREATE_INBOUND_EXTERNAL_LINK = OperationModel.new(
        name: "CreateInboundExternalLink",
        http_method: "POST",
        request_uri: "/responder-gateway/{gatewayId}/inbound-external-link"
      )

      CREATE_LINK = OperationModel.new(
        name: "CreateLink",
        http_method: "POST",
        request_uri: "/gateway/{gatewayId}/create-link"
      )

      CREATE_OUTBOUND_EXTERNAL_LINK = OperationModel.new(
        name: "CreateOutboundExternalLink",
        http_method: "POST",
        request_uri: "/requester-gateway/{gatewayId}/outbound-external-link"
      )

      CREATE_REQUESTER_GATEWAY = OperationModel.new(
        name: "CreateRequesterGateway",
        http_method: "POST",
        request_uri: "/requester-gateway"
      )

      CREATE_RESPONDER_GATEWAY = OperationModel.new(
        name: "CreateResponderGateway",
        http_method: "POST",
        request_uri: "/responder-gateway"
      )

      DELETE_INBOUND_EXTERNAL_LINK = OperationModel.new(
        name: "DeleteInboundExternalLink",
        http_method: "DELETE",
        request_uri: "/responder-gateway/{gatewayId}/inbound-external-link/{linkId}"
      )

      DELETE_LINK = OperationModel.new(
        name: "DeleteLink",
        http_method: "DELETE",
        request_uri: "/gateway/{gatewayId}/link/{linkId}"
      )

      DELETE_OUTBOUND_EXTERNAL_LINK = OperationModel.new(
        name: "DeleteOutboundExternalLink",
        http_method: "DELETE",
        request_uri: "/requester-gateway/{gatewayId}/outbound-external-link/{linkId}"
      )

      DELETE_REQUESTER_GATEWAY = OperationModel.new(
        name: "DeleteRequesterGateway",
        http_method: "DELETE",
        request_uri: "/requester-gateway/{gatewayId}"
      )

      DELETE_RESPONDER_GATEWAY = OperationModel.new(
        name: "DeleteResponderGateway",
        http_method: "DELETE",
        request_uri: "/responder-gateway/{gatewayId}"
      )

      GET_INBOUND_EXTERNAL_LINK = OperationModel.new(
        name: "GetInboundExternalLink",
        http_method: "GET",
        request_uri: "/responder-gateway/{gatewayId}/inbound-external-link/{linkId}"
      )

      GET_LINK = OperationModel.new(
        name: "GetLink",
        http_method: "GET",
        request_uri: "/gateway/{gatewayId}/link/{linkId}"
      )

      GET_OUTBOUND_EXTERNAL_LINK = OperationModel.new(
        name: "GetOutboundExternalLink",
        http_method: "GET",
        request_uri: "/requester-gateway/{gatewayId}/outbound-external-link/{linkId}"
      )

      GET_REQUESTER_GATEWAY = OperationModel.new(
        name: "GetRequesterGateway",
        http_method: "GET",
        request_uri: "/requester-gateway/{gatewayId}"
      )

      GET_RESPONDER_GATEWAY = OperationModel.new(
        name: "GetResponderGateway",
        http_method: "GET",
        request_uri: "/responder-gateway/{gatewayId}"
      )

      LIST_LINKS = OperationModel.new(
        name: "ListLinks",
        http_method: "GET",
        request_uri: "/gateway/{gatewayId}/links/"
      )

      LIST_REQUESTER_GATEWAYS = OperationModel.new(
        name: "ListRequesterGateways",
        http_method: "GET",
        request_uri: "/requester-gateways"
      )

      LIST_RESPONDER_GATEWAYS = OperationModel.new(
        name: "ListResponderGateways",
        http_method: "GET",
        request_uri: "/responder-gateways"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      REJECT_LINK = OperationModel.new(
        name: "RejectLink",
        http_method: "POST",
        request_uri: "/gateway/{gatewayId}/link/{linkId}/reject"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_LINK = OperationModel.new(
        name: "UpdateLink",
        http_method: "PATCH",
        request_uri: "/gateway/{gatewayId}/link/{linkId}"
      )

      UPDATE_LINK_MODULE_FLOW = OperationModel.new(
        name: "UpdateLinkModuleFlow",
        http_method: "POST",
        request_uri: "/gateway/{gatewayId}/link/{linkId}/module-flow"
      )

      UPDATE_REQUESTER_GATEWAY = OperationModel.new(
        name: "UpdateRequesterGateway",
        http_method: "POST",
        request_uri: "/requester-gateway/{gatewayId}/update"
      )

      UPDATE_RESPONDER_GATEWAY = OperationModel.new(
        name: "UpdateResponderGateway",
        http_method: "POST",
        request_uri: "/responder-gateway/{gatewayId}/update"
      )
    end
  end
end
