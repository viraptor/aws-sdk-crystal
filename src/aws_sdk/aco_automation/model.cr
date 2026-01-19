module AwsSdk
  module ComputeOptimizerAutomation
    module Model
      API_VERSION = "2025-09-22"
      TARGET_PREFIX = "ComputeOptimizerAutomationService"
      SIGNING_NAME = "aco-automation"
      ENDPOINT_PREFIX = "aco-automation"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://aco-automation-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://aco-automation-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://aco-automation.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://aco-automation.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ACCOUNTS = OperationModel.new(
        name: "AssociateAccounts",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AUTOMATION_RULE = OperationModel.new(
        name: "CreateAutomationRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AUTOMATION_RULE = OperationModel.new(
        name: "DeleteAutomationRule",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_ACCOUNTS = OperationModel.new(
        name: "DisassociateAccounts",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AUTOMATION_EVENT = OperationModel.new(
        name: "GetAutomationEvent",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AUTOMATION_RULE = OperationModel.new(
        name: "GetAutomationRule",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENROLLMENT_CONFIGURATION = OperationModel.new(
        name: "GetEnrollmentConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNTS = OperationModel.new(
        name: "ListAccounts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTOMATION_EVENT_STEPS = OperationModel.new(
        name: "ListAutomationEventSteps",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTOMATION_EVENT_SUMMARIES = OperationModel.new(
        name: "ListAutomationEventSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTOMATION_EVENTS = OperationModel.new(
        name: "ListAutomationEvents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTOMATION_RULE_PREVIEW = OperationModel.new(
        name: "ListAutomationRulePreview",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTOMATION_RULE_PREVIEW_SUMMARIES = OperationModel.new(
        name: "ListAutomationRulePreviewSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTOMATION_RULES = OperationModel.new(
        name: "ListAutomationRules",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECOMMENDED_ACTION_SUMMARIES = OperationModel.new(
        name: "ListRecommendedActionSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECOMMENDED_ACTIONS = OperationModel.new(
        name: "ListRecommendedActions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      ROLLBACK_AUTOMATION_EVENT = OperationModel.new(
        name: "RollbackAutomationEvent",
        http_method: "POST",
        request_uri: "/"
      )

      START_AUTOMATION_EVENT = OperationModel.new(
        name: "StartAutomationEvent",
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

      UPDATE_AUTOMATION_RULE = OperationModel.new(
        name: "UpdateAutomationRule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENROLLMENT_CONFIGURATION = OperationModel.new(
        name: "UpdateEnrollmentConfiguration",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
