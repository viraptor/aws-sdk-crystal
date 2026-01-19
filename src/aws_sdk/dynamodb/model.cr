module AwsSdk
  module DynamoDB
    module Model
      API_VERSION = "2012-08-10"
      TARGET_PREFIX = "DynamoDB_20120810"
      SIGNING_NAME = "dynamodb"
      ENDPOINT_PREFIX = "dynamodb"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"AccountId":{"builtIn":"AWS::Auth::AccountId","required":false,"documentation":"The AWS AccountId used for the request.","type":"string"},"AccountIdEndpointMode":{"builtIn":"AWS::Auth::AccountIdEndpointMode","required":false,"documentation":"The AccountId Endpoint Mode.","type":"string"},"ResourceArn":{"required":false,"documentation":"ResourceArn containing arn of resource","type":"string"},"ResourceArnList":{"required":false,"documentation":"ResourceArnList containing list of resource arns","type":"stringArray"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"isSet","argv":[{"ref":"Region"}]},{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Endpoint"},"https://dynamodb.{Region}.{PartitionResult#dualStackDnsSuffix}"]}],"error":"Endpoint override is not supported for dual-stack endpoints. Please enable dual-stack functionality by enabling the configuration. For more details, see: https://docs.aws.amazon.com/sdkref/latest/guide/feature-endpoints.html","type":"error"},{"conditions":[],"endpoint":{"url":"{Endpoint}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":"{Endpoint}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"local"]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and local endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and local endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":"http://localhost:8000","properties":{"authSchemes":[{"name":"sigv4","signingName":"dynamodb","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]},{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]},true]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"required"]}],"rules":[{"conditions":[],"error":"Invalid Configuration: AccountIdEndpointMode is required and FIPS is enabled, but FIPS account endpoints are not supported","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://dynamodb-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"required"]}],"rules":[{"conditions":[],"error":"Invalid Configuration: AccountIdEndpointMode is required and FIPS is enabled, but FIPS account endpoints are not supported","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://dynamodb.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"required"]}],"rules":[{"conditions":[],"error":"Invalid Configuration: AccountIdEndpointMode is required and FIPS is enabled, but FIPS account endpoints are not supported","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://dynamodb-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]},true]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"disabled"]}]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"not","argv":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}]},{"fn":"isSet","argv":[{"ref":"ResourceArn"}]},{"fn":"aws.parseArn","argv":[{"ref":"ResourceArn"}],"assign":"ParsedArn"},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"service"]},"dynamodb"]},{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"region"]},false]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"region"]},"{Region}"]},{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"accountId"]},false]}],"endpoint":{"url":"https://{ParsedArn#accountId}.ddb.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{"metricValues":["O"]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"disabled"]}]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"not","argv":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}]},{"fn":"isSet","argv":[{"ref":"ResourceArnList"}]},{"fn":"getAttr","argv":[{"ref":"ResourceArnList"},"[0]"],"assign":"FirstArn"},{"fn":"aws.parseArn","argv":[{"ref":"FirstArn"}],"assign":"ParsedArn"},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"service"]},"dynamodb"]},{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"region"]},false]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"region"]},"{Region}"]},{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"accountId"]},false]}],"endpoint":{"url":"https://{ParsedArn#accountId}.ddb.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{"metricValues":["O"]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"disabled"]}]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"not","argv":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}]},{"fn":"isSet","argv":[{"ref":"AccountId"}]}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"ref":"AccountId"},false]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{AccountId}.ddb.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{"metricValues":["O"]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Credentials-sourced account ID parameter is invalid","type":"error"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"required"]}],"rules":[{"conditions":[{"fn":"not","argv":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}],"rules":[{"conditions":[],"error":"AccountIdEndpointMode is required but no AccountID was provided or able to be loaded","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: AccountIdEndpointMode is required but account endpoints are not supported in this partition","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: AccountIdEndpointMode is required and FIPS is enabled, but FIPS account endpoints are not supported","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://dynamodb.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"disabled"]}]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"not","argv":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}]},{"fn":"isSet","argv":[{"ref":"ResourceArn"}]},{"fn":"aws.parseArn","argv":[{"ref":"ResourceArn"}],"assign":"ParsedArn"},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"service"]},"dynamodb"]},{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"region"]},false]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"region"]},"{Region}"]},{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"accountId"]},false]}],"endpoint":{"url":"https://{ParsedArn#accountId}.ddb.{Region}.{PartitionResult#dnsSuffix}","properties":{"metricValues":["O"]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"disabled"]}]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"not","argv":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}]},{"fn":"isSet","argv":[{"ref":"ResourceArnList"}]},{"fn":"getAttr","argv":[{"ref":"ResourceArnList"},"[0]"],"assign":"FirstArn"},{"fn":"aws.parseArn","argv":[{"ref":"FirstArn"}],"assign":"ParsedArn"},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"service"]},"dynamodb"]},{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"region"]},false]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"region"]},"{Region}"]},{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"ParsedArn"},"accountId"]},false]}],"endpoint":{"url":"https://{ParsedArn#accountId}.ddb.{Region}.{PartitionResult#dnsSuffix}","properties":{"metricValues":["O"]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"disabled"]}]},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"not","argv":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}]},{"fn":"isSet","argv":[{"ref":"AccountId"}]}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"ref":"AccountId"},false]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{AccountId}.ddb.{Region}.{PartitionResult#dnsSuffix}","properties":{"metricValues":["O"]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Credentials-sourced account ID parameter is invalid","type":"error"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountIdEndpointMode"}]},{"fn":"stringEquals","argv":[{"ref":"AccountIdEndpointMode"},"required"]}],"rules":[{"conditions":[{"fn":"not","argv":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}],"rules":[{"conditions":[],"error":"AccountIdEndpointMode is required but no AccountID was provided or able to be loaded","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: AccountIdEndpointMode is required but account endpoints are not supported in this partition","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: AccountIdEndpointMode is required and FIPS is enabled, but FIPS account endpoints are not supported","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://dynamodb.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
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

      BATCH_GET_ITEM = OperationModel.new(
        name: "BatchGetItem",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_WRITE_ITEM = OperationModel.new(
        name: "BatchWriteItem",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BACKUP = OperationModel.new(
        name: "CreateBackup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GLOBAL_TABLE = OperationModel.new(
        name: "CreateGlobalTable",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TABLE = OperationModel.new(
        name: "CreateTable",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BACKUP = OperationModel.new(
        name: "DeleteBackup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ITEM = OperationModel.new(
        name: "DeleteItem",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TABLE = OperationModel.new(
        name: "DeleteTable",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BACKUP = OperationModel.new(
        name: "DescribeBackup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONTINUOUS_BACKUPS = OperationModel.new(
        name: "DescribeContinuousBackups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONTRIBUTOR_INSIGHTS = OperationModel.new(
        name: "DescribeContributorInsights",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINTS = OperationModel.new(
        name: "DescribeEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPORT = OperationModel.new(
        name: "DescribeExport",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GLOBAL_TABLE = OperationModel.new(
        name: "DescribeGlobalTable",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GLOBAL_TABLE_SETTINGS = OperationModel.new(
        name: "DescribeGlobalTableSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMPORT = OperationModel.new(
        name: "DescribeImport",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_KINESIS_STREAMING_DESTINATION = OperationModel.new(
        name: "DescribeKinesisStreamingDestination",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LIMITS = OperationModel.new(
        name: "DescribeLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TABLE = OperationModel.new(
        name: "DescribeTable",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TABLE_REPLICA_AUTO_SCALING = OperationModel.new(
        name: "DescribeTableReplicaAutoScaling",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TIME_TO_LIVE = OperationModel.new(
        name: "DescribeTimeToLive",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_KINESIS_STREAMING_DESTINATION = OperationModel.new(
        name: "DisableKinesisStreamingDestination",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_KINESIS_STREAMING_DESTINATION = OperationModel.new(
        name: "EnableKinesisStreamingDestination",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_STATEMENT = OperationModel.new(
        name: "ExecuteStatement",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_TRANSACTION = OperationModel.new(
        name: "ExecuteTransaction",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_TABLE_TO_POINT_IN_TIME = OperationModel.new(
        name: "ExportTableToPointInTime",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ITEM = OperationModel.new(
        name: "GetItem",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_TABLE = OperationModel.new(
        name: "ImportTable",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BACKUPS = OperationModel.new(
        name: "ListBackups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONTRIBUTOR_INSIGHTS = OperationModel.new(
        name: "ListContributorInsights",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXPORTS = OperationModel.new(
        name: "ListExports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GLOBAL_TABLES = OperationModel.new(
        name: "ListGlobalTables",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMPORTS = OperationModel.new(
        name: "ListImports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TABLES = OperationModel.new(
        name: "ListTables",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_OF_RESOURCE = OperationModel.new(
        name: "ListTagsOfResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ITEM = OperationModel.new(
        name: "PutItem",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      QUERY = OperationModel.new(
        name: "Query",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_TABLE_FROM_BACKUP = OperationModel.new(
        name: "RestoreTableFromBackup",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_TABLE_TO_POINT_IN_TIME = OperationModel.new(
        name: "RestoreTableToPointInTime",
        http_method: "POST",
        request_uri: "/"
      )

      SCAN = OperationModel.new(
        name: "Scan",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TRANSACT_GET_ITEMS = OperationModel.new(
        name: "TransactGetItems",
        http_method: "POST",
        request_uri: "/"
      )

      TRANSACT_WRITE_ITEMS = OperationModel.new(
        name: "TransactWriteItems",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONTINUOUS_BACKUPS = OperationModel.new(
        name: "UpdateContinuousBackups",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONTRIBUTOR_INSIGHTS = OperationModel.new(
        name: "UpdateContributorInsights",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GLOBAL_TABLE = OperationModel.new(
        name: "UpdateGlobalTable",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GLOBAL_TABLE_SETTINGS = OperationModel.new(
        name: "UpdateGlobalTableSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ITEM = OperationModel.new(
        name: "UpdateItem",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_KINESIS_STREAMING_DESTINATION = OperationModel.new(
        name: "UpdateKinesisStreamingDestination",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TABLE = OperationModel.new(
        name: "UpdateTable",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TABLE_REPLICA_AUTO_SCALING = OperationModel.new(
        name: "UpdateTableReplicaAutoScaling",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TIME_TO_LIVE = OperationModel.new(
        name: "UpdateTimeToLive",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
