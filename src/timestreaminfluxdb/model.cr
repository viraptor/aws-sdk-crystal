module Aws
  module TimestreamInfluxDB
    module Model
      API_VERSION = "2023-01-27"
      TARGET_PREFIX = "AmazonTimestreamInfluxDB"
      SIGNING_NAME = "timestream-influxdb"
      ENDPOINT_PREFIX = "timestream-influxdb"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://timestream-influxdb-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://timestream-influxdb-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://timestream-influxdb.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://timestream-influxdb.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_DB_CLUSTER = OperationModel.new(
        name: "CreateDbCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DB_INSTANCE = OperationModel.new(
        name: "CreateDbInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DB_PARAMETER_GROUP = OperationModel.new(
        name: "CreateDbParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DB_CLUSTER = OperationModel.new(
        name: "DeleteDbCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DB_INSTANCE = OperationModel.new(
        name: "DeleteDbInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DB_CLUSTER = OperationModel.new(
        name: "GetDbCluster",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DB_INSTANCE = OperationModel.new(
        name: "GetDbInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DB_PARAMETER_GROUP = OperationModel.new(
        name: "GetDbParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DB_CLUSTERS = OperationModel.new(
        name: "ListDbClusters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DB_INSTANCES = OperationModel.new(
        name: "ListDbInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DB_INSTANCES_FOR_CLUSTER = OperationModel.new(
        name: "ListDbInstancesForCluster",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DB_PARAMETER_GROUPS = OperationModel.new(
        name: "ListDbParameterGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_DB_CLUSTER = OperationModel.new(
        name: "RebootDbCluster",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_DB_INSTANCE = OperationModel.new(
        name: "RebootDbInstance",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DB_CLUSTER = OperationModel.new(
        name: "UpdateDbCluster",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DB_INSTANCE = OperationModel.new(
        name: "UpdateDbInstance",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
