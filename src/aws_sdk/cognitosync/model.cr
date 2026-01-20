module AwsSdk
  module CognitoSync
    module Model
      API_VERSION = "2014-06-30"
      TARGET_PREFIX = ""
      SIGNING_NAME = "cognito-sync"
      ENDPOINT_PREFIX = "cognito-sync"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cognito-sync-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cognito-sync-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cognito-sync.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://cognito-sync.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BULK_PUBLISH = OperationModel.new(
        name: "BulkPublish",
        http_method: "POST",
        request_uri: "/identitypools/{IdentityPoolId}/bulkpublish"
      )

      DELETE_DATASET = OperationModel.new(
        name: "DeleteDataset",
        http_method: "DELETE",
        request_uri: "/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}"
      )

      DESCRIBE_DATASET = OperationModel.new(
        name: "DescribeDataset",
        http_method: "GET",
        request_uri: "/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}"
      )

      DESCRIBE_IDENTITY_POOL_USAGE = OperationModel.new(
        name: "DescribeIdentityPoolUsage",
        http_method: "GET",
        request_uri: "/identitypools/{IdentityPoolId}"
      )

      DESCRIBE_IDENTITY_USAGE = OperationModel.new(
        name: "DescribeIdentityUsage",
        http_method: "GET",
        request_uri: "/identitypools/{IdentityPoolId}/identities/{IdentityId}"
      )

      GET_BULK_PUBLISH_DETAILS = OperationModel.new(
        name: "GetBulkPublishDetails",
        http_method: "POST",
        request_uri: "/identitypools/{IdentityPoolId}/getBulkPublishDetails"
      )

      GET_COGNITO_EVENTS = OperationModel.new(
        name: "GetCognitoEvents",
        http_method: "GET",
        request_uri: "/identitypools/{IdentityPoolId}/events"
      )

      GET_IDENTITY_POOL_CONFIGURATION = OperationModel.new(
        name: "GetIdentityPoolConfiguration",
        http_method: "GET",
        request_uri: "/identitypools/{IdentityPoolId}/configuration"
      )

      LIST_DATASETS = OperationModel.new(
        name: "ListDatasets",
        http_method: "GET",
        request_uri: "/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets"
      )

      LIST_IDENTITY_POOL_USAGE = OperationModel.new(
        name: "ListIdentityPoolUsage",
        http_method: "GET",
        request_uri: "/identitypools"
      )

      LIST_RECORDS = OperationModel.new(
        name: "ListRecords",
        http_method: "GET",
        request_uri: "/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}/records"
      )

      REGISTER_DEVICE = OperationModel.new(
        name: "RegisterDevice",
        http_method: "POST",
        request_uri: "/identitypools/{IdentityPoolId}/identity/{IdentityId}/device"
      )

      SET_COGNITO_EVENTS = OperationModel.new(
        name: "SetCognitoEvents",
        http_method: "POST",
        request_uri: "/identitypools/{IdentityPoolId}/events"
      )

      SET_IDENTITY_POOL_CONFIGURATION = OperationModel.new(
        name: "SetIdentityPoolConfiguration",
        http_method: "POST",
        request_uri: "/identitypools/{IdentityPoolId}/configuration"
      )

      SUBSCRIBE_TO_DATASET = OperationModel.new(
        name: "SubscribeToDataset",
        http_method: "POST",
        request_uri: "/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}/subscriptions/{DeviceId}"
      )

      UNSUBSCRIBE_FROM_DATASET = OperationModel.new(
        name: "UnsubscribeFromDataset",
        http_method: "DELETE",
        request_uri: "/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}/subscriptions/{DeviceId}"
      )

      UPDATE_RECORDS = OperationModel.new(
        name: "UpdateRecords",
        http_method: "POST",
        request_uri: "/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}"
      )
    end
  end
end
