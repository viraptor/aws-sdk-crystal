module Aws
  module Imagebuilder
    module Model
      API_VERSION = "2019-12-02"
      TARGET_PREFIX = ""
      SIGNING_NAME = "imagebuilder"
      ENDPOINT_PREFIX = "imagebuilder"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://imagebuilder-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://imagebuilder.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://imagebuilder-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://imagebuilder.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://imagebuilder.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_IMAGE_CREATION = OperationModel.new(
        name: "CancelImageCreation",
        http_method: "PUT",
        request_uri: "/CancelImageCreation"
      )

      CANCEL_LIFECYCLE_EXECUTION = OperationModel.new(
        name: "CancelLifecycleExecution",
        http_method: "PUT",
        request_uri: "/CancelLifecycleExecution"
      )

      CREATE_COMPONENT = OperationModel.new(
        name: "CreateComponent",
        http_method: "PUT",
        request_uri: "/CreateComponent"
      )

      CREATE_CONTAINER_RECIPE = OperationModel.new(
        name: "CreateContainerRecipe",
        http_method: "PUT",
        request_uri: "/CreateContainerRecipe"
      )

      CREATE_DISTRIBUTION_CONFIGURATION = OperationModel.new(
        name: "CreateDistributionConfiguration",
        http_method: "PUT",
        request_uri: "/CreateDistributionConfiguration"
      )

      CREATE_IMAGE = OperationModel.new(
        name: "CreateImage",
        http_method: "PUT",
        request_uri: "/CreateImage"
      )

      CREATE_IMAGE_PIPELINE = OperationModel.new(
        name: "CreateImagePipeline",
        http_method: "PUT",
        request_uri: "/CreateImagePipeline"
      )

      CREATE_IMAGE_RECIPE = OperationModel.new(
        name: "CreateImageRecipe",
        http_method: "PUT",
        request_uri: "/CreateImageRecipe"
      )

      CREATE_INFRASTRUCTURE_CONFIGURATION = OperationModel.new(
        name: "CreateInfrastructureConfiguration",
        http_method: "PUT",
        request_uri: "/CreateInfrastructureConfiguration"
      )

      CREATE_LIFECYCLE_POLICY = OperationModel.new(
        name: "CreateLifecyclePolicy",
        http_method: "PUT",
        request_uri: "/CreateLifecyclePolicy"
      )

      CREATE_WORKFLOW = OperationModel.new(
        name: "CreateWorkflow",
        http_method: "PUT",
        request_uri: "/CreateWorkflow"
      )

      DELETE_COMPONENT = OperationModel.new(
        name: "DeleteComponent",
        http_method: "DELETE",
        request_uri: "/DeleteComponent"
      )

      DELETE_CONTAINER_RECIPE = OperationModel.new(
        name: "DeleteContainerRecipe",
        http_method: "DELETE",
        request_uri: "/DeleteContainerRecipe"
      )

      DELETE_DISTRIBUTION_CONFIGURATION = OperationModel.new(
        name: "DeleteDistributionConfiguration",
        http_method: "DELETE",
        request_uri: "/DeleteDistributionConfiguration"
      )

      DELETE_IMAGE = OperationModel.new(
        name: "DeleteImage",
        http_method: "DELETE",
        request_uri: "/DeleteImage"
      )

      DELETE_IMAGE_PIPELINE = OperationModel.new(
        name: "DeleteImagePipeline",
        http_method: "DELETE",
        request_uri: "/DeleteImagePipeline"
      )

      DELETE_IMAGE_RECIPE = OperationModel.new(
        name: "DeleteImageRecipe",
        http_method: "DELETE",
        request_uri: "/DeleteImageRecipe"
      )

      DELETE_INFRASTRUCTURE_CONFIGURATION = OperationModel.new(
        name: "DeleteInfrastructureConfiguration",
        http_method: "DELETE",
        request_uri: "/DeleteInfrastructureConfiguration"
      )

      DELETE_LIFECYCLE_POLICY = OperationModel.new(
        name: "DeleteLifecyclePolicy",
        http_method: "DELETE",
        request_uri: "/DeleteLifecyclePolicy"
      )

      DELETE_WORKFLOW = OperationModel.new(
        name: "DeleteWorkflow",
        http_method: "DELETE",
        request_uri: "/DeleteWorkflow"
      )

      DISTRIBUTE_IMAGE = OperationModel.new(
        name: "DistributeImage",
        http_method: "PUT",
        request_uri: "/DistributeImage"
      )

      GET_COMPONENT = OperationModel.new(
        name: "GetComponent",
        http_method: "GET",
        request_uri: "/GetComponent"
      )

      GET_COMPONENT_POLICY = OperationModel.new(
        name: "GetComponentPolicy",
        http_method: "GET",
        request_uri: "/GetComponentPolicy"
      )

      GET_CONTAINER_RECIPE = OperationModel.new(
        name: "GetContainerRecipe",
        http_method: "GET",
        request_uri: "/GetContainerRecipe"
      )

      GET_CONTAINER_RECIPE_POLICY = OperationModel.new(
        name: "GetContainerRecipePolicy",
        http_method: "GET",
        request_uri: "/GetContainerRecipePolicy"
      )

      GET_DISTRIBUTION_CONFIGURATION = OperationModel.new(
        name: "GetDistributionConfiguration",
        http_method: "GET",
        request_uri: "/GetDistributionConfiguration"
      )

      GET_IMAGE = OperationModel.new(
        name: "GetImage",
        http_method: "GET",
        request_uri: "/GetImage"
      )

      GET_IMAGE_PIPELINE = OperationModel.new(
        name: "GetImagePipeline",
        http_method: "GET",
        request_uri: "/GetImagePipeline"
      )

      GET_IMAGE_POLICY = OperationModel.new(
        name: "GetImagePolicy",
        http_method: "GET",
        request_uri: "/GetImagePolicy"
      )

      GET_IMAGE_RECIPE = OperationModel.new(
        name: "GetImageRecipe",
        http_method: "GET",
        request_uri: "/GetImageRecipe"
      )

      GET_IMAGE_RECIPE_POLICY = OperationModel.new(
        name: "GetImageRecipePolicy",
        http_method: "GET",
        request_uri: "/GetImageRecipePolicy"
      )

      GET_INFRASTRUCTURE_CONFIGURATION = OperationModel.new(
        name: "GetInfrastructureConfiguration",
        http_method: "GET",
        request_uri: "/GetInfrastructureConfiguration"
      )

      GET_LIFECYCLE_EXECUTION = OperationModel.new(
        name: "GetLifecycleExecution",
        http_method: "GET",
        request_uri: "/GetLifecycleExecution"
      )

      GET_LIFECYCLE_POLICY = OperationModel.new(
        name: "GetLifecyclePolicy",
        http_method: "GET",
        request_uri: "/GetLifecyclePolicy"
      )

      GET_MARKETPLACE_RESOURCE = OperationModel.new(
        name: "GetMarketplaceResource",
        http_method: "POST",
        request_uri: "/GetMarketplaceResource"
      )

      GET_WORKFLOW = OperationModel.new(
        name: "GetWorkflow",
        http_method: "GET",
        request_uri: "/GetWorkflow"
      )

      GET_WORKFLOW_EXECUTION = OperationModel.new(
        name: "GetWorkflowExecution",
        http_method: "GET",
        request_uri: "/GetWorkflowExecution"
      )

      GET_WORKFLOW_STEP_EXECUTION = OperationModel.new(
        name: "GetWorkflowStepExecution",
        http_method: "GET",
        request_uri: "/GetWorkflowStepExecution"
      )

      IMPORT_COMPONENT = OperationModel.new(
        name: "ImportComponent",
        http_method: "PUT",
        request_uri: "/ImportComponent"
      )

      IMPORT_DISK_IMAGE = OperationModel.new(
        name: "ImportDiskImage",
        http_method: "PUT",
        request_uri: "/ImportDiskImage"
      )

      IMPORT_VM_IMAGE = OperationModel.new(
        name: "ImportVmImage",
        http_method: "PUT",
        request_uri: "/ImportVmImage"
      )

      LIST_COMPONENT_BUILD_VERSIONS = OperationModel.new(
        name: "ListComponentBuildVersions",
        http_method: "POST",
        request_uri: "/ListComponentBuildVersions"
      )

      LIST_COMPONENTS = OperationModel.new(
        name: "ListComponents",
        http_method: "POST",
        request_uri: "/ListComponents"
      )

      LIST_CONTAINER_RECIPES = OperationModel.new(
        name: "ListContainerRecipes",
        http_method: "POST",
        request_uri: "/ListContainerRecipes"
      )

      LIST_DISTRIBUTION_CONFIGURATIONS = OperationModel.new(
        name: "ListDistributionConfigurations",
        http_method: "POST",
        request_uri: "/ListDistributionConfigurations"
      )

      LIST_IMAGE_BUILD_VERSIONS = OperationModel.new(
        name: "ListImageBuildVersions",
        http_method: "POST",
        request_uri: "/ListImageBuildVersions"
      )

      LIST_IMAGE_PACKAGES = OperationModel.new(
        name: "ListImagePackages",
        http_method: "POST",
        request_uri: "/ListImagePackages"
      )

      LIST_IMAGE_PIPELINE_IMAGES = OperationModel.new(
        name: "ListImagePipelineImages",
        http_method: "POST",
        request_uri: "/ListImagePipelineImages"
      )

      LIST_IMAGE_PIPELINES = OperationModel.new(
        name: "ListImagePipelines",
        http_method: "POST",
        request_uri: "/ListImagePipelines"
      )

      LIST_IMAGE_RECIPES = OperationModel.new(
        name: "ListImageRecipes",
        http_method: "POST",
        request_uri: "/ListImageRecipes"
      )

      LIST_IMAGE_SCAN_FINDING_AGGREGATIONS = OperationModel.new(
        name: "ListImageScanFindingAggregations",
        http_method: "POST",
        request_uri: "/ListImageScanFindingAggregations"
      )

      LIST_IMAGE_SCAN_FINDINGS = OperationModel.new(
        name: "ListImageScanFindings",
        http_method: "POST",
        request_uri: "/ListImageScanFindings"
      )

      LIST_IMAGES = OperationModel.new(
        name: "ListImages",
        http_method: "POST",
        request_uri: "/ListImages"
      )

      LIST_INFRASTRUCTURE_CONFIGURATIONS = OperationModel.new(
        name: "ListInfrastructureConfigurations",
        http_method: "POST",
        request_uri: "/ListInfrastructureConfigurations"
      )

      LIST_LIFECYCLE_EXECUTION_RESOURCES = OperationModel.new(
        name: "ListLifecycleExecutionResources",
        http_method: "POST",
        request_uri: "/ListLifecycleExecutionResources"
      )

      LIST_LIFECYCLE_EXECUTIONS = OperationModel.new(
        name: "ListLifecycleExecutions",
        http_method: "POST",
        request_uri: "/ListLifecycleExecutions"
      )

      LIST_LIFECYCLE_POLICIES = OperationModel.new(
        name: "ListLifecyclePolicies",
        http_method: "POST",
        request_uri: "/ListLifecyclePolicies"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_WAITING_WORKFLOW_STEPS = OperationModel.new(
        name: "ListWaitingWorkflowSteps",
        http_method: "POST",
        request_uri: "/ListWaitingWorkflowSteps"
      )

      LIST_WORKFLOW_BUILD_VERSIONS = OperationModel.new(
        name: "ListWorkflowBuildVersions",
        http_method: "POST",
        request_uri: "/ListWorkflowBuildVersions"
      )

      LIST_WORKFLOW_EXECUTIONS = OperationModel.new(
        name: "ListWorkflowExecutions",
        http_method: "POST",
        request_uri: "/ListWorkflowExecutions"
      )

      LIST_WORKFLOW_STEP_EXECUTIONS = OperationModel.new(
        name: "ListWorkflowStepExecutions",
        http_method: "POST",
        request_uri: "/ListWorkflowStepExecutions"
      )

      LIST_WORKFLOWS = OperationModel.new(
        name: "ListWorkflows",
        http_method: "POST",
        request_uri: "/ListWorkflows"
      )

      PUT_COMPONENT_POLICY = OperationModel.new(
        name: "PutComponentPolicy",
        http_method: "PUT",
        request_uri: "/PutComponentPolicy"
      )

      PUT_CONTAINER_RECIPE_POLICY = OperationModel.new(
        name: "PutContainerRecipePolicy",
        http_method: "PUT",
        request_uri: "/PutContainerRecipePolicy"
      )

      PUT_IMAGE_POLICY = OperationModel.new(
        name: "PutImagePolicy",
        http_method: "PUT",
        request_uri: "/PutImagePolicy"
      )

      PUT_IMAGE_RECIPE_POLICY = OperationModel.new(
        name: "PutImageRecipePolicy",
        http_method: "PUT",
        request_uri: "/PutImageRecipePolicy"
      )

      RETRY_IMAGE = OperationModel.new(
        name: "RetryImage",
        http_method: "PUT",
        request_uri: "/RetryImage"
      )

      SEND_WORKFLOW_STEP_ACTION = OperationModel.new(
        name: "SendWorkflowStepAction",
        http_method: "PUT",
        request_uri: "/SendWorkflowStepAction"
      )

      START_IMAGE_PIPELINE_EXECUTION = OperationModel.new(
        name: "StartImagePipelineExecution",
        http_method: "PUT",
        request_uri: "/StartImagePipelineExecution"
      )

      START_RESOURCE_STATE_UPDATE = OperationModel.new(
        name: "StartResourceStateUpdate",
        http_method: "PUT",
        request_uri: "/StartResourceStateUpdate"
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

      UPDATE_DISTRIBUTION_CONFIGURATION = OperationModel.new(
        name: "UpdateDistributionConfiguration",
        http_method: "PUT",
        request_uri: "/UpdateDistributionConfiguration"
      )

      UPDATE_IMAGE_PIPELINE = OperationModel.new(
        name: "UpdateImagePipeline",
        http_method: "PUT",
        request_uri: "/UpdateImagePipeline"
      )

      UPDATE_INFRASTRUCTURE_CONFIGURATION = OperationModel.new(
        name: "UpdateInfrastructureConfiguration",
        http_method: "PUT",
        request_uri: "/UpdateInfrastructureConfiguration"
      )

      UPDATE_LIFECYCLE_POLICY = OperationModel.new(
        name: "UpdateLifecyclePolicy",
        http_method: "PUT",
        request_uri: "/UpdateLifecyclePolicy"
      )
    end
  end
end
