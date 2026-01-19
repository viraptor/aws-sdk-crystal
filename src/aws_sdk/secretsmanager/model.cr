module AwsSdk
  module SecretsManager
    module Model
      API_VERSION = "2017-10-17"
      TARGET_PREFIX = "secretsmanager"
      SIGNING_NAME = "secretsmanager"
      ENDPOINT_PREFIX = "secretsmanager"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://secretsmanager-fips.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://secretsmanager-fips.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://secretsmanager-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://secretsmanager-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://secretsmanager.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-cn",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://secretsmanager.{Region}.amazonaws.com.cn","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://secretsmanager.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://secretsmanager.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://secretsmanager.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_SECRET_VALUE = OperationModel.new(
        name: "BatchGetSecretValue",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_ROTATE_SECRET = OperationModel.new(
        name: "CancelRotateSecret",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SECRET = OperationModel.new(
        name: "CreateSecret",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SECRET = OperationModel.new(
        name: "DeleteSecret",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SECRET = OperationModel.new(
        name: "DescribeSecret",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RANDOM_PASSWORD = OperationModel.new(
        name: "GetRandomPassword",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SECRET_VALUE = OperationModel.new(
        name: "GetSecretValue",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SECRET_VERSION_IDS = OperationModel.new(
        name: "ListSecretVersionIds",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SECRETS = OperationModel.new(
        name: "ListSecrets",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SECRET_VALUE = OperationModel.new(
        name: "PutSecretValue",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_REGIONS_FROM_REPLICATION = OperationModel.new(
        name: "RemoveRegionsFromReplication",
        http_method: "POST",
        request_uri: "/"
      )

      REPLICATE_SECRET_TO_REGIONS = OperationModel.new(
        name: "ReplicateSecretToRegions",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_SECRET = OperationModel.new(
        name: "RestoreSecret",
        http_method: "POST",
        request_uri: "/"
      )

      ROTATE_SECRET = OperationModel.new(
        name: "RotateSecret",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_REPLICATION_TO_REPLICA = OperationModel.new(
        name: "StopReplicationToReplica",
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

      UPDATE_SECRET = OperationModel.new(
        name: "UpdateSecret",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SECRET_VERSION_STAGE = OperationModel.new(
        name: "UpdateSecretVersionStage",
        http_method: "POST",
        request_uri: "/"
      )

      VALIDATE_RESOURCE_POLICY = OperationModel.new(
        name: "ValidateResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
