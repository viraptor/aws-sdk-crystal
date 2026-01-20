module Aws
  module CloudHSM
    module Model
      API_VERSION = "2014-05-30"
      TARGET_PREFIX = "CloudHsmFrontendService"
      SIGNING_NAME = "cloudhsm"
      ENDPOINT_PREFIX = "cloudhsm"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudhsm-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudhsm-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudhsm.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://cloudhsm.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_TAGS_TO_RESOURCE = OperationModel.new(
        name: "AddTagsToResource",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HAPG = OperationModel.new(
        name: "CreateHapg",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HSM = OperationModel.new(
        name: "CreateHsm",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LUNA_CLIENT = OperationModel.new(
        name: "CreateLunaClient",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HAPG = OperationModel.new(
        name: "DeleteHapg",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HSM = OperationModel.new(
        name: "DeleteHsm",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LUNA_CLIENT = OperationModel.new(
        name: "DeleteLunaClient",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HAPG = OperationModel.new(
        name: "DescribeHapg",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HSM = OperationModel.new(
        name: "DescribeHsm",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LUNA_CLIENT = OperationModel.new(
        name: "DescribeLunaClient",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONFIG = OperationModel.new(
        name: "GetConfig",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AVAILABLE_ZONES = OperationModel.new(
        name: "ListAvailableZones",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HAPGS = OperationModel.new(
        name: "ListHapgs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HSMS = OperationModel.new(
        name: "ListHsms",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LUNA_CLIENTS = OperationModel.new(
        name: "ListLunaClients",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_HAPG = OperationModel.new(
        name: "ModifyHapg",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_HSM = OperationModel.new(
        name: "ModifyHsm",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_LUNA_CLIENT = OperationModel.new(
        name: "ModifyLunaClient",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_RESOURCE = OperationModel.new(
        name: "RemoveTagsFromResource",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
