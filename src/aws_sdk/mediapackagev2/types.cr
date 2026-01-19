require "json"
require "time"

module AwsSdk
  module MediaPackageV2
    module Types

      # Access is denied because either you don't have permissions to perform the requested operation or
      # MediaPackage is getting throttling errors with CDN authorization. The user or role that is making
      # the request must have at least one IAM permissions policy attached that grants the required
      # permissions. For more information, see Access Management in the IAM User Guide. Or, if you're using
      # CDN authorization, you will receive this exception if MediaPackage receives a throttling error from
      # Secrets Manager.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CancelHarvestJobRequest
        include JSON::Serializable

        # The name of the channel group containing the channel from which the harvest job is running.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel from which the harvest job is running.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name of the harvest job to cancel. This name must be unique within the channel and cannot be
        # changed after the harvest job is submitted.
        @[JSON::Field(key: "HarvestJobName")]
        getter harvest_job_name : String

        # The name of the origin endpoint that the harvest job is harvesting from. This cannot be changed
        # after the harvest job is submitted.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The current Entity Tag (ETag) associated with the harvest job. Used for concurrency control.
        @[JSON::Field(key: "x-amzn-update-if-match")]
        getter e_tag : String?

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @harvest_job_name : String,
          @origin_endpoint_name : String,
          @e_tag : String? = nil
        )
        end
      end

      struct CancelHarvestJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The settings to enable CDN authorization headers in MediaPackage.
      struct CdnAuthConfiguration
        include JSON::Serializable

        # The ARN for the secret in Secrets Manager that your CDN uses for authorization to access the
        # endpoint.
        @[JSON::Field(key: "CdnIdentifierSecretArns")]
        getter cdn_identifier_secret_arns : Array(String)

        # The ARN for the IAM role that gives MediaPackage read access to Secrets Manager and KMS for CDN
        # authorization.
        @[JSON::Field(key: "SecretsRoleArn")]
        getter secrets_role_arn : String

        def initialize(
          @cdn_identifier_secret_arns : Array(String),
          @secrets_role_arn : String
        )
        end
      end

      # The configuration of the channel group.
      struct ChannelGroupListConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The date and time the channel group was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The date and time the channel group was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # Any descriptive information that you want to add to the channel group for future identification
        # purposes.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @created_at : Time,
          @modified_at : Time,
          @description : String? = nil
        )
        end
      end

      # The configuration of the channel.
      struct ChannelListConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The date and time the channel was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The date and time the channel was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # Any descriptive information that you want to add to the channel for future identification purposes.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The input type will be an immutable field which will be used to define whether the channel will
        # allow CMAF ingest or HLS ingest. If unprovided, it will default to HLS to preserve current behavior.
        # The allowed values are: HLS - The HLS streaming specification (which defines M3U8 manifests and TS
        # segments). CMAF - The DASH-IF CMAF Ingest specification (which defines CMAF segments with optional
        # DASH manifests).
        @[JSON::Field(key: "InputType")]
        getter input_type : String?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @created_at : Time,
          @modified_at : Time,
          @description : String? = nil,
          @input_type : String? = nil
        )
        end
      end

      # Updating or deleting this resource can cause an inconsistent state.
      struct ConflictException
        include JSON::Serializable

        # The type of ConflictException.
        @[JSON::Field(key: "ConflictExceptionType")]
        getter conflict_exception_type : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @conflict_exception_type : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct CreateChannelGroupRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region. You can't use spaces in the name. You can't
        # change the name after you create the channel group.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # A unique, case-sensitive token that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "x-amzn-client-token")]
        getter client_token : String?

        # Enter any descriptive text that helps you to identify the channel group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A comma-separated list of tag key:value pairs that you define. For example: "Key1": "Value1",
        # "Key2": "Value2"
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @channel_group_name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateChannelGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The date and time the channel group was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The output domain where the source stream should be sent. Integrate the egress domain with a
        # downstream CDN (such as Amazon CloudFront) or playback device.
        @[JSON::Field(key: "EgressDomain")]
        getter egress_domain : String

        # The date and time the channel group was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The description for your channel group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current Entity Tag (ETag) associated with this resource. The entity tag can be used to safely
        # make concurrent updates to the resource.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The comma-separated list of tag key:value pairs assigned to the channel group.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @created_at : Time,
          @egress_domain : String,
          @modified_at : Time,
          @description : String? = nil,
          @e_tag : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateChannelRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group. You can't change the name after you
        # create the channel.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # A unique, case-sensitive token that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "x-amzn-client-token")]
        getter client_token : String?

        # Enter any descriptive text that helps you to identify the channel.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The configuration for input switching based on the media quality confidence score (MQCS) as provided
        # from AWS Elemental MediaLive. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "InputSwitchConfiguration")]
        getter input_switch_configuration : Types::InputSwitchConfiguration?

        # The input type will be an immutable field which will be used to define whether the channel will
        # allow CMAF ingest or HLS ingest. If unprovided, it will default to HLS to preserve current behavior.
        # The allowed values are: HLS - The HLS streaming specification (which defines M3U8 manifests and TS
        # segments). CMAF - The DASH-IF CMAF Ingest specification (which defines CMAF segments with optional
        # DASH manifests).
        @[JSON::Field(key: "InputType")]
        getter input_type : String?

        # The settings for what common media server data (CMSD) headers AWS Elemental MediaPackage includes in
        # responses to the CDN. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "OutputHeaderConfiguration")]
        getter output_header_configuration : Types::OutputHeaderConfiguration?

        # A comma-separated list of tag key:value pairs that you define. For example: "Key1": "Value1",
        # "Key2": "Value2"
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @input_switch_configuration : Types::InputSwitchConfiguration? = nil,
          @input_type : String? = nil,
          @output_header_configuration : Types::OutputHeaderConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateChannelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The date and time the channel was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The date and time the channel was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The description for your channel.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current Entity Tag (ETag) associated with this resource. The entity tag can be used to safely
        # make concurrent updates to the resource.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        @[JSON::Field(key: "IngestEndpoints")]
        getter ingest_endpoints : Array(Types::IngestEndpoint)?

        # The configuration for input switching based on the media quality confidence score (MQCS) as provided
        # from AWS Elemental MediaLive. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "InputSwitchConfiguration")]
        getter input_switch_configuration : Types::InputSwitchConfiguration?

        # The input type will be an immutable field which will be used to define whether the channel will
        # allow CMAF ingest or HLS ingest. If unprovided, it will default to HLS to preserve current behavior.
        # The allowed values are: HLS - The HLS streaming specification (which defines M3U8 manifests and TS
        # segments). CMAF - The DASH-IF CMAF Ingest specification (which defines CMAF segments with optional
        # DASH manifests).
        @[JSON::Field(key: "InputType")]
        getter input_type : String?

        # The settings for what common media server data (CMSD) headers AWS Elemental MediaPackage includes in
        # responses to the CDN. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "OutputHeaderConfiguration")]
        getter output_header_configuration : Types::OutputHeaderConfiguration?

        # The comma-separated list of tag key:value pairs assigned to the channel.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @created_at : Time,
          @modified_at : Time,
          @description : String? = nil,
          @e_tag : String? = nil,
          @ingest_endpoints : Array(Types::IngestEndpoint)? = nil,
          @input_switch_configuration : Types::InputSwitchConfiguration? = nil,
          @input_type : String? = nil,
          @output_header_configuration : Types::OutputHeaderConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Create a DASH manifest configuration.
      struct CreateDashManifestConfiguration
        include JSON::Serializable

        # A short string that's appended to the endpoint URL. The child manifest name creates a unique path to
        # this endpoint.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # The base URLs to use for retrieving segments.
        @[JSON::Field(key: "BaseUrls")]
        getter base_urls : Array(Types::DashBaseUrl)?

        # The layout of the DASH manifest that MediaPackage produces. STANDARD indicates a default manifest,
        # which is compacted. NONE indicates a full manifest. For information about compactness, see DASH
        # manifest compactness in the Elemental MediaPackage v2 User Guide .
        @[JSON::Field(key: "Compactness")]
        getter compactness : String?

        # Determines how the DASH manifest signals the DRM content.
        @[JSON::Field(key: "DrmSignaling")]
        getter drm_signaling : String?

        # For endpoints that use the DVB-DASH profile only. The font download and error reporting information
        # that you want MediaPackage to pass through to the manifest.
        @[JSON::Field(key: "DvbSettings")]
        getter dvb_settings : Types::DashDvbSettings?

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # The total duration (in seconds) of the manifest's content.
        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        # Minimum amount of content (in seconds) that a player must keep available in the buffer.
        @[JSON::Field(key: "MinBufferTimeSeconds")]
        getter min_buffer_time_seconds : Int32?

        # Minimum amount of time (in seconds) that the player should wait before requesting updates to the
        # manifest.
        @[JSON::Field(key: "MinUpdatePeriodSeconds")]
        getter min_update_period_seconds : Int32?

        # A list of triggers that controls when AWS Elemental MediaPackage separates the MPEG-DASH manifest
        # into multiple periods. Type ADS to indicate that AWS Elemental MediaPackage must create periods in
        # the output manifest that correspond to SCTE-35 ad markers in the input source. Leave this value
        # empty to indicate that the manifest is contained all in one period. For more information about
        # periods in the DASH manifest, see Multi-period DASH in AWS Elemental MediaPackage .
        @[JSON::Field(key: "PeriodTriggers")]
        getter period_triggers : Array(String)?

        # The profile that the output is compliant with.
        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(String)?

        # Details about the content that you want MediaPackage to pass through in the manifest to the playback
        # device.
        @[JSON::Field(key: "ProgramInformation")]
        getter program_information : Types::DashProgramInformation?

        # The SCTE configuration.
        @[JSON::Field(key: "ScteDash")]
        getter scte_dash : Types::ScteDash?

        # Determines the type of variable used in the media URL of the SegmentTemplate tag in the manifest.
        # Also specifies if segment timeline information is included in SegmentTimeline or SegmentTemplate .
        # Value description: NUMBER_WITH_TIMELINE - The $Number$ variable is used in the media URL. The value
        # of this variable is the sequential number of the segment. A full SegmentTimeline object is presented
        # in each SegmentTemplate .
        @[JSON::Field(key: "SegmentTemplateFormat")]
        getter segment_template_format : String?

        # The configuration for DASH subtitles.
        @[JSON::Field(key: "SubtitleConfiguration")]
        getter subtitle_configuration : Types::DashSubtitleConfiguration?

        # The amount of time (in seconds) that the player should be from the end of the manifest.
        @[JSON::Field(key: "SuggestedPresentationDelaySeconds")]
        getter suggested_presentation_delay_seconds : Int32?

        # Determines the type of UTC timing included in the DASH Media Presentation Description (MPD).
        @[JSON::Field(key: "UtcTiming")]
        getter utc_timing : Types::DashUtcTiming?

        def initialize(
          @manifest_name : String,
          @base_urls : Array(Types::DashBaseUrl)? = nil,
          @compactness : String? = nil,
          @drm_signaling : String? = nil,
          @dvb_settings : Types::DashDvbSettings? = nil,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @manifest_window_seconds : Int32? = nil,
          @min_buffer_time_seconds : Int32? = nil,
          @min_update_period_seconds : Int32? = nil,
          @period_triggers : Array(String)? = nil,
          @profiles : Array(String)? = nil,
          @program_information : Types::DashProgramInformation? = nil,
          @scte_dash : Types::ScteDash? = nil,
          @segment_template_format : String? = nil,
          @subtitle_configuration : Types::DashSubtitleConfiguration? = nil,
          @suggested_presentation_delay_seconds : Int32? = nil,
          @utc_timing : Types::DashUtcTiming? = nil
        )
        end
      end

      # The request object for creating a new harvest job.
      struct CreateHarvestJobRequest
        include JSON::Serializable

        # The name of the channel group containing the channel from which to harvest content.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel from which to harvest content.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The S3 destination where the harvested content will be placed.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # A list of manifests to be harvested.
        @[JSON::Field(key: "HarvestedManifests")]
        getter harvested_manifests : Types::HarvestedManifests

        # The name of the origin endpoint from which to harvest content.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The configuration for when the harvest job should run, including start and end times.
        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::HarvesterScheduleConfiguration

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "x-amzn-client-token")]
        getter client_token : String?

        # An optional description for the harvest job.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A name for the harvest job. This name must be unique within the channel.
        @[JSON::Field(key: "HarvestJobName")]
        getter harvest_job_name : String?

        # A collection of tags associated with the harvest job.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @destination : Types::Destination,
          @harvested_manifests : Types::HarvestedManifests,
          @origin_endpoint_name : String,
          @schedule_configuration : Types::HarvesterScheduleConfiguration,
          @client_token : String? = nil,
          @description : String? = nil,
          @harvest_job_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The response object returned after creating a harvest job.
      struct CreateHarvestJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created harvest job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the channel group containing the channel from which content is being harvested.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel from which content is being harvested.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The date and time the harvest job was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The S3 destination where the harvested content will be placed.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # The name of the created harvest job.
        @[JSON::Field(key: "HarvestJobName")]
        getter harvest_job_name : String

        # A list of manifests that will be harvested.
        @[JSON::Field(key: "HarvestedManifests")]
        getter harvested_manifests : Types::HarvestedManifests

        # The date and time the harvest job was last modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The name of the origin endpoint from which content is being harvested.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The configuration for when the harvest job will run, including start and end times.
        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::HarvesterScheduleConfiguration

        # The current status of the harvest job (e.g., CREATED, IN_PROGRESS, ABORTED, COMPLETED, FAILED).
        @[JSON::Field(key: "Status")]
        getter status : String

        # The description of the harvest job, if provided.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current version of the harvest job. Used for concurrency control.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # An error message if the harvest job creation failed.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # A collection of tags associated with the harvest job.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @created_at : Time,
          @destination : Types::Destination,
          @harvest_job_name : String,
          @harvested_manifests : Types::HarvestedManifests,
          @modified_at : Time,
          @origin_endpoint_name : String,
          @schedule_configuration : Types::HarvesterScheduleConfiguration,
          @status : String,
          @description : String? = nil,
          @e_tag : String? = nil,
          @error_message : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Create an HTTP live streaming (HLS) manifest configuration.
      struct CreateHlsManifestConfiguration
        include JSON::Serializable

        # A short short string that's appended to the endpoint URL. The manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index.
        # MediaPackage automatically inserts the format extension, such as .m3u8. You can't use the same
        # manifest name if you use HLS manifest and low-latency HLS manifest. The manifestName on the
        # HLSManifest object overrides the manifestName you provided on the originEndpoint object.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # A short string that's appended to the endpoint URL. The child manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index, with
        # an added suffix to distinguish it from the manifest name. The manifestName on the HLSManifest object
        # overrides the manifestName you provided on the originEndpoint object.
        @[JSON::Field(key: "ChildManifestName")]
        getter child_manifest_name : String?

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # The total duration (in seconds) of the manifest's content.
        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        # Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval that you specify. If you
        # don't enter an interval, EXT-X-PROGRAM-DATE-TIME tags aren't included in the manifest. The tags sync
        # the stream to the wall clock so that viewers can seek to a specific time in the playback timeline on
        # the player. Irrespective of this parameter, if any ID3Timed metadata is in the HLS input, it is
        # passed through to the HLS output.
        @[JSON::Field(key: "ProgramDateTimeIntervalSeconds")]
        getter program_date_time_interval_seconds : Int32?

        @[JSON::Field(key: "ScteHls")]
        getter scte_hls : Types::ScteHls?

        @[JSON::Field(key: "StartTag")]
        getter start_tag : Types::StartTag?

        # When enabled, MediaPackage URL-encodes the query string for API requests for HLS child manifests to
        # comply with Amazon Web Services Signature Version 4 (SigV4) signature signing protocol. For more
        # information, see Amazon Web Services Signature Version 4 for API requests in Identity and Access
        # Management User Guide .
        @[JSON::Field(key: "UrlEncodeChildManifest")]
        getter url_encode_child_manifest : Bool?

        def initialize(
          @manifest_name : String,
          @child_manifest_name : String? = nil,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @manifest_window_seconds : Int32? = nil,
          @program_date_time_interval_seconds : Int32? = nil,
          @scte_hls : Types::ScteHls? = nil,
          @start_tag : Types::StartTag? = nil,
          @url_encode_child_manifest : Bool? = nil
        )
        end
      end

      # Create a low-latency HTTP live streaming (HLS) manifest configuration.
      struct CreateLowLatencyHlsManifestConfiguration
        include JSON::Serializable

        # A short short string that's appended to the endpoint URL. The manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index.
        # MediaPackage automatically inserts the format extension, such as .m3u8. You can't use the same
        # manifest name if you use HLS manifest and low-latency HLS manifest. The manifestName on the
        # HLSManifest object overrides the manifestName you provided on the originEndpoint object.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # A short string that's appended to the endpoint URL. The child manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index, with
        # an added suffix to distinguish it from the manifest name. The manifestName on the HLSManifest object
        # overrides the manifestName you provided on the originEndpoint object.
        @[JSON::Field(key: "ChildManifestName")]
        getter child_manifest_name : String?

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # The total duration (in seconds) of the manifest's content.
        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        # Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval that you specify. If you
        # don't enter an interval, EXT-X-PROGRAM-DATE-TIME tags aren't included in the manifest. The tags sync
        # the stream to the wall clock so that viewers can seek to a specific time in the playback timeline on
        # the player. Irrespective of this parameter, if any ID3Timed metadata is in the HLS input, it is
        # passed through to the HLS output.
        @[JSON::Field(key: "ProgramDateTimeIntervalSeconds")]
        getter program_date_time_interval_seconds : Int32?

        @[JSON::Field(key: "ScteHls")]
        getter scte_hls : Types::ScteHls?

        @[JSON::Field(key: "StartTag")]
        getter start_tag : Types::StartTag?

        # When enabled, MediaPackage URL-encodes the query string for API requests for LL-HLS child manifests
        # to comply with Amazon Web Services Signature Version 4 (SigV4) signature signing protocol. For more
        # information, see Amazon Web Services Signature Version 4 for API requests in Identity and Access
        # Management User Guide .
        @[JSON::Field(key: "UrlEncodeChildManifest")]
        getter url_encode_child_manifest : Bool?

        def initialize(
          @manifest_name : String,
          @child_manifest_name : String? = nil,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @manifest_window_seconds : Int32? = nil,
          @program_date_time_interval_seconds : Int32? = nil,
          @scte_hls : Types::ScteHls? = nil,
          @start_tag : Types::StartTag? = nil,
          @url_encode_child_manifest : Bool? = nil
        )
        end
      end

      # Configuration parameters for creating a Microsoft Smooth Streaming (MSS) manifest. MSS is a
      # streaming media format developed by Microsoft that delivers adaptive bitrate streaming content to
      # compatible players and devices.
      struct CreateMssManifestConfiguration
        include JSON::Serializable

        # A short string that's appended to the endpoint URL to create a unique path to this MSS manifest. The
        # manifest name must be unique within the origin endpoint and can contain letters, numbers, hyphens,
        # and underscores.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # Determines the layout format of the MSS manifest. This controls how the manifest is structured and
        # presented to client players, affecting compatibility with different MSS-compatible devices and
        # applications.
        @[JSON::Field(key: "ManifestLayout")]
        getter manifest_layout : String?

        # The total duration (in seconds) of the manifest window. This determines how much content is
        # available in the manifest at any given time. The manifest window slides forward as new segments
        # become available, maintaining a consistent duration of content. The minimum value is 30 seconds.
        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        def initialize(
          @manifest_name : String,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @manifest_layout : String? = nil,
          @manifest_window_seconds : Int32? = nil
        )
        end
      end

      struct CreateOriginEndpointRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The type of container to attach to this origin endpoint. A container type is a file format that
        # encapsulates one or more media streams, such as audio and video, into a single file. You can't
        # change the container type after you create the endpoint.
        @[JSON::Field(key: "ContainerType")]
        getter container_type : String

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and must be unique for your account in the AWS Region and channel. You can't use spaces in
        # the name. You can't change the name after you create the endpoint.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # A unique, case-sensitive token that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "x-amzn-client-token")]
        getter client_token : String?

        # A DASH manifest configuration.
        @[JSON::Field(key: "DashManifests")]
        getter dash_manifests : Array(Types::CreateDashManifestConfiguration)?

        # Enter any descriptive text that helps you to identify the origin endpoint.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The failover settings for the endpoint.
        @[JSON::Field(key: "ForceEndpointErrorConfiguration")]
        getter force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration?

        # An HTTP live streaming (HLS) manifest configuration.
        @[JSON::Field(key: "HlsManifests")]
        getter hls_manifests : Array(Types::CreateHlsManifestConfiguration)?

        # A low-latency HLS manifest configuration.
        @[JSON::Field(key: "LowLatencyHlsManifests")]
        getter low_latency_hls_manifests : Array(Types::CreateLowLatencyHlsManifestConfiguration)?

        # A list of Microsoft Smooth Streaming (MSS) manifest configurations for the origin endpoint. You can
        # configure multiple MSS manifests to provide different streaming experiences or to support different
        # client requirements.
        @[JSON::Field(key: "MssManifests")]
        getter mss_manifests : Array(Types::CreateMssManifestConfiguration)?

        # The segment configuration, including the segment name, duration, and other configuration values.
        @[JSON::Field(key: "Segment")]
        getter segment : Types::Segment?

        # The size of the window (in seconds) to create a window of the live stream that's available for
        # on-demand viewing. Viewers can start-over or catch-up on content that falls within the window. The
        # maximum startover window is 1,209,600 seconds (14 days).
        @[JSON::Field(key: "StartoverWindowSeconds")]
        getter startover_window_seconds : Int32?

        # A comma-separated list of tag key:value pairs that you define. For example: "Key1": "Value1",
        # "Key2": "Value2"
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @container_type : String,
          @origin_endpoint_name : String,
          @client_token : String? = nil,
          @dash_manifests : Array(Types::CreateDashManifestConfiguration)? = nil,
          @description : String? = nil,
          @force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration? = nil,
          @hls_manifests : Array(Types::CreateHlsManifestConfiguration)? = nil,
          @low_latency_hls_manifests : Array(Types::CreateLowLatencyHlsManifestConfiguration)? = nil,
          @mss_manifests : Array(Types::CreateMssManifestConfiguration)? = nil,
          @segment : Types::Segment? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateOriginEndpointResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The type of container attached to this origin endpoint.
        @[JSON::Field(key: "ContainerType")]
        getter container_type : String

        # The date and time the origin endpoint was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The date and time the origin endpoint was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The segment configuration, including the segment name, duration, and other configuration values.
        @[JSON::Field(key: "Segment")]
        getter segment : Types::Segment

        # A DASH manifest configuration.
        @[JSON::Field(key: "DashManifests")]
        getter dash_manifests : Array(Types::GetDashManifestConfiguration)?

        # The description for your origin endpoint.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current Entity Tag (ETag) associated with this resource. The entity tag can be used to safely
        # make concurrent updates to the resource.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The failover settings for the endpoint.
        @[JSON::Field(key: "ForceEndpointErrorConfiguration")]
        getter force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration?

        # An HTTP live streaming (HLS) manifest configuration.
        @[JSON::Field(key: "HlsManifests")]
        getter hls_manifests : Array(Types::GetHlsManifestConfiguration)?

        # A low-latency HLS manifest configuration.
        @[JSON::Field(key: "LowLatencyHlsManifests")]
        getter low_latency_hls_manifests : Array(Types::GetLowLatencyHlsManifestConfiguration)?

        # The Microsoft Smooth Streaming (MSS) manifest configurations that were created for this origin
        # endpoint.
        @[JSON::Field(key: "MssManifests")]
        getter mss_manifests : Array(Types::GetMssManifestConfiguration)?

        # The size of the window (in seconds) to create a window of the live stream that's available for
        # on-demand viewing. Viewers can start-over or catch-up on content that falls within the window.
        @[JSON::Field(key: "StartoverWindowSeconds")]
        getter startover_window_seconds : Int32?

        # The comma-separated list of tag key:value pairs assigned to the origin endpoint.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @container_type : String,
          @created_at : Time,
          @modified_at : Time,
          @origin_endpoint_name : String,
          @segment : Types::Segment,
          @dash_manifests : Array(Types::GetDashManifestConfiguration)? = nil,
          @description : String? = nil,
          @e_tag : String? = nil,
          @force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration? = nil,
          @hls_manifests : Array(Types::GetHlsManifestConfiguration)? = nil,
          @low_latency_hls_manifests : Array(Types::GetLowLatencyHlsManifestConfiguration)? = nil,
          @mss_manifests : Array(Types::GetMssManifestConfiguration)? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The base URLs to use for retrieving segments. You can specify multiple locations and indicate the
      # priority and weight for when each should be used, for use in mutli-CDN workflows.
      struct DashBaseUrl
        include JSON::Serializable

        # A source location for segments.
        @[JSON::Field(key: "Url")]
        getter url : String

        # For use with DVB-DASH profiles only. The priority of this location for servings segments. The lower
        # the number, the higher the priority.
        @[JSON::Field(key: "DvbPriority")]
        getter dvb_priority : Int32?

        # For use with DVB-DASH profiles only. The weighting for source locations that have the same priority.
        @[JSON::Field(key: "DvbWeight")]
        getter dvb_weight : Int32?

        # The name of the source location.
        @[JSON::Field(key: "ServiceLocation")]
        getter service_location : String?

        def initialize(
          @url : String,
          @dvb_priority : Int32? = nil,
          @dvb_weight : Int32? = nil,
          @service_location : String? = nil
        )
        end
      end

      # For use with DVB-DASH profiles only. The settings for font downloads that you want Elemental
      # MediaPackage to pass through to the manifest.
      struct DashDvbFontDownload
        include JSON::Serializable

        # The fontFamily name for subtitles, as described in EBU-TT-D Subtitling Distribution Format .
        @[JSON::Field(key: "FontFamily")]
        getter font_family : String?

        # The mimeType of the resource that's at the font download URL. For information about font MIME types,
        # see the MPEG-DASH Profile for Transport of ISO BMFF Based DVB Services over IP Based Networks
        # document.
        @[JSON::Field(key: "MimeType")]
        getter mime_type : String?

        # The URL for downloading fonts for subtitles.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @font_family : String? = nil,
          @mime_type : String? = nil,
          @url : String? = nil
        )
        end
      end

      # For use with DVB-DASH profiles only. The settings for error reporting from the playback device that
      # you want Elemental MediaPackage to pass through to the manifest.
      struct DashDvbMetricsReporting
        include JSON::Serializable

        # The URL where playback devices send error reports.
        @[JSON::Field(key: "ReportingUrl")]
        getter reporting_url : String

        # The number of playback devices per 1000 that will send error reports to the reporting URL. This
        # represents the probability that a playback device will be a reporting player for this session.
        @[JSON::Field(key: "Probability")]
        getter probability : Int32?

        def initialize(
          @reporting_url : String,
          @probability : Int32? = nil
        )
        end
      end

      # For endpoints that use the DVB-DASH profile only. The font download and error reporting information
      # that you want MediaPackage to pass through to the manifest.
      struct DashDvbSettings
        include JSON::Serializable

        # Playback device error reporting settings.
        @[JSON::Field(key: "ErrorMetrics")]
        getter error_metrics : Array(Types::DashDvbMetricsReporting)?

        # Subtitle font settings.
        @[JSON::Field(key: "FontDownload")]
        getter font_download : Types::DashDvbFontDownload?

        def initialize(
          @error_metrics : Array(Types::DashDvbMetricsReporting)? = nil,
          @font_download : Types::DashDvbFontDownload? = nil
        )
        end
      end

      # Details about the content that you want MediaPackage to pass through in the manifest to the playback
      # device.
      struct DashProgramInformation
        include JSON::Serializable

        # A copyright statement about the content.
        @[JSON::Field(key: "Copyright")]
        getter copyright : String?

        # The language code for this manifest.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # An absolute URL that contains more information about this content.
        @[JSON::Field(key: "MoreInformationUrl")]
        getter more_information_url : String?

        # Information about the content provider.
        @[JSON::Field(key: "Source")]
        getter source : String?

        # The title for the manifest.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @copyright : String? = nil,
          @language_code : String? = nil,
          @more_information_url : String? = nil,
          @source : String? = nil,
          @title : String? = nil
        )
        end
      end

      # The configuration for DASH subtitles.
      struct DashSubtitleConfiguration
        include JSON::Serializable

        # Settings for TTML subtitles.
        @[JSON::Field(key: "TtmlConfiguration")]
        getter ttml_configuration : Types::DashTtmlConfiguration?

        def initialize(
          @ttml_configuration : Types::DashTtmlConfiguration? = nil
        )
        end
      end

      # The settings for TTML subtitles.
      struct DashTtmlConfiguration
        include JSON::Serializable

        # The profile that MediaPackage uses when signaling subtitles in the manifest. IMSC is the default
        # profile. EBU-TT-D produces subtitles that are compliant with the EBU-TT-D TTML profile. MediaPackage
        # passes through subtitle styles to the manifest. For more information about EBU-TT-D subtitles, see
        # EBU-TT-D Subtitling Distribution Format .
        @[JSON::Field(key: "TtmlProfile")]
        getter ttml_profile : String

        def initialize(
          @ttml_profile : String
        )
        end
      end

      # Determines the type of UTC timing included in the DASH Media Presentation Description (MPD).
      struct DashUtcTiming
        include JSON::Serializable

        # The UTC timing mode.
        @[JSON::Field(key: "TimingMode")]
        getter timing_mode : String?

        # The the method that the player uses to synchronize to coordinated universal time (UTC) wall clock
        # time.
        @[JSON::Field(key: "TimingSource")]
        getter timing_source : String?

        def initialize(
          @timing_mode : String? = nil,
          @timing_source : String? = nil
        )
        end
      end

      struct DeleteChannelGroupRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        def initialize(
          @channel_group_name : String
        )
        end
      end

      struct DeleteChannelGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteChannelPolicyRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_group_name : String,
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

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String
        )
        end
      end

      struct DeleteChannelResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteOriginEndpointPolicyRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @origin_endpoint_name : String
        )
        end
      end

      struct DeleteOriginEndpointPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteOriginEndpointRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @origin_endpoint_name : String
        )
        end
      end

      struct DeleteOriginEndpointResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration for the destination where the harvested content will be exported.
      struct Destination
        include JSON::Serializable

        # The configuration for exporting harvested content to an S3 bucket. This includes details such as the
        # bucket name and destination path within the bucket.
        @[JSON::Field(key: "S3Destination")]
        getter s3_destination : Types::S3DestinationConfig

        def initialize(
          @s3_destination : Types::S3DestinationConfig
        )
        end
      end

      # The parameters for encrypting content.
      struct Encryption
        include JSON::Serializable

        # The encryption method to use.
        @[JSON::Field(key: "EncryptionMethod")]
        getter encryption_method : Types::EncryptionMethod

        # The parameters for the SPEKE key provider.
        @[JSON::Field(key: "SpekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider

        # Excludes SEIG and SGPD boxes from segment metadata in CMAF containers. When set to true ,
        # MediaPackage omits these DRM metadata boxes from CMAF segments, which can improve compatibility with
        # certain devices and players that don't support these boxes. Important considerations: This setting
        # only affects CMAF container formats Key rotation can still be handled through media playlist
        # signaling PSSH and TENC boxes remain unaffected Default behavior is preserved when this setting is
        # disabled Valid values: true | false Default: false
        @[JSON::Field(key: "CmafExcludeSegmentDrmMetadata")]
        getter cmaf_exclude_segment_drm_metadata : Bool?

        # A 128-bit, 16-byte hex value represented by a 32-character string, used in conjunction with the key
        # for encrypting content. If you don't specify a value, then MediaPackage creates the constant
        # initialization vector (IV).
        @[JSON::Field(key: "ConstantInitializationVector")]
        getter constant_initialization_vector : String?

        # The frequency (in seconds) of key changes for live workflows, in which content is streamed real
        # time. The service retrieves content keys before the live content begins streaming, and then
        # retrieves them as needed over the lifetime of the workflow. By default, key rotation is set to 300
        # seconds (5 minutes), the minimum rotation interval, which is equivalent to setting it to 300. If you
        # don't enter an interval, content keys aren't rotated. The following example setting causes the
        # service to rotate keys every thirty minutes: 1800
        @[JSON::Field(key: "KeyRotationIntervalSeconds")]
        getter key_rotation_interval_seconds : Int32?

        def initialize(
          @encryption_method : Types::EncryptionMethod,
          @speke_key_provider : Types::SpekeKeyProvider,
          @cmaf_exclude_segment_drm_metadata : Bool? = nil,
          @constant_initialization_vector : String? = nil,
          @key_rotation_interval_seconds : Int32? = nil
        )
        end
      end

      # Configure one or more content encryption keys for your endpoints that use SPEKE Version 2.0. The
      # encryption contract defines which content keys are used to encrypt the audio and video tracks in
      # your stream. To configure the encryption contract, specify which audio and video encryption presets
      # to use.
      struct EncryptionContractConfiguration
        include JSON::Serializable

        # A collection of audio encryption presets. Value description: PRESET-AUDIO-1 - Use one content key to
        # encrypt all of the audio tracks in your stream. PRESET-AUDIO-2 - Use one content key to encrypt all
        # of the stereo audio tracks and one content key to encrypt all of the multichannel audio tracks.
        # PRESET-AUDIO-3 - Use one content key to encrypt all of the stereo audio tracks, one content key to
        # encrypt all of the multichannel audio tracks with 3 to 6 channels, and one content key to encrypt
        # all of the multichannel audio tracks with more than 6 channels. SHARED - Use the same content key
        # for all of the audio and video tracks in your stream. UNENCRYPTED - Don't encrypt any of the audio
        # tracks in your stream.
        @[JSON::Field(key: "PresetSpeke20Audio")]
        getter preset_speke20_audio : String

        # A collection of video encryption presets. Value description: PRESET-VIDEO-1 - Use one content key to
        # encrypt all of the video tracks in your stream. PRESET-VIDEO-2 - Use one content key to encrypt all
        # of the SD video tracks and one content key for all HD and higher resolutions video tracks.
        # PRESET-VIDEO-3 - Use one content key to encrypt all of the SD video tracks, one content key for HD
        # video tracks and one content key for all UHD video tracks. PRESET-VIDEO-4 - Use one content key to
        # encrypt all of the SD video tracks, one content key for HD video tracks, one content key for all
        # UHD1 video tracks and one content key for all UHD2 video tracks. PRESET-VIDEO-5 - Use one content
        # key to encrypt all of the SD video tracks, one content key for HD1 video tracks, one content key for
        # HD2 video tracks, one content key for all UHD1 video tracks and one content key for all UHD2 video
        # tracks. PRESET-VIDEO-6 - Use one content key to encrypt all of the SD video tracks, one content key
        # for HD1 video tracks, one content key for HD2 video tracks and one content key for all UHD video
        # tracks. PRESET-VIDEO-7 - Use one content key to encrypt all of the SD+HD1 video tracks, one content
        # key for HD2 video tracks and one content key for all UHD video tracks. PRESET-VIDEO-8 - Use one
        # content key to encrypt all of the SD+HD1 video tracks, one content key for HD2 video tracks, one
        # content key for all UHD1 video tracks and one content key for all UHD2 video tracks. SHARED - Use
        # the same content key for all of the video and audio tracks in your stream. UNENCRYPTED - Don't
        # encrypt any of the video tracks in your stream.
        @[JSON::Field(key: "PresetSpeke20Video")]
        getter preset_speke20_video : String

        def initialize(
          @preset_speke20_audio : String,
          @preset_speke20_video : String
        )
        end
      end

      # The encryption type.
      struct EncryptionMethod
        include JSON::Serializable

        # The encryption method to use.
        @[JSON::Field(key: "CmafEncryptionMethod")]
        getter cmaf_encryption_method : String?

        # The encryption method used for Microsoft Smooth Streaming (MSS) content. This specifies how the MSS
        # segments are encrypted to protect the content during delivery to client players.
        @[JSON::Field(key: "IsmEncryptionMethod")]
        getter ism_encryption_method : String?

        # The encryption method to use.
        @[JSON::Field(key: "TsEncryptionMethod")]
        getter ts_encryption_method : String?

        def initialize(
          @cmaf_encryption_method : String? = nil,
          @ism_encryption_method : String? = nil,
          @ts_encryption_method : String? = nil
        )
        end
      end

      # Filter configuration includes settings for manifest filtering, start and end times, and time delay
      # that apply to all of your egress requests for this manifest.
      struct FilterConfiguration
        include JSON::Serializable

        # Optionally specify the clip start time for all of your manifest egress requests. When you include
        # clip start time, note that you cannot use clip start time query parameters for this manifest's
        # endpoint URL.
        @[JSON::Field(key: "ClipStartTime")]
        getter clip_start_time : Time?

        # Optionally specify one or more DRM settings for all of your manifest egress requests. When you
        # include a DRM setting, note that you cannot use an identical DRM setting query parameter for this
        # manifest's endpoint URL.
        @[JSON::Field(key: "DrmSettings")]
        getter drm_settings : String?

        # Optionally specify the end time for all of your manifest egress requests. When you include end time,
        # note that you cannot use end time query parameters for this manifest's endpoint URL.
        @[JSON::Field(key: "End")]
        getter end : Time?

        # Optionally specify one or more manifest filters for all of your manifest egress requests. When you
        # include a manifest filter, note that you cannot use an identical manifest filter query parameter for
        # this manifest's endpoint URL.
        @[JSON::Field(key: "ManifestFilter")]
        getter manifest_filter : String?

        # Optionally specify the start time for all of your manifest egress requests. When you include start
        # time, note that you cannot use start time query parameters for this manifest's endpoint URL.
        @[JSON::Field(key: "Start")]
        getter start : Time?

        # Optionally specify the time delay for all of your manifest egress requests. Enter a value that is
        # smaller than your endpoint's startover window. When you include time delay, note that you cannot use
        # time delay query parameters for this manifest's endpoint URL.
        @[JSON::Field(key: "TimeDelaySeconds")]
        getter time_delay_seconds : Int32?

        def initialize(
          @clip_start_time : Time? = nil,
          @drm_settings : String? = nil,
          @end : Time? = nil,
          @manifest_filter : String? = nil,
          @start : Time? = nil,
          @time_delay_seconds : Int32? = nil
        )
        end
      end

      # The failover settings for the endpoint.
      struct ForceEndpointErrorConfiguration
        include JSON::Serializable

        # The failover conditions for the endpoint. The options are: STALE_MANIFEST - The manifest stalled and
        # there are no new segments or parts. INCOMPLETE_MANIFEST - There is a gap in the manifest.
        # MISSING_DRM_KEY - Key rotation is enabled but we're unable to fetch the key for the current key
        # period. SLATE_INPUT - The segments which contain slate content are considered to be missing content.
        @[JSON::Field(key: "EndpointErrorConditions")]
        getter endpoint_error_conditions : Array(String)?

        def initialize(
          @endpoint_error_conditions : Array(String)? = nil
        )
        end
      end

      struct GetChannelGroupRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        def initialize(
          @channel_group_name : String
        )
        end
      end

      struct GetChannelGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The date and time the channel group was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The output domain where the source stream should be sent. Integrate the domain with a downstream CDN
        # (such as Amazon CloudFront) or playback device.
        @[JSON::Field(key: "EgressDomain")]
        getter egress_domain : String

        # The date and time the channel group was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The description for your channel group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current Entity Tag (ETag) associated with this resource. The entity tag can be used to safely
        # make concurrent updates to the resource.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The comma-separated list of tag key:value pairs assigned to the channel group.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @created_at : Time,
          @egress_domain : String,
          @modified_at : Time,
          @description : String? = nil,
          @e_tag : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetChannelPolicyRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String
        )
        end
      end

      struct GetChannelPolicyResponse
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The policy assigned to the channel.
        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @policy : String
        )
        end
      end

      struct GetChannelRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String
        )
        end
      end

      struct GetChannelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The date and time the channel was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The date and time the channel was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The description for your channel.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current Entity Tag (ETag) associated with this resource. The entity tag can be used to safely
        # make concurrent updates to the resource.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        @[JSON::Field(key: "IngestEndpoints")]
        getter ingest_endpoints : Array(Types::IngestEndpoint)?

        # The configuration for input switching based on the media quality confidence score (MQCS) as provided
        # from AWS Elemental MediaLive. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "InputSwitchConfiguration")]
        getter input_switch_configuration : Types::InputSwitchConfiguration?

        # The input type will be an immutable field which will be used to define whether the channel will
        # allow CMAF ingest or HLS ingest. If unprovided, it will default to HLS to preserve current behavior.
        # The allowed values are: HLS - The HLS streaming specification (which defines M3U8 manifests and TS
        # segments). CMAF - The DASH-IF CMAF Ingest specification (which defines CMAF segments with optional
        # DASH manifests).
        @[JSON::Field(key: "InputType")]
        getter input_type : String?

        # The settings for what common media server data (CMSD) headers AWS Elemental MediaPackage includes in
        # responses to the CDN. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "OutputHeaderConfiguration")]
        getter output_header_configuration : Types::OutputHeaderConfiguration?

        # The time that the channel was last reset.
        @[JSON::Field(key: "ResetAt")]
        getter reset_at : Time?

        # The comma-separated list of tag key:value pairs assigned to the channel.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @created_at : Time,
          @modified_at : Time,
          @description : String? = nil,
          @e_tag : String? = nil,
          @ingest_endpoints : Array(Types::IngestEndpoint)? = nil,
          @input_switch_configuration : Types::InputSwitchConfiguration? = nil,
          @input_type : String? = nil,
          @output_header_configuration : Types::OutputHeaderConfiguration? = nil,
          @reset_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Retrieve the DASH manifest configuration.
      struct GetDashManifestConfiguration
        include JSON::Serializable

        # A short string that's appended to the endpoint URL. The manifest name creates a unique path to this
        # endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # The egress domain URL for stream delivery from MediaPackage.
        @[JSON::Field(key: "Url")]
        getter url : String

        # The base URL to use for retrieving segments.
        @[JSON::Field(key: "BaseUrls")]
        getter base_urls : Array(Types::DashBaseUrl)?

        # The layout of the DASH manifest that MediaPackage produces. STANDARD indicates a default manifest,
        # which is compacted. NONE indicates a full manifest.
        @[JSON::Field(key: "Compactness")]
        getter compactness : String?

        # Determines how the DASH manifest signals the DRM content.
        @[JSON::Field(key: "DrmSignaling")]
        getter drm_signaling : String?

        # For endpoints that use the DVB-DASH profile only. The font download and error reporting information
        # that you want MediaPackage to pass through to the manifest.
        @[JSON::Field(key: "DvbSettings")]
        getter dvb_settings : Types::DashDvbSettings?

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # The total duration (in seconds) of the manifest's content.
        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        # Minimum amount of content (in seconds) that a player must keep available in the buffer.
        @[JSON::Field(key: "MinBufferTimeSeconds")]
        getter min_buffer_time_seconds : Int32?

        # Minimum amount of time (in seconds) that the player should wait before requesting updates to the
        # manifest.
        @[JSON::Field(key: "MinUpdatePeriodSeconds")]
        getter min_update_period_seconds : Int32?

        # A list of triggers that controls when AWS Elemental MediaPackage separates the MPEG-DASH manifest
        # into multiple periods. Leave this value empty to indicate that the manifest is contained all in one
        # period. For more information about periods in the DASH manifest, see Multi-period DASH in AWS
        # Elemental MediaPackage .
        @[JSON::Field(key: "PeriodTriggers")]
        getter period_triggers : Array(String)?

        # The profile that the output is compliant with.
        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(String)?

        # Details about the content that you want MediaPackage to pass through in the manifest to the playback
        # device.
        @[JSON::Field(key: "ProgramInformation")]
        getter program_information : Types::DashProgramInformation?

        # The SCTE configuration.
        @[JSON::Field(key: "ScteDash")]
        getter scte_dash : Types::ScteDash?

        # Determines the type of variable used in the media URL of the SegmentTemplate tag in the manifest.
        # Also specifies if segment timeline information is included in SegmentTimeline or SegmentTemplate .
        # Value description: NUMBER_WITH_TIMELINE - The $Number$ variable is used in the media URL. The value
        # of this variable is the sequential number of the segment. A full SegmentTimeline object is presented
        # in each SegmentTemplate .
        @[JSON::Field(key: "SegmentTemplateFormat")]
        getter segment_template_format : String?

        # The configuration for DASH subtitles.
        @[JSON::Field(key: "SubtitleConfiguration")]
        getter subtitle_configuration : Types::DashSubtitleConfiguration?

        # The amount of time (in seconds) that the player should be from the end of the manifest.
        @[JSON::Field(key: "SuggestedPresentationDelaySeconds")]
        getter suggested_presentation_delay_seconds : Int32?

        # Determines the type of UTC timing included in the DASH Media Presentation Description (MPD).
        @[JSON::Field(key: "UtcTiming")]
        getter utc_timing : Types::DashUtcTiming?

        def initialize(
          @manifest_name : String,
          @url : String,
          @base_urls : Array(Types::DashBaseUrl)? = nil,
          @compactness : String? = nil,
          @drm_signaling : String? = nil,
          @dvb_settings : Types::DashDvbSettings? = nil,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @manifest_window_seconds : Int32? = nil,
          @min_buffer_time_seconds : Int32? = nil,
          @min_update_period_seconds : Int32? = nil,
          @period_triggers : Array(String)? = nil,
          @profiles : Array(String)? = nil,
          @program_information : Types::DashProgramInformation? = nil,
          @scte_dash : Types::ScteDash? = nil,
          @segment_template_format : String? = nil,
          @subtitle_configuration : Types::DashSubtitleConfiguration? = nil,
          @suggested_presentation_delay_seconds : Int32? = nil,
          @utc_timing : Types::DashUtcTiming? = nil
        )
        end
      end

      # The request object for retrieving a specific harvest job.
      struct GetHarvestJobRequest
        include JSON::Serializable

        # The name of the channel group containing the channel associated with the harvest job.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel associated with the harvest job.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name of the harvest job to retrieve.
        @[JSON::Field(key: "HarvestJobName")]
        getter harvest_job_name : String

        # The name of the origin endpoint associated with the harvest job.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @harvest_job_name : String,
          @origin_endpoint_name : String
        )
        end
      end

      # The response object containing the details of the requested harvest job.
      struct GetHarvestJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the harvest job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the channel group containing the channel associated with the harvest job.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel associated with the harvest job.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The date and time when the harvest job was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The S3 destination where the harvested content is being placed.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # The name of the harvest job.
        @[JSON::Field(key: "HarvestJobName")]
        getter harvest_job_name : String

        # A list of manifests that are being or have been harvested.
        @[JSON::Field(key: "HarvestedManifests")]
        getter harvested_manifests : Types::HarvestedManifests

        # The date and time when the harvest job was last modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The name of the origin endpoint associated with the harvest job.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The configuration for when the harvest job is scheduled to run, including start and end times.
        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::HarvesterScheduleConfiguration

        # The current status of the harvest job (e.g., QUEUED, IN_PROGRESS, CANCELLED, COMPLETED, FAILED).
        @[JSON::Field(key: "Status")]
        getter status : String

        # The description of the harvest job, if provided.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current version of the harvest job. Used for concurrency control.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # An error message if the harvest job encountered any issues.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # A collection of tags associated with the harvest job.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @created_at : Time,
          @destination : Types::Destination,
          @harvest_job_name : String,
          @harvested_manifests : Types::HarvestedManifests,
          @modified_at : Time,
          @origin_endpoint_name : String,
          @schedule_configuration : Types::HarvesterScheduleConfiguration,
          @status : String,
          @description : String? = nil,
          @e_tag : String? = nil,
          @error_message : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Retrieve the HTTP live streaming (HLS) manifest configuration.
      struct GetHlsManifestConfiguration
        include JSON::Serializable

        # A short short string that's appended to the endpoint URL. The manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index.
        # MediaPackage automatically inserts the format extension, such as .m3u8. You can't use the same
        # manifest name if you use HLS manifest and low-latency HLS manifest. The manifestName on the
        # HLSManifest object overrides the manifestName you provided on the originEndpoint object.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # The egress domain URL for stream delivery from MediaPackage.
        @[JSON::Field(key: "Url")]
        getter url : String

        # A short string that's appended to the endpoint URL. The child manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default child manifest name,
        # index_1. The manifestName on the HLSManifest object overrides the manifestName you provided on the
        # originEndpoint object.
        @[JSON::Field(key: "ChildManifestName")]
        getter child_manifest_name : String?

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # The total duration (in seconds) of the manifest's content.
        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        # Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval that you specify. If you
        # don't enter an interval, EXT-X-PROGRAM-DATE-TIME tags aren't included in the manifest. The tags sync
        # the stream to the wall clock so that viewers can seek to a specific time in the playback timeline on
        # the player. Irrespective of this parameter, if any ID3Timed metadata is in the HLS input, it is
        # passed through to the HLS output.
        @[JSON::Field(key: "ProgramDateTimeIntervalSeconds")]
        getter program_date_time_interval_seconds : Int32?

        @[JSON::Field(key: "ScteHls")]
        getter scte_hls : Types::ScteHls?

        @[JSON::Field(key: "StartTag")]
        getter start_tag : Types::StartTag?

        # When enabled, MediaPackage URL-encodes the query string for API requests for HLS child manifests to
        # comply with Amazon Web Services Signature Version 4 (SigV4) signature signing protocol. For more
        # information, see Amazon Web Services Signature Version 4 for API requests in Identity and Access
        # Management User Guide .
        @[JSON::Field(key: "UrlEncodeChildManifest")]
        getter url_encode_child_manifest : Bool?

        def initialize(
          @manifest_name : String,
          @url : String,
          @child_manifest_name : String? = nil,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @manifest_window_seconds : Int32? = nil,
          @program_date_time_interval_seconds : Int32? = nil,
          @scte_hls : Types::ScteHls? = nil,
          @start_tag : Types::StartTag? = nil,
          @url_encode_child_manifest : Bool? = nil
        )
        end
      end

      # Retrieve the low-latency HTTP live streaming (HLS) manifest configuration.
      struct GetLowLatencyHlsManifestConfiguration
        include JSON::Serializable

        # A short short string that's appended to the endpoint URL. The manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index.
        # MediaPackage automatically inserts the format extension, such as .m3u8. You can't use the same
        # manifest name if you use HLS manifest and low-latency HLS manifest. The manifestName on the
        # HLSManifest object overrides the manifestName you provided on the originEndpoint object.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # The egress domain URL for stream delivery from MediaPackage.
        @[JSON::Field(key: "Url")]
        getter url : String

        # A short string that's appended to the endpoint URL. The child manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default child manifest name,
        # index_1. The manifestName on the HLSManifest object overrides the manifestName you provided on the
        # originEndpoint object.
        @[JSON::Field(key: "ChildManifestName")]
        getter child_manifest_name : String?

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # The total duration (in seconds) of the manifest's content.
        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        # Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval that you specify. If you
        # don't enter an interval, EXT-X-PROGRAM-DATE-TIME tags aren't included in the manifest. The tags sync
        # the stream to the wall clock so that viewers can seek to a specific time in the playback timeline on
        # the player. Irrespective of this parameter, if any ID3Timed metadata is in the HLS input, it is
        # passed through to the HLS output.
        @[JSON::Field(key: "ProgramDateTimeIntervalSeconds")]
        getter program_date_time_interval_seconds : Int32?

        @[JSON::Field(key: "ScteHls")]
        getter scte_hls : Types::ScteHls?

        @[JSON::Field(key: "StartTag")]
        getter start_tag : Types::StartTag?

        # When enabled, MediaPackage URL-encodes the query string for API requests for LL-HLS child manifests
        # to comply with Amazon Web Services Signature Version 4 (SigV4) signature signing protocol. For more
        # information, see Amazon Web Services Signature Version 4 for API requests in Identity and Access
        # Management User Guide .
        @[JSON::Field(key: "UrlEncodeChildManifest")]
        getter url_encode_child_manifest : Bool?

        def initialize(
          @manifest_name : String,
          @url : String,
          @child_manifest_name : String? = nil,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @manifest_window_seconds : Int32? = nil,
          @program_date_time_interval_seconds : Int32? = nil,
          @scte_hls : Types::ScteHls? = nil,
          @start_tag : Types::StartTag? = nil,
          @url_encode_child_manifest : Bool? = nil
        )
        end
      end

      # Configuration details for a Microsoft Smooth Streaming (MSS) manifest associated with an origin
      # endpoint. This includes all the settings and properties that define how the MSS content is packaged
      # and delivered.
      struct GetMssManifestConfiguration
        include JSON::Serializable

        # The name of the MSS manifest. This name is appended to the origin endpoint URL to create the unique
        # path for accessing this specific MSS manifest.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # The complete URL for accessing the MSS manifest. Client players use this URL to retrieve the
        # manifest and begin streaming the Microsoft Smooth Streaming content.
        @[JSON::Field(key: "Url")]
        getter url : String

        @[JSON::Field(key: "FilterConfiguration")]
        getter filter_configuration : Types::FilterConfiguration?

        # The layout format of the MSS manifest, which determines how the manifest is structured for client
        # compatibility.
        @[JSON::Field(key: "ManifestLayout")]
        getter manifest_layout : String?

        # The duration (in seconds) of the manifest window. This represents the total amount of content
        # available in the manifest at any given time.
        @[JSON::Field(key: "ManifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        def initialize(
          @manifest_name : String,
          @url : String,
          @filter_configuration : Types::FilterConfiguration? = nil,
          @manifest_layout : String? = nil,
          @manifest_window_seconds : Int32? = nil
        )
        end
      end

      struct GetOriginEndpointPolicyRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @origin_endpoint_name : String
        )
        end
      end

      struct GetOriginEndpointPolicyResponse
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The policy assigned to the origin endpoint.
        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The settings for using authorization headers between the MediaPackage endpoint and your CDN. For
        # information about CDN authorization, see CDN authorization in Elemental MediaPackage in the
        # MediaPackage user guide.
        @[JSON::Field(key: "CdnAuthConfiguration")]
        getter cdn_auth_configuration : Types::CdnAuthConfiguration?

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @origin_endpoint_name : String,
          @policy : String,
          @cdn_auth_configuration : Types::CdnAuthConfiguration? = nil
        )
        end
      end

      struct GetOriginEndpointRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @origin_endpoint_name : String
        )
        end
      end

      struct GetOriginEndpointResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The type of container attached to this origin endpoint.
        @[JSON::Field(key: "ContainerType")]
        getter container_type : String

        # The date and time the origin endpoint was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The date and time the origin endpoint was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        @[JSON::Field(key: "Segment")]
        getter segment : Types::Segment

        # A DASH manifest configuration.
        @[JSON::Field(key: "DashManifests")]
        getter dash_manifests : Array(Types::GetDashManifestConfiguration)?

        # The description for your origin endpoint.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current Entity Tag (ETag) associated with this resource. The entity tag can be used to safely
        # make concurrent updates to the resource.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The failover settings for the endpoint.
        @[JSON::Field(key: "ForceEndpointErrorConfiguration")]
        getter force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration?

        # An HTTP live streaming (HLS) manifest configuration.
        @[JSON::Field(key: "HlsManifests")]
        getter hls_manifests : Array(Types::GetHlsManifestConfiguration)?

        # A low-latency HLS manifest configuration.
        @[JSON::Field(key: "LowLatencyHlsManifests")]
        getter low_latency_hls_manifests : Array(Types::GetLowLatencyHlsManifestConfiguration)?

        # The Microsoft Smooth Streaming (MSS) manifest configurations associated with this origin endpoint.
        @[JSON::Field(key: "MssManifests")]
        getter mss_manifests : Array(Types::GetMssManifestConfiguration)?

        # The time that the origin endpoint was last reset.
        @[JSON::Field(key: "ResetAt")]
        getter reset_at : Time?

        # The size of the window (in seconds) to create a window of the live stream that's available for
        # on-demand viewing. Viewers can start-over or catch-up on content that falls within the window.
        @[JSON::Field(key: "StartoverWindowSeconds")]
        getter startover_window_seconds : Int32?

        # The comma-separated list of tag key:value pairs assigned to the origin endpoint.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @container_type : String,
          @created_at : Time,
          @modified_at : Time,
          @origin_endpoint_name : String,
          @segment : Types::Segment,
          @dash_manifests : Array(Types::GetDashManifestConfiguration)? = nil,
          @description : String? = nil,
          @e_tag : String? = nil,
          @force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration? = nil,
          @hls_manifests : Array(Types::GetHlsManifestConfiguration)? = nil,
          @low_latency_hls_manifests : Array(Types::GetLowLatencyHlsManifestConfiguration)? = nil,
          @mss_manifests : Array(Types::GetMssManifestConfiguration)? = nil,
          @reset_at : Time? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents a harvest job resource in MediaPackage v2, which is used to export content from an origin
      # endpoint to an S3 bucket.
      struct HarvestJob
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the harvest job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the channel group containing the channel associated with this harvest job.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel associated with this harvest job.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The date and time when the harvest job was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The S3 destination where the harvested content will be placed.
        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # The name of the harvest job.
        @[JSON::Field(key: "HarvestJobName")]
        getter harvest_job_name : String

        # A list of manifests that are being or have been harvested.
        @[JSON::Field(key: "HarvestedManifests")]
        getter harvested_manifests : Types::HarvestedManifests

        # The date and time when the harvest job was last modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The name of the origin endpoint associated with this harvest job.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The configuration for when the harvest job is scheduled to run.
        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::HarvesterScheduleConfiguration

        # The current status of the harvest job (e.g., QUEUED, IN_PROGRESS, CANCELLED, COMPLETED, FAILED).
        @[JSON::Field(key: "Status")]
        getter status : String

        # An optional description of the harvest job.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current version of the harvest job. Used for concurrency control.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # An error message if the harvest job encountered any issues.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @created_at : Time,
          @destination : Types::Destination,
          @harvest_job_name : String,
          @harvested_manifests : Types::HarvestedManifests,
          @modified_at : Time,
          @origin_endpoint_name : String,
          @schedule_configuration : Types::HarvesterScheduleConfiguration,
          @status : String,
          @description : String? = nil,
          @e_tag : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Information about a harvested DASH manifest.
      struct HarvestedDashManifest
        include JSON::Serializable

        # The name of the harvested DASH manifest.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        def initialize(
          @manifest_name : String
        )
        end
      end

      # Information about a harvested HLS manifest.
      struct HarvestedHlsManifest
        include JSON::Serializable

        # The name of the harvested HLS manifest.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        def initialize(
          @manifest_name : String
        )
        end
      end

      # Information about a harvested Low-Latency HLS manifest.
      struct HarvestedLowLatencyHlsManifest
        include JSON::Serializable

        # The name of the harvested Low-Latency HLS manifest.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        def initialize(
          @manifest_name : String
        )
        end
      end

      # A collection of harvested manifests of different types.
      struct HarvestedManifests
        include JSON::Serializable

        # A list of harvested DASH manifests.
        @[JSON::Field(key: "DashManifests")]
        getter dash_manifests : Array(Types::HarvestedDashManifest)?

        # A list of harvested HLS manifests.
        @[JSON::Field(key: "HlsManifests")]
        getter hls_manifests : Array(Types::HarvestedHlsManifest)?

        # A list of harvested Low-Latency HLS manifests.
        @[JSON::Field(key: "LowLatencyHlsManifests")]
        getter low_latency_hls_manifests : Array(Types::HarvestedLowLatencyHlsManifest)?

        def initialize(
          @dash_manifests : Array(Types::HarvestedDashManifest)? = nil,
          @hls_manifests : Array(Types::HarvestedHlsManifest)? = nil,
          @low_latency_hls_manifests : Array(Types::HarvestedLowLatencyHlsManifest)? = nil
        )
        end
      end

      # Defines the schedule configuration for a harvest job.
      struct HarvesterScheduleConfiguration
        include JSON::Serializable

        # The end time for the harvest job.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start time for the harvest job.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end

      # The ingest domain URL where the source stream should be sent.
      struct IngestEndpoint
        include JSON::Serializable

        # The system-generated unique identifier for the IngestEndpoint.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The ingest domain URL where the source stream should be sent.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @id : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The configuration for input switching based on the media quality confidence score (MQCS) as provided
      # from AWS Elemental MediaLive.
      struct InputSwitchConfiguration
        include JSON::Serializable

        # When true, AWS Elemental MediaPackage performs input switching based on the MQCS. Default is false.
        # This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "MQCSInputSwitching")]
        getter mqcs_input_switching : Bool?

        # For CMAF inputs, indicates which input MediaPackage should prefer when both inputs have equal MQCS
        # scores. Select 1 to prefer the first ingest endpoint, or 2 to prefer the second ingest endpoint. If
        # you don't specify a preferred input, MediaPackage uses its default switching behavior when MQCS
        # scores are equal.
        @[JSON::Field(key: "PreferredInput")]
        getter preferred_input : Int32?

        def initialize(
          @mqcs_input_switching : Bool? = nil,
          @preferred_input : Int32? = nil
        )
        end
      end

      # Indicates that an error from the service occurred while trying to process a request.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListChannelGroupsRequest
        include JSON::Serializable

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the GET list request. Use the token to fetch the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelGroupsResponse
        include JSON::Serializable

        # The objects being returned.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ChannelGroupListConfiguration)?

        # The pagination token from the GET list request. Use the token to fetch the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ChannelGroupListConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelsRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the GET list request. Use the token to fetch the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_group_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListChannelsResponse
        include JSON::Serializable

        # The objects being returned.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ChannelListConfiguration)?

        # The pagination token from the GET list request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ChannelListConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List the DASH manifest configuration.
      struct ListDashManifestConfiguration
        include JSON::Serializable

        # A short string that's appended to the endpoint URL. The manifest name creates a unique path to this
        # endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # The egress domain URL for stream delivery from MediaPackage.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @manifest_name : String,
          @url : String? = nil
        )
        end
      end

      # The request object for listing harvest jobs.
      struct ListHarvestJobsRequest
        include JSON::Serializable

        # The name of the channel group to filter the harvest jobs by. If specified, only harvest jobs
        # associated with channels in this group will be returned.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel to filter the harvest jobs by. If specified, only harvest jobs associated
        # with this channel will be returned.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String?

        # The maximum number of harvest jobs to return in a single request. If not specified, a default value
        # will be used.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination. Provide this value in subsequent requests to retrieve the next set of
        # results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the origin endpoint to filter the harvest jobs by. If specified, only harvest jobs
        # associated with this origin endpoint will be returned.
        @[JSON::Field(key: "originEndpointName")]
        getter origin_endpoint_name : String?

        # The status to filter the harvest jobs by. If specified, only harvest jobs with this status will be
        # returned.
        @[JSON::Field(key: "includeStatus")]
        getter status : String?

        def initialize(
          @channel_group_name : String,
          @channel_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @origin_endpoint_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The response object containing the list of harvest jobs that match the specified criteria.
      struct ListHarvestJobsResponse
        include JSON::Serializable

        # An array of harvest job objects that match the specified criteria.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::HarvestJob)?

        # A token used for pagination. Include this value in subsequent requests to retrieve the next set of
        # results. If null, there are no more results to retrieve.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::HarvestJob)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List the HTTP live streaming (HLS) manifest configuration.
      struct ListHlsManifestConfiguration
        include JSON::Serializable

        # A short short string that's appended to the endpoint URL. The manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index.
        # MediaPackage automatically inserts the format extension, such as .m3u8. You can't use the same
        # manifest name if you use HLS manifest and low-latency HLS manifest. The manifestName on the
        # HLSManifest object overrides the manifestName you provided on the originEndpoint object.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # A short string that's appended to the endpoint URL. The child manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default child manifest name,
        # index_1. The manifestName on the HLSManifest object overrides the manifestName you provided on the
        # originEndpoint object.
        @[JSON::Field(key: "ChildManifestName")]
        getter child_manifest_name : String?

        # The egress domain URL for stream delivery from MediaPackage.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @manifest_name : String,
          @child_manifest_name : String? = nil,
          @url : String? = nil
        )
        end
      end

      # List the low-latency HTTP live streaming (HLS) manifest configuration.
      struct ListLowLatencyHlsManifestConfiguration
        include JSON::Serializable

        # A short short string that's appended to the endpoint URL. The manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default manifest name, index.
        # MediaPackage automatically inserts the format extension, such as .m3u8. You can't use the same
        # manifest name if you use HLS manifest and low-latency HLS manifest. The manifestName on the
        # HLSManifest object overrides the manifestName you provided on the originEndpoint object.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # A short string that's appended to the endpoint URL. The child manifest name creates a unique path to
        # this endpoint. If you don't enter a value, MediaPackage uses the default child manifest name,
        # index_1. The manifestName on the HLSManifest object overrides the manifestName you provided on the
        # originEndpoint object.
        @[JSON::Field(key: "ChildManifestName")]
        getter child_manifest_name : String?

        # The egress domain URL for stream delivery from MediaPackage.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @manifest_name : String,
          @child_manifest_name : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Summary information about a Microsoft Smooth Streaming (MSS) manifest configuration. This provides
      # key details about the MSS manifest without including all configuration parameters.
      struct ListMssManifestConfiguration
        include JSON::Serializable

        # The name of the MSS manifest configuration.
        @[JSON::Field(key: "ManifestName")]
        getter manifest_name : String

        # The URL for accessing the MSS manifest.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @manifest_name : String,
          @url : String? = nil
        )
        end
      end

      struct ListOriginEndpointsRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from the GET list request. Use the token to fetch the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOriginEndpointsResponse
        include JSON::Serializable

        # The objects being returned.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::OriginEndpointListConfiguration)?

        # The pagination token from the GET list request. Use the token to fetch the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::OriginEndpointListConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the CloudWatch resource that you want to view tags for.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Contains a map of the key-value pairs for the resource tag or tags assigned to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration of the origin endpoint.
      struct OriginEndpointListConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The type of container attached to this origin endpoint. A container type is a file format that
        # encapsulates one or more media streams, such as audio and video, into a single file.
        @[JSON::Field(key: "ContainerType")]
        getter container_type : String

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The date and time the origin endpoint was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A DASH manifest configuration.
        @[JSON::Field(key: "DashManifests")]
        getter dash_manifests : Array(Types::ListDashManifestConfiguration)?

        # Any descriptive information that you want to add to the origin endpoint for future identification
        # purposes.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The failover settings for the endpoint.
        @[JSON::Field(key: "ForceEndpointErrorConfiguration")]
        getter force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration?

        # An HTTP live streaming (HLS) manifest configuration.
        @[JSON::Field(key: "HlsManifests")]
        getter hls_manifests : Array(Types::ListHlsManifestConfiguration)?

        # A low-latency HLS manifest configuration.
        @[JSON::Field(key: "LowLatencyHlsManifests")]
        getter low_latency_hls_manifests : Array(Types::ListLowLatencyHlsManifestConfiguration)?

        # The date and time the origin endpoint was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time?

        # A list of Microsoft Smooth Streaming (MSS) manifest configurations associated with the origin
        # endpoint. Each configuration represents a different MSS streaming option available from this
        # endpoint.
        @[JSON::Field(key: "MssManifests")]
        getter mss_manifests : Array(Types::ListMssManifestConfiguration)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @container_type : String,
          @origin_endpoint_name : String,
          @created_at : Time? = nil,
          @dash_manifests : Array(Types::ListDashManifestConfiguration)? = nil,
          @description : String? = nil,
          @force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration? = nil,
          @hls_manifests : Array(Types::ListHlsManifestConfiguration)? = nil,
          @low_latency_hls_manifests : Array(Types::ListLowLatencyHlsManifestConfiguration)? = nil,
          @modified_at : Time? = nil,
          @mss_manifests : Array(Types::ListMssManifestConfiguration)? = nil
        )
        end
      end

      # The settings for what common media server data (CMSD) headers AWS Elemental MediaPackage includes in
      # responses to the CDN.
      struct OutputHeaderConfiguration
        include JSON::Serializable

        # When true, AWS Elemental MediaPackage includes the MQCS in responses to the CDN. This setting is
        # valid only when InputType is CMAF .
        @[JSON::Field(key: "PublishMQCS")]
        getter publish_mqcs : Bool?

        def initialize(
          @publish_mqcs : Bool? = nil
        )
        end
      end

      struct PutChannelPolicyRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The policy to attach to the specified channel.
        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @channel_group_name : String,
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

      struct PutOriginEndpointPolicyRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The policy to attach to the specified origin endpoint.
        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The settings for using authorization headers between the MediaPackage endpoint and your CDN. For
        # information about CDN authorization, see CDN authorization in Elemental MediaPackage in the
        # MediaPackage user guide.
        @[JSON::Field(key: "CdnAuthConfiguration")]
        getter cdn_auth_configuration : Types::CdnAuthConfiguration?

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @origin_endpoint_name : String,
          @policy : String,
          @cdn_auth_configuration : Types::CdnAuthConfiguration? = nil
        )
        end
      end

      struct PutOriginEndpointPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct ResetChannelStateRequest
        include JSON::Serializable

        # The name of the channel group that contains the channel that you are resetting.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel that you are resetting.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String
        )
        end
      end

      struct ResetChannelStateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the channel that you just reset.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the channel group that contains the channel that you just reset.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel that you just reset.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The time that the channel was last reset.
        @[JSON::Field(key: "ResetAt")]
        getter reset_at : Time

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @reset_at : Time
        )
        end
      end

      struct ResetOriginEndpointStateRequest
        include JSON::Serializable

        # The name of the channel group that contains the channel with the origin endpoint that you are
        # resetting.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel with the origin endpoint that you are resetting.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name of the origin endpoint that you are resetting.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @origin_endpoint_name : String
        )
        end
      end

      struct ResetOriginEndpointStateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the endpoint that you just reset.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the channel group that contains the channel with the origin endpoint that you just
        # reset.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name of the channel with the origin endpoint that you just reset.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The name of the origin endpoint that you just reset.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The time that the origin endpoint was last reset.
        @[JSON::Field(key: "ResetAt")]
        getter reset_at : Time

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @origin_endpoint_name : String,
          @reset_at : Time
        )
        end
      end

      # The specified resource doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The specified resource type wasn't found.
        @[JSON::Field(key: "ResourceTypeNotFound")]
        getter resource_type_not_found : String?

        def initialize(
          @message : String? = nil,
          @resource_type_not_found : String? = nil
        )
        end
      end

      # Configuration parameters for where in an S3 bucket to place the harvested content.
      struct S3DestinationConfig
        include JSON::Serializable

        # The name of an S3 bucket within which harvested content will be exported.
        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # The path within the specified S3 bucket where the harvested content will be placed.
        @[JSON::Field(key: "DestinationPath")]
        getter destination_path : String

        def initialize(
          @bucket_name : String,
          @destination_path : String
        )
        end
      end

      # The SCTE configuration.
      struct Scte
        include JSON::Serializable

        # The SCTE-35 message types that you want to be treated as ad markers in the output.
        @[JSON::Field(key: "ScteFilter")]
        getter scte_filter : Array(String)?

        # Controls whether SCTE-35 messages are included in segment files. None – SCTE-35 messages are not
        # included in segments (default) All – SCTE-35 messages are embedded in segment data For DASH
        # manifests, when set to All , an InbandEventStream tag signals that SCTE messages are present in
        # segments. This setting works independently of manifest ad markers.
        @[JSON::Field(key: "ScteInSegments")]
        getter scte_in_segments : String?

        def initialize(
          @scte_filter : Array(String)? = nil,
          @scte_in_segments : String? = nil
        )
        end
      end

      # The SCTE configuration.
      struct ScteDash
        include JSON::Serializable

        # Choose how ad markers are included in the packaged content. If you include ad markers in the content
        # stream in your upstream encoders, then you need to inform MediaPackage what to do with the ad
        # markers in the output. Value description: Binary - The SCTE-35 marker is expressed as a hex-string
        # (Base64 string) rather than full XML. XML - The SCTE marker is expressed fully in XML.
        @[JSON::Field(key: "AdMarkerDash")]
        getter ad_marker_dash : String?

        def initialize(
          @ad_marker_dash : String? = nil
        )
        end
      end

      # The SCTE configuration.
      struct ScteHls
        include JSON::Serializable

        # Ad markers indicate when ads should be inserted during playback. If you include ad markers in the
        # content stream in your upstream encoders, then you need to inform MediaPackage what to do with the
        # ad markers in the output. Choose what you want MediaPackage to do with the ad markers. Value
        # description: SCTE35_ENHANCED - Generate industry-standard CUE tag ad markers in HLS manifests based
        # on SCTE-35 input messages from the input stream. DATERANGE - Insert EXT-X-DATERANGE tags to signal
        # ad and program transition events in TS and CMAF manifests. If you use DATERANGE, you must set a
        # programDateTimeIntervalSeconds value of 1 or higher. To learn more about DATERANGE, see SCTE-35 Ad
        # Marker EXT-X-DATERANGE .
        @[JSON::Field(key: "AdMarkerHls")]
        getter ad_marker_hls : String?

        def initialize(
          @ad_marker_hls : String? = nil
        )
        end
      end

      # The segment configuration, including the segment name, duration, and other configuration values.
      struct Segment
        include JSON::Serializable

        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::Encryption?

        # When selected, the stream set includes an additional I-frame only stream, along with the other
        # tracks. If false, this extra stream is not included. MediaPackage generates an I-frame only stream
        # from the first rendition in the manifest. The service inserts EXT-I-FRAMES-ONLY tags in the output
        # manifest, and then generates and includes an I-frames only playlist in the stream. This playlist
        # permits player functionality like fast forward and rewind.
        @[JSON::Field(key: "IncludeIframeOnlyStreams")]
        getter include_iframe_only_streams : Bool?

        # The SCTE configuration options in the segment settings.
        @[JSON::Field(key: "Scte")]
        getter scte : Types::Scte?

        # The duration (in seconds) of each segment. Enter a value equal to, or a multiple of, the input
        # segment duration. If the value that you enter is different from the input segment duration,
        # MediaPackage rounds segments to the nearest multiple of the input segment duration.
        @[JSON::Field(key: "SegmentDurationSeconds")]
        getter segment_duration_seconds : Int32?

        # The name that describes the segment. The name is the base name of the segment used in all content
        # manifests inside of the endpoint. You can't use spaces in the name.
        @[JSON::Field(key: "SegmentName")]
        getter segment_name : String?

        # By default, MediaPackage excludes all digital video broadcasting (DVB) subtitles from the output.
        # When selected, MediaPackage passes through DVB subtitles into the output.
        @[JSON::Field(key: "TsIncludeDvbSubtitles")]
        getter ts_include_dvb_subtitles : Bool?

        # When selected, MediaPackage bundles all audio tracks in a rendition group. All other tracks in the
        # stream can be used with any audio rendition from the group.
        @[JSON::Field(key: "TsUseAudioRenditionGroup")]
        getter ts_use_audio_rendition_group : Bool?

        def initialize(
          @encryption : Types::Encryption? = nil,
          @include_iframe_only_streams : Bool? = nil,
          @scte : Types::Scte? = nil,
          @segment_duration_seconds : Int32? = nil,
          @segment_name : String? = nil,
          @ts_include_dvb_subtitles : Bool? = nil,
          @ts_use_audio_rendition_group : Bool? = nil
        )
        end
      end

      # The request would cause a service quota to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The parameters for the SPEKE key provider.
      struct SpekeKeyProvider
        include JSON::Serializable

        # The DRM solution provider you're using to protect your content during distribution.
        @[JSON::Field(key: "DrmSystems")]
        getter drm_systems : Array(String)

        # Configure one or more content encryption keys for your endpoints that use SPEKE Version 2.0. The
        # encryption contract defines which content keys are used to encrypt the audio and video tracks in
        # your stream. To configure the encryption contract, specify which audio and video encryption presets
        # to use.
        @[JSON::Field(key: "EncryptionContractConfiguration")]
        getter encryption_contract_configuration : Types::EncryptionContractConfiguration

        # The unique identifier for the content. The service sends this to the key server to identify the
        # current endpoint. How unique you make this depends on how fine-grained you want access controls to
        # be. The service does not permit you to use the same ID for two simultaneous encryption processes.
        # The resource ID is also known as the content ID. The following example shows a resource ID:
        # MovieNight20171126093045
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The ARN for the IAM role granted by the key provider that provides access to the key provider API.
        # This role must have a trust policy that allows MediaPackage to assume the role, and it must have a
        # sufficient permissions policy to allow access to the specific key retrieval URL. Get this from your
        # DRM solution provider. Valid format: arn:aws:iam::{accountID}:role/{name} . The following example
        # shows a role ARN: arn:aws:iam::444455556666:role/SpekeAccess
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The URL of the API Gateway proxy that you set up to talk to your key server. The API Gateway proxy
        # must reside in the same AWS Region as MediaPackage and must start with https://. The following
        # example shows a URL:
        # https://1wm2dx1f33.execute-api.us-west-2.amazonaws.com/SpekeSample/copyProtection
        @[JSON::Field(key: "Url")]
        getter url : String

        # The ARN for the certificate that you imported to AWS Certificate Manager to add content key
        # encryption to this endpoint. For this feature to work, your DRM key provider must support content
        # key encryption.
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        def initialize(
          @drm_systems : Array(String),
          @encryption_contract_configuration : Types::EncryptionContractConfiguration,
          @resource_id : String,
          @role_arn : String,
          @url : String,
          @certificate_arn : String? = nil
        )
        end
      end

      # To insert an EXT-X-START tag in your HLS playlist, specify a StartTag configuration object with a
      # valid TimeOffset. When you do, you can also optionally specify whether to include a PRECISE value in
      # the EXT-X-START tag.
      struct StartTag
        include JSON::Serializable

        # Specify the value for TIME-OFFSET within your EXT-X-START tag. Enter a signed floating point value
        # which, if positive, must be less than the configured manifest duration minus three times the
        # configured segment target duration. If negative, the absolute value must be larger than three times
        # the configured segment target duration, and the absolute value must be smaller than the configured
        # manifest duration.
        @[JSON::Field(key: "TimeOffset")]
        getter time_offset : Float64

        # Specify the value for PRECISE within your EXT-X-START tag. Leave blank, or choose false, to use the
        # default value NO. Choose yes to use the value YES.
        @[JSON::Field(key: "Precise")]
        getter precise : Bool?

        def initialize(
          @time_offset : Float64,
          @precise : Bool? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the MediaPackage resource that you're adding tags to.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Contains a map of the key-value pairs for the resource tag or tags assigned to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The request throughput limit was exceeded.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the MediaPackage resource that you're removing tags from.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UpdateChannelGroupRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # Any descriptive information that you want to add to the channel group for future identification
        # purposes.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The expected current Entity Tag (ETag) for the resource. If the specified ETag does not match the
        # resource's current entity tag, the update request will be rejected.
        @[JSON::Field(key: "x-amzn-update-if-match")]
        getter e_tag : String?

        def initialize(
          @channel_group_name : String,
          @description : String? = nil,
          @e_tag : String? = nil
        )
        end
      end

      struct UpdateChannelGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The date and time the channel group was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The output domain where the source stream is sent. Integrate the domain with a downstream CDN (such
        # as Amazon CloudFront) or playback device.
        @[JSON::Field(key: "EgressDomain")]
        getter egress_domain : String

        # The date and time the channel group was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The description for your channel group.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current Entity Tag (ETag) associated with this resource. The entity tag can be used to safely
        # make concurrent updates to the resource.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The comma-separated list of tag key:value pairs assigned to the channel group.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @created_at : Time,
          @egress_domain : String,
          @modified_at : Time,
          @description : String? = nil,
          @e_tag : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct UpdateChannelRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # Any descriptive information that you want to add to the channel for future identification purposes.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The expected current Entity Tag (ETag) for the resource. If the specified ETag does not match the
        # resource's current entity tag, the update request will be rejected.
        @[JSON::Field(key: "x-amzn-update-if-match")]
        getter e_tag : String?

        # The configuration for input switching based on the media quality confidence score (MQCS) as provided
        # from AWS Elemental MediaLive. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "InputSwitchConfiguration")]
        getter input_switch_configuration : Types::InputSwitchConfiguration?

        # The settings for what common media server data (CMSD) headers AWS Elemental MediaPackage includes in
        # responses to the CDN. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "OutputHeaderConfiguration")]
        getter output_header_configuration : Types::OutputHeaderConfiguration?

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @description : String? = nil,
          @e_tag : String? = nil,
          @input_switch_configuration : Types::InputSwitchConfiguration? = nil,
          @output_header_configuration : Types::OutputHeaderConfiguration? = nil
        )
        end
      end

      struct UpdateChannelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The date and time the channel was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The date and time the channel was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The description for your channel.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current Entity Tag (ETag) associated with this resource. The entity tag can be used to safely
        # make concurrent updates to the resource.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        @[JSON::Field(key: "IngestEndpoints")]
        getter ingest_endpoints : Array(Types::IngestEndpoint)?

        # The configuration for input switching based on the media quality confidence score (MQCS) as provided
        # from AWS Elemental MediaLive. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "InputSwitchConfiguration")]
        getter input_switch_configuration : Types::InputSwitchConfiguration?

        # The input type will be an immutable field which will be used to define whether the channel will
        # allow CMAF ingest or HLS ingest. If unprovided, it will default to HLS to preserve current behavior.
        # The allowed values are: HLS - The HLS streaming specification (which defines M3U8 manifests and TS
        # segments). CMAF - The DASH-IF CMAF Ingest specification (which defines CMAF segments with optional
        # DASH manifests).
        @[JSON::Field(key: "InputType")]
        getter input_type : String?

        # The settings for what common media server data (CMSD) headers AWS Elemental MediaPackage includes in
        # responses to the CDN. This setting is valid only when InputType is CMAF .
        @[JSON::Field(key: "OutputHeaderConfiguration")]
        getter output_header_configuration : Types::OutputHeaderConfiguration?

        # The comma-separated list of tag key:value pairs assigned to the channel.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @created_at : Time,
          @modified_at : Time,
          @description : String? = nil,
          @e_tag : String? = nil,
          @ingest_endpoints : Array(Types::IngestEndpoint)? = nil,
          @input_switch_configuration : Types::InputSwitchConfiguration? = nil,
          @input_type : String? = nil,
          @output_header_configuration : Types::OutputHeaderConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct UpdateOriginEndpointRequest
        include JSON::Serializable

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The type of container attached to this origin endpoint. A container type is a file format that
        # encapsulates one or more media streams, such as audio and video, into a single file.
        @[JSON::Field(key: "ContainerType")]
        getter container_type : String

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # A DASH manifest configuration.
        @[JSON::Field(key: "DashManifests")]
        getter dash_manifests : Array(Types::CreateDashManifestConfiguration)?

        # Any descriptive information that you want to add to the origin endpoint for future identification
        # purposes.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The expected current Entity Tag (ETag) for the resource. If the specified ETag does not match the
        # resource's current entity tag, the update request will be rejected.
        @[JSON::Field(key: "x-amzn-update-if-match")]
        getter e_tag : String?

        # The failover settings for the endpoint.
        @[JSON::Field(key: "ForceEndpointErrorConfiguration")]
        getter force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration?

        # An HTTP live streaming (HLS) manifest configuration.
        @[JSON::Field(key: "HlsManifests")]
        getter hls_manifests : Array(Types::CreateHlsManifestConfiguration)?

        # A low-latency HLS manifest configuration.
        @[JSON::Field(key: "LowLatencyHlsManifests")]
        getter low_latency_hls_manifests : Array(Types::CreateLowLatencyHlsManifestConfiguration)?

        # A list of Microsoft Smooth Streaming (MSS) manifest configurations to update for the origin
        # endpoint. This replaces the existing MSS manifest configurations.
        @[JSON::Field(key: "MssManifests")]
        getter mss_manifests : Array(Types::CreateMssManifestConfiguration)?

        # The segment configuration, including the segment name, duration, and other configuration values.
        @[JSON::Field(key: "Segment")]
        getter segment : Types::Segment?

        # The size of the window (in seconds) to create a window of the live stream that's available for
        # on-demand viewing. Viewers can start-over or catch-up on content that falls within the window. The
        # maximum startover window is 1,209,600 seconds (14 days).
        @[JSON::Field(key: "StartoverWindowSeconds")]
        getter startover_window_seconds : Int32?

        def initialize(
          @channel_group_name : String,
          @channel_name : String,
          @container_type : String,
          @origin_endpoint_name : String,
          @dash_manifests : Array(Types::CreateDashManifestConfiguration)? = nil,
          @description : String? = nil,
          @e_tag : String? = nil,
          @force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration? = nil,
          @hls_manifests : Array(Types::CreateHlsManifestConfiguration)? = nil,
          @low_latency_hls_manifests : Array(Types::CreateLowLatencyHlsManifestConfiguration)? = nil,
          @mss_manifests : Array(Types::CreateMssManifestConfiguration)? = nil,
          @segment : Types::Segment? = nil,
          @startover_window_seconds : Int32? = nil
        )
        end
      end

      struct UpdateOriginEndpointResponse
        include JSON::Serializable

        # The ARN associated with the resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name that describes the channel group. The name is the primary identifier for the channel group,
        # and must be unique for your account in the AWS Region.
        @[JSON::Field(key: "ChannelGroupName")]
        getter channel_group_name : String

        # The name that describes the channel. The name is the primary identifier for the channel, and must be
        # unique for your account in the AWS Region and channel group.
        @[JSON::Field(key: "ChannelName")]
        getter channel_name : String

        # The type of container attached to this origin endpoint.
        @[JSON::Field(key: "ContainerType")]
        getter container_type : String

        # The date and time the origin endpoint was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The date and time the origin endpoint was modified.
        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The name that describes the origin endpoint. The name is the primary identifier for the origin
        # endpoint, and and must be unique for your account in the AWS Region and channel.
        @[JSON::Field(key: "OriginEndpointName")]
        getter origin_endpoint_name : String

        # The segment configuration, including the segment name, duration, and other configuration values.
        @[JSON::Field(key: "Segment")]
        getter segment : Types::Segment

        # A DASH manifest configuration.
        @[JSON::Field(key: "DashManifests")]
        getter dash_manifests : Array(Types::GetDashManifestConfiguration)?

        # The description of the origin endpoint.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The current Entity Tag (ETag) associated with this resource. The entity tag can be used to safely
        # make concurrent updates to the resource.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # The failover settings for the endpoint.
        @[JSON::Field(key: "ForceEndpointErrorConfiguration")]
        getter force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration?

        # An HTTP live streaming (HLS) manifest configuration.
        @[JSON::Field(key: "HlsManifests")]
        getter hls_manifests : Array(Types::GetHlsManifestConfiguration)?

        # A low-latency HLS manifest configuration.
        @[JSON::Field(key: "LowLatencyHlsManifests")]
        getter low_latency_hls_manifests : Array(Types::GetLowLatencyHlsManifestConfiguration)?

        # The updated Microsoft Smooth Streaming (MSS) manifest configurations for this origin endpoint.
        @[JSON::Field(key: "MssManifests")]
        getter mss_manifests : Array(Types::GetMssManifestConfiguration)?

        # The size of the window (in seconds) to create a window of the live stream that's available for
        # on-demand viewing. Viewers can start-over or catch-up on content that falls within the window.
        @[JSON::Field(key: "StartoverWindowSeconds")]
        getter startover_window_seconds : Int32?

        # The comma-separated list of tag key:value pairs assigned to the origin endpoint.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @channel_group_name : String,
          @channel_name : String,
          @container_type : String,
          @created_at : Time,
          @modified_at : Time,
          @origin_endpoint_name : String,
          @segment : Types::Segment,
          @dash_manifests : Array(Types::GetDashManifestConfiguration)? = nil,
          @description : String? = nil,
          @e_tag : String? = nil,
          @force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration? = nil,
          @hls_manifests : Array(Types::GetHlsManifestConfiguration)? = nil,
          @low_latency_hls_manifests : Array(Types::GetLowLatencyHlsManifestConfiguration)? = nil,
          @mss_manifests : Array(Types::GetMssManifestConfiguration)? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The input failed to meet the constraints specified by the AWS service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The type of ValidationException.
        @[JSON::Field(key: "ValidationExceptionType")]
        getter validation_exception_type : String?

        def initialize(
          @message : String? = nil,
          @validation_exception_type : String? = nil
        )
        end
      end
    end
  end
end
