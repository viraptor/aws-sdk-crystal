module Aws
  module AmplifyUIBuilder
    module Model
      API_VERSION = "2021-08-11"
      TARGET_PREFIX = ""
      SIGNING_NAME = "amplifyuibuilder"
      ENDPOINT_PREFIX = "amplifyuibuilder"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://amplifyuibuilder-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://amplifyuibuilder-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://amplifyuibuilder.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://amplifyuibuilder.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_COMPONENT = OperationModel.new(
        name: "CreateComponent",
        http_method: "POST",
        request_uri: "/app/{appId}/environment/{environmentName}/components"
      )

      CREATE_FORM = OperationModel.new(
        name: "CreateForm",
        http_method: "POST",
        request_uri: "/app/{appId}/environment/{environmentName}/forms"
      )

      CREATE_THEME = OperationModel.new(
        name: "CreateTheme",
        http_method: "POST",
        request_uri: "/app/{appId}/environment/{environmentName}/themes"
      )

      DELETE_COMPONENT = OperationModel.new(
        name: "DeleteComponent",
        http_method: "DELETE",
        request_uri: "/app/{appId}/environment/{environmentName}/components/{id}"
      )

      DELETE_FORM = OperationModel.new(
        name: "DeleteForm",
        http_method: "DELETE",
        request_uri: "/app/{appId}/environment/{environmentName}/forms/{id}"
      )

      DELETE_THEME = OperationModel.new(
        name: "DeleteTheme",
        http_method: "DELETE",
        request_uri: "/app/{appId}/environment/{environmentName}/themes/{id}"
      )

      EXCHANGE_CODE_FOR_TOKEN = OperationModel.new(
        name: "ExchangeCodeForToken",
        http_method: "POST",
        request_uri: "/tokens/{provider}"
      )

      EXPORT_COMPONENTS = OperationModel.new(
        name: "ExportComponents",
        http_method: "GET",
        request_uri: "/export/app/{appId}/environment/{environmentName}/components"
      )

      EXPORT_FORMS = OperationModel.new(
        name: "ExportForms",
        http_method: "GET",
        request_uri: "/export/app/{appId}/environment/{environmentName}/forms"
      )

      EXPORT_THEMES = OperationModel.new(
        name: "ExportThemes",
        http_method: "GET",
        request_uri: "/export/app/{appId}/environment/{environmentName}/themes"
      )

      GET_CODEGEN_JOB = OperationModel.new(
        name: "GetCodegenJob",
        http_method: "GET",
        request_uri: "/app/{appId}/environment/{environmentName}/codegen-jobs/{id}"
      )

      GET_COMPONENT = OperationModel.new(
        name: "GetComponent",
        http_method: "GET",
        request_uri: "/app/{appId}/environment/{environmentName}/components/{id}"
      )

      GET_FORM = OperationModel.new(
        name: "GetForm",
        http_method: "GET",
        request_uri: "/app/{appId}/environment/{environmentName}/forms/{id}"
      )

      GET_METADATA = OperationModel.new(
        name: "GetMetadata",
        http_method: "GET",
        request_uri: "/app/{appId}/environment/{environmentName}/metadata"
      )

      GET_THEME = OperationModel.new(
        name: "GetTheme",
        http_method: "GET",
        request_uri: "/app/{appId}/environment/{environmentName}/themes/{id}"
      )

      LIST_CODEGEN_JOBS = OperationModel.new(
        name: "ListCodegenJobs",
        http_method: "GET",
        request_uri: "/app/{appId}/environment/{environmentName}/codegen-jobs"
      )

      LIST_COMPONENTS = OperationModel.new(
        name: "ListComponents",
        http_method: "GET",
        request_uri: "/app/{appId}/environment/{environmentName}/components"
      )

      LIST_FORMS = OperationModel.new(
        name: "ListForms",
        http_method: "GET",
        request_uri: "/app/{appId}/environment/{environmentName}/forms"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_THEMES = OperationModel.new(
        name: "ListThemes",
        http_method: "GET",
        request_uri: "/app/{appId}/environment/{environmentName}/themes"
      )

      PUT_METADATA_FLAG = OperationModel.new(
        name: "PutMetadataFlag",
        http_method: "PUT",
        request_uri: "/app/{appId}/environment/{environmentName}/metadata/features/{featureName}"
      )

      REFRESH_TOKEN = OperationModel.new(
        name: "RefreshToken",
        http_method: "POST",
        request_uri: "/tokens/{provider}/refresh"
      )

      START_CODEGEN_JOB = OperationModel.new(
        name: "StartCodegenJob",
        http_method: "POST",
        request_uri: "/app/{appId}/environment/{environmentName}/codegen-jobs"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_COMPONENT = OperationModel.new(
        name: "UpdateComponent",
        http_method: "PATCH",
        request_uri: "/app/{appId}/environment/{environmentName}/components/{id}"
      )

      UPDATE_FORM = OperationModel.new(
        name: "UpdateForm",
        http_method: "PATCH",
        request_uri: "/app/{appId}/environment/{environmentName}/forms/{id}"
      )

      UPDATE_THEME = OperationModel.new(
        name: "UpdateTheme",
        http_method: "PATCH",
        request_uri: "/app/{appId}/environment/{environmentName}/themes/{id}"
      )
    end
  end
end
