module AwsSdk
  module KinesisAnalyticsV2
    module Model
      API_VERSION = "2018-05-23"
      TARGET_PREFIX = "KinesisAnalytics_20180523"
      SIGNING_NAME = "kinesisanalytics"
      ENDPOINT_PREFIX = "kinesisanalytics"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kinesisanalytics-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kinesisanalytics-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kinesisanalytics.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://kinesisanalytics.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_APPLICATION_CLOUD_WATCH_LOGGING_OPTION = OperationModel.new(
        name: "AddApplicationCloudWatchLoggingOption",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_APPLICATION_INPUT = OperationModel.new(
        name: "AddApplicationInput",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_APPLICATION_INPUT_PROCESSING_CONFIGURATION = OperationModel.new(
        name: "AddApplicationInputProcessingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_APPLICATION_OUTPUT = OperationModel.new(
        name: "AddApplicationOutput",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_APPLICATION_REFERENCE_DATA_SOURCE = OperationModel.new(
        name: "AddApplicationReferenceDataSource",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_APPLICATION_VPC_CONFIGURATION = OperationModel.new(
        name: "AddApplicationVpcConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION_PRESIGNED_URL = OperationModel.new(
        name: "CreateApplicationPresignedUrl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION_SNAPSHOT = OperationModel.new(
        name: "CreateApplicationSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_CLOUD_WATCH_LOGGING_OPTION = OperationModel.new(
        name: "DeleteApplicationCloudWatchLoggingOption",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_INPUT_PROCESSING_CONFIGURATION = OperationModel.new(
        name: "DeleteApplicationInputProcessingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_OUTPUT = OperationModel.new(
        name: "DeleteApplicationOutput",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_REFERENCE_DATA_SOURCE = OperationModel.new(
        name: "DeleteApplicationReferenceDataSource",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_SNAPSHOT = OperationModel.new(
        name: "DeleteApplicationSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_VPC_CONFIGURATION = OperationModel.new(
        name: "DeleteApplicationVpcConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION = OperationModel.new(
        name: "DescribeApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION_OPERATION = OperationModel.new(
        name: "DescribeApplicationOperation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION_SNAPSHOT = OperationModel.new(
        name: "DescribeApplicationSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION_VERSION = OperationModel.new(
        name: "DescribeApplicationVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DISCOVER_INPUT_SCHEMA = OperationModel.new(
        name: "DiscoverInputSchema",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_OPERATIONS = OperationModel.new(
        name: "ListApplicationOperations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_SNAPSHOTS = OperationModel.new(
        name: "ListApplicationSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_VERSIONS = OperationModel.new(
        name: "ListApplicationVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      ROLLBACK_APPLICATION = OperationModel.new(
        name: "RollbackApplication",
        http_method: "POST",
        request_uri: "/"
      )

      START_APPLICATION = OperationModel.new(
        name: "StartApplication",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_APPLICATION = OperationModel.new(
        name: "StopApplication",
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

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPLICATION_MAINTENANCE_CONFIGURATION = OperationModel.new(
        name: "UpdateApplicationMaintenanceConfiguration",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
