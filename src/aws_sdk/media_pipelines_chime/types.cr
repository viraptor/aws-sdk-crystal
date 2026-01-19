require "json"
require "time"

module AwsSdk
  module ChimeSDKMediaPipelines
    module Types

      # Defines the configuration for an ActiveSpeakerOnly video tile.
      struct ActiveSpeakerOnlyConfiguration
        include JSON::Serializable

        # The position of the ActiveSpeakerOnly video tile.
        @[JSON::Field(key: "ActiveSpeakerPosition")]
        getter active_speaker_position : String?

        def initialize(
          @active_speaker_position : String? = nil
        )
        end
      end

      # A structure that contains the configuration settings for an Amazon Transcribe call analytics
      # processor.
      struct AmazonTranscribeCallAnalyticsProcessorConfiguration
        include JSON::Serializable

        # The language code in the configuration.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # By default, all CategoryEvents are sent to the insights target. If this parameter is specified, only
        # included categories are sent to the insights target.
        @[JSON::Field(key: "CallAnalyticsStreamCategories")]
        getter call_analytics_stream_categories : Array(String)?

        # Labels all personally identifiable information (PII) identified in your transcript. Content
        # identification is performed at the segment level; PII specified in PiiEntityTypes is flagged upon
        # complete transcription of an audio segment. You can’t set ContentIdentificationType and
        # ContentRedactionType in the same request. If you do, your request returns a BadRequestException .
        # For more information, see Redacting or identifying personally identifiable information in the Amazon
        # Transcribe Developer Guide .
        @[JSON::Field(key: "ContentIdentificationType")]
        getter content_identification_type : String?

        # Redacts all personally identifiable information (PII) identified in your transcript. Content
        # redaction is performed at the segment level; PII specified in PiiEntityTypes is redacted upon
        # complete transcription of an audio segment. You can’t set ContentRedactionType and
        # ContentIdentificationType in the same request. If you do, your request returns a BadRequestException
        # . For more information, see Redacting or identifying personally identifiable information in the
        # Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "ContentRedactionType")]
        getter content_redaction_type : String?

        # Enables partial result stabilization for your transcription. Partial result stabilization can reduce
        # latency in your output, but may impact accuracy. For more information, see Partial-result
        # stabilization in the Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "EnablePartialResultsStabilization")]
        getter enable_partial_results_stabilization : Bool?

        # If true, UtteranceEvents with IsPartial: true are filtered out of the insights target.
        @[JSON::Field(key: "FilterPartialResults")]
        getter filter_partial_results : Bool?

        # Specifies the name of the custom language model to use when processing a transcription. Note that
        # language model names are case sensitive. The language of the specified language model must match the
        # language code specified in the transcription request. If the languages don't match, the custom
        # language model isn't applied. Language mismatches don't generate errors or warnings. For more
        # information, see Custom language models in the Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "LanguageModelName")]
        getter language_model_name : String?

        # Specifies the level of stability to use when you enable partial results stabilization (
        # EnablePartialResultsStabilization ). Low stability provides the highest accuracy. High stability
        # transcribes faster, but with slightly lower accuracy. For more information, see Partial-result
        # stabilization in the Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "PartialResultsStability")]
        getter partial_results_stability : String?

        # Specifies the types of personally identifiable information (PII) to redact from a transcript. You
        # can include as many types as you'd like, or you can select ALL . To include PiiEntityTypes in your
        # Call Analytics request, you must also include ContentIdentificationType or ContentRedactionType ,
        # but you can't include both. Values must be comma-separated and can include: ADDRESS ,
        # BANK_ACCOUNT_NUMBER , BANK_ROUTING , CREDIT_DEBIT_CVV , CREDIT_DEBIT_EXPIRY , CREDIT_DEBIT_NUMBER ,
        # EMAIL , NAME , PHONE , PIN , SSN , or ALL . Length Constraints: Minimum length of 1. Maximum length
        # of 300.
        @[JSON::Field(key: "PiiEntityTypes")]
        getter pii_entity_types : String?

        # The settings for a post-call analysis task in an analytics configuration.
        @[JSON::Field(key: "PostCallAnalyticsSettings")]
        getter post_call_analytics_settings : Types::PostCallAnalyticsSettings?

        # Specifies how to apply a vocabulary filter to a transcript. To replace words with *** , choose mask
        # . To delete words, choose remove . To flag words without changing them, choose tag .
        @[JSON::Field(key: "VocabularyFilterMethod")]
        getter vocabulary_filter_method : String?

        # Specifies the name of the custom vocabulary filter to use when processing a transcription. Note that
        # vocabulary filter names are case sensitive. If the language of the specified custom vocabulary
        # filter doesn't match the language identified in your media, the vocabulary filter is not applied to
        # your transcription. For more information, see Using vocabulary filtering with unwanted words in the
        # Amazon Transcribe Developer Guide . Length Constraints: Minimum length of 1. Maximum length of 200.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        # Specifies the name of the custom vocabulary to use when processing a transcription. Note that
        # vocabulary names are case sensitive. If the language of the specified custom vocabulary doesn't
        # match the language identified in your media, the custom vocabulary is not applied to your
        # transcription. For more information, see Custom vocabularies in the Amazon Transcribe Developer
        # Guide . Length Constraints: Minimum length of 1. Maximum length of 200.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        def initialize(
          @language_code : String,
          @call_analytics_stream_categories : Array(String)? = nil,
          @content_identification_type : String? = nil,
          @content_redaction_type : String? = nil,
          @enable_partial_results_stabilization : Bool? = nil,
          @filter_partial_results : Bool? = nil,
          @language_model_name : String? = nil,
          @partial_results_stability : String? = nil,
          @pii_entity_types : String? = nil,
          @post_call_analytics_settings : Types::PostCallAnalyticsSettings? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end

      # A structure that contains the configuration settings for an Amazon Transcribe processor. Calls to
      # this API must include a LanguageCode , IdentifyLanguage , or IdentifyMultipleLanguages parameter. If
      # you include more than one of those parameters, your transcription job fails.
      struct AmazonTranscribeProcessorConfiguration
        include JSON::Serializable

        # Labels all personally identifiable information (PII) identified in your transcript. Content
        # identification is performed at the segment level; PII specified in PiiEntityTypes is flagged upon
        # complete transcription of an audio segment. You can’t set ContentIdentificationType and
        # ContentRedactionType in the same request. If you set both, your request returns a
        # BadRequestException . For more information, see Redacting or identifying personally identifiable
        # information in the Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "ContentIdentificationType")]
        getter content_identification_type : String?

        # Redacts all personally identifiable information (PII) identified in your transcript. Content
        # redaction is performed at the segment level; PII specified in PiiEntityTypes is redacted upon
        # complete transcription of an audio segment. You can’t set ContentRedactionType and
        # ContentIdentificationType in the same request. If you set both, your request returns a
        # BadRequestException . For more information, see Redacting or identifying personally identifiable
        # information in the Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "ContentRedactionType")]
        getter content_redaction_type : String?

        # Enables partial result stabilization for your transcription. Partial result stabilization can reduce
        # latency in your output, but may impact accuracy. For more information, see Partial-result
        # stabilization in the Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "EnablePartialResultsStabilization")]
        getter enable_partial_results_stabilization : Bool?

        # If true, TranscriptEvents with IsPartial: true are filtered out of the insights target.
        @[JSON::Field(key: "FilterPartialResults")]
        getter filter_partial_results : Bool?

        # Turns language identification on or off.
        @[JSON::Field(key: "IdentifyLanguage")]
        getter identify_language : Bool?

        # Turns language identification on or off for multiple languages. Calls to this API must include a
        # LanguageCode , IdentifyLanguage , or IdentifyMultipleLanguages parameter. If you include more than
        # one of those parameters, your transcription job fails.
        @[JSON::Field(key: "IdentifyMultipleLanguages")]
        getter identify_multiple_languages : Bool?

        # The language code that represents the language spoken in your audio. If you're unsure of the
        # language spoken in your audio, consider using IdentifyLanguage to enable automatic language
        # identification. For a list of languages that real-time Call Analytics supports, see the Supported
        # languages table in the Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The name of the custom language model that you want to use when processing your transcription. Note
        # that language model names are case sensitive. The language of the specified language model must
        # match the language code you specify in your transcription request. If the languages don't match, the
        # custom language model isn't applied. There are no errors or warnings associated with a language
        # mismatch. For more information, see Custom language models in the Amazon Transcribe Developer Guide
        # .
        @[JSON::Field(key: "LanguageModelName")]
        getter language_model_name : String?

        # The language options for the transcription, such as automatic language detection.
        @[JSON::Field(key: "LanguageOptions")]
        getter language_options : String?

        # The level of stability to use when you enable partial results stabilization (
        # EnablePartialResultsStabilization ). Low stability provides the highest accuracy. High stability
        # transcribes faster, but with slightly lower accuracy. For more information, see Partial-result
        # stabilization in the Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "PartialResultsStability")]
        getter partial_results_stability : String?

        # The types of personally identifiable information (PII) to redact from a transcript. You can include
        # as many types as you'd like, or you can select ALL . To include PiiEntityTypes in your Call
        # Analytics request, you must also include ContentIdentificationType or ContentRedactionType , but you
        # can't include both. Values must be comma-separated and can include: ADDRESS , BANK_ACCOUNT_NUMBER ,
        # BANK_ROUTING , CREDIT_DEBIT_CVV , CREDIT_DEBIT_EXPIRY , CREDIT_DEBIT_NUMBER , EMAIL , NAME , PHONE ,
        # PIN , SSN , or ALL . If you leave this parameter empty, the default behavior is equivalent to ALL .
        @[JSON::Field(key: "PiiEntityTypes")]
        getter pii_entity_types : String?

        # The preferred language for the transcription.
        @[JSON::Field(key: "PreferredLanguage")]
        getter preferred_language : String?

        # Enables speaker partitioning (diarization) in your transcription output. Speaker partitioning labels
        # the speech from individual speakers in your media file. For more information, see Partitioning
        # speakers (diarization) in the Amazon Transcribe Developer Guide .
        @[JSON::Field(key: "ShowSpeakerLabel")]
        getter show_speaker_label : Bool?

        # The vocabulary filtering method used in your Call Analytics transcription.
        @[JSON::Field(key: "VocabularyFilterMethod")]
        getter vocabulary_filter_method : String?

        # The name of the custom vocabulary filter that you specified in your Call Analytics request. Length
        # Constraints: Minimum length of 1. Maximum length of 200.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        # The names of the custom vocabulary filter or filters using during transcription.
        @[JSON::Field(key: "VocabularyFilterNames")]
        getter vocabulary_filter_names : String?

        # The name of the custom vocabulary that you specified in your Call Analytics request. Length
        # Constraints: Minimum length of 1. Maximum length of 200.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        # The names of the custom vocabulary or vocabularies used during transcription.
        @[JSON::Field(key: "VocabularyNames")]
        getter vocabulary_names : String?

        def initialize(
          @content_identification_type : String? = nil,
          @content_redaction_type : String? = nil,
          @enable_partial_results_stabilization : Bool? = nil,
          @filter_partial_results : Bool? = nil,
          @identify_language : Bool? = nil,
          @identify_multiple_languages : Bool? = nil,
          @language_code : String? = nil,
          @language_model_name : String? = nil,
          @language_options : String? = nil,
          @partial_results_stability : String? = nil,
          @pii_entity_types : String? = nil,
          @preferred_language : String? = nil,
          @show_speaker_label : Bool? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_filter_names : String? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_names : String? = nil
        )
        end
      end

      # The configuration for the artifacts concatenation.
      struct ArtifactsConcatenationConfiguration
        include JSON::Serializable

        # The configuration for the audio artifacts concatenation.
        @[JSON::Field(key: "Audio")]
        getter audio : Types::AudioConcatenationConfiguration

        # The configuration for the composited video artifacts concatenation.
        @[JSON::Field(key: "CompositedVideo")]
        getter composited_video : Types::CompositedVideoConcatenationConfiguration

        # The configuration for the content artifacts concatenation.
        @[JSON::Field(key: "Content")]
        getter content : Types::ContentConcatenationConfiguration

        # The configuration for the data channel artifacts concatenation.
        @[JSON::Field(key: "DataChannel")]
        getter data_channel : Types::DataChannelConcatenationConfiguration

        # The configuration for the meeting events artifacts concatenation.
        @[JSON::Field(key: "MeetingEvents")]
        getter meeting_events : Types::MeetingEventsConcatenationConfiguration

        # The configuration for the transcription messages artifacts concatenation.
        @[JSON::Field(key: "TranscriptionMessages")]
        getter transcription_messages : Types::TranscriptionMessagesConcatenationConfiguration

        # The configuration for the video artifacts concatenation.
        @[JSON::Field(key: "Video")]
        getter video : Types::VideoConcatenationConfiguration

        def initialize(
          @audio : Types::AudioConcatenationConfiguration,
          @composited_video : Types::CompositedVideoConcatenationConfiguration,
          @content : Types::ContentConcatenationConfiguration,
          @data_channel : Types::DataChannelConcatenationConfiguration,
          @meeting_events : Types::MeetingEventsConcatenationConfiguration,
          @transcription_messages : Types::TranscriptionMessagesConcatenationConfiguration,
          @video : Types::VideoConcatenationConfiguration
        )
        end
      end

      # The configuration for the artifacts.
      struct ArtifactsConfiguration
        include JSON::Serializable

        # The configuration for the audio artifacts.
        @[JSON::Field(key: "Audio")]
        getter audio : Types::AudioArtifactsConfiguration

        # The configuration for the content artifacts.
        @[JSON::Field(key: "Content")]
        getter content : Types::ContentArtifactsConfiguration

        # The configuration for the video artifacts.
        @[JSON::Field(key: "Video")]
        getter video : Types::VideoArtifactsConfiguration

        # Enables video compositing.
        @[JSON::Field(key: "CompositedVideo")]
        getter composited_video : Types::CompositedVideoArtifactsConfiguration?

        def initialize(
          @audio : Types::AudioArtifactsConfiguration,
          @content : Types::ContentArtifactsConfiguration,
          @video : Types::VideoArtifactsConfiguration,
          @composited_video : Types::CompositedVideoArtifactsConfiguration? = nil
        )
        end
      end

      # The audio artifact configuration object.
      struct AudioArtifactsConfiguration
        include JSON::Serializable

        # The MUX type of the audio artifact configuration object.
        @[JSON::Field(key: "MuxType")]
        getter mux_type : String

        def initialize(
          @mux_type : String
        )
        end
      end

      # The audio artifact concatenation configuration object.
      struct AudioConcatenationConfiguration
        include JSON::Serializable

        # Enables or disables the configuration object.
        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # The input parameters don't match the service's restrictions.
      struct BadRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request ID associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Defines an audio channel in a Kinesis video stream.
      struct ChannelDefinition
        include JSON::Serializable

        # The channel ID.
        @[JSON::Field(key: "ChannelId")]
        getter channel_id : Int32

        # Specifies whether the audio in a channel belongs to the AGENT or CUSTOMER .
        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String?

        def initialize(
          @channel_id : Int32,
          @participant_role : String? = nil
        )
        end
      end

      # The configuration object of the Amazon Chime SDK meeting concatenation for a specified media
      # pipeline.
      struct ChimeSdkMeetingConcatenationConfiguration
        include JSON::Serializable

        # The configuration for the artifacts in an Amazon Chime SDK meeting concatenation.
        @[JSON::Field(key: "ArtifactsConfiguration")]
        getter artifacts_configuration : Types::ArtifactsConcatenationConfiguration

        def initialize(
          @artifacts_configuration : Types::ArtifactsConcatenationConfiguration
        )
        end
      end

      # The configuration object of the Amazon Chime SDK meeting for a specified media pipeline. SourceType
      # must be ChimeSdkMeeting .
      struct ChimeSdkMeetingConfiguration
        include JSON::Serializable

        # The configuration for the artifacts in an Amazon Chime SDK meeting.
        @[JSON::Field(key: "ArtifactsConfiguration")]
        getter artifacts_configuration : Types::ArtifactsConfiguration?

        # The source configuration for a specified media pipeline.
        @[JSON::Field(key: "SourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        def initialize(
          @artifacts_configuration : Types::ArtifactsConfiguration? = nil,
          @source_configuration : Types::SourceConfiguration? = nil
        )
        end
      end

      # The media pipeline's configuration object.
      struct ChimeSdkMeetingLiveConnectorConfiguration
        include JSON::Serializable

        # The configuration object's Chime SDK meeting ARN.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The configuration object's multiplex type.
        @[JSON::Field(key: "MuxType")]
        getter mux_type : String

        # The media pipeline's composited video.
        @[JSON::Field(key: "CompositedVideo")]
        getter composited_video : Types::CompositedVideoArtifactsConfiguration?

        # The source configuration settings of the media pipeline's configuration object.
        @[JSON::Field(key: "SourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        def initialize(
          @arn : String,
          @mux_type : String,
          @composited_video : Types::CompositedVideoArtifactsConfiguration? = nil,
          @source_configuration : Types::SourceConfiguration? = nil
        )
        end
      end

      # Specifies the configuration for compositing video artifacts.
      struct CompositedVideoArtifactsConfiguration
        include JSON::Serializable

        # The GridView configuration setting.
        @[JSON::Field(key: "GridViewConfiguration")]
        getter grid_view_configuration : Types::GridViewConfiguration

        # The layout setting, such as GridView in the configuration object.
        @[JSON::Field(key: "Layout")]
        getter layout : String?

        # The video resolution setting in the configuration object. Default: HD at 1280 x 720. FHD resolution:
        # 1920 x 1080.
        @[JSON::Field(key: "Resolution")]
        getter resolution : String?

        def initialize(
          @grid_view_configuration : Types::GridViewConfiguration,
          @layout : String? = nil,
          @resolution : String? = nil
        )
        end
      end

      # The composited video configuration object for a specified media pipeline. SourceType must be
      # ChimeSdkMeeting .
      struct CompositedVideoConcatenationConfiguration
        include JSON::Serializable

        # Enables or disables the configuration object.
        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # The data sink of the configuration object.
      struct ConcatenationSink
        include JSON::Serializable

        # The configuration settings for an Amazon S3 bucket sink.
        @[JSON::Field(key: "S3BucketSinkConfiguration")]
        getter s3_bucket_sink_configuration : Types::S3BucketSinkConfiguration

        # The type of data sink in the configuration object.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @s3_bucket_sink_configuration : Types::S3BucketSinkConfiguration,
          @type : String
        )
        end
      end

      # The source type and media pipeline configuration settings in a configuration object.
      struct ConcatenationSource
        include JSON::Serializable

        # The concatenation settings for the media pipeline in a configuration object.
        @[JSON::Field(key: "MediaCapturePipelineSourceConfiguration")]
        getter media_capture_pipeline_source_configuration : Types::MediaCapturePipelineSourceConfiguration

        # The type of concatenation source in a configuration object.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @media_capture_pipeline_source_configuration : Types::MediaCapturePipelineSourceConfiguration,
          @type : String
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request ID associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The content artifact object.
      struct ContentArtifactsConfiguration
        include JSON::Serializable

        # Indicates whether the content artifact is enabled or disabled.
        @[JSON::Field(key: "State")]
        getter state : String

        # The MUX type of the artifact configuration.
        @[JSON::Field(key: "MuxType")]
        getter mux_type : String?

        def initialize(
          @state : String,
          @mux_type : String? = nil
        )
        end
      end

      # The composited content configuration object for a specified media pipeline.
      struct ContentConcatenationConfiguration
        include JSON::Serializable

        # Enables or disables the configuration object.
        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      struct CreateMediaCapturePipelineRequest
        include JSON::Serializable

        # The ARN of the sink type.
        @[JSON::Field(key: "SinkArn")]
        getter sink_arn : String

        # Destination type to which the media artifacts are saved. You must use an S3 bucket.
        @[JSON::Field(key: "SinkType")]
        getter sink_type : String

        # ARN of the source from which the media artifacts are captured.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String

        # Source type from which the media artifacts are captured. A Chime SDK Meeting is the only supported
        # source.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String

        # The configuration for a specified media pipeline. SourceType must be ChimeSdkMeeting .
        @[JSON::Field(key: "ChimeSdkMeetingConfiguration")]
        getter chime_sdk_meeting_configuration : Types::ChimeSdkMeetingConfiguration?

        # The unique identifier for the client request. The token makes the API request idempotent. Use a
        # unique token for each media pipeline request.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The Amazon Resource Name (ARN) of the sink role to be used with AwsKmsKeyId in
        # SseAwsKeyManagementParams . Can only interact with S3Bucket sink type. The role must belong to the
        # caller’s account and be able to act on behalf of the caller during the API call. All minimum policy
        # permissions requirements for the caller to perform sink-related actions are the same for
        # SinkIamRoleArn . Additionally, the role must have permission to kms:GenerateDataKey using KMS key
        # supplied as AwsKmsKeyId in SseAwsKeyManagementParams . If media concatenation will be required
        # later, the role must also have permission to kms:Decrypt for the same KMS key.
        @[JSON::Field(key: "SinkIamRoleArn")]
        getter sink_iam_role_arn : String?

        # An object that contains server side encryption parameters to be used by media capture pipeline. The
        # parameters can also be used by media concatenation pipeline taking media capture pipeline as a media
        # source.
        @[JSON::Field(key: "SseAwsKeyManagementParams")]
        getter sse_aws_key_management_params : Types::SseAwsKeyManagementParams?

        # The tag key-value pairs.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @sink_arn : String,
          @sink_type : String,
          @source_arn : String,
          @source_type : String,
          @chime_sdk_meeting_configuration : Types::ChimeSdkMeetingConfiguration? = nil,
          @client_request_token : String? = nil,
          @sink_iam_role_arn : String? = nil,
          @sse_aws_key_management_params : Types::SseAwsKeyManagementParams? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMediaCapturePipelineResponse
        include JSON::Serializable

        # A media pipeline object, the ID, source type, source ARN, sink type, and sink ARN of a media
        # pipeline object.
        @[JSON::Field(key: "MediaCapturePipeline")]
        getter media_capture_pipeline : Types::MediaCapturePipeline?

        def initialize(
          @media_capture_pipeline : Types::MediaCapturePipeline? = nil
        )
        end
      end

      struct CreateMediaConcatenationPipelineRequest
        include JSON::Serializable

        # An object that specifies the data sinks for the media concatenation pipeline.
        @[JSON::Field(key: "Sinks")]
        getter sinks : Array(Types::ConcatenationSink)

        # An object that specifies the sources for the media concatenation pipeline.
        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::ConcatenationSource)

        # The unique identifier for the client request. The token makes the API request idempotent. Use a
        # unique token for each media concatenation pipeline request.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The tags associated with the media concatenation pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @sinks : Array(Types::ConcatenationSink),
          @sources : Array(Types::ConcatenationSource),
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMediaConcatenationPipelineResponse
        include JSON::Serializable

        # A media concatenation pipeline object, the ID, source type, MediaPipelineARN , and sink of a media
        # concatenation pipeline object.
        @[JSON::Field(key: "MediaConcatenationPipeline")]
        getter media_concatenation_pipeline : Types::MediaConcatenationPipeline?

        def initialize(
          @media_concatenation_pipeline : Types::MediaConcatenationPipeline? = nil
        )
        end
      end

      struct CreateMediaInsightsPipelineConfigurationRequest
        include JSON::Serializable

        # The elements in the request, such as a processor for Amazon Transcribe or a sink for a Kinesis Data
        # Stream.
        @[JSON::Field(key: "Elements")]
        getter elements : Array(Types::MediaInsightsPipelineConfigurationElement)

        # The name of the media insights pipeline configuration.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurationName")]
        getter media_insights_pipeline_configuration_name : String

        # The ARN of the role used by the service to access Amazon Web Services resources, including
        # Transcribe and Transcribe Call Analytics , on the caller’s behalf.
        @[JSON::Field(key: "ResourceAccessRoleArn")]
        getter resource_access_role_arn : String

        # The unique identifier for the media insights pipeline configuration request.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The configuration settings for the real-time alerts in a media insights pipeline configuration.
        @[JSON::Field(key: "RealTimeAlertConfiguration")]
        getter real_time_alert_configuration : Types::RealTimeAlertConfiguration?

        # The tags assigned to the media insights pipeline configuration.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @elements : Array(Types::MediaInsightsPipelineConfigurationElement),
          @media_insights_pipeline_configuration_name : String,
          @resource_access_role_arn : String,
          @client_request_token : String? = nil,
          @real_time_alert_configuration : Types::RealTimeAlertConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMediaInsightsPipelineConfigurationResponse
        include JSON::Serializable

        # The configuration settings for the media insights pipeline.
        @[JSON::Field(key: "MediaInsightsPipelineConfiguration")]
        getter media_insights_pipeline_configuration : Types::MediaInsightsPipelineConfiguration?

        def initialize(
          @media_insights_pipeline_configuration : Types::MediaInsightsPipelineConfiguration? = nil
        )
        end
      end

      struct CreateMediaInsightsPipelineRequest
        include JSON::Serializable

        # The ARN of the pipeline's configuration.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurationArn")]
        getter media_insights_pipeline_configuration_arn : String

        # The unique identifier for the media insights pipeline request.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The runtime configuration for the Kinesis video recording stream source.
        @[JSON::Field(key: "KinesisVideoStreamRecordingSourceRuntimeConfiguration")]
        getter kinesis_video_stream_recording_source_runtime_configuration : Types::KinesisVideoStreamRecordingSourceRuntimeConfiguration?

        # The runtime configuration for the Kinesis video stream source of the media insights pipeline.
        @[JSON::Field(key: "KinesisVideoStreamSourceRuntimeConfiguration")]
        getter kinesis_video_stream_source_runtime_configuration : Types::KinesisVideoStreamSourceRuntimeConfiguration?

        # The runtime metadata for the media insights pipeline. Consists of a key-value map of strings.
        @[JSON::Field(key: "MediaInsightsRuntimeMetadata")]
        getter media_insights_runtime_metadata : Hash(String, String)?

        # The runtime configuration for the S3 recording sink. If specified, the settings in this structure
        # override any settings in S3RecordingSinkConfiguration .
        @[JSON::Field(key: "S3RecordingSinkRuntimeConfiguration")]
        getter s3_recording_sink_runtime_configuration : Types::S3RecordingSinkRuntimeConfiguration?

        # The tags assigned to the media insights pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @media_insights_pipeline_configuration_arn : String,
          @client_request_token : String? = nil,
          @kinesis_video_stream_recording_source_runtime_configuration : Types::KinesisVideoStreamRecordingSourceRuntimeConfiguration? = nil,
          @kinesis_video_stream_source_runtime_configuration : Types::KinesisVideoStreamSourceRuntimeConfiguration? = nil,
          @media_insights_runtime_metadata : Hash(String, String)? = nil,
          @s3_recording_sink_runtime_configuration : Types::S3RecordingSinkRuntimeConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMediaInsightsPipelineResponse
        include JSON::Serializable

        # The media insights pipeline object.
        @[JSON::Field(key: "MediaInsightsPipeline")]
        getter media_insights_pipeline : Types::MediaInsightsPipeline

        def initialize(
          @media_insights_pipeline : Types::MediaInsightsPipeline
        )
        end
      end

      struct CreateMediaLiveConnectorPipelineRequest
        include JSON::Serializable

        # The media live connector pipeline's data sinks.
        @[JSON::Field(key: "Sinks")]
        getter sinks : Array(Types::LiveConnectorSinkConfiguration)

        # The media live connector pipeline's data sources.
        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::LiveConnectorSourceConfiguration)

        # The token assigned to the client making the request.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The tags associated with the media live connector pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @sinks : Array(Types::LiveConnectorSinkConfiguration),
          @sources : Array(Types::LiveConnectorSourceConfiguration),
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMediaLiveConnectorPipelineResponse
        include JSON::Serializable

        # The new media live connector pipeline.
        @[JSON::Field(key: "MediaLiveConnectorPipeline")]
        getter media_live_connector_pipeline : Types::MediaLiveConnectorPipeline?

        def initialize(
          @media_live_connector_pipeline : Types::MediaLiveConnectorPipeline? = nil
        )
        end
      end

      struct CreateMediaPipelineKinesisVideoStreamPoolRequest
        include JSON::Serializable

        # The name of the pool.
        @[JSON::Field(key: "PoolName")]
        getter pool_name : String

        # The configuration settings for the stream.
        @[JSON::Field(key: "StreamConfiguration")]
        getter stream_configuration : Types::KinesisVideoStreamConfiguration

        # The token assigned to the client making the request.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The tags assigned to the stream pool.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @pool_name : String,
          @stream_configuration : Types::KinesisVideoStreamConfiguration,
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMediaPipelineKinesisVideoStreamPoolResponse
        include JSON::Serializable

        # The configuration for applying the streams to the pool.
        @[JSON::Field(key: "KinesisVideoStreamPoolConfiguration")]
        getter kinesis_video_stream_pool_configuration : Types::KinesisVideoStreamPoolConfiguration?

        def initialize(
          @kinesis_video_stream_pool_configuration : Types::KinesisVideoStreamPoolConfiguration? = nil
        )
        end
      end

      struct CreateMediaStreamPipelineRequest
        include JSON::Serializable

        # The data sink for the media pipeline.
        @[JSON::Field(key: "Sinks")]
        getter sinks : Array(Types::MediaStreamSink)

        # The data sources for the media pipeline.
        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::MediaStreamSource)

        # The token assigned to the client making the request.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The tags assigned to the media pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @sinks : Array(Types::MediaStreamSink),
          @sources : Array(Types::MediaStreamSource),
          @client_request_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateMediaStreamPipelineResponse
        include JSON::Serializable

        # The requested media pipeline.
        @[JSON::Field(key: "MediaStreamPipeline")]
        getter media_stream_pipeline : Types::MediaStreamPipeline?

        def initialize(
          @media_stream_pipeline : Types::MediaStreamPipeline? = nil
        )
        end
      end

      # The content configuration object's data channel.
      struct DataChannelConcatenationConfiguration
        include JSON::Serializable

        # Enables or disables the configuration object.
        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      struct DeleteMediaCapturePipelineRequest
        include JSON::Serializable

        # The ID of the media pipeline being deleted.
        @[JSON::Field(key: "mediaPipelineId")]
        getter media_pipeline_id : String

        def initialize(
          @media_pipeline_id : String
        )
        end
      end

      struct DeleteMediaInsightsPipelineConfigurationRequest
        include JSON::Serializable

        # The unique identifier of the resource to be deleted. Valid values include the name and ARN of the
        # media insights pipeline configuration.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct DeleteMediaPipelineKinesisVideoStreamPoolRequest
        include JSON::Serializable

        # The unique identifier of the requested resource. Valid values include the name and ARN of the media
        # pipeline Kinesis Video Stream pool.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct DeleteMediaPipelineRequest
        include JSON::Serializable

        # The ID of the media pipeline to delete.
        @[JSON::Field(key: "mediaPipelineId")]
        getter media_pipeline_id : String

        def initialize(
          @media_pipeline_id : String
        )
        end
      end

      # The client is permanently forbidden from making the request.
      struct ForbiddenException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request id associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Describes the timestamp range and timestamp origin of a range of fragments. Only fragments with a
      # start timestamp greater than or equal to the given start time and less than or equal to the end time
      # are returned. For example, say a stream contains fragments with the following start timestamps:
      # 00:00:00 00:00:02 00:00:04 00:00:06 A fragment selector range with a start time of 00:00:01 and end
      # time of 00:00:04 would return the fragments with start times of 00:00:02 and 00:00:04.
      struct FragmentSelector
        include JSON::Serializable

        # The origin of the timestamps to use, Server or Producer . For more information, see
        # StartSelectorType in the Amazon Kinesis Video Streams Developer Guide .
        @[JSON::Field(key: "FragmentSelectorType")]
        getter fragment_selector_type : String

        # The range of timestamps to return.
        @[JSON::Field(key: "TimestampRange")]
        getter timestamp_range : Types::TimestampRange

        def initialize(
          @fragment_selector_type : String,
          @timestamp_range : Types::TimestampRange
        )
        end
      end

      struct GetMediaCapturePipelineRequest
        include JSON::Serializable

        # The ID of the pipeline that you want to get.
        @[JSON::Field(key: "mediaPipelineId")]
        getter media_pipeline_id : String

        def initialize(
          @media_pipeline_id : String
        )
        end
      end

      struct GetMediaCapturePipelineResponse
        include JSON::Serializable

        # The media pipeline object.
        @[JSON::Field(key: "MediaCapturePipeline")]
        getter media_capture_pipeline : Types::MediaCapturePipeline?

        def initialize(
          @media_capture_pipeline : Types::MediaCapturePipeline? = nil
        )
        end
      end

      struct GetMediaInsightsPipelineConfigurationRequest
        include JSON::Serializable

        # The unique identifier of the requested resource. Valid values include the name and ARN of the media
        # insights pipeline configuration.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct GetMediaInsightsPipelineConfigurationResponse
        include JSON::Serializable

        # The requested media insights pipeline configuration.
        @[JSON::Field(key: "MediaInsightsPipelineConfiguration")]
        getter media_insights_pipeline_configuration : Types::MediaInsightsPipelineConfiguration?

        def initialize(
          @media_insights_pipeline_configuration : Types::MediaInsightsPipelineConfiguration? = nil
        )
        end
      end

      struct GetMediaPipelineKinesisVideoStreamPoolRequest
        include JSON::Serializable

        # The unique identifier of the requested resource. Valid values include the name and ARN of the media
        # pipeline Kinesis Video Stream pool.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct GetMediaPipelineKinesisVideoStreamPoolResponse
        include JSON::Serializable

        # The video stream pool configuration object.
        @[JSON::Field(key: "KinesisVideoStreamPoolConfiguration")]
        getter kinesis_video_stream_pool_configuration : Types::KinesisVideoStreamPoolConfiguration?

        def initialize(
          @kinesis_video_stream_pool_configuration : Types::KinesisVideoStreamPoolConfiguration? = nil
        )
        end
      end

      struct GetMediaPipelineRequest
        include JSON::Serializable

        # The ID of the pipeline that you want to get.
        @[JSON::Field(key: "mediaPipelineId")]
        getter media_pipeline_id : String

        def initialize(
          @media_pipeline_id : String
        )
        end
      end

      struct GetMediaPipelineResponse
        include JSON::Serializable

        # The media pipeline object.
        @[JSON::Field(key: "MediaPipeline")]
        getter media_pipeline : Types::MediaPipeline?

        def initialize(
          @media_pipeline : Types::MediaPipeline? = nil
        )
        end
      end

      struct GetSpeakerSearchTaskRequest
        include JSON::Serializable

        # The unique identifier of the resource to be updated. Valid values include the ID and ARN of the
        # media insights pipeline.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The ID of the speaker search task.
        @[JSON::Field(key: "speakerSearchTaskId")]
        getter speaker_search_task_id : String

        def initialize(
          @identifier : String,
          @speaker_search_task_id : String
        )
        end
      end

      struct GetSpeakerSearchTaskResponse
        include JSON::Serializable

        # The details of the speaker search task.
        @[JSON::Field(key: "SpeakerSearchTask")]
        getter speaker_search_task : Types::SpeakerSearchTask?

        def initialize(
          @speaker_search_task : Types::SpeakerSearchTask? = nil
        )
        end
      end

      struct GetVoiceToneAnalysisTaskRequest
        include JSON::Serializable

        # The unique identifier of the resource to be updated. Valid values include the ID and ARN of the
        # media insights pipeline.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The ID of the voice tone analysis task.
        @[JSON::Field(key: "voiceToneAnalysisTaskId")]
        getter voice_tone_analysis_task_id : String

        def initialize(
          @identifier : String,
          @voice_tone_analysis_task_id : String
        )
        end
      end

      struct GetVoiceToneAnalysisTaskResponse
        include JSON::Serializable

        # The details of the voice tone analysis task.
        @[JSON::Field(key: "VoiceToneAnalysisTask")]
        getter voice_tone_analysis_task : Types::VoiceToneAnalysisTask?

        def initialize(
          @voice_tone_analysis_task : Types::VoiceToneAnalysisTask? = nil
        )
        end
      end

      # Specifies the type of grid layout.
      struct GridViewConfiguration
        include JSON::Serializable

        # Defines the layout of the video tiles when content sharing is enabled.
        @[JSON::Field(key: "ContentShareLayout")]
        getter content_share_layout : String

        # The configuration settings for an ActiveSpeakerOnly video tile.
        @[JSON::Field(key: "ActiveSpeakerOnlyConfiguration")]
        getter active_speaker_only_configuration : Types::ActiveSpeakerOnlyConfiguration?

        # The orientation setting, horizontal or vertical.
        @[JSON::Field(key: "CanvasOrientation")]
        getter canvas_orientation : String?

        # The configuration settings for a horizontal layout.
        @[JSON::Field(key: "HorizontalLayoutConfiguration")]
        getter horizontal_layout_configuration : Types::HorizontalLayoutConfiguration?

        # Defines the configuration options for a presenter only video tile.
        @[JSON::Field(key: "PresenterOnlyConfiguration")]
        getter presenter_only_configuration : Types::PresenterOnlyConfiguration?

        # The configuration settings for a vertical layout.
        @[JSON::Field(key: "VerticalLayoutConfiguration")]
        getter vertical_layout_configuration : Types::VerticalLayoutConfiguration?

        # The attribute settings for the video tiles.
        @[JSON::Field(key: "VideoAttribute")]
        getter video_attribute : Types::VideoAttribute?

        def initialize(
          @content_share_layout : String,
          @active_speaker_only_configuration : Types::ActiveSpeakerOnlyConfiguration? = nil,
          @canvas_orientation : String? = nil,
          @horizontal_layout_configuration : Types::HorizontalLayoutConfiguration? = nil,
          @presenter_only_configuration : Types::PresenterOnlyConfiguration? = nil,
          @vertical_layout_configuration : Types::VerticalLayoutConfiguration? = nil,
          @video_attribute : Types::VideoAttribute? = nil
        )
        end
      end

      # Defines the configuration settings for the horizontal layout.
      struct HorizontalLayoutConfiguration
        include JSON::Serializable

        # Specifies the aspect ratio of all video tiles.
        @[JSON::Field(key: "TileAspectRatio")]
        getter tile_aspect_ratio : String?

        # The maximum number of video tiles to display.
        @[JSON::Field(key: "TileCount")]
        getter tile_count : Int32?

        # Sets the automatic ordering of the video tiles.
        @[JSON::Field(key: "TileOrder")]
        getter tile_order : String?

        # Sets the position of horizontal tiles.
        @[JSON::Field(key: "TilePosition")]
        getter tile_position : String?

        def initialize(
          @tile_aspect_ratio : String? = nil,
          @tile_count : Int32? = nil,
          @tile_order : String? = nil,
          @tile_position : String? = nil
        )
        end
      end

      # A structure that contains the configuration settings for an issue detection task.
      struct IssueDetectionConfiguration
        include JSON::Serializable

        # The name of the issue detection rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        def initialize(
          @rule_name : String
        )
        end
      end

      # A structure that contains the settings for a keyword match task.
      struct KeywordMatchConfiguration
        include JSON::Serializable

        # The keywords or phrases that you want to match.
        @[JSON::Field(key: "Keywords")]
        getter keywords : Array(String)

        # The name of the keyword match rule.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # Matches keywords or phrases on their presence or absence. If set to TRUE , the rule matches when all
        # the specified keywords or phrases are absent. Default: FALSE .
        @[JSON::Field(key: "Negate")]
        getter negate : Bool?

        def initialize(
          @keywords : Array(String),
          @rule_name : String,
          @negate : Bool? = nil
        )
        end
      end

      # A structure that contains the configuration settings for a Kinesis Data Stream sink.
      struct KinesisDataStreamSinkConfiguration
        include JSON::Serializable

        # The ARN of the sink.
        @[JSON::Field(key: "InsightsTarget")]
        getter insights_target : String?

        def initialize(
          @insights_target : String? = nil
        )
        end
      end

      # The configuration of an Kinesis video stream. If a meeting uses an opt-in Region as its MediaRegion
      # , the KVS stream must be in that same Region. For example, if a meeting uses the af-south-1 Region,
      # the KVS stream must also be in af-south-1 . However, if the meeting uses a Region that AWS turns on
      # by default, the KVS stream can be in any available Region, including an opt-in Region. For example,
      # if the meeting uses ca-central-1 , the KVS stream can be in eu-west-2 , us-east-1 , af-south-1 , or
      # any other Region that the Amazon Chime SDK supports. To learn which AWS Region a meeting uses, call
      # the GetMeeting API and use the MediaRegion parameter from the response. For more information about
      # opt-in Regions, refer to Available Regions in the Amazon Chime SDK Developer Guide , and Specify
      # which AWS Regions your account can use , in the AWS Account Management Reference Guide .
      struct KinesisVideoStreamConfiguration
        include JSON::Serializable

        # The Amazon Web Services Region of the video stream.
        @[JSON::Field(key: "Region")]
        getter region : String

        # The amount of time that data is retained.
        @[JSON::Field(key: "DataRetentionInHours")]
        getter data_retention_in_hours : Int32?

        def initialize(
          @region : String,
          @data_retention_in_hours : Int32? = nil
        )
        end
      end

      # The updated Kinesis video stream configuration object.
      struct KinesisVideoStreamConfigurationUpdate
        include JSON::Serializable

        # The updated time that data is retained.
        @[JSON::Field(key: "DataRetentionInHours")]
        getter data_retention_in_hours : Int32?

        def initialize(
          @data_retention_in_hours : Int32? = nil
        )
        end
      end

      # The video stream pool configuration object.
      struct KinesisVideoStreamPoolConfiguration
        include JSON::Serializable

        # The time at which the configuration was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ARN of the video stream pool configuration.
        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String?

        # The ID of the video stream pool in the configuration.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # The name of the video stream pool configuration.
        @[JSON::Field(key: "PoolName")]
        getter pool_name : String?

        # The size of the video stream pool in the configuration.
        @[JSON::Field(key: "PoolSize")]
        getter pool_size : Int32?

        # The status of the video stream pool in the configuration.
        @[JSON::Field(key: "PoolStatus")]
        getter pool_status : String?

        # The Kinesis video stream pool configuration object.
        @[JSON::Field(key: "StreamConfiguration")]
        getter stream_configuration : Types::KinesisVideoStreamConfiguration?

        # The time at which the configuration was updated.
        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @pool_arn : String? = nil,
          @pool_id : String? = nil,
          @pool_name : String? = nil,
          @pool_size : Int32? = nil,
          @pool_status : String? = nil,
          @stream_configuration : Types::KinesisVideoStreamConfiguration? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # A summary of the Kinesis video stream pool.
      struct KinesisVideoStreamPoolSummary
        include JSON::Serializable

        # The ARN of the video stream pool.
        @[JSON::Field(key: "PoolArn")]
        getter pool_arn : String?

        # The ID of the video stream pool.
        @[JSON::Field(key: "PoolId")]
        getter pool_id : String?

        # The name of the video stream pool.
        @[JSON::Field(key: "PoolName")]
        getter pool_name : String?

        def initialize(
          @pool_arn : String? = nil,
          @pool_id : String? = nil,
          @pool_name : String? = nil
        )
        end
      end

      # A structure that contains the runtime settings for recording a Kinesis video stream.
      struct KinesisVideoStreamRecordingSourceRuntimeConfiguration
        include JSON::Serializable

        # Describes the timestamp range and timestamp origin of a range of fragments in the Kinesis video
        # stream.
        @[JSON::Field(key: "FragmentSelector")]
        getter fragment_selector : Types::FragmentSelector

        # The stream or streams to be recorded.
        @[JSON::Field(key: "Streams")]
        getter streams : Array(Types::RecordingStreamConfiguration)

        def initialize(
          @fragment_selector : Types::FragmentSelector,
          @streams : Array(Types::RecordingStreamConfiguration)
        )
        end
      end

      # The runtime configuration settings for the Kinesis video stream source.
      struct KinesisVideoStreamSourceRuntimeConfiguration
        include JSON::Serializable

        # Specifies the encoding of your input audio. Supported format: PCM (only signed 16-bit little-endian
        # audio formats, which does not include WAV) For more information, see Media formats in the Amazon
        # Transcribe Developer Guide .
        @[JSON::Field(key: "MediaEncoding")]
        getter media_encoding : String

        # The sample rate of the input audio (in hertz). Low-quality audio, such as telephone audio, is
        # typically around 8,000 Hz. High-quality audio typically ranges from 16,000 Hz to 48,000 Hz. Note
        # that the sample rate you specify must match that of your audio. Valid Range: Minimum value of 8000.
        # Maximum value of 48000.
        @[JSON::Field(key: "MediaSampleRate")]
        getter media_sample_rate : Int32

        # The streams in the source runtime configuration of a Kinesis video stream.
        @[JSON::Field(key: "Streams")]
        getter streams : Array(Types::StreamConfiguration)

        def initialize(
          @media_encoding : String,
          @media_sample_rate : Int32,
          @streams : Array(Types::StreamConfiguration)
        )
        end
      end

      # The task configuration settings for the Kinesis video stream source.
      struct KinesisVideoStreamSourceTaskConfiguration
        include JSON::Serializable

        # The channel ID.
        @[JSON::Field(key: "ChannelId")]
        getter channel_id : Int32

        # The ARN of the stream.
        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String

        # The unique identifier of the fragment to begin processing.
        @[JSON::Field(key: "FragmentNumber")]
        getter fragment_number : String?

        def initialize(
          @channel_id : Int32,
          @stream_arn : String,
          @fragment_number : String? = nil
        )
        end
      end

      # A structure that contains the configuration settings for an AWS Lambda function's data sink.
      struct LambdaFunctionSinkConfiguration
        include JSON::Serializable

        # The ARN of the sink.
        @[JSON::Field(key: "InsightsTarget")]
        getter insights_target : String?

        def initialize(
          @insights_target : String? = nil
        )
        end
      end

      struct ListMediaCapturePipelinesRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call. Valid Range: 1 - 99.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to retrieve the next page of results.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMediaCapturePipelinesResponse
        include JSON::Serializable

        # The media pipeline objects in the list.
        @[JSON::Field(key: "MediaCapturePipelines")]
        getter media_capture_pipelines : Array(Types::MediaCapturePipelineSummary)?

        # The token used to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @media_capture_pipelines : Array(Types::MediaCapturePipelineSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMediaInsightsPipelineConfigurationsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to return the next page of results.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMediaInsightsPipelineConfigurationsResponse
        include JSON::Serializable

        # The requested list of media insights pipeline configurations.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurations")]
        getter media_insights_pipeline_configurations : Array(Types::MediaInsightsPipelineConfigurationSummary)?

        # The token used to return the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @media_insights_pipeline_configurations : Array(Types::MediaInsightsPipelineConfigurationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMediaPipelineKinesisVideoStreamPoolsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to return the next page of results.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMediaPipelineKinesisVideoStreamPoolsResponse
        include JSON::Serializable

        # The list of video stream pools.
        @[JSON::Field(key: "KinesisVideoStreamPools")]
        getter kinesis_video_stream_pools : Array(Types::KinesisVideoStreamPoolSummary)?

        # The token used to return the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @kinesis_video_stream_pools : Array(Types::KinesisVideoStreamPoolSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMediaPipelinesRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call. Valid Range: 1 - 99.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to retrieve the next page of results.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMediaPipelinesResponse
        include JSON::Serializable

        # The media pipeline objects in the list.
        @[JSON::Field(key: "MediaPipelines")]
        getter media_pipelines : Array(Types::MediaPipelineSummary)?

        # The token used to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @media_pipelines : Array(Types::MediaPipelineSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the media pipeline associated with any tags. The ARN consists of the pipeline's region,
        # resource ID, and pipeline ID.
        @[JSON::Field(key: "arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with the specified media pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The media pipeline's RTMP configuration object.
      struct LiveConnectorRTMPConfiguration
        include JSON::Serializable

        # The URL of the RTMP configuration.
        @[JSON::Field(key: "Url")]
        getter url : String

        # The audio channels set for the RTMP configuration
        @[JSON::Field(key: "AudioChannels")]
        getter audio_channels : String?

        # The audio sample rate set for the RTMP configuration. Default: 48000.
        @[JSON::Field(key: "AudioSampleRate")]
        getter audio_sample_rate : String?

        def initialize(
          @url : String,
          @audio_channels : String? = nil,
          @audio_sample_rate : String? = nil
        )
        end
      end

      # The media pipeline's sink configuration settings.
      struct LiveConnectorSinkConfiguration
        include JSON::Serializable

        # The sink configuration's RTMP configuration settings.
        @[JSON::Field(key: "RTMPConfiguration")]
        getter rtmp_configuration : Types::LiveConnectorRTMPConfiguration

        # The sink configuration's sink type.
        @[JSON::Field(key: "SinkType")]
        getter sink_type : String

        def initialize(
          @rtmp_configuration : Types::LiveConnectorRTMPConfiguration,
          @sink_type : String
        )
        end
      end

      # The data source configuration object of a streaming media pipeline.
      struct LiveConnectorSourceConfiguration
        include JSON::Serializable

        # The configuration settings of the connector pipeline.
        @[JSON::Field(key: "ChimeSdkMeetingLiveConnectorConfiguration")]
        getter chime_sdk_meeting_live_connector_configuration : Types::ChimeSdkMeetingLiveConnectorConfiguration

        # The source configuration's media source type.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String

        def initialize(
          @chime_sdk_meeting_live_connector_configuration : Types::ChimeSdkMeetingLiveConnectorConfiguration,
          @source_type : String
        )
        end
      end

      # A media pipeline object consisting of an ID, source type, source ARN, a sink type, a sink ARN, and a
      # configuration object.
      struct MediaCapturePipeline
        include JSON::Serializable

        # The configuration for a specified media pipeline. SourceType must be ChimeSdkMeeting .
        @[JSON::Field(key: "ChimeSdkMeetingConfiguration")]
        getter chime_sdk_meeting_configuration : Types::ChimeSdkMeetingConfiguration?

        # The time at which the pipeline was created, in ISO 8601 format.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ARN of the media capture pipeline
        @[JSON::Field(key: "MediaPipelineArn")]
        getter media_pipeline_arn : String?

        # The ID of a media pipeline.
        @[JSON::Field(key: "MediaPipelineId")]
        getter media_pipeline_id : String?

        # ARN of the destination to which the media artifacts are saved.
        @[JSON::Field(key: "SinkArn")]
        getter sink_arn : String?

        # The Amazon Resource Name (ARN) of the sink role to be used with AwsKmsKeyId in
        # SseAwsKeyManagementParams .
        @[JSON::Field(key: "SinkIamRoleArn")]
        getter sink_iam_role_arn : String?

        # Destination type to which the media artifacts are saved. You must use an S3 Bucket.
        @[JSON::Field(key: "SinkType")]
        getter sink_type : String?

        # ARN of the source from which the media artifacts are saved.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # Source type from which media artifacts are saved. You must use ChimeMeeting .
        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        # An object that contains server side encryption parameters to be used by media capture pipeline. The
        # parameters can also be used by media concatenation pipeline taking media capture pipeline as a media
        # source.
        @[JSON::Field(key: "SseAwsKeyManagementParams")]
        getter sse_aws_key_management_params : Types::SseAwsKeyManagementParams?

        # The status of the media pipeline.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time at which the pipeline was updated, in ISO 8601 format.
        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @chime_sdk_meeting_configuration : Types::ChimeSdkMeetingConfiguration? = nil,
          @created_timestamp : Time? = nil,
          @media_pipeline_arn : String? = nil,
          @media_pipeline_id : String? = nil,
          @sink_arn : String? = nil,
          @sink_iam_role_arn : String? = nil,
          @sink_type : String? = nil,
          @source_arn : String? = nil,
          @source_type : String? = nil,
          @sse_aws_key_management_params : Types::SseAwsKeyManagementParams? = nil,
          @status : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The source configuration object of a media capture pipeline.
      struct MediaCapturePipelineSourceConfiguration
        include JSON::Serializable

        # The meeting configuration settings in a media capture pipeline configuration object.
        @[JSON::Field(key: "ChimeSdkMeetingConfiguration")]
        getter chime_sdk_meeting_configuration : Types::ChimeSdkMeetingConcatenationConfiguration

        # The media pipeline ARN in the configuration object of a media capture pipeline.
        @[JSON::Field(key: "MediaPipelineArn")]
        getter media_pipeline_arn : String

        def initialize(
          @chime_sdk_meeting_configuration : Types::ChimeSdkMeetingConcatenationConfiguration,
          @media_pipeline_arn : String
        )
        end
      end

      # The summary data of a media capture pipeline.
      struct MediaCapturePipelineSummary
        include JSON::Serializable

        # The ARN of the media pipeline in the summary.
        @[JSON::Field(key: "MediaPipelineArn")]
        getter media_pipeline_arn : String?

        # The ID of the media pipeline in the summary.
        @[JSON::Field(key: "MediaPipelineId")]
        getter media_pipeline_id : String?

        def initialize(
          @media_pipeline_arn : String? = nil,
          @media_pipeline_id : String? = nil
        )
        end
      end

      # Concatenates audio and video data from one or more data streams.
      struct MediaConcatenationPipeline
        include JSON::Serializable

        # The time at which the concatenation pipeline was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ARN of the media pipeline that you specify in the SourceConfiguration object.
        @[JSON::Field(key: "MediaPipelineArn")]
        getter media_pipeline_arn : String?

        # The ID of the media pipeline being concatenated.
        @[JSON::Field(key: "MediaPipelineId")]
        getter media_pipeline_id : String?

        # The data sinks of the concatenation pipeline.
        @[JSON::Field(key: "Sinks")]
        getter sinks : Array(Types::ConcatenationSink)?

        # The data sources being concatenated.
        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::ConcatenationSource)?

        # The status of the concatenation pipeline.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time at which the concatenation pipeline was last updated.
        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @media_pipeline_arn : String? = nil,
          @media_pipeline_id : String? = nil,
          @sinks : Array(Types::ConcatenationSink)? = nil,
          @sources : Array(Types::ConcatenationSource)? = nil,
          @status : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # A media pipeline that streams call analytics data.
      struct MediaInsightsPipeline
        include JSON::Serializable

        # The time at which the media insights pipeline was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The statuses that the elements in a media insights pipeline can have during data processing.
        @[JSON::Field(key: "ElementStatuses")]
        getter element_statuses : Array(Types::MediaInsightsPipelineElementStatus)?

        # The runtime configuration settings for a Kinesis recording video stream in a media insights
        # pipeline.
        @[JSON::Field(key: "KinesisVideoStreamRecordingSourceRuntimeConfiguration")]
        getter kinesis_video_stream_recording_source_runtime_configuration : Types::KinesisVideoStreamRecordingSourceRuntimeConfiguration?

        # The configuration settings for a Kinesis runtime video stream in a media insights pipeline.
        @[JSON::Field(key: "KinesisVideoStreamSourceRuntimeConfiguration")]
        getter kinesis_video_stream_source_runtime_configuration : Types::KinesisVideoStreamSourceRuntimeConfiguration?

        # The ARN of a media insight pipeline's configuration settings.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurationArn")]
        getter media_insights_pipeline_configuration_arn : String?

        # The runtime metadata of a media insights pipeline.
        @[JSON::Field(key: "MediaInsightsRuntimeMetadata")]
        getter media_insights_runtime_metadata : Hash(String, String)?

        # The ARN of a media insights pipeline.
        @[JSON::Field(key: "MediaPipelineArn")]
        getter media_pipeline_arn : String?

        # The ID of a media insights pipeline.
        @[JSON::Field(key: "MediaPipelineId")]
        getter media_pipeline_id : String?

        # The runtime configuration of the Amazon S3 bucket that stores recordings in a media insights
        # pipeline.
        @[JSON::Field(key: "S3RecordingSinkRuntimeConfiguration")]
        getter s3_recording_sink_runtime_configuration : Types::S3RecordingSinkRuntimeConfiguration?

        # The status of a media insights pipeline.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @element_statuses : Array(Types::MediaInsightsPipelineElementStatus)? = nil,
          @kinesis_video_stream_recording_source_runtime_configuration : Types::KinesisVideoStreamRecordingSourceRuntimeConfiguration? = nil,
          @kinesis_video_stream_source_runtime_configuration : Types::KinesisVideoStreamSourceRuntimeConfiguration? = nil,
          @media_insights_pipeline_configuration_arn : String? = nil,
          @media_insights_runtime_metadata : Hash(String, String)? = nil,
          @media_pipeline_arn : String? = nil,
          @media_pipeline_id : String? = nil,
          @s3_recording_sink_runtime_configuration : Types::S3RecordingSinkRuntimeConfiguration? = nil,
          @status : String? = nil
        )
        end
      end

      # A structure that contains the configuration settings for a media insights pipeline.
      struct MediaInsightsPipelineConfiguration
        include JSON::Serializable

        # The time at which the configuration was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The elements in the configuration.
        @[JSON::Field(key: "Elements")]
        getter elements : Array(Types::MediaInsightsPipelineConfigurationElement)?

        # The ARN of the configuration.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurationArn")]
        getter media_insights_pipeline_configuration_arn : String?

        # The ID of the configuration.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurationId")]
        getter media_insights_pipeline_configuration_id : String?

        # The name of the configuration.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurationName")]
        getter media_insights_pipeline_configuration_name : String?

        # Lists the rules that trigger a real-time alert.
        @[JSON::Field(key: "RealTimeAlertConfiguration")]
        getter real_time_alert_configuration : Types::RealTimeAlertConfiguration?

        # The ARN of the role used by the service to access Amazon Web Services resources.
        @[JSON::Field(key: "ResourceAccessRoleArn")]
        getter resource_access_role_arn : String?

        # The time at which the configuration was last updated.
        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @elements : Array(Types::MediaInsightsPipelineConfigurationElement)? = nil,
          @media_insights_pipeline_configuration_arn : String? = nil,
          @media_insights_pipeline_configuration_id : String? = nil,
          @media_insights_pipeline_configuration_name : String? = nil,
          @real_time_alert_configuration : Types::RealTimeAlertConfiguration? = nil,
          @resource_access_role_arn : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # An element in a media insights pipeline configuration.
      struct MediaInsightsPipelineConfigurationElement
        include JSON::Serializable

        # The element type.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The analytics configuration settings for transcribing audio in a media insights pipeline
        # configuration element.
        @[JSON::Field(key: "AmazonTranscribeCallAnalyticsProcessorConfiguration")]
        getter amazon_transcribe_call_analytics_processor_configuration : Types::AmazonTranscribeCallAnalyticsProcessorConfiguration?

        # The transcription processor configuration settings in a media insights pipeline configuration
        # element.
        @[JSON::Field(key: "AmazonTranscribeProcessorConfiguration")]
        getter amazon_transcribe_processor_configuration : Types::AmazonTranscribeProcessorConfiguration?

        # The configuration settings for the Kinesis Data Stream Sink in a media insights pipeline
        # configuration element.
        @[JSON::Field(key: "KinesisDataStreamSinkConfiguration")]
        getter kinesis_data_stream_sink_configuration : Types::KinesisDataStreamSinkConfiguration?

        # The configuration settings for the Amazon Web Services Lambda sink in a media insights pipeline
        # configuration element.
        @[JSON::Field(key: "LambdaFunctionSinkConfiguration")]
        getter lambda_function_sink_configuration : Types::LambdaFunctionSinkConfiguration?

        # The configuration settings for the Amazon S3 recording bucket in a media insights pipeline
        # configuration element.
        @[JSON::Field(key: "S3RecordingSinkConfiguration")]
        getter s3_recording_sink_configuration : Types::S3RecordingSinkConfiguration?

        # The configuration settings for an SNS topic sink in a media insights pipeline configuration element.
        @[JSON::Field(key: "SnsTopicSinkConfiguration")]
        getter sns_topic_sink_configuration : Types::SnsTopicSinkConfiguration?

        # The configuration settings for an SQS queue sink in a media insights pipeline configuration element.
        @[JSON::Field(key: "SqsQueueSinkConfiguration")]
        getter sqs_queue_sink_configuration : Types::SqsQueueSinkConfiguration?

        # The voice analytics configuration settings in a media insights pipeline configuration element.
        @[JSON::Field(key: "VoiceAnalyticsProcessorConfiguration")]
        getter voice_analytics_processor_configuration : Types::VoiceAnalyticsProcessorConfiguration?

        # The configuration settings for voice enhancement sink in a media insights pipeline configuration
        # element.
        @[JSON::Field(key: "VoiceEnhancementSinkConfiguration")]
        getter voice_enhancement_sink_configuration : Types::VoiceEnhancementSinkConfiguration?

        def initialize(
          @type : String,
          @amazon_transcribe_call_analytics_processor_configuration : Types::AmazonTranscribeCallAnalyticsProcessorConfiguration? = nil,
          @amazon_transcribe_processor_configuration : Types::AmazonTranscribeProcessorConfiguration? = nil,
          @kinesis_data_stream_sink_configuration : Types::KinesisDataStreamSinkConfiguration? = nil,
          @lambda_function_sink_configuration : Types::LambdaFunctionSinkConfiguration? = nil,
          @s3_recording_sink_configuration : Types::S3RecordingSinkConfiguration? = nil,
          @sns_topic_sink_configuration : Types::SnsTopicSinkConfiguration? = nil,
          @sqs_queue_sink_configuration : Types::SqsQueueSinkConfiguration? = nil,
          @voice_analytics_processor_configuration : Types::VoiceAnalyticsProcessorConfiguration? = nil,
          @voice_enhancement_sink_configuration : Types::VoiceEnhancementSinkConfiguration? = nil
        )
        end
      end

      # A summary of the media insights pipeline configuration.
      struct MediaInsightsPipelineConfigurationSummary
        include JSON::Serializable

        # The ARN of the media insights pipeline configuration.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurationArn")]
        getter media_insights_pipeline_configuration_arn : String?

        # The ID of the media insights pipeline configuration.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurationId")]
        getter media_insights_pipeline_configuration_id : String?

        # The name of the media insights pipeline configuration.
        @[JSON::Field(key: "MediaInsightsPipelineConfigurationName")]
        getter media_insights_pipeline_configuration_name : String?

        def initialize(
          @media_insights_pipeline_configuration_arn : String? = nil,
          @media_insights_pipeline_configuration_id : String? = nil,
          @media_insights_pipeline_configuration_name : String? = nil
        )
        end
      end

      # The status of the pipeline element.
      struct MediaInsightsPipelineElementStatus
        include JSON::Serializable

        # The element's status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of status.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The connector pipeline.
      struct MediaLiveConnectorPipeline
        include JSON::Serializable

        # The time at which the connector pipeline was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The connector pipeline's ARN.
        @[JSON::Field(key: "MediaPipelineArn")]
        getter media_pipeline_arn : String?

        # The connector pipeline's ID.
        @[JSON::Field(key: "MediaPipelineId")]
        getter media_pipeline_id : String?

        # The connector pipeline's data sinks.
        @[JSON::Field(key: "Sinks")]
        getter sinks : Array(Types::LiveConnectorSinkConfiguration)?

        # The connector pipeline's data sources.
        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::LiveConnectorSourceConfiguration)?

        # The connector pipeline's status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time at which the connector pipeline was last updated.
        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @media_pipeline_arn : String? = nil,
          @media_pipeline_id : String? = nil,
          @sinks : Array(Types::LiveConnectorSinkConfiguration)? = nil,
          @sources : Array(Types::LiveConnectorSourceConfiguration)? = nil,
          @status : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # A pipeline consisting of a media capture, media concatenation, or live-streaming pipeline.
      struct MediaPipeline
        include JSON::Serializable

        # A pipeline that enables users to capture audio and video.
        @[JSON::Field(key: "MediaCapturePipeline")]
        getter media_capture_pipeline : Types::MediaCapturePipeline?

        # The media concatenation pipeline in a media pipeline.
        @[JSON::Field(key: "MediaConcatenationPipeline")]
        getter media_concatenation_pipeline : Types::MediaConcatenationPipeline?

        # The media insights pipeline of a media pipeline.
        @[JSON::Field(key: "MediaInsightsPipeline")]
        getter media_insights_pipeline : Types::MediaInsightsPipeline?

        # The connector pipeline of the media pipeline.
        @[JSON::Field(key: "MediaLiveConnectorPipeline")]
        getter media_live_connector_pipeline : Types::MediaLiveConnectorPipeline?

        # Designates a media pipeline as a media stream pipeline.
        @[JSON::Field(key: "MediaStreamPipeline")]
        getter media_stream_pipeline : Types::MediaStreamPipeline?

        def initialize(
          @media_capture_pipeline : Types::MediaCapturePipeline? = nil,
          @media_concatenation_pipeline : Types::MediaConcatenationPipeline? = nil,
          @media_insights_pipeline : Types::MediaInsightsPipeline? = nil,
          @media_live_connector_pipeline : Types::MediaLiveConnectorPipeline? = nil,
          @media_stream_pipeline : Types::MediaStreamPipeline? = nil
        )
        end
      end

      # The summary of the media pipeline.
      struct MediaPipelineSummary
        include JSON::Serializable

        # The ARN of the media pipeline in the summary.
        @[JSON::Field(key: "MediaPipelineArn")]
        getter media_pipeline_arn : String?

        # The ID of the media pipeline in the summary.
        @[JSON::Field(key: "MediaPipelineId")]
        getter media_pipeline_id : String?

        def initialize(
          @media_pipeline_arn : String? = nil,
          @media_pipeline_id : String? = nil
        )
        end
      end

      # Structure that contains the settings for a media stream pipeline.
      struct MediaStreamPipeline
        include JSON::Serializable

        # The time at which the media stream pipeline was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ARN of the media stream pipeline.
        @[JSON::Field(key: "MediaPipelineArn")]
        getter media_pipeline_arn : String?

        # The ID of the media stream pipeline
        @[JSON::Field(key: "MediaPipelineId")]
        getter media_pipeline_id : String?

        # The media stream pipeline's data sinks.
        @[JSON::Field(key: "Sinks")]
        getter sinks : Array(Types::MediaStreamSink)?

        # The media stream pipeline's data sources.
        @[JSON::Field(key: "Sources")]
        getter sources : Array(Types::MediaStreamSource)?

        # The status of the media stream pipeline.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time at which the media stream pipeline was updated.
        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @media_pipeline_arn : String? = nil,
          @media_pipeline_id : String? = nil,
          @sinks : Array(Types::MediaStreamSink)? = nil,
          @sources : Array(Types::MediaStreamSource)? = nil,
          @status : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # Structure that contains the settings for a media stream sink.
      struct MediaStreamSink
        include JSON::Serializable

        # The media stream sink's media stream type.
        @[JSON::Field(key: "MediaStreamType")]
        getter media_stream_type : String

        # Specifies the number of streams that the sink can accept.
        @[JSON::Field(key: "ReservedStreamCapacity")]
        getter reserved_stream_capacity : Int32

        # The ARN of the Kinesis Video Stream pool returned by the CreateMediaPipelineKinesisVideoStreamPool
        # API.
        @[JSON::Field(key: "SinkArn")]
        getter sink_arn : String

        # The media stream sink's type.
        @[JSON::Field(key: "SinkType")]
        getter sink_type : String

        def initialize(
          @media_stream_type : String,
          @reserved_stream_capacity : Int32,
          @sink_arn : String,
          @sink_type : String
        )
        end
      end

      # Structure that contains the settings for media stream sources.
      struct MediaStreamSource
        include JSON::Serializable

        # The ARN of the meeting.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String

        # The type of media stream source.
        @[JSON::Field(key: "SourceType")]
        getter source_type : String

        def initialize(
          @source_arn : String,
          @source_type : String
        )
        end
      end

      # The configuration object for an event concatenation pipeline.
      struct MeetingEventsConcatenationConfiguration
        include JSON::Serializable

        # Enables or disables the configuration object.
        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # One or more of the resources in the request does not exist in the system.
      struct NotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request ID associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Allows you to specify additional settings for your Call Analytics post-call request, including
      # output locations for your redacted transcript, which IAM role to use, and which encryption key to
      # use. DataAccessRoleArn and OutputLocation are required fields. PostCallAnalyticsSettings provides
      # the same insights as a Call Analytics post-call transcription. For more information, refer to
      # Post-call analytics with real-time transcriptions in the Amazon Transcribe Developer Guide .
      struct PostCallAnalyticsSettings
        include JSON::Serializable

        # The ARN of the role used by Amazon Web Services Transcribe to upload your post call analysis. For
        # more information, see Post-call analytics with real-time transcriptions in the Amazon Transcribe
        # Developer Guide .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The URL of the Amazon S3 bucket that contains the post-call data.
        @[JSON::Field(key: "OutputLocation")]
        getter output_location : String

        # The content redaction output settings for a post-call analysis task.
        @[JSON::Field(key: "ContentRedactionOutput")]
        getter content_redaction_output : String?

        # The ID of the KMS (Key Management Service) key used to encrypt the output.
        @[JSON::Field(key: "OutputEncryptionKMSKeyId")]
        getter output_encryption_kms_key_id : String?

        def initialize(
          @data_access_role_arn : String,
          @output_location : String,
          @content_redaction_output : String? = nil,
          @output_encryption_kms_key_id : String? = nil
        )
        end
      end

      # Defines the configuration for a presenter-only video tile.
      struct PresenterOnlyConfiguration
        include JSON::Serializable

        # Defines the position of the presenter video tile. Default: TopRight .
        @[JSON::Field(key: "PresenterPosition")]
        getter presenter_position : String?

        def initialize(
          @presenter_position : String? = nil
        )
        end
      end

      # A structure that contains the configuration settings for real-time alerts.
      struct RealTimeAlertConfiguration
        include JSON::Serializable

        # Turns off real-time alerts.
        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # The rules in the alert. Rules specify the words or phrases that you want to be notified about.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::RealTimeAlertRule)?

        def initialize(
          @disabled : Bool? = nil,
          @rules : Array(Types::RealTimeAlertRule)? = nil
        )
        end
      end

      # Specifies the words or phrases that trigger an alert.
      struct RealTimeAlertRule
        include JSON::Serializable

        # The type of alert rule.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Specifies the issue detection settings for a real-time alert rule.
        @[JSON::Field(key: "IssueDetectionConfiguration")]
        getter issue_detection_configuration : Types::IssueDetectionConfiguration?

        # Specifies the settings for matching the keywords in a real-time alert rule.
        @[JSON::Field(key: "KeywordMatchConfiguration")]
        getter keyword_match_configuration : Types::KeywordMatchConfiguration?

        # Specifies the settings for predicting sentiment in a real-time alert rule.
        @[JSON::Field(key: "SentimentConfiguration")]
        getter sentiment_configuration : Types::SentimentConfiguration?

        def initialize(
          @type : String,
          @issue_detection_configuration : Types::IssueDetectionConfiguration? = nil,
          @keyword_match_configuration : Types::KeywordMatchConfiguration? = nil,
          @sentiment_configuration : Types::SentimentConfiguration? = nil
        )
        end
      end

      # A structure that holds the settings for recording media.
      struct RecordingStreamConfiguration
        include JSON::Serializable

        # The ARN of the recording stream.
        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String?

        def initialize(
          @stream_arn : String? = nil
        )
        end
      end

      # The request exceeds the resource limit.
      struct ResourceLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request ID associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The configuration settings for the S3 bucket.
      struct S3BucketSinkConfiguration
        include JSON::Serializable

        # The destination URL of the S3 bucket.
        @[JSON::Field(key: "Destination")]
        getter destination : String

        def initialize(
          @destination : String
        )
        end
      end

      # The structure that holds the settings for transmitting media to the Amazon S3 bucket. These values
      # are used as defaults if S3RecordingSinkRuntimeConfiguration is not specified.
      struct S3RecordingSinkConfiguration
        include JSON::Serializable

        # The default URI of the Amazon S3 bucket used as the recording sink.
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # The default file format for the media files sent to the Amazon S3 bucket.
        @[JSON::Field(key: "RecordingFileFormat")]
        getter recording_file_format : String?

        def initialize(
          @destination : String? = nil,
          @recording_file_format : String? = nil
        )
        end
      end

      # A structure that holds the settings for transmitting media files to the Amazon S3 bucket. If
      # specified, the settings in this structure override any settings in S3RecordingSinkConfiguration .
      struct S3RecordingSinkRuntimeConfiguration
        include JSON::Serializable

        # The URI of the S3 bucket used as the sink.
        @[JSON::Field(key: "Destination")]
        getter destination : String

        # The file format for the media files sent to the Amazon S3 bucket.
        @[JSON::Field(key: "RecordingFileFormat")]
        getter recording_file_format : String

        def initialize(
          @destination : String,
          @recording_file_format : String
        )
        end
      end

      # The video streams for a specified media pipeline. The total number of video streams can't exceed 25.
      struct SelectedVideoStreams
        include JSON::Serializable

        # The attendee IDs of the streams selected for a media pipeline.
        @[JSON::Field(key: "AttendeeIds")]
        getter attendee_ids : Array(String)?

        # The external user IDs of the streams selected for a media pipeline.
        @[JSON::Field(key: "ExternalUserIds")]
        getter external_user_ids : Array(String)?

        def initialize(
          @attendee_ids : Array(String)? = nil,
          @external_user_ids : Array(String)? = nil
        )
        end
      end

      # A structure that contains the configuration settings for a sentiment analysis task.
      struct SentimentConfiguration
        include JSON::Serializable

        # The name of the rule in the sentiment configuration.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The type of sentiment, POSITIVE , NEGATIVE , or NEUTRAL .
        @[JSON::Field(key: "SentimentType")]
        getter sentiment_type : String

        # Specifies the analysis interval.
        @[JSON::Field(key: "TimePeriod")]
        getter time_period : Int32

        def initialize(
          @rule_name : String,
          @sentiment_type : String,
          @time_period : Int32
        )
        end
      end

      # The service encountered an unexpected error.
      struct ServiceFailureException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request ID associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The service is currently unavailable.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request ID associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The configuration settings for the SNS topic sink.
      struct SnsTopicSinkConfiguration
        include JSON::Serializable

        # The ARN of the SNS sink.
        @[JSON::Field(key: "InsightsTarget")]
        getter insights_target : String?

        def initialize(
          @insights_target : String? = nil
        )
        end
      end

      # Source configuration for a specified media pipeline.
      struct SourceConfiguration
        include JSON::Serializable

        # The selected video streams for a specified media pipeline. The number of video streams can't exceed
        # 25.
        @[JSON::Field(key: "SelectedVideoStreams")]
        getter selected_video_streams : Types::SelectedVideoStreams?

        def initialize(
          @selected_video_streams : Types::SelectedVideoStreams? = nil
        )
        end
      end

      # A representation of an asynchronous request to perform speaker search analysis on a media insights
      # pipeline.
      struct SpeakerSearchTask
        include JSON::Serializable

        # The time at which a speaker search task was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The speaker search task ID.
        @[JSON::Field(key: "SpeakerSearchTaskId")]
        getter speaker_search_task_id : String?

        # The status of the speaker search task.
        @[JSON::Field(key: "SpeakerSearchTaskStatus")]
        getter speaker_search_task_status : String?

        # The time at which a speaker search task was updated.
        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @speaker_search_task_id : String? = nil,
          @speaker_search_task_status : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The configuration settings for the SQS sink.
      struct SqsQueueSinkConfiguration
        include JSON::Serializable

        # The ARN of the SQS sink.
        @[JSON::Field(key: "InsightsTarget")]
        getter insights_target : String?

        def initialize(
          @insights_target : String? = nil
        )
        end
      end

      # Contains server side encryption parameters to be used by media capture pipeline. The parameters can
      # also be used by media concatenation pipeline taking media capture pipeline as a media source.
      struct SseAwsKeyManagementParams
        include JSON::Serializable

        # The KMS key you want to use to encrypt your media pipeline output. Decryption is required for
        # concatenation pipeline. If using a key located in the current Amazon Web Services account, you can
        # specify your KMS key in one of four ways: Use the KMS key ID itself. For example,
        # 1234abcd-12ab-34cd-56ef-1234567890ab . Use an alias for the KMS key ID. For example,
        # alias/ExampleAlias . Use the Amazon Resource Name (ARN) for the KMS key ID. For example,
        # arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab . Use the ARN for the KMS key
        # alias. For example, arn:aws:kms:region:account-ID:alias/ExampleAlias . If using a key located in a
        # different Amazon Web Services account than the current Amazon Web Services account, you can specify
        # your KMS key in one of two ways: Use the ARN for the KMS key ID. For example,
        # arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab . Use the ARN for the KMS key
        # alias. For example, arn:aws:kms:region:account-ID:alias/ExampleAlias . If you don't specify an
        # encryption key, your output is encrypted with the default Amazon S3 key (SSE-S3). Note that the role
        # specified in the SinkIamRoleArn request parameter must have permission to use the specified KMS key.
        @[JSON::Field(key: "AwsKmsKeyId")]
        getter aws_kms_key_id : String

        # Base64-encoded string of a UTF-8 encoded JSON, which contains the encryption context as non-secret
        # key-value pair known as encryption context pairs, that provides an added layer of security for your
        # data. For more information, see KMS encryption context and Asymmetric keys in KMS in the Key
        # Management Service Developer Guide .
        @[JSON::Field(key: "AwsKmsEncryptionContext")]
        getter aws_kms_encryption_context : String?

        def initialize(
          @aws_kms_key_id : String,
          @aws_kms_encryption_context : String? = nil
        )
        end
      end

      struct StartSpeakerSearchTaskRequest
        include JSON::Serializable

        # The unique identifier of the resource to be updated. Valid values include the ID and ARN of the
        # media insights pipeline.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The ARN of the voice profile domain that will store the voice profile.
        @[JSON::Field(key: "VoiceProfileDomainArn")]
        getter voice_profile_domain_arn : String

        # The unique identifier for the client request. Use a different token for different speaker search
        # tasks.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The task configuration for the Kinesis video stream source of the media insights pipeline.
        @[JSON::Field(key: "KinesisVideoStreamSourceTaskConfiguration")]
        getter kinesis_video_stream_source_task_configuration : Types::KinesisVideoStreamSourceTaskConfiguration?

        def initialize(
          @identifier : String,
          @voice_profile_domain_arn : String,
          @client_request_token : String? = nil,
          @kinesis_video_stream_source_task_configuration : Types::KinesisVideoStreamSourceTaskConfiguration? = nil
        )
        end
      end

      struct StartSpeakerSearchTaskResponse
        include JSON::Serializable

        # The details of the speaker search task.
        @[JSON::Field(key: "SpeakerSearchTask")]
        getter speaker_search_task : Types::SpeakerSearchTask?

        def initialize(
          @speaker_search_task : Types::SpeakerSearchTask? = nil
        )
        end
      end

      struct StartVoiceToneAnalysisTaskRequest
        include JSON::Serializable

        # The unique identifier of the resource to be updated. Valid values include the ID and ARN of the
        # media insights pipeline.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The language code.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # The unique identifier for the client request. Use a different token for different voice tone
        # analysis tasks.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The task configuration for the Kinesis video stream source of the media insights pipeline.
        @[JSON::Field(key: "KinesisVideoStreamSourceTaskConfiguration")]
        getter kinesis_video_stream_source_task_configuration : Types::KinesisVideoStreamSourceTaskConfiguration?

        def initialize(
          @identifier : String,
          @language_code : String,
          @client_request_token : String? = nil,
          @kinesis_video_stream_source_task_configuration : Types::KinesisVideoStreamSourceTaskConfiguration? = nil
        )
        end
      end

      struct StartVoiceToneAnalysisTaskResponse
        include JSON::Serializable

        # The details of the voice tone analysis task.
        @[JSON::Field(key: "VoiceToneAnalysisTask")]
        getter voice_tone_analysis_task : Types::VoiceToneAnalysisTask?

        def initialize(
          @voice_tone_analysis_task : Types::VoiceToneAnalysisTask? = nil
        )
        end
      end

      struct StopSpeakerSearchTaskRequest
        include JSON::Serializable

        # The unique identifier of the resource to be updated. Valid values include the ID and ARN of the
        # media insights pipeline.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The speaker search task ID.
        @[JSON::Field(key: "speakerSearchTaskId")]
        getter speaker_search_task_id : String

        def initialize(
          @identifier : String,
          @speaker_search_task_id : String
        )
        end
      end

      struct StopVoiceToneAnalysisTaskRequest
        include JSON::Serializable

        # The unique identifier of the resource to be updated. Valid values include the ID and ARN of the
        # media insights pipeline.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The ID of the voice tone analysis task.
        @[JSON::Field(key: "voiceToneAnalysisTaskId")]
        getter voice_tone_analysis_task_id : String

        def initialize(
          @identifier : String,
          @voice_tone_analysis_task_id : String
        )
        end
      end

      # Defines a streaming channel.
      struct StreamChannelDefinition
        include JSON::Serializable

        # The number of channels in a streaming channel.
        @[JSON::Field(key: "NumberOfChannels")]
        getter number_of_channels : Int32

        # The definitions of the channels in a streaming channel.
        @[JSON::Field(key: "ChannelDefinitions")]
        getter channel_definitions : Array(Types::ChannelDefinition)?

        def initialize(
          @number_of_channels : Int32,
          @channel_definitions : Array(Types::ChannelDefinition)? = nil
        )
        end
      end

      # The configuration settings for a stream.
      struct StreamConfiguration
        include JSON::Serializable

        # The ARN of the stream.
        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String

        # The streaming channel definition in the stream configuration.
        @[JSON::Field(key: "StreamChannelDefinition")]
        getter stream_channel_definition : Types::StreamChannelDefinition

        # The unique identifier of the fragment to begin processing.
        @[JSON::Field(key: "FragmentNumber")]
        getter fragment_number : String?

        def initialize(
          @stream_arn : String,
          @stream_channel_definition : Types::StreamChannelDefinition,
          @fragment_number : String? = nil
        )
        end
      end

      # A key/value pair that grants users access to meeting resources.
      struct Tag
        include JSON::Serializable

        # The key half of a tag.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value half of a tag.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the media pipeline associated with any tags. The ARN consists of the pipeline's endpoint
        # region, resource ID, and pipeline ID.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tags associated with the specified media pipeline.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The client exceeded its request rate limit.
      struct ThrottledClientException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request ID associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The range of timestamps to return.
      struct TimestampRange
        include JSON::Serializable

        # The ending timestamp for the specified range.
        @[JSON::Field(key: "EndTimestamp")]
        getter end_timestamp : Time

        # The starting timestamp for the specified range.
        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time

        def initialize(
          @end_timestamp : Time,
          @start_timestamp : Time
        )
        end
      end

      # The configuration object for concatenating transcription messages.
      struct TranscriptionMessagesConcatenationConfiguration
        include JSON::Serializable

        # Enables or disables the configuration object.
        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # The client is not currently authorized to make the request.
      struct UnauthorizedClientException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request ID associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the pipeline that you want to untag.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The key/value pairs in the tag that you want to remove.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateMediaInsightsPipelineConfigurationRequest
        include JSON::Serializable

        # The elements in the request, such as a processor for Amazon Transcribe or a sink for a Kinesis Data
        # Stream..
        @[JSON::Field(key: "Elements")]
        getter elements : Array(Types::MediaInsightsPipelineConfigurationElement)

        # The unique identifier for the resource to be updated. Valid values include the name and ARN of the
        # media insights pipeline configuration.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The ARN of the role used by the service to access Amazon Web Services resources.
        @[JSON::Field(key: "ResourceAccessRoleArn")]
        getter resource_access_role_arn : String

        # The configuration settings for real-time alerts for the media insights pipeline.
        @[JSON::Field(key: "RealTimeAlertConfiguration")]
        getter real_time_alert_configuration : Types::RealTimeAlertConfiguration?

        def initialize(
          @elements : Array(Types::MediaInsightsPipelineConfigurationElement),
          @identifier : String,
          @resource_access_role_arn : String,
          @real_time_alert_configuration : Types::RealTimeAlertConfiguration? = nil
        )
        end
      end

      struct UpdateMediaInsightsPipelineConfigurationResponse
        include JSON::Serializable

        # The updated configuration settings.
        @[JSON::Field(key: "MediaInsightsPipelineConfiguration")]
        getter media_insights_pipeline_configuration : Types::MediaInsightsPipelineConfiguration?

        def initialize(
          @media_insights_pipeline_configuration : Types::MediaInsightsPipelineConfiguration? = nil
        )
        end
      end

      struct UpdateMediaInsightsPipelineStatusRequest
        include JSON::Serializable

        # The unique identifier of the resource to be updated. Valid values include the ID and ARN of the
        # media insights pipeline.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The requested status of the media insights pipeline.
        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : String

        def initialize(
          @identifier : String,
          @update_status : String
        )
        end
      end

      struct UpdateMediaPipelineKinesisVideoStreamPoolRequest
        include JSON::Serializable

        # The unique identifier of the requested resource. Valid values include the name and ARN of the media
        # pipeline Kinesis Video Stream pool.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The configuration settings for the video stream.
        @[JSON::Field(key: "StreamConfiguration")]
        getter stream_configuration : Types::KinesisVideoStreamConfigurationUpdate?

        def initialize(
          @identifier : String,
          @stream_configuration : Types::KinesisVideoStreamConfigurationUpdate? = nil
        )
        end
      end

      struct UpdateMediaPipelineKinesisVideoStreamPoolResponse
        include JSON::Serializable

        # The video stream pool configuration object.
        @[JSON::Field(key: "KinesisVideoStreamPoolConfiguration")]
        getter kinesis_video_stream_pool_configuration : Types::KinesisVideoStreamPoolConfiguration?

        def initialize(
          @kinesis_video_stream_pool_configuration : Types::KinesisVideoStreamPoolConfiguration? = nil
        )
        end
      end

      # Defines the configuration settings for a vertical layout.
      struct VerticalLayoutConfiguration
        include JSON::Serializable

        # Sets the aspect ratio of the video tiles, such as 16:9.
        @[JSON::Field(key: "TileAspectRatio")]
        getter tile_aspect_ratio : String?

        # The maximum number of tiles to display.
        @[JSON::Field(key: "TileCount")]
        getter tile_count : Int32?

        # Sets the automatic ordering of the video tiles.
        @[JSON::Field(key: "TileOrder")]
        getter tile_order : String?

        # Sets the position of vertical tiles.
        @[JSON::Field(key: "TilePosition")]
        getter tile_position : String?

        def initialize(
          @tile_aspect_ratio : String? = nil,
          @tile_count : Int32? = nil,
          @tile_order : String? = nil,
          @tile_position : String? = nil
        )
        end
      end

      # The video artifact configuration object.
      struct VideoArtifactsConfiguration
        include JSON::Serializable

        # Indicates whether the video artifact is enabled or disabled.
        @[JSON::Field(key: "State")]
        getter state : String

        # The MUX type of the video artifact configuration object.
        @[JSON::Field(key: "MuxType")]
        getter mux_type : String?

        def initialize(
          @state : String,
          @mux_type : String? = nil
        )
        end
      end

      # Defines the settings for a video tile.
      struct VideoAttribute
        include JSON::Serializable

        # Defines the border color of all video tiles.
        @[JSON::Field(key: "BorderColor")]
        getter border_color : String?

        # Defines the border thickness for all video tiles.
        @[JSON::Field(key: "BorderThickness")]
        getter border_thickness : Int32?

        # Sets the corner radius of all video tiles.
        @[JSON::Field(key: "CornerRadius")]
        getter corner_radius : Int32?

        # Defines the highlight color for the active video tile.
        @[JSON::Field(key: "HighlightColor")]
        getter highlight_color : String?

        def initialize(
          @border_color : String? = nil,
          @border_thickness : Int32? = nil,
          @corner_radius : Int32? = nil,
          @highlight_color : String? = nil
        )
        end
      end

      # The configuration object of a video concatenation pipeline.
      struct VideoConcatenationConfiguration
        include JSON::Serializable

        # Enables or disables the configuration object.
        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @state : String
        )
        end
      end

      # The configuration settings for a voice analytics processor.
      struct VoiceAnalyticsProcessorConfiguration
        include JSON::Serializable

        # The status of the speaker search task.
        @[JSON::Field(key: "SpeakerSearchStatus")]
        getter speaker_search_status : String?

        # The status of the voice tone analysis task.
        @[JSON::Field(key: "VoiceToneAnalysisStatus")]
        getter voice_tone_analysis_status : String?

        def initialize(
          @speaker_search_status : String? = nil,
          @voice_tone_analysis_status : String? = nil
        )
        end
      end

      # A static structure that contains the configuration data for a VoiceEnhancementSinkConfiguration
      # element.
      struct VoiceEnhancementSinkConfiguration
        include JSON::Serializable

        # Disables the VoiceEnhancementSinkConfiguration element.
        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        def initialize(
          @disabled : Bool? = nil
        )
        end
      end

      # A representation of an asynchronous request to perform voice tone analysis on a media insights
      # pipeline.
      struct VoiceToneAnalysisTask
        include JSON::Serializable

        # The time at which a voice tone analysis task was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The time at which a voice tone analysis task was updated.
        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The ID of the voice tone analysis task.
        @[JSON::Field(key: "VoiceToneAnalysisTaskId")]
        getter voice_tone_analysis_task_id : String?

        # The status of a voice tone analysis task.
        @[JSON::Field(key: "VoiceToneAnalysisTaskStatus")]
        getter voice_tone_analysis_task_status : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @updated_timestamp : Time? = nil,
          @voice_tone_analysis_task_id : String? = nil,
          @voice_tone_analysis_task_status : String? = nil
        )
        end
      end
    end
  end
end
