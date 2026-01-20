module Aws
  module TimestreamWrite
    module Model
      API_VERSION = "2018-11-01"
      TARGET_PREFIX = "Timestream_20181101"
      SIGNING_NAME = "timestream"
      ENDPOINT_PREFIX = "ingest.timestream"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://timestream-ingest-fips.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://timestream-ingest.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://ingest.timestream-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://ingest.timestream.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://ingest.timestream-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://timestream-ingest.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://timestream-ingest.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://ingest.timestream.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ingest.timestream.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_BATCH_LOAD_TASK = OperationModel.new(
        name: "CreateBatchLoadTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATABASE = OperationModel.new(
        name: "CreateDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TABLE = OperationModel.new(
        name: "CreateTable",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATABASE = OperationModel.new(
        name: "DeleteDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TABLE = OperationModel.new(
        name: "DeleteTable",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BATCH_LOAD_TASK = OperationModel.new(
        name: "DescribeBatchLoadTask",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATABASE = OperationModel.new(
        name: "DescribeDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINTS = OperationModel.new(
        name: "DescribeEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TABLE = OperationModel.new(
        name: "DescribeTable",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BATCH_LOAD_TASKS = OperationModel.new(
        name: "ListBatchLoadTasks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATABASES = OperationModel.new(
        name: "ListDatabases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TABLES = OperationModel.new(
        name: "ListTables",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      RESUME_BATCH_LOAD_TASK = OperationModel.new(
        name: "ResumeBatchLoadTask",
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

      UPDATE_DATABASE = OperationModel.new(
        name: "UpdateDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TABLE = OperationModel.new(
        name: "UpdateTable",
        http_method: "POST",
        request_uri: "/"
      )

      WRITE_RECORDS = OperationModel.new(
        name: "WriteRecords",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
