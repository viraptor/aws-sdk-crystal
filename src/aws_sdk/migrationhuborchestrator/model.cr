module AwsSdk
  module MigrationHubOrchestrator
    module Model
      API_VERSION = "2021-08-28"
      TARGET_PREFIX = ""
      SIGNING_NAME = "migrationhub-orchestrator"
      ENDPOINT_PREFIX = "migrationhub-orchestrator"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://migrationhub-orchestrator-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://migrationhub-orchestrator-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://migrationhub-orchestrator.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://migrationhub-orchestrator.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_TEMPLATE = OperationModel.new(
        name: "CreateTemplate",
        http_method: "POST",
        request_uri: "/template"
      )

      CREATE_WORKFLOW = OperationModel.new(
        name: "CreateWorkflow",
        http_method: "POST",
        request_uri: "/migrationworkflow/"
      )

      CREATE_WORKFLOW_STEP = OperationModel.new(
        name: "CreateWorkflowStep",
        http_method: "POST",
        request_uri: "/workflowstep"
      )

      CREATE_WORKFLOW_STEP_GROUP = OperationModel.new(
        name: "CreateWorkflowStepGroup",
        http_method: "POST",
        request_uri: "/workflowstepgroups"
      )

      DELETE_TEMPLATE = OperationModel.new(
        name: "DeleteTemplate",
        http_method: "DELETE",
        request_uri: "/template/{id}"
      )

      DELETE_WORKFLOW = OperationModel.new(
        name: "DeleteWorkflow",
        http_method: "DELETE",
        request_uri: "/migrationworkflow/{id}"
      )

      DELETE_WORKFLOW_STEP = OperationModel.new(
        name: "DeleteWorkflowStep",
        http_method: "DELETE",
        request_uri: "/workflowstep/{id}"
      )

      DELETE_WORKFLOW_STEP_GROUP = OperationModel.new(
        name: "DeleteWorkflowStepGroup",
        http_method: "DELETE",
        request_uri: "/workflowstepgroup/{id}"
      )

      GET_TEMPLATE = OperationModel.new(
        name: "GetTemplate",
        http_method: "GET",
        request_uri: "/migrationworkflowtemplate/{id}"
      )

      GET_TEMPLATE_STEP = OperationModel.new(
        name: "GetTemplateStep",
        http_method: "GET",
        request_uri: "/templatestep/{id}"
      )

      GET_TEMPLATE_STEP_GROUP = OperationModel.new(
        name: "GetTemplateStepGroup",
        http_method: "GET",
        request_uri: "/templates/{templateId}/stepgroups/{id}"
      )

      GET_WORKFLOW = OperationModel.new(
        name: "GetWorkflow",
        http_method: "GET",
        request_uri: "/migrationworkflow/{id}"
      )

      GET_WORKFLOW_STEP = OperationModel.new(
        name: "GetWorkflowStep",
        http_method: "GET",
        request_uri: "/workflowstep/{id}"
      )

      GET_WORKFLOW_STEP_GROUP = OperationModel.new(
        name: "GetWorkflowStepGroup",
        http_method: "GET",
        request_uri: "/workflowstepgroup/{id}"
      )

      LIST_PLUGINS = OperationModel.new(
        name: "ListPlugins",
        http_method: "GET",
        request_uri: "/plugins"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_TEMPLATE_STEP_GROUPS = OperationModel.new(
        name: "ListTemplateStepGroups",
        http_method: "GET",
        request_uri: "/templatestepgroups/{templateId}"
      )

      LIST_TEMPLATE_STEPS = OperationModel.new(
        name: "ListTemplateSteps",
        http_method: "GET",
        request_uri: "/templatesteps"
      )

      LIST_TEMPLATES = OperationModel.new(
        name: "ListTemplates",
        http_method: "GET",
        request_uri: "/migrationworkflowtemplates"
      )

      LIST_WORKFLOW_STEP_GROUPS = OperationModel.new(
        name: "ListWorkflowStepGroups",
        http_method: "GET",
        request_uri: "/workflowstepgroups"
      )

      LIST_WORKFLOW_STEPS = OperationModel.new(
        name: "ListWorkflowSteps",
        http_method: "GET",
        request_uri: "/workflow/{workflowId}/workflowstepgroups/{stepGroupId}/workflowsteps"
      )

      LIST_WORKFLOWS = OperationModel.new(
        name: "ListWorkflows",
        http_method: "GET",
        request_uri: "/migrationworkflows"
      )

      RETRY_WORKFLOW_STEP = OperationModel.new(
        name: "RetryWorkflowStep",
        http_method: "POST",
        request_uri: "/retryworkflowstep/{id}"
      )

      START_WORKFLOW = OperationModel.new(
        name: "StartWorkflow",
        http_method: "POST",
        request_uri: "/migrationworkflow/{id}/start"
      )

      STOP_WORKFLOW = OperationModel.new(
        name: "StopWorkflow",
        http_method: "POST",
        request_uri: "/migrationworkflow/{id}/stop"
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

      UPDATE_TEMPLATE = OperationModel.new(
        name: "UpdateTemplate",
        http_method: "POST",
        request_uri: "/template/{id}"
      )

      UPDATE_WORKFLOW = OperationModel.new(
        name: "UpdateWorkflow",
        http_method: "POST",
        request_uri: "/migrationworkflow/{id}"
      )

      UPDATE_WORKFLOW_STEP = OperationModel.new(
        name: "UpdateWorkflowStep",
        http_method: "POST",
        request_uri: "/workflowstep/{id}"
      )

      UPDATE_WORKFLOW_STEP_GROUP = OperationModel.new(
        name: "UpdateWorkflowStepGroup",
        http_method: "POST",
        request_uri: "/workflowstepgroup/{id}"
      )
    end
  end
end
