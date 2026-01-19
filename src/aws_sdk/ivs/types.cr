require "json"
require "time"

module AwsSdk
  module Ivs
    module Types

      struct AccessDeniedException
        include JSON::Serializable

        # User does not have sufficient access to perform this action.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      # Object specifying a stream’s audio configuration, as set up by the broadcaster (usually in an
      # encoder). This is part of the IngestConfigurations object and the deprecated IngestConfiguration
      # object. It is used for monitoring stream health.
      struct AudioConfiguration
        include JSON::Serializable

        # Number of audio channels.
        @[JSON::Field(key: "channels")]
        getter channels : Int64?

        # Codec used for the audio encoding.
        @[JSON::Field(key: "codec")]
        getter codec : String?

        # Number of audio samples recorded per second.
        @[JSON::Field(key: "sampleRate")]
        getter sample_rate : Int64?

        # The expected ingest bitrate (bits per second). This is configured in the encoder.
        @[JSON::Field(key: "targetBitrate")]
        getter target_bitrate : Int64?

        # Name of the audio track (if the stream has an audio track). If multitrack is not enabled, this is
        # track0 (the sole track).
        @[JSON::Field(key: "track")]
        getter track : String?

        def initialize(
          @channels : Int64? = nil,
          @codec : String? = nil,
          @sample_rate : Int64? = nil,
          @target_bitrate : Int64? = nil,
          @track : String? = nil
        )
        end
      end

      # Error related to a specific channel, specified by its ARN.
      struct BatchError
        include JSON::Serializable

        # ARN of an IVS resource; e.g., channel.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Error code.
        @[JSON::Field(key: "code")]
        getter code : String?

        # Error message, determined by the application.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @arn : String? = nil,
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct BatchGetChannelRequest
        include JSON::Serializable

        # Array of ARNs, one per channel.
        @[JSON::Field(key: "arns")]
        getter arns : Array(String)

        def initialize(
          @arns : Array(String)
        )
        end
      end

      struct BatchGetChannelResponse
        include JSON::Serializable

        @[JSON::Field(key: "channels")]
        getter channels : Array(Types::Channel)?

        # Each error object is related to a specific ARN in the request.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchError)?

        def initialize(
          @channels : Array(Types::Channel)? = nil,
          @errors : Array(Types::BatchError)? = nil
        )
        end
      end

      struct BatchGetStreamKeyRequest
        include JSON::Serializable

        # Array of ARNs, one per stream key.
        @[JSON::Field(key: "arns")]
        getter arns : Array(String)

        def initialize(
          @arns : Array(String)
        )
        end
      end

      struct BatchGetStreamKeyResponse
        include JSON::Serializable

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchError)?

        @[JSON::Field(key: "streamKeys")]
        getter stream_keys : Array(Types::StreamKey)?

        def initialize(
          @errors : Array(Types::BatchError)? = nil,
          @stream_keys : Array(Types::StreamKey)? = nil
        )
        end
      end

      # Error for a request in the batch for BatchStartViewerSessionRevocation. Each error is related to a
      # specific channel-ARN and viewer-ID pair.
      struct BatchStartViewerSessionRevocationError
        include JSON::Serializable

        # Channel ARN.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ID of the viewer session to revoke.
        @[JSON::Field(key: "viewerId")]
        getter viewer_id : String

        # Error code.
        @[JSON::Field(key: "code")]
        getter code : String?

        # Error message, determined by the application.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @channel_arn : String,
          @viewer_id : String,
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct BatchStartViewerSessionRevocationRequest
        include JSON::Serializable

        # Array of viewer sessions, one per channel-ARN and viewer-ID pair.
        @[JSON::Field(key: "viewerSessions")]
        getter viewer_sessions : Array(Types::BatchStartViewerSessionRevocationViewerSession)

        def initialize(
          @viewer_sessions : Array(Types::BatchStartViewerSessionRevocationViewerSession)
        )
        end
      end

      struct BatchStartViewerSessionRevocationResponse
        include JSON::Serializable

        # Each error object is related to a specific channelArn and viewerId pair in the request.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchStartViewerSessionRevocationError)?

        def initialize(
          @errors : Array(Types::BatchStartViewerSessionRevocationError)? = nil
        )
        end
      end

      # A viewer session to revoke in the call to BatchStartViewerSessionRevocation .
      struct BatchStartViewerSessionRevocationViewerSession
        include JSON::Serializable

        # The ARN of the channel associated with the viewer session to revoke.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ID of the viewer associated with the viewer session to revoke. Do not use this field for
        # personally identifying, confidential, or sensitive information.
        @[JSON::Field(key: "viewerId")]
        getter viewer_id : String

        # An optional filter on which versions of the viewer session to revoke. All versions less than or
        # equal to the specified version will be revoked. Default: 0.
        @[JSON::Field(key: "viewerSessionVersionsLessThanOrEqualTo")]
        getter viewer_session_versions_less_than_or_equal_to : Int32?

        def initialize(
          @channel_arn : String,
          @viewer_id : String,
          @viewer_session_versions_less_than_or_equal_to : Int32? = nil
        )
        end
      end

      # Object specifying a channel.
      struct Channel
        include JSON::Serializable

        # Channel ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Whether the channel is private (enabled for playback authorization). Default: false .
        @[JSON::Field(key: "authorized")]
        getter authorized : Bool?

        # Indicates which content-packaging format is used (MPEG-TS or fMP4). If multitrackInputConfiguration
        # is specified and enabled is true , then containerFormat is required and must be set to
        # FRAGMENTED_MP4 . Otherwise, containerFormat may be set to TS or FRAGMENTED_MP4 . Default: TS .
        @[JSON::Field(key: "containerFormat")]
        getter container_format : String?

        # Channel ingest endpoint, part of the definition of an ingest server, used when you set up streaming
        # software.
        @[JSON::Field(key: "ingestEndpoint")]
        getter ingest_endpoint : String?

        # Whether the channel allows insecure RTMP ingest. Default: false .
        @[JSON::Field(key: "insecureIngest")]
        getter insecure_ingest : Bool?

        # Channel latency mode. Use NORMAL to broadcast and deliver live video up to Full HD. Use LOW for
        # near-real-time interaction with viewers. Default: LOW .
        @[JSON::Field(key: "latencyMode")]
        getter latency_mode : String?

        # Object specifying multitrack input configuration. Default: no multitrack input configuration is
        # specified.
        @[JSON::Field(key: "multitrackInputConfiguration")]
        getter multitrack_input_configuration : Types::MultitrackInputConfiguration?

        # Channel name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Playback-restriction-policy ARN. A valid ARN value here both specifies the ARN and enables playback
        # restriction. Default: "" (empty string, no playback restriction policy is applied).
        @[JSON::Field(key: "playbackRestrictionPolicyArn")]
        getter playback_restriction_policy_arn : String?

        # Channel playback URL.
        @[JSON::Field(key: "playbackUrl")]
        getter playback_url : String?

        # Optional transcode preset for the channel. This is selectable only for ADVANCED_HD and ADVANCED_SD
        # channel types. For those channel types, the default preset is HIGHER_BANDWIDTH_DELIVERY . For other
        # channel types ( BASIC and STANDARD ), preset is the empty string ( "" ).
        @[JSON::Field(key: "preset")]
        getter preset : String?

        # Recording-configuration ARN. A valid ARN value here both specifies the ARN and enables recording.
        # Default: "" (empty string, recording is disabled).
        @[JSON::Field(key: "recordingConfigurationArn")]
        getter recording_configuration_arn : String?

        # Specifies the endpoint and optional passphrase for streaming with the SRT protocol.
        @[JSON::Field(key: "srt")]
        getter srt : Types::Srt?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Channel type, which determines the allowable resolution and bitrate. If you exceed the allowable
        # input resolution or bitrate, the stream probably will disconnect immediately. Default: STANDARD .
        # For details, see Channel Types .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @authorized : Bool? = nil,
          @container_format : String? = nil,
          @ingest_endpoint : String? = nil,
          @insecure_ingest : Bool? = nil,
          @latency_mode : String? = nil,
          @multitrack_input_configuration : Types::MultitrackInputConfiguration? = nil,
          @name : String? = nil,
          @playback_restriction_policy_arn : String? = nil,
          @playback_url : String? = nil,
          @preset : String? = nil,
          @recording_configuration_arn : String? = nil,
          @srt : Types::Srt? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      struct ChannelNotBroadcasting
        include JSON::Serializable

        # The stream is offline for the given channel ARN.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      # Summary information about a channel.
      struct ChannelSummary
        include JSON::Serializable

        # Channel ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Whether the channel is private (enabled for playback authorization). Default: false .
        @[JSON::Field(key: "authorized")]
        getter authorized : Bool?

        # Whether the channel allows insecure RTMP ingest. Default: false .
        @[JSON::Field(key: "insecureIngest")]
        getter insecure_ingest : Bool?

        # Channel latency mode. Use NORMAL to broadcast and deliver live video up to Full HD. Use LOW for
        # near-real-time interaction with viewers. Default: LOW .
        @[JSON::Field(key: "latencyMode")]
        getter latency_mode : String?

        # Channel name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Playback-restriction-policy ARN. A valid ARN value here both specifies the ARN and enables playback
        # restriction. Default: "" (empty string, no playback restriction policy is applied).
        @[JSON::Field(key: "playbackRestrictionPolicyArn")]
        getter playback_restriction_policy_arn : String?

        # Optional transcode preset for the channel. This is selectable only for ADVANCED_HD and ADVANCED_SD
        # channel types. For those channel types, the default preset is HIGHER_BANDWIDTH_DELIVERY . For other
        # channel types ( BASIC and STANDARD ), preset is the empty string ( "" ).
        @[JSON::Field(key: "preset")]
        getter preset : String?

        # Recording-configuration ARN. A valid ARN value here both specifies the ARN and enables recording.
        # Default: "" (empty string, recording is disabled).
        @[JSON::Field(key: "recordingConfigurationArn")]
        getter recording_configuration_arn : String?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Channel type, which determines the allowable resolution and bitrate. If you exceed the allowable
        # input resolution or bitrate, the stream probably will disconnect immediately. Default: STANDARD .
        # For details, see Channel Types .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @authorized : Bool? = nil,
          @insecure_ingest : Bool? = nil,
          @latency_mode : String? = nil,
          @name : String? = nil,
          @playback_restriction_policy_arn : String? = nil,
          @preset : String? = nil,
          @recording_configuration_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      struct ConflictException
        include JSON::Serializable

        # Updating or deleting a resource can cause an inconsistent state.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      struct CreateChannelRequest
        include JSON::Serializable

        # Whether the channel is private (enabled for playback authorization). Default: false .
        @[JSON::Field(key: "authorized")]
        getter authorized : Bool?

        # Indicates which content-packaging format is used (MPEG-TS or fMP4). If multitrackInputConfiguration
        # is specified and enabled is true , then containerFormat is required and must be set to
        # FRAGMENTED_MP4 . Otherwise, containerFormat may be set to TS or FRAGMENTED_MP4 . Default: TS .
        @[JSON::Field(key: "containerFormat")]
        getter container_format : String?

        # Whether the channel allows insecure RTMP and SRT ingest. Default: false .
        @[JSON::Field(key: "insecureIngest")]
        getter insecure_ingest : Bool?

        # Channel latency mode. Use NORMAL to broadcast and deliver live video up to Full HD. Use LOW for
        # near-real-time interaction with viewers. Default: LOW .
        @[JSON::Field(key: "latencyMode")]
        getter latency_mode : String?

        # Object specifying multitrack input configuration. Default: no multitrack input configuration is
        # specified.
        @[JSON::Field(key: "multitrackInputConfiguration")]
        getter multitrack_input_configuration : Types::MultitrackInputConfiguration?

        # Channel name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Playback-restriction-policy ARN. A valid ARN value here both specifies the ARN and enables playback
        # restriction. Default: "" (empty string, no playback restriction policy is applied).
        @[JSON::Field(key: "playbackRestrictionPolicyArn")]
        getter playback_restriction_policy_arn : String?

        # Optional transcode preset for the channel. This is selectable only for ADVANCED_HD and ADVANCED_SD
        # channel types. For those channel types, the default preset is HIGHER_BANDWIDTH_DELIVERY . For other
        # channel types ( BASIC and STANDARD ), preset is the empty string ( "" ).
        @[JSON::Field(key: "preset")]
        getter preset : String?

        # Recording-configuration ARN. A valid ARN value here both specifies the ARN and enables recording.
        # Default: "" (empty string, recording is disabled).
        @[JSON::Field(key: "recordingConfigurationArn")]
        getter recording_configuration_arn : String?

        # Array of 1-50 maps, each of the form string:string (key:value) . See Best practices and strategies
        # in Tagging Amazon Web Services Resources and Tag Editor for details, including restrictions that
        # apply to tags and "Tag naming limits and requirements"; Amazon IVS has no service-specific
        # constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Channel type, which determines the allowable resolution and bitrate. If you exceed the allowable
        # input resolution or bitrate, the stream probably will disconnect immediately. Default: STANDARD .
        # For details, see Channel Types .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @authorized : Bool? = nil,
          @container_format : String? = nil,
          @insecure_ingest : Bool? = nil,
          @latency_mode : String? = nil,
          @multitrack_input_configuration : Types::MultitrackInputConfiguration? = nil,
          @name : String? = nil,
          @playback_restriction_policy_arn : String? = nil,
          @preset : String? = nil,
          @recording_configuration_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      struct CreateChannelResponse
        include JSON::Serializable

        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        @[JSON::Field(key: "streamKey")]
        getter stream_key : Types::StreamKey?

        def initialize(
          @channel : Types::Channel? = nil,
          @stream_key : Types::StreamKey? = nil
        )
        end
      end

      struct CreatePlaybackRestrictionPolicyRequest
        include JSON::Serializable

        # A list of country codes that control geoblocking restriction. Allowed values are the officially
        # assigned ISO 3166-1 alpha-2 codes. Default: All countries (an empty array).
        @[JSON::Field(key: "allowedCountries")]
        getter allowed_countries : Array(String)?

        # A list of origin sites that control CORS restriction. Allowed values are the same as valid values of
        # the Origin header defined at https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin .
        # Default: All origins (an empty array).
        @[JSON::Field(key: "allowedOrigins")]
        getter allowed_origins : Array(String)?

        # Whether channel playback is constrained by origin site. Default: false .
        @[JSON::Field(key: "enableStrictOriginEnforcement")]
        getter enable_strict_origin_enforcement : Bool?

        # Playback-restriction-policy name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Array of 1-50 maps, each of the form string:string (key:value) . See Best practices and strategies
        # in Tagging Amazon Web Services Resources and Tag Editor for details, including restrictions that
        # apply to tags and "Tag naming limits and requirements"; Amazon IVS has no service-specific
        # constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @allowed_countries : Array(String)? = nil,
          @allowed_origins : Array(String)? = nil,
          @enable_strict_origin_enforcement : Bool? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreatePlaybackRestrictionPolicyResponse
        include JSON::Serializable

        @[JSON::Field(key: "playbackRestrictionPolicy")]
        getter playback_restriction_policy : Types::PlaybackRestrictionPolicy?

        def initialize(
          @playback_restriction_policy : Types::PlaybackRestrictionPolicy? = nil
        )
        end
      end

      struct CreateRecordingConfigurationRequest
        include JSON::Serializable

        # A complex type that contains a destination configuration for where recorded video will be stored.
        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration

        # Recording-configuration name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # If a broadcast disconnects and then reconnects within the specified interval, the multiple streams
        # will be considered a single broadcast and merged together. Default: 0.
        @[JSON::Field(key: "recordingReconnectWindowSeconds")]
        getter recording_reconnect_window_seconds : Int32?

        # Object that describes which renditions should be recorded for a stream.
        @[JSON::Field(key: "renditionConfiguration")]
        getter rendition_configuration : Types::RenditionConfiguration?

        # Array of 1-50 maps, each of the form string:string (key:value) . See Best practices and strategies
        # in Tagging Amazon Web Services Resources and Tag Editor for details, including restrictions that
        # apply to tags and "Tag naming limits and requirements"; Amazon IVS has no service-specific
        # constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A complex type that allows you to enable/disable the recording of thumbnails for a live session and
        # modify the interval at which thumbnails are generated for the live session.
        @[JSON::Field(key: "thumbnailConfiguration")]
        getter thumbnail_configuration : Types::ThumbnailConfiguration?

        def initialize(
          @destination_configuration : Types::DestinationConfiguration,
          @name : String? = nil,
          @recording_reconnect_window_seconds : Int32? = nil,
          @rendition_configuration : Types::RenditionConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @thumbnail_configuration : Types::ThumbnailConfiguration? = nil
        )
        end
      end

      struct CreateRecordingConfigurationResponse
        include JSON::Serializable

        @[JSON::Field(key: "recordingConfiguration")]
        getter recording_configuration : Types::RecordingConfiguration?

        def initialize(
          @recording_configuration : Types::RecordingConfiguration? = nil
        )
        end
      end

      struct CreateStreamKeyRequest
        include JSON::Serializable

        # ARN of the channel for which to create the stream key.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # Array of 1-50 maps, each of the form string:string (key:value) . See Best practices and strategies
        # in Tagging Amazon Web Services Resources and Tag Editor for details, including restrictions that
        # apply to tags and "Tag naming limits and requirements"; Amazon IVS has no service-specific
        # constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @channel_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateStreamKeyResponse
        include JSON::Serializable

        # Stream key used to authenticate an RTMPS stream for ingestion.
        @[JSON::Field(key: "streamKey")]
        getter stream_key : Types::StreamKey?

        def initialize(
          @stream_key : Types::StreamKey? = nil
        )
        end
      end

      struct DeleteChannelRequest
        include JSON::Serializable

        # ARN of the channel to be deleted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeletePlaybackKeyPairRequest
        include JSON::Serializable

        # ARN of the key pair to be deleted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeletePlaybackKeyPairResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeletePlaybackRestrictionPolicyRequest
        include JSON::Serializable

        # ARN of the playback restriction policy to be deleted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteRecordingConfigurationRequest
        include JSON::Serializable

        # ARN of the recording configuration to be deleted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteStreamKeyRequest
        include JSON::Serializable

        # ARN of the stream key to be deleted.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # A complex type that describes a location where recorded videos will be stored. Each member
      # represents a type of destination configuration. For recording, you define one and only one type of
      # destination configuration.
      struct DestinationConfiguration
        include JSON::Serializable

        # An S3 destination configuration where recorded videos will be stored.
        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3DestinationConfiguration?

        def initialize(
          @s3 : Types::S3DestinationConfiguration? = nil
        )
        end
      end

      struct GetChannelRequest
        include JSON::Serializable

        # ARN of the channel for which the configuration is to be retrieved.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetChannelResponse
        include JSON::Serializable

        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        def initialize(
          @channel : Types::Channel? = nil
        )
        end
      end

      struct GetPlaybackKeyPairRequest
        include JSON::Serializable

        # ARN of the key pair to be returned.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetPlaybackKeyPairResponse
        include JSON::Serializable

        @[JSON::Field(key: "keyPair")]
        getter key_pair : Types::PlaybackKeyPair?

        def initialize(
          @key_pair : Types::PlaybackKeyPair? = nil
        )
        end
      end

      struct GetPlaybackRestrictionPolicyRequest
        include JSON::Serializable

        # ARN of the playback restriction policy to be returned.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetPlaybackRestrictionPolicyResponse
        include JSON::Serializable

        @[JSON::Field(key: "playbackRestrictionPolicy")]
        getter playback_restriction_policy : Types::PlaybackRestrictionPolicy?

        def initialize(
          @playback_restriction_policy : Types::PlaybackRestrictionPolicy? = nil
        )
        end
      end

      struct GetRecordingConfigurationRequest
        include JSON::Serializable

        # ARN of the recording configuration to be retrieved.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetRecordingConfigurationResponse
        include JSON::Serializable

        @[JSON::Field(key: "recordingConfiguration")]
        getter recording_configuration : Types::RecordingConfiguration?

        def initialize(
          @recording_configuration : Types::RecordingConfiguration? = nil
        )
        end
      end

      struct GetStreamKeyRequest
        include JSON::Serializable

        # ARN for the stream key to be retrieved.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetStreamKeyResponse
        include JSON::Serializable

        @[JSON::Field(key: "streamKey")]
        getter stream_key : Types::StreamKey?

        def initialize(
          @stream_key : Types::StreamKey? = nil
        )
        end
      end

      struct GetStreamRequest
        include JSON::Serializable

        # Channel ARN for stream to be accessed.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        def initialize(
          @channel_arn : String
        )
        end
      end

      struct GetStreamResponse
        include JSON::Serializable

        @[JSON::Field(key: "stream")]
        getter stream : Types::Stream?

        def initialize(
          @stream : Types::Stream? = nil
        )
        end
      end

      struct GetStreamSessionRequest
        include JSON::Serializable

        # ARN of the channel resource
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # Unique identifier for a live or previously live stream in the specified channel. If no streamId is
        # provided, this returns the most recent stream session for the channel, if it exists.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        def initialize(
          @channel_arn : String,
          @stream_id : String? = nil
        )
        end
      end

      struct GetStreamSessionResponse
        include JSON::Serializable

        # List of stream details.
        @[JSON::Field(key: "streamSession")]
        getter stream_session : Types::StreamSession?

        def initialize(
          @stream_session : Types::StreamSession? = nil
        )
        end
      end

      struct ImportPlaybackKeyPairRequest
        include JSON::Serializable

        # The public portion of a customer-generated key pair.
        @[JSON::Field(key: "publicKeyMaterial")]
        getter public_key_material : String

        # Playback-key-pair name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Any tags provided with the request are added to the playback key pair tags. See Best practices and
        # strategies in Tagging Amazon Web Services Resources and Tag Editor for details, including
        # restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has no
        # service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @public_key_material : String,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ImportPlaybackKeyPairResponse
        include JSON::Serializable

        @[JSON::Field(key: "keyPair")]
        getter key_pair : Types::PlaybackKeyPair?

        def initialize(
          @key_pair : Types::PlaybackKeyPair? = nil
        )
        end
      end

      # Object specifying the ingest configuration set up by the broadcaster, usually in an encoder. Note:
      # IngestConfiguration is deprecated in favor of IngestConfigurations but retained to ensure backward
      # compatibility. If multitrack is not enabled, IngestConfiguration and IngestConfigurations contain
      # the same data, namely information about track0 (the sole track). If multitrack is enabled,
      # IngestConfiguration contains data for only the first track (track0) and IngestConfigurations
      # contains data for all tracks.
      struct IngestConfiguration
        include JSON::Serializable

        # Encoder settings for audio.
        @[JSON::Field(key: "audio")]
        getter audio : Types::AudioConfiguration?

        # Encoder settings for video.
        @[JSON::Field(key: "video")]
        getter video : Types::VideoConfiguration?

        def initialize(
          @audio : Types::AudioConfiguration? = nil,
          @video : Types::VideoConfiguration? = nil
        )
        end
      end

      # Object specifying the ingest configuration set up by the broadcaster, usually in an encoder. Note:
      # Use IngestConfigurations instead of IngestConfiguration (which is deprecated). If multitrack is not
      # enabled, IngestConfiguration and IngestConfigurations contain the same data, namely information
      # about track0 (the sole track). If multitrack is enabled, IngestConfiguration contains data for only
      # the first track (track0) and IngestConfigurations contains data for all tracks.
      struct IngestConfigurations
        include JSON::Serializable

        # Encoder settings for audio.
        @[JSON::Field(key: "audioConfigurations")]
        getter audio_configurations : Array(Types::AudioConfiguration)

        # Encoder settings for video
        @[JSON::Field(key: "videoConfigurations")]
        getter video_configurations : Array(Types::VideoConfiguration)

        def initialize(
          @audio_configurations : Array(Types::AudioConfiguration),
          @video_configurations : Array(Types::VideoConfiguration)
        )
        end
      end

      struct InternalServerException
        include JSON::Serializable

        # Unexpected error during processing of request.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      struct ListChannelsRequest
        include JSON::Serializable

        # Filters the channel list to match the specified name.
        @[JSON::Field(key: "filterByName")]
        getter filter_by_name : String?

        # Filters the channel list to match the specified policy.
        @[JSON::Field(key: "filterByPlaybackRestrictionPolicyArn")]
        getter filter_by_playback_restriction_policy_arn : String?

        # Filters the channel list to match the specified recording-configuration ARN.
        @[JSON::Field(key: "filterByRecordingConfigurationArn")]
        getter filter_by_recording_configuration_arn : String?

        # Maximum number of channels to return. Default: 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first channel to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_by_name : String? = nil,
          @filter_by_playback_restriction_policy_arn : String? = nil,
          @filter_by_recording_configuration_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelsResponse
        include JSON::Serializable

        # List of the matching channels.
        @[JSON::Field(key: "channels")]
        getter channels : Array(Types::ChannelSummary)

        # If there are more channels than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::ChannelSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListPlaybackKeyPairsRequest
        include JSON::Serializable

        # Maximum number of key pairs to return. Default: your service quota or 100, whichever is smaller.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first key pair to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPlaybackKeyPairsResponse
        include JSON::Serializable

        # List of key pairs.
        @[JSON::Field(key: "keyPairs")]
        getter key_pairs : Array(Types::PlaybackKeyPairSummary)

        # If there are more key pairs than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @key_pairs : Array(Types::PlaybackKeyPairSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListPlaybackRestrictionPoliciesRequest
        include JSON::Serializable

        # Maximum number of policies to return. Default: 1.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first policy to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPlaybackRestrictionPoliciesResponse
        include JSON::Serializable

        # List of the matching policies.
        @[JSON::Field(key: "playbackRestrictionPolicies")]
        getter playback_restriction_policies : Array(Types::PlaybackRestrictionPolicySummary)

        # If there are more channels than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @playback_restriction_policies : Array(Types::PlaybackRestrictionPolicySummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListRecordingConfigurationsRequest
        include JSON::Serializable

        # Maximum number of recording configurations to return. Default: your service quota or 100, whichever
        # is smaller.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first recording configuration to retrieve. This is used for pagination; see the nextToken
        # response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRecordingConfigurationsResponse
        include JSON::Serializable

        # List of the matching recording configurations.
        @[JSON::Field(key: "recordingConfigurations")]
        getter recording_configurations : Array(Types::RecordingConfigurationSummary)

        # If there are more recording configurations than maxResults , use nextToken in the request to get the
        # next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @recording_configurations : Array(Types::RecordingConfigurationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListStreamKeysRequest
        include JSON::Serializable

        # Channel ARN used to filter the list.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # Maximum number of streamKeys to return. Default: 1.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first stream key to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStreamKeysResponse
        include JSON::Serializable

        # List of stream keys.
        @[JSON::Field(key: "streamKeys")]
        getter stream_keys : Array(Types::StreamKeySummary)

        # If there are more stream keys than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @stream_keys : Array(Types::StreamKeySummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListStreamSessionsRequest
        include JSON::Serializable

        # Channel ARN used to filter the list.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # Maximum number of streams to return. Default: 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first stream to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStreamSessionsResponse
        include JSON::Serializable

        # List of stream sessions.
        @[JSON::Field(key: "streamSessions")]
        getter stream_sessions : Array(Types::StreamSessionSummary)

        # If there are more streams than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @stream_sessions : Array(Types::StreamSessionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListStreamsRequest
        include JSON::Serializable

        # Filters the stream list to match the specified criterion.
        @[JSON::Field(key: "filterBy")]
        getter filter_by : Types::StreamFilters?

        # Maximum number of streams to return. Default: 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first stream to retrieve. This is used for pagination; see the nextToken response field.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_by : Types::StreamFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStreamsResponse
        include JSON::Serializable

        # List of streams.
        @[JSON::Field(key: "streams")]
        getter streams : Array(Types::StreamSummary)

        # If there are more streams than maxResults , use nextToken in the request to get the next set.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @streams : Array(Types::StreamSummary),
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

      # A complex type that specifies multitrack input configuration.
      struct MultitrackInputConfiguration
        include JSON::Serializable

        # Indicates whether multitrack input is enabled. Can be set to true only if channel type is STANDARD .
        # Setting enabled to true with any other channel type will cause an exception. If true , then policy ,
        # maximumResolution , and containerFormat are required, and containerFormat must be set to
        # FRAGMENTED_MP4 . Default: false .
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Maximum resolution for multitrack input. Required if enabled is true .
        @[JSON::Field(key: "maximumResolution")]
        getter maximum_resolution : String?

        # Indicates whether multitrack input is allowed or required. Required if enabled is true .
        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @enabled : Bool? = nil,
          @maximum_resolution : String? = nil,
          @policy : String? = nil
        )
        end
      end

      struct PendingVerification
        include JSON::Serializable

        # Your account is pending verification.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      # A key pair used to sign and validate a playback authorization token.
      struct PlaybackKeyPair
        include JSON::Serializable

        # Key-pair ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Key-pair identifier.
        @[JSON::Field(key: "fingerprint")]
        getter fingerprint : String?

        # Playback-key-pair name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @fingerprint : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about a playback key pair.
      struct PlaybackKeyPairSummary
        include JSON::Serializable

        # Key-pair ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Playback-key-pair name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An object representing a policy to constrain playback by country and/or origin sites.
      struct PlaybackRestrictionPolicy
        include JSON::Serializable

        # A list of country codes that control geoblocking restriction. Allowed values are the officially
        # assigned ISO 3166-1 alpha-2 codes. Default: All countries (an empty array).
        @[JSON::Field(key: "allowedCountries")]
        getter allowed_countries : Array(String)

        # A list of origin sites that control CORS restriction. Allowed values are the same as valid values of
        # the Origin header defined at https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin .
        # Default: All origins (an empty array).
        @[JSON::Field(key: "allowedOrigins")]
        getter allowed_origins : Array(String)

        # Playback-restriction-policy ARN
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Whether channel playback is constrained by origin site. Default: false .
        @[JSON::Field(key: "enableStrictOriginEnforcement")]
        getter enable_strict_origin_enforcement : Bool?

        # Playback-restriction-policy name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @allowed_countries : Array(String),
          @allowed_origins : Array(String),
          @arn : String,
          @enable_strict_origin_enforcement : Bool? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about a PlaybackRestrictionPolicy.
      struct PlaybackRestrictionPolicySummary
        include JSON::Serializable

        # A list of country codes that control geoblocking restriction. Allowed values are the officially
        # assigned ISO 3166-1 alpha-2 codes. Default: All countries (an empty array).
        @[JSON::Field(key: "allowedCountries")]
        getter allowed_countries : Array(String)

        # A list of origin sites that control CORS restriction. Allowed values are the same as valid values of
        # the Origin header defined at https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin .
        # Default: All origins (an empty array).
        @[JSON::Field(key: "allowedOrigins")]
        getter allowed_origins : Array(String)

        # Playback-restriction-policy ARN
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Whether channel playback is constrained by origin site. Default: false .
        @[JSON::Field(key: "enableStrictOriginEnforcement")]
        getter enable_strict_origin_enforcement : Bool?

        # Playback-restriction-policy name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @allowed_countries : Array(String),
          @allowed_origins : Array(String),
          @arn : String,
          @enable_strict_origin_enforcement : Bool? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct PutMetadataRequest
        include JSON::Serializable

        # ARN of the channel into which metadata is inserted. This channel must have an active stream.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # Metadata to insert into the stream. Maximum: 1 KB per request.
        @[JSON::Field(key: "metadata")]
        getter metadata : String

        def initialize(
          @channel_arn : String,
          @metadata : String
        )
        end
      end

      # An object representing a configuration to record a channel stream.
      struct RecordingConfiguration
        include JSON::Serializable

        # Recording-configuration ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A complex type that contains information about where recorded video will be stored.
        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration

        # Indicates the current state of the recording configuration. When the state is ACTIVE , the
        # configuration is ready for recording a channel stream.
        @[JSON::Field(key: "state")]
        getter state : String

        # Recording-configuration name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # If a broadcast disconnects and then reconnects within the specified interval, the multiple streams
        # will be considered a single broadcast and merged together. Default: 0.
        @[JSON::Field(key: "recordingReconnectWindowSeconds")]
        getter recording_reconnect_window_seconds : Int32?

        # Object that describes which renditions should be recorded for a stream.
        @[JSON::Field(key: "renditionConfiguration")]
        getter rendition_configuration : Types::RenditionConfiguration?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A complex type that allows you to enable/disable the recording of thumbnails for a live session and
        # modify the interval at which thumbnails are generated for the live session.
        @[JSON::Field(key: "thumbnailConfiguration")]
        getter thumbnail_configuration : Types::ThumbnailConfiguration?

        def initialize(
          @arn : String,
          @destination_configuration : Types::DestinationConfiguration,
          @state : String,
          @name : String? = nil,
          @recording_reconnect_window_seconds : Int32? = nil,
          @rendition_configuration : Types::RenditionConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @thumbnail_configuration : Types::ThumbnailConfiguration? = nil
        )
        end
      end

      # Summary information about a RecordingConfiguration.
      struct RecordingConfigurationSummary
        include JSON::Serializable

        # Recording-configuration ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A complex type that contains information about where recorded video will be stored.
        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration

        # Indicates the current state of the recording configuration. When the state is ACTIVE , the
        # configuration is ready for recording a channel stream.
        @[JSON::Field(key: "state")]
        getter state : String

        # Recording-configuration name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @destination_configuration : Types::DestinationConfiguration,
          @state : String,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Object that describes which renditions should be recorded for a stream.
      struct RenditionConfiguration
        include JSON::Serializable

        # Indicates which set of renditions are recorded for a stream. For BASIC channels, the CUSTOM value
        # has no effect. If CUSTOM is specified, a set of renditions must be specified in the renditions
        # field. Default: ALL .
        @[JSON::Field(key: "renditionSelection")]
        getter rendition_selection : String?

        # Indicates which renditions are recorded for a stream, if renditionSelection is CUSTOM ; otherwise,
        # this field is irrelevant. The selected renditions are recorded if they are available during the
        # stream. If a selected rendition is unavailable, the best available rendition is recorded. For
        # details on the resolution dimensions of each rendition, see Auto-Record to Amazon S3 .
        @[JSON::Field(key: "renditions")]
        getter renditions : Array(String)?

        def initialize(
          @rendition_selection : String? = nil,
          @renditions : Array(String)? = nil
        )
        end
      end

      struct ResourceNotFoundException
        include JSON::Serializable

        # Request references a resource which does not exist.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      # A complex type that describes an S3 location where recorded videos will be stored.
      struct S3DestinationConfiguration
        include JSON::Serializable

        # Location (S3 bucket name) where recorded videos will be stored.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        def initialize(
          @bucket_name : String
        )
        end
      end

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # Request would cause a service quota to be exceeded.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      # Specifies information needed to stream using the SRT protocol.
      struct Srt
        include JSON::Serializable

        # The endpoint to be used when streaming with IVS using the SRT protocol.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # Auto-generated passphrase to enable encryption. This field is applicable only if the end user has
        # not enabled the insecureIngest option for the channel.
        @[JSON::Field(key: "passphrase")]
        getter passphrase : String?

        def initialize(
          @endpoint : String? = nil,
          @passphrase : String? = nil
        )
        end
      end

      struct StartViewerSessionRevocationRequest
        include JSON::Serializable

        # The ARN of the channel associated with the viewer session to revoke.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The ID of the viewer associated with the viewer session to revoke. Do not use this field for
        # personally identifying, confidential, or sensitive information.
        @[JSON::Field(key: "viewerId")]
        getter viewer_id : String

        # An optional filter on which versions of the viewer session to revoke. All versions less than or
        # equal to the specified version will be revoked. Default: 0.
        @[JSON::Field(key: "viewerSessionVersionsLessThanOrEqualTo")]
        getter viewer_session_versions_less_than_or_equal_to : Int32?

        def initialize(
          @channel_arn : String,
          @viewer_id : String,
          @viewer_session_versions_less_than_or_equal_to : Int32? = nil
        )
        end
      end

      struct StartViewerSessionRevocationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct StopStreamRequest
        include JSON::Serializable

        # ARN of the channel for which the stream is to be stopped.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        def initialize(
          @channel_arn : String
        )
        end
      end

      struct StopStreamResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies a live video stream that has been ingested and distributed.
      struct Stream
        include JSON::Serializable

        # Channel ARN for the stream.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String?

        # The stream’s health.
        @[JSON::Field(key: "health")]
        getter health : String?

        # URL of the master playlist, required by the video player to play the HLS stream.
        @[JSON::Field(key: "playbackUrl")]
        getter playback_url : String?

        # Time of the stream’s start. This is an ISO 8601 timestamp; note that this is returned as a string .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The stream’s state. Do not rely on the OFFLINE state, as the API may not return it; instead, a
        # "NotBroadcasting" error will indicate that the stream is not live.
        @[JSON::Field(key: "state")]
        getter state : String?

        # Unique identifier for a live or previously live stream in the specified channel.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # A count of concurrent views of the stream. Typically, a new view appears in viewerCount within 15
        # seconds of when video playback starts and a view is removed from viewerCount within 1 minute of when
        # video playback ends. A value of -1 indicates that the request timed out; in this case, retry.
        @[JSON::Field(key: "viewerCount")]
        getter viewer_count : Int64?

        def initialize(
          @channel_arn : String? = nil,
          @health : String? = nil,
          @playback_url : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @stream_id : String? = nil,
          @viewer_count : Int64? = nil
        )
        end
      end

      # Object specifying a stream’s events. For a list of events, see Using Amazon EventBridge with Amazon
      # IVS .
      struct StreamEvent
        include JSON::Serializable

        # Provides additional details about the stream event. There are several values; the long descriptions
        # are provided in the IVS console but not delivered through the IVS API or EventBridge.
        # Multitrack-related codes are used only for certain Session Ended events. MultitrackInputNotAllowed —
        # The broadcast client attempted to connect with multitrack input, but multitrack input was not
        # enabled on the channel. Check your broadcast software settings or set
        # MultitrackInputConfiguration.Policy to ALLOW or REQUIRE . MultitrackInputRequired — The broadcast
        # client attempted to connect with single-track video, but multitrack input is required on this
        # channel. Enable multitrack video in your broadcast software or configure the channel’s
        # MultitrackInputConfiguration.Policy to ALLOW . InvalidGetClientConfigurationStreamKey — The
        # broadcast client attempted to connect with an invalid, expired, or corrupt stream key.
        # GetClientConfigurationStreamKeyRequired — The broadcast client attempted to stream multitrack video
        # without providing an authenticated stream key from GetClientConfiguration.
        # InvalidMultitrackInputTrackCount — The multitrack input stream contained an invalid number of
        # tracks. InvalidMultitrackInputVideoTrackMediaProperties — The multitrack input stream contained one
        # or more tracks with an invalid codec, resolution, bitrate, or framerate. StreamTakeoverMediaMismatch
        # — The broadcast client attempted to take over with different media properties (e.g., codec,
        # resolution, or video track type) from the original stream. StreamTakeoverInvalidPriority — The
        # broadcast client attempted a takeover with either a priority integer value equal to or lower than
        # the original stream's value or a value outside the allowed range of 1 to 2,147,483,647.
        # StreamTakeoverLimitBreached — The broadcast client reached the maximum allowed takeover attempts for
        # this stream.
        @[JSON::Field(key: "code")]
        getter code : String?

        # Time when the event occurred. This is an ISO 8601 timestamp; note that this is returned as a string
        # .
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time?

        # Name that identifies the stream event within a type .
        @[JSON::Field(key: "name")]
        getter name : String?

        # Logical group for certain events.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @event_time : Time? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Object specifying the stream attribute on which to filter.
      struct StreamFilters
        include JSON::Serializable

        # The stream’s health.
        @[JSON::Field(key: "health")]
        getter health : String?

        def initialize(
          @health : String? = nil
        )
        end
      end

      # Object specifying a stream key.
      struct StreamKey
        include JSON::Serializable

        # Stream-key ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Channel ARN for the stream.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Stream-key value.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @arn : String? = nil,
          @channel_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @value : String? = nil
        )
        end
      end

      # Summary information about a stream key.
      struct StreamKeySummary
        include JSON::Serializable

        # Stream-key ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Channel ARN for the stream.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String?

        # Tags attached to the resource. Array of 1-50 maps, each of the form string:string (key:value) . See
        # Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @channel_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Object that captures the Amazon IVS configuration that the customer provisioned, the ingest
      # configurations that the broadcaster used, and the most recent Amazon IVS stream events it
      # encountered.
      struct StreamSession
        include JSON::Serializable

        # The properties of the channel at the time of going live.
        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        # Time when the channel went offline. This is an ISO 8601 timestamp; note that this is returned as a
        # string . For live streams, this is NULL .
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The properties of the incoming RTMP stream. Note: ingestConfiguration is deprecated in favor of
        # ingestConfigurations but retained to ensure backward compatibility. If multitrack is not enabled,
        # ingestConfiguration and ingestConfigurations contain the same data, namely information about track0
        # (the sole track). If multitrack is enabled, ingestConfiguration contains data for only the first
        # track (track0) and ingestConfigurations contains data for all tracks.
        @[JSON::Field(key: "ingestConfiguration")]
        getter ingest_configuration : Types::IngestConfiguration?

        # The properties of the incoming RTMP stream. If multitrack is enabled, ingestConfigurations contains
        # data for all tracks; otherwise, it contains data only for track0 (the sole track).
        @[JSON::Field(key: "ingestConfigurations")]
        getter ingest_configurations : Types::IngestConfigurations?

        # The properties of recording the live stream.
        @[JSON::Field(key: "recordingConfiguration")]
        getter recording_configuration : Types::RecordingConfiguration?

        # Time when the channel went live. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Unique identifier for a live or previously live stream in the specified channel.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # List of Amazon IVS events that the stream encountered. The list is sorted by most recent events and
        # contains up to 500 events. For Amazon IVS events, see Using Amazon EventBridge with Amazon IVS .
        @[JSON::Field(key: "truncatedEvents")]
        getter truncated_events : Array(Types::StreamEvent)?

        def initialize(
          @channel : Types::Channel? = nil,
          @end_time : Time? = nil,
          @ingest_configuration : Types::IngestConfiguration? = nil,
          @ingest_configurations : Types::IngestConfigurations? = nil,
          @recording_configuration : Types::RecordingConfiguration? = nil,
          @start_time : Time? = nil,
          @stream_id : String? = nil,
          @truncated_events : Array(Types::StreamEvent)? = nil
        )
        end
      end

      # Summary information about a stream session.
      struct StreamSessionSummary
        include JSON::Serializable

        # Time when the channel went offline. This is an ISO 8601 timestamp; note that this is returned as a
        # string . For live streams, this is NULL .
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # If true , this stream encountered a quota breach or failure.
        @[JSON::Field(key: "hasErrorEvent")]
        getter has_error_event : Bool?

        # Time when the channel went live. This is an ISO 8601 timestamp; note that this is returned as a
        # string .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Unique identifier for a live or previously live stream in the specified channel.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        def initialize(
          @end_time : Time? = nil,
          @has_error_event : Bool? = nil,
          @start_time : Time? = nil,
          @stream_id : String? = nil
        )
        end
      end

      # Summary information about a stream.
      struct StreamSummary
        include JSON::Serializable

        # Channel ARN for the stream.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String?

        # The stream’s health.
        @[JSON::Field(key: "health")]
        getter health : String?

        # Time of the stream’s start. This is an ISO 8601 timestamp; note that this is returned as a string .
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The stream’s state. Do not rely on the OFFLINE state, as the API may not return it; instead, a
        # "NotBroadcasting" error will indicate that the stream is not live.
        @[JSON::Field(key: "state")]
        getter state : String?

        # Unique identifier for a live or previously live stream in the specified channel.
        @[JSON::Field(key: "streamId")]
        getter stream_id : String?

        # A count of concurrent views of the stream. Typically, a new view appears in viewerCount within 15
        # seconds of when video playback starts and a view is removed from viewerCount within 1 minute of when
        # video playback ends. A value of -1 indicates that the request timed out; in this case, retry.
        @[JSON::Field(key: "viewerCount")]
        getter viewer_count : Int64?

        def initialize(
          @channel_arn : String? = nil,
          @health : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil,
          @stream_id : String? = nil,
          @viewer_count : Int64? = nil
        )
        end
      end

      struct StreamUnavailable
        include JSON::Serializable

        # The stream is temporarily unavailable.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # ARN of the resource for which tags are to be added or updated. The ARN must be URL-encoded.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Array of tags to be added or updated. Array of maps, each of the form string:string (key:value) .
        # See Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for
        # details, including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon
        # IVS has no service-specific constraints beyond what is documented there.
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

      struct ThrottlingException
        include JSON::Serializable

        # Request was denied due to request throttling.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      # An object representing a configuration of thumbnails for recorded video.
      struct ThumbnailConfiguration
        include JSON::Serializable

        # Thumbnail recording mode. Default: INTERVAL .
        @[JSON::Field(key: "recordingMode")]
        getter recording_mode : String?

        # Indicates the desired resolution of recorded thumbnails. Thumbnails are recorded at the selected
        # resolution if the corresponding rendition is available during the stream; otherwise, they are
        # recorded at source resolution. For more information about resolution values and their corresponding
        # height and width dimensions, see Auto-Record to Amazon S3 . Default: Null (source resolution is
        # returned).
        @[JSON::Field(key: "resolution")]
        getter resolution : String?

        # Indicates the format in which thumbnails are recorded. SEQUENTIAL records all generated thumbnails
        # in a serial manner, to the media/thumbnails directory. LATEST saves the latest thumbnail in
        # media/latest_thumbnail/thumb.jpg and overwrites it at the interval specified by
        # targetIntervalSeconds . You can enable both SEQUENTIAL and LATEST . Default: SEQUENTIAL .
        @[JSON::Field(key: "storage")]
        getter storage : Array(String)?

        # The targeted thumbnail-generation interval in seconds. This is configurable (and required) only if
        # recordingMode is INTERVAL . Default: 60. Important: For the BASIC channel type, or the STANDARD
        # channel type with multitrack input, setting a value for targetIntervalSeconds does not guarantee
        # that thumbnails are generated at the specified interval. For thumbnails to be generated at the
        # targetIntervalSeconds interval, the IDR/Keyframe value for the input video must be less than the
        # targetIntervalSeconds value. See Amazon IVS Streaming Configuration for information on setting
        # IDR/Keyframe to the recommended value in video-encoder settings.
        @[JSON::Field(key: "targetIntervalSeconds")]
        getter target_interval_seconds : Int64?

        def initialize(
          @recording_mode : String? = nil,
          @resolution : String? = nil,
          @storage : Array(String)? = nil,
          @target_interval_seconds : Int64? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # ARN of the resource for which tags are to be removed. The ARN must be URL-encoded.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Array of tags to be removed. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS has
        # no service-specific constraints beyond what is documented there.
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

      struct UpdateChannelRequest
        include JSON::Serializable

        # ARN of the channel to be updated.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Whether the channel is private (enabled for playback authorization).
        @[JSON::Field(key: "authorized")]
        getter authorized : Bool?

        # Indicates which content-packaging format is used (MPEG-TS or fMP4). If multitrackInputConfiguration
        # is specified and enabled is true , then containerFormat is required and must be set to
        # FRAGMENTED_MP4 . Otherwise, containerFormat may be set to TS or FRAGMENTED_MP4 . Default: TS .
        @[JSON::Field(key: "containerFormat")]
        getter container_format : String?

        # Whether the channel allows insecure RTMP and SRT ingest. Default: false .
        @[JSON::Field(key: "insecureIngest")]
        getter insecure_ingest : Bool?

        # Channel latency mode. Use NORMAL to broadcast and deliver live video up to Full HD. Use LOW for
        # near-real-time interaction with viewers.
        @[JSON::Field(key: "latencyMode")]
        getter latency_mode : String?

        # Object specifying multitrack input configuration. Default: no multitrack input configuration is
        # specified.
        @[JSON::Field(key: "multitrackInputConfiguration")]
        getter multitrack_input_configuration : Types::MultitrackInputConfiguration?

        # Channel name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Playback-restriction-policy ARN. A valid ARN value here both specifies the ARN and enables playback
        # restriction. If this is set to an empty string, playback restriction policy is disabled.
        @[JSON::Field(key: "playbackRestrictionPolicyArn")]
        getter playback_restriction_policy_arn : String?

        # Optional transcode preset for the channel. This is selectable only for ADVANCED_HD and ADVANCED_SD
        # channel types. For those channel types, the default preset is HIGHER_BANDWIDTH_DELIVERY . For other
        # channel types ( BASIC and STANDARD ), preset is the empty string ( "" ).
        @[JSON::Field(key: "preset")]
        getter preset : String?

        # Recording-configuration ARN. A valid ARN value here both specifies the ARN and enables recording. If
        # this is set to an empty string, recording is disabled.
        @[JSON::Field(key: "recordingConfigurationArn")]
        getter recording_configuration_arn : String?

        # Channel type, which determines the allowable resolution and bitrate. If you exceed the allowable
        # input resolution or bitrate, the stream probably will disconnect immediately. Default: STANDARD .
        # For details, see Channel Types .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String,
          @authorized : Bool? = nil,
          @container_format : String? = nil,
          @insecure_ingest : Bool? = nil,
          @latency_mode : String? = nil,
          @multitrack_input_configuration : Types::MultitrackInputConfiguration? = nil,
          @name : String? = nil,
          @playback_restriction_policy_arn : String? = nil,
          @preset : String? = nil,
          @recording_configuration_arn : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct UpdateChannelResponse
        include JSON::Serializable

        # Object specifying the updated channel.
        @[JSON::Field(key: "channel")]
        getter channel : Types::Channel?

        def initialize(
          @channel : Types::Channel? = nil
        )
        end
      end

      struct UpdatePlaybackRestrictionPolicyRequest
        include JSON::Serializable

        # ARN of the playback-restriction-policy to be updated.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A list of country codes that control geoblocking restriction. Allowed values are the officially
        # assigned ISO 3166-1 alpha-2 codes. Default: All countries (an empty array).
        @[JSON::Field(key: "allowedCountries")]
        getter allowed_countries : Array(String)?

        # A list of origin sites that control CORS restriction. Allowed values are the same as valid values of
        # the Origin header defined at https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin .
        # Default: All origins (an empty array).
        @[JSON::Field(key: "allowedOrigins")]
        getter allowed_origins : Array(String)?

        # Whether channel playback is constrained by origin site. Default: false .
        @[JSON::Field(key: "enableStrictOriginEnforcement")]
        getter enable_strict_origin_enforcement : Bool?

        # Playback-restriction-policy name. The value does not need to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String,
          @allowed_countries : Array(String)? = nil,
          @allowed_origins : Array(String)? = nil,
          @enable_strict_origin_enforcement : Bool? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdatePlaybackRestrictionPolicyResponse
        include JSON::Serializable

        # Object specifying the updated policy.
        @[JSON::Field(key: "playbackRestrictionPolicy")]
        getter playback_restriction_policy : Types::PlaybackRestrictionPolicy?

        def initialize(
          @playback_restriction_policy : Types::PlaybackRestrictionPolicy? = nil
        )
        end
      end

      struct ValidationException
        include JSON::Serializable

        # The input fails to satisfy the constraints specified by an Amazon Web Services service.
        @[JSON::Field(key: "exceptionMessage")]
        getter exception_message : String?

        def initialize(
          @exception_message : String? = nil
        )
        end
      end

      # Object specifying a stream’s video configuration, as set up by the broadcaster (usually in an
      # encoder). This is part of the IngestConfigurations object and the deprecated IngestConfiguration
      # object. It is used for monitoring stream health.
      struct VideoConfiguration
        include JSON::Serializable

        # Indicates the degree of required decoder performance for a profile. Normally this is set
        # automatically by the encoder. For details, see the H.264 specification.
        @[JSON::Field(key: "avcLevel")]
        getter avc_level : String?

        # Indicates to the decoder the requirements for decoding the stream. For definitions of the valid
        # values, see the H.264 specification.
        @[JSON::Field(key: "avcProfile")]
        getter avc_profile : String?

        # Codec used for the video encoding.
        @[JSON::Field(key: "codec")]
        getter codec : String?

        # Software or hardware used to encode the video.
        @[JSON::Field(key: "encoder")]
        getter encoder : String?

        # Indicates the degree of required decoder performance for a profile. Normally this is set
        # automatically by the encoder. When an AVC codec is used, this field has the same value as avcLevel .
        @[JSON::Field(key: "level")]
        getter level : String?

        # Indicates to the decoder the requirements for decoding the stream. When an AVC codec is used, this
        # field has the same value as avcProfile .
        @[JSON::Field(key: "profile")]
        getter profile : String?

        # The expected ingest bitrate (bits per second). This is configured in the encoder.
        @[JSON::Field(key: "targetBitrate")]
        getter target_bitrate : Int64?

        # The expected ingest framerate. This is configured in the encoder.
        @[JSON::Field(key: "targetFramerate")]
        getter target_framerate : Int64?

        # Name of the video track. If multitrack is not enabled, this is track0 (the sole track).
        @[JSON::Field(key: "track")]
        getter track : String?

        # Video-resolution height in pixels.
        @[JSON::Field(key: "videoHeight")]
        getter video_height : Int64?

        # Video-resolution width in pixels.
        @[JSON::Field(key: "videoWidth")]
        getter video_width : Int64?

        def initialize(
          @avc_level : String? = nil,
          @avc_profile : String? = nil,
          @codec : String? = nil,
          @encoder : String? = nil,
          @level : String? = nil,
          @profile : String? = nil,
          @target_bitrate : Int64? = nil,
          @target_framerate : Int64? = nil,
          @track : String? = nil,
          @video_height : Int64? = nil,
          @video_width : Int64? = nil
        )
        end
      end
    end
  end
end
