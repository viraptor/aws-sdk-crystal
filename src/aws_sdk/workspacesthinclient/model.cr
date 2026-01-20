module AwsSdk
  module WorkSpacesThinClient
    module Model
      API_VERSION = "2023-08-22"
      TARGET_PREFIX = ""
      SIGNING_NAME = "thinclient"
      ENDPOINT_PREFIX = "thinclient"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://thinclient-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://thinclient-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://thinclient.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://thinclient.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ENVIRONMENT = OperationModel.new(
        name: "CreateEnvironment",
        http_method: "POST",
        request_uri: "/environments"
      )

      DELETE_DEVICE = OperationModel.new(
        name: "DeleteDevice",
        http_method: "DELETE",
        request_uri: "/devices/{id}"
      )

      DELETE_ENVIRONMENT = OperationModel.new(
        name: "DeleteEnvironment",
        http_method: "DELETE",
        request_uri: "/environments/{id}"
      )

      DEREGISTER_DEVICE = OperationModel.new(
        name: "DeregisterDevice",
        http_method: "POST",
        request_uri: "/deregister-device/{id}"
      )

      GET_DEVICE = OperationModel.new(
        name: "GetDevice",
        http_method: "GET",
        request_uri: "/devices/{id}"
      )

      GET_ENVIRONMENT = OperationModel.new(
        name: "GetEnvironment",
        http_method: "GET",
        request_uri: "/environments/{id}"
      )

      GET_SOFTWARE_SET = OperationModel.new(
        name: "GetSoftwareSet",
        http_method: "GET",
        request_uri: "/softwaresets/{id}"
      )

      LIST_DEVICES = OperationModel.new(
        name: "ListDevices",
        http_method: "GET",
        request_uri: "/devices"
      )

      LIST_ENVIRONMENTS = OperationModel.new(
        name: "ListEnvironments",
        http_method: "GET",
        request_uri: "/environments"
      )

      LIST_SOFTWARE_SETS = OperationModel.new(
        name: "ListSoftwareSets",
        http_method: "GET",
        request_uri: "/softwaresets"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
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

      UPDATE_DEVICE = OperationModel.new(
        name: "UpdateDevice",
        http_method: "PATCH",
        request_uri: "/devices/{id}"
      )

      UPDATE_ENVIRONMENT = OperationModel.new(
        name: "UpdateEnvironment",
        http_method: "PATCH",
        request_uri: "/environments/{id}"
      )

      UPDATE_SOFTWARE_SET = OperationModel.new(
        name: "UpdateSoftwareSet",
        http_method: "PATCH",
        request_uri: "/softwaresets/{id}"
      )
    end
  end
end
