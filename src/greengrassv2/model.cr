module Aws
  module GreengrassV2
    module Model
      API_VERSION = "2020-11-30"
      TARGET_PREFIX = ""
      SIGNING_NAME = "greengrass"
      ENDPOINT_PREFIX = "greengrass"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://greengrass-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-east-1"]}],"endpoint":{"url":"https://greengrass.us-gov-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://greengrass.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://greengrass-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://greengrass.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"dataplane-us-gov-east-1"]}],"endpoint":{"url":"https://greengrass-ats.iot.us-gov-east-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"greengrass","signingRegion":"us-gov-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"dataplane-us-gov-west-1"]}],"endpoint":{"url":"https://greengrass-ats.iot.us-gov-west-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"greengrass","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://greengrass.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_SERVICE_ROLE_TO_ACCOUNT = OperationModel.new(
        name: "AssociateServiceRoleToAccount",
        http_method: "PUT",
        request_uri: "/greengrass/servicerole"
      )

      BATCH_ASSOCIATE_CLIENT_DEVICE_WITH_CORE_DEVICE = OperationModel.new(
        name: "BatchAssociateClientDeviceWithCoreDevice",
        http_method: "POST",
        request_uri: "/greengrass/v2/coreDevices/{coreDeviceThingName}/associateClientDevices"
      )

      BATCH_DISASSOCIATE_CLIENT_DEVICE_FROM_CORE_DEVICE = OperationModel.new(
        name: "BatchDisassociateClientDeviceFromCoreDevice",
        http_method: "POST",
        request_uri: "/greengrass/v2/coreDevices/{coreDeviceThingName}/disassociateClientDevices"
      )

      CANCEL_DEPLOYMENT = OperationModel.new(
        name: "CancelDeployment",
        http_method: "POST",
        request_uri: "/greengrass/v2/deployments/{deploymentId}/cancel"
      )

      CREATE_COMPONENT_VERSION = OperationModel.new(
        name: "CreateComponentVersion",
        http_method: "POST",
        request_uri: "/greengrass/v2/createComponentVersion"
      )

      CREATE_DEPLOYMENT = OperationModel.new(
        name: "CreateDeployment",
        http_method: "POST",
        request_uri: "/greengrass/v2/deployments"
      )

      DELETE_COMPONENT = OperationModel.new(
        name: "DeleteComponent",
        http_method: "DELETE",
        request_uri: "/greengrass/v2/components/{arn}"
      )

      DELETE_CORE_DEVICE = OperationModel.new(
        name: "DeleteCoreDevice",
        http_method: "DELETE",
        request_uri: "/greengrass/v2/coreDevices/{coreDeviceThingName}"
      )

      DELETE_DEPLOYMENT = OperationModel.new(
        name: "DeleteDeployment",
        http_method: "DELETE",
        request_uri: "/greengrass/v2/deployments/{deploymentId}"
      )

      DESCRIBE_COMPONENT = OperationModel.new(
        name: "DescribeComponent",
        http_method: "GET",
        request_uri: "/greengrass/v2/components/{arn}/metadata"
      )

      DISASSOCIATE_SERVICE_ROLE_FROM_ACCOUNT = OperationModel.new(
        name: "DisassociateServiceRoleFromAccount",
        http_method: "DELETE",
        request_uri: "/greengrass/servicerole"
      )

      GET_COMPONENT = OperationModel.new(
        name: "GetComponent",
        http_method: "GET",
        request_uri: "/greengrass/v2/components/{arn}"
      )

      GET_COMPONENT_VERSION_ARTIFACT = OperationModel.new(
        name: "GetComponentVersionArtifact",
        http_method: "GET",
        request_uri: "/greengrass/v2/components/{arn}/artifacts/{artifactName+}"
      )

      GET_CONNECTIVITY_INFO = OperationModel.new(
        name: "GetConnectivityInfo",
        http_method: "GET",
        request_uri: "/greengrass/things/{thingName}/connectivityInfo"
      )

      GET_CORE_DEVICE = OperationModel.new(
        name: "GetCoreDevice",
        http_method: "GET",
        request_uri: "/greengrass/v2/coreDevices/{coreDeviceThingName}"
      )

      GET_DEPLOYMENT = OperationModel.new(
        name: "GetDeployment",
        http_method: "GET",
        request_uri: "/greengrass/v2/deployments/{deploymentId}"
      )

      GET_SERVICE_ROLE_FOR_ACCOUNT = OperationModel.new(
        name: "GetServiceRoleForAccount",
        http_method: "GET",
        request_uri: "/greengrass/servicerole"
      )

      LIST_CLIENT_DEVICES_ASSOCIATED_WITH_CORE_DEVICE = OperationModel.new(
        name: "ListClientDevicesAssociatedWithCoreDevice",
        http_method: "GET",
        request_uri: "/greengrass/v2/coreDevices/{coreDeviceThingName}/associatedClientDevices"
      )

      LIST_COMPONENT_VERSIONS = OperationModel.new(
        name: "ListComponentVersions",
        http_method: "GET",
        request_uri: "/greengrass/v2/components/{arn}/versions"
      )

      LIST_COMPONENTS = OperationModel.new(
        name: "ListComponents",
        http_method: "GET",
        request_uri: "/greengrass/v2/components"
      )

      LIST_CORE_DEVICES = OperationModel.new(
        name: "ListCoreDevices",
        http_method: "GET",
        request_uri: "/greengrass/v2/coreDevices"
      )

      LIST_DEPLOYMENTS = OperationModel.new(
        name: "ListDeployments",
        http_method: "GET",
        request_uri: "/greengrass/v2/deployments"
      )

      LIST_EFFECTIVE_DEPLOYMENTS = OperationModel.new(
        name: "ListEffectiveDeployments",
        http_method: "GET",
        request_uri: "/greengrass/v2/coreDevices/{coreDeviceThingName}/effectiveDeployments"
      )

      LIST_INSTALLED_COMPONENTS = OperationModel.new(
        name: "ListInstalledComponents",
        http_method: "GET",
        request_uri: "/greengrass/v2/coreDevices/{coreDeviceThingName}/installedComponents"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      RESOLVE_COMPONENT_CANDIDATES = OperationModel.new(
        name: "ResolveComponentCandidates",
        http_method: "POST",
        request_uri: "/greengrass/v2/resolveComponentCandidates"
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

      UPDATE_CONNECTIVITY_INFO = OperationModel.new(
        name: "UpdateConnectivityInfo",
        http_method: "PUT",
        request_uri: "/greengrass/things/{thingName}/connectivityInfo"
      )
    end
  end
end
