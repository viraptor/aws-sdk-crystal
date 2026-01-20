module Aws
  module CleanRoomsML
    module Model
      API_VERSION = "2023-09-06"
      TARGET_PREFIX = ""
      SIGNING_NAME = "cleanrooms-ml"
      ENDPOINT_PREFIX = "cleanrooms-ml"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cleanrooms-ml-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cleanrooms-ml-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cleanrooms-ml.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cleanrooms-ml.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_TRAINED_MODEL = OperationModel.new(
        name: "CancelTrainedModel",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/trained-models/{trainedModelArn}"
      )

      CANCEL_TRAINED_MODEL_INFERENCE_JOB = OperationModel.new(
        name: "CancelTrainedModelInferenceJob",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/trained-model-inference-jobs/{trainedModelInferenceJobArn}"
      )

      CREATE_AUDIENCE_MODEL = OperationModel.new(
        name: "CreateAudienceModel",
        http_method: "POST",
        request_uri: "/audience-model"
      )

      CREATE_CONFIGURED_AUDIENCE_MODEL = OperationModel.new(
        name: "CreateConfiguredAudienceModel",
        http_method: "POST",
        request_uri: "/configured-audience-model"
      )

      CREATE_CONFIGURED_MODEL_ALGORITHM = OperationModel.new(
        name: "CreateConfiguredModelAlgorithm",
        http_method: "POST",
        request_uri: "/configured-model-algorithms"
      )

      CREATE_CONFIGURED_MODEL_ALGORITHM_ASSOCIATION = OperationModel.new(
        name: "CreateConfiguredModelAlgorithmAssociation",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/configured-model-algorithm-associations"
      )

      CREATE_ML_INPUT_CHANNEL = OperationModel.new(
        name: "CreateMLInputChannel",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/ml-input-channels"
      )

      CREATE_TRAINED_MODEL = OperationModel.new(
        name: "CreateTrainedModel",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/trained-models"
      )

      CREATE_TRAINING_DATASET = OperationModel.new(
        name: "CreateTrainingDataset",
        http_method: "POST",
        request_uri: "/training-dataset"
      )

      DELETE_AUDIENCE_GENERATION_JOB = OperationModel.new(
        name: "DeleteAudienceGenerationJob",
        http_method: "DELETE",
        request_uri: "/audience-generation-job/{audienceGenerationJobArn}"
      )

      DELETE_AUDIENCE_MODEL = OperationModel.new(
        name: "DeleteAudienceModel",
        http_method: "DELETE",
        request_uri: "/audience-model/{audienceModelArn}"
      )

      DELETE_CONFIGURED_AUDIENCE_MODEL = OperationModel.new(
        name: "DeleteConfiguredAudienceModel",
        http_method: "DELETE",
        request_uri: "/configured-audience-model/{configuredAudienceModelArn}"
      )

      DELETE_CONFIGURED_AUDIENCE_MODEL_POLICY = OperationModel.new(
        name: "DeleteConfiguredAudienceModelPolicy",
        http_method: "DELETE",
        request_uri: "/configured-audience-model/{configuredAudienceModelArn}/policy"
      )

      DELETE_CONFIGURED_MODEL_ALGORITHM = OperationModel.new(
        name: "DeleteConfiguredModelAlgorithm",
        http_method: "DELETE",
        request_uri: "/configured-model-algorithms/{configuredModelAlgorithmArn}"
      )

      DELETE_CONFIGURED_MODEL_ALGORITHM_ASSOCIATION = OperationModel.new(
        name: "DeleteConfiguredModelAlgorithmAssociation",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/configured-model-algorithm-associations/{configuredModelAlgorithmAssociationArn}"
      )

      DELETE_ML_CONFIGURATION = OperationModel.new(
        name: "DeleteMLConfiguration",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/ml-configurations"
      )

      DELETE_ML_INPUT_CHANNEL_DATA = OperationModel.new(
        name: "DeleteMLInputChannelData",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/ml-input-channels/{mlInputChannelArn}"
      )

      DELETE_TRAINED_MODEL_OUTPUT = OperationModel.new(
        name: "DeleteTrainedModelOutput",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/trained-models/{trainedModelArn}"
      )

      DELETE_TRAINING_DATASET = OperationModel.new(
        name: "DeleteTrainingDataset",
        http_method: "DELETE",
        request_uri: "/training-dataset/{trainingDatasetArn}"
      )

      GET_AUDIENCE_GENERATION_JOB = OperationModel.new(
        name: "GetAudienceGenerationJob",
        http_method: "GET",
        request_uri: "/audience-generation-job/{audienceGenerationJobArn}"
      )

      GET_AUDIENCE_MODEL = OperationModel.new(
        name: "GetAudienceModel",
        http_method: "GET",
        request_uri: "/audience-model/{audienceModelArn}"
      )

      GET_COLLABORATION_CONFIGURED_MODEL_ALGORITHM_ASSOCIATION = OperationModel.new(
        name: "GetCollaborationConfiguredModelAlgorithmAssociation",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/configured-model-algorithm-associations/{configuredModelAlgorithmAssociationArn}"
      )

      GET_COLLABORATION_ML_INPUT_CHANNEL = OperationModel.new(
        name: "GetCollaborationMLInputChannel",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/ml-input-channels/{mlInputChannelArn}"
      )

      GET_COLLABORATION_TRAINED_MODEL = OperationModel.new(
        name: "GetCollaborationTrainedModel",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/trained-models/{trainedModelArn}"
      )

      GET_CONFIGURED_AUDIENCE_MODEL = OperationModel.new(
        name: "GetConfiguredAudienceModel",
        http_method: "GET",
        request_uri: "/configured-audience-model/{configuredAudienceModelArn}"
      )

      GET_CONFIGURED_AUDIENCE_MODEL_POLICY = OperationModel.new(
        name: "GetConfiguredAudienceModelPolicy",
        http_method: "GET",
        request_uri: "/configured-audience-model/{configuredAudienceModelArn}/policy"
      )

      GET_CONFIGURED_MODEL_ALGORITHM = OperationModel.new(
        name: "GetConfiguredModelAlgorithm",
        http_method: "GET",
        request_uri: "/configured-model-algorithms/{configuredModelAlgorithmArn}"
      )

      GET_CONFIGURED_MODEL_ALGORITHM_ASSOCIATION = OperationModel.new(
        name: "GetConfiguredModelAlgorithmAssociation",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/configured-model-algorithm-associations/{configuredModelAlgorithmAssociationArn}"
      )

      GET_ML_CONFIGURATION = OperationModel.new(
        name: "GetMLConfiguration",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/ml-configurations"
      )

      GET_ML_INPUT_CHANNEL = OperationModel.new(
        name: "GetMLInputChannel",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/ml-input-channels/{mlInputChannelArn}"
      )

      GET_TRAINED_MODEL = OperationModel.new(
        name: "GetTrainedModel",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/trained-models/{trainedModelArn}"
      )

      GET_TRAINED_MODEL_INFERENCE_JOB = OperationModel.new(
        name: "GetTrainedModelInferenceJob",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/trained-model-inference-jobs/{trainedModelInferenceJobArn}"
      )

      GET_TRAINING_DATASET = OperationModel.new(
        name: "GetTrainingDataset",
        http_method: "GET",
        request_uri: "/training-dataset/{trainingDatasetArn}"
      )

      LIST_AUDIENCE_EXPORT_JOBS = OperationModel.new(
        name: "ListAudienceExportJobs",
        http_method: "GET",
        request_uri: "/audience-export-job"
      )

      LIST_AUDIENCE_GENERATION_JOBS = OperationModel.new(
        name: "ListAudienceGenerationJobs",
        http_method: "GET",
        request_uri: "/audience-generation-job"
      )

      LIST_AUDIENCE_MODELS = OperationModel.new(
        name: "ListAudienceModels",
        http_method: "GET",
        request_uri: "/audience-model"
      )

      LIST_COLLABORATION_CONFIGURED_MODEL_ALGORITHM_ASSOCIATIONS = OperationModel.new(
        name: "ListCollaborationConfiguredModelAlgorithmAssociations",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/configured-model-algorithm-associations"
      )

      LIST_COLLABORATION_ML_INPUT_CHANNELS = OperationModel.new(
        name: "ListCollaborationMLInputChannels",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/ml-input-channels"
      )

      LIST_COLLABORATION_TRAINED_MODEL_EXPORT_JOBS = OperationModel.new(
        name: "ListCollaborationTrainedModelExportJobs",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/trained-models/{trainedModelArn}/export-jobs"
      )

      LIST_COLLABORATION_TRAINED_MODEL_INFERENCE_JOBS = OperationModel.new(
        name: "ListCollaborationTrainedModelInferenceJobs",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/trained-model-inference-jobs"
      )

      LIST_COLLABORATION_TRAINED_MODELS = OperationModel.new(
        name: "ListCollaborationTrainedModels",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/trained-models"
      )

      LIST_CONFIGURED_AUDIENCE_MODELS = OperationModel.new(
        name: "ListConfiguredAudienceModels",
        http_method: "GET",
        request_uri: "/configured-audience-model"
      )

      LIST_CONFIGURED_MODEL_ALGORITHM_ASSOCIATIONS = OperationModel.new(
        name: "ListConfiguredModelAlgorithmAssociations",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/configured-model-algorithm-associations"
      )

      LIST_CONFIGURED_MODEL_ALGORITHMS = OperationModel.new(
        name: "ListConfiguredModelAlgorithms",
        http_method: "GET",
        request_uri: "/configured-model-algorithms"
      )

      LIST_ML_INPUT_CHANNELS = OperationModel.new(
        name: "ListMLInputChannels",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/ml-input-channels"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_TRAINED_MODEL_INFERENCE_JOBS = OperationModel.new(
        name: "ListTrainedModelInferenceJobs",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/trained-model-inference-jobs"
      )

      LIST_TRAINED_MODEL_VERSIONS = OperationModel.new(
        name: "ListTrainedModelVersions",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/trained-models/{trainedModelArn}/versions"
      )

      LIST_TRAINED_MODELS = OperationModel.new(
        name: "ListTrainedModels",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/trained-models"
      )

      LIST_TRAINING_DATASETS = OperationModel.new(
        name: "ListTrainingDatasets",
        http_method: "GET",
        request_uri: "/training-dataset"
      )

      PUT_CONFIGURED_AUDIENCE_MODEL_POLICY = OperationModel.new(
        name: "PutConfiguredAudienceModelPolicy",
        http_method: "PUT",
        request_uri: "/configured-audience-model/{configuredAudienceModelArn}/policy"
      )

      PUT_ML_CONFIGURATION = OperationModel.new(
        name: "PutMLConfiguration",
        http_method: "PUT",
        request_uri: "/memberships/{membershipIdentifier}/ml-configurations"
      )

      START_AUDIENCE_EXPORT_JOB = OperationModel.new(
        name: "StartAudienceExportJob",
        http_method: "POST",
        request_uri: "/audience-export-job"
      )

      START_AUDIENCE_GENERATION_JOB = OperationModel.new(
        name: "StartAudienceGenerationJob",
        http_method: "POST",
        request_uri: "/audience-generation-job"
      )

      START_TRAINED_MODEL_EXPORT_JOB = OperationModel.new(
        name: "StartTrainedModelExportJob",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/trained-models/{trainedModelArn}/export-jobs"
      )

      START_TRAINED_MODEL_INFERENCE_JOB = OperationModel.new(
        name: "StartTrainedModelInferenceJob",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/trained-model-inference-jobs"
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

      UPDATE_CONFIGURED_AUDIENCE_MODEL = OperationModel.new(
        name: "UpdateConfiguredAudienceModel",
        http_method: "PATCH",
        request_uri: "/configured-audience-model/{configuredAudienceModelArn}"
      )
    end
  end
end
