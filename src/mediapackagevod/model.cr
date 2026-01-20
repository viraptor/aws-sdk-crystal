module Aws
  module MediaPackageVod
    module Model
      API_VERSION = "2018-11-07"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mediapackage-vod"
      ENDPOINT_PREFIX = "mediapackage-vod"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackage-vod-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackage-vod-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackage-vod.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://mediapackage-vod.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CONFIGURE_LOGS = OperationModel.new(
        name: "ConfigureLogs",
        http_method: "PUT",
        request_uri: "/packaging_groups/{id}/configure_logs"
      )

      CREATE_ASSET = OperationModel.new(
        name: "CreateAsset",
        http_method: "POST",
        request_uri: "/assets"
      )

      CREATE_PACKAGING_CONFIGURATION = OperationModel.new(
        name: "CreatePackagingConfiguration",
        http_method: "POST",
        request_uri: "/packaging_configurations"
      )

      CREATE_PACKAGING_GROUP = OperationModel.new(
        name: "CreatePackagingGroup",
        http_method: "POST",
        request_uri: "/packaging_groups"
      )

      DELETE_ASSET = OperationModel.new(
        name: "DeleteAsset",
        http_method: "DELETE",
        request_uri: "/assets/{id}"
      )

      DELETE_PACKAGING_CONFIGURATION = OperationModel.new(
        name: "DeletePackagingConfiguration",
        http_method: "DELETE",
        request_uri: "/packaging_configurations/{id}"
      )

      DELETE_PACKAGING_GROUP = OperationModel.new(
        name: "DeletePackagingGroup",
        http_method: "DELETE",
        request_uri: "/packaging_groups/{id}"
      )

      DESCRIBE_ASSET = OperationModel.new(
        name: "DescribeAsset",
        http_method: "GET",
        request_uri: "/assets/{id}"
      )

      DESCRIBE_PACKAGING_CONFIGURATION = OperationModel.new(
        name: "DescribePackagingConfiguration",
        http_method: "GET",
        request_uri: "/packaging_configurations/{id}"
      )

      DESCRIBE_PACKAGING_GROUP = OperationModel.new(
        name: "DescribePackagingGroup",
        http_method: "GET",
        request_uri: "/packaging_groups/{id}"
      )

      LIST_ASSETS = OperationModel.new(
        name: "ListAssets",
        http_method: "GET",
        request_uri: "/assets"
      )

      LIST_PACKAGING_CONFIGURATIONS = OperationModel.new(
        name: "ListPackagingConfigurations",
        http_method: "GET",
        request_uri: "/packaging_configurations"
      )

      LIST_PACKAGING_GROUPS = OperationModel.new(
        name: "ListPackagingGroups",
        http_method: "GET",
        request_uri: "/packaging_groups"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resource-arn}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resource-arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resource-arn}"
      )

      UPDATE_PACKAGING_GROUP = OperationModel.new(
        name: "UpdatePackagingGroup",
        http_method: "PUT",
        request_uri: "/packaging_groups/{id}"
      )
    end
  end
end
