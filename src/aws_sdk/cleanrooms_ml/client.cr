module AwsSdk
  module CleanRoomsML
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Submits a request to cancel the trained model job.
      def cancel_trained_model(
        membership_identifier : String,
        trained_model_arn : String,
        version_identifier : String? = nil
      ) : Protocol::Request
        input = Types::CancelTrainedModelRequest.new(membership_identifier: membership_identifier, trained_model_arn: trained_model_arn, version_identifier: version_identifier)
        cancel_trained_model(input)
      end
      def cancel_trained_model(input : Types::CancelTrainedModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_TRAINED_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Submits a request to cancel a trained model inference job.
      def cancel_trained_model_inference_job(
        membership_identifier : String,
        trained_model_inference_job_arn : String
      ) : Protocol::Request
        input = Types::CancelTrainedModelInferenceJobRequest.new(membership_identifier: membership_identifier, trained_model_inference_job_arn: trained_model_inference_job_arn)
        cancel_trained_model_inference_job(input)
      end
      def cancel_trained_model_inference_job(input : Types::CancelTrainedModelInferenceJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_TRAINED_MODEL_INFERENCE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Defines the information necessary to create an audience model. An audience model is a machine
      # learning model that Clean Rooms ML trains to measure similarity between users. Clean Rooms ML
      # manages training and storing the audience model. The audience model can be used in multiple calls to
      # the StartAudienceGenerationJob API.
      def create_audience_model(
        name : String,
        training_dataset_arn : String,
        description : String? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil,
        training_data_end_time : Time? = nil,
        training_data_start_time : Time? = nil
      ) : Protocol::Request
        input = Types::CreateAudienceModelRequest.new(name: name, training_dataset_arn: training_dataset_arn, description: description, kms_key_arn: kms_key_arn, tags: tags, training_data_end_time: training_data_end_time, training_data_start_time: training_data_start_time)
        create_audience_model(input)
      end
      def create_audience_model(input : Types::CreateAudienceModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUDIENCE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Defines the information necessary to create a configured audience model.
      def create_configured_audience_model(
        audience_model_arn : String,
        name : String,
        output_config : Types::ConfiguredAudienceModelOutputConfig,
        shared_audience_metrics : Array(String),
        audience_size_config : Types::AudienceSizeConfig? = nil,
        child_resource_tag_on_create_policy : String? = nil,
        description : String? = nil,
        min_matching_seed_size : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfiguredAudienceModelRequest.new(audience_model_arn: audience_model_arn, name: name, output_config: output_config, shared_audience_metrics: shared_audience_metrics, audience_size_config: audience_size_config, child_resource_tag_on_create_policy: child_resource_tag_on_create_policy, description: description, min_matching_seed_size: min_matching_seed_size, tags: tags)
        create_configured_audience_model(input)
      end
      def create_configured_audience_model(input : Types::CreateConfiguredAudienceModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURED_AUDIENCE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a configured model algorithm using a container image stored in an ECR repository.
      def create_configured_model_algorithm(
        name : String,
        role_arn : String,
        description : String? = nil,
        inference_container_config : Types::InferenceContainerConfig? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil,
        training_container_config : Types::ContainerConfig? = nil
      ) : Protocol::Request
        input = Types::CreateConfiguredModelAlgorithmRequest.new(name: name, role_arn: role_arn, description: description, inference_container_config: inference_container_config, kms_key_arn: kms_key_arn, tags: tags, training_container_config: training_container_config)
        create_configured_model_algorithm(input)
      end
      def create_configured_model_algorithm(input : Types::CreateConfiguredModelAlgorithmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURED_MODEL_ALGORITHM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a configured model algorithm to a collaboration for use by any member of the
      # collaboration.
      def create_configured_model_algorithm_association(
        configured_model_algorithm_arn : String,
        membership_identifier : String,
        name : String,
        description : String? = nil,
        privacy_configuration : Types::PrivacyConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfiguredModelAlgorithmAssociationRequest.new(configured_model_algorithm_arn: configured_model_algorithm_arn, membership_identifier: membership_identifier, name: name, description: description, privacy_configuration: privacy_configuration, tags: tags)
        create_configured_model_algorithm_association(input)
      end
      def create_configured_model_algorithm_association(input : Types::CreateConfiguredModelAlgorithmAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURED_MODEL_ALGORITHM_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the information to create an ML input channel. An ML input channel is the result of a query
      # that can be used for ML modeling.
      def create_ml_input_channel(
        configured_model_algorithm_associations : Array(String),
        input_channel : Types::InputChannel,
        membership_identifier : String,
        name : String,
        retention_in_days : Int32,
        description : String? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMLInputChannelRequest.new(configured_model_algorithm_associations: configured_model_algorithm_associations, input_channel: input_channel, membership_identifier: membership_identifier, name: name, retention_in_days: retention_in_days, description: description, kms_key_arn: kms_key_arn, tags: tags)
        create_ml_input_channel(input)
      end
      def create_ml_input_channel(input : Types::CreateMLInputChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ML_INPUT_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a trained model from an associated configured model algorithm using data from any member of
      # the collaboration.
      def create_trained_model(
        configured_model_algorithm_association_arn : String,
        data_channels : Array(Types::ModelTrainingDataChannel),
        membership_identifier : String,
        name : String,
        resource_config : Types::ResourceConfig,
        description : String? = nil,
        environment : Hash(String, String)? = nil,
        hyperparameters : Hash(String, String)? = nil,
        incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannel)? = nil,
        kms_key_arn : String? = nil,
        stopping_condition : Types::StoppingCondition? = nil,
        tags : Hash(String, String)? = nil,
        training_input_mode : String? = nil
      ) : Protocol::Request
        input = Types::CreateTrainedModelRequest.new(configured_model_algorithm_association_arn: configured_model_algorithm_association_arn, data_channels: data_channels, membership_identifier: membership_identifier, name: name, resource_config: resource_config, description: description, environment: environment, hyperparameters: hyperparameters, incremental_training_data_channels: incremental_training_data_channels, kms_key_arn: kms_key_arn, stopping_condition: stopping_condition, tags: tags, training_input_mode: training_input_mode)
        create_trained_model(input)
      end
      def create_trained_model(input : Types::CreateTrainedModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TRAINED_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Defines the information necessary to create a training dataset. In Clean Rooms ML, the
      # TrainingDataset is metadata that points to a Glue table, which is read only during AudienceModel
      # creation.
      def create_training_dataset(
        name : String,
        role_arn : String,
        training_data : Array(Types::Dataset),
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTrainingDatasetRequest.new(name: name, role_arn: role_arn, training_data: training_data, description: description, tags: tags)
        create_training_dataset(input)
      end
      def create_training_dataset(input : Types::CreateTrainingDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TRAINING_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified audience generation job, and removes all data associated with the job.
      def delete_audience_generation_job(
        audience_generation_job_arn : String
      ) : Protocol::Request
        input = Types::DeleteAudienceGenerationJobRequest.new(audience_generation_job_arn: audience_generation_job_arn)
        delete_audience_generation_job(input)
      end
      def delete_audience_generation_job(input : Types::DeleteAudienceGenerationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUDIENCE_GENERATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Specifies an audience model that you want to delete. You can't delete an audience model if there are
      # any configured audience models that depend on the audience model.
      def delete_audience_model(
        audience_model_arn : String
      ) : Protocol::Request
        input = Types::DeleteAudienceModelRequest.new(audience_model_arn: audience_model_arn)
        delete_audience_model(input)
      end
      def delete_audience_model(input : Types::DeleteAudienceModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUDIENCE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified configured audience model. You can't delete a configured audience model if
      # there are any lookalike models that use the configured audience model. If you delete a configured
      # audience model, it will be removed from any collaborations that it is associated to.
      def delete_configured_audience_model(
        configured_audience_model_arn : String
      ) : Protocol::Request
        input = Types::DeleteConfiguredAudienceModelRequest.new(configured_audience_model_arn: configured_audience_model_arn)
        delete_configured_audience_model(input)
      end
      def delete_configured_audience_model(input : Types::DeleteConfiguredAudienceModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURED_AUDIENCE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified configured audience model policy.
      def delete_configured_audience_model_policy(
        configured_audience_model_arn : String
      ) : Protocol::Request
        input = Types::DeleteConfiguredAudienceModelPolicyRequest.new(configured_audience_model_arn: configured_audience_model_arn)
        delete_configured_audience_model_policy(input)
      end
      def delete_configured_audience_model_policy(input : Types::DeleteConfiguredAudienceModelPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURED_AUDIENCE_MODEL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a configured model algorithm.
      def delete_configured_model_algorithm(
        configured_model_algorithm_arn : String
      ) : Protocol::Request
        input = Types::DeleteConfiguredModelAlgorithmRequest.new(configured_model_algorithm_arn: configured_model_algorithm_arn)
        delete_configured_model_algorithm(input)
      end
      def delete_configured_model_algorithm(input : Types::DeleteConfiguredModelAlgorithmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURED_MODEL_ALGORITHM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a configured model algorithm association.
      def delete_configured_model_algorithm_association(
        configured_model_algorithm_association_arn : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::DeleteConfiguredModelAlgorithmAssociationRequest.new(configured_model_algorithm_association_arn: configured_model_algorithm_association_arn, membership_identifier: membership_identifier)
        delete_configured_model_algorithm_association(input)
      end
      def delete_configured_model_algorithm_association(input : Types::DeleteConfiguredModelAlgorithmAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURED_MODEL_ALGORITHM_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a ML modeling configuration.
      def delete_ml_configuration(
        membership_identifier : String
      ) : Protocol::Request
        input = Types::DeleteMLConfigurationRequest.new(membership_identifier: membership_identifier)
        delete_ml_configuration(input)
      end
      def delete_ml_configuration(input : Types::DeleteMLConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ML_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the information necessary to delete an ML input channel.
      def delete_ml_input_channel_data(
        membership_identifier : String,
        ml_input_channel_arn : String
      ) : Protocol::Request
        input = Types::DeleteMLInputChannelDataRequest.new(membership_identifier: membership_identifier, ml_input_channel_arn: ml_input_channel_arn)
        delete_ml_input_channel_data(input)
      end
      def delete_ml_input_channel_data(input : Types::DeleteMLInputChannelDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ML_INPUT_CHANNEL_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the model artifacts stored by the service.
      def delete_trained_model_output(
        membership_identifier : String,
        trained_model_arn : String,
        version_identifier : String? = nil
      ) : Protocol::Request
        input = Types::DeleteTrainedModelOutputRequest.new(membership_identifier: membership_identifier, trained_model_arn: trained_model_arn, version_identifier: version_identifier)
        delete_trained_model_output(input)
      end
      def delete_trained_model_output(input : Types::DeleteTrainedModelOutputRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TRAINED_MODEL_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Specifies a training dataset that you want to delete. You can't delete a training dataset if there
      # are any audience models that depend on the training dataset. In Clean Rooms ML, the TrainingDataset
      # is metadata that points to a Glue table, which is read only during AudienceModel creation. This
      # action deletes the metadata.
      def delete_training_dataset(
        training_dataset_arn : String
      ) : Protocol::Request
        input = Types::DeleteTrainingDatasetRequest.new(training_dataset_arn: training_dataset_arn)
        delete_training_dataset(input)
      end
      def delete_training_dataset(input : Types::DeleteTrainingDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TRAINING_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an audience generation job.
      def get_audience_generation_job(
        audience_generation_job_arn : String
      ) : Protocol::Request
        input = Types::GetAudienceGenerationJobRequest.new(audience_generation_job_arn: audience_generation_job_arn)
        get_audience_generation_job(input)
      end
      def get_audience_generation_job(input : Types::GetAudienceGenerationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUDIENCE_GENERATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an audience model
      def get_audience_model(
        audience_model_arn : String
      ) : Protocol::Request
        input = Types::GetAudienceModelRequest.new(audience_model_arn: audience_model_arn)
        get_audience_model(input)
      end
      def get_audience_model(input : Types::GetAudienceModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUDIENCE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the configured model algorithm association in a collaboration.
      def get_collaboration_configured_model_algorithm_association(
        collaboration_identifier : String,
        configured_model_algorithm_association_arn : String
      ) : Protocol::Request
        input = Types::GetCollaborationConfiguredModelAlgorithmAssociationRequest.new(collaboration_identifier: collaboration_identifier, configured_model_algorithm_association_arn: configured_model_algorithm_association_arn)
        get_collaboration_configured_model_algorithm_association(input)
      end
      def get_collaboration_configured_model_algorithm_association(input : Types::GetCollaborationConfiguredModelAlgorithmAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COLLABORATION_CONFIGURED_MODEL_ALGORITHM_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific ML input channel in a collaboration.
      def get_collaboration_ml_input_channel(
        collaboration_identifier : String,
        ml_input_channel_arn : String
      ) : Protocol::Request
        input = Types::GetCollaborationMLInputChannelRequest.new(collaboration_identifier: collaboration_identifier, ml_input_channel_arn: ml_input_channel_arn)
        get_collaboration_ml_input_channel(input)
      end
      def get_collaboration_ml_input_channel(input : Types::GetCollaborationMLInputChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COLLABORATION_ML_INPUT_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a trained model in a collaboration.
      def get_collaboration_trained_model(
        collaboration_identifier : String,
        trained_model_arn : String,
        version_identifier : String? = nil
      ) : Protocol::Request
        input = Types::GetCollaborationTrainedModelRequest.new(collaboration_identifier: collaboration_identifier, trained_model_arn: trained_model_arn, version_identifier: version_identifier)
        get_collaboration_trained_model(input)
      end
      def get_collaboration_trained_model(input : Types::GetCollaborationTrainedModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COLLABORATION_TRAINED_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specified configured audience model.
      def get_configured_audience_model(
        configured_audience_model_arn : String
      ) : Protocol::Request
        input = Types::GetConfiguredAudienceModelRequest.new(configured_audience_model_arn: configured_audience_model_arn)
        get_configured_audience_model(input)
      end
      def get_configured_audience_model(input : Types::GetConfiguredAudienceModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURED_AUDIENCE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a configured audience model policy.
      def get_configured_audience_model_policy(
        configured_audience_model_arn : String
      ) : Protocol::Request
        input = Types::GetConfiguredAudienceModelPolicyRequest.new(configured_audience_model_arn: configured_audience_model_arn)
        get_configured_audience_model_policy(input)
      end
      def get_configured_audience_model_policy(input : Types::GetConfiguredAudienceModelPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURED_AUDIENCE_MODEL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a configured model algorithm.
      def get_configured_model_algorithm(
        configured_model_algorithm_arn : String
      ) : Protocol::Request
        input = Types::GetConfiguredModelAlgorithmRequest.new(configured_model_algorithm_arn: configured_model_algorithm_arn)
        get_configured_model_algorithm(input)
      end
      def get_configured_model_algorithm(input : Types::GetConfiguredModelAlgorithmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURED_MODEL_ALGORITHM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a configured model algorithm association.
      def get_configured_model_algorithm_association(
        configured_model_algorithm_association_arn : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::GetConfiguredModelAlgorithmAssociationRequest.new(configured_model_algorithm_association_arn: configured_model_algorithm_association_arn, membership_identifier: membership_identifier)
        get_configured_model_algorithm_association(input)
      end
      def get_configured_model_algorithm_association(input : Types::GetConfiguredModelAlgorithmAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURED_MODEL_ALGORITHM_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific ML configuration.
      def get_ml_configuration(
        membership_identifier : String
      ) : Protocol::Request
        input = Types::GetMLConfigurationRequest.new(membership_identifier: membership_identifier)
        get_ml_configuration(input)
      end
      def get_ml_configuration(input : Types::GetMLConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ML_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an ML input channel.
      def get_ml_input_channel(
        membership_identifier : String,
        ml_input_channel_arn : String
      ) : Protocol::Request
        input = Types::GetMLInputChannelRequest.new(membership_identifier: membership_identifier, ml_input_channel_arn: ml_input_channel_arn)
        get_ml_input_channel(input)
      end
      def get_ml_input_channel(input : Types::GetMLInputChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ML_INPUT_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a trained model.
      def get_trained_model(
        membership_identifier : String,
        trained_model_arn : String,
        version_identifier : String? = nil
      ) : Protocol::Request
        input = Types::GetTrainedModelRequest.new(membership_identifier: membership_identifier, trained_model_arn: trained_model_arn, version_identifier: version_identifier)
        get_trained_model(input)
      end
      def get_trained_model(input : Types::GetTrainedModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRAINED_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a trained model inference job.
      def get_trained_model_inference_job(
        membership_identifier : String,
        trained_model_inference_job_arn : String
      ) : Protocol::Request
        input = Types::GetTrainedModelInferenceJobRequest.new(membership_identifier: membership_identifier, trained_model_inference_job_arn: trained_model_inference_job_arn)
        get_trained_model_inference_job(input)
      end
      def get_trained_model_inference_job(input : Types::GetTrainedModelInferenceJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRAINED_MODEL_INFERENCE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a training dataset.
      def get_training_dataset(
        training_dataset_arn : String
      ) : Protocol::Request
        input = Types::GetTrainingDatasetRequest.new(training_dataset_arn: training_dataset_arn)
        get_training_dataset(input)
      end
      def get_training_dataset(input : Types::GetTrainingDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRAINING_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the audience export jobs.
      def list_audience_export_jobs(
        audience_generation_job_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAudienceExportJobsRequest.new(audience_generation_job_arn: audience_generation_job_arn, max_results: max_results, next_token: next_token)
        list_audience_export_jobs(input)
      end
      def list_audience_export_jobs(input : Types::ListAudienceExportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUDIENCE_EXPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of audience generation jobs.
      def list_audience_generation_jobs(
        collaboration_id : String? = nil,
        configured_audience_model_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAudienceGenerationJobsRequest.new(collaboration_id: collaboration_id, configured_audience_model_arn: configured_audience_model_arn, max_results: max_results, next_token: next_token)
        list_audience_generation_jobs(input)
      end
      def list_audience_generation_jobs(input : Types::ListAudienceGenerationJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUDIENCE_GENERATION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of audience models.
      def list_audience_models(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAudienceModelsRequest.new(max_results: max_results, next_token: next_token)
        list_audience_models(input)
      end
      def list_audience_models(input : Types::ListAudienceModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUDIENCE_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the configured model algorithm associations in a collaboration.
      def list_collaboration_configured_model_algorithm_associations(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationConfiguredModelAlgorithmAssociationsRequest.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token)
        list_collaboration_configured_model_algorithm_associations(input)
      end
      def list_collaboration_configured_model_algorithm_associations(input : Types::ListCollaborationConfiguredModelAlgorithmAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_CONFIGURED_MODEL_ALGORITHM_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the ML input channels in a collaboration.
      def list_collaboration_ml_input_channels(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationMLInputChannelsRequest.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token)
        list_collaboration_ml_input_channels(input)
      end
      def list_collaboration_ml_input_channels(input : Types::ListCollaborationMLInputChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_ML_INPUT_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the export jobs for a trained model in a collaboration.
      def list_collaboration_trained_model_export_jobs(
        collaboration_identifier : String,
        trained_model_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        trained_model_version_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationTrainedModelExportJobsRequest.new(collaboration_identifier: collaboration_identifier, trained_model_arn: trained_model_arn, max_results: max_results, next_token: next_token, trained_model_version_identifier: trained_model_version_identifier)
        list_collaboration_trained_model_export_jobs(input)
      end
      def list_collaboration_trained_model_export_jobs(input : Types::ListCollaborationTrainedModelExportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_TRAINED_MODEL_EXPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of trained model inference jobs in a specified collaboration.
      def list_collaboration_trained_model_inference_jobs(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        trained_model_arn : String? = nil,
        trained_model_version_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationTrainedModelInferenceJobsRequest.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token, trained_model_arn: trained_model_arn, trained_model_version_identifier: trained_model_version_identifier)
        list_collaboration_trained_model_inference_jobs(input)
      end
      def list_collaboration_trained_model_inference_jobs(input : Types::ListCollaborationTrainedModelInferenceJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_TRAINED_MODEL_INFERENCE_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the trained models in a collaboration.
      def list_collaboration_trained_models(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationTrainedModelsRequest.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token)
        list_collaboration_trained_models(input)
      end
      def list_collaboration_trained_models(input : Types::ListCollaborationTrainedModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_TRAINED_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the configured audience models.
      def list_configured_audience_models(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfiguredAudienceModelsRequest.new(max_results: max_results, next_token: next_token)
        list_configured_audience_models(input)
      end
      def list_configured_audience_models(input : Types::ListConfiguredAudienceModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURED_AUDIENCE_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of configured model algorithm associations.
      def list_configured_model_algorithm_associations(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfiguredModelAlgorithmAssociationsRequest.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token)
        list_configured_model_algorithm_associations(input)
      end
      def list_configured_model_algorithm_associations(input : Types::ListConfiguredModelAlgorithmAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURED_MODEL_ALGORITHM_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of configured model algorithms.
      def list_configured_model_algorithms(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfiguredModelAlgorithmsRequest.new(max_results: max_results, next_token: next_token)
        list_configured_model_algorithms(input)
      end
      def list_configured_model_algorithms(input : Types::ListConfiguredModelAlgorithmsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURED_MODEL_ALGORITHMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of ML input channels.
      def list_ml_input_channels(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMLInputChannelsRequest.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token)
        list_ml_input_channels(input)
      end
      def list_ml_input_channels(input : Types::ListMLInputChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ML_INPUT_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags for a provided resource.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of trained model inference jobs that match the request parameters.
      def list_trained_model_inference_jobs(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        trained_model_arn : String? = nil,
        trained_model_version_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListTrainedModelInferenceJobsRequest.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token, trained_model_arn: trained_model_arn, trained_model_version_identifier: trained_model_version_identifier)
        list_trained_model_inference_jobs(input)
      end
      def list_trained_model_inference_jobs(input : Types::ListTrainedModelInferenceJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRAINED_MODEL_INFERENCE_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of trained model versions for a specified trained model. This operation allows you to
      # view all versions of a trained model, including information about their status and creation details.
      # You can use this to track the evolution of your trained models and select specific versions for
      # inference or further training.
      def list_trained_model_versions(
        membership_identifier : String,
        trained_model_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListTrainedModelVersionsRequest.new(membership_identifier: membership_identifier, trained_model_arn: trained_model_arn, max_results: max_results, next_token: next_token, status: status)
        list_trained_model_versions(input)
      end
      def list_trained_model_versions(input : Types::ListTrainedModelVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRAINED_MODEL_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of trained models.
      def list_trained_models(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTrainedModelsRequest.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token)
        list_trained_models(input)
      end
      def list_trained_models(input : Types::ListTrainedModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRAINED_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of training datasets.
      def list_training_datasets(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTrainingDatasetsRequest.new(max_results: max_results, next_token: next_token)
        list_training_datasets(input)
      end
      def list_training_datasets(input : Types::ListTrainingDatasetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRAINING_DATASETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create or update the resource policy for a configured audience model.
      def put_configured_audience_model_policy(
        configured_audience_model_arn : String,
        configured_audience_model_policy : String,
        policy_existence_condition : String? = nil,
        previous_policy_hash : String? = nil
      ) : Protocol::Request
        input = Types::PutConfiguredAudienceModelPolicyRequest.new(configured_audience_model_arn: configured_audience_model_arn, configured_audience_model_policy: configured_audience_model_policy, policy_existence_condition: policy_existence_condition, previous_policy_hash: previous_policy_hash)
        put_configured_audience_model_policy(input)
      end
      def put_configured_audience_model_policy(input : Types::PutConfiguredAudienceModelPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURED_AUDIENCE_MODEL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns information about an ML configuration.
      def put_ml_configuration(
        default_output_location : Types::MLOutputConfiguration,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::PutMLConfigurationRequest.new(default_output_location: default_output_location, membership_identifier: membership_identifier)
        put_ml_configuration(input)
      end
      def put_ml_configuration(input : Types::PutMLConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ML_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Export an audience of a specified size after you have generated an audience.
      def start_audience_export_job(
        audience_generation_job_arn : String,
        audience_size : Types::AudienceSize,
        name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::StartAudienceExportJobRequest.new(audience_generation_job_arn: audience_generation_job_arn, audience_size: audience_size, name: name, description: description)
        start_audience_export_job(input)
      end
      def start_audience_export_job(input : Types::StartAudienceExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_AUDIENCE_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Information necessary to start the audience generation job.
      def start_audience_generation_job(
        configured_audience_model_arn : String,
        name : String,
        seed_audience : Types::AudienceGenerationJobDataSource,
        collaboration_id : String? = nil,
        description : String? = nil,
        include_seed_in_output : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartAudienceGenerationJobRequest.new(configured_audience_model_arn: configured_audience_model_arn, name: name, seed_audience: seed_audience, collaboration_id: collaboration_id, description: description, include_seed_in_output: include_seed_in_output, tags: tags)
        start_audience_generation_job(input)
      end
      def start_audience_generation_job(input : Types::StartAudienceGenerationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_AUDIENCE_GENERATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the information necessary to start a trained model export job.
      def start_trained_model_export_job(
        membership_identifier : String,
        name : String,
        output_configuration : Types::TrainedModelExportOutputConfiguration,
        trained_model_arn : String,
        description : String? = nil,
        trained_model_version_identifier : String? = nil
      ) : Protocol::Request
        input = Types::StartTrainedModelExportJobRequest.new(membership_identifier: membership_identifier, name: name, output_configuration: output_configuration, trained_model_arn: trained_model_arn, description: description, trained_model_version_identifier: trained_model_version_identifier)
        start_trained_model_export_job(input)
      end
      def start_trained_model_export_job(input : Types::StartTrainedModelExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TRAINED_MODEL_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Defines the information necessary to begin a trained model inference job.
      def start_trained_model_inference_job(
        data_source : Types::ModelInferenceDataSource,
        membership_identifier : String,
        name : String,
        output_configuration : Types::InferenceOutputConfiguration,
        resource_config : Types::InferenceResourceConfig,
        trained_model_arn : String,
        configured_model_algorithm_association_arn : String? = nil,
        container_execution_parameters : Types::InferenceContainerExecutionParameters? = nil,
        description : String? = nil,
        environment : Hash(String, String)? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil,
        trained_model_version_identifier : String? = nil
      ) : Protocol::Request
        input = Types::StartTrainedModelInferenceJobRequest.new(data_source: data_source, membership_identifier: membership_identifier, name: name, output_configuration: output_configuration, resource_config: resource_config, trained_model_arn: trained_model_arn, configured_model_algorithm_association_arn: configured_model_algorithm_association_arn, container_execution_parameters: container_execution_parameters, description: description, environment: environment, kms_key_arn: kms_key_arn, tags: tags, trained_model_version_identifier: trained_model_version_identifier)
        start_trained_model_inference_job(input)
      end
      def start_trained_model_inference_job(input : Types::StartTrainedModelInferenceJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TRAINED_MODEL_INFERENCE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds metadata tags to a specified resource.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes metadata tags from a specified resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the information necessary to update a configured audience model. Updates that impact
      # audience generation jobs take effect when a new job starts, but do not impact currently running
      # jobs.
      def update_configured_audience_model(
        configured_audience_model_arn : String,
        audience_model_arn : String? = nil,
        audience_size_config : Types::AudienceSizeConfig? = nil,
        description : String? = nil,
        min_matching_seed_size : Int32? = nil,
        output_config : Types::ConfiguredAudienceModelOutputConfig? = nil,
        shared_audience_metrics : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateConfiguredAudienceModelRequest.new(configured_audience_model_arn: configured_audience_model_arn, audience_model_arn: audience_model_arn, audience_size_config: audience_size_config, description: description, min_matching_seed_size: min_matching_seed_size, output_config: output_config, shared_audience_metrics: shared_audience_metrics)
        update_configured_audience_model(input)
      end
      def update_configured_audience_model(input : Types::UpdateConfiguredAudienceModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURED_AUDIENCE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
