module Aws
  module KMS
    module Model
      API_VERSION = "2014-11-01"
      TARGET_PREFIX = "TrentService"
      SIGNING_NAME = "kms"
      ENDPOINT_PREFIX = "kms"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kms-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kms-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kms.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://kms.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_KEY_DELETION = OperationModel.new(
        name: "CancelKeyDeletion",
        http_method: "POST",
        request_uri: "/"
      )

      CONNECT_CUSTOM_KEY_STORE = OperationModel.new(
        name: "ConnectCustomKeyStore",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ALIAS = OperationModel.new(
        name: "CreateAlias",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CUSTOM_KEY_STORE = OperationModel.new(
        name: "CreateCustomKeyStore",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GRANT = OperationModel.new(
        name: "CreateGrant",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_KEY = OperationModel.new(
        name: "CreateKey",
        http_method: "POST",
        request_uri: "/"
      )

      DECRYPT = OperationModel.new(
        name: "Decrypt",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ALIAS = OperationModel.new(
        name: "DeleteAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CUSTOM_KEY_STORE = OperationModel.new(
        name: "DeleteCustomKeyStore",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IMPORTED_KEY_MATERIAL = OperationModel.new(
        name: "DeleteImportedKeyMaterial",
        http_method: "POST",
        request_uri: "/"
      )

      DERIVE_SHARED_SECRET = OperationModel.new(
        name: "DeriveSharedSecret",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOM_KEY_STORES = OperationModel.new(
        name: "DescribeCustomKeyStores",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_KEY = OperationModel.new(
        name: "DescribeKey",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_KEY = OperationModel.new(
        name: "DisableKey",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_KEY_ROTATION = OperationModel.new(
        name: "DisableKeyRotation",
        http_method: "POST",
        request_uri: "/"
      )

      DISCONNECT_CUSTOM_KEY_STORE = OperationModel.new(
        name: "DisconnectCustomKeyStore",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_KEY = OperationModel.new(
        name: "EnableKey",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_KEY_ROTATION = OperationModel.new(
        name: "EnableKeyRotation",
        http_method: "POST",
        request_uri: "/"
      )

      ENCRYPT = OperationModel.new(
        name: "Encrypt",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_DATA_KEY = OperationModel.new(
        name: "GenerateDataKey",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_DATA_KEY_PAIR = OperationModel.new(
        name: "GenerateDataKeyPair",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_DATA_KEY_PAIR_WITHOUT_PLAINTEXT = OperationModel.new(
        name: "GenerateDataKeyPairWithoutPlaintext",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_DATA_KEY_WITHOUT_PLAINTEXT = OperationModel.new(
        name: "GenerateDataKeyWithoutPlaintext",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_MAC = OperationModel.new(
        name: "GenerateMac",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_RANDOM = OperationModel.new(
        name: "GenerateRandom",
        http_method: "POST",
        request_uri: "/"
      )

      GET_KEY_POLICY = OperationModel.new(
        name: "GetKeyPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_KEY_ROTATION_STATUS = OperationModel.new(
        name: "GetKeyRotationStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARAMETERS_FOR_IMPORT = OperationModel.new(
        name: "GetParametersForImport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PUBLIC_KEY = OperationModel.new(
        name: "GetPublicKey",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_KEY_MATERIAL = OperationModel.new(
        name: "ImportKeyMaterial",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ALIASES = OperationModel.new(
        name: "ListAliases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GRANTS = OperationModel.new(
        name: "ListGrants",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_KEY_POLICIES = OperationModel.new(
        name: "ListKeyPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_KEY_ROTATIONS = OperationModel.new(
        name: "ListKeyRotations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_KEYS = OperationModel.new(
        name: "ListKeys",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_TAGS = OperationModel.new(
        name: "ListResourceTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RETIRABLE_GRANTS = OperationModel.new(
        name: "ListRetirableGrants",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_KEY_POLICY = OperationModel.new(
        name: "PutKeyPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      RE_ENCRYPT = OperationModel.new(
        name: "ReEncrypt",
        http_method: "POST",
        request_uri: "/"
      )

      REPLICATE_KEY = OperationModel.new(
        name: "ReplicateKey",
        http_method: "POST",
        request_uri: "/"
      )

      RETIRE_GRANT = OperationModel.new(
        name: "RetireGrant",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_GRANT = OperationModel.new(
        name: "RevokeGrant",
        http_method: "POST",
        request_uri: "/"
      )

      ROTATE_KEY_ON_DEMAND = OperationModel.new(
        name: "RotateKeyOnDemand",
        http_method: "POST",
        request_uri: "/"
      )

      SCHEDULE_KEY_DELETION = OperationModel.new(
        name: "ScheduleKeyDeletion",
        http_method: "POST",
        request_uri: "/"
      )

      SIGN = OperationModel.new(
        name: "Sign",
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

      UPDATE_ALIAS = OperationModel.new(
        name: "UpdateAlias",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CUSTOM_KEY_STORE = OperationModel.new(
        name: "UpdateCustomKeyStore",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_KEY_DESCRIPTION = OperationModel.new(
        name: "UpdateKeyDescription",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PRIMARY_REGION = OperationModel.new(
        name: "UpdatePrimaryRegion",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY = OperationModel.new(
        name: "Verify",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_MAC = OperationModel.new(
        name: "VerifyMac",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
