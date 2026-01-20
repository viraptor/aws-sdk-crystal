module AwsSdk
  module Ivs
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

      # Performs GetChannel on multiple ARNs simultaneously.

      def batch_get_channel(
        arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetChannelRequest.new(arns: arns)
        batch_get_channel(input)
      end

      def batch_get_channel(input : Types::BatchGetChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs GetStreamKey on multiple ARNs simultaneously.

      def batch_get_stream_key(
        arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetStreamKeyRequest.new(arns: arns)
        batch_get_stream_key(input)
      end

      def batch_get_stream_key(input : Types::BatchGetStreamKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_STREAM_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs StartViewerSessionRevocation on multiple channel ARN and viewer ID pairs simultaneously.

      def batch_start_viewer_session_revocation(
        viewer_sessions : Array(Types::BatchStartViewerSessionRevocationViewerSession)
      ) : Protocol::Request
        input = Types::BatchStartViewerSessionRevocationRequest.new(viewer_sessions: viewer_sessions)
        batch_start_viewer_session_revocation(input)
      end

      def batch_start_viewer_session_revocation(input : Types::BatchStartViewerSessionRevocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_START_VIEWER_SESSION_REVOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new channel and an associated stream key to start streaming.

      def create_channel(
        authorized : Bool? = nil,
        container_format : String? = nil,
        insecure_ingest : Bool? = nil,
        latency_mode : String? = nil,
        multitrack_input_configuration : Types::MultitrackInputConfiguration? = nil,
        name : String? = nil,
        playback_restriction_policy_arn : String? = nil,
        preset : String? = nil,
        recording_configuration_arn : String? = nil,
        tags : Hash(String, String)? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::CreateChannelRequest.new(authorized: authorized, container_format: container_format, insecure_ingest: insecure_ingest, latency_mode: latency_mode, multitrack_input_configuration: multitrack_input_configuration, name: name, playback_restriction_policy_arn: playback_restriction_policy_arn, preset: preset, recording_configuration_arn: recording_configuration_arn, tags: tags, type: type)
        create_channel(input)
      end

      def create_channel(input : Types::CreateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new playback restriction policy, for constraining playback by countries and/or origins.

      def create_playback_restriction_policy(
        allowed_countries : Array(String)? = nil,
        allowed_origins : Array(String)? = nil,
        enable_strict_origin_enforcement : Bool? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePlaybackRestrictionPolicyRequest.new(allowed_countries: allowed_countries, allowed_origins: allowed_origins, enable_strict_origin_enforcement: enable_strict_origin_enforcement, name: name, tags: tags)
        create_playback_restriction_policy(input)
      end

      def create_playback_restriction_policy(input : Types::CreatePlaybackRestrictionPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PLAYBACK_RESTRICTION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new recording configuration, used to enable recording to Amazon S3. Known issue: In the
      # us-east-1 region, if you use the Amazon Web Services CLI to create a recording configuration, it
      # returns success even if the S3 bucket is in a different region. In this case, the state of the
      # recording configuration is CREATE_FAILED (instead of ACTIVE ). (In other regions, the CLI correctly
      # returns failure if the bucket is in a different region.) Workaround: Ensure that your S3 bucket is
      # in the same region as the recording configuration. If you create a recording configuration in a
      # different region as your S3 bucket, delete that recording configuration and create a new one with an
      # S3 bucket from the correct region.

      def create_recording_configuration(
        destination_configuration : Types::DestinationConfiguration,
        name : String? = nil,
        recording_reconnect_window_seconds : Int32? = nil,
        rendition_configuration : Types::RenditionConfiguration? = nil,
        tags : Hash(String, String)? = nil,
        thumbnail_configuration : Types::ThumbnailConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateRecordingConfigurationRequest.new(destination_configuration: destination_configuration, name: name, recording_reconnect_window_seconds: recording_reconnect_window_seconds, rendition_configuration: rendition_configuration, tags: tags, thumbnail_configuration: thumbnail_configuration)
        create_recording_configuration(input)
      end

      def create_recording_configuration(input : Types::CreateRecordingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RECORDING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a stream key, used to initiate a stream, for the specified channel ARN. Note that
      # CreateChannel creates a stream key. If you subsequently use CreateStreamKey on the same channel, it
      # will fail because a stream key already exists and there is a limit of 1 stream key per channel. To
      # reset the stream key on a channel, use DeleteStreamKey and then CreateStreamKey.

      def create_stream_key(
        channel_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateStreamKeyRequest.new(channel_arn: channel_arn, tags: tags)
        create_stream_key(input)
      end

      def create_stream_key(input : Types::CreateStreamKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STREAM_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified channel and its associated stream keys. If you try to delete a live channel,
      # you will get an error (409 ConflictException). To delete a channel that is live, call StopStream ,
      # wait for the Amazon EventBridge "Stream End" event (to verify that the stream's state is no longer
      # Live), then call DeleteChannel. (See Using EventBridge with Amazon IVS .)

      def delete_channel(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteChannelRequest.new(arn: arn)
        delete_channel(input)
      end

      def delete_channel(input : Types::DeleteChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified authorization key pair. This invalidates future viewer tokens generated using
      # the key pair’s privateKey . For more information, see Setting Up Private Channels in the Amazon IVS
      # User Guide .

      def delete_playback_key_pair(
        arn : String
      ) : Protocol::Request
        input = Types::DeletePlaybackKeyPairRequest.new(arn: arn)
        delete_playback_key_pair(input)
      end

      def delete_playback_key_pair(input : Types::DeletePlaybackKeyPairRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PLAYBACK_KEY_PAIR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified playback restriction policy.

      def delete_playback_restriction_policy(
        arn : String
      ) : Protocol::Request
        input = Types::DeletePlaybackRestrictionPolicyRequest.new(arn: arn)
        delete_playback_restriction_policy(input)
      end

      def delete_playback_restriction_policy(input : Types::DeletePlaybackRestrictionPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PLAYBACK_RESTRICTION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the recording configuration for the specified ARN. If you try to delete a recording
      # configuration that is associated with a channel, you will get an error (409 ConflictException). To
      # avoid this, for all channels that reference the recording configuration, first use UpdateChannel to
      # set the recordingConfigurationArn field to an empty string, then use DeleteRecordingConfiguration.

      def delete_recording_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteRecordingConfigurationRequest.new(arn: arn)
        delete_recording_configuration(input)
      end

      def delete_recording_configuration(input : Types::DeleteRecordingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RECORDING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the stream key for the specified ARN, so it can no longer be used to stream.

      def delete_stream_key(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteStreamKeyRequest.new(arn: arn)
        delete_stream_key(input)
      end

      def delete_stream_key(input : Types::DeleteStreamKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_STREAM_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the channel configuration for the specified channel ARN. See also BatchGetChannel .

      def get_channel(
        arn : String
      ) : Protocol::Request
        input = Types::GetChannelRequest.new(arn: arn)
        get_channel(input)
      end

      def get_channel(input : Types::GetChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a specified playback authorization key pair and returns the arn and fingerprint . The
      # privateKey held by the caller can be used to generate viewer authorization tokens, to grant viewers
      # access to private channels. For more information, see Setting Up Private Channels in the Amazon IVS
      # User Guide .

      def get_playback_key_pair(
        arn : String
      ) : Protocol::Request
        input = Types::GetPlaybackKeyPairRequest.new(arn: arn)
        get_playback_key_pair(input)
      end

      def get_playback_key_pair(input : Types::GetPlaybackKeyPairRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PLAYBACK_KEY_PAIR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the specified playback restriction policy.

      def get_playback_restriction_policy(
        arn : String
      ) : Protocol::Request
        input = Types::GetPlaybackRestrictionPolicyRequest.new(arn: arn)
        get_playback_restriction_policy(input)
      end

      def get_playback_restriction_policy(input : Types::GetPlaybackRestrictionPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PLAYBACK_RESTRICTION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the recording configuration for the specified ARN.

      def get_recording_configuration(
        arn : String
      ) : Protocol::Request
        input = Types::GetRecordingConfigurationRequest.new(arn: arn)
        get_recording_configuration(input)
      end

      def get_recording_configuration(input : Types::GetRecordingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECORDING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the active (live) stream on a specified channel.

      def get_stream(
        channel_arn : String
      ) : Protocol::Request
        input = Types::GetStreamRequest.new(channel_arn: channel_arn)
        get_stream(input)
      end

      def get_stream(input : Types::GetStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets stream-key information for a specified ARN.

      def get_stream_key(
        arn : String
      ) : Protocol::Request
        input = Types::GetStreamKeyRequest.new(arn: arn)
        get_stream_key(input)
      end

      def get_stream_key(input : Types::GetStreamKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STREAM_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets metadata on a specified stream.

      def get_stream_session(
        channel_arn : String,
        stream_id : String? = nil
      ) : Protocol::Request
        input = Types::GetStreamSessionRequest.new(channel_arn: channel_arn, stream_id: stream_id)
        get_stream_session(input)
      end

      def get_stream_session(input : Types::GetStreamSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STREAM_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports the public portion of a new key pair and returns its arn and fingerprint . The privateKey
      # can then be used to generate viewer authorization tokens, to grant viewers access to private
      # channels. For more information, see Setting Up Private Channels in the Amazon IVS User Guide .

      def import_playback_key_pair(
        public_key_material : String,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ImportPlaybackKeyPairRequest.new(public_key_material: public_key_material, name: name, tags: tags)
        import_playback_key_pair(input)
      end

      def import_playback_key_pair(input : Types::ImportPlaybackKeyPairRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_PLAYBACK_KEY_PAIR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all channels in your account, in the Amazon Web Services region where
      # the API request is processed. This list can be filtered to match a specified name or
      # recording-configuration ARN. Filters are mutually exclusive and cannot be used together. If you try
      # to use both filters, you will get an error (409 ConflictException).

      def list_channels(
        filter_by_name : String? = nil,
        filter_by_playback_restriction_policy_arn : String? = nil,
        filter_by_recording_configuration_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsRequest.new(filter_by_name: filter_by_name, filter_by_playback_restriction_policy_arn: filter_by_playback_restriction_policy_arn, filter_by_recording_configuration_arn: filter_by_recording_configuration_arn, max_results: max_results, next_token: next_token)
        list_channels(input)
      end

      def list_channels(input : Types::ListChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about playback key pairs. For more information, see Setting Up Private
      # Channels in the Amazon IVS User Guide .

      def list_playback_key_pairs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPlaybackKeyPairsRequest.new(max_results: max_results, next_token: next_token)
        list_playback_key_pairs(input)
      end

      def list_playback_key_pairs(input : Types::ListPlaybackKeyPairsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PLAYBACK_KEY_PAIRS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about playback restriction policies.

      def list_playback_restriction_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPlaybackRestrictionPoliciesRequest.new(max_results: max_results, next_token: next_token)
        list_playback_restriction_policies(input)
      end

      def list_playback_restriction_policies(input : Types::ListPlaybackRestrictionPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PLAYBACK_RESTRICTION_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all recording configurations in your account, in the Amazon Web
      # Services region where the API request is processed.

      def list_recording_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecordingConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_recording_configurations(input)
      end

      def list_recording_configurations(input : Types::ListRecordingConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECORDING_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about stream keys for the specified channel.

      def list_stream_keys(
        channel_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStreamKeysRequest.new(channel_arn: channel_arn, max_results: max_results, next_token: next_token)
        list_stream_keys(input)
      end

      def list_stream_keys(input : Types::ListStreamKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STREAM_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a summary of current and previous streams for a specified channel in your account, in the AWS
      # region where the API request is processed.

      def list_stream_sessions(
        channel_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStreamSessionsRequest.new(channel_arn: channel_arn, max_results: max_results, next_token: next_token)
        list_stream_sessions(input)
      end

      def list_stream_sessions(input : Types::ListStreamSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STREAM_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about live streams in your account, in the Amazon Web Services region where
      # the API request is processed.

      def list_streams(
        filter_by : Types::StreamFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStreamsRequest.new(filter_by: filter_by, max_results: max_results, next_token: next_token)
        list_streams(input)
      end

      def list_streams(input : Types::ListStreamsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STREAMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about Amazon Web Services tags for the specified ARN.

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

      # Inserts metadata into the active stream of the specified channel. At most 5 requests per second per
      # channel are allowed, each with a maximum 1 KB payload. (If 5 TPS is not sufficient for your needs,
      # we recommend batching your data into a single PutMetadata call.) At most 155 requests per second per
      # account are allowed. Also see Embedding Metadata within a Video Stream in the Amazon IVS User Guide
      # .

      def put_metadata(
        channel_arn : String,
        metadata : String
      ) : Protocol::Request
        input = Types::PutMetadataRequest.new(channel_arn: channel_arn, metadata: metadata)
        put_metadata(input)
      end

      def put_metadata(input : Types::PutMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the process of revoking the viewer session associated with a specified channel ARN and viewer
      # ID. Optionally, you can provide a version to revoke viewer sessions less than and including that
      # version. For instructions on associating a viewer ID with a viewer session, see Setting Up Private
      # Channels .

      def start_viewer_session_revocation(
        channel_arn : String,
        viewer_id : String,
        viewer_session_versions_less_than_or_equal_to : Int32? = nil
      ) : Protocol::Request
        input = Types::StartViewerSessionRevocationRequest.new(channel_arn: channel_arn, viewer_id: viewer_id, viewer_session_versions_less_than_or_equal_to: viewer_session_versions_less_than_or_equal_to)
        start_viewer_session_revocation(input)
      end

      def start_viewer_session_revocation(input : Types::StartViewerSessionRevocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_VIEWER_SESSION_REVOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disconnects the incoming RTMPS stream for the specified channel. Can be used in conjunction with
      # DeleteStreamKey to prevent further streaming to a channel. Many streaming client-software libraries
      # automatically reconnect a dropped RTMPS session, so to stop the stream permanently, you may want to
      # first revoke the streamKey attached to the channel.

      def stop_stream(
        channel_arn : String
      ) : Protocol::Request
        input = Types::StopStreamRequest.new(channel_arn: channel_arn)
        stop_stream(input)
      end

      def stop_stream(input : Types::StopStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates tags for the Amazon Web Services resource with the specified ARN.

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

      # Updates a channel's configuration. Live channels cannot be updated. You must stop the ongoing
      # stream, update the channel, and restart the stream for the changes to take effect.

      def update_channel(
        arn : String,
        authorized : Bool? = nil,
        container_format : String? = nil,
        insecure_ingest : Bool? = nil,
        latency_mode : String? = nil,
        multitrack_input_configuration : Types::MultitrackInputConfiguration? = nil,
        name : String? = nil,
        playback_restriction_policy_arn : String? = nil,
        preset : String? = nil,
        recording_configuration_arn : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelRequest.new(arn: arn, authorized: authorized, container_format: container_format, insecure_ingest: insecure_ingest, latency_mode: latency_mode, multitrack_input_configuration: multitrack_input_configuration, name: name, playback_restriction_policy_arn: playback_restriction_policy_arn, preset: preset, recording_configuration_arn: recording_configuration_arn, type: type)
        update_channel(input)
      end

      def update_channel(input : Types::UpdateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a specified playback restriction policy.

      def update_playback_restriction_policy(
        arn : String,
        allowed_countries : Array(String)? = nil,
        allowed_origins : Array(String)? = nil,
        enable_strict_origin_enforcement : Bool? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePlaybackRestrictionPolicyRequest.new(arn: arn, allowed_countries: allowed_countries, allowed_origins: allowed_origins, enable_strict_origin_enforcement: enable_strict_origin_enforcement, name: name)
        update_playback_restriction_policy(input)
      end

      def update_playback_restriction_policy(input : Types::UpdatePlaybackRestrictionPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PLAYBACK_RESTRICTION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
