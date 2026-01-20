module AwsSdk
  module PaymentCryptography
    module Model
      API_VERSION = "2021-09-14"
      TARGET_PREFIX = "PaymentCryptographyControlPlane"
      SIGNING_NAME = "payment-cryptography"
      ENDPOINT_PREFIX = "controlplane.payment-cryptography"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://controlplane.payment-cryptography-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://controlplane.payment-cryptography-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://controlplane.payment-cryptography.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://controlplane.payment-cryptography.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_KEY_REPLICATION_REGIONS = OperationModel.new(
        name: "AddKeyReplicationRegions",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ALIAS = OperationModel.new(
        name: "CreateAlias",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_KEY = OperationModel.new(
        name: "CreateKey",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ALIAS = OperationModel.new(
        name: "DeleteAlias",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_KEY = OperationModel.new(
        name: "DeleteKey",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_DEFAULT_KEY_REPLICATION_REGIONS = OperationModel.new(
        name: "DisableDefaultKeyReplicationRegions",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_DEFAULT_KEY_REPLICATION_REGIONS = OperationModel.new(
        name: "EnableDefaultKeyReplicationRegions",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_KEY = OperationModel.new(
        name: "ExportKey",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ALIAS = OperationModel.new(
        name: "GetAlias",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CERTIFICATE_SIGNING_REQUEST = OperationModel.new(
        name: "GetCertificateSigningRequest",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEFAULT_KEY_REPLICATION_REGIONS = OperationModel.new(
        name: "GetDefaultKeyReplicationRegions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_KEY = OperationModel.new(
        name: "GetKey",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARAMETERS_FOR_EXPORT = OperationModel.new(
        name: "GetParametersForExport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARAMETERS_FOR_IMPORT = OperationModel.new(
        name: "GetParametersForImport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PUBLIC_KEY_CERTIFICATE = OperationModel.new(
        name: "GetPublicKeyCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_KEY = OperationModel.new(
        name: "ImportKey",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ALIASES = OperationModel.new(
        name: "ListAliases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_KEYS = OperationModel.new(
        name: "ListKeys",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_KEY_REPLICATION_REGIONS = OperationModel.new(
        name: "RemoveKeyReplicationRegions",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_KEY = OperationModel.new(
        name: "RestoreKey",
        http_method: "POST",
        request_uri: "/"
      )

      START_KEY_USAGE = OperationModel.new(
        name: "StartKeyUsage",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_KEY_USAGE = OperationModel.new(
        name: "StopKeyUsage",
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
    end
  end
end
