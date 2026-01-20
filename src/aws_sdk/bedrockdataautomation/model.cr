module AwsSdk
  module BedrockDataAutomation
    module Model
      API_VERSION = "2023-07-26"
      TARGET_PREFIX = ""
      SIGNING_NAME = "bedrock"
      ENDPOINT_PREFIX = "bedrock-data-automation"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-data-automation-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-data-automation-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-data-automation.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-data-automation.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      COPY_BLUEPRINT_STAGE = OperationModel.new(
        name: "CopyBlueprintStage",
        http_method: "PUT",
        request_uri: "/blueprints/{blueprintArn}/copy-stage"
      )

      CREATE_BLUEPRINT = OperationModel.new(
        name: "CreateBlueprint",
        http_method: "PUT",
        request_uri: "/blueprints/"
      )

      CREATE_BLUEPRINT_VERSION = OperationModel.new(
        name: "CreateBlueprintVersion",
        http_method: "POST",
        request_uri: "/blueprints/{blueprintArn}/versions/"
      )

      CREATE_DATA_AUTOMATION_PROJECT = OperationModel.new(
        name: "CreateDataAutomationProject",
        http_method: "PUT",
        request_uri: "/data-automation-projects/"
      )

      DELETE_BLUEPRINT = OperationModel.new(
        name: "DeleteBlueprint",
        http_method: "DELETE",
        request_uri: "/blueprints/{blueprintArn}/"
      )

      DELETE_DATA_AUTOMATION_PROJECT = OperationModel.new(
        name: "DeleteDataAutomationProject",
        http_method: "DELETE",
        request_uri: "/data-automation-projects/{projectArn}/"
      )

      GET_BLUEPRINT = OperationModel.new(
        name: "GetBlueprint",
        http_method: "POST",
        request_uri: "/blueprints/{blueprintArn}/"
      )

      GET_BLUEPRINT_OPTIMIZATION_STATUS = OperationModel.new(
        name: "GetBlueprintOptimizationStatus",
        http_method: "POST",
        request_uri: "/getBlueprintOptimizationStatus/{invocationArn}"
      )

      GET_DATA_AUTOMATION_PROJECT = OperationModel.new(
        name: "GetDataAutomationProject",
        http_method: "POST",
        request_uri: "/data-automation-projects/{projectArn}/"
      )

      INVOKE_BLUEPRINT_OPTIMIZATION_ASYNC = OperationModel.new(
        name: "InvokeBlueprintOptimizationAsync",
        http_method: "POST",
        request_uri: "/invokeBlueprintOptimizationAsync"
      )

      LIST_BLUEPRINTS = OperationModel.new(
        name: "ListBlueprints",
        http_method: "POST",
        request_uri: "/blueprints/"
      )

      LIST_DATA_AUTOMATION_PROJECTS = OperationModel.new(
        name: "ListDataAutomationProjects",
        http_method: "POST",
        request_uri: "/data-automation-projects/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/listTagsForResource"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tagResource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/untagResource"
      )

      UPDATE_BLUEPRINT = OperationModel.new(
        name: "UpdateBlueprint",
        http_method: "PUT",
        request_uri: "/blueprints/{blueprintArn}/"
      )

      UPDATE_DATA_AUTOMATION_PROJECT = OperationModel.new(
        name: "UpdateDataAutomationProject",
        http_method: "PUT",
        request_uri: "/data-automation-projects/{projectArn}/"
      )
    end
  end
end
