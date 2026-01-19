module AwsSdk
  module SageMaker
    module Model
      API_VERSION = "2017-07-24"
      TARGET_PREFIX = "SageMaker"
      SIGNING_NAME = "sagemaker"
      ENDPOINT_PREFIX = "api.sagemaker"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.sagemaker-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}],"endpoint":{"url":"https://api-fips.sagemaker.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://api-fips.sagemaker.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://api.sagemaker-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.sagemaker.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://api.sagemaker.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_ASSOCIATION = OperationModel.new(
        name: "AddAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_TAGS = OperationModel.new(
        name: "AddTags",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_TRIAL_COMPONENT = OperationModel.new(
        name: "AssociateTrialComponent",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_CLUSTER_NODE_VOLUME = OperationModel.new(
        name: "AttachClusterNodeVolume",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_ADD_CLUSTER_NODES = OperationModel.new(
        name: "BatchAddClusterNodes",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_CLUSTER_NODES = OperationModel.new(
        name: "BatchDeleteClusterNodes",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DESCRIBE_MODEL_PACKAGE = OperationModel.new(
        name: "BatchDescribeModelPackage",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_REBOOT_CLUSTER_NODES = OperationModel.new(
        name: "BatchRebootClusterNodes",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_REPLACE_CLUSTER_NODES = OperationModel.new(
        name: "BatchReplaceClusterNodes",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACTION = OperationModel.new(
        name: "CreateAction",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ALGORITHM = OperationModel.new(
        name: "CreateAlgorithm",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APP = OperationModel.new(
        name: "CreateApp",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APP_IMAGE_CONFIG = OperationModel.new(
        name: "CreateAppImageConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ARTIFACT = OperationModel.new(
        name: "CreateArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AUTO_ML_JOB = OperationModel.new(
        name: "CreateAutoMLJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AUTO_ML_JOB_V2 = OperationModel.new(
        name: "CreateAutoMLJobV2",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER_SCHEDULER_CONFIG = OperationModel.new(
        name: "CreateClusterSchedulerConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CODE_REPOSITORY = OperationModel.new(
        name: "CreateCodeRepository",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COMPILATION_JOB = OperationModel.new(
        name: "CreateCompilationJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COMPUTE_QUOTA = OperationModel.new(
        name: "CreateComputeQuota",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONTEXT = OperationModel.new(
        name: "CreateContext",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_QUALITY_JOB_DEFINITION = OperationModel.new(
        name: "CreateDataQualityJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DEVICE_FLEET = OperationModel.new(
        name: "CreateDeviceFleet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EDGE_DEPLOYMENT_PLAN = OperationModel.new(
        name: "CreateEdgeDeploymentPlan",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EDGE_DEPLOYMENT_STAGE = OperationModel.new(
        name: "CreateEdgeDeploymentStage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EDGE_PACKAGING_JOB = OperationModel.new(
        name: "CreateEdgePackagingJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENDPOINT = OperationModel.new(
        name: "CreateEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENDPOINT_CONFIG = OperationModel.new(
        name: "CreateEndpointConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EXPERIMENT = OperationModel.new(
        name: "CreateExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FEATURE_GROUP = OperationModel.new(
        name: "CreateFeatureGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLOW_DEFINITION = OperationModel.new(
        name: "CreateFlowDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HUB = OperationModel.new(
        name: "CreateHub",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HUB_CONTENT_PRESIGNED_URLS = OperationModel.new(
        name: "CreateHubContentPresignedUrls",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HUB_CONTENT_REFERENCE = OperationModel.new(
        name: "CreateHubContentReference",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HUMAN_TASK_UI = OperationModel.new(
        name: "CreateHumanTaskUi",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HYPER_PARAMETER_TUNING_JOB = OperationModel.new(
        name: "CreateHyperParameterTuningJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IMAGE = OperationModel.new(
        name: "CreateImage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IMAGE_VERSION = OperationModel.new(
        name: "CreateImageVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INFERENCE_COMPONENT = OperationModel.new(
        name: "CreateInferenceComponent",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INFERENCE_EXPERIMENT = OperationModel.new(
        name: "CreateInferenceExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INFERENCE_RECOMMENDATIONS_JOB = OperationModel.new(
        name: "CreateInferenceRecommendationsJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LABELING_JOB = OperationModel.new(
        name: "CreateLabelingJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MLFLOW_APP = OperationModel.new(
        name: "CreateMlflowApp",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MLFLOW_TRACKING_SERVER = OperationModel.new(
        name: "CreateMlflowTrackingServer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL = OperationModel.new(
        name: "CreateModel",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL_BIAS_JOB_DEFINITION = OperationModel.new(
        name: "CreateModelBiasJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL_CARD = OperationModel.new(
        name: "CreateModelCard",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL_CARD_EXPORT_JOB = OperationModel.new(
        name: "CreateModelCardExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL_EXPLAINABILITY_JOB_DEFINITION = OperationModel.new(
        name: "CreateModelExplainabilityJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL_PACKAGE = OperationModel.new(
        name: "CreateModelPackage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL_PACKAGE_GROUP = OperationModel.new(
        name: "CreateModelPackageGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL_QUALITY_JOB_DEFINITION = OperationModel.new(
        name: "CreateModelQualityJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MONITORING_SCHEDULE = OperationModel.new(
        name: "CreateMonitoringSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NOTEBOOK_INSTANCE = OperationModel.new(
        name: "CreateNotebookInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIG = OperationModel.new(
        name: "CreateNotebookInstanceLifecycleConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_OPTIMIZATION_JOB = OperationModel.new(
        name: "CreateOptimizationJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PARTNER_APP = OperationModel.new(
        name: "CreatePartnerApp",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PARTNER_APP_PRESIGNED_URL = OperationModel.new(
        name: "CreatePartnerAppPresignedUrl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PIPELINE = OperationModel.new(
        name: "CreatePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PRESIGNED_DOMAIN_URL = OperationModel.new(
        name: "CreatePresignedDomainUrl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PRESIGNED_MLFLOW_APP_URL = OperationModel.new(
        name: "CreatePresignedMlflowAppUrl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PRESIGNED_MLFLOW_TRACKING_SERVER_URL = OperationModel.new(
        name: "CreatePresignedMlflowTrackingServerUrl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PRESIGNED_NOTEBOOK_INSTANCE_URL = OperationModel.new(
        name: "CreatePresignedNotebookInstanceUrl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROCESSING_JOB = OperationModel.new(
        name: "CreateProcessingJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROJECT = OperationModel.new(
        name: "CreateProject",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SPACE = OperationModel.new(
        name: "CreateSpace",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STUDIO_LIFECYCLE_CONFIG = OperationModel.new(
        name: "CreateStudioLifecycleConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRAINING_JOB = OperationModel.new(
        name: "CreateTrainingJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRAINING_PLAN = OperationModel.new(
        name: "CreateTrainingPlan",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSFORM_JOB = OperationModel.new(
        name: "CreateTransformJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRIAL = OperationModel.new(
        name: "CreateTrial",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRIAL_COMPONENT = OperationModel.new(
        name: "CreateTrialComponent",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER_PROFILE = OperationModel.new(
        name: "CreateUserProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKFORCE = OperationModel.new(
        name: "CreateWorkforce",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKTEAM = OperationModel.new(
        name: "CreateWorkteam",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACTION = OperationModel.new(
        name: "DeleteAction",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ALGORITHM = OperationModel.new(
        name: "DeleteAlgorithm",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APP = OperationModel.new(
        name: "DeleteApp",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APP_IMAGE_CONFIG = OperationModel.new(
        name: "DeleteAppImageConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ARTIFACT = OperationModel.new(
        name: "DeleteArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ASSOCIATION = OperationModel.new(
        name: "DeleteAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLUSTER_SCHEDULER_CONFIG = OperationModel.new(
        name: "DeleteClusterSchedulerConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CODE_REPOSITORY = OperationModel.new(
        name: "DeleteCodeRepository",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COMPILATION_JOB = OperationModel.new(
        name: "DeleteCompilationJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COMPUTE_QUOTA = OperationModel.new(
        name: "DeleteComputeQuota",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTEXT = OperationModel.new(
        name: "DeleteContext",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATA_QUALITY_JOB_DEFINITION = OperationModel.new(
        name: "DeleteDataQualityJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DEVICE_FLEET = OperationModel.new(
        name: "DeleteDeviceFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EDGE_DEPLOYMENT_PLAN = OperationModel.new(
        name: "DeleteEdgeDeploymentPlan",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EDGE_DEPLOYMENT_STAGE = OperationModel.new(
        name: "DeleteEdgeDeploymentStage",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENDPOINT = OperationModel.new(
        name: "DeleteEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENDPOINT_CONFIG = OperationModel.new(
        name: "DeleteEndpointConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EXPERIMENT = OperationModel.new(
        name: "DeleteExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FEATURE_GROUP = OperationModel.new(
        name: "DeleteFeatureGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLOW_DEFINITION = OperationModel.new(
        name: "DeleteFlowDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HUB = OperationModel.new(
        name: "DeleteHub",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HUB_CONTENT = OperationModel.new(
        name: "DeleteHubContent",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HUB_CONTENT_REFERENCE = OperationModel.new(
        name: "DeleteHubContentReference",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HUMAN_TASK_UI = OperationModel.new(
        name: "DeleteHumanTaskUi",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HYPER_PARAMETER_TUNING_JOB = OperationModel.new(
        name: "DeleteHyperParameterTuningJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IMAGE = OperationModel.new(
        name: "DeleteImage",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IMAGE_VERSION = OperationModel.new(
        name: "DeleteImageVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INFERENCE_COMPONENT = OperationModel.new(
        name: "DeleteInferenceComponent",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INFERENCE_EXPERIMENT = OperationModel.new(
        name: "DeleteInferenceExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MLFLOW_APP = OperationModel.new(
        name: "DeleteMlflowApp",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MLFLOW_TRACKING_SERVER = OperationModel.new(
        name: "DeleteMlflowTrackingServer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL = OperationModel.new(
        name: "DeleteModel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL_BIAS_JOB_DEFINITION = OperationModel.new(
        name: "DeleteModelBiasJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL_CARD = OperationModel.new(
        name: "DeleteModelCard",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL_EXPLAINABILITY_JOB_DEFINITION = OperationModel.new(
        name: "DeleteModelExplainabilityJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL_PACKAGE = OperationModel.new(
        name: "DeleteModelPackage",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL_PACKAGE_GROUP = OperationModel.new(
        name: "DeleteModelPackageGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL_PACKAGE_GROUP_POLICY = OperationModel.new(
        name: "DeleteModelPackageGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL_QUALITY_JOB_DEFINITION = OperationModel.new(
        name: "DeleteModelQualityJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MONITORING_SCHEDULE = OperationModel.new(
        name: "DeleteMonitoringSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NOTEBOOK_INSTANCE = OperationModel.new(
        name: "DeleteNotebookInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIG = OperationModel.new(
        name: "DeleteNotebookInstanceLifecycleConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_OPTIMIZATION_JOB = OperationModel.new(
        name: "DeleteOptimizationJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARTNER_APP = OperationModel.new(
        name: "DeletePartnerApp",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PIPELINE = OperationModel.new(
        name: "DeletePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROCESSING_JOB = OperationModel.new(
        name: "DeleteProcessingJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROJECT = OperationModel.new(
        name: "DeleteProject",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SPACE = OperationModel.new(
        name: "DeleteSpace",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STUDIO_LIFECYCLE_CONFIG = OperationModel.new(
        name: "DeleteStudioLifecycleConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRAINING_JOB = OperationModel.new(
        name: "DeleteTrainingJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRIAL = OperationModel.new(
        name: "DeleteTrial",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRIAL_COMPONENT = OperationModel.new(
        name: "DeleteTrialComponent",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER_PROFILE = OperationModel.new(
        name: "DeleteUserProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKFORCE = OperationModel.new(
        name: "DeleteWorkforce",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKTEAM = OperationModel.new(
        name: "DeleteWorkteam",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_DEVICES = OperationModel.new(
        name: "DeregisterDevices",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACTION = OperationModel.new(
        name: "DescribeAction",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ALGORITHM = OperationModel.new(
        name: "DescribeAlgorithm",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APP = OperationModel.new(
        name: "DescribeApp",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APP_IMAGE_CONFIG = OperationModel.new(
        name: "DescribeAppImageConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ARTIFACT = OperationModel.new(
        name: "DescribeArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTO_ML_JOB = OperationModel.new(
        name: "DescribeAutoMLJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTO_ML_JOB_V2 = OperationModel.new(
        name: "DescribeAutoMLJobV2",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER = OperationModel.new(
        name: "DescribeCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_EVENT = OperationModel.new(
        name: "DescribeClusterEvent",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_NODE = OperationModel.new(
        name: "DescribeClusterNode",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_SCHEDULER_CONFIG = OperationModel.new(
        name: "DescribeClusterSchedulerConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CODE_REPOSITORY = OperationModel.new(
        name: "DescribeCodeRepository",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COMPILATION_JOB = OperationModel.new(
        name: "DescribeCompilationJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COMPUTE_QUOTA = OperationModel.new(
        name: "DescribeComputeQuota",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONTEXT = OperationModel.new(
        name: "DescribeContext",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_QUALITY_JOB_DEFINITION = OperationModel.new(
        name: "DescribeDataQualityJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DEVICE = OperationModel.new(
        name: "DescribeDevice",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DEVICE_FLEET = OperationModel.new(
        name: "DescribeDeviceFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOMAIN = OperationModel.new(
        name: "DescribeDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EDGE_DEPLOYMENT_PLAN = OperationModel.new(
        name: "DescribeEdgeDeploymentPlan",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EDGE_PACKAGING_JOB = OperationModel.new(
        name: "DescribeEdgePackagingJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINT = OperationModel.new(
        name: "DescribeEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINT_CONFIG = OperationModel.new(
        name: "DescribeEndpointConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPERIMENT = OperationModel.new(
        name: "DescribeExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FEATURE_GROUP = OperationModel.new(
        name: "DescribeFeatureGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FEATURE_METADATA = OperationModel.new(
        name: "DescribeFeatureMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLOW_DEFINITION = OperationModel.new(
        name: "DescribeFlowDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HUB = OperationModel.new(
        name: "DescribeHub",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HUB_CONTENT = OperationModel.new(
        name: "DescribeHubContent",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HUMAN_TASK_UI = OperationModel.new(
        name: "DescribeHumanTaskUi",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HYPER_PARAMETER_TUNING_JOB = OperationModel.new(
        name: "DescribeHyperParameterTuningJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE = OperationModel.new(
        name: "DescribeImage",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_VERSION = OperationModel.new(
        name: "DescribeImageVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INFERENCE_COMPONENT = OperationModel.new(
        name: "DescribeInferenceComponent",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INFERENCE_EXPERIMENT = OperationModel.new(
        name: "DescribeInferenceExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INFERENCE_RECOMMENDATIONS_JOB = OperationModel.new(
        name: "DescribeInferenceRecommendationsJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LABELING_JOB = OperationModel.new(
        name: "DescribeLabelingJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LINEAGE_GROUP = OperationModel.new(
        name: "DescribeLineageGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MLFLOW_APP = OperationModel.new(
        name: "DescribeMlflowApp",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MLFLOW_TRACKING_SERVER = OperationModel.new(
        name: "DescribeMlflowTrackingServer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL = OperationModel.new(
        name: "DescribeModel",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL_BIAS_JOB_DEFINITION = OperationModel.new(
        name: "DescribeModelBiasJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL_CARD = OperationModel.new(
        name: "DescribeModelCard",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL_CARD_EXPORT_JOB = OperationModel.new(
        name: "DescribeModelCardExportJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL_EXPLAINABILITY_JOB_DEFINITION = OperationModel.new(
        name: "DescribeModelExplainabilityJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL_PACKAGE = OperationModel.new(
        name: "DescribeModelPackage",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL_PACKAGE_GROUP = OperationModel.new(
        name: "DescribeModelPackageGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MODEL_QUALITY_JOB_DEFINITION = OperationModel.new(
        name: "DescribeModelQualityJobDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MONITORING_SCHEDULE = OperationModel.new(
        name: "DescribeMonitoringSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NOTEBOOK_INSTANCE = OperationModel.new(
        name: "DescribeNotebookInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIG = OperationModel.new(
        name: "DescribeNotebookInstanceLifecycleConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_OPTIMIZATION_JOB = OperationModel.new(
        name: "DescribeOptimizationJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PARTNER_APP = OperationModel.new(
        name: "DescribePartnerApp",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PIPELINE = OperationModel.new(
        name: "DescribePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PIPELINE_DEFINITION_FOR_EXECUTION = OperationModel.new(
        name: "DescribePipelineDefinitionForExecution",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PIPELINE_EXECUTION = OperationModel.new(
        name: "DescribePipelineExecution",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROCESSING_JOB = OperationModel.new(
        name: "DescribeProcessingJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROJECT = OperationModel.new(
        name: "DescribeProject",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_CAPACITY = OperationModel.new(
        name: "DescribeReservedCapacity",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPACE = OperationModel.new(
        name: "DescribeSpace",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STUDIO_LIFECYCLE_CONFIG = OperationModel.new(
        name: "DescribeStudioLifecycleConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SUBSCRIBED_WORKTEAM = OperationModel.new(
        name: "DescribeSubscribedWorkteam",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRAINING_JOB = OperationModel.new(
        name: "DescribeTrainingJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRAINING_PLAN = OperationModel.new(
        name: "DescribeTrainingPlan",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSFORM_JOB = OperationModel.new(
        name: "DescribeTransformJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRIAL = OperationModel.new(
        name: "DescribeTrial",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRIAL_COMPONENT = OperationModel.new(
        name: "DescribeTrialComponent",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER_PROFILE = OperationModel.new(
        name: "DescribeUserProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKFORCE = OperationModel.new(
        name: "DescribeWorkforce",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKTEAM = OperationModel.new(
        name: "DescribeWorkteam",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_CLUSTER_NODE_VOLUME = OperationModel.new(
        name: "DetachClusterNodeVolume",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_SAGEMAKER_SERVICECATALOG_PORTFOLIO = OperationModel.new(
        name: "DisableSagemakerServicecatalogPortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_TRIAL_COMPONENT = OperationModel.new(
        name: "DisassociateTrialComponent",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_SAGEMAKER_SERVICECATALOG_PORTFOLIO = OperationModel.new(
        name: "EnableSagemakerServicecatalogPortfolio",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEVICE_FLEET_REPORT = OperationModel.new(
        name: "GetDeviceFleetReport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LINEAGE_GROUP_POLICY = OperationModel.new(
        name: "GetLineageGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MODEL_PACKAGE_GROUP_POLICY = OperationModel.new(
        name: "GetModelPackageGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SAGEMAKER_SERVICECATALOG_PORTFOLIO_STATUS = OperationModel.new(
        name: "GetSagemakerServicecatalogPortfolioStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SCALING_CONFIGURATION_RECOMMENDATION = OperationModel.new(
        name: "GetScalingConfigurationRecommendation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SEARCH_SUGGESTIONS = OperationModel.new(
        name: "GetSearchSuggestions",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_HUB_CONTENT = OperationModel.new(
        name: "ImportHubContent",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACTIONS = OperationModel.new(
        name: "ListActions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ALGORITHMS = OperationModel.new(
        name: "ListAlgorithms",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ALIASES = OperationModel.new(
        name: "ListAliases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APP_IMAGE_CONFIGS = OperationModel.new(
        name: "ListAppImageConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPS = OperationModel.new(
        name: "ListApps",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ARTIFACTS = OperationModel.new(
        name: "ListArtifacts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSOCIATIONS = OperationModel.new(
        name: "ListAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTO_ML_JOBS = OperationModel.new(
        name: "ListAutoMLJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CANDIDATES_FOR_AUTO_ML_JOB = OperationModel.new(
        name: "ListCandidatesForAutoMLJob",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLUSTER_EVENTS = OperationModel.new(
        name: "ListClusterEvents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLUSTER_NODES = OperationModel.new(
        name: "ListClusterNodes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLUSTER_SCHEDULER_CONFIGS = OperationModel.new(
        name: "ListClusterSchedulerConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CODE_REPOSITORIES = OperationModel.new(
        name: "ListCodeRepositories",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPILATION_JOBS = OperationModel.new(
        name: "ListCompilationJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPUTE_QUOTAS = OperationModel.new(
        name: "ListComputeQuotas",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONTEXTS = OperationModel.new(
        name: "ListContexts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_QUALITY_JOB_DEFINITIONS = OperationModel.new(
        name: "ListDataQualityJobDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEVICE_FLEETS = OperationModel.new(
        name: "ListDeviceFleets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEVICES = OperationModel.new(
        name: "ListDevices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOMAINS = OperationModel.new(
        name: "ListDomains",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EDGE_DEPLOYMENT_PLANS = OperationModel.new(
        name: "ListEdgeDeploymentPlans",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EDGE_PACKAGING_JOBS = OperationModel.new(
        name: "ListEdgePackagingJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENDPOINT_CONFIGS = OperationModel.new(
        name: "ListEndpointConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENDPOINTS = OperationModel.new(
        name: "ListEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXPERIMENTS = OperationModel.new(
        name: "ListExperiments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FEATURE_GROUPS = OperationModel.new(
        name: "ListFeatureGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLOW_DEFINITIONS = OperationModel.new(
        name: "ListFlowDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HUB_CONTENT_VERSIONS = OperationModel.new(
        name: "ListHubContentVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HUB_CONTENTS = OperationModel.new(
        name: "ListHubContents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HUBS = OperationModel.new(
        name: "ListHubs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HUMAN_TASK_UIS = OperationModel.new(
        name: "ListHumanTaskUis",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HYPER_PARAMETER_TUNING_JOBS = OperationModel.new(
        name: "ListHyperParameterTuningJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMAGE_VERSIONS = OperationModel.new(
        name: "ListImageVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMAGES = OperationModel.new(
        name: "ListImages",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INFERENCE_COMPONENTS = OperationModel.new(
        name: "ListInferenceComponents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INFERENCE_EXPERIMENTS = OperationModel.new(
        name: "ListInferenceExperiments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INFERENCE_RECOMMENDATIONS_JOB_STEPS = OperationModel.new(
        name: "ListInferenceRecommendationsJobSteps",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INFERENCE_RECOMMENDATIONS_JOBS = OperationModel.new(
        name: "ListInferenceRecommendationsJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LABELING_JOBS = OperationModel.new(
        name: "ListLabelingJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LABELING_JOBS_FOR_WORKTEAM = OperationModel.new(
        name: "ListLabelingJobsForWorkteam",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LINEAGE_GROUPS = OperationModel.new(
        name: "ListLineageGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MLFLOW_APPS = OperationModel.new(
        name: "ListMlflowApps",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MLFLOW_TRACKING_SERVERS = OperationModel.new(
        name: "ListMlflowTrackingServers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_BIAS_JOB_DEFINITIONS = OperationModel.new(
        name: "ListModelBiasJobDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_CARD_EXPORT_JOBS = OperationModel.new(
        name: "ListModelCardExportJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_CARD_VERSIONS = OperationModel.new(
        name: "ListModelCardVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_CARDS = OperationModel.new(
        name: "ListModelCards",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_EXPLAINABILITY_JOB_DEFINITIONS = OperationModel.new(
        name: "ListModelExplainabilityJobDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_METADATA = OperationModel.new(
        name: "ListModelMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_PACKAGE_GROUPS = OperationModel.new(
        name: "ListModelPackageGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_PACKAGES = OperationModel.new(
        name: "ListModelPackages",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_QUALITY_JOB_DEFINITIONS = OperationModel.new(
        name: "ListModelQualityJobDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODELS = OperationModel.new(
        name: "ListModels",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MONITORING_ALERT_HISTORY = OperationModel.new(
        name: "ListMonitoringAlertHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MONITORING_ALERTS = OperationModel.new(
        name: "ListMonitoringAlerts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MONITORING_EXECUTIONS = OperationModel.new(
        name: "ListMonitoringExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MONITORING_SCHEDULES = OperationModel.new(
        name: "ListMonitoringSchedules",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIGS = OperationModel.new(
        name: "ListNotebookInstanceLifecycleConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NOTEBOOK_INSTANCES = OperationModel.new(
        name: "ListNotebookInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPTIMIZATION_JOBS = OperationModel.new(
        name: "ListOptimizationJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PARTNER_APPS = OperationModel.new(
        name: "ListPartnerApps",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PIPELINE_EXECUTION_STEPS = OperationModel.new(
        name: "ListPipelineExecutionSteps",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PIPELINE_EXECUTIONS = OperationModel.new(
        name: "ListPipelineExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PIPELINE_PARAMETERS_FOR_EXECUTION = OperationModel.new(
        name: "ListPipelineParametersForExecution",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PIPELINE_VERSIONS = OperationModel.new(
        name: "ListPipelineVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PIPELINES = OperationModel.new(
        name: "ListPipelines",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROCESSING_JOBS = OperationModel.new(
        name: "ListProcessingJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROJECTS = OperationModel.new(
        name: "ListProjects",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_CATALOGS = OperationModel.new(
        name: "ListResourceCatalogs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SPACES = OperationModel.new(
        name: "ListSpaces",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STAGE_DEVICES = OperationModel.new(
        name: "ListStageDevices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STUDIO_LIFECYCLE_CONFIGS = OperationModel.new(
        name: "ListStudioLifecycleConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SUBSCRIBED_WORKTEAMS = OperationModel.new(
        name: "ListSubscribedWorkteams",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS = OperationModel.new(
        name: "ListTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRAINING_JOBS = OperationModel.new(
        name: "ListTrainingJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRAINING_JOBS_FOR_HYPER_PARAMETER_TUNING_JOB = OperationModel.new(
        name: "ListTrainingJobsForHyperParameterTuningJob",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRAINING_PLANS = OperationModel.new(
        name: "ListTrainingPlans",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRANSFORM_JOBS = OperationModel.new(
        name: "ListTransformJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRIAL_COMPONENTS = OperationModel.new(
        name: "ListTrialComponents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRIALS = OperationModel.new(
        name: "ListTrials",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ULTRA_SERVERS_BY_RESERVED_CAPACITY = OperationModel.new(
        name: "ListUltraServersByReservedCapacity",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USER_PROFILES = OperationModel.new(
        name: "ListUserProfiles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKFORCES = OperationModel.new(
        name: "ListWorkforces",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKTEAMS = OperationModel.new(
        name: "ListWorkteams",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_MODEL_PACKAGE_GROUP_POLICY = OperationModel.new(
        name: "PutModelPackageGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      QUERY_LINEAGE = OperationModel.new(
        name: "QueryLineage",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_DEVICES = OperationModel.new(
        name: "RegisterDevices",
        http_method: "POST",
        request_uri: "/"
      )

      RENDER_UI_TEMPLATE = OperationModel.new(
        name: "RenderUiTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      RETRY_PIPELINE_EXECUTION = OperationModel.new(
        name: "RetryPipelineExecution",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH = OperationModel.new(
        name: "Search",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_TRAINING_PLAN_OFFERINGS = OperationModel.new(
        name: "SearchTrainingPlanOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_PIPELINE_EXECUTION_STEP_FAILURE = OperationModel.new(
        name: "SendPipelineExecutionStepFailure",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_PIPELINE_EXECUTION_STEP_SUCCESS = OperationModel.new(
        name: "SendPipelineExecutionStepSuccess",
        http_method: "POST",
        request_uri: "/"
      )

      START_EDGE_DEPLOYMENT_STAGE = OperationModel.new(
        name: "StartEdgeDeploymentStage",
        http_method: "POST",
        request_uri: "/"
      )

      START_INFERENCE_EXPERIMENT = OperationModel.new(
        name: "StartInferenceExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      START_MLFLOW_TRACKING_SERVER = OperationModel.new(
        name: "StartMlflowTrackingServer",
        http_method: "POST",
        request_uri: "/"
      )

      START_MONITORING_SCHEDULE = OperationModel.new(
        name: "StartMonitoringSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      START_NOTEBOOK_INSTANCE = OperationModel.new(
        name: "StartNotebookInstance",
        http_method: "POST",
        request_uri: "/"
      )

      START_PIPELINE_EXECUTION = OperationModel.new(
        name: "StartPipelineExecution",
        http_method: "POST",
        request_uri: "/"
      )

      START_SESSION = OperationModel.new(
        name: "StartSession",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_AUTO_ML_JOB = OperationModel.new(
        name: "StopAutoMLJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_COMPILATION_JOB = OperationModel.new(
        name: "StopCompilationJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_EDGE_DEPLOYMENT_STAGE = OperationModel.new(
        name: "StopEdgeDeploymentStage",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_EDGE_PACKAGING_JOB = OperationModel.new(
        name: "StopEdgePackagingJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_HYPER_PARAMETER_TUNING_JOB = OperationModel.new(
        name: "StopHyperParameterTuningJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_INFERENCE_EXPERIMENT = OperationModel.new(
        name: "StopInferenceExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_INFERENCE_RECOMMENDATIONS_JOB = OperationModel.new(
        name: "StopInferenceRecommendationsJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_LABELING_JOB = OperationModel.new(
        name: "StopLabelingJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_MLFLOW_TRACKING_SERVER = OperationModel.new(
        name: "StopMlflowTrackingServer",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_MONITORING_SCHEDULE = OperationModel.new(
        name: "StopMonitoringSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_NOTEBOOK_INSTANCE = OperationModel.new(
        name: "StopNotebookInstance",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_OPTIMIZATION_JOB = OperationModel.new(
        name: "StopOptimizationJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_PIPELINE_EXECUTION = OperationModel.new(
        name: "StopPipelineExecution",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_PROCESSING_JOB = OperationModel.new(
        name: "StopProcessingJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_TRAINING_JOB = OperationModel.new(
        name: "StopTrainingJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_TRANSFORM_JOB = OperationModel.new(
        name: "StopTransformJob",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACTION = OperationModel.new(
        name: "UpdateAction",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APP_IMAGE_CONFIG = OperationModel.new(
        name: "UpdateAppImageConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ARTIFACT = OperationModel.new(
        name: "UpdateArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CLUSTER = OperationModel.new(
        name: "UpdateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CLUSTER_SCHEDULER_CONFIG = OperationModel.new(
        name: "UpdateClusterSchedulerConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CLUSTER_SOFTWARE = OperationModel.new(
        name: "UpdateClusterSoftware",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CODE_REPOSITORY = OperationModel.new(
        name: "UpdateCodeRepository",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COMPUTE_QUOTA = OperationModel.new(
        name: "UpdateComputeQuota",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONTEXT = OperationModel.new(
        name: "UpdateContext",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEVICE_FLEET = OperationModel.new(
        name: "UpdateDeviceFleet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEVICES = OperationModel.new(
        name: "UpdateDevices",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DOMAIN = OperationModel.new(
        name: "UpdateDomain",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENDPOINT = OperationModel.new(
        name: "UpdateEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENDPOINT_WEIGHTS_AND_CAPACITIES = OperationModel.new(
        name: "UpdateEndpointWeightsAndCapacities",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_EXPERIMENT = OperationModel.new(
        name: "UpdateExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FEATURE_GROUP = OperationModel.new(
        name: "UpdateFeatureGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FEATURE_METADATA = OperationModel.new(
        name: "UpdateFeatureMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_HUB = OperationModel.new(
        name: "UpdateHub",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_HUB_CONTENT = OperationModel.new(
        name: "UpdateHubContent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_HUB_CONTENT_REFERENCE = OperationModel.new(
        name: "UpdateHubContentReference",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_IMAGE = OperationModel.new(
        name: "UpdateImage",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_IMAGE_VERSION = OperationModel.new(
        name: "UpdateImageVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INFERENCE_COMPONENT = OperationModel.new(
        name: "UpdateInferenceComponent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INFERENCE_COMPONENT_RUNTIME_CONFIG = OperationModel.new(
        name: "UpdateInferenceComponentRuntimeConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INFERENCE_EXPERIMENT = OperationModel.new(
        name: "UpdateInferenceExperiment",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MLFLOW_APP = OperationModel.new(
        name: "UpdateMlflowApp",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MLFLOW_TRACKING_SERVER = OperationModel.new(
        name: "UpdateMlflowTrackingServer",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MODEL_CARD = OperationModel.new(
        name: "UpdateModelCard",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MODEL_PACKAGE = OperationModel.new(
        name: "UpdateModelPackage",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MONITORING_ALERT = OperationModel.new(
        name: "UpdateMonitoringAlert",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MONITORING_SCHEDULE = OperationModel.new(
        name: "UpdateMonitoringSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NOTEBOOK_INSTANCE = OperationModel.new(
        name: "UpdateNotebookInstance",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIG = OperationModel.new(
        name: "UpdateNotebookInstanceLifecycleConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PARTNER_APP = OperationModel.new(
        name: "UpdatePartnerApp",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PIPELINE = OperationModel.new(
        name: "UpdatePipeline",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PIPELINE_EXECUTION = OperationModel.new(
        name: "UpdatePipelineExecution",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PIPELINE_VERSION = OperationModel.new(
        name: "UpdatePipelineVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROJECT = OperationModel.new(
        name: "UpdateProject",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SPACE = OperationModel.new(
        name: "UpdateSpace",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TRAINING_JOB = OperationModel.new(
        name: "UpdateTrainingJob",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TRIAL = OperationModel.new(
        name: "UpdateTrial",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TRIAL_COMPONENT = OperationModel.new(
        name: "UpdateTrialComponent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER_PROFILE = OperationModel.new(
        name: "UpdateUserProfile",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORKFORCE = OperationModel.new(
        name: "UpdateWorkforce",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORKTEAM = OperationModel.new(
        name: "UpdateWorkteam",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
