module AwsSdk
  module NovaAct
    module Model
      API_VERSION = "2025-08-22"
      TARGET_PREFIX = ""
      SIGNING_NAME = "nova-act"
      ENDPOINT_PREFIX = "nova-act"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://nova-act-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://nova-act-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://nova-act.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://nova-act.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ACT = OperationModel.new(
        name: "CreateAct",
        http_method: "PUT",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs/{workflowRunId}/sessions/{sessionId}/acts"
      )

      CREATE_SESSION = OperationModel.new(
        name: "CreateSession",
        http_method: "PUT",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs/{workflowRunId}/sessions"
      )

      CREATE_WORKFLOW_DEFINITION = OperationModel.new(
        name: "CreateWorkflowDefinition",
        http_method: "PUT",
        request_uri: "/workflow-definitions"
      )

      CREATE_WORKFLOW_RUN = OperationModel.new(
        name: "CreateWorkflowRun",
        http_method: "PUT",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs"
      )

      DELETE_WORKFLOW_DEFINITION = OperationModel.new(
        name: "DeleteWorkflowDefinition",
        http_method: "DELETE",
        request_uri: "/workflow-definitions/{workflowDefinitionName}"
      )

      DELETE_WORKFLOW_RUN = OperationModel.new(
        name: "DeleteWorkflowRun",
        http_method: "DELETE",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs/{workflowRunId}"
      )

      GET_WORKFLOW_DEFINITION = OperationModel.new(
        name: "GetWorkflowDefinition",
        http_method: "GET",
        request_uri: "/workflow-definitions/{workflowDefinitionName}"
      )

      GET_WORKFLOW_RUN = OperationModel.new(
        name: "GetWorkflowRun",
        http_method: "GET",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs/{workflowRunId}"
      )

      INVOKE_ACT_STEP = OperationModel.new(
        name: "InvokeActStep",
        http_method: "PUT",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs/{workflowRunId}/sessions/{sessionId}/acts/{actId}/invoke-step/"
      )

      LIST_ACTS = OperationModel.new(
        name: "ListActs",
        http_method: "POST",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/acts"
      )

      LIST_MODELS = OperationModel.new(
        name: "ListModels",
        http_method: "POST",
        request_uri: "/models"
      )

      LIST_SESSIONS = OperationModel.new(
        name: "ListSessions",
        http_method: "POST",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs/{workflowRunId}"
      )

      LIST_WORKFLOW_DEFINITIONS = OperationModel.new(
        name: "ListWorkflowDefinitions",
        http_method: "POST",
        request_uri: "/workflow-definitions"
      )

      LIST_WORKFLOW_RUNS = OperationModel.new(
        name: "ListWorkflowRuns",
        http_method: "POST",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs"
      )

      UPDATE_ACT = OperationModel.new(
        name: "UpdateAct",
        http_method: "PUT",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs/{workflowRunId}/sessions/{sessionId}/acts/{actId}"
      )

      UPDATE_WORKFLOW_RUN = OperationModel.new(
        name: "UpdateWorkflowRun",
        http_method: "PUT",
        request_uri: "/workflow-definitions/{workflowDefinitionName}/workflow-runs/{workflowRunId}"
      )
    end
  end
end
