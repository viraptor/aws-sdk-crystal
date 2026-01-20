module Aws
  module Bedrock
    module Model
      API_VERSION = "2023-04-20"
      TARGET_PREFIX = ""
      SIGNING_NAME = "bedrock"
      ENDPOINT_PREFIX = "bedrock"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://bedrock.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_DELETE_EVALUATION_JOB = OperationModel.new(
        name: "BatchDeleteEvaluationJob",
        http_method: "POST",
        request_uri: "/evaluation-jobs/batch-delete"
      )

      CANCEL_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW = OperationModel.new(
        name: "CancelAutomatedReasoningPolicyBuildWorkflow",
        http_method: "POST",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}/cancel"
      )

      CREATE_AUTOMATED_REASONING_POLICY = OperationModel.new(
        name: "CreateAutomatedReasoningPolicy",
        http_method: "POST",
        request_uri: "/automated-reasoning-policies"
      )

      CREATE_AUTOMATED_REASONING_POLICY_TEST_CASE = OperationModel.new(
        name: "CreateAutomatedReasoningPolicyTestCase",
        http_method: "POST",
        request_uri: "/automated-reasoning-policies/{policyArn}/test-cases"
      )

      CREATE_AUTOMATED_REASONING_POLICY_VERSION = OperationModel.new(
        name: "CreateAutomatedReasoningPolicyVersion",
        http_method: "POST",
        request_uri: "/automated-reasoning-policies/{policyArn}/versions"
      )

      CREATE_CUSTOM_MODEL = OperationModel.new(
        name: "CreateCustomModel",
        http_method: "POST",
        request_uri: "/custom-models/create-custom-model"
      )

      CREATE_CUSTOM_MODEL_DEPLOYMENT = OperationModel.new(
        name: "CreateCustomModelDeployment",
        http_method: "POST",
        request_uri: "/model-customization/custom-model-deployments"
      )

      CREATE_EVALUATION_JOB = OperationModel.new(
        name: "CreateEvaluationJob",
        http_method: "POST",
        request_uri: "/evaluation-jobs"
      )

      CREATE_FOUNDATION_MODEL_AGREEMENT = OperationModel.new(
        name: "CreateFoundationModelAgreement",
        http_method: "POST",
        request_uri: "/create-foundation-model-agreement"
      )

      CREATE_GUARDRAIL = OperationModel.new(
        name: "CreateGuardrail",
        http_method: "POST",
        request_uri: "/guardrails"
      )

      CREATE_GUARDRAIL_VERSION = OperationModel.new(
        name: "CreateGuardrailVersion",
        http_method: "POST",
        request_uri: "/guardrails/{guardrailIdentifier}"
      )

      CREATE_INFERENCE_PROFILE = OperationModel.new(
        name: "CreateInferenceProfile",
        http_method: "POST",
        request_uri: "/inference-profiles"
      )

      CREATE_MARKETPLACE_MODEL_ENDPOINT = OperationModel.new(
        name: "CreateMarketplaceModelEndpoint",
        http_method: "POST",
        request_uri: "/marketplace-model/endpoints"
      )

      CREATE_MODEL_COPY_JOB = OperationModel.new(
        name: "CreateModelCopyJob",
        http_method: "POST",
        request_uri: "/model-copy-jobs"
      )

      CREATE_MODEL_CUSTOMIZATION_JOB = OperationModel.new(
        name: "CreateModelCustomizationJob",
        http_method: "POST",
        request_uri: "/model-customization-jobs"
      )

      CREATE_MODEL_IMPORT_JOB = OperationModel.new(
        name: "CreateModelImportJob",
        http_method: "POST",
        request_uri: "/model-import-jobs"
      )

      CREATE_MODEL_INVOCATION_JOB = OperationModel.new(
        name: "CreateModelInvocationJob",
        http_method: "POST",
        request_uri: "/model-invocation-job"
      )

      CREATE_PROMPT_ROUTER = OperationModel.new(
        name: "CreatePromptRouter",
        http_method: "POST",
        request_uri: "/prompt-routers"
      )

      CREATE_PROVISIONED_MODEL_THROUGHPUT = OperationModel.new(
        name: "CreateProvisionedModelThroughput",
        http_method: "POST",
        request_uri: "/provisioned-model-throughput"
      )

      DELETE_AUTOMATED_REASONING_POLICY = OperationModel.new(
        name: "DeleteAutomatedReasoningPolicy",
        http_method: "DELETE",
        request_uri: "/automated-reasoning-policies/{policyArn}"
      )

      DELETE_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW = OperationModel.new(
        name: "DeleteAutomatedReasoningPolicyBuildWorkflow",
        http_method: "DELETE",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}"
      )

      DELETE_AUTOMATED_REASONING_POLICY_TEST_CASE = OperationModel.new(
        name: "DeleteAutomatedReasoningPolicyTestCase",
        http_method: "DELETE",
        request_uri: "/automated-reasoning-policies/{policyArn}/test-cases/{testCaseId}"
      )

      DELETE_CUSTOM_MODEL = OperationModel.new(
        name: "DeleteCustomModel",
        http_method: "DELETE",
        request_uri: "/custom-models/{modelIdentifier}"
      )

      DELETE_CUSTOM_MODEL_DEPLOYMENT = OperationModel.new(
        name: "DeleteCustomModelDeployment",
        http_method: "DELETE",
        request_uri: "/model-customization/custom-model-deployments/{customModelDeploymentIdentifier}"
      )

      DELETE_ENFORCED_GUARDRAIL_CONFIGURATION = OperationModel.new(
        name: "DeleteEnforcedGuardrailConfiguration",
        http_method: "DELETE",
        request_uri: "/enforcedGuardrailsConfiguration/{configId}"
      )

      DELETE_FOUNDATION_MODEL_AGREEMENT = OperationModel.new(
        name: "DeleteFoundationModelAgreement",
        http_method: "POST",
        request_uri: "/delete-foundation-model-agreement"
      )

      DELETE_GUARDRAIL = OperationModel.new(
        name: "DeleteGuardrail",
        http_method: "DELETE",
        request_uri: "/guardrails/{guardrailIdentifier}"
      )

      DELETE_IMPORTED_MODEL = OperationModel.new(
        name: "DeleteImportedModel",
        http_method: "DELETE",
        request_uri: "/imported-models/{modelIdentifier}"
      )

      DELETE_INFERENCE_PROFILE = OperationModel.new(
        name: "DeleteInferenceProfile",
        http_method: "DELETE",
        request_uri: "/inference-profiles/{inferenceProfileIdentifier}"
      )

      DELETE_MARKETPLACE_MODEL_ENDPOINT = OperationModel.new(
        name: "DeleteMarketplaceModelEndpoint",
        http_method: "DELETE",
        request_uri: "/marketplace-model/endpoints/{endpointArn}"
      )

      DELETE_MODEL_INVOCATION_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DeleteModelInvocationLoggingConfiguration",
        http_method: "DELETE",
        request_uri: "/logging/modelinvocations"
      )

      DELETE_PROMPT_ROUTER = OperationModel.new(
        name: "DeletePromptRouter",
        http_method: "DELETE",
        request_uri: "/prompt-routers/{promptRouterArn}"
      )

      DELETE_PROVISIONED_MODEL_THROUGHPUT = OperationModel.new(
        name: "DeleteProvisionedModelThroughput",
        http_method: "DELETE",
        request_uri: "/provisioned-model-throughput/{provisionedModelId}"
      )

      DEREGISTER_MARKETPLACE_MODEL_ENDPOINT = OperationModel.new(
        name: "DeregisterMarketplaceModelEndpoint",
        http_method: "DELETE",
        request_uri: "/marketplace-model/endpoints/{endpointArn}/registration"
      )

      EXPORT_AUTOMATED_REASONING_POLICY_VERSION = OperationModel.new(
        name: "ExportAutomatedReasoningPolicyVersion",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/export"
      )

      GET_AUTOMATED_REASONING_POLICY = OperationModel.new(
        name: "GetAutomatedReasoningPolicy",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}"
      )

      GET_AUTOMATED_REASONING_POLICY_ANNOTATIONS = OperationModel.new(
        name: "GetAutomatedReasoningPolicyAnnotations",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}/annotations"
      )

      GET_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW = OperationModel.new(
        name: "GetAutomatedReasoningPolicyBuildWorkflow",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}"
      )

      GET_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW_RESULT_ASSETS = OperationModel.new(
        name: "GetAutomatedReasoningPolicyBuildWorkflowResultAssets",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}/result-assets"
      )

      GET_AUTOMATED_REASONING_POLICY_NEXT_SCENARIO = OperationModel.new(
        name: "GetAutomatedReasoningPolicyNextScenario",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}/scenarios"
      )

      GET_AUTOMATED_REASONING_POLICY_TEST_CASE = OperationModel.new(
        name: "GetAutomatedReasoningPolicyTestCase",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/test-cases/{testCaseId}"
      )

      GET_AUTOMATED_REASONING_POLICY_TEST_RESULT = OperationModel.new(
        name: "GetAutomatedReasoningPolicyTestResult",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}/test-cases/{testCaseId}/test-results"
      )

      GET_CUSTOM_MODEL = OperationModel.new(
        name: "GetCustomModel",
        http_method: "GET",
        request_uri: "/custom-models/{modelIdentifier}"
      )

      GET_CUSTOM_MODEL_DEPLOYMENT = OperationModel.new(
        name: "GetCustomModelDeployment",
        http_method: "GET",
        request_uri: "/model-customization/custom-model-deployments/{customModelDeploymentIdentifier}"
      )

      GET_EVALUATION_JOB = OperationModel.new(
        name: "GetEvaluationJob",
        http_method: "GET",
        request_uri: "/evaluation-jobs/{jobIdentifier}"
      )

      GET_FOUNDATION_MODEL = OperationModel.new(
        name: "GetFoundationModel",
        http_method: "GET",
        request_uri: "/foundation-models/{modelIdentifier}"
      )

      GET_FOUNDATION_MODEL_AVAILABILITY = OperationModel.new(
        name: "GetFoundationModelAvailability",
        http_method: "GET",
        request_uri: "/foundation-model-availability/{modelId}"
      )

      GET_GUARDRAIL = OperationModel.new(
        name: "GetGuardrail",
        http_method: "GET",
        request_uri: "/guardrails/{guardrailIdentifier}"
      )

      GET_IMPORTED_MODEL = OperationModel.new(
        name: "GetImportedModel",
        http_method: "GET",
        request_uri: "/imported-models/{modelIdentifier}"
      )

      GET_INFERENCE_PROFILE = OperationModel.new(
        name: "GetInferenceProfile",
        http_method: "GET",
        request_uri: "/inference-profiles/{inferenceProfileIdentifier}"
      )

      GET_MARKETPLACE_MODEL_ENDPOINT = OperationModel.new(
        name: "GetMarketplaceModelEndpoint",
        http_method: "GET",
        request_uri: "/marketplace-model/endpoints/{endpointArn}"
      )

      GET_MODEL_COPY_JOB = OperationModel.new(
        name: "GetModelCopyJob",
        http_method: "GET",
        request_uri: "/model-copy-jobs/{jobArn}"
      )

      GET_MODEL_CUSTOMIZATION_JOB = OperationModel.new(
        name: "GetModelCustomizationJob",
        http_method: "GET",
        request_uri: "/model-customization-jobs/{jobIdentifier}"
      )

      GET_MODEL_IMPORT_JOB = OperationModel.new(
        name: "GetModelImportJob",
        http_method: "GET",
        request_uri: "/model-import-jobs/{jobIdentifier}"
      )

      GET_MODEL_INVOCATION_JOB = OperationModel.new(
        name: "GetModelInvocationJob",
        http_method: "GET",
        request_uri: "/model-invocation-job/{jobIdentifier}"
      )

      GET_MODEL_INVOCATION_LOGGING_CONFIGURATION = OperationModel.new(
        name: "GetModelInvocationLoggingConfiguration",
        http_method: "GET",
        request_uri: "/logging/modelinvocations"
      )

      GET_PROMPT_ROUTER = OperationModel.new(
        name: "GetPromptRouter",
        http_method: "GET",
        request_uri: "/prompt-routers/{promptRouterArn}"
      )

      GET_PROVISIONED_MODEL_THROUGHPUT = OperationModel.new(
        name: "GetProvisionedModelThroughput",
        http_method: "GET",
        request_uri: "/provisioned-model-throughput/{provisionedModelId}"
      )

      GET_USE_CASE_FOR_MODEL_ACCESS = OperationModel.new(
        name: "GetUseCaseForModelAccess",
        http_method: "GET",
        request_uri: "/use-case-for-model-access"
      )

      LIST_AUTOMATED_REASONING_POLICIES = OperationModel.new(
        name: "ListAutomatedReasoningPolicies",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies"
      )

      LIST_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOWS = OperationModel.new(
        name: "ListAutomatedReasoningPolicyBuildWorkflows",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows"
      )

      LIST_AUTOMATED_REASONING_POLICY_TEST_CASES = OperationModel.new(
        name: "ListAutomatedReasoningPolicyTestCases",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/test-cases"
      )

      LIST_AUTOMATED_REASONING_POLICY_TEST_RESULTS = OperationModel.new(
        name: "ListAutomatedReasoningPolicyTestResults",
        http_method: "GET",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}/test-results"
      )

      LIST_CUSTOM_MODEL_DEPLOYMENTS = OperationModel.new(
        name: "ListCustomModelDeployments",
        http_method: "GET",
        request_uri: "/model-customization/custom-model-deployments"
      )

      LIST_CUSTOM_MODELS = OperationModel.new(
        name: "ListCustomModels",
        http_method: "GET",
        request_uri: "/custom-models"
      )

      LIST_ENFORCED_GUARDRAILS_CONFIGURATION = OperationModel.new(
        name: "ListEnforcedGuardrailsConfiguration",
        http_method: "GET",
        request_uri: "/enforcedGuardrailsConfiguration"
      )

      LIST_EVALUATION_JOBS = OperationModel.new(
        name: "ListEvaluationJobs",
        http_method: "GET",
        request_uri: "/evaluation-jobs"
      )

      LIST_FOUNDATION_MODEL_AGREEMENT_OFFERS = OperationModel.new(
        name: "ListFoundationModelAgreementOffers",
        http_method: "GET",
        request_uri: "/list-foundation-model-agreement-offers/{modelId}"
      )

      LIST_FOUNDATION_MODELS = OperationModel.new(
        name: "ListFoundationModels",
        http_method: "GET",
        request_uri: "/foundation-models"
      )

      LIST_GUARDRAILS = OperationModel.new(
        name: "ListGuardrails",
        http_method: "GET",
        request_uri: "/guardrails"
      )

      LIST_IMPORTED_MODELS = OperationModel.new(
        name: "ListImportedModels",
        http_method: "GET",
        request_uri: "/imported-models"
      )

      LIST_INFERENCE_PROFILES = OperationModel.new(
        name: "ListInferenceProfiles",
        http_method: "GET",
        request_uri: "/inference-profiles"
      )

      LIST_MARKETPLACE_MODEL_ENDPOINTS = OperationModel.new(
        name: "ListMarketplaceModelEndpoints",
        http_method: "GET",
        request_uri: "/marketplace-model/endpoints"
      )

      LIST_MODEL_COPY_JOBS = OperationModel.new(
        name: "ListModelCopyJobs",
        http_method: "GET",
        request_uri: "/model-copy-jobs"
      )

      LIST_MODEL_CUSTOMIZATION_JOBS = OperationModel.new(
        name: "ListModelCustomizationJobs",
        http_method: "GET",
        request_uri: "/model-customization-jobs"
      )

      LIST_MODEL_IMPORT_JOBS = OperationModel.new(
        name: "ListModelImportJobs",
        http_method: "GET",
        request_uri: "/model-import-jobs"
      )

      LIST_MODEL_INVOCATION_JOBS = OperationModel.new(
        name: "ListModelInvocationJobs",
        http_method: "GET",
        request_uri: "/model-invocation-jobs"
      )

      LIST_PROMPT_ROUTERS = OperationModel.new(
        name: "ListPromptRouters",
        http_method: "GET",
        request_uri: "/prompt-routers"
      )

      LIST_PROVISIONED_MODEL_THROUGHPUTS = OperationModel.new(
        name: "ListProvisionedModelThroughputs",
        http_method: "GET",
        request_uri: "/provisioned-model-throughputs"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/listTagsForResource"
      )

      PUT_ENFORCED_GUARDRAIL_CONFIGURATION = OperationModel.new(
        name: "PutEnforcedGuardrailConfiguration",
        http_method: "PUT",
        request_uri: "/enforcedGuardrailsConfiguration"
      )

      PUT_MODEL_INVOCATION_LOGGING_CONFIGURATION = OperationModel.new(
        name: "PutModelInvocationLoggingConfiguration",
        http_method: "PUT",
        request_uri: "/logging/modelinvocations"
      )

      PUT_USE_CASE_FOR_MODEL_ACCESS = OperationModel.new(
        name: "PutUseCaseForModelAccess",
        http_method: "POST",
        request_uri: "/use-case-for-model-access"
      )

      REGISTER_MARKETPLACE_MODEL_ENDPOINT = OperationModel.new(
        name: "RegisterMarketplaceModelEndpoint",
        http_method: "POST",
        request_uri: "/marketplace-model/endpoints/{endpointIdentifier}/registration"
      )

      START_AUTOMATED_REASONING_POLICY_BUILD_WORKFLOW = OperationModel.new(
        name: "StartAutomatedReasoningPolicyBuildWorkflow",
        http_method: "POST",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowType}/start"
      )

      START_AUTOMATED_REASONING_POLICY_TEST_WORKFLOW = OperationModel.new(
        name: "StartAutomatedReasoningPolicyTestWorkflow",
        http_method: "POST",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}/test-workflows"
      )

      STOP_EVALUATION_JOB = OperationModel.new(
        name: "StopEvaluationJob",
        http_method: "POST",
        request_uri: "/evaluation-job/{jobIdentifier}/stop"
      )

      STOP_MODEL_CUSTOMIZATION_JOB = OperationModel.new(
        name: "StopModelCustomizationJob",
        http_method: "POST",
        request_uri: "/model-customization-jobs/{jobIdentifier}/stop"
      )

      STOP_MODEL_INVOCATION_JOB = OperationModel.new(
        name: "StopModelInvocationJob",
        http_method: "POST",
        request_uri: "/model-invocation-job/{jobIdentifier}/stop"
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

      UPDATE_AUTOMATED_REASONING_POLICY = OperationModel.new(
        name: "UpdateAutomatedReasoningPolicy",
        http_method: "PATCH",
        request_uri: "/automated-reasoning-policies/{policyArn}"
      )

      UPDATE_AUTOMATED_REASONING_POLICY_ANNOTATIONS = OperationModel.new(
        name: "UpdateAutomatedReasoningPolicyAnnotations",
        http_method: "PATCH",
        request_uri: "/automated-reasoning-policies/{policyArn}/build-workflows/{buildWorkflowId}/annotations"
      )

      UPDATE_AUTOMATED_REASONING_POLICY_TEST_CASE = OperationModel.new(
        name: "UpdateAutomatedReasoningPolicyTestCase",
        http_method: "PATCH",
        request_uri: "/automated-reasoning-policies/{policyArn}/test-cases/{testCaseId}"
      )

      UPDATE_CUSTOM_MODEL_DEPLOYMENT = OperationModel.new(
        name: "UpdateCustomModelDeployment",
        http_method: "PATCH",
        request_uri: "/model-customization/custom-model-deployments/{customModelDeploymentIdentifier}"
      )

      UPDATE_GUARDRAIL = OperationModel.new(
        name: "UpdateGuardrail",
        http_method: "PUT",
        request_uri: "/guardrails/{guardrailIdentifier}"
      )

      UPDATE_MARKETPLACE_MODEL_ENDPOINT = OperationModel.new(
        name: "UpdateMarketplaceModelEndpoint",
        http_method: "PATCH",
        request_uri: "/marketplace-model/endpoints/{endpointArn}"
      )

      UPDATE_PROVISIONED_MODEL_THROUGHPUT = OperationModel.new(
        name: "UpdateProvisionedModelThroughput",
        http_method: "PATCH",
        request_uri: "/provisioned-model-throughput/{provisionedModelId}"
      )
    end
  end
end
