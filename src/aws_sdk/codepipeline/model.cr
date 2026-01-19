module AwsSdk
  module CodePipeline
    module Model
      API_VERSION = "2015-07-09"
      TARGET_PREFIX = "CodePipeline_20150709"
      SIGNING_NAME = "codepipeline"
      ENDPOINT_PREFIX = "codepipeline"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codepipeline-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codepipeline-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codepipeline.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codepipeline.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACKNOWLEDGE_JOB = OperationModel.new(
        name: "AcknowledgeJob",
        http_method: "POST",
        request_uri: "/"
      )

      ACKNOWLEDGE_THIRD_PARTY_JOB = OperationModel.new(
        name: "AcknowledgeThirdPartyJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CUSTOM_ACTION_TYPE = OperationModel.new(
        name: "CreateCustomActionType",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PIPELINE = OperationModel.new(
        name: "CreatePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CUSTOM_ACTION_TYPE = OperationModel.new(
        name: "DeleteCustomActionType",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PIPELINE = OperationModel.new(
        name: "DeletePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WEBHOOK = OperationModel.new(
        name: "DeleteWebhook",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_WEBHOOK_WITH_THIRD_PARTY = OperationModel.new(
        name: "DeregisterWebhookWithThirdParty",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_STAGE_TRANSITION = OperationModel.new(
        name: "DisableStageTransition",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_STAGE_TRANSITION = OperationModel.new(
        name: "EnableStageTransition",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACTION_TYPE = OperationModel.new(
        name: "GetActionType",
        http_method: "POST",
        request_uri: "/"
      )

      GET_JOB_DETAILS = OperationModel.new(
        name: "GetJobDetails",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PIPELINE = OperationModel.new(
        name: "GetPipeline",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PIPELINE_EXECUTION = OperationModel.new(
        name: "GetPipelineExecution",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PIPELINE_STATE = OperationModel.new(
        name: "GetPipelineState",
        http_method: "POST",
        request_uri: "/"
      )

      GET_THIRD_PARTY_JOB_DETAILS = OperationModel.new(
        name: "GetThirdPartyJobDetails",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACTION_EXECUTIONS = OperationModel.new(
        name: "ListActionExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACTION_TYPES = OperationModel.new(
        name: "ListActionTypes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEPLOY_ACTION_EXECUTION_TARGETS = OperationModel.new(
        name: "ListDeployActionExecutionTargets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PIPELINE_EXECUTIONS = OperationModel.new(
        name: "ListPipelineExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PIPELINES = OperationModel.new(
        name: "ListPipelines",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RULE_EXECUTIONS = OperationModel.new(
        name: "ListRuleExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RULE_TYPES = OperationModel.new(
        name: "ListRuleTypes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WEBHOOKS = OperationModel.new(
        name: "ListWebhooks",
        http_method: "POST",
        request_uri: "/"
      )

      OVERRIDE_STAGE_CONDITION = OperationModel.new(
        name: "OverrideStageCondition",
        http_method: "POST",
        request_uri: "/"
      )

      POLL_FOR_JOBS = OperationModel.new(
        name: "PollForJobs",
        http_method: "POST",
        request_uri: "/"
      )

      POLL_FOR_THIRD_PARTY_JOBS = OperationModel.new(
        name: "PollForThirdPartyJobs",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ACTION_REVISION = OperationModel.new(
        name: "PutActionRevision",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_APPROVAL_RESULT = OperationModel.new(
        name: "PutApprovalResult",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_JOB_FAILURE_RESULT = OperationModel.new(
        name: "PutJobFailureResult",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_JOB_SUCCESS_RESULT = OperationModel.new(
        name: "PutJobSuccessResult",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_THIRD_PARTY_JOB_FAILURE_RESULT = OperationModel.new(
        name: "PutThirdPartyJobFailureResult",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_THIRD_PARTY_JOB_SUCCESS_RESULT = OperationModel.new(
        name: "PutThirdPartyJobSuccessResult",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_WEBHOOK = OperationModel.new(
        name: "PutWebhook",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_WEBHOOK_WITH_THIRD_PARTY = OperationModel.new(
        name: "RegisterWebhookWithThirdParty",
        http_method: "POST",
        request_uri: "/"
      )

      RETRY_STAGE_EXECUTION = OperationModel.new(
        name: "RetryStageExecution",
        http_method: "POST",
        request_uri: "/"
      )

      ROLLBACK_STAGE = OperationModel.new(
        name: "RollbackStage",
        http_method: "POST",
        request_uri: "/"
      )

      START_PIPELINE_EXECUTION = OperationModel.new(
        name: "StartPipelineExecution",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_PIPELINE_EXECUTION = OperationModel.new(
        name: "StopPipelineExecution",
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

      UPDATE_ACTION_TYPE = OperationModel.new(
        name: "UpdateActionType",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PIPELINE = OperationModel.new(
        name: "UpdatePipeline",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
