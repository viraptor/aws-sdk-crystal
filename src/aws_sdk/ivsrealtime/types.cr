require "json"
require "time"

module AwsSdk
  module IVSRealTime
    module Types

      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Access-Control-Allow-Origin")]
        getter access_control_allow_origin : String?

        @[JSON::Field(key: "Access-Control-Expose-Headers")]
        getter access_control_expose_headers : String?

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        @[JSON::Field(key: "Content-Security-Policy")]
        getter content_security_policy : String?

        # User does not have sufficient access to perform this action.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        @[JSON::Field(key: "Strict-Transport-Security")]
        getter strict_transport_security : String?

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amzn_error_type : String?

        @[JSON::Field(key: "X-Content-Type-Options")]
        getter x_content_type_options : String?

        @[JSON::Field(key: "X-Frame-Options")]
        getter x_frame_options : String?

        def initialize(
          @access_control_allow_origin : String? = nil,
          @access_control_expose_headers : String? = nil,
          @cache_control : String? = nil,
          @content_security_policy : String? = nil,
          @exception_message : String? = nil,
          @strict_transport_security : String? = nil,
          @x_amzn_error_type : String? = nil,
          @x_content_type_options : String? = nil,
          @x_frame_options : String? = nil
        )
        end
      end

      # Object specifying a configuration for individual participant recording.
      struct AutoParticipantRecordingConfiguration
        include JSON::Serializable

        # ARN of the StorageConfiguration resource to use for individual participant recording. Default: ""
        # (empty string, no storage configuration is specified). Individual participant recording cannot be
        # started unless a storage configuration is specified, when a Stage is created or updated. To disable
        # individual participant recording, set this to "" ; other fields in this object will get reset to
        # their defaults when sending "" .
        @[JSON::Field(key: "storageConfigurationArn")]
        getter storage_configuration_arn : String

        # HLS configuration object for individual participant recording.
        @[JSON::Field(key: "hlsConfiguration")]
        getter hls_configuration : Types::ParticipantRecordingHlsConfiguration?

        # Types of media to be recorded. Default: AUDIO_VIDEO .
        @[JSON::Field(key: "mediaTypes")]
        getter media_types : Array(String)?

        # Optional field to disable replica participant recording. If this is set to false when a participant
        # is a replica, replica participants are not recorded. Default: true .
        @[JSON::Field(key: "recordParticipantReplicas")]
        getter record_participant_replicas : Bool?

        # If a stage publisher disconnects and then reconnects within the specified interval, the multiple
        # recordings will be considered a single recording and merged together. The default value is 0, which
        # disables merging.
        @[JSON::Field(key: "recordingReconnectWindowSeconds")]
        getter recording_reconnect_window_seconds : Int32?

        # A complex type that allows you to enable/disable the recording of thumbnails for individual
        # participant recording and modify the interval at which thumbnails are generated for the live
        # session.
        @[JSON::Field(key: "thumbnailConfiguration")]
        getter thumbnail_configuration : Types::ParticipantThumbnailConfiguration?

        def initialize(
          @storage_configuration_arn : String,
          @hls_configuration : Types::ParticipantRecordingHlsConfiguration? = nil,
          @media_types : Array(String)? = nil,
          @record_participant_replicas : Bool? = nil,
          @recording_reconnect_window_seconds : Int32? = nil,
          @thumbnail_configuration : Types::ParticipantThumbnailConfiguration? = nil
        )
        end
      end

      # Object specifying a channel as a destination.
      struct ChannelDestinationConfiguration
        include JSON::Serializable

        # ARN of the channel to use for broadcasting. The channel and stage resources must be in the same AWS
        # account and region. The channel must be offline (not broadcasting).
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # ARN of the EncoderConfiguration resource. The encoder configuration and stage resources must be in
        # the same AWS account and region.
        @[JSON::Field(key: "encoderConfigurationArn")]
        getter encoder_configuration_arn : String?

        def initialize(
          @channel_arn : String,
          @encoder_configuration_arn : String? = nil
        )
        end
      end

      # Object specifying a Composition resource.
      struct Composition
        include JSON::Serializable

        # ARN of the Composition resource.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Array of Destination objects. A Composition can contain either one destination ( channel or s3 ) or
        # two (one channel and one s3 ).
        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::Destination)

        # Layout object to configure composition parameters.
        @[JSON::Field(key: "layout")]
        getter layout : Types::LayoutConfiguration

        # ARN of the stage used as input
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # State of the Composition.
        @[JSON::Field(key: "state")]
        getter state : String

        # UTC time of the Composition end. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # UTC time of the Composition start. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @destinations : Array(Types::Destination),
          @layout : Types::LayoutConfiguration,
          @stage_arn : String,
          @state : String,
          @end_time : Time? = nil,
          @start_time : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An object representing a configuration of HLS recordings for server-side composition.
      struct CompositionRecordingHlsConfiguration
        include JSON::Serializable

        # Defines the target duration for recorded segments generated when using composite recording. Default:
        # 2.
        @[JSON::Field(key: "targetSegmentDurationSeconds")]
        getter target_segment_duration_seconds : Int32?

        def initialize(
          @target_segment_duration_seconds : Int32? = nil
        )
        end
      end

      # Summary information about a Composition.
      struct CompositionSummary
        include JSON::Serializable

        # ARN of the Composition resource.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Array of Destination objects.
        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::DestinationSummary)

        # ARN of the attached stage.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # State of the Composition resource.
        @[JSON::Field(key: "state")]
        getter state : String

        # UTC time of the Composition end. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # UTC time of the Composition start. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @destinations : Array(Types::DestinationSummary),
          @stage_arn : String,
          @state : String,
          @end_time : Time? = nil,
          @start_time : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An object representing a configuration of thumbnails for recorded video for a Composition .
      struct CompositionThumbnailConfiguration
        include JSON::Serializable

        # Indicates the format in which thumbnails are recorded. SEQUENTIAL records all generated thumbnails
        # in a serial manner, to the media/thumbnails/(width)x(height) directory, where (width) and (height)
        # are the width and height of the thumbnail. LATEST saves the latest thumbnail in
        # media/latest_thumbnail/(width)x(height)/thumb.jpg and overwrites it at the interval specified by
        # targetIntervalSeconds . You can enable both SEQUENTIAL and LATEST . Default: SEQUENTIAL .
        @[JSON::Field(key: "storage")]
        getter storage : Array(String)?

        # The targeted thumbnail-generation interval in seconds. Default: 60.
        @[JSON::Field(key: "targetIntervalSeconds")]
        getter target_interval_seconds : Int32?

        def initialize(
          @storage : Array(String)? = nil,
          @target_interval_seconds : Int32? = nil
        )
        end
      end

      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Access-Control-Allow-Origin")]
        getter access_control_allow_origin : String?

        @[JSON::Field(key: "Access-Control-Expose-Headers")]
        getter access_control_expose_headers : String?

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        @[JSON::Field(key: "Content-Security-Policy")]
        getter content_security_policy : String?

        # Updating or deleting a resource can cause an inconsistent state.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        @[JSON::Field(key: "Strict-Transport-Security")]
        getter strict_transport_security : String?

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amzn_error_type : String?

        @[JSON::Field(key: "X-Content-Type-Options")]
        getter x_content_type_options : String?

        @[JSON::Field(key: "X-Frame-Options")]
        getter x_frame_options : String?

        def initialize(
          @access_control_allow_origin : String? = nil,
          @access_control_expose_headers : String? = nil,
          @cache_control : String? = nil,
          @content_security_policy : String? = nil,
          @exception_message : String? = nil,
          @strict_transport_security : String? = nil,
          @x_amzn_error_type : String? = nil,
          @x_content_type_options : String? = nil,
          @x_frame_options : String? = nil
        )
        end
      end

      struct CreateEncoderConfigurationRequest
        include JSON::Serializable

        # Optional name to identify the resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Video configuration. Default: video resolution 1280x720, bitrate 2500 kbps, 30 fps.
        @[JSON::Field(key: "video")]
        getter video : Types::Video?

        def initialize(
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @video : Types::Video? = nil
        )
        end
      end

      struct CreateEncoderConfigurationResponse
        include JSON::Serializable

        # The EncoderConfiguration that was created.
        @[JSON::Field(key: "encoderConfiguration")]
        getter encoder_configuration : Types::EncoderConfiguration?

        def initialize(
          @encoder_configuration : Types::EncoderConfiguration? = nil
        )
        end
      end

      struct CreateIngestConfigurationRequest
        include JSON::Serializable

        # Type of ingest protocol that the user employs to broadcast. If this is set to RTMP , insecureIngest
        # must be set to true .
        @[JSON::Field(key: "ingestProtocol")]
        getter ingest_protocol : String

        # Application-provided attributes to store in the IngestConfiguration and attach to a stage. Map keys
        # and values can contain UTF-8 encoded text. The maximum length of this field is 1 KB total. This
        # field is exposed to all stage participants and should not be used for personally identifying,
        # confidential, or sensitive information.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Whether the stage allows insecure RTMP ingest. This must be set to true , if ingestProtocol is set
        # to RTMP . Default: false .
        @[JSON::Field(key: "insecureIngest")]
        getter insecure_ingest : Bool?

        # Optional name that can be specified for the IngestConfiguration being created.
        @[JSON::Field(key: "name")]
        getter name : String?

        # ARN of the stage with which the IngestConfiguration is associated.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Customer-assigned name to help identify the participant using the IngestConfiguration; this can be
        # used to link a participant to a user in the customer’s own systems. This can be any UTF-8 encoded
        # text. This field is exposed to all stage participants and should not be used for personally
        # identifying, confidential, or sensitive information.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @ingest_protocol : String,
          @attributes : Hash(String, String)? = nil,
          @insecure_ingest : Bool? = nil,
          @name : String? = nil,
          @stage_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct CreateIngestConfigurationResponse
        include JSON::Serializable

        # The IngestConfiguration that was created.
        @[JSON::Field(key: "ingestConfiguration")]
        getter ingest_configuration : Types::IngestConfiguration?

        def initialize(
          @ingest_configuration : Types::IngestConfiguration? = nil
        )
        end
      end

      struct CreateParticipantTokenRequest
        include JSON::Serializable

        # ARN of the stage to which this token is scoped.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # Application-provided attributes to encode into the token and attach to a stage. Map keys and values
        # can contain UTF-8 encoded text. The maximum length of this field is 1 KB total. This field is
        # exposed to all stage participants and should not be used for personally identifying, confidential,
        # or sensitive information.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Set of capabilities that the user is allowed to perform in the stage. Default: PUBLISH, SUBSCRIBE .
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # Duration (in minutes), after which the token expires. Default: 720 (12 hours).
        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # Name that can be specified to help identify the token. This can be any UTF-8 encoded text. This
        # field is exposed to all stage participants and should not be used for personally identifying,
        # confidential, or sensitive information.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @stage_arn : String,
          @attributes : Hash(String, String)? = nil,
          @capabilities : Array(String)? = nil,
          @duration : Int32? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct CreateParticipantTokenResponse
        include JSON::Serializable

        # The participant token that was created.
        @[JSON::Field(key: "participantToken")]
        getter participant_token : Types::ParticipantToken?

        def initialize(
          @participant_token : Types::ParticipantToken? = nil
        )
        end
      end

      struct CreateStageRequest
        include JSON::Serializable

        # Configuration object for individual participant recording, to attach to the new stage.
        @[JSON::Field(key: "autoParticipantRecordingConfiguration")]
        getter auto_participant_recording_configuration : Types::AutoParticipantRecordingConfiguration?

        # Optional name that can be specified for the stage being created.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Array of participant token configuration objects to attach to the new stage.
        @[JSON::Field(key: "participantTokenConfigurations")]
        getter participant_token_configurations : Array(Types::ParticipantTokenConfiguration)?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @auto_participant_recording_configuration : Types::AutoParticipantRecordingConfiguration? = nil,
          @name : String? = nil,
          @participant_token_configurations : Array(Types::ParticipantTokenConfiguration)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateStageResponse
        include JSON::Serializable

        # Participant tokens attached to the stage. These correspond to the participants in the request.
        @[JSON::Field(key: "participantTokens")]
        getter participant_tokens : Array(Types::ParticipantToken)?

        # The stage that was created.
        @[JSON::Field(key: "stage")]
        getter stage : Types::Stage?

        def initialize(
          @participant_tokens : Array(Types::ParticipantToken)? = nil,
          @stage : Types::Stage? = nil
        )
        end
      end

      struct CreateStorageConfigurationRequest
        include JSON::Serializable

        # A complex type that contains a storage configuration for where recorded video will be stored.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3StorageConfiguration

        # Storage configuration name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @s3 : Types::S3StorageConfiguration,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateStorageConfigurationResponse
        include JSON::Serializable

        # The StorageConfiguration that was created.
        @[JSON::Field(key: "storageConfiguration")]
        getter storage_configuration : Types::StorageConfiguration?

        def initialize(
          @storage_configuration : Types::StorageConfiguration? = nil
        )
        end
      end

      struct DeleteEncoderConfigurationRequest
        include JSON::Serializable

        # ARN of the EncoderConfiguration.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteEncoderConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteIngestConfigurationRequest
        include JSON::Serializable

        # ARN of the IngestConfiguration.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Optional field to force deletion of the IngestConfiguration. If this is set to true when a
        # participant is actively publishing, the participant is disconnected from the stage, followed by
        # deletion of the IngestConfiguration. Default: false .
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @arn : String,
          @force : Bool? = nil
        )
        end
      end

      struct DeleteIngestConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePublicKeyRequest
        include JSON::Serializable

        # ARN of the public key to be deleted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeletePublicKeyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteStageRequest
        include JSON::Serializable

        # ARN of the stage to be deleted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteStageResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteStorageConfigurationRequest
        include JSON::Serializable

        # ARN of the storage configuration to be deleted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteStorageConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Object specifying the status of a Destination.
      struct Destination
        include JSON::Serializable

        # Configuration used to create this destination.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DestinationConfiguration

        # Unique identifier for this destination, assigned by IVS.
        @[JSON::Field(key: "id")]
        getter id : String

        # State of the Composition Destination.
        @[JSON::Field(key: "state")]
        getter state : String

        # Optional details regarding the status of the destination.
        @[JSON::Field(key: "detail")]
        getter detail : Types::DestinationDetail?

        # UTC time of the destination end. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # UTC time of the destination start. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @configuration : Types::DestinationConfiguration,
          @id : String,
          @state : String,
          @detail : Types::DestinationDetail? = nil,
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Complex data type that defines destination-configuration objects.
      struct DestinationConfiguration
        include JSON::Serializable

        # An IVS channel to be used for broadcasting, for server-side composition. Either a channel or an s3
        # must be specified.
        @[JSON::Field(key: "channel")]
        getter channel : Types::ChannelDestinationConfiguration?

        # Name that can be specified to help identify the destination.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An S3 storage configuration to be used for recording video data. Either a channel or an s3 must be
        # specified.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3DestinationConfiguration?

        def initialize(
          @channel : Types::ChannelDestinationConfiguration? = nil,
          @name : String? = nil,
          @s3 : Types::S3DestinationConfiguration? = nil
        )
        end
      end

      # Complex data type that defines destination-detail objects.
      struct DestinationDetail
        include JSON::Serializable

        # An S3 detail object to return information about the S3 destination.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Detail?

        def initialize(
          @s3 : Types::S3Detail? = nil
        )
        end
      end

      # Summary information about a Destination.
      struct DestinationSummary
        include JSON::Serializable

        # Unique identifier for this destination, assigned by IVS.
        @[JSON::Field(key: "id")]
        getter id : String

        # State of the Composition Destination.
        @[JSON::Field(key: "state")]
        getter state : String

        # UTC time of the destination end. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # UTC time of the destination start. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @id : String,
          @state : String,
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct DisconnectParticipantRequest
        include JSON::Serializable

        # Identifier of the participant to be disconnected. IVS assigns this; it is returned by
        # CreateParticipantToken (for streams using WebRTC ingest) or CreateIngestConfiguration (for streams
        # using RTMP ingest).
        @[JSON::Field(key: "participantId")]
        getter participant_id : String

        # ARN of the stage to which the participant is attached.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # Description of why this participant is being disconnected.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @participant_id : String,
          @stage_arn : String,
          @reason : String? = nil
        )
        end
      end

      struct DisconnectParticipantResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Settings for transcoding.
      struct EncoderConfiguration
        include JSON::Serializable

        # ARN of the EncoderConfiguration resource.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Optional name to identify the resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Video configuration. Default: video resolution 1280x720, bitrate 2500 kbps, 30 fps
        @[JSON::Field(key: "video")]
        getter video : Types::Video?

        def initialize(
          @arn : String,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @video : Types::Video? = nil
        )
        end
      end

      # Summary information about an EncoderConfiguration.
      struct EncoderConfigurationSummary
        include JSON::Serializable

        # ARN of the EncoderConfiguration resource.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Optional name to identify the resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An occurrence during a stage session.
      struct Event
        include JSON::Serializable

        # ID of the session within the destination stage. Applicable only if the event name is
        # REPLICATION_STARTED or REPLICATION_STOPPED .
        @[JSON::Field(key: "destinationSessionId")]
        getter destination_session_id : String?

        # ARN of the stage where the participant is replicated. Applicable only if the event name is
        # REPLICATION_STARTED or REPLICATION_STOPPED .
        @[JSON::Field(key: "destinationStageArn")]
        getter destination_stage_arn : String?

        # If the event is an error event, the error code is provided to give insight into the specific error
        # that occurred. If the event is not an error event, this field is null. B_FRAME_PRESENT — The
        # participant's stream includes B-frames. For details, see IVS RTMP Publishing . BITRATE_EXCEEDED —
        # The participant exceeded the maximum supported bitrate. For details, see Service Quotas .
        # INSUFFICIENT_CAPABILITIES — The participant tried to take an action that the participant’s token is
        # not allowed to do. For details on participant capabilities, see the capabilities field in
        # CreateParticipantToken . INTERNAL_SERVER_EXCEPTION — The participant failed to publish to the stage
        # due to an internal server error. INVALID_AUDIO_CODEC — The participant is using an invalid audio
        # codec. For details, see Stream Ingest . INVALID_INPUT — The participant is using an invalid input
        # stream. INVALID_PROTOCOL — The participant's IngestConfiguration resource is configured for RTMPS
        # but they tried streaming with RTMP. For details, see IVS RTMP Publishing . INVALID_STREAM_KEY — The
        # participant is using an invalid stream key. For details, see IVS RTMP Publishing .
        # INVALID_VIDEO_CODEC — The participant is using an invalid video codec. For details, see Stream
        # Ingest . PUBLISHER_NOT_FOUND — The participant tried to subscribe to a publisher that doesn’t exist.
        # QUOTA_EXCEEDED — The number of participants who want to publish/subscribe to a stage exceeds the
        # quota. For details, see Service Quotas . RESOLUTION_EXCEEDED — The participant exceeded the maximum
        # supported resolution. For details, see Service Quotas . REUSE_OF_STREAM_KEY — The participant tried
        # to use a stream key that is associated with another active stage session. STREAM_DURATION_EXCEEDED —
        # The participant exceeded the maximum allowed stream duration. For details, see Service Quotas .
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # ISO 8601 timestamp (returned as a string) for when the event occurred.
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time?

        # The name of the event.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Participant token created during TOKEN_EXCHANGED event.
        @[JSON::Field(key: "newToken")]
        getter new_token : Types::ExchangedParticipantToken?

        # Unique identifier for the participant who triggered the event. This is assigned by IVS.
        @[JSON::Field(key: "participantId")]
        getter participant_id : String?

        # Source participant token for TOKEN_EXCHANGED event.
        @[JSON::Field(key: "previousToken")]
        getter previous_token : Types::ExchangedParticipantToken?

        # Unique identifier for the remote participant. For a subscribe event, this is the publisher. For a
        # publish or join event, this is null. This is assigned by IVS.
        @[JSON::Field(key: "remoteParticipantId")]
        getter remote_participant_id : String?

        # If true, this indicates the participantId is a replicated participant. If this is a subscribe event,
        # then this flag refers to remoteParticipantId . Default: false .
        @[JSON::Field(key: "replica")]
        getter replica : Bool?

        def initialize(
          @destination_session_id : String? = nil,
          @destination_stage_arn : String? = nil,
          @error_code : String? = nil,
          @event_time : Time? = nil,
          @name : String? = nil,
          @new_token : Types::ExchangedParticipantToken? = nil,
          @participant_id : String? = nil,
          @previous_token : Types::ExchangedParticipantToken? = nil,
          @remote_participant_id : String? = nil,
          @replica : Bool? = nil
        )
        end
      end

      # Object specifying an exchanged participant token in a stage, created when an original participant
      # token is updated. Important : Treat tokens as opaque; i.e., do not build functionality based on
      # token contents. The format of tokens could change in the future.
      struct ExchangedParticipantToken
        include JSON::Serializable

        # Application-provided attributes to encode into the token and attach to a stage. Map keys and values
        # can contain UTF-8 encoded text. The maximum length of this field is 1 KB total. This field is
        # exposed to all stage participants and should not be used for personally identifying, confidential,
        # or sensitive information.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Set of capabilities that the user is allowed to perform in the stage.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # ISO 8601 timestamp (returned as a string) for when this token expires.
        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : Time?

        # Customer-assigned name to help identify the token; this can be used to link a participant to a user
        # in the customer’s own systems. This can be any UTF-8 encoded text. This field is exposed to all
        # stage participants and should not be used for personally identifying, confidential, or sensitive
        # information.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @capabilities : Array(String)? = nil,
          @expiration_time : Time? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct GetCompositionRequest
        include JSON::Serializable

        # ARN of the Composition resource.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetCompositionResponse
        include JSON::Serializable

        # The Composition that was returned.
        @[JSON::Field(key: "composition")]
        getter composition : Types::Composition?

        def initialize(
          @composition : Types::Composition? = nil
        )
        end
      end

      struct GetEncoderConfigurationRequest
        include JSON::Serializable

        # ARN of the EncoderConfiguration resource.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetEncoderConfigurationResponse
        include JSON::Serializable

        # The EncoderConfiguration that was returned.
        @[JSON::Field(key: "encoderConfiguration")]
        getter encoder_configuration : Types::EncoderConfiguration?

        def initialize(
          @encoder_configuration : Types::EncoderConfiguration? = nil
        )
        end
      end

      struct GetIngestConfigurationRequest
        include JSON::Serializable

        # ARN of the ingest for which the information is to be retrieved.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetIngestConfigurationResponse
        include JSON::Serializable

        # The IngestConfiguration that was returned.
        @[JSON::Field(key: "ingestConfiguration")]
        getter ingest_configuration : Types::IngestConfiguration?

        def initialize(
          @ingest_configuration : Types::IngestConfiguration? = nil
        )
        end
      end

      struct GetParticipantRequest
        include JSON::Serializable

        # Unique identifier for the participant. This is assigned by IVS and returned by
        # CreateParticipantToken .
        @[JSON::Field(key: "participantId")]
        getter participant_id : String

        # ID of a session within the stage.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # Stage ARN.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        def initialize(
          @participant_id : String,
          @session_id : String,
          @stage_arn : String
        )
        end
      end

      struct GetParticipantResponse
        include JSON::Serializable

        # The participant that is returned.
        @[JSON::Field(key: "participant")]
        getter participant : Types::Participant?

        def initialize(
          @participant : Types::Participant? = nil
        )
        end
      end

      struct GetPublicKeyRequest
        include JSON::Serializable

        # ARN of the public key for which the information is to be retrieved.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetPublicKeyResponse
        include JSON::Serializable

        # The public key that is returned.
        @[JSON::Field(key: "publicKey")]
        getter public_key : Types::PublicKey?

        def initialize(
          @public_key : Types::PublicKey? = nil
        )
        end
      end

      struct GetStageRequest
        include JSON::Serializable

        # ARN of the stage for which the information is to be retrieved.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetStageResponse
        include JSON::Serializable

        # The stage that is returned.
        @[JSON::Field(key: "stage")]
        getter stage : Types::Stage?

        def initialize(
          @stage : Types::Stage? = nil
        )
        end
      end

      struct GetStageSessionRequest
        include JSON::Serializable

        # ID of a session within the stage.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # ARN of the stage for which the information is to be retrieved.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        def initialize(
          @session_id : String,
          @stage_arn : String
        )
        end
      end

      struct GetStageSessionResponse
        include JSON::Serializable

        # The stage session that is returned.
        @[JSON::Field(key: "stageSession")]
        getter stage_session : Types::StageSession?

        def initialize(
          @stage_session : Types::StageSession? = nil
        )
        end
      end

      struct GetStorageConfigurationRequest
        include JSON::Serializable

        # ARN of the storage configuration to be retrieved.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetStorageConfigurationResponse
        include JSON::Serializable

        # The StorageConfiguration that was returned.
        @[JSON::Field(key: "storageConfiguration")]
        getter storage_configuration : Types::StorageConfiguration?

        def initialize(
          @storage_configuration : Types::StorageConfiguration? = nil
        )
        end
      end

      # Configuration information specific to Grid layout, for server-side composition. See "Layouts" in
      # Server-Side Composition .
      struct GridConfiguration
        include JSON::Serializable

        # This attribute name identifies the featured slot. A participant with this attribute set to "true"
        # (as a string value) in ParticipantTokenConfiguration is placed in the featured slot. Default: "" (no
        # featured participant).
        @[JSON::Field(key: "featuredParticipantAttribute")]
        getter featured_participant_attribute : String?

        # Specifies the spacing between participant tiles in pixels. Default: 2 .
        @[JSON::Field(key: "gridGap")]
        getter grid_gap : Int32?

        # Determines whether to omit participants with stopped video in the composition. Default: false .
        @[JSON::Field(key: "omitStoppedVideo")]
        getter omit_stopped_video : Bool?

        # Attribute name in ParticipantTokenConfiguration identifying the participant ordering key.
        # Participants with participantOrderAttribute set to "" or not specified are ordered based on their
        # arrival time into the stage.
        @[JSON::Field(key: "participantOrderAttribute")]
        getter participant_order_attribute : String?

        # Sets the non-featured participant display mode, to control the aspect ratio of video tiles. VIDEO is
        # 16:9, SQUARE is 1:1, and PORTRAIT is 3:4. Default: VIDEO .
        @[JSON::Field(key: "videoAspectRatio")]
        getter video_aspect_ratio : String?

        # Defines how video content fits within the participant tile: FILL (stretched), COVER (cropped), or
        # CONTAIN (letterboxed). When not set, videoFillMode defaults to COVER fill mode for participants in
        # the grid and to CONTAIN fill mode for featured participants.
        @[JSON::Field(key: "videoFillMode")]
        getter video_fill_mode : String?

        def initialize(
          @featured_participant_attribute : String? = nil,
          @grid_gap : Int32? = nil,
          @omit_stopped_video : Bool? = nil,
          @participant_order_attribute : String? = nil,
          @video_aspect_ratio : String? = nil,
          @video_fill_mode : String? = nil
        )
        end
      end

      struct ImportPublicKeyRequest
        include JSON::Serializable

        # The content of the public key to be imported.
        @[JSON::Field(key: "publicKeyMaterial")]
        getter public_key_material : String

        # Name of the public key to be imported.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @public_key_material : String,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ImportPublicKeyResponse
        include JSON::Serializable

        # The public key that was imported.
        @[JSON::Field(key: "publicKey")]
        getter public_key : Types::PublicKey?

        def initialize(
          @public_key : Types::PublicKey? = nil
        )
        end
      end

      # Object specifying an ingest configuration.
      struct IngestConfiguration
        include JSON::Serializable

        # Ingest configuration ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Type of ingest protocol that the user employs for broadcasting.
        @[JSON::Field(key: "ingestProtocol")]
        getter ingest_protocol : String

        # ID of the participant within the stage.
        @[JSON::Field(key: "participantId")]
        getter participant_id : String

        # ARN of the stage with which the IngestConfiguration is associated.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # State of the ingest configuration. It is ACTIVE if a publisher currently is publishing to the stage
        # associated with the ingest configuration.
        @[JSON::Field(key: "state")]
        getter state : String

        # Ingest-key value for the RTMP(S) protocol.
        @[JSON::Field(key: "streamKey")]
        getter stream_key : String

        # Application-provided attributes to to store in the IngestConfiguration and attach to a stage. Map
        # keys and values can contain UTF-8 encoded text. The maximum length of this field is 1 KB total. This
        # field is exposed to all stage participants and should not be used for personally identifying,
        # confidential, or sensitive information.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Ingest name
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Customer-assigned name to help identify the participant using the IngestConfiguration; this can be
        # used to link a participant to a user in the customer’s own systems. This can be any UTF-8 encoded
        # text. This field is exposed to all stage participants and should not be used for personally
        # identifying, confidential, or sensitive information.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @arn : String,
          @ingest_protocol : String,
          @participant_id : String,
          @stage_arn : String,
          @state : String,
          @stream_key : String,
          @attributes : Hash(String, String)? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Summary information about an IngestConfiguration.
      struct IngestConfigurationSummary
        include JSON::Serializable

        # Ingest configuration ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Type of ingest protocol that the user employs for broadcasting.
        @[JSON::Field(key: "ingestProtocol")]
        getter ingest_protocol : String

        # ID of the participant within the stage.
        @[JSON::Field(key: "participantId")]
        getter participant_id : String

        # ARN of the stage with which the IngestConfiguration is associated.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # State of the ingest configuration. It is ACTIVE if a publisher currently is publishing to the stage
        # associated with the ingest configuration.
        @[JSON::Field(key: "state")]
        getter state : String

        # Ingest name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Customer-assigned name to help identify the participant using the IngestConfiguration; this can be
        # used to link a participant to a user in the customer’s own systems. This can be any UTF-8 encoded
        # text. This field is exposed to all stage participants and should not be used for personally
        # identifying, confidential, or sensitive information.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @arn : String,
          @ingest_protocol : String,
          @participant_id : String,
          @stage_arn : String,
          @state : String,
          @name : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Access-Control-Allow-Origin")]
        getter access_control_allow_origin : String?

        @[JSON::Field(key: "Access-Control-Expose-Headers")]
        getter access_control_expose_headers : String?

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        @[JSON::Field(key: "Content-Security-Policy")]
        getter content_security_policy : String?

        # Unexpected error during processing of request.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        @[JSON::Field(key: "Strict-Transport-Security")]
        getter strict_transport_security : String?

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amzn_error_type : String?

        @[JSON::Field(key: "X-Content-Type-Options")]
        getter x_content_type_options : String?

        @[JSON::Field(key: "X-Frame-Options")]
        getter x_frame_options : String?

        def initialize(
          @access_control_allow_origin : String? = nil,
          @access_control_expose_headers : String? = nil,
          @cache_control : String? = nil,
          @content_security_policy : String? = nil,
          @exception_message : String? = nil,
          @strict_transport_security : String? = nil,
          @x_amzn_error_type : String? = nil,
          @x_content_type_options : String? = nil,
          @x_frame_options : String? = nil
        )
        end
      end

      # Configuration information of supported layouts for server-side composition.
      struct LayoutConfiguration
        include JSON::Serializable

        # Configuration related to grid layout. Default: Grid layout.
        @[JSON::Field(key: "grid")]
        getter grid : Types::GridConfiguration?

        # Configuration related to PiP layout.
        @[JSON::Field(key: "pip")]
        getter pip : Types::PipConfiguration?

        def initialize(
          @grid : Types::GridConfiguration? = nil,
          @pip : Types::PipConfiguration? = nil
        )
        end
      end

      struct ListCompositionsRequest
        include JSON::Serializable

        # Filters the Composition list to match the specified EncoderConfiguration attached to at least one of
        # its output.
        @[JSON::Field(key: "filterByEncoderConfigurationArn")]
        getter filter_by_encoder_configuration_arn : String?

        # Filters the Composition list to match the specified Stage ARN.
        @[JSON::Field(key: "filterByStageArn")]
        getter filter_by_stage_arn : String?

        # Maximum number of results to return. Default: 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first Composition to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_by_encoder_configuration_arn : String? = nil,
          @filter_by_stage_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCompositionsResponse
        include JSON::Serializable

        # List of the matching Compositions (summary information only).
        @[JSON::Field(key: "compositions")]
        getter compositions : Array(Types::CompositionSummary)

        # If there are more compositions than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @compositions : Array(Types::CompositionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListEncoderConfigurationsRequest
        include JSON::Serializable

        # Maximum number of results to return. Default: 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first encoder configuration to retrieve. This is used for pagination; see the nextToken response
        # field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEncoderConfigurationsResponse
        include JSON::Serializable

        # List of the matching EncoderConfigurations (summary information only).
        @[JSON::Field(key: "encoderConfigurations")]
        getter encoder_configurations : Array(Types::EncoderConfigurationSummary)

        # If there are more encoder configurations than maxResults , use nextToken in the request to get the
        # next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @encoder_configurations : Array(Types::EncoderConfigurationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListIngestConfigurationsRequest
        include JSON::Serializable

        # Filters the response list to match the specified stage ARN. Only one filter (by stage ARN or by
        # state) can be used at a time.
        @[JSON::Field(key: "filterByStageArn")]
        getter filter_by_stage_arn : String?

        # Filters the response list to match the specified state. Only one filter (by stage ARN or by state)
        # can be used at a time.
        @[JSON::Field(key: "filterByState")]
        getter filter_by_state : String?

        # Maximum number of results to return. Default: 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first IngestConfiguration to retrieve. This is used for pagination; see the nextToken response
        # field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_by_stage_arn : String? = nil,
          @filter_by_state : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIngestConfigurationsResponse
        include JSON::Serializable

        # List of the matching ingest configurations (summary information only).
        @[JSON::Field(key: "ingestConfigurations")]
        getter ingest_configurations : Array(Types::IngestConfigurationSummary)

        # If there are more IngestConfigurations than maxResults , use nextToken in the request to get the
        # next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ingest_configurations : Array(Types::IngestConfigurationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListParticipantEventsRequest
        include JSON::Serializable

        # Unique identifier for this participant. This is assigned by IVS and returned by
        # CreateParticipantToken .
        @[JSON::Field(key: "participantId")]
        getter participant_id : String

        # ID of a session within the stage.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # Stage ARN.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # Maximum number of results to return. Default: 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first participant event to retrieve. This is used for pagination; see the nextToken response
        # field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @participant_id : String,
          @session_id : String,
          @stage_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListParticipantEventsResponse
        include JSON::Serializable

        # List of the matching events.
        @[JSON::Field(key: "events")]
        getter events : Array(Types::Event)

        # If there are more events than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::Event),
          @next_token : String? = nil
        )
        end
      end

      struct ListParticipantReplicasRequest
        include JSON::Serializable

        # Participant ID of the publisher that has been replicated. This is assigned by IVS and returned by
        # CreateParticipantToken or the jti (JWT ID) used to create a self signed token .
        @[JSON::Field(key: "participantId")]
        getter participant_id : String

        # ARN of the stage where the participant is publishing.
        @[JSON::Field(key: "sourceStageArn")]
        getter source_stage_arn : String

        # Maximum number of results to return. Default: 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first participant to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @participant_id : String,
          @source_stage_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListParticipantReplicasResponse
        include JSON::Serializable

        # List of all participant replicas.
        @[JSON::Field(key: "replicas")]
        getter replicas : Array(Types::ParticipantReplica)

        # If there are more participants than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @replicas : Array(Types::ParticipantReplica),
          @next_token : String? = nil
        )
        end
      end

      struct ListParticipantsRequest
        include JSON::Serializable

        # ID of the session within the stage.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # Stage ARN.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # Filters the response list to only show participants who published during the stage session. Only one
        # of filterByUserId , filterByPublished , filterByState , or filterByRecordingState can be provided
        # per request.
        @[JSON::Field(key: "filterByPublished")]
        getter filter_by_published : Bool?

        # Filters the response list to only show participants with the specified recording state. Only one of
        # filterByUserId , filterByPublished , filterByState , or filterByRecordingState can be provided per
        # request.
        @[JSON::Field(key: "filterByRecordingState")]
        getter filter_by_recording_state : String?

        # Filters the response list to only show participants in the specified state. Only one of
        # filterByUserId , filterByPublished , filterByState , or filterByRecordingState can be provided per
        # request.
        @[JSON::Field(key: "filterByState")]
        getter filter_by_state : String?

        # Filters the response list to match the specified user ID. Only one of filterByUserId ,
        # filterByPublished , filterByState , or filterByRecordingState can be provided per request. A userId
        # is a customer-assigned name to help identify the token; this can be used to link a participant to a
        # user in the customer’s own systems.
        @[JSON::Field(key: "filterByUserId")]
        getter filter_by_user_id : String?

        # Maximum number of results to return. Default: 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first participant to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @session_id : String,
          @stage_arn : String,
          @filter_by_published : Bool? = nil,
          @filter_by_recording_state : String? = nil,
          @filter_by_state : String? = nil,
          @filter_by_user_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListParticipantsResponse
        include JSON::Serializable

        # List of the matching participants (summary information only).
        @[JSON::Field(key: "participants")]
        getter participants : Array(Types::ParticipantSummary)

        # If there are more participants than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @participants : Array(Types::ParticipantSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListPublicKeysRequest
        include JSON::Serializable

        # Maximum number of results to return. Default: 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first public key to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPublicKeysResponse
        include JSON::Serializable

        # List of the matching public keys (summary information only).
        @[JSON::Field(key: "publicKeys")]
        getter public_keys : Array(Types::PublicKeySummary)

        # If there are more public keys than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @public_keys : Array(Types::PublicKeySummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListStageSessionsRequest
        include JSON::Serializable

        # Stage ARN.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # Maximum number of results to return. Default: 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first stage session to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @stage_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStageSessionsResponse
        include JSON::Serializable

        # List of matching stage sessions.
        @[JSON::Field(key: "stageSessions")]
        getter stage_sessions : Array(Types::StageSessionSummary)

        # If there are more stage sessions than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @stage_sessions : Array(Types::StageSessionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListStagesRequest
        include JSON::Serializable

        # Maximum number of results to return. Default: 50.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first stage to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStagesResponse
        include JSON::Serializable

        # List of the matching stages (summary information only).
        @[JSON::Field(key: "stages")]
        getter stages : Array(Types::StageSummary)

        # If there are more stages than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @stages : Array(Types::StageSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListStorageConfigurationsRequest
        include JSON::Serializable

        # Maximum number of storage configurations to return. Default: your service quota or 100, whichever is
        # smaller.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first storage configuration to retrieve. This is used for pagination; see the nextToken response
        # field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStorageConfigurationsResponse
        include JSON::Serializable

        # List of the matching storage configurations.
        @[JSON::Field(key: "storageConfigurations")]
        getter storage_configurations : Array(Types::StorageConfigurationSummary)

        # If there are more storage configurations than maxResults , use nextToken in the request to get the
        # next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @storage_configurations : Array(Types::StorageConfigurationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource to be retrieved. The ARN must be URL-encoded.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) .
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # Object describing a participant that has joined a stage.
      struct Participant
        include JSON::Serializable

        # Application-provided attributes to encode into the token and attach to a stage. Map keys and values
        # can contain UTF-8 encoded text. The maximum length of this field is 1 KB total. This field is
        # exposed to all stage participants and should not be used for personally identifying, confidential,
        # or sensitive information .
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The participant’s browser.
        @[JSON::Field(key: "browserName")]
        getter browser_name : String?

        # The participant’s browser version.
        @[JSON::Field(key: "browserVersion")]
        getter browser_version : String?

        # ISO 8601 timestamp (returned as a string) when the participant first joined the stage session.
        @[JSON::Field(key: "firstJoinTime")]
        getter first_join_time : Time?

        # The participant’s Internet Service Provider.
        @[JSON::Field(key: "ispName")]
        getter isp_name : String?

        # The participant’s operating system.
        @[JSON::Field(key: "osName")]
        getter os_name : String?

        # The participant’s operating system version.
        @[JSON::Field(key: "osVersion")]
        getter os_version : String?

        # Unique identifier for this participant, assigned by IVS.
        @[JSON::Field(key: "participantId")]
        getter participant_id : String?

        # Type of ingest protocol that the participant employs for broadcasting.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # Whether the participant ever published to the stage session.
        @[JSON::Field(key: "published")]
        getter published : Bool?

        # Name of the S3 bucket to where the participant is being recorded, if individual participant
        # recording is enabled, or "" (empty string), if recording is not enabled.
        @[JSON::Field(key: "recordingS3BucketName")]
        getter recording_s3_bucket_name : String?

        # S3 prefix of the S3 bucket where the participant is being recorded, if individual participant
        # recording is enabled, or "" (empty string), if recording is not enabled. If individual participant
        # recording merge is enabled, and if a stage publisher disconnects from a stage and then reconnects,
        # IVS tries to record to the same S3 prefix as the previous session. See Merge Fragmented Individual
        # Participant Recordings .
        @[JSON::Field(key: "recordingS3Prefix")]
        getter recording_s3_prefix : String?

        # The participant’s recording state.
        @[JSON::Field(key: "recordingState")]
        getter recording_state : String?

        # The participant's replication state.
        @[JSON::Field(key: "replicationState")]
        getter replication_state : String?

        # Indicates if the participant has been replicated to another stage or is a replica from another
        # stage. Default: NONE .
        @[JSON::Field(key: "replicationType")]
        getter replication_type : String?

        # The participant’s SDK version.
        @[JSON::Field(key: "sdkVersion")]
        getter sdk_version : String?

        # ID of the session within the source stage, if replicationType is REPLICA .
        @[JSON::Field(key: "sourceSessionId")]
        getter source_session_id : String?

        # Source stage ARN from which this participant is replicated, if replicationType is REPLICA .
        @[JSON::Field(key: "sourceStageArn")]
        getter source_stage_arn : String?

        # Whether the participant is connected to or disconnected from the stage.
        @[JSON::Field(key: "state")]
        getter state : String?

        # Customer-assigned name to help identify the token; this can be used to link a participant to a user
        # in the customer’s own systems. This can be any UTF-8 encoded text. This field is exposed to all
        # stage participants and should not be used for personally identifying, confidential, or sensitive
        # information .
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @browser_name : String? = nil,
          @browser_version : String? = nil,
          @first_join_time : Time? = nil,
          @isp_name : String? = nil,
          @os_name : String? = nil,
          @os_version : String? = nil,
          @participant_id : String? = nil,
          @protocol : String? = nil,
          @published : Bool? = nil,
          @recording_s3_bucket_name : String? = nil,
          @recording_s3_prefix : String? = nil,
          @recording_state : String? = nil,
          @replication_state : String? = nil,
          @replication_type : String? = nil,
          @sdk_version : String? = nil,
          @source_session_id : String? = nil,
          @source_stage_arn : String? = nil,
          @state : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # An object representing a configuration of participant HLS recordings for individual participant
      # recording.
      struct ParticipantRecordingHlsConfiguration
        include JSON::Serializable

        # Defines the target duration for recorded segments generated when recording a stage participant.
        # Segments may have durations longer than the specified value when needed to ensure each segment
        # begins with a keyframe. Default: 6.
        @[JSON::Field(key: "targetSegmentDurationSeconds")]
        getter target_segment_duration_seconds : Int32?

        def initialize(
          @target_segment_duration_seconds : Int32? = nil
        )
        end
      end

      # Information about the replicated destination stage for a participant.
      struct ParticipantReplica
        include JSON::Serializable

        # ID of the session within the destination stage.
        @[JSON::Field(key: "destinationSessionId")]
        getter destination_session_id : String

        # ARN of the stage where the participant is replicated.
        @[JSON::Field(key: "destinationStageArn")]
        getter destination_stage_arn : String

        # Participant ID of the publisher that will be replicated. This is assigned by IVS and returned by
        # CreateParticipantToken or the jti (JWT ID) used to create a self signed token .
        @[JSON::Field(key: "participantId")]
        getter participant_id : String

        # Replica’s current replication state.
        @[JSON::Field(key: "replicationState")]
        getter replication_state : String

        # ID of the session within the source stage.
        @[JSON::Field(key: "sourceSessionId")]
        getter source_session_id : String

        # ARN of the stage from which this participant is replicated.
        @[JSON::Field(key: "sourceStageArn")]
        getter source_stage_arn : String

        def initialize(
          @destination_session_id : String,
          @destination_stage_arn : String,
          @participant_id : String,
          @replication_state : String,
          @source_session_id : String,
          @source_stage_arn : String
        )
        end
      end

      # Summary object describing a participant that has joined a stage.
      struct ParticipantSummary
        include JSON::Serializable

        # ISO 8601 timestamp (returned as a string) when the participant first joined the stage session.
        @[JSON::Field(key: "firstJoinTime")]
        getter first_join_time : Time?

        # Unique identifier for this participant, assigned by IVS.
        @[JSON::Field(key: "participantId")]
        getter participant_id : String?

        # Whether the participant ever published to the stage session.
        @[JSON::Field(key: "published")]
        getter published : Bool?

        # The participant’s recording state.
        @[JSON::Field(key: "recordingState")]
        getter recording_state : String?

        # The participant's replication state.
        @[JSON::Field(key: "replicationState")]
        getter replication_state : String?

        # Indicates if the participant has been replicated to another stage or is a replica from another
        # stage. Default: NONE .
        @[JSON::Field(key: "replicationType")]
        getter replication_type : String?

        # ID of the session within the source stage, if replicationType is REPLICA .
        @[JSON::Field(key: "sourceSessionId")]
        getter source_session_id : String?

        # Source stage ARN from which this participant is replicated, if replicationType is REPLICA .
        @[JSON::Field(key: "sourceStageArn")]
        getter source_stage_arn : String?

        # Whether the participant is connected to or disconnected from the stage.
        @[JSON::Field(key: "state")]
        getter state : String?

        # Customer-assigned name to help identify the token; this can be used to link a participant to a user
        # in the customer’s own systems. This can be any UTF-8 encoded text. This field is exposed to all
        # stage participants and should not be used for personally identifying, confidential, or sensitive
        # information .
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @first_join_time : Time? = nil,
          @participant_id : String? = nil,
          @published : Bool? = nil,
          @recording_state : String? = nil,
          @replication_state : String? = nil,
          @replication_type : String? = nil,
          @source_session_id : String? = nil,
          @source_stage_arn : String? = nil,
          @state : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # An object representing a configuration of thumbnails for recorded video from an individual
      # participant.
      struct ParticipantThumbnailConfiguration
        include JSON::Serializable

        # Thumbnail recording mode. Default: DISABLED .
        @[JSON::Field(key: "recordingMode")]
        getter recording_mode : String?

        # Indicates the format in which thumbnails are recorded. SEQUENTIAL records all generated thumbnails
        # in a serial manner, to the media/thumbnails/high directory. LATEST saves the latest thumbnail in
        # media/latest_thumbnail/high/thumb.jpg and overwrites it at the interval specified by
        # targetIntervalSeconds . You can enable both SEQUENTIAL and LATEST . Default: SEQUENTIAL .
        @[JSON::Field(key: "storage")]
        getter storage : Array(String)?

        # The targeted thumbnail-generation interval in seconds. This is configurable only if recordingMode is
        # INTERVAL . Default: 60.
        @[JSON::Field(key: "targetIntervalSeconds")]
        getter target_interval_seconds : Int32?

        def initialize(
          @recording_mode : String? = nil,
          @storage : Array(String)? = nil,
          @target_interval_seconds : Int32? = nil
        )
        end
      end

      # Object specifying a participant token in a stage. Important : Treat tokens as opaque; i.e., do not
      # build functionality based on token contents. The format of tokens could change in the future.
      struct ParticipantToken
        include JSON::Serializable

        # Application-provided attributes to encode into the token and attach to a stage. Map keys and values
        # can contain UTF-8 encoded text. The maximum length of this field is 1 KB total. This field is
        # exposed to all stage participants and should not be used for personally identifying, confidential,
        # or sensitive information.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Set of capabilities that the user is allowed to perform in the stage.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # Duration (in minutes), after which the participant token expires. Default: 720 (12 hours).
        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # ISO 8601 timestamp (returned as a string) for when this token expires.
        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : Time?

        # Unique identifier for this participant token, assigned by IVS.
        @[JSON::Field(key: "participantId")]
        getter participant_id : String?

        # The issued client token, encrypted.
        @[JSON::Field(key: "token")]
        getter token : String?

        # Customer-assigned name to help identify the token; this can be used to link a participant to a user
        # in the customer’s own systems. This can be any UTF-8 encoded text. This field is exposed to all
        # stage participants and should not be used for personally identifying, confidential, or sensitive
        # information.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @capabilities : Array(String)? = nil,
          @duration : Int32? = nil,
          @expiration_time : Time? = nil,
          @participant_id : String? = nil,
          @token : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Object specifying a participant token configuration in a stage.
      struct ParticipantTokenConfiguration
        include JSON::Serializable

        # Application-provided attributes to encode into the corresponding participant token and attach to a
        # stage. Map keys and values can contain UTF-8 encoded text. The maximum length of this field is 1 KB
        # total. This field is exposed to all stage participants and should not be used for personally
        # identifying, confidential, or sensitive information.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Set of capabilities that the user is allowed to perform in the stage.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # Duration (in minutes), after which the corresponding participant token expires. Default: 720 (12
        # hours).
        @[JSON::Field(key: "duration")]
        getter duration : Int32?

        # Customer-assigned name to help identify the token; this can be used to link a participant to a user
        # in the customer’s own systems. This can be any UTF-8 encoded text. This field is exposed to all
        # stage participants and should not be used for personally identifying, confidential, or sensitive
        # information.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @capabilities : Array(String)? = nil,
          @duration : Int32? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct PendingVerification
        include JSON::Serializable

        @[JSON::Field(key: "Access-Control-Allow-Origin")]
        getter access_control_allow_origin : String?

        @[JSON::Field(key: "Access-Control-Expose-Headers")]
        getter access_control_expose_headers : String?

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        @[JSON::Field(key: "Content-Security-Policy")]
        getter content_security_policy : String?

        # Your account is pending verification.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        @[JSON::Field(key: "Strict-Transport-Security")]
        getter strict_transport_security : String?

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amzn_error_type : String?

        @[JSON::Field(key: "X-Content-Type-Options")]
        getter x_content_type_options : String?

        @[JSON::Field(key: "X-Frame-Options")]
        getter x_frame_options : String?

        def initialize(
          @access_control_allow_origin : String? = nil,
          @access_control_expose_headers : String? = nil,
          @cache_control : String? = nil,
          @content_security_policy : String? = nil,
          @exception_message : String? = nil,
          @strict_transport_security : String? = nil,
          @x_amzn_error_type : String? = nil,
          @x_content_type_options : String? = nil,
          @x_frame_options : String? = nil
        )
        end
      end

      # Configuration information specific to Picture-in-Picture (PiP) layout, for server-side composition .
      struct PipConfiguration
        include JSON::Serializable

        # This attribute name identifies the featured slot. A participant with this attribute set to "true"
        # (as a string value) in ParticipantTokenConfiguration is placed in the featured slot. Default: "" (no
        # featured participant).
        @[JSON::Field(key: "featuredParticipantAttribute")]
        getter featured_participant_attribute : String?

        # Specifies the spacing between participant tiles in pixels. Default: 0 .
        @[JSON::Field(key: "gridGap")]
        getter grid_gap : Int32?

        # Determines whether to omit participants with stopped video in the composition. Default: false .
        @[JSON::Field(key: "omitStoppedVideo")]
        getter omit_stopped_video : Bool?

        # Attribute name in ParticipantTokenConfiguration identifying the participant ordering key.
        # Participants with participantOrderAttribute set to "" or not specified are ordered based on their
        # arrival time into the stage.
        @[JSON::Field(key: "participantOrderAttribute")]
        getter participant_order_attribute : String?

        # Defines PiP behavior when all participants have left: STATIC (maintains original position/size) or
        # DYNAMIC (expands to full composition). Default: STATIC .
        @[JSON::Field(key: "pipBehavior")]
        getter pip_behavior : String?

        # Specifies the height of the PiP window in pixels. When this is not set explicitly, pipHeight ’s
        # value will be based on the size of the composition and the aspect ratio of the participant’s video.
        @[JSON::Field(key: "pipHeight")]
        getter pip_height : Int32?

        # Sets the PiP window’s offset position in pixels from the closest edges determined by PipPosition .
        # Default: 0 .
        @[JSON::Field(key: "pipOffset")]
        getter pip_offset : Int32?

        # Specifies the participant for the PiP window. A participant with this attribute set to "true" (as a
        # string value) in ParticipantTokenConfiguration is placed in the PiP slot. Default: "" (no PiP
        # participant).
        @[JSON::Field(key: "pipParticipantAttribute")]
        getter pip_participant_attribute : String?

        # Determines the corner position of the PiP window. Default: BOTTOM_RIGHT .
        @[JSON::Field(key: "pipPosition")]
        getter pip_position : String?

        # Specifies the width of the PiP window in pixels. When this is not set explicitly, pipWidth ’s value
        # will be based on the size of the composition and the aspect ratio of the participant’s video.
        @[JSON::Field(key: "pipWidth")]
        getter pip_width : Int32?

        # Defines how video content fits within the participant tile: FILL (stretched), COVER (cropped), or
        # CONTAIN (letterboxed). Default: COVER .
        @[JSON::Field(key: "videoFillMode")]
        getter video_fill_mode : String?

        def initialize(
          @featured_participant_attribute : String? = nil,
          @grid_gap : Int32? = nil,
          @omit_stopped_video : Bool? = nil,
          @participant_order_attribute : String? = nil,
          @pip_behavior : String? = nil,
          @pip_height : Int32? = nil,
          @pip_offset : Int32? = nil,
          @pip_participant_attribute : String? = nil,
          @pip_position : String? = nil,
          @pip_width : Int32? = nil,
          @video_fill_mode : String? = nil
        )
        end
      end

      # Object specifying a public key used to sign stage participant tokens.
      struct PublicKey
        include JSON::Serializable

        # Public key ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The public key fingerprint, a short string used to identify or verify the full public key.
        @[JSON::Field(key: "fingerprint")]
        getter fingerprint : String?

        # Public key name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Public key material.
        @[JSON::Field(key: "publicKeyMaterial")]
        getter public_key_material : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @fingerprint : String? = nil,
          @name : String? = nil,
          @public_key_material : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about a public key.
      struct PublicKeySummary
        include JSON::Serializable

        # Public key ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Public key name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An object representing a configuration to record a stage stream.
      struct RecordingConfiguration
        include JSON::Serializable

        # The recording format for storing a recording in Amazon S3.
        @[JSON::Field(key: "format")]
        getter format : String?

        # An HLS configuration object to return information about how the recording will be configured.
        @[JSON::Field(key: "hlsConfiguration")]
        getter hls_configuration : Types::CompositionRecordingHlsConfiguration?

        def initialize(
          @format : String? = nil,
          @hls_configuration : Types::CompositionRecordingHlsConfiguration? = nil
        )
        end
      end

      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Access-Control-Allow-Origin")]
        getter access_control_allow_origin : String?

        @[JSON::Field(key: "Access-Control-Expose-Headers")]
        getter access_control_expose_headers : String?

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        @[JSON::Field(key: "Content-Security-Policy")]
        getter content_security_policy : String?

        # Request references a resource which does not exist.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        @[JSON::Field(key: "Strict-Transport-Security")]
        getter strict_transport_security : String?

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amzn_error_type : String?

        @[JSON::Field(key: "X-Content-Type-Options")]
        getter x_content_type_options : String?

        @[JSON::Field(key: "X-Frame-Options")]
        getter x_frame_options : String?

        def initialize(
          @access_control_allow_origin : String? = nil,
          @access_control_expose_headers : String? = nil,
          @cache_control : String? = nil,
          @content_security_policy : String? = nil,
          @exception_message : String? = nil,
          @strict_transport_security : String? = nil,
          @x_amzn_error_type : String? = nil,
          @x_content_type_options : String? = nil,
          @x_frame_options : String? = nil
        )
        end
      end

      # A complex type that describes an S3 location where recorded videos will be stored.
      struct S3DestinationConfiguration
        include JSON::Serializable

        # ARNs of the EncoderConfiguration resource. The encoder configuration and stage resources must be in
        # the same AWS account and region.
        @[JSON::Field(key: "encoderConfigurationArns")]
        getter encoder_configuration_arns : Array(String)

        # ARN of the StorageConfiguration where recorded videos will be stored.
        @[JSON::Field(key: "storageConfigurationArn")]
        getter storage_configuration_arn : String

        # Array of maps, each of the form string:string (key:value) . This is an optional customer
        # specification, currently used only to specify the recording format for storing a recording in Amazon
        # S3.
        @[JSON::Field(key: "recordingConfiguration")]
        getter recording_configuration : Types::RecordingConfiguration?

        # A complex type that allows you to enable/disable the recording of thumbnails for a Composition and
        # modify the interval at which thumbnails are generated for the live session.
        @[JSON::Field(key: "thumbnailConfigurations")]
        getter thumbnail_configurations : Array(Types::CompositionThumbnailConfiguration)?

        def initialize(
          @encoder_configuration_arns : Array(String),
          @storage_configuration_arn : String,
          @recording_configuration : Types::RecordingConfiguration? = nil,
          @thumbnail_configurations : Array(Types::CompositionThumbnailConfiguration)? = nil
        )
        end
      end

      # Complex data type that defines S3Detail objects.
      struct S3Detail
        include JSON::Serializable

        # The S3 bucket prefix under which the recording is stored.
        @[JSON::Field(key: "recordingPrefix")]
        getter recording_prefix : String

        def initialize(
          @recording_prefix : String
        )
        end
      end

      # A complex type that describes an S3 location where recorded videos will be stored.
      struct S3StorageConfiguration
        include JSON::Serializable

        # Location (S3 bucket name) where recorded videos will be stored. Note that the StorageConfiguration
        # and S3 bucket must be in the same region as the Composition.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        def initialize(
          @bucket_name : String
        )
        end
      end

      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Access-Control-Allow-Origin")]
        getter access_control_allow_origin : String?

        @[JSON::Field(key: "Access-Control-Expose-Headers")]
        getter access_control_expose_headers : String?

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        @[JSON::Field(key: "Content-Security-Policy")]
        getter content_security_policy : String?

        # Request would cause a service quota to be exceeded.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        @[JSON::Field(key: "Strict-Transport-Security")]
        getter strict_transport_security : String?

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amzn_error_type : String?

        @[JSON::Field(key: "X-Content-Type-Options")]
        getter x_content_type_options : String?

        @[JSON::Field(key: "X-Frame-Options")]
        getter x_frame_options : String?

        def initialize(
          @access_control_allow_origin : String? = nil,
          @access_control_expose_headers : String? = nil,
          @cache_control : String? = nil,
          @content_security_policy : String? = nil,
          @exception_message : String? = nil,
          @strict_transport_security : String? = nil,
          @x_amzn_error_type : String? = nil,
          @x_content_type_options : String? = nil,
          @x_frame_options : String? = nil
        )
        end
      end

      # Object specifying a stage.
      struct Stage
        include JSON::Serializable

        # Stage ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # ID of the active session within the stage.
        @[JSON::Field(key: "activeSessionId")]
        getter active_session_id : String?

        # Configuration object for individual participant recording, attached to the stage.
        @[JSON::Field(key: "autoParticipantRecordingConfiguration")]
        getter auto_participant_recording_configuration : Types::AutoParticipantRecordingConfiguration?

        # Summary information about various endpoints for a stage.
        @[JSON::Field(key: "endpoints")]
        getter endpoints : Types::StageEndpoints?

        # Stage name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @active_session_id : String? = nil,
          @auto_participant_recording_configuration : Types::AutoParticipantRecordingConfiguration? = nil,
          @endpoints : Types::StageEndpoints? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about various endpoints for a stage. We recommend that you cache these values at
      # stage creation; the values can be cached for up to 14 days.
      struct StageEndpoints
        include JSON::Serializable

        # Events endpoint.
        @[JSON::Field(key: "events")]
        getter events : String?

        # The endpoint to be used for IVS real-time streaming using the RTMP protocol.
        @[JSON::Field(key: "rtmp")]
        getter rtmp : String?

        # The endpoint to be used for IVS real-time streaming using the RTMPS protocol.
        @[JSON::Field(key: "rtmps")]
        getter rtmps : String?

        # The endpoint to be used for IVS real-time streaming using the WHIP protocol.
        @[JSON::Field(key: "whip")]
        getter whip : String?

        def initialize(
          @events : String? = nil,
          @rtmp : String? = nil,
          @rtmps : String? = nil,
          @whip : String? = nil
        )
        end
      end

      # A stage session begins when the first participant joins a stage and ends after the last participant
      # leaves the stage. A stage session helps with debugging stages by grouping events and participants
      # into shorter periods of time (i.e., a session), which is helpful when stages are used over long
      # periods of time.
      struct StageSession
        include JSON::Serializable

        # ISO 8601 timestamp (returned as a string) when the stage session ended. This is null if the stage is
        # active.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # ID of the session within the stage.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # ISO 8601 timestamp (returned as a string) when this stage session began.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @session_id : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Summary information about a stage session.
      struct StageSessionSummary
        include JSON::Serializable

        # ISO 8601 timestamp (returned as a string) when the stage session ended. This is null if the stage is
        # active.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # ID of the session within the stage.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # ISO 8601 timestamp (returned as a string) when this stage session began.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @session_id : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Summary information about a stage.
      struct StageSummary
        include JSON::Serializable

        # Stage ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # ID of the active session within the stage.
        @[JSON::Field(key: "activeSessionId")]
        getter active_session_id : String?

        # Stage name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @active_session_id : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartCompositionRequest
        include JSON::Serializable

        # Array of destination configuration.
        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::DestinationConfiguration)

        # ARN of the stage to be used for compositing.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String

        # Idempotency token.
        @[JSON::Field(key: "idempotencyToken")]
        getter idempotency_token : String?

        # Layout object to configure composition parameters.
        @[JSON::Field(key: "layout")]
        getter layout : Types::LayoutConfiguration?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destinations : Array(Types::DestinationConfiguration),
          @stage_arn : String,
          @idempotency_token : String? = nil,
          @layout : Types::LayoutConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartCompositionResponse
        include JSON::Serializable

        # The Composition that was created.
        @[JSON::Field(key: "composition")]
        getter composition : Types::Composition?

        def initialize(
          @composition : Types::Composition? = nil
        )
        end
      end

      struct StartParticipantReplicationRequest
        include JSON::Serializable

        # ARN of the stage to which the participant will be replicated.
        @[JSON::Field(key: "destinationStageArn")]
        getter destination_stage_arn : String

        # Participant ID of the publisher that will be replicated. This is assigned by IVS and returned by
        # CreateParticipantToken or the jti (JWT ID) used to create a self signed token .
        @[JSON::Field(key: "participantId")]
        getter participant_id : String

        # ARN of the stage where the participant is publishing.
        @[JSON::Field(key: "sourceStageArn")]
        getter source_stage_arn : String

        # Application-provided attributes to set on the replicated participant in the destination stage. Map
        # keys and values can contain UTF-8 encoded text. The maximum length of this field is 1 KB total. This
        # field is exposed to all stage participants and should not be used for personally identifying,
        # confidential, or sensitive information. These attributes are merged with any attributes set for this
        # participant when creating the token. If there is overlap in keys, the values in these attributes are
        # replaced.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # If the participant disconnects and then reconnects within the specified interval, replication will
        # continue to be ACTIVE . Default: 0.
        @[JSON::Field(key: "reconnectWindowSeconds")]
        getter reconnect_window_seconds : Int32?

        def initialize(
          @destination_stage_arn : String,
          @participant_id : String,
          @source_stage_arn : String,
          @attributes : Hash(String, String)? = nil,
          @reconnect_window_seconds : Int32? = nil
        )
        end
      end

      struct StartParticipantReplicationResponse
        include JSON::Serializable

        @[JSON::Field(key: "Access-Control-Allow-Origin")]
        getter access_control_allow_origin : String?

        @[JSON::Field(key: "Access-Control-Expose-Headers")]
        getter access_control_expose_headers : String?

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        @[JSON::Field(key: "Content-Security-Policy")]
        getter content_security_policy : String?

        @[JSON::Field(key: "Strict-Transport-Security")]
        getter strict_transport_security : String?

        @[JSON::Field(key: "X-Content-Type-Options")]
        getter x_content_type_options : String?

        @[JSON::Field(key: "X-Frame-Options")]
        getter x_frame_options : String?

        def initialize(
          @access_control_allow_origin : String? = nil,
          @access_control_expose_headers : String? = nil,
          @cache_control : String? = nil,
          @content_security_policy : String? = nil,
          @strict_transport_security : String? = nil,
          @x_content_type_options : String? = nil,
          @x_frame_options : String? = nil
        )
        end
      end

      struct StopCompositionRequest
        include JSON::Serializable

        # ARN of the Composition.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct StopCompositionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct StopParticipantReplicationRequest
        include JSON::Serializable

        # ARN of the stage where the participant has been replicated.
        @[JSON::Field(key: "destinationStageArn")]
        getter destination_stage_arn : String

        # Participant ID of the publisher that has been replicated. This is assigned by IVS and returned by
        # CreateParticipantToken or the jti (JWT ID) used to create a self signed token .
        @[JSON::Field(key: "participantId")]
        getter participant_id : String

        # ARN of the stage where the participant is publishing.
        @[JSON::Field(key: "sourceStageArn")]
        getter source_stage_arn : String

        def initialize(
          @destination_stage_arn : String,
          @participant_id : String,
          @source_stage_arn : String
        )
        end
      end

      struct StopParticipantReplicationResponse
        include JSON::Serializable

        @[JSON::Field(key: "Access-Control-Allow-Origin")]
        getter access_control_allow_origin : String?

        @[JSON::Field(key: "Access-Control-Expose-Headers")]
        getter access_control_expose_headers : String?

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        @[JSON::Field(key: "Content-Security-Policy")]
        getter content_security_policy : String?

        @[JSON::Field(key: "Strict-Transport-Security")]
        getter strict_transport_security : String?

        @[JSON::Field(key: "X-Content-Type-Options")]
        getter x_content_type_options : String?

        @[JSON::Field(key: "X-Frame-Options")]
        getter x_frame_options : String?

        def initialize(
          @access_control_allow_origin : String? = nil,
          @access_control_expose_headers : String? = nil,
          @cache_control : String? = nil,
          @content_security_policy : String? = nil,
          @strict_transport_security : String? = nil,
          @x_content_type_options : String? = nil,
          @x_frame_options : String? = nil
        )
        end
      end

      # A complex type that describes a location where recorded videos will be stored.
      struct StorageConfiguration
        include JSON::Serializable

        # ARN of the storage configuration.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Name of the storage configuration.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An S3 destination configuration where recorded videos will be stored.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3StorageConfiguration?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @name : String? = nil,
          @s3 : Types::S3StorageConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about a storage configuration.
      struct StorageConfigurationSummary
        include JSON::Serializable

        # ARN of the storage configuration.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Name of the storage configuration.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An S3 destination configuration where recorded videos will be stored.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3StorageConfiguration?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging AWS Resources and Tag Editor for details, including restrictions
        # that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
        # beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @name : String? = nil,
          @s3 : Types::S3StorageConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to be tagged. The ARN must be URL-encoded.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Array of tags to be added or updated. Array of maps, each of the form string:string (key:value) .
        # See Best practices and strategies in Tagging AWS Resources and Tag Editor for details, including
        # restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no
        # constraints on tags beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to be untagged. The ARN must be URL-encoded.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Array of tag keys (strings) for the tags to be removed. See Best practices and strategies in Tagging
        # AWS Resources and Tag Editor for details, including restrictions that apply to tags and "Tag naming
        # limits and requirements"; Amazon IVS has no constraints on tags beyond what is documented there.
        @[JSON::Field(key: "tagKeys")]
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

      struct UpdateIngestConfigurationRequest
        include JSON::Serializable

        # ARN of the IngestConfiguration, for which the related stage ARN needs to be updated.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Stage ARN that needs to be updated.
        @[JSON::Field(key: "stageArn")]
        getter stage_arn : String?

        def initialize(
          @arn : String,
          @stage_arn : String? = nil
        )
        end
      end

      struct UpdateIngestConfigurationResponse
        include JSON::Serializable

        # The updated IngestConfiguration.
        @[JSON::Field(key: "ingestConfiguration")]
        getter ingest_configuration : Types::IngestConfiguration?

        def initialize(
          @ingest_configuration : Types::IngestConfiguration? = nil
        )
        end
      end

      struct UpdateStageRequest
        include JSON::Serializable

        # ARN of the stage to be updated.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Configuration object for individual participant recording, to attach to the stage. Note that this
        # cannot be updated while recording is active.
        @[JSON::Field(key: "autoParticipantRecordingConfiguration")]
        getter auto_participant_recording_configuration : Types::AutoParticipantRecordingConfiguration?

        # Name of the stage to be updated.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @auto_participant_recording_configuration : Types::AutoParticipantRecordingConfiguration? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateStageResponse
        include JSON::Serializable

        # The updated stage.
        @[JSON::Field(key: "stage")]
        getter stage : Types::Stage?

        def initialize(
          @stage : Types::Stage? = nil
        )
        end
      end

      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Access-Control-Allow-Origin")]
        getter access_control_allow_origin : String?

        @[JSON::Field(key: "Access-Control-Expose-Headers")]
        getter access_control_expose_headers : String?

        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        @[JSON::Field(key: "Content-Security-Policy")]
        getter content_security_policy : String?

        # The input fails to satisfy the constraints specified by an Amazon Web Services service.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        @[JSON::Field(key: "Strict-Transport-Security")]
        getter strict_transport_security : String?

        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amzn_error_type : String?

        @[JSON::Field(key: "X-Content-Type-Options")]
        getter x_content_type_options : String?

        @[JSON::Field(key: "X-Frame-Options")]
        getter x_frame_options : String?

        def initialize(
          @access_control_allow_origin : String? = nil,
          @access_control_expose_headers : String? = nil,
          @cache_control : String? = nil,
          @content_security_policy : String? = nil,
          @exception_message : String? = nil,
          @strict_transport_security : String? = nil,
          @x_amzn_error_type : String? = nil,
          @x_content_type_options : String? = nil,
          @x_frame_options : String? = nil
        )
        end
      end

      # Settings for video.
      struct Video
        include JSON::Serializable

        # Bitrate for generated output, in bps. Default: 2500000.
        @[JSON::Field(key: "bitrate")]
        getter bitrate : Int32?

        # Video frame rate, in fps. Default: 30.
        @[JSON::Field(key: "framerate")]
        getter framerate : Float64?

        # Video-resolution height. This must be an even number. Note that the maximum value is determined by
        # width times height , such that the maximum total pixels is 2073600 (1920x1080 or 1080x1920).
        # Default: 720.
        @[JSON::Field(key: "height")]
        getter height : Int32?

        # Video-resolution width. This must be an even number. Note that the maximum value is determined by
        # width times height , such that the maximum total pixels is 2073600 (1920x1080 or 1080x1920).
        # Default: 1280.
        @[JSON::Field(key: "width")]
        getter width : Int32?

        def initialize(
          @bitrate : Int32? = nil,
          @framerate : Float64? = nil,
          @height : Int32? = nil,
          @width : Int32? = nil
        )
        end
      end
    end
  end
end
