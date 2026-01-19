module AwsSdk
  module ChimeSDKMediaPipelines
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

      # Creates a media pipeline.
      def create_media_capture_pipeline(
        sink_arn : String,
        sink_type : String,
        source_arn : String,
        source_type : String,
        chime_sdk_meeting_configuration : Types::ChimeSdkMeetingConfiguration? = nil,
        client_request_token : String? = nil,
        sink_iam_role_arn : String? = nil,
        sse_aws_key_management_params : Types::SseAwsKeyManagementParams? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMediaCapturePipelineRequest.new(sink_arn: sink_arn, sink_type: sink_type, source_arn: source_arn, source_type: source_type, chime_sdk_meeting_configuration: chime_sdk_meeting_configuration, client_request_token: client_request_token, sink_iam_role_arn: sink_iam_role_arn, sse_aws_key_management_params: sse_aws_key_management_params, tags: tags)
        create_media_capture_pipeline(input)
      end
      def create_media_capture_pipeline(input : Types::CreateMediaCapturePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEDIA_CAPTURE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a media concatenation pipeline.
      def create_media_concatenation_pipeline(
        sinks : Array(Types::ConcatenationSink),
        sources : Array(Types::ConcatenationSource),
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMediaConcatenationPipelineRequest.new(sinks: sinks, sources: sources, client_request_token: client_request_token, tags: tags)
        create_media_concatenation_pipeline(input)
      end
      def create_media_concatenation_pipeline(input : Types::CreateMediaConcatenationPipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEDIA_CONCATENATION_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a media insights pipeline.
      def create_media_insights_pipeline(
        media_insights_pipeline_configuration_arn : String,
        client_request_token : String? = nil,
        kinesis_video_stream_recording_source_runtime_configuration : Types::KinesisVideoStreamRecordingSourceRuntimeConfiguration? = nil,
        kinesis_video_stream_source_runtime_configuration : Types::KinesisVideoStreamSourceRuntimeConfiguration? = nil,
        media_insights_runtime_metadata : Hash(String, String)? = nil,
        s3_recording_sink_runtime_configuration : Types::S3RecordingSinkRuntimeConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMediaInsightsPipelineRequest.new(media_insights_pipeline_configuration_arn: media_insights_pipeline_configuration_arn, client_request_token: client_request_token, kinesis_video_stream_recording_source_runtime_configuration: kinesis_video_stream_recording_source_runtime_configuration, kinesis_video_stream_source_runtime_configuration: kinesis_video_stream_source_runtime_configuration, media_insights_runtime_metadata: media_insights_runtime_metadata, s3_recording_sink_runtime_configuration: s3_recording_sink_runtime_configuration, tags: tags)
        create_media_insights_pipeline(input)
      end
      def create_media_insights_pipeline(input : Types::CreateMediaInsightsPipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEDIA_INSIGHTS_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A structure that contains the static configurations for a media insights pipeline.
      def create_media_insights_pipeline_configuration(
        elements : Array(Types::MediaInsightsPipelineConfigurationElement),
        media_insights_pipeline_configuration_name : String,
        resource_access_role_arn : String,
        client_request_token : String? = nil,
        real_time_alert_configuration : Types::RealTimeAlertConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMediaInsightsPipelineConfigurationRequest.new(elements: elements, media_insights_pipeline_configuration_name: media_insights_pipeline_configuration_name, resource_access_role_arn: resource_access_role_arn, client_request_token: client_request_token, real_time_alert_configuration: real_time_alert_configuration, tags: tags)
        create_media_insights_pipeline_configuration(input)
      end
      def create_media_insights_pipeline_configuration(input : Types::CreateMediaInsightsPipelineConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEDIA_INSIGHTS_PIPELINE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a media live connector pipeline in an Amazon Chime SDK meeting.
      def create_media_live_connector_pipeline(
        sinks : Array(Types::LiveConnectorSinkConfiguration),
        sources : Array(Types::LiveConnectorSourceConfiguration),
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMediaLiveConnectorPipelineRequest.new(sinks: sinks, sources: sources, client_request_token: client_request_token, tags: tags)
        create_media_live_connector_pipeline(input)
      end
      def create_media_live_connector_pipeline(input : Types::CreateMediaLiveConnectorPipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEDIA_LIVE_CONNECTOR_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Kinesis Video Stream pool for use with media stream pipelines. If a meeting uses
      # an opt-in Region as its MediaRegion , the KVS stream must be in that same Region. For example, if a
      # meeting uses the af-south-1 Region, the KVS stream must also be in af-south-1 . However, if the
      # meeting uses a Region that AWS turns on by default, the KVS stream can be in any available Region,
      # including an opt-in Region. For example, if the meeting uses ca-central-1 , the KVS stream can be in
      # eu-west-2 , us-east-1 , af-south-1 , or any other Region that the Amazon Chime SDK supports. To
      # learn which AWS Region a meeting uses, call the GetMeeting API and use the MediaRegion parameter
      # from the response. For more information about opt-in Regions, refer to Available Regions in the
      # Amazon Chime SDK Developer Guide , and Specify which AWS Regions your account can use , in the AWS
      # Account Management Reference Guide .
      def create_media_pipeline_kinesis_video_stream_pool(
        pool_name : String,
        stream_configuration : Types::KinesisVideoStreamConfiguration,
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMediaPipelineKinesisVideoStreamPoolRequest.new(pool_name: pool_name, stream_configuration: stream_configuration, client_request_token: client_request_token, tags: tags)
        create_media_pipeline_kinesis_video_stream_pool(input)
      end
      def create_media_pipeline_kinesis_video_stream_pool(input : Types::CreateMediaPipelineKinesisVideoStreamPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a streaming media pipeline.
      def create_media_stream_pipeline(
        sinks : Array(Types::MediaStreamSink),
        sources : Array(Types::MediaStreamSource),
        client_request_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMediaStreamPipelineRequest.new(sinks: sinks, sources: sources, client_request_token: client_request_token, tags: tags)
        create_media_stream_pipeline(input)
      end
      def create_media_stream_pipeline(input : Types::CreateMediaStreamPipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEDIA_STREAM_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the media pipeline.
      def delete_media_capture_pipeline(
        media_pipeline_id : String
      ) : Protocol::Request
        input = Types::DeleteMediaCapturePipelineRequest.new(media_pipeline_id: media_pipeline_id)
        delete_media_capture_pipeline(input)
      end
      def delete_media_capture_pipeline(input : Types::DeleteMediaCapturePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEDIA_CAPTURE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified configuration settings.
      def delete_media_insights_pipeline_configuration(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteMediaInsightsPipelineConfigurationRequest.new(identifier: identifier)
        delete_media_insights_pipeline_configuration(input)
      end
      def delete_media_insights_pipeline_configuration(input : Types::DeleteMediaInsightsPipelineConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEDIA_INSIGHTS_PIPELINE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the media pipeline.
      def delete_media_pipeline(
        media_pipeline_id : String
      ) : Protocol::Request
        input = Types::DeleteMediaPipelineRequest.new(media_pipeline_id: media_pipeline_id)
        delete_media_pipeline(input)
      end
      def delete_media_pipeline(input : Types::DeleteMediaPipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEDIA_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Kinesis Video Stream pool.
      def delete_media_pipeline_kinesis_video_stream_pool(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteMediaPipelineKinesisVideoStreamPoolRequest.new(identifier: identifier)
        delete_media_pipeline_kinesis_video_stream_pool(input)
      end
      def delete_media_pipeline_kinesis_video_stream_pool(input : Types::DeleteMediaPipelineKinesisVideoStreamPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an existing media pipeline.
      def get_media_capture_pipeline(
        media_pipeline_id : String
      ) : Protocol::Request
        input = Types::GetMediaCapturePipelineRequest.new(media_pipeline_id: media_pipeline_id)
        get_media_capture_pipeline(input)
      end
      def get_media_capture_pipeline(input : Types::GetMediaCapturePipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEDIA_CAPTURE_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the configuration settings for a media insights pipeline.
      def get_media_insights_pipeline_configuration(
        identifier : String
      ) : Protocol::Request
        input = Types::GetMediaInsightsPipelineConfigurationRequest.new(identifier: identifier)
        get_media_insights_pipeline_configuration(input)
      end
      def get_media_insights_pipeline_configuration(input : Types::GetMediaInsightsPipelineConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEDIA_INSIGHTS_PIPELINE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an existing media pipeline.
      def get_media_pipeline(
        media_pipeline_id : String
      ) : Protocol::Request
        input = Types::GetMediaPipelineRequest.new(media_pipeline_id: media_pipeline_id)
        get_media_pipeline(input)
      end
      def get_media_pipeline(input : Types::GetMediaPipelineRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEDIA_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Kinesis video stream pool.
      def get_media_pipeline_kinesis_video_stream_pool(
        identifier : String
      ) : Protocol::Request
        input = Types::GetMediaPipelineKinesisVideoStreamPoolRequest.new(identifier: identifier)
        get_media_pipeline_kinesis_video_stream_pool(input)
      end
      def get_media_pipeline_kinesis_video_stream_pool(input : Types::GetMediaPipelineKinesisVideoStreamPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of the specified speaker search task.
      def get_speaker_search_task(
        identifier : String,
        speaker_search_task_id : String
      ) : Protocol::Request
        input = Types::GetSpeakerSearchTaskRequest.new(identifier: identifier, speaker_search_task_id: speaker_search_task_id)
        get_speaker_search_task(input)
      end
      def get_speaker_search_task(input : Types::GetSpeakerSearchTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SPEAKER_SEARCH_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of a voice tone analysis task.
      def get_voice_tone_analysis_task(
        identifier : String,
        voice_tone_analysis_task_id : String
      ) : Protocol::Request
        input = Types::GetVoiceToneAnalysisTaskRequest.new(identifier: identifier, voice_tone_analysis_task_id: voice_tone_analysis_task_id)
        get_voice_tone_analysis_task(input)
      end
      def get_voice_tone_analysis_task(input : Types::GetVoiceToneAnalysisTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VOICE_TONE_ANALYSIS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of media pipelines.
      def list_media_capture_pipelines(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMediaCapturePipelinesRequest.new(max_results: max_results, next_token: next_token)
        list_media_capture_pipelines(input)
      end
      def list_media_capture_pipelines(input : Types::ListMediaCapturePipelinesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEDIA_CAPTURE_PIPELINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the available media insights pipeline configurations.
      def list_media_insights_pipeline_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMediaInsightsPipelineConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_media_insights_pipeline_configurations(input)
      end
      def list_media_insights_pipeline_configurations(input : Types::ListMediaInsightsPipelineConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEDIA_INSIGHTS_PIPELINE_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the video stream pools in the media pipeline.
      def list_media_pipeline_kinesis_video_stream_pools(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMediaPipelineKinesisVideoStreamPoolsRequest.new(max_results: max_results, next_token: next_token)
        list_media_pipeline_kinesis_video_stream_pools(input)
      end
      def list_media_pipeline_kinesis_video_stream_pools(input : Types::ListMediaPipelineKinesisVideoStreamPoolsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of media pipelines.
      def list_media_pipelines(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMediaPipelinesRequest.new(max_results: max_results, next_token: next_token)
        list_media_pipelines(input)
      end
      def list_media_pipelines(input : Types::ListMediaPipelinesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEDIA_PIPELINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags available for a media pipeline.
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

      # Starts a speaker search task. Before starting any speaker search tasks, you must provide all notices
      # and obtain all consents from the speaker as required under applicable privacy and biometrics laws,
      # and as required under the AWS service terms for the Amazon Chime SDK.
      def start_speaker_search_task(
        identifier : String,
        voice_profile_domain_arn : String,
        client_request_token : String? = nil,
        kinesis_video_stream_source_task_configuration : Types::KinesisVideoStreamSourceTaskConfiguration? = nil
      ) : Protocol::Request
        input = Types::StartSpeakerSearchTaskRequest.new(identifier: identifier, voice_profile_domain_arn: voice_profile_domain_arn, client_request_token: client_request_token, kinesis_video_stream_source_task_configuration: kinesis_video_stream_source_task_configuration)
        start_speaker_search_task(input)
      end
      def start_speaker_search_task(input : Types::StartSpeakerSearchTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SPEAKER_SEARCH_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a voice tone analysis task. For more information about voice tone analysis, see Using Amazon
      # Chime SDK voice analytics in the Amazon Chime SDK Developer Guide . Before starting any voice tone
      # analysis tasks, you must provide all notices and obtain all consents from the speaker as required
      # under applicable privacy and biometrics laws, and as required under the AWS service terms for the
      # Amazon Chime SDK.
      def start_voice_tone_analysis_task(
        identifier : String,
        language_code : String,
        client_request_token : String? = nil,
        kinesis_video_stream_source_task_configuration : Types::KinesisVideoStreamSourceTaskConfiguration? = nil
      ) : Protocol::Request
        input = Types::StartVoiceToneAnalysisTaskRequest.new(identifier: identifier, language_code: language_code, client_request_token: client_request_token, kinesis_video_stream_source_task_configuration: kinesis_video_stream_source_task_configuration)
        start_voice_tone_analysis_task(input)
      end
      def start_voice_tone_analysis_task(input : Types::StartVoiceToneAnalysisTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_VOICE_TONE_ANALYSIS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a speaker search task.
      def stop_speaker_search_task(
        identifier : String,
        speaker_search_task_id : String
      ) : Protocol::Request
        input = Types::StopSpeakerSearchTaskRequest.new(identifier: identifier, speaker_search_task_id: speaker_search_task_id)
        stop_speaker_search_task(input)
      end
      def stop_speaker_search_task(input : Types::StopSpeakerSearchTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_SPEAKER_SEARCH_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a voice tone analysis task.
      def stop_voice_tone_analysis_task(
        identifier : String,
        voice_tone_analysis_task_id : String
      ) : Protocol::Request
        input = Types::StopVoiceToneAnalysisTaskRequest.new(identifier: identifier, voice_tone_analysis_task_id: voice_tone_analysis_task_id)
        stop_voice_tone_analysis_task(input)
      end
      def stop_voice_tone_analysis_task(input : Types::StopVoiceToneAnalysisTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_VOICE_TONE_ANALYSIS_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The ARN of the media pipeline that you want to tag. Consists of the pipeline's endpoint region,
      # resource ID, and pipeline ID.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes any tags from a media pipeline.
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

      # Updates the media insights pipeline's configuration settings.
      def update_media_insights_pipeline_configuration(
        elements : Array(Types::MediaInsightsPipelineConfigurationElement),
        identifier : String,
        resource_access_role_arn : String,
        real_time_alert_configuration : Types::RealTimeAlertConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateMediaInsightsPipelineConfigurationRequest.new(elements: elements, identifier: identifier, resource_access_role_arn: resource_access_role_arn, real_time_alert_configuration: real_time_alert_configuration)
        update_media_insights_pipeline_configuration(input)
      end
      def update_media_insights_pipeline_configuration(input : Types::UpdateMediaInsightsPipelineConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEDIA_INSIGHTS_PIPELINE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of a media insights pipeline.
      def update_media_insights_pipeline_status(
        identifier : String,
        update_status : String
      ) : Protocol::Request
        input = Types::UpdateMediaInsightsPipelineStatusRequest.new(identifier: identifier, update_status: update_status)
        update_media_insights_pipeline_status(input)
      end
      def update_media_insights_pipeline_status(input : Types::UpdateMediaInsightsPipelineStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEDIA_INSIGHTS_PIPELINE_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon Kinesis Video Stream pool in a media pipeline.
      def update_media_pipeline_kinesis_video_stream_pool(
        identifier : String,
        stream_configuration : Types::KinesisVideoStreamConfigurationUpdate? = nil
      ) : Protocol::Request
        input = Types::UpdateMediaPipelineKinesisVideoStreamPoolRequest.new(identifier: identifier, stream_configuration: stream_configuration)
        update_media_pipeline_kinesis_video_stream_pool(input)
      end
      def update_media_pipeline_kinesis_video_stream_pool(input : Types::UpdateMediaPipelineKinesisVideoStreamPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEDIA_PIPELINE_KINESIS_VIDEO_STREAM_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
