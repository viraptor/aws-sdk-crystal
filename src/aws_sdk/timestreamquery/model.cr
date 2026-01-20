module AwsSdk
  module TimestreamQuery
    module Model
      API_VERSION = "2018-11-01"
      TARGET_PREFIX = "Timestream_20181101"
      SIGNING_NAME = "timestream"
      ENDPOINT_PREFIX = "query.timestream"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://timestream-query-fips.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://timestream-query.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://query.timestream-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://query.timestream.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://query.timestream-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://timestream-query.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://timestream-query.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://query.timestream.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://query.timestream.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_QUERY = OperationModel.new(
        name: "CancelQuery",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SCHEDULED_QUERY = OperationModel.new(
        name: "CreateScheduledQuery",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SCHEDULED_QUERY = OperationModel.new(
        name: "DeleteScheduledQuery",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "DescribeAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINTS = OperationModel.new(
        name: "DescribeEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCHEDULED_QUERY = OperationModel.new(
        name: "DescribeScheduledQuery",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_SCHEDULED_QUERY = OperationModel.new(
        name: "ExecuteScheduledQuery",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SCHEDULED_QUERIES = OperationModel.new(
        name: "ListScheduledQueries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PREPARE_QUERY = OperationModel.new(
        name: "PrepareQuery",
        http_method: "POST",
        request_uri: "/"
      )

      QUERY = OperationModel.new(
        name: "Query",
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

      UPDATE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "UpdateAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SCHEDULED_QUERY = OperationModel.new(
        name: "UpdateScheduledQuery",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
