module Aws
  module PaymentCryptographyData
    module Model
      API_VERSION = "2022-02-03"
      TARGET_PREFIX = ""
      SIGNING_NAME = "payment-cryptography"
      ENDPOINT_PREFIX = "dataplane.payment-cryptography"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://dataplane.payment-cryptography-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://dataplane.payment-cryptography-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://dataplane.payment-cryptography.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://dataplane.payment-cryptography.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      DECRYPT_DATA = OperationModel.new(
        name: "DecryptData",
        http_method: "POST",
        request_uri: "/keys/{KeyIdentifier}/decrypt"
      )

      ENCRYPT_DATA = OperationModel.new(
        name: "EncryptData",
        http_method: "POST",
        request_uri: "/keys/{KeyIdentifier}/encrypt"
      )

      GENERATE_AS2805_KEK_VALIDATION = OperationModel.new(
        name: "GenerateAs2805KekValidation",
        http_method: "POST",
        request_uri: "/as2805kekvalidation/generate"
      )

      GENERATE_CARD_VALIDATION_DATA = OperationModel.new(
        name: "GenerateCardValidationData",
        http_method: "POST",
        request_uri: "/cardvalidationdata/generate"
      )

      GENERATE_MAC = OperationModel.new(
        name: "GenerateMac",
        http_method: "POST",
        request_uri: "/mac/generate"
      )

      GENERATE_MAC_EMV_PIN_CHANGE = OperationModel.new(
        name: "GenerateMacEmvPinChange",
        http_method: "POST",
        request_uri: "/macemvpinchange/generate"
      )

      GENERATE_PIN_DATA = OperationModel.new(
        name: "GeneratePinData",
        http_method: "POST",
        request_uri: "/pindata/generate"
      )

      RE_ENCRYPT_DATA = OperationModel.new(
        name: "ReEncryptData",
        http_method: "POST",
        request_uri: "/keys/{IncomingKeyIdentifier}/reencrypt"
      )

      TRANSLATE_KEY_MATERIAL = OperationModel.new(
        name: "TranslateKeyMaterial",
        http_method: "POST",
        request_uri: "/keymaterial/translate"
      )

      TRANSLATE_PIN_DATA = OperationModel.new(
        name: "TranslatePinData",
        http_method: "POST",
        request_uri: "/pindata/translate"
      )

      VERIFY_AUTH_REQUEST_CRYPTOGRAM = OperationModel.new(
        name: "VerifyAuthRequestCryptogram",
        http_method: "POST",
        request_uri: "/cryptogram/verify"
      )

      VERIFY_CARD_VALIDATION_DATA = OperationModel.new(
        name: "VerifyCardValidationData",
        http_method: "POST",
        request_uri: "/cardvalidationdata/verify"
      )

      VERIFY_MAC = OperationModel.new(
        name: "VerifyMac",
        http_method: "POST",
        request_uri: "/mac/verify"
      )

      VERIFY_PIN_DATA = OperationModel.new(
        name: "VerifyPinData",
        http_method: "POST",
        request_uri: "/pindata/verify"
      )
    end
  end
end
