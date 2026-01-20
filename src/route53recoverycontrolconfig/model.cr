module Aws
  module Route53RecoveryControlConfig
    module Model
      API_VERSION = "2020-11-02"
      TARGET_PREFIX = ""
      SIGNING_NAME = "route53-recovery-control-config"
      ENDPOINT_PREFIX = "route53-recovery-control-config"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53-recovery-control-config.us-west-2.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-west-2"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://arc-recovery-control-config.us-west-2.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-west-2"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53-recovery-control-config-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53-recovery-control-config-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53-recovery-control-config.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://route53-recovery-control-config.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/cluster"
      )

      CREATE_CONTROL_PANEL = OperationModel.new(
        name: "CreateControlPanel",
        http_method: "POST",
        request_uri: "/controlpanel"
      )

      CREATE_ROUTING_CONTROL = OperationModel.new(
        name: "CreateRoutingControl",
        http_method: "POST",
        request_uri: "/routingcontrol"
      )

      CREATE_SAFETY_RULE = OperationModel.new(
        name: "CreateSafetyRule",
        http_method: "POST",
        request_uri: "/safetyrule"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "DELETE",
        request_uri: "/cluster/{ClusterArn}"
      )

      DELETE_CONTROL_PANEL = OperationModel.new(
        name: "DeleteControlPanel",
        http_method: "DELETE",
        request_uri: "/controlpanel/{ControlPanelArn}"
      )

      DELETE_ROUTING_CONTROL = OperationModel.new(
        name: "DeleteRoutingControl",
        http_method: "DELETE",
        request_uri: "/routingcontrol/{RoutingControlArn}"
      )

      DELETE_SAFETY_RULE = OperationModel.new(
        name: "DeleteSafetyRule",
        http_method: "DELETE",
        request_uri: "/safetyrule/{SafetyRuleArn}"
      )

      DESCRIBE_CLUSTER = OperationModel.new(
        name: "DescribeCluster",
        http_method: "GET",
        request_uri: "/cluster/{ClusterArn}"
      )

      DESCRIBE_CONTROL_PANEL = OperationModel.new(
        name: "DescribeControlPanel",
        http_method: "GET",
        request_uri: "/controlpanel/{ControlPanelArn}"
      )

      DESCRIBE_ROUTING_CONTROL = OperationModel.new(
        name: "DescribeRoutingControl",
        http_method: "GET",
        request_uri: "/routingcontrol/{RoutingControlArn}"
      )

      DESCRIBE_SAFETY_RULE = OperationModel.new(
        name: "DescribeSafetyRule",
        http_method: "GET",
        request_uri: "/safetyrule/{SafetyRuleArn}"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "GET",
        request_uri: "/resourcePolicy/{ResourceArn}"
      )

      LIST_ASSOCIATED_ROUTE53_HEALTH_CHECKS = OperationModel.new(
        name: "ListAssociatedRoute53HealthChecks",
        http_method: "GET",
        request_uri: "/routingcontrol/{RoutingControlArn}/associatedRoute53HealthChecks"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "GET",
        request_uri: "/cluster"
      )

      LIST_CONTROL_PANELS = OperationModel.new(
        name: "ListControlPanels",
        http_method: "GET",
        request_uri: "/controlpanels"
      )

      LIST_ROUTING_CONTROLS = OperationModel.new(
        name: "ListRoutingControls",
        http_method: "GET",
        request_uri: "/controlpanel/{ControlPanelArn}/routingcontrols"
      )

      LIST_SAFETY_RULES = OperationModel.new(
        name: "ListSafetyRules",
        http_method: "GET",
        request_uri: "/controlpanel/{ControlPanelArn}/safetyrules"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_CLUSTER = OperationModel.new(
        name: "UpdateCluster",
        http_method: "PUT",
        request_uri: "/cluster"
      )

      UPDATE_CONTROL_PANEL = OperationModel.new(
        name: "UpdateControlPanel",
        http_method: "PUT",
        request_uri: "/controlpanel"
      )

      UPDATE_ROUTING_CONTROL = OperationModel.new(
        name: "UpdateRoutingControl",
        http_method: "PUT",
        request_uri: "/routingcontrol"
      )

      UPDATE_SAFETY_RULE = OperationModel.new(
        name: "UpdateSafetyRule",
        http_method: "PUT",
        request_uri: "/safetyrule"
      )
    end
  end
end
