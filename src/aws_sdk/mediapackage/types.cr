require "json"

module AwsSdk
  module MediaPackage
    module Types

      # CDN Authorization credentials

      struct Authorization
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the secret in Secrets Manager that your Content Distribution
        # Network (CDN) uses for authorization to access your endpoint.

        @[JSON::Field(key: "cdnIdentifierSecret")]
        getter cdn_identifier_secret : String

        # The Amazon Resource Name (ARN) for the IAM role that allows MediaPackage to communicate with AWS
        # Secrets Manager.

        @[JSON::Field(key: "secretsRoleArn")]
        getter secrets_role_arn : String

        def initialize(
          @cdn_identifier_secret : String,
          @secrets_role_arn : String
        )
        end
      end

      # A Channel resource configuration.

      struct Channel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) assigned to the Channel.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time the Channel was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : String?

        # A short text description of the Channel.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "hlsIngest")]
        getter hls_ingest : Types::HlsIngest?

        # The ID of the Channel.

        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ingressAccessLogs")]
        getter ingress_access_logs : Types::IngressAccessLogs?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @description : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @hls_ingest : Types::HlsIngest? = nil,
          @id : String? = nil,
          @ingress_access_logs : Types::IngressAccessLogs? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration parameters for a new Channel.

      struct ChannelCreateParameters
        include JSON::Serializable

        # The ID of the Channel. The ID must be unique within the region and it cannot be changed after a
        # Channel is created.

        @[JSON::Field(key: "id")]
        getter id : String

        # A short text description of the Channel.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A collection of Channel records.

      struct ChannelList
        include JSON::Serializable

        # A list of Channel records.

        @[JSON::Field(key: "channels")]
        getter channels : Array(Types::Channel)?

        # A token that can be used to resume pagination from the end of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::Channel)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Configuration parameters for updating an existing Channel.

      struct ChannelUpdateParameters
        include JSON::Serializable

        # A short text description of the Channel.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end

      # A Common Media Application Format (CMAF) encryption configuration.

      struct CmafEncryption
        include JSON::Serializable


        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider

        # An optional 128-bit, 16-byte hex value represented by a 32-character string, used in conjunction
        # with the key for encrypting blocks. If you don't specify a value, then MediaPackage creates the
        # constant initialization vector (IV).

        @[JSON::Field(key: "constantInitializationVector")]
        getter constant_initialization_vector : String?


        @[JSON::Field(key: "encryptionMethod")]
        getter encryption_method : String?

        # Time (in seconds) between each encryption key rotation.

        @[JSON::Field(key: "keyRotationIntervalSeconds")]
        getter key_rotation_interval_seconds : Int32?

        def initialize(
          @speke_key_provider : Types::SpekeKeyProvider,
          @constant_initialization_vector : String? = nil,
          @encryption_method : String? = nil,
          @key_rotation_interval_seconds : Int32? = nil
        )
        end
      end

      # A Common Media Application Format (CMAF) packaging configuration.

      struct CmafPackage
        include JSON::Serializable


        @[JSON::Field(key: "encryption")]
        getter encryption : Types::CmafEncryption?

        # A list of HLS manifest configurations

        @[JSON::Field(key: "hlsManifests")]
        getter hls_manifests : Array(Types::HlsManifest)?

        # Duration (in seconds) of each segment. Actual segments will be rounded to the nearest multiple of
        # the source segment duration.

        @[JSON::Field(key: "segmentDurationSeconds")]
        getter segment_duration_seconds : Int32?

        # An optional custom string that is prepended to the name of each segment. If not specified, it
        # defaults to the ChannelId.

        @[JSON::Field(key: "segmentPrefix")]
        getter segment_prefix : String?


        @[JSON::Field(key: "streamSelection")]
        getter stream_selection : Types::StreamSelection?

        def initialize(
          @encryption : Types::CmafEncryption? = nil,
          @hls_manifests : Array(Types::HlsManifest)? = nil,
          @segment_duration_seconds : Int32? = nil,
          @segment_prefix : String? = nil,
          @stream_selection : Types::StreamSelection? = nil
        )
        end
      end

      # A Common Media Application Format (CMAF) packaging configuration.

      struct CmafPackageCreateOrUpdateParameters
        include JSON::Serializable


        @[JSON::Field(key: "encryption")]
        getter encryption : Types::CmafEncryption?

        # A list of HLS manifest configurations

        @[JSON::Field(key: "hlsManifests")]
        getter hls_manifests : Array(Types::HlsManifestCreateOrUpdateParameters)?

        # Duration (in seconds) of each segment. Actual segments will be rounded to the nearest multiple of
        # the source segment duration.

        @[JSON::Field(key: "segmentDurationSeconds")]
        getter segment_duration_seconds : Int32?

        # An optional custom string that is prepended to the name of each segment. If not specified, it
        # defaults to the ChannelId.

        @[JSON::Field(key: "segmentPrefix")]
        getter segment_prefix : String?


        @[JSON::Field(key: "streamSelection")]
        getter stream_selection : Types::StreamSelection?

        def initialize(
          @encryption : Types::CmafEncryption? = nil,
          @hls_manifests : Array(Types::HlsManifestCreateOrUpdateParameters)? = nil,
          @segment_duration_seconds : Int32? = nil,
          @segment_prefix : String? = nil,
          @stream_selection : Types::StreamSelection? = nil
        )
        end
      end

      # The configuration parameters for ingress and egress access logging.

      struct ConfigureLogsParameters
        include JSON::Serializable


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "ingressAccessLogs")]
        getter ingress_access_logs : Types::IngressAccessLogs?

        def initialize(
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @ingress_access_logs : Types::IngressAccessLogs? = nil
        )
        end
      end


      struct ConfigureLogsRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "ingressAccessLogs")]
        getter ingress_access_logs : Types::IngressAccessLogs?

        def initialize(
          @id : String,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @ingress_access_logs : Types::IngressAccessLogs? = nil
        )
        end
      end


      struct ConfigureLogsResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "hlsIngest")]
        getter hls_ingest : Types::HlsIngest?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ingressAccessLogs")]
        getter ingress_access_logs : Types::IngressAccessLogs?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @description : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @hls_ingest : Types::HlsIngest? = nil,
          @id : String? = nil,
          @ingress_access_logs : Types::IngressAccessLogs? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "hlsIngest")]
        getter hls_ingest : Types::HlsIngest?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ingressAccessLogs")]
        getter ingress_access_logs : Types::IngressAccessLogs?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @description : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @hls_ingest : Types::HlsIngest? = nil,
          @id : String? = nil,
          @ingress_access_logs : Types::IngressAccessLogs? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateHarvestJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "endTime")]
        getter end_time : String


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "originEndpointId")]
        getter origin_endpoint_id : String


        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination


        @[JSON::Field(key: "startTime")]
        getter start_time : String

        def initialize(
          @end_time : String,
          @id : String,
          @origin_endpoint_id : String,
          @s3_destination : Types::S3Destination,
          @start_time : String
        )
        end
      end


      struct CreateHarvestJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "endTime")]
        getter end_time : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "originEndpointId")]
        getter origin_endpoint_id : String?


        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?


        @[JSON::Field(key: "startTime")]
        getter start_time : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @channel_id : String? = nil,
          @created_at : String? = nil,
          @end_time : String? = nil,
          @id : String? = nil,
          @origin_endpoint_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil,
          @start_time : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct CreateOriginEndpointRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackageCreateOrUpdateParameters?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?


        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?


        @[JSON::Field(key: "origination")]
        getter origination : String?


        @[JSON::Field(key: "startoverWindowSeconds")]
        getter startover_window_seconds : Int32?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "timeDelaySeconds")]
        getter time_delay_seconds : Int32?


        @[JSON::Field(key: "whitelist")]
        getter whitelist : Array(String)?

        def initialize(
          @channel_id : String,
          @id : String,
          @authorization : Types::Authorization? = nil,
          @cmaf_package : Types::CmafPackageCreateOrUpdateParameters? = nil,
          @dash_package : Types::DashPackage? = nil,
          @description : String? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @manifest_name : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @origination : String? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @time_delay_seconds : Int32? = nil,
          @whitelist : Array(String)? = nil
        )
        end
      end


      struct CreateOriginEndpointResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackage?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?


        @[JSON::Field(key: "origination")]
        getter origination : String?


        @[JSON::Field(key: "startoverWindowSeconds")]
        getter startover_window_seconds : Int32?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "timeDelaySeconds")]
        getter time_delay_seconds : Int32?


        @[JSON::Field(key: "url")]
        getter url : String?


        @[JSON::Field(key: "whitelist")]
        getter whitelist : Array(String)?

        def initialize(
          @arn : String? = nil,
          @authorization : Types::Authorization? = nil,
          @channel_id : String? = nil,
          @cmaf_package : Types::CmafPackage? = nil,
          @created_at : String? = nil,
          @dash_package : Types::DashPackage? = nil,
          @description : String? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @id : String? = nil,
          @manifest_name : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @origination : String? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @time_delay_seconds : Int32? = nil,
          @url : String? = nil,
          @whitelist : Array(String)? = nil
        )
        end
      end

      # A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.

      struct DashEncryption
        include JSON::Serializable


        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider

        # Time (in seconds) between each encryption key rotation.

        @[JSON::Field(key: "keyRotationIntervalSeconds")]
        getter key_rotation_interval_seconds : Int32?

        def initialize(
          @speke_key_provider : Types::SpekeKeyProvider,
          @key_rotation_interval_seconds : Int32? = nil
        )
        end
      end

      # A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.

      struct DashPackage
        include JSON::Serializable


        @[JSON::Field(key: "adTriggers")]
        getter ad_triggers : Array(String)?


        @[JSON::Field(key: "adsOnDeliveryRestrictions")]
        getter ads_on_delivery_restrictions : String?


        @[JSON::Field(key: "encryption")]
        getter encryption : Types::DashEncryption?

        # When enabled, an I-Frame only stream will be included in the output.

        @[JSON::Field(key: "includeIframeOnlyStream")]
        getter include_iframe_only_stream : Bool?

        # Determines the position of some tags in the Media Presentation Description (MPD). When set to FULL,
        # elements like SegmentTemplate and ContentProtection are included in each Representation. When set to
        # COMPACT, duplicate elements are combined and presented at the AdaptationSet level. When set to
        # DRM_TOP_LEVEL_COMPACT, content protection elements are placed the MPD level and referenced at the
        # AdaptationSet level.

        @[JSON::Field(key: "manifestLayout")]
        getter manifest_layout : String?

        # Time window (in seconds) contained in each manifest.

        @[JSON::Field(key: "manifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        # Minimum duration (in seconds) that a player will buffer media before starting the presentation.

        @[JSON::Field(key: "minBufferTimeSeconds")]
        getter min_buffer_time_seconds : Int32?

        # Minimum duration (in seconds) between potential changes to the Dynamic Adaptive Streaming over HTTP
        # (DASH) Media Presentation Description (MPD).

        @[JSON::Field(key: "minUpdatePeriodSeconds")]
        getter min_update_period_seconds : Int32?

        # A list of triggers that controls when the outgoing Dynamic Adaptive Streaming over HTTP (DASH) Media
        # Presentation Description (MPD) will be partitioned into multiple periods. If empty, the content will
        # not be partitioned into more than one period. If the list contains "ADS", new periods will be
        # created where the Channel source contains SCTE-35 ad markers.

        @[JSON::Field(key: "periodTriggers")]
        getter period_triggers : Array(String)?

        # The Dynamic Adaptive Streaming over HTTP (DASH) profile type. When set to "HBBTV_1_5", HbbTV 1.5
        # compliant output is enabled. When set to "DVB-DASH_2014", DVB-DASH 2014 compliant output is enabled.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        # Duration (in seconds) of each segment. Actual segments will be rounded to the nearest multiple of
        # the source segment duration.

        @[JSON::Field(key: "segmentDurationSeconds")]
        getter segment_duration_seconds : Int32?

        # Determines the type of SegmentTemplate included in the Media Presentation Description (MPD). When
        # set to NUMBER_WITH_TIMELINE, a full timeline is presented in each SegmentTemplate, with $Number$
        # media URLs. When set to TIME_WITH_TIMELINE, a full timeline is presented in each SegmentTemplate,
        # with $Time$ media URLs. When set to NUMBER_WITH_DURATION, only a duration is included in each
        # SegmentTemplate, with $Number$ media URLs.

        @[JSON::Field(key: "segmentTemplateFormat")]
        getter segment_template_format : String?


        @[JSON::Field(key: "streamSelection")]
        getter stream_selection : Types::StreamSelection?

        # Duration (in seconds) to delay live content before presentation.

        @[JSON::Field(key: "suggestedPresentationDelaySeconds")]
        getter suggested_presentation_delay_seconds : Int32?

        # Determines the type of UTCTiming included in the Media Presentation Description (MPD)

        @[JSON::Field(key: "utcTiming")]
        getter utc_timing : String?

        # Specifies the value attribute of the UTCTiming field when utcTiming is set to HTTP-ISO, HTTP-HEAD or
        # HTTP-XSDATE

        @[JSON::Field(key: "utcTimingUri")]
        getter utc_timing_uri : String?

        def initialize(
          @ad_triggers : Array(String)? = nil,
          @ads_on_delivery_restrictions : String? = nil,
          @encryption : Types::DashEncryption? = nil,
          @include_iframe_only_stream : Bool? = nil,
          @manifest_layout : String? = nil,
          @manifest_window_seconds : Int32? = nil,
          @min_buffer_time_seconds : Int32? = nil,
          @min_update_period_seconds : Int32? = nil,
          @period_triggers : Array(String)? = nil,
          @profile : String? = nil,
          @segment_duration_seconds : Int32? = nil,
          @segment_template_format : String? = nil,
          @stream_selection : Types::StreamSelection? = nil,
          @suggested_presentation_delay_seconds : Int32? = nil,
          @utc_timing : String? = nil,
          @utc_timing_uri : String? = nil
        )
        end
      end


      struct DeleteChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteChannelResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteOriginEndpointRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteOriginEndpointResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeChannelRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "hlsIngest")]
        getter hls_ingest : Types::HlsIngest?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ingressAccessLogs")]
        getter ingress_access_logs : Types::IngressAccessLogs?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @description : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @hls_ingest : Types::HlsIngest? = nil,
          @id : String? = nil,
          @ingress_access_logs : Types::IngressAccessLogs? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeHarvestJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeHarvestJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "endTime")]
        getter end_time : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "originEndpointId")]
        getter origin_endpoint_id : String?


        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?


        @[JSON::Field(key: "startTime")]
        getter start_time : String?


        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @channel_id : String? = nil,
          @created_at : String? = nil,
          @end_time : String? = nil,
          @id : String? = nil,
          @origin_endpoint_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil,
          @start_time : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DescribeOriginEndpointRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeOriginEndpointResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackage?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?


        @[JSON::Field(key: "origination")]
        getter origination : String?


        @[JSON::Field(key: "startoverWindowSeconds")]
        getter startover_window_seconds : Int32?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "timeDelaySeconds")]
        getter time_delay_seconds : Int32?


        @[JSON::Field(key: "url")]
        getter url : String?


        @[JSON::Field(key: "whitelist")]
        getter whitelist : Array(String)?

        def initialize(
          @arn : String? = nil,
          @authorization : Types::Authorization? = nil,
          @channel_id : String? = nil,
          @cmaf_package : Types::CmafPackage? = nil,
          @created_at : String? = nil,
          @dash_package : Types::DashPackage? = nil,
          @description : String? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @id : String? = nil,
          @manifest_name : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @origination : String? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @time_delay_seconds : Int32? = nil,
          @url : String? = nil,
          @whitelist : Array(String)? = nil
        )
        end
      end

      # Configure egress access logging.

      struct EgressAccessLogs
        include JSON::Serializable

        # Customize the log group name.

        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        def initialize(
          @log_group_name : String? = nil
        )
        end
      end

      # Use encryptionContractConfiguration to configure one or more content encryption keys for your
      # endpoints that use SPEKE 2.0. The encryption contract defines which content keys are used to encrypt
      # the audio and video tracks in your stream. To configure the encryption contract, specify which audio
      # and video encryption presets to use. Note the following considerations when using
      # encryptionContractConfiguration: encryptionContractConfiguration can be used for DASH or CMAF
      # endpoints that use SPEKE 2.0. SPEKE 2.0 relies on the CPIX 2.3 specification. You must disable key
      # rotation for this endpoint by setting keyRotationIntervalSeconds to 0.

      struct EncryptionContractConfiguration
        include JSON::Serializable

        # A collection of audio encryption presets.

        @[JSON::Field(key: "presetSpeke20Audio")]
        getter preset_speke20_audio : String

        # A collection of video encryption presets.

        @[JSON::Field(key: "presetSpeke20Video")]
        getter preset_speke20_video : String

        def initialize(
          @preset_speke20_audio : String,
          @preset_speke20_video : String
        )
        end
      end


      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A HarvestJob resource configuration

      struct HarvestJob
        include JSON::Serializable

        # The Amazon Resource Name (ARN) assigned to the HarvestJob.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the Channel that the HarvestJob will harvest from.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String?

        # The date and time the HarvestJob was submitted.

        @[JSON::Field(key: "createdAt")]
        getter created_at : String?

        # The end of the time-window which will be harvested.

        @[JSON::Field(key: "endTime")]
        getter end_time : String?

        # The ID of the HarvestJob. The ID must be unique within the region and it cannot be changed after the
        # HarvestJob is submitted.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ID of the OriginEndpoint that the HarvestJob will harvest from. This cannot be changed after the
        # HarvestJob is submitted.

        @[JSON::Field(key: "originEndpointId")]
        getter origin_endpoint_id : String?


        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        # The start of the time-window which will be harvested.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # The current status of the HarvestJob. Consider setting up a CloudWatch Event to listen for
        # HarvestJobs as they succeed or fail. In the event of failure, the CloudWatch Event will include an
        # explanation of why the HarvestJob failed.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @channel_id : String? = nil,
          @created_at : String? = nil,
          @end_time : String? = nil,
          @id : String? = nil,
          @origin_endpoint_id : String? = nil,
          @s3_destination : Types::S3Destination? = nil,
          @start_time : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Configuration parameters for a new HarvestJob

      struct HarvestJobCreateParameters
        include JSON::Serializable

        # The end of the time-window which will be harvested

        @[JSON::Field(key: "endTime")]
        getter end_time : String

        # The ID of the HarvestJob. The ID must be unique within the region and it cannot be changed after the
        # HarvestJob is submitted

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the OriginEndpoint that the HarvestJob will harvest from. This cannot be changed after the
        # HarvestJob is submitted.

        @[JSON::Field(key: "originEndpointId")]
        getter origin_endpoint_id : String


        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination

        # The start of the time-window which will be harvested

        @[JSON::Field(key: "startTime")]
        getter start_time : String

        def initialize(
          @end_time : String,
          @id : String,
          @origin_endpoint_id : String,
          @s3_destination : Types::S3Destination,
          @start_time : String
        )
        end
      end

      # A collection of HarvestJob records.

      struct HarvestJobList
        include JSON::Serializable

        # A list of HarvestJob records.

        @[JSON::Field(key: "harvestJobs")]
        getter harvest_jobs : Array(Types::HarvestJob)?

        # A token that can be used to resume pagination from the end of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @harvest_jobs : Array(Types::HarvestJob)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # An HTTP Live Streaming (HLS) encryption configuration.

      struct HlsEncryption
        include JSON::Serializable


        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider

        # A constant initialization vector for encryption (optional). When not specified the initialization
        # vector will be periodically rotated.

        @[JSON::Field(key: "constantInitializationVector")]
        getter constant_initialization_vector : String?

        # The encryption method to use.

        @[JSON::Field(key: "encryptionMethod")]
        getter encryption_method : String?

        # Interval (in seconds) between each encryption key rotation.

        @[JSON::Field(key: "keyRotationIntervalSeconds")]
        getter key_rotation_interval_seconds : Int32?

        # When enabled, the EXT-X-KEY tag will be repeated in output manifests.

        @[JSON::Field(key: "repeatExtXKey")]
        getter repeat_ext_x_key : Bool?

        def initialize(
          @speke_key_provider : Types::SpekeKeyProvider,
          @constant_initialization_vector : String? = nil,
          @encryption_method : String? = nil,
          @key_rotation_interval_seconds : Int32? = nil,
          @repeat_ext_x_key : Bool? = nil
        )
        end
      end

      # An HTTP Live Streaming (HLS) ingest resource configuration.

      struct HlsIngest
        include JSON::Serializable

        # A list of endpoints to which the source stream should be sent.

        @[JSON::Field(key: "ingestEndpoints")]
        getter ingest_endpoints : Array(Types::IngestEndpoint)?

        def initialize(
          @ingest_endpoints : Array(Types::IngestEndpoint)? = nil
        )
        end
      end

      # A HTTP Live Streaming (HLS) manifest configuration.

      struct HlsManifest
        include JSON::Serializable

        # The ID of the manifest. The ID must be unique within the OriginEndpoint and it cannot be changed
        # after it is created.

        @[JSON::Field(key: "id")]
        getter id : String

        # This setting controls how ad markers are included in the packaged OriginEndpoint. "NONE" will omit
        # all SCTE-35 ad markers from the output. "PASSTHROUGH" causes the manifest to contain a copy of the
        # SCTE-35 ad markers (comments) taken directly from the input HTTP Live Streaming (HLS) manifest.
        # "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35 messages in the input
        # source. "DATERANGE" inserts EXT-X-DATERANGE tags to signal ad and program transition events in HLS
        # and CMAF manifests. For this option, you must set a programDateTimeIntervalSeconds value that is
        # greater than 0.

        @[JSON::Field(key: "adMarkers")]
        getter ad_markers : String?

        # When enabled, an I-Frame only stream will be included in the output.

        @[JSON::Field(key: "includeIframeOnlyStream")]
        getter include_iframe_only_stream : Bool?

        # An optional short string appended to the end of the OriginEndpoint URL. If not specified, defaults
        # to the manifestName for the OriginEndpoint.

        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?

        # The HTTP Live Streaming (HLS) playlist type. When either "EVENT" or "VOD" is specified, a
        # corresponding EXT-X-PLAYLIST-TYPE entry will be included in the media playlist.

        @[JSON::Field(key: "playlistType")]
        getter playlist_type : String?

        # Time window (in seconds) contained in each parent manifest.

        @[JSON::Field(key: "playlistWindowSeconds")]
        getter playlist_window_seconds : Int32?

        # The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag inserted into manifests.
        # Additionally, when an interval is specified ID3Timed Metadata messages will be generated every 5
        # seconds using the ingest time of the content. If the interval is not specified, or set to 0, then no
        # EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and no ID3Timed Metadata messages will
        # be generated. Note that irrespective of this parameter, if any ID3 Timed Metadata is found in HTTP
        # Live Streaming (HLS) input, it will be passed through to HLS output.

        @[JSON::Field(key: "programDateTimeIntervalSeconds")]
        getter program_date_time_interval_seconds : Int32?

        # The URL of the packaged OriginEndpoint for consumption.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @id : String,
          @ad_markers : String? = nil,
          @include_iframe_only_stream : Bool? = nil,
          @manifest_name : String? = nil,
          @playlist_type : String? = nil,
          @playlist_window_seconds : Int32? = nil,
          @program_date_time_interval_seconds : Int32? = nil,
          @url : String? = nil
        )
        end
      end

      # A HTTP Live Streaming (HLS) manifest configuration.

      struct HlsManifestCreateOrUpdateParameters
        include JSON::Serializable

        # The ID of the manifest. The ID must be unique within the OriginEndpoint and it cannot be changed
        # after it is created.

        @[JSON::Field(key: "id")]
        getter id : String

        # This setting controls how ad markers are included in the packaged OriginEndpoint. "NONE" will omit
        # all SCTE-35 ad markers from the output. "PASSTHROUGH" causes the manifest to contain a copy of the
        # SCTE-35 ad markers (comments) taken directly from the input HTTP Live Streaming (HLS) manifest.
        # "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35 messages in the input
        # source. "DATERANGE" inserts EXT-X-DATERANGE tags to signal ad and program transition events in HLS
        # and CMAF manifests. For this option, you must set a programDateTimeIntervalSeconds value that is
        # greater than 0.

        @[JSON::Field(key: "adMarkers")]
        getter ad_markers : String?


        @[JSON::Field(key: "adTriggers")]
        getter ad_triggers : Array(String)?


        @[JSON::Field(key: "adsOnDeliveryRestrictions")]
        getter ads_on_delivery_restrictions : String?

        # When enabled, an I-Frame only stream will be included in the output.

        @[JSON::Field(key: "includeIframeOnlyStream")]
        getter include_iframe_only_stream : Bool?

        # An optional short string appended to the end of the OriginEndpoint URL. If not specified, defaults
        # to the manifestName for the OriginEndpoint.

        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?

        # The HTTP Live Streaming (HLS) playlist type. When either "EVENT" or "VOD" is specified, a
        # corresponding EXT-X-PLAYLIST-TYPE entry will be included in the media playlist.

        @[JSON::Field(key: "playlistType")]
        getter playlist_type : String?

        # Time window (in seconds) contained in each parent manifest.

        @[JSON::Field(key: "playlistWindowSeconds")]
        getter playlist_window_seconds : Int32?

        # The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag inserted into manifests.
        # Additionally, when an interval is specified ID3Timed Metadata messages will be generated every 5
        # seconds using the ingest time of the content. If the interval is not specified, or set to 0, then no
        # EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and no ID3Timed Metadata messages will
        # be generated. Note that irrespective of this parameter, if any ID3 Timed Metadata is found in HTTP
        # Live Streaming (HLS) input, it will be passed through to HLS output.

        @[JSON::Field(key: "programDateTimeIntervalSeconds")]
        getter program_date_time_interval_seconds : Int32?

        def initialize(
          @id : String,
          @ad_markers : String? = nil,
          @ad_triggers : Array(String)? = nil,
          @ads_on_delivery_restrictions : String? = nil,
          @include_iframe_only_stream : Bool? = nil,
          @manifest_name : String? = nil,
          @playlist_type : String? = nil,
          @playlist_window_seconds : Int32? = nil,
          @program_date_time_interval_seconds : Int32? = nil
        )
        end
      end

      # An HTTP Live Streaming (HLS) packaging configuration.

      struct HlsPackage
        include JSON::Serializable

        # This setting controls how ad markers are included in the packaged OriginEndpoint. "NONE" will omit
        # all SCTE-35 ad markers from the output. "PASSTHROUGH" causes the manifest to contain a copy of the
        # SCTE-35 ad markers (comments) taken directly from the input HTTP Live Streaming (HLS) manifest.
        # "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35 messages in the input
        # source. "DATERANGE" inserts EXT-X-DATERANGE tags to signal ad and program transition events in HLS
        # and CMAF manifests. For this option, you must set a programDateTimeIntervalSeconds value that is
        # greater than 0.

        @[JSON::Field(key: "adMarkers")]
        getter ad_markers : String?


        @[JSON::Field(key: "adTriggers")]
        getter ad_triggers : Array(String)?


        @[JSON::Field(key: "adsOnDeliveryRestrictions")]
        getter ads_on_delivery_restrictions : String?


        @[JSON::Field(key: "encryption")]
        getter encryption : Types::HlsEncryption?

        # When enabled, MediaPackage passes through digital video broadcasting (DVB) subtitles into the
        # output.

        @[JSON::Field(key: "includeDvbSubtitles")]
        getter include_dvb_subtitles : Bool?

        # When enabled, an I-Frame only stream will be included in the output.

        @[JSON::Field(key: "includeIframeOnlyStream")]
        getter include_iframe_only_stream : Bool?

        # The HTTP Live Streaming (HLS) playlist type. When either "EVENT" or "VOD" is specified, a
        # corresponding EXT-X-PLAYLIST-TYPE entry will be included in the media playlist.

        @[JSON::Field(key: "playlistType")]
        getter playlist_type : String?

        # Time window (in seconds) contained in each parent manifest.

        @[JSON::Field(key: "playlistWindowSeconds")]
        getter playlist_window_seconds : Int32?

        # The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag inserted into manifests.
        # Additionally, when an interval is specified ID3Timed Metadata messages will be generated every 5
        # seconds using the ingest time of the content. If the interval is not specified, or set to 0, then no
        # EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and no ID3Timed Metadata messages will
        # be generated. Note that irrespective of this parameter, if any ID3 Timed Metadata is found in HTTP
        # Live Streaming (HLS) input, it will be passed through to HLS output.

        @[JSON::Field(key: "programDateTimeIntervalSeconds")]
        getter program_date_time_interval_seconds : Int32?

        # Duration (in seconds) of each fragment. Actual fragments will be rounded to the nearest multiple of
        # the source fragment duration.

        @[JSON::Field(key: "segmentDurationSeconds")]
        getter segment_duration_seconds : Int32?


        @[JSON::Field(key: "streamSelection")]
        getter stream_selection : Types::StreamSelection?

        # When enabled, audio streams will be placed in rendition groups in the output.

        @[JSON::Field(key: "useAudioRenditionGroup")]
        getter use_audio_rendition_group : Bool?

        def initialize(
          @ad_markers : String? = nil,
          @ad_triggers : Array(String)? = nil,
          @ads_on_delivery_restrictions : String? = nil,
          @encryption : Types::HlsEncryption? = nil,
          @include_dvb_subtitles : Bool? = nil,
          @include_iframe_only_stream : Bool? = nil,
          @playlist_type : String? = nil,
          @playlist_window_seconds : Int32? = nil,
          @program_date_time_interval_seconds : Int32? = nil,
          @segment_duration_seconds : Int32? = nil,
          @stream_selection : Types::StreamSelection? = nil,
          @use_audio_rendition_group : Bool? = nil
        )
        end
      end

      # An endpoint for ingesting source content for a Channel.

      struct IngestEndpoint
        include JSON::Serializable

        # The system generated unique identifier for the IngestEndpoint

        @[JSON::Field(key: "id")]
        getter id : String?

        # The system generated password for ingest authentication.

        @[JSON::Field(key: "password")]
        getter password : String?

        # The ingest URL to which the source stream should be sent.

        @[JSON::Field(key: "url")]
        getter url : String?

        # The system generated username for ingest authentication.

        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @id : String? = nil,
          @password : String? = nil,
          @url : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Configure ingress access logging.

      struct IngressAccessLogs
        include JSON::Serializable

        # Customize the log group name.

        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        def initialize(
          @log_group_name : String? = nil
        )
        end
      end


      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListChannelsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


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


        @[JSON::Field(key: "channels")]
        getter channels : Array(Types::Channel)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channels : Array(Types::Channel)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListHarvestJobsRequest
        include JSON::Serializable


        @[JSON::Field(key: "includeChannelId")]
        getter include_channel_id : String?


        @[JSON::Field(key: "includeStatus")]
        getter include_status : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @include_channel_id : String? = nil,
          @include_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListHarvestJobsResponse
        include JSON::Serializable


        @[JSON::Field(key: "harvestJobs")]
        getter harvest_jobs : Array(Types::HarvestJob)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @harvest_jobs : Array(Types::HarvestJob)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOriginEndpointsRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @channel_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOriginEndpointsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "originEndpoints")]
        getter origin_endpoints : Array(Types::OriginEndpoint)?

        def initialize(
          @next_token : String? = nil,
          @origin_endpoints : Array(Types::OriginEndpoint)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A Microsoft Smooth Streaming (MSS) encryption configuration.

      struct MssEncryption
        include JSON::Serializable


        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider

        def initialize(
          @speke_key_provider : Types::SpekeKeyProvider
        )
        end
      end

      # A Microsoft Smooth Streaming (MSS) packaging configuration.

      struct MssPackage
        include JSON::Serializable


        @[JSON::Field(key: "encryption")]
        getter encryption : Types::MssEncryption?

        # The time window (in seconds) contained in each manifest.

        @[JSON::Field(key: "manifestWindowSeconds")]
        getter manifest_window_seconds : Int32?

        # The duration (in seconds) of each segment.

        @[JSON::Field(key: "segmentDurationSeconds")]
        getter segment_duration_seconds : Int32?


        @[JSON::Field(key: "streamSelection")]
        getter stream_selection : Types::StreamSelection?

        def initialize(
          @encryption : Types::MssEncryption? = nil,
          @manifest_window_seconds : Int32? = nil,
          @segment_duration_seconds : Int32? = nil,
          @stream_selection : Types::StreamSelection? = nil
        )
        end
      end


      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An OriginEndpoint resource configuration.

      struct OriginEndpoint
        include JSON::Serializable

        # The Amazon Resource Name (ARN) assigned to the OriginEndpoint.

        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?

        # The ID of the Channel the OriginEndpoint is associated with.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackage?

        # The date and time the OriginEndpoint was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?

        # A short text description of the OriginEndpoint.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?

        # The ID of the OriginEndpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A short string appended to the end of the OriginEndpoint URL.

        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?

        # Control whether origination of video is allowed for this OriginEndpoint. If set to ALLOW, the
        # OriginEndpoint may by requested, pursuant to any other form of access control. If set to DENY, the
        # OriginEndpoint may not be requested. This can be helpful for Live to VOD harvesting, or for
        # temporarily disabling origination

        @[JSON::Field(key: "origination")]
        getter origination : String?

        # Maximum duration (seconds) of content to retain for startover playback. If not specified, startover
        # playback will be disabled for the OriginEndpoint.

        @[JSON::Field(key: "startoverWindowSeconds")]
        getter startover_window_seconds : Int32?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Amount of delay (seconds) to enforce on the playback of live content. If not specified, there will
        # be no time delay in effect for the OriginEndpoint.

        @[JSON::Field(key: "timeDelaySeconds")]
        getter time_delay_seconds : Int32?

        # The URL of the packaged OriginEndpoint for consumption.

        @[JSON::Field(key: "url")]
        getter url : String?

        # A list of source IP CIDR blocks that will be allowed to access the OriginEndpoint.

        @[JSON::Field(key: "whitelist")]
        getter whitelist : Array(String)?

        def initialize(
          @arn : String? = nil,
          @authorization : Types::Authorization? = nil,
          @channel_id : String? = nil,
          @cmaf_package : Types::CmafPackage? = nil,
          @created_at : String? = nil,
          @dash_package : Types::DashPackage? = nil,
          @description : String? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @id : String? = nil,
          @manifest_name : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @origination : String? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @time_delay_seconds : Int32? = nil,
          @url : String? = nil,
          @whitelist : Array(String)? = nil
        )
        end
      end

      # Configuration parameters for a new OriginEndpoint.

      struct OriginEndpointCreateParameters
        include JSON::Serializable

        # The ID of the Channel that the OriginEndpoint will be associated with. This cannot be changed after
        # the OriginEndpoint is created.

        @[JSON::Field(key: "channelId")]
        getter channel_id : String

        # The ID of the OriginEndpoint. The ID must be unique within the region and it cannot be changed after
        # the OriginEndpoint is created.

        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackageCreateOrUpdateParameters?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?

        # A short text description of the OriginEndpoint.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?

        # A short string that will be used as the filename of the OriginEndpoint URL (defaults to "index").

        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?

        # Control whether origination of video is allowed for this OriginEndpoint. If set to ALLOW, the
        # OriginEndpoint may by requested, pursuant to any other form of access control. If set to DENY, the
        # OriginEndpoint may not be requested. This can be helpful for Live to VOD harvesting, or for
        # temporarily disabling origination

        @[JSON::Field(key: "origination")]
        getter origination : String?

        # Maximum duration (seconds) of content to retain for startover playback. If not specified, startover
        # playback will be disabled for the OriginEndpoint.

        @[JSON::Field(key: "startoverWindowSeconds")]
        getter startover_window_seconds : Int32?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Amount of delay (seconds) to enforce on the playback of live content. If not specified, there will
        # be no time delay in effect for the OriginEndpoint.

        @[JSON::Field(key: "timeDelaySeconds")]
        getter time_delay_seconds : Int32?

        # A list of source IP CIDR blocks that will be allowed to access the OriginEndpoint.

        @[JSON::Field(key: "whitelist")]
        getter whitelist : Array(String)?

        def initialize(
          @channel_id : String,
          @id : String,
          @authorization : Types::Authorization? = nil,
          @cmaf_package : Types::CmafPackageCreateOrUpdateParameters? = nil,
          @dash_package : Types::DashPackage? = nil,
          @description : String? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @manifest_name : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @origination : String? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @time_delay_seconds : Int32? = nil,
          @whitelist : Array(String)? = nil
        )
        end
      end

      # A collection of OriginEndpoint records.

      struct OriginEndpointList
        include JSON::Serializable

        # A token that can be used to resume pagination from the end of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of OriginEndpoint records.

        @[JSON::Field(key: "originEndpoints")]
        getter origin_endpoints : Array(Types::OriginEndpoint)?

        def initialize(
          @next_token : String? = nil,
          @origin_endpoints : Array(Types::OriginEndpoint)? = nil
        )
        end
      end

      # Configuration parameters for updating an existing OriginEndpoint.

      struct OriginEndpointUpdateParameters
        include JSON::Serializable


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackageCreateOrUpdateParameters?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?

        # A short text description of the OriginEndpoint.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?

        # A short string that will be appended to the end of the Endpoint URL.

        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?

        # Control whether origination of video is allowed for this OriginEndpoint. If set to ALLOW, the
        # OriginEndpoint may by requested, pursuant to any other form of access control. If set to DENY, the
        # OriginEndpoint may not be requested. This can be helpful for Live to VOD harvesting, or for
        # temporarily disabling origination

        @[JSON::Field(key: "origination")]
        getter origination : String?

        # Maximum duration (in seconds) of content to retain for startover playback. If not specified,
        # startover playback will be disabled for the OriginEndpoint.

        @[JSON::Field(key: "startoverWindowSeconds")]
        getter startover_window_seconds : Int32?

        # Amount of delay (in seconds) to enforce on the playback of live content. If not specified, there
        # will be no time delay in effect for the OriginEndpoint.

        @[JSON::Field(key: "timeDelaySeconds")]
        getter time_delay_seconds : Int32?

        # A list of source IP CIDR blocks that will be allowed to access the OriginEndpoint.

        @[JSON::Field(key: "whitelist")]
        getter whitelist : Array(String)?

        def initialize(
          @authorization : Types::Authorization? = nil,
          @cmaf_package : Types::CmafPackageCreateOrUpdateParameters? = nil,
          @dash_package : Types::DashPackage? = nil,
          @description : String? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @manifest_name : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @origination : String? = nil,
          @startover_window_seconds : Int32? = nil,
          @time_delay_seconds : Int32? = nil,
          @whitelist : Array(String)? = nil
        )
        end
      end


      struct RotateChannelCredentialsRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct RotateChannelCredentialsResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "hlsIngest")]
        getter hls_ingest : Types::HlsIngest?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ingressAccessLogs")]
        getter ingress_access_logs : Types::IngressAccessLogs?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @description : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @hls_ingest : Types::HlsIngest? = nil,
          @id : String? = nil,
          @ingress_access_logs : Types::IngressAccessLogs? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RotateIngestEndpointCredentialsRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "ingest_endpoint_id")]
        getter ingest_endpoint_id : String

        def initialize(
          @id : String,
          @ingest_endpoint_id : String
        )
        end
      end


      struct RotateIngestEndpointCredentialsResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "hlsIngest")]
        getter hls_ingest : Types::HlsIngest?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ingressAccessLogs")]
        getter ingress_access_logs : Types::IngressAccessLogs?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @description : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @hls_ingest : Types::HlsIngest? = nil,
          @id : String? = nil,
          @ingress_access_logs : Types::IngressAccessLogs? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration parameters for where in an S3 bucket to place the harvested content

      struct S3Destination
        include JSON::Serializable

        # The name of an S3 bucket within which harvested content will be exported

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The key in the specified S3 bucket where the harvested top-level manifest will be placed.

        @[JSON::Field(key: "manifestKey")]
        getter manifest_key : String

        # The IAM role used to write to the specified S3 bucket

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @bucket_name : String,
          @manifest_key : String,
          @role_arn : String
        )
        end
      end


      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service
      # that will provide encryption keys.

      struct SpekeKeyProvider
        include JSON::Serializable

        # The resource ID to include in key requests.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # An Amazon Resource Name (ARN) of an IAM role that AWS Elemental MediaPackage will assume when
        # accessing the key provider service.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The system IDs to include in key requests.

        @[JSON::Field(key: "systemIds")]
        getter system_ids : Array(String)

        # The URL of the external key provider service.

        @[JSON::Field(key: "url")]
        getter url : String

        # An Amazon Resource Name (ARN) of a Certificate Manager certificate that MediaPackage will use for
        # enforcing secure end-to-end data transfer with the key provider service.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?


        @[JSON::Field(key: "encryptionContractConfiguration")]
        getter encryption_contract_configuration : Types::EncryptionContractConfiguration?

        def initialize(
          @resource_id : String,
          @role_arn : String,
          @system_ids : Array(String),
          @url : String,
          @certificate_arn : String? = nil,
          @encryption_contract_configuration : Types::EncryptionContractConfiguration? = nil
        )
        end
      end

      # A StreamSelection configuration.

      struct StreamSelection
        include JSON::Serializable

        # The maximum video bitrate (bps) to include in output.

        @[JSON::Field(key: "maxVideoBitsPerSecond")]
        getter max_video_bits_per_second : Int32?

        # The minimum video bitrate (bps) to include in output.

        @[JSON::Field(key: "minVideoBitsPerSecond")]
        getter min_video_bits_per_second : Int32?

        # A directive that determines the order of streams in the output.

        @[JSON::Field(key: "streamOrder")]
        getter stream_order : String?

        def initialize(
          @max_video_bits_per_second : Int32? = nil,
          @min_video_bits_per_second : Int32? = nil,
          @stream_order : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagsModel
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end


      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UnprocessableEntityException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


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


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @id : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateChannelResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "hlsIngest")]
        getter hls_ingest : Types::HlsIngest?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "ingressAccessLogs")]
        getter ingress_access_logs : Types::IngressAccessLogs?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @description : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @hls_ingest : Types::HlsIngest? = nil,
          @id : String? = nil,
          @ingress_access_logs : Types::IngressAccessLogs? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateOriginEndpointRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackageCreateOrUpdateParameters?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?


        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?


        @[JSON::Field(key: "origination")]
        getter origination : String?


        @[JSON::Field(key: "startoverWindowSeconds")]
        getter startover_window_seconds : Int32?


        @[JSON::Field(key: "timeDelaySeconds")]
        getter time_delay_seconds : Int32?


        @[JSON::Field(key: "whitelist")]
        getter whitelist : Array(String)?

        def initialize(
          @id : String,
          @authorization : Types::Authorization? = nil,
          @cmaf_package : Types::CmafPackageCreateOrUpdateParameters? = nil,
          @dash_package : Types::DashPackage? = nil,
          @description : String? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @manifest_name : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @origination : String? = nil,
          @startover_window_seconds : Int32? = nil,
          @time_delay_seconds : Int32? = nil,
          @whitelist : Array(String)? = nil
        )
        end
      end


      struct UpdateOriginEndpointResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "channelId")]
        getter channel_id : String?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackage?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?


        @[JSON::Field(key: "origination")]
        getter origination : String?


        @[JSON::Field(key: "startoverWindowSeconds")]
        getter startover_window_seconds : Int32?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "timeDelaySeconds")]
        getter time_delay_seconds : Int32?


        @[JSON::Field(key: "url")]
        getter url : String?


        @[JSON::Field(key: "whitelist")]
        getter whitelist : Array(String)?

        def initialize(
          @arn : String? = nil,
          @authorization : Types::Authorization? = nil,
          @channel_id : String? = nil,
          @cmaf_package : Types::CmafPackage? = nil,
          @created_at : String? = nil,
          @dash_package : Types::DashPackage? = nil,
          @description : String? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @id : String? = nil,
          @manifest_name : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @origination : String? = nil,
          @startover_window_seconds : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @time_delay_seconds : Int32? = nil,
          @url : String? = nil,
          @whitelist : Array(String)? = nil
        )
        end
      end
    end
  end
end
