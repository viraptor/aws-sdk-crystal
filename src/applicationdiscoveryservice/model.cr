module Aws
  module ApplicationDiscoveryService
    module Model
      API_VERSION = "2015-11-01"
      TARGET_PREFIX = "AWSPoseidonService_V2015_11_01"
      SIGNING_NAME = "discovery"
      ENDPOINT_PREFIX = "discovery"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://discovery-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://discovery-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://discovery.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://discovery.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_CONFIGURATION_ITEMS_TO_APPLICATION = OperationModel.new(
        name: "AssociateConfigurationItemsToApplication",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_AGENTS = OperationModel.new(
        name: "BatchDeleteAgents",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_IMPORT_DATA = OperationModel.new(
        name: "BatchDeleteImportData",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TAGS = OperationModel.new(
        name: "CreateTags",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATIONS = OperationModel.new(
        name: "DeleteApplications",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AGENTS = OperationModel.new(
        name: "DescribeAgents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BATCH_DELETE_CONFIGURATION_TASK = OperationModel.new(
        name: "DescribeBatchDeleteConfigurationTask",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATIONS = OperationModel.new(
        name: "DescribeConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONTINUOUS_EXPORTS = OperationModel.new(
        name: "DescribeContinuousExports",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPORT_CONFIGURATIONS = OperationModel.new(
        name: "DescribeExportConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPORT_TASKS = OperationModel.new(
        name: "DescribeExportTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMPORT_TASKS = OperationModel.new(
        name: "DescribeImportTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_CONFIGURATION_ITEMS_FROM_APPLICATION = OperationModel.new(
        name: "DisassociateConfigurationItemsFromApplication",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_CONFIGURATIONS = OperationModel.new(
        name: "ExportConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISCOVERY_SUMMARY = OperationModel.new(
        name: "GetDiscoverySummary",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONFIGURATIONS = OperationModel.new(
        name: "ListConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVER_NEIGHBORS = OperationModel.new(
        name: "ListServerNeighbors",
        http_method: "POST",
        request_uri: "/"
      )

      START_BATCH_DELETE_CONFIGURATION_TASK = OperationModel.new(
        name: "StartBatchDeleteConfigurationTask",
        http_method: "POST",
        request_uri: "/"
      )

      START_CONTINUOUS_EXPORT = OperationModel.new(
        name: "StartContinuousExport",
        http_method: "POST",
        request_uri: "/"
      )

      START_DATA_COLLECTION_BY_AGENT_IDS = OperationModel.new(
        name: "StartDataCollectionByAgentIds",
        http_method: "POST",
        request_uri: "/"
      )

      START_EXPORT_TASK = OperationModel.new(
        name: "StartExportTask",
        http_method: "POST",
        request_uri: "/"
      )

      START_IMPORT_TASK = OperationModel.new(
        name: "StartImportTask",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_CONTINUOUS_EXPORT = OperationModel.new(
        name: "StopContinuousExport",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_DATA_COLLECTION_BY_AGENT_IDS = OperationModel.new(
        name: "StopDataCollectionByAgentIds",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
