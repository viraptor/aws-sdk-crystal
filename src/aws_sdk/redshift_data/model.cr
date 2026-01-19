module AwsSdk
  module RedshiftData
    module Model
      API_VERSION = "2019-12-20"
      TARGET_PREFIX = "RedshiftData"
      SIGNING_NAME = "redshift-data"
      ENDPOINT_PREFIX = "redshift-data"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://redshift-data-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://redshift-data-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://redshift-data.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://redshift-data.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_EXECUTE_STATEMENT = OperationModel.new(
        name: "BatchExecuteStatement",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_STATEMENT = OperationModel.new(
        name: "CancelStatement",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STATEMENT = OperationModel.new(
        name: "DescribeStatement",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TABLE = OperationModel.new(
        name: "DescribeTable",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_STATEMENT = OperationModel.new(
        name: "ExecuteStatement",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STATEMENT_RESULT = OperationModel.new(
        name: "GetStatementResult",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STATEMENT_RESULT_V2 = OperationModel.new(
        name: "GetStatementResultV2",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATABASES = OperationModel.new(
        name: "ListDatabases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SCHEMAS = OperationModel.new(
        name: "ListSchemas",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STATEMENTS = OperationModel.new(
        name: "ListStatements",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TABLES = OperationModel.new(
        name: "ListTables",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
