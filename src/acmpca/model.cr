module Aws
  module ACMPCA
    module Model
      API_VERSION = "2017-08-22"
      TARGET_PREFIX = "ACMPrivateCA"
      SIGNING_NAME = "acm-pca"
      ENDPOINT_PREFIX = "acm-pca"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://acm-pca-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://acm-pca.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://acm-pca-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://acm-pca.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://acm-pca.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CERTIFICATE_AUTHORITY = OperationModel.new(
        name: "CreateCertificateAuthority",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CERTIFICATE_AUTHORITY_AUDIT_REPORT = OperationModel.new(
        name: "CreateCertificateAuthorityAuditReport",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PERMISSION = OperationModel.new(
        name: "CreatePermission",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CERTIFICATE_AUTHORITY = OperationModel.new(
        name: "DeleteCertificateAuthority",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PERMISSION = OperationModel.new(
        name: "DeletePermission",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_POLICY = OperationModel.new(
        name: "DeletePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CERTIFICATE_AUTHORITY = OperationModel.new(
        name: "DescribeCertificateAuthority",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CERTIFICATE_AUTHORITY_AUDIT_REPORT = OperationModel.new(
        name: "DescribeCertificateAuthorityAuditReport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CERTIFICATE = OperationModel.new(
        name: "GetCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CERTIFICATE_AUTHORITY_CERTIFICATE = OperationModel.new(
        name: "GetCertificateAuthorityCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CERTIFICATE_AUTHORITY_CSR = OperationModel.new(
        name: "GetCertificateAuthorityCsr",
        http_method: "POST",
        request_uri: "/"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_CERTIFICATE_AUTHORITY_CERTIFICATE = OperationModel.new(
        name: "ImportCertificateAuthorityCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      ISSUE_CERTIFICATE = OperationModel.new(
        name: "IssueCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CERTIFICATE_AUTHORITIES = OperationModel.new(
        name: "ListCertificateAuthorities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PERMISSIONS = OperationModel.new(
        name: "ListPermissions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS = OperationModel.new(
        name: "ListTags",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_POLICY = OperationModel.new(
        name: "PutPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_CERTIFICATE_AUTHORITY = OperationModel.new(
        name: "RestoreCertificateAuthority",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_CERTIFICATE = OperationModel.new(
        name: "RevokeCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_CERTIFICATE_AUTHORITY = OperationModel.new(
        name: "TagCertificateAuthority",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_CERTIFICATE_AUTHORITY = OperationModel.new(
        name: "UntagCertificateAuthority",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CERTIFICATE_AUTHORITY = OperationModel.new(
        name: "UpdateCertificateAuthority",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
