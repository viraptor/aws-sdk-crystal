require "json"

module Aws
  module MediaPackageVod
    module Types

      # A MediaPackage VOD Asset resource.

      struct Asset
        include JSON::Serializable

        # The ARN of the Asset.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time the Asset was initially submitted for Ingest.

        @[JSON::Field(key: "createdAt")]
        getter created_at : String?

        # The list of egress endpoints available for the Asset.

        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::EgressEndpoint)?

        # The unique identifier for the Asset.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ID of the PackagingGroup for the Asset.

        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String?

        # The resource ID to include in SPEKE key requests.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # ARN of the source object in S3.

        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String?

        # The IAM role_arn used to access the source S3 bucket.

        @[JSON::Field(key: "sourceRoleArn")]
        getter source_role_arn : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @egress_endpoints : Array(Types::EgressEndpoint)? = nil,
          @id : String? = nil,
          @packaging_group_id : String? = nil,
          @resource_id : String? = nil,
          @source_arn : String? = nil,
          @source_role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Parameters used to create a MediaPackage VOD Asset.

      struct AssetCreateParameters
        include JSON::Serializable

        # The unique identifier for the Asset.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the PackagingGroup for the Asset.

        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String

        # ARN of the source object in S3.

        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String

        # The IAM role ARN used to access the source S3 bucket.

        @[JSON::Field(key: "sourceRoleArn")]
        getter source_role_arn : String

        # The resource ID to include in SPEKE key requests.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @packaging_group_id : String,
          @source_arn : String,
          @source_role_arn : String,
          @resource_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A collection of MediaPackage VOD Asset resources.

      struct AssetList
        include JSON::Serializable

        # A list of MediaPackage VOD Asset resources.

        @[JSON::Field(key: "assets")]
        getter assets : Array(Types::AssetShallow)?

        # A token that can be used to resume pagination from the end of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assets : Array(Types::AssetShallow)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A MediaPackage VOD Asset resource.

      struct AssetShallow
        include JSON::Serializable

        # The ARN of the Asset.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time the Asset was initially submitted for Ingest.

        @[JSON::Field(key: "createdAt")]
        getter created_at : String?

        # The unique identifier for the Asset.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ID of the PackagingGroup for the Asset.

        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String?

        # The resource ID to include in SPEKE key requests.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # ARN of the source object in S3.

        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String?

        # The IAM role ARN used to access the source S3 bucket.

        @[JSON::Field(key: "sourceRoleArn")]
        getter source_role_arn : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @id : String? = nil,
          @packaging_group_id : String? = nil,
          @resource_id : String? = nil,
          @source_arn : String? = nil,
          @source_role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # CDN Authorization credentials

      struct Authorization
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the secret in AWS Secrets Manager that is used for CDN
        # authorization.

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

      # A CMAF encryption configuration.

      struct CmafEncryption
        include JSON::Serializable


        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider

        # An optional 128-bit, 16-byte hex value represented by a 32-character string, used in conjunction
        # with the key for encrypting blocks. If you don't specify a value, then MediaPackage creates the
        # constant initialization vector (IV).

        @[JSON::Field(key: "constantInitializationVector")]
        getter constant_initialization_vector : String?

        def initialize(
          @speke_key_provider : Types::SpekeKeyProvider,
          @constant_initialization_vector : String? = nil
        )
        end
      end

      # A CMAF packaging configuration.

      struct CmafPackage
        include JSON::Serializable

        # A list of HLS manifest configurations.

        @[JSON::Field(key: "hlsManifests")]
        getter hls_manifests : Array(Types::HlsManifest)


        @[JSON::Field(key: "encryption")]
        getter encryption : Types::CmafEncryption?

        # When includeEncoderConfigurationInSegments is set to true, MediaPackage places your encoder's
        # Sequence Parameter Set (SPS), Picture Parameter Set (PPS), and Video Parameter Set (VPS) metadata in
        # every video segment instead of in the init fragment. This lets you use different SPS/PPS/VPS
        # settings for your assets during content playback.

        @[JSON::Field(key: "includeEncoderConfigurationInSegments")]
        getter include_encoder_configuration_in_segments : Bool?

        # Duration (in seconds) of each fragment. Actual fragments will be rounded to the nearest multiple of
        # the source fragment duration.

        @[JSON::Field(key: "segmentDurationSeconds")]
        getter segment_duration_seconds : Int32?

        def initialize(
          @hls_manifests : Array(Types::HlsManifest),
          @encryption : Types::CmafEncryption? = nil,
          @include_encoder_configuration_in_segments : Bool? = nil,
          @segment_duration_seconds : Int32? = nil
        )
        end
      end

      # The configuration parameters for egress access logging.

      struct ConfigureLogsParameters
        include JSON::Serializable


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?

        def initialize(
          @egress_access_logs : Types::EgressAccessLogs? = nil
        )
        end
      end


      struct ConfigureLogsRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?

        def initialize(
          @id : String,
          @egress_access_logs : Types::EgressAccessLogs? = nil
        )
        end
      end


      struct ConfigureLogsResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "domainName")]
        getter domain_name : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @authorization : Types::Authorization? = nil,
          @created_at : String? = nil,
          @domain_name : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAssetRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String


        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String


        @[JSON::Field(key: "sourceRoleArn")]
        getter source_role_arn : String


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @packaging_group_id : String,
          @source_arn : String,
          @source_role_arn : String,
          @resource_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAssetResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::EgressEndpoint)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String?


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?


        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String?


        @[JSON::Field(key: "sourceRoleArn")]
        getter source_role_arn : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @egress_endpoints : Array(Types::EgressEndpoint)? = nil,
          @id : String? = nil,
          @packaging_group_id : String? = nil,
          @resource_id : String? = nil,
          @source_arn : String? = nil,
          @source_role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePackagingConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackage?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @packaging_group_id : String,
          @cmaf_package : Types::CmafPackage? = nil,
          @dash_package : Types::DashPackage? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @mss_package : Types::MssPackage? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePackagingConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackage?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?


        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cmaf_package : Types::CmafPackage? = nil,
          @created_at : String? = nil,
          @dash_package : Types::DashPackage? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @id : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @packaging_group_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePackagingGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @authorization : Types::Authorization? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePackagingGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "domainName")]
        getter domain_name : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @authorization : Types::Authorization? = nil,
          @created_at : String? = nil,
          @domain_name : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.

      struct DashEncryption
        include JSON::Serializable


        @[JSON::Field(key: "spekeKeyProvider")]
        getter speke_key_provider : Types::SpekeKeyProvider

        def initialize(
          @speke_key_provider : Types::SpekeKeyProvider
        )
        end
      end

      # A DASH manifest configuration.

      struct DashManifest
        include JSON::Serializable

        # Determines the position of some tags in the Media Presentation Description (MPD). When set to FULL,
        # elements like SegmentTemplate and ContentProtection are included in each Representation. When set to
        # COMPACT, duplicate elements are combined and presented at the AdaptationSet level.

        @[JSON::Field(key: "manifestLayout")]
        getter manifest_layout : String?

        # An optional string to include in the name of the manifest.

        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?

        # Minimum duration (in seconds) that a player will buffer media before starting the presentation.

        @[JSON::Field(key: "minBufferTimeSeconds")]
        getter min_buffer_time_seconds : Int32?

        # The Dynamic Adaptive Streaming over HTTP (DASH) profile type. When set to "HBBTV_1_5", HbbTV 1.5
        # compliant output is enabled.

        @[JSON::Field(key: "profile")]
        getter profile : String?

        # The source of scte markers used. When set to SEGMENTS, the scte markers are sourced from the
        # segments of the ingested content. When set to MANIFEST, the scte markers are sourced from the
        # manifest of the ingested content.

        @[JSON::Field(key: "scteMarkersSource")]
        getter scte_markers_source : String?


        @[JSON::Field(key: "streamSelection")]
        getter stream_selection : Types::StreamSelection?

        def initialize(
          @manifest_layout : String? = nil,
          @manifest_name : String? = nil,
          @min_buffer_time_seconds : Int32? = nil,
          @profile : String? = nil,
          @scte_markers_source : String? = nil,
          @stream_selection : Types::StreamSelection? = nil
        )
        end
      end

      # A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.

      struct DashPackage
        include JSON::Serializable

        # A list of DASH manifest configurations.

        @[JSON::Field(key: "dashManifests")]
        getter dash_manifests : Array(Types::DashManifest)


        @[JSON::Field(key: "encryption")]
        getter encryption : Types::DashEncryption?

        # When includeEncoderConfigurationInSegments is set to true, MediaPackage places your encoder's
        # Sequence Parameter Set (SPS), Picture Parameter Set (PPS), and Video Parameter Set (VPS) metadata in
        # every video segment instead of in the init fragment. This lets you use different SPS/PPS/VPS
        # settings for your assets during content playback.

        @[JSON::Field(key: "includeEncoderConfigurationInSegments")]
        getter include_encoder_configuration_in_segments : Bool?

        # When enabled, an I-Frame only stream will be included in the output.

        @[JSON::Field(key: "includeIframeOnlyStream")]
        getter include_iframe_only_stream : Bool?

        # A list of triggers that controls when the outgoing Dynamic Adaptive Streaming over HTTP (DASH) Media
        # Presentation Description (MPD) will be partitioned into multiple periods. If empty, the content will
        # not be partitioned into more than one period. If the list contains "ADS", new periods will be
        # created where the Asset contains SCTE-35 ad markers.

        @[JSON::Field(key: "periodTriggers")]
        getter period_triggers : Array(String)?

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

        def initialize(
          @dash_manifests : Array(Types::DashManifest),
          @encryption : Types::DashEncryption? = nil,
          @include_encoder_configuration_in_segments : Bool? = nil,
          @include_iframe_only_stream : Bool? = nil,
          @period_triggers : Array(String)? = nil,
          @segment_duration_seconds : Int32? = nil,
          @segment_template_format : String? = nil
        )
        end
      end


      struct DeleteAssetRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteAssetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePackagingConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeletePackagingConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePackagingGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeletePackagingGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAssetRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeAssetResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "egressEndpoints")]
        getter egress_endpoints : Array(Types::EgressEndpoint)?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String?


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?


        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String?


        @[JSON::Field(key: "sourceRoleArn")]
        getter source_role_arn : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_at : String? = nil,
          @egress_endpoints : Array(Types::EgressEndpoint)? = nil,
          @id : String? = nil,
          @packaging_group_id : String? = nil,
          @resource_id : String? = nil,
          @source_arn : String? = nil,
          @source_role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribePackagingConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribePackagingConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackage?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?


        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cmaf_package : Types::CmafPackage? = nil,
          @created_at : String? = nil,
          @dash_package : Types::DashPackage? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @id : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @packaging_group_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribePackagingGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribePackagingGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "approximateAssetCount")]
        getter approximate_asset_count : Int32?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "domainName")]
        getter domain_name : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @approximate_asset_count : Int32? = nil,
          @arn : String? = nil,
          @authorization : Types::Authorization? = nil,
          @created_at : String? = nil,
          @domain_name : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil
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

      # The endpoint URL used to access an Asset using one PackagingConfiguration.

      struct EgressEndpoint
        include JSON::Serializable

        # The ID of the PackagingConfiguration being applied to the Asset.

        @[JSON::Field(key: "packagingConfigurationId")]
        getter packaging_configuration_id : String?

        # The current processing status of the asset used for the packaging configuration. The status can be
        # either QUEUED, PROCESSING, PLAYABLE, or FAILED. Status information won't be available for most
        # assets ingested before 2021-09-30.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The URL of the parent manifest for the repackaged Asset.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @packaging_configuration_id : String? = nil,
          @status : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Use encryptionContractConfiguration to configure one or more content encryption keys for your
      # endpoints that use SPEKE 2.0. The encryption contract defines which content keys are used to encrypt
      # the audio and video tracks in your stream. To configure the encryption contract, specify which audio
      # and video encryption presets to use. Note the following considerations when using
      # encryptionContractConfiguration: encryptionContractConfiguration can be used for DASH endpoints that
      # use SPEKE 2.0. SPEKE 2.0 relies on the CPIX 2.3 specification. You must disable key rotation for
      # this endpoint by setting keyRotationIntervalSeconds to 0.

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

        def initialize(
          @speke_key_provider : Types::SpekeKeyProvider,
          @constant_initialization_vector : String? = nil,
          @encryption_method : String? = nil
        )
        end
      end

      # An HTTP Live Streaming (HLS) manifest configuration.

      struct HlsManifest
        include JSON::Serializable

        # This setting controls how ad markers are included in the packaged OriginEndpoint. "NONE" will omit
        # all SCTE-35 ad markers from the output. "PASSTHROUGH" causes the manifest to contain a copy of the
        # SCTE-35 ad markers (comments) taken directly from the input HTTP Live Streaming (HLS) manifest.
        # "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35 messages in the input
        # source.

        @[JSON::Field(key: "adMarkers")]
        getter ad_markers : String?

        # When enabled, an I-Frame only stream will be included in the output.

        @[JSON::Field(key: "includeIframeOnlyStream")]
        getter include_iframe_only_stream : Bool?

        # An optional string to include in the name of the manifest.

        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?

        # The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag inserted into manifests.
        # Additionally, when an interval is specified ID3Timed Metadata messages will be generated every 5
        # seconds using the ingest time of the content. If the interval is not specified, or set to 0, then no
        # EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and no ID3Timed Metadata messages will
        # be generated. Note that irrespective of this parameter, if any ID3 Timed Metadata is found in HTTP
        # Live Streaming (HLS) input, it will be passed through to HLS output.

        @[JSON::Field(key: "programDateTimeIntervalSeconds")]
        getter program_date_time_interval_seconds : Int32?

        # When enabled, the EXT-X-KEY tag will be repeated in output manifests.

        @[JSON::Field(key: "repeatExtXKey")]
        getter repeat_ext_x_key : Bool?


        @[JSON::Field(key: "streamSelection")]
        getter stream_selection : Types::StreamSelection?

        def initialize(
          @ad_markers : String? = nil,
          @include_iframe_only_stream : Bool? = nil,
          @manifest_name : String? = nil,
          @program_date_time_interval_seconds : Int32? = nil,
          @repeat_ext_x_key : Bool? = nil,
          @stream_selection : Types::StreamSelection? = nil
        )
        end
      end

      # An HTTP Live Streaming (HLS) packaging configuration.

      struct HlsPackage
        include JSON::Serializable

        # A list of HLS manifest configurations.

        @[JSON::Field(key: "hlsManifests")]
        getter hls_manifests : Array(Types::HlsManifest)


        @[JSON::Field(key: "encryption")]
        getter encryption : Types::HlsEncryption?

        # When enabled, MediaPackage passes through digital video broadcasting (DVB) subtitles into the
        # output.

        @[JSON::Field(key: "includeDvbSubtitles")]
        getter include_dvb_subtitles : Bool?

        # Duration (in seconds) of each fragment. Actual fragments will be rounded to the nearest multiple of
        # the source fragment duration.

        @[JSON::Field(key: "segmentDurationSeconds")]
        getter segment_duration_seconds : Int32?

        # When enabled, audio streams will be placed in rendition groups in the output.

        @[JSON::Field(key: "useAudioRenditionGroup")]
        getter use_audio_rendition_group : Bool?

        def initialize(
          @hls_manifests : Array(Types::HlsManifest),
          @encryption : Types::HlsEncryption? = nil,
          @include_dvb_subtitles : Bool? = nil,
          @segment_duration_seconds : Int32? = nil,
          @use_audio_rendition_group : Bool? = nil
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


      struct ListAssetsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @packaging_group_id : String? = nil
        )
        end
      end


      struct ListAssetsResponse
        include JSON::Serializable


        @[JSON::Field(key: "assets")]
        getter assets : Array(Types::AssetShallow)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assets : Array(Types::AssetShallow)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPackagingConfigurationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @packaging_group_id : String? = nil
        )
        end
      end


      struct ListPackagingConfigurationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "packagingConfigurations")]
        getter packaging_configurations : Array(Types::PackagingConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @packaging_configurations : Array(Types::PackagingConfiguration)? = nil
        )
        end
      end


      struct ListPackagingGroupsRequest
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


      struct ListPackagingGroupsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "packagingGroups")]
        getter packaging_groups : Array(Types::PackagingGroup)?

        def initialize(
          @next_token : String? = nil,
          @packaging_groups : Array(Types::PackagingGroup)? = nil
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

      # A Microsoft Smooth Streaming (MSS) manifest configuration.

      struct MssManifest
        include JSON::Serializable

        # An optional string to include in the name of the manifest.

        @[JSON::Field(key: "manifestName")]
        getter manifest_name : String?


        @[JSON::Field(key: "streamSelection")]
        getter stream_selection : Types::StreamSelection?

        def initialize(
          @manifest_name : String? = nil,
          @stream_selection : Types::StreamSelection? = nil
        )
        end
      end

      # A Microsoft Smooth Streaming (MSS) PackagingConfiguration.

      struct MssPackage
        include JSON::Serializable

        # A list of MSS manifest configurations.

        @[JSON::Field(key: "mssManifests")]
        getter mss_manifests : Array(Types::MssManifest)


        @[JSON::Field(key: "encryption")]
        getter encryption : Types::MssEncryption?

        # The duration (in seconds) of each segment.

        @[JSON::Field(key: "segmentDurationSeconds")]
        getter segment_duration_seconds : Int32?

        def initialize(
          @mss_manifests : Array(Types::MssManifest),
          @encryption : Types::MssEncryption? = nil,
          @segment_duration_seconds : Int32? = nil
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

      # A MediaPackage VOD PackagingConfiguration resource.

      struct PackagingConfiguration
        include JSON::Serializable

        # The ARN of the PackagingConfiguration.

        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackage?

        # The time the PackagingConfiguration was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?

        # The ID of the PackagingConfiguration.

        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?

        # The ID of a PackagingGroup.

        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @cmaf_package : Types::CmafPackage? = nil,
          @created_at : String? = nil,
          @dash_package : Types::DashPackage? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @id : String? = nil,
          @mss_package : Types::MssPackage? = nil,
          @packaging_group_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Parameters used to create a new MediaPackage VOD PackagingConfiguration resource.

      struct PackagingConfigurationCreateParameters
        include JSON::Serializable

        # The ID of the PackagingConfiguration.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of a PackagingGroup.

        @[JSON::Field(key: "packagingGroupId")]
        getter packaging_group_id : String


        @[JSON::Field(key: "cmafPackage")]
        getter cmaf_package : Types::CmafPackage?


        @[JSON::Field(key: "dashPackage")]
        getter dash_package : Types::DashPackage?


        @[JSON::Field(key: "hlsPackage")]
        getter hls_package : Types::HlsPackage?


        @[JSON::Field(key: "mssPackage")]
        getter mss_package : Types::MssPackage?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @packaging_group_id : String,
          @cmaf_package : Types::CmafPackage? = nil,
          @dash_package : Types::DashPackage? = nil,
          @hls_package : Types::HlsPackage? = nil,
          @mss_package : Types::MssPackage? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A collection of MediaPackage VOD PackagingConfiguration resources.

      struct PackagingConfigurationList
        include JSON::Serializable

        # A token that can be used to resume pagination from the end of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of MediaPackage VOD PackagingConfiguration resources.

        @[JSON::Field(key: "packagingConfigurations")]
        getter packaging_configurations : Array(Types::PackagingConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @packaging_configurations : Array(Types::PackagingConfiguration)? = nil
        )
        end
      end

      # A MediaPackage VOD PackagingGroup resource.

      struct PackagingGroup
        include JSON::Serializable

        # The approximate asset count of the PackagingGroup.

        @[JSON::Field(key: "approximateAssetCount")]
        getter approximate_asset_count : Int32?

        # The ARN of the PackagingGroup.

        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?

        # The time the PackagingGroup was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : String?

        # The fully qualified domain name for Assets in the PackagingGroup.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?

        # The ID of the PackagingGroup.

        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @approximate_asset_count : Int32? = nil,
          @arn : String? = nil,
          @authorization : Types::Authorization? = nil,
          @created_at : String? = nil,
          @domain_name : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Parameters used to create a new MediaPackage VOD PackagingGroup resource.

      struct PackagingGroupCreateParameters
        include JSON::Serializable

        # The ID of the PackagingGroup.

        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @authorization : Types::Authorization? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A collection of MediaPackage VOD PackagingGroup resources.

      struct PackagingGroupList
        include JSON::Serializable

        # A token that can be used to resume pagination from the end of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of MediaPackage VOD PackagingGroup resources.

        @[JSON::Field(key: "packagingGroups")]
        getter packaging_groups : Array(Types::PackagingGroup)?

        def initialize(
          @next_token : String? = nil,
          @packaging_groups : Array(Types::PackagingGroup)? = nil
        )
        end
      end

      # Parameters used to update a MediaPackage packaging group.

      struct PackagingGroupUpdateParameters
        include JSON::Serializable


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?

        def initialize(
          @authorization : Types::Authorization? = nil
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


        @[JSON::Field(key: "encryptionContractConfiguration")]
        getter encryption_contract_configuration : Types::EncryptionContractConfiguration?

        def initialize(
          @role_arn : String,
          @system_ids : Array(String),
          @url : String,
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

        # A collection of tags associated with a resource

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


      struct UpdatePackagingGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?

        def initialize(
          @id : String,
          @authorization : Types::Authorization? = nil
        )
        end
      end


      struct UpdatePackagingGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "approximateAssetCount")]
        getter approximate_asset_count : Int32?


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "createdAt")]
        getter created_at : String?


        @[JSON::Field(key: "domainName")]
        getter domain_name : String?


        @[JSON::Field(key: "egressAccessLogs")]
        getter egress_access_logs : Types::EgressAccessLogs?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @approximate_asset_count : Int32? = nil,
          @arn : String? = nil,
          @authorization : Types::Authorization? = nil,
          @created_at : String? = nil,
          @domain_name : String? = nil,
          @egress_access_logs : Types::EgressAccessLogs? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end
    end
  end
end
