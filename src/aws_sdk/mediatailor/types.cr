require "json"
require "time"

module AwsSdk
  module MediaTailor
    module Types

      # Access configuration parameters.

      struct AccessConfiguration
        include JSON::Serializable

        # The type of authentication used to access content from HttpConfiguration::BaseUrl on your source
        # location. S3_SIGV4 - AWS Signature Version 4 authentication for Amazon S3 hosted virtual-style
        # access. If your source location base URL is an Amazon S3 bucket, MediaTailor can use AWS Signature
        # Version 4 (SigV4) authentication to access the bucket where your source content is stored. Your
        # MediaTailor source location baseURL must follow the S3 virtual hosted-style request URL format. For
        # example, https://bucket-name.s3.Region.amazonaws.com/key-name. Before you can use S3_SIGV4 , you
        # must meet these requirements: • You must allow MediaTailor to access your S3 bucket by granting
        # mediatailor.amazonaws.com principal access in IAM. For information about configuring access in IAM,
        # see Access management in the IAM User Guide. • The mediatailor.amazonaws.com service principal must
        # have permissions to read all top level manifests referenced by the VodSource packaging
        # configurations. • The caller of the API must have s3:GetObject IAM permissions to read all top level
        # manifests referenced by your MediaTailor VodSource packaging configurations. AUTODETECT_SIGV4 - AWS
        # Signature Version 4 authentication for a set of supported services: MediaPackage Version 2 and
        # Amazon S3 hosted virtual-style access. If your source location base URL is a MediaPackage Version 2
        # endpoint or an Amazon S3 bucket, MediaTailor can use AWS Signature Version 4 (SigV4) authentication
        # to access the resource where your source content is stored. Before you can use AUTODETECT_SIGV4 with
        # a MediaPackage Version 2 endpoint, you must meet these requirements: • You must grant MediaTailor
        # access to your MediaPackage endpoint by granting mediatailor.amazonaws.com principal access in an
        # Origin Access policy on the endpoint. • Your MediaTailor source location base URL must be a
        # MediaPackage V2 endpoint. • The caller of the API must have mediapackagev2:GetObject IAM permissions
        # to read all top level manifests referenced by the MediaTailor source packaging configurations.
        # Before you can use AUTODETECT_SIGV4 with an Amazon S3 bucket, you must meet these requirements: •
        # You must grant MediaTailor access to your S3 bucket by granting mediatailor.amazonaws.com principal
        # access in IAM. For more information about configuring access in IAM, see Access management in the
        # IAM User Guide. . • The mediatailor.amazonaws.com service principal must have permissions to read
        # all top-level manifests referenced by the VodSource packaging configurations. • The caller of the
        # API must have s3:GetObject IAM permissions to read all top level manifests referenced by your
        # MediaTailor VodSource packaging configurations.

        @[JSON::Field(key: "AccessType")]
        getter access_type : String?

        # AWS Secrets Manager access token configuration parameters.

        @[JSON::Field(key: "SecretsManagerAccessTokenConfiguration")]
        getter secrets_manager_access_token_configuration : Types::SecretsManagerAccessTokenConfiguration?

        def initialize(
          @access_type : String? = nil,
          @secrets_manager_access_token_configuration : Types::SecretsManagerAccessTokenConfiguration? = nil
        )
        end
      end

      # Ad break configuration parameters.

      struct AdBreak
        include JSON::Serializable

        # How long (in milliseconds) after the beginning of the program that an ad starts. This value must
        # fall within 100ms of a segment boundary, otherwise the ad break will be skipped.

        @[JSON::Field(key: "OffsetMillis")]
        getter offset_millis : Int64

        # Defines a list of key/value pairs that MediaTailor generates within the EXT-X-ASSET tag for
        # SCTE35_ENHANCED output.

        @[JSON::Field(key: "AdBreakMetadata")]
        getter ad_break_metadata : Array(Types::KeyValuePair)?

        # The SCTE-35 ad insertion type. Accepted value: SPLICE_INSERT , TIME_SIGNAL .

        @[JSON::Field(key: "MessageType")]
        getter message_type : String?

        # Ad break slate configuration.

        @[JSON::Field(key: "Slate")]
        getter slate : Types::SlateSource?

        # This defines the SCTE-35 splice_insert() message inserted around the ad. For information about using
        # splice_insert() , see the SCTE-35 specficiaiton, section 9.7.3.1.

        @[JSON::Field(key: "SpliceInsertMessage")]
        getter splice_insert_message : Types::SpliceInsertMessage?

        # Defines the SCTE-35 time_signal message inserted around the ad. Programs on a channel's schedule can
        # be configured with one or more ad breaks. You can attach a splice_insert SCTE-35 message to the ad
        # break. This message provides basic metadata about the ad break. See section 9.7.4 of the 2022
        # SCTE-35 specification for more information.

        @[JSON::Field(key: "TimeSignalMessage")]
        getter time_signal_message : Types::TimeSignalMessage?

        def initialize(
          @offset_millis : Int64,
          @ad_break_metadata : Array(Types::KeyValuePair)? = nil,
          @message_type : String? = nil,
          @slate : Types::SlateSource? = nil,
          @splice_insert_message : Types::SpliceInsertMessage? = nil,
          @time_signal_message : Types::TimeSignalMessage? = nil
        )
        end
      end

      # A location at which a zero-duration ad marker was detected in a VOD source manifest.

      struct AdBreakOpportunity
        include JSON::Serializable

        # The offset in milliseconds from the start of the VOD source at which an ad marker was detected.

        @[JSON::Field(key: "OffsetMillis")]
        getter offset_millis : Int64

        def initialize(
          @offset_millis : Int64
        )
        end
      end

      # The setting that indicates what conditioning MediaTailor will perform on ads that the ad decision
      # server (ADS) returns.

      struct AdConditioningConfiguration
        include JSON::Serializable

        # For ads that have media files with streaming delivery and supported file extensions, indicates what
        # transcoding action MediaTailor takes when it first receives these ads from the ADS. TRANSCODE
        # indicates that MediaTailor must transcode the ads. NONE indicates that you have already transcoded
        # the ads outside of MediaTailor and don't need them transcoded as part of the ad insertion workflow.
        # For more information about ad conditioning see Using preconditioned ads in the Elemental MediaTailor
        # user guide.

        @[JSON::Field(key: "StreamingMediaFileConditioning")]
        getter streaming_media_file_conditioning : String

        def initialize(
          @streaming_media_file_conditioning : String
        )
        end
      end

      # Configuration parameters for customizing HTTP requests sent to the ad decision server (ADS). This
      # allows you to specify the HTTP method, headers, request body, and compression settings for ADS
      # requests.

      struct AdDecisionServerConfiguration
        include JSON::Serializable

        # The HTTP request configuration parameters for the ad decision server.

        @[JSON::Field(key: "HttpRequest")]
        getter http_request : Types::HttpRequest?

        def initialize(
          @http_request : Types::HttpRequest? = nil
        )
        end
      end

      # For HLS, when set to true , MediaTailor passes through EXT-X-CUE-IN , EXT-X-CUE-OUT , and
      # EXT-X-SPLICEPOINT-SCTE35 ad markers from the origin manifest to the MediaTailor personalized
      # manifest. No logic is applied to these ad markers. For example, if EXT-X-CUE-OUT has a value of 60 ,
      # but no ads are filled for that ad break, MediaTailor will not set the value to 0 .

      struct AdMarkerPassthrough
        include JSON::Serializable

        # Enables ad marker passthrough for your configuration.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Settings for customizing what events are included in logs for interactions with the ad decision
      # server (ADS). For more information about ADS logs, inlcuding descriptions of the event types, see
      # MediaTailor ADS logs description and event types in Elemental MediaTailor User Guide.

      struct AdsInteractionLog
        include JSON::Serializable

        # Indicates that MediaTailor won't emit the selected events in the logs for playback sessions that are
        # initialized with this configuration.

        @[JSON::Field(key: "ExcludeEventTypes")]
        getter exclude_event_types : Array(String)?

        # Indicates that MediaTailor emits RAW_ADS_RESPONSE logs for playback sessions that are initialized
        # with this configuration.

        @[JSON::Field(key: "PublishOptInEventTypes")]
        getter publish_opt_in_event_types : Array(String)?

        def initialize(
          @exclude_event_types : Array(String)? = nil,
          @publish_opt_in_event_types : Array(String)? = nil
        )
        end
      end

      # Alert configuration parameters.

      struct Alert
        include JSON::Serializable

        # The code for the alert. For example, NOT_PROCESSED .

        @[JSON::Field(key: "AlertCode")]
        getter alert_code : String

        # If an alert is generated for a resource, an explanation of the reason for the alert.

        @[JSON::Field(key: "AlertMessage")]
        getter alert_message : String

        # The timestamp when the alert was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time

        # The Amazon Resource Names (ARNs) related to this alert.

        @[JSON::Field(key: "RelatedResourceArns")]
        getter related_resource_arns : Array(String)

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The category that MediaTailor assigns to the alert.

        @[JSON::Field(key: "Category")]
        getter category : String?

        def initialize(
          @alert_code : String,
          @alert_message : String,
          @last_modified_time : Time,
          @related_resource_arns : Array(String),
          @resource_arn : String,
          @category : String? = nil
        )
        end
      end

      # A playlist of media (VOD and/or live) to be played instead of the default media on a particular
      # program.

      struct AlternateMedia
        include JSON::Serializable

        # Ad break configuration parameters defined in AlternateMedia.

        @[JSON::Field(key: "AdBreaks")]
        getter ad_breaks : Array(Types::AdBreak)?


        @[JSON::Field(key: "ClipRange")]
        getter clip_range : Types::ClipRange?

        # The duration of the alternateMedia in milliseconds.

        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The name of the live source for alternateMedia.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String?

        # The date and time that the alternateMedia is scheduled to start, in epoch milliseconds.

        @[JSON::Field(key: "ScheduledStartTimeMillis")]
        getter scheduled_start_time_millis : Int64?

        # The name of the source location for alternateMedia.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The name of the VOD source for alternateMedia.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @ad_breaks : Array(Types::AdBreak)? = nil,
          @clip_range : Types::ClipRange? = nil,
          @duration_millis : Int64? = nil,
          @live_source_name : String? = nil,
          @scheduled_start_time_millis : Int64? = nil,
          @source_location_name : String? = nil,
          @vod_source_name : String? = nil
        )
        end
      end

      # An AudienceMedia object contains an Audience and a list of AlternateMedia.

      struct AudienceMedia
        include JSON::Serializable

        # The list of AlternateMedia defined in AudienceMedia.

        @[JSON::Field(key: "AlternateMedia")]
        getter alternate_media : Array(Types::AlternateMedia)?

        # The Audience defined in AudienceMedia.

        @[JSON::Field(key: "Audience")]
        getter audience : String?

        def initialize(
          @alternate_media : Array(Types::AlternateMedia)? = nil,
          @audience : String? = nil
        )
        end
      end

      # MediaTailor only places (consumes) prefetched ads if the ad break meets the criteria defined by the
      # dynamic variables. This gives you granular control over which ad break to place the prefetched ads
      # into. As an example, let's say that you set DynamicVariable to scte.event_id and Operator to EQUALS
      # , and your playback configuration has an ADS URL of
      # https://my.ads.server.com/path?&amp;podId=[scte.avail_num]&amp;event=[scte.event_id]&amp;duration=[session.avail_duration_secs]
      # . And the prefetch request to the ADS contains these values
      # https://my.ads.server.com/path?&amp;podId=3&amp;event=my-awesome-event&amp;duration=30 . MediaTailor
      # will only insert the prefetched ads into the ad break if has a SCTE marker with an event id of
      # my-awesome-event , since it must match the event id that MediaTailor uses to query the ADS. You can
      # specify up to five AvailMatchingCriteria . If you specify multiple AvailMatchingCriteria ,
      # MediaTailor combines them to match using a logical AND . You can model logical OR combinations by
      # creating multiple prefetch schedules.

      struct AvailMatchingCriteria
        include JSON::Serializable

        # The dynamic variable(s) that MediaTailor should use as avail matching criteria. MediaTailor only
        # places the prefetched ads into the avail if the avail matches the criteria defined by the dynamic
        # variable. For information about dynamic variables, see Using dynamic ad variables in the MediaTailor
        # User Guide . You can include up to 100 dynamic variables.

        @[JSON::Field(key: "DynamicVariable")]
        getter dynamic_variable : String

        # For the DynamicVariable specified in AvailMatchingCriteria , the Operator that is used for the
        # comparison.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        def initialize(
          @dynamic_variable : String,
          @operator : String
        )
        end
      end

      # The configuration for avail suppression, also known as ad suppression. For more information about ad
      # suppression, see Ad Suppression .

      struct AvailSuppression
        include JSON::Serializable

        # Defines the policy to apply to the avail suppression mode. BEHIND_LIVE_EDGE will always use the full
        # avail suppression policy. AFTER_LIVE_EDGE mode can be used to invoke partial ad break fills when a
        # session starts mid-break.

        @[JSON::Field(key: "FillPolicy")]
        getter fill_policy : String?

        # Sets the ad suppression mode. By default, ad suppression is off and all ad breaks are filled with
        # ads or slate. When Mode is set to BEHIND_LIVE_EDGE , ad suppression is active and MediaTailor won't
        # fill ad breaks on or behind the ad suppression Value time in the manifest lookback window. When Mode
        # is set to AFTER_LIVE_EDGE , ad suppression is active and MediaTailor won't fill ad breaks that are
        # within the live edge plus the avail suppression value.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # A live edge offset time in HH:MM:SS. MediaTailor won't fill ad breaks on or behind this time in the
        # manifest lookback window. If Value is set to 00:00:00, it is in sync with the live edge, and
        # MediaTailor won't fill any ad breaks on or behind the live edge. If you set a Value time,
        # MediaTailor won't fill any ad breaks on or behind this time in the manifest lookback window. For
        # example, if you set 00:45:00, then MediaTailor will fill ad breaks that occur within 45 minutes
        # behind the live edge, but won't fill ad breaks on or behind 45 minutes behind the live edge.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @fill_policy : String? = nil,
          @mode : String? = nil,
          @value : String? = nil
        )
        end
      end

      # A request contains unexpected data.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration for bumpers. Bumpers are short audio or video clips that play at the start or
      # before the end of an ad break. To learn more about bumpers, see Bumpers .

      struct Bumper
        include JSON::Serializable

        # The URL for the end bumper asset.

        @[JSON::Field(key: "EndUrl")]
        getter end_url : String?

        # The URL for the start bumper asset.

        @[JSON::Field(key: "StartUrl")]
        getter start_url : String?

        def initialize(
          @end_url : String? = nil,
          @start_url : String? = nil
        )
        end
      end

      # The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content
      # and ad segment management.

      struct CdnConfiguration
        include JSON::Serializable

        # A non-default content delivery network (CDN) to serve ad segments. By default, AWS Elemental
        # MediaTailor uses Amazon CloudFront with default cache settings as its CDN for ad segments. To set up
        # an alternate CDN, create a rule in your CDN for the origin ads.mediatailor. &lt;region&gt;
        # .amazonaws.com. Then specify the rule's name in this AdSegmentUrlPrefix . When AWS Elemental
        # MediaTailor serves a manifest, it reports your CDN as the source for ad segments.

        @[JSON::Field(key: "AdSegmentUrlPrefix")]
        getter ad_segment_url_prefix : String?

        # A content delivery network (CDN) to cache content segments, so that content requests don’t always
        # have to go to the origin server. First, create a rule in your CDN for the content segment origin
        # server. Then specify the rule's name in this ContentSegmentUrlPrefix . When AWS Elemental
        # MediaTailor serves a manifest, it reports your CDN as the source for content segments.

        @[JSON::Field(key: "ContentSegmentUrlPrefix")]
        getter content_segment_url_prefix : String?

        def initialize(
          @ad_segment_url_prefix : String? = nil,
          @content_segment_url_prefix : String? = nil
        )
        end
      end

      # The configuration parameters for a channel. For information about MediaTailor channels, see Working
      # with channels in the MediaTailor User Guide .

      struct Channel
        include JSON::Serializable

        # The ARN of the channel.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # Returns the state whether the channel is running or not.

        @[JSON::Field(key: "ChannelState")]
        getter channel_state : String

        # The log configuration.

        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LogConfigurationForChannel

        # The channel's output properties.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::ResponseOutputItem)

        # The type of playback mode for this channel. LINEAR - Programs play back-to-back only once. LOOP -
        # Programs play back-to-back in an endless loop. When the last program in the schedule plays, playback
        # loops back to the first program in the schedule.

        @[JSON::Field(key: "PlaybackMode")]
        getter playback_mode : String

        # The tier for this channel. STANDARD tier channels can contain live programs.

        @[JSON::Field(key: "Tier")]
        getter tier : String

        # The list of audiences defined in channel.

        @[JSON::Field(key: "Audiences")]
        getter audiences : Array(String)?

        # The timestamp of when the channel was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The slate used to fill gaps between programs in the schedule. You must configure filler slate if
        # your channel uses the LINEAR PlaybackMode . MediaTailor doesn't support filler slate for channels
        # using the LOOP PlaybackMode .

        @[JSON::Field(key: "FillerSlate")]
        getter filler_slate : Types::SlateSource?

        # The timestamp of when the channel was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The tags to assign to the channel. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_name : String,
          @channel_state : String,
          @log_configuration : Types::LogConfigurationForChannel,
          @outputs : Array(Types::ResponseOutputItem),
          @playback_mode : String,
          @tier : String,
          @audiences : Array(String)? = nil,
          @creation_time : Time? = nil,
          @filler_slate : Types::SlateSource? = nil,
          @last_modified_time : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Clip range configuration for the VOD source associated with the program.

      struct ClipRange
        include JSON::Serializable

        # The end offset of the clip range, in milliseconds, starting from the beginning of the VOD source
        # associated with the program.

        @[JSON::Field(key: "EndOffsetMillis")]
        getter end_offset_millis : Int64?

        # The start offset of the clip range, in milliseconds. This offset truncates the start at the number
        # of milliseconds into the duration of the VOD source.

        @[JSON::Field(key: "StartOffsetMillis")]
        getter start_offset_millis : Int64?

        def initialize(
          @end_offset_millis : Int64? = nil,
          @start_offset_millis : Int64? = nil
        )
        end
      end


      struct ConfigureLogsForChannelRequest
        include JSON::Serializable

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The types of logs to collect.

        @[JSON::Field(key: "LogTypes")]
        getter log_types : Array(String)

        def initialize(
          @channel_name : String,
          @log_types : Array(String)
        )
        end
      end


      struct ConfigureLogsForChannelResponse
        include JSON::Serializable

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # The types of logs collected.

        @[JSON::Field(key: "LogTypes")]
        getter log_types : Array(String)?

        def initialize(
          @channel_name : String? = nil,
          @log_types : Array(String)? = nil
        )
        end
      end

      # Configures Amazon CloudWatch log settings for a playback configuration.

      struct ConfigureLogsForPlaybackConfigurationRequest
        include JSON::Serializable

        # The percentage of session logs that MediaTailor sends to your CloudWatch Logs account. For example,
        # if your playback configuration has 1000 sessions and percentEnabled is set to 60 , MediaTailor sends
        # logs for 600 of the sessions to CloudWatch Logs. MediaTailor decides at random which of the playback
        # configuration sessions to send logs for. If you want to view logs for a specific session, you can
        # use the debug log mode . Valid values: 0 - 100

        @[JSON::Field(key: "PercentEnabled")]
        getter percent_enabled : Int32

        # The name of the playback configuration.

        @[JSON::Field(key: "PlaybackConfigurationName")]
        getter playback_configuration_name : String

        # The event types that MediaTailor emits in logs for interactions with the ADS.

        @[JSON::Field(key: "AdsInteractionLog")]
        getter ads_interaction_log : Types::AdsInteractionLog?

        # The method used for collecting logs from AWS Elemental MediaTailor. To configure MediaTailor to send
        # logs directly to Amazon CloudWatch Logs, choose LEGACY_CLOUDWATCH . To configure MediaTailor to send
        # logs to CloudWatch, which then vends the logs to your destination of choice, choose VENDED_LOGS .
        # Supported destinations are CloudWatch Logs log group, Amazon S3 bucket, and Amazon Data Firehose
        # stream. To use vended logs, you must configure the delivery destination in Amazon CloudWatch, as
        # described in Enable logging from AWS services, Logging that requires additional permissions [V2] .

        @[JSON::Field(key: "EnabledLoggingStrategies")]
        getter enabled_logging_strategies : Array(String)?

        # The event types that MediaTailor emits in logs for interactions with the origin server.

        @[JSON::Field(key: "ManifestServiceInteractionLog")]
        getter manifest_service_interaction_log : Types::ManifestServiceInteractionLog?

        def initialize(
          @percent_enabled : Int32,
          @playback_configuration_name : String,
          @ads_interaction_log : Types::AdsInteractionLog? = nil,
          @enabled_logging_strategies : Array(String)? = nil,
          @manifest_service_interaction_log : Types::ManifestServiceInteractionLog? = nil
        )
        end
      end


      struct ConfigureLogsForPlaybackConfigurationResponse
        include JSON::Serializable

        # The percentage of session logs that MediaTailor sends to your Cloudwatch Logs account.

        @[JSON::Field(key: "PercentEnabled")]
        getter percent_enabled : Int32

        # The event types that MediaTailor emits in logs for interactions with the ADS.

        @[JSON::Field(key: "AdsInteractionLog")]
        getter ads_interaction_log : Types::AdsInteractionLog?

        # The method used for collecting logs from AWS Elemental MediaTailor. LEGACY_CLOUDWATCH indicates that
        # MediaTailor is sending logs directly to Amazon CloudWatch Logs. VENDED_LOGS indicates that
        # MediaTailor is sending logs to CloudWatch, which then vends the logs to your destination of choice.
        # Supported destinations are CloudWatch Logs log group, Amazon S3 bucket, and Amazon Data Firehose
        # stream.

        @[JSON::Field(key: "EnabledLoggingStrategies")]
        getter enabled_logging_strategies : Array(String)?

        # The event types that MediaTailor emits in logs for interactions with the origin server.

        @[JSON::Field(key: "ManifestServiceInteractionLog")]
        getter manifest_service_interaction_log : Types::ManifestServiceInteractionLog?

        # The name of the playback configuration.

        @[JSON::Field(key: "PlaybackConfigurationName")]
        getter playback_configuration_name : String?

        def initialize(
          @percent_enabled : Int32,
          @ads_interaction_log : Types::AdsInteractionLog? = nil,
          @enabled_logging_strategies : Array(String)? = nil,
          @manifest_service_interaction_log : Types::ManifestServiceInteractionLog? = nil,
          @playback_configuration_name : String? = nil
        )
        end
      end


      struct CreateChannelRequest
        include JSON::Serializable

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The channel's output properties.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::RequestOutputItem)

        # The type of playback mode to use for this channel. LINEAR - The programs in the schedule play once
        # back-to-back in the schedule. LOOP - The programs in the schedule play back-to-back in an endless
        # loop. When the last program in the schedule stops playing, playback loops back to the first program
        # in the schedule.

        @[JSON::Field(key: "PlaybackMode")]
        getter playback_mode : String

        # The list of audiences defined in channel.

        @[JSON::Field(key: "Audiences")]
        getter audiences : Array(String)?

        # The slate used to fill gaps between programs in the schedule. You must configure filler slate if
        # your channel uses the LINEAR PlaybackMode . MediaTailor doesn't support filler slate for channels
        # using the LOOP PlaybackMode .

        @[JSON::Field(key: "FillerSlate")]
        getter filler_slate : Types::SlateSource?

        # The tags to assign to the channel. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The tier of the channel.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The time-shifted viewing configuration you want to associate to the channel.

        @[JSON::Field(key: "TimeShiftConfiguration")]
        getter time_shift_configuration : Types::TimeShiftConfiguration?

        def initialize(
          @channel_name : String,
          @outputs : Array(Types::RequestOutputItem),
          @playback_mode : String,
          @audiences : Array(String)? = nil,
          @filler_slate : Types::SlateSource? = nil,
          @tags : Hash(String, String)? = nil,
          @tier : String? = nil,
          @time_shift_configuration : Types::TimeShiftConfiguration? = nil
        )
        end
      end


      struct CreateChannelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to assign to the channel.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The list of audiences defined in channel.

        @[JSON::Field(key: "Audiences")]
        getter audiences : Array(String)?

        # The name to assign to the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # Indicates whether the channel is in a running state or not.

        @[JSON::Field(key: "ChannelState")]
        getter channel_state : String?

        # The timestamp of when the channel was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Contains information about the slate used to fill gaps between programs in the schedule.

        @[JSON::Field(key: "FillerSlate")]
        getter filler_slate : Types::SlateSource?

        # The timestamp of when the channel was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The output properties to assign to the channel.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::ResponseOutputItem)?

        # The playback mode to assign to the channel.

        @[JSON::Field(key: "PlaybackMode")]
        getter playback_mode : String?

        # The tags to assign to the channel. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The tier of the channel.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The time-shifted viewing configuration assigned to the channel.

        @[JSON::Field(key: "TimeShiftConfiguration")]
        getter time_shift_configuration : Types::TimeShiftConfiguration?

        def initialize(
          @arn : String? = nil,
          @audiences : Array(String)? = nil,
          @channel_name : String? = nil,
          @channel_state : String? = nil,
          @creation_time : Time? = nil,
          @filler_slate : Types::SlateSource? = nil,
          @last_modified_time : Time? = nil,
          @outputs : Array(Types::ResponseOutputItem)? = nil,
          @playback_mode : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tier : String? = nil,
          @time_shift_configuration : Types::TimeShiftConfiguration? = nil
        )
        end
      end


      struct CreateLiveSourceRequest
        include JSON::Serializable

        # A list of HTTP package configuration parameters for this live source.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)

        # The name of the live source.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The tags to assign to the live source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @http_package_configurations : Array(Types::HttpPackageConfiguration),
          @live_source_name : String,
          @source_location_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLiveSourceResponse
        include JSON::Serializable

        # The ARN to assign to the live source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the live source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # A list of HTTP package configuration parameters for this live source.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)?

        # The time the live source was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name to assign to the live source.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String?

        # The name to assign to the source location of the live source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The tags to assign to the live source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @http_package_configurations : Array(Types::HttpPackageConfiguration)? = nil,
          @last_modified_time : Time? = nil,
          @live_source_name : String? = nil,
          @source_location_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePrefetchScheduleRequest
        include JSON::Serializable

        # The name to assign to the schedule request.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name to assign to the playback configuration.

        @[JSON::Field(key: "PlaybackConfigurationName")]
        getter playback_configuration_name : String

        # The configuration settings for how and when MediaTailor consumes prefetched ads from the ad decision
        # server for single prefetch schedules. Each consumption configuration contains an end time and an
        # optional start time that define the consumption window . Prefetch schedules automatically expire no
        # earlier than seven days after the end time.

        @[JSON::Field(key: "Consumption")]
        getter consumption : Types::PrefetchConsumption?

        # The configuration that defines how and when MediaTailor performs ad prefetching in a live event.

        @[JSON::Field(key: "RecurringPrefetchConfiguration")]
        getter recurring_prefetch_configuration : Types::RecurringPrefetchConfiguration?

        # The configuration settings for retrieval of prefetched ads from the ad decision server. Only one set
        # of prefetched ads will be retrieved and subsequently consumed for each ad break.

        @[JSON::Field(key: "Retrieval")]
        getter retrieval : Types::PrefetchRetrieval?

        # The frequency that MediaTailor creates prefetch schedules. SINGLE indicates that this schedule
        # applies to one ad break. RECURRING indicates that MediaTailor automatically creates a schedule for
        # each ad avail in a live event. For more information about the prefetch types and when you might use
        # each, see Prefetching ads in Elemental MediaTailor.

        @[JSON::Field(key: "ScheduleType")]
        getter schedule_type : String?

        # An optional stream identifier that MediaTailor uses to prefetch ads for multiple streams that use
        # the same playback configuration. If StreamId is specified, MediaTailor returns all of the prefetch
        # schedules with an exact match on StreamId . If not specified, MediaTailor returns all of the
        # prefetch schedules for the playback configuration, regardless of StreamId .

        @[JSON::Field(key: "StreamId")]
        getter stream_id : String?

        def initialize(
          @name : String,
          @playback_configuration_name : String,
          @consumption : Types::PrefetchConsumption? = nil,
          @recurring_prefetch_configuration : Types::RecurringPrefetchConfiguration? = nil,
          @retrieval : Types::PrefetchRetrieval? = nil,
          @schedule_type : String? = nil,
          @stream_id : String? = nil
        )
        end
      end


      struct CreatePrefetchScheduleResponse
        include JSON::Serializable

        # The ARN to assign to the prefetch schedule.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The configuration settings for how and when MediaTailor consumes prefetched ads from the ad decision
        # server for single prefetch schedules. Each consumption configuration contains an end time and an
        # optional start time that define the consumption window . Prefetch schedules automatically expire no
        # earlier than seven days after the end time.

        @[JSON::Field(key: "Consumption")]
        getter consumption : Types::PrefetchConsumption?

        # The name to assign to the prefetch schedule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The name to assign to the playback configuration.

        @[JSON::Field(key: "PlaybackConfigurationName")]
        getter playback_configuration_name : String?

        # The configuration that defines how MediaTailor performs recurring prefetch.

        @[JSON::Field(key: "RecurringPrefetchConfiguration")]
        getter recurring_prefetch_configuration : Types::RecurringPrefetchConfiguration?

        # The configuration settings for retrieval of prefetched ads from the ad decision server. Only one set
        # of prefetched ads will be retrieved and subsequently consumed for each ad break.

        @[JSON::Field(key: "Retrieval")]
        getter retrieval : Types::PrefetchRetrieval?

        # The frequency that MediaTailor creates prefetch schedules. SINGLE indicates that this schedule
        # applies to one ad break. RECURRING indicates that MediaTailor automatically creates a schedule for
        # each ad avail in a live event.

        @[JSON::Field(key: "ScheduleType")]
        getter schedule_type : String?

        # An optional stream identifier that MediaTailor uses to prefetch ads for multiple streams that use
        # the same playback configuration. If StreamId is specified, MediaTailor returns all of the prefetch
        # schedules with an exact match on StreamId . If not specified, MediaTailor returns all of the
        # prefetch schedules for the playback configuration, regardless of StreamId .

        @[JSON::Field(key: "StreamId")]
        getter stream_id : String?

        def initialize(
          @arn : String? = nil,
          @consumption : Types::PrefetchConsumption? = nil,
          @name : String? = nil,
          @playback_configuration_name : String? = nil,
          @recurring_prefetch_configuration : Types::RecurringPrefetchConfiguration? = nil,
          @retrieval : Types::PrefetchRetrieval? = nil,
          @schedule_type : String? = nil,
          @stream_id : String? = nil
        )
        end
      end


      struct CreateProgramRequest
        include JSON::Serializable

        # The name of the channel for this Program.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name of the Program.

        @[JSON::Field(key: "ProgramName")]
        getter program_name : String

        # The schedule configuration settings.

        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::ScheduleConfiguration

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The ad break configuration settings.

        @[JSON::Field(key: "AdBreaks")]
        getter ad_breaks : Array(Types::AdBreak)?

        # The list of AudienceMedia defined in program.

        @[JSON::Field(key: "AudienceMedia")]
        getter audience_media : Array(Types::AudienceMedia)?

        # The name of the LiveSource for this Program.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String?

        # The name that's used to refer to a VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @channel_name : String,
          @program_name : String,
          @schedule_configuration : Types::ScheduleConfiguration,
          @source_location_name : String,
          @ad_breaks : Array(Types::AdBreak)? = nil,
          @audience_media : Array(Types::AudienceMedia)? = nil,
          @live_source_name : String? = nil,
          @vod_source_name : String? = nil
        )
        end
      end


      struct CreateProgramResponse
        include JSON::Serializable

        # The ad break configuration settings.

        @[JSON::Field(key: "AdBreaks")]
        getter ad_breaks : Array(Types::AdBreak)?

        # The ARN to assign to the program.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The list of AudienceMedia defined in program.

        @[JSON::Field(key: "AudienceMedia")]
        getter audience_media : Array(Types::AudienceMedia)?

        # The name to assign to the channel for this program.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # The clip range configuration settings.

        @[JSON::Field(key: "ClipRange")]
        getter clip_range : Types::ClipRange?

        # The time the program was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The duration of the live program in milliseconds.

        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The name of the LiveSource for this Program.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String?

        # The name to assign to this program.

        @[JSON::Field(key: "ProgramName")]
        getter program_name : String?

        # The scheduled start time for this Program.

        @[JSON::Field(key: "ScheduledStartTime")]
        getter scheduled_start_time : Time?

        # The name to assign to the source location for this program.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The name that's used to refer to a VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @ad_breaks : Array(Types::AdBreak)? = nil,
          @arn : String? = nil,
          @audience_media : Array(Types::AudienceMedia)? = nil,
          @channel_name : String? = nil,
          @clip_range : Types::ClipRange? = nil,
          @creation_time : Time? = nil,
          @duration_millis : Int64? = nil,
          @live_source_name : String? = nil,
          @program_name : String? = nil,
          @scheduled_start_time : Time? = nil,
          @source_location_name : String? = nil,
          @vod_source_name : String? = nil
        )
        end
      end


      struct CreateSourceLocationRequest
        include JSON::Serializable

        # The source's HTTP package configurations.

        @[JSON::Field(key: "HttpConfiguration")]
        getter http_configuration : Types::HttpConfiguration

        # The name associated with the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # Access configuration parameters. Configures the type of authentication used to access content from
        # your source location.

        @[JSON::Field(key: "AccessConfiguration")]
        getter access_configuration : Types::AccessConfiguration?

        # The optional configuration for the server that serves segments.

        @[JSON::Field(key: "DefaultSegmentDeliveryConfiguration")]
        getter default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration?

        # A list of the segment delivery configurations associated with this resource.

        @[JSON::Field(key: "SegmentDeliveryConfigurations")]
        getter segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)?

        # The tags to assign to the source location. Tags are key-value pairs that you can associate with
        # Amazon resources to help with organization, access control, and cost tracking. For more information,
        # see Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @http_configuration : Types::HttpConfiguration,
          @source_location_name : String,
          @access_configuration : Types::AccessConfiguration? = nil,
          @default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration? = nil,
          @segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSourceLocationResponse
        include JSON::Serializable

        # Access configuration parameters. Configures the type of authentication used to access content from
        # your source location.

        @[JSON::Field(key: "AccessConfiguration")]
        getter access_configuration : Types::AccessConfiguration?

        # The ARN to assign to the source location.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the source location was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The optional configuration for the server that serves segments.

        @[JSON::Field(key: "DefaultSegmentDeliveryConfiguration")]
        getter default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration?

        # The source's HTTP package configurations.

        @[JSON::Field(key: "HttpConfiguration")]
        getter http_configuration : Types::HttpConfiguration?

        # The time the source location was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The segment delivery configurations for the source location. For information about MediaTailor
        # configurations, see Working with configurations in AWS Elemental MediaTailor .

        @[JSON::Field(key: "SegmentDeliveryConfigurations")]
        getter segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)?

        # The name to assign to the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The tags to assign to the source location. Tags are key-value pairs that you can associate with
        # Amazon resources to help with organization, access control, and cost tracking. For more information,
        # see Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @access_configuration : Types::AccessConfiguration? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration? = nil,
          @http_configuration : Types::HttpConfiguration? = nil,
          @last_modified_time : Time? = nil,
          @segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)? = nil,
          @source_location_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateVodSourceRequest
        include JSON::Serializable

        # A list of HTTP package configuration parameters for this VOD source.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)

        # The name of the source location for this VOD source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The name associated with the VOD source.&gt;

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String

        # The tags to assign to the VOD source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @http_package_configurations : Array(Types::HttpPackageConfiguration),
          @source_location_name : String,
          @vod_source_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateVodSourceResponse
        include JSON::Serializable

        # The ARN to assign to this VOD source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the VOD source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # A list of HTTP package configuration parameters for this VOD source.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)?

        # The time the VOD source was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name to assign to the source location for this VOD source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The tags to assign to the VOD source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The name to assign to the VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @http_package_configurations : Array(Types::HttpPackageConfiguration)? = nil,
          @last_modified_time : Time? = nil,
          @source_location_name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vod_source_name : String? = nil
        )
        end
      end

      # The configuration for DASH content.

      struct DashConfiguration
        include JSON::Serializable

        # The URL generated by MediaTailor to initiate a playback session. The session uses server-side
        # reporting. This setting is ignored in PUT operations.

        @[JSON::Field(key: "ManifestEndpointPrefix")]
        getter manifest_endpoint_prefix : String?

        # The setting that controls whether MediaTailor includes the Location tag in DASH manifests.
        # MediaTailor populates the Location tag with the URL for manifest update requests, to be used by
        # players that don't support sticky redirects. Disable this if you have CDN routing rules set up for
        # accessing MediaTailor manifests, and you are either using client-side reporting or your players
        # support sticky HTTP redirects. Valid values are DISABLED and EMT_DEFAULT . The EMT_DEFAULT setting
        # enables the inclusion of the tag and is the default value.

        @[JSON::Field(key: "MpdLocation")]
        getter mpd_location : String?

        # The setting that controls whether MediaTailor handles manifests from the origin server as
        # multi-period manifests or single-period manifests. If your origin server produces single-period
        # manifests, set this to SINGLE_PERIOD . The default setting is MULTI_PERIOD . For multi-period
        # manifests, omit this setting or set it to MULTI_PERIOD .

        @[JSON::Field(key: "OriginManifestType")]
        getter origin_manifest_type : String?

        def initialize(
          @manifest_endpoint_prefix : String? = nil,
          @mpd_location : String? = nil,
          @origin_manifest_type : String? = nil
        )
        end
      end

      # The configuration for DASH PUT operations.

      struct DashConfigurationForPut
        include JSON::Serializable

        # The setting that controls whether MediaTailor includes the Location tag in DASH manifests.
        # MediaTailor populates the Location tag with the URL for manifest update requests, to be used by
        # players that don't support sticky redirects. Disable this if you have CDN routing rules set up for
        # accessing MediaTailor manifests, and you are either using client-side reporting or your players
        # support sticky HTTP redirects. Valid values are DISABLED and EMT_DEFAULT . The EMT_DEFAULT setting
        # enables the inclusion of the tag and is the default value.

        @[JSON::Field(key: "MpdLocation")]
        getter mpd_location : String?

        # The setting that controls whether MediaTailor handles manifests from the origin server as
        # multi-period manifests or single-period manifests. If your origin server produces single-period
        # manifests, set this to SINGLE_PERIOD . The default setting is MULTI_PERIOD . For multi-period
        # manifests, omit this setting or set it to MULTI_PERIOD .

        @[JSON::Field(key: "OriginManifestType")]
        getter origin_manifest_type : String?

        def initialize(
          @mpd_location : String? = nil,
          @origin_manifest_type : String? = nil
        )
        end
      end

      # Dash manifest configuration parameters.

      struct DashPlaylistSettings
        include JSON::Serializable

        # The total duration (in seconds) of each manifest. Minimum value: 30 seconds. Maximum value: 3600
        # seconds.

        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        # Minimum amount of content (measured in seconds) that a player must keep available in the buffer.
        # Minimum value: 2 seconds. Maximum value: 60 seconds.

        @[JSON::Field(key: "MinBufferTimeSeconds")]
        getter min_buffer_time_seconds : Int32?

        # Minimum amount of time (in seconds) that the player should wait before requesting updates to the
        # manifest. Minimum value: 2 seconds. Maximum value: 60 seconds.

        @[JSON::Field(key: "MinUpdatePeriodSeconds")]
        getter min_update_period_seconds : Int32?

        # Amount of time (in seconds) that the player should be from the live point at the end of the
        # manifest. Minimum value: 2 seconds. Maximum value: 60 seconds.

        @[JSON::Field(key: "SuggestedPresentationDelaySeconds")]
        getter suggested_presentation_delay_seconds : Int32?

        def initialize(
          @manifest_window_seconds : Int32? = nil,
          @min_buffer_time_seconds : Int32? = nil,
          @min_update_period_seconds : Int32? = nil,
          @suggested_presentation_delay_seconds : Int32? = nil
        )
        end
      end

      # The optional configuration for a server that serves segments. Use this if you want the segment
      # delivery server to be different from the source location server. For example, you can configure your
      # source location server to be an origination server, such as MediaPackage, and the segment delivery
      # server to be a content delivery network (CDN), such as CloudFront. If you don't specify a segment
      # delivery server, then the source location server is used.

      struct DefaultSegmentDeliveryConfiguration
        include JSON::Serializable

        # The hostname of the server that will be used to serve segments. This string must include the
        # protocol, such as https:// .

        @[JSON::Field(key: "BaseUrl")]
        getter base_url : String?

        def initialize(
          @base_url : String? = nil
        )
        end
      end


      struct DeleteChannelPolicyRequest
        include JSON::Serializable

        # The name of the channel associated with this channel policy.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_name : String
        )
        end
      end


      struct DeleteChannelPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteChannelRequest
        include JSON::Serializable

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_name : String
        )
        end
      end


      struct DeleteChannelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLiveSourceRequest
        include JSON::Serializable

        # The name of the live source.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String

        # The name of the source location associated with this Live Source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        def initialize(
          @live_source_name : String,
          @source_location_name : String
        )
        end
      end


      struct DeleteLiveSourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePlaybackConfigurationRequest
        include JSON::Serializable

        # The name of the playback configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeletePlaybackConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePrefetchScheduleRequest
        include JSON::Serializable

        # The name of the prefetch schedule. If the action is successful, the service sends back an HTTP 204
        # response with an empty HTTP body.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the playback configuration for this prefetch schedule.

        @[JSON::Field(key: "PlaybackConfigurationName")]
        getter playback_configuration_name : String

        def initialize(
          @name : String,
          @playback_configuration_name : String
        )
        end
      end


      struct DeletePrefetchScheduleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteProgramRequest
        include JSON::Serializable

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name of the program.

        @[JSON::Field(key: "ProgramName")]
        getter program_name : String

        def initialize(
          @channel_name : String,
          @program_name : String
        )
        end
      end


      struct DeleteProgramResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSourceLocationRequest
        include JSON::Serializable

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        def initialize(
          @source_location_name : String
        )
        end
      end


      struct DeleteSourceLocationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteVodSourceRequest
        include JSON::Serializable

        # The name of the source location associated with this VOD Source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The name of the VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String

        def initialize(
          @source_location_name : String,
          @vod_source_name : String
        )
        end
      end


      struct DeleteVodSourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeChannelRequest
        include JSON::Serializable

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_name : String
        )
        end
      end


      struct DescribeChannelResponse
        include JSON::Serializable

        # The log configuration for the channel.

        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LogConfigurationForChannel

        # The ARN of the channel.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The list of audiences defined in channel.

        @[JSON::Field(key: "Audiences")]
        getter audiences : Array(String)?

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # Indicates whether the channel is in a running state or not.

        @[JSON::Field(key: "ChannelState")]
        getter channel_state : String?

        # The timestamp of when the channel was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Contains information about the slate used to fill gaps between programs in the schedule.

        @[JSON::Field(key: "FillerSlate")]
        getter filler_slate : Types::SlateSource?

        # The timestamp of when the channel was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The channel's output properties.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::ResponseOutputItem)?

        # The channel's playback mode.

        @[JSON::Field(key: "PlaybackMode")]
        getter playback_mode : String?

        # The tags assigned to the channel. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The channel's tier.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The time-shifted viewing configuration for the channel.

        @[JSON::Field(key: "TimeShiftConfiguration")]
        getter time_shift_configuration : Types::TimeShiftConfiguration?

        def initialize(
          @log_configuration : Types::LogConfigurationForChannel,
          @arn : String? = nil,
          @audiences : Array(String)? = nil,
          @channel_name : String? = nil,
          @channel_state : String? = nil,
          @creation_time : Time? = nil,
          @filler_slate : Types::SlateSource? = nil,
          @last_modified_time : Time? = nil,
          @outputs : Array(Types::ResponseOutputItem)? = nil,
          @playback_mode : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tier : String? = nil,
          @time_shift_configuration : Types::TimeShiftConfiguration? = nil
        )
        end
      end


      struct DescribeLiveSourceRequest
        include JSON::Serializable

        # The name of the live source.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String

        # The name of the source location associated with this Live Source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        def initialize(
          @live_source_name : String,
          @source_location_name : String
        )
        end
      end


      struct DescribeLiveSourceResponse
        include JSON::Serializable

        # The ARN of the live source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp that indicates when the live source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The HTTP package configurations.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)?

        # The timestamp that indicates when the live source was modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the live source.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String?

        # The name of the source location associated with the live source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The tags assigned to the live source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @http_package_configurations : Array(Types::HttpPackageConfiguration)? = nil,
          @last_modified_time : Time? = nil,
          @live_source_name : String? = nil,
          @source_location_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeProgramRequest
        include JSON::Serializable

        # The name of the channel associated with this Program.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name of the program.

        @[JSON::Field(key: "ProgramName")]
        getter program_name : String

        def initialize(
          @channel_name : String,
          @program_name : String
        )
        end
      end


      struct DescribeProgramResponse
        include JSON::Serializable

        # The ad break configuration settings.

        @[JSON::Field(key: "AdBreaks")]
        getter ad_breaks : Array(Types::AdBreak)?

        # The ARN of the program.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The list of AudienceMedia defined in program.

        @[JSON::Field(key: "AudienceMedia")]
        getter audience_media : Array(Types::AudienceMedia)?

        # The name of the channel that the program belongs to.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # The clip range configuration settings.

        @[JSON::Field(key: "ClipRange")]
        getter clip_range : Types::ClipRange?

        # The timestamp of when the program was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The duration of the live program in milliseconds.

        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The name of the LiveSource for this Program.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String?

        # The name of the program.

        @[JSON::Field(key: "ProgramName")]
        getter program_name : String?

        # The date and time that the program is scheduled to start in ISO 8601 format and Coordinated
        # Universal Time (UTC). For example, the value 2021-03-27T17:48:16.751Z represents March 27, 2021 at
        # 17:48:16.751 UTC.

        @[JSON::Field(key: "ScheduledStartTime")]
        getter scheduled_start_time : Time?

        # The source location name.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The name that's used to refer to a VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @ad_breaks : Array(Types::AdBreak)? = nil,
          @arn : String? = nil,
          @audience_media : Array(Types::AudienceMedia)? = nil,
          @channel_name : String? = nil,
          @clip_range : Types::ClipRange? = nil,
          @creation_time : Time? = nil,
          @duration_millis : Int64? = nil,
          @live_source_name : String? = nil,
          @program_name : String? = nil,
          @scheduled_start_time : Time? = nil,
          @source_location_name : String? = nil,
          @vod_source_name : String? = nil
        )
        end
      end


      struct DescribeSourceLocationRequest
        include JSON::Serializable

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        def initialize(
          @source_location_name : String
        )
        end
      end


      struct DescribeSourceLocationResponse
        include JSON::Serializable

        # The access configuration for the source location.

        @[JSON::Field(key: "AccessConfiguration")]
        getter access_configuration : Types::AccessConfiguration?

        # The ARN of the source location.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp that indicates when the source location was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The default segment delivery configuration settings.

        @[JSON::Field(key: "DefaultSegmentDeliveryConfiguration")]
        getter default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration?

        # The HTTP package configuration settings for the source location.

        @[JSON::Field(key: "HttpConfiguration")]
        getter http_configuration : Types::HttpConfiguration?

        # The timestamp that indicates when the source location was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # A list of the segment delivery configurations associated with this resource.

        @[JSON::Field(key: "SegmentDeliveryConfigurations")]
        getter segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)?

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The tags assigned to the source location. Tags are key-value pairs that you can associate with
        # Amazon resources to help with organization, access control, and cost tracking. For more information,
        # see Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @access_configuration : Types::AccessConfiguration? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration? = nil,
          @http_configuration : Types::HttpConfiguration? = nil,
          @last_modified_time : Time? = nil,
          @segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)? = nil,
          @source_location_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeVodSourceRequest
        include JSON::Serializable

        # The name of the source location associated with this VOD Source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The name of the VOD Source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String

        def initialize(
          @source_location_name : String,
          @vod_source_name : String
        )
        end
      end


      struct DescribeVodSourceResponse
        include JSON::Serializable

        # The ad break opportunities within the VOD source.

        @[JSON::Field(key: "AdBreakOpportunities")]
        getter ad_break_opportunities : Array(Types::AdBreakOpportunity)?

        # The ARN of the VOD source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp that indicates when the VOD source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The HTTP package configurations.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)?

        # The last modified time of the VOD source.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the source location associated with the VOD source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The tags assigned to the VOD source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The name of the VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @ad_break_opportunities : Array(Types::AdBreakOpportunity)? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @http_package_configurations : Array(Types::HttpPackageConfiguration)? = nil,
          @last_modified_time : Time? = nil,
          @source_location_name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vod_source_name : String? = nil
        )
        end
      end


      struct GetChannelPolicyRequest
        include JSON::Serializable

        # The name of the channel associated with this Channel Policy.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_name : String
        )
        end
      end


      struct GetChannelPolicyResponse
        include JSON::Serializable

        # The IAM policy for the channel. IAM policies are used to control access to your channel.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetChannelScheduleRequest
        include JSON::Serializable

        # The name of the channel associated with this Channel Schedule.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The single audience for GetChannelScheduleRequest.

        @[JSON::Field(key: "audience")]
        getter audience : String?

        # The duration in minutes of the channel schedule.

        @[JSON::Field(key: "durationMinutes")]
        getter duration_minutes : String?

        # The maximum number of channel schedules that you want MediaTailor to return in response to the
        # current request. If there are more than MaxResults channel schedules, use the value of NextToken in
        # the response to get the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # (Optional) If the playback configuration has more than MaxResults channel schedules, use NextToken
        # to get the second and subsequent pages of results. For the first GetChannelScheduleRequest request,
        # omit this value. For the second and subsequent requests, get the value of NextToken from the
        # previous response and specify that value for NextToken in the request. If the previous response
        # didn't include a NextToken element, there are no more channel schedules to get.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_name : String,
          @audience : String? = nil,
          @duration_minutes : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetChannelScheduleResponse
        include JSON::Serializable

        # A list of schedule entries for the channel.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ScheduleEntry)?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ScheduleEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetPlaybackConfigurationRequest
        include JSON::Serializable

        # The identifier for the playback configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetPlaybackConfigurationResponse
        include JSON::Serializable

        # The setting that indicates what conditioning MediaTailor will perform on ads that the ad decision
        # server (ADS) returns, and what priority MediaTailor uses when inserting ads.

        @[JSON::Field(key: "AdConditioningConfiguration")]
        getter ad_conditioning_configuration : Types::AdConditioningConfiguration?

        # The configuration for customizing HTTP requests to the ad decision server (ADS). This includes
        # settings for request method, headers, body content, and compression options.

        @[JSON::Field(key: "AdDecisionServerConfiguration")]
        getter ad_decision_server_configuration : Types::AdDecisionServerConfiguration?

        # The URL for the ad decision server (ADS). This includes the specification of static parameters and
        # placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes player-specific and
        # session-specific parameters as needed when calling the ADS. Alternately, for testing, you can
        # provide a static VAST URL. The maximum length is 25,000 characters.

        @[JSON::Field(key: "AdDecisionServerUrl")]
        getter ad_decision_server_url : String?

        # The configuration for avail suppression, also known as ad suppression. For more information about ad
        # suppression, see Ad Suppression .

        @[JSON::Field(key: "AvailSuppression")]
        getter avail_suppression : Types::AvailSuppression?

        # The configuration for bumpers. Bumpers are short audio or video clips that play at the start or
        # before the end of an ad break. To learn more about bumpers, see Bumpers .

        @[JSON::Field(key: "Bumper")]
        getter bumper : Types::Bumper?

        # The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content
        # and ad segment management.

        @[JSON::Field(key: "CdnConfiguration")]
        getter cdn_configuration : Types::CdnConfiguration?

        # The player parameters and aliases used as dynamic variables during session initialization. For more
        # information, see Domain Variables .

        @[JSON::Field(key: "ConfigurationAliases")]
        getter configuration_aliases : Hash(String, Hash(String, String))?

        # The configuration for DASH content.

        @[JSON::Field(key: "DashConfiguration")]
        getter dash_configuration : Types::DashConfiguration?

        # The configuration for HLS content.

        @[JSON::Field(key: "HlsConfiguration")]
        getter hls_configuration : Types::HlsConfiguration?

        # The setting that controls whether players can use stitched or guided ad insertion. The default,
        # STITCHED_ONLY , forces all player sessions to use stitched (server-side) ad insertion. Choosing
        # PLAYER_SELECT allows players to select either stitched or guided ad insertion at
        # session-initialization time. The default for players that do not specify an insertion mode is
        # stitched.

        @[JSON::Field(key: "InsertionMode")]
        getter insertion_mode : String?

        # The configuration for pre-roll ad insertion.

        @[JSON::Field(key: "LivePreRollConfiguration")]
        getter live_pre_roll_configuration : Types::LivePreRollConfiguration?

        # The configuration that defines where AWS Elemental MediaTailor sends logs for the playback
        # configuration.

        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The configuration for manifest processing rules. Manifest processing rules enable customization of
        # the personalized manifests created by MediaTailor.

        @[JSON::Field(key: "ManifestProcessingRules")]
        getter manifest_processing_rules : Types::ManifestProcessingRules?

        # The identifier for the playback configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Defines the maximum duration of underfilled ad time (in seconds) allowed in an ad break. If the
        # duration of underfilled ad time exceeds the personalization threshold, then the personalization of
        # the ad break is abandoned and the underlying content is shown. This feature applies to ad
        # replacement in live and VOD streams, rather than ad insertion, because it relies on an underlying
        # content stream. For more information about ad break behavior, including ad replacement and
        # insertion, see Ad Behavior in AWS Elemental MediaTailor .

        @[JSON::Field(key: "PersonalizationThresholdSeconds")]
        getter personalization_threshold_seconds : Int32?

        # The Amazon Resource Name (ARN) for the playback configuration.

        @[JSON::Field(key: "PlaybackConfigurationArn")]
        getter playback_configuration_arn : String?

        # The URL that the player accesses to get a manifest from AWS Elemental MediaTailor. This session will
        # use server-side reporting.

        @[JSON::Field(key: "PlaybackEndpointPrefix")]
        getter playback_endpoint_prefix : String?

        # The URL that the player uses to initialize a session that uses client-side reporting.

        @[JSON::Field(key: "SessionInitializationEndpointPrefix")]
        getter session_initialization_endpoint_prefix : String?

        # The URL for a high-quality video asset to transcode and use to fill in time that's not used by ads.
        # AWS Elemental MediaTailor shows the slate to fill in gaps in media content. Configuring the slate is
        # optional for non-VPAID playback configurations. For VPAID, the slate is required because MediaTailor
        # provides it in the slots designated for dynamic ad content. The slate must be a high-quality asset
        # that contains both audio and video.

        @[JSON::Field(key: "SlateAdUrl")]
        getter slate_ad_url : String?

        # The tags assigned to the playback configuration. Tags are key-value pairs that you can associate
        # with Amazon resources to help with organization, access control, and cost tracking. For more
        # information, see Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The name that is used to associate this playback configuration with a custom transcode profile. This
        # overrides the dynamic transcoding defaults of MediaTailor. Use this only if you have already set up
        # custom profiles with the help of AWS Support.

        @[JSON::Field(key: "TranscodeProfileName")]
        getter transcode_profile_name : String?

        # The URL prefix for the parent manifest for the stream, minus the asset ID. The maximum length is 512
        # characters.

        @[JSON::Field(key: "VideoContentSourceUrl")]
        getter video_content_source_url : String?

        def initialize(
          @ad_conditioning_configuration : Types::AdConditioningConfiguration? = nil,
          @ad_decision_server_configuration : Types::AdDecisionServerConfiguration? = nil,
          @ad_decision_server_url : String? = nil,
          @avail_suppression : Types::AvailSuppression? = nil,
          @bumper : Types::Bumper? = nil,
          @cdn_configuration : Types::CdnConfiguration? = nil,
          @configuration_aliases : Hash(String, Hash(String, String))? = nil,
          @dash_configuration : Types::DashConfiguration? = nil,
          @hls_configuration : Types::HlsConfiguration? = nil,
          @insertion_mode : String? = nil,
          @live_pre_roll_configuration : Types::LivePreRollConfiguration? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @manifest_processing_rules : Types::ManifestProcessingRules? = nil,
          @name : String? = nil,
          @personalization_threshold_seconds : Int32? = nil,
          @playback_configuration_arn : String? = nil,
          @playback_endpoint_prefix : String? = nil,
          @session_initialization_endpoint_prefix : String? = nil,
          @slate_ad_url : String? = nil,
          @tags : Hash(String, String)? = nil,
          @transcode_profile_name : String? = nil,
          @video_content_source_url : String? = nil
        )
        end
      end


      struct GetPrefetchScheduleRequest
        include JSON::Serializable

        # The name of the prefetch schedule. The name must be unique among all prefetch schedules that are
        # associated with the specified playback configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Returns information about the prefetch schedule for a specific playback configuration. If you call
        # GetPrefetchSchedule on an expired prefetch schedule, MediaTailor returns an HTTP 404 status code.

        @[JSON::Field(key: "PlaybackConfigurationName")]
        getter playback_configuration_name : String

        def initialize(
          @name : String,
          @playback_configuration_name : String
        )
        end
      end


      struct GetPrefetchScheduleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the prefetch schedule.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The configuration settings for how and when MediaTailor consumes prefetched ads from the ad decision
        # server for single prefetch schedules. Each consumption configuration contains an end time and an
        # optional start time that define the consumption window . Prefetch schedules automatically expire no
        # earlier than seven days after the end time.

        @[JSON::Field(key: "Consumption")]
        getter consumption : Types::PrefetchConsumption?

        # The name of the prefetch schedule. The name must be unique among all prefetch schedules that are
        # associated with the specified playback configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The name of the playback configuration to create the prefetch schedule for.

        @[JSON::Field(key: "PlaybackConfigurationName")]
        getter playback_configuration_name : String?

        # The configuration that defines how and when MediaTailor performs ad prefetching in a live event.

        @[JSON::Field(key: "RecurringPrefetchConfiguration")]
        getter recurring_prefetch_configuration : Types::RecurringPrefetchConfiguration?

        # A complex type that contains settings for prefetch retrieval from the ad decision server (ADS).

        @[JSON::Field(key: "Retrieval")]
        getter retrieval : Types::PrefetchRetrieval?

        # The frequency that MediaTailor creates prefetch schedules. SINGLE indicates that this schedule
        # applies to one ad break. RECURRING indicates that MediaTailor automatically creates a schedule for
        # each ad avail in a live event.

        @[JSON::Field(key: "ScheduleType")]
        getter schedule_type : String?

        # An optional stream identifier that you can specify in order to prefetch for multiple streams that
        # use the same playback configuration.

        @[JSON::Field(key: "StreamId")]
        getter stream_id : String?

        def initialize(
          @arn : String? = nil,
          @consumption : Types::PrefetchConsumption? = nil,
          @name : String? = nil,
          @playback_configuration_name : String? = nil,
          @recurring_prefetch_configuration : Types::RecurringPrefetchConfiguration? = nil,
          @retrieval : Types::PrefetchRetrieval? = nil,
          @schedule_type : String? = nil,
          @stream_id : String? = nil
        )
        end
      end

      # The configuration for HLS content.

      struct HlsConfiguration
        include JSON::Serializable

        # The URL that is used to initiate a playback session for devices that support Apple HLS. The session
        # uses server-side reporting.

        @[JSON::Field(key: "ManifestEndpointPrefix")]
        getter manifest_endpoint_prefix : String?

        def initialize(
          @manifest_endpoint_prefix : String? = nil
        )
        end
      end

      # HLS playlist configuration parameters.

      struct HlsPlaylistSettings
        include JSON::Serializable

        # Determines the type of SCTE 35 tags to use in ad markup. Specify DATERANGE to use DATERANGE tags
        # (for live or VOD content). Specify SCTE35_ENHANCED to use EXT-X-CUE-OUT and EXT-X-CUE-IN tags (for
        # VOD content only).

        @[JSON::Field(key: "AdMarkupType")]
        getter ad_markup_type : Array(String)?

        # The total duration (in seconds) of each manifest. Minimum value: 30 seconds. Maximum value: 3600
        # seconds.

        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        def initialize(
          @ad_markup_type : Array(String)? = nil,
          @manifest_window_seconds : Int32? = nil
        )
        end
      end

      # The HTTP configuration for the source location.

      struct HttpConfiguration
        include JSON::Serializable

        # The base URL for the source location host server. This string must include the protocol, such as
        # https:// .

        @[JSON::Field(key: "BaseUrl")]
        getter base_url : String

        def initialize(
          @base_url : String
        )
        end
      end

      # The HTTP package configuration properties for the requested VOD source.

      struct HttpPackageConfiguration
        include JSON::Serializable

        # The relative path to the URL for this VOD source. This is combined with
        # SourceLocation::HttpConfiguration::BaseUrl to form a valid URL.

        @[JSON::Field(key: "Path")]
        getter path : String

        # The name of the source group. This has to match one of the Channel::Outputs::SourceGroup .

        @[JSON::Field(key: "SourceGroup")]
        getter source_group : String

        # The streaming protocol for this package configuration. Supported values are HLS and DASH .

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @path : String,
          @source_group : String,
          @type : String
        )
        end
      end

      # HTTP request configuration parameters that define how MediaTailor communicates with the ad decision
      # server.

      struct HttpRequest
        include JSON::Serializable

        # The request body content to send with HTTP requests to the ad decision server. This value is only
        # eligible for POST requests.

        @[JSON::Field(key: "Body")]
        getter body : String?

        # The compression method to apply to requests sent to the ad decision server. Supported values are
        # NONE and GZIP . This value is only eligible for POST requests.

        @[JSON::Field(key: "CompressRequest")]
        getter compress_request : String?

        # Custom HTTP headers to include in requests to the ad decision server. Specify headers as key-value
        # pairs. This value is only eligible for POST requests.

        @[JSON::Field(key: "Headers")]
        getter headers : Hash(String, String)?

        # The HTTP method to use when making requests to the ad decision server. Supported values are GET and
        # POST .

        @[JSON::Field(key: "Method")]
        getter method : String?

        def initialize(
          @body : String? = nil,
          @compress_request : String? = nil,
          @headers : Hash(String, String)? = nil,
          @method : String? = nil
        )
        end
      end

      # For SCTE35_ENHANCED output, defines a key and corresponding value. MediaTailor generates these pairs
      # within the EXT-X-ASSET tag.

      struct KeyValuePair
        include JSON::Serializable

        # For SCTE35_ENHANCED output, defines a key. MediaTailor takes this key, and its associated value, and
        # generates the key/value pair within the EXT-X-ASSET tag. If you specify a key, you must also specify
        # a corresponding value.

        @[JSON::Field(key: "Key")]
        getter key : String

        # For SCTE35_ENHANCED output, defines a value. MediaTailor; takes this value, and its associated key,
        # and generates the key/value pair within the EXT-X-ASSET tag. If you specify a value, you must also
        # specify a corresponding key.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct ListAlertsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The maximum number of alerts that you want MediaTailor to return in response to the current request.
        # If there are more than MaxResults alerts, use the value of NextToken in the response to get the next
        # page of results. The default value is 100. MediaTailor uses DynamoDB-based pagination, which means
        # that a response might contain fewer than MaxResults items, including 0 items, even when more results
        # are available. To retrieve all results, you must continue making requests using the NextToken value
        # from each response until the response no longer includes a NextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results. For the first ListAlerts request, omit this value. For subsequent
        # requests, get the value of NextToken from the previous response and specify that value for NextToken
        # in the request. Continue making requests until the response no longer includes a NextToken value,
        # which indicates that all results have been retrieved.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAlertsResponse
        include JSON::Serializable

        # A list of alerts that are associated with this resource.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Alert)?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Alert)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelsRequest
        include JSON::Serializable

        # The maximum number of channels that you want MediaTailor to return in response to the current
        # request. If there are more than MaxResults channels, use the value of NextToken in the response to
        # get the next page of results. The default value is 100. MediaTailor uses DynamoDB-based pagination,
        # which means that a response might contain fewer than MaxResults items, including 0 items, even when
        # more results are available. To retrieve all results, you must continue making requests using the
        # NextToken value from each response until the response no longer includes a NextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results. For the first ListChannels request, omit this value. For
        # subsequent requests, get the value of NextToken from the previous response and specify that value
        # for NextToken in the request. Continue making requests until the response no longer includes a
        # NextToken value, which indicates that all results have been retrieved.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChannelsResponse
        include JSON::Serializable

        # A list of channels that are associated with this account.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Channel)?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Channel)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLiveSourcesRequest
        include JSON::Serializable

        # The name of the source location associated with this Live Sources list.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The maximum number of live sources that you want MediaTailor to return in response to the current
        # request. If there are more than MaxResults live sources, use the value of NextToken in the response
        # to get the next page of results. The default value is 100. MediaTailor uses DynamoDB-based
        # pagination, which means that a response might contain fewer than MaxResults items, including 0
        # items, even when more results are available. To retrieve all results, you must continue making
        # requests using the NextToken value from each response until the response no longer includes a
        # NextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results. For the first ListLiveSources request, omit this value. For
        # subsequent requests, get the value of NextToken from the previous response and specify that value
        # for NextToken in the request. Continue making requests until the response no longer includes a
        # NextToken value, which indicates that all results have been retrieved.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @source_location_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLiveSourcesResponse
        include JSON::Serializable

        # Lists the live sources.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::LiveSource)?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::LiveSource)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPlaybackConfigurationsRequest
        include JSON::Serializable

        # The maximum number of playback configurations that you want MediaTailor to return in response to the
        # current request. If there are more than MaxResults playback configurations, use the value of
        # NextToken in the response to get the next page of results. The default value is 100. MediaTailor
        # uses DynamoDB-based pagination, which means that a response might contain fewer than MaxResults
        # items, including 0 items, even when more results are available. To retrieve all results, you must
        # continue making requests using the NextToken value from each response until the response no longer
        # includes a NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results. For the first ListPlaybackConfigurations request, omit this
        # value. For subsequent requests, get the value of NextToken from the previous response and specify
        # that value for NextToken in the request. Continue making requests until the response no longer
        # includes a NextToken value, which indicates that all results have been retrieved.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPlaybackConfigurationsResponse
        include JSON::Serializable

        # Array of playback configurations. This might be all the available configurations or a subset,
        # depending on the settings that you provide and the total number of configurations stored.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::PlaybackConfiguration)?

        # Pagination token returned by the GET list request when results exceed the maximum allowed. Use the
        # token to fetch the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::PlaybackConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPrefetchSchedulesRequest
        include JSON::Serializable

        # Retrieves the prefetch schedule(s) for a specific playback configuration.

        @[JSON::Field(key: "PlaybackConfigurationName")]
        getter playback_configuration_name : String

        # The maximum number of prefetch schedules that you want MediaTailor to return in response to the
        # current request. If there are more than MaxResults prefetch schedules, use the value of NextToken in
        # the response to get the next page of results. The default value is 100. MediaTailor uses
        # DynamoDB-based pagination, which means that a response might contain fewer than MaxResults items,
        # including 0 items, even when more results are available. To retrieve all results, you must continue
        # making requests using the NextToken value from each response until the response no longer includes a
        # NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results. For the first ListPrefetchSchedules request, omit this value. For
        # subsequent requests, get the value of NextToken from the previous response and specify that value
        # for NextToken in the request. Continue making requests until the response no longer includes a
        # NextToken value, which indicates that all results have been retrieved.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of prefetch schedules that you want to list. SINGLE indicates that you want to list the
        # configured single prefetch schedules. RECURRING indicates that you want to list the configured
        # recurring prefetch schedules. ALL indicates that you want to list all configured prefetch schedules.

        @[JSON::Field(key: "ScheduleType")]
        getter schedule_type : String?

        # An optional filtering parameter whereby MediaTailor filters the prefetch schedules to include only
        # specific streams.

        @[JSON::Field(key: "StreamId")]
        getter stream_id : String?

        def initialize(
          @playback_configuration_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @schedule_type : String? = nil,
          @stream_id : String? = nil
        )
        end
      end


      struct ListPrefetchSchedulesResponse
        include JSON::Serializable

        # Lists the prefetch schedules. An empty Items list doesn't mean there aren't more items to fetch,
        # just that that page was empty.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::PrefetchSchedule)?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::PrefetchSchedule)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSourceLocationsRequest
        include JSON::Serializable

        # The maximum number of source locations that you want MediaTailor to return in response to the
        # current request. If there are more than MaxResults source locations, use the value of NextToken in
        # the response to get the next page of results. The default value is 100. MediaTailor uses
        # DynamoDB-based pagination, which means that a response might contain fewer than MaxResults items,
        # including 0 items, even when more results are available. To retrieve all results, you must continue
        # making requests using the NextToken value from each response until the response no longer includes a
        # NextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results. For the first ListSourceLocations request, omit this value. For
        # subsequent requests, get the value of NextToken from the previous response and specify that value
        # for NextToken in the request. Continue making requests until the response no longer includes a
        # NextToken value, which indicates that all results have been retrieved.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSourceLocationsResponse
        include JSON::Serializable

        # A list of source locations.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::SourceLocation)?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SourceLocation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with this resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with this resource. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListVodSourcesRequest
        include JSON::Serializable

        # The name of the source location associated with this VOD Source list.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The maximum number of VOD sources that you want MediaTailor to return in response to the current
        # request. If there are more than MaxResults VOD sources, use the value of NextToken in the response
        # to get the next page of results. The default value is 100. MediaTailor uses DynamoDB-based
        # pagination, which means that a response might contain fewer than MaxResults items, including 0
        # items, even when more results are available. To retrieve all results, you must continue making
        # requests using the NextToken value from each response until the response no longer includes a
        # NextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results. For the first ListVodSources request, omit this value. For
        # subsequent requests, get the value of NextToken from the previous response and specify that value
        # for NextToken in the request. Continue making requests until the response no longer includes a
        # NextToken value, which indicates that all results have been retrieved.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @source_location_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVodSourcesResponse
        include JSON::Serializable

        # Lists the VOD sources.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::VodSource)?

        # Pagination token returned by the list request when results exceed the maximum allowed. Use the token
        # to fetch the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::VodSource)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The configuration for pre-roll ad insertion.

      struct LivePreRollConfiguration
        include JSON::Serializable

        # The URL for the ad decision server (ADS) for pre-roll ads. This includes the specification of static
        # parameters and placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes
        # player-specific and session-specific parameters as needed when calling the ADS. Alternately, for
        # testing, you can provide a static VAST URL. The maximum length is 25,000 characters.

        @[JSON::Field(key: "AdDecisionServerUrl")]
        getter ad_decision_server_url : String?

        # The maximum allowed duration for the pre-roll ad avail. AWS Elemental MediaTailor won't play
        # pre-roll ads to exceed this duration, regardless of the total duration of ads that the ADS returns.

        @[JSON::Field(key: "MaxDurationSeconds")]
        getter max_duration_seconds : Int32?

        def initialize(
          @ad_decision_server_url : String? = nil,
          @max_duration_seconds : Int32? = nil
        )
        end
      end

      # Live source configuration parameters.

      struct LiveSource
        include JSON::Serializable

        # The ARN for the live source.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The HTTP package configurations for the live source.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)

        # The name that's used to refer to a live source.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The timestamp that indicates when the live source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The timestamp that indicates when the live source was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The tags assigned to the live source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @http_package_configurations : Array(Types::HttpPackageConfiguration),
          @live_source_name : String,
          @source_location_name : String,
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Defines where AWS Elemental MediaTailor sends logs for the playback configuration.

      struct LogConfiguration
        include JSON::Serializable

        # The method used for collecting logs from AWS Elemental MediaTailor. LEGACY_CLOUDWATCH indicates that
        # MediaTailor is sending logs directly to Amazon CloudWatch Logs. VENDED_LOGS indicates that
        # MediaTailor is sending logs to CloudWatch, which then vends the logs to your destination of choice.
        # Supported destinations are CloudWatch Logs log group, Amazon S3 bucket, and Amazon Data Firehose
        # stream.

        @[JSON::Field(key: "EnabledLoggingStrategies")]
        getter enabled_logging_strategies : Array(String)

        # The percentage of session logs that MediaTailor sends to your configured log destination. For
        # example, if your playback configuration has 1000 sessions and percentEnabled is set to 60 ,
        # MediaTailor sends logs for 600 of the sessions to CloudWatch Logs. MediaTailor decides at random
        # which of the playback configuration sessions to send logs for. If you want to view logs for a
        # specific session, you can use the debug log mode . Valid values: 0 - 100

        @[JSON::Field(key: "PercentEnabled")]
        getter percent_enabled : Int32

        # Settings for customizing what events are included in logs for interactions with the ad decision
        # server (ADS).

        @[JSON::Field(key: "AdsInteractionLog")]
        getter ads_interaction_log : Types::AdsInteractionLog?

        # Settings for customizing what events are included in logs for interactions with the origin server.

        @[JSON::Field(key: "ManifestServiceInteractionLog")]
        getter manifest_service_interaction_log : Types::ManifestServiceInteractionLog?

        def initialize(
          @enabled_logging_strategies : Array(String),
          @percent_enabled : Int32,
          @ads_interaction_log : Types::AdsInteractionLog? = nil,
          @manifest_service_interaction_log : Types::ManifestServiceInteractionLog? = nil
        )
        end
      end

      # The log configuration for the channel.

      struct LogConfigurationForChannel
        include JSON::Serializable

        # The log types.

        @[JSON::Field(key: "LogTypes")]
        getter log_types : Array(String)?

        def initialize(
          @log_types : Array(String)? = nil
        )
        end
      end

      # The configuration for manifest processing rules. Manifest processing rules enable customization of
      # the personalized manifests created by MediaTailor.

      struct ManifestProcessingRules
        include JSON::Serializable

        # For HLS, when set to true , MediaTailor passes through EXT-X-CUE-IN , EXT-X-CUE-OUT , and
        # EXT-X-SPLICEPOINT-SCTE35 ad markers from the origin manifest to the MediaTailor personalized
        # manifest. No logic is applied to these ad markers. For example, if EXT-X-CUE-OUT has a value of 60 ,
        # but no ads are filled for that ad break, MediaTailor will not set the value to 0 .

        @[JSON::Field(key: "AdMarkerPassthrough")]
        getter ad_marker_passthrough : Types::AdMarkerPassthrough?

        def initialize(
          @ad_marker_passthrough : Types::AdMarkerPassthrough? = nil
        )
        end
      end

      # Settings for customizing what events are included in logs for interactions with the origin server.
      # For more information about manifest service logs, including descriptions of the event types, see
      # MediaTailor manifest logs description and event types in Elemental MediaTailor User Guide.

      struct ManifestServiceInteractionLog
        include JSON::Serializable

        # Indicates that MediaTailor won't emit the selected events in the logs for playback sessions that are
        # initialized with this configuration.

        @[JSON::Field(key: "ExcludeEventTypes")]
        getter exclude_event_types : Array(String)?

        def initialize(
          @exclude_event_types : Array(String)? = nil
        )
        end
      end

      # A playback configuration. For information about MediaTailor configurations, see Working with
      # configurations in AWS Elemental MediaTailor .

      struct PlaybackConfiguration
        include JSON::Serializable

        # The setting that indicates what conditioning MediaTailor will perform on ads that the ad decision
        # server (ADS) returns, and what priority MediaTailor uses when inserting ads.

        @[JSON::Field(key: "AdConditioningConfiguration")]
        getter ad_conditioning_configuration : Types::AdConditioningConfiguration?


        @[JSON::Field(key: "AdDecisionServerConfiguration")]
        getter ad_decision_server_configuration : Types::AdDecisionServerConfiguration?

        # The URL for the ad decision server (ADS). This includes the specification of static parameters and
        # placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes player-specific and
        # session-specific parameters as needed when calling the ADS. Alternately, for testing you can provide
        # a static VAST URL. The maximum length is 25,000 characters.

        @[JSON::Field(key: "AdDecisionServerUrl")]
        getter ad_decision_server_url : String?

        # The configuration for avail suppression, also known as ad suppression. For more information about ad
        # suppression, see Ad Suppression .

        @[JSON::Field(key: "AvailSuppression")]
        getter avail_suppression : Types::AvailSuppression?

        # The configuration for bumpers. Bumpers are short audio or video clips that play at the start or
        # before the end of an ad break. To learn more about bumpers, see Bumpers .

        @[JSON::Field(key: "Bumper")]
        getter bumper : Types::Bumper?

        # The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content
        # and ad segment management.

        @[JSON::Field(key: "CdnConfiguration")]
        getter cdn_configuration : Types::CdnConfiguration?

        # The player parameters and aliases used as dynamic variables during session initialization. For more
        # information, see Domain Variables .

        @[JSON::Field(key: "ConfigurationAliases")]
        getter configuration_aliases : Hash(String, Hash(String, String))?

        # The configuration for a DASH source.

        @[JSON::Field(key: "DashConfiguration")]
        getter dash_configuration : Types::DashConfiguration?

        # The configuration for HLS content.

        @[JSON::Field(key: "HlsConfiguration")]
        getter hls_configuration : Types::HlsConfiguration?

        # The setting that controls whether players can use stitched or guided ad insertion. The default,
        # STITCHED_ONLY , forces all player sessions to use stitched (server-side) ad insertion. Choosing
        # PLAYER_SELECT allows players to select either stitched or guided ad insertion at
        # session-initialization time. The default for players that do not specify an insertion mode is
        # stitched.

        @[JSON::Field(key: "InsertionMode")]
        getter insertion_mode : String?

        # The configuration for pre-roll ad insertion.

        @[JSON::Field(key: "LivePreRollConfiguration")]
        getter live_pre_roll_configuration : Types::LivePreRollConfiguration?

        # Defines where AWS Elemental MediaTailor sends logs for the playback configuration.

        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The configuration for manifest processing rules. Manifest processing rules enable customization of
        # the personalized manifests created by MediaTailor.

        @[JSON::Field(key: "ManifestProcessingRules")]
        getter manifest_processing_rules : Types::ManifestProcessingRules?

        # The identifier for the playback configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Defines the maximum duration of underfilled ad time (in seconds) allowed in an ad break. If the
        # duration of underfilled ad time exceeds the personalization threshold, then the personalization of
        # the ad break is abandoned and the underlying content is shown. This feature applies to ad
        # replacement in live and VOD streams, rather than ad insertion, because it relies on an underlying
        # content stream. For more information about ad break behavior, including ad replacement and
        # insertion, see Ad Behavior in AWS Elemental MediaTailor .

        @[JSON::Field(key: "PersonalizationThresholdSeconds")]
        getter personalization_threshold_seconds : Int32?

        # The Amazon Resource Name (ARN) for the playback configuration.

        @[JSON::Field(key: "PlaybackConfigurationArn")]
        getter playback_configuration_arn : String?

        # The URL that the player accesses to get a manifest from AWS Elemental MediaTailor.

        @[JSON::Field(key: "PlaybackEndpointPrefix")]
        getter playback_endpoint_prefix : String?

        # The URL that the player uses to initialize a session that uses client-side reporting.

        @[JSON::Field(key: "SessionInitializationEndpointPrefix")]
        getter session_initialization_endpoint_prefix : String?

        # The URL for a video asset to transcode and use to fill in time that's not used by ads. AWS Elemental
        # MediaTailor shows the slate to fill in gaps in media content. Configuring the slate is optional for
        # non-VPAID playback configurations. For VPAID, the slate is required because MediaTailor provides it
        # in the slots designated for dynamic ad content. The slate must be a high-quality asset that contains
        # both audio and video.

        @[JSON::Field(key: "SlateAdUrl")]
        getter slate_ad_url : String?

        # The tags to assign to the playback configuration. Tags are key-value pairs that you can associate
        # with Amazon resources to help with organization, access control, and cost tracking. For more
        # information, see Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The name that is used to associate this playback configuration with a custom transcode profile. This
        # overrides the dynamic transcoding defaults of MediaTailor. Use this only if you have already set up
        # custom profiles with the help of AWS Support.

        @[JSON::Field(key: "TranscodeProfileName")]
        getter transcode_profile_name : String?

        # The URL prefix for the parent manifest for the stream, minus the asset ID. The maximum length is 512
        # characters.

        @[JSON::Field(key: "VideoContentSourceUrl")]
        getter video_content_source_url : String?

        def initialize(
          @ad_conditioning_configuration : Types::AdConditioningConfiguration? = nil,
          @ad_decision_server_configuration : Types::AdDecisionServerConfiguration? = nil,
          @ad_decision_server_url : String? = nil,
          @avail_suppression : Types::AvailSuppression? = nil,
          @bumper : Types::Bumper? = nil,
          @cdn_configuration : Types::CdnConfiguration? = nil,
          @configuration_aliases : Hash(String, Hash(String, String))? = nil,
          @dash_configuration : Types::DashConfiguration? = nil,
          @hls_configuration : Types::HlsConfiguration? = nil,
          @insertion_mode : String? = nil,
          @live_pre_roll_configuration : Types::LivePreRollConfiguration? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @manifest_processing_rules : Types::ManifestProcessingRules? = nil,
          @name : String? = nil,
          @personalization_threshold_seconds : Int32? = nil,
          @playback_configuration_arn : String? = nil,
          @playback_endpoint_prefix : String? = nil,
          @session_initialization_endpoint_prefix : String? = nil,
          @slate_ad_url : String? = nil,
          @tags : Hash(String, String)? = nil,
          @transcode_profile_name : String? = nil,
          @video_content_source_url : String? = nil
        )
        end
      end

      # For single prefetch, describes how and when that MediaTailor places prefetched ads into upcoming ad
      # breaks.

      struct PrefetchConsumption
        include JSON::Serializable

        # The time when MediaTailor no longer considers the prefetched ads for use in an ad break. MediaTailor
        # automatically deletes prefetch schedules no less than seven days after the end time. If you'd like
        # to manually delete the prefetch schedule, you can call DeletePrefetchSchedule .

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # If you only want MediaTailor to insert prefetched ads into avails (ad breaks) that match specific
        # dynamic variables, such as scte.event_id , set the avail matching criteria.

        @[JSON::Field(key: "AvailMatchingCriteria")]
        getter avail_matching_criteria : Array(Types::AvailMatchingCriteria)?

        # The time when prefetched ads are considered for use in an ad break. If you don't specify StartTime ,
        # the prefetched ads are available after MediaTailor retrieves them from the ad decision server.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time,
          @avail_matching_criteria : Array(Types::AvailMatchingCriteria)? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # A complex type that contains settings governing when MediaTailor prefetches ads, and which dynamic
      # variables that MediaTailor includes in the request to the ad decision server.

      struct PrefetchRetrieval
        include JSON::Serializable

        # The time when prefetch retrieval ends for the ad break. Prefetching will be attempted for manifest
        # requests that occur at or before this time.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The dynamic variables to use for substitution during prefetch requests to the ad decision server
        # (ADS). You initially configure dynamic variables for the ADS URL when you set up your playback
        # configuration. When you specify DynamicVariables for prefetch retrieval, MediaTailor includes the
        # dynamic variables in the request to the ADS.

        @[JSON::Field(key: "DynamicVariables")]
        getter dynamic_variables : Hash(String, String)?

        # The time when prefetch retrievals can start for this break. Ad prefetching will be attempted for
        # manifest requests that occur at or after this time. Defaults to the current time. If not specified,
        # the prefetch retrieval starts as soon as possible.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The configuration that tells Elemental MediaTailor how many seconds to spread out requests to the ad
        # decision server (ADS). Instead of sending ADS requests for all sessions at the same time,
        # MediaTailor spreads the requests across the amount of time specified in the retrieval window.

        @[JSON::Field(key: "TrafficShapingRetrievalWindow")]
        getter traffic_shaping_retrieval_window : Types::TrafficShapingRetrievalWindow?

        # The configuration for TPS-based traffic shaping. This approach limits requests to the ad decision
        # server (ADS) based on transactions per second and concurrent users.

        @[JSON::Field(key: "TrafficShapingTpsConfiguration")]
        getter traffic_shaping_tps_configuration : Types::TrafficShapingTpsConfiguration?

        # Indicates the type of traffic shaping used to limit the number of requests to the ADS at one time.

        @[JSON::Field(key: "TrafficShapingType")]
        getter traffic_shaping_type : String?

        def initialize(
          @end_time : Time,
          @dynamic_variables : Hash(String, String)? = nil,
          @start_time : Time? = nil,
          @traffic_shaping_retrieval_window : Types::TrafficShapingRetrievalWindow? = nil,
          @traffic_shaping_tps_configuration : Types::TrafficShapingTpsConfiguration? = nil,
          @traffic_shaping_type : String? = nil
        )
        end
      end

      # A prefetch schedule allows you to tell MediaTailor to fetch and prepare certain ads before an ad
      # break happens. For more information about ad prefetching, see Using ad prefetching in the
      # MediaTailor User Guide .

      struct PrefetchSchedule
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the prefetch schedule.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the prefetch schedule. The name must be unique among all prefetch schedules that are
        # associated with the specified playback configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the playback configuration to create the prefetch schedule for.

        @[JSON::Field(key: "PlaybackConfigurationName")]
        getter playback_configuration_name : String

        # Consumption settings determine how, and when, MediaTailor places the prefetched ads into ad breaks
        # for single prefetch schedules. Ad consumption occurs within a span of time that you define, called a
        # consumption window . You can designate which ad breaks that MediaTailor fills with prefetch ads by
        # setting avail matching criteria.

        @[JSON::Field(key: "Consumption")]
        getter consumption : Types::PrefetchConsumption?

        # The settings that determine how and when MediaTailor prefetches ads and inserts them into ad breaks.

        @[JSON::Field(key: "RecurringPrefetchConfiguration")]
        getter recurring_prefetch_configuration : Types::RecurringPrefetchConfiguration?

        # A complex type that contains settings for prefetch retrieval from the ad decision server (ADS).

        @[JSON::Field(key: "Retrieval")]
        getter retrieval : Types::PrefetchRetrieval?

        # The frequency that MediaTailor creates prefetch schedules. SINGLE indicates that this schedule
        # applies to one ad break. RECURRING indicates that MediaTailor automatically creates a schedule for
        # each ad avail in a live event. For more information about the prefetch types and when you might use
        # each, see Prefetching ads in Elemental MediaTailor.

        @[JSON::Field(key: "ScheduleType")]
        getter schedule_type : String?

        # An optional stream identifier that you can specify in order to prefetch for multiple streams that
        # use the same playback configuration.

        @[JSON::Field(key: "StreamId")]
        getter stream_id : String?

        def initialize(
          @arn : String,
          @name : String,
          @playback_configuration_name : String,
          @consumption : Types::PrefetchConsumption? = nil,
          @recurring_prefetch_configuration : Types::RecurringPrefetchConfiguration? = nil,
          @retrieval : Types::PrefetchRetrieval? = nil,
          @schedule_type : String? = nil,
          @stream_id : String? = nil
        )
        end
      end


      struct PutChannelPolicyRequest
        include JSON::Serializable

        # The channel name associated with this Channel Policy.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # Adds an IAM role that determines the permissions of your channel.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @channel_name : String,
          @policy : String
        )
        end
      end


      struct PutChannelPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutPlaybackConfigurationRequest
        include JSON::Serializable

        # The identifier for the playback configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The setting that indicates what conditioning MediaTailor will perform on ads that the ad decision
        # server (ADS) returns, and what priority MediaTailor uses when inserting ads.

        @[JSON::Field(key: "AdConditioningConfiguration")]
        getter ad_conditioning_configuration : Types::AdConditioningConfiguration?

        # The configuration for customizing HTTP requests to the ad decision server (ADS). This includes
        # settings for request method, headers, body content, and compression options.

        @[JSON::Field(key: "AdDecisionServerConfiguration")]
        getter ad_decision_server_configuration : Types::AdDecisionServerConfiguration?

        # The URL for the ad decision server (ADS). This includes the specification of static parameters and
        # placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes player-specific and
        # session-specific parameters as needed when calling the ADS. Alternately, for testing you can provide
        # a static VAST URL. The maximum length is 25,000 characters.

        @[JSON::Field(key: "AdDecisionServerUrl")]
        getter ad_decision_server_url : String?

        # The configuration for avail suppression, also known as ad suppression. For more information about ad
        # suppression, see Ad Suppression .

        @[JSON::Field(key: "AvailSuppression")]
        getter avail_suppression : Types::AvailSuppression?

        # The configuration for bumpers. Bumpers are short audio or video clips that play at the start or
        # before the end of an ad break. To learn more about bumpers, see Bumpers .

        @[JSON::Field(key: "Bumper")]
        getter bumper : Types::Bumper?

        # The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content
        # and ad segment management.

        @[JSON::Field(key: "CdnConfiguration")]
        getter cdn_configuration : Types::CdnConfiguration?

        # The player parameters and aliases used as dynamic variables during session initialization. For more
        # information, see Domain Variables .

        @[JSON::Field(key: "ConfigurationAliases")]
        getter configuration_aliases : Hash(String, Hash(String, String))?

        # The configuration for DASH content.

        @[JSON::Field(key: "DashConfiguration")]
        getter dash_configuration : Types::DashConfigurationForPut?

        # The setting that controls whether players can use stitched or guided ad insertion. The default,
        # STITCHED_ONLY , forces all player sessions to use stitched (server-side) ad insertion. Choosing
        # PLAYER_SELECT allows players to select either stitched or guided ad insertion at
        # session-initialization time. The default for players that do not specify an insertion mode is
        # stitched.

        @[JSON::Field(key: "InsertionMode")]
        getter insertion_mode : String?

        # The configuration for pre-roll ad insertion.

        @[JSON::Field(key: "LivePreRollConfiguration")]
        getter live_pre_roll_configuration : Types::LivePreRollConfiguration?

        # The configuration for manifest processing rules. Manifest processing rules enable customization of
        # the personalized manifests created by MediaTailor.

        @[JSON::Field(key: "ManifestProcessingRules")]
        getter manifest_processing_rules : Types::ManifestProcessingRules?

        # Defines the maximum duration of underfilled ad time (in seconds) allowed in an ad break. If the
        # duration of underfilled ad time exceeds the personalization threshold, then the personalization of
        # the ad break is abandoned and the underlying content is shown. This feature applies to ad
        # replacement in live and VOD streams, rather than ad insertion, because it relies on an underlying
        # content stream. For more information about ad break behavior, including ad replacement and
        # insertion, see Ad Behavior in AWS Elemental MediaTailor .

        @[JSON::Field(key: "PersonalizationThresholdSeconds")]
        getter personalization_threshold_seconds : Int32?

        # The URL for a high-quality video asset to transcode and use to fill in time that's not used by ads.
        # AWS Elemental MediaTailor shows the slate to fill in gaps in media content. Configuring the slate is
        # optional for non-VPAID configurations. For VPAID, the slate is required because MediaTailor provides
        # it in the slots that are designated for dynamic ad content. The slate must be a high-quality asset
        # that contains both audio and video.

        @[JSON::Field(key: "SlateAdUrl")]
        getter slate_ad_url : String?

        # The tags to assign to the playback configuration. Tags are key-value pairs that you can associate
        # with Amazon resources to help with organization, access control, and cost tracking. For more
        # information, see Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The name that is used to associate this playback configuration with a custom transcode profile. This
        # overrides the dynamic transcoding defaults of MediaTailor. Use this only if you have already set up
        # custom profiles with the help of AWS Support.

        @[JSON::Field(key: "TranscodeProfileName")]
        getter transcode_profile_name : String?

        # The URL prefix for the parent manifest for the stream, minus the asset ID. The maximum length is 512
        # characters.

        @[JSON::Field(key: "VideoContentSourceUrl")]
        getter video_content_source_url : String?

        def initialize(
          @name : String,
          @ad_conditioning_configuration : Types::AdConditioningConfiguration? = nil,
          @ad_decision_server_configuration : Types::AdDecisionServerConfiguration? = nil,
          @ad_decision_server_url : String? = nil,
          @avail_suppression : Types::AvailSuppression? = nil,
          @bumper : Types::Bumper? = nil,
          @cdn_configuration : Types::CdnConfiguration? = nil,
          @configuration_aliases : Hash(String, Hash(String, String))? = nil,
          @dash_configuration : Types::DashConfigurationForPut? = nil,
          @insertion_mode : String? = nil,
          @live_pre_roll_configuration : Types::LivePreRollConfiguration? = nil,
          @manifest_processing_rules : Types::ManifestProcessingRules? = nil,
          @personalization_threshold_seconds : Int32? = nil,
          @slate_ad_url : String? = nil,
          @tags : Hash(String, String)? = nil,
          @transcode_profile_name : String? = nil,
          @video_content_source_url : String? = nil
        )
        end
      end


      struct PutPlaybackConfigurationResponse
        include JSON::Serializable

        # The setting that indicates what conditioning MediaTailor will perform on ads that the ad decision
        # server (ADS) returns, and what priority MediaTailor uses when inserting ads.

        @[JSON::Field(key: "AdConditioningConfiguration")]
        getter ad_conditioning_configuration : Types::AdConditioningConfiguration?

        # The configuration for customizing HTTP requests to the ad decision server (ADS). This includes
        # settings for request method, headers, body content, and compression options.

        @[JSON::Field(key: "AdDecisionServerConfiguration")]
        getter ad_decision_server_configuration : Types::AdDecisionServerConfiguration?

        # The URL for the ad decision server (ADS). This includes the specification of static parameters and
        # placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes player-specific and
        # session-specific parameters as needed when calling the ADS. Alternately, for testing you can provide
        # a static VAST URL. The maximum length is 25,000 characters.

        @[JSON::Field(key: "AdDecisionServerUrl")]
        getter ad_decision_server_url : String?

        # The configuration for avail suppression, also known as ad suppression. For more information about ad
        # suppression, see Ad Suppression .

        @[JSON::Field(key: "AvailSuppression")]
        getter avail_suppression : Types::AvailSuppression?

        # The configuration for bumpers. Bumpers are short audio or video clips that play at the start or
        # before the end of an ad break. To learn more about bumpers, see Bumpers .

        @[JSON::Field(key: "Bumper")]
        getter bumper : Types::Bumper?

        # The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content
        # and ad segment management.

        @[JSON::Field(key: "CdnConfiguration")]
        getter cdn_configuration : Types::CdnConfiguration?

        # The player parameters and aliases used as dynamic variables during session initialization. For more
        # information, see Domain Variables .

        @[JSON::Field(key: "ConfigurationAliases")]
        getter configuration_aliases : Hash(String, Hash(String, String))?

        # The configuration for DASH content.

        @[JSON::Field(key: "DashConfiguration")]
        getter dash_configuration : Types::DashConfiguration?

        # The configuration for HLS content.

        @[JSON::Field(key: "HlsConfiguration")]
        getter hls_configuration : Types::HlsConfiguration?

        # The setting that controls whether players can use stitched or guided ad insertion. The default,
        # STITCHED_ONLY , forces all player sessions to use stitched (server-side) ad insertion. Choosing
        # PLAYER_SELECT allows players to select either stitched or guided ad insertion at
        # session-initialization time. The default for players that do not specify an insertion mode is
        # stitched.

        @[JSON::Field(key: "InsertionMode")]
        getter insertion_mode : String?

        # The configuration for pre-roll ad insertion.

        @[JSON::Field(key: "LivePreRollConfiguration")]
        getter live_pre_roll_configuration : Types::LivePreRollConfiguration?

        # The configuration that defines where AWS Elemental MediaTailor sends logs for the playback
        # configuration.

        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The configuration for manifest processing rules. Manifest processing rules enable customization of
        # the personalized manifests created by MediaTailor.

        @[JSON::Field(key: "ManifestProcessingRules")]
        getter manifest_processing_rules : Types::ManifestProcessingRules?

        # The identifier for the playback configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Defines the maximum duration of underfilled ad time (in seconds) allowed in an ad break. If the
        # duration of underfilled ad time exceeds the personalization threshold, then the personalization of
        # the ad break is abandoned and the underlying content is shown. This feature applies to ad
        # replacement in live and VOD streams, rather than ad insertion, because it relies on an underlying
        # content stream. For more information about ad break behavior, including ad replacement and
        # insertion, see Ad Behavior in AWS Elemental MediaTailor .

        @[JSON::Field(key: "PersonalizationThresholdSeconds")]
        getter personalization_threshold_seconds : Int32?

        # The Amazon Resource Name (ARN) associated with the playback configuration.

        @[JSON::Field(key: "PlaybackConfigurationArn")]
        getter playback_configuration_arn : String?

        # The playback endpoint prefix associated with the playback configuration.

        @[JSON::Field(key: "PlaybackEndpointPrefix")]
        getter playback_endpoint_prefix : String?

        # The session initialization endpoint prefix associated with the playback configuration.

        @[JSON::Field(key: "SessionInitializationEndpointPrefix")]
        getter session_initialization_endpoint_prefix : String?

        # The URL for a high-quality video asset to transcode and use to fill in time that's not used by ads.
        # AWS Elemental MediaTailor shows the slate to fill in gaps in media content. Configuring the slate is
        # optional for non-VPAID configurations. For VPAID, the slate is required because MediaTailor provides
        # it in the slots that are designated for dynamic ad content. The slate must be a high-quality asset
        # that contains both audio and video.

        @[JSON::Field(key: "SlateAdUrl")]
        getter slate_ad_url : String?

        # The tags to assign to the playback configuration. Tags are key-value pairs that you can associate
        # with Amazon resources to help with organization, access control, and cost tracking. For more
        # information, see Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The name that is used to associate this playback configuration with a custom transcode profile. This
        # overrides the dynamic transcoding defaults of MediaTailor. Use this only if you have already set up
        # custom profiles with the help of AWS Support.

        @[JSON::Field(key: "TranscodeProfileName")]
        getter transcode_profile_name : String?

        # The URL prefix for the parent manifest for the stream, minus the asset ID. The maximum length is 512
        # characters.

        @[JSON::Field(key: "VideoContentSourceUrl")]
        getter video_content_source_url : String?

        def initialize(
          @ad_conditioning_configuration : Types::AdConditioningConfiguration? = nil,
          @ad_decision_server_configuration : Types::AdDecisionServerConfiguration? = nil,
          @ad_decision_server_url : String? = nil,
          @avail_suppression : Types::AvailSuppression? = nil,
          @bumper : Types::Bumper? = nil,
          @cdn_configuration : Types::CdnConfiguration? = nil,
          @configuration_aliases : Hash(String, Hash(String, String))? = nil,
          @dash_configuration : Types::DashConfiguration? = nil,
          @hls_configuration : Types::HlsConfiguration? = nil,
          @insertion_mode : String? = nil,
          @live_pre_roll_configuration : Types::LivePreRollConfiguration? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @manifest_processing_rules : Types::ManifestProcessingRules? = nil,
          @name : String? = nil,
          @personalization_threshold_seconds : Int32? = nil,
          @playback_configuration_arn : String? = nil,
          @playback_endpoint_prefix : String? = nil,
          @session_initialization_endpoint_prefix : String? = nil,
          @slate_ad_url : String? = nil,
          @tags : Hash(String, String)? = nil,
          @transcode_profile_name : String? = nil,
          @video_content_source_url : String? = nil
        )
        end
      end

      # The settings that determine how and when MediaTailor places prefetched ads into upcoming ad breaks
      # for recurring prefetch scedules.

      struct RecurringConsumption
        include JSON::Serializable

        # The configuration for the dynamic variables that determine which ad breaks that MediaTailor inserts
        # prefetched ads in.

        @[JSON::Field(key: "AvailMatchingCriteria")]
        getter avail_matching_criteria : Array(Types::AvailMatchingCriteria)?

        # The number of seconds that an ad is available for insertion after it was prefetched.

        @[JSON::Field(key: "RetrievedAdExpirationSeconds")]
        getter retrieved_ad_expiration_seconds : Int32?

        def initialize(
          @avail_matching_criteria : Array(Types::AvailMatchingCriteria)? = nil,
          @retrieved_ad_expiration_seconds : Int32? = nil
        )
        end
      end

      # The configuration that defines how MediaTailor performs recurring prefetch.

      struct RecurringPrefetchConfiguration
        include JSON::Serializable

        # The end time for the window that MediaTailor prefetches and inserts ads in a live event.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The settings that determine how and when MediaTailor places prefetched ads into upcoming ad breaks
        # for recurring prefetch scedules.

        @[JSON::Field(key: "RecurringConsumption")]
        getter recurring_consumption : Types::RecurringConsumption

        # The configuration for prefetch ad retrieval from the ADS.

        @[JSON::Field(key: "RecurringRetrieval")]
        getter recurring_retrieval : Types::RecurringRetrieval

        # The start time for the window that MediaTailor prefetches and inserts ads in a live event.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time,
          @recurring_consumption : Types::RecurringConsumption,
          @recurring_retrieval : Types::RecurringRetrieval,
          @start_time : Time? = nil
        )
        end
      end

      # With recurring prefetch, MediaTailor automatically prefetches ads for every avail that occurs during
      # the retrieval window. The following configurations describe the MediaTailor behavior when
      # prefetching ads for a live event.

      struct RecurringRetrieval
        include JSON::Serializable

        # The number of seconds that MediaTailor waits after an ad avail before prefetching ads for the next
        # avail. If not set, the default is 0 (no delay).

        @[JSON::Field(key: "DelayAfterAvailEndSeconds")]
        getter delay_after_avail_end_seconds : Int32?

        # The dynamic variables to use for substitution during prefetch requests to the ADS.

        @[JSON::Field(key: "DynamicVariables")]
        getter dynamic_variables : Hash(String, String)?

        # The configuration that tells Elemental MediaTailor how many seconds to spread out requests to the ad
        # decision server (ADS). Instead of sending ADS requests for all sessions at the same time,
        # MediaTailor spreads the requests across the amount of time specified in the retrieval window.

        @[JSON::Field(key: "TrafficShapingRetrievalWindow")]
        getter traffic_shaping_retrieval_window : Types::TrafficShapingRetrievalWindow?

        # The configuration for TPS-based traffic shaping. This approach limits requests to the ad decision
        # server (ADS) based on transactions per second and concurrent users.

        @[JSON::Field(key: "TrafficShapingTpsConfiguration")]
        getter traffic_shaping_tps_configuration : Types::TrafficShapingTpsConfiguration?

        # Indicates the type of traffic shaping used to limit the number of requests to the ADS at one time.

        @[JSON::Field(key: "TrafficShapingType")]
        getter traffic_shaping_type : String?

        def initialize(
          @delay_after_avail_end_seconds : Int32? = nil,
          @dynamic_variables : Hash(String, String)? = nil,
          @traffic_shaping_retrieval_window : Types::TrafficShapingRetrievalWindow? = nil,
          @traffic_shaping_tps_configuration : Types::TrafficShapingTpsConfiguration? = nil,
          @traffic_shaping_type : String? = nil
        )
        end
      end

      # The output configuration for this channel.

      struct RequestOutputItem
        include JSON::Serializable

        # The name of the manifest for the channel. The name appears in the PlaybackUrl .

        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # A string used to match which HttpPackageConfiguration is used for each VodSource .

        @[JSON::Field(key: "SourceGroup")]
        getter source_group : String

        # DASH manifest configuration parameters.

        @[JSON::Field(key: "DashPlaylistSettings")]
        getter dash_playlist_settings : Types::DashPlaylistSettings?

        # HLS playlist configuration parameters.

        @[JSON::Field(key: "HlsPlaylistSettings")]
        getter hls_playlist_settings : Types::HlsPlaylistSettings?

        def initialize(
          @manifest_name : String,
          @source_group : String,
          @dash_playlist_settings : Types::DashPlaylistSettings? = nil,
          @hls_playlist_settings : Types::HlsPlaylistSettings? = nil
        )
        end
      end

      # The output item response.

      struct ResponseOutputItem
        include JSON::Serializable

        # The name of the manifest for the channel that will appear in the channel output's playback URL.

        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # The URL used for playback by content players.

        @[JSON::Field(key: "PlaybackUrl")]
        getter playback_url : String

        # A string used to associate a package configuration source group with a channel output.

        @[JSON::Field(key: "SourceGroup")]
        getter source_group : String

        # DASH manifest configuration settings.

        @[JSON::Field(key: "DashPlaylistSettings")]
        getter dash_playlist_settings : Types::DashPlaylistSettings?

        # HLS manifest configuration settings.

        @[JSON::Field(key: "HlsPlaylistSettings")]
        getter hls_playlist_settings : Types::HlsPlaylistSettings?

        def initialize(
          @manifest_name : String,
          @playback_url : String,
          @source_group : String,
          @dash_playlist_settings : Types::DashPlaylistSettings? = nil,
          @hls_playlist_settings : Types::HlsPlaylistSettings? = nil
        )
        end
      end

      # The schedule's ad break properties.

      struct ScheduleAdBreak
        include JSON::Serializable

        # The approximate duration of the ad break, in seconds.

        @[JSON::Field(key: "ApproximateDurationSeconds")]
        getter approximate_duration_seconds : Int64?

        # The approximate time that the ad will start playing.

        @[JSON::Field(key: "ApproximateStartTime")]
        getter approximate_start_time : Time?

        # The name of the source location containing the VOD source used for the ad break.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The name of the VOD source used for the ad break.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @approximate_duration_seconds : Int64? = nil,
          @approximate_start_time : Time? = nil,
          @source_location_name : String? = nil,
          @vod_source_name : String? = nil
        )
        end
      end

      # Schedule configuration parameters. A channel must be stopped before changes can be made to the
      # schedule.

      struct ScheduleConfiguration
        include JSON::Serializable

        # Program transition configurations.

        @[JSON::Field(key: "Transition")]
        getter transition : Types::Transition

        # Program clip range configuration.

        @[JSON::Field(key: "ClipRange")]
        getter clip_range : Types::ClipRange?

        def initialize(
          @transition : Types::Transition,
          @clip_range : Types::ClipRange? = nil
        )
        end
      end

      # The properties for a schedule.

      struct ScheduleEntry
        include JSON::Serializable

        # The ARN of the program.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the channel that uses this schedule.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name of the program.

        @[JSON::Field(key: "ProgramName")]
        getter program_name : String

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The approximate duration of this program, in seconds.

        @[JSON::Field(key: "ApproximateDurationSeconds")]
        getter approximate_duration_seconds : Int64?

        # The approximate time that the program will start playing.

        @[JSON::Field(key: "ApproximateStartTime")]
        getter approximate_start_time : Time?

        # The list of audiences defined in ScheduleEntry.

        @[JSON::Field(key: "Audiences")]
        getter audiences : Array(String)?

        # The name of the live source used for the program.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String?

        # The schedule's ad break properties.

        @[JSON::Field(key: "ScheduleAdBreaks")]
        getter schedule_ad_breaks : Array(Types::ScheduleAdBreak)?

        # The type of schedule entry.

        @[JSON::Field(key: "ScheduleEntryType")]
        getter schedule_entry_type : String?

        # The name of the VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @arn : String,
          @channel_name : String,
          @program_name : String,
          @source_location_name : String,
          @approximate_duration_seconds : Int64? = nil,
          @approximate_start_time : Time? = nil,
          @audiences : Array(String)? = nil,
          @live_source_name : String? = nil,
          @schedule_ad_breaks : Array(Types::ScheduleAdBreak)? = nil,
          @schedule_entry_type : String? = nil,
          @vod_source_name : String? = nil
        )
        end
      end

      # AWS Secrets Manager access token configuration parameters. For information about Secrets Manager
      # access token authentication, see Working with AWS Secrets Manager access token authentication .

      struct SecretsManagerAccessTokenConfiguration
        include JSON::Serializable

        # The name of the HTTP header used to supply the access token in requests to the source location.

        @[JSON::Field(key: "HeaderName")]
        getter header_name : String?

        # The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the access token.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The AWS Secrets Manager SecretString key associated with the access token. MediaTailor uses the key
        # to look up SecretString key and value pair containing the access token.

        @[JSON::Field(key: "SecretStringKey")]
        getter secret_string_key : String?

        def initialize(
          @header_name : String? = nil,
          @secret_arn : String? = nil,
          @secret_string_key : String? = nil
        )
        end
      end

      # The segment delivery configuration settings.

      struct SegmentDeliveryConfiguration
        include JSON::Serializable

        # The base URL of the host or path of the segment delivery server that you're using to serve segments.
        # This is typically a content delivery network (CDN). The URL can be absolute or relative. To use an
        # absolute URL include the protocol, such as https://example.com/some/path . To use a relative URL
        # specify the relative path, such as /some/path* .

        @[JSON::Field(key: "BaseUrl")]
        getter base_url : String?

        # A unique identifier used to distinguish between multiple segment delivery configurations in a source
        # location.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @base_url : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The segmentation_descriptor message can contain advanced metadata fields, like content identifiers,
      # to convey a wide range of information about the ad break. MediaTailor writes the ad metadata in the
      # egress manifest as part of the EXT-X-DATERANGE or EventStream ad marker's SCTE-35 data.
      # segmentation_descriptor messages must be sent with the time_signal message type. See the
      # segmentation_descriptor() table of the 2022 SCTE-35 specification for more information.

      struct SegmentationDescriptor
        include JSON::Serializable

        # The segment number to assign to the segmentation_descriptor.segment_num message, as defined in
        # section 10.3.3.1 of the 2022 SCTE-35 specification Values must be between 0 and 256, inclusive. The
        # default value is 0.

        @[JSON::Field(key: "SegmentNum")]
        getter segment_num : Int32?

        # The Event Identifier to assign to the segmentation_descriptor.segmentation_event_id message, as
        # defined in section 10.3.3.1 of the 2022 SCTE-35 specification. The default value is 1.

        @[JSON::Field(key: "SegmentationEventId")]
        getter segmentation_event_id : Int32?

        # The Type Identifier to assign to the segmentation_descriptor.segmentation_type_id message, as
        # defined in section 10.3.3.1 of the 2022 SCTE-35 specification. Values must be between 0 and 256,
        # inclusive. The default value is 48.

        @[JSON::Field(key: "SegmentationTypeId")]
        getter segmentation_type_id : Int32?

        # The Upid to assign to the segmentation_descriptor.segmentation_upid message, as defined in section
        # 10.3.3.1 of the 2022 SCTE-35 specification. The value must be a hexadecimal string containing only
        # the characters 0 though 9 and A through F. The default value is "" (an empty string).

        @[JSON::Field(key: "SegmentationUpid")]
        getter segmentation_upid : String?

        # The Upid Type to assign to the segmentation_descriptor.segmentation_upid_type message, as defined in
        # section 10.3.3.1 of the 2022 SCTE-35 specification. Values must be between 0 and 256, inclusive. The
        # default value is 14.

        @[JSON::Field(key: "SegmentationUpidType")]
        getter segmentation_upid_type : Int32?

        # The number of segments expected, which is assigned to the segmentation_descriptor.segments_expectedS
        # message, as defined in section 10.3.3.1 of the 2022 SCTE-35 specification Values must be between 0
        # and 256, inclusive. The default value is 0.

        @[JSON::Field(key: "SegmentsExpected")]
        getter segments_expected : Int32?

        # The sub-segment number to assign to the segmentation_descriptor.sub_segment_num message, as defined
        # in section 10.3.3.1 of the 2022 SCTE-35 specification. Values must be between 0 and 256, inclusive.
        # The defualt value is null.

        @[JSON::Field(key: "SubSegmentNum")]
        getter sub_segment_num : Int32?

        # The number of sub-segments expected, which is assigned to the
        # segmentation_descriptor.sub_segments_expected message, as defined in section 10.3.3.1 of the 2022
        # SCTE-35 specification. Values must be between 0 and 256, inclusive. The default value is null.

        @[JSON::Field(key: "SubSegmentsExpected")]
        getter sub_segments_expected : Int32?

        def initialize(
          @segment_num : Int32? = nil,
          @segmentation_event_id : Int32? = nil,
          @segmentation_type_id : Int32? = nil,
          @segmentation_upid : String? = nil,
          @segmentation_upid_type : Int32? = nil,
          @segments_expected : Int32? = nil,
          @sub_segment_num : Int32? = nil,
          @sub_segments_expected : Int32? = nil
        )
        end
      end

      # Slate VOD source configuration.

      struct SlateSource
        include JSON::Serializable

        # The name of the source location where the slate VOD source is stored.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The slate VOD source name. The VOD source must already exist in a source location before it can be
        # used for slate.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @source_location_name : String? = nil,
          @vod_source_name : String? = nil
        )
        end
      end

      # A source location is a container for sources. For more information about source locations, see
      # Working with source locations in the MediaTailor User Guide .

      struct SourceLocation
        include JSON::Serializable

        # The ARN of the SourceLocation.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The HTTP configuration for the source location.

        @[JSON::Field(key: "HttpConfiguration")]
        getter http_configuration : Types::HttpConfiguration

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The access configuration for the source location.

        @[JSON::Field(key: "AccessConfiguration")]
        getter access_configuration : Types::AccessConfiguration?

        # The timestamp that indicates when the source location was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The default segment delivery configuration.

        @[JSON::Field(key: "DefaultSegmentDeliveryConfiguration")]
        getter default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration?

        # The timestamp that indicates when the source location was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The segment delivery configurations for the source location.

        @[JSON::Field(key: "SegmentDeliveryConfigurations")]
        getter segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)?

        # The tags assigned to the source location. Tags are key-value pairs that you can associate with
        # Amazon resources to help with organization, access control, and cost tracking. For more information,
        # see Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @http_configuration : Types::HttpConfiguration,
          @source_location_name : String,
          @access_configuration : Types::AccessConfiguration? = nil,
          @creation_time : Time? = nil,
          @default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration? = nil,
          @last_modified_time : Time? = nil,
          @segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Splice insert message configuration.

      struct SpliceInsertMessage
        include JSON::Serializable

        # This is written to splice_insert.avail_num , as defined in section 9.7.3.1 of the SCTE-35
        # specification. The default value is 0 . Values must be between 0 and 256 , inclusive.

        @[JSON::Field(key: "AvailNum")]
        getter avail_num : Int32?

        # This is written to splice_insert.avails_expected , as defined in section 9.7.3.1 of the SCTE-35
        # specification. The default value is 0 . Values must be between 0 and 256 , inclusive.

        @[JSON::Field(key: "AvailsExpected")]
        getter avails_expected : Int32?

        # This is written to splice_insert.splice_event_id , as defined in section 9.7.3.1 of the SCTE-35
        # specification. The default value is 1 .

        @[JSON::Field(key: "SpliceEventId")]
        getter splice_event_id : Int32?

        # This is written to splice_insert.unique_program_id , as defined in section 9.7.3.1 of the SCTE-35
        # specification. The default value is 0 . Values must be between 0 and 256 , inclusive.

        @[JSON::Field(key: "UniqueProgramId")]
        getter unique_program_id : Int32?

        def initialize(
          @avail_num : Int32? = nil,
          @avails_expected : Int32? = nil,
          @splice_event_id : Int32? = nil,
          @unique_program_id : Int32? = nil
        )
        end
      end


      struct StartChannelRequest
        include JSON::Serializable

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_name : String
        )
        end
      end


      struct StartChannelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StopChannelRequest
        include JSON::Serializable

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_name : String
        )
        end
      end


      struct StopChannelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to assign to the resource. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The configuration for time-shifted viewing.

      struct TimeShiftConfiguration
        include JSON::Serializable

        # The maximum time delay for time-shifted viewing. The minimum allowed maximum time delay is 0
        # seconds, and the maximum allowed maximum time delay is 21600 seconds (6 hours).

        @[JSON::Field(key: "MaxTimeDelaySeconds")]
        getter max_time_delay_seconds : Int32

        def initialize(
          @max_time_delay_seconds : Int32
        )
        end
      end

      # The SCTE-35 time_signal message can be sent with one or more segmentation_descriptor messages. A
      # time_signal message can be sent only if a single segmentation_descriptor message is sent. The
      # time_signal message contains only the splice_time field which is constructed using a given
      # presentation timestamp. When sending a time_signal message, the splice_command_type field in the
      # splice_info_section message is set to 6 (0x06). See the time_signal() table of the 2022 SCTE-35
      # specification for more information.

      struct TimeSignalMessage
        include JSON::Serializable

        # The configurations for the SCTE-35 segmentation_descriptor message(s) sent with the time_signal
        # message.

        @[JSON::Field(key: "SegmentationDescriptors")]
        getter segmentation_descriptors : Array(Types::SegmentationDescriptor)?

        def initialize(
          @segmentation_descriptors : Array(Types::SegmentationDescriptor)? = nil
        )
        end
      end

      # The configuration that tells Elemental MediaTailor how many seconds to spread out requests to the ad
      # decision server (ADS). Instead of sending ADS requests for all sessions at the same time,
      # MediaTailor spreads the requests across the amount of time specified in the retrieval window.

      struct TrafficShapingRetrievalWindow
        include JSON::Serializable

        # The amount of time, in seconds, that MediaTailor spreads prefetch requests to the ADS.

        @[JSON::Field(key: "RetrievalWindowDurationSeconds")]
        getter retrieval_window_duration_seconds : Int32?

        def initialize(
          @retrieval_window_duration_seconds : Int32? = nil
        )
        end
      end

      # The configuration for TPS-based traffic shaping. This approach limits requests to the ad decision
      # server (ADS) based on transactions per second and concurrent users.

      struct TrafficShapingTpsConfiguration
        include JSON::Serializable

        # The expected peak number of concurrent viewers for your content. MediaTailor uses this value along
        # with peak TPS to determine how to distribute prefetch requests across the available capacity without
        # exceeding your ADS limits.

        @[JSON::Field(key: "PeakConcurrentUsers")]
        getter peak_concurrent_users : Int32?

        # The maximum number of transactions per second (TPS) that your ad decision server (ADS) can handle.
        # MediaTailor uses this value along with concurrent users and headroom multiplier to calculate optimal
        # traffic distribution and prevent ADS overload.

        @[JSON::Field(key: "PeakTps")]
        getter peak_tps : Int32?

        def initialize(
          @peak_concurrent_users : Int32? = nil,
          @peak_tps : Int32? = nil
        )
        end
      end

      # Program transition configuration.

      struct Transition
        include JSON::Serializable

        # The position where this program will be inserted relative to the RelativePosition .

        @[JSON::Field(key: "RelativePosition")]
        getter relative_position : String

        # Defines when the program plays in the schedule. You can set the value to ABSOLUTE or RELATIVE .
        # ABSOLUTE - The program plays at a specific wall clock time. This setting can only be used for
        # channels using the LINEAR PlaybackMode . Note the following considerations when using ABSOLUTE
        # transitions: If the preceding program in the schedule has a duration that extends past the wall
        # clock time, MediaTailor truncates the preceding program on a common segment boundary. If there are
        # gaps in playback, MediaTailor plays the FillerSlate you configured for your linear channel. RELATIVE
        # - The program is inserted into the schedule either before or after a program that you specify via
        # RelativePosition .

        @[JSON::Field(key: "Type")]
        getter type : String

        # The duration of the live program in seconds.

        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The name of the program that this program will be inserted next to, as defined by RelativePosition .

        @[JSON::Field(key: "RelativeProgram")]
        getter relative_program : String?

        # The date and time that the program is scheduled to start, in epoch milliseconds.

        @[JSON::Field(key: "ScheduledStartTimeMillis")]
        getter scheduled_start_time_millis : Int64?

        def initialize(
          @relative_position : String,
          @type : String,
          @duration_millis : Int64? = nil,
          @relative_program : String? = nil,
          @scheduled_start_time_millis : Int64? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to untag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag keys associated with the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateChannelRequest
        include JSON::Serializable

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The channel's output properties.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::RequestOutputItem)

        # The list of audiences defined in channel.

        @[JSON::Field(key: "Audiences")]
        getter audiences : Array(String)?

        # The slate used to fill gaps between programs in the schedule. You must configure filler slate if
        # your channel uses the LINEAR PlaybackMode . MediaTailor doesn't support filler slate for channels
        # using the LOOP PlaybackMode .

        @[JSON::Field(key: "FillerSlate")]
        getter filler_slate : Types::SlateSource?

        # The time-shifted viewing configuration you want to associate to the channel.

        @[JSON::Field(key: "TimeShiftConfiguration")]
        getter time_shift_configuration : Types::TimeShiftConfiguration?

        def initialize(
          @channel_name : String,
          @outputs : Array(Types::RequestOutputItem),
          @audiences : Array(String)? = nil,
          @filler_slate : Types::SlateSource? = nil,
          @time_shift_configuration : Types::TimeShiftConfiguration? = nil
        )
        end
      end


      struct UpdateChannelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the channel.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The list of audiences defined in channel.

        @[JSON::Field(key: "Audiences")]
        getter audiences : Array(String)?

        # The name of the channel.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # Returns the state whether the channel is running or not.

        @[JSON::Field(key: "ChannelState")]
        getter channel_state : String?

        # The timestamp of when the channel was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The slate used to fill gaps between programs in the schedule. You must configure filler slate if
        # your channel uses the LINEAR PlaybackMode . MediaTailor doesn't support filler slate for channels
        # using the LOOP PlaybackMode .

        @[JSON::Field(key: "FillerSlate")]
        getter filler_slate : Types::SlateSource?

        # The timestamp that indicates when the channel was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The channel's output properties.

        @[JSON::Field(key: "Outputs")]
        getter outputs : Array(Types::ResponseOutputItem)?

        # The type of playback mode for this channel. LINEAR - Programs play back-to-back only once. LOOP -
        # Programs play back-to-back in an endless loop. When the last program in the schedule plays, playback
        # loops back to the first program in the schedule.

        @[JSON::Field(key: "PlaybackMode")]
        getter playback_mode : String?

        # The tags to assign to the channel. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The tier associated with this Channel.

        @[JSON::Field(key: "Tier")]
        getter tier : String?

        # The time-shifted viewing configuration for the channel.

        @[JSON::Field(key: "TimeShiftConfiguration")]
        getter time_shift_configuration : Types::TimeShiftConfiguration?

        def initialize(
          @arn : String? = nil,
          @audiences : Array(String)? = nil,
          @channel_name : String? = nil,
          @channel_state : String? = nil,
          @creation_time : Time? = nil,
          @filler_slate : Types::SlateSource? = nil,
          @last_modified_time : Time? = nil,
          @outputs : Array(Types::ResponseOutputItem)? = nil,
          @playback_mode : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tier : String? = nil,
          @time_shift_configuration : Types::TimeShiftConfiguration? = nil
        )
        end
      end


      struct UpdateLiveSourceRequest
        include JSON::Serializable

        # A list of HTTP package configurations for the live source on this account.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)

        # The name of the live source.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String

        # The name of the source location associated with this Live Source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        def initialize(
          @http_package_configurations : Array(Types::HttpPackageConfiguration),
          @live_source_name : String,
          @source_location_name : String
        )
        end
      end


      struct UpdateLiveSourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with this live source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp that indicates when the live source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # A list of HTTP package configurations for the live source on this account.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)?

        # The timestamp that indicates when the live source was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the live source.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String?

        # The name of the source location associated with the live source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The tags to assign to the live source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @http_package_configurations : Array(Types::HttpPackageConfiguration)? = nil,
          @last_modified_time : Time? = nil,
          @live_source_name : String? = nil,
          @source_location_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateProgramRequest
        include JSON::Serializable

        # The name of the channel for this Program.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name of the Program.

        @[JSON::Field(key: "ProgramName")]
        getter program_name : String

        # The schedule configuration settings.

        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::UpdateProgramScheduleConfiguration

        # The ad break configuration settings.

        @[JSON::Field(key: "AdBreaks")]
        getter ad_breaks : Array(Types::AdBreak)?

        # The list of AudienceMedia defined in program.

        @[JSON::Field(key: "AudienceMedia")]
        getter audience_media : Array(Types::AudienceMedia)?

        def initialize(
          @channel_name : String,
          @program_name : String,
          @schedule_configuration : Types::UpdateProgramScheduleConfiguration,
          @ad_breaks : Array(Types::AdBreak)? = nil,
          @audience_media : Array(Types::AudienceMedia)? = nil
        )
        end
      end


      struct UpdateProgramResponse
        include JSON::Serializable

        # The ad break configuration settings.

        @[JSON::Field(key: "AdBreaks")]
        getter ad_breaks : Array(Types::AdBreak)?

        # The ARN to assign to the program.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The list of AudienceMedia defined in program.

        @[JSON::Field(key: "AudienceMedia")]
        getter audience_media : Array(Types::AudienceMedia)?

        # The name to assign to the channel for this program.

        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String?

        # The clip range configuration settings.

        @[JSON::Field(key: "ClipRange")]
        getter clip_range : Types::ClipRange?

        # The time the program was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The duration of the live program in milliseconds.

        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The name of the LiveSource for this Program.

        @[JSON::Field(key: "LiveSourceName")]
        getter live_source_name : String?

        # The name to assign to this program.

        @[JSON::Field(key: "ProgramName")]
        getter program_name : String?

        # The scheduled start time for this Program.

        @[JSON::Field(key: "ScheduledStartTime")]
        getter scheduled_start_time : Time?

        # The name to assign to the source location for this program.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The name that's used to refer to a VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @ad_breaks : Array(Types::AdBreak)? = nil,
          @arn : String? = nil,
          @audience_media : Array(Types::AudienceMedia)? = nil,
          @channel_name : String? = nil,
          @clip_range : Types::ClipRange? = nil,
          @creation_time : Time? = nil,
          @duration_millis : Int64? = nil,
          @live_source_name : String? = nil,
          @program_name : String? = nil,
          @scheduled_start_time : Time? = nil,
          @source_location_name : String? = nil,
          @vod_source_name : String? = nil
        )
        end
      end

      # Schedule configuration parameters.

      struct UpdateProgramScheduleConfiguration
        include JSON::Serializable

        # Program clip range configuration.

        @[JSON::Field(key: "ClipRange")]
        getter clip_range : Types::ClipRange?

        # Program transition configuration.

        @[JSON::Field(key: "Transition")]
        getter transition : Types::UpdateProgramTransition?

        def initialize(
          @clip_range : Types::ClipRange? = nil,
          @transition : Types::UpdateProgramTransition? = nil
        )
        end
      end

      # Program transition configuration.

      struct UpdateProgramTransition
        include JSON::Serializable

        # The duration of the live program in seconds.

        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The date and time that the program is scheduled to start, in epoch milliseconds.

        @[JSON::Field(key: "ScheduledStartTimeMillis")]
        getter scheduled_start_time_millis : Int64?

        def initialize(
          @duration_millis : Int64? = nil,
          @scheduled_start_time_millis : Int64? = nil
        )
        end
      end


      struct UpdateSourceLocationRequest
        include JSON::Serializable

        # The HTTP configuration for the source location.

        @[JSON::Field(key: "HttpConfiguration")]
        getter http_configuration : Types::HttpConfiguration

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # Access configuration parameters. Configures the type of authentication used to access content from
        # your source location.

        @[JSON::Field(key: "AccessConfiguration")]
        getter access_configuration : Types::AccessConfiguration?

        # The optional configuration for the host server that serves segments.

        @[JSON::Field(key: "DefaultSegmentDeliveryConfiguration")]
        getter default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration?

        # A list of the segment delivery configurations associated with this resource.

        @[JSON::Field(key: "SegmentDeliveryConfigurations")]
        getter segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)?

        def initialize(
          @http_configuration : Types::HttpConfiguration,
          @source_location_name : String,
          @access_configuration : Types::AccessConfiguration? = nil,
          @default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration? = nil,
          @segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)? = nil
        )
        end
      end


      struct UpdateSourceLocationResponse
        include JSON::Serializable

        # Access configuration parameters. Configures the type of authentication used to access content from
        # your source location.

        @[JSON::Field(key: "AccessConfiguration")]
        getter access_configuration : Types::AccessConfiguration?

        # The Amazon Resource Name (ARN) associated with the source location.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp that indicates when the source location was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The optional configuration for the host server that serves segments.

        @[JSON::Field(key: "DefaultSegmentDeliveryConfiguration")]
        getter default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration?

        # The HTTP configuration for the source location.

        @[JSON::Field(key: "HttpConfiguration")]
        getter http_configuration : Types::HttpConfiguration?

        # The timestamp that indicates when the source location was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The segment delivery configurations for the source location. For information about MediaTailor
        # configurations, see Working with configurations in AWS Elemental MediaTailor .

        @[JSON::Field(key: "SegmentDeliveryConfigurations")]
        getter segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)?

        # The name of the source location.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The tags to assign to the source location. Tags are key-value pairs that you can associate with
        # Amazon resources to help with organization, access control, and cost tracking. For more information,
        # see Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @access_configuration : Types::AccessConfiguration? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @default_segment_delivery_configuration : Types::DefaultSegmentDeliveryConfiguration? = nil,
          @http_configuration : Types::HttpConfiguration? = nil,
          @last_modified_time : Time? = nil,
          @segment_delivery_configurations : Array(Types::SegmentDeliveryConfiguration)? = nil,
          @source_location_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateVodSourceRequest
        include JSON::Serializable

        # A list of HTTP package configurations for the VOD source on this account.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)

        # The name of the source location associated with this VOD Source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The name of the VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String

        def initialize(
          @http_package_configurations : Array(Types::HttpPackageConfiguration),
          @source_location_name : String,
          @vod_source_name : String
        )
        end
      end


      struct UpdateVodSourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the VOD source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp that indicates when the VOD source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # A list of HTTP package configurations for the VOD source on this account.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)?

        # The timestamp that indicates when the VOD source was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the source location associated with the VOD source.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String?

        # The tags to assign to the VOD source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The name of the VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @http_package_configurations : Array(Types::HttpPackageConfiguration)? = nil,
          @last_modified_time : Time? = nil,
          @source_location_name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vod_source_name : String? = nil
        )
        end
      end

      # VOD source configuration parameters.

      struct VodSource
        include JSON::Serializable

        # The ARN for the VOD source.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The HTTP package configurations for the VOD source.

        @[JSON::Field(key: "HttpPackageConfigurations")]
        getter http_package_configurations : Array(Types::HttpPackageConfiguration)

        # The name of the source location that the VOD source is associated with.

        @[JSON::Field(key: "SourceLocationName")]
        getter source_location_name : String

        # The name of the VOD source.

        @[JSON::Field(key: "VodSourceName")]
        getter vod_source_name : String

        # The timestamp that indicates when the VOD source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The timestamp that indicates when the VOD source was last modified.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The tags assigned to the VOD source. Tags are key-value pairs that you can associate with Amazon
        # resources to help with organization, access control, and cost tracking. For more information, see
        # Tagging AWS Elemental MediaTailor Resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @http_package_configurations : Array(Types::HttpPackageConfiguration),
          @source_location_name : String,
          @vod_source_name : String,
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end
    end
  end
end
