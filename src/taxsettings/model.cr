module Aws
  module TaxSettings
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "tax"
      ENDPOINT_PREFIX = "tax"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://tax-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://tax-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://tax.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://tax.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_DELETE_TAX_REGISTRATION = OperationModel.new(
        name: "BatchDeleteTaxRegistration",
        http_method: "POST",
        request_uri: "/BatchDeleteTaxRegistration"
      )

      BATCH_GET_TAX_EXEMPTIONS = OperationModel.new(
        name: "BatchGetTaxExemptions",
        http_method: "POST",
        request_uri: "/BatchGetTaxExemptions"
      )

      BATCH_PUT_TAX_REGISTRATION = OperationModel.new(
        name: "BatchPutTaxRegistration",
        http_method: "POST",
        request_uri: "/BatchPutTaxRegistration"
      )

      DELETE_SUPPLEMENTAL_TAX_REGISTRATION = OperationModel.new(
        name: "DeleteSupplementalTaxRegistration",
        http_method: "POST",
        request_uri: "/DeleteSupplementalTaxRegistration"
      )

      DELETE_TAX_REGISTRATION = OperationModel.new(
        name: "DeleteTaxRegistration",
        http_method: "POST",
        request_uri: "/DeleteTaxRegistration"
      )

      GET_TAX_EXEMPTION_TYPES = OperationModel.new(
        name: "GetTaxExemptionTypes",
        http_method: "POST",
        request_uri: "/GetTaxExemptionTypes"
      )

      GET_TAX_INHERITANCE = OperationModel.new(
        name: "GetTaxInheritance",
        http_method: "POST",
        request_uri: "/GetTaxInheritance"
      )

      GET_TAX_REGISTRATION = OperationModel.new(
        name: "GetTaxRegistration",
        http_method: "POST",
        request_uri: "/GetTaxRegistration"
      )

      GET_TAX_REGISTRATION_DOCUMENT = OperationModel.new(
        name: "GetTaxRegistrationDocument",
        http_method: "POST",
        request_uri: "/GetTaxRegistrationDocument"
      )

      LIST_SUPPLEMENTAL_TAX_REGISTRATIONS = OperationModel.new(
        name: "ListSupplementalTaxRegistrations",
        http_method: "POST",
        request_uri: "/ListSupplementalTaxRegistrations"
      )

      LIST_TAX_EXEMPTIONS = OperationModel.new(
        name: "ListTaxExemptions",
        http_method: "POST",
        request_uri: "/ListTaxExemptions"
      )

      LIST_TAX_REGISTRATIONS = OperationModel.new(
        name: "ListTaxRegistrations",
        http_method: "POST",
        request_uri: "/ListTaxRegistrations"
      )

      PUT_SUPPLEMENTAL_TAX_REGISTRATION = OperationModel.new(
        name: "PutSupplementalTaxRegistration",
        http_method: "POST",
        request_uri: "/PutSupplementalTaxRegistration"
      )

      PUT_TAX_EXEMPTION = OperationModel.new(
        name: "PutTaxExemption",
        http_method: "POST",
        request_uri: "/PutTaxExemption"
      )

      PUT_TAX_INHERITANCE = OperationModel.new(
        name: "PutTaxInheritance",
        http_method: "POST",
        request_uri: "/PutTaxInheritance"
      )

      PUT_TAX_REGISTRATION = OperationModel.new(
        name: "PutTaxRegistration",
        http_method: "POST",
        request_uri: "/PutTaxRegistration"
      )
    end
  end
end
