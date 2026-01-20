module AwsSdk
  module IVSRealTime
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

      # Creates an EncoderConfiguration object.

      def create_encoder_configuration(
        name : String? = nil,
        tags : Hash(String, String)? = nil,
        video : Types::Video? = nil
      ) : Protocol::Request
        input = Types::CreateEncoderConfigurationRequest.new(name: name, tags: tags, video: video)
        create_encoder_configuration(input)
      end

      def create_encoder_configuration(input : Types::CreateEncoderConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENCODER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new IngestConfiguration resource, used to specify the ingest protocol for a stage.

      def create_ingest_configuration(
        ingest_protocol : String,
        attributes : Hash(String, String)? = nil,
        insecure_ingest : Bool? = nil,
        name : String? = nil,
        stage_arn : String? = nil,
        tags : Hash(String, String)? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateIngestConfigurationRequest.new(ingest_protocol: ingest_protocol, attributes: attributes, insecure_ingest: insecure_ingest, name: name, stage_arn: stage_arn, tags: tags, user_id: user_id)
        create_ingest_configuration(input)
      end

      def create_ingest_configuration(input : Types::CreateIngestConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INGEST_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an additional token for a specified stage. This can be done after stage creation or when
      # tokens expire. Tokens always are scoped to the stage for which they are created. Encryption keys are
      # owned by Amazon IVS and never used directly by your application.

      def create_participant_token(
        stage_arn : String,
        attributes : Hash(String, String)? = nil,
        capabilities : Array(String)? = nil,
        duration : Int32? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateParticipantTokenRequest.new(stage_arn: stage_arn, attributes: attributes, capabilities: capabilities, duration: duration, user_id: user_id)
        create_participant_token(input)
      end

      def create_participant_token(input : Types::CreateParticipantTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PARTICIPANT_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new stage (and optionally participant tokens).

      def create_stage(
        auto_participant_recording_configuration : Types::AutoParticipantRecordingConfiguration? = nil,
        name : String? = nil,
        participant_token_configurations : Array(Types::ParticipantTokenConfiguration)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateStageRequest.new(auto_participant_recording_configuration: auto_participant_recording_configuration, name: name, participant_token_configurations: participant_token_configurations, tags: tags)
        create_stage(input)
      end

      def create_stage(input : Types::CreateStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new storage configuration, used to enable recording to Amazon S3. When a
      # StorageConfiguration is created, IVS will modify the S3 bucketPolicy of the provided bucket. This
      # will ensure that IVS has sufficient permissions to write content to the provided bucket.

      def create_storage_configuration(
        s3 : Types::S3StorageConfiguration,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateStorageConfigurationRequest.new(s3: s3, name: name, tags: tags)
        create_storage_configuration(input)
      end

      def create_storage_configuration(input : Types::CreateStorageConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STORAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an EncoderConfiguration resource. Ensures that no Compositions are using this template;
      # otherwise, returns an error.

      def delete_encoder_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteEncoderConfigurationRequest.new(arn: arn)
        delete_encoder_configuration(input)
      end

      def delete_encoder_configuration(input : Types::DeleteEncoderConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENCODER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified IngestConfiguration, so it can no longer be used to broadcast. An
      # IngestConfiguration cannot be deleted if the publisher is actively streaming to a stage, unless
      # force is set to true .

      def delete_ingest_configuration(
        arn : String,
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteIngestConfigurationRequest.new(arn: arn, force: force)
        delete_ingest_configuration(input)
      end

      def delete_ingest_configuration(input : Types::DeleteIngestConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INGEST_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified public key used to sign stage participant tokens. This invalidates future
      # participant tokens generated using the key pair’s private key.

      def delete_public_key(
        arn : String
      ) : Protocol::Request
        input = Types::DeletePublicKeyRequest.new(arn: arn)
        delete_public_key(input)
      end

      def delete_public_key(input : Types::DeletePublicKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PUBLIC_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Shuts down and deletes the specified stage (disconnecting all participants). This operation also
      # removes the stageArn from the associated IngestConfiguration , if there are participants using the
      # IngestConfiguration to publish to the stage.

      def delete_stage(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteStageRequest.new(arn: arn)
        delete_stage(input)
      end

      def delete_stage(input : Types::DeleteStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the storage configuration for the specified ARN. If you try to delete a storage
      # configuration that is used by a Composition, you will get an error (409 ConflictException). To avoid
      # this, for all Compositions that reference the storage configuration, first use StopComposition and
      # wait for it to complete, then use DeleteStorageConfiguration.

      def delete_storage_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteStorageConfigurationRequest.new(arn: arn)
        delete_storage_configuration(input)
      end

      def delete_storage_configuration(input : Types::DeleteStorageConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_STORAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disconnects a specified participant from a specified stage. If the participant is publishing using
      # an IngestConfiguration , DisconnectParticipant also updates the stageArn in the IngestConfiguration
      # to be an empty string.

      def disconnect_participant(
        participant_id : String,
        stage_arn : String,
        reason : String? = nil
      ) : Protocol::Request
        input = Types::DisconnectParticipantRequest.new(participant_id: participant_id, stage_arn: stage_arn, reason: reason)
        disconnect_participant(input)
      end

      def disconnect_participant(input : Types::DisconnectParticipantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISCONNECT_PARTICIPANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about the specified Composition resource.

      def get_composition(
        arn : String
      ) : Protocol::Request
        input = Types::GetCompositionRequest.new(arn: arn)
        get_composition(input)
      end

      def get_composition(input : Types::GetCompositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPOSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified EncoderConfiguration resource.

      def get_encoder_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::GetEncoderConfigurationRequest.new(arn: arn)
        get_encoder_configuration(input)
      end

      def get_encoder_configuration(input : Types::GetEncoderConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENCODER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified IngestConfiguration.

      def get_ingest_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::GetIngestConfigurationRequest.new(arn: arn)
        get_ingest_configuration(input)
      end

      def get_ingest_configuration(input : Types::GetIngestConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INGEST_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified participant token.

      def get_participant(
        participant_id : String,
        session_id : String,
        stage_arn : String
      ) : Protocol::Request
        input = Types::GetParticipantRequest.new(participant_id: participant_id, session_id: session_id, stage_arn: stage_arn)
        get_participant(input)
      end

      def get_participant(input : Types::GetParticipantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PARTICIPANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information for the specified public key.

      def get_public_key(
        arn : String
      ) : Protocol::Request
        input = Types::GetPublicKeyRequest.new(arn: arn)
        get_public_key(input)
      end

      def get_public_key(input : Types::GetPublicKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PUBLIC_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information for the specified stage.

      def get_stage(
        arn : String
      ) : Protocol::Request
        input = Types::GetStageRequest.new(arn: arn)
        get_stage(input)
      end

      def get_stage(input : Types::GetStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information for the specified stage session.

      def get_stage_session(
        session_id : String,
        stage_arn : String
      ) : Protocol::Request
        input = Types::GetStageSessionRequest.new(session_id: session_id, stage_arn: stage_arn)
        get_stage_session(input)
      end

      def get_stage_session(input : Types::GetStageSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STAGE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the storage configuration for the specified ARN.

      def get_storage_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::GetStorageConfigurationRequest.new(arn: arn)
        get_storage_configuration(input)
      end

      def get_storage_configuration(input : Types::GetStorageConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STORAGE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Import a public key to be used for signing stage participant tokens.

      def import_public_key(
        public_key_material : String,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ImportPublicKeyRequest.new(public_key_material: public_key_material, name: name, tags: tags)
        import_public_key(input)
      end

      def import_public_key(input : Types::ImportPublicKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_PUBLIC_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all Compositions in your account, in the AWS region where the API
      # request is processed.

      def list_compositions(
        filter_by_encoder_configuration_arn : String? = nil,
        filter_by_stage_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCompositionsRequest.new(filter_by_encoder_configuration_arn: filter_by_encoder_configuration_arn, filter_by_stage_arn: filter_by_stage_arn, max_results: max_results, next_token: next_token)
        list_compositions(input)
      end

      def list_compositions(input : Types::ListCompositionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPOSITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all EncoderConfigurations in your account, in the AWS region where
      # the API request is processed.

      def list_encoder_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEncoderConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_encoder_configurations(input)
      end

      def list_encoder_configurations(input : Types::ListEncoderConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENCODER_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all IngestConfigurations in your account, in the AWS region where the API request is
      # processed.

      def list_ingest_configurations(
        filter_by_stage_arn : String? = nil,
        filter_by_state : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIngestConfigurationsRequest.new(filter_by_stage_arn: filter_by_stage_arn, filter_by_state: filter_by_state, max_results: max_results, next_token: next_token)
        list_ingest_configurations(input)
      end

      def list_ingest_configurations(input : Types::ListIngestConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INGEST_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists events for a specified participant that occurred during a specified stage session.

      def list_participant_events(
        participant_id : String,
        session_id : String,
        stage_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListParticipantEventsRequest.new(participant_id: participant_id, session_id: session_id, stage_arn: stage_arn, max_results: max_results, next_token: next_token)
        list_participant_events(input)
      end

      def list_participant_events(input : Types::ListParticipantEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PARTICIPANT_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the replicas for a participant from a source stage.

      def list_participant_replicas(
        participant_id : String,
        source_stage_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListParticipantReplicasRequest.new(participant_id: participant_id, source_stage_arn: source_stage_arn, max_results: max_results, next_token: next_token)
        list_participant_replicas(input)
      end

      def list_participant_replicas(input : Types::ListParticipantReplicasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PARTICIPANT_REPLICAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all participants in a specified stage session.

      def list_participants(
        session_id : String,
        stage_arn : String,
        filter_by_published : Bool? = nil,
        filter_by_recording_state : String? = nil,
        filter_by_state : String? = nil,
        filter_by_user_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListParticipantsRequest.new(session_id: session_id, stage_arn: stage_arn, filter_by_published: filter_by_published, filter_by_recording_state: filter_by_recording_state, filter_by_state: filter_by_state, filter_by_user_id: filter_by_user_id, max_results: max_results, next_token: next_token)
        list_participants(input)
      end

      def list_participants(input : Types::ListParticipantsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PARTICIPANTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all public keys in your account, in the AWS region where the API
      # request is processed.

      def list_public_keys(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPublicKeysRequest.new(max_results: max_results, next_token: next_token)
        list_public_keys(input)
      end

      def list_public_keys(input : Types::ListPublicKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PUBLIC_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets all sessions for a specified stage.

      def list_stage_sessions(
        stage_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStageSessionsRequest.new(stage_arn: stage_arn, max_results: max_results, next_token: next_token)
        list_stage_sessions(input)
      end

      def list_stage_sessions(input : Types::ListStageSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STAGE_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all stages in your account, in the AWS region where the API request
      # is processed.

      def list_stages(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStagesRequest.new(max_results: max_results, next_token: next_token)
        list_stages(input)
      end

      def list_stages(input : Types::ListStagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all storage configurations in your account, in the AWS region where
      # the API request is processed.

      def list_storage_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStorageConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_storage_configurations(input)
      end

      def list_storage_configurations(input : Types::ListStorageConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STORAGE_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about AWS tags for the specified ARN.

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

      # Starts a Composition from a stage based on the configuration provided in the request. A Composition
      # is an ephemeral resource that exists after this operation returns successfully. Composition stops
      # and the resource is deleted: When StopComposition is called. After a 1-minute timeout, when all
      # participants are disconnected from the stage. After a 1-minute timeout, if there are no participants
      # in the stage when StartComposition is called. When broadcasting to the IVS channel fails and all
      # retries are exhausted. When broadcasting is disconnected and all attempts to reconnect are
      # exhausted.

      def start_composition(
        destinations : Array(Types::DestinationConfiguration),
        stage_arn : String,
        idempotency_token : String? = nil,
        layout : Types::LayoutConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartCompositionRequest.new(destinations: destinations, stage_arn: stage_arn, idempotency_token: idempotency_token, layout: layout, tags: tags)
        start_composition(input)
      end

      def start_composition(input : Types::StartCompositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_COMPOSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts replicating a publishing participant from a source stage to a destination stage.

      def start_participant_replication(
        destination_stage_arn : String,
        participant_id : String,
        source_stage_arn : String,
        attributes : Hash(String, String)? = nil,
        reconnect_window_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::StartParticipantReplicationRequest.new(destination_stage_arn: destination_stage_arn, participant_id: participant_id, source_stage_arn: source_stage_arn, attributes: attributes, reconnect_window_seconds: reconnect_window_seconds)
        start_participant_replication(input)
      end

      def start_participant_replication(input : Types::StartParticipantReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PARTICIPANT_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops and deletes a Composition resource. Any broadcast from the Composition resource is stopped.

      def stop_composition(
        arn : String
      ) : Protocol::Request
        input = Types::StopCompositionRequest.new(arn: arn)
        stop_composition(input)
      end

      def stop_composition(input : Types::StopCompositionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_COMPOSITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a replicated participant session.

      def stop_participant_replication(
        destination_stage_arn : String,
        participant_id : String,
        source_stage_arn : String
      ) : Protocol::Request
        input = Types::StopParticipantReplicationRequest.new(destination_stage_arn: destination_stage_arn, participant_id: participant_id, source_stage_arn: source_stage_arn)
        stop_participant_replication(input)
      end

      def stop_participant_replication(input : Types::StopParticipantReplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_PARTICIPANT_REPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates tags for the AWS resource with the specified ARN.

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

      # Removes tags from the resource with the specified ARN.

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

      # Updates a specified IngestConfiguration. Only the stage ARN attached to the IngestConfiguration can
      # be updated. An IngestConfiguration that is active cannot be updated.

      def update_ingest_configuration(
        arn : String,
        stage_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIngestConfigurationRequest.new(arn: arn, stage_arn: stage_arn)
        update_ingest_configuration(input)
      end

      def update_ingest_configuration(input : Types::UpdateIngestConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INGEST_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a stage’s configuration.

      def update_stage(
        arn : String,
        auto_participant_recording_configuration : Types::AutoParticipantRecordingConfiguration? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateStageRequest.new(arn: arn, auto_participant_recording_configuration: auto_participant_recording_configuration, name: name)
        update_stage(input)
      end

      def update_stage(input : Types::UpdateStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
