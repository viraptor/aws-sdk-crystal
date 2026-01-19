module AwsSdk
  module Invoicing
    module Model
      API_VERSION = "2024-12-01"
      TARGET_PREFIX = "Invoicing"
      SIGNING_NAME = "invoicing"
      ENDPOINT_PREFIX = "invoicing"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://invoicing-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://invoicing.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_INVOICE_PROFILE = OperationModel.new(
        name: "BatchGetInvoiceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INVOICE_UNIT = OperationModel.new(
        name: "CreateInvoiceUnit",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROCUREMENT_PORTAL_PREFERENCE = OperationModel.new(
        name: "CreateProcurementPortalPreference",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INVOICE_UNIT = OperationModel.new(
        name: "DeleteInvoiceUnit",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROCUREMENT_PORTAL_PREFERENCE = OperationModel.new(
        name: "DeleteProcurementPortalPreference",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INVOICE_PDF = OperationModel.new(
        name: "GetInvoicePDF",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INVOICE_UNIT = OperationModel.new(
        name: "GetInvoiceUnit",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PROCUREMENT_PORTAL_PREFERENCE = OperationModel.new(
        name: "GetProcurementPortalPreference",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INVOICE_SUMMARIES = OperationModel.new(
        name: "ListInvoiceSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INVOICE_UNITS = OperationModel.new(
        name: "ListInvoiceUnits",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROCUREMENT_PORTAL_PREFERENCES = OperationModel.new(
        name: "ListProcurementPortalPreferences",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PROCUREMENT_PORTAL_PREFERENCE = OperationModel.new(
        name: "PutProcurementPortalPreference",
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

      UPDATE_INVOICE_UNIT = OperationModel.new(
        name: "UpdateInvoiceUnit",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROCUREMENT_PORTAL_PREFERENCE_STATUS = OperationModel.new(
        name: "UpdateProcurementPortalPreferenceStatus",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
