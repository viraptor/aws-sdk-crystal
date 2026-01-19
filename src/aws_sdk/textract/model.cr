module AwsSdk
  module Textract
    module Model
      API_VERSION = "2018-06-27"
      TARGET_PREFIX = "Textract"
      SIGNING_NAME = "textract"
      ENDPOINT_PREFIX = "textract"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://textract-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://textract-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://textract.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://textract.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ANALYZE_DOCUMENT = OperationModel.new(
        name: "AnalyzeDocument",
        http_method: "POST",
        request_uri: "/"
      )

      ANALYZE_EXPENSE = OperationModel.new(
        name: "AnalyzeExpense",
        http_method: "POST",
        request_uri: "/"
      )

      ANALYZE_ID = OperationModel.new(
        name: "AnalyzeID",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ADAPTER = OperationModel.new(
        name: "CreateAdapter",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ADAPTER_VERSION = OperationModel.new(
        name: "CreateAdapterVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ADAPTER = OperationModel.new(
        name: "DeleteAdapter",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ADAPTER_VERSION = OperationModel.new(
        name: "DeleteAdapterVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_DOCUMENT_TEXT = OperationModel.new(
        name: "DetectDocumentText",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ADAPTER = OperationModel.new(
        name: "GetAdapter",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ADAPTER_VERSION = OperationModel.new(
        name: "GetAdapterVersion",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DOCUMENT_ANALYSIS = OperationModel.new(
        name: "GetDocumentAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DOCUMENT_TEXT_DETECTION = OperationModel.new(
        name: "GetDocumentTextDetection",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EXPENSE_ANALYSIS = OperationModel.new(
        name: "GetExpenseAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LENDING_ANALYSIS = OperationModel.new(
        name: "GetLendingAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LENDING_ANALYSIS_SUMMARY = OperationModel.new(
        name: "GetLendingAnalysisSummary",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ADAPTER_VERSIONS = OperationModel.new(
        name: "ListAdapterVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ADAPTERS = OperationModel.new(
        name: "ListAdapters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      START_DOCUMENT_ANALYSIS = OperationModel.new(
        name: "StartDocumentAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      START_DOCUMENT_TEXT_DETECTION = OperationModel.new(
        name: "StartDocumentTextDetection",
        http_method: "POST",
        request_uri: "/"
      )

      START_EXPENSE_ANALYSIS = OperationModel.new(
        name: "StartExpenseAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      START_LENDING_ANALYSIS = OperationModel.new(
        name: "StartLendingAnalysis",
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

      UPDATE_ADAPTER = OperationModel.new(
        name: "UpdateAdapter",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
