module Aws
  module ACM
    module Model
      API_VERSION = "2015-12-08"
      TARGET_PREFIX = "CertificateManager"
      SIGNING_NAME = "acm"
      ENDPOINT_PREFIX = "acm"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://acm-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://acm.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://acm-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://acm.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://acm.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_TAGS_TO_CERTIFICATE = OperationModel.new(
        name: "AddTagsToCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CERTIFICATE = OperationModel.new(
        name: "DeleteCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CERTIFICATE = OperationModel.new(
        name: "DescribeCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_CERTIFICATE = OperationModel.new(
        name: "ExportCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_CONFIGURATION = OperationModel.new(
        name: "GetAccountConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CERTIFICATE = OperationModel.new(
        name: "GetCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_CERTIFICATE = OperationModel.new(
        name: "ImportCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CERTIFICATES = OperationModel.new(
        name: "ListCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_CERTIFICATE = OperationModel.new(
        name: "ListTagsForCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ACCOUNT_CONFIGURATION = OperationModel.new(
        name: "PutAccountConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_CERTIFICATE = OperationModel.new(
        name: "RemoveTagsFromCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      RENEW_CERTIFICATE = OperationModel.new(
        name: "RenewCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      REQUEST_CERTIFICATE = OperationModel.new(
        name: "RequestCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      RESEND_VALIDATION_EMAIL = OperationModel.new(
        name: "ResendValidationEmail",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_CERTIFICATE = OperationModel.new(
        name: "RevokeCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CERTIFICATE_OPTIONS = OperationModel.new(
        name: "UpdateCertificateOptions",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
